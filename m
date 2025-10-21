Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08070BF4EA5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E55310E2D5;
	Tue, 21 Oct 2025 07:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="c6w7xNT/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c6w7xNT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B84B10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:20:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rfykrCowdxR33AHgLmrdBUVFYg4wKS4d9FyvK1KD8xfvcKkmrmiNgkkbFtLspo8vOjEDh7eFBYOA8zFTjDhoH4di8nL87/T/PyEkE0wTGLPRLNsVF5OH3CaHfqQSRrgs+DgA3bnALoi9QHbeC1/71Z50uOgYOqAnUIwhec1pYFfQTLQUC8+7402w0UMlxEYFjIuXx7k2LkpxbRVTKcjHgZ4mJMzmjfgIWgjyiXk8wb1lwTbTHfiOe1cTxdqnDd8th7ndSrqeRbnZgZ2pZzbhG+0ItYGEk/RCHkZR73g2xRREjMrL0CYtndTgaRo5wE2P221qQ4ndceTzpV93TVF7Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET+ZIh8Y4zKP/03wJ2vNfJdeRmdoSvBLBK2wnpObr1g=;
 b=ODpkHRKXg7uEd0DFq05QRvsrV2YChSMoXPfjpOAlq3eNN61gsN+OQcdVVBlLM4kLUJwFsaf4MqW/jh4tOYp4uTxTMr7o+PuloLuOzhfmsDPDpXOBI1hk1XySv1/nkuDkfOpfnR3C6NehsG3UIBl9AG/1I3YXlF9T2G3zg0iZF1m55qeDuhTYd2udNtg8R2TcklnM9cJEvTEYetO9TsGdsJLbYTpolqwljzHOLtYvMaxSwZhci9xkZp8VT1D9Sp4uqN4Z7EGcTTOhmp+lO2RT0Qyd049cb37HxyotFZpUfk/M9xCTO6p9kyge5BGA10U5Q2LPfMqePYaDfAS3WxEMEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET+ZIh8Y4zKP/03wJ2vNfJdeRmdoSvBLBK2wnpObr1g=;
 b=c6w7xNT/SSggr2bnTUE9o/4gb0nDAlLwHGdgA/8kdUxxZ3dwIHbu9Cb6tP0MFIz5YnFP1XnG/xfLefAlnAY8mrqJHsPCFr3kdoVXq2Tqz0MSz3Wa56UMPHEYcO3Lu5pcNKhdmY8mHgBgm3Vjwa44/fg+j2E3imk9WYooidQxej0=
Received: from AS4P190CA0044.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::8)
 by VI1PR08MB10242.eurprd08.prod.outlook.com (2603:10a6:800:1be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:20:28 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::61) by AS4P190CA0044.outlook.office365.com
 (2603:10a6:20b:5d1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Tue,
 21 Oct 2025 07:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Tue, 21 Oct 2025 07:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnRS4bLgnk9oDTlXsD6euDHQmWKffUfC2Mx9PPAphQlulT5+RbgYE5l837BGOCtInZvK7ab9dkP1lNWUCsoUdYYhPA32RjcGso0NeMYpVep4WUBbHu342UF8mzzTdkQd5cfAh4V6bxAKUqFeWzfiLlj1GK88/u20Jwv87GMcUc6rF77yeIy1BbHQf2AwYjUY1e2EuM28xHuCLLC0lQ4bmBzkY5VasbFVz/24vVXktiQRzmCbYf8scS4YrK9yLueuR36Ce7efhvSFkSMPGWlBughWH+26UndOuC2e4BgwzOEbM4uldFnKJFLSr96kF+9hNWNXMPLshnWOR7LGcmElqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET+ZIh8Y4zKP/03wJ2vNfJdeRmdoSvBLBK2wnpObr1g=;
 b=WPjIZncIXWVce3fH7jG1+cCqbwtkimeewTIvOU6ucmq/co/UE7Ed3r71OPllLCaMK/XVJjZT9dxSaOr8gZwLZHrKc9lBpq7y3XjJSynCd3vo3UcCPStNP9bUyUwXKohf1GE7Lawy+O2z/hBAVM9Tf1opGBrrCrHXng0q2bfBasN5ipuuXCgOTBlnwD+xeb9O6jEy2tKV8X+pRtKXrdvdFBSllZrpWrvEuZQyCNlHnvW9+5qxxeN5XK+yeK4oZLJh/AZa1cuyDii/7Uv7SdbcHDuRDW5oeLMF4WJQeaJwdoiP9A5skrfCTXXfcoB9xGoEadEcfyZ6HSuJEdyPTpRFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET+ZIh8Y4zKP/03wJ2vNfJdeRmdoSvBLBK2wnpObr1g=;
 b=c6w7xNT/SSggr2bnTUE9o/4gb0nDAlLwHGdgA/8kdUxxZ3dwIHbu9Cb6tP0MFIz5YnFP1XnG/xfLefAlnAY8mrqJHsPCFr3kdoVXq2Tqz0MSz3Wa56UMPHEYcO3Lu5pcNKhdmY8mHgBgm3Vjwa44/fg+j2E3imk9WYooidQxej0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS2PR08MB9762.eurprd08.prod.outlook.com (2603:10a6:20b:605::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 07:19:53 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 07:19:53 +0000
Message-ID: <05536809-2c86-43ee-9139-1d73ae427405@arm.com>
Date: Tue, 21 Oct 2025 08:19:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix kernel panic on partial unmap of a
 GPU VA region
To: Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251020060028.1262648-1-akash.goel@arm.com>
 <95c053f6-bb90-4eca-beff-0b46ef251a32@arm.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <95c053f6-bb90-4eca-beff-0b46ef251a32@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::17) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS2PR08MB9762:EE_|AM3PEPF00009B9F:EE_|VI1PR08MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: d5647db7-a080-4a16-2723-08de10724ec1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?N1dLa09TdzFmcGVvVmduTVBLUU1TeEVDeXVDZVljT3lESVprNVNqWDBvYlY1?=
 =?utf-8?B?RDVvYkt0MkZZaStYR1ExUHlobEhvU0Jaa2pXaVJaT2wvcUNVOVZGQVN6OWpx?=
 =?utf-8?B?U2JCQ0QvZC91Rm1DZTlGdnduRUxSNTZnaFBabUxUZ2VvSzcxSXJ1TnpOSlFW?=
 =?utf-8?B?VVFpZEMraWNLbUFxU1FjS2tHWGRLTERJNWtENkJYNHltTTMxdjBWRnlKT1ZF?=
 =?utf-8?B?SHVyNnJSSTh2Snlsei9mYmdoYnJ4K0Nlc0pvUGRvYjJCOURDSEQ1WDRERHZx?=
 =?utf-8?B?QzdlQ1E2VklSOW1iSFl3ajluanphOW5JNnlmZENPMFl2Q1FsRnpGbmFNWmFV?=
 =?utf-8?B?TzZhdDhlQnFDemgxcDFLZmJRZ25lS2hBR2p3K05xY0R4RzZwa1p6LzRpWG5D?=
 =?utf-8?B?Z0tyVUQ0bUtEUWZCRlhnTTZwTWlvelpLRk43d3A0ZEt2b01nbFFNeWZjQnQy?=
 =?utf-8?B?QzhGbG5TUUlxOTRzVUM0bHQ2dlpmOUVVcEJaVENWZWJmejZtcU4zYi9oYzVo?=
 =?utf-8?B?MkdJN0pxRlNWcDBRUkdpZFhCUmU0ZmlwbHluNkVRcG11MWd5WTVySkUvSldr?=
 =?utf-8?B?cmdxVVRHdE44NFZ4ejdaRHhSZzdpTnpPRHN4Ny85eTA2YTdyNnZRb04wZDdo?=
 =?utf-8?B?YXhuT2VtVUFQWTlrR2hWK09lVHBmMkVwcVU0eFN0Z0JzNS9GcUxyWFBDZ2VB?=
 =?utf-8?B?WTJ6YkxlZXNOTkRZdHlYbGhkRkNmUE9sSFJLL2trY0FTY2hzQTMyUWtmWjRF?=
 =?utf-8?B?YThLMHRtU2JXSFlTcWc3aEtObjBoaXJtcVpQQ0FGVmJ2SzM1c2pEWVV5SlAr?=
 =?utf-8?B?RitMRzFDMHNVK2x1bVVnNGUvb0sxRUNOT3FQV0tKV3hETy9TRzhlaFFjT0tI?=
 =?utf-8?B?ZVJ3T2hhcW9NOC82S0svSHFMVFVYUUhIRk5XWXJoWXpkcTdnZ2VWamROZ0h6?=
 =?utf-8?B?ZGRNaDY0Qk5IWFVXZVYvbStVbm1NajNMODhONUczU05qMDFwaUpvYTUwa0JU?=
 =?utf-8?B?M3VZNGEzQ2lLOFJYeGwwZXVudlVubE1lZE82VjU5eTlORGtOZ0szZ2llNW9P?=
 =?utf-8?B?N05uMm84clVPUmtiRXZISUJUY3hHa25OZVFGbTVaWFNHT3lwNWw4M0xtcWp1?=
 =?utf-8?B?NUpOVUJ4MjQ4eUpoSU4vakRZZHU5QmtBZFUxZnJQelUra3NVZkpZTkRQZkFj?=
 =?utf-8?B?a0RXSitYbzRMTjAzQjZFWEw5aU9uQU9ublFDZlNFMHRkK0FORmMyRUF6VnJR?=
 =?utf-8?B?Ylkvekg0VTF2Z01ZRWNTK3Q5ZE4zTDR4VEQrQW5TZzVZSzVoRXkzTHdyS1R0?=
 =?utf-8?B?dFl2bHhQMG1KNnBpbkd0cnpYVFk3clZKdmx6OFRGaFpSSTdFNkdUU3dSVTd5?=
 =?utf-8?B?dWgwWEFLaTJ5OWQ4cFhIUVlXbmFCaVFwRVJCYTd1ekZmL3BqRDlrS1NKd2ti?=
 =?utf-8?B?aFpSM252ZTY1YjBuQjlzRlpzZE90TFVHekd1TEE2ZklnZGFjUDVCZGFxWmRF?=
 =?utf-8?B?eUUxNVRyNHk3ZU9oMWpDWk1ybEhFdklLVThScWU5bE1SWVVTOXNra0Y3eEFG?=
 =?utf-8?B?cFMzdTVPdlBJQlJuNHBiUXRrVCtHVnZvUWpXYmVnRGtLVnpuRUZ4WkRxSmQv?=
 =?utf-8?B?WmMxZHFlbTV6NDdXL2xBelpyWEM0SXJ3RWpQMGRFTFpZSW1mSEJ0bWwrZWdG?=
 =?utf-8?B?THEyRmVkUVpWMGlObHZ3d0ttbEVEcGMrZGF3S1ZJcDZLaVF1QWJ1TndPcDRU?=
 =?utf-8?B?NTc1VjhZQ3I2d1lMVkNFL3I4L0VYZndMbXQxcnVEckVEdU5OL3FDZW5pZ2xB?=
 =?utf-8?B?KzJmcHRTdGxhcWtQZmhFWXd4TFMwOU5MZFB5OUx4aU96UDVvNmxNTHU1a1hG?=
 =?utf-8?B?SEE0ZUEzNktyb0k4TGM4MW5JN1pUSXdCbnlWT0pmTE9TeE0wU0NoR3BDUkFD?=
 =?utf-8?Q?/1BNCj/d3jAKTB3pE884HxsOYkvH3bNE?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9762
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ccabad5-161f-43b5-aa25-08de10723aff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|14060799003|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3R2R2JQVHo0QThUMEZaQkJDQUxzUE5JUysrTGg3OWxIR3E2eVk2VzBaYXNj?=
 =?utf-8?B?c3N3cHFVMXdSSG42V2pqbUdlZlRXNXpHdWpqK2N1Z1lPY0UvRWN4d1JzVFhL?=
 =?utf-8?B?MDgxTEFvSktUeGs5VFFRZmVwSXR5czEvLzVuaExSUFQwNmc2dVpINDF3Z2Mr?=
 =?utf-8?B?d0Q5cW13WVpYZUJERXlxcnVuanBaVmd3cmhlWkxEclN4TURvOUJnNURIamJo?=
 =?utf-8?B?TVBQZzNBK1FKV1Fjc1pnaVBWcDZHZ1RDN1pmQ0V2RTVXc3RYZEdpWlE4a2dl?=
 =?utf-8?B?SXRrNVcydXZQRU5FbW9hK3ZCVE1uODFJQlNCNGZrWGxvWS9XL1I2cDQyaXJ1?=
 =?utf-8?B?TXR1TUFINy9hQ2NEMVg3djlqN0s0bno2b3JrM2o3RjZlbndPbE5JMU5IRTRw?=
 =?utf-8?B?YWhralh5RUhDb3NNNHdmMWpKNjVCYW9sTFU5cHBtaWxhSlRtWG53dkFhSEl4?=
 =?utf-8?B?aER3NFVaRHNmNG45cnJOQXlaNEl4YjRBV0tnamxEajRjME9keVNCR1VDZkRs?=
 =?utf-8?B?azNoUzRRNVgwNCs1dFNwU0FUaUlsQktER2ZHRUk2ZHd0cUVSeEFFZzlOejY4?=
 =?utf-8?B?RDFUYVYzVm0yZ1hPZ2p0bkhqRnRleS8wUXhIR2hGWUx5ekV1QkNQZ1VNc3Bi?=
 =?utf-8?B?eUUwK3hiTzMrVWpRNUV1ekk1K3p0aVdiU0t4MXorNDViNUo3RUwwZmk1bW92?=
 =?utf-8?B?alVRbTZLREZxU29BdUo5VzlUUlcrN1ZSN1hrT2s1TDJHZjFzNjB4WDFYS1la?=
 =?utf-8?B?UFhwTGZZWXR2cUZXMFNUTVlMQ3ZrZXBFWEtaTG5rUjZ1UDNWbE15MUNidVdN?=
 =?utf-8?B?Q1NTc3FoaUJUUnIzYTNqTnQ1R1MyL1BQK2JvbkJPRzdhd3QxV1hjL3pPbzg2?=
 =?utf-8?B?V0tRZ1hXbW8zMkJrbWhjOFlES1Y1czMxMlMweHZTSVZWdmo2bGdqN3JURmVG?=
 =?utf-8?B?QmNWWEZzT0wwdXh4b0lGbDJPdkxWQUhKWjUrMCt6NWk1MXZRWlZxdUVDL0JS?=
 =?utf-8?B?VmRTd3BmeEJzQjg0TXdRcmUwMGdQMkhEYTYzT09vVFBLemRiZWJBaXZyYnov?=
 =?utf-8?B?NmJ3TldWMFJQaTYyN0pjRGtWOFBSaDZCYXBLSEY1K001U2YzYUJUV3ZkSEJK?=
 =?utf-8?B?SCtxQXNvY2dzTDh3czVpQkt3TUR5MjBKWk5raVlQWEF0bTRpTThRNXdqOURO?=
 =?utf-8?B?RkNiUGZZcUFiWjFmcVI2aldVSmFtMTJKdDRKcG9JYU5sNmZiSnJKRXNZaWZs?=
 =?utf-8?B?aERmU1ZLQnlHVlNXaGJ6bTNJd0hGNVd3SXNDRnY2TC9PYVh6R0JnUXNYZ2NU?=
 =?utf-8?B?OVdkKzVHTzQzQWVJQXVQdGNuc2tZWGx2K2FjeUZweThrUFpPTEJTYjcyWXY2?=
 =?utf-8?B?RHlLNzdiaVlueTRzM3grTnZPY3UwTHBFMG9PdTQyd2x6L2FCYjMza3BDTmcw?=
 =?utf-8?B?UEladmpybGpzSEM4dnBVS3JQaWc3cWdvNk1xbzVoWnNNNmF4L2VBczhiZVBk?=
 =?utf-8?B?dyt3N3pNMnZrMnhydFV1SWtrNnJGb0tITnpPVjFzd0ozU3BPeFhBQXpReENl?=
 =?utf-8?B?U3RqcXVwS2Nhak10ZXh5WU9maDViNDd1SU03Z0ZrWUM0NXNOaFpQUnJEVUFQ?=
 =?utf-8?B?aUo1QnpkUUMzWnhUaTBibCtBcmxVY1I4eWQxN1pEYXJ4ZTcyZU16a3Y4RWFU?=
 =?utf-8?B?WCtEZi9KUlpGQ01VeTBBSzBqY2c5ZExQNklWMHV6U2ZKQnQ4SkZjZ1IvRmhW?=
 =?utf-8?B?Qmw3dWEwSGhjV0FjeXpSNGxOVzBBcTJNKzlWdVIwM2VSS3BKdDdKZHVaOWxO?=
 =?utf-8?B?OVltMHJraWVhTzJNdXdDamNQRWF3cDFlUFcyVlhsWklnc3NpMFIrcmpRRUZF?=
 =?utf-8?B?akFnQlUybk5Ncmc4Q3pJckFUTGNXeVdPM2FaMmlOZUpiQUMvc3d4SFFHbWpz?=
 =?utf-8?B?dUUzc0wvckQrQ0VVbG1CRUswK0F6dXJJcGhUZzQ4eGt1YXN0SDV5RE4wd3RY?=
 =?utf-8?B?dHVnVFV5NGtXUVd6Z3ZhMXRSQ0VYbWw4NDdkcFV1VDhHV3RrV3pRa0lpTFBG?=
 =?utf-8?B?WWdPQTlZckpNVldwamR1aWY1bWVZSmhoRVJ3NEdFTDErcjRLamhlRFM1RExy?=
 =?utf-8?Q?k9B0=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:20:26.5888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5647db7-a080-4a16-2723-08de10724ec1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10242
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



On 10/20/25 16:44, Steven Price wrote:
> Hi Akash,
> 
> 
> Sorry, perhaps I wasn't very clear. I've already pushed v1 to
> drm-misc-fixes (with the fixes line and the R-bs):
> 
> 4eabd0d8791e ("drm/panthor: Fix kernel panic on partial unmap of a GPU VA region")
> 
> Usually there's no need to post another version just to update the tags
> as we can do that as part of applying the series.
> 

I am sorry Steve, I am not well versed with the up-streaming process.
Thanks for clarifying. Will do as as you suggested for future patches.

Best regards
Akash


> Thanks,
> Steve
> 
>>
