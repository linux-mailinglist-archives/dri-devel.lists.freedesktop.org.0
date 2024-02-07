Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D76084C748
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4E113188;
	Wed,  7 Feb 2024 09:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f+rTiGJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4642113188
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:26:10 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51149561a39so394920e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297969; x=1707902769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5lRyRyAGgIvVUMWrUgNzjdeVU6fgp9K41rKwzb8l3g=;
 b=f+rTiGJvxHebwOe8zNgmkuusrjs+Ap0gTEqQVwp5XUM4/jkJBJBkBKMgVIFwHwgRSL
 QvAsQPvPSMYyJequkLj4siWDNo2V/2kZ+pJKLsTHbBLGrBKD2oz1iS9VpeQV2CzADAQP
 bdYWar8Btvo1KGW5uYdMVsqomJjauNMU4kCOo+cFdeewDnChqoZdTsF0Fzy1cKCmGx4X
 BnMgKCgQrCsmjrfK4EEbRB12C+k7TYaxVQ/6GsiXtm3Z4+fvGF8wftVi+8Aypr4uDMvn
 BBxYxHoUC/P+Y2oIWGXvxeK7BTVlXiIQiVN27V3AHYURJ1hX0r0mUnUDCe/OFlTyadKw
 Urow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297969; x=1707902769;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5lRyRyAGgIvVUMWrUgNzjdeVU6fgp9K41rKwzb8l3g=;
 b=Y4bWa+tLtfiapLu9A9WU5N83dxij4njvmTHraWhigiScRVwjjPECgp3paTXIh5WuRc
 W1fYWzQNVCssGJQ91GksD4yNRknScnrlh8ggbyf3+TAcEmQq0wfwN/3DOeI+EGes7tmz
 khb5pV146QY88Y3pBIWFr7z0BzA5I4qUfKx0pDUdrCfDyBhz1+KD/b8iWJ4g7jnLBNmF
 F154BBaRWX3wQWoVnokJF2IyqFy09LhQjYcD1UrCNztzSln5cQq/QqRH6c9yXVLo2wNW
 +j9/kV8e1ZzA2FBhHmTDU+fJpKkXeKywLPCNJo2Z/Aq3/jDsRcCI78PcuXuMZZtIsb6O
 2R8A==
X-Gm-Message-State: AOJu0YyxuMSBDoo1J7EuglXJjSiEyrdJdFml3yVd6QA/5wpa+ylNsIA3
 bD+3yfnjObJ8JYHH9edmEs8m0oeKvtX0AydPHnEhi8O6OqW+kFrjj5zgSo1X/3I=
X-Google-Smtp-Source: AGHT+IHQZkoQ8ie8X7+XIZP1vYhStwCISbCepjeZhjzlFW4HT6fmHA7v8hsE6r+knaXuh9CqjMhrTQ==
X-Received: by 2002:a05:6512:404:b0:511:3a93:5b7a with SMTP id
 u4-20020a056512040400b005113a935b7amr3799131lfk.21.1707297968825; 
 Wed, 07 Feb 2024 01:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWabLadlGXD3LaP2E0ytTHYtf7CDGcLu+M9AM/7lNkClQL5hK6nZxkdnTD1T613VPTgyKWb0QxQDsIaXKL+neI8lR7+Aj6esl4pMyn5aHJdABJuMbwKqP1T98Pr3W1RvvXif5K1Vgl5cRbWeALv7InOgxoP+LF9Nb8VQaIbOdv184dpcW+nUCiFmGjXcpSz/SYof9Nj0kGwhlruvIo3F5x/UGHEgrOrxVPqXc/S2ASdqudyCkq4DxHT8YqtTH3jCPvyLgzw5FbstJCpoe/0AeIlEhmzkh/naQItMx+kyWM+9msw3FzmWVaDKHh1v5ldUR64qnoc/NdcbV0KXgz9zA/1aakoxHajq3wbbHL11psq6UGzhUTdNSb3bTiWNf/BFucxgI2UH5+JW78z5CkwaHbOsl1sKVLv5msLckQNKOI4UmzKsyBnA9W33yk1mxtliFX/wvQ/9bNonrdVN2XuDv1N11V725+u//p0fa97rnq8Nrrrd8jhVlO4UE9RIVuuGTyYQZsvTFNC4oWNfKcOrQnWfNK/TRO44Uh6e+kDkQsxxtrA0VPZ7ceRALbRaFQZqIyXj605k/GsL5Hm1EZUG2WYvbcu4Xn5FsG7fgjRZx7sh+xWmmsfLWd+HLwr+45hXwGMn9huxx2IH4jECWMBNR56HZbV1iruE5SjRD2bmaX3frZYlEMKNLGPM2b1upJ88Z4EhY54zNEJTVs2RTAyP6ZcSRxCqktejFUS89vwZ8lG2A==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b0040fe308ff25sm4593077wmq.24.2024.02.07.01.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:26:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
Cc: nathan@kernel.org, kernel test robot <lkp@intel.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240207002305.618499-1-aford173@gmail.com>
References: <20240207002305.618499-1-aford173@gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
Message-Id: <170729796773.1668186.17562131345712345176.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:26:07 +0100
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

On Tue, 06 Feb 2024 18:23:04 -0600, Adam Ford wrote:
> Two separate build warnings were reported.  One from an
> uninitialized variable, and the other from returning 0
> instead of NULL from a pointer.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c4ae9fd0de44832cb01d36af14bfc7783472e631

-- 
Neil

