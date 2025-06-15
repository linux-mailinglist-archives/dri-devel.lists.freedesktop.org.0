Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E0ADA14D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 10:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ABB10E00F;
	Sun, 15 Jun 2025 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K89nwRLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6331E10E00F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 08:30:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-453066fad06so25576565e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749976205; x=1750581005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KuGogJWPapQAin3rE54hpggnDxcNPZWyx9aIMxHutdg=;
 b=K89nwRLUW3wqLG1Q/+zMQMoy7QYAAouRs3rWyyC5L4K9+ZUONVkJ/bSCIPyL/dGbjy
 48YjtySPNswh/sW45choTHlCS1NXNPHH+1MK48a2gk9Q9o58GOIoaXUWsnIYkNtkz3GQ
 2fR4yrHRBdPUW1bXmGtLakXsWxfuD1VPLT2ly1JWg3iXZXMHIQRuI5i4ahaxDKoumoKr
 Gk0npoQzT+w1hmSl4rD6gHq2vf6vUsPri63uH0niBoOnXKsHA2XuIeK4iRn3ADRG6n+/
 IVdUWnc8/j5y3NVUF9DvI/OAZkaB7pW3PXPoYhvPjduSHqCOndIsN+l30pUkI7zDEGOA
 mGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749976205; x=1750581005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KuGogJWPapQAin3rE54hpggnDxcNPZWyx9aIMxHutdg=;
 b=rE5ShFxrWwNBCsUwTuA+cVAkDO1FsBBX67IoeKgH9zkI7mDGOF8JcZBscJd1m8QkNI
 uUv9qnqVcREVmg7fhybsnEDnD7J2QGHFp6cNExk06pCyX3WQMYqRMqWb/whCNwaoMrm8
 uEXMRt1s6QeCglYsf9VU77DP7oLzDqxYTrMYe72pTxKKEaEJopCc4wezFrXbN2+tJuS1
 7XuYqtL2jafpCM0OjAbm4QsQEsbska2j5+LmwtXc7ybmU87ji7tBrbfnVzmOTdPa7FkK
 D9xdWK+/myiED7JVyiiQePe3GQAbIieWQMm4RZFcLjzSyhSvQ8SHkyMl9KB32DBRoKNU
 /z4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqm3+IRF6ScN7dnrRuVKMdI48PaT1P6aRBBom8FJnhQYih4u2qZA2D254LqmexPL8QQIruxr5MgF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKuNMmoErjJZLvNNJ2zMpzEZVZ3PyhNkSoEesnaU8O65Qp5nQa
 MmumzaCKB9EyK8vzEpJX00cE6+UUoa1Ou5KajwC4rKilSC0moMCMCUUf
X-Gm-Gg: ASbGnctgZj+XpXID88xczEZBdKFoyGBS7nLe1Gw/i99s9+fVu4HKBBfGwa5l/GuBucJ
 DTsSJRwT4cP8thwRIR7JMjAEEya6zXs1WmfoaHsM2nS+vvNLf29VBnoa6UAlQUPl7GHaJjinDR8
 9fpkBhgAxpf5pg88HwHJW5WKLTuF+opygW4uRMUYh/lwRrFS9Q1BSzgYt0iKJqPy7HTDLAJkjQ6
 GhpV6YfuGLqcevNVuv45ykrhX7rfe7B6fc6fAUwZO81aOxQS+SoqHlZWfjzO8oS9onbbBP/pVeU
 Ear56rU0aM6/VJ5OBY0x+U/dCMWbqsGvLV0apu0oHTnIfalym9iZsFnR0sCAxKxsilWhlutlhqI
 P3Hp9OKje9W839/xBf2GhxVhV+r5ruDRRguE=
X-Google-Smtp-Source: AGHT+IF9OW8znz+iOjoEakb1HbIdI1Ooss/XHYANejVTvB7P2jZm+Zdxdus6R8/hV1XuZzKcerkp/w==
X-Received: by 2002:a05:600c:6989:b0:453:9b3:5b65 with SMTP id
 5b1f17b1804b1-4533ca502ecmr51592035e9.8.1749976205278; 
 Sun, 15 Jun 2025 01:30:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4534172d2b0sm32503735e9.35.2025.06.15.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 01:30:05 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:30:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alex Guo <alexguo1023@gmail.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: i740: Fix potential divide by zero
Message-ID: <20250615093003.6e524fa9@pumpkin>
In-Reply-To: <20250614051837.3544959-1-alexguo1023@gmail.com>
References: <20250614051837.3544959-1-alexguo1023@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 14 Jun 2025 01:18:37 -0400
Alex Guo <alexguo1023@gmail.com> wrote:

> Variable var->pixclock can be set by user. In case it equals to
> zero, divide by zero would occur in 4 switch branches in
> i740fb_decode_var.
> Similar crashes have happened in other fbdev drivers. We fix this
> by checking whether 'pixclock' is zero.

Doesn't it already hit the 'default' clause of the switch statement?

	David

> 
> Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> Error out if 'pixclock' equals zero")
> 
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
>  drivers/video/fbdev/i740fb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> index 9b74dae71472..861e9e397b4e 100644
> --- a/drivers/video/fbdev/i740fb.c
> +++ b/drivers/video/fbdev/i740fb.c
> @@ -419,6 +419,10 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
>  
>  
>  	bpp = var->bits_per_pixel;
> +	if (!var->pixclock){
> +		dev_err(info->device, "pixclock must not be zero\n");
> +		return -EINVAL;
> +	}
>  	switch (bpp) {
>  	case 1 ... 8:
>  		bpp = 8;

