Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8670CAA9
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A49210E37B;
	Mon, 22 May 2023 20:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79D10E37B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:16:26 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ae875bf125so24602665ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786586; x=1687378586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tk3bD9idbrl9PK1wi5VEyItHEpJJoo8tWtDD672a6E=;
 b=CLjZcbeeJRsWfyBj8z/QVwLw/ENfE5+A1dPkMRNzX87xKEByhVIPvwWqQm4vMwpfHx
 LkuslqD3tJGP5ZErdH8X4BGmRzZsFV6FOZtqvKaAwxu+bJS4PEowjRWKQf08zVeZOnNS
 nCUd+51z44rEqWO2oc6lzbzLBxNDbL4CuXt+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786586; x=1687378586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Tk3bD9idbrl9PK1wi5VEyItHEpJJoo8tWtDD672a6E=;
 b=gZ8uaTKggyGVK6p7sxWkwggaNQhQsrLbNE5FSq6Fgx+0nzwJBqW4iZ8IV0++OerkLa
 hP6pmZaWB/sU3Z0OOnOp3HBXRbitc0uAHJX+7GlDJRCzyJoyeBsVY8UPCKUQVeMnn49e
 z4XwjO+9Rjuvdspn68CTe0PC/9raV4I99dshHJzegAVq7LkDXfn3M0SQz6e/gOAkUqPq
 1cXe9hefV0qYOzdertx6LLnHXU89Af5pGH817DlyHVxI0Z2J0LMumMZZANUubFe3CbM8
 WZbojPA3uImVbL/09KNAC+2th7RbOONd3Fz7vG1zcsr6Luk3GISxwJjIY0UnoEse3WUv
 s26w==
X-Gm-Message-State: AC+VfDxaRvAM4OfQck2LlQg7g1U/61pQRep/vcxMvmDYzfknriXGskgf
 qCuPI8Z9JjyWza+onNKQALtbJQ==
X-Google-Smtp-Source: ACHHUZ6BuhhlrdHXweBhtsG3t4yfH689XOUIExdIl9faSWmma0pPdymM3tTUL/dYHxtJKYUa0AJF+w==
X-Received: by 2002:a17:902:ec86:b0:1a6:a8e5:9240 with SMTP id
 x6-20020a170902ec8600b001a6a8e59240mr13889786plg.4.1684786585815; 
 Mon, 22 May 2023 13:16:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902f68600b001ab2b415bdbsm5247910plg.45.2023.05.22.13.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:16:25 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/i2c: tda998x: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221316.C0D13F1@keescook>
References: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:53:50PM +0000, Azeem Shaikh wrote:
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
