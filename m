Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AB5A67ED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 18:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559BF10E184;
	Tue, 30 Aug 2022 16:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286C10E184
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 16:09:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y3so23200676ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=XPEwTKllwP1ym8NH2MPi12cERuOXKvzToq1oclsHzPcc1Glnle6r/NFlQokXjBIIH6
 QbUIZt/BkPuid6DIjI1Vr1Vdz1jNExePcE/fnA1ZYUHhV0WFCbsdRPgsH+1uFgnncCBA
 fnNh11UqEc6qpLtRik9hewPbH6OdSEbk/Lf8OImyvimIms6oaFcMx9nfhFwbG07mw4fJ
 IbzZjHnAOO0Vy2IWXuaQOKvjlwLj9ZC1kN8U/jzWsWHBIaJWSOy6x6ESYSZpQ9Q0elkG
 rHYfUF3ps30aUtGDdHCldqK6t8EggS+UDxdnGJVpF1D174/MpIkqo7Luwt5H/m78xs9e
 jRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=DPqVW8mfVzJBjY8FDPa+ZqVzdBN/5be5FlREry6Ip2KjqVa4rtHmOhe7X0lcbtA/w3
 ClOLVTvAIz1iMwlNJqSt7doJoWcqv7NNgPCzr47Ut/6RAjlAf+OXFBeyEwpQXereiciJ
 oSzHGBd176vzhzTXCehDVwdBt4soLc8ZfC8xV8OWrosusCLw0+qsm4TBm6OmU3yHvc9c
 R/qJA6rd4hlry8RmXKa2gBvw49j2f5bZIUiQBtIUofii1vx4b6AGLmqyFSv073CeTmzt
 XJNWh39ygm701DlbmxJHL4a8pzpSoPGS+2KcdSwsX60nCkerYZWvbbDAUjx7FIagDXAa
 /8/A==
X-Gm-Message-State: ACgBeo0ksBdQGQfs/kREe8XcWR33u/riDifMdhocfn8xsqmmQvK6UkaF
 5jTMlwdjPh5Dohz4AZ/XjQCD1lK3rGLkez1dSH75pw==
X-Google-Smtp-Source: AA6agR68Jkwl8a4TplCo8Yl1LhaJADY2dOVH3kd3Zh8IjJCaXlyxmwq9SthjYYsC1kRXV7hRaetHqfS/rGP6l4A13co=
X-Received: by 2002:a17:906:cc5d:b0:73d:c534:1aaa with SMTP id
 mm29-20020a170906cc5d00b0073dc5341aaamr17272840ejb.626.1661875788788; Tue, 30
 Aug 2022 09:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <216591bc-28bb-0453-10bb-59e268dff540@I-love.SAKURA.ne.jp>
 <df5e1060-7cb6-77e3-4f2e-9e97ac8693f5@I-love.SAKURA.ne.jp>
In-Reply-To: <df5e1060-7cb6-77e3-4f2e-9e97ac8693f5@I-love.SAKURA.ne.jp>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Aug 2022 18:09:37 +0200
Message-ID: <CAG3jFysypCBdCeh8Ry5che-ikCAe-cWq2Y_x-kdqptTOvQ5Zhg@mail.gmail.com>
Subject: Re: [PATCH v3] gpu/drm/bridge/cadence: avoid flush_scheduled_work()
 usage
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
