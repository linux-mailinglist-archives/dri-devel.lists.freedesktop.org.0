Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E07CEC5D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 01:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86D610E07D;
	Wed, 18 Oct 2023 23:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2EA10E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 23:51:30 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3b2ea7cca04so726383b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697673090; x=1698277890;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ChR10G5D7sRcff6jQpaXKs4y1Q9gyq3SS0kPO+/cx8=;
 b=jgIBe1ahD2w5UAKA5/zCbvv58XaKCthqtDRNLvntBKi/cXNiL3nVUk/Dwyqglydihd
 ywjavv/iHRjoKY+geEOGcvJg4Kr/l7gq+Cs5CaS93rEusmMMAHCN+CHfd6dAEE6JCq1+
 xyl1ngn/ionEItXQDQXhX9xNEiC13yEx17Rhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697673090; x=1698277890;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ChR10G5D7sRcff6jQpaXKs4y1Q9gyq3SS0kPO+/cx8=;
 b=VB1TbrWT1z2k6uo9eMSdW5QjMqWZOCtC/3HNqs5g0JBVmUI6DDda7RfLFGNScNaoFa
 WmRV8SeRbaxUeYiVCmDk1d6XstwroFvNF8ggiodMhtWM6NHIt8+qmBwpgLx2dpA2Myh3
 DFkG5yjpXQSXuKlrlBJh2iKNyFjwBeWIMSaWrox7eSdvFh6D3UQj86ZadqkTnvrNrApR
 GADdFhEsBRn6LequKRChwuxWOJWvPHjaPXyIPuuPQiKYQqgX5Bk7nmfznHQlPuO8C333
 Wkj3AdN2uOOVvs1CA9I7s+osAMbirwGj3JFLeweuXsYSlP7O+X0LP92uIri+XI+jZCce
 rqaA==
X-Gm-Message-State: AOJu0YzioEg0M+rFvqZE2OSG3zBfBnkMsKdEoXmiCUjIXb+/FPqXo5I4
 X2At53CprhenHrXnOOhyG6wwVQ==
X-Google-Smtp-Source: AGHT+IGPt8JkcC74UVt2KOT9gRXdeFP98JOMifoReerDh5QGwGHTdBGZE/K4Tk43G0k5VNDzq/VTPQ==
X-Received: by 2002:a05:6808:7c3:b0:3ae:2024:837b with SMTP id
 f3-20020a05680807c300b003ae2024837bmr695909oij.34.1697673089839; 
 Wed, 18 Oct 2023 16:51:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa7991b000000b006b3dc56c944sm3855850pff.133.2023.10.18.16.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 16:51:29 -0700 (PDT)
Date: Wed, 18 Oct 2023 16:51:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/modes: replace deprecated strncpy with strscpy_pad
Message-ID: <202310181651.E47F9E32@keescook>
References: <20231016-strncpy-drivers-gpu-drm-drm_modes-c-v2-1-d0b60686e1c6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-strncpy-drivers-gpu-drm-drm_modes-c-v2-1-d0b60686e1c6@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Xu Panda <xu.panda@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 10:38:20PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We should NUL-pad as there are full struct copies happening in places:
> |       struct drm_mode_modeinfo umode;
> |
> |       ...
> |               struct drm_property_blob *blob;
> |
> |               drm_mode_convert_to_umode(&umode, mode);
> |               blob = drm_property_create_blob(crtc->dev,
> |                                               sizeof(umode), &umode);
> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees both NUL-termination and NUL-padding on the destination
> buffer.
> 
> Additionally, replace size macro `DRM_DISPLAY_MODE_LEN` with sizeof() to
> more directly tie the maximum buffer size to the destination buffer:
> |       struct drm_display_mode {
> |               ...
> |       	char name[DRM_DISPLAY_MODE_LEN];
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the respin; this looks good to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
