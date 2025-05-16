Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDDAB9E29
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178B10EACF;
	Fri, 16 May 2025 14:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YLrSgRwZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YLrSgRwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3751410EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:06:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TZUZOS+MTrqHfgoSEIQjxJBLfZnD8sBlxlcdreWGB8AvskWW63ugbjDcsgtBSA3Gc7nT3Ii68i2eUerB3PAZaCx4PSWFK3iWu8aIxfb7yB+lq1d10PNbiHhhMY2EOb0Uo1L2NybwCL5Tpik7rl5KuXWch0K68mCC4pMo+mulHW9KHqYZPM5Tv2jrqMnRhcaT60FnRY1fPfLVKOvjjrabeciWLDDjtsfQKLndciGXIa9jM+NIhS2oBd8DaZP7WGSfHMLBD82dWdLpi93wBlmrwq34bqoZuU2CW5+zuKkq1kSz08Q5xA4CCIPWnh8JLJJBEnKgjofUl5cR9hxXL5hhSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GRS+jTPIdwdfCuVoJxmVAopdtSiXYEt9BnBLB0mVt0=;
 b=rF9s95qkkGiRg8s9M90CncEzX57tbYXdsuoFbaUefZCT8k0QuYiQ2Vm7hlljbrlBfO6P6ff7EPT2Yy4fQsxtF8CueS/LlworgxD3zwqhJc9xxUB6qskBpYVNaUOFGkvHc0K/7j61mSCgxVjvzOGayoIJe34cfRus1nUTqsl5AgCmujLxiBkfiDk6dZwcO1JhfDhZO3p7kvMF3ETdTaaZeIOfEiI70AQdKDu1Eyhy2dKR/KLug3T2Fo2CVBt1MuzbhmmND3uJWUV829EpM8b5b8pVX/EBHlC+fkwNtpa+UJj9LMRZR+sOeWzmP6cHhZ7eHhbRyOAj8fhtk9vF7FC02Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GRS+jTPIdwdfCuVoJxmVAopdtSiXYEt9BnBLB0mVt0=;
 b=YLrSgRwZE6d9KXRfnw2efO7Foer9kJzH6q6aT4QbODX74L+WeWld3iAVYPQffFqAqzTVbvCCzAucawfdHuPqT2vw0RCuW4K+GlYIUJQ5/xtsKDMPuKwxbKo6I1iBV9ByQr4/TwM8C9ppdiPVN/LyfvwI+YMVVBH5XLihdLjl/ss=
Received: from PR3P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::31)
 by DBAPR08MB5751.eurprd08.prod.outlook.com (2603:10a6:10:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 14:06:15 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:102:55:cafe::e0) by PR3P191CA0056.outlook.office365.com
 (2603:10a6:102:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Fri,
 16 May 2025 14:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 14:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjaVL+YEoG8UCucpn5wDTeJAbYdzowUxFDwKk5baQpEgsunNk2HEmGKQWVAJhKyGvb3gbnqUVRPejV0ZAaEW/CnDMD+BnPVOAbzcQnZwwYxAHBKpl6MvxGapRhBW1yUAX3ff7chCdEd5jDzXqoOd1G7NCq4fSQ2JjOBjKgxIsavCZ1iPsInj79EOLRyK4KahWrXs8eX7UEXjNsPrPrMyyr2WAqUeJNQalE9bKsK0zgULb8/g+lbvVzXM06hshG+j/dydN4pubZ7JSiXtAFJlOlqUa8KkOSnKclA+JITyi3hN1AxCWEWO9Sf3dBbTkWLgfH1PaeeJU5RJFDMAI/sS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GRS+jTPIdwdfCuVoJxmVAopdtSiXYEt9BnBLB0mVt0=;
 b=jPij5qnH1nZtW2Q4+Kz6yGZ/fSBQrSFcWJe3RDgSEEgTlZvYH8hXixE9GnLplEkbw+n+RyDCH/mH1J0M9kE+LIBGwngM58U4CoTxLa04qKWACkIQ4hVVPlDLyyPjZqD2d3lvugQjh39bfCKYdCTqk2xL9bkWS40JI4zXb41mhW94kBnAbHa6X2W3dJBtH0mEPFr++jhgBXZyk9RkaaKcEudubxBDrH+kZWF3ZfwkBIS+XfrJNqRni+xzt2r7nTOD2tZP+OSAh5H2gVdDP6uWbSXnrUyJeWtBZhiUrjCbHpkQ7Sy1FLWS4R4+Lw3TGVZ4dq6+2WZEGBQL/B5nh/IBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GRS+jTPIdwdfCuVoJxmVAopdtSiXYEt9BnBLB0mVt0=;
 b=YLrSgRwZE6d9KXRfnw2efO7Foer9kJzH6q6aT4QbODX74L+WeWld3iAVYPQffFqAqzTVbvCCzAucawfdHuPqT2vw0RCuW4K+GlYIUJQ5/xtsKDMPuKwxbKo6I1iBV9ByQr4/TwM8C9ppdiPVN/LyfvwI+YMVVBH5XLihdLjl/ss=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by AS8PR08MB8224.eurprd08.prod.outlook.com (2603:10a6:20b:52b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 14:05:42 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 14:05:42 +0000
Message-ID: <7ae5cc02-d969-41f3-b531-9efcf4cf93df@arm.com>
Date: Fri, 16 May 2025 15:05:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] drm/panthor: Add performance counters with manual
 sampling mode
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
 <xqxyuzrerw5b3rndifpyklkarzio2j7ioe7nyedvhli55teevf@kb6lkfueeypf>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <xqxyuzrerw5b3rndifpyklkarzio2j7ioe7nyedvhli55teevf@kb6lkfueeypf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|AS8PR08MB8224:EE_|AMS1EPF00000045:EE_|DBAPR08MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d4cb78-80e2-4b77-b94a-08dd9482d1d4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Y2QrcUtwcHB1aGVkZitBanRieUYvclVNOTMrWGhzTzdwYlViWnhpSURHTXRu?=
 =?utf-8?B?WVI1WU1pQ3VadFMyRU0zTlFhaUw3TFB1VEFyRUw0T1gxUHUzTllYZG41WnE0?=
 =?utf-8?B?Sm9RNW02WXBudktEMkpEUVJPckYybmxIUnVEMHBhRGRHcFRQaFozS1RUYk10?=
 =?utf-8?B?T1RhendoV3JUT2I4LzFKMVJPdEc3SHdRbXkrSnZxQXh5a3BMVWhBem54Tk1J?=
 =?utf-8?B?cWw1WmxKVkhaNkdFSmtLUjMzNVJrV1h4cjdSR2pwY0Z3aVk3MTAwYkU0Wk9j?=
 =?utf-8?B?VEE2Qi8zYzF6eC9VUXk1MGU5YUwwck1wYzVPelVGS3dKQWVEWHR6UTVnbEpa?=
 =?utf-8?B?MlpScVhna2Y5RUpzd2xPZEFxZjB1b2I2VFlZNGlCMm5KNitPaE9qNUliTjVG?=
 =?utf-8?B?ZHZ0c1pFS2lPV2FPcXAwWWkzVnJneEJ6di9keEdhbDVpc0tiN0l4L2dkWXZE?=
 =?utf-8?B?bjZhb2QxYmtaQ1FJVXIvanAwa1Q5UElQbFNhTitVZTRPOWYya0dMWnVocktx?=
 =?utf-8?B?ekZ5bTUwbWcyd2w0bkkwSGEvY0RYMUJpUFNuanhFalVYZEVtMVdPOEs2V3NP?=
 =?utf-8?B?OUNvT1FLcVFZTCtRZDBqRWljMlp0VlFJaU5xYld0d0ZSbmtZdTVSSFdyZ2ND?=
 =?utf-8?B?azAxaUdOVDMzcFI3RDFUV3JaNWdpV3RwWlhaV2p6ellLUDYvYUgveGVNZTVS?=
 =?utf-8?B?Qk9wOVBURkx5UkIrWEs2dUpUTTFEdm5FckFVVmJWS2g1QnlLRTRPdnU1RDZ2?=
 =?utf-8?B?ZStvWmY3cFlxRGRnTmlyaUExM0dYdUJMSW1pVkpPQjVzMS8zWHVMWnRQMlJP?=
 =?utf-8?B?WEJoN2NEMmN3ZS9CZW8yZWxkKzFOMVZuR09jMld6bkY0QWo3b081NklxdDVk?=
 =?utf-8?B?NjdnMGdzT0Z1a3R5L0tQazgrR0ZlVTdYQ2twS050Ui9pNG1kZW02QzZpUlN3?=
 =?utf-8?B?Zmt0VCsvTmNSKzVWRkpVeGJvdEhTMXg4aXRnNmJoR25hNm5RRC9WQlFidWdV?=
 =?utf-8?B?NVp5Y2F1UFBIclVMS1lSbGt1QzY0eFo0aGc3dDVRdnBNV05qQ1VGQ2VTVzd3?=
 =?utf-8?B?c3c2V3RyWWFPNmkrRWRaTU1uNnNZbzUvcFZldmxFVDNhQjQwOUVEMnM0aFBW?=
 =?utf-8?B?VlVuYnhUSkNYbzdFSHpjWWM3UUpjK1RrUkhFc3NFd2t6RjExWnZpQ1ZvVTQ1?=
 =?utf-8?B?R0k3RzBiYUcvOURkMVJqdXo3K3VJS3dEQzZ1Q2JRejNnV0dRNU81S0Y0a2wy?=
 =?utf-8?B?MnM3R0tYT1k2cWlnVHJkdEFCWENYMXpxd1owZzhIS2lwZVRqbm1DT0sxRHpU?=
 =?utf-8?B?VUh0UCtrSE92eDdDTnJZcTd1WXZrY00xKzVLbnJaaWZ1VzFwUVA0elFOb3hm?=
 =?utf-8?B?a2tscTBlVWViUk1hbDVEb2V1U1Z1bllNZTVDTU14OGZjL0xzY1pLQVJqMzEx?=
 =?utf-8?B?WjZ6WW93d1JBUWdNMjFqaUZXNFpRM2laY2ZjdkV2Q2k4V1FJMFc3MUNBRGJM?=
 =?utf-8?B?MWMxQjJ6OTZaZUNnc1VsVmVzN296Q3doRTNDUjU3dFAvN0craEFDTDdRYkd3?=
 =?utf-8?B?Z0VCT3NTNnVGMnlRUDNENzNySUJJSVdhYmJCSWFhd2FNQUlSL2ZJNVhMS0Z1?=
 =?utf-8?B?cTYrV291cmtlbTVXUXM5YlA1VldRak5kcEREZzlIL1ZZOXlpYUlTZ1BrMmpa?=
 =?utf-8?B?T2JVSFZZalkvWnlQeHdVaXA5QUsyLzFwM2t2c3Z6QitPMTZidUxWQ0FvOXFL?=
 =?utf-8?B?V0phSENVY0ZLSnFHK254ZUNlaTdkTDk0V0Y2N3docllPNTl3TFRLRUYxNU05?=
 =?utf-8?B?azRoeE9YOFkyK0FDVFRKZVNuZXNKV1QyN0d3S2ZDc0x1bmZmMG9UaExMbkpD?=
 =?utf-8?B?cytlb2RTRXVxdHQ0TFp2N2dLODJFTUliUU5sQWhXUkxTcllqZ3hRTDljbTZQ?=
 =?utf-8?Q?E6440SIlNR8=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8224
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 773e8e90-2027-42b1-4420-08dd9482be9b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjEyRXNaaXJWbEJWVkkyZUpTL05pTmFYd1JyRVJnODFZQkZ5dmlLQWtnVUln?=
 =?utf-8?B?M1pWdHRjT2prakdYUlRtTUl4d295cEVVVXhIbzIzYkROaEttOTZVNHcydnR3?=
 =?utf-8?B?UWpYeGlMK0JHNHUxdGRFRGFBVGRzL21XdnlIL0dFYVBoaFRZbHo1VVdaZWEx?=
 =?utf-8?B?dFppUGlNdjNhNmkzdjFXVFFsSU9nNXVoaVMwTzRkYkJGRU04RkhvRHZRT2U0?=
 =?utf-8?B?Q051czhNeFQ5R21KN1ZXNWc2eVUrcWJSeUp2SmF4Qlh4OXc3SXUvMFRUU3VG?=
 =?utf-8?B?Z2hqalU3S1FMRkE0Qk9ZSGt6MjNYVmdYSmg4bWk5NGY0WFdGUkRXOHJENXRN?=
 =?utf-8?B?VndiQkRKNWhnS0R4d1FRVDRkT3ArbHBsNUFRTVN1N09Wd3dxYjV4dDNheXpi?=
 =?utf-8?B?dkdmUVJoMHI3MFFaUGlaKy9Wd3czSWd3T2xMSzJqRnR3SFRIZVdrZ0hmWkxC?=
 =?utf-8?B?UjAxNXVpTlZscGMxWWhaNlgyYzkwakt6QzQ4eUhYL01xNnBkQVVGczFOaC9K?=
 =?utf-8?B?MG1UWTcrYitrSUI0cm5FSzNYTjNOUkNKY2dPVlh4Wng5Vzc3emdlRGVQVHlU?=
 =?utf-8?B?QTAzc3U1WnVHMmNBYW9MVEhwc3dLNkZ4Z1NlcXNEaWpSdEdEWStGb2FrL1NO?=
 =?utf-8?B?eFlOeUpjTVUwZjUzUDdTQUFsU3VicXV2T1ZYMzdyQmdleml3KzVoUmdpc2ZE?=
 =?utf-8?B?VWZrNWdZQnVydzNlZVk5SWxwcVhHVXBzTW1yajg2b2cyMmNSeSs4RlhqM0xn?=
 =?utf-8?B?OTNpUnd3cFBxTGgzRXZPdXVIZ3JNby9sRmtINW84MDZacVpBOVZxZmlJZTYy?=
 =?utf-8?B?WUdFbmZISlZ6dHNINUUzWkxGTlRVSzl2YlhlTzM2d1AwMkxwUDdQWHZRWjNG?=
 =?utf-8?B?Wng5N0Z0OE9ueWhNMU1NYzJPelljUHNocnhBQmYwdElweVRDcnhaaGY4bk5z?=
 =?utf-8?B?REh2TTlWQStzaUxWV0ZkZnpGTGp1U3V4QlQ2S0h1K3B4OUg0UTFWMm56OE1Y?=
 =?utf-8?B?LzRRN2JSNzBlK1ptWXQxdTJQbWNIR2dKSnJoWlVwbGluZVVDdVp0aDcxODN6?=
 =?utf-8?B?K29lZTRJY2plbS85NlB2UEwxbnBWWXVKVEZTZkFOKzZzeGN5dE9iTTN4cDlZ?=
 =?utf-8?B?bWFsMEJFTXhQc3R2UmtnaG0rdEZpRzZjVm5VdXRiUmtiOGcxdlNsemhYQUsr?=
 =?utf-8?B?emwvQVRyMktURG5NN284b3hIaEdWS2grTDdLenhqUjEzdlpZYzA0cG5XazAy?=
 =?utf-8?B?OVFNSDhCZEszayswMkJHS1ZEamZzUHgxMG4ra2VzdjhDcGRnRlpTaHk1RElq?=
 =?utf-8?B?ckREYkFYclFrWVNsSVhndEFPVzRYYWVWTWRWd2xCWFBVZXREQnJHWUorRUdV?=
 =?utf-8?B?RE40Y0tsNzFFN0krcGxMQkVHSU1BVVZnb1AzM3QvbG1sRXcyM1RFUjdVNFhq?=
 =?utf-8?B?NjFYN080UngyT3NRb2xqQXp5a3pjUEUrWmQzT04vSythYzlyN0JISmgxZnZw?=
 =?utf-8?B?L2hFMUQxd3R0WVVGRnpiZHl0RGtFekl1VU1aamRJUGo2VE0wOVJVNGdwZWZJ?=
 =?utf-8?B?bXdZMmNSRW1XMHE3ckQ4Wm5odWMwN1dhQUFCK21iVngwVUhMaThrMnI4djdw?=
 =?utf-8?B?SFUrQ3hob0F5U3U3Q2NwOEdMbDlxcVFIOHRaK2tkQkdXR0hzcUJnUTZuUFpC?=
 =?utf-8?B?MGZCQy9vdmlzOWZyUFBHUmsvS01DYThwSDJNcjFXbkRoUWRMSXJjbzhpL3Nj?=
 =?utf-8?B?Zm1IaGxGdjEwTWFrUVhJVjhMUktCa2RlYm9rc2VtR0xrQXRnZDVaeXRhUTRK?=
 =?utf-8?B?czVsUHF2aG1UL0lGZWx2U21VN1dxTTZlZDdZcXgxNUVhNm8wczV4QUxoV1Nx?=
 =?utf-8?B?QkVsb3ZNemsweDM3TjBsa0V1T0pvSEQ1VjFsUUVrN1drVyt4cFBlbXQwZ0Er?=
 =?utf-8?B?WU1TRXVuT1pRODROU0pIL1lCc1ZxbHRjNGV4RmVVelViT2xWeWJhb0Ryc3po?=
 =?utf-8?B?dFJXOHhQcVpaVzBzeEQwbFVUTTZKZUhtRy9rcXhNOXBMT0wvTUEwOFVPRHhJ?=
 =?utf-8?B?bzZBWGZuQ05GTzFubUI4MURaSGREM3Z2b0Zldz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 14:06:14.2599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d4cb78-80e2-4b77-b94a-08dd9482d1d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5751
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

Hello Adrián,

Thank you for reaching out about the matter. Could you please clarify what you would like
me to elaborate on? I have responded to most, if not all, of the comments you raised in that 
review, including providing more information about the approach (please see [1] for more details 
on the uAPI apprach).

I am also in the process of publishing a Mesa MR corresponding to the v4 of the patch series,
which will be available. It includes additional fixes discussed in RFC v2, 
and I will provide a more detailed change log.

Kind regards,
Lukas Zapolskas

[1]: https://lore.kernel.org/dri-devel/55fb6aa6-89dc-404c-89fc-5c56d15d8c98@arm.com/

On 07/05/2025 20:54, Adrián Larumbe wrote:
> I wanted to review this series for quite some time but lately have found myself caught up in quite
> a few other things. I've had a look into it last week, but before I delve into it any further, I was
> wondering whether you could take some time to go over the questions and comments I left in the review
> for the previous patch series version.
> 
> That way I could know what changes you introduced in response to issues I raised, and which ones are
> due to a rethinking of the whole design.
> 
> I remember some of the questions I posed dealt with a genuine lack of understanding of the way
> performance counters in CSF GPUs operate, so if you could find some time to answer them or else
> point me to the right sections of the TRM I'd find the review of this latest revision a lot easier.
> 
> Kind Regards,
> Adrian Larumbe

