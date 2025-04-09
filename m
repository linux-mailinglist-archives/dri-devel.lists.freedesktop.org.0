Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E8A82584
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5010E039;
	Wed,  9 Apr 2025 13:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="DdObzhBm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DdObzhBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958C10E886
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:01:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X2gqY7bjURcx+EHcEy32z6S3MKL3KzH2kt+7YPSCRBroDmYyyOWerdMJG+vYjmVNC2KmKfK1jAVrMqiGlZP7ogF8z0GqM+idgM9p+8FOwUL/K8ljJ+RXM/3xEbjXEOX5PccZ3NXAYCdRqZjJ5NCAZPiq0KuWex1PaB6BvGHeQvicajJYCjPTZAmt9rRw9EFMSzZVOoxbTwVyKErvH0XxX790/5LGXD517ZZO0R9fs6Vp7b72oihamYsV2ydSaNGCxt8JGfZCKn+QEQqfbB44qPNbHkIw5EPDeQXqFI86FeKQrT6R8wEoj+xLfBrUxaH0uhcwwT5p1fnFWuTAcgmFMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=NCwl29JtMme5qDCV7guFEPnCMH5d5H4joqF8gf62itEcw78+6w5PzTfcUcCzpkB77wq/B1EVIbNJ/5kLMyzcPySekNA0MsFF8MS92OjoiZHCaBKT28EiF64wBceHcBAyuopcCH4ibTFuqtKNA0DyO1nlglMuwfliyXNuHE/K6xg37JwNKR7yxQ4CskydOCLxcnNyuoPwyov0ycFgOP71SYKmgjkdyQyMUcEC946dkGhTB+Y7qq8BAtv/7ekxQUJr98bn/dfOqVATN3C7qDjKZbrwjA4O9FxdiOFB7W5D5X5UTIqFVyWNQaNLwO62KKL4UMNxaxjdluh1pugbGEn29w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=DdObzhBmQDfwJ9naVHFzhK0YtIqMhibtbzoJRQdQyfAPdoB5cUUYEy36hHY0nLHJhWq/FqUflFs/zjye/MT2V6QCa2D2R4GzTd5SWXffzoGQT0NULF4+i/QrvuISdFoH/KqMS7reMmpwQO3r8tTz9a0rGoXDhdZhhGoTw0i/dmE=
Received: from AS4P195CA0051.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::17)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 13:01:08 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:65a:cafe::37) by AS4P195CA0051.outlook.office365.com
 (2603:10a6:20b:65a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 13:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 13:01:07 +0000
Received: ("Tessian outbound f9fef7c7dc50:v605");
 Wed, 09 Apr 2025 13:01:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9576ba688fa7dded
X-TessianGatewayMetadata: H7beHD+xZNPQ3vLT8S+E876puQAtKSuL045yB+CUMfeTnM6ZnLYTZ+qlH7+GO6oxR6V1fp8MtEcguf+lLRj7hDlINw1mAqJi00zIokUanv2bY62VkKNWFlHFDeIWGWTt04pZ9UslP+ESwBYxAPcgRVztSOnCvMQ0GYV4UtMDPDQ=
X-CR-MTA-TID: 64aa7808
Received: from L867b2692dca8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC9A3ABF-1D35-424E-A0C2-B645D32872A0.1; 
 Wed, 09 Apr 2025 13:01:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L867b2692dca8.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Apr 2025 13:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/ddyp3NwWGqPNobf4YTCcdcbSbxvmyBkb18rmk8nJOLgkKKx+Ob7PaqKb6oQe9CpiBN0eg3Y2g9OmMhSyWp5SvemNxX1q5vpg6QVt3a15qs3iifWnLu4A5Du4niY3v+Od3tu8+kkrpFHI7eSjwZ6kHalHK7ukhdiuioXBXr0iLb+OWGaIjSa8GBSmp0Qup8mWmIhGW7FxMqXRQgNTFz6fGy22f89WGKMOVWtr3OA1OjO30jWVJ8N4KvamjaRr6fOEbb5oJVQxFiizYwI1ZctJS7887MhUaHk+QObesAOTABRfjFZXn7QPtQQw+aSrg7OF7p+Mt9EcSMEj4mtgEREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=OqUOMq4/dcqCl5ZnlOwikIQ2v+p9acv1bUDdqRGt9uhFM/DPy636/SbKbr+uuoB2lx1ooSU8Q6xxWN2rdaAigoDuMwyiEAhWCR4Nrxqfz283pmB8jV7EbqmVSc374591fmNDBpWhIbTu8Ra1QGmKSSQwr54rkBFgpKTzeOZY2KC0FCToIZXuY7lKEYjnjMeUw5FPDBYQUcergM+AQc8SbpSZTjZLE64qgNeoeoB2LH9IvSHTx//J2YgANasod4/lpSnUtB+EwBEQxj2oNF3CUqeYXZIcPAudRQL4ImdfiDYzB/gtQzwiaGXWs+ZZdC6h+6o73BKZ6lKUYB7Wmv72VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=DdObzhBmQDfwJ9naVHFzhK0YtIqMhibtbzoJRQdQyfAPdoB5cUUYEy36hHY0nLHJhWq/FqUflFs/zjye/MT2V6QCa2D2R4GzTd5SWXffzoGQT0NULF4+i/QrvuISdFoH/KqMS7reMmpwQO3r8tTz9a0rGoXDhdZhhGoTw0i/dmE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6594.eurprd08.prod.outlook.com
 (2603:10a6:20b:36a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:00:58 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:00:57 +0000
Message-ID: <d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
Date: Wed, 9 Apr 2025 14:00:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/panthor: Add 64-bit and poll register accessors
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-2-karunika.choo@arm.com>
 <20250321084809.5f217049@collabora.com>
In-Reply-To: <20250321084809.5f217049@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM8PR08MB6594:EE_|AM1PEPF000252DF:EE_|VI1PR08MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc8dcd5-e335-4034-467f-08dd776697db
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VExHTVNKTndRYmlRUU1GY3JiT2ZkNm4xZjdkajBVcGp4ZUVGZ3pQa2hJa1RT?=
 =?utf-8?B?WlNmWHBCL2xNWXhzZEY3cWN2RllKSjdyemxkR2FQODRxbnlkdlcyeTRJaThT?=
 =?utf-8?B?SCtsYmFpU2pQdmVJTUg0d0tGZm8yVVlPSFY2STN1T0hKSCs0Sm9OamFMeUxY?=
 =?utf-8?B?T2N2cTdteXlTUUFqVVpuRTIrUjhCaWhDTnNValhjNFRxbHMxb1dJRjl3M1Av?=
 =?utf-8?B?bVlQYnhzMnV5UXU5MUdjZWZsRUZrQXBheXFWK2xsR2Q4dmlveFQ1bENFTFpN?=
 =?utf-8?B?d1NIaUF2bHdWc1JNWkxlb1g3SzhodTNwWjFIZFd3UVJ2VnZ3WGVLMUNpZmsz?=
 =?utf-8?B?bkdDcnMxRkRYMGRiTW1pMjJHeHU1QW9hd2xLc2haZHgvQ1FycWVnQXhZdkR2?=
 =?utf-8?B?aGZKMHR6c2ViT0ZhWWw1cjd0MVJQcmpPVnJsTERONGsxbzVOajFWUis2b2kz?=
 =?utf-8?B?ZVhNVklMbU9vMU9JZEZrMVpkbHRHNi9tMTRUam15dnRsNzR3aHVCNVdyK3Jz?=
 =?utf-8?B?bHJiSzlpTUhYajdHRHVPUkRxa1phL0llc0REZTd5aEdtaE5oTThrYi9SaFRF?=
 =?utf-8?B?MWpNY3Bac29WSEFqUHgyT3dPZUcwUE9zZnJwT0NQZEJiRXVidjRLejRTZmlm?=
 =?utf-8?B?SVhKTGJHWjlRVTlrRCtqNTVrN3ZQaFVkQk9hQi9NRWlWVzI3ay9LZ1lOcGlX?=
 =?utf-8?B?OGJLM3ZTRVRBZi95alQ5dTFSbytqbzBna3hwTXVqU05pRi9YTVRKSFZGZHdJ?=
 =?utf-8?B?SUhrNTJwY0RVSXNxeE1EWkpuOVVJUy9jZFJmNWh1Mm91alZwMStYeEQyM3g0?=
 =?utf-8?B?b2MwdFU0ZkExMEo2QUpVZE1zTGIvU2FhdWhpYnlMbGRkaUw4d3BQS1Rhb3Nr?=
 =?utf-8?B?RktYOWorWVRmeWFqVDkxQS9UR1FjT3ptYXQrcmNnMjQwQ0IrQkRULzlJK0JF?=
 =?utf-8?B?azVEYUswclVEV085L1lJNDFadlByM2N6WXhQTzQzOGJPUTRvZG10UkZQVDlm?=
 =?utf-8?B?UlN5YXVqRDd3TXJpanVGdXBxVHk3aWtIUVY3VnJVMGtqMmlPU2h5K25JeHhN?=
 =?utf-8?B?Tk5RVWRQSlErcEcwblZseE9IcWlMQzVEb0VkWHdPMDZaTDFISVdpdU45M2Fo?=
 =?utf-8?B?L1NYS1JSalo3L1NwaXNuVHc1R2Q1WkFPT1FONklkVWhVcklxMVVYRVhUMURQ?=
 =?utf-8?B?bElOaEhYYWlOLy9KcXFCODNXSkYxOFhVVldhdDNydi92MllWaFhma3BzUnov?=
 =?utf-8?B?c1NOSmxpcDJ6YklFQ1hqc3ZSSkdtUEtZK1N1VndRaHJ6Zkd5aWtVdDVzK0pl?=
 =?utf-8?B?ZGU0N2JySENqZ1RUUDZ1M2RUdXdlM203YVFqOEgxRm1nclFZYTRIVXY0Q3ZM?=
 =?utf-8?B?bUEzbmE2MGtaUkUyWHhwN0JoUkpBVXJOU3EvNDNNQ3Jac1RmODQ2eCtLS3A2?=
 =?utf-8?B?SHpzTUZ6K21VZUxNNnQ3d1N6RWQxZHRueWhsWkhUQzNQaW5FUEZ1dlBxS1BF?=
 =?utf-8?B?Mk9VaGVqMWtMT2xiby9FMGtFem5xRTJwd1pZUThJdFBEZGQ4eDJXajgzdjNs?=
 =?utf-8?B?QWRiK09HRzcvRTI4a3JkdUxJVVYyUFlhYmRSWW15ZEFlcGI4ZVhjRWZWQzRM?=
 =?utf-8?B?OExlS1U3OGJyTHUzaHlBRlh1bklra0JyNFhDUm03QldtWDAzZlpud2VGQks1?=
 =?utf-8?B?a0FpNStDaFlQSHRqeG9HWitzNmZ5M2V0akFXbVVvT2hHRjBwdWJFWXk4ODc0?=
 =?utf-8?B?RmN5QTlGUHZ4VlhKOWVNeTJqNHU3d0JXR1hVcjl4MjduNFVuTm5mQnpEQTBt?=
 =?utf-8?B?aFRDMVY4WDJuS25xOU5pSjJmd0tBSkM2MXFSSmhUN2lLbmMwT016L0pYam5w?=
 =?utf-8?Q?9Uq59/nB7V+nT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5bdce8b6-1e70-4732-7684-08dd776691ac
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFVrYWF4dndlZTlvMXAyaFkwMUp1RHpxWUdnNTB0UU8vcHo2eXBHWi9FdTJS?=
 =?utf-8?B?Tzg2a0Nya1BCMmJsZEttaEl1dmUzcExlWHpGNTVsU0ZMQ3ZZZmladURkQW5h?=
 =?utf-8?B?U0JqcXY2MHBKZXpacytMT1R1cEF5S1pKTjExTmljQVEyZVlvTDhIa2ROeDZF?=
 =?utf-8?B?OHJDYVJiM3NEY1k4ZEdLQVhHWndBV0RhNnlDbG1FdFlaTVQ3cklOZkpxKzV3?=
 =?utf-8?B?aVBWSDVNSzRTUFN3L0s1cElnbFdGdzdMeHgwcVVWSWIzVEpQdmR1K0hQZHRB?=
 =?utf-8?B?UUdabk13ZEQwTWM1ZFYrTDdaWUxPaWJZRTljanhFeXQ5NFdRU0JTMkVQUWx0?=
 =?utf-8?B?eksrWi8rS2IvZUljdVpiK0dWRHE1NWk4UFRuaDNlRG11dHVhc3NHbjVKbGw1?=
 =?utf-8?B?aGFDd3RVY2ZMTUpiUW16VTZRUTA1MFdwRTdiNVJ0SXczaVR6RE9ESlFKSDlW?=
 =?utf-8?B?UUtjTm1mdkxwZmdjY3hTTU9KZEsrSnd0bjJ4azdIMHUxM0lGWjBod0hPUk0r?=
 =?utf-8?B?b1dxb3ZPeG8yT0plUTRmZld6Zmh5bm9Zb0lacmp3ZVYzY29nK0hVdGxBM0Vs?=
 =?utf-8?B?dTBUTUo3VjF5SERRcCtFTXFuREhpaXlmTkFBUlR4M3N1MUhzQWthSjdmVmJE?=
 =?utf-8?B?TFFDVDNhUHFCUTNqYkUvaTVoMkdYUGlQbVRRV0RETDNNbGNYNEF2NDVlYkk5?=
 =?utf-8?B?REV2K2ZYamJ3TE5jR1FZbWorZWh3NmxMckdENDB6VVhXaWhtUjBQbFlmWFI3?=
 =?utf-8?B?M2xManJqNFdMbnZVWEVIZ2NIQWwzemFQdnJHL3NMN1ZvNHpQL043NStQWDBS?=
 =?utf-8?B?bDdKekdkUXdsMGZldUJTY09teDY4TldvZE1VK3JXeHpwWHlzdkJwbHpIc0NS?=
 =?utf-8?B?bTVlLzhIZXZyOEU1c1VibEppQ0RqUE80b0RmWVN6ZWZIUjBDUXNsK1NYbWho?=
 =?utf-8?B?anlDdEEvRVZkN1FrLzJCT1dPbGd5OEZicG5jZ09XbHlZWUVUVkVHM0kwSjNj?=
 =?utf-8?B?VnR3THo2QWxESnlJaDV4M1IzWG1lRXBreUkyL3hGUDJxbWdGM1c1MDI1SW4y?=
 =?utf-8?B?TDVZaW1WQzEzc0U1YXYzKzlXdmszMVpYN3hHMUVoOVJuWElqR3J6MHhrcENL?=
 =?utf-8?B?ek5rVXhjcUhxZkcrdFB6aHlkd29xUDNSNUpQZWFqMlpqYXZ6cUZod21EaVE5?=
 =?utf-8?B?WUFIRXRQZ2M5OHEyaG81UWY5YXdSdm1jM2RVOTB1THpFV0M3elBuMjhtMUkz?=
 =?utf-8?B?MWtteEQ2enNtWm5EQVVSdzBsbGhrTjJ2VXhLS1lOcWJRSVczanVweStnZGRq?=
 =?utf-8?B?TEV6OTJpS0pQK3VxVUNsYTRValgvYmVDWktJRUVYQVE5c1Uyb091am4vRFA5?=
 =?utf-8?B?bWUvREpyY3ZkOXE1S0ZxWlROcHVUQ3JSOWJpUThKeFJDdlVDQmZoZFlZQ0JH?=
 =?utf-8?B?RHlHS09vNWRScWc1ZGhVZnVuNFloYUtVMzNvUEtMeUdqK1M3Ykh1S2ppcGFO?=
 =?utf-8?B?UHlTaDNWMURVMlBLODVuaVRkUE5zZkp2TE1OeDJZSDdncC9sZE56MHJZbTc2?=
 =?utf-8?B?NzRJWWNZTmczMS9yc2QyNlRNcStUeWlZM0ZMU3JuSzFZLzM3d3N6d0lmZUVl?=
 =?utf-8?B?TmdxM0RuOW5sZEkrSEk4MUtTV1VkT2FGWElyVm16cDUva0dEdGViS1BHYzB6?=
 =?utf-8?B?blVDbEM4bmtWOVNIdjl6MmZvQXc5Q0drYjlSL1VsL1YyQjdlTERERHh2ZEhj?=
 =?utf-8?B?eHVyNjJpWkxvV0ZpTWM5dmVQN3RKaE5yZjBLZHdzaVVLN2p0d2c5Q3M3TFU3?=
 =?utf-8?B?UzFrNFNTNVFzSysvQ01LMytCS3pwQUREUUdlYnVyN1ZuSUdzYkdXKzhmMUxC?=
 =?utf-8?B?L1MrcUtqNjVpY1VhNE54MEJuWXFHYnU4YzJiUlBqcE1SRE1QWWZ3V2d4dGE5?=
 =?utf-8?B?Vk1rSTZ2dFk0UUN5bTRoNzhGOFNzLzBzdnNXNWFnT3JWTUpBQU4yeDJtc2Iy?=
 =?utf-8?B?VXZxaVBpTmM0QXJkVjhpQllWc1h4YTU5ODI3d01abXVVMmlORlJLc3BBTGN3?=
 =?utf-8?Q?wV2ocC?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:01:07.3796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc8dcd5-e335-4034-467f-08dd776697db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
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

On 21/03/2025 07:48, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:33 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
>
>> This patch adds 64-bit register accessors to simplify register access in
>> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h
b/drivers/gpu/drm/panthor/panthor_regs.h
>> index 42dc3fedb0d4..7ec4a1d04e20 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -238,4 +238,59 @@
>>  #define gpu_read(dev, reg) \
>>  	readl((dev)->iomem + (reg))
>>
>> +#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
>> +
>> +#define gpu_write64(dev, reg, data)                            \
>> +	do {                                                   \
>> +		u64 __val = (u64)(data);                       \
>> +		gpu_write(dev, reg, lower_32_bits(__val));     \
>> +		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
>> +	} while (0)
>
> We're not doing funky name concatenation in these macros, so I'd rather
> have them defined as static inline funcs in panthor_device.h. We
> probably want to move the gpu_read/write definitions there as well if
> we do that.

I see where you're coming from, and it makes sense. I was thinking it
might be better to keep it in panthor_regs.h since that's the file we
include when accessing GPU registers. That said, we could certainly
convert them to static inline functions if you prefer.

>> +
>> +#define gpu_read64(dev, reg) \
>> +	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
>> +
>> +#define gpu_read64_relaxed(dev, reg)  \
>> +	(gpu_read_relaxed(dev, reg) | \
>> +	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
>> +
>> +#define gpu_read64_sync(dev, reg)                     \
>> +	({                                            \
>> +		u32 lo, hi1, hi2;                     \
>> +		do {                                  \
>> +			hi1 = gpu_read(dev, reg + 4); \
>> +			lo = gpu_read(dev, reg);      \
>> +			hi2 = gpu_read(dev, reg + 4); \
>> +		} while (hi1 != hi2);                 \
>> +		lo | ((u64)hi2 << 32);                \
>> +	})
>
> I would name that one gpu_read64_counter and make it a static inline
> function. Note that we already have panthor_gpu_read_64bit_counter()
> which does the same thing, so maybe move it there and rename it along
> the way.

Happy to rename this to gpu_read64_counter in v3, if you're okay with
us keeping the macros/functions in this file.

Kind regards,
Karunika

>> +
>> +#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us,
timeout_us)    \
>> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
>> +
>> +#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,
       \
>> +				     timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us,
timeout_us)    \
>> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
>> +
>> +#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond,
delay_us,         \
>> +				       timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond,
delay_us, \
>> +					     timeout_us)                    \
>> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,     \
>> +				 timeout_us, false, dev, reg)
>> +
>> +#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond,
delay_us,         \
>> +					timeout_us)                            \
>> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us,
timeout_us, \
>> +			  false, dev, reg)
>> +
>>  #endif
>
