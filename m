Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C120D857E18
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886F810EBA5;
	Fri, 16 Feb 2024 13:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OJ6N45/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788DE10EBA1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 13:52:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so1073361f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708091573; x=1708696373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvI32FQ4nm5FS2E6NUBcZLhBYHDUHTwrrFx6puVW3L4=;
 b=OJ6N45/LfTWoym/2pdvmy1/U8t9+NqJuXalaoPngHO4Jjqd0ogS4ms4QytBxkD0ADw
 V1KAT9fCnyJN26QVzyhhvi9S0YD1ec0ecrI+CAkuIoWliwcrsa7dndovUO2aSGM7u3s6
 5G5/Od9pG1mFCwUon55P849byLp8r1oDuvjmuX4Xiq/06/dCMip0bQJwNxJzqL1EFhc4
 /q9s+/pvWY7HvrnNwpvl9w5rkiLdCi2qIjpCFNm0lIj3qGedxvyyYBBu9PUYVbfygMro
 ZalAElbEM/7aotW5290tC4GHrrovrhJPjCwDhL2X9tGImRim2IVVY8yQOh+BpMW6WC3/
 jfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708091573; x=1708696373;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PvI32FQ4nm5FS2E6NUBcZLhBYHDUHTwrrFx6puVW3L4=;
 b=jrls7bXO4FT3W5kG6+4dZshtt2JM8Qa4tY/WvZnWT6IX93tEUfrPO5DL6hTVtU1QAw
 G8bAJCBlfCQSAxAiuy6M4U7VwfpB2cjUZTQPy3fmrF5eq3r03d5RoIoaoIKs7vduGMTf
 92lS9WLBJoZWnH2w99SRhxMsyoHhoshNdsdrlvnLX/kzCeJ1JYkP6tZ/4S7wl1yLTWXQ
 3OwwvxVlqUQQn/YT/DjsadcpxXrNLgq9oURUnqh8snNL0tkBRqSZbZFxQWbDJOnxxnFn
 H4XPfajDopWIltpy7HoTqi0aJuH8NzFThdILMvBjFzP13/txlAuJ9CjWTLmO4UzZRIbg
 pw7w==
X-Gm-Message-State: AOJu0YyvktubnuNR9SLLA6ntgwHUkAFky2aR5+H5LhpPu9YuEC2JDBx9
 /PsGtGmZ0sGhIAeLAv3+ISzQvd4toPDgz3XBiCsFkCwve6YylKqgFf6qXJp4a4o=
X-Google-Smtp-Source: AGHT+IGvhbMlbHXuakezCC4b3U3zd7ifYbRzXbL5tSRNVyiku/IPxHI7g3kEQ6pzNqVn4XOPF4zbiA==
X-Received: by 2002:adf:f310:0:b0:33b:4965:cccc with SMTP id
 i16-20020adff310000000b0033b4965ccccmr4102354wro.46.1708091572975; 
 Fri, 16 Feb 2024 05:52:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a5d4a0c000000b0033b60bad2fcsm2253706wrq.113.2024.02.16.05.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 05:52:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org
In-Reply-To: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
References: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm: bridge: dw_hdmi: Set DRM bridge type
Message-Id: <170809157211.3599882.8383475830404744849.b4-ty@linaro.org>
Date: Fri, 16 Feb 2024 14:52:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Mon, 08 Jan 2024 16:25:14 +0100, Alexander Stein wrote:
> The bridge type was set to default (Unknown). Set proper bridge type.
> With this fixed, debugfs output imx8mp looks proper.
> $ cat /sys/kernel/debug/dri/1/encoder-0/bridges
> bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
>         type: [0] Unknown
>         OF: /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
>         ops: [0x0]
> bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
>         type: [11] HDMI-A
>         OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
>         ops: [0x7] detect edid hpd
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: dw_hdmi: Set DRM bridge type
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f63f24488571fdd6f6aa910f2db5a7f3d44a4da6

-- 
Neil

