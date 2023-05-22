Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E770CBA6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37A910E390;
	Mon, 22 May 2023 20:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C728210E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:54:51 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2536b4b3398so4201354a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684788891; x=1687380891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuElaN/qDTwisrD4X6pHQNWgjgAbUbIATBdO1zpDRq4=;
 b=MhuIchJoSP3VNW834mCsQH8QhVAtF7Te4uKXeNA+vCPR8uLVLXQlSOUUqmD3FnOyFq
 wSE2ePdtuZfdxWOxnqhyyk5C3i51P5jAWLvfCTqGtZm/Hv6oG/eG7QO1GYOPLQn9IsUF
 ukspP2HSGuGjgrmweUS3CD9/nlMyJ2RKTL4hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684788891; x=1687380891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuElaN/qDTwisrD4X6pHQNWgjgAbUbIATBdO1zpDRq4=;
 b=RCibwC86V0shX6Uemr62V/uW3MocJzH4rgx38pUbp9BSjQXyLrMR2ZFkSKh9HfAbRy
 xUSufEGr51Xxh8dqqOnBSUsgKAfsl1/MCnLTKH3nqXXNrrqSFFnFOF52Kyfhs4oDx/r4
 K52ksvXgIgg+RLMg85Gx1HY1tD7fMXg3t8+Mz0Bs6IV7zn5qMGWkOZg1XYNg+EdOYe9u
 wBdGW7qzmQTC3O555kHrKauIdXcEfZc62rrGszFC5AaJ5AnCjc7Y9itpY4syktJXTL8+
 mOpadr4zrI5YTQGZdKPDNB0owNVkXzwadXzIKB0TWVlqRZ5vZICGLkxx5Gvrdpq4bZAQ
 aymg==
X-Gm-Message-State: AC+VfDyontaiyeW8hQ3KtARuF0Cr84k3e2CofbUJSqhsIoR/8imSXa13
 N+yt+dLtEYsOk0Minv4hiOmhtw==
X-Google-Smtp-Source: ACHHUZ5RojlqCQM3TmsJ+Nx4QRDer9RPXkiS+1C8Bn4fPCBBrUhOW1RX7WMCawCYR7+Mqz7BmU1sxQ==
X-Received: by 2002:a17:90b:3555:b0:253:3b2b:2a3 with SMTP id
 lt21-20020a17090b355500b002533b2b02a3mr10962552pjb.43.1684788891123; 
 Mon, 22 May 2023 13:54:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j3-20020a17090a31c300b0024de39e8746sm6807748pjf.11.2023.05.22.13.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:54:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Xinhui.Pan@amd.com, azeemshaikh38@gmail.com, christian.koenig@amd.com,
 alexander.deucher@amd.com
Subject: Re: [PATCH] drm/radeon: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 13:54:49 -0700
Message-Id: <168478888725.1444594.8281276970110924816.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
References: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:50:32 +0000, Azeem Shaikh wrote:
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

[1/1] drm/radeon: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/76ea3f6ef93f

-- 
Kees Cook

