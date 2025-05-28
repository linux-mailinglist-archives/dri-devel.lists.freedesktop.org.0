Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF2AC7192
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38FE10E058;
	Wed, 28 May 2025 19:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sGRIABWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA63B10E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 19:38:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso1554615e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748461136; x=1749065936; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
 b=sGRIABWARaumzxB9f1LFdfiAWB5MoRSo0ktyI3zCGtWBZ2xPU1vtCkQwgqF914hSbM
 Vh7EN7ZGr8E2suIIm/NJtAYbtUhKdey5wurENT+Yl+MA8DUHVztsmHhrjJXYlL7SW+Pp
 sPf//Je5s9xoxeGJR5kLR0ca7fk3xWBRTRHZwGJOnGaJHJEzwuenf/l+BUQs4InO2rCy
 TvgYbrNmzKL/uyDHC6L/XvfzISd7iS3d3fLTJcpmI0yNK99Cjum3psFr2b+bFnJSuS3r
 EnowxpBkHu0rCdEiF1DWkYUEV+msfzR+zh3IHQX+WJvc7KTktD1l6Bw6Xx5y9YA+vPMt
 96Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748461136; x=1749065936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
 b=T1gbkENXl2hdEgUFmBFAyVKAA2f62m78qV4sihUK3tWvu4Dp9FL5xHUqc0Rgt8U94D
 MNy7vicfn/MtzpSJvgbz/hgDwIizFfTqimtQu/vZQhvYyP9yFFJnPjgVZqwbX+emVUGD
 zzBZu324rfXS49KUYMdLxT0QtvRR6nhFh1Qq+cvLbEiXsiW1ND9QLoUaiHmFxBuiHe8g
 rED7MWohIVrYjZKWn8/3Zf45Kx1iML8DhSu2xWSnSzIR/EmN51pvWjTNn9a9oomgXWW8
 iSRDNKrb/sBIzo38WA/pegiVkcD4X1sdogacEh23T0wQ79FJgnRhvX7NFBfx1NG9/5Wi
 yroA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUzJntFzhn/AikMc9wePTs4rTVF+b1KlYFIoeUOXLxr7eNu94iTxol4hKiB/YQiZyLfH+PkXCLp2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzycMizqIIiik2rJm5Z38d4RcURHEfyprOTJS+qFlJFkWDjiEzY
 WmD/e4OPQ3e0367dqab5AGq/ZliGZlRBIytQxFBvSVKHRrUDU13sx+pVBlp40FG8u/k=
X-Gm-Gg: ASbGncszmJa9caiEjKXlr8ZMcbH6/T/v0R+gRWAG4MVePBvUyPRB20Jz8XkQDzdDY7w
 r0DmCDMPjBmt38uIZ9lnE2+CkVGquDeBXWY2M9Pmehml6T7F2taKNqWOW1deCSjw20ZPnB6+A2v
 2q3N/JHVWqfdKcZIXtuOHqqh3hku78SDEyxcdVW2+t7vgRviDgOrmzTJwCC2iWfLtYlZoGmZ0RG
 6tjTNY7yGq5WdQqiDsd/Z0m8rkP4a5gcSzfdyvugG/gjl9+jK8md5wavs6MeGT2hmoasWw0oJ2g
 KXmTfQeWNn/fYduGLXmBrlUVXAeFOPG3edgLPrgAnFJKuZVNfwSsItQ=
X-Google-Smtp-Source: AGHT+IEohOPMzN+pE/FspwUOZyTq3f/DaGNNjqVAcD+QKVM4fgErWjBcDpyCCi/2vxtZ5wPSlADAxA==
X-Received: by 2002:a05:6000:2504:b0:3a4:e387:c0bb with SMTP id
 ffacd0b85a97d-3a4e387c5afmr8004139f8f.59.1748461136127; 
 Wed, 28 May 2025 12:38:56 -0700 (PDT)
Received: from localhost ([41.210.143.146])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4eacd6e8asm2265146f8f.70.2025.05.28.12.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 12:38:55 -0700 (PDT)
Date: Wed, 28 May 2025 22:38:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add invert display parameter
Message-ID: <aDdmSy4lYH6WrMWS@stanley.mountain>
References: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
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

On Wed, May 28, 2025 at 05:42:30PM +0200, Bram Vlerick wrote:
> Add devicetree parameter to enable or disable the invert feature of the
> ili9341 display
> 

This commit message is so unclear.  The parameter doesn't let you
--and this is a direct quote.  LOL-- "disable the invert feature".  It
would be better to say "Add devicetree parameter to invert the display
on a ili9341 device."

regards,
dan carpenter

