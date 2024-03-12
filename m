Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9573879DFD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 23:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D410EDA4;
	Tue, 12 Mar 2024 22:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eLXfl2gF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612EC10EDA4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 22:01:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29be5386b74so2218408a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710280859; x=1710885659;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lLq08iYnVcnWuDzFJHO0LDnyeIZ1/WCj/v6YSvUnsiY=;
 b=eLXfl2gFc95uN0PYrfLNKv1V7YRdN0HUgCgCvmdBFyFF6cN2QN05JmywSoynIrh/3I
 idIfbLfob9mCISggViB3zyu+E399+/nyudpI2fpQe2IHPguOsmaAUrs0O7VPsyAHkpGF
 4q0b1Zvj/IKdIFrhakrIw3hm/aeybyF8d+QZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710280859; x=1710885659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLq08iYnVcnWuDzFJHO0LDnyeIZ1/WCj/v6YSvUnsiY=;
 b=V76z/JycPorn5Tjs2x3vzohUcz9sCOe/Gkm7NVBeBrfgUFBsc/rVw6W7xic/L0x3Jz
 ty6mLJAE+IwX7Y+8IE5iXQVRxuZgBwft9LH9mhprKP13UPJvJj9B5XOPk2QHkagPkxsY
 P/WEkgcSEFHbh2tqBC7i+tv2A+2ChRn3W5I2eM7DnMBDs9EyqzVC7k48EZW7WFqQxbSe
 ROS5SC47URvRFJLyUaP1NgZkzdtmGew0V4drrS566U0646RIPKleIF0zIA9OCA1h0HLt
 E4WW41L4ld0tbVxKykGjel0SoheBxbu0fB32vWeiszBUn4tXGOSPMcdRRY6e064lyZfV
 7P8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtqXSVboWNvAto9cRZuwRHHi4x07BLpFizhysUW0mG5L4h7PO7UcC9JhI2C9a1HThhW2OGYWZ034cADEC/zNnyimiPoiauA+gnWIsoh035
X-Gm-Message-State: AOJu0Yw0afTyVfXWUGR3yPi9PwxbK8NSzEWBs4g4LF4gnIWjEQcL8N3v
 lTyh9pyR3wjcrm3RThhjoJYcCiT2TsXEWyCY6+Uvdz79y9VeJHcvO0zdrJ20MA==
X-Google-Smtp-Source: AGHT+IHdha0C7GHgTOtn+h7GC1nV2SuVFIKnwQ0XR5LyRaxyHLt5ciUVNw2VJKedo24c6BQYxDb+PA==
X-Received: by 2002:a17:90a:8b02:b0:299:4cc5:aa25 with SMTP id
 y2-20020a17090a8b0200b002994cc5aa25mr2853635pjn.25.1710280859551; 
 Tue, 12 Mar 2024 15:00:59 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902e5c800b001ddb57a4dffsm2232631plf.132.2024.03.12.15.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 15:00:59 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:00:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, netdev@lists.linux.dev
Subject: Re: [PATCH 01/14] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <202403121500.64A2C02@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-2-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-2-linux@roeck-us.net>
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

On Tue, Mar 12, 2024 at 10:02:56AM -0700, Guenter Roeck wrote:
> Some unit tests intentionally trigger warning backtraces by passing
> bad parameters to API functions. Such unit tests typically check the
> return value from those calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code.
> 
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Daniel Diaz <daniel.diaz@linaro.org>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Yup, this looks fine to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
