Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454C912213
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653CC10F13F;
	Fri, 21 Jun 2024 10:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Xj3AQDtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FF110F13F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:18:25 +0000 (UTC)
Received: from rly13d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly13d.srv.mailcontrol.com (MailControl) with ESMTP id 45LAIAQW069181;
 Fri, 21 Jun 2024 11:18:10 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly13d.srv.mailcontrol.com (MailControl) id 45LAI3ZE067166;
 Fri, 21 Jun 2024 11:18:03 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2044.outbound.protection.outlook.com [104.47.13.44])
 by rly13d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45LAI02j064861
 (TLS bits=256 verify=OK); Fri, 21 Jun 2024 11:18:03 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g60rX4Q1VYQRqZuhDCcdfhKP/pHmzz//AaOnP5EQuwO3ILnh4JSHxIIOnQy+vIk1vtRc0sAgR6EkhfonahrvkgFeRxOiJpBbAd9vMFrt5lnBnHBCXZkz2w7/B+nLc5vxhlTpLw4cD4K+O6kHN8GWt3m2YPJaMQGZNEn/pyBN7xCcxHSR/BJ1ucaQDX5oE4gKN8VrN2LyzIVzu/MgkWyQ/woeaqwE5DxrsiervHuk5HJ2FmBwjZssYRQu/wNb/pMhjHmy9faH7Tsm7mL+AXg4lN0UakYsrd0cVHmR2F6u4cqqYKNCaxCQ3vHDqNEoiA7BrGESjbhBaejogGxbgJaeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbWDSfQo9O62ZHORFuoNKPgKJNNOQGHLDH7h/J7DWOw=;
 b=KlCxU+eSUzcRTDxVptOxpKo4GOFnzzfsQOpNmepH55ofxSJI/ugsy9w5PAuVPW0sfwOkLKoYBDP5plqDl7/C8Rl4aq8yLJU6VGRAbRINYfQ6zVO+/lbB2l7FSJBebmgidl6tyy4qct1BltalweC+v52w4PLGNT/Kq4E+h0yuVEya84BxPZUeafxpgsvLAgbxSr9ab7cqOLQHwH9odmYImXcNoLTs1pcF6vx3wGhWPj/gZaUek9Vn7VAO0s6sJQMxen1zigJLFla41qSxhKEgMh+mKjKiPztIb5dvBMq0swKmGVqBjY0q9MUujcO127xjvvkimpcNgSoJgwmjwcsi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbWDSfQo9O62ZHORFuoNKPgKJNNOQGHLDH7h/J7DWOw=;
 b=Xj3AQDtl3xyzDrzXy5OFjCDFqE1x+3nLboKtwhQQu9tSDKeYL2qL1LwVPQsCBzt2CLYN5NqRzYRz4lc4CU4I/Z2/W4Vw/M+24u/U6MT9+B3BTTXBx2IWRruBvTmj/FktyrtHcJOI5bBgzyfVWhYlbE4eiNwl6KE27peN7QPhMFhqhR2TtdW4nY8clZgHHzOW/WePJUS7icedftXno0wwui4ydd7C6cHYo/1Nr6rGY9iLDMCPe2XktWI1zXQ9wZeCgA32r+51o8yZwOuz0hSmSmjp13/hIDN5MHAN+oHmmXawPN7klG7uAEXD+NvXCn21Av6PFhlF4c2VHrD9hyZAoQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PR3PR02MB6394.eurprd02.prod.outlook.com (2603:10a6:102:70::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 10:17:58 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 10:17:58 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai
 <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Topic: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Index: AQHavWrP8fzUP7TvlUuSpdkfhyjIlrHPc/UAgAKZx4A=
Date: Fri, 21 Jun 2024 10:17:58 +0000
Message-ID: <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PR3PR02MB6394:EE_
x-ms-office365-filtering-correlation-id: 675fa18c-ea17-47a2-5e6e-08dc91db6c68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?Z0VNR2VOMGxSVHZrdTEwY29lNFdEUTErQUxSMVJqM2xFK1dRaUcrTjFLVFh2?=
 =?utf-8?B?VlRBYW00REdhaFpETUkvN2I1THpvSmY1Vzlld0h2TFczRi9vR2g3ZWF0Y2Zv?=
 =?utf-8?B?aXpybHFCd2REUDZYTGZVZG02YWJoNFNxaXZpcGdBZHcxaTByZjdnZWx3dFJT?=
 =?utf-8?B?Tkl3OFRnVytvVzV2SlllbUNwNHRQRDN4YTBZbTNDYjJnZzlud3UvR0xHZ0FK?=
 =?utf-8?B?YTdySWFoRXk2R1JLSitXUWZjVU00RWtWQXVORm9hU0wwa1YxazNUSGNRSnhJ?=
 =?utf-8?B?eklJbERtK3BHc1ZzNUtoVSthRmpGVTVTNGIxdGhPNzQrajFMeGpaZmZRbFQ0?=
 =?utf-8?B?ZmF2YXduNUUyK1BRRFUrdWdTSmQ1VmZDOTVkbjlqQlpEZ3UzRmNldkV2NlRK?=
 =?utf-8?B?Mys4MXFRdmdPQW1acGZXcE5uZlp1TXdNK0tBRTBtTHVhS2VGOEkxaGJQeWVG?=
 =?utf-8?B?L0dramk3aGRrbFZsRFM3R1UrVUhidHdFMjRpWkxTTXVmMy9NVnB1NXF5Znl4?=
 =?utf-8?B?Y0N4c2Rzbm9KbnRuQnVtTUdNRmNVRFZFbnFEWjNRWm0rOUxTV3FHbDY3SXVx?=
 =?utf-8?B?L2htR05PTmtxcFFVY3dVNFhwcXhodVpZbms4NC9oWGZidG01SXFjaXYyUFBW?=
 =?utf-8?B?dmtCV2VCSWFPSWZMUzU0UjZJSURXWThyUzh4UUN0dnorQmpqaHdBdVRlN0l3?=
 =?utf-8?B?Z3JOSDBVdFZENGRYNmxsL3RnUy9BWW9pN2R5VEZ1emJNbHZWUWRid0VKcDRP?=
 =?utf-8?B?d2hZVSswS21adU9vUmJNUVVvdTErTVRXVWF0L1FyQnl4dXZkWlBHS1cxeXZN?=
 =?utf-8?B?WWdPNm9CM0VHUm9YQU1rTy8zSkpucTYvSHhDc3dUVDVjdW5LVG5LUkZJZytQ?=
 =?utf-8?B?alhtbGVlL3ZvQW1RK0Y2VmdQS3Z1RzRSVElFVlRwbitqdXZtbFN4U0xNL2xF?=
 =?utf-8?B?bWhzN0xrT0lPMDgvb01NU3djNU92YUFuSmw0SHdjc2twekduTlY1RVN5dzdx?=
 =?utf-8?B?SHZMZXhGanFQKzRiblhaeDNHeXlBRFBuMCtDeW83WXlCeFZhazc5Q1pEMWdY?=
 =?utf-8?B?WkE2ZWNNaHRLd3RyKzlLMUpXTkV0SUkvQVA0SlRkQTZTTlRrUnhKMjFtNHpt?=
 =?utf-8?B?S3ZmUS9NMEF3blE0MDF4R0JLK2xmV1RnME05bS9JU1ZxckRLMjFFVTVvQmgw?=
 =?utf-8?B?QVFVTjRPN2hBcVhJM3hjaVdQSVVmYkV3YTFoc0E1NGxsWUYvMkdKT2J1Nnph?=
 =?utf-8?B?bmk4MldvOXQ5RkkvN3dWN2owYkprY21LNW5tWmxMR2VGd0tRcEZtL3BlUjhE?=
 =?utf-8?B?bEhIUzF3bnNMZ2t3S0lUby83alRYMk5DbnVyVTdxWWJvSDJ2aTlSYVl6RnRk?=
 =?utf-8?B?NEV2Tk1ML2xZYW10ODRpWUhXd0x4Y0Q3azZGSzVNUlJNUUJWdlhBdTIvbFJY?=
 =?utf-8?B?NEgrM0xNd3NveDJoRnp4dm83REFpSU9ZZGNzbkRIWnByZ0l5VFRqOTRLYkEx?=
 =?utf-8?B?ZkliN0VuaDJZVXltdmxFdm9yblQzTTNxQ0kyNHVuZFYyWXJuNUcyRVFkSks4?=
 =?utf-8?B?RjNQTGpIMmE1YTVhYmpaQTlpVFR4RlZhYkhUeUJ0SHFQVGlqMktHRTFYenRl?=
 =?utf-8?B?UXF3M2VOenBka2FQdG5rbko5M1lqQnIxNktQUkZNSmJyV3o3ZHZvclJtNUJa?=
 =?utf-8?B?bTg0QXhVMVNNQk5mNUljNkZXR3dOSkNPNkRJenQ1bjZCVFE2ZGsrS2R2R2ov?=
 =?utf-8?B?NlppYlJFUzJqVHNTQ2FIM2VhQXNaSTQ1c2JvWXhiN0Nsa3E4cGhCQ0RkRHFK?=
 =?utf-8?Q?PltmseQmHK2Vgxf7bB+2lEiLNaeaeVLd1AVLk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFxQ2RxNDY4NGlsQmxmTXBSVU9ocjBoR3pza3h4c0VMVE9ET1I3WWh5cDUy?=
 =?utf-8?B?QzZMbGlsT0VhSU5PU01kVFh4WG8xWE5jUlMwTktGN2R5Sm9tTE93MVdZaVhH?=
 =?utf-8?B?N2ZaeGFCQ09pczh2b2k2cDM3NGVhc0oybGVraitKZUZYQ3Z3cmtJYW9BUGgv?=
 =?utf-8?B?eVdNVFAyRllYTGZNNlJpdnhlL0RMVUhYdmVrNklWcWdRTWs4VWtINmdELzhi?=
 =?utf-8?B?YnBHTEpTU1BlZ3JPY1ZzL2hkMnBEMUdwUk5TcHBrRTVJVEdWTFJnWVNxN01l?=
 =?utf-8?B?aUpoQWd0S2tqMzdFSzIvWHdsbi9sTUVoUzRDS0VHOHBRU1didWU1UFdsYVRJ?=
 =?utf-8?B?QTQzcUlncDJIZGt6WUtwRWxqaWpYb0I4eVpoV3ZGdy9zZmoreHhaQjFIMHpT?=
 =?utf-8?B?WWZvVzUrR0Q4QzBDOE1KQVdiRUYzQ0dSUGRMOEh4SUxOcVdQMFoxeU9rN0R6?=
 =?utf-8?B?OWNqRVdBK3hBSnFTVWwyKzZHWVFqSHhoRE54czlqLzFBNkJGRlNBQUFJRDBw?=
 =?utf-8?B?NlFWLzdtQnBtcTFOcFVmV2piUjZaVU1YbEFqVW9Vcm9lS3RxMmh0cTlRUzNZ?=
 =?utf-8?B?Z0ZKQUdZT0wyYmxYbm5XSVNZUk1qLytCYk5ndWo2cW11VHBsaSt5dFNVbVpF?=
 =?utf-8?B?ZGMrb3hzVk9kaVZmWFJ4aU5hSWdqSVBKMk5BUWdZb2VTYndydFU1NnFEVSt3?=
 =?utf-8?B?eGYrZ01uWWZ5MGtUNG9NYktvNVBiVlRGUmNMQ1RBOTgybEdOeklyc1p0dWZH?=
 =?utf-8?B?c2p6UElGaXhCM1MrM0JEUnFWQmwva3prVkw0cmVZS0JWMlVuN1Q4WXFDMzdK?=
 =?utf-8?B?SVpJVGhiUEZwbUFVczkwRHMxRVk2cVVBU0p2aS9vWkc5UlQweW9jTjRnSnVV?=
 =?utf-8?B?VWdMU3V4SXlRR0x5UStyaWZkaWpnOEpSM3pBaEl0dUQrNjVGVllPRmNuU2tq?=
 =?utf-8?B?Z1E2OFJpTHJFTmQyM1ZtTlE1dTBPT2p2bXlpOWFrWml2T20rRjcwYU1PZ3ho?=
 =?utf-8?B?d1lDWG1ZTU9zM3NCMURTV2VhOHR2VFlXM2o5eDhPYWFyTHhaY3BYcHJvVGNt?=
 =?utf-8?B?SU5pMG11dVRjeDc4YnBTSHZ6NGxqVHA4LzA0S1QzKzVER1RiQ0I2ZTZ6TUFO?=
 =?utf-8?B?NzBrOW9tVUhiOThpSEdHOStYTCtEVTRuZmFGOG5jeTBWMlRINnljeTF3M28r?=
 =?utf-8?B?c2ZNRkppcjJtS29CQmU4Wi9YcDRWRlM2cmh5NnVPaUhGMXlzS3g0UkRRYi9Y?=
 =?utf-8?B?bDNubnN0YVFFYy84QjBxRm5leERKb3BRMit2My9sd0J1ZFdTSVFVbGRFaXpO?=
 =?utf-8?B?MGl0c0VIRlJ0c3NOejZVanlaZ2dpRGVuc2pJYmpkYUxCTHJuTHI0WjluSWRT?=
 =?utf-8?B?T2FzNlZ4aldLa0NHbHBxNjZSc0xyZVRKWkpFOGRVbnIzc3JCcEdiZGpDczNm?=
 =?utf-8?B?ak1hNUVnZCtVTDVWRWNtVWJsMHlFMFVJSk51MnNxWEJYUkpwNHAvcnpOc2U3?=
 =?utf-8?B?RVNsSzcrckhxRnBaVnVjVHJINy9zdVljTDNkdVNDb3RaQzZmemRzenVITVdF?=
 =?utf-8?B?V0svN3hReDFjdVBDY1JrN25YcDkvL0VITDNhazFhVEl5YWtzRHI0dFJ0UG5w?=
 =?utf-8?B?b1gyVEYvdC9DaGt0U1h3aEJCODV1aFh3RWpOUzdndm8yWHdMZ1VCU3EyVFln?=
 =?utf-8?B?Yjk3c1ZLek9leUtuN0x4TEtYMlFKUWtuM2Fyc0M5cjhBZnpRbHdtZ1BwVEdh?=
 =?utf-8?B?ME9mNWwvSURaT3doSUFtUVYxcFExWEtKZ2VXRjVJd1pUdkVQV0o0dURsYTUr?=
 =?utf-8?B?TVo5WG8rZWo2U1BUODhGMWFYby8xbTV4Q0QyQnkvU3h3UDY0NTlBNDRnZGEz?=
 =?utf-8?B?RDhIM3B2NjdGdVIxR1BsdlBvd2lpRGtlOGc4ZTBOaEZJYXI5RVhJNU9Zd3Y2?=
 =?utf-8?B?dGtPdW92WmNrUlY2TWJOUUI5Vm1iQzNleDl0cUlXUEs4cHAvc040Q0loYkhH?=
 =?utf-8?B?ZFpwSjFJMVI5UkhxMzA3SVhpTXltbWpUK0NTak90ZDVLZHRjNXRkeDZXSWVm?=
 =?utf-8?B?RmxWdVRpeTNBZS9qS2J0S2lmb2toR01mS2YyVDdIdUxaaERHWWNsUFRIaUxE?=
 =?utf-8?Q?jttfkgvDnjFZdDjwCVFv6GEZV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2447E7A2D0AF644EB6F1DF4FDEC50505@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6EXZUxkJR8U3uymXYaXkPV+FbmEVH3VgKEGxHxeTCxOo4pgzytG5hAAK/foov86irSx2G/1gW5yRQUQQuuFcBAiUpsQHSTN8eo2UT3qLDg2gH2jBA7p2R5rFFPQXY2doIFGD9lBwbTMWKJkPt0cgvfjDjceRzncrhOjKk4sVSmEbcM0A/M6Z0eNMrnrpFRQ7siFgNdtVV05L1HkNdOtPz5OiSxy4jsn4v+dzCDuVoyqyrZVRuPRzqcHoMJkFbpQklZMZ8tyMuf3bayEwpIIYcPOinX6CFRDB8OLfOUzDHMBhNwpAw+kRIlkf5bxo68uSeBn3T4CRo/iImZB4Go6+I51TiCqXskIib4QrKyRcjhe6+JvPix1C9v1omMdIN4tFRY9hz9+y4rweU0ZPVp4jow2gONYmrzROAzptFQMzoXte/DGuXrifwwZ3loGXuj0ZUfapeNuQi+VTau4GU1wxzvtaE7Xrv2deLb+mrMLsmf5zrHYUXJaqj9gYOQWJ4nDud6pIdB/yMuB5Zojk7tmGWnVzmgaTqdd67WEu/SlIHd18rFJmoHAo2RvYldkwVh6gV2wmtLnAWBwamvOqAb4B14MVHv6rs0wXi9kFP21BgsBN9vJVYSJ0qqxOtgLhpoJr
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675fa18c-ea17-47a2-5e6e-08dc91db6c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 10:17:58.1861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIweWTYqzC61ZHPX7M6KaL+WC75N4gHY6ddCNISgtAJBv6aBu/prOkcvvBy5+s0RXWH6344TgeqXN5Ufapao6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6394
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODk2NTA5MzpGUEtleTEucHJpdjqB07280c+nqTa3LMTwJBdjBc1OtJBHrYtS4e9KtVVMRENIC8mKeq9R76h/o46Glw1EQoEOc6aXC+aqLNhWbTNWewAgJDTL9X5i2uYW8wH+mN1bl+NMbonxEpupEzDEh9koNBwbHWlMCan7SasAkkCzs79ziAo5OuyI+6IdTuZ8bG6W2XL21hqV4wFDBZKR8xNXptDG3BVEyK/zP/4i4ewTRD0z/rR0tQIGnsEL3dK5hp3z5eAOkJPQqeh36i+ksHrkpvaHjaICBwtJw183AlJgxBD+wVEfgURqYqG99TurrQECfOJKq5ti3BFIIcfJXW8Slfm9CWh9ksvzYi3f5CvN
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.123
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

T24gNi8xOS8yNCAyMTozNSwgU3VuaWwgS292dnVyaSBHb3V0aGFtIHdyb3RlOg0KPiBbU29tZSBw
ZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJv
bSBzZ291dGhhbUBtYXJ2ZWxsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPj4gKw0K
Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2tlcm5lbC9kZWJ1Zy9oYWJhbmFsYWJzX2NuL2hibF9j
bjxuPi9uaWNfZGlzYWJsZV9kZWNhcA0KPj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2tlcm5lbC9k
ZWJ1Zy9oYWJhbmFsYWJzX2NuL2hibF9jbjxuPi9uaWNfaW5qZWN0X3J4X2Vycg0KPj4gK1doYXQ6
ICAgICAgICAgICAvc3lzL2tlcm5lbC9kZWJ1Zy9oYWJhbmFsYWJzX2NuL2hibF9jbjxuPi9uaWNf
bWFjX2xhbmVfcmVtYXANCj4gDQo+IERvbid0IHRoaW5rIGRlYnVnZnMgaXMgdGhlIGNvcnJlY3Qg
aW50ZXJmYWNlIGZvciBhbGwgdGhpcyBjb25maWd1cmF0aW9uLg0KPiBEZWJ1Z2ZzIHNob3VsZCBp
ZGVhbGx5IGJlIHVzZWQgZm9yIGR1bXBpbmcgcnVudGltZSBkZXZpY2Ugc3RhdGUgaW5mbyBmb3Ig
ZGVidWcgcHVycG9zZXMuDQo+IA0KDQpJIHNlZSBvdGhlciB2ZW5kb3JzIGhhdmUgZGVidWdmcyBl
bnRyaWVzIGZvciBkZWJ1ZyBjb25maWd1cmF0aW9ucyBvcg0Kc2V0dGluZ3MsIG5vdCBqdXN0IGZv
ciBkdW1waW5nIGRlYnVnIGluZm8uDQoNCj4+ICtXaGF0OiAgICAgICAgICAgL3N5cy9rZXJuZWwv
ZGVidWcvaGFiYW5hbGFic19jbi9oYmxfY248bj4vbmljX21hY19sb29wYmFjaw0KPiANCj4gV2h5
IG5vdCB1c2UgZXRodG9vbCA/DQo+DQoNCldlIGhhdmUgYW4gZXRodG9vbCBvcHRpb24gZm9yIHRo
YXQsIGJ1dCB3ZSBoYXZlIGFsc28gaW50ZXJuYWwgTklDIHBvcnRzDQp0aGF0IGFyZSBub3QgZXhw
b3NlZCBhcyBuZXRkZXZpY2VzIGFuZCBmb3IgdGhlbSB0aGUgZXRodG9vbCBwYXRoIGlzDQppcnJl
bGV2YW50LiBIZW5jZSB3ZSBuZWVkIHRoaXMgZGVidWdmcyBvcHRpb24gYXMgd2VsbC4NCiANCj4+
ICsNCj4+ICtXaGF0OiAgICAgICAgICAgL3N5cy9rZXJuZWwvZGVidWcvaGFiYW5hbGFic19jbi9o
YmxfY248bj4vbmljX21tdV9ieXBhc3MNCj4gDQo+IEhvdyBkb2VzIHRoaXMgd29yayA/DQo+IA0K
DQpXaGVuIHRoaXMgb3B0aW9uIGlzIGVuYWJsZWQgdGhlIFJETUEgZGF0YSBidWZmZXJzIHRoZSB1
c2VyIGFsbG9jYXRlZCBvbiB0aGUNCmhvc3QgbWVtb3J5IGFyZSBiZWluZyBhY2Nlc3NlZCBkaXJl
Y3RseSBpLmUuIHdpdGhvdXQgTU1VLg0KQnV0IG5vdyBhZnRlciB5b3UgYnJvdWdodCB0aGlzIHVw
IEkgc2VlIHRoYXQgaXQgaXMgbm90IGZ1bGx5IHN1cHBvcnRlZA0KYW55bW9yZSBzbyBJJ2xsIHJl
bW92ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IFRoYW5rcywNCj4gU3VuaWwuDQo=
