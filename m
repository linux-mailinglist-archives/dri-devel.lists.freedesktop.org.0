Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6FA718C1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB4510E6DC;
	Wed, 26 Mar 2025 14:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Tnx1TjYk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Tnx1TjYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2078.outbound.protection.outlook.com [40.107.103.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8AA10E6DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:40:31 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kASB/Wvsm+Db7XTeQbU/f1Id9bdhDTQl7eVYG5f84MuiwDFLow9WbCBX5KyErLKf+AzgnGPV+MynO0Q8Ib8TrYSPoO/q1bCeIFrELZTwfQqbhpZ1aiJSm4ANC4bgB1DB5cbPpDxV/ahlRFrvZbMTd5NRcVB2Fx0JtLgiuioM3cbfilzfnR3oM7PDt44xjM/bcAttFA+B93ndqaGlYjvNKZve+FOafWCQfqiI9kipD1/NEidfyDA90dE6l87GRXeZ3DH9uQrTMfIz8CkCbKoOxhsiwbwOhY6eLyt3+uTv8AmTSb+LUbsPO2kF42bKTsrHuj0br7Rwqh8yLgddL/4XfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCnfLBMWq6eO8uggeBktLlL4EcgYcIJ8a0cGTTul6Mo=;
 b=EBN/Lz42ibv/E9nbt3YpQ302oDTv0gYXNJl4NsGaBe5kbrqQszYAjeXGjdEUyUuDntJ4+G5+YO6zwqIJspyJH330m9DxJMK63cezRQt+PCDcu+vjVpl41ExdBtaZCsOWWtyGrd/lugSdyu+/LR2dzGOnKonI7qtIvgC19+5b12JnM0T8iThweowI9QDVSzacllvZ753KHwUuVBY7sonFcpTbwRB/KMQs7+948pylh0N/Vt5YttJ1RUBEZ4DGFDoDtjfvVw7yUCrTe9XoEtwNKbte3dNsxo/j5kewvNtOqbaiXqzASsyGWZd6CzGz3BGFIOlJGwlt5VEB6gUM6WYbrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCnfLBMWq6eO8uggeBktLlL4EcgYcIJ8a0cGTTul6Mo=;
 b=Tnx1TjYkX/kmFqEvQQi/PC1CEDTyrEsSDmKCxPGi8yvXKPt9OIJQLLZOLGRV66+bQs0hFS6Q9abtGsMRHMYX7B3NVrlubCEIsGTzSCbZaAXXOElpROICVLDv6LaJncVRYzSOmax81pxU2WPoazI76KtvwFxs6wtg0pbqIyjEsMs=
Received: from PR3P193CA0047.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::22)
 by AM9PR08MB6292.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:40:23 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:102:51:cafe::af) by PR3P193CA0047.outlook.office365.com
 (2603:10a6:102:51::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 14:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 26 Mar 2025 14:40:23 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Wed, 26 Mar 2025 14:40:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e16856b378e1705
X-TessianGatewayMetadata: 6UBJzW+ovfTF5ZrHHXdgP33hLrKJSFy1caljJA0omI+1V/QYaSRrsEwCrtA3PJ3NO+JVovgzNYhanrsBh17n9lcZ/fMKhdtwcfMD70rfzSgak5sygDKMnWdScv+ykNbE3TYeRQhWnmzdf0RQXicxV/81xac8/7M0i2VXHGvWem4=
X-CR-MTA-TID: 64aa7808
Received: from L17e3ae6a567d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 197DAC9B-B2BE-4E7E-AF27-2308792B618E.1; 
 Wed, 26 Mar 2025 14:40:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L17e3ae6a567d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Mar 2025 14:40:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQQ8GXSAxBpYYP5LCLW2Tbs5up4kQqgmeO1yduysGsG/TdcEu4F0uqC16cW2NfDmYMlDVa5aDAEgCTGKV2a6Lg2NnMSL7ekHCktqGLU9iaBx+kmrzqn2R/+yHwFvR6hmDreFyasF0NLVXCS6bvISbVX0dCN9R84ZEaH8yeD4YZ0gbxdvMPxiJs0RsWUxAsQ2nLSgWP59vk6HZ0hqQzDpxIg9qyhmYzfu2IkKofndMIr45Mw8MfcCRIf3dJhu+BjJw07ghIqEc90XYjAljSzJ1Mpfmr68E8XzuVjg4NYfHxpqTtzx8Aa+1LddU5h7wyaMFiZsnUDy4esrJSBeBvHj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCnfLBMWq6eO8uggeBktLlL4EcgYcIJ8a0cGTTul6Mo=;
 b=vQl0W2h5zHU8zJVO3TQUzGeBb/SjoncwjrPrrurtW9bRmqPgUShZA5Wu27qfvuEckcemOcKyRY2PApTCasNVa/l/r8qM05dv+Q52LEqeMGZ+XaZG7Aff9qyNW//SpHVGbgjGvDV3tNpcOqwM+1CLx7ZPtgRSLQAHEFWUU+o/QltUqeZJA7OIoDHv0aFElavtBIGulCANY239u1DvpBG/s5dn85YNg4Z60P3dxgmkAvBMAp9QSO9K1KenACcpzEv8DOMC9Okdaxl0OXGntY5JZkMo0FiZYDNCLWXRAdFG12esy8WzhYWQaGWLkvfVnY7qOv4FWWN5fTMHHAWrDpx5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCnfLBMWq6eO8uggeBktLlL4EcgYcIJ8a0cGTTul6Mo=;
 b=Tnx1TjYkX/kmFqEvQQi/PC1CEDTyrEsSDmKCxPGi8yvXKPt9OIJQLLZOLGRV66+bQs0hFS6Q9abtGsMRHMYX7B3NVrlubCEIsGTzSCbZaAXXOElpROICVLDv6LaJncVRYzSOmax81pxU2WPoazI76KtvwFxs6wtg0pbqIyjEsMs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:40:13 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 14:40:13 +0000
Message-ID: <87f5e445-9485-475a-ad17-d3a2a1c963a6@arm.com>
Date: Wed, 26 Mar 2025 14:40:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/8] drm/panthor: Add panthor perf ioctls
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-5-lukas.zapolskas@arm.com>
 <eqt4prsabmlacdbdepk47ef4nojjdlzrv3djqinfsphrfwgvp5@54d6ritzd2gu>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <eqt4prsabmlacdbdepk47ef4nojjdlzrv3djqinfsphrfwgvp5@54d6ritzd2gu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DB9PR08MB6425:EE_|AMS0EPF00000191:EE_|AM9PR08MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 7756408b-29c1-4a20-1809-08dd6c7423eb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UnpYQ2NBYiswYUt3ZHpTOFFQQ1pPYTluK2xqRVZyZ3lCK3RUVTluT3h5NldZ?=
 =?utf-8?B?ejFNTU5MWkdValNBQTFWck05SThzSHhkcVFUS3dnMkIzaEdWaWEybXFTV1hC?=
 =?utf-8?B?WW5YczUySVU0cTNJUEwySWxUbHZpbmdmWHhwMnRWSTB5aUhOU3J0OXRxVHo3?=
 =?utf-8?B?cEFvNTlWcVpuSVpvMVdySUVJd05JcXoxc3Z3bExFRitNYjFFYTdLQndvc3d4?=
 =?utf-8?B?YzdjbEpVazRZRFJrazlnalRvUldtOUFsdTRZdFNLMm9Ycm1VTXNZRHVPZTlN?=
 =?utf-8?B?RGY0dk5zQWU5c1VwRllWL0t6SFY0R3oyVUtYS2V3dGVJWW5GY2Y3V0lPN2V4?=
 =?utf-8?B?dzQ5TGoyczNVQzhMdlNZenpNYjZyVE1Fc0pPbkVURXhHaHlwZHFNbGpVUVY2?=
 =?utf-8?B?WUtWWElSamw4R01SaTQ4VTU4YkU2b2JIcUh2RGxGY1lyQUZoSTVZcVhGb1do?=
 =?utf-8?B?OFdwSFFuWTBSUzNERSs0N2xNdGh2ajV5d2pTbXZCS3FQNWdsTkpVVGhmdzZN?=
 =?utf-8?B?a0hMUkNrYXU5L2VwZ290bFhwL0E5OUtZemYwTkdaaTA2aE1WMkJEbGhuSVJ6?=
 =?utf-8?B?Qi9RbWlSdWl2U05YeHVEUHB6OUFYaTNoM2RHeG9UNnlZUVMvY3hDM0pDbmtO?=
 =?utf-8?B?K3RYVGltbC9laGFFckZnVEFMTzV6SXJZdDYzbjA5YlVCWDBSZlpJL2ZldmxP?=
 =?utf-8?B?RTFEQkV5M09IazhKam9jU1QvOE9WWnZNS3hjeHlLdkNoQXc0WmIzSDkzOVVZ?=
 =?utf-8?B?VTR6a3NhTkVNSVVvSGtuM1F3QTUwbjh6WHBOUWNaYlZEWHhqM2VLbThSVFBL?=
 =?utf-8?B?dHNIWHgwakdZRGxPSHpVRTM3bTRueVk2YUtPWkpkcUxka3hxTEI3OWQ0cUhY?=
 =?utf-8?B?OGwxVk1YM3J4d3VsRHRmZVh5LzhQUU1yeG5rU2hIS3lJQWZ4Q0lKWkZKWEkz?=
 =?utf-8?B?eFNuN2s4L0ZzN2tIaityUFRHbm5OWEh5WXk3WGJyeklZLzFzTGt1OWZaSm1E?=
 =?utf-8?B?TmE2T1lqSXRoUng5TlVHaWY5NVl3WXRtanl5Umw3TURlMmEzT1A0azN5SFBK?=
 =?utf-8?B?U1dheEVRVTZTZE8xQlVlZXg5N2g3cTNlQkkrVm4vTjdrc0xWWU1UNlhmODM5?=
 =?utf-8?B?VWltSG11aElQeWhaR3ZUWi9pM1FoUEtSeEJTRzBHTGU4aTloM25uR3ZXK2I4?=
 =?utf-8?B?QXA5akVHVzN5YWxpbkV5QzRKTVNxUFRGQUJmbktvNE1jdDAwTUxHaFhERmdJ?=
 =?utf-8?B?N0NhaVRKeS9rZlNmVjlMSnVob3RjalJqUjNqcEhBQjJPcUtOZWQ2YXVOTVNS?=
 =?utf-8?B?eVh3VVBnU0Zrckp4QnZIclZkZEN1UU5TYVA0bUNrRUh0S1ZObjU4ZVltMWJn?=
 =?utf-8?B?TXZwWEd4dURLZW4ySU0yRTZwM2RsUTlEV0wvTWpGb2JYTHQ1blJzdlNCZHEx?=
 =?utf-8?B?aThFRHFaOGg1QkxuK0lNZmhVYk1Tc2pKeGMxZUN4Z0wxL3Y2NFBLNGJrRzZ5?=
 =?utf-8?B?SUZ3SllXQ1phWVRLN0lVR054am0yblJZZk13dHU5L0RUTDFBaEk2azU5Nndx?=
 =?utf-8?B?bC96U2tuc2cvQTZqT2lzc3ZGTDFKRHpoOUVkZVcvTUErU3pqRUVhb2xHSWlt?=
 =?utf-8?B?WmhPTHMvc3QvZ2dZUVZSZDl4TUtPYUxvMUdBY0dtNDFlQytFcnRDb2N4bGVB?=
 =?utf-8?B?bklSbHBHU2kwTEYxY3FkR0Rlbm1yYUoyRFdTOWJYcWNMWXdZTUVYeHhXMUdO?=
 =?utf-8?B?TGZXTmFidDd5cGw3VEV5aVZFUXRMdlE0MHZWSlZnMnpuTFpuVWtCc3RsTmND?=
 =?utf-8?B?MUphcXZJYmh1c0M3bUUrZUpPNXdUT3lRQTdJaE0zUnZxMEpKVkdzYUY5cDRG?=
 =?utf-8?Q?RhtfbsRvDTC9P?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 52716010-6dba-4997-0ff0-08dd6c741dff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdjeVpYSmV0TGRHQkdPNVVyOSsxeHZsaHlJY1JqY21uWWg1NXErc08wdGRI?=
 =?utf-8?B?M2xnTTQ4d1BMTnhYYURCKzNoL1RMbHpiRzJOaFFQM1ladzM4azN1eHNmOXpR?=
 =?utf-8?B?VVhMdncybzRUVXhLWFhXaEplSmlLd0xGekJvekxsUEpzVVhNamVBWC9xRmhu?=
 =?utf-8?B?K3hnUUMwV3VRU1RkeEtCWlhPUi9iQ1pZRFhIcWpFUm4vRVpQc1FXZUJBOTJK?=
 =?utf-8?B?VFBaRDZPcXZtUGVOeW1HTklVWmdKeHRPUWJPMUc3b2NpdFJUcU1sYk84TTFt?=
 =?utf-8?B?NTRXam1nSCtWbENkY3R1Y1dseWlVNFZ3ZDVNSWs5L01ja2xRc1pUWHYrSDJG?=
 =?utf-8?B?c08yM0FXOURmWFo4cENYN0VibTZUd2RYSnBiS0QrcW5NTWQ2N1JwTzJJRG1q?=
 =?utf-8?B?dmZ5b3dEc0lLY3RFZkZOU1NpY3lsWm9yM3BqK1dnVXQyd3JDQThJOUlhaGJq?=
 =?utf-8?B?OEllVHpXNmlRaURTanN6NHpEcXpNdDJRdXE3MVMxMEhpQWxPWkRKZ3J6aUlO?=
 =?utf-8?B?OUgxZDVtR0ZTbEdqY1Y5NVdEQ2RzUHZWeVNaVlpNdDVQSkRPUkZ0MnBQNU5Y?=
 =?utf-8?B?WFRjZW9VZDFHNm5VSml1am5BOC8yd1ZaY0NqSWZFSUtoREt2eGp0VnlSWGk3?=
 =?utf-8?B?NE9qc0tud0hoNTZYRDNtQXF2bDNoNS95SDBDVE16N0N1Q1RraE1IU212VTd1?=
 =?utf-8?B?NG4zb01POHVpbElnUWRFUklNTGY3TC9oVCtTcmtSVHFlZDB4RVpGdmVDdWd2?=
 =?utf-8?B?RDFaUzJ0a2lJWnhaNzJBN3ZoYTNoRGNpSUtOQkhFUUlnZ2NBUEQ5MEdIYk1a?=
 =?utf-8?B?WlNPcGdURWx2eU4wNko2OThuU1VpeHdBYVIwLzk5RWdlaWRvaG1HTmtKZXE1?=
 =?utf-8?B?blU0N0h6cU1JekdhWkZXNXZsVXFlVGMyRm0xWjJrbVNpN1EyK1JWRExiQURV?=
 =?utf-8?B?SHduNWVzS2FuaVlITFJzdTlxcm0xZG1aUGpQWEtiOWsvMTJUcXpyRVJFMGpo?=
 =?utf-8?B?d3NuZG1BNmlFQUptT0JJeDR6V2VMbUl6QmdUNERqb1U2NE1pc2xFSW12ZlIw?=
 =?utf-8?B?QmFqWi9aTnU1cG9maU41VThkcFVnNjA0UHAzR21RSXBnaHlNcFB4cE9qYSt2?=
 =?utf-8?B?OE1uMHpYSUovaWROcFJpUnhZVUtIaS9iVmRiUEhJa1I5WFU1Z1FBUGNnOXp6?=
 =?utf-8?B?aStISDk2cjdDQkZBams0cm5WdHdpTUI1S0tDUUNNU0VFVGh1NnU1SXJ0TG1W?=
 =?utf-8?B?WElpWm40T0JQbVFSOWNBUWpYdUJ6MGp4TFliZDM1OURHa2U0eUp6bUFtL251?=
 =?utf-8?B?QjJ4bVYvaE1ZMHlCWitxa0hyRTJ0M29RNEplWEJlYVkxdTNPL0ZSeE5Dclpq?=
 =?utf-8?B?V0o1ZjVjR1RjekRHa2pxVzZTTDc2UWQwU2x3cldkYzBvaHc0clBQWmM3SkMy?=
 =?utf-8?B?cXJGeCt5bndxL2ZXMnBGK2w0SVp0SlJuQnMrMEQrZ3l4TkxRK1pSbWFhLzdn?=
 =?utf-8?B?OXVWancxOXpIUVZpVncxT3hDQlRkN0MvQW9GWUZKanVwT3doNzBlZU13VVBJ?=
 =?utf-8?B?TldPUDFOdzBNUVloWWo0bjFYemlTajlydm5BaFJEeklPRjFvMlNDbEtXR1hm?=
 =?utf-8?B?YktHY0pkcTMyRUpSRnBFUmlpazRjVUY0OWs5dHkrMFRTenlZbGptL1VXMEpx?=
 =?utf-8?B?R3VkeHc3cXlTQnExSnhZYnVCMUpQKzZRUXJKVktPRENOdmxKTHQ2NkRKTGpK?=
 =?utf-8?B?L3Bxb1hQUmlwN3NQaE4wSEdTZXhxSWlDUXhkU2R6UTdaMWpsdFdhOTJ1cmFt?=
 =?utf-8?B?cjYxNHFBYTc1WEJITkh3RnovN3h4elRidVovT1lmV2daTFBoTVlhWjBySU1h?=
 =?utf-8?B?TFpad1pUVWszblZRMllBSTNmdGQ3NGVTaVJPTVViVWk3bzJ5cVR2MGZGSGpl?=
 =?utf-8?B?QXpscnFmTGREK1JsT0xQdWFJeVlaNElVRHZuNGZ6YzRwdVFMcWJ0cmZBNU1X?=
 =?utf-8?Q?3LW+lrfV76dYVdG5cjig56ken1VVoM=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:40:23.0469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7756408b-29c1-4a20-1809-08dd6c7423eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6292
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



On 27/01/2025 14:06, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
>> a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
>> compatibility of the uAPI.
>>
>> Stub function definitions are added to ensure the patch builds on its own,
>> and will be removed later in the series.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c  | 155 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/panthor/panthor_perf.c |  34 ++++++
>>   drivers/gpu/drm/panthor/panthor_perf.h |  19 +++
>>   3 files changed, 206 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index e0ac3107c69e..458175f58b15 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -7,6 +7,7 @@
>>   #include <asm/arch_timer.h>
>>   #endif
>>   
>> +#include <linux/cleanup.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/of_platform.h>
>> @@ -31,6 +32,7 @@
>>   #include "panthor_gpu.h"
>>   #include "panthor_heap.h"
>>   #include "panthor_mmu.h"
>> +#include "panthor_perf.h"
>>   #include "panthor_regs.h"
>>   #include "panthor_sched.h"
>>   
>> @@ -73,6 +75,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
>>   	return 0;
>>   }
>>   
>> +/**
>> + * panthor_get_uobj() - Copy kernel object to user object.
>> + * @usr_ptr: Users pointer.
>> + * @usr_size: Size of the user object.
>> + * @min_size: Minimum size for this object.
>> + *
>> + * Helper automating kernel -> user object copies.
>> + *
>> + * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
>> + *
>> + * Return: valid pointer on success, an encoded error code otherwise.
>> + */
>> +static void*
>> +panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
>> +{
>> +	int ret;
>> +	void *out_alloc __free(kvfree) = NULL;
>> +
>> +	/* User size shouldn't be smaller than the minimal object size. */
>> +	if (usr_size < min_size)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	out_alloc = kvmalloc(min_size, GFP_KERNEL);
>> +	if (!out_alloc)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return_ptr(out_alloc);
>> +}
>> +
>>   /**
>>    * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
>>    * @in: The object array to copy.
>> @@ -176,8 +211,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
>> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
>> -
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
>>   
>>   /**
>>    * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
>> @@ -192,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>>   			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
>>   			 sizeof(_src_obj), &(_src_obj))
>>   
>> +/**
>> + * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
>> + * @_dest_ptr: Local varialbe
>> + * @_usr_size: Size of the user object.
>> + * @_usr_ptr: The pointer of the object in userspace.
>> + *
>> + * Return: Error code. See panthor_get_uobj().
>> + */
>> +#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
>> +	({ \
>> +		typeof(_dest_ptr) _tmp; \
>> +		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
>> +				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
>> +		if (!IS_ERR(_tmp)) \
>> +			_dest_ptr = _tmp; \
>> +		PTR_ERR_OR_ZERO(_tmp); \
>> +	})
>> +
>>   /**
>>    * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
>>    * object array.
>> @@ -1339,6 +1395,99 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>>   	return 0;
>>   }
>>   
>> +static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
>> +		struct drm_file *file)
>> +{
>> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>> +	struct panthor_file *pfile = file->driver_priv;
>> +	struct drm_panthor_perf_control *args = data;
>> +	int ret;
>> +
>> +	if (!args->pointer) {
>> +		switch (args->cmd) {
>> +		case DRM_PANTHOR_PERF_COMMAND_SETUP:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
>> +			args->size = 0;
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_START:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_start);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_STOP:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
>> +			return 0;
>> +
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	switch (args->cmd) {
>> +	case DRM_PANTHOR_PERF_COMMAND_SETUP:
>> +	{
>> +		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
>> +
>> +		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		if (setup_args->pad[0])
>> +			return -EINVAL;
>> +
>> +		ret = panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
> 
> Shouldn't we return the session id as an output param in setup_args or is the
> ioctl's return value enough for this?

Returning it via the ioctl return value has worked for a single session,
but it may have an impact when handling multiple sessions, not sure. Is
there anything done by DRM to normalize the return values from ioctls? I
could not find anything.

> 
>> +
>> +		return ret;
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
>> +	{
>> +		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_START:
>> +	{
>> +		struct drm_panthor_perf_cmd_start *start_args __free(kvfree) = NULL;
>> +
>> +		ret = PANTHOR_UOBJ_GET(start_args, args->size, args->pointer);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		return panthor_perf_session_start(pfile, ptdev->perf, args->handle,
>> +				start_args->user_data);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_STOP:
>> +	{
>> +		struct drm_panthor_perf_cmd_stop *stop_args __free(kvfree) = NULL;
>> +
>> +		ret = PANTHOR_UOBJ_GET(stop_args, args->size, args->pointer);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		return panthor_perf_session_stop(pfile, ptdev->perf, args->handle,
>> +				stop_args->user_data);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
>> +	{
>> +		struct drm_panthor_perf_cmd_sample *sample_args __free(kvfree) = NULL;
>> +
>> +		ret = PANTHOR_UOBJ_GET(sample_args, args->size, args->pointer);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		return panthor_perf_session_sample(pfile, ptdev->perf, args->handle,
>> +					sample_args->user_data);
>> +	}
> 
> For the three cases above, you could define a macro like:
> 
> #define perf_cmd(command)							\
> 	({								\
> 		struct drm_panthor_perf_cmd_##command * command##_args __free(kvfree) = NULL; \
> 									\
> 		ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
> 		if (ret)						\
> 			return -EINVAL;					\
> 		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, command##_args->user_data); \
> 	})
> 
> 	and then do 'perf_cmd(command);' inside each one of them
> 
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>>   static int
>>   panthor_open(struct drm_device *ddev, struct drm_file *file)
>>   {
>> @@ -1386,6 +1535,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>>   
>>   	panthor_group_pool_destroy(pfile);
>>   	panthor_vm_pool_destroy(pfile);
>> +	panthor_perf_session_destroy(pfile, pfile->ptdev->perf);
> 
> I would perhaps do this first because pools are first created during file
> opening, just to undo things in the opposite sequence.
>>   
>>   	kfree(pfile);
>>   	module_put(THIS_MODULE);
>> @@ -1408,6 +1558,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>>   	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>>   	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>>   	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>> +	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
>>   };
>>   
>>   static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index e0dc6c4b0cf1..6498279ec036 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -63,6 +63,40 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>>   	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>>   }
>>   
>> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> +		struct drm_panthor_perf_cmd_setup *setup_args,
>> +		struct panthor_file *pfile)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +		return -EOPNOTSUPP;
>> +}
>> +
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	return -EOPNOTSUPP;
>> +
>> +}
>> +
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
>> +
>>   /**
>>    * panthor_perf_init - Initialize the performance counter subsystem.
>>    * @ptdev: Panthor device
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index 90af8b18358c..bfef8874068b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -5,11 +5,30 @@
>>   #ifndef __PANTHOR_PERF_H__
>>   #define __PANTHOR_PERF_H__
>>   
>> +#include <linux/types.h>
>> +
>> +struct drm_gem_object;
>> +struct drm_panthor_perf_cmd_setup;
>>   struct panthor_device;
>> +struct panthor_file;
>> +struct panthor_perf;
>>   
>>   void panthor_perf_info_init(struct panthor_device *ptdev);
>>   
>>   int panthor_perf_init(struct panthor_device *ptdev);
>>   void panthor_perf_unplug(struct panthor_device *ptdev);
>>   
>> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> +		struct drm_panthor_perf_cmd_setup *setup_args,
>> +		struct panthor_file *pfile);
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid);
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>> +
>>   #endif /* __PANTHOR_PERF_H__ */
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

