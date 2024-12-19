Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9D9F7FC8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 17:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4770510E0A9;
	Thu, 19 Dec 2024 16:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="TwXdtxmX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TwXdtxmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502F10E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:30:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iqljMzIrtSdA2KUGQdNhvNaV3wVoP+gOeleFUhMm51jH9KOKTQ8b+kIIWmqFIn5lzehkJF12j8AdeGcWn7ufRIrn5J2OVg2r0sQDz2e26pGYuv2+I6DG0xr/iEwdYcVVWAhNzB0tVvnZbmainFyESaDM0ST9B//diGk6RSpcv4l1wRoi6VD+bqO8zWCvoXsAUGmdL5qz7AgltFiRE/PA2REm/CF+JbMj2OnY85n9DUdATqqgEB/MusFWyj0Mm8sORNEwMWAG6Wgw2fy0L+t+GysXnQbR3tZ9tddmaSSZ9QTkWZsmPJxnQvcFRI24KTYir4RJQtA+nfTobSGDQmLp4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKKFpVcmZejlDNfBpguafyhoja1QDZCaszzt8VXZnr4=;
 b=R7GY0OovXx77iaFeWolNxXr5iPZaRHXS2j7T9wp7SU4pymUFWN1ahXnXST3GwBShsEkPbpodAoAfmEPXS6oJ7bwJQhnZQGTVqWuFXjow/6fWZN+ksX75Ze8oNN6TK6QJEE7LIhZccA7WlUFjHWpngKOR7tufMKWwzc1M5qex30gyOnGMXBy9EPjynbIkaFD8Xn5asRBczMCRVTSAVsaC7fShqNebbiBivuVtPC9/h7cve48Le71asqBwn8CyztGELjK1y2Ttx1fRr91LRwCwH6p93N4gU0kmizYS4Hskw/u4Fg8m0nEY0Yg8uiuF5J+U6YuLWxOBLViv6Bw/jIU/SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKKFpVcmZejlDNfBpguafyhoja1QDZCaszzt8VXZnr4=;
 b=TwXdtxmXeBf+88ZjDm1IX7ElJLpRr4rgjWVFrHy5TfbBDPokHjDbd9b8yBvjwLedk+f/r5dG6QwMBlg6UAASkuN42s4o67B65dCPTcniBFPoywMU/l5sgu12xsy4kFxgvrrPIKLJzOPcentv0RGFoYAidODo/OPtf7caEx2rtrg=
Received: from DB9PR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::18) by DB4PR08MB8056.eurprd08.prod.outlook.com
 (2603:10a6:10:387::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 16:30:14 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::b5) by DB9PR01CA0013.outlook.office365.com
 (2603:10a6:10:1d8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Thu,
 19 Dec 2024 16:30:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 16:30:14 +0000
Received: ("Tessian outbound 7d3f896333d7:v528");
 Thu, 19 Dec 2024 16:30:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 595c25e2068b8c0a
X-TessianGatewayMetadata: irjKkxdrpNF9wKRy+u8y76NZK1xKckn0IKfQAPZSm1vOPVC8h+MXGItzJ7ugpuFDjFja7tlGTRAEdbcmntdzk+XKlY1jmPRlUuajNnNYq7OTa2GG2k2ohEK6TD22db7Sa3tvntvqjtoWSBKokL4n7r+uF3oWxCgwJvdiX8YnIR4=
X-CR-MTA-TID: 64aa7808
Received: from Lc0609db0d894.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 341B56B3-1F45-4853-A10C-C82B7C9E0C44.1; 
 Thu, 19 Dec 2024 16:30:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc0609db0d894.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 16:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRAkvFgogHt9SKTkyRpR2JkgVs4Cj/71seWh8hjmRDRV525Pvvp5p2dZ7P2PSeNeGzunF8XnYBegRh0JmuAT/ecGMA3pVvb4SSWqC7xvPdRey8n/SA6e/C1eFZkfdGtZTsxHCztLNXNvIqBnQ2Q4RHet+qhDl4gSfby3Fkf8YzfO3aN2VXnhhQLwdrIDwA9mY2fxA75l804Ew9/Xupt98axCSZnHW7hI0C0ixwHuv/5DCk5smhfcOI2tcGNjbMBKVec5C2qDctiudRbRzEGT3MeNG5jZfX+T77HGS7Nbs9nTMSKNdEr12Z40neGOCJ18Bv1jQ+SSNYRQ8wVleZjVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKKFpVcmZejlDNfBpguafyhoja1QDZCaszzt8VXZnr4=;
 b=C/LQr0ehzzNGjNpXmVWWKu5Suv+CZQtoOQ7nstLnA9JYDuNSwA/dHPljJnKnLkpS2HMdegtrK4WR3LAItiW2vSinW/YVMKvBEvyqW9x4VIYLEAMYmN8BovAOGI+EYsFYllmTaMIsOgwyZVYWJVXJnke6oMwLb9sNY08Qi6eOKSN6le/dh9ZpiFZSRgCpwokrd2kinSLRZyw3YWX7FnGeaI4c+trAEjDndJRgais88J70yubdD2M/apOfBfXpGveL4Pvp+60AsI3GzjfVh+vrbMKUBPbWrTd/zGIsXlrqFPASiVe8OJuNgjOR7XR5ERxkeRnfb8F4nRcQyZs+ep6lqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKKFpVcmZejlDNfBpguafyhoja1QDZCaszzt8VXZnr4=;
 b=TwXdtxmXeBf+88ZjDm1IX7ElJLpRr4rgjWVFrHy5TfbBDPokHjDbd9b8yBvjwLedk+f/r5dG6QwMBlg6UAASkuN42s4o67B65dCPTcniBFPoywMU/l5sgu12xsy4kFxgvrrPIKLJzOPcentv0RGFoYAidODo/OPtf7caEx2rtrg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6518.eurprd08.prod.outlook.com (2603:10a6:20b:33d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 16:30:05 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 16:30:05 +0000
Message-ID: <2a7c5a0b-af3f-4f1c-8c77-ab6233afcc76@arm.com>
Date: Thu, 19 Dec 2024 16:30:04 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
To: =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-2-adrian.larumbe@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20241218181844.886043-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6518:EE_|DU2PEPF00028D10:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: b1980405-ad5b-42ec-41e5-08dd204a6a8e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eWxGTllIdENVRzR2SSsrMTM5YXFZK0VZWitFNEk0WWFXQWFPWnkxcWpHNE9P?=
 =?utf-8?B?WURQTDBoOSs2RVZya2xGSVkvbWVQOTBNYUNNYUNaREg4ZUdUNEhZS0ZKeWdv?=
 =?utf-8?B?UGQ3blRkZHlqL3Z3elZYQnlvNTVXU1JIK0M0R2Jhck5PR1NUMm1RN0doNlND?=
 =?utf-8?B?R3Y4VnRhNjBkaVM1aS96TDNoVWlqSzZtYm1nbmNUbzZOcXkzeVR0WHhwMFhQ?=
 =?utf-8?B?d2lyZ1JIVTBTU0xiR3hSOWFIUW5TaWhJZk1iWnhiVmlqTU9EYzBDWm1RY00z?=
 =?utf-8?B?SzlVZ1hqdFJ4bHhGN0hNUENEbzRsS2JxUFJFbHZ4ZTNsbjk2Y3BWVmFqRDFU?=
 =?utf-8?B?b3gyUnhlekhNQzhhV1BGRlZGSFg4VWhKa3VYNGErbEFmUk5MUHVjVlJOdFl2?=
 =?utf-8?B?TkhXemRMYkRNUDY0ajlhNXcxNDQ2SDczaFBoRU5PNC9wcG1QOEtQcTNZNi93?=
 =?utf-8?B?bXU5TjZ5Rk1EY2IzMGJEaktFRWY3THhoUFUxK0R4c0JlMXZnb2gvZXZueXgy?=
 =?utf-8?B?WWg4VStBQzQwMnJ4aHBoTndSem1kYnlYbUVpOGxmb1hxcGttNzV5TEtnaGlZ?=
 =?utf-8?B?Ynd1UmpwekFLUjBVMVovdG9FRGl5UUpYRlAzeisxdDdZZXErUHhGMUE1VUVq?=
 =?utf-8?B?bVg2cERsRkJCUXdwWjJqWVZqUDFkc0ZrRGJiT1NXTzNsR0NxK3VYQm5jTk01?=
 =?utf-8?B?dWtsenBibk5YRVVKTU1tM3lQMXQ4djlGRVk5NWczeFUrRzFFTTVhNjJQdlYz?=
 =?utf-8?B?NCt1NHdLRmF0dkxRRDhvNHlJVk9Bb0krSGdEdlU4SjVLZjlodzJMNmFiQ3k1?=
 =?utf-8?B?U1lSTnFrK0licHlLMFN4NGtTT2dqcDk4d3lTcUY4OXd6dnFvUDgzQ0ZiNEdQ?=
 =?utf-8?B?R1pudGVvOGtmVkp6a3dPemNCYzBCbEhPVGRJZ3ZFZ1JZOU9jQlp4eXh5UHFy?=
 =?utf-8?B?YlhURkVnWURGZDZyQW9oNFpEOW9FTFpadU9qUTh0eHZtUUhLZWVlQ0QyelY3?=
 =?utf-8?B?UklHTE5QaHhUUy9FS3BNZUVuM1pNMlc3MjcwdnBteGJ1WTFtL1VFSmkwejR3?=
 =?utf-8?B?MEJ6TDdxcEphT3JMYjNJakIwY1ZVSnljanFTcUlCeERzRXNwR0kxdE83WnNP?=
 =?utf-8?B?cVpqcmhmRlV5Y3B0SkhoSkRwbk1zejdDaTZia3piaVd6QWU4bm5zTXMrTlBC?=
 =?utf-8?B?OHc0S1hmUWxpM2RFZ1lGRUI3dXBPQ0xwLzlUT2ErNFFXQndqaEhKL1hGSWNr?=
 =?utf-8?B?VTBRNERYMzJCejdsRFowTmRGWU5QUjlGc2Z6SGNPRC85a3pMdHBHL29xekxI?=
 =?utf-8?B?VEs5SkxKK01lbXNCQVlMZ3gyVnlmOHdjaExNcHI4eVovUWtFQXNRWnhQMkdC?=
 =?utf-8?B?RkJZSUo1RytXeFRZRGxIeW9wVm9kWmF4bEJQaTZWZFBIZ2k3SEk4ZjZoSXps?=
 =?utf-8?B?V25ISmdOK0p6blFXcms4eVlEQW5VNjFtRTFpQWdxYkZ4RnZsd3ROOVZxdFQz?=
 =?utf-8?B?Z0tZcTNDYm4rZnlHQkpPUTRRVCt0bHc3blBVaVdFT3djNzdBMnpUVlpqdDZX?=
 =?utf-8?B?QmFISzBBSGVkeE1iSnpPMXp0ZnE5ajUxZDNjdXhHMjBYYmp0djFwbTY5VHdM?=
 =?utf-8?B?SkViSEw2cXZoeCt0eWdpTnpjVS9WWUVZYUFNeXpjU0ZXMXFudlVILzBIc3Zh?=
 =?utf-8?B?YnNKdFMvZTFuZ3F1NkVUR1VUcit5Nm9ZYXY5eXFhSFBXM2pxUXo4dWdzRXB4?=
 =?utf-8?B?Q2tBbk5VaU1wRmxKb2NMeHBGTnUyeTMrTkpaWm1OQ0xndlJhaFB3eGtiZEZH?=
 =?utf-8?B?SkJ0aFRQczJjZllGZVlnU1RJY0hxQXUxdjNhcllYVGlCaW1RaVBUNmdqRWUr?=
 =?utf-8?Q?+hwkyVZu6kt1n?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6518
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f091126b-f7d6-4739-2078-08dd204a6534
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|376014|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFo4YzdSa0d4dlIxUXJOT1Vob3Jxa2p3dzJQRHVXWEpFZm9sZkdEcDljRjNq?=
 =?utf-8?B?ejBjVEpDM0c3VHBPK0xtY2ZoQUhodDVmZk8zcWlCbFZWSERHN0pBc0pHTUVm?=
 =?utf-8?B?L1ROTHQ2Y0laVWI0bjFpemMwcHhtL24vV25OYnIrWkduTWwySzNITnlkbkta?=
 =?utf-8?B?ZCtFVmVVNXpDNkpOSlFROC9MTmI4U2xZczVkbWZqL0NPc2x3ZnJNZjFTM1dE?=
 =?utf-8?B?U1p6UUNLS2xxUjVZVlI4bnRya0U1cnZBV1VDVzdWa2ZZem1yejlJcHZRcVdE?=
 =?utf-8?B?bEN6RkVtSm1Fc25PbHZtdUErR1h6Nlora3Iwa3AvSnpiVDBDckFDK0xmSTl5?=
 =?utf-8?B?WHVTalhzNmdZRDYyakFvQTV3MndZUDdzK3pSVlpjMi9PQWcrOGw3UDJ6cEFx?=
 =?utf-8?B?S3JWYjlYSUliTTdaNHBlWGFtb1lrWUwzd1hpOGdSTk40eHB0eC9XUkxWQklx?=
 =?utf-8?B?Sy9iMDM0aUY1dEtJd3ZvVER3czZ3eHo3M3JkS0xWR0VBNXc3NnI5bVc5WGQ5?=
 =?utf-8?B?VGdKeFRkV0M5UmtsNVBzdFN0Z0d5YWZLdm1RNmtvUXNHV3ZleUJPNzBBNG84?=
 =?utf-8?B?UXJuT1hFRnl0WjFMU2cvdVF1bW5wQVZFTWpCaUtwbFJzbER5d21naXYrU1Zj?=
 =?utf-8?B?OGJha1JLTFdRQmlReVpXcHM1ajZHT1NzMUFRTldJS09DM00rcjFBc01sS0Fn?=
 =?utf-8?B?Rk1LN05USEt6WGN0emRKT3F1YjVma2VzZkkydnhUZHR3b3MxQWlmUlpSWHZ6?=
 =?utf-8?B?MFduVTFiVmNiSTNxRzBoUnZKbTdLVVgwc2hhMDEzYklXNkk0WUZkTURyUUls?=
 =?utf-8?B?bi9jV3lUS24xb3Z6N0RILzN5VnArUXc1aXF1aVZhTDhGaVlyRHMxR2t3ZVM0?=
 =?utf-8?B?NlRoblMxRFIwbGN4c3M2MWoxN2JETGN6dlV6eFVLZjJjU0FlT2VLQXhMclJU?=
 =?utf-8?B?V3E2dXMxckZsZzhGSzZLWjdMVUQ1eTI0d0V1TGVSNy8yNGY0TmYzQkJlT2E0?=
 =?utf-8?B?NHoxRlIwVkRzV1ZxdlRxQlRneU01WDhRYnRhZXpLMnp2ZUI2ZFNJS1VveFoy?=
 =?utf-8?B?NXdWd0ZUUWQyWWJhK2tRRDNuNGtEdkd6K1dCKzhFY09saWZ4aE0ybzNheDlD?=
 =?utf-8?B?bmZmK2gwRE5BRkJWVVRIVFp4SFc1c2RiUUh0ajFtcExVR3ZuWEJZSnQ0M09W?=
 =?utf-8?B?M1M4ZllFZEJsOEFWTEpjc1hTWitpbW5HK2M4ZjFXUENKOURWYStQbWViYUdK?=
 =?utf-8?B?QlJJbXVCK0dGU2s1Nzcxa29wd1ZwT3hxb3ZHOGd4THhhNkR5QTJraU54alNX?=
 =?utf-8?B?b1Fwa1hnV0RwZjJHblBMaGNMT0ttWG80RUI4bXZTdEVLSHd4OGthanM3SFBl?=
 =?utf-8?B?UWZjNXovbnRseWpPZmMxL2NrSEZtV2twanA4ZWJnazVWMHg1NU03Nm1UbFZN?=
 =?utf-8?B?M1VicmFmZHRRTUhXWVhieE9OR2w2ZDZmSFFtbjRwY0lWcGw5ZTB0VklWNnFs?=
 =?utf-8?B?TlhVNHFEcE9HQUVKR1lySHQ4ajBIM2x5N05GN29DM1NrL0pWdWlTQ2RzNHVn?=
 =?utf-8?B?Z2R3VW5LSHk3cWtaMnJDdFNTM0d3U2VWUndxTldVSkR1d1VaSTYvSEIwZEhk?=
 =?utf-8?B?TzNPT0VvQVBYQSszZ0FMOHo2ODVkTUJIaklQVnFTMW5jTEw5ZVFZajdEaC94?=
 =?utf-8?B?aTcydUI3VndNYXZ2Q2VTbmMyV2ZQeTV4SEIrV0E4MllmYXZWV2NsM3QyZWQw?=
 =?utf-8?B?WnllTTZrWHV2aTBzZWg3blZQTG1SdW44QzZOV0ZZNUZOZllMMFdJNTQvNEg5?=
 =?utf-8?B?NmZYWWdIcFh1RUJqamdNZkliaXRvQ2JiZWxFdkh1aFZwSHo0QlVXQjZGSXov?=
 =?utf-8?B?YlFTTkVQQktnMklHcDFXU3JDcURVM0hZc2hXQVp0MXFjSTNObURMNkJ0QmVj?=
 =?utf-8?B?aEdkZ2ZkNUFCZUlYMU1EdHdHWUwxemJyUzR4a2hHVC9OZGVZSGtSVm9GZjlZ?=
 =?utf-8?Q?9wCPAED5ksVlKfZf+DZhKgZQEh71GY=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(376014)(14060799003)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 16:30:14.3230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1980405-ad5b-42ec-41e5-08dd204a6a8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
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



On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> This will display the sizes of kenrel BO's bound to an open file, which are
> otherwise not exposed to UM through a handle.
> 
> The sizes recorded are as follows:
>   - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>   - Per queue: ringbuffer, profiling slots, firmware interface
>   - For all heaps in all heap pools across all VM's bound to an open file,
>   record size of all heap chuks, and for each pool the gpu_context BO too.
> 
> This does not record the size of FW regions, as these aren't bound to a
> specific open file and remain active through the whole life of the driver.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c   | 12 ++++++
>   drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
>   drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
>   drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++
>   drivers/gpu/drm/panthor/panthor_mmu.h   |  4 ++
>   drivers/gpu/drm/panthor/panthor_sched.c | 52 ++++++++++++++++++++++++-
>   drivers/gpu/drm/panthor/panthor_sched.h |  4 ++
>   7 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index d5dcd3d1b33a..277babcdae12 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1457,12 +1457,24 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>   	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
>   }
>   
> +static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_memory_stats status = {0};
> +
> +	panthor_group_kbo_sizes(pfile, &status);
> +	panthor_vm_heaps_sizes(pfile, &status);
> +
> +	drm_print_memory_stats(p, &status, DRM_GEM_OBJECT_RESIDENT, "internal");
> +}
> +
>   static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
>   	struct drm_device *dev = file->minor->dev;
>   	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
>   
>   	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +	panthor_show_internal_memory_stats(p, file);
>   
>   	drm_show_memory_stats(p, file);
>   }
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3796a9eb22af..49e426fc2a31 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -603,3 +603,29 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
>   
>   	panthor_heap_pool_put(pool);
>   }
> +
> +/**
> + * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
> + * @pool: Pool whose total chunk size to calculate.
> + *
> + * This function adds the size of all heap chunks across all heaps in the
> + * argument pool. It also adds the size of the gpu contexts kernel bo.
> + * It is meant to be used by fdinfo for displaying the size of internal
> + * driver BO's that aren't exposed to userspace through a GEM handle.
> + *
> + */
> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
> +{
> +	struct panthor_heap *heap;
> +	unsigned long i;
> +	size_t size = 0;
> +
> +	down_read(&pool->lock);
> +	xa_for_each(&pool->xa, i, heap)
> +		size += heap->chunk_size * heap->chunk_count;
> +	up_write(&pool->lock);
> +
> +	size += pool->gpu_contexts->obj->size;
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
> index 25a5f2bba445..e3358d4e8edb 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.h
> +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> @@ -27,6 +27,8 @@ struct panthor_heap_pool *
>   panthor_heap_pool_get(struct panthor_heap_pool *pool);
>   void panthor_heap_pool_put(struct panthor_heap_pool *pool);
>   
> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> +
>   int panthor_heap_grow(struct panthor_heap_pool *pool,
>   		      u64 heap_gpu_va,
>   		      u32 renderpasses_in_flight,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index c39e3eb1c15d..51f6e66df3f5 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1941,6 +1941,41 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>   	return pool;
>   }
>   
> +/**
> + * panthor_vm_heaps_size() - Calculate size of all heap chunks across all
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @status: Memory status to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
> +{
> +	struct panthor_vm *vm;
> +	unsigned long i;
> +
> +	if (!pfile->vms)
> +		return;
> +
> +	xa_for_each(&pfile->vms->xa, i, vm) {
> +		size_t size;
> +
> +		mutex_lock(&vm->heaps.lock);

Use `scoped_guard` instead?

#include <linux/cleanup.h>

/* ... */

	xa_for_each(...) {
		size_t size;

		scoped_guard(mutex, &vm->heaps.lock) {
			if (!vm->heaps.pool)
				continue;

			size = panthor_heap_pool_size(vm->heaps.pool);
		}
		/* ... */

> +		if (!vm->heaps.pool) {
> +			mutex_unlock(&vm->heaps.lock);
> +			continue;
> +		}
> +		size = panthor_heap_pool_size(vm->heaps.pool);
> +		mutex_unlock(&vm->heaps.lock);
> +
> +		status->resident += size;
> +		status->private += size;
> +		if (vm->as.id >= 0)
> +			status->active += size;
> +	}
> +}
> +
>   static u64 mair_to_memattr(u64 mair, bool coherent)
>   {
>   	u64 memattr = 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 8d21e83d8aba..2aeb2522cdfa 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -5,10 +5,12 @@
>   #ifndef __PANTHOR_MMU_H__
>   #define __PANTHOR_MMU_H__
>   
> +#include <linux/types.h>

[nit] Is this related? Nothing in this file's other hunks suggest that 
it's required.

>   #include <linux/dma-resv.h>
>   
>   struct drm_exec;
>   struct drm_sched_job;
> +struct drm_memory_stats;
>   struct panthor_gem_object;
>   struct panthor_heap_pool;
>   struct panthor_vm;
> @@ -37,6 +39,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
>   struct panthor_heap_pool *
>   panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
>   
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
> +
>   struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>   void panthor_vm_put(struct panthor_vm *vm);
>   struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 77b184c3fb0c..bb4b3ffadcd1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -628,7 +628,7 @@ struct panthor_group {
>   	 */
>   	struct panthor_kernel_bo *syncobjs;
>   
> -	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO sizes. */
>   	struct {
>   		/** @data: Total sampled values for jobs in queues from this group. */
>   		struct panthor_gpu_usage data;
> @@ -638,6 +638,9 @@ struct panthor_group {
>   		 * and job post-completion processing function
>   		 */
>   		struct mutex lock;
> +
> +		/** @bo_sizes: Aggregate size of private kernel BO's held by the group. */
> +		size_t kbo_sizes;
>   	} fdinfo;
>   
>   	/** @state: Group state. */
> @@ -3381,6 +3384,29 @@ group_create_queue(struct panthor_group *group,
>   	return ERR_PTR(ret);
>   }
>   
> +static void add_group_kbo_sizes(struct panthor_device *ptdev,
> +				struct panthor_group *group)
> +{
> +	struct panthor_queue *queue;
> +	int i;
> +
> +	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(group)))
> +		return;
> +	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
> +		return;
> +
> +	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
> +
> +	for (i = 0; i < group->queue_count; i++) {
> +		queue =	group->queues[i];
> +		group->fdinfo.kbo_sizes += queue->ringbuf->obj->size;
> +		group->fdinfo.kbo_sizes += queue->iface.mem->obj->size;
> +		group->fdinfo.kbo_sizes += queue->profiling.slots->obj->size;
> +	}
> +}
> +
>   #define MAX_GROUPS_PER_POOL		128
>   
>   int panthor_group_create(struct panthor_file *pfile,
> @@ -3505,6 +3531,7 @@ int panthor_group_create(struct panthor_file *pfile,
>   	}
>   	mutex_unlock(&sched->reset.lock);
>   
> +	add_group_kbo_sizes(group->ptdev, group);
>   	mutex_init(&group->fdinfo.lock);
>   
>   	return gid;
> @@ -3624,6 +3651,29 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
>   	pfile->groups = NULL;
>   }
>   
> +/**
> + * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
> + * belonging to all the groups owned by an open Panthor file
> + * @pfile: File.
> + * @status: Memory status to be updated.
> + *
> + */
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
> +{
> +	struct panthor_group_pool *gpool = pfile->groups;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(gpool))
> +		return;
> +	xa_for_each(&gpool->xa, i, group) {
> +		status->resident += group->fdinfo.kbo_sizes;
> +		status->private += group->fdinfo.kbo_sizes;
> +		if (group->csg_id >= 0)
> +			status->active += group->fdinfo.kbo_sizes;
> +	}
> +}
> +
>   static void job_release(struct kref *ref)
>   {
>   	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index 5ae6b4bde7c5..4dd6a7fc8fbd 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -4,11 +4,14 @@
>   #ifndef __PANTHOR_SCHED_H__
>   #define __PANTHOR_SCHED_H__
>   
> +#include <linux/types.h>
> +

As above.

>   struct drm_exec;
>   struct dma_fence;
>   struct drm_file;
>   struct drm_gem_object;
>   struct drm_sched_job;
> +struct drm_memory_stats;
>   struct drm_panthor_group_create;
>   struct drm_panthor_queue_create;
>   struct drm_panthor_group_get_state;
> @@ -36,6 +39,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
>   
>   int panthor_group_pool_create(struct panthor_file *pfile);
>   void panthor_group_pool_destroy(struct panthor_file *pfile);
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
>   
>   int panthor_sched_init(struct panthor_device *ptdev);
>   void panthor_sched_unplug(struct panthor_device *ptdev);

With the mutex cleanup 'modernised',

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>


-- 
Mihail Atanassov <mihail.atanassov@arm.com>

