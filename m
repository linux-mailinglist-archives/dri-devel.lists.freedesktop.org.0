Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0681C1D586
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B52110E84D;
	Wed, 29 Oct 2025 21:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G0jbxrkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E432410E84B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4285169c005so184020f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771937; x=1762376737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KaZEH0yhNHb6AZuGMp444IQPM11zRvvtSXK46Sjp70E=;
 b=G0jbxrkUD2o2KXFGZtzblzhLaMDlz9Qf3uGln+SouuTH8Nv5QpG74+iqdDwMB+C4Vy
 VSA4P2rGb3YwmEBxi1YKAKqbFDM7JcQ2I5RhNwPfeYbqaauvJX23+29VSv5bh6TkkajE
 xFYiD3vWQwm/YyT4BRgvzEPDhkL5vAuRNW35LLnHc1kpHdgt7Xl+nlsGBc2PAIDv6YLT
 BHLYGgr3HUbFR4JWbGIZS++D6J3yy7KCLUHAONpoeB3Ly5t+5vXzw5SGcf+CHLI/IMkk
 FUrUof6fxkIPkvtDogHTG3xiSgGTxR22kX4eCPR5UY9+WL69A9AOYGzVIpo8vr0k1wRo
 PiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771937; x=1762376737;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KaZEH0yhNHb6AZuGMp444IQPM11zRvvtSXK46Sjp70E=;
 b=bQyfycRPKj8VzI/D1ZZMl1q555jb9DCcg5o9DazE3v3yEI8Sh5BhF1XZnQvt4g12s7
 Ko2SxSqkylCuTihodiVMaDsvh6jCPCr+xFIZM9kcfk6C1vLlUbcEBKCyXKqr0T7PvL/t
 PZh6CjQXDrAxo5cFL6DqB2ldr5LE8AsN9xeZYooTjxTu/hV0cp6GrsI3z/FspDbJs9mO
 tRZ5hP4Qd6x1C0BmtZFWZCDYnrmpvjvgrKlrzC9/EIQzlRVFiQQ+0iwLKXqFVqNEcvOa
 hEnP/AzFbbXCbJ4rdcWTSoiifXnWUcELt7rX57SZdb5hyam7naMEAqITrunwzZ4uuEUV
 RQ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcYIdFumsDSrSi7u9N2NQSvFIoBG/wLGf/ZYw4HqCnzo/TVk4Uhsr02XQy6+ft5s/3BAdvQiUjMoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKFSz86OLnJjFT1e+nCbUJupSKeAWA4stZZEzu6DqpCZpaPKuP
 j3tqxQx+aq3+LgqXtoW9CApadC18HPsI08dRFt0Hinj7c1i2+q509Rptuio5M58iq2dedEOMQxu
 f9mzH
X-Gm-Gg: ASbGncukOaACzqzJu18LFrBBBrmuvNE8py+wc4Q2KRVJmZIITv/hL+9h6BxEZsvhTXg
 YptJHOUGiE5okDChV8Vlvd4rSAyEDYoH6iD1/0FyZdDUxP3qvdY50yZwcY/YTQhlPp9SWuUgGYw
 vrbxOqAcYhVf6cOiU4Xr39VysWsMzGdnCnekeLlIhgAuhtFIjadxYUhaqMcXWwGi3c0sGBBtBYy
 GLYv7DbZXmy2CcfJBKFl5j4fSzRrbWKgz4PpqWRR/EM/kjHX5mASTRMpWkb7ikNl+2JREvrTR+f
 FrIndYPtikpXOfgZazrUukAdbeQrVac3hyRGHSuWCDDjXcpIMichaNpt2ayWoXZlCqtpJMPbq22
 og/ke5WE0nAp7JVmEH2SI1DwxoHe8lQZ4x5aAqG/0UCSuQcQ1+UJyCHiq1Ynbz+BKfbw7AIsMRr
 WMWlUnGwZm28bcH9n5fh66
X-Google-Smtp-Source: AGHT+IHhwfeUBtBxW50VBHrS7NUwmZJ+MJHKstiaDt5zo7z8vEMuNxb43BjkmGAxCqpZCv4tJ3jB8A==
X-Received: by 2002:a05:6000:2282:b0:428:4354:aa27 with SMTP id
 ffacd0b85a97d-429aefc9a12mr3241114f8f.46.1761771937287; 
 Wed, 29 Oct 2025 14:05:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Priit Laes <plaes@plaes.org>
Cc: John Watts <contact@jookia.org>, Ryan Walklin <ryan@testtoast.com>, 
 Christophe Branchereau <cbranchereau@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619132211.556027-1-plaes@plaes.org>
References: <20250619132211.556027-1-plaes@plaes.org>
Subject: Re: [PATCH] drm/panel: nv3052c: Reduce duplication of init sequences
Message-Id: <176177193662.2073083.2838618250714859498.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Thu, 19 Jun 2025 16:22:09 +0300, Priit Laes wrote:
> Although there are various small changes between the init
> sequences, the second half is common for all 3 currently
> supported displays.
> 
> Note that this is only compile-tested.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: nv3052c: Reduce duplication of init sequences
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b21c47d71bc321785d61e6649bf1992ff157514d

-- 
Neil

