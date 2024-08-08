Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406EE94BA2C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 11:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6FC10E6AD;
	Thu,  8 Aug 2024 09:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Bzty1CTj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bzty1CTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951B10E6AD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 09:56:45 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=thMTUxXO1dFGwhGFmo4gapQsXjfrohHN3Xa2BtVQ6+gKg0Gdu2m4IGxdUoT9n9qKYXnHq2pD2XO3yHUeUtmGei9WkniLDfDoQXsDg9j9kP9fn2b5otjmKOOVEa73mH4mhz9UHFBofIvStNPrgSSvLM0/lGbZa9o+M/5d1XRZOOhp1urqxl7dULHhGQOUcqpIshetU7VmB4VCYSolXxtkqETeqchWKCEImxrgqbsmghYHwav23oZ/2uA73VY8rCIQ1SEgc/zMIXVFILx+PxKZpoSNI88IFZr+78ZJa2LXho0mH1tA9+0Lqz4VZnbU8qEnzAeRdgqQCEkTJUBTSzx1Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR40wwMefC19PswVHU9SnOs0SlB8inwvhsoGgHGnDiU=;
 b=bWKQ54gFYGMCTY+dp7VS5CDe093IKHDZ3j+F4ZuHGicm1t72lWI98MZFDcX/13Tvhhgh7qNR1KE+KYb4In7wCk55fRWHAFkaIQenoAMLgzRbEvBm35ON+0+eVp9kiIkR6fTwIQ9Ts2enzMkv7qrtTo/hfmuqbihqdm9X4nL5Ni66BzMp3T5y9BdAp5Hx4WDIxT1BZ5FYfBOalPumPulizud9HlVIjkEipgqwVnZAIw9LrwCwwfWNC7k1xQJwmBKkjOaVO08/Awm6B3150mWbz2VBI2nzbpyS+NYJ3UvUOPB2ImndH3GL0L7VZzzY1UXjO1FfNWjwWo+nQ5OWpXMICw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR40wwMefC19PswVHU9SnOs0SlB8inwvhsoGgHGnDiU=;
 b=Bzty1CTjqzP3d6l0TFS5FSby2n08TMrutmU+3mo7RMRs6FswT+QkhtIg97a1iaDMoCBJ3xVTezdU2ULmy8GVnkI9CunUwZRL+nAjFjskYIj60Z9STllJ1/lP6VhvOFb2QDHgnL3BVZ3hEqUzB771pGhDLRcClbarFvyCC+uTmwM=
Received: from AS4P192CA0030.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::18)
 by DU0PR08MB9583.eurprd08.prod.outlook.com (2603:10a6:10:449::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.8; Thu, 8 Aug
 2024 09:56:41 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::b3) by AS4P192CA0030.outlook.office365.com
 (2603:10a6:20b:5e1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Thu, 8 Aug 2024 09:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Thu, 8 Aug 2024 09:56:41 +0000
Received: ("Tessian outbound f9126a275842:v365");
 Thu, 08 Aug 2024 09:56:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8caf9ead765c589
X-CR-MTA-TID: 64aa7808
Received: from Le31f65da330b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FAE2729-17FB-46D7-ABD1-46BFBF7E6DDA.1; 
 Thu, 08 Aug 2024 09:56:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le31f65da330b.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Aug 2024 09:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kETjQ8D6kC986VD4nLS6Vo9XFmQhRCH3Z4Z5kP8sK//LFf/pBLXItostoOebXmrjDloY1HVsxFGCn7NYZYrniWJ/1FPDMbpRfzJ05XLvxljFXg75hW/czh6U79z0eOFcUgOT7GtE+xqq2ts2XXEvmF9QNW/ahKJmzMpkfzaPdgZOdYh8MayupMOPELCMN4BmIuHputWWY1i3wosD+4HCbU8xBiLPmH/ePaKLpQ7wUnajMFhv43Wkc3YDpTMko1EfVOqSidfJSvB653PTmpr7JktOptq+4kqXyeV3jmUkWGwZocuWsND+u7b43VGIx7W811WYuaoapeUai1Sc26pHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR40wwMefC19PswVHU9SnOs0SlB8inwvhsoGgHGnDiU=;
 b=jvhO46JIhHFmB58Vn6C9UyfqC4obz9Cth5Gwf1wLw/ZsHA18hY5JsnY9A4/8rJD+eJZFztyrKP1iWx/BWPEugslM4NIe24WUXtgTaPGfLdAKzvgWWxBrt1mbcqUA1f41DhHgF9DwFYyFe5Ws7DVsuIrA5Y241Qh1huYj1iaNiYlXzGrRFdYN61tKMzQrFoS1Gw4dD/sO0TbjdT+tn+LN6sZWGEuezIefPbos5hcdu+mMGG6kCV1AobDO891t5z39dOpG63wqtwJW5XLrWVk8zNDNkhSBbsZ+3T1jw+pp/Eb7NxMFkpOLZlZp7RZYP+aoZ6EOXAdsu/7qRB2L3jH9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR40wwMefC19PswVHU9SnOs0SlB8inwvhsoGgHGnDiU=;
 b=Bzty1CTjqzP3d6l0TFS5FSby2n08TMrutmU+3mo7RMRs6FswT+QkhtIg97a1iaDMoCBJ3xVTezdU2ULmy8GVnkI9CunUwZRL+nAjFjskYIj60Z9STllJ1/lP6VhvOFb2QDHgnL3BVZ3hEqUzB771pGhDLRcClbarFvyCC+uTmwM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAWPR08MB10259.eurprd08.prod.outlook.com (2603:10a6:102:366::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 09:56:27 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 09:56:27 +0000
Message-ID: <0ff65a45-bb8a-4d49-ad3a-7c4d3ae64cc5@arm.com>
Date: Thu, 8 Aug 2024 12:56:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
From: Mihail Atanassov <mihail.atanassov@arm.com>
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, nd@arm.com
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
Content-Language: en-US
In-Reply-To: <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::19) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAWPR08MB10259:EE_|AM4PEPF00027A63:EE_|DU0PR08MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: b976cc0f-f869-4ce5-1684-08dcb790671f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?QW8wK2cvSVJ1Zk9BQkpFeXBGOEpYQk9FOVp5QWNUcWhaWW9XdStGMnVoSWEy?=
 =?utf-8?B?dS9uZFNiSE5hWktudyt6K3Avb2ppY0czRVE5eEkrMDR2UitJdHRPZWJ3MFJn?=
 =?utf-8?B?T0hFYkh5bmhBTkN1RVpxTUoyeFpQVHY4OTgxYUZmN3RWM0ZLaUlpSjVKc0xw?=
 =?utf-8?B?RU9oYmRLaVlXRVhaK2EvVGFvaVgxTGJHbEI2Y2NJSUVaWVpyMGhIY2JCN3kx?=
 =?utf-8?B?dzZnd0p4L0xWaUwxdVNZOVFmTStCMGl0eTZWY1NkbVpMSG1EWVBOUit1V0hL?=
 =?utf-8?B?WmJvRVV6bDB0cUZuNVJ3clFubWtESDZuc1BQQ2k4ai8wUjE4Z0NBdHhNeWdr?=
 =?utf-8?B?cTErK1dnTWg0c2s4NElQSFRmQi8yWkRJTVJTaDJuaEkxS21KMjdseUxDVWZm?=
 =?utf-8?B?Z0x4SlhwYXV6cW16Q1czOTk0TzNTUEpQSGMzZmRLbloxZzJicHNVVXNKa2JP?=
 =?utf-8?B?Z2FWazd3VElvc0c3R0ZFeFd0N254Y1lmZ1ZsZ2N4clpzSFFIZVZwWEY5bDQ1?=
 =?utf-8?B?K21zVVN3Ti9teGpXblFRUUsyanJlbmZCWVBobC9CNlR0T1ExKzZJZWp4bzBm?=
 =?utf-8?B?dlZ3TFovaTJpb3pIdVhmcmJUUHNNbEdxQVpSdDZzYkJMU1FsNzQyVkJIUHEx?=
 =?utf-8?B?SElJVCsvR0QyRFZUVDArK1p2UEJ4WS9WaHpwQmgrKzVIazMrb0xDK3poR2Rn?=
 =?utf-8?B?VXRJeE1HWm9RdWdqNjR1dFdpQTc3Y1NmdzBUODVBVmJ0SzhpU1RodjhHZzdX?=
 =?utf-8?B?UkhybnhCVUNlQkU0akxzWnU0WHJRRmJua1YwRVhGajJ4Sm9ZL0VSSEFueERX?=
 =?utf-8?B?UzRnVmVXNjR1eVBGUkl4VEtMMnQ3R21wL1VHekM4TEgyanlDWEhKOTd6Sjl1?=
 =?utf-8?B?QkVVZHJRUTM1RnlYOE5RZEo4clZudjloTjhENzk2U1RhcTJaMVVvcldVMzBN?=
 =?utf-8?B?S3o3V2pqejB6ZDhIRTNETjNXL1Q5eUY5UFRYcFhBOGloanJqalNHZWZXZnpr?=
 =?utf-8?B?aStMYW56c3VQNXVxR2pYa284VnFnWXdBR21UNXBqVU1DK3hScDY0WW5oaUti?=
 =?utf-8?B?bDgrZDFVLzhOYlZ5VnVRNmhyMGM3RHUrNDd6WDZTbStnWTFxUGxqRXpTTzBa?=
 =?utf-8?B?WHkwQUJaWkYzekYzZ2VWTVRKT0g0cHo1ZzcvWFVlRTRnT1lFdTdoNFhNZWwy?=
 =?utf-8?B?Z0FsS21uUzdiUHJDOUJ2M0dzTGJveXZDVUpHd0RHU2NLTEdXT2hhY0tWL00w?=
 =?utf-8?B?N0dscitoVXRvYlRyWGE3My9TRGpXYkp1Q0FVbTVMRzV1c1RJWU1jSldRdWNM?=
 =?utf-8?B?a2dZcFNmUnZMOUFaaXhFNS9uSnAvb0FaTXJGdk84S0toaDl6V05LSXVlUG1m?=
 =?utf-8?B?cnZ3SFR2NUR3V2FxTW1zckxEUlROS28zOEkwN2pxOFE2NHpUaW9DazM3WFJZ?=
 =?utf-8?B?MnNsMFZIY2h1VW1LUC9ZSS9FR09UUklGaHRGQzJOOEpxV3hpeWNGbjRLcGhm?=
 =?utf-8?B?WFp0MHAydDFjaHFVZll5QXdpckR3ck4zUytBdFp3Z3RxZzB3YWxva1doWGgv?=
 =?utf-8?B?OVpvZlVyd1J2czMrWDFsRVY4dFNaUTF5L3ZXWDAvZUhCWXpDQVlCNi9qcGlU?=
 =?utf-8?B?TlJoKytOVmRQK2R6MkNEL0tNUTVzdlFQS21RaUEybm1UczdKZk9zTlBtR1d2?=
 =?utf-8?B?Vi9Kbm1aWjk2K2JKRVBhb3gwVFhIb2tvUlVwN1JSVW52VWx4SHgzcFl4M3hn?=
 =?utf-8?B?VFEvQld1UzZWSjJhcTNkWFJwWXpjME04YUkxTk00ZlZIZVcwd2RBeHlMdW1r?=
 =?utf-8?B?VTNwbER3WWIzejJ2MzUzQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10259
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ad0c8a2-c1f7-4e7b-3ac7-08dcb7905f04
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0VGV2pzTzRNSXJTbVZTU1VqQWUzZEtma0VCVVNyRkIzS0hFSTA3ZEp6aVBZ?=
 =?utf-8?B?akxpSmxLeG9HbUR4M1Y0eUxkaGRZMVFGMXRCdVhIVlQxd3dXdmJLWEN3aGlF?=
 =?utf-8?B?Q3FnV1VPZlhVaDh2dFAwczhzVkxMcFIreTU5SERJays2eXFKckp0Z1JhaDl0?=
 =?utf-8?B?TDBqZWoreUpTcGNTZERlOWpTVDlFdVNSNTdhNmlZY1ZaOVdLMzNIVy9nWm9p?=
 =?utf-8?B?OFJEMXVza1RCdDkzTzRGeWU3UGUwZkFRWDhEVFUvSFJyL0daSi90YWpqbklR?=
 =?utf-8?B?TjJFTy9YdzBSeU5CdnZFbmdIYVV6TVNubGwxZ0VMc0NoNHJDaVN5bkV6WXZa?=
 =?utf-8?B?OTAwNzRsRi96OGx0MlNaT0Urek9pWHBYNWNxMkpGZFlVRitCTDFERjBKV2d1?=
 =?utf-8?B?QUdUUUpEYmxyMVQvL1ZuVTZCOGk2cGluOXE2d3ZuYzE4eUVrMEJTQWVSUnov?=
 =?utf-8?B?UGNocVdISkhLZVFObW91QTkxTjRoUnBqNENzR0d4Q3QrSGJ2QVdCQ2VXRWc3?=
 =?utf-8?B?d0d4ODFZVE9pMTJoWjRDRnp4bEtLalFlaXg3VHhFWllzSjJ2M05keVNhbFR3?=
 =?utf-8?B?akVPT0hKWlRpbi9GNmRSTEdaNm8rbEc3UWFmZkw5dm1VYjlZMlNZd0hZSzR6?=
 =?utf-8?B?byt3cUtOUEJCNzd6V3VpN0k1bDk2a2lmZGVOano3NVJ0NUIwUzZvVUt4TU1P?=
 =?utf-8?B?TXFXZjZncW94ZXR6enUzZ3JVYjMxcjE2YkY2a2UvbCtBNldTaUlCQUpSRWRz?=
 =?utf-8?B?NnFKY2kzQnI4eWZaREZOS3E0dkJnYVpjMGhnaDcrZ1RhM0NIQ0swcW9hUjNW?=
 =?utf-8?B?S2I0eUNBeWowS1MzbjJrUmd4QnNUZ2h1cDVRdWhKRE9UdGNOeXBSeU1TK2N0?=
 =?utf-8?B?WDVyb0MxTEt2NEhXS1U4Y09TWXhmdHN5NVNPUmlEWlhzUzJPaC9GSjE3ekpv?=
 =?utf-8?B?MWpsK0YweWxtNkhVaEpaMnlUN2dnbDZ2Wnd1UERqdEdDSllhcTZKWUN1YTFG?=
 =?utf-8?B?aXNVcUtrbHBvSUp2YkZmblBYZkNOeVhGNmhOcENWUk1oMmF0SjRVcHFvTGVL?=
 =?utf-8?B?TGFQQjgvKzZycFFqMVhNOUJ5QnpBZlo0TzdrL0JSWENTWmFCSVNyWkpwaXhw?=
 =?utf-8?B?UmZZTzBjSnkyeEpCLzJZTUNUTk1POFUrYUZKeXZySkI2NUt6TERLd1ZHRjR5?=
 =?utf-8?B?dWwvYUllMGRCL1ZFcXZQdHBHYTNGMVdNSzNtMUovMmwzbDNBL2Y0RlphRU8r?=
 =?utf-8?B?aDBJT2lXZnoxbEFrK00xUVQyT2piL2w1cE9FV0JCMWpob01NdXlIT0dUQ00y?=
 =?utf-8?B?V1V5a1YvTFU5WFJ3R3NzT01UbkhNUFdxcGRuTElrME53dHRseDA2Umk2dHVC?=
 =?utf-8?B?MUk4Q3NwNitEU1VZeXBaREVYTTNFN25MeVYzNE1mT29acklIVTY2bkpPUDgw?=
 =?utf-8?B?dy9XdGFRMHZvaVM0UmtjTEZBTVlrY041YXZ3K0d5VVZZWTR0SUtHQ3hULzZV?=
 =?utf-8?B?SWlEZzBYMlJxanprc3FTYjBCeCtneVliZUZTRVhLK0dlTm1RZFdkV3JMSHBU?=
 =?utf-8?B?UGFiWEhVeGM5RWJua2YwdXFjRlp3akljN2tqK3k3Y0VBNzlWcXg2Yjlybmg4?=
 =?utf-8?B?RERXMW5EaTBlbm5EM1pHY1dONXdJUmNJTjZxNXRoVjVabSsva2g3YjZJMzV4?=
 =?utf-8?B?ZjRNaUJjQ1B0ZFYzeU0yc1JQQTlidXRQVUpNSTlPN3N4UTVCZWlVL1ZDM2t1?=
 =?utf-8?B?YXpMNDNObVE2aDVMUlFEL1YyY1c3eStMUFh4elFXdSsxajZneXhCUXp5dXB1?=
 =?utf-8?B?RFdKYXp1NTBZY0xuZXdPbFNUYnlNelk1OVcwWXFFZlVxWnJqSnNjc3dQN21v?=
 =?utf-8?B?VDNoOEhiaHc2ZUV1T0ZMQXdlRmtkQkRXc3dXYTIvNERJb3o4Y21YRkdQR0Uz?=
 =?utf-8?Q?9hKW+g8s7JuywgR7MuRlkvB7970khpEc?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 09:56:41.2563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b976cc0f-f869-4ce5-1684-08dcb790671f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9583
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

Sorry about the accidental re-wrap, I got fat fingers...

On 08/08/2024 10:41, Mihail Atanassov wrote:
> Hi Mary,
> 
> Thanks for your patch.
> 
> On 07/08/2024 16:35, Mary Guillemard wrote:
>> Expose system timestamp and frequency supported by the GPU with a
>> new device query.
>>
[... snip ...]
>>
>> base-commit: f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
> 

-- 
Mihail Atanassov <mihail.atanassov@arm.com>
