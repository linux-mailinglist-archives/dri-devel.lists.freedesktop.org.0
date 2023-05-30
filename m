Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428D71713F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31B110E43B;
	Tue, 30 May 2023 23:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC010E437
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-53487355877so3249586a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487974; x=1688079974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSt3Az2tny3eQlaVqB2zu16ttm63V7AZ7el7ka8wKXU=;
 b=X9z9+aQDWH74vRy4IFplfW22Zx5BEwKFKnlpZHyhVJxEScox69ft1HKu2FLKLcSrge
 Vd01P1Id4crkK4Hcd6tBX8pKrEOECwVQjb9ZktMnA4BEPLyas9jK1raP4sSjp79/Qxz0
 LeIwDXRtXCqgbmHoSHUaf6xq8WrxB3sDiqNBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487974; x=1688079974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSt3Az2tny3eQlaVqB2zu16ttm63V7AZ7el7ka8wKXU=;
 b=FTbyz+p0+RvvEV/QCdPLWUcoaNjQ91wFZxdBYsIYlefrKrkz9LZHuphF7HikvxUEyG
 QnTyRd2zqOnAI9tIkf0NydsGbk2mcBqAEmKJOK0/5RZpZ/L5y0FKJg56o/q1r+mer9zv
 ixXtEc27+hmkxwpNEDwUjZ62m6RbQHsI2nMNgKBHYDfPxB/d2dTfkrWtx6pCYocQefZ+
 ZGLyK5OjWsGbR8/h73tsFXuF96Du7nVrpwy5lBZSYnwDrGbDhrf1EuUe9CnC6rxKrZow
 LWG3T1rlmnJ9YLKNDutclpuA1AJAjEjRU5itI6ujJqllZUof41WLLWNOm7NZNAg8o1i8
 ehXg==
X-Gm-Message-State: AC+VfDzKsGWpt5aL0/dpuimWATq7Kbvet5oli0UIPM9f3+iMaTCP1bTv
 pyNy5bdxzdKlxJL3xcxqq581rg==
X-Google-Smtp-Source: ACHHUZ5RyXdOh/r8J51+MHLiWlyfvyIhJb8ljPwpidWRnHRRfPfGJtDpjXj925079sXa9tjNwK9UlA==
X-Received: by 2002:a17:903:2303:b0:1b0:7739:657a with SMTP id
 d3-20020a170903230300b001b07739657amr1763269plh.50.1685487974391; 
 Tue, 30 May 2023 16:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 t4-20020a170902b20400b001a6b2813c13sm10810243plr.172.2023.05.30.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	mripard@kernel.org,
	wens@csie.org
Subject: Re: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with
 strscpy
Date: Tue, 30 May 2023 16:06:05 -0700
Message-Id: <168548796308.1350188.7857893772168629136.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
References: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-hardening@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:53:31 +0000, Azeem Shaikh wrote:
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

[1/1] drm/sun4i: hdmi: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/6036094a9380

-- 
Kees Cook

