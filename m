Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED128CCF1BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 10:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1850D10E118;
	Fri, 19 Dec 2025 09:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="WBWWAFKb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WBWWAFKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9D10E118
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:20:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PKFY1KDe/0lLws1PYhxD6KkTEifvrQIgmyEmA0RkeFHfP9RoCSep/kfVx21hdBw5f/gHndDK0eaU2IJDhoQkGNftXdv15+xwkbJCBxcOttOoQAI7pzHjRT0xlQ/jUuQ+vktQiw1SatCPAMHb2V64idiCPMaY5Sf7O6/PLUewUbJlGU5v8LJVn0dV33xK7tsIftvMamjiDcCX3gfwo96U833Jqt7jClKhZRTAeusKX33GRZqvfRTMI2Has/KLTmdkGuCNG+KGi9ik64JSKCRJAfKcZ16cGM6b4dmUMMIeckhFAqDfRI0AAHQwZh5DaCS2FhH89ZL401FHgxUzvg1gPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnc7XrDPsXhOr9bDWajFEuj0twtGu2kYTgarovdnIzU=;
 b=b2i8JVXtLcVUG11+37Z2352q78yq07xN7M8I4Qlbag8/icXdlDhYWF9c97woeJY9f00oLY2GeiVW/woadkQ7dGyi4lebFpIfDrLlSFc6eMldzFWYhLOxeki0Hg0G7ZUhrWAw7h/BoOeC1qeID73c0HOUVEGEr4PuLSVNxLVDZkOYSZFxSeVMhO5bG6KrZbk+uxJG0ImhetMtmCVQ+Wt0xn4rONJt4TAEk7W9IGAXVP/KM7J0+85tdLFP/yoXHOpxWpKAUemgiMXF+nyKefrypaTLrFh2FLU1IGan7TdcwI0gt++mpsj59wxoRvs7MOL/+JYEPfQkdNgkf1jCq8RZ1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnc7XrDPsXhOr9bDWajFEuj0twtGu2kYTgarovdnIzU=;
 b=WBWWAFKbosXYTDMfYvVmqKi9Tj4B3tkb/HPqEmDYIEeCJNcTlv+h6W81m96yoFfOOXR4hkLB1r3UlO+gIz4pNl2Tn8jvuqvZ75LhAnWIsb0xszSp/Yi6B2jt59l8HUExpLPU80WQ5ebq/0iSVAmXCBeNgC3U8lIMdc14GiV/9vY=
Received: from DUZP191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::9) by
 AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:20:32 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::5a) by DUZP191CA0037.outlook.office365.com
 (2603:10a6:10:4f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 09:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 09:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqgJeUu0wZfgWPpC3PRev9oL+4UxvIyEbpaJmOVpmuzx7CCUbnOkvitimrYm4rpodISUTADBINI9H0dKxiX66YSsiyNgEAAHHbtcIC7J7g5/vGqXv0d8E+yDwKEkPWbk9ySzaITYD6XmLfVxSbu88+XBOeqqGxK793T3GgXQIZKEJhsCaCyQZyqYiYFN3ulf56db2K59DErusQf/xtVFId3gXwgsfK5Bc8tIN1pR0Hm0ZmPaOWZxnrHvnsCHujQQDdkzvWqJ4Y9RUyDvn88b5QwLDRI5MS9JD/OyCZLF0aCnia9KPtzcnzjIQ3ej3CjEkQUPn6rlfsxYVLVur/wB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnc7XrDPsXhOr9bDWajFEuj0twtGu2kYTgarovdnIzU=;
 b=in0C0LurHk4wemnrO0CaWVWcXFpKOS9kWIIySkPMb5Mfs2gm7yMdZlpXDmVWqu5YTMJdZtFN5Zj8UYXOcruNWSxwUHZxTTpoPC0Kf1W9vXzJQ25rnEw7U/zRCxYOWCCUH+ZtHFQYzLqQ1rngIOjzbnTMYc8U73jv3lPyp/xPnYx1g3SqwjzkSVCgjKXTfwxOzLX618aWxR06fZhNXHeIoK2cflj5aGnt/ij9GSQEMMGxYzJFhO2/W3d6Qo8wUWSKDOuyq5pXZGh5A3AmxhAhjdApB9LPHuKqv1iLQuHWotKLaUWElPpUL3haRnMCiAcXYl3HegZQdDTa2W1MyJ2ylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnc7XrDPsXhOr9bDWajFEuj0twtGu2kYTgarovdnIzU=;
 b=WBWWAFKbosXYTDMfYvVmqKi9Tj4B3tkb/HPqEmDYIEeCJNcTlv+h6W81m96yoFfOOXR4hkLB1r3UlO+gIz4pNl2Tn8jvuqvZ75LhAnWIsb0xszSp/Yi6B2jt59l8HUExpLPU80WQ5ebq/0iSVAmXCBeNgC3U8lIMdc14GiV/9vY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS2PR08MB8646.eurprd08.prod.outlook.com (2603:10a6:20b:55d::15)
 by AS8PR08MB8733.eurprd08.prod.outlook.com (2603:10a6:20b:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 09:19:29 +0000
Received: from AS2PR08MB8646.eurprd08.prod.outlook.com
 ([fe80::8cf8:147:ad1f:3d58]) by AS2PR08MB8646.eurprd08.prod.outlook.com
 ([fe80::8cf8:147:ad1f:3d58%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 09:19:28 +0000
Message-ID: <aece4f83-7caf-4c58-9e00-c92500ec9105@arm.com>
Date: Fri, 19 Dec 2025 10:19:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Evict groups before VM termination
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251218162644.828495-1-ketil.johnsen@arm.com>
 <0939a54e-dc35-434b-9dbc-06837f04e62f@arm.com>
 <20251218185925.2aa246aa@fedora>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20251218185925.2aa246aa@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::7) To AS2PR08MB8646.eurprd08.prod.outlook.com
 (2603:10a6:20b:55d::15)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS2PR08MB8646:EE_|AS8PR08MB8733:EE_|DB1PEPF000509FF:EE_|AS8PR08MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 100cc982-d654-4e2e-5f43-08de3edfdc2d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?V1k3SkxBTXd6bU8zbXU1N1FGb2ZkVzJHM3RYNlNuemhtSDVKTnpZYVprbUVO?=
 =?utf-8?B?MnlHeFpKZGFrc00xN0tneVJwUHQyNTdiWm1ZSnRtMnNBbDFqV3F5Ti9UUyt4?=
 =?utf-8?B?TVJ3ZUZOelB5NnIzK2FyeHBXSGtCQUNEeU9malhnS3pPQ01wZXhUS2ZCU0FL?=
 =?utf-8?B?ODFSTWFoc2JRdkpjWHBhUXR2OGhsaTJSNzM5dUc2M3pMblNkMDRROWZRdTZk?=
 =?utf-8?B?SWgraW5EZGwvWUEwY2Q3MmVXNWFneFUxVVBITkJlQ1Qwb1BSZGVLdDg3Zkw4?=
 =?utf-8?B?YW8zZXo2YmJSd2E5SEJHaGI1aDVPblJ3QksxS1ZFODVRVU96MnIyaEx3eHla?=
 =?utf-8?B?TlpyVm1lQXhpcGN6OFVUcVh4TUI0WmQweGtsVzlXZmhJSU53cEFCY2g1M0NY?=
 =?utf-8?B?OHprcHhYOEJDUEFSbmUzZHVGK2hFeHdQWHV6Tm1mRkYzcWpFcThwNmpJdGVu?=
 =?utf-8?B?dkZOdjN2eXRFZjVpeHljZ1B4bzJPcEQ5alphby9wY1h3Qzc4cmkzMG1YbXNo?=
 =?utf-8?B?Z1BOd2hrRkEzSnNxVW9UL25vRnBnZ213RFJGMUVPOTgwTG44NG4yaEpvdXF2?=
 =?utf-8?B?aFhUZXNna3RhYys2Q3E3bnIxZkRZeXd4ODFleVVCNXRzbjNYY3ozSmhnaWhW?=
 =?utf-8?B?dFdCQTE0MjNYZUEzbU5xdHdpOXA2QzkrcnA4MW83NTJZOGtjV2lsMkRjdEkx?=
 =?utf-8?B?RisrRGpvMnVBRzJHcDlGNVR4QVlOUFFPTkM1YWp3YjN5U3BTQlZVWFBwWlNB?=
 =?utf-8?B?b1o5L3ltcTl5RkxrSmpBTjIzRUl5VkduOXRZdGJZNkk2LzJJbUg1d3pCeXNR?=
 =?utf-8?B?SnpndW5nYnYvNGlxQUxoVHJBdmNiWkd1ODliZUl5bjBRY2tmTFp5cHV4cTFp?=
 =?utf-8?B?YU5OZlFVMExJM3ljZEg3KzNTYzVTaEtzdnN4aGlNL0JWcXBXVFJyZ0p4bU9a?=
 =?utf-8?B?b29ENlFpS3pmeXB0NExYR0dNeGdBOU54UjRkazBnSkNhdVhWbm5GVThtbFl3?=
 =?utf-8?B?TkdINjh6a1Z1M3lIR2lOZUoweDhVaVV0Z2pMaHBYSDVNd29BWU5CWU93dFgy?=
 =?utf-8?B?UnRLOCtEOTRVRElaSUU1N0FLMFdKdDAxYzNpY0d4VTFOc3JpbCtVaGltWWZj?=
 =?utf-8?B?MDBZRXpOY3MwT1g3TDlMcG9LazhkWlMwT2J0RHp0MlZhZVg0QUdGV21Nd0Vj?=
 =?utf-8?B?SnNiMzdGU3ljSEx0cDEwenhyU29OS2Jtdk5zU1JJczRiYklKWlVtS0hWUzlx?=
 =?utf-8?B?Z2k1MFNwMW44UmlSVnVlQThkZ0UrMWhQOTZ3WGtWWldqdCt2WW9LYTFJbEl6?=
 =?utf-8?B?bXozQ1pzYnRtRnZ2YUJPVW91aTlQRTMzd0pMbm41c1pmanlJa0NkV3FXMDdk?=
 =?utf-8?B?UjEzM1dmYTdFRXNjSldwdXk1WXhVcGJINFc0UEpIaXI5eWlBazV0a2JuQUx1?=
 =?utf-8?B?dHZ6RXVTckk0dVBpMnFYalhHZDRlZDhZaDhSNFQ3QTlzQkg1OEdNTWZIaXFr?=
 =?utf-8?B?c2RwU0xkaDYxamRNQ3FkMkxVMkRUcnVzRUJIVzUrRWdqU1JzSFJvV2tTS25T?=
 =?utf-8?B?T1I0UGswRG5iZy9mWHhlazBiRGhidERZbzRVZ2RNNEpiVmN0S0JFUzVjeUx5?=
 =?utf-8?B?cDRsbzFhZWtRRzNCN3M1Z1JEK0xTRklUTjBDcUN0akduc0R2ck1TdXlqa0pK?=
 =?utf-8?B?ckdyR3pwZDE5bkxNSmJFdW5vSDc3Q2w2cnU1SE42U0hJWStTWTgrdmVZMyty?=
 =?utf-8?B?RnhURWJINDFSVWNnellwSlcwenEzR0E5cmpyYldzSW5lQUJhcnQxSlVxeFE2?=
 =?utf-8?B?T2NHVFpQbGlsRXIvRGJ3R0xDMy9Kcy9XeVVxZnlNa1hWMlN1Zk5hR1lGT3lM?=
 =?utf-8?B?SXMyUlo1TGlmMkFYdUd0VVlwdFJZOHkxQ3BZL1paSE5vQW9yazluOXBTK0NC?=
 =?utf-8?Q?PYSZEYOnF4XyD+/M70Chg31IYZ9o4wFE?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS2PR08MB8646.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ff697d1-a07f-4d6d-670e-08de3edfb612
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|30052699003|7416014|35042699022|82310400026|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm42eTU2eFJlczJ2ajRPS2VOWFRpWGVkKzVmWnQ5ZVpJVXNzU0N0UnovbmdL?=
 =?utf-8?B?bjdFYVhEQ0tQSEtDUVdCdlFYKzROVVRoNkpxek9hSnpUL0owd25XT2hjMDFx?=
 =?utf-8?B?OFFZTnpTR0l5eUUySG1yeVlXbDNUL3NtcmF3UUxkTzRINlR1VG5KSVd5ejV4?=
 =?utf-8?B?Mm1LNmJGamhMbVdEM0FQSGRSeVpnbGc0R2JnVjg3REJTRjdqdkRxUUVueFBO?=
 =?utf-8?B?SXVCTFhjR2FKTVRaL0lSWHNNYUNKTnBrRnJzcWJLaHhnRDZ2bGwwNjZjenBz?=
 =?utf-8?B?RHRwV1UyVk1WUjMzcXYwcVFtNWgxODFXRFgvL251SW5Zelh0SDU1WTRkcTZt?=
 =?utf-8?B?WXhaeHVVOHNrWGxsL1FOTU50QkFCckNzNXJ6MVRuaW00M1pJTFBpL3hGZ0xw?=
 =?utf-8?B?MUxaWDhodXAxUzV2RUNTdlBTMUFacVY0d3Q4dHNxNHdraHBzclFraGVWTVZO?=
 =?utf-8?B?ekoxQWdtQ2RDT0FxWTFIbU5qdE53U3BETy9VTWxreUdoSWVvSzkzVHNlanMw?=
 =?utf-8?B?QmNRMnlKeUp6NXlnMDZNK2kzV25RWFZ1WVA2OHp5c004Y1JKVzN4VzQrcUNq?=
 =?utf-8?B?b0hJcjZCZDhuTGNGazhHOEd6UE9MRURKSjJUUzVOQ29acFNxeGlHVG1rUGJ0?=
 =?utf-8?B?c1Jwd2RzWFBmT2czQmxlSForYjZnc1djWUV5WHZzM3FnclM2b3BhcGpJWVhi?=
 =?utf-8?B?TmF4ZWIyMkJyZ2hhelVkaHVwalU5OHZMTUhXVjF0SzdYRlpJaXQvYk8ySkdj?=
 =?utf-8?B?UHNPWHppSVFTTHp0d3A5SVZKb0VpNUd2MEtkMFV5RU9qM2ZIcTUyeUlMY056?=
 =?utf-8?B?Qys5S0V5cVFybEpWS2NvRHZ3WEc0Zk5IVStsTEVmdzJvVkhXbWZWQXFjalBZ?=
 =?utf-8?B?K1p5c09QSUltWU1TYllUOFJyTWRUNUU4MVJNeXkxME5vUStIK1lFK1VSdWxr?=
 =?utf-8?B?VTFqc1VaOWI2ZEl0VW1uMEs0K3FzZkkzMUUySWR1N3pYYmdnekJ4VEhiYkxD?=
 =?utf-8?B?aysrdlVnOFhnSzRrSlIxeFFFb1BTMUQvZDUrOW05MXRKdWVFN2VIY3dOeTVt?=
 =?utf-8?B?T2dTdXYrSEpiK0ZiYUZ3aVFneUxUT1NZbVEyQlluNmxKU3E5ajRFNkdjVjNR?=
 =?utf-8?B?R1BHMTNHMlh5M3ZldE4xcHBldTh6MzBTOUxnNlpMck96bU1JTkRiMU9PcXZs?=
 =?utf-8?B?L1E3WGRlYW1vV01yY0JaZUc5NUZEYUU4QWo3bUR1ZE0wbmxLVERlZld1eEhL?=
 =?utf-8?B?VXRaVFBsTEw0WDhlUHM5SHFOLy8rUlVnVGplcW9oTXg4My9GM25GUWpRZ0w2?=
 =?utf-8?B?T2xoQTMvZ1VxalBHb0R1UWVnenRKK0IxajQraWEyOVZYQXpud2gvenFxeDY5?=
 =?utf-8?B?am1IOXJCNXIvL1lhcGVzOUFNUVBQcktJb2VQWEppVHlkaGlRYWdpQWM2eFhi?=
 =?utf-8?B?K0RvV1krYzR6cjlUL3gzODBLQlB1eTVaYU9PR01vMzJyMjhRL0tCdDF6TTJ5?=
 =?utf-8?B?bEc4c1dsdk9LNmp1QUh0RXF6eFZKdkc2YitvUStVZi9sSHFpU2JqWjRWSGpt?=
 =?utf-8?B?eTZjNDFZSWhhRCtocURXazdOeU5XRHlpcW9jK0MvSTJPQTFpenRrRkZlemJE?=
 =?utf-8?B?WVNpbFI0enpPTzFqQVBjNVVhY1ZsTUtWZzllekNRK3VOdStvU0E2VG5FNlVu?=
 =?utf-8?B?TGFqcnZnWHQ3dTNwdzBKYlJYVnRVbDI3VEUyRDQ1M2xqeTlVTGVZT1hpakJB?=
 =?utf-8?B?MUdWYlRmUmEzaE8vcWtFNno4aVgyRjRGMmkzUkExTUV3T3VZazNxWUZ1bHVC?=
 =?utf-8?B?clVPY05sMzUzMkJTNkl1cEM3ZkdUb3haaXlMU1BMYjdLbjJRU3ZTaXRacXZE?=
 =?utf-8?B?OU1XSDRJamNBTzBCSU02Q003aTlweTQ5RVAzYmVlSVJsUTZuM0d1MWU3QUsw?=
 =?utf-8?B?Yy8yL0dDNVhocHZVY1NzK2RrdXZrTWtvWlJxQlk1a2ljbFBuWlljcUFnQjFw?=
 =?utf-8?B?VTNYSVZLK3pwUmhub1A4MFFyenZ4VnFsUW9FOWd5TWsrVzJjWHl1YzlRRDRu?=
 =?utf-8?B?eXpKM2lUUWpEYWNuWVpTbEV6UUwvYS9UZjQ0MWx0K1AxdWFGTzdzQ3NNZWl1?=
 =?utf-8?Q?LaN8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(30052699003)(7416014)(35042699022)(82310400026)(36860700013)(14060799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:20:32.4652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100cc982-d654-4e2e-5f43-08de3edfdc2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
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

On 12/18/25 18:59, Boris Brezillon wrote:
> On Thu, 18 Dec 2025 16:57:28 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 18/12/2025 16:26, Ketil Johnsen wrote:
>>> Ensure all related groups are evicted and suspended before VM
>>> destruction takes place.
>>>
>>> This fixes an issue where panthor_vm_destroy() destroys and unmaps the
>>> heap context while there are still on slot groups using this.
>>> The FW will do a write out to the heap context when a CSG (group) is
>>> suspended, so a premature unmap of the heap context will cause a
>>> GPU page fault.
>>> This page fault is quite harmless, and do not affect the continued
>>> operation of the GPU.
>>>
>>> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
>>> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
>>> ---
>>>   drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
>>>   drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++++
>>>   drivers/gpu/drm/panthor/panthor_sched.h |  1 +
>>>   3 files changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 74230f7199121..0e4b301a9c70e 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -1537,6 +1537,10 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
>>>   
>>>   	vm->destroyed = true;
>>>   
>>> +	/* Tell scheduler to stop all GPU work related to this VM */
>>> +	if (refcount_read(&vm->as.active_cnt) > 0)
>>> +		panthor_sched_prepare_for_vm_destruction(vm->ptdev);
>>> +
>>>   	mutex_lock(&vm->heaps.lock);
>>>   	panthor_heap_pool_destroy(vm->heaps.pool);
>>>   	vm->heaps.pool = NULL;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index f680edcd40aad..fbbaab9b25efb 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -2930,6 +2930,22 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
>>>   		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
>>>   }
>>>   
>>> +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev)
>>> +{
>>> +	/* FW can write out internal state, like the heap context, during CSG
>>> +	 * suspend. It is therefore important that the scheduler has fully
>>> +	 * evicted any pending and related groups before VM destruction can
>>> +	 * safely continue. Failure to do so can lead to GPU page faults.
>>> +	 * A controlled termination of a Panthor instance involves destroying
>>> +	 * the group(s) before the VM. This means any relevant group eviction
>>> +	 * has already been initiated by this point, and we just need to
>>> +	 * ensure that any pending tick_work() has been completed.
>>> +	 */
>>> +	if (ptdev->scheduler) {
>>> +		flush_work(&ptdev->scheduler->tick_work.work);
>>> +	}
>>
>> NIT: braces not needed.
>>
>> But I'm also struggling to understand in what situation ptdev->scheduler
>> would be NULL?
> 
> I thought it could happen if the FW initialization fails in the middle,
> and the FW VM is destroyed before the scheduler had a chance to
> initialize, but it turns out the FW logic never calls
> panthor_vm_destroy().

Yes, I also think we can safely drop the check. I even injected some 
probe errors to double check, and I see that we still terminate the FW 
VM successfully (as this is not executed in this case).

I will send a v2 shortly with this check (and braces) removed.

--
Thanks,
Ketil


>> Thanks,
>> Steve
>>
>>> +}
>>> +
>>>   void panthor_sched_resume(struct panthor_device *ptdev)
>>>   {
>>>   	/* Force a tick to re-evaluate after a resume. */
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
>>> index f4a475aa34c0a..9a8692de8aded 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
>>> @@ -50,6 +50,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev);
>>>   void panthor_sched_resume(struct panthor_device *ptdev);
>>>   
>>>   void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
>>> +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev);
>>>   void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
>>>   
>>>   void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
>>
> 

