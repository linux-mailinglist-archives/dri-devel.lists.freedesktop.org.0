Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B61BF0508
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5F010E391;
	Mon, 20 Oct 2025 09:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dHc5OGTQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dHc5OGTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DF810E391
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 09:50:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W7Tq8+X7t6fl07wiL9/7xl47c/bYiUTBuGDoojeYLzIOySkrWNt5HnMTU5SsEQCq5Dw1jvqTJxWd8/85iM5LT4ZQD3HcrQy8VIlMLVkNS4yevN5YKHzpTCNLjol1+mz2TlXNbTO4CyMYZIRft/06ZW6ybpE4RpinQuPwUG+g/NmrK9a3vmsl8BURUqwLR3wWrPgrdtXnu6qpO96UfjHE4KhoH0q5PMFePRBps0eR1obJx6hcPjnKbwfIQ+Uje860NlarH8VyIasLfPo591puzRCft7IGZERyWcFX0ur5DaOLG9jrKhaVSAYnTkaTRpq2aC0p8x0b6cG61V0xubTYQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuc204bIsrOlD1UItxFEPcYM0MUEuXWqKiHUgR7cW1Y=;
 b=GzQBUqhGr/u3Wn12DsFX8YHnT56ekaWr347MBUbBNfRLdIudKP1G5Fzpz378OSCySfAnzRZlIf0lgvR78ex7IjjZDAQnFj5cWE4o7a2w1feWzTWlFrGgARDZf045UCeg0E3yi60iUvUrgodv9w+wt1peMxADs8/gSXwmWQTwIz08tE0SBO24+atxmojief+9cEfD2wLuVu8XiY80Co6wJp08DTwB/4y9L9h+0bkaMOC5f5kzynw1r8jggKnW9W8ahduVlUfWB4AK/f/Ff4PFkCT2Ae4NXXk/yDV1AscFY4FnUVh8/M9ogk/IMsSIhPR3CIEU+4nb4dSGngcJjY8hzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuc204bIsrOlD1UItxFEPcYM0MUEuXWqKiHUgR7cW1Y=;
 b=dHc5OGTQjGcyx+FauyyJhOjmtFpWs2+tDxHI/KEC4qwM4MpwDd2nJC8SLF3I0GNINuOWST/MymX/rjz/iWjT+1zcTrqi8bUbitPKScHdaNeSP5wWJBcqrNvhFzx0zIBo0gJz228iPNR/FXpjLLsRfEAYBiX/aCo/+/RjeTx7HOY=
Received: from DUZPR01CA0301.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::18) by DB9PR08MB6667.eurprd08.prod.outlook.com
 (2603:10a6:10:2af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 09:50:56 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::b8) by DUZPR01CA0301.outlook.office365.com
 (2603:10a6:10:4b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 09:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 09:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQi6cXkm+Yq+ep9Pw2ylEeu6i93I+0yaur/6AxDL6vN1DhO3J/Zb9lxSX9h6RV82M2HdxB6vZuK5IF6aL18MOXfl24iwtzeZVG4w3PO3cpwdXXaDybGGOoy+cJHf5RQ+I0wtNiKgxDA4EpTjOX8ttIzbfFYL5PWRrmoeUjBdTNoFCNKlF1MMqyfnI2KxR03aXT4caWwOR9TQwVmd8LW65PJeHnsXZMSpeO4J3AOKOzq6iE8SsAlnXraqB4I8xrbGTMWz1C9/TFzCrfzRmIvcKXIg2rh9un+YU+VPb6LcASrWtyUn8HcCJI+921jtOGy9FpWCJOnt+1ipV3r2njAL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuc204bIsrOlD1UItxFEPcYM0MUEuXWqKiHUgR7cW1Y=;
 b=RD3w8Aaz4F5OWM7IUqLqf+TiRbXDUN8bD+2zLg86/2Zj7zR3L1/MPelWFSNl+JJm3I2GYvY5wL0ILmDFC8IuRCdLDOPFE556b6U/zz3FMW/FTOlb3sSNJZTswSvX9A0EbTZnVENySBjvzewtNHH9ILAOzwInWa9yp+nCWPH0AcL2lMQzwxjqTcpqjIKsXiPDhB4nj5XWNX2Q45fezN3LKOzQ0po7l3EVI32lu0q3NUpsp/0QBjxTR3G+RM3TFWcgzltlWHcRll+e/w8J5SHfEgJKULWQpN0kPmmgQGq/RPLcQHiWUxzWe74AuAQk+Y/XSgMgYC2yyAleOP6Vg1gxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuc204bIsrOlD1UItxFEPcYM0MUEuXWqKiHUgR7cW1Y=;
 b=dHc5OGTQjGcyx+FauyyJhOjmtFpWs2+tDxHI/KEC4qwM4MpwDd2nJC8SLF3I0GNINuOWST/MymX/rjz/iWjT+1zcTrqi8bUbitPKScHdaNeSP5wWJBcqrNvhFzx0zIBo0gJz228iPNR/FXpjLLsRfEAYBiX/aCo/+/RjeTx7HOY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB3PR08MB8940.eurprd08.prod.outlook.com (2603:10a6:10:431::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 09:50:20 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 09:50:20 +0000
Message-ID: <6549faee-1633-427a-b7e8-3722808976f2@arm.com>
Date: Mon, 20 Oct 2025 10:50:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix potential memleak of vma structure
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251020085914.1276090-1-akash.goel@arm.com>
 <20251020113029.1ec51806@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251020113029.1ec51806@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB3PR08MB8940:EE_|DB5PEPF00014B9F:EE_|DB9PR08MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b820bc4-5609-45f3-94e4-08de0fbe2a41
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Y1QwMmIwTXRSby9SU2I2emYyV3pYTEluaW8rSHNOZWpVcG02OFl0RWZQNUxW?=
 =?utf-8?B?QXBpR29DMjFOdjV0Vm13UEZGVno4S3RwSDlRUFl1ZUtINkpNeFFnZCtuWjZG?=
 =?utf-8?B?VldqVG9RZXRhWFhRV0Z2SlcvT0Y3bytLSTJQd0FnV2ZZWGZ6TjdXdTNHSFdp?=
 =?utf-8?B?ZUNxQWNwWlh1MVVkL2JtSGNsL3RtWFREZ1B0dWlBWGVvNmNpc094elkvVTlT?=
 =?utf-8?B?MUlkSzUwVjFqWTdYYmUxQnZORzV3QnBkeElmdmJpaG1WeXdZUzBBd3l2Z09a?=
 =?utf-8?B?MkE4L1NJblVnaGd2S3h3b3F3WnppN1F0UElQZm9XWlBBQnV1T1phMWhuYVpI?=
 =?utf-8?B?U0dnN29nb2xSSXhEekZZVC9SR1pGU2RrVUV5WFYvTnNTajBXQTQ0c0V6T1Bv?=
 =?utf-8?B?M2JVemsxN050RjNnT0Y5a2dtM0NOc2VrcXhkQ2U0dmhRQ0pFR09zc2R1TS9B?=
 =?utf-8?B?a0cxeGVSWi9Ed0xWV1hBNTJjMFVKMGI0SEhja0JUdE1uWXU0aWV3cjFMdVkz?=
 =?utf-8?B?TWVteWpydjRrdnEzNitPZndYb3gxUTRaYkR5S0ZETlEyR3dkc2N5OXNXVW1H?=
 =?utf-8?B?QTJ2eHZHZUZYU0dkQW1LNDZEcFpCeDVXaS90eFZGMEJTV0RLelNFUTFPT2Zx?=
 =?utf-8?B?NHlFT1JpS0hnVmlNVUl5SWtCQlhidXZZSXdObjdRMldGTDdUMk12TnI0aEdp?=
 =?utf-8?B?UmY1Mi9pSTZ2TnVRS2wwQkt1Mnp6OGJuc1pUbkdkcmdjVE9TNzRqL3UxbGJT?=
 =?utf-8?B?TXF4My9GTGN5N2FINmxMc0hBMWhFT0J0QUc4K3hGSytEcldJaFlFaGw4VExJ?=
 =?utf-8?B?QW1OWVZnb2x4UVdDQkhrWGJScGJ4Zm04K05mUXBuWGp5S1EwZ00rVDdOUGk5?=
 =?utf-8?B?emg5NCs0a3hNa2UzdjF4a3U2UG1Fcm5uSDlTSzlZS05mdENaOHNLUEltRlg3?=
 =?utf-8?B?dFpGOXdGUUUwN1NxVlpVUDJuVWxRbW1kazJ1TEZqbHk4ZmhLTXRMc0JLS2Fv?=
 =?utf-8?B?aVY4N28yKzdSL3ZnYVpxVzFWbktlZlhBblQ0cTVvNWF6RmdrMW5yRUliZ0xY?=
 =?utf-8?B?SzhmN2Fic3ZLai9uRGFPeFgwY1JBNnA1ZXUrQnlxV0J5ZXdmNzYyZEZJVCtu?=
 =?utf-8?B?MkJsTk5CWEVQU1dJcm85TSsrTFFCNS9MOCtNaG1xWVhudEh3a3lXaEEycjRI?=
 =?utf-8?B?R1VNRGlRaDZTVTJQcDRRNHgxbU10Y3pTVVpPRmZLRjRNWTBSbEZ6L3Iyb1BT?=
 =?utf-8?B?VUt6UGFmSkl0M3pUamdYWkt1cHlGb20vZFcxZ2VkbVk5Y1cybjR5eGVSRmw4?=
 =?utf-8?B?UWtBMkRhT04yMGIzZy9YVE1Dd0lYcTdSTTNZdUNaMnNsak1UQ1hRYmgrVnp1?=
 =?utf-8?B?c1JHQit0aXY5cENNMkFqTkZjZDFpdGNpbzBYWEtTYXJkZi9iMTdMSmxxMmps?=
 =?utf-8?B?MjdxR3pLbUdlTUVvMU5XdVlzc1B4S2NoeDR2TmNwWE1POS9NNTFreUQ1bldM?=
 =?utf-8?B?QjFpeER1eWhod3QyaVNaaVBqeXB0TElMREg2anpnamVER05DVE9COEZHS1ZX?=
 =?utf-8?B?S0htT1ljT3hTWk9SZ3dDaTlablVtOVh6clMyK1ZBd1YrK1RIUkV4TVZUbStV?=
 =?utf-8?B?OXB4czNHUGRndEttM0VOd1IrV0pLQ3FUc1U1RlVqdktva1FJLzVDVzBuVFNY?=
 =?utf-8?B?OTFJYWRJL3JPUEhpMXJicklzblpTbkFGaWtRUTgrY1lNRjdUMUpFZ1NzV3Q3?=
 =?utf-8?B?R3pOTnFpaDFMRDZ3R3dKbFlXcmNEb1hkZnY5Snh3ZUF3N2lSbXJkWGozTDBL?=
 =?utf-8?B?anVhNWVqZGJEM25PTVRRdkJjMmN4dFhBaWtHY0FlMzkxc3BpT3grb1NrbTNs?=
 =?utf-8?B?VlozYTJZVGVFeVgxYkJ4cHZwYUR3MDh4MU9kcTJnSW5BZTdyNkNURzhrL2w4?=
 =?utf-8?Q?RfBQ+zDi99ERgmhRA2INGNxqw98seZSL?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8940
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc8fac11-18f4-431f-b67b-08de0fbe1520
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjFBOE1wVXdFRmREYVFlWVladm1MdnliQVZpUCs2VzIxblNmb3BNSmtJcjdV?=
 =?utf-8?B?QWZaTkptWXRYTko5NkxVMEFwOEZHOUMrVzh6NEVWRjVDaXdGeGRFVlQ3QXFH?=
 =?utf-8?B?bHQ2Q2E2OTFoSWtyMVl3d0o4NXlubUxSb1VWaUxoVWM3Y0kva3RRKy8zWElS?=
 =?utf-8?B?bFRqeE92cmZWTUhWVmxDa1BVRmg0SW5qZGJXalA4VkFQeVd3VXBCeTU1Vm53?=
 =?utf-8?B?OUpQUFZOeW5uMkI3M3R5NnNZbWdIa2UzUi8xZnZuR1JvOHovd20yTFI0TlNw?=
 =?utf-8?B?ZGxXaDZFWlFROFVCTjBaNGpUampBakJlREY2cWNZQ2lkb3JSbzgxMkdvSk00?=
 =?utf-8?B?SDNBZWdtWGJKZU5uRituVDZQN2lZeXJhZnowUFlGay9LNmVubHNSNmJLbXBY?=
 =?utf-8?B?Um1Mc2c1bXFESXUydlgzL01xdGhWc0lqbDhDbjFLc01PV2hYVnJXRkRRay9Z?=
 =?utf-8?B?VGJmVVZUNFpzQ1k5RVZoeTNNa29kZXBMSm55VzdVSmFFeXRXbmlXVFhrZkpO?=
 =?utf-8?B?RnNydWlqSDVybjV1b2FmOWJqVUMvVHNxWjdmQ1FKMUd3dDRKSFpDMFdKMXda?=
 =?utf-8?B?T0N0TkU5bjlITDF0amZ6Ymx6MjJOVEphKyswUXpTUCtWemhkaDhKdGxpaEk3?=
 =?utf-8?B?MmVlT3Y3ZUNYWUlBem0zVE9OMGlITmQ3SmVtV1hFaHNrdFNlclc1T0N3enpl?=
 =?utf-8?B?alRrckZFdHFBZ2tjTkl4eVVhRnU3MUcrcm52TGVpYmNTN0U4NjYwUmVVSkFN?=
 =?utf-8?B?NnVpdDVzZmtGdWtKUkdBWmxNVTdpKzJ3blRZUEtwK2E5elU4MnVKUHlXQ3cz?=
 =?utf-8?B?ekQxN2k4RCt5L1hmZ05oS2NCNmxpaDRmU2diSDBJTmNsVmdzb25mWUNqaUVU?=
 =?utf-8?B?NXdtSFpZM0t3MGVxTGRQWHdTOHNvZ0NmYThVRlVHQU1pVVd5ckNvOHhtQm1p?=
 =?utf-8?B?aklZZjFDSmo3TlBJTVNwL1RPMkNJWVZVaXZONnpFNHd0bVgveDF0RXdGV0oy?=
 =?utf-8?B?RDB6QkV1aTFUZWNLMVdOMVduSUNUUlYreHBIbjRBeW1HUDN6WkEwd2g1UVhL?=
 =?utf-8?B?Y0hlL3RyNEU3cm1WaXFJaVMrc1pydUVzTjRBeEJNbjJJNTNBeVc1RzFQRmhv?=
 =?utf-8?B?dmFZbXVJNno2amJIV3FUUUhQQkhtdEFiTmlKQVV3TFVHc0g0aWhLU0RqRWxh?=
 =?utf-8?B?cVlmOUt2bGVHRUJKSTl3cDlMZWtKaFkrUHdhcW5BN3UwbUEyRUlFTDYyeE56?=
 =?utf-8?B?TnBhVjhwZUhVd0d6RVFJTnBmSFh5Z0ZldWVkdDVzbERGS01URnJ5RTlmRDJQ?=
 =?utf-8?B?Um8vSlFrQk9KbWZPSDltWXFwcWJTZlRlMGJWUGViZkR6ZWdtaHpLaUlOZkVU?=
 =?utf-8?B?RHoxeDZxb092UlgwQzVYSjBzcXJlTnJOY2F2WnQ2UWw1cWcvOW9ZWHlaR1hk?=
 =?utf-8?B?NEpvYnk5a0E3L3EyZlpId1BadUV0SHlFNEJyQ0htV1hSUjg1ZTJySERqcFV5?=
 =?utf-8?B?Q3JjdnpVc08xT1Vob3U2YWU5MGlSZXU4WmVTbzFPMXZreVgveElmenNYaFZp?=
 =?utf-8?B?TS9nYy9lbndZd0RqUXFIWHVvZVo4cDMvR0tubW5rWGxtYTZGMjZsY3RtU0Z4?=
 =?utf-8?B?bXlmOW9OandiV1NTdG5ydU1YZytvWHcwYnF5aDZGWGlLa0MvR2hpOHB6L01Q?=
 =?utf-8?B?MEpIQldtdGMyeE5lcWFwSFJhb21QdHZDK0cyT3A1S2sxRnN5ZzlTK3FzSkFp?=
 =?utf-8?B?NU0wWW5EbDJOa3U5S2ZhRGpNS1ExL3hVS0owUXcrV2FJSVVIWVhLQWdHMEJQ?=
 =?utf-8?B?WlZCenBEOHVnMVorMUt6OUVjLzE3OEVadFpUL0hWZkRVM244ZTlRRzZCREpW?=
 =?utf-8?B?ZkljUmFOeFN0VHVOYy8zUUd3K1JzMXFKTkhTZlJBOER3a1VKajU0SFhoeFRG?=
 =?utf-8?B?aStmdHVlR0RNVlhzeUM3aFdEamY1UUFtL2dTV1pZcS9GRzdJTnhIU0RGRGUv?=
 =?utf-8?B?WmpxNDBGeG1mRmg4TVk2Y2pUb1BMZzNXaFRDZzk1d0R3NmljTzBNMkJ3S25y?=
 =?utf-8?B?UjhNU0s5K1BLZGlwT0V0NG9hRWJ6Z2hySU40dzY4dnhzeFdMd3NUNHJWY3Ft?=
 =?utf-8?Q?zScg=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 09:50:55.9278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b820bc4-5609-45f3-94e4-08de0fbe2a41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6667
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



On 10/20/25 10:30, Boris Brezillon wrote:
> On Mon, 20 Oct 2025 09:59:14 +0100
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> This commit addresses a memleak issue of panthor_vma (or drm_gpuva)
>> structure in Panthor driver, that can happen if the GPU page table
>> update operation to map the pages fail.
>> The issue is very unlikely to occur in practice.
>>
>> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_mmu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 6dec4354e378..34a86f7b58d9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -2081,8 +2081,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>>   	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
>>   				   op_ctx->map.sgt, op->map.gem.offset,
>>   				   op->map.va.range);
>> -	if (ret)
>> +	if (ret) {
>> +		kfree(vma);
> 
> Calling kfree() in this context is probably fine, but I think I'd
> prefer if we were introducing a panthor_vm_op_ctx_return_vma() helper
> returning the vma to the preallocated array, and letting the deferred
> cleanup function free this up.


Thanks for the quick review.

So need to do like this, where we search for a NULL entry to store the 
VMA pointer to be returned ?

static void
panthor_vm_op_ctx_return_vma(struct panthor_vm_op_ctx *op_ctx,
			     struct panthor_vma *vma)
{
	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++) {
		if (!op_ctx->preallocated_vmas[i]) {
			op_ctx->preallocated_vmas[i] = vma;
			return;
		}
	}
}


Please let me know.

Best regards
Akash

> 
>>   		return ret;
>> +	}
>>   
>>   	/* Ref owned by the mapping now, clear the obj field so we don't release the
>>   	 * pinning/obj ref behind GPUVA's back.
> 
