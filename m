Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36890904D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5F910EDDE;
	Fri, 14 Jun 2024 16:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uHTGxNVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC310EDDE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:33:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso39202721fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718382821; x=1718987621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2d55ULbnkaBid8TOFZdzcvS/9s8SVhV1X5mA5njwAFo=;
 b=uHTGxNVlg7RjnDvKKI8S+roez/SHmGohb1IOcTMkx5Dwcz/TjwEefMXseN2SorTSP+
 8E2TWcc7SVKSYT2NLuZHN27BCWgew3JHW7x/6JrsPEe3gH+KSZsIWwaVVlIBuQePtjc7
 lfcIsESRUox1BuAfTeXZpKYrhHpQcZaPEp2BPsFtZmB9+UspDfalg1Ou35KSVGAnTegN
 zBe00Sz6rh/pMVQiP+hYdFASaRavRshnj9lQkZC3nhoPG0GjDiyTE3ERlmu7Q6+zcBgv
 K2gsaSOBCzMKDENyG6LV7C9x/SB1UjefsoqOrPWz5jlGrdjW/kdtNjK03oOo8HMzSKuV
 ltCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382821; x=1718987621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2d55ULbnkaBid8TOFZdzcvS/9s8SVhV1X5mA5njwAFo=;
 b=JsAq4TdoheFq2O4l7zWJa1bB0FWWYt9RbVAhmt8affvMrW8btKqnoIh8b9IMdr1tEn
 VAcCdLHQTjb+HA7EQfyx8sfCP3LYOnBggsXd/Xjl9Kg+XtsPmBETiRA/cRW3FECKLbGa
 4UMXTf/EcclFkXrhR7AleudWXcgHlzovdMPjFwfIDow/a5xVO2HUJS+OSiUFcC5BMdYN
 RyJpRQmsUTFLBn7C0IlB5pgdO7RJ1zAfTr4hi8pWl6MuIR64njx6AGM+EvQrkLaeifbx
 9E7dVCHriSSe9gsHZJa3pD3wRK3UL12gWRqB1j4vBdk1GUwy1wlwSo6aVR19yFTKJLxN
 +0GQ==
X-Gm-Message-State: AOJu0YzdGVFZ8CBCKdcxmSyEXIYTfjpbRLGu5LnrJE32BwS30zBU8ab5
 M7odzuK8qkniwo+S8MP4/n7iSCVK+t20tQfqMgFaF+XaeVO8DFNuiwUYOno9Ggc=
X-Google-Smtp-Source: AGHT+IEnB+fBfP43mYT/p53SnlqGh8oUvLF5M1CtSsLsttHfAwsPZDksfX2T6AKsZ/OOhCIWhq9eBQ==
X-Received: by 2002:a2e:9f44:0:b0:2ea:edac:4886 with SMTP id
 38308e7fff4ca-2ec0e5c9a5fmr24401781fa.45.1718382821099; 
 Fri, 14 Jun 2024 09:33:41 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c89a99sm5527931fa.107.2024.06.14.09.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:33:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Date: Fri, 14 Jun 2024 19:33:37 +0300
Message-ID: <171838280388.2978747.14895279716639954590.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
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

On Fri, 14 Jun 2024 03:02:19 +0300, Dmitry Baryshkov wrote:
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
> 
> Document that adding support for eDP panels in a legacy way is strongly
> discouraged (if not forbidden at all).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/panel-edp: add fat warning against adding new panel compatibles
      commit: faeebafe1d273ed6271dfb6555cd90ee730343c1
[2/3] dt-bindings: display: panel-edp-legacy: drop several eDP panels
      commit: 73458101e5681a7d766184cb4e16cb7b87571359
[3/3] drm/panel-edp: drop several legacy panels
      commit: 51e1fb144f17c277309ed5a1c6f0d921df0064d7

Best regards,
-- 
With best wishes
Dmitry

