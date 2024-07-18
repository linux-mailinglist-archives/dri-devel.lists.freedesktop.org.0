Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17293485F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 08:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F77710E576;
	Thu, 18 Jul 2024 06:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="jeWo+M2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462B010E576
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 06:54:49 +0000 (UTC)
Received: from rly05d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) with ESMTP id 46I6scpR412906;
 Thu, 18 Jul 2024 07:54:38 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) id 46I6sMHv409550;
 Thu, 18 Jul 2024 07:54:22 +0100
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp17011019.outbound.protection.outlook.com [40.93.64.19])
 by rly05d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 46I6sJ87408960
 (TLS bits=256 verify=OK); Thu, 18 Jul 2024 07:54:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2m4/gnKAAZIq7FmmrxTpMxG5qmrqtZZdxqmBbWPMf0g85WIWYOqE+tSm3AkST7LeBXo1aHIhkLiev2wV2yodqXK9i21vTSDuN0NYvdjuf7GlrEMYYY0JmAg3yODrGcJDdR5YIiiFxlbE/12wuQ650LHvXoIUJv2R1n6vvQElhw4mIUWB71m3yVtUnIlYQ5/+FV4DfCX66Zz3St5FmXlRqLNYW3tOHOeeUyy1L6qEUiVkTyQwlJvNuuVEsvx19WY11h+7ulWxb7PwdQ9kDQCBUoutPAFMdA15YqzHhd1TPUJM3Aq9ZpG7ividJ6hL4X3TPQpEIVDMx6xo8M5UWxwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYKTRB+Bu6tizO7AX17b1cnfun3qFzEWkjGCQU1yEt4=;
 b=y7Vi/n9Jte5HZ9ruPhDlLKCRQ8regMDD7dbLSbbP92A3L2M0+VO2PB3xTXsatMuXI9bSLLQjzfKLCnn8qJvTy+tVdb1jkzIl7U3rZ3ONaJzaBvct0qRn4F7B5tY5H6oAb8CDhHSFrD36Go1Sa2ZnbfmUrBy3wIZ4GYc79qQQ6yhieTyEMqaWQgTbNFz64kjxsdHtDoRCxbdxrk8voq59XfZ1/do9lLxiJ7ytVt2iUjNy/EOefaeKZPWkf54qZSCr4cjh1PhyIahCyiDV5ocuv3VrNhiz70z+9HChIfEntBW4bbwKctGmA20lQmXgy1dqFnNJN4dAgYEBPbpijq+B/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYKTRB+Bu6tizO7AX17b1cnfun3qFzEWkjGCQU1yEt4=;
 b=jeWo+M2RUq+cQMecgqqNmqMQkZx8se0mX4NbrWGY72Gwogl0n6olVUPG2EFLRfyAPZMR91G/Tm4J9j/8T6FaOergn/ayVw5h9faeNa++7SPdt2GaaP8Xc+WLHqHppiozUDxdwisbMfyPyyArVF0xN9dEoX+Bw3fWfz1c/znBhcn8W+UQmdxkRJeM2Df/2tT2jPx9Dbk4d1x+NsfTRvquI5rYtlpJMGN/qGYg4ml7CrBylz/cDQCLy5qgm+AJwpEbtopfQQAFyJJ9RPqeH2giL5M5kTcgy0MLl1whuISB/WV++lybkjKUfHHECurvTIP/8RSRFELCI4fF43fT8cQRiA==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PR3PR02MB6089.eurprd02.prod.outlook.com (2603:10a6:102:6a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 06:54:18 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 06:54:17 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOACAFi6SAIAC9PYAgANdG4CAASUGgIAAB5WAgAA2doCAAByogIABM4aA
Date: Thu, 18 Jul 2024 06:54:17 +0000
Message-ID: <19c5be58-f87f-4440-a50e-b55b927dce62@habana.ai>
References: <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
 <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
 <20240717073607.GF5630@unreal>
 <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
 <20240717123337.GI5630@unreal>
In-Reply-To: <20240717123337.GI5630@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PR3PR02MB6089:EE_
x-ms-office365-filtering-correlation-id: 76ebc120-1466-4d64-71cf-08dca6f67196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yk1Hd1RHV1BFbTRXZG9sT0dRMWtwWUdES3NmSWJjakpWYzFZWjhMNG05bW40?=
 =?utf-8?B?cEhVU2ZuZjBTN0FQRE82T2crRkt5SnFHWjBzekV5WW8rcEtwenExQ3dpbFlM?=
 =?utf-8?B?ZmVhcWN4VEMxU2NsTVR6S3pnb1hacGMrMVhtaXFvQlNwTDFtVk54SHNqVlZp?=
 =?utf-8?B?MUMwbUsvdW1kZXYwMWVNMFZxdC9udXhFVVZMWVpRTndtRjhxN3lmS1g3YnJD?=
 =?utf-8?B?RDdnY3U3NHB5MzRCUzMrdWVvZWZNb2tmM014SzhkalhRUGlHbDhTOXY3dldw?=
 =?utf-8?B?cWVzbXJOcThJdWNRZHZkQmpmVjR4TUFld3R3WG91REhuYTZZNldITXJuY3VP?=
 =?utf-8?B?U1VmM0ZrckJPOTQ4eE96MCtyUUx4VWdFM2lxTnpXMG9wQld4YzIvSzU0QUNH?=
 =?utf-8?B?bTlQTnREWk1Lalg0VGgxcWZaT245dUQ5VHFodVpMWm5LYW1CRjVIOHU2aHVi?=
 =?utf-8?B?bi9WS1hUd1UxYW1NeEhwWEFOVmdJMk9UVlNoWFE5eTdSVFloMS93S3NOUmlu?=
 =?utf-8?B?U0czNGF2Y1BRVzQyYytzRWNmQmNqR1ExODhWMzBQb2xud1k0ckFsSVdOQTBq?=
 =?utf-8?B?R20yaUtqNW9KMWJrSEx6L3FzSzB2WEZEZ0tUMm9LdU9lZGovbGVmbzBQWGx6?=
 =?utf-8?B?Z0tsZzc2aDFVWUtvVk9zS0hEWnpzNExuVmVNS1RMZWdTY3VmMVBCZGo1b1pZ?=
 =?utf-8?B?a2oxbXY4V2F6SE5sc25FS3hvU3VGcXVlRmpuNWtOaG82QlFsMVJ5RlFQTDB1?=
 =?utf-8?B?NEJvd1oyTVM3d1h1eGUwaEx5blJncnRxQmtXS0k5b3JxWHlkSHVFTmJsV2Za?=
 =?utf-8?B?SjRzcUF5cm1ld3ZoWENnVkE2cjJlL3ZGL0JJNFNEQk1icG1BTEVuUy9MZ1VO?=
 =?utf-8?B?OEN2N2d6SkxHaldRbFpIRUc0V0VWaFdXNFp4cTFiSVJyWUVFZGRFbXNEQ1Vk?=
 =?utf-8?B?Y3Jqc0thM201RVBaK3l4amRkSTJwd09STDlBRDF4NFpmY2hDZlVIQTVYUCtW?=
 =?utf-8?B?N1M2V3JNcVpiSHJCUXdTRzBRTzJGeTBNRVpxMnY3ODB3Q0I0VFA3dXdlQ1VV?=
 =?utf-8?B?K01YOFNBTGh4dmhtUjRwWXNnRHZyQUt3V3lOTGRaSUZyQWpFOVRnYXMyVzdo?=
 =?utf-8?B?WXp0a2RNT1AycHpCZ21kMVVTYUt2MDRSbjl5ZkRIM1pITkxwYk4vTUZaVkl4?=
 =?utf-8?B?all6QVVPNUFEWUQ2WjdiaFk4VEVJQVBIaml1ZmpOY2hUN2lOcUJZbExvcVp3?=
 =?utf-8?B?Yk5kNU5XQnRSMVZUbGJLaW1QRXV1YWpIdlIzYlpYeGxVZllMODF1aFJOL0Nx?=
 =?utf-8?B?T2FxTEdma2UveURkSkNyYmt4U2VrZ2NQRXY3WTV4U01OaFFBb1BoV1RFc25y?=
 =?utf-8?B?c2tRbVhXR1Zrc2hoVjNHRVpUMFBBbkIvMjZybUpELzZxa2pPR1laY3ROQzNi?=
 =?utf-8?B?Tmpzdmszd1REK25FOWIvOWhkeTBQRnNZZzlkeXJTQ25HTWdIVlp3U0Fjcmhw?=
 =?utf-8?B?RWIrT0ZETmR2VWNUQnQ2bHhqUGU5dWVET0pSRzllYUprcFJpL2NWc2wyVis1?=
 =?utf-8?B?WTdvMStqek1VZUt2SHJUYzBtSVFsV0tMdFR1UjhpSWxudnBSOHpsYUtCT1E1?=
 =?utf-8?B?T1hLdU4zZ3hOMktScVJQSDFqQ0l4Q3huRmhST0ZhSFVzY3N6RVpuQW16ZlhP?=
 =?utf-8?B?c0Y0NGxaTmplcE1FSVNESCtxUExKQ0oxVG1WQW1WbnI2NjlIVE1pdnJQZGJI?=
 =?utf-8?B?eVgybFZ1Wk9yNzlhUng5K2U5dENJVDM2c2FITVRFMjVqNnpxSUlLckZ3aU5K?=
 =?utf-8?B?VWQxek5EL3JKZytncmc0WVJRQ0RTYmlMNnBWYmE2ZThjNi9teGFBZFdXL2FF?=
 =?utf-8?B?dWkrcEU3VUpObHczMjAzanZEeEZ3RHMxcElaeDdRTGdQOUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUZFZnI4Sk10b09DWS9ReXdhbWVpRnBsZE1ERlJna2VDQmpBemNDZDlkM0VB?=
 =?utf-8?B?OHFaQUhVQklwdnNyRFNTQ1JCbGg4V0UwMjVVYXBHYWw2bW9UcHZuQ0NhV2Zv?=
 =?utf-8?B?L0Q2ZnZvL1RCVFNZSk85VzJET0JvUWdzYlNSZzUycGpjSmZJOTJRclkwa3FD?=
 =?utf-8?B?QjZRZEdvMDZ6Mlp4NG1KNUpQSDNMVTMvMmEyZDBjMTJMVEc3WkhjYjdTTzFX?=
 =?utf-8?B?d0xaQjl2anlGc2JJZTIyT0g4dnYxNlVKNkhuZlcra1RjanNqODB6TVYyTWlL?=
 =?utf-8?B?bU5PWnpQMHl3ajJ6ZW82NDh2NTNmR0NJUUVPdkxrVDY0dDhaRmV3a0x2Titi?=
 =?utf-8?B?TmZkQURJVUUra2NiR3FRMnNRYzV3ZUNvckFlSU9ZSzhGYno3anM3V1lGVTVn?=
 =?utf-8?B?R3ZlZmRkL3kwZGh0cERVUnNQSnRGNDdrcEFsTFl0cHYva3N3WGp4eWFLMFY0?=
 =?utf-8?B?M0ZGS2o4LzlkWEtQUVJoNktjdUpJQXZjVVBpaklKY0ltaDJWanBieFJMcUxx?=
 =?utf-8?B?VFY1aWRkNHFmUVBmRzZUVHYxNUNWcWlwTmplbG9hcllWS0JwT2FQNEtZeFp5?=
 =?utf-8?B?K2VJOWszYTJhMVJZeXA1Q21KZGxLYlRZN1IxamFHdE5LUlJ3WnFOaVhZa0RG?=
 =?utf-8?B?WFJiMkNjU0I4NWlCaG85Rm5EaEkvaXhqbUIyeVBPcXdQaERnOE5oZ3FuMnhk?=
 =?utf-8?B?YVI1L3M3ekFaSW9BR0VKL2k1aU9CdjFGWXl3YW8xSVEvZlN5RGpYamk4QmdV?=
 =?utf-8?B?YkdUVEVNOFZDWlhPOTdZekp1UCtuNmZqejlkSjYxajFGcURBc0VoUXoybmRU?=
 =?utf-8?B?eU5CeE4xV2h3eXpuZTQ4RDl1aCtTR0ZrWDN2KzBheUFxdDZLZlJaRFpjQXVR?=
 =?utf-8?B?YnRkOVI2MFVHU2VPUDBnQlYydWg4VThvN1gya2dOQ3M0WXU2Y3JaRk1BWlNu?=
 =?utf-8?B?bklJRlZob0FMMThxSnZDYjRIdm4yVDU1Um55anhzNGlZSlJmUjRFMHc3ZzM4?=
 =?utf-8?B?RFQ1UTg4d1pYYWtZMVphb0h0RWFpclJWbkpqWEJrV3NtV1J0WmU0ZHZHNEd5?=
 =?utf-8?B?MC9OR3hiYnRxMTZiRndTR3RNeWh3azhBODVrVGdjT0ZUbUtRY2R3bjYrZXRM?=
 =?utf-8?B?dGVTM3JQT0llRWt5OVdrdG9xQm93TytETkk3aWdSUUMxR1FoTHdwYSsrV1c2?=
 =?utf-8?B?RHdZNnVaQWRlRmRBR0JYOXE5SWw0S0JXYk1jaXYxU2cvWTBWdm9ZM2Z3WlZN?=
 =?utf-8?B?MWN4ZHV6VFRHWXkxcWZzNER5QTM0WFV3UVhtREc2VFV4aVJ0SEl4UHBIZEVJ?=
 =?utf-8?B?aXM2YzVZVDhlaWpLdjlqYUNCc2NraHVtbTVCakNoWEM1THlnZy9tamI5eUda?=
 =?utf-8?B?VWpCRWxWNXJhT1B1S1NqaXNzR0FjN01oOEtraTE0Q1hzUE5YWVVPUkRXV3gy?=
 =?utf-8?B?aURSdEo5WHp0bmN4M2hLdFlxc3FOZVlXaVlqdDR0MisvblRmRlQ1WmlzUTI3?=
 =?utf-8?B?R2NXLzFoNkxBU2RNaGkwMzFHNEliZ1NudzM4OVRlWllmcGFhczd4ZkhoelZm?=
 =?utf-8?B?SzVWUjRmZ2tLN3dmL214WTJTd3kzTlVXNncxdVU5VEpRa1ovVTRzQ0FRa0FZ?=
 =?utf-8?B?YzRTQWlFelRVS3pJRnc1Zkx1NkJBandUbUFSeXZTUkc1MU0xazFlWHRWdTNa?=
 =?utf-8?B?N01OWnNjZFRGcnZOaUg4TktSeiswQ0t1dHlSVjBmM3NHTkZsckU2Tlh1ZE9l?=
 =?utf-8?B?dmNQTXlGeWRPTTBQR0VRaHhvQkRjODdSeUZ1UElBQU5jckt2K2xEc0Q4dlpm?=
 =?utf-8?B?NnkrTFl3NGVITnl5a01NSThCWkwyVTNzVDVJQ25SR04yQkZZbnVpenpud3FO?=
 =?utf-8?B?cERoTERKMy9yb0dyQUVZS2pna2VzL3hLQm9qMWI5ZmF4cW9TS2hwc3VpUDNB?=
 =?utf-8?B?M1RSZlZzWFFxR0FEd0lMK1o3VVVOb3ZhTkJKdlFnOWdPQ2szL1ByQmdybUpJ?=
 =?utf-8?B?TG9Kc1JOOFdUbFU3NkJrVmcwNW8wL2xhSEcxMG9WQy9Kbi8yaXRrcWlwZjlF?=
 =?utf-8?B?VytTU0VPRFhyVXhBSStic2ZVblRWOEJlUzVaZTdYSEs5aS9IVWFkcDY5SGU5?=
 =?utf-8?Q?5iwgbJ3XCEuqQPaS8vFJtSpLT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F4784D5AC93D040B4CB52EC3D87CE2C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tKLob2y78filqlqylrZIt19RecdpUPDhkln508gJ3nlLew9QjuWoCF7cPqPlb4S9GCBmSWe9QnIwhFyRJiTwWfguOAV333zPZkMS9lB2G0hn24nURCLgHQAa4Io7deDkC3fdg8k/A7kUxUzkW3AnTDGsdc+x94Melx2uf0z/actx7aqA6getuoeo6xU5nwt2bjl+G9XD0Rq92082V7/DGogYVPXm2aUAtmkFoBBU5KXVSvo5InJGvqP6+H6FNmymVD9HYr8mh0uORavMNf0pA/2ZP6C3GompqZzgO/DiCrtcXBVBTGtSzISZEtcXOeTjbBsFvj0y1uJD9ZbTiBbIDO07CyJMlufdoyikzbT7ZgaBbd/8lp6WC/BMGyZ7+11u+yr48D8m3FiMLQCLqs7L1s349RU+TU3cdbwdk4Wf95kaOEgvwhvblOTW7sNHCvCNbdBCz7T3lscR28/Ny32H/n7Q/nOf+ykyXUrcRL1UQzI/BqUnDRhNTnhCxxfr32odYqtpr7zrN3aqW3wEDhz3AmIpXDmy3V41A9FbfWn3nNqZr4hUXmNUP2XSwQlAPNMHYEOpug89Br4jl0DezeKJt06NPOALtf6r9LjPWDSjwufUXEWblXtfJf5JMAqJmbBb
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ebc120-1466-4d64-71cf-08dca6f67196
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 06:54:17.6916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygMbiZWqW62+NFQ1OaXu9l7swh6pqfq/4G359KqVvLnakmhIAv6Gyz4pYWYkbLcQR4T41pz++hexbCUHoK9gdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6089
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMTI4NTY4MTpGUEtleTEucHJpdjq12fbWJvN5diFtGa9gbmWQkbpq7tNky6YuIuuO/PLpoLV1UdmgTiPa09RSJzbgwUyJbYjRBTLPRbxNtrO7SujdCPiD9+v10ZvYWAfVcu3lKANaNxmgzR+TLYnrR+tJdzWb3MM3l8or63T3I6FLQxQx6Pcqx4pEs9VMiQ3q3N4A2cflxs+shVXyLIovbDPrOsS6/qsgGL1982ALFf8eq3Xw7ZTii+deGIrmSn2XSfex3A8RmQ2ydygmUx2rIJG7AVrXT4IKnAA261edvhqtmwo6unYFj7rLjJ8+GWeSirCsrP6EtUs+MNxQccxr6rj1fub1lnV7QbtpnO7lzNecLuJc
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.115
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xNy8yNCAxNTozMywgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAx
NywgMjAyNCBhdCAxMDo1MTowM0FNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA3LzE3LzI0IDEwOjM2LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4gT24gV2VkLCBKdWwg
MTcsIDIwMjQgYXQgMDc6MDg6NTlBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+
PiBPbiA3LzE2LzI0IDE2OjQwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+Pj4+PiBPbiBTdW4s
IEp1bCAxNCwgMjAyNCBhdCAxMDoxODoxMkFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6
DQo+Pj4+Pj4gT24gNy8xMi8yNCAxNjowOCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPj4+Pj4+
PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGpnZ0B6aWVwZS5jYS4gTGVhcm4gd2h5
IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVu
dGlmaWNhdGlvbiBdDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIEZyaSwgSnVuIDI4LCAyMDI0IGF0IDEw
OjI0OjMyQU0gKzAwMDAsIE9tZXIgU2hwaWdlbG1hbiB3cm90ZToNCj4+Pj4+Pj4NCj4+Pj4+Pj4+
IFdlIG5lZWQgdGhlIGNvcmUgZHJpdmVyIHRvIGFjY2VzcyB0aGUgSUIgZHJpdmVyIChhbmQgdG8g
dGhlIEVUSCBkcml2ZXIgYXMNCj4+Pj4+Pj4+IHdlbGwpLiBBcyB5b3Ugd3JvdGUsIHdlIGNhbid0
IHVzZSBleHBvcnRlZCBzeW1ib2xzIGZyb20gb3VyIElCIGRyaXZlciBub3INCj4+Pj4+Pj4+IHJl
bHkgb24gZnVuY3Rpb24gcG9pbnRlcnMsIGJ1dCB3aGF0IGFib3V0IHByb3ZpZGluZyB0aGUgY29y
ZSBkcml2ZXIgYW4gb3BzDQo+Pj4+Pj4+PiBzdHJ1Y3R1cmU/IG1lYW5pbmcgZXhwb3J0aW5nIGEg
cmVnaXN0ZXIgZnVuY3Rpb24gZnJvbSB0aGUgY29yZSBkcml2ZXIgdGhhdA0KPj4+Pj4+Pj4gc2hv
dWxkIGJlIGNhbGxlZCBieSB0aGUgSUIgZHJpdmVyIGR1cmluZyBhdXhpbGlhcnkgZGV2aWNlIHBy
b2JlLg0KPj4+Pj4+Pj4gU29tZXRoaW5nIGxpa2U6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gaW50IGhi
bF9jbl9yZWdpc3Rlcl9pYl9hdXhfZGV2KHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2LA0K
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGJsX2liX29wcyAq
b3BzKQ0KPj4+Pj4+Pj4gew0KPj4+Pj4+Pj4gLi4uDQo+Pj4+Pj4+PiB9DQo+Pj4+Pj4+PiBFWFBP
UlRfU1lNQk9MKGhibF9jbl9yZWdpc3Rlcl9pYl9hdXhfZGV2KTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4g
RGVmaW5hdGVseSBkbyBub3QgZG8gc29tZSBraW5kIG9mIGRvdWJsZS1yZWdpc3RlciBsaWtlIHRo
aXMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZSBhdXhpbGlhcnlfZGV2aWNlIHNjaGVtZSBjYW4gYWxy
ZWFkeSBiZSBleHRlbmRlZCB0byBwcm92aWRlIG9wcyBmb3INCj4+Pj4+Pj4gZWFjaCBzdWIgZGV2
aWNlLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBMaWtlDQo+Pj4+Pj4+DQo+Pj4+Pj4+IHN0cnVjdCBoYWJh
bmFfZHJpdmVyIHsNCj4+Pj4+Pj4gICAgc3RydWN0IGF1eGlsaWFyeV9kcml2ZXIgYmFzZTsNCj4+
Pj4+Pj4gICAgY29uc3Qgc3RydWN0IGhhYmFuYV9vcHMgKm9wczsNCj4+Pj4+Pj4gfTsNCj4+Pj4+
Pj4NCj4+Pj4+Pj4gSWYgdGhlIG9wcyBhcmUganVzdGlmaWVkIG9yIG5vdCBpcyBhIGRpZmZlcmVu
dCBxdWVzdGlvbi4NCj4+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFdlbGwsIEkgc3VnZ2VzdGVkIHRo
aXMgZG91YmxlLXJlZ2lzdGVyIG9wdGlvbiBiZWNhdXNlIEkgZ290IGEgY29tbWVudCB0aGF0DQo+
Pj4+Pj4gdGhlIGRlc2lnbiBwYXR0ZXJuIG9mIGVtYmVkZGVkIG9wcyBzdHJ1Y3R1cmUgc2hvdWxk
bid0IGJlIHVzZWQuDQo+Pj4+Pj4gU28gSSdtIGNvbmZ1c2VkIG5vdy4uLg0KPj4+Pj4NCj4+Pj4+
IFllYWgsIGRvbid0IHN0aWNrIG9wcyBpbiByYW5kb20gcGxhY2VzLCBidXQgdGhlIGRldmljZV9k
cml2ZXIgaXMgdGhlDQo+Pj4+PiByaWdodCBwbGFjZS4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IFNvcnJ5
LCBsZXQgbWUgZXhwbGFpbiBhZ2Fpbi4gTXkgb3JpZ2luYWwgY29kZSBoYXMgYW4gb3BzIHN0cnVj
dHVyZQ0KPj4+PiBleGFjdGx5IGxpa2UgeW91IGFyZSBzdWdnZXN0aW5nIG5vdyAoc2VlIHN0cnVj
dCBoYmxfYXV4X2RldiBpbiB0aGUgZmlyc3QNCj4+Pj4gcGF0Y2ggb2YgdGhlIHNlcmllcykuIEJ1
dCBJIHdhcyBpbnN0cnVjdGVkIG5vdCB0byB1c2UgdGhpcyBvcHMgc3RydWN0dXJlDQo+Pj4+IGFu
ZCB0byByZWx5IG9uIGV4cG9ydGVkIHN5bWJvbHMgZm9yIGludGVyLWRyaXZlciBjb21tdW5pY2F0
aW9uLg0KPj4+PiBJJ2xsIGJlIGhhcHB5IHRvIHVzZSB0aGlzIG9wcyBzdHJ1Y3R1cmUgbGlrZSBp
biB5b3VyIGV4YW1wbGUgcmF0aGVyIHRoYW4NCj4+Pj4gY29udmVydGluZyBteSBjb2RlIHRvIHVz
ZSBleHBvcnRlZCBzeW1ib2xzLg0KPj4+PiBMZW9uIC0gYW0gSSBtaXNzaW5nIGFueXRoaW5nPyB3
aGF0J3MgdGhlIHZlcmRpY3QgaGVyZT8NCj4+Pg0KPj4+IFlvdSBhcmUgbWlzc2luZyB0aGUgbWFp
biBzZW50ZW5jZSBmcm9tIEphc29uJ3MgcmVzcG9uc2U6ICAiZG9uJ3Qgc3RpY2sgb3BzIGluIHJh
bmRvbSBwbGFjZXMiLg0KPj4+DQo+Pj4gSXQgaXMgZmluZSB0byBoYXZlIG9wcyBpbiBkZXZpY2Ug
ZHJpdmVyLCBzbyB0aGUgY29yZSBkcml2ZXIgY2FuIGNhbGwgdGhlbS4gSG93ZXZlciwgaW4geW91
cg0KPj4+IG9yaWdpbmFsIGNvZGUsIHlvdSBhZGRlZCBvcHMgZXZlcnl3aGVyZS4gSXQgY2F1c2Vk
IHRvIHRoZSBuZWVkIHRvIGltcGxlbWVudCBtb2R1bGUgcmVmZXJlbmNlDQo+Pj4gY291bnRpbmcg
YW5kIGNyYXp5IHN0dWZmIGxpa2UgY2FsbHMgdG8gbG9jayBhbmQgdW5sb2NrIGZ1bmN0aW9ucyBm
cm9tIHRoZSBhdXggZHJpdmVyIHRvIHRoZSBjb3JlLg0KPj4+DQo+Pj4gVmVyZGljdCBpcyBzdGls
bCB0aGUgc2FtZS4gQ29yZSBkcml2ZXIgc2hvdWxkIHByb3ZpZGUgRVhQT1JUX1NZTUJPTHMsIHNv
IHRoZSBhdXggZHJpdmVyIGNhbiBjYWxsDQo+Pj4gdGhlbSBkaXJlY3RseSBhbmQgZW5qb3kgZnJv
bSBwcm9wZXIgbW9kdWxlIGxvYWRpbmcgYW5kIHVubG9hZGluZy4NCj4+Pg0KPj4+IFRoZSBhdXgg
ZHJpdmVyIGNhbiBoYXZlIG9wcyBpbiB0aGUgZGV2aWNlIGRyaXZlciwgc28gdGhlIGNvcmUgZHJp
dmVyIGNhbiBjYWxsIHRoZW0gdG8gcGVyZm9ybSBzb21ldGhpbmcNCj4+PiBzcGVjaWZpYyBmb3Ig
dGhhdCBhdXggZHJpdmVyLg0KPj4+DQo+Pj4gQ2FsbHMgYmV0d2VlbiBhdXggZHJpdmVycyBzaG91
bGQgYmUgZG9uZSB2aWEgdGhlIGNvcmUgZHJpdmVyLg0KPj4+DQo+Pj4gVGhhbmtzDQo+Pg0KPj4g
VGhlIG9ubHkgcGxhY2Ugd2UgaGF2ZSBhbiBvcHMgc3RydWN0dXJlIGlzIGluIHRoZSBkZXZpY2Ug
ZHJpdmVyLA0KPj4gc2ltaWxhcmx5IHRvIEphc29uJ3MgZXhhbXBsZS4gSW4gb3VyIGNvZGUgaXQg
aXMgc3RydWN0IGhibF9hdXhfZGV2LiBXaGF0DQo+PiBvdGhlciByYW5kb20gcGxhY2VzIGRpZCB5
b3Ugc2VlPw0KPiANCj4gVGhpcyBpcyBleGFjdGx5IHJhbmRvbSBwbGFjZS4NCj4gDQo+IEkgc3Vn
Z2VzdCB5b3UgdG8gdGFrZSB0aW1lLCBsZWFybiBob3cgZXhpc3RpbmcgZHJpdmVycyBpbiBuZXRk
ZXYgYW5kDQo+IFJETUEgdXNlcyBhdXhidXMgaW5mcmFzdHJ1Y3R1cmUgYW5kIGZvbGxvdyB0aGUg
c2FtZSBwYXR0ZXJuLiBUaGVyZSBhcmUNCj4gbWFueSBleGFtcGxlcyBhbHJlYWR5IGluIHRoZSBr
ZXJuZWwuDQo+IA0KPiBBbmQgbm8sIGlmIHlvdSBkbyBldmVyeXRoaW5nIHJpZ2h0LCB5b3Ugd29u
J3QgbmVlZCBjdXN0b20gbW9kdWxlDQo+IHJlZmVyZW5jZSBjb3VudGluZyBhbmQgb3RoZXIgaGFj
a3MuIFRoZXJlIGlzIG5vdGhpbmcgc3BlY2lhbCBpbiB5b3VyDQo+IGRldmljZS9kcml2ZXIgd2hp
Y2ggcmVxdWlyZXMgc3BlY2lhbCB0cmVhdG1lbnQuDQo+IA0KPiBUaGFua3MNCg0KSG93IGNvbWUg
aXQgaXMgYSByYW5kb20gcGxhY2U/DQpMb29rIGF0IGlyZG1hL2k0MGUgLSB0aGV5IGhhdmUgYW4g
b3BzIHN0cnVjdCAoc3RydWN0IGk0MGVfb3BzKSBlbWJlZGRlZA0KaW4gdGhlaXIgc2hhcmVkIGF1
eCBzdHJ1Y3QgKHN0cnVjdCBpNDBlX2F1eGlsaWFyeV9kZXZpY2UpIHdoaWNoIGlzIHRoZQ0Kd3Jh
cHBlciBvZiB0aGUgYmFzZSBhdXggc3RydWN0IChzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSkuDQpU
aGlzIGlzIHZlcnkgc2ltaWxhciB0byB3aGF0IHdlIGhhdmUgLSBhIHBvaW50ZXIgdG8gYW4gb3Bz
IHN0cnVjdA0KKHZvaWQgKmF1eF9vcHMpIGVtYmVkZGVkIGluIG91ciBzaGFyZWQgYXV4IHN0cnVj
dCAoc3RydWN0IGhibF9hdXhfZGV2KQ0Kd2hpY2ggaXMgdGhlIHdyYXBwZXIgb2YgdGhlIGJhc2Ug
c3RydWN0IChzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSkuDQoNClRoZSBvbmx5IGRpZmZlcmVuY2Ug
aXMgdGhhdCB0aGV5IHB1dCB0aGVpciBvcHMgc3RydWN0IGluc2lkZSBzb21lIGluZm8NCnN0cnVj
dCAoc3RydWN0IGk0MGVfaW5mbykgYW5kIHdlIGhhdmUgYSBzZXBhcmF0ZSBwb2ludGVyIGZvciB0
aGF0IGluZm8NCih2b2lkICphdXhfZGF0YSkuDQoNCkluIGFkZGl0aW9uLCB0aGV5IHVzZSB0aGUg
b3BzIHN0cnVjdCBmb3IgYWNjZXNzaW5nIHRoZSBuZXQgZHJpdmVyIGZyb20gdGhlDQpSRE1BIGRy
aXZlciwgbWVhbmluZyBzb24tdG8tcGFyZW50IGNvbW11bmljYXRpb24gaW5zdGVhZCBvZiBoYXZp
bmcgYW4NCmV4cG9ydGVkIHN5bWJvbCBlLmcuIGk0MGVfY2xpZW50X3JlcXVlc3RfcmVzZXQoKS4N
ClRoZXkgaGF2ZSBvbmx5IGEgc2luZ2xlIG9wZXJhdGlvbiBhcyBFWFBPUlRfU1lNQk9MIGZ1bmN0
aW9uIGZvcg0KKHVuKXJlZ2lzdGVyaW5nIHRoZSBzb24gLSBpNDBlX2NsaWVudF9kZXZpY2VfcmVn
aXN0ZXIoKSBhbmQNCmk0MGVfY2xpZW50X2RldmljZV91bnJlZ2lzdGVyKCkuDQoNClNvIHdoYXQg
aXMgdGhlIHByb2JsZW0gd2l0aCBob3cgd2UgaW1wbGVtZW50ZWQgaXQ/DQo=
