Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C3C8F84C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 17:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA79C10E828;
	Thu, 27 Nov 2025 16:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="F1t8SLH0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F1t8SLH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A1110E828
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 16:32:58 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ykzFFAf6IQWKwWs8IgG2ATNoznl4/x3z551V70uD4edvtkl3skDH+gJZxhMynIAMy+zy8i+XAiI3cylkgIIadiMhSQytNSus+KOztzM+KrXDEkYfZfcgK1qrGmaaeSpoPBPfSbNK2VSDCZHoO2gI18JqYi5FWkQcIVNrslLWoG5LpfgQsSx88TTgX03SOqCHVCm/sDO1BmfAG7iNCDoXEmRHdNpWi0Iv8IAib4JDY0TtoJ2N0isiv5/sn5CQg9GHGIvq0EAsm7fDPMnVFEHlqfbzDn3Kd24IeOpO+Ex+YHPekgtz9+ztj0TqzF5he5owpWjrEOg+SJKY5ng6SLY0MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZwp5Cw4CgqA9p2ytAetz/6b/5sj2guSzrE+2yKGVW0=;
 b=aC+5Jj8lAJCHJYe6FA/zz1InMFUp5zZxBl0zp6dHPJX0H8+MXB4rLBPKcNYlOFW5bOj2O0ZkhsnWFf/iPSfIf9AiAOY2ZB4+pIGoeaKZhm/U1RRj/1QMAAdWJeKdjyzLAg9Wai/bWO0MDiCWCRGd5+BUPs+NhtyKiNlVXjVBIFY6l3EzLXs8zs506t4Wi9Y1QZ1Nzs52QFKZ8TxtL/LorcJUXgqbb/juFWkW9/GAu8nWI/N4MoD4q+YA7PkdzOJ2S6pYdNnxTKrp0KZpziZWSwvvkcPyTnnTelbQ28GMUjRYuwE/8sjeS5MzG2uOohDaVMFPBW68it3qB+nEGHzg7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZwp5Cw4CgqA9p2ytAetz/6b/5sj2guSzrE+2yKGVW0=;
 b=F1t8SLH0DhMtK/aDajNHQyCxns7RDq9U/0b3nlWud4l91RdJYMJqBtIVyK70cfW7lie7hl69pqxpCtLyuYpxPdT63qYww4MiAv3SxgdnfqpBhxGStBilgXNQ2hZgWFoaBbomvn+YebahdzMRQqRjd2jS8NQiveHb5zlGr/pEVjI=
Received: from AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::13)
 by DU0PR08MB7592.eurprd08.prod.outlook.com (2603:10a6:10:311::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 16:32:50 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::ac) by AS4PR10CA0005.outlook.office365.com
 (2603:10a6:20b:5dc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoHek2YCzM56/p69f2WQO15kpP3zKzwK/QDblBpAgtIsTF7RFKrp2f5oHZx9pQaqrBLMhQd2JKPe9Vg+49LC4Ijr2WTLBMCbny0mgHgJ0ko9FWW7ZUTPwvrn0jy7ZWUTgZMcGBDrWudi1AeF/g9Fc0LjwstCw1luyI3WPDJY0LnpvqRyOem2/enmHJMHUj3p8a4KbUfu/jl6H9MGUrhtM2z5yN611Qy/haoBmIwJ7BKWvmcf0XpnC2KrON8IieVrCSzplyqmbs3dUpSPSHzCHNuS0TNKzu0RrOv1JyWqBzCwLNWkr5KU82Uvs7Ts8PhqW/V6q4OKBU+sTF6Ue7K2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZwp5Cw4CgqA9p2ytAetz/6b/5sj2guSzrE+2yKGVW0=;
 b=PjXfgLu/Yt2szm2epLqsGcJ0f4kuSo9C6Q5LWQOGWddPazvm8pC6Y4f5/1237raOsKjmQtBRr8QO7JWfQz1c6WFdcbBC7Y0Z+WEFlRbclOwE7hx7MrmbgR583MhFxxAll1mod5gjC1vIw9mqWfaKvYulxjHyQjpcICsVhqW86lYhQzJFJZ6yJgs4PjLzFhlV4EpIY7ywexRKNgbiKO0/ofR2aLV93CSy5F0hVIsx02F2bakauo27q/BryBZ46yrWx8fnKsnSV6eK2gJaZs09U/DbZE9eB8/SXTsUmeurpFU1PJlAw0rapcENNjjScV2Wpk17RAcF/ROUA75RFe9fsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZwp5Cw4CgqA9p2ytAetz/6b/5sj2guSzrE+2yKGVW0=;
 b=F1t8SLH0DhMtK/aDajNHQyCxns7RDq9U/0b3nlWud4l91RdJYMJqBtIVyK70cfW7lie7hl69pqxpCtLyuYpxPdT63qYww4MiAv3SxgdnfqpBhxGStBilgXNQ2hZgWFoaBbomvn+YebahdzMRQqRjd2jS8NQiveHb5zlGr/pEVjI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB9PR08MB7842.eurprd08.prod.outlook.com (2603:10a6:10:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:32:16 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:32:15 +0000
Message-ID: <ceda1a0a-f615-4715-9a3e-8e8397d2409a@arm.com>
Date: Thu, 27 Nov 2025 16:32:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Prevent potential UAF in group creation
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 nd@arm.com
References: <20251127081239.3744766-1-akash.goel@arm.com>
 <f0b4ad5b-e202-4981-b4f2-01d78b3dc41f@arm.com>
 <20251127170836.0921f02e@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251127170836.0921f02e@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::23) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB9PR08MB7842:EE_|AMS1EPF00000041:EE_|DU0PR08MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 5534a641-5e63-4655-e95e-08de2dd29b31
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TVFVdXIzdE5uTVdMallST2pXYVk4cnlWa3dhYko3Y08vS0pBN0JrWEJaajh6?=
 =?utf-8?B?Y255cThOaGtNbFYrNzh1UXc5TENFaDEzSkExYVJyV0s2ZFV4THpDMHc5c0tN?=
 =?utf-8?B?ekNLcDMzaEZBeDdBT1ljSDlZU1NCaW15MmV0MEJES0RIdW50WVpIZVdDWUR4?=
 =?utf-8?B?RnA1QWdZTjlIcHpTejhPRWJOVi9qVkxna0FIQU9YNHdMdlJVdzloaUVXV3RT?=
 =?utf-8?B?a24zY0ZoalFuUld4cnJMRzJKOTFjZSszcitjRlFEWjBXTXlvUFlveElkRkRR?=
 =?utf-8?B?ZFlrU3ZPZFRVb0ZkUWdUTjlUSG9uMXlLNHNSc0xzaUdMUENZVElXN1JsMHYy?=
 =?utf-8?B?eG5Na1RaOTZNUy9JMnZvM2p4aFhXa2xZT3E1NE9LSTljWVNBYVZVNE5aRXMz?=
 =?utf-8?B?YXBURmp0OU1uR1BuSys1OVRuemJFQjczM2lmcnpYOHdIcHVzRStMbXBFVzg1?=
 =?utf-8?B?ZzZUS20rMTdZU05hT0RnbzM0cXRHblZwd0N3ajcxWkwzb25jbVpNcnlWYWRV?=
 =?utf-8?B?cWNEQzJ5S3c1S3NhOHUvRVp5TGRmYVFmZnpINlk0Y3dRY3R4eUtHaEQvSXFj?=
 =?utf-8?B?QTcxRFlITDB1Uzc1dHdFdlNFeWRWM2tuamMxQkpZNC9HWjVoODlzN05VMld2?=
 =?utf-8?B?eTNlRWZkVXlXZk5seHk0VzA3RUt1SE5ubVltbGU4ZXczVHJZY0FlUXNOWUlj?=
 =?utf-8?B?YnlCdHE0RzcwVnc5emcxc0g2Y1c5aVprMzJYbkFVT2kwS1NDS0t1b29GWkdX?=
 =?utf-8?B?cXdXcW9XdG5pb1NZa21sWlh6VTAwRXUxT0lLYUxRQzBGTVJ6VU92bHJMdmhP?=
 =?utf-8?B?cTlBSnVvVDhzNnZCZy80ZHpybm43OXFxclJQcHlwRHZ1RGg5Z253bTZQTEhR?=
 =?utf-8?B?WW4zd2lySnk5dXF1YUs5Uk9jbmZKclJ1V0NjVFVtTGpEblFBZXUweTdIOFlC?=
 =?utf-8?B?eFVTM2tQNkdiUlRYOGZ4N2lQTDlNREViMUdtckQxTldjQ3RsOVdMcWxyMTZR?=
 =?utf-8?B?RTJNOVcwMkdJVXFlaXhCQXh6eDlYQjRyY1NIZXJibFBTVGJyanIzenF3TzZH?=
 =?utf-8?B?S0U4MVRvOWJwUDRUY0lwZ1BoQ250TzN4NzRWWUN2bC9yNGRySzFwWGg4UWNB?=
 =?utf-8?B?K2VTYnl5cjVXcGZOY3VkbmNKTzhMMHAyTEZnS1ViRUQvR1JYMTRQNlhqR3Vr?=
 =?utf-8?B?cDZSRkNENFh5dkxxQ0Y3NlJpZU5ETXRYTHpxOVp1TXVIV0hjN2h2cUJETzlx?=
 =?utf-8?B?TDQyeUtFYmluRDhwOHZSSjBHSThsVG9mZGFrUzQvcHlhK09mNGN4ZUpJYW9Q?=
 =?utf-8?B?R3lUWm1hYnI2SzI0bTVyVzVMamtjRWE4Yjl1ai9RTEd0T1FicDQvbVoxRmZC?=
 =?utf-8?B?dlB0OFJPZ0E5TndmK002NXN2dG4xNWRNYzlWTUxzY21vVW80WnhRbzd0bXha?=
 =?utf-8?B?TmhoRVp0WTVrelRHb1FScXhTaHk1clh2MlB4bEFxSUVCRjV1NWhXeSs4MndB?=
 =?utf-8?B?emdpZ3BzRSt5TUMzN3Q5aVorRjd4VHd1cXVwZVJQNXg1dmxPVWhiUnE3N2xB?=
 =?utf-8?B?ZHNYZjd3MUQ5VUlPbExrcWpiQVRYRFZvQ2tPQkRQUDFBZjhQSHJZdHBWdWpJ?=
 =?utf-8?B?QVQ2dlg3THZ1dVlVbi9jemNQNDRlMUd3eTRZK1BtRzdCTW5OZEhFdUFwNXNt?=
 =?utf-8?B?VEkvNUptZEVyVDNPQklQbG4rVHhRQ2Y2UjBIOVBSUDZpd0MyZ0grOHJwSWxX?=
 =?utf-8?B?Q2NlVUxueDVrWDdWempEVWpxR3pGSnpLNnRGRTFPam1SbGViN2l1REhrdWRX?=
 =?utf-8?B?bVcrOGRvSWg5cEx4TG5YanFHT3IrWXhid2RRRTBGMUhaMkl3ellQd1dkQyt4?=
 =?utf-8?B?OUdVd2RObDZ6QzcrSEo0SDlGbUF0N2NnYmJSUU84QmxXdEpZb0xYcmZyMlRN?=
 =?utf-8?Q?PK4K1G+7W21pes9LxvKEPDjfVd/fn9/w?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 27c9aa61-d352-4d82-f339-08de2dd2860b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|35042699022|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEF2clljU2FmdGQ4cXdTK2JIaWdCSkpBZ2VTeXp0Tlo3b1JXOVMzSU1RMElJ?=
 =?utf-8?B?RFNFSkRteEQ1bnMrRzFNQldIOXlKaGoxUTdremhBZUNPWnl0NldMOVhBNVJz?=
 =?utf-8?B?ZUVmQmxDRjlwTXFLSnBMandXZVhJQjNaWVZkNlhvelVISUhWRENIWHlyU2lz?=
 =?utf-8?B?U1FZaEpQTGZLeG9JOEc0UEZlbmF3TkVWaGpTR0tGb1JmUEdUTmpheW9oUkFH?=
 =?utf-8?B?cUU3RHZmRDlRMFJsS3ZRVGpOMnJqSmtmMnY2dVYxQ3Z1b0Q3QlpmSC9jL2Zh?=
 =?utf-8?B?cDlLT295a2xJbXpXazVjZ2YvbXhQL2psZUdVNkl5UWc2MEFVY013SXVxaThz?=
 =?utf-8?B?NFNLSHA1WEI3cHFISGs3K0VMWWdNQTROUUx4ZzcwV0xlUkp0dnJhaWtWTmZr?=
 =?utf-8?B?Q2dsdG9GU1BzNm91MUthUG8ycWh5cGpjSFlvKzJFU2ZZWHN3WW1FSXpZRmpF?=
 =?utf-8?B?dzc2aVpaSDlyL0sycnF2Tk5hRjBONGQzM1VpUTdSWVc3Q2FwaUNsVmNRUE1w?=
 =?utf-8?B?KzliUTBmRU9vZEtleUZhS3ZKR0NpSHdUdHJSL21mUWR6UXNIMUVlYUlSZXFG?=
 =?utf-8?B?cmpyVTB0REYzcXZVc1R4cTZ3dUhhV1JucEQreXpYYkgrZC8waXZPaFcydlZq?=
 =?utf-8?B?ZUQ3YkttMDkxZ0lxMzBnemNIR0tFRWwwdEVJd0tHWis4TGFHYVhmVlBXUzdw?=
 =?utf-8?B?bHpsODVJakdqdEFvaEY5NnkyVkJuVWNkNTNXZXRZZjBtYTFVb0hISDFySHhG?=
 =?utf-8?B?RHppZ1Y1eUNpaDZRUnJCbXo0Y2Y5ekRmaTM4N0NvcWZKUWlqNjVwUmNZc1dk?=
 =?utf-8?B?YzlmQjczL1Vscm4yYWdTV3hMRGI0cGRoNmxFUGxHOHJhclE2UXlPRUh5eGFQ?=
 =?utf-8?B?RGkwZFJqUHJZSkFmTXlqRjNSa01aZjhITlVPMVBvQmZaT0tWajdwTEwxTm41?=
 =?utf-8?B?VDlCMm1LNHgxWDhoTEF2VnFZNmM4bXZnZFlKa1hsQW1iaXNiR0RUUW1zK3Rr?=
 =?utf-8?B?SXIrY3NOUjdMLzRhejNnQkdFZThXemlWaEtHQnNYblFPcXZLUHFiVzFLNzZZ?=
 =?utf-8?B?VW5ncU90TDhDV2hPWjJKSmFhVUJKaktycFdFUkpRelU3TE5BanluVzBiUzBJ?=
 =?utf-8?B?UUIwZ1ZsSjRtalIrU3RMNDRoUGVqSEd3NlYySi9MbUllWjFZa0h1S1Vvdi9B?=
 =?utf-8?B?eGpNemdxeVgvdlpuN3VjMlZPdWVzQWtZaUJxY2xvWTlNeDVmaWduVVcyNWQ2?=
 =?utf-8?B?MTE4SURzQ0NVcHJkMG9LSmVFRFI0elNUM003OUNUR3lkdGthNUl0dm5tMjNJ?=
 =?utf-8?B?YUpHY3BMeXNOWERXYXdZN2orM3p4d3R3NXRkVkFnOUNKVi9zTUFrK2RlRWkz?=
 =?utf-8?B?eVdFNlZhNGhpdG9DQURPZmh2MXpwNHZkbk5aSWI5T0RrY3VlNkdRUERWYW1W?=
 =?utf-8?B?Z003OGV3MTMwWUVkdTBLbGp0U2JFZVd4VTJsRDBIMWk3SkhKb0Y0bzN3ZWx3?=
 =?utf-8?B?QWdPTE05QklwcjZoZnNuZzlJV3dtc3hXcndma3ZNVUpvZHNkblVQblBRcktJ?=
 =?utf-8?B?UWJpZ0V3Mmhadk5kZS9GZmk4YUo4RFJ3WUU4cm1ra3U1cTJNR0VUTVkyaVVR?=
 =?utf-8?B?VEQ3TUtsV3dEQTk3WE0xOTBFZTMxRmFWM0dteXlHTi9ZblpFZk44aGFUNDVD?=
 =?utf-8?B?SkpjUmdZTDdaMGk5Y2dBOTR5UHlLU0JUdkhlYUtjR00zY280Zzh3aS8wQW9v?=
 =?utf-8?B?Uk9DcFppODVZQzRWNERHdjZ4aXdIUWpkNHRkd1BWaWg0NFhSVEZFWXNKYUZN?=
 =?utf-8?B?UDZIelQyTVBieXAwRXBQOXhnV3YwTUdzdFV0SVVhOTcwbkdCaFVJb3VUYXJP?=
 =?utf-8?B?K0RNbEcvZXo4d1F3Q0xuMUVjbXdWTUdWanJKMGIwNlBKOExRVFJDQUpNL1d4?=
 =?utf-8?B?VkxOTHZIenluQTZZckpsckIzOFJKd2hpU2dYQXhlV3cya1k2VkFTRGI5aUxM?=
 =?utf-8?B?UmZNNndqSXlwdzJQRCtGNS9nVnNIQTYzZDBVdkxrRXFtbEZ6QUY1OXg1dE9r?=
 =?utf-8?B?VmxoQWhSbVR5WDZWMUx3SHhhdWMwYm9mQ2FoeEJ4L3g5MjRHRWxTNTMvVi84?=
 =?utf-8?Q?j2tw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(35042699022)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:32:50.2424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5534a641-5e63-4655-e95e-08de2dd29b31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7592
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

Hi Steve, Boris

On 11/27/25 16:08, Boris Brezillon wrote:
> On Thu, 27 Nov 2025 16:02:15 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 27/11/2025 08:12, Akash Goel wrote:
>>> This commit prevents the possibility of a use after free issue in the
>>> GROUP_CREATE ioctl function, which arose as pointer to the group is
>>> accessed in that ioctl function after storing it in the Xarray.
>>> A malicious userspace can second guess the handle of a group and try
>>> to call GROUP_DESTROY ioctl from another thread around the same time
>>> as GROUP_CREATE ioctl.
>>>
>>> To prevent the use after free exploit, this commit uses a mark on an
>>> entry of group pool Xarray which is added just before returning from
>>> the GROUP_CREATE ioctl function. The mark is checked for all ioctls
>>> that specify the group handle and so userspace won't be abe to delete
>>> a group that isn't marked yet.
>>>
>>> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> I *think* this should have a...
>>
>> Fixes: d2624d90a0b7 ("drm/panthor: assign unique names to queues")
>>
>> ... as I don't believe it was a problem before the rearrangement that
>> happened there.
> 
> Oh, yeah, I didn't notice the commit was missing a Fixes tag, and
> you're correct about the offending commit.
> 

Sorry for not adding the Fixes tag.


I think the problem has been present since the beginning and the Fixes 
tag should be

Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")


Initially the code was like this,


	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, 
MAX_GROUPS_PER_POOL), GFP_KERNEL);
	if (ret)
		goto err_put_group;

	mutex_lock(&sched->reset.lock);
	if (atomic_read(&sched->reset.in_progress)) {
		panthor_group_stop(group);
	} else {
		mutex_lock(&sched->lock);
		list_add_tail(&group->run_node,
			      &sched->groups.idle[group->priority]);
		mutex_unlock(&sched->lock);
	}
	mutex_unlock(&sched->reset.lock);

	return gid;

If the GROUP_CREATE ioctl thread somehow gets preempted immediately 
after xa_alloc(), then another thread might succeed in freeing the group 
through GROUP_DESTROY ioctl.

Initially it would have been very difficult to trigger the UAF, but
d2624d90a0b7 ("drm/panthor: assign unique names to queues") would have 
made the code more susceptible to UAF.

Please kindly correct me if I interpreted things incorrectly.

Will accordingly send a v2.

Best regards
Akash


>>
>> Thanks,
>> Steve
>>
>>> ---
>>>   drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++----
>>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index b834123a6560..a6b8024e1a3c 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -779,6 +779,12 @@ struct panthor_job_profiling_data {
>>>    */
>>>   #define MAX_GROUPS_PER_POOL 128
>>>   
>>> +/*
>>> + * Mark added on an entry of group pool Xarray to identify if the group has
>>> + * been fully initialized and can be accessed elsewhere in the driver code.
>>> + */
>>> +#define GROUP_REGISTERED XA_MARK_1
>>> +
>>>   /**
>>>    * struct panthor_group_pool - Group pool
>>>    *
>>> @@ -3007,7 +3013,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>>>   		return;
>>>   
>>>   	xa_lock(&gpool->xa);
>>> -	xa_for_each(&gpool->xa, i, group) {
>>> +	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
>>>   		guard(spinlock)(&group->fdinfo.lock);
>>>   		pfile->stats.cycles += group->fdinfo.data.cycles;
>>>   		pfile->stats.time += group->fdinfo.data.time;
>>> @@ -3727,6 +3733,8 @@ int panthor_group_create(struct panthor_file *pfile,
>>>   
>>>   	group_init_task_info(group);
>>>   
>>> +	xa_set_mark(&gpool->xa, gid, GROUP_REGISTERED);
>>> +
>>>   	return gid;
>>>   
>>>   err_erase_gid:
>>> @@ -3744,6 +3752,9 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>>>   	struct panthor_scheduler *sched = ptdev->scheduler;
>>>   	struct panthor_group *group;
>>>   
>>> +	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
>>> +		return -EINVAL;
>>> +
>>>   	group = xa_erase(&gpool->xa, group_handle);
>>>   	if (!group)
>>>   		return -EINVAL;
>>> @@ -3769,12 +3780,12 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>>>   }
>>>   
>>>   static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
>>> -					       u32 group_handle)
>>> +					       unsigned long group_handle)
>>>   {
>>>   	struct panthor_group *group;
>>>   
>>>   	xa_lock(&pool->xa);
>>> -	group = group_get(xa_load(&pool->xa, group_handle));
>>> +	group = group_get(xa_find(&pool->xa, &group_handle, group_handle, GROUP_REGISTERED));
>>>   	xa_unlock(&pool->xa);
>>>   
>>>   	return group;
>>> @@ -3861,7 +3872,7 @@ panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
>>>   		return;
>>>   
>>>   	xa_lock(&gpool->xa);
>>> -	xa_for_each(&gpool->xa, i, group) {
>>> +	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
>>>   		stats->resident += group->fdinfo.kbo_sizes;
>>>   		if (group->csg_id >= 0)
>>>   			stats->active += group->fdinfo.kbo_sizes;
>>
> 
