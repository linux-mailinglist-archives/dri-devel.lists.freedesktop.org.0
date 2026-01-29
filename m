Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDaVGEgQe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B60ACEC2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FA810E803;
	Thu, 29 Jan 2026 07:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DI2wVU0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031FD10E800;
 Thu, 29 Jan 2026 07:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcTvR7DZw0CYYb4jmaAEioHUkOl/O77eUIEtfJTTvb0KpKLEGNgH9sOLbaATllnOodrC9SEb1RzmHUdUlHc9GAfY77nt7jIIHUF0u7lBUAvC1nwFBsBIxtMyT94Y+J0e+YnE3S/BZCOdQ8GOISFut9aAFiM2QOCsfCzCPdlc6ksjCu4H7WDpKNjSR6yxBsALTA+hx1agZiiOw2AzloDA2sI01kKVDJvU+/25tv6hAC7MfuKPBtWPIRJc+dJQZCOytJEBOFi++j1g3+3975l0veOxs79bkBinEnmEp/1OQrN7ONi5H4FD8B56jQUI8lp0jAx7Lq+EDVUhKkjnB+Ev8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru1GXJ4TLm+pn0FtBACF4a3xa5wniCGSE6gp36h4d2I=;
 b=sHwaulgxdR80qV309XqgMQaDmrVf/OiixnyseyYiXiFigXA9MKVSQkJgvcCSchkRrji0fz9Ml5/KsX8WPZc3GGAYDcFrsHSR4JvgGKhSUNMQLMRw+ZhHmxw7QqIUYCn84pW/2mWFMS3ZKGqizMRHdkuzXWBIwMpr5qypq+D1AN0Z65brnxIQTWvCFzJ/eJ+a1SlcpKBY9DIo5YsDl2w86BD2EAkmGuHfYkYaxfL9OBuCCZgFPC/cUoXK7ELJ7wh4W81v0OhqZzZ0rGanc5VWPkaM5JedyIeSduvFIuht+DHjes/AqMafHxxPlw7P0ObzIbL5TxJL0Bx6clOmYxbDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru1GXJ4TLm+pn0FtBACF4a3xa5wniCGSE6gp36h4d2I=;
 b=DI2wVU0mr1HbQQC4hjwzr+xN1ngzSHjfxmECi9+S35lrA9O+6paqqEfR2d9O+6tj0pkeiwd1CGLn7utu6oQ6kBaUnGpVvztQYFugrMcGTPH1owOR8N2ml+BJTEpfp9g3s7pRKzXqy1mEyZA6X2V/lhIFaeESZsCoHtKFTxtcgKcCmlv24t+wJIDDtrwW9BNxPU+acyKHRqyjPFBZGAmh46FrnzyQw2OYUe5H0w/1mrFGTctSF/g1DSKLoAZnJCssIhbjDp6NCkABOw23d1GlPE75LApxzCdaavffDS6r+dA4iTAF1BwRrQKjeNe3/em1xqZccCcDDa7wLpGBGjsdNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:46:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:46:04 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 29 Jan 2026 16:45:02 +0900
Subject: [PATCH v3 4/5] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-nova-core-cmdq1-v3-4-2ede85493a27@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 75070a3d-b19f-4cfd-1997-08de5f0a7488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekNpNXg5TzJaNnJ1V3FMNm5pb3RkQnAxWVpKeEtQYWtkU0REV0lOalExYi9m?=
 =?utf-8?B?M1NDUE1OY1JKRndJR0ZMd1JMc0VZTWMySUNzc2ozZlRkNG9TSkwxeGoyU3Fo?=
 =?utf-8?B?eExMeGFVcFYyV1R3bE1SRXMwWmdsS0NubWdkQzdoQ0xDc3ZEOEJNYVRKMXpk?=
 =?utf-8?B?SVkzeURKWUh6UUFTODlvY3RSUDJETzNiTFB5c3Q4dlZjbHF1d2hOWHlGWmNL?=
 =?utf-8?B?K2JSNGlzaURMWE01L0xXR28yQysyWlFZYTcwOHVjdExJRXRnb3ZuOXRER2tO?=
 =?utf-8?B?a2FadTFtZmVOUjFBV09aSWNodUNPL05RMHRjMEt2L2RRcW0way9kTktyL3JJ?=
 =?utf-8?B?aWIvMngra2lRWnZtTGtnNzduNERvYjBrWXR4TnlBQW5OS3lMNEI4T2I0R2Fz?=
 =?utf-8?B?MHBXV0I4M3Y5Vm8vRWtsdUVPM0RydnRSbEdkNmZWdDlJTDhGOFNRaUJTVEN4?=
 =?utf-8?B?YW5RSk5PT2ZDaFYwenVZL2g1a2JYWEl4TUlENTIxam1ibFpOdUpqMit0eXk5?=
 =?utf-8?B?dm53OEFVMWNYNlpWeVkxckVSZjE1M2tFNndKd0x4TmpXbVp5RTQ2MzJUMVdP?=
 =?utf-8?B?ZlFQUHlDVlBnNU5NcXArbG5ZU0lCaG5oaFpaV2w2VWM5S2xLL003SG80STFH?=
 =?utf-8?B?b3VIUXkxMWNzL2JNRWp5R29xWkF6bFVleFlNZ0FNMlVVdmdnOXNYNy9uaFhs?=
 =?utf-8?B?d2tXTE9TNTlHQlVXTmNFWnN0THUyL1BaR3JMbVdQdVFRVmw3TEloZm8yLzFF?=
 =?utf-8?B?WmtsYW1GbXcxUW5lRjBzQVh1eWpzbXhwWnYzWHlBaHl0YjUzMFFvVFNBZDFZ?=
 =?utf-8?B?czI3ZkpveHhkQndXNUdNMFg3WFlWYVEwejRIdmtLZjJmejN0UmNjVE9XZUlh?=
 =?utf-8?B?elI4aGJyK2s4c3lwNjlrS1gxWUxqTFR2QjhoWmI5MUdsczFTTFRta1luazNP?=
 =?utf-8?B?T2w0R3ZRMWtyQ2R2OXpTWUlYQ0dxdFlOb0ZIOEJJWW15a29wQSszc0MyNHV2?=
 =?utf-8?B?K1R4K2pKbmtxak9SQkhkZGhmTVRiKzVtKzNkYm5jTm5BT3RMRlc4U3IwaFgw?=
 =?utf-8?B?bnErdkFmZUx0YkdUajlqVGRQdHlJSitjU2tFbDhkMmJySWRlWEdrNzdTK1pC?=
 =?utf-8?B?cmJjcWNKVEQza3AyMDExQnBhVWxYTTJtTmttTmsydWtXSDBteUVZS0Q3Z0Nn?=
 =?utf-8?B?M0N5WExHbWFuR1ZzcDQvL2Y0R2Q1WnB3WlIrZE1NL1dSN1VlYkFrUEFCNk14?=
 =?utf-8?B?V3lHOTFhQjNjVUw3SzVhRCtsZVRRLy9xOHp0ZG9sMzZuMGRyQVhuYnA4bFI0?=
 =?utf-8?B?T1FaWFliaG5nNzFSYjFtQnZISlRGNlg2WkJsMGRlRHdmWlkza1ZhQlVYQkZM?=
 =?utf-8?B?eWtTUlVyR3UzcXdBZTJKRGNvRDY5RzhzNWxmTTlqYld4MWFwV1F4N3VFS3ZS?=
 =?utf-8?B?aDZUMWc2WTEyVmZPWnJ0T3VXaExTS0Fnak9kTWpReEpIRDZDTDRYWkJ2aXdX?=
 =?utf-8?B?M1UwZ0xiR044S2N1OWpNQzFHdUk4TUFrZkZ5U25Sd2Fpa0RjYTFyL3RLS1RC?=
 =?utf-8?B?VzZES3VHRUVJU040eEFmUkpJZEd5c0luTDRsbW1FZ05wS0FBN0lxWExTQ1Vw?=
 =?utf-8?B?TTlnMDY5NVBSL2l3ZWRwczF6d3VVOW4rVHVMdG9OR0QySU1XR3g0OFViVnFK?=
 =?utf-8?B?RnYvcWxTcHlGZ1VqS0w1RmZ6WkhUdkkwUDg0UlFnMVZnL1NGSEVNa0R2WGtN?=
 =?utf-8?B?ajVucTVqdU9QOFFvMFBYcXREem9qWFVHWGxkOWI0UG8zdjNPRFpUK0h4a1pI?=
 =?utf-8?B?eU1mWVRxZytJOXdBZlI0cm9hb3o4TG5JaGdPM3JOQm9BNXA0VlI3RU1qeUZy?=
 =?utf-8?B?KzRqUWVGaEdNS1pJZnE3aFk2ekNTNm9NaklnUXkwTndLK3FOM2J3Qkl5VXlX?=
 =?utf-8?B?OTdnemtrc01PbUJ2WlBaZEV5ZkhFMWVKWDRhSDlFSldDYkcvTkgxaDIyUUln?=
 =?utf-8?B?WnRjeTNMTVlCYmlUWWFDZlo2VlJQYXFXbVVtSFc5TGdhaHpIOWZNQ2x0bHND?=
 =?utf-8?B?aXMrWVg5djBIUXZjMGI5QjBSQzJWSFJxTnpOTzVmdENucG95bm1nRnlydVg4?=
 =?utf-8?Q?5wv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZyT09HR0RjUHhkUXhSSW5PRjdBTkgrdCtuWmNnZjFnNW1qU1VsN1REWEFz?=
 =?utf-8?B?VVdUWUFvbitCdE5Ic3FueXBLZHc1bmp5NWJETngxd2FoY2JSYkViUXR6UXhs?=
 =?utf-8?B?NDVnemQvMEp5ZmlHek9QZUNrTGhBc3NOZW5oakZGVVdHUDZtdzJrdUJnVTR3?=
 =?utf-8?B?MVpZRlZtZzJaRG9mNnlKVlRWVDdPSnBhOHJ0WTVYZXhYYlNXREpINFZjdXNQ?=
 =?utf-8?B?cTRSdGhwQVcxNEpIZXZaa0Viak5uNVZ2cmk0WXppUit0dUNTWHI3OTJoWTFO?=
 =?utf-8?B?SDAxN3Q0Q3RRT21Zak11NXhqeE80eEp5QXJjTWNFT0I1dElMMXVuS1BtL0NQ?=
 =?utf-8?B?SDNScHROS08rejhtQlJSNUJMamhZZEtDd0lvbm1iQjQ5Nlpuc2JjNEpSVUo3?=
 =?utf-8?B?UUMxbWZoTXJmaDl2MTg1OXBQSUZQWHg4QWE4TnV1VFMvQXNLWXBoL0FBclp2?=
 =?utf-8?B?VVhYQlBwUWZ5ZzZDTk0xZTZIYjlENjM1eDBDS1pPSG90WHRaZkVyeHBQZXlK?=
 =?utf-8?B?dFRUTUhUb2xxajZvbjY5L3RqYm5MNWdhNUlrcXJhU2lKWDU4UDU5VFR2MkxB?=
 =?utf-8?B?eGE0MlZ0Wlg0bElTVFNjUlYybTd6OGRWLzJHSGY4Sk41OHZLT3VPeTlzaUJH?=
 =?utf-8?B?U3VkNEhqa2tFM3pGWVFEOWFvNjBIWjcxaVArblVjQldrRTVRUXlxcVNneVVX?=
 =?utf-8?B?dUt3RlNtckpySWxuMEZzTHZ3QlA2bVY0NlJtandOQ0JvT0FyS05JaFg5S01W?=
 =?utf-8?B?Z3RUaXljc2dDQUhuVzBhQU4ycFVQcUFCVkpOOXZHdjQxalBuemJJN0VxRENu?=
 =?utf-8?B?SHdlWUMyQkd4cEZNRHBVdlU1NXpZdU83MDArTlpRRUkvYWFaSVBhcGdaRnl3?=
 =?utf-8?B?SVRKSWpzSmc4UkdkQ3RlR3dyQVg2cS9zTURDMmtId2lCWjlWTlo4Rkh5NFA5?=
 =?utf-8?B?K0RVdXl1RTNCZzBDMmlqaHE5cnZkQUxsc1pmVG9QWWxoTmJiWmJQSTVOOE5o?=
 =?utf-8?B?V0tUZWlMRUdaY0grY2JUQ2FJS0QwWUd4ZlF2NFlIUGR5QnR6aXhsbzlKb2NO?=
 =?utf-8?B?L0VDNnFkNUlGOFlKdVlVS3ZxTkNsWTZBUDNxNExPM0hmZTBpZGJNU1Q3cFJR?=
 =?utf-8?B?ZWVYZFpoQ2NWbHU0NVh3ZWVFdzN0c1laL2hsUWJFYmRzcDE4MmxhaG11N3ow?=
 =?utf-8?B?MUtLSHd6YXdqSFpVY09NLyt5SmE2empKOVBPdU9hTzdzRGMyeDdUNUhJaWkx?=
 =?utf-8?B?WnJNN2Nteit2TG9RUnBQNGU1VjJIeTdpOEl6SEZvMHlPUEFob0oyWTVHQktH?=
 =?utf-8?B?QVM4dllVRlYrVlNTTjl1SnhMNm1wcjlPMHdSc1lLVHRGRkZ2bU1YM2w3WVg1?=
 =?utf-8?B?WUFrNUlWeVdnZVB5MTBlZTJWaktzYWVkTWF5dzNxU3J2bGp1WWd6OGoxN2RU?=
 =?utf-8?B?ZXUwdkZ5UUU5Rm5rV3hUbmIyMEROUHcxcDNWMlM2MVpIWlVOcDlaYi8yc29P?=
 =?utf-8?B?eHJrSEoxUGg2QW1XU0xtMGRHNElTNENPTGJnODZRUytWZFB6SjhNV0NvZjIw?=
 =?utf-8?B?UFlaT1A5NzhEQnRuMms4d1RaaEVqVkdQdTBjSG9CN0RUZ2djMUpEV2Z2Z1dN?=
 =?utf-8?B?MjJXaGVTVWFqU1hWRW1MR1N5c2VodkN6NjFUdVZ3b0N2R1lZTTJGSGwyekR2?=
 =?utf-8?B?NnFlRWhFaWR1ZHVjY3Y5aXVpZm5mTS84N2dtV1hoK1JFMEh0Z0VkQmg3YWkx?=
 =?utf-8?B?RmFaTjFlN1ZiVzI1alBwY093YS9MRHhXeHMyQ0c3Vmd4UHg1NzV3Wm55emRk?=
 =?utf-8?B?MVFESlFOc05nbk1YcUxDV0FRRElveHJpWVFseEtOQ2NMUkhFcWRHR2t3Nzkz?=
 =?utf-8?B?Z28wanpIdW9ORnd4dnNTUGhXZGxZN0Z1UnVwTDUvTVdMTXcya1o3ZmRsUWVB?=
 =?utf-8?B?TmVuZHZudFE4WGZhM2dvWUJmL284SzA2UUhTYVJROFp6ZExSa0Z6ZUE5K1F4?=
 =?utf-8?B?aWlSbGliQnBDNVkwOTZDaTI5RVRwN0xRS3pjSHFVV09iM1g0cE1pRFNIUFRY?=
 =?utf-8?B?WEMyT3V3SStkNm8wRGQwemdNdkxBS200amk3ajVTQ2R5SHFBL0lySTRMZzkv?=
 =?utf-8?B?aysrbFY2TzBybHdHQ2FGY0o0dXQxWm4yRW1TUEJaOFBoK0w3Zk44ZVFPZHNr?=
 =?utf-8?B?em8vemx0Y3lIOUpCYVhuT2NQWFN5YjVqbkthMi9FbjFwaUtid0gzNlRRVTJM?=
 =?utf-8?B?RlBUUld1TjRCbFg3bGZIRGFydlFZTmhZd05sOHVTTUIrWGltUUpsWlBqSHB1?=
 =?utf-8?B?eEFYSTNRcnBmK2FoZm5FbzUxSWsyZkVIOVduVmpzbW85N1VNekJRL0laYUxF?=
 =?utf-8?Q?im3d6z8oiw3gNYpP9EW3rFlQBDeC1BXmHts+r28MvkF9h?=
X-MS-Exchange-AntiSpam-MessageData-1: CyroBxxAu9beag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75070a3d-b19f-4cfd-1997-08de5f0a7488
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:46:04.3456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8dMppnL3o7yAlzslaLILcA5QSH1BBmJxsmSdoHyGa18FWXna4i1oOjQnkk5mwlwLK4XD+8cZkDwVJ8tV6h4Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,gabe.freedesktop.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 08B60ACEC2
X-Rspamd-Action: no action

The current code hands out buffers that go all the way up to and
including `rx - 1`, but we need to maintain an empty slot to prevent the
ring buffer from wrapping around into having 'tx == rx', which means
empty.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b88ff8ebc098..333bf0125d74 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -227,21 +227,27 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
-        if rx <= tx {
-            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
-            // to `rx`, minus one unit, belongs to the driver.
-            if rx == 0 {
-                let last = after_tx.len() - 1;
-                (&mut after_tx[..last], &mut [])
-            } else {
-                (after_tx, &mut before_tx[..rx])
-            }
+        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for writing.
+
+        if rx == 0 {
+            // Since `rx` is zero, leave an empty slot at end of the buffer.
+            let last = after_tx.len() - 1;
+            (&mut after_tx[..last], &mut [])
+        } else if rx <= tx {
+            // The area is discontiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - 1` is non-negative because `rx != 0` in this branch.
+            // - The index does not exceed `before_tx.len()` (which equals `tx`) because
+            //   `rx <= tx` in this branch.
+            (after_tx, &mut before_tx[..(rx - 1)])
         } else {
-            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
-            //
-            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_read_ptr`, `rx` and `tx` are
-            // `<= MSGQ_NUM_PAGES`, and the test above ensured that `rx > tx`.
-            (after_tx.split_at_mut(rx - tx).0, &mut [])
+            // The area is contiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - tx - 1` is non-negative because `rx > tx` in this branch.
+            // - The index does not exceed `after_tx.len()` (which is `MSGQ_NUM_PAGES - tx`)
+            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` invariant.
+            (&mut after_tx[..(rx - tx - 1)], &mut [])
         }
     }
 

-- 
2.52.0

