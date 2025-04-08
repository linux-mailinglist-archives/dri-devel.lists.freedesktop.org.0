Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC5A812F1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87ABD10E24F;
	Tue,  8 Apr 2025 16:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WbTYttka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8D10E24F;
 Tue,  8 Apr 2025 16:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk7sTq3V1AvA9AXdoPp594un8j9a6LG+n5Btp6YZxNx5CeC1peraNY9TT6/nzIppHzcBVNqjQfSDHwDq1+KttEhMTIh/3NolWYOjRV9a0j08wAgBmU82NUvESsHaA3CfRsJ50O2M5vCE1E7/1hSMfFipeqZcFbBaUtCCtY0+mPGuWFUMeR0SBGyefbKgVz9rvptfcDnsCCJbNQTboU7rSCD/EN0SXFxzQ1tg0ggQjX3TYgIRrdgp8B7nB0NmQ2RABAeO22u3MflVe4hygK6XMnxMVsgqnZlz6BpozfBmaaPzEvTq/X4f3t8hj8sWTriKA9FYhepv/LjwKieo9BoewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MptmvWg0bz//beDoB0s6KRj0sVQGqe42Tt8ZQQvK98=;
 b=q7Rfw6/vRN65bCpNvFmMV3emPHNlCX+HeXcUrN5Aozi7v9E1EALDADBFlyBDqAPiSE78aMK8ouSk37aRmwkCiV28Ciusa6aHRmOF0pMHL7SbWwEDDh05ye2My4pMmDp5IXjm52DaZenPZic1Ox2SzV1A7x6j46P4D6EbW52ddmn72kczlWHyfXBt9faxiqJ4GTuTlPTawMzImXFEx+sCSqL4YHKCSihJA0WRU8MmLt1wn0+vO05qXsVz9XptxxOIi2FI6ZUciWBY9SuLRZ93rpP2aw5xq/FNAum/VtwnkOFiV5VGE4J5F0QneDDFyE5qciVk2hR/mfAQWzeiVOjnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MptmvWg0bz//beDoB0s6KRj0sVQGqe42Tt8ZQQvK98=;
 b=WbTYttkaEZwtmJKqTbN9dMZwJ6PKdn6vteTYE/V+BRhdCYStV9Xg/4hVOz0wgfyEFjC1x/k+zx+TwWo34D0Aoxq82LZSGeIBmK/uRfYmPcQZ54WdtSHoZyJ3p62JtKyi2KmXpuzWTGJpKnnWSVPe/KdBdpr8/WPo3Ss6lhvbniQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY3PR12MB9679.namprd12.prod.outlook.com (2603:10b6:930:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Tue, 8 Apr
 2025 16:55:07 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 16:55:07 +0000
Message-ID: <11d589f0-3671-417f-8911-7bfb3be88802@amd.com>
Date: Tue, 8 Apr 2025 10:55:03 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: do not copy invalid CRTC timing info
To: Gergo Koteles <soyer@irl.hu>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <24439c13a014e1cd200785db6f3dcf08f4773eb3.1743612701.git.soyer@irl.hu>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <24439c13a014e1cd200785db6f3dcf08f4773eb3.1743612701.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY3PR12MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: f871eeeb-ac57-4f2e-f3d3-08dd76be1df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkJHUDl4UTIxMHJuMVlNZE9aMmFLVkQvNEp5VFJKeGRtQzRmbkdwZXNHNjdS?=
 =?utf-8?B?cUpDRjN5MnEyNm9kWVVhU041blBXcytXSkRmN09EdVFva0lDNmR6SE84SXpa?=
 =?utf-8?B?THMxMXBMdmJaaEpOaWt2OGp2UXh3N0hQcEtDUTUzWDJhOFdZcml5bUhGeUF1?=
 =?utf-8?B?OVozVnV6eUtFeHhOTGVtTng2eE5vanBRdnk5Qk5meEN1ekV6bDE3OFRxUVFh?=
 =?utf-8?B?R1MzYXdML3Nha2NEem0rRkFmaDNiNnRodjZqS2dHSlN1bDRDclNwRTNkaTVz?=
 =?utf-8?B?QWM3aWdvT2RwOE0rTGZrR2xDRVA1RVFrcGxHME5Ib3BDN1hoalFub1NNTnZl?=
 =?utf-8?B?YmRMSVIzRjRZS1pXZjFoTHFLRDczbTdybW5GWkxHcE10S1JGWlVWNVZzaFJq?=
 =?utf-8?B?M1E2eUx0RWd0RGFwdGYvdCsyMXFFek9jUHZibE4rY0FPNnI5YVpaK2FXNjhT?=
 =?utf-8?B?M2JpVkhKMFNVdzdBVnZiQndrKzY4YWZDVmQxRXZsQXJqNkZUWnh2bUNnVUlT?=
 =?utf-8?B?ZldNYlR1Z2dZWDYraUNGNSs4YWpLcjV3QWdkR2VFNVpNclN1cjVybWMzUTIy?=
 =?utf-8?B?aUdLNm5HVWpOT1JLLzJ2WU0waEF3R3VYdjZyK3pMbEwya096akpWSVNnYWZK?=
 =?utf-8?B?K0h5dkhFY1dlU0pzZmprbW51Z0JHUE9xMXJuSDlkVkNNaTkzZTdLQnRNVGpQ?=
 =?utf-8?B?aUpkaWpVQUFlOS92Sm9IaTBWazY1R1RFRmpoVGxHN1ZHbjNEaWU3c2NQdThj?=
 =?utf-8?B?cDBKOXBIbkxZeUpPb08rOUtmM1krNmFYbmhCaTFiWSt3OFBGUmdkeVRTYllG?=
 =?utf-8?B?Znk1Zk9PbmloVW5ET1BXSk8zcjk4aFFNaklWeG5RazQ1L0d1SFJLSXhsWDN6?=
 =?utf-8?B?MDd1VS9zSkp3Q0xScXJhTEkwUzEvNy93VHh2NXhielhhOWx4VFBXTENKWUt3?=
 =?utf-8?B?YVhSekwvc3JjN0t2THAxZlN6YWwySzd3UEJkdndvZE5HdDRKaEtYTU5kLzRU?=
 =?utf-8?B?MzJTNGV6RHI1NlphUExTSmd1aXNkYnM2eFgzaHhScmhjeXFQTEM4eUV2Q1Zr?=
 =?utf-8?B?eXVDSHJmL05RNlB6T0t0Qk5NdzVzMlg5WFl5cDdGblRxTWJWNEhqaXFpY29v?=
 =?utf-8?B?SjlIOFZIWUdTWTFVV21HOFJvRTBTTDljdVduQmFpTG9veXphbEllVDdkSVdl?=
 =?utf-8?B?bENJWTRseW9XRUlncnAwUUd0Rkk1Q1dwMzdzYmhMZWM3a1hFZVdYbmlvMjBi?=
 =?utf-8?B?a2crcjEzL3pPaEh2YngvVjhnRWRvSVJPN29iOXFtWVMrUUsxTERWeUFhc0RG?=
 =?utf-8?B?dTFhcFpnL3VFYkN5U0ZCaWk3NlkzSE9HZnAzYjZnaEpTWFdlRC8zUVFaV3Az?=
 =?utf-8?B?YlRkNVpvRDJyc2V6Z0dmeDYwRTB5UTBWbm1nVzh1c2xNRjZ0aHdWUEwzaVZQ?=
 =?utf-8?B?YThQVU42QVJLdnU5TkRvelJpaStpZUszeFBvbERiR2VoU25yREQ4eDdQeklp?=
 =?utf-8?B?NHAwdUVsM0ZIRW95aU00R3JoMW12NGtWUlhFUGhpTmxPOEpvODJ5Z3IyUXpw?=
 =?utf-8?B?SGhHU0FzYkErYWRVT25xSEhENU9PUU1BYVFpMzlDUlBuV2RscFozcjJFSU44?=
 =?utf-8?B?NmFSUlpJU29rQitiazRQMldsOExndWxiTE9XaXUvaGc0RWs0L2x2U1lacVh6?=
 =?utf-8?B?Wm9EcjRUWlZRVzNXQllMTkoya1FZYUdNemwreG9jSnA0UDgyTVJocVJuaFhk?=
 =?utf-8?B?UkFQeE9VaDNCdVJiNmZzUkdxT1lQQnZzZDBUWHJOMzk4bm15clZ0bWpjNGpR?=
 =?utf-8?B?MHdOTWU4S2VqeWNvVEQwTXB2dkZQSDJDeXhaK2N2VnRKbUF5S2FTamEvNzY5?=
 =?utf-8?Q?cXwQA+rKfe2Ou?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdnYUZKT3BubitxTXV4Uzc3UFAxT0xQMkJkVHhYV0F6ZVVtYUdjMmlCcE10?=
 =?utf-8?B?R1VkVDdkTDAzbXpsd1RXZ1dwRmxKdlJEQVdTWWJaMVo2SEZpZ1JkTHYvcG9L?=
 =?utf-8?B?Smw2cUQ4YyttZkFZQ0ladllhbnA5VlVocTJSREtNa0k1b2NUdmZzZGJpZk5q?=
 =?utf-8?B?cnRrNmg4eDArQkVpWUhFKzdPRnZwaDQ2Q05iUG5IbWR2ZWdJZkR6cXdHc0RE?=
 =?utf-8?B?MnJTQjk1US8wT241YjdYUWNOYUJiY2JsS1BFelluRDVTWlN3T0VkMGJyWHQy?=
 =?utf-8?B?Y0ZwS05wa3hnUG1tQzFieVBpdEx5T0JIUFlJYUtzSExXakJNMEt4WmRsSnFl?=
 =?utf-8?B?Y2hSdEFVVUJycGt5dDA3UHJLQTlPcW96Y3ZrSHk3NU1nLzAwVi93YUo2SC9S?=
 =?utf-8?B?VlV5SXU2Ujl0YTdjSUVGQ0VxRk9wUk9YSWlSYzk0aTZhNDZ3TGVCMXlxWDcr?=
 =?utf-8?B?Ny9GY1F0WGtwUmFkdVVRRG8zc2pFYkxUYjdjT3VPVlpRMVJHOERhdFpGZzZD?=
 =?utf-8?B?bUw0cXlXK3BSTi9JVmhEaFhsYWE3TkhWOUtWRHFZenhqNS96Qkg2Rm5lQVBY?=
 =?utf-8?B?WUlhM0NCdkhTbDlUMk1rd0k2RTdyUjVDRlJRUGdIYjFQYmhNNk9xOVZIdlBh?=
 =?utf-8?B?Y2sxa0ZydUkzVUtHZzNUVWJhNDMzSmdpdUxoaXJnY2w2UHJkYkpNOXN0Q1pv?=
 =?utf-8?B?R000NnFlVGc1RXdtT3JVYWhGVmNSaDRFN3VTaExNT2Z0M2NoVVl5aUhuMHRm?=
 =?utf-8?B?Nkl6eFk2bEtkdUJkb1NaN3VPMGxMNi8vUHBIREVsNERLa3gzVXBpNWZNNG14?=
 =?utf-8?B?RmRFK0NXNlE4bGtxQ1lpaU8vQTUwYWlXOVlnby9hM3BPVHdVZEZBb0JxRXZU?=
 =?utf-8?B?MmQ4MGNSL01hUXd6SlpMRVUyY1B4UnNXUWxtTjArUWhBOXkzSmVyVFVtZTIz?=
 =?utf-8?B?QVAySnkrUnVzTm10L09jYUNvdlI0V3pwNmZIMHZuSlQ4UjJwRFJxQlpUTDBB?=
 =?utf-8?B?cFVzbzIrZnhvejhBVXVMY1h6QUgxbEdrb0VHa2FKTDBwZXhQSVlHcG9kMVRm?=
 =?utf-8?B?aCs2VHlnMlNFbU01MkZFdjZYSllmNDdad29yNURtVGc4MHZibGhMdHlqOC9p?=
 =?utf-8?B?bm55UUtTY0I3N2tHVG0vL1J2UXpENkdJT2t1VGtRTEZQbzdEQXIweXJYTml3?=
 =?utf-8?B?cWcrUm5odVNJQlozU0JzV2FqWmZDRWRDaUpDZDl3Q0J6ZUpWL0FyaCtyUmpL?=
 =?utf-8?B?YnJzNTFDUm16TW1GY0Npc3dOd25hQmdxaWx5elpvaTZITTF1MjJVVWZMK0dP?=
 =?utf-8?B?T3JianNzSHAvSjV1UkhHa2FYRmF2MzZBRmxJL1dDOHpETXdDVmJRWFJwVnht?=
 =?utf-8?B?dGVJL1N5OTkrZHhaeVl2N2FzMWdVcm44cnloeEVJcmYvZXpMY0hEcFVsbGJ5?=
 =?utf-8?B?OVhiOG9GKzl6bXZZdEZBME5YWi9nZFRsRmVxSUhvZTV6TGVwQ051cWNub01t?=
 =?utf-8?B?a1FTNlNObFFRSGVkT0srd0VlUDUzbFcwRy9lSnlsajNJMXhoSG5mSzgwTFF0?=
 =?utf-8?B?S1VpdzNWMTdlSndkS1V1eFdwK2srNmpiRzJRbTVybXQvdDYvTmE3bTV2eUVN?=
 =?utf-8?B?OFdHSG9qZzk0N3FjRFVXTjJTbmpxODVDdUZDSlRnMUZKK3duNThDbGNvTHlN?=
 =?utf-8?B?WnhwQk5BTkFEdUExaGE1Ky8yaGVPUzNLbUlJb0tqSXQ3TTNyS3hNN0RrKzB0?=
 =?utf-8?B?ZEw5WFE2ays3TmpMRXUwRkEzMHZML2Qvb1FTTVFnVUJKWDVPaHhmaEh5N1NJ?=
 =?utf-8?B?Snp2M0xPZlhsMVRZSXZEWnloQXVCZWlWSWhoOEtNOUhlTEVXTG12Z2FqY0hX?=
 =?utf-8?B?NU1rU09EL2Erd05GUTU2UHhqZlp3NGZGYThIZVlqUGcvek13K0xrS0czcW9L?=
 =?utf-8?B?cVVoUWJQY2dMek1QSkhRT2Vvd29RM0UxT0dwZ0pxbk1ldmUyQXE1L1lvVUNK?=
 =?utf-8?B?RHhEK2ppQzR4ek1uZUdQUERMSzVES3RENllneW1IWngxaGVNL2laTU9ZSksz?=
 =?utf-8?B?OUJFSnFtSWhUbXJMa2ltZUJFd3U3bWpuZjVJOENaNW1BRE9CMTZZdW5KWkFL?=
 =?utf-8?Q?CE8pXDAH/gneFBYwDTl1HZkBV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f871eeeb-ac57-4f2e-f3d3-08dd76be1df9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:55:07.7058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMdUAJmYzMcsSX+ze4j/fh5JoHwcrb11k3WKhoK27mpSm6NFER/Ecwvi0aUO6rZroEnhsS6hheG+Chp7iHSSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9679
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

Hi Gergo,

Thanks for the patch. I am sending this patch for testing and I will 
update test result next week.


On 4/2/25 11:03, Gergo Koteles wrote:
> Since b255ce4388e0, it is possible that the CRTC timing
> information for the preferred mode has not yet been
> calculated while amdgpu_dm_connector_mode_valid() is running.
> 
> In this case use the CRTC timing information of the actual mode.
> 
> Fixes: b255ce4388e0 ("drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()")
> Closes: https://lore.kernel.org/all/ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu/
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4085
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bae83a129b5f..0eb25cdcb52f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6500,12 +6500,12 @@ decide_crtc_timing_for_drm_display_mode(struct drm_display_mode *drm_mode,
>   					const struct drm_display_mode *native_mode,
>   					bool scale_enabled)
>   {
> -	if (scale_enabled) {
> -		copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
> -	} else if (native_mode->clock == drm_mode->clock &&
> -			native_mode->htotal == drm_mode->htotal &&
> -			native_mode->vtotal == drm_mode->vtotal) {
> -		copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
> +	if (scale_enabled || (
> +	    native_mode->clock == drm_mode->clock &&
> +	    native_mode->htotal == drm_mode->htotal &&
> +	    native_mode->vtotal == drm_mode->vtotal)) {
> +		if (native_mode->crtc_clock)
> +			copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
>   	} else {
>   		/* no scaling nor amdgpu inserted, no need to patch */
>   	}

