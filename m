Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CBB1A60B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CCA10E595;
	Mon,  4 Aug 2025 15:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yPRPUvyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84310E594
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso13370865e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321580; x=1754926380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY+MBRKRSJ9LhmXiUjg3J9ea4YavkXYPCieLQE+Ncn8=;
 b=yPRPUvytZvoKme688DVJAVGQiSK/yYlrDGpgdJol1TyRcbZ5yovqLTO+f/cYSCKmSF
 ISCu4xaNf8uFjUrbRoEA4ACL91zk1QfDaMHk/jNrSwtBdRwSMx7J3FbdXKgwwvTvFhTp
 OLyZIDoz6A2ETbOre9OvbCxOcPF5nYzSMNxxWH4LdXlpYvOA07iw0Ec9hAVg7AllLSjF
 pA5oP7xqax/h9u3mS1fLU1C7l/HE/5SLDxJ106gA9g5t/yLS7Kq92bTr6F1W82pkLbDE
 yqyimSaF64ouEuFW4oKSkGHvi7zvbLJcLUAAchhzL1z0OQ1vZN2AlCbgQddaaPWGwG8T
 dnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321580; x=1754926380;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XY+MBRKRSJ9LhmXiUjg3J9ea4YavkXYPCieLQE+Ncn8=;
 b=C0R3xJKL9YahvgszmJtRMj+wii3u2aBzWzu2+yJGMqoUU8qqumsX5OmeM4264v6pBI
 osbsFnbdEvpkFtrBmAmJi/YdRl3XGX+1FfRioJJVV4/a/HbR8MMpbQaj3xkKdrGmXTR9
 o7xIj2xu/ur65GdFsBQ5xb8q9kDJQoXIdeVYQB1FXA3gUWUz9k3MxeQYm8rGD8+pUYIk
 FK277cN5atDzoIJrHlWzizdZDSz0IAo6L14Ruar3vrAp2BFZuPsn6r3Udd45XJX+MlfO
 R4V2GN9eDl0YDR9MRC070t2t8AFrdGTnjeUphyr9YMWPfum0o2eI2BuNOsc9Z9cO1AL+
 Zq/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+02nx9tPfcPHZQmXZLBgwYSei8TnlfBciEMcY+mLa5WvjlLE3vhD0MY/RYryAEVsTST/ZFFr75ls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbZHECvqKqJ/ECOkvsobsDkpg/G48bX8Xo6utBafP0e70BzSDv
 6uY5RZOlM/XALRDx3Z9z3ASOTMxpyg+Fyw9olFWXAlyzKJ9yPAdic4o5WUjpq6syz6Q=
X-Gm-Gg: ASbGncsIAPo9S6aQzEjrM8dPs7phsymYF0waYLRu8MdjEusAoN0N3CUMGrTt+0hXJbz
 fM9rRU6sOLb5UnO6x/IiWd8T9LkgbFHO/cHl3VyiMzSA8hrIJePDXHXhPgBZEQ+xTsomT6TgUZR
 apgCIiEg2y9/LXwo8Ls3SeWRgcSlUBSsB62npmuVzLjtyzlWuW42FcH2k6FE14sm+nxBLmBc9b/
 TZuX4GuHxbPcvRG1c1O3FtSVgX1y2F0oc5HypmeegPa02u5Xx0Ak1bMAx7FRW0Z8Z3aQTA32fNC
 RZcW3Gi7rx3FZIHygVdmdMFyGd7wVfQyTslnQeMb+Cu0VOyodzyvHAt6QVaLU/8Ozm9qUqTu91Q
 eK3sddgnGrIXQZKwBwps6B1M9yehC8k+Zanxo+/Tw/cQ=
X-Google-Smtp-Source: AGHT+IEQreC1eHGihD2HvGw2z4zkQ8JJctAymKDEGjS+hjYaXiioW7ASwN/QLFRl5DugavcTRyqUkg==
X-Received: by 2002:a05:600c:1548:b0:456:1ab0:d567 with SMTP id
 5b1f17b1804b1-458b69c6b97mr74959325e9.1.1754321579743; 
 Mon, 04 Aug 2025 08:32:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:32:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250724112358.142351-1-colin.i.king@gmail.com>
References: <20250724112358.142351-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/panel: Kconfig: Fix spelling mistake
 "pannel" -> "panel"
Message-Id: <175432157897.3671011.9847593575052354034.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:32:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Jul 2025 12:23:58 +0100, Colin Ian King wrote:
> There is a spelling mistake in the LEDS_BD2606MVV config. Fix it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: Kconfig: Fix spelling mistake "pannel" -> "panel"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/368ea3f33f01b618bd645aa61b673f92e9aae767

-- 
Neil

