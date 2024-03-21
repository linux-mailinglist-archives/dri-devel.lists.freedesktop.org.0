Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333488862BE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 22:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD93710EF57;
	Thu, 21 Mar 2024 21:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PlqQ1VCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826D210EF57
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 21:53:20 +0000 (UTC)
Message-ID: <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711057998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9xIbt5IRGyj4Yh6zUnaudYx8WQHO3ZjhO4k+FGux7M=;
 b=PlqQ1VCdMmQb7CMTnF3ueOxvUYjQ2qNPWK23J+ZUf5kHQCWRjNcVhSKum6isUXV0J+FTi5
 n/eN/oYuBh7sHBT/nWyYjuxY7t7NP5XlalCvGwwHoPYgw3boDPE9z69TpfaZgmdYBUcs5x
 JkugC/OTPO2xUvTJTEevnUtGTAxfKcc=
Date: Fri, 22 Mar 2024 05:53:07 +0800
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/21 23:29, Maxime Ripard wrote:
> Infoframes in KMS is usually handled by a bunch of low-level helpers
> that require quite some boilerplate for drivers. This leads to
> discrepancies with how drivers generate them, and which are actually
> sent.
>
> Now that we have everything needed to generate them in the HDMI
> connector state, we can generate them in our common logic so that
> drivers can simply reuse what we precomputed.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/Kconfig                            |   1 +
>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>   drivers/gpu/drm/drm_connector.c                    |  14 +
>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>   include/drm/drm_atomic_state_helper.h              |   8 +
>   include/drm/drm_connector.h                        | 109 +++++++
>   7 files changed, 483 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 16029435b750..3d3193c7aa5f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>   	  If in doubt, say "N".
>   
>   config DRM_KMS_HELPER
>   	tristate
>   	depends on DRM
> +	select DRM_DISPLAY_HDMI_HELPER

Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
emerged with default config.


: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
drm_atomic_state_helper.c:(.text+0x15e4): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
: drm_atomic_state_helper.c:(.text+0x15f0): undefined reference to `drm_hdmi_avi_infoframe_bars'
: drm_atomic_state_helper.c:(.text+0x1638): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
make[2]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1

make[1]: *** [/home/suijingfeng/UpStream/drm-tip/Makefile:1162: vmlinux] Error 2

make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:240: __sub-make] Error 2

>   	help
>   	  CRTC helpers for KMS drivers.
>   
>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>           bool "Enable refcount backtrace history in the DP MST helpers"

-- 
Best regards,
Sui

