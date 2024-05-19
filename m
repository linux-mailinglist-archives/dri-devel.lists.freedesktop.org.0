Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6788C96C3
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBCB10E114;
	Sun, 19 May 2024 21:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rtBoa03b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A1D10E114
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:26:04 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso14720871fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716153963; x=1716758763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6nVMrZE712KEz8bUFbSeox35yQ1x4MWsEF3bYFtA1Y=;
 b=rtBoa03b6b0Mz3D4Bq+7swuZWVF7i37MEIdOMW2+d5wUByFEAp0OYQ1FK7k6gxEVSQ
 WaeWL9HF40VG/FfjR47iesg4vNdCYfqDW+cw6FLf+MJwvmBA2RTphMe+Kh7twO6bJRjs
 PucALEmKKl/r6ijsFgfbpN9jrBZ1btBeCg/ikJKs1tLcNWYIQuD0KprWgraDrn9olzO+
 JdvgKWD59acIkeMy+9bYU8GpPE4d5HdYzMZkBg2xa8W/1JJ5fxuESsMW/PLLAYbx600M
 +Jb40CLEi3ZGiH0ZZcyU0Fv8xIAN0HhqobB3ZzOmE0LkaF72HKqRvjH/5rIjvC0SkUCn
 T8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716153963; x=1716758763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6nVMrZE712KEz8bUFbSeox35yQ1x4MWsEF3bYFtA1Y=;
 b=Zg6okJA+9H+OqKrr9HiuTZDbu5o4OCE0OfrbXMA3O1H+p/t2kbs0X+RjrUihQ1+Oar
 ID3DVBOdiQqJ78sm0Meeei3DXmy2ECHWxARxT+OzKi17tT4ljW5z/UVa0V46l+XjNKQf
 CWSMZT5b/ad23o44vEuznKcEw1YcWEDcb0Zxyq5p+GsO0uHx8sYbPmpAbslQgXU1mrHO
 kQy7ViPDy57PYBXl+wPvASAZoi+sJsbTu9irMszFX7w3O7Htej12SYC0j12NKtQTEEV8
 dWrvXs0HKKiBy69qpPK/HCP9JELvy+5I47ISLlN2HKnA1ARD2uDQnWvt8xVOlfwh/eMp
 ARyA==
X-Gm-Message-State: AOJu0Yzfz5GY0xX0xlDi8YciI3xjZA2eB71+LFKIucMpgcVQHJZHfyJF
 VGxqGFLynwg/8kLPU7MtuwBhsOaXlTtBJqvj1Y8MpXFXvaUOK3lwvuhPqSIngcIP38H5Ofh9kSR
 T
X-Google-Smtp-Source: AGHT+IEDiTly3l/2arj6xKsFbQnwkCXaJx0c6Qc6YWYld3fj0pvH9iSWWsSZ94Z5R5WBsRW4rLHAKQ==
X-Received: by 2002:a2e:b01a:0:b0:2e6:a0b3:24a3 with SMTP id
 38308e7fff4ca-2e6a0b326fdmr141595051fa.4.1716153962611; 
 Sun, 19 May 2024 14:26:02 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::8a5]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1622740sm32064781fa.119.2024.05.19.14.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:26:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, biju.das.jz@bp.renesas.com, aford173@gmail.com,
 bli@bang-olufsen.dk, robh@kernel.org, jani.nikula@intel.com
Subject: Re: [PATCH] drm/bridge: adv7511: Attach next bridge without creating
 connector
Date: Mon, 20 May 2024 00:25:59 +0300
Message-ID: <171615394192.98831.12547491683028150051.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513080243.3952292-1-victor.liu@nxp.com>
References: <20240513080243.3952292-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Mon, 13 May 2024 16:02:43 +0800, Liu Ying wrote:
> The connector is created by either this ADV7511 bridge driver or
> any DRM device driver/previous bridge driver, so this ADV7511
> bridge driver should not let the next bridge driver create connector.
> 
> If the next bridge is a HDMI connector, the next bridge driver
> would fail to attach bridge from display_connector_attach() without
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: adv7511: Attach next bridge without creating connector
      commit: 20da948e3a807c67f0efe4f665e64728be370f3d

Best regards,
-- 
With best wishes
Dmitry

