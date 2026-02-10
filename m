Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK8sMcXrimlEOwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:26:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83B1183D4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D3610E4FA;
	Tue, 10 Feb 2026 08:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qhVKWspv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2710E4FE;
 Tue, 10 Feb 2026 08:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkKjs+wiwmPP1L/DN+mywlY20u6B5EqpcVu4TL9pH1es6LJUDIOAczeLv5SUF8ZSr9O4Ryjt9AHTDTAGWKqmGkHrhTMlNLRM2YdJ3ytaehbuz/dVzrR8ko8kH9SL9vx19onnHEcvySmMsbNcQbE+byv/cXPICMwNhAEo8nLiP8jVAxGrWwunawmyEu1E3Z/OxyQfqM6tl2x/85jY7dVjHD+0axEFpGgreYby2zu0QM9YuJK0LG+ex9fBPf4r8xVSrqNtaL6BLZr3r1VE0bP66U96mf9ufW60RVvj9n0ZvdFcoHLkAi/xQUp/0z1+MKugHOoNsLZ38SNm+hgqbOoHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2uNqVFKM1zaI8t4Esc2nNFydWV4tq0giZdAotz3FZs=;
 b=xLIHtpVJNHvOAitlQ3gnK3Y+/4OmmEccGCFfB14XGtLADV5PZUTQ8IZqzEH5s7vyTuhkNSQ6tGeuu7okiOgkQQFjwRC9xNcFJ7om1gTOf/hg9FBCQnulGnc/7dqi3P9XXoUSDhDw81XVsLdDLR7FoloZu5D/hfc0VuumzssTy42a3o5JEt5M01inzDN0SH9ASrqAffwXJyZAilUB+EbXy1RAVjCgPe8yK42gqSHexrDEgGfl7aG2Gs1bjTsTcXSJysL8h3TeKRxN6sZR8NdziOcKs9I3roL0Q+/MaFbeKLZGPA02c1QEssYUYQ52zOG4vLYvGSvYDFNiYDcezqLc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2uNqVFKM1zaI8t4Esc2nNFydWV4tq0giZdAotz3FZs=;
 b=qhVKWspvlhpLPD60ewYGFGAkbmePCN+ABLtUgNsJMe4mWg5u3w6qGjE4ouumXQEwSJjmVNtLeelkejYz32Td6pU4D4t734w/ot/cvLT1faryTnFnI6NbyQU/G+WW0Kb5bEFOXgdl0kTKWN7I+SNBRzQxJCK9hraMYAietM/DpWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 08:26:36 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:26:36 +0000
Message-ID: <739a3c0f-13b9-4597-8e76-d8bd2c1a7fe2@amd.com>
Date: Tue, 10 Feb 2026 09:26:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: introduce KMS recovery mechanism
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, Xaver Hugl <xaver.hugl@kde.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ivan Lipski <ivan.lipski@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260206235846.1019172-1-someguy@effective-light.com>
 <2ac2dc2f-552c-4084-872b-179a1e489156@amd.com> <aYpn74JYNIR5Kr-9@hal-station>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aYpn74JYNIR5Kr-9@hal-station>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d486d2-dad3-4835-1611-08de687e1ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1c1Q1IxL0UvLzdmblpLZEc0dzg1Qjd2T0YxbzBhTE1ySno2amluSGdZMkhl?=
 =?utf-8?B?VGVjVGk2RjhGQlZseEE1NlNxWkRmYkhjT04vSkdqM3BVUFpneklqYmZHZHcr?=
 =?utf-8?B?R0cxUTM5R3NUODB3ZlNYTnhSVUYvMUV5WUYrWDBFQlpmL2dDWURjTElGdExW?=
 =?utf-8?B?Y01Ud3RKaHYyUDBycGowcjVNMnlSSFBVUndKQm5YaysvaWVpRmxmYWo2VE5G?=
 =?utf-8?B?ekVwbVRwZnVrZy9oWGtQSDkwWU1aa1hSVEs5N3JkMXlCNE9GY3JDK25BRXRY?=
 =?utf-8?B?MHU4enVNT0JOSkdnMlhxYWlwb2VhWTlJU2p4aVBKWjlLZ3hMRWFPYXFXM2tn?=
 =?utf-8?B?VkFlajhHTkRNNGc1VzNJRFl3Qm40bGRNVHcvTlBnN2JvaXR5TVNSN3gvb3JC?=
 =?utf-8?B?NUdYWDB3YTBZd2VaNkRidmRPYUZtancvZVJEVGJwTm9obGlJQkhKTmNpRWo0?=
 =?utf-8?B?Z3RhSXhoaUtMS3NEcjQ3RGxMWVdKUGhVcXlMalMrb2xqb2RRQ2FQVjFRUkIw?=
 =?utf-8?B?TituWnJjeUpIN3Q5TlI5ZG1XMEZCSVlNU3owQVVRellWejVna2FWU0N4bEht?=
 =?utf-8?B?aEcrVVNObG95R1hCUXAyWkQxWmVDKzdFS0kyWWsyZUhMTDFiU3MwQm1oWXla?=
 =?utf-8?B?ckkvdEFLK3ljMFl2VnFKTlB4YklGUEVSWktnc1Y1NTQrN0RTV2JkQ1NKV3d2?=
 =?utf-8?B?VjQrTjJXbXVwY2pidHBTd3JrSTdMYndXb2pZZk9EanZnYkZxK0NpK0tVbFZh?=
 =?utf-8?B?MDlsM3RVVWNZcTFob1RWbkkvbFpud3l5VUtoMDE5S2lCQWNpZVRTaHJJTEg0?=
 =?utf-8?B?Tkt1WkFZUnZNZ1ZHTWxZTVlKeXB1Ui9tbGN2eU9aYXY5N0dMeExqeUkvYlRX?=
 =?utf-8?B?RTZpNkVtbjVvbDl4bWR4cjZCdG1nTlBmMlJmWndWZDVDb0JyWjlVSTlpaGt2?=
 =?utf-8?B?dy85UW5HbUtoc3BCZjU4MHE5UlRpNHJNYmlrNEhONlZZYlBpeWg0U3NnUmtB?=
 =?utf-8?B?eHQ2WGE2WURrdkswckdWMllHVXV2RVFSK3hPR3dqcHk4Q2hVZ0ZGRXlVS3N5?=
 =?utf-8?B?U3B6VnNwWjlMS0ZHeWVTWjFnUURZSG1CeW0xQzg4dUVjTW9iWFdlNDUyOGJZ?=
 =?utf-8?B?eGkxUzhCbWFhZGJXRVJUbGlselFmaENNY25LQWNQNmhlUEpyRGxidUkxNWlR?=
 =?utf-8?B?RjBNZmtmenc3TE9KZFF1b1pDTnF3bFJxYnF5enRES240QlEzNDF0YXJsNFVL?=
 =?utf-8?B?cmtLZFQzS1ppNm05TG8xb1U3dzlXZG9IQjQ4VEJQaXQxdU56MmtGQWhLaG4v?=
 =?utf-8?B?Sy9vTnJjc0JKdWkxNURuVk0xODBmeDhsallja09tZlNZWFdKc0FWR0o4SHFR?=
 =?utf-8?B?UmpqSWhkdXVNM2syOHVtdjVxeFRweUliMkNQdXQyRmdzVVFuZU9Wd1ZwRitn?=
 =?utf-8?B?aThUL2FvcklwU2Z3RENNRE1xS0dhclNiWlVHSFEvekRCUkszVmJsb1BJV01p?=
 =?utf-8?B?UGpQbmJVWTBFengrcFh1TGV5K2VTemhPd243dTRZWkltNmFWV3BGNSt4ZStI?=
 =?utf-8?B?ZlB1ZURQWmVWa1pXV1NVVFBScVg2YVpYVFZoMjNNWEw2cFArcFR1NEpDMGh0?=
 =?utf-8?B?dER4dEJXcDlwdkZJVUwyOXgwVGdaMmV1OEVrTUFVMkNlbWcxd2dnWjJaMDZZ?=
 =?utf-8?B?R2tpOGU4c1dvK1VFNTNVR1BkTXlGWUNESHlhc2J3SXdSUCtYRUR0TDIwYUxq?=
 =?utf-8?B?MFZpb29lOUFVQXo5aUZHR1dCaWZpb2lSK1p4OVdwcThzcjlNZFVmSEVZdllQ?=
 =?utf-8?B?OTlMVWRZRTl2ck5ucFNhQWprSEdySmpXMEJyTllqMlgzb3R6R2lWWmlVaytO?=
 =?utf-8?B?clpSOFE0YnRHNFVzbVlWaExYZnZDNWxCNkhBWjk0dCtMQ05GdzhOUStaMHJp?=
 =?utf-8?B?WGUzbUQ5WitBVjdHdjhuR0Vzb09YVnBVUmZWZ0k5ODV2NXNocmwrdTF2M1Y5?=
 =?utf-8?B?ZkFjL0l4MUxPa0Vwb1Vkd0Rub2lsbUFFZjVadXh2TjN2amlaS2Z3WWRDRHpD?=
 =?utf-8?B?VjNoV3U1K1g0cktLdXh3SDZyUGxjanhReHhnWHVaUWVlc1JwcE8zNTFRQTAv?=
 =?utf-8?Q?WXDI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZuT0ExdmxSVHJ4b29XRjRxL1MvRDdIelRrdmpLYS8yYWFMZEtiTmdSakIz?=
 =?utf-8?B?SnJDSW1KcnB1RzJRMkUxN0lIbmhKaTZmcnZUMDQ2UDJqL3Q3bDJJVWhJbnQw?=
 =?utf-8?B?eFJpalgwK3BCRklFQnE2b28zTXdjVHRPUVlqZzVwSW5BSTcrV0JDUEFtd1pl?=
 =?utf-8?B?ZjlWbVpyU1dqTEtENFJaVW5Lc2hxWHc4UVRnakJIc20wRVQxRHBQb1hVbUQw?=
 =?utf-8?B?OEp1MXZpbEJIRlBZYXhJaGZXNXJVeEQxUGljUmZYYkhkeUVFUjhEMDJ0cmRC?=
 =?utf-8?B?R2Z5eVgyTGtib085QWpDVmcrallHcUJjTzZ0Y25WdFVwcXFsUU42dk9PVGtE?=
 =?utf-8?B?UGV0Nm5kZ2dkcnJnN1MreU9XR3YzQ1pNZ2NCd0JXNU9hMVgxQndnSGlVd0du?=
 =?utf-8?B?NlRsaWJaNUszc1FhQ0lmZmo2V1pNMXhZRUlqN3ZIUnFXOEtNdmlRb0w0eWhD?=
 =?utf-8?B?QVV5d2tTMUJjdFFLRjZUR29tanBqNjFwTDRaN0xiTjZPQXBpRlRtMEUvbmU3?=
 =?utf-8?B?SytEdTVuOGJ0bVYrSW9vMFRQbnY2SnFFUjVVdS9DVUR0Q2tQUk1XZnM3eGtF?=
 =?utf-8?B?R2EvT3BXUE5nenZtYnNoWVRtYnI5MmNyTWN0TFovc3hzUWE2eFkyQm5VOTc1?=
 =?utf-8?B?U3ZZcVVlQW5LNGx2eU5Oa09Yc3czM1BYVTBqdEozUFVkeHErdGMwMGRPdVVt?=
 =?utf-8?B?WllydlNhSWc3VmxGTTJsd2J3cUU4SWJaL01MdUFrcTd1L0JQbWcrZExLaExr?=
 =?utf-8?B?T1VZQ3FUcUd4d1g1bWdyYyt6Mmc0SEhRVWpYNnptYjRBZkdMVEVmL003MHNu?=
 =?utf-8?B?V1JMVWE2SHFIVk8vRkh2cVhNa21kQnFpVG9pc2pFYk9Lc2czTlJuV2Zpb2lJ?=
 =?utf-8?B?NDVucWU2Vm5Maks0RWRzaHBMQkVwMFhhaGlubmhRY3Q5cEZuVGZTWUg5VWVj?=
 =?utf-8?B?Y204YVpGd1JKdTh6SFM0ZFpQWXZvOGFiV1l2KzNHdFJvUzJGVENuTldKYWpr?=
 =?utf-8?B?UHBuRFBIWDliNXg3Yk5uTmdtbnoyL09xYnZwbTdoTElNZUxpQzltU0ZSQ3p5?=
 =?utf-8?B?dUlrZ0M3RXdsTStQdDJydlJUN0NLR1dCR3gvSmFuQnFKUDNLNitTM285RmNR?=
 =?utf-8?B?bHBnVXlUS0RZLzRkQkFWaEdrdXl4czRNcWsxT1h3cWxxSmlWQm43MFI2Nysy?=
 =?utf-8?B?SXE2RW9OU1N6UnBxbGdZSFYvQ3JBWXR0K21RV2VCMEhrWGFnc0FuemJhcDla?=
 =?utf-8?B?R3ZOd0huTjBGSGhuRWErTExHc1QyYzE5bmFna0JNUkRrd3FPT0htTG5RSity?=
 =?utf-8?B?NE8rM3ovS09Rd2t3NHBtRmV2YnNXT0RXVkdVMjMzZXVTanVtOFE5ZCtqcHVi?=
 =?utf-8?B?MjhFOHdMQ3lxM2tNSWk5cHpyWFpFVnpIVjQvTTY5dmRxTmdNTVJ2elpLU0Zu?=
 =?utf-8?B?cjZubzJUVTkzdGgrUS9hSVF4NUJYTHFId3pKZ2VQZjNBZXBwV21jejMwNVFX?=
 =?utf-8?B?QXVlaXUyL0Rxd0ZGeWVyYXNZMVFDcWYreGRJU05TQU1LMkZRYk9qVnoxcjFF?=
 =?utf-8?B?dlNDc1UyQXdJWDFNTWxVcDF0R1drZGVlTk5EeXB0N0Q5Z2hnN2JnM3llZytk?=
 =?utf-8?B?YmxLTy85TkJtaks2QXh2WWxXaTZUZkp1alNKM3RnWXBXcFNLa2dXVE4wVklh?=
 =?utf-8?B?VmV5QUNEUEh1YXRuQndoeCtuSU14SEs2NVRGM1V3RVZ1VlNtMkxDYVY1NEp4?=
 =?utf-8?B?ZnhXem5VbXBFUlRKUWpyUnlKeW9EWWxxWlZyNVQyaUpRdWZMRWJYRTA2RFVs?=
 =?utf-8?B?QkszOVFJOVN4NmlFaHZJQkVxTkI3TDZoKzM0bmhXcDBLdlNLeitmckZ0aExs?=
 =?utf-8?B?WU1DRTRRY2ZiNkVPbXZhcXdpZWlJS1VGMTNMc0V3VWMrWmRRUTlMRVZnTTBy?=
 =?utf-8?B?ZG1BZEFmemFhYklJbVJET042NlViTFB1c3ViYmx3dHpMT3FsL1JRcm84eS81?=
 =?utf-8?B?TkhvOW1MSEhzS25FWWs1SXZqcmdUNUhsVzZiZjFXUExCcmxhYmQwaXdIRGRU?=
 =?utf-8?B?NkxWS056ckF0eHhMejZ4ZXJWZVhtS2Q4WlFlazkxK091SGkxaXh5QmZ5REgy?=
 =?utf-8?B?emdPai9vMTMxOWErcm8rb20ySmdGWWZIZEVaU2tJbmU4eTFmYTg4amszalIv?=
 =?utf-8?B?ZXllTVNSSDg4T0xLZ3hoaXg4QVU5cTdaNTZoQ01rU0NFeEtRNis0bUhTVzBK?=
 =?utf-8?B?M1MyU3A4Nm1Cd1hyYnRPR1FHdXhmb1F3ekwwcllPWldqRHI4Sy9nL3ZMdktY?=
 =?utf-8?Q?EnjZkDxYI2elWLW5Hc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d486d2-dad3-4835-1611-08de687e1ae7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:26:36.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d833c06L8XJwrO1IhQ0TQlaecJFQ06WjerLMpxAmplfJI9UpssjboyOfFBRhhBDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,mailbox.org,kde.org,amd.com,igalia.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2F83B1183D4
X-Rspamd-Action: no action

On 2/10/26 00:04, Hamza Mahfooz wrote:
> On Mon, Feb 09, 2026 at 10:35:05AM +0100, Christian König wrote:
>>> +	/**
>>> +	 * @page_flip_timeout:
>>> +	 *
>>> +	 * This optional hook is called if &drm_crtc_commit.flip_done times out,
>>> +	 * and can be used by drivers to attempt to recover from a page flip
>>> +	 * timeout.
>>> +	 */
>>> +	void (*page_flip_timeout)(struct drm_crtc *crtc);
>>
>> As far as I can see a callback is clearly not the right approach.
>>
>> The drm_atomic_helper_wait_for_flip_done() helper is called by the driver, isn't it?
>>
>> So what we need is just to give an error code back to the driver.
>>
> 
> I guess we could just have the function return -ETIMEOUT, but then
> drivers wouldn't know which crtc is timing out and AFAIK drivers aren't
> supposed to touch `drm_crtc_commit`s so they don't really have a
> sanctioned means to figure that out on their own.

Well we can add a helper to allow the driver to query each crtc for pending flips.

What you do here is usually called mid-layering (e.g. driver calls function, function calls back into driver) and is a clear no-go for acceptable upstream code.

Regards,
Christian.
