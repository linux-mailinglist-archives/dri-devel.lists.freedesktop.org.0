Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE471713D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90D810E437;
	Tue, 30 May 2023 23:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8B10E437
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:13 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b038064d97so2692315ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487972; x=1688079972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmRWiU8SYa7qmzcA6BuCFr6v3g/uip8NyNgDQrX+Fjc=;
 b=jNd1r7EdeRMW5RqgAY4YmvOndWy9qNNwSgXuxU0T+cjCG0FdVF31XHiBuwbn0+KRdG
 o8GLIYyhUGys5Ms9TCU4yiY3riv8HwZgCBsNs8BOqRCLxYaCzBXFBgABRh9o7YYSVO93
 rZGhtzbENiSmVFKKEjkFoXJfo6S3aiCl92P9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487972; x=1688079972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LmRWiU8SYa7qmzcA6BuCFr6v3g/uip8NyNgDQrX+Fjc=;
 b=c1tKovaVu4V5766BgjORXr/Jr/U2xrVnokKwx9l2lTtLeavPEb7ww/nRrQczPW+vOG
 U4eMo0lIyeuHAFPGysMz+wpjv2P00u6wNExfBwgrr2b6aQ2PNTu+TnH3HGxYQWssLX83
 qy8Iff7sDdO6dBazyhBNnz95yOmx2pmd1HKyyG/46J+E/TEEG/gEKqklq5ZSp/Bsdhcv
 bh2x9R3aU71qCL3blvjrnlj2FNOiNmORfFmEUEotYzCMrXF+rRhTGB4oJbsrG8qJa7jq
 uSbATWxy6l4vIoAZWF2ye/hXf4GRTkGGKZ56Y7ST7lw+2Li9ew7orZt3vdS+ZmyBEJKO
 oI2Q==
X-Gm-Message-State: AC+VfDwZdOIhCLbWGQUqb0qKicvr7NUDerVDdgG41r6ducGy9T1XExsn
 bMddhKAm7CSTCs/Xxl2FWAPjaQ==
X-Google-Smtp-Source: ACHHUZ5fqZh5pSU+w6W+/GY6NcvobRUfpGpThn0wcJW908lMOgIGH5bJ90CYchgBaG9eKril1P2p3w==
X-Received: by 2002:a17:903:32cb:b0:1b0:4a2:5928 with SMTP id
 i11-20020a17090332cb00b001b004a25928mr14842770plr.8.1685487972713; 
 Tue, 30 May 2023 16:06:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902b68200b001ac8218ddb7sm10781022pls.84.2023.05.30.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: tzimmermann@suse.de, azeemshaikh38@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH] drm/display/dp_mst: Replace all non-returning strlcpy
 with strscpy
Date: Tue, 30 May 2023 16:06:01 -0700
Message-Id: <168548796305.1350188.17508138666156714348.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155124.2336545-1-azeemshaikh38@gmail.com>
References: <20230522155124.2336545-1-azeemshaikh38@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, jani.nikula@intel.com, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Wayne.Lin@amd.com, alexander.deucher@amd.com,
 khaled.almahallawy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:51:24 +0000, Azeem Shaikh wrote:
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

[1/1] drm/display/dp_mst: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/09c8ecb20243

-- 
Kees Cook

