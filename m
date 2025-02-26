Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF4A45D43
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C1110E8D0;
	Wed, 26 Feb 2025 11:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yITe01xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEE410E24A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:35:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso58501985e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740569745; x=1741174545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=alBmJLHqLeak0MrBEaiF+GvOpgs6GCrussWTD7ASuFg=;
 b=yITe01xZL0hhDSnDquuu6QU6qSXqqawNhdOBFlHsUYfNwBor/iwzCDUZZcCcQrQYAp
 Ty/2asrJpGBGBB2p5S0fHtOgJSsFpaarwE5CLT15tnQHUlZDqn1toEws5T68e/MFICEb
 dqiD37QgZgjh2PEt3hLbhd+oZvbGQsXI3eh1pSITx3T+FQhTvcHt5JmMiHURvUSpF6KM
 RGPfwWzI69Vaw65z3lbdONlQTEaSMk0RIN5WUtk5KU6OIE5JI5T63wKTV43CtPmnEEsM
 GkEv8XrBEipRxN0YvvgyZo7JulY6n55z2G3FVRL5+w9Otvq+fJb/XU+gvUmJH5uc8Ii/
 7hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569745; x=1741174545;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=alBmJLHqLeak0MrBEaiF+GvOpgs6GCrussWTD7ASuFg=;
 b=j8V8WbKzYQyzEMOOiihjrQm1GRHiO1TNM+0nUfOODCuDhkIp7AzKkBJslZ2fH2ZD5P
 0vE8dni3PkWWazupXyAjkjehkzAgv+tkxGSvUe2Unsnmvx0cca65jH5aeNKCpj2f8bs5
 B62H395Y70FBR58YaSoM51DNY5IZmxKN2eLtQsZAPa8ooV0M2CBCYfCwqXBJ+Nl2ZK/F
 4mENRVls3IzgJoAkIGRHE35CI7WmdPQMTzuQqi9cFdG9ooRq/pkUMa9qTgcJyNJX8eD5
 AEOy41OMWPSqYW+yppjziGgS+s5G8ZwNVWCeOqDJo5cOeuz4X9hp9LJqVak5nmP7ZUBU
 ZzOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyGZ7QM5xld0CgwO6whVYvaImh0vP9obFpViJANETLKqaLGAHejXmdsQbwVQ0Y9EP6mv0PA+lBjKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCeLZNLaTr0bBfzj2Q1+u7DfZTgLNncnxPFUhnC9kIqV4RUKPT
 0lDJttC9hg5kZ9I5Y1A9oxRf1Jt1jfiHcLTIvUEAzh4nt83XBxYymup9mLgamuo=
X-Gm-Gg: ASbGncvCjPmFAf53ha7obi0sP75tw62v9CFbCdDt4E5kM4uU+U9/WQWWPsYj5z260du
 h4XbXcZ5RB56OSe3GBa2Z0aNnGLUlBCvp8ijQskOwn/oNrUN7fPD6JFGonrj/h9wtsRCEG+f+g0
 R9pyYhtij1O0g9fMp8YueWsrEWxdtl8lwoyY9XFUJs3QNLiKGWzckOtpEbWQyW6L8LdZKZr536u
 BFV8tFb1tS4gtpwpByuj+kb1u23Fv/OgaEr5PZKXERMhy0wChKjEF2uz1FxlYVIYtP7YUWTl9z1
 NQphYATpR/l7jdTinWpzFPAYphl4tlwjojcmztCPpek8EbfX83Inn5u2yMuT84dNjg==
X-Google-Smtp-Source: AGHT+IFDxhZDh0OTrZqQRYhLB3t0W3PSVkeDzir54VORaU0Ul7AQg6j84zQMQRzUVA7uut0cfrh6Pw==
X-Received: by 2002:a05:600c:4f86:b0:439:967b:46fc with SMTP id
 5b1f17b1804b1-43ab8fd73f2mr24567335e9.8.1740569745142; 
 Wed, 26 Feb 2025 03:35:45 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-231.subs.proxad.net.
 [88.127.185.231]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5442c0sm18103605e9.32.2025.02.26.03.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:35:44 -0800 (PST)
Message-ID: <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
Date: Wed, 26 Feb 2025 12:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
 <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 18/02/2025 09:52, AngeloGioacchino Del Regno wrote:
> Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
>> Hi CK.
>>
>> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>>> External email : Please do not click links or open attachments until you have verified the 
>>>> sender or the content.
>>>>
>>>>
>>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>>> mtk_dsi_poweron.
>>>>
>>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>>> driver try to communicate, the DSI returns a timeout.
>>>>
>>>> The solution found here is to put lanes_ready flag to false after the DSI
>>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>>> setup of the DSI module.
>>>
>>> I'm not clear about what happen.
>>> I think this DSI flow has worked for a long time.
>>> So only some panel has problem?
>>
>> I don't know if it's related to a specific panel or not.
>>
>>>
>>> And another question.
>>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?
>>
>> The workflow should be:
>> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
>> re-do dsi lanes setup) | ...
>>
>> I observe (print function name called + dsi->lanes_ready value):
> 
> Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
> is internal to the mediatek-drm driver.
> 
> That callback is called by mtk_crtc during setup and during bridge enable(), and
> there we go with suboptimal code design backfiring - instead of using what the
> DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
> this issue.
> 
> Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
> there you go, that's your problem here :-)
> 
> Should I go on with describing the next step(s), or is that obvious for everyone?
> 
> :-)
> 
> Cheers,

Ok thanks Angelo.
Can you let me know if you agree with this change please ? This should be better:

@@ -843,25 +843,6 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
  	mtk_output_dsi_enable(dsi);
  }

-static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-	int ret;
-
-	ret = mtk_dsi_poweron(dsi);
-	if (ret < 0)
-		DRM_ERROR("failed to power on dsi\n");
-}
-
-static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					       struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_dsi_poweroff(dsi);
-}
-
  static enum drm_mode_status
  mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
  			  const struct drm_display_info *info,
@@ -886,8 +867,6 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
-	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
-	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
  	.atomic_reset = drm_atomic_helper_bridge_reset,
  	.mode_valid = mtk_dsi_bridge_mode_valid,
  	.mode_set = mtk_dsi_bridge_mode_set,


-- 
Regards,
Alexandre
