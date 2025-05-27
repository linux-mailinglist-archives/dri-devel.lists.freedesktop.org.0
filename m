Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B66AC5898
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDC810E53F;
	Tue, 27 May 2025 17:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q6pcU8Fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0AE10E52B;
 Tue, 27 May 2025 17:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrBnHNflaZMCB7R3DIMoQVckI0z60RAdpYBB8733m9YrRjlV1OYzqL8pNjkhl7wGn1WPiDNTVV/12XUdalvB0ukulNKxcCibum8EG5U2xJ5deQLLH6h2JNIDeO7Jh2ddgqyB9+MazljzBjiZQKglvZ7RAcMCWFzj+71baIyBtTorex7z19IG1APjnwNoJoIj6tLofOud1pVj4MIU47bdeUamNCkzCIxL5ZDBANv2+spX0pvxKUZXTh4Zka6AAAEUR1MGn4ggJqaY11b73FfNYx9BSFljRcK6yzlMlV9vKW79B8cX2qpcyx9pHjnBau0GUcwrYjdEFUNlyaNpjg23AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq82DMX1kuIDwDWTBYnfY83hNnf5bd3Mfd7PBOt24J4=;
 b=MNxpRrWJOX/uzCB+2C2w5M0T+SLqgho6rfFjrVt9iYfHrKrcIuScocqphTc8lfvwAHONumY2UkTVvhsVYyDETe5bBIuHax0lVgx1Ab3Y1nsbBjLqJ3Cf7w7zJqq435qX0aprcOSNzofDK6aUVI9crtptSftjYTYjnnqAurkhj9WJhwxSWZGJKjGGpEhVkMZgYMdd0MJwBQev147NemVGqTV8nzGhC4xBnKhKlMiTker80I9FgiS7Rbs1Uu5QgulsIIIqtV7ACN33+lK8BiCqpD7Iz0G5uqHgZnRZY6oY34Zoy7rorccWJSc3b618J+FvTyNsChC8Pz9cLrxhzG3B2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq82DMX1kuIDwDWTBYnfY83hNnf5bd3Mfd7PBOt24J4=;
 b=Q6pcU8FoL1DinqIp9XgpHftihyG0JJVuUa7OQjJXvfYqmI/j+a4hTsH6f0WSr/Wht+qaC5Myl1wlS3o+gEIk9864okSELURhHUVgSsB841UF16iniFA+TAnfxxL7ZGviZSqCtOQNDnp71atH/iJOaLftFf1NJ1qJ0KBweoZDR9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 17:46:48 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%3]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 17:46:48 +0000
Message-ID: <c7c1d14a-783b-4b37-ba43-13c85a97e72d@amd.com>
Date: Tue, 27 May 2025 13:46:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: no 3D and blnd LUT as DPP color
 caps for DCN401"
To: Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
References: <20250527170605.1979462-1-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250527170605.1979462-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:610::48)
 To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 864c4d1d-f4c4-4b67-eb01-08dd9d46744f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEV2eGVBWmRPVW5Damo0UlJvNERrTnVjVmtMVEJueXF1SlZQbWhhcHd4MDdX?=
 =?utf-8?B?Q2o3MmIvQ3RSMmN1cFFsdVVYOTQwaXNTak1mOW8rR0JCckowZDlrV3NYcFVo?=
 =?utf-8?B?cjY3R1B2WXZaWENrYW1jTThTL0xoNW5XMjNEMDlWV25Yd3p5WDhjdjU1eDQx?=
 =?utf-8?B?WUdkcTE4Vm5QY0U2cGJQZytlQmYyRUl6NEg5K08vOGVaN3FEdktFM1F4S3Js?=
 =?utf-8?B?UEU3cGVDNFM2TVJsK2lrdnptODR2eUtkQmJnOXhXanlmYmJzdFowSmhmNlc4?=
 =?utf-8?B?d2tYZmtQSlJDdkF0SE0zM0VmbXZodThOQUZHcGtxSGdqazdzdXhvempQQzB6?=
 =?utf-8?B?R0drd21xUmVqTGRkY0t1cUl0VitKcWpocWFNY1E1NVArSkM1R05pSWFYVm5r?=
 =?utf-8?B?S0FyYkQrSlp5d0hoV0orTUxUd0gycGpDSks4UGNNYjlZQkRvMUxTengwK1VU?=
 =?utf-8?B?YTRkVFE3UmVSTXZWbTBUNmJFSE40ZHo0VVBrOURZbDcvckhLOTU2ak1jNko2?=
 =?utf-8?B?UUFpTjVOd09jQUJTc2hVT3c5SitoRlNIa0RFOU5hYVo3WlJwZmhYQU9YZVNX?=
 =?utf-8?B?d2dNVjVhL3BKaUxGYm1yUDloY0VVMFBaM3VzR3d2ZTc2SzdoeGVrT0JGUGxM?=
 =?utf-8?B?a1RLUCs5czluMFBTeERmZnY3S0lXTHdMRFcrTDVXVWVvUXRLSnAxNUVWYzd3?=
 =?utf-8?B?RjZxVmFPd25RYmJHVnpsZnpqYTJhWUtJdHF6MHIxdnR1bVUvZXVIbFhRcXdH?=
 =?utf-8?B?enc2d3ZuRlhOcUowL0xGTWdiY3ZIaVQxUTZiOTNaSTkzQ01SbExHZXAwRGVF?=
 =?utf-8?B?RzJ6bmVpNjJDVTRUazg3Ti9RcWdXR2RqeEJzaW1hQkk4ZkhkMndVcitNODA1?=
 =?utf-8?B?MTJQTXdSTjNNSHZxSVI5b1pmTGgwekRCMHovRTdReEF5YlhFTi80NkNXcTVC?=
 =?utf-8?B?VVU3dnptNU9XNGhucmVZOW5GZDJ1ZEJsdHlXQ1lnV1U1R3BhaHk2MUF6RmRC?=
 =?utf-8?B?TGFYZ2FjS01hTGlBTUFyVFNyVUxvNFBLV0c0dFdEb3RLNVFMUmRPVGJVVXh6?=
 =?utf-8?B?YnB0d2xGd0g5RWZqSmM5ZHJtNytrbVFKdGlXMVp1UlVFU0FXcklZRzUzUW9a?=
 =?utf-8?B?ZTRFdUFETFNKOVg2Y1dsemlWZ0JVa1htWGR6bTMzZTlab0xrN2ZadmtFaHg0?=
 =?utf-8?B?Z0sxTVNKclgwNkMvamVJNnhqSUxGNk5mTFhlV2JNM3llekN0dmtHNWtHbHc3?=
 =?utf-8?B?OGRJWEZhcWs1YnlhNWFibjNxVEtBaVNTQ0VWSHp6bjU0dGU3VnFseFg2K3ND?=
 =?utf-8?B?RHhQbnNoTmVBTjJuNDIrTDE5N1NCMGxSSWRSUCtaUEg0Mk9FenBJdUEreUha?=
 =?utf-8?B?K0dGcVRMOG4vV3hyL1E0VzNHb1RZV21IMDkvd3llOXlWVWZqWFJ6SGRERzJp?=
 =?utf-8?B?WHZRTW5GQjZUdkJsdm5sNFlRNS9XUzU5SHBhZmFja1M2WjRWS1ZKR1hsdndw?=
 =?utf-8?B?TkVXaHdVdDFiS0NrVGVIVXFoOUdXRmFLdmNsa0FmclhyNlFCYXlGMnB5alZU?=
 =?utf-8?B?dVZFYXNuR2tGb1grVTBORVh1eWlPd2diZUcxcjlhM2NOcTFvNDRadVNCbHg2?=
 =?utf-8?B?bll0N1NLSGJYSDFiZWhvcTY5ZmhJOFVHSGppOUhrM0RXSkJ1Q3M0TmpZdHp0?=
 =?utf-8?B?Z0pVNzZ5ZjU1TTRsSEdheHBHeW1IRjM5Y0o4L2FubE8wWmZObEVJT2pzSXFm?=
 =?utf-8?B?Q3pOUjNaRHJaYjcxc0N5MklkbzlXMTNGVHJNUjhaUVYvREdHaHBhRnNGczdU?=
 =?utf-8?B?T210ckU1aEQyWjFMc2RULy9qK25JRFd4elEvek9Gb2xiY29OdTdZQkl1aHF6?=
 =?utf-8?B?MFpNT2NaYXhyQ1RITS9xUlJWeE01bjJBTjNTYk1jMldvWkJlZFpLWmI1R3Z3?=
 =?utf-8?B?MTY4RW00K3BzbTVYOFZ4Wlh6VWF1bmVOMm9rd2dNckExdTJxZk0wZXhueE5n?=
 =?utf-8?B?dE5kYXdGMXpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEM1L2hXOXdUYXpmL0pTZ1VtV1JEeExoZFZOSnJuSmpNbnVUZDJnTGhWYm1m?=
 =?utf-8?B?aVpDYXZOQ25JRHFlUGNhc1hIV244d2Voc29XMm55NWRoQlBoSWRzWUJ2dTBi?=
 =?utf-8?B?VlVwQUlSelNuMWFHdktBYmgwcnVHeG5OU1JjNEtZSE5JRlQ1eDYrb3RlSk1l?=
 =?utf-8?B?NkRjVDA3aG5jUitWejFjdU1QQTdSdk9pNk5XVSs0WGV3V1VxcDVaWVRvQW03?=
 =?utf-8?B?TERpWk1yOHBCS1ZoVFk5Y2ZhSlJxeHRXT2puOThtTWsyOEp0WVJNVG9PU09F?=
 =?utf-8?B?Zjl2YnlkSXRja3VQUVZpTHNHL2RGSTUzOXF6NUFMY1NSdkoyaUxRQ3BmRXpB?=
 =?utf-8?B?ZUJ3SWFYUUd0TEZZc3VScnlOQXUwc1FabGE5SVNQMXk5UmtTTjlCTkl0OGNO?=
 =?utf-8?B?V054QkdvRVhqSTdCK3RRdTM2VVNnYlJKeVZBRTRwTXptZ3hQSXJmM1Q4SGc2?=
 =?utf-8?B?YWQxNm5sN2N1VFBwaDFjV095Q0ZPWkROY0tKMEtRZCtTWnZNMnlDVmUwRHc1?=
 =?utf-8?B?UU5hWlJ0RUVFNXp3RlBybFpCVjlqSWtYRm9UUnlqcjJwN3pzbEpoQkpHdGtK?=
 =?utf-8?B?VDF1bFJSU08zeHo4eVl2VmlSNjQxcklzOTJiVURvVGlKNmFwNEg0ekxlUkh2?=
 =?utf-8?B?MUlpNXNsRENZUWQ2bmp0VVNmaFhCZDQzdGx6KzFLT1g4N0Z3dVpKa1JIUXY0?=
 =?utf-8?B?OFk3RlNLZ2ZXLzUvTVFSRUVkNHM1WEtMbldJaWYwZ1FSMXBlbHR0WXo1TXJX?=
 =?utf-8?B?eVdpZyt2eEdhdDRSb3dYcjRlRWQrVWVwMUxBKy9kbXhQRmVlbEV6WjByZ3lQ?=
 =?utf-8?B?aExFVDE1dXl1ejJ6UjJoVnlEWlpaZjJZb040TlY0bXNVaHZGQy93TDJYeWxK?=
 =?utf-8?B?UWdKRVJXZ29MWTRKNnU3aEZmMFRyVU1rUzVDU25QVlRqN1JJV1FDTkxJT3Fa?=
 =?utf-8?B?TXg5YWJsL01Pam94eTdOTDNpSTMrT2V3YXVVdWxFam9zVHFMUU13R1plSThM?=
 =?utf-8?B?ekZ4NDlreTU0UXFPcmFqRDlmaHMrOWNrM042RE01MGsvb3RGQWt4aVNyZGRk?=
 =?utf-8?B?a1lMQjMrLzdqb2ZBMys0ZzhpYm5wTThGUk0wUEp1amlIT3l0YzVoS1BGZmxm?=
 =?utf-8?B?MlkwS0RSTkw5d3NQTFRmZVdtQmNGYUFxWlpnQXNJZTQrWU5OVThtUElOd21R?=
 =?utf-8?B?TXRYdm9GVkViS28xNjhiMEE0Vlp1Q0xRSVRKWDJzQ0YyczZQQ2ZxRkRkU0tr?=
 =?utf-8?B?eURQbzl6ZFUwQ3RpQUZ6L0ZJNFduUU1BNU92YVp2czdDcWR2Z0NvMWFCV3NF?=
 =?utf-8?B?TUlkU21wd1ArSHk4TlBCQVc3S2RwY1BjQlA0ZzArcDNNaWw0U013Q1Q3R0d0?=
 =?utf-8?B?N3hodndVb1JDbWpscFgvU3VaKzdhMTN1Ulp2aWJhd3dwdmExN0dXZXpsZVVH?=
 =?utf-8?B?Um5lOGxBZE9YczVadHBMVkt4cEt0bHVDZ0VyYkQ4QWxlb0xHZHVYV3Uyc2hS?=
 =?utf-8?B?bmNZSTVNYVVlRDVsek52eXlCUWcvVHhSUjgxUFlCb3poZkdwVVI2QXRONnRx?=
 =?utf-8?B?aG5EOU85dFZORWhDRGlSZ3BWWnRlVllUbzZJVXljaG5mLzhCNkZSTytWYVZ3?=
 =?utf-8?B?Q2QyeGxNa3prckF4eTEvQ0o5NlZoU0NBWHBCUklyRnEyNlBvYzJIWFZnYVM0?=
 =?utf-8?B?V01IQUJ0M1FVdFViVkFINDdmV1A5Y2xZWjBVc1Q0YlJteXlvd0lPU1hVdjkz?=
 =?utf-8?B?NGJVbkRRK2NMWVQyQ3Rxa1BaMGNBNlRxaFNNWUtLNXZPZjhVTEczaTRRRUF4?=
 =?utf-8?B?ZG41Z0p2cmhqSmh1VzVZUDFzNVdsWlRnOGFlSm53UmlKRTUrRmR1WDRrSW4v?=
 =?utf-8?B?YUI3dzBZK1pFM0xndmhrUEN2b0x3RmYrbGQ1bHJ0elR5SzhLeW0zNXRKK1Bq?=
 =?utf-8?B?YjgwWFBzRlk3c1R0SC95aTNISUtiWDdHODEyTVE2eUl5cEN5Vkx0cG9MYjdB?=
 =?utf-8?B?ek1CT2RFOXFMb2swOTV4NGZLY0pvb0k0TVphanJvdWZXUHZYQm5veWFQQkF1?=
 =?utf-8?B?bGlSOEdKS2QxSTlXZi8yWEpMTzhjNkYxMHFWcXlvZFdOQk5kZVdzVTdnRkVN?=
 =?utf-8?Q?hESGAq6maFEt7bxhkbwkcE6sd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c4d1d-f4c4-4b67-eb01-08dd9d46744f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:46:48.3085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyptoSJtlJiDhG4FBFsLicipVpPtqgSYm7SXf2G1TfC7Lo9mVMiYaIA+NA4j6Ke8GIa1I/hLAX/njbKkAJ6yew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
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



On 2025-05-27 13:06, Alex Hung wrote:
> This reverts commit 46e68dd5066c9831e9695c1756db017bb9c3762c since it
> breaks color enhancement in another OS, indicating these two fields are
> still used by color management in dcn401.
> 
> Fixes: 46e68dd5066c ("drm/amd/display: no 3D and blnd LUT as DPP color caps for DCN401")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index f420c4dafa03..e0e32975ca34 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -1938,8 +1938,8 @@ static bool dcn401_resource_construct(
>   	dc->caps.color.dpp.gamma_corr = 1;
>   	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
>   
> -	dc->caps.color.dpp.hw_3d_lut = 0;
> -	dc->caps.color.dpp.ogam_ram = 0;
> +	dc->caps.color.dpp.hw_3d_lut = 1;
> +	dc->caps.color.dpp.ogam_ram = 1;
>   	// no OGAM ROM on DCN2 and later ASICs
>   	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
>   	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

-- 
Thanks & Regards,
Aurabindo Pillai

