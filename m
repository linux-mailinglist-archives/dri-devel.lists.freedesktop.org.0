Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914141A130
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9B6E865;
	Mon, 27 Sep 2021 21:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B386E861
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 21:09:36 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 e19-20020a4a7353000000b002b5a2c0d2b8so2145489oof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
 b=QXoqixS9dSwgotQCR4tPOH2boVVWjkQ9G/7fRvVPwOODbCs72HTY16UDes5QZRApcH
 KpzoIV+7PFON62nO10VhOP3msaqlF2KOpIyzg8TyhBSU5ysGfhzrSAtrTmwwNlYPKVP7
 SXcSfXUWpQz0lHdH1A4JuyE2FlzoL4tlEyHcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
 b=BpVOgGQcKJJ7ozdA4G3s1VPTH4XFeUJA33rMpg01jYPMGygaBwFxSfmJAv7dGzzARw
 LRAnanhxMVFTO28Fv0hGLY+uMeO3ER9jZAVDCktd1UGc77V+zzcae7jJkeDUoChtCyzZ
 pcg2ZDNsDlpMIZmNtYEyDTm4NhGStCc+BwBgbTiNgl8jpzfxD7//g9iYsmhSKSMw8Dx0
 Su62QPvEmUsKB294Uf3kY0czpueetffHr5ntGExi0yH118SS1+MW0D4CZ2SN8LI7Je5z
 5Z31WEcHvWxnX/HtwCXNe+Sna+K/ZMyYEIuHiNbIxHgdI9jL7Fvxll3OevdF4i1sQg/T
 WFPQ==
X-Gm-Message-State: AOAM532T4OtVFIvnE9IylOtQBb91MDK81QaVO97um0ipvNrdthLpLxHg
 8jyEXiA+XOQV2tpNn3FR86g3jFF/hFT1FJMThYaPnWpTrL4=
X-Google-Smtp-Source: ABdhPJwsE/D0A4gu7LK9Uo5aq776hYHg6zVFtNMjoHs4nXxtn9C+5PEy6DETLnx3RKhAzWNHPiAUZenoQ4MczmEq2U8=
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr1747622ooq.8.1632776975637;
 Mon, 27 Sep 2021 14:09:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 14:09:35 -0700
MIME-Version: 1.0
In-Reply-To: <20210927113632.3849987-1-arnd@kernel.org>
References: <20210927113632.3849987-1-arnd@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 27 Sep 2021 14:09:35 -0700
Message-ID: <CAE-0n52=yYW6SuMUPwGiv374K7D6DDpOZdJUudHdhMa7x2p1CA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/submit: fix overflow check on 64-bit architectures
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

Quoting Arnd Bergmann (2021-09-27 04:36:23)
> From: Arnd Bergmann <arnd@arndb.de>
>
> The overflow check does causes a warning from clang-14 when 'sz' is a type
> that is smaller than size_t:
>
> drivers/gpu/drm/msm/msm_gem_submit.c:217:10: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (sz == SIZE_MAX) {
>
> Change the type accordingly.
>
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
