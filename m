Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B92CC1F82
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43C510E2B0;
	Tue, 16 Dec 2025 10:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K9Dsh+OP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D5610E2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:31:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-477632b0621so31372065e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765881102; x=1766485902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F3GAGvtojXzfrnNDqZPNvA9zvELXurzGXYNSS1JeNU=;
 b=K9Dsh+OPPwlPz5HnE8dhFO45hbOx3CEqCR6tCzDOhtMvTLAyJVzbEhaH/VquGrqVqn
 rpOwpeZ8zBQGqUsumSzJ7ldZcXNhMA1x+UOoZ9jekSbvjOiuTEFrjz48PK5duhWDZr7+
 E3c0HbFcnO4pJz4dENDdQllP0HmzBXB/yuJmNRvKLzZvzW7QZqlN6KbIJksVdGFibd68
 dweQDeIEm0JJXmeNd5QjwQ4Zl51l6VyfuRckmifbvafZKOTvIpjhT7tfbR1zO8gBZn8L
 6ZsyK3VSYziZIzcjLeIQ1KTpuFRprZpKIIVKDFYIfat2893VFJSyWm3hPRaEGAMTYWnX
 u/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765881102; x=1766485902;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5F3GAGvtojXzfrnNDqZPNvA9zvELXurzGXYNSS1JeNU=;
 b=ljIjwyMgRB/6fNy+8+YtgZXNiG1ev1B2ANk3TAr62N4QnkjgZlS6X8rCU60kLTgB3k
 3ErcgHuSXKhUP6Ps64xIQRc6vkhDFdP5jExwWBkwfe8/0z1KEtCZsy3/zFYsF0wUkuXd
 ki8ZmUFP7jxiS3qkd+aDlay0H1Mv981F1jK3+QDM2gEBbSOOctG6AvtFL64ygVbjrV/l
 cNS97nDLp1mgldoZZlcHcz86oReR0Mm343yWeDRv9l42cvnRkdtbZOdgSpXxi4xi8+Xs
 XrST4ZKTQGXpEsesuWCcvtphlj8iZKeCa0yiFGb0Bs0+Pf9pPkTzmiGBmofHzM54P6J0
 ARlw==
X-Gm-Message-State: AOJu0Ywn0iT5Mnf7WpA3cqnw5WpETffkoLvsofuj+sT2O3EXuyDmaLk9
 Uynqogh1ZLHU+AlanfvzsgA8xbJ3XnWE1KixQ2TbO5y+y3TiZruI7jPdxh9VkpADx0ITDaOEoG5
 cBzW+aQU=
X-Gm-Gg: AY/fxX6AQ8H/qRshUn2P7Pktl8gwDLnQjOjaUlB427ZoV80jaalmUFBc16B26/Pipsm
 TLnuamYiYB+16moeV9sdPLTalUAcVBRzyfjJeiI0WSiDtfpW1+AM2ILpYCIdaxa3Kbr76hmDnya
 fO2rhaXs3NpeEV5RWiD72MwlR1s5KC2rFKrPKsBgLGh4pD8ITxvBjwIWGKJpgvY5q3io5A4KFbG
 dSDchGg3yeUxp4CbCntop3pS6wO76LGLcdZ3XvteJUt9oN1O6T/Et3LmFRRym3+e3PHp2BZSxBH
 aXyUGPMEzr8IxmhgfNtm9cq7f2Y6c7NQsqH4A+/ztlPxnC6uLmG9R8c4vsBSbqBNP/uwkdexhOY
 1FzG40gQOWYKuSf6XqqoQnbr6ixkH/W2bV5qNwyALxFCYcrn+hQeZercaIjvQ1OW2w9g02weZIT
 8oXx/hrxsC+eprFQWxz1zt0dhkZ+Rfc4U=
X-Google-Smtp-Source: AGHT+IG84hC2FrP21rLuYsftv8LEMIN2jKOtlRqZbs0BvKeHh9lWYYcuPTMdqRe8uDNf4GyhBem4Mg==
X-Received: by 2002:a05:600c:64c6:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-47a8f89bc56mr152345205e9.4.1765881102116; 
 Tue, 16 Dec 2025 02:31:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd95e0161sm7256525e9.2.2025.12.16.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:31:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Gustavo Padovan <gus@collabora.com>, "kernelci.org bot" <bot@kernelci.org>
In-Reply-To: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
References: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
Message-Id: <176588110109.2282705.4050268532333619476.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:31:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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

On Fri, 17 Oct 2025 10:27:59 +0200, Guido Günther wrote:
> We handle backlight so need that dependency.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2bfca4fe1f36eb6618e5712a8b5b41433bb6f10b

-- 
Neil

