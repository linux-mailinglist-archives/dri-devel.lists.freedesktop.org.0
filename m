Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B18CAF7CE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 10:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CA410E4EC;
	Tue,  9 Dec 2025 09:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HxKH82K2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HxKH82K2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8AA10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 09:43:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I7DFkqA0LlIvLZ66KMrxQuJUA0fIulnacdNToqnuNvGb6a2TTp3SbLgpDQIHC73rpL4hdKxbQ1BRaXGOLNGeYgVxNnXQi7kumUV1dsr7/cryZ1x6odsv5BhhKYqu/129oezbeRfmEH/BOnATUr42Pyr5MjyMUZT32AOblySdq5Elpz1O6RB3DR3Df1feuzSuAym4K7h3hSk4lmQ1ZlxQN1XV2r9x5ruMBdE9TsIkwD9XAsZK73F+xSLWyZZl4WqvPiKkLGxUsyCI5VNKOAGRm9XDee7CZwc3sXW7cwz8lHrJlJ7yeW72ySUa3WwFiq08RdNJYLcUiMrfjQwgs6eYiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJUby7dd18jnCkJHrDAEKjoaPvJhye2cglT4OoBSylc=;
 b=BVD4cgSN4MVGVF8hpSoO6aevTcOw2QKvXx2Jy0DplC6NvH02Y6YzfHvRnYXFWC07cs00uSbqKxUDz2YduBRczjql1gQFHUIsTpxCOYkWFVJhuGQzcKl0HW3n0E5mRtQKyoVhkUVreLRuD/Zgj3Ma1Loox9/CU+Ekn858Qd7BVe9dhbsZoEvkIpaWPDk7FyBKJwwyBwsuRyBsEHsi2Ec7kiElJ9bNxE+hI89jhy5BjoUk+168nXJgtap+bRM0lrrozCYVA+ABwZvkUKro5Ej+eiC0loCN7Bc5OBzaBe9T69grAwYb5VY+qUeT564w2QBmnOPCIp0J6zuEmO/VUVeCAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJUby7dd18jnCkJHrDAEKjoaPvJhye2cglT4OoBSylc=;
 b=HxKH82K2fOYKp3o/BnObNodOA0V0h01JyJmfnWU/KpyemyuDOsiC//nCmtb2Pybm76jnfTz8ahDintr6miBN9W6BVcCm+iRDcSzxTYXpAXTDxJAgVkBGkkOwLWJvDPw/M1/rpecWxUkQ89nCBqNIJtZal7JPPplUdRK9Eco3ZeI=
Received: from DB9PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:1d9::11)
 by PAWPR08MB9781.eurprd08.prod.outlook.com (2603:10a6:102:2e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 09:43:13 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::7d) by DB9PR02CA0006.outlook.office365.com
 (2603:10a6:10:1d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 09:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Tue, 9 Dec 2025 09:43:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6zzw0uzSqcjdNRciJ0Cx2N/SYMnOBZhHnzynAqIufgZsoYyPUX2RHVjRD/8VXYLHMR5F/xXvG61eX+vCypw214C4Art+8/JUvohfxeV7o77bXd58Rx9q0E7Cb7bw8TbS4sgTcv2ohGN5Za4DOMrWTVGXZGw8rp+lxufFtu+HiUbZB8dVdLkoyN7zX5c7Ry0tuFGyG1Fw8qqXSY8raIVroTyhjy639tgeoUaggdQ67LdBju03KHTT2ApOkK4Wu1NPVyVxyPRt8tld0wpvJZzWZHXxpFpHgagl04vy6H1KyOSqptBagbGtd9DxO2Qc1WkqVHgHtEhbCSdA1rg72r/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJUby7dd18jnCkJHrDAEKjoaPvJhye2cglT4OoBSylc=;
 b=R60bLJ4WmA93gGXRp3KPDTMVdXkZSkoeuebP6oiaWTyAWCPnGczm+EdHWLamtqDbucxnmOoFhLnrEeGZy+Td+LObKoLbP+rVJmGZiSWs3kX+DKdikFEyfGTAY2/gbVjkEKWg6VX+Cuw+EpJjYedF1P448nww3+7/p5pos+qtM2fFkzCCgv4ZCseYUuIIX4f2NN/sju4o639NZEjnnDyXlR53I6VlAP1/lLA9BXVmaIADRmuANQ3CjClyZCyxN61cfATuSeyGFijFy0LM6abjEwowaGKMtR5QxcCcA3a8YoB9D7kOhiVRfNvobEmQddv1gzMpKRtuyTjLgNokwdOTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJUby7dd18jnCkJHrDAEKjoaPvJhye2cglT4OoBSylc=;
 b=HxKH82K2fOYKp3o/BnObNodOA0V0h01JyJmfnWU/KpyemyuDOsiC//nCmtb2Pybm76jnfTz8ahDintr6miBN9W6BVcCm+iRDcSzxTYXpAXTDxJAgVkBGkkOwLWJvDPw/M1/rpecWxUkQ89nCBqNIJtZal7JPPplUdRK9Eco3ZeI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBBPR08MB10462.eurprd08.prod.outlook.com
 (2603:10a6:10:539::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 09:42:08 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 09:42:08 +0000
Message-ID: <a2e26cb9-bb3c-4bd9-953b-b85af495b936@arm.com>
Date: Tue, 9 Dec 2025 09:42:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/13] drm/panthor: Expose the selected coherency
 protocol to the UMD
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
 <20251208100841.730527-4-boris.brezillon@collabora.com>
In-Reply-To: <20251208100841.730527-4-boris.brezillon@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0043.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBBPR08MB10462:EE_|DU6PEPF0000952A:EE_|PAWPR08MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de8c4ba-d7af-47a8-c629-08de37075ecb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZUNWWjlhWHJhazlZS004ckVOTktvbDBuRGxSWnN4eWdRaVBwTGtOVUtyQ1NF?=
 =?utf-8?B?SFNJdjhtL3FYdWpJWUoxVkR0YThMNnZCRkdjNDRhOFBmOE9OQklHZHNCUkd4?=
 =?utf-8?B?dGwzVTExbWFiWXVndURZMzRLM3NYcFBKKzdIc0pGSU1IcDdpQkM0bFlqMGRR?=
 =?utf-8?B?b3RFc3dzc3kyYmVoR3FSSGVQUURjaDgrVVQvYkJ6WjFkc2l4U29QdlI3dGtO?=
 =?utf-8?B?TEpQTmFTZUw0QzBvRWw1MEFqOHJMYmpESXhoNVlhdnhrQ0s2UHV3a2N4N2pr?=
 =?utf-8?B?dlR4TzRkcE0vQjZoUjFrQjdVTG1oeGtZazNrQms4NllIeTlFVDZUVEhGSkNW?=
 =?utf-8?B?YjlUTnl6K3V6QmJZeS8rTXpFNnhOclRaanlFTFk0QUJpZnpBbXk2QUtDZGFN?=
 =?utf-8?B?VkJaMTFjQVRTc1JBUk1jejN2WDJJenRCQkh4ZFNiZmx2MWppUG54eklmR2c5?=
 =?utf-8?B?WmVYdTN0OGVXNVM2NXhsNmhOdmd2YldnbHFGNzZXLzVHUy9vaGhOQ0RQMkpt?=
 =?utf-8?B?WkNWMUxtb0hKTTU5TzZEb3FDU1dsTVVxeVB1ZkNGTndsaVBLQkUvUmhPUUJv?=
 =?utf-8?B?b2xZbnoveW0xL01zRFJObENKeGlBZlNaQXh5V1o0ZThodFRTdHIxQzAycktt?=
 =?utf-8?B?dzlBZVJWOVdoSGRjRDRnM2xPZzBiSGVZZk9BVXFNUEhRcFlsYmluQnJCcjJM?=
 =?utf-8?B?TDJhY1lpSVZRRDY4K0JSN0dEN3hKUG9EK25DNHgwclBSTmxGMy9XV29nSGxY?=
 =?utf-8?B?NHAwek9KQlpPZEJNeVRCTWZ5Z2IxVlJQT2NFRGtaNDZWaHRZUlpydkpLZDdv?=
 =?utf-8?B?Qkt0YVVOMlR6blp0WUlBdmtNRko4c3RITFIvREFQRUpFMXM3aE05WWFCQ0lY?=
 =?utf-8?B?M01UTEEwWjJsNzRXNElMa3JhQlh6bkZ6UDIxRkxUMFlkQjN5SldhdTZ6azlh?=
 =?utf-8?B?OC8relN2ZWJnQTloQUpLcC9YYzYyeHVKaFExUWFFZ0huWE94NkJ0RWtrR0Y0?=
 =?utf-8?B?NU9aRFVxK1NtL2tGNVdoN3ZKejdlZk9IUU9SbU1nVFBKS1QrYXpmYlhkQVdT?=
 =?utf-8?B?ejFWR0RuaHczYk5Yd3lCTHEvU3ovb1ZQZSs3U014dGdzeU9KTXZKSjZ4eU5V?=
 =?utf-8?B?NkhHSlpUMEdFOXhkbTVRZHlCcDNZWi9UcDZZNk9BU3VyQ3FqL1YzcHM3Ui8v?=
 =?utf-8?B?QWZoNm80SzhucGhlMlBGeStQc3VSYTVWYy9nanl1TEMreFhYMGVseFJNRW5D?=
 =?utf-8?B?RUh6WlUyMGVtY2J3b2ZUcGRJUEFUYjNNQ0Z3Y0VCUzc4bFNibEw1N3Bjc1Rk?=
 =?utf-8?B?czBLU0VJWjFoQTBPWjNob1BDc1Q2ZUFxZHdhWEpuYlV4c1N3dDVFdGJjVkln?=
 =?utf-8?B?NGZYRDVrbjhHRnYwUCtHcWVrTW5jaWpWZ2NxeTRYTHppb3A5N3VyT1VvTm1j?=
 =?utf-8?B?cWo5VjlZR0dGM2U3N0VkMTIyZXN0elNVdEYzemNlcGplNlo5N1phVVQrSWtp?=
 =?utf-8?B?Sm9HTlZEZDJkYjQ2bm5nWFJTRnRCM3RTQll2RTRna2tUMmU1UFBUenBidHlj?=
 =?utf-8?B?UVJibTlFcGFaNWx1THEweDJEYjhpMVdOS3RESWxaMlFGL0tHSkZNNHdkOExr?=
 =?utf-8?B?aXRnZWk2Z05iQlowRzBSaktiYTcrWUhPMVdwMmRkbHFYbmVkaDYzc3pRMlNB?=
 =?utf-8?B?U2RwdmNML3BsNDI3cmdBTm5SKy84MDFTSWJCaEJxTzRhdTdwb210dlFJMk5W?=
 =?utf-8?B?aEM5R2NJcnp4THowaTFEQi9ud2lYb3JGbFNscTVMeVl0STR4OHhpQ3hSWG1P?=
 =?utf-8?B?OVg1clBEaXhIRjBaWVN4QTFOL0s5SXN6UU5Ib2k1bUxFLzZqaERpdWRvTXFF?=
 =?utf-8?B?YXB5Yy9nUzdsNTVKd0M4emxjUGRFak92MGEvWFZhM3VSTXNFNlR6bWZKUXB5?=
 =?utf-8?Q?J08zMbc7LiQ2wx8Ek0fILXPDANz7RzH1?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10462
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 36675044-a6d0-42ec-82af-08de37073810
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|35042699022|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUx5NEpIWGRMZStIakZvdFZBSDFDTzR1UE1lOEU0MVJNRHNLWTNQZ3JaQ1VU?=
 =?utf-8?B?TlBrNnZ3QlF3OHRXQzZyb3UwNjFCT1pCNWI0OHpKM2hEd2lHLzJSdDJTWFBn?=
 =?utf-8?B?aUd2cWFPb0tvRjRKOVFZSWhhMmdFcXM4Q3ErZFZnTnFZejFTT1RLR3RyVndJ?=
 =?utf-8?B?c2FqYWJuSTFYYzNZQ0pFOG1Yb3VSQ0NGUDBJbjBOVmlJb2pUOVJFemhocmwv?=
 =?utf-8?B?cjRzTkdqSWwrVVk5ZVlYeEYvSTVvUGhZeVlvYUNIR3paN0NIVDA5MStvVTl5?=
 =?utf-8?B?Q1E1T1hsSUNUTEppS28zUTl2VGpKWXRYeTlwQWprcCtNMjFnTzVKVnUvanZo?=
 =?utf-8?B?NkxYMnQ3dngxRWcwRVlUdUY2WDlsdEg1S0tkbHFPRlczdUtYRkluOUdGY2h2?=
 =?utf-8?B?aWs1SUJZbUQvbm90VjZmclE3YXhtSE1oNmZNU3kyRFpobVlrUXBxdTE4Rk9H?=
 =?utf-8?B?NmQ4bUtKejg3VDdXLzlGeHhQcm5rM1FNdW02dnNnQzRXaWxid203SzVGcHhY?=
 =?utf-8?B?WFp6RzlwL0dCQzk5M3M3NVhlZDJ6VUNxeWl1bGxZWFRibG1PQnFlTE5PbmRQ?=
 =?utf-8?B?eVZhTEQ5MlU4ZjE5THFMZWpwbXV6TkRQWmQ3ODdaOTVhTDR4aU92MEhTbWgr?=
 =?utf-8?B?bnNpSFM1UFFBYUlyNWllRjNVYnBlUnQvY0RtRUl4c01ubnVUSjB4L1NYa0VP?=
 =?utf-8?B?MWtSMzVGbXhWV0NGODhyWThBeUpPWWZady9jT3JmUC9vb0tTWWlXZWo5ZnFP?=
 =?utf-8?B?OHJ1SVphTXdMSS9Na0NsbTVaVithaVdjandhaGI2cWc5M1hwc3JNaFFYR2Jk?=
 =?utf-8?B?Nlk2Y1FOaHhoT1o4TFhNOFhuVmNpdHh4ZVQwVGVHTVFKTlU4ZzVqMUF0MlNV?=
 =?utf-8?B?MlFodS9lYmtJK1IzNlNlVzdQRVkrSFdXUjgyUXMrdXRsazY0QzYyckVuTndX?=
 =?utf-8?B?dm9xSXVpdnJSSGV3WEhDaWRPM2ZpVnlyaHN2emo3SjhwVk9hRG11SXFXekRD?=
 =?utf-8?B?Ry9FR3FCMGdNU0p6LzdHRU95OGQyZWk4Q0lxbkVmU3Z0LzFtNVdFWXhTbHVM?=
 =?utf-8?B?YU9Sa3NzSHFuNEdFY24zSlNGeDBqQmdOVkZKaGtjVDY2NDRtOGVvcC9jckg1?=
 =?utf-8?B?UmpiZUpiQkFVTmxNVjljbkxnWWx3bURoUFNrZElPanJaNUNENEtQNWVPZ2Zo?=
 =?utf-8?B?bThWQi9kcGowaW5MVWFLRWl5c3RRakZ1ZWZIWUpaU0d4ZVpCQ3MwNnFhZG1h?=
 =?utf-8?B?R20rWGcrdTNqSTM0MXdGQnBnMFRwVlp2RTdxSjVydk9NUEUzQ1RtWXkzZERC?=
 =?utf-8?B?amdzdnRQcHVnTmJseC9HMVdWMTVXeUtBM3VLaEVwVnltakJCVFJQYUVuT0di?=
 =?utf-8?B?eGtHZXNMSXpBR0NXVGMvb3R2MUpMWDhLcEJROG5jamJkc3BWekFTelVFdjJY?=
 =?utf-8?B?bW9ibHMyUzhnNVVpMkNOU3FxV0tHSXNKYkRBZ0laeWxzT09Jb1FJRVFkZG1Z?=
 =?utf-8?B?S1g2K2s2QkM4YUpmUmtjRXhNSU8wemRiRVRpblZSTWU0ZWlFS2hkYWhwenNs?=
 =?utf-8?B?TnFTN2UxZmNGaEFhd1hjU2tBR0RubXhjaWttSFhYUWhaTlRrYkNoYVpNUHdP?=
 =?utf-8?B?TFBxTnphdlpvRUY5NDhQZ2VWc3RzRTJFWE5sZkpTVTVvblNwRnlkSVBxOFNQ?=
 =?utf-8?B?T1BYUm1ZcjhpT1F6VWtlcitGSVFJYi84ZHV1SlVPbkhJQXdic1BzSmxWeTRZ?=
 =?utf-8?B?dVZmRGpLQThRRXB6N0NKSXBLUTdLREphVk9BZVFvQkd0Y252ODVaTXI2UkNS?=
 =?utf-8?B?c2lUMUlhTURtbHVCaStHTEV3Qm5YVnlFejg1ZVVNVzVTWnluYndGckZZTUpJ?=
 =?utf-8?B?NnRkaXRBZUl1QzNEM0FzUllMVk5xTW4ydWliUHlka01YcDdoS1lNYk5GWjB4?=
 =?utf-8?B?ZUFYS3hEN0ZzV3pUUXBoSUZ0SWlYTmZCd2hZWWNjYTJyWTVpSzY0MEdGVGdE?=
 =?utf-8?B?RmRjbSttaXZKM2VqUGgzRkJtWnp5SzRuWmVaTnBCTkkzTkR0S2pMakxXYjFZ?=
 =?utf-8?B?RmZwdUkwbmhWSFFFbTBabjFDY0RZYmZRd2tYQkJXRUZBcTBhYk40Qkw3VFFB?=
 =?utf-8?Q?Qa9I=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(35042699022)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:43:12.6777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de8c4ba-d7af-47a8-c629-08de37075ecb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9781
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

On 08/12/2025 10:08, Boris Brezillon wrote:
> If we want to be able to skip CPU cache maintenance operations on
> CPU-cached mappings, the UMD needs to know the kind of coherency
> in place. Add a field to drm_panthor_gpu_info to do that. We can re-use
> a padding field for that since this object is write-only from the
> KMD perspective, and the UMD should just ignore it.
>
> v2:
> - New commit
>
> v3:
> - Make coherency protocol a real enum, not a bitmask
> - Add BUILD_BUG_ON()s to make sure the values in panthor_regs.h and
>   those exposed through the uAPI match
>
> v4:
> - Add Steve's R-b
>
> v5:
> - No changes
>
> v6:
> - No changes
>
> v7:
> - Fix kernel doc
>
> v8:
> - No changes
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 10 +++++-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
>  include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
>  3 files changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index e133b1e0ad6d..a66fc66999c2 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -27,6 +27,12 @@
>
>  static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  {
> +     BUILD_BUG_ON(GPU_COHERENCY_NONE !=3D DRM_PANTHOR_GPU_COHERENCY_NONE=
);
> +     BUILD_BUG_ON(GPU_COHERENCY_ACE_LITE !=3D DRM_PANTHOR_GPU_COHERENCY_=
ACE_LITE);
> +     BUILD_BUG_ON(GPU_COHERENCY_ACE !=3D DRM_PANTHOR_GPU_COHERENCY_ACE);
> +
> +     /* Start with no coherency, and update it if the device is flagged =
coherent. */
> +     ptdev->gpu_info.selected_coherency =3D GPU_COHERENCY_NONE;
>       ptdev->coherent =3D device_get_dma_attr(ptdev->base.dev) =3D=3D DEV=
_DMA_COHERENT;
>
>       if (!ptdev->coherent)
> @@ -36,8 +42,10 @@ static int panthor_gpu_coherency_init(struct panthor_d=
evice *ptdev)
>        * ACE protocol has never been supported for command stream fronten=
d GPUs.
>        */
>       if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> -                   GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +                   GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
> +             ptdev->gpu_info.selected_coherency =3D GPU_COHERENCY_ACE_LI=
TE;
>               return 0;
> +     }
>
>       drm_err(&ptdev->base, "Coherency not supported by the device");
>       return -ENOTSUPP;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/pant=
hor/panthor_gpu.c
> index ff5231269518..057e167468d0 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -51,7 +51,7 @@ struct panthor_gpu {
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>       gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -               ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_=
NONE);
> +               ptdev->gpu_info.selected_coherency);
>  }
>
>  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index 467d365ed7ba..28cf9e878db6 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -245,6 +245,26 @@ enum drm_panthor_dev_query_type {
>       DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>  };
>
> +/**
> + * enum drm_panthor_gpu_coherency: Type of GPU coherency
> + */
> +enum drm_panthor_gpu_coherency {
> +     /**
> +      * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
> +      */
> +     DRM_PANTHOR_GPU_COHERENCY_ACE_LITE =3D 0,
> +
> +     /**
> +      * @DRM_PANTHOR_GPU_COHERENCY_ACE: ACE coherency.
> +      */
> +     DRM_PANTHOR_GPU_COHERENCY_ACE =3D 1,
> +
> +     /**
> +      * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
> +      */
> +     DRM_PANTHOR_GPU_COHERENCY_NONE =3D 31,
> +};
> +
>  /**
>   * struct drm_panthor_gpu_info - GPU information
>   *
> @@ -301,7 +321,16 @@ struct drm_panthor_gpu_info {
>        */
>       __u32 thread_max_barrier_size;
>
> -     /** @coherency_features: Coherency features. */
> +     /**
> +      * @coherency_features: Coherency features.
> +      *
> +      * Combination of drm_panthor_gpu_coherency flags.
> +      *
> +      * Note that this is just what the coherency protocols supported by=
 the
> +      * GPU, but the actual coherency in place depends on the SoC
> +      * integration and is reflected by
> +      * drm_panthor_gpu_info::selected_coherency.
> +      */
>       __u32 coherency_features;
>
>       /** @texture_features: Texture features. */
> @@ -310,8 +339,12 @@ struct drm_panthor_gpu_info {
>       /** @as_present: Bitmask encoding the number of address-space expos=
ed by the MMU. */
>       __u32 as_present;
>
> -     /** @pad0: MBZ. */
> -     __u32 pad0;
> +     /**
> +      * @select_coherency: Coherency selected for this device.
> +      *
> +      * One of drm_panthor_gpu_coherency.
> +      */
> +     __u32 selected_coherency;
>
>       /** @shader_present: Bitmask encoding the shader cores exposed by t=
he GPU. */
>       __u64 shader_present;

Reviewed-by: Karunika Choo <karunika.choo@arm.com>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
