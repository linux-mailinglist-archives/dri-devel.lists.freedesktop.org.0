Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D16B770B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 12:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677710E41A;
	Mon, 13 Mar 2023 11:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2610E07E;
 Mon, 13 Mar 2023 11:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBWnIyWzkjFUeDhIYlOM+Td/KEp88yGG1I5kPwTEsV2tnf6hJJXbJfd3wNT4OAmin5ZjRtvjM5kuZrXPlx0KL6bEJ+Mci799YO35ALIeaRmBCFdOXlFg4ima+4uAURjfK7XdZoX7mNyingm+jC62C2w3eRJcFfOaRocqPHy4NE88RI21TFyRGnqhveFIOS0NnUtF3jQYvZRHZQUztnrfWVo5jep9vlausgRRqvr0owCFd2cgA9GqKgjUgQK/RwFy7Av/SmnhicrS+oYRaGKssy7Wwr1IQ0u6JSthWH/9y7vJEAYugmqiW7vL6qbxvbwWYyBiCF5tGZrLLlVYZmgsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzRv/33KCA14Lw+8fBBn/9yd5J8oTFavghjVZdMQU1M=;
 b=Dl0qRyRx4Z1nDtkFnQqzAVDSktuKm4PrY4lP22rwEX8EBzvFaWAsM+ZwtzU6eIdPMJRphLv9+XGN2Odc347M4HtZsKlw+QLs0isvbJyTtJPfiObYPaJbVeEKAgDUtW8HWPm0YyNodyYTneNORF417zGnWgf40ToMpTaW9iCDYeb0fW/9qH1syAEFzSs4vR2Cx3Ngb0FzbKGqEeA6G4+74Hsfy4jUAqre+viFl1Bgny4hE/iXmHQqcvlpPklQ+gCbis0qQ8b+O4CsucQ0LnDqvEJW5s0ewsnnEL8MIvmzWnJhkbJCxQkEJQG5z+BKmyogB92krzUCijYpABa1RFZl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzRv/33KCA14Lw+8fBBn/9yd5J8oTFavghjVZdMQU1M=;
 b=nBtdvRYJDrojVj1Z41BCR6pM58yzccJ6nhwwjl+T2yBplk5NLPddITOy2EDsS7mEC1V4+HGGBXCD/pQGku5XQ6hsVFxnHJLFqJoyYvsTMASzADjt3CySM17JyxD55ozocCxWvxVnJqdrINxmwbkCp3ixXmfbMIUqOS3Rz8HJm3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 11:59:13 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:59:13 +0000
Message-ID: <6f9453d7-d7c0-62ff-c7e9-42067a9fb207@amd.com>
Date: Mon, 13 Mar 2023 08:00:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Write to correct dirty_rect
To: Benjamin Cheng <ben@bcheng.me>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230313004739.3110719-1-ben@bcheng.me>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230313004739.3110719-1-ben@bcheng.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0224.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7242c861-9bc6-4adb-4577-08db23ba5cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKXO9WD3pJRx00pL+52+U1odlCkY+bF8mGaQuaLLGssi1HM5lCIM3xzlGtQOHlBTUSvhRLrsHx4g8hRq0mkBSMdDNl0bi9r1r2m8wVxg648g1IK6RjPyA4mIebfGxwUXU9rtuYv4MTHFWHKuKMB4P7GlsrPmr/nUFpIc17edQye3LSJqXPgy1VVXCrVRqKUj0hJJZHqvLs8kUNm4rtmYyND8Bu4o+cJFw+iuJVdooXlwMhvEFmzHVbvomhWI/pFBmLlp3nueXB+kfjlMw2Lp5aiM8H1+mnVbNIUqixynFaeSiSH5OGjOmmdPrOSNAZMLtYQnCNemo1uZxqCJsdLY/9RMCWYphqyVf4g4V4Zr5mLU38KAcPXlLPaw1ze8lC7zQc8Xe9XeQO4h8YQtVTLQ/WrI6aYZ1UWu9FRjDfYSL5wsY+ey4LFphj3Vca7Z1CIVUJe01HThIBPCmdn082FGolL9dxYKDrZkP6DwKWDYoqChVoU3uvKiPicynHTPyjd3/iJ2ze5FQwR6cMWxgnOKDiaIQlMU9xRUmjXCTNe1Vg8blHa/Cbys1r/ymt6yqQOH1492etYGQiVNSMZl2YAOv5Q6CBmKUfCbqnGf6ZZFWP/iCLAOz3oeS/KMqQeh33QYl18t1aZ0VKv8eUgKT7nYw6jCssgL27qY1BNMZKdIuZQmkdNu3lgktQ7SU4k6ceQDhRfyf/OxncKwrVcELPCyLwsG4I1DFVQXOQJp3qWV42w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(53546011)(66556008)(41300700001)(8676002)(66946007)(4326008)(66476007)(5660300002)(83380400001)(44832011)(26005)(186003)(6486002)(8936002)(966005)(6512007)(110136005)(6506007)(6666004)(2616005)(478600001)(316002)(921005)(36756003)(86362001)(31696002)(38100700002)(2906002)(31686004)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlB3QStCZ1BtMkxBOERFVEVTenFXT0VtUWxxZ3lDMU9kckNXa2FFT01JcU0y?=
 =?utf-8?B?enovT2Z6N2JsTkxpQ21zMWNQSkNWbkhtUTZiQ2QxKzhMNjJnczh2ZE4xVVV1?=
 =?utf-8?B?d3dKRHdUa2xzZStvQTZ3T0N2eVF0N2l3MHdSWmVDYWd6ZVQySkdoakljZ1lo?=
 =?utf-8?B?QlNFc3pSMjhCdzVzQlQyWWUvVG9rcFBYU3kwNFJzYnF6cnNzTFJIb2RjMUUv?=
 =?utf-8?B?SnoxZFZwMTA1N3NLcXNlaHFOendtQm90UWtlSW94TWNoY2RCTzRxRjRBbkZE?=
 =?utf-8?B?S2s5QUlNenFvTnp4TWMwT1RmS1R1WnZKZkYxY1BYbExkdld1Nk9DUWNWdDJi?=
 =?utf-8?B?bGVreWhZVmgrTEEzdm56YW1YQmpOdlZuRFpjSEVoRW94V3A2VSttaTkzQTJu?=
 =?utf-8?B?ampQL0szaitYVjNVMmgvSEhNVC9LalcwZEV0dzZPVGVGUi9GdTdUS1c2aFYr?=
 =?utf-8?B?SEVOTUJUY2hjVlJnNitXTlpFbG1xRDg2M1JORlBlZHgwalVINENuVllQY0pI?=
 =?utf-8?B?VHpzOG5kQzhqQUNBNTMvc3Q2NDhJZjRsTUszSTN0RWpQQ1pZY3VrbzdXQXBz?=
 =?utf-8?B?SGtNS0JOYjZRaklZSkFOQ0EyQmM2bU1id2hEeFJpLy92K1lYYmMzMFBWcEE4?=
 =?utf-8?B?ZjAvVVVyNlUzREZXNHJxcGhoUURlZzgwY29uYlhRWXVkTFIwQThENlpJK3Bx?=
 =?utf-8?B?bzdUVmhSSmc1U1ZZbm81dVJNMTdsZ0pTeDJkWTEzWTNvSnh5czV2M2Q1YnQr?=
 =?utf-8?B?Yk15NnZIaFJDdVpPNGliWEVxblZKSjY3TEpXaW1ZY1FUczVIa2JHdFJFOEJV?=
 =?utf-8?B?Ly9EU0tmRyt3Wk54K0FhSDJ2YmNhRXlTRndrV2wvN3VKNTJCWkJOZnI4czFk?=
 =?utf-8?B?T29pbm0waWVIK2xMQk81cm12TWtwK01pbElhR2lhN1VzNE9nL0hqcEdWbDNN?=
 =?utf-8?B?UkVmNFlhZzR6NFN2UnFNbU43M3ViTENKaHR6OTFvWmwrRGhrRWJWSnVFOFJ0?=
 =?utf-8?B?bVE2TTRJUHhYalcwQU5tbjZzVHZTcnJXcVJ6L2xwQzBjdjRzdG9ya3B2T3hj?=
 =?utf-8?B?KzV5Vy9BZ3laa2h2dkN0d2wzZGhKVnJvRzNhSWtxcUErY3BNVzd6Zy81bTBi?=
 =?utf-8?B?UmNPcVBHaFdWVDBVaXpMTDlLa2ZVUlZueHA0cmdkT2VNU2JFREZYaTQ3NW1i?=
 =?utf-8?B?dmIycWpmNVRlOXRzZUU4QkhEbW1lMmtwTkRzSDB3SHFlK0MvdWUrdlBBRDRO?=
 =?utf-8?B?b0dvTTZWRDRLMjYrNUdUT3Z3bmt2NWVIZEhNaHkxNThLVlFkMkZCemxqSHhZ?=
 =?utf-8?B?VHltOXNRWFBnb0dvMzV4Q0RPcEFxZzVmUndtejZXYkYxNWlENk51bGF1Kytz?=
 =?utf-8?B?RzYyeGMwbFBuYzF0bVl3UXZvZXZYM3RiVlJGa1JhZWVueUszWE1XN2kxS0t1?=
 =?utf-8?B?eEpjb09EZHg4N0VncnNTR2ZramdDTlFxMUFVd2JoTWNzNzRsVm9mNkxuSnNJ?=
 =?utf-8?B?azZJQXk4Q3NYSVlYY1E0SEwxUS9LNlRwMVIxSjNFdVBOVVVjZlBFZjRHaitt?=
 =?utf-8?B?QUNraUlOUm5yVWc0d1FRU1pYNGRwREl5Yzl2Z3VGVGhRRWdpMnJodEtoTXRo?=
 =?utf-8?B?c1d3SUExVTQxMVVuT2VFa09yNFg5Qm1tYWhXRU1TczUyVUd0Z1Mycml0UDAy?=
 =?utf-8?B?OEs1eWx6YWxPRm1wRjRRRGlHSkxjcmFNNmxFM3hFbUZ6b2NoMjlrNVVEbkxT?=
 =?utf-8?B?SVpScTB4WmEwcXA0Z2dVa3BmMXRJajkwdWY3cURqc2NqSEFNbkozWVpwTVFa?=
 =?utf-8?B?T0IwM2NHL3BiZHFNdnJ4YXQrdStMY1hDVjNLcjlmbnRCdEhCQ0MxKzRXZnNa?=
 =?utf-8?B?QjEwYzUvRWxKTFppRW9ma2laRU0ycE5DNjRESG5NdlFEZVEzT3pkcktNZ0Uv?=
 =?utf-8?B?K280eDUrSHZFSzZ2b0EvQlEzRWJraW1QMCtqWmZYYXlLejIwN2d3Tm1UbWFD?=
 =?utf-8?B?Ujd2VmIwTGp3NnZ6N0RNem5rUnM4cUE2SjV2VkVha1pvTURwSG9Qd1dPYlJP?=
 =?utf-8?B?Tk9uYkJCKzI2M3pHZHB2Yk1xc1RtcTdiOEIzWSsvcXAxbmtTU2xiWk8rV2x6?=
 =?utf-8?Q?JZLqrBG2emlHNQ4ko7BeA5mTY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7242c861-9bc6-4adb-4577-08db23ba5cc7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:59:13.2072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrna/HB16s7X/MMjQBJtTHpPaIKpUScbzjc0sSu/A79YDyKo4kVbSFPE/YgR7ng9SoKFmI3EIJHGxnSqbDn0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/12/23 20:47, Benjamin Cheng wrote:
> When FB_DAMAGE_CLIPS are provided in a non-MPO scenario, the loop does
> not use the counter i. This causes the fill_dc_dity_rect() to always
> fill dirty_rects[0], causing graphical artifacts when a damage clip
> aware DRM client sends more than 1 damage clip.
> 
> Instead, use the flip_addrs->dirty_rect_count which is incremented by
> fill_dc_dirty_rect() on a successful fill.
> 
> Fixes: 30ebe41582d1 ("drm/amd/display: add FB_DAMAGE_CLIPS support")
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2453
> Signed-off-by: Benjamin Cheng <ben@bcheng.me>

Applied, thanks for catching this!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8af58bba503f..a89ec2cc4ffc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5130,9 +5130,9 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   
>   		for (; flip_addrs->dirty_rect_count < num_clips; clips++)
>   			fill_dc_dirty_rect(new_plane_state->plane,
> -					   &dirty_rects[i], clips->x1,
> -					   clips->y1, clips->x2 - clips->x1,
> -					   clips->y2 - clips->y1,
> +					   &dirty_rects[flip_addrs->dirty_rect_count],
> +					   clips->x1, clips->y1,
> +					   clips->x2 - clips->x1, clips->y2 - clips->y1,
>   					   &flip_addrs->dirty_rect_count,
>   					   false);
>   		return;

-- 
Hamza

