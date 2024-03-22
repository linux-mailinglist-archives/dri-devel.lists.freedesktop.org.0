Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED3886E94
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4CA1124F2;
	Fri, 22 Mar 2024 14:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="vb2tIA0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636F1124F7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:40 +0000 (UTC)
Message-ID: <fe4ea866-5485-4041-9a06-5441c429b150@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711117835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IllocFnwNiXVGU+HouNFbx0kAsYD151iYbY5EqUrK60=;
 b=vb2tIA0mE3RjQRmFtwRGeRNWtPVle8xwPuGz3k0mXmPbxA9+rb6RH0etsFkHhWQAK0DPpa
 g5mehHDk0VOcMpylaYKuk/GPkLTeV+eLrTyDxbPhCe5wLBDOUZZwHJnSVNO/KTYtRNTvk5
 0YVP778XwUltNtoGBLyTwJ0FFHUEiCo=
Date: Fri, 22 Mar 2024 22:30:20 +0800
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
 <7835e928-7d09-446e-91dd-13a0fa549bc2@linux.dev>
 <20240322-steadfast-tanuki-from-mars-b5ea5f@houat>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240322-steadfast-tanuki-from-mars-b5ea5f@houat>
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


On 2024/3/22 20:31, Maxime Ripard wrote:
> On Fri, Mar 22, 2024 at 07:13:54PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> On 2024/3/22 18:31, Maxime Ripard wrote:
>>> Which default config are you talking about? This compiles fine with all
>>> drm-misc defconfig, x86 defconfig and allmodconfig.
>> The drm_hdmi_avi_infoframe_colorimetry() function is belong to the drm_display_helper.ko
>> kernel module, it get called from hdmi_generate_avi_infoframe() in drm_atomic_state_helper.c.
>> While drm_atomic_state_helper.c belongs to drm_kms_helper.ko. Therefore drm_kms_helper.ko
>> is dependent on drm_display_helper.ko implicitly. So we probably should select it.
> Right. I was asking which config are you using to generate that build error


I'm using the arch/riscv/configs/defconfig, with the following module de-selected.

CONFIG_DRM_RADEON
CONFIG_DRM_NOUVEAU
CONFIG_DRM_SUN4I

  

> Maxime

-- 
Best regards,
Sui

