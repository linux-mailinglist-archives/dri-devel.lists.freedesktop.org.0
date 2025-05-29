Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A574AC7596
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 03:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD2710E1CC;
	Thu, 29 May 2025 01:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hKr/jMDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155106.qiye.163.com (mail-m155106.qiye.163.com
 [101.71.155.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8110E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 01:58:07 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 16c60e019;
 Thu, 29 May 2025 09:57:54 +0800 (GMT+08:00)
Message-ID: <91d19262-05a1-4127-a66b-e141add02c3f@rock-chips.com>
Date: Thu, 29 May 2025 09:57:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250527081447.304-1-kernel@airkyi.com>
 <e2dnvpbze4xuubggduqr3p5nnhg7huk3dnpdcb6tldxbrn2qtn@bfsewz5trfv3>
 <bc321a71-1934-4889-bd8e-3bb593c8feba@rock-chips.com>
 <CAO9ioeXLSQyBFuedtt4=_OjEWZW6T9HaaYr8_NiNy2eh4yw-qg@mail.gmail.com>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAO9ioeXLSQyBFuedtt4=_OjEWZW6T9HaaYr8_NiNy2eh4yw-qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MZGlZIGElIGENNQ05CHRpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9719c29dab03abkunmb6e35c2d3ed6f0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Sxw5UTE#Ik5LTzoNAxop
 SgEaFDJVSlVKTE9DT0NIQ0xCTE9PVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElNSjcG
DKIM-Signature: a=rsa-sha256;
 b=hKr/jMDGb/QUNMUXmrYROwQsGX0fdWG6CFNzSLAsgz6yP2c9A4+03vNR/TDCHiDTBkbnoXzs5TNXL5C/DlnPCQ9evCjCr48FrSH+5RxP9DH9OR9yJSWaUE8Aphat5Cxd3HyEY9xd9pvI5d3sLOybjf+s9zBdjychWG4hKU3RcfQ=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=QH+9LbKgzSSxVg9sDNO4PK5Zcfbm6EKo7JyEYRq1ozI=;
 h=date:mime-version:subject:message-id:from;
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

Hi Dmitry,

On 2025/5/29 0:09, Dmitry Baryshkov wrote:
>>>> @@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
>>>>    static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
>>>>                                              bool plugged)
>>>>    {
>>>> -    if (dp->codec_dev)
>>>> -            dp->plugged_cb(dp->codec_dev, plugged);
>>>> +    if (dp->sink_has_audio)
>>>> +            drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);
>>> I'd say, notify always and let userspace figure it out via the ELD. Then
>>> you shouldn't need sink_has_audio. This would match the behaviour of
>>> HDMI drivers.
>> Oh, I find that there are similar usages in qcom msm driver. Is there
>> any more progress?
> For msm driver it is required as DSP requires HDMI to be plugged for
> the audio path to work.

I see, will fix in v4.

>>>> @@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
>>>>
>>>>    static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
>>>>       .mode_set = cdn_dp_encoder_mode_set,
>>>> -    .enable = cdn_dp_encoder_enable,
>>>> -    .disable = cdn_dp_encoder_disable,
>>>>       .atomic_check = cdn_dp_encoder_atomic_check,
>>> Nit: for the future cleanup, it should probably be possible to get rid
>>> of these encoder ops too by moving them to the bridge ops.
>> Interesting, have these patches been submitted upstream yet?
> Everything is already there, see drm_bridge_funcs::mode_set() and
> drm_bridge_funcs::atomic_check().

Thanks for the clarification. I will move mode_set() to bridge ops.

And for the drm_encoder_helper_funcs::atomic_check(), most Rockchip 
drivers will set some Rockchip-specific properties here so that the VOP 
driver can process them. In the future, we may integrate a new encoder 
driver to process these private properties. So, I prefer to keep this as 
it is.


