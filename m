Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D338970CAA3
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF78D10E379;
	Mon, 22 May 2023 20:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108E10E379
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:16:09 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso1848134b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786568; x=1687378568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HzlAGM8RQ6FHyn5tETnI+sMMAIwviCvOlXcFSHD1eAE=;
 b=a4/oSrRQtWRLaqbqVFZWY7qrHna387jLw1QMQLYbleIE1kd7KUiXqNFbF1hj/qyxeL
 u1g/ZpYLS57Lq8SdoOE1vTW6fiOdToSwphBQ415xl1AvhSYo0HTQyvVR5Fe4UifeqLOh
 hGHUHAnxcE/O6kVjnzpWzBPmEl0VRTz/fDV2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786568; x=1687378568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzlAGM8RQ6FHyn5tETnI+sMMAIwviCvOlXcFSHD1eAE=;
 b=jSxn8si4AioGtbFz2JWv6VePiC43pUb3gQ0P+uLVOLYiwN1s1vo+RqMZeRNpZJECs1
 jBsZYX4Vo7Q6CeYSmZMXwqjN8X7k6XgSSmOH2ppF/72GtZTInB8zkg9KoUe/9NAFXvt2
 W/YuulL56OhaTjwDlGPS2/aVBfS6lqdM9vehJFILs12BnspVRupHoPxeq2WdicLkS0Sm
 kBsGZnahEbf0K4AL/vvaftCWZ/rp95bBKeqBetywNeIFYwEcdtbw/EWl43oA0IC186a2
 afeJzJnWeCFxxT+D9PaJaTM7LwQYtjJFFWpJM2aOSAcECnrNuG20MuodLKFloIiRAw5j
 lmOQ==
X-Gm-Message-State: AC+VfDz0MohqXNTqPZUPmWi6g7fChWYTeTR/p2Qaq7O9BmhrXCxKBrz1
 alhpXTpksNptkuVxTmwGtjaf4w==
X-Google-Smtp-Source: ACHHUZ7kSdg7lvscJChRXHco/lZQNRpJ7GeHs3ZD/B6Dkut0O0hFkEBB9llB/7LICw3wA0pe6/GJnA==
X-Received: by 2002:a05:6a20:428f:b0:10b:c843:9522 with SMTP id
 o15-20020a056a20428f00b0010bc8439522mr3203020pzj.20.1684786568532; 
 Mon, 22 May 2023 13:16:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p18-20020aa78612000000b0063b7c42a070sm4508531pfn.68.2023.05.22.13.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:16:07 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Replace all non-returning strlcpy with strscpy
Message-ID: <202305221316.038CDF6B@keescook>
References: <20230522155245.2336818-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155245.2336818-1-azeemshaikh38@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:52:45PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
