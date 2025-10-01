Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1EBAF5EC
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9157710E339;
	Wed,  1 Oct 2025 07:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eHzVjOnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BB410E339
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:15:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so24001065e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759302935; x=1759907735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ig8BKEaSDbO0ANR6SUqa4XKNjpsfwaNlIByEpPqVvbU=;
 b=eHzVjOnkDOTgrd6MnqXE1GsXSKNzVX7eW4GCVcfFN4Eny1sJbjfL3kxdRBDhnDQmC1
 CZT9HgcCBBWyTUu061GItQYEXVwlO+jTI+NWtfMA4mjKGTK5GWh8tMEGrws9oopf2fNd
 avXT5nLXpNHtzDL3NeGeeDwTiDoqr/CUEqcEJAK8m8cJwdZrPBo/4TWQN6a/7uomkjMx
 KBg0zeGDXKhgYIZsrNrjAhoDtSSEvj8QCKs8NccM43dz9VLHnU2IvBCr9NxbmbIBfwqD
 w1eiyPzJnub2B8s1SIdDiP85ZSDyfJZOTaF4RWuo6OMivvpYWdWrFp0wW/x/1XlStB7i
 ykoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759302935; x=1759907735;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ig8BKEaSDbO0ANR6SUqa4XKNjpsfwaNlIByEpPqVvbU=;
 b=k8+C1l70MR4+IaPXUvUV3uyVYElFYRngoMNXRknaT1Ce53Hxdgn39EHdmn1ZVHcxOq
 wWTRQLlHre462UFb8HPGUZmCQgshKYHNn+0UTXjiwulbpSMo8joXxyeoIIb08yNCmf7L
 SbeOMvf/Crwnesk3pLKulMSfwHXXR2MCqyVB+nimZQPGW0O8WZ0x6ZiGQYR1C6H0cpET
 cJIqZH7lGU05tWAWTwn2C06PJkWi9+/ITNvXoZU6M1OFg4gI2is5vfUqhIAI62cbi4uf
 Q7Q7USE6cG4D5eLRhoZQx7uHnIuipsrLRA+5bWIe7nT272/j/5gInQyppx796e+hRR4x
 Gddw==
X-Gm-Message-State: AOJu0YxG1+bJTxtc/V/Oiz2pxgLZHMQrhSLEaBtbhQ8iHb6OyPYtGagR
 Pv9PGKnR9w5m2i9NJsRRmRSZBaK/ps/8IolaSlgAqSAq4V4e3MonhfB1rib0FW3pH3+4qObexso
 zBqiC
X-Gm-Gg: ASbGncsEtK9zON9p1t38eyBM0YU8z73HHwN05RNimkDj/65k32nj2wNhyqNdN/lCQON
 hWxUNgF0G2CzM9jZiN9WQo6vKp3D5XEdzWzsuApg3ooRMLxaRGDXuZ5mDoLX7+sQ42IeaYIXcfQ
 Ie1O9ch2eK9efEX0DGZ7oSDOa0R3TlJutuQfLyBwJBaPhpyFpH9TEL2bcF9xqFZZZHACalZFLtX
 E3YnLSMZgtBkULvEMxXUihCXETt/oOkS7x7h1xwOoQvluV/vac12eyFFfktOxNX45mZAXcKdJQL
 JZ+IhWhir+TIN020WeoNocHZCdurDig3SKSs/e7v5FdjSGD8iEvQLPpxkB1qwO+jfQR0zMrBiPT
 3R5f7D/d4AwyAltYp9gLe7cTBlBaSr3C2p5w4yWIT5J+O6+vYKO5ZzvQytXlh5QU+6pM=
X-Google-Smtp-Source: AGHT+IE+IYKiRpEjUqHImSI00u6cF4PFdF1GH74nExNMmIPL8P92h3i3/FToK8gMkIESeeV2Lkl61g==
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id
 5b1f17b1804b1-46e6127a1a2mr20622315e9.12.1759302934915; 
 Wed, 01 Oct 2025 00:15:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a0241bsm24801515e9.11.2025.10.01.00.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:15:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
Subject: Re: (subset) [PATCH v3 0/3] drm/panel: visionox-rm69299: Add
 backlight support and small fixes
Message-Id: <175930293421.429742.3887174305831150628.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:15:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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

On Wed, 10 Sep 2025 18:39:55 +0200, Guido Günther wrote:
> This adds optional backlight support via DSI commands. If
> a max_brightness is set in the panel description the backlight
> is created.
> 
> While at that we fold in the already sent out clock fix and
> a fix that prevents us from clearing all mode flags when we
> only want HS mode.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d298062312724606855294503acebc7ee55ffbca
[2/3] drm/panel: visionox-rm69299: Don't clear all mode flags
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/39144b611e9cd4f5814f4098c891b545dd70c536
[3/3] drm/panel: visionox-rm69299: Add backlight support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7911d8cab55453b6bf59cd1f806503c3dbf0e990

-- 
Neil

