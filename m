Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50E39A0413
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A97610E0C3;
	Wed, 16 Oct 2024 08:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xfA5NIjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D1710E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:21:13 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539e63c8678so4226398e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729066872; x=1729671672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x73Ze4HiUN0gUgREJRAOH22XoZNP1Mx9uYJX7T5fCv0=;
 b=xfA5NIjL4FFav6t4heko5eXmgiT0MDkGeHrudaySpub9y+6v5kOZwy8JatpyOXGvG0
 sVzDmHo7oLwGE4LWeriARrvfjI6CiIW9WdTp2Jkw6wdS9ARutr+sAl0b9ZgH1NKuQO74
 ijrqEvk50Pd7zVq8PqdG8ea6YIaTjmgZp3ixBr0U6fuvvV29Iqv/VzUyVdIezzqUXnEC
 UYl8puMf31kSJpnc63vHddC5AQIY68Vvcpl1otJiUxpCBvVgaKvNNf2vwB3sSwl6dXSz
 gmQE58+O+mqKgijbYpic8/c1/8RA/PriCDWqru0Ecp3O59xehQyQLB20O5rlJqaTREJv
 wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729066872; x=1729671672;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x73Ze4HiUN0gUgREJRAOH22XoZNP1Mx9uYJX7T5fCv0=;
 b=opMH01HtSdaon/6/sWfjS68FNPzD8oIR8n99rJzNuWIsE2ew9eMSxOpmqQeoEG217o
 9vTJtV2wR7+dK3FSODXrkcRBZ8yMm8BC9eFSkkjnMTk1oXF7oqyT9CVgpynMB/RK3JJV
 rwYA8jPgEgC0A6arOZ5sP+NmGCEVaNxa40Y9MyS0ah4OpIpZK5sBr5nrFhk+Se5lzJSG
 1HMzozFBJafDxeC6hy7qpRvxIRZo+JcHdTdZLekWUmrj7flu5K5kRNuqeDpMhqo7Zj0R
 DJl+w2xmTvYYDxfZVlG66Z36KjR+JkHKo3vqxxbVJEcKVslbwdC6Cl8lkEGsk/RdBsBV
 0qtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkYTx0OiUr7cQPLQfRZ5Afs3t7uOyw95jq5NShx7EHbTSq8l6JK1I3ZUQGRXprOMS3FZMAmDMybMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqvsDLoe+qE0EGzSUpks0OWCgVQYq4cD3+8rAhjgMy9tWjnF7S
 e18528DNeYpCen1JlnsMNJxjElNxd23IzfluWTSs7YcYahbJPndADi850h9ejwM=
X-Google-Smtp-Source: AGHT+IE+1pDAfRFGzuvW8AfMVDl2pFuaNDqn2OJYjthRELduHSM7bCJKxjkRSCr+H2L4CgmQHx3AVA==
X-Received: by 2002:a05:6512:3083:b0:539:964c:16d4 with SMTP id
 2adb3069b0e04-539e551ff2dmr7531719e87.36.1729066871248; 
 Wed, 16 Oct 2024 01:21:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f569eacsm41658965e9.20.2024.10.16.01.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 01:21:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241015153442.3757061-1-arnd@kernel.org>
References: <20241015153442.3757061-1-arnd@kernel.org>
Subject: Re: [PATCH] [v2] drm/panel: s6e3ha8: select
 CONFIG_DRM_DISPLAY_DSC_HELPER
Message-Id: <172906687038.3993974.11773726523880025019.b4-ty@linaro.org>
Date: Wed, 16 Oct 2024 10:21:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Tue, 15 Oct 2024 15:34:38 +0000, Arnd Bergmann wrote:
> The new driver needs the dsc helper code to be available:
> 
> x86_64-linux-ld: vmlinux.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
> panel-samsung-s6e3ha8.c:(.text+0x16b1e65): undefined reference to `drm_dsc_pps_payload_pack'
> 
> Select it from Kconfig as we do for other similar drivers.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fd3b2c5f40a1e028bc813284260d430257444334

-- 
Neil

