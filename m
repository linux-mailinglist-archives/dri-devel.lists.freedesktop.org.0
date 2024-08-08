Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA4C94BACE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A996410E6B9;
	Thu,  8 Aug 2024 10:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B04610E6B9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:23:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B243E1042;
 Thu,  8 Aug 2024 03:24:24 -0700 (PDT)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2323F766;
 Thu,  8 Aug 2024 03:23:56 -0700 (PDT)
Message-ID: <455c684c-7ec2-4588-b028-f59c144c9348@arm.com>
Date: Thu, 8 Aug 2024 11:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panfrost: Add cycle counter job requirement
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240807160900.149154-1-mary.guillemard@collabora.com>
 <20240807160900.149154-3-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240807160900.149154-3-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/08/2024 17:08, Mary Guillemard wrote:
> Extend the uAPI with a new job requirement flag for cycle
> counters. This requirement is used by userland to indicate that a job
> requires cycle counters or system timestamp to be propagated. (for use
> with write value timestamp jobs)
> 
> We cannot enable cycle counters unconditionally as this would result in
> an increase of GPU power consumption. As a result, they should be left
> off unless required by the application.
> 
> This new uAPI will be used in Mesa to implement timestamp queries and
> VK_KHR_shader_clock.
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>

Makes sense, but I'm not sure why this needs to be it's own patch - I'd
squash this with the next one where it actually gets used.

Steve

> ---
>  include/uapi/drm/panfrost_drm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 52b050e2b660..568724be6628 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -40,6 +40,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
>  
>  #define PANFROST_JD_REQ_FS (1 << 0)
> +#define PANFROST_JD_REQ_CYCLE_COUNT (1 << 1)
>  /**
>   * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
>   * engine.

