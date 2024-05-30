Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A58D4C3A
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC5910E078;
	Thu, 30 May 2024 13:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TqA++nXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858711BF15
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 13:02:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso801503f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717074164; x=1717678964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49+GMxNWhLkVW4rmL96a1CAqr3zak+IQF7tujObyMU8=;
 b=TqA++nXnU9Gz1P4JraERNK+b2ywD0C9h5ghRlkAd/xvfZb9itFvbN6xGAlDkeUu789
 Fdr2XpG6Op9Rs5a9hAKAZdgw9e0ifpwQxVSxdhtNMnAhTuQNf/e1Msu1o4Kk9+b9gV0j
 /olHJxmAZZq9hOzm0pbv4M6eJKTGhuwnvJevXkw4uHL445fO2OKnhkWkMj/4tY/qN+7C
 3/sl8ibMZlaXuj43UrP6cL7oFETGa9gizTFzvSTw7OzBKsfmQP7XjjHRuoWjAFRTD+q+
 Z5h0hXyYtZF2QsGrui7h6lBTiL/RJrt4Tmk49xwHeNimfRA8XxjIHh12F5JySKY3Gf05
 zQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717074164; x=1717678964;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49+GMxNWhLkVW4rmL96a1CAqr3zak+IQF7tujObyMU8=;
 b=lGRHKV9+gGgL8rkV4G7qeVnPrs7e1Fiahx7IjRFi3rajLKpUlDQUdNDM819KDKUqCM
 SrbA8wcsBMQGL4yP1UlxucWGRO3N95tjmRRLQiPaEbZNLWW25KLrawiktkqGW4NXj+U+
 vs8BL382gpGYDkV0ukO3WlnwGwJWfhfXpbqgoKtcYhEU3PWvdHQv1XIlglRcr89Lok4Y
 OzIYVscwcKWa25pmLH5LNmvv74V693Y5MNr8ovCpkZn2G1ObWtEv845iadoX+vKRs8O0
 bEUjyePJUPKKbXz7tv16w0/Tlxr1SN/c6k8or/iQq6azhoV8SUoc7N5Cb5H5bc69et6s
 /Cxw==
X-Gm-Message-State: AOJu0Ywx1Q8YLdFzbqQ1xOhSmebpJOdrl+XiKQGtl3bJvsu8exuvA+Hf
 ixZt0cIEDzpGA8fGJmX1/EO79G1VlywzPpy6B8Pir3fZqChtTsmTH4Rr4hbFqA0=
X-Google-Smtp-Source: AGHT+IHNGCVX8UsXryv51jGEZDjnSTfAQ7QHc5uIJgMOYfUdLU99pXCIdvPzL4LOxkd6BoZkmXFpDA==
X-Received: by 2002:a5d:58fa:0:b0:354:fb1a:25f5 with SMTP id
 ffacd0b85a97d-35dc00c9a4cmr1567928f8f.52.1717074163561; 
 Thu, 30 May 2024 06:02:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35c19618fa3sm5708331f8f.52.2024.05.30.06.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 06:02:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
Subject: Re: [PATCH v2 0/3] drm/panel: sitronix-st7789v: fixes for
 jt240mhqs_hwt_ek_e3 panel
Message-Id: <171707416276.4156460.9937231106022840438.b4-ty@linaro.org>
Date: Thu, 30 May 2024 15:02:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 29 May 2024 16:42:44 +0200, Gerald Loacker wrote:
> At the jt240mhqs_hwt_ek_e3 panel, noticeable flickering occurs. This is
> addressed by patch 1, which adjusts the vertical timing. Patch 2 and 3 are
> two more minor fixes for timing and dimension.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/3] drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e5895ff7fab0fc05ec17daf9a568368828fa6ea
[2/3] drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2ba50582634d0bfe3a333ab7575a7f0122a7cde8
[3/3] drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b62c150c3bae72ac1910dcc588f360159eb0744a

-- 
Neil

