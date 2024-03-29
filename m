Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92289124E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 05:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618CD10E010;
	Fri, 29 Mar 2024 04:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JaY6Oyq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B303710E010
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 04:07:29 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e0000cdf99so14272905ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 21:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711685189; x=1712289989;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x+IKl5jgXsGZi0mbCPhq9hLR3oi5JgzC/vagz7Y/keo=;
 b=JaY6Oyq2ePyvvpXS18G4OsM7HyeA05N9j/cd4EcjiRzdpqhttGzZtK328rvrfu17zY
 HYiYejcvz+fM2/fArQcEi1uSr7BvqfklVKP2F193CLcDwoUOklybFOyntOpvDW/TlM4N
 tb8J91FIc/bcfzlWGib1B57EtUonyT0DU90VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711685189; x=1712289989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+IKl5jgXsGZi0mbCPhq9hLR3oi5JgzC/vagz7Y/keo=;
 b=cRN58nC+5yzA7Icrrd+FbjIA3dJbLeNCtTpt7zQJ0bvY0nwcoxoK8Bw5mam9G2r9bg
 SGBJ4rB38QJzlLjj/nxPYkXKEvKp8uT9YnfgARrssbQnIAy0lvRXO72J5RI2uIBfACAH
 FfhNtX1/vEl+yxqQX/QeSnieKdjjCuENEqV0vIApOPbuxZXk+/rDTeTj3NWh1oMy8MMb
 WDSc8PeOiRvFDzKz70snMtn/+xxtB6ceCncCS4bOlYru6gzBYHIuOnOUJ7FInKpVj6cm
 GI87nP6UKUfbyQ9Lk9HZxv9EiDK1bII8D1r0s2zoRWMbqEw2hWrNa4t8Da2rxvOphKe9
 wspA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTioIak//19HMxJZUhJjHsCc5uynMl/l3jqgy2HgqlYacNfL6oqg+X3LQI1QT6oU665WylFVDjZUONADXpi6TPtf7h7jJDj8YjaxGHFFnf
X-Gm-Message-State: AOJu0YzMua9NNyd20ToTGjWnN7i7E1l4iH+tPALKIVf/l604xcOZ7rhE
 lHveXXx5aiuqrkZcqutCxGHLOteIfqDJ8xtI29crlapKeIbznJ2kTrQ7HpCOyw==
X-Google-Smtp-Source: AGHT+IExHIZRx4aycuBDHgCgeixTvQb45vK5L7KK3PjbTyeTfdK0wlFMrkIFG+tcak2Z0aNtfOlnQw==
X-Received: by 2002:a17:902:ec81:b0:1e0:58e:88a8 with SMTP id
 x1-20020a170902ec8100b001e0058e88a8mr1776848plg.52.1711685189298; 
 Thu, 28 Mar 2024 21:06:29 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170903124500b001db9e12cd62sm2470242plh.10.2024.03.28.21.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 21:06:28 -0700 (PDT)
Date: Thu, 28 Mar 2024 21:06:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Timur Tabi <timur@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: fsl-diu-fb: replace deprecated strncpy
 with strscpy_pad
Message-ID: <202403282106.4D3757F@keescook>
References: <20240320-strncpy-drivers-video-fbdev-fsl-diu-fb-c-v1-1-3cd3c012fa8c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320-strncpy-drivers-video-fbdev-fsl-diu-fb-c-v1-1-3cd3c012fa8c@google.com>
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

On Wed, Mar 20, 2024 at 10:48:50PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> A better alternative is strscpy() as it guarantees NUL-termination on
> the destination buffer.
> 
> Since we are eventually copying over to userspace, let's ensure we
> NUL-pad the destination buffer by using the pad variant of strscpy.
> - core/fb_chrdev.c:
> 234 |	err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));
> 
> Furthermore, we can use the new 2-argument variants of strscpy() and
> strscpy_pad() introduced by Commit e6584c3964f2f ("string: Allow
> 2-argument strscpy()") to simplify the syntax even more.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
