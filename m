Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2F290EA99
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2D10EC73;
	Wed, 19 Jun 2024 12:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="LU3Mokh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35710EC73
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:13:48 +0000 (UTC)
Received: from rly32b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) with ESMTP id 45JCDfOx229828;
 Wed, 19 Jun 2024 13:13:41 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) id 45JCDCSF224065;
 Wed, 19 Jun 2024 13:13:12 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2046.outbound.protection.outlook.com [104.47.13.46])
 by rly32b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45JCDBWi223299
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 13:13:12 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJEJpEIuAQSGDohS42rP6mUMIcO3f3trB8C7o2ps1HnoeW8s3GYVU+yPvjf2yOWKhQwpkwsfldxsZTeo16uI3Rz5Kn6o+LplKUbfTCwWgX9tZ0pa9MgDF/kc0zeFtIo219o7WvNFgH9d88fdqu2muA1Sxq/F8w7KtfxZ7iVSQQSKw6FfbkYLBtm4oXNAbLYJ4g8UbzX2WciFePbu+04eSa2x1l/gwDnZEYknIgZjZvqE1tvpi0b33MtIWDgrN+nBAo8N9N0aJDUXErVSX9dMVR8Y7b8MnkUvqxv9RWRalTTn4rW0utNlGSeDKYt7xrZhpWiCKNfKAP3YLwj5cZNc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK6Loj4edEDjQ5Iq8F7MCgY9wTgh0m/WH/exBWEljzk=;
 b=PVBPGfQUGRuZB2LuWcOQRnJe7XsGaDKMypchB1Ti2MNNfaxLnLUB9m3gi8ARsyYD57KgYN1OeXWiooI0tL+UnGQ/8aVw+osJs65IFGTYqjzQHPon4avxb7ey9+cFP4trDWfEbfTZYWO9xs9WSoNHsE+VfoOeVCe3IavuWwM1e8/k8ep3MFvHviUXUR1p7H9hKGtedHs/CXp4gSjYpXgOAuovRNEzWjoWr6l9b7KpVzWFG7YNHDTNEMkU557n4+CY5v1wWqUmEjwWBVm3q7FtWPV4bfVL625FLLzXGPtCGbKaqlolfFekEUJJ9wPcjWjmY+gHowsiqN0MepXzXVRw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK6Loj4edEDjQ5Iq8F7MCgY9wTgh0m/WH/exBWEljzk=;
 b=LU3Mokh5lbxPLePDTsjvmUtCXSezUXB99Bn0tKy8j5C27R7D3OClMltaAqHGEkiv2hp5PK2jfRaymDNnqt5a7SGhfbZCM1y22lB8VG+G/JCk+adLCIdxhFfmK6MmR0VE55DwaM/qf9hPR1BtZwJ0Qqflt2iel3oSqaQxqIuJ6aB+dMkqOzVRvgCNqmRwgLRjKa3nNDa2JLnowHRn7XbBbjH7Xeb7z9my6b0GDtzcNUATQ28ao4OxQGZnl3+7eGu9APU6ObtQBy7S1eo/jyH4JGGuknfpl1BKoxBNT491ghr+9AOf/ki09e99VMnu0pMLK0YKKB/68dIRvK8mNru9+g==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AM9PR02MB6545.eurprd02.prod.outlook.com (2603:10a6:20b:2d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 12:13:09 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 12:13:09 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Stephen Hemminger <stephen@networkplumber.org>
CC: Joe Damato <jdamato@fastly.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHH3y6AgAYT7ICAABxyAIAA+bMA
Date: Wed, 19 Jun 2024 12:13:09 +0000
Message-ID: <21c41453-9f2d-4fb9-807f-f41e5268c7c3@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
 <16369c7d-af15-4959-9e84-8a495b6b5035@habana.ai>
 <20240618141924.5a62a3d8@hermes.local>
In-Reply-To: <20240618141924.5a62a3d8@hermes.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AM9PR02MB6545:EE_
x-ms-office365-filtering-correlation-id: 0c7ecf4a-80a6-4fb8-c1c8-08dc90592ecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?MFFsVnAydE0yQ2dacUI5b1IxMzFwTjZrSWtZelVGUDlwT3FWSFFROHdocVNV?=
 =?utf-8?B?RHplbk5WNm5ibjd2NE1wanhEcytEVllTMjFjQWhuNDRHRi9ZWGFpYzAvblRl?=
 =?utf-8?B?OU5FQzB0aEttQXBCb2cwMncyQ1YzaGxBWEs0WlU1WWNmak1TbDZMakc0d25l?=
 =?utf-8?B?UFFQcW12VHhIZS9oRDBPaDRkVzFuSzVGYVRuRFkxeDRuOWlDNVlaV3ZXbEJy?=
 =?utf-8?B?d1VvRmdmaEFkOFVGNG9aRHgzV2o5NGZWZ3ZWS0ovYVRvd1phWFpIMXNDaEp2?=
 =?utf-8?B?UG5PdHU5NkJqRm9vcFhoMjI1ZC9wWWIvRm5uYm1CeUNUVVV1Y2hHZGpiYW9B?=
 =?utf-8?B?b3YrQjhWU3EwNjk5YlgzS0p2Z2lJc00yNzdrSzlJRGlsVG5xcktCZmFiTzBT?=
 =?utf-8?B?V0FMOHRSRndwY0NmaWdkbVZpamVVaHJzOEJmVmJGbHJPUUdJenNrMWNpVDc0?=
 =?utf-8?B?cnRjQ0NWazJQSlNXdm9IWkhhekRnVjBHY0s2Vm13czdnQVpzQVphaFUybWM3?=
 =?utf-8?B?RUx5ZmtpeGtpdDNPbDRDR2wwT3RlWWlUS2hMZFpBbEhmbC9zcG1HQmhoM0w2?=
 =?utf-8?B?SGVLd1kyMFI3ZWNEaHFxeVlBVnNVSXJyUkJFbzFsWUJxd0NubWxDdDNUT3dp?=
 =?utf-8?B?UmVDOE1yTUxwNC9OVU5QalNVR2ttak1PM00ybjN5MkFlcTZGQ3R5R0NjMFR3?=
 =?utf-8?B?SS85Rm5XVkxUNSs0UmsyOFpYMWxuQ09Nb01sRVBmdmk0ZTZ3M29YdWNJSUtr?=
 =?utf-8?B?enVaSm5ZTHBLMTlPd3VGVkZpNHBFWXg1L0R4TTNFMXhOUllKMnJ1UWV3VCsr?=
 =?utf-8?B?OTNTbGZlU1dYRGdtRWxadGtuaWt4Tk5lQ1hSQThVV3JPRk01SVpDMkQxK042?=
 =?utf-8?B?WTc5bnRUOWthNTl6VmVQUUdMalAwbDdYWThnSXBiUGFBOFJ0Tk1sTjdkdCs5?=
 =?utf-8?B?ekZ4azAxbmNzU1VuUXo3YXFlYi9MV21wY0NPeHZhb29sRDVldFYrRlhpcHBo?=
 =?utf-8?B?Q1FxbC8wZTNoeWFKQlNMamwzRmEzbURiK0RaQ3ZoMTN2RHpsaG9hWTdwNzNZ?=
 =?utf-8?B?RXNJdHdYRDNsclU4aGp0R1lBYUtnSHREWHhFQWVDcnBhV2VDNDVmS3M2YTB1?=
 =?utf-8?B?b0ZGNm5MNVdEWkx4OUIzSDBBNEpkaEM3M3JaZWhseHBqR01qNkltOFExOCtN?=
 =?utf-8?B?Z29nbGh2YlRiZnpZeWxaQWk0a2Q5dkxQMTBIcUp6RkljbVJNVjFBK3huNXZ6?=
 =?utf-8?B?UnpxQzNPTENQK1cyUjNSbFpFbXhEL0ZRYmhyYmUyaFVwR1piVEdBWk40MlIv?=
 =?utf-8?B?TDhBR2h2OHZsZ3dGbWNzUlpJUHdrSDFIODBrNHVJL0hDUC9sUktuUktkVUUv?=
 =?utf-8?B?WjVRbFVycXpwN2x5OTRDSXBJMjJvN3J0NWRBSUlnNjZ3VnZ4MVIvZHYvMXZi?=
 =?utf-8?B?dlp2OUxia3VOOGo0Mmo0azBqNXFDWXZFWXQxWTJuZ0toc3c4dWxVZ1N2Qkw5?=
 =?utf-8?B?WGliTjFTZGJqRjM1dVdvQzU1cDFGdG9PL1VEbDFTajJsWmhxUXh0NDhVaUc1?=
 =?utf-8?B?UkhUL010bVVFQm45K0J4S3JENFNBdENxekthZlVOaXNBTFNzbWZKbE9mMUxR?=
 =?utf-8?B?M3p5ZFRQRkFkNk10a3p3eGFWVCs0UHJrZ0tJVTh3a1luNzNjZ0NzUU9HOXlu?=
 =?utf-8?B?b3JMNUdVWWk4QUNTMTY1UGFXT1hQcWtpRzBOdUxhNVh5LzFXamR2RFF4bGZ0?=
 =?utf-8?B?MnFNUFJqamJESkdkdkl4ZzNMUEVhOFBHQ0hoR3ZuMU96eC91WHJZdlVpelVp?=
 =?utf-8?Q?Vd6xEeqxMH54EGUJuEzoHZVduLU3UM25fkbFk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FtTUNjUVp4QTdMdnJQcHBGaDh1eXVnc2lNVC83Vlp3YkplbGFXU0p4S24r?=
 =?utf-8?B?blJiYkgzYkVSbGs1VzlmekxrU1ZLdVdBV2dIbTM2MmxCSCtMLzhYcXZnVzdj?=
 =?utf-8?B?c255Z3VyLzdaSnlDcDRvQXh2UDNhVHE0dVFZNCtNQVZWbW1LV1JYT1R1b2p4?=
 =?utf-8?B?TkJ3a1dxZHhXYnh0Y2YvRURtci9QSjEvRU9Gd05ObVpEekJxRFNSMm4wSGdi?=
 =?utf-8?B?V3kvcjRvRGRNQnRCd1VrOWt3MHNVWlJWYVFYQkZ1elJnOHlFRlVzN2k2UFh2?=
 =?utf-8?B?QzZ2SzVaNERxOU9mRjlZZDV3ZVZndy9hQ0NXSWUvNHJXQlhXU0wzakhnRnNM?=
 =?utf-8?B?bHcvUCszYW5vL3N3cjVlWDNYZDZoZG4vSUl1UEFiVXBrK0VmWndKWmtWZEk0?=
 =?utf-8?B?dkNvM3NBNFZTaUoxY2ZBUXI4VnRNNi9mcGxaVTZqYlZmQWtYMkUxcE9ZemJB?=
 =?utf-8?B?UHRTL0hUVXQrZFQvUmx6ekxPdUhOYXE5ZStoci8yTCtNbEtyVi9tSkRsNUJm?=
 =?utf-8?B?RHQ3Rzg1eWkyZ0pYeDRxaTZxSURTN2gzL0UvSzFjSnpWOW9BUW5lK3ZwdmZS?=
 =?utf-8?B?ZVhCSjJwVnNWWkRZeGJWM2F0NU5Oa2RjSUNlQmxFWTQ0SFpMeVd0UVVBNTcw?=
 =?utf-8?B?ODd3bUFUQmNMOXVVbWgrWS9iRDduREFhK0pVL0dYeTE2YkR4THFlUlBwN3Fx?=
 =?utf-8?B?Q1lrY294d2dTY2dsVTdOUGQ3WEFOdlp5cVp1RzViRWlHbTdOUGxqSzkwUU1j?=
 =?utf-8?B?Ym9namhUeWdIN2xnV3FCR1pVY25zbTZEa3FOdnBhcGc1a0VqUGhHejhYS0VF?=
 =?utf-8?B?NjgvNmF6c1k2RWptQ2hhMDJFQThIUjVORXUvMWdlc2ZGZFdQWEJvNXRLZWFO?=
 =?utf-8?B?RUpMYWI1L1ZMckJxbkV6TDRsUi8rc1MyUmdmbjZDNzFHM29Oenk3TmFvczIv?=
 =?utf-8?B?V3djQnBlOGcyT0tUTm4yS0RDemNpMUV2eGdGU0JRYlN5VWxlTkJrcEk0dXh1?=
 =?utf-8?B?Y3Q0QjVJNE5GSDlQbEFBYkwwS21yUnpWeENpKzhEL1lLUE1CSytaMHRvVE5h?=
 =?utf-8?B?M3F3Z0ZWdEpmQUcwV1BNcXRFT2NZNGZKekI2SHc1YzRrY3FIbUkrVHlDaFpn?=
 =?utf-8?B?Sks5eGtYSVp3eXIrbDFEYkx3eE1RWGw0TkJWNWNnOGdkaHFXamNKL0N4ZWdP?=
 =?utf-8?B?czJkVjVWdDFaUndKUzhyeDBPUVhiWG9zL2lDZ3V3dHhjaC9YT0cxN1Q3T2Y2?=
 =?utf-8?B?NWVhOUV1d0FiODVQeDN2YVVWdTkvUXN6aXZxNjYvRGVIdzcrN1FqYjJ1aTFs?=
 =?utf-8?B?eHNqZ29kTkxNZDVlSHVEMVlzMytzWWxLZGtscW9ZQSswZHJnOWZxRndCbFZR?=
 =?utf-8?B?bEo4TEpKcm9GRWZGYm96WmZWcTFvQkxmZlVRMmJEU1hRYi9qMG04ZURYdk9L?=
 =?utf-8?B?QVJyTm9OYllvaDliU25sT2FvRjRVd1hHYkgzSHVJbkxGb2ROc2ZsVjV2QWt2?=
 =?utf-8?B?d1NNZFJrZ2pQSlNxbjF4R3JTTDNhQW5nRjhqZzJHVHJZVU12ZDVoMEN1Snpj?=
 =?utf-8?B?SmRzMmcvK0Z0TWU4VnF6NEdaaUovcWg1KzkvemFqV2ZEeDVlSG1wem43Zjls?=
 =?utf-8?B?VFFOL09KMndmZDlmRUtvMWRTV3pDdFBISlROV09hbWs1d3pUZzVpQlhYMWwz?=
 =?utf-8?B?cWZjdy9pQlgxalY0am9ncmE4TW42dktVditPVUhpbUZlSDFlUE5RWk9kZUVl?=
 =?utf-8?B?ZDFFcEN6VkVNZndIQk5XU1VSaEdaZGZrcXpiT2dsaVE3akdUWWo4QmhLSHhu?=
 =?utf-8?B?SFovTklhTnNycXFIOThhV1lFS3NXcm5ROWxGTGRCWHJ2WXhReTJSUjRKSjFr?=
 =?utf-8?B?akZWcGNPKzdTZ0g1aWZ2OU1yRisrdlVBZnBWeHRwVERlTUQrdmtrcUhIL1Uz?=
 =?utf-8?B?aDk3Y0FJSHpSU0Y1NWhaS1ovMlUyb1V3MkVneFcyN3M3d0NzNkEyWjRIeVRi?=
 =?utf-8?B?TXN6b0tycTdlOGJ5NE9qeUp1SDFsS2d1eitxT0FsWEp6RFh4SFJvTnU5ZXpI?=
 =?utf-8?B?QUEvUStCUE9ScDloQk9id3RzVUFMUGZZYnlTcG5sK2Jud2RLakNrZlh2R3J3?=
 =?utf-8?Q?PNmYvVV3TVRqR8poEQe5Tc6qq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D37DD5DB9B07634895A3CD8FC72301F0@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kTMJXB4WEECVXQ87obrX5Acxg44acLRL7vslI/SkIJVnIXxrPg37wnGSoah0zbgAEE9VZkJFM6T4rvgPEkEhW+JVHXlTjhgNU1mEV2OPrdzhlNFjO4HwPiyz/eO77bQoF2jyHMvKtQFLoBts3wNkpwvPHXYxu1O07dq6paB6SX/6hZjGDnw8bgHA6jlEEpBEJIm64RScjOKvMam5eP8G/cLeVLR2+0yaIkvFU1/CVLkaui2hfO4lbTTB0NLlxaVnrzAPApSObtWLOihLoVyNDs2+SiffifEYiWDaqKp5FhWcP9S0KTEhX2LdvPXv9FVt0N12afleyuoAH3ZpCBcCFULQ4K8Mq3hsI/MDEZKBBP9KCcsb02QvxQ3S9KjF6Ti36fKeRjhnwAmftySCWrqvcawqQ+f1CnpQaSlgGi5Ve1oqNSNnU883RXDiDzlZidt+F8DjFJi4BmfHM3Xy99/3tpBvm74BRaC34X3up49sbqA3mEbWkLn4d5dhFzWhRB2aPG5Z37RR46voUqd3/nJ//AEdi2wzN0Gre9pi251yj6ayxpOpP1izLUiJT/qbmQS/D31MAl143nqXWvwLZeEsi8LKF4wwMGFlnRBQTN4AQPKFalxsoQAekJzm880X1qz0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7ecf4a-80a6-4fb8-c1c8-08dc90592ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 12:13:09.0848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OD9xcdJ+e7mmTy1p71tfwq540ciQKZx19Tq4kffdKxFxNwM7ZM5E3LNi+nbvu8FrTrrEJVrLZ4BCAYsQWUnb8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6545
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc5OTIyMjpGUEtleTEucHJpdjo7FjsuBDsWiybofVtj1Tdy6KbgzcRmzdwKOXwnD/gWOB99D7d2JqF6XdJFHqSAw5D4H5iZGoGF7pu4bt4BHq8tpollEiehcZzGixpSYU7IwYO+i1qBR+ZbAzCeoXpFvx5xh0Yz52E4YSpDxRqST+/Buc4gS6iFrPRxVIVRA733f/aW5eJ66NMed3AedBNSdeulYYeFgzoDla0IntO6F+SHbjhNP9kILbq+RIBxPW/sxuBeQ7llkLVwR3mZsXdYTGFQhtzXT+Hx7bW/QBvEL/bR46LDPZLuGVeSh6QVjMdYzdt6p8F0mRfz0BMx/dfBBhygpMfzks26M+oYEcIiRLU2
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.142
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

T24gNi8xOS8yNCAwMDoxOSwgU3RlcGhlbiBIZW1taW5nZXIgd3JvdGU6DQo+IE9uIFR1ZSwgMTgg
SnVuIDIwMjQgMTk6Mzc6MzYgKzAwMDANCj4gT21lciBTaHBpZ2VsbWFuIDxvc2hwaWdlbG1hbkBo
YWJhbmEuYWk+IHdyb3RlOg0KPiANCj4+Pg0KPj4+IElzIHRoZXJlIGFueSByZWFzb24gaW4gcGFy
dGljdWxhciB0byBjYWxsIG5ldGlmX3JlY2VpdmVfc2tiIGluc3RlYWQgb2YNCj4+PiBuYXBpX2dy
b19yZWNlaXZlID8NCj4+PiAgIA0KPj4NCj4+IEFzIHlvdSBjYW4gc2VlLCB3ZSBhbHNvIHN1cHBv
cnQgcG9sbGluZyBtb2RlIHdoaWNoIGlzIGEgbm9uLU5BUEkgZmxvdy4NCj4+IFdlIGNvdWxkIHVz
ZSBuYXBpX2dyb19yZWNlaXZlKCkgZm9yIE5BUEkgZmxvdyBhbmQgbmV0aWZfcmVjZWl2ZV9za2Io
KSBmb3INCj4+IHBvbGxpbmcgbW9kZSBidXQgd2UgZG9uJ3Qgc3VwcG9ydCBSWCBjaGVja3N1bSBv
ZmZsb2FkIGFueXdheS4NCj4gDQo+ICBXaHkgbm9uLU5BUEk/IEkgdGhvdWdodCBjdXJyZW50IG5l
dGRldiBwb2xpY3kgd2FzIGFsbCBkcml2ZXJzIHNob3VsZA0KPiB1c2UgTkFQSS4NCg0KSWYgdGhh
dCdzIHRoZSBjdXJyZW50IHBvbGljeSB0aGVuIEkgY2FuIHJlbW92ZSB0aGlzIG5vbi1OQVBJIG1v
ZGUuDQpJIHNlZSBvbiBhbm90aGVyIHRocmVhZCB0aGF0IG1vZHVsZSBwYXJhbWV0ZXJzIGFyZSBu
b3QgYWxsb3dlZCBzbw0KYXBwYXJlbnRseSBJJ2xsIG5lZWQgdG8gcmVtb3ZlIHRoaXMgcG9sbGlu
ZyBtb2RlIGFueXdheSBhcyBpdCBpcyBzZXQgYnkgYQ0KbW9kdWxlIHBhcmFtZXRlci4NCg==
