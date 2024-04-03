Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79A897958
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 21:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FB9112E92;
	Wed,  3 Apr 2024 19:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H1IYw+hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20C4112E92
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 19:52:02 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d6a1af9c07so2636691fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 12:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712173921; x=1712778721;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=wLedOIV4IbUFIx9RiX1EzuAEXy2HWZd818qXPBl48uo=;
 b=H1IYw+hNKy/LtJr3OllHsygSohJl+Pl6bWSLGtS+iJrk9BbyVVefexbaGQqp2Khs9l
 IJdigyXw6p1XoTh8sLUd3JVkkYHTqIhwt6CQ0lP35VIQoRwI0yWR08c5YidXzk8DJhrr
 BrtMFauzSBPT9TBt0uwrzJjRFhbsXBIiCTkvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712173921; x=1712778721;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wLedOIV4IbUFIx9RiX1EzuAEXy2HWZd818qXPBl48uo=;
 b=rBtsLYM9ARtDoH6ARU9AXRsgvuVSnN/n4PFR93uRY5CWMNgkCTADPWGph2Rjh+juZQ
 W+sOPHOhojTIBaKP9LUaxuLhAd8JevL/Gvkf3BTv7//Ds8ttiyepwknHlLE84mT2ie55
 fLjd7p/eqmcgXt0EVJ4BzUQ4OGdjrHVRpZllATnB4ZbzLz1hxS7BxtaMBEmIwI9fl3dP
 f8ElgmMp+dVf6xPzXO4hKAp0DIu9eGPUhD8jEcqSUPGzXxiGebMIQQbKCl9vPoCSl+cg
 lUa5jiKRrIiiqX6V/bHG/HHWAHmjqbR0sBb5nVDTFbX5r+2fnXa46f/ivmEzua/iHxjL
 7MpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCNolmW7woXk8H3NrpVH7NAqj4HBkl/RrqhjXfRqm3seUKh0eHnipleHtuFhowp1MoLHIf5XtTXyGsbSN6N5hBAkJjmL96attkBLgnSYsO
X-Gm-Message-State: AOJu0Yxjg0T12D4PpRj0IFWOSOXh3t4xJAnrA8sC5Z/Z0W6XvGUE00mg
 Zgwzx6Edzi7seFbeI2fcl+LozQy1gQmuQyujKwiKW1YeK++lTegXKwVjnns9E7vUdz6ogv7xODF
 t0zW+Qj0j1PDUZjYl7Fs5Xdf40kqb7602gNBk
X-Google-Smtp-Source: AGHT+IG7N2SDMTbPzfa+yXCQ0HUxjbibr9tRV7f3DUYPSOrMBMyaNRQsZMgCus51dZ5hRG42yuWa3WupEQJ0EfwrKa0=
X-Received: by 2002:a2e:a4d6:0:b0:2d8:4158:fa64 with SMTP id
 p22-20020a2ea4d6000000b002d84158fa64mr382308ljm.35.1712173920639; Wed, 03 Apr
 2024 12:52:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 12:51:59 -0700
MIME-Version: 1.0
In-Reply-To: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 12:51:59 -0700
Message-ID: <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, abel.vesa@linaro.org,
 agross@kernel.org, 
 airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> return value of cfg->configure_dp_phy(). This patch propagate
> return value of cfg->configure_dp_phy() all the way back to caller.

Is this found via code inspection or because the phy is failing to power
on sometimes? I ask because I'm looking at a DP bug on Trogdor with
chromeos' v6.6 based kernel and wondering if this is related.

Also, is the call to phy_power_on() going to be checked in
the DP driver?

 $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
 drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);
