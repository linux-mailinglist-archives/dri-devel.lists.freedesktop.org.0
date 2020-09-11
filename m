Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C42665B8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 19:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A04D6EABF;
	Fri, 11 Sep 2020 17:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA7A6EABF;
 Fri, 11 Sep 2020 17:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2qh/yt5srIKR+PMn5ncQjL27LqrN2NX3WDafu+oHSFr0TarYWK4BESixZw0IwNqsHlmygtCR7Ri2xzD/KpzpQ62mwnibD4LnTwXBx+vDbgx+4wPwwLWosKDIE2+/f+2tvMFuwkh/Lrh7APRMERkiqkirOp8nyTdpPP+kCDCvEnZcQDUi355tgiBNj8FlEbsqeXmvGO/dDKdISL5CVIsmlnadPFqFPolrY+YZvbJ1bHfkjEihdu01ipx00Zy/P9yXcSdbsk9h8QPPNsO4KDFRhPqtZS5lsJjeEy/Q5M//ko7veFSwCOn+aPmApVcSmT5PNeApYSSpM7dKbuVfc2WLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDJalZLXXIjfT1J8vrFoNB9LtWnsU8NXkkFgNDTz3WU=;
 b=mdGStDO80uzhLbDvNkGXdjOxOc0oBtCDYjLYET+WPQN8TLM0u4L0wuWjSgwBpXEt0uD4KUlfCQl6kLDO6xLqHuypohbzWQ9LMymtw9ldXmg7ivLTXInN+yUVcUTIYGs1zZMi9fwY9mq2K4YTesmwAy1ZiZThyUj1C6fZkj6QMc79H1cWgM9hs7TYkGtww2NgVvn+FTdyE+Fs42Y6FbOIWf0MYUz8irKPz/4hxgNq38VriWyYxB8xUDSHWDYqs4W6W2cbcdiL2VnKx8fxmTBYRI9awPJFLhifZA/RyrPy9251FZkFGOlUPdROg9xdkqGsA3RyPFgNLfkFwKGnCVvLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDJalZLXXIjfT1J8vrFoNB9LtWnsU8NXkkFgNDTz3WU=;
 b=KU0grdhMbfQ7fdgRg/8X1glnyoSM3ZaqO9Qo6xffKh43siSMtxEBjh/THoCX6VW5Ke1+8r/ON4EQVrKa403aUU2Q9zyv5O5m9qexjYAic/vUbBAmemsvIyZLBXkqaJlbOGnU1OSV+ABv/j3Hkz3VjRJM2jO8bTVdp9sku3ojArs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB3794.namprd12.prod.outlook.com (2603:10b6:a03:1aa::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 17:11:52 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101%6]) with mapi id 15.20.3326.030; Fri, 11 Sep 2020
 17:11:52 +0000
Subject: Re: [PATCH v2 3/4] drm/amd/display: Add pipe_state tracepoint
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200911145927.401322-4-Rodrigo.Siqueira@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e70b5c24-ece8-c989-7058-890e51bc6ae1@amd.com>
Date: Fri, 11 Sep 2020 13:11:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200911145927.401322-4-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 17:11:50 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47150522-7bd3-49bb-1685-08d85675c6cf
X-MS-TrafficTypeDiagnostic: BY5PR12MB3794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB37942D1E612A2F059FF86636EC240@BY5PR12MB3794.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkrsD7nLG4WZYwyXJ9oJeDgyVpMHYYooFOz9MP3+qOtxCcEydOTi3P6H/ZzhN/FdaFaiYjGVCv46y+r0PRsaA+wASvsxDEuh0nDovXBsMYebthDjevjveIffVGrGKjp7TzFKz87TAE5ca/nMiVTyP2JycuO3i1FfMkqgIqTOjDJ/RA6oxCclksMJd1/UA/K2BqDlaZHuyNIhwyiK437q8YwGn9lIZj9Uz9KiEm7ztn6wHVOekKwT3qIh3hARiWotOaSBxW/VDteJsQk3GrgB35QMZmETJYFFQlLtmMuRRneCteM/U+n5/rYROGwMGBoaTs2BHxPOP/6aQpAY0d9efyc1mxGvhDjvGWmY7azpCdfIvo1U+aIPxZ4S2AHL3uGQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(8676002)(16576012)(31696002)(316002)(66946007)(5660300002)(66556008)(86362001)(478600001)(8936002)(52116002)(31686004)(2906002)(66476007)(6486002)(54906003)(83380400001)(4326008)(956004)(53546011)(26005)(2616005)(186003)(16526019)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JMZTk812BxGVa9ocEwrRsrMSC9b962k72qbini4D7ZehqB066Gx81gm0UEW8MWvR045vSFI6KpinczPo0u+y7+zNUWtCC9zbFTgFH+JhTx5xkX/ObUkomoytzvwt4kA8zk9P9KMgBKvN+pFIPM7gW72ZHhABqTVMaSO6/nz4vOPHLM5IGjDMBaPAKBk/LUjiZR1yH8CsIb67LXdS6eMBg90Tv8uexkQDf1yXGmBlKzIhXhTap7r8H/PB++D7rwJZT1CamvmJpuFBS1rH1xjLcqzFSXXuKi7vcSjZ27FQup1EFjxhTGNlKosNm9tQ0WCcMw6KldIu77qPoYPTcPVWiWOFBuxhTvtUhJh7uIkksyWFVyVIDRapBLQRlzg6S2JC5nBkOW2juBjVWWAsoKjfwXyYvb4nY6PwZ7bO/3JH52MPYtdVgW2OSvVkdb1GaBQ9gKmADpyj0KPmXJ3xhAh1qIxeDHBTe5BSr7agEFXzSSmOvSEZ7KeBu7EeykHDrXMW09dEGmvBOW3/YknXZVyibva3PRPCVvgw73vIlfmKSe2yVddjzKfuhc4t1XYpHxh7p6ipULsx1J9w19G7Fn7Vk0Lcynabp5O6mozAvVRyF8xQ8NfPShn/5vsKdlIgwmHoTB86qFPuwp0IXgQ7FvvY4A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47150522-7bd3-49bb-1685-08d85675c6cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 17:11:52.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okhVqWDIOwNNMnJWrEXnBgAbZrsj2bxbj5RK0FcNCE26rJfRh+BJxXF3xrqWKhP9MyH9vlC3mXULVv1bqqKCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3794
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 hersenxs.wu@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 10:59 a.m., Rodrigo Siqueira wrote:
> This commit introduces a trace mechanism for struct pipe_ctx by adding a
> middle layer struct in the amdgpu_dm_trace.h for capturing the most
> important data from struct pipe_ctx and showing its data via tracepoint.
> This tracepoint was added to dc.c and dcn10_hw_sequencer, however, it
> can be added to other DCN architecture.
> 
> Co-developed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>


This patch, while very useful, unfortunately pulls in a lot of DM code 
into DC so I would prefer to hold off on this one for now.

It would be better if this had a proper DC interface for tracing/logging 
these states. If the API was more like how we handle tracing register 
reads/writes this would be cleaner.

Regards,
Nicholas Kazlauskas

> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 172 ++++++++++++++++++
>   drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 ++
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
>   3 files changed, 195 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 5fb4c4a5c349..53f62506e17c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -376,6 +376,178 @@ TRACE_EVENT(amdgpu_dm_atomic_check_finish,
>   		      __entry->async_update, __entry->allow_modeset)
>   );
>   
> +#ifndef _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
> +#define _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
> +
> +struct amdgpu_dm_trace_pipe_state {
> +	int pipe_idx;
> +	const void *stream;
> +	int stream_w;
> +	int stream_h;
> +	int dst_x;
> +	int dst_y;
> +	int dst_w;
> +	int dst_h;
> +	int src_x;
> +	int src_y;
> +	int src_w;
> +	int src_h;
> +	int clip_x;
> +	int clip_y;
> +	int clip_w;
> +	int clip_h;
> +	int recout_x;
> +	int recout_y;
> +	int recout_w;
> +	int recout_h;
> +	int viewport_x;
> +	int viewport_y;
> +	int viewport_w;
> +	int viewport_h;
> +	int flip_immediate;
> +	int surface_pitch;
> +	int format;
> +	int swizzle;
> +	unsigned int update_flags;
> +};
> +
> +#define fill_out_trace_pipe_state(trace_pipe_state, pipe_ctx) \
> +	do { \
> +		trace_pipe_state.pipe_idx	= (pipe_ctx)->pipe_idx; \
> +		trace_pipe_state.stream		= (pipe_ctx)->stream; \
> +		trace_pipe_state.stream_w	= (pipe_ctx)->stream->timing.h_addressable; \
> +		trace_pipe_state.stream_h	= (pipe_ctx)->stream->timing.v_addressable; \
> +		trace_pipe_state.dst_x		= (pipe_ctx)->plane_state->dst_rect.x; \
> +		trace_pipe_state.dst_y		= (pipe_ctx)->plane_state->dst_rect.y; \
> +		trace_pipe_state.dst_w		= (pipe_ctx)->plane_state->dst_rect.width; \
> +		trace_pipe_state.dst_h		= (pipe_ctx)->plane_state->dst_rect.height; \
> +		trace_pipe_state.src_x		= (pipe_ctx)->plane_state->src_rect.x; \
> +		trace_pipe_state.src_y		= (pipe_ctx)->plane_state->src_rect.y; \
> +		trace_pipe_state.src_w		= (pipe_ctx)->plane_state->src_rect.width; \
> +		trace_pipe_state.src_h		= (pipe_ctx)->plane_state->src_rect.height; \
> +		trace_pipe_state.clip_x		= (pipe_ctx)->plane_state->clip_rect.x; \
> +		trace_pipe_state.clip_y		= (pipe_ctx)->plane_state->clip_rect.y; \
> +		trace_pipe_state.clip_w		= (pipe_ctx)->plane_state->clip_rect.width; \
> +		trace_pipe_state.clip_h		= (pipe_ctx)->plane_state->clip_rect.height; \
> +		trace_pipe_state.recout_x	= (pipe_ctx)->plane_res.scl_data.recout.x; \
> +		trace_pipe_state.recout_y	= (pipe_ctx)->plane_res.scl_data.recout.y; \
> +		trace_pipe_state.recout_w	= (pipe_ctx)->plane_res.scl_data.recout.width; \
> +		trace_pipe_state.recout_h	= (pipe_ctx)->plane_res.scl_data.recout.height; \
> +		trace_pipe_state.viewport_x	= (pipe_ctx)->plane_res.scl_data.viewport.x; \
> +		trace_pipe_state.viewport_y	= (pipe_ctx)->plane_res.scl_data.viewport.y; \
> +		trace_pipe_state.viewport_w	= (pipe_ctx)->plane_res.scl_data.viewport.width; \
> +		trace_pipe_state.viewport_h	= (pipe_ctx)->plane_res.scl_data.viewport.height; \
> +		trace_pipe_state.flip_immediate = (pipe_ctx)->plane_state->flip_immediate; \
> +		trace_pipe_state.surface_pitch	= (pipe_ctx)->plane_state->plane_size.surface_pitch; \
> +		trace_pipe_state.format		= (pipe_ctx)->plane_state->format; \
> +		trace_pipe_state.swizzle	= (pipe_ctx)->plane_state->tiling_info.gfx9.swizzle; \
> +		trace_pipe_state.update_flags	= (pipe_ctx)->update_flags.raw; \
> +	} while (0)
> +
> +#endif /* _AMDGPU_DM_TRACE_STRUCTS_DEFINED_ */
> +
> +TRACE_EVENT(amdgpu_dm_dc_pipe_state,
> +	    TP_PROTO(const struct amdgpu_dm_trace_pipe_state *pipe_state),
> +	    TP_ARGS(pipe_state),
> +	    TP_STRUCT__entry(
> +			     __field(int, pipe_idx)
> +			     __field(const void *, stream)
> +			     __field(int, stream_w)
> +			     __field(int, stream_h)
> +			     __field(int, dst_x)
> +			     __field(int, dst_y)
> +			     __field(int, dst_w)
> +			     __field(int, dst_h)
> +			     __field(int, src_x)
> +			     __field(int, src_y)
> +			     __field(int, src_w)
> +			     __field(int, src_h)
> +			     __field(int, clip_x)
> +			     __field(int, clip_y)
> +			     __field(int, clip_w)
> +			     __field(int, clip_h)
> +			     __field(int, recout_x)
> +			     __field(int, recout_y)
> +			     __field(int, recout_w)
> +			     __field(int, recout_h)
> +			     __field(int, viewport_x)
> +			     __field(int, viewport_y)
> +			     __field(int, viewport_w)
> +			     __field(int, viewport_h)
> +			     __field(int, flip_immediate)
> +			     __field(int, surface_pitch)
> +			     __field(int, format)
> +			     __field(int, swizzle)
> +			     __field(unsigned int, update_flags)
> +	),
> +
> +	TP_fast_assign(
> +		       __entry->pipe_idx = pipe_state->pipe_idx;
> +		       __entry->stream = pipe_state->stream;
> +		       __entry->stream_w = pipe_state->stream_w;
> +		       __entry->stream_h = pipe_state->stream_h;
> +		       __entry->dst_x = pipe_state->dst_x;
> +		       __entry->dst_y = pipe_state->dst_y;
> +		       __entry->dst_w = pipe_state->dst_w;
> +		       __entry->dst_h = pipe_state->dst_h;
> +		       __entry->src_x = pipe_state->src_x;
> +		       __entry->src_y = pipe_state->src_y;
> +		       __entry->src_w = pipe_state->src_w;
> +		       __entry->src_h = pipe_state->src_h;
> +		       __entry->clip_x = pipe_state->clip_x;
> +		       __entry->clip_y = pipe_state->clip_y;
> +		       __entry->clip_w = pipe_state->clip_w;
> +		       __entry->clip_h = pipe_state->clip_h;
> +		       __entry->recout_x = pipe_state->recout_x;
> +		       __entry->recout_y = pipe_state->recout_y;
> +		       __entry->recout_w = pipe_state->recout_w;
> +		       __entry->recout_h = pipe_state->recout_h;
> +		       __entry->viewport_x = pipe_state->viewport_x;
> +		       __entry->viewport_y = pipe_state->viewport_y;
> +		       __entry->viewport_w = pipe_state->viewport_w;
> +		       __entry->viewport_h = pipe_state->viewport_h;
> +		       __entry->flip_immediate = pipe_state->flip_immediate;
> +		       __entry->surface_pitch = pipe_state->surface_pitch;
> +		       __entry->format = pipe_state->format;
> +		       __entry->swizzle = pipe_state->swizzle;
> +		       __entry->update_flags = pipe_state->update_flags;
> +	),
> +	TP_printk("pipe_idx=%d stream=%p rct(%d,%d) dst=(%d,%d,%d,%d) "
> +		  "src=(%d,%d,%d,%d) clip=(%d,%d,%d,%d) recout=(%d,%d,%d,%d) "
> +		  "viewport=(%d,%d,%d,%d) flip_immediate=%d pitch=%d "
> +		  "format=%d swizzle=%d update_flags=%x",
> +		  __entry->pipe_idx,
> +		  __entry->stream,
> +		  __entry->stream_w,
> +		  __entry->stream_h,
> +		  __entry->dst_x,
> +		  __entry->dst_y,
> +		  __entry->dst_w,
> +		  __entry->dst_h,
> +		  __entry->src_x,
> +		  __entry->src_y,
> +		  __entry->src_w,
> +		  __entry->src_h,
> +		  __entry->clip_x,
> +		  __entry->clip_y,
> +		  __entry->clip_w,
> +		  __entry->clip_h,
> +		  __entry->recout_x,
> +		  __entry->recout_y,
> +		  __entry->recout_w,
> +		  __entry->recout_h,
> +		  __entry->viewport_x,
> +		  __entry->viewport_y,
> +		  __entry->viewport_w,
> +		  __entry->viewport_h,
> +		  __entry->flip_immediate,
> +		  __entry->surface_pitch,
> +		  __entry->format,
> +		  __entry->swizzle,
> +		  __entry->update_flags
> +	)
> +);
> +
>   #endif /* _AMDGPU_DM_TRACE_H_ */
>   
>   #undef TRACE_INCLUDE_PATH
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index dc463d99ef50..0c9f177e5827 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2644,6 +2644,17 @@ void dc_commit_updates_for_stream(struct dc *dc,
>   		}
>   	}
>   
> +	for (i = 0; i < MAX_PIPES; ++i) {
> +		struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[i];
> +
> +		if (pipe_ctx->plane_state) {
> +			struct amdgpu_dm_trace_pipe_state pipe_state_trace;
> +
> +			fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
> +			trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
> +		}
> +	}
> +
>   	commit_planes_for_stream(
>   				dc,
>   				srf_updates,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 8ca94f506195..464d0ad093b9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -1020,15 +1020,22 @@ static bool dcn10_hw_wa_force_recovery(struct dc *dc)
>   
>   }
>   
> -
>   void dcn10_verify_allow_pstate_change_high(struct dc *dc)
>   {
> -	static bool should_log_hw_state; /* prevent hw state log by default */
> -
>   	if (!hubbub1_verify_allow_pstate_change_high(dc->res_pool->hubbub)) {
> -		if (should_log_hw_state) {
> -			dcn10_log_hw_state(dc, NULL);
> +		int i;
> +
> +		for (i = 0; i < MAX_PIPES; ++i) {
> +			struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[i];
> +
> +			if (pipe_ctx->plane_state) {
> +				struct amdgpu_dm_trace_pipe_state pipe_state_trace;
> +
> +				fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
> +				trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
> +			}
>   		}
> +
>   		BREAK_TO_DEBUGGER();
>   		if (dcn10_hw_wa_force_recovery(dc)) {
>   		/*check again*/
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
