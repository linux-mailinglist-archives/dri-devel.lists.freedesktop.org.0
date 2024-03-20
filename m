Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B88809BD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 03:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636DC10F45A;
	Wed, 20 Mar 2024 02:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Idf81iL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010FF10F45A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 02:44:08 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e6afb754fcso5942248b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710902648; x=1711507448;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GfIBZvZR+X0639t+/0R7E3839UBAFzDwhD9FbKyVE5k=;
 b=Idf81iL19+LQPAMNynDBHe0F5FMF3hJdQDI+1W0+ZWwLPVaRrpgzTv2bWCykgupoZB
 ihiTxS7hE5Nx8XwiODTOOTIOdrzwoq+HWqGZjPtnbnU9zTjND9f5h/W2vp4doOPr25D4
 YLLYYpKiEaKl4TEtHmFKGY0hPd+GRpHhIR2ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710902648; x=1711507448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GfIBZvZR+X0639t+/0R7E3839UBAFzDwhD9FbKyVE5k=;
 b=moxdEonbURGnDCmwm2cryIVLFjwnikQw6sjP1HEb5KDgDAcT4ErOte6DqVPs/6vdoa
 S6uY/OeJRHBnYc0cHkQqAnQPUb1bwVxQS24BtXhTfJr5i8sEYQwvbAJfrGw2gqSxJJYY
 r8mcrsB9ili1Q7cj3rfoR1EybkVvnKa484pM0Oz7t1fK6HMmNvoTd4/9oITZUBiQU765
 WcxNqJHJE129srjES9wiAbn1j8wvNkKCkLC1xq7DVanufE7hkwrFgMKdj56x/E1XCb8d
 KasdrXXS/8yNUCW1MrUXeqFHEl05dDTGItV5wmsKy7VkHL1iOfcFKXct/UZrnP1XfAYP
 oySQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpBn/6N3KX2dcOpe+d/oFbo5quHT1K7IVY7m5Cz1t6EJKuNPSRliZmV7cpYGZuBFa2LFzXXTzR5bGZXZ0zRyke+IM0jSAvMzLuE76SxRMb
X-Gm-Message-State: AOJu0YyBAjw/7qD9Enrk3R1m7BxOxvfzQKejyE317LvQtmIXUHli0EaT
 uAou5068mhv68onWrgkwLYvlnvcuj2JaQwUCgReQteCmJQr6TOBZZX9m83EtSg==
X-Google-Smtp-Source: AGHT+IGknCDJeS90RO8ehnRZ7gHMFeBw03OZmeGDsZgVqTGTubjzVOjL99+92Uvx9d7Hh1AaJIztzQ==
X-Received: by 2002:a05:6a00:4609:b0:6e7:3254:a4fd with SMTP id
 ko9-20020a056a00460900b006e73254a4fdmr946741pfb.8.1710902648109; 
 Tue, 19 Mar 2024 19:44:08 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a63f618000000b005e43cb66a7asm9830852pgh.87.2024.03.19.19.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 19:44:07 -0700 (PDT)
Date: Tue, 19 Mar 2024 19:44:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
Message-ID: <202403191944.B66E4853@keescook>
References: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
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

On Mon, Mar 18, 2024 at 11:46:33PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> Let's use the new 2-argument strscpy() which guarantees NUL-termination
> on the destination buffer while also simplifying the syntax. Note that
> strscpy() will not NUL-pad the destination buffer like strncpy() does.
> 
> However, the NUL-padding behavior of strncpy() is not required since
> fbdev is already NUL-allocated from au1200fb_drv_probe() ->
> frameuffer_alloc(), rendering any additional NUL-padding redundant.
> |	p = kzalloc(fb_info_size + size, GFP_KERNEL);
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Yup, looks correct.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
