Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9A5E779D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3357F10E7F8;
	Fri, 23 Sep 2022 09:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763110E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:48:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t14so19538316wrx.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4AgClHn7Pp2uPvo8c3dWidnYZ+2Ep/rXWim+T66RrUE=;
 b=iPFVdFgJUHJwjqRrqGguHBvS+j6YmR0K1gQ7nj38rGxQnkugr1+aCOfk3mQozf5vSJ
 sXAQ3ITkO0WtwV80sfVftt6ohs/OE1GQZEugAkXvD5BC7PzF9vfNnXfup22g7BLJNFov
 CCfun4sbJtTjNcvIMfSjtwRYuPOtCtQtDSK0AYba1AT5jAlzp0e32DhYqrK0GroRTNiJ
 neV1KOs1Fk8e9flpUZw5OOA3+t0pmIRX4Bcep+dQHsfmh68tZVDq4PVKfSsk8pz85qos
 s6oA8wbhaj6C/mTy+jdkf3JFyGEAVu9ixKjoTD7wJCrZgdiHklnv0M+GnDG3eLrdlVx4
 KbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4AgClHn7Pp2uPvo8c3dWidnYZ+2Ep/rXWim+T66RrUE=;
 b=qZVhDgAg4Oo7KPmqW2WA9XYawSyEmSVo/6AAft6rDrSSXSeOtSYiXsBzJMlX4bUigN
 DYGh9bKOF+sP3swXBR0cO3OSqGCvRqHoioZfBvU/wjt3mxufZTx3S8UxZVYhSkg8VViq
 BMSW2VKXkjwBGFponZ3GhdbukfiMdVgDPvlHSwDe4VFGI9ro+0MLhuGJOOC1x3X6yy0s
 /Yt3m7weSXXIf1AzMWxId2q2yE0Vp0haormig6r7DOY1JvjInSWhEcZny4g9/U6OMwOj
 YQEeAiPyptWGscxL93VL6L5xApoNN14LIZXWgozgQNPB9lQD8Ed4BKFPqfi6ngM5LjZM
 f0vQ==
X-Gm-Message-State: ACrzQf0r48sScGDUBZuB5t5ADD46obgluneA5malwaH9qL31cvvNvCSq
 F0geFgGOAB+X6AqMh6sCdkliOg==
X-Google-Smtp-Source: AMsMyM5m0JaAXR3jCt1aFyUwdIouiT8PFE/Gl4fpKqtq+cXj6R0GtM/jMmToCmMyGEd2QZKbaeVMPQ==
X-Received: by 2002:a05:6000:154b:b0:22a:9683:3a2d with SMTP id
 11-20020a056000154b00b0022a96833a2dmr4430409wry.369.1663926503640; 
 Fri, 23 Sep 2022 02:48:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003a5537bb2besm2207571wmb.25.2022.09.23.02.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 02:48:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 khilman@baylibre.com
Subject: Re: (subset) [PATCH 0/3] drm/meson: fix use-after-free driver unload
 issues
Date: Fri, 23 Sep 2022 09:48:20 +0000
Message-Id: <166392648623.2713441.4855173226833307532.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919010940.419893-1-adrian.larumbe@collabora.com>
References: <20220919010940.419893-1-adrian.larumbe@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 19 Sep 2022 02:09:37 +0100, Adrián Larumbe wrote:
> This patch series tries to fix some use-after-free bugs I've observed with
> the help of KASAN in Amlogic's KMS DRM driver.
> 
> The first patch in the series reorders the driver deinitialisation sequence
> so that devres won't deallocate things that are still expected to be around
> by a later call to drm_dev_put.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/meson: reorder driver deinit sequence to fix use-after-free bug
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=31c519981eb141c7ec39bfd5be25d35f02edb868
[2/3] drm/meson: explicitly remove aggregate driver at module unload time
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8616f2a0589a80e08434212324250eb22f6a66ce
[3/3] drm/meson: remove drm bridges at aggregate driver unbind time
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=09847723c12fc2753749cec3939a02ee92dac468

-- 
Neil
