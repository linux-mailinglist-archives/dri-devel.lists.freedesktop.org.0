Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515E5E5FF7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE2F10EAB4;
	Thu, 22 Sep 2022 10:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01610EAAA;
 Thu, 22 Sep 2022 10:32:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4MYBRh1LdCz9sQw;
 Thu, 22 Sep 2022 12:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1663842736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcSMI9o79BEi4BYCfBNfXpEPRAzEwth0h8PN/3Lb7hI=;
 b=sF2Iw8irqYZ2giNv4jI/4zOj2NNyXc/XzeLxn3FgZUAbcWqYukOlcammalA0BUgPIPolrE
 Rw78XacPNgbBb8wl1rZ9E7xMwS9g3GNYVjQ8s08CpOrL/08nz+RTTEBVdcW5cIvvAEFsQo
 dT2qURjeRkQVGYFxIDDbJPU9dWfYDC5nUcjs2EihxPlN4MogHNuEjo8kRQ3xkHRTlsEeK/
 DE4EVV8UM2D0uFVqppeRENRSxUfIla5KB8+RRW6koBfZifIzBEips6GWimF4MAvKcowY6g
 dQ1IOHWyhzXNEN6oEoSEPlMuiM3uP0LC4RJVlrL6DaLyRsChBpfp/XhQuiS87Q==
Message-ID: <d91aaff1-470f-cfdf-41cf-031eea9d6aca@mailbox.org>
Date: Thu, 22 Sep 2022 12:32:13 +0200
MIME-Version: 1.0
Subject: Re: [PATCH AUTOSEL 5.4 3/5] drm/amdgpu: use dirty framebuffer helper
Content-Language: en-CA
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220921155436.235371-1-sashal@kernel.org>
 <20220921155436.235371-3-sashal@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220921155436.235371-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 739b6371571c7f7200f
X-MBO-RS-META: wc3htxwqz1fpkxzby6gtuenpjfyxefbx
X-Rspamd-Queue-Id: 4MYBRh1LdCz9sQw
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
Cc: guchun.chen@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com, greenfoo@u92.eu,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-21 17:54, Sasha Levin wrote:
> From: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> [ Upstream commit 66f99628eb24409cb8feb5061f78283c8b65f820 ]
> 
> Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
> drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
> struct.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b588e0e409e7..d8687868407d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -35,6 +35,7 @@
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -495,6 +496,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>  static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>  	.destroy = drm_gem_fb_destroy,
>  	.create_handle = drm_gem_fb_create_handle,
> +	.dirty = drm_atomic_helper_dirtyfb,
>  };
>  
>  uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,

This patch has issues, see https://patchwork.freedesktop.org/patch/503749/ .


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

