Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11B717141
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9B10E43C;
	Tue, 30 May 2023 23:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC8F10E43A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2563ca70f64so2949850a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487976; x=1688079976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIZITtN2bKn4epnZA2aYk+MPyTdtLfd4FD17Mvvuc+s=;
 b=c0hOeQpScZnxVdLys+GcGo36POTD+McxKYLKI2O2AJP93Y+cMku8bLaYjilcymC99G
 ajnfrL573vrFpsgBn7xnJi1Eb3TQetX1BSBfOMfUoZh6xoPjFrnTrPTojvFJxekXH0/k
 AkrK5vEFS4WJq6XtyNCJ0ZQBHeoQmBD8CIPWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487976; x=1688079976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIZITtN2bKn4epnZA2aYk+MPyTdtLfd4FD17Mvvuc+s=;
 b=ETPLgu0GSjVhxtaDccO3beS5ue8PVjBW+qwsWUVDGwcAYH9t5goAeDx1l0mGy2kXR0
 mh+Ti3yahNnH+gbtFcCBwed7iaCSk/kFlc5IBPVZNbaFroGQVC6uF1b2o+pKK12z4y6l
 SuZHNHbX/yj+0S5cFEeH5S9WVxgV4+KZLOrpvhqDLyZK8jLdBEDgkkHBMeGcSYGbAGLI
 llfOuFwCELX3fdhujp1oxJVayTHrmjRyeFsaRm0GsCeuLEzfq4CTEli40F21o1Il1i+Z
 JYv7MGLq8g1zHCKalmQGLoYFgKkSgfbgOxYm4Vq3ItdDX6A8TdqSsTUuGAEYo5GVo14g
 80VQ==
X-Gm-Message-State: AC+VfDz7eon7qf/Xw/bn1TaCFIzKH2yYdy0zRHaFi5z/nRam9saPfa/7
 DsfSo5kQxjTjJ8IpFh/CkrMBKA==
X-Google-Smtp-Source: ACHHUZ5jQFK+2MaC3xETbHHaMeqzbXfvABdTY+M1OZIR00QqD/GOmMTju4UsQ3310f7NZCUs1aUCcA==
X-Received: by 2002:a17:90b:3908:b0:255:c461:6405 with SMTP id
 ob8-20020a17090b390800b00255c4616405mr3924044pjb.15.1685487976005; 
 Tue, 30 May 2023 16:06:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 e8-20020a17090a77c800b0025695b06decsm3351803pjs.31.2023.05.30.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:06:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux@armlinux.org.uk,
	azeemshaikh38@gmail.com
Subject: Re: [PATCH] drm/i2c: tda998x: Replace all non-returning strlcpy with
 strscpy
Date: Tue, 30 May 2023 16:06:02 -0700
Message-Id: <168548796309.1350188.15805729218836239223.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
References: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:53:50 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/a7aba6fa2750

-- 
Kees Cook

