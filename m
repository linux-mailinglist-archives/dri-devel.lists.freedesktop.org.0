Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42946CC1F31
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D4B10E6DE;
	Tue, 16 Dec 2025 10:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wFXx7J9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2210E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:23:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so23177185e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880588; x=1766485388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NX/BjIYz9x7aAJdudv3dAY9wtSDhtVkvwARFOcwrepA=;
 b=wFXx7J9ccQXkTKlGSTOszPRsj1G/h9Rpe9LA4EOdx/YgbuxS0j3hUttFY0Ees8RQy/
 17LQGBGjKR9HIauFOJrAC0tPhDry8870WsFTW+WoPGgFznEmB5k5v6Szr7oyYU/3Qm8J
 chvlzZL7lo0jEYNc9qIzyn7YilEHTF7bb+ipQdov6NebB0E2lsYygixGRQ76Jm1OLTNO
 p3+TASwyyyyiE7k0aZ+yvnzN7G1FsB0SxnVtVnFyMYqOfhcDxZVXzeNGgnDNsHWf4XeT
 cKcb++PdEfkIeiw4oMakE7NpRE9I3H4XQGTPGwUG/SbrWXK86R8ituwjzAUNG7RHUrcf
 BeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880588; x=1766485388;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NX/BjIYz9x7aAJdudv3dAY9wtSDhtVkvwARFOcwrepA=;
 b=jvDZrplWJvfIOjnfyZrBn/rxhQwDgUfk/PNoCxFIJKFUv4i01txImrw2UStV0SbONf
 uf5gTUfYlG4MT3LWfrTv9P9lla64lPomay3FGHX7qRH819eF+2p+BqMVo/dI/SG25JTZ
 KbU847Wctka/hwhi/s5d8Dgcr/UTVYTc8Wbc7PTmyzEB3zqIbnZ7/Qioy97G1kZ7X6ET
 rYux93m6UrXbuirwTsq7rnkbFgROzPuwUNuMWX15Jxr42doGQyu93YshH2nSs/BDLBL/
 mPsczb+g95G4yEW34mdoREikPZVMyqCmpmkPWMA8lx+8aCDjCf1YZy+oTIK8AA9Yf4V1
 uqHQ==
X-Gm-Message-State: AOJu0YxbnVM/QOquGABsXgxKfSnLNBLvBRpFfJyWEb/wZy6BEfmtBSHA
 KJkdPpc2DR6+LhznBxHSJ7CoK/zcjL1sZPdJ2lG1FSUy5WJlASpf4SJoCGQcK/Y0jMA=
X-Gm-Gg: AY/fxX43r0bjBCQ7tuwEzXm627Y+YrJ393OlzOX9MEJVWFvYrSnp4ZwxqHNk7qvLumY
 3QMxE1bpKm+Ipze4oYNR/B7XybfvN/7AV51Sbkl0JhWqr4XFy5Xmuw0eXHyl/GnxhxPMnw+uPqm
 zKiVTsuWsqPbARDBPapnCWSQidwaTL7sUB22jQTdLhCnzZ7XK8y2ozwOxOswf5MEvs6RPYPBUdx
 ZcPsKIk6qq2PwK78vAW1HYngCyYeu/PPVZhxOUFe3/Mau9vsyW44xKcw7GAqkgHCZsKhiE4jKh9
 WM4kejE3frZBRe3gkYx95gdJQvMRNTO2EuSW1tghWX6TPLIceamNysrhZ0VCwT/rcrNtC4ZdsXE
 /XZ4rUMxII0rHk802jjx+YUXZcx6vI51fg439Qm/gMzm+9o7Gl7X4OhBPvzIAZBmUO+dk0YFHAC
 /7WIY9yYrU5kARSJxJXN4GQAEjNdM7tyc=
X-Google-Smtp-Source: AGHT+IGiEubYcTgOYBi8mqSAy1isygDjzTiDJgnd7uGUl77AkoVoZN4wTT6z/CWXEpGiH8gd5MBpTg==
X-Received: by 2002:a05:600c:6290:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-47a8f8cdc9dmr134843895e9.14.1765880587826; 
 Tue, 16 Dec 2025 02:23:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:23:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251106-dt-s6e3fc2x01-v2-1-deb87727152e@ixit.cz>
References: <20251106-dt-s6e3fc2x01-v2-1-deb87727152e@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: panel: s6e3fc2x01: Sort and remove
 unnecessary properties
Message-Id: <176588058666.2230787.17118306826413529829.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:06 +0100
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

On Thu, 06 Nov 2025 11:53:40 +0100, David Heidelberg wrote:
> Properties are now sorted, reset-gpio and port property dropped because
> they are already accepted here as part of panel-common and usage of
> unevaluatedProperties.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: panel: s6e3fc2x01: Sort and remove unnecessary properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2c96689038aeea99c18a95b66dd5a171a07eaab2

-- 
Neil

