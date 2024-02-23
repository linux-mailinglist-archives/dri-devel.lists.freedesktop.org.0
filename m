Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7F861E92
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4909610ECCD;
	Fri, 23 Feb 2024 21:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rfPBLZzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ACE10ECCD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:12:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-512ed314881so621575e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708722731; x=1709327531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGoMlcewt/o/e7ZZd/Nrf1dzQYMmruEmp0vV0pwlRI4=;
 b=rfPBLZzSguouXRQx5yhHzP1NmbfkLVAyNCk3ThFy4eQMVlsBLFCk5xx1RIz6HbQYp2
 qtbeqlSUCi7Ho7BQmInObkgRACfAkORSq6+Farj7SyQtW9Vr9De2b4f6AXM/Osio4Qr8
 VViijY5gJJv2fcBWWVAKhjnTR0Ppx/SkQ2JiVnNn5NLvpDvdklSeZpz2Swg/XY9dEb3u
 teUNyivIlfEj/i2/mwtA4vbiFTVPa+wZJHNtQvZZxlsA/HzMrnOQ1zkRrUhfqxWuo3b1
 90XZJtrCeCdEgR2LXj4rHU7Hyw/D3mURgEICB8OTfCRyQ1U56QkNGKgC6Vt1JrK8o0jF
 jg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708722731; x=1709327531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGoMlcewt/o/e7ZZd/Nrf1dzQYMmruEmp0vV0pwlRI4=;
 b=DGoBFhfHnqKfDuDQF7DnhvqUenMk/zNHnKjfDUHLelN3VL3Fsqcgx4XX/X431Y7O1k
 oDOc18ewWpK5Caf6csykNYVMV9Dqh74Fr2c3PgVhKYEuwl/kkfJqvjnVT0u9+o2mpwOF
 5HgK0VUn4eLzZr+vUlGvYNYDk5y+ZuycWL8PocOl31GwsJE7mtQNELWfky1zm6tcbdYz
 7ojCbvhDnPMLkGBPcsZlnppQ6rtsEmmZS0+9Dk1Ryo1msV9X2qfiFT5NId41JmwsYhkI
 JJGKeGw2yIW7eoXyDmHG9kRWbGLbKagivo2r0MqunBI3B2pLjlbnflKSviBTcwK2bgIE
 k+Kg==
X-Gm-Message-State: AOJu0YwaMZae2+3EiJM6+2F6c43V8Demi8oSmGy0VKregaKc7Mhn3UaL
 EcQyLjaFcbhx05Y1awvS/Bs39JwmsOK4UASA7W+PqYP1v48SzogQNZR9Xs5JVhuX/mcQQIM2NCj
 b
X-Google-Smtp-Source: AGHT+IE84oSk29MfBvsjxSYOZ/HrekOzl5NhHTSbitvN3jEU+xjJudv+FPnPLa8aLxAwvTu/pRQnhA==
X-Received: by 2002:a05:6512:1089:b0:512:9e57:375a with SMTP id
 j9-20020a056512108900b005129e57375amr674673lfg.53.1708722731053; 
 Fri, 23 Feb 2024 13:12:11 -0800 (PST)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 b22-20020ac247f6000000b00511ab338ab9sm2569229lfp.97.2024.02.23.13.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:12:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/i915: convert remaining intel_dp_vsc_sdp_pack
Date: Fri, 23 Feb 2024 23:12:08 +0200
Message-ID: <170872269352.38997.8233742741784578321.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223191548.392185-1-rodrigo.vivi@intel.com>
References: <20240223191548.392185-1-rodrigo.vivi@intel.com>
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

On Fri, 23 Feb 2024 14:15:48 -0500, Rodrigo Vivi wrote:
> Commit 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
> and commit b55b88d86fec ("drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()")
> were based on top of a tree containing the
> commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation") but
> landed in a tree where this commit didn't exist, leaving behind a spurious
> case calling for a removed function: intel_dp_vsc_sdp_pack()
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/i915: convert remaining intel_dp_vsc_sdp_pack
      commit: de8de2c8acb931ce6197a04376a7078ccf50e821

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
