Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712A398898
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7E6E950;
	Wed,  2 Jun 2021 11:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4522E6E950
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:50:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 930276D;
 Wed,  2 Jun 2021 04:50:24 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A48AD3F719;
 Wed,  2 Jun 2021 04:50:23 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/panfrost: Add cycle counter job requirement
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
 <20210527203804.12914-2-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <04e194a4-529a-720d-d414-c9df7e5686a0@arm.com>
Date: Wed, 2 Jun 2021 12:50:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527203804.12914-2-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2021 21:38, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Extend the Panfrost UABI with a new job requirement for cycle counters
> (and GPU timestamps, by extension). This requirement is used in
> userspace to implement ARB_shader_clock, an OpenGL extension reporting
> the GPU cycle count within a shader. The same mechanism will be required
> to implement timestamp queries as a "write value - timestamp" job.
> 
> We cannot enable cycle counters unconditionally, as enabling them
> increases GPU power consumption. They should be left off unless actually
> required by the application for profiling purposes.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  include/uapi/drm/panfrost_drm.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index ec19db1ee..27e6cb941 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -39,7 +39,8 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_PERFCNT_ENABLE	DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_ENABLE, struct drm_panfrost_perfcnt_enable)
>  #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
>  
> -#define PANFROST_JD_REQ_FS (1 << 0)
> +#define PANFROST_JD_REQ_FS			(1 << 0)
> +#define PANFROST_JD_REQ_PERMON			(1 << 1)

As noted PERMON is a bit jargony but matches kbase. Another option to
aid with the bike shedding could be _REQ_CYCLE_COUNT as this is
requesting cycle counters (and timestamp propagation). But I don't mind
the colour of the shed as long as it doesn't leak... ;)

Thanks,

Steve

>  /**
>   * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
>   * engine.
> 

