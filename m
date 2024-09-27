Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E59880C4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C1910EC81;
	Fri, 27 Sep 2024 08:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bvhbce1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FAC10EC81
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:50:46 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539885dd4bcso463400e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727427045; x=1728031845; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oSbb6GyqIU91E3tpBz1h87UeS05X7HA+7wteUPe++Bk=;
 b=bvhbce1P2lVujV6Jj8jyNYclw5kTUGu5AMO79o8PydH4K2dCyd/cOEjRVPtyg2EeDr
 kKnGOw0q10TzT8TVBme8SCJaWWzgYYuSKYZTXGhlbGQ1dgqDjWEpwd/RzAvY9xtdSlaN
 mAnoFb5uFswl+dEGmvbrZZSYoe9hm1Vjb2xQk4bPZSQluhHT0O/YUCGF+qa2WPj+lDWe
 2wVgokiOJXy27mzePZiwaQTkIpIkqgWEnrbEMQWOPcrbNG9FKBL39xb8/8yJkE54E3KQ
 5z+m6JcQHU8TPoRG6ZJqhlB84lRBv7SFoUqXMWaduEJLQj0KMTUZFe492iE7gymGyJZ5
 Rp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727427045; x=1728031845;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSbb6GyqIU91E3tpBz1h87UeS05X7HA+7wteUPe++Bk=;
 b=pDSbAhYmKHUoq/zI5FOa6EIPrOl0wap/WeL7DH9gXjQM+u7usWcV61Fh1d/IOg9eSk
 eKxQksr2ev4oSgN4x36aCGH5bLLg5Ch3k9sEKLyewFhL4QxNtSoY9R84sUoyNDn5DjH4
 RvLLNeanY94UjPmPWJkrnDWcKHn1oa+pP15QjlBMyayiHuNFH0Z0L3dsP8uI7Oat/IlG
 f10tPBhBk9V7ebLW+VbleuxrObCj8qL/Bl5k06giGLteU0qeUQMK7xzkWbjhD1t4KnKb
 KNrT84Ycs4/hDMU9CHwCl04s2V0fQo0mcdx9NxTxUBbAEP3FDQF4MzD2MYhrXWjvArs8
 5nhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5JIyDpir6O6YynEkFlJ6l/7GNgUephRYdlVB9VsHPenhIMZZm4APUcYvaSdnxqqpPp3W1rQIsvZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwabHLCCDJdbtyoHWdJKG6dT35iXs9I8f3yZTC6nhjLbEHuXFsr
 W5xIGDlaDliqHFDWKECwkdALS+gOtYoUiacUOxvfVY+e0RPMUJS2mF1Z5rlgMDw=
X-Google-Smtp-Source: AGHT+IHm9fx8bb+DamCga+fbsS/5uI9hmB42O72j7rISNL/17Jx88bpWAxOp7qLf5bQkAJzDG+1krA==
X-Received: by 2002:a05:6512:1307:b0:536:545c:bbfa with SMTP id
 2adb3069b0e04-5389fc3c77bmr1626228e87.20.1727427044919; 
 Fri, 27 Sep 2024 01:50:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0442d9fsm229532e87.281.2024.09.27.01.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 01:50:43 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:50:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.Wu@ite.com.tw
Cc: Kenneth.Hung@ite.com.tw, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP
 repeater ksv devices
Message-ID: <pf3ehmjz2nx4gea5ioucftpinha3rzbitonmvmspaccdhirblt@wz6yybzethox>
References: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
 <xyi4czye2dwqmh6iaschacduwxm52oaipbt5ulvlmalamkzwbc@6gt5endjo6gl>
 <79e5e8479b2b4563b2ce4f4a252b2586@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79e5e8479b2b4563b2ce4f4a252b2586@ite.com.tw>
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

On Fri, Sep 27, 2024 at 02:18:54AM GMT, Hermes.Wu@ite.com.tw wrote:
> >
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 
> >Sent: Thursday, September 26, 2024 4:07 PM
> >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> >Cc: Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Allen Chen <allen.chen@ite.com.tw>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; open list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>
> >Subject: Re: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP repeater ksv devices
> >
> >On Thu, Sep 26, 2024 at 03:50:14PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> A HDCP source shall support max downstream device to 127.
> >> 
> >> Change definition of MAX_HDCP_DOWN_STREAM_COUNT to 127
> >
> >This results in struct it6505 growth by ~0.5 KiB. Please mention it in the commit message.
> >
> >Is it really required to have sha1_input in the constantly allocated structure? I think it's a temporary data, which isn't necessary after processing.
> 
> Change sha1_input with dynamic memory into one commit or 
> 
> change to use temporary data in one and change definition of MAX_HDCP_DOWN_STREAM_COUN in another?

If it's needed during the lifetime, it's fine. Just explain the
necessity to grow the structure in the commit message.

> 
> >> 
> >> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c 
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index d1f5220e04a6..5d5ce12cd054 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -296,7 +296,7 @@
> >>  #define MAX_LANE_COUNT 4
> >>  #define MAX_LINK_RATE HBR
> >>  #define AUTO_TRAIN_RETRY 3
> >> -#define MAX_HDCP_DOWN_STREAM_COUNT 10
> >> +#define MAX_HDCP_DOWN_STREAM_COUNT 127
> >>  #define MAX_CR_LEVEL 0x03
> >>  #define MAX_EQ_LEVEL 0x03
> >>  #define AUX_WAIT_TIMEOUT_MS 15
> >> --
> >> 2.34.1
> >> 
> >
> >-- 
> >With best wishes
> >Dmitry
> >
> 
> BR,
> Hermes
> 

-- 
With best wishes
Dmitry
