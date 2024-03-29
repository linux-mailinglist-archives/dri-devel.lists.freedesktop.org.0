Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D61C89124C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 05:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B71310ED27;
	Fri, 29 Mar 2024 04:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YFdNC12F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF13410E879
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 04:06:34 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6e8f765146fso1426339b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 21:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711685131; x=1712289931;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+BfIDju2MLKQM1ZH/SmKqeg1WOOWWWQIwZEViiqCej8=;
 b=YFdNC12F+aXSxy7W2wSm0RQI3KKjplyT7WalCUFX15zuYjXk4DN9EGmfDeiuTw12Tp
 bkW77yEqdN+0BzDqbiV/78ag5Q5/Xw4qYbiWQ+p225k8i+ZnmkVGFaVI2p3XwwVtDSre
 J8n+b3CN+jsjljCXfy49H5RL5LQihZMb7SX2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711685131; x=1712289931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BfIDju2MLKQM1ZH/SmKqeg1WOOWWWQIwZEViiqCej8=;
 b=YnDjTOEgBxU3rP76GHCiaLOq+5ER7TqeSRbU6/87NoJs3Sy3s/vvsUSfiwA+uNB4o9
 uIdcs9airU8p3hrxotaPGJKm4EjSSoaM1i+32wUD5BmINOSAshxVq2wcOPJPlZC57SP2
 3de4bSGGLK62wuEm2QmtoAa4dkO3wXummmNqdEO5kE4D9Srsc7hW+i7iihwWUGFuc6TS
 iJDLySWPMm7znHAP0JG+X9b1gCMVOwf1A/zTtoHXySdUJK3VtmRFgC7R3Tj+xPyP7hS4
 jTB0ujmGa/W6c82csP2B1HeL2zUPU0ppqQHsRie6Ozkl6GRrh/QWUUjX/oYmUc0JV+fR
 EOCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXg2eXgKbXVOKrPgrKiRmZl6shUa7eJ5GP7zodfcoVMWwE3gP0AcYZMwlHkPXm1Zm9r8pUK9fSd0iY4y2BAwzGSb4MKJvkKn7uDO2piUX2
X-Gm-Message-State: AOJu0YzKCKPR2abblA4syMQnAsawOGXc/nWaxuXGAQnlkbv9r0f79x69
 TxE5iKJiADnWn8KaPhpy0Q3R6QoaAB4PK0ttMpXX7e6SDx0LIZl1eqr+ORK1Bdybnw5PAqr5+b8
 =
X-Google-Smtp-Source: AGHT+IGaCxTi+p1S4dkJyCaFZHFw9yFwUBwZuRqfcbEkvFu2SFjTbyW2QlP06JR8Bm5kBsLChpFcuQ==
X-Received: by 2002:a05:6a20:d396:b0:1a3:aea1:bc7d with SMTP id
 iq22-20020a056a20d39600b001a3aea1bc7dmr1177152pzb.30.1711685130989; 
 Thu, 28 Mar 2024 21:05:30 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ce8f00b001e0fcf995easm2458362plg.202.2024.03.28.21.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 21:05:30 -0700 (PDT)
Date: Thu, 28 Mar 2024 21:05:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] fbdev: uvesafb: replace deprecated strncpy with
 strscpy_pad
Message-ID: <202403282105.574E19BFA@keescook>
References: <20240320-strncpy-drivers-video-fbdev-uvesafb-c-v1-1-fd6af3766c80@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320-strncpy-drivers-video-fbdev-uvesafb-c-v1-1-fd6af3766c80@google.com>
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

On Wed, Mar 20, 2024 at 11:04:44PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We expect v86d_path to be NUL-terminated based on its use with the
> C-string format specifier in printf-likes:
> |	pr_err("failed to execute %s\n", v86d_path);
> and
> |	return snprintf(buf, PAGE_SIZE, "%s\n", v86d_path);
> 
> Let's also opt to pad v86d_path since it may get used in and around
> userspace:
> |	return call_usermodehelper(v86d_path, argv, envp, UMH_WAIT_PROC);
> 
> Considering the above, strscpy_pad() is the best replacement as it
> guarantees both NUL-termination and NUL-padding on the destination
> buffer.
> 
> Note that this patch relies on the _new_ 2-argument versions of
> strscpy() and strscpy_pad() introduced in Commit e6584c3964f2f ("string:
> Allow 2-argument strscpy()").
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
