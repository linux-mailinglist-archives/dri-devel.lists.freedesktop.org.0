Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A4879E12
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 23:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98710E842;
	Tue, 12 Mar 2024 22:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iMgS34b2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00C10E842
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 22:02:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e6afb754fcso694216b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710280967; x=1710885767;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
 b=iMgS34b2+tdC1GlzQR1ztbXd8umtVJo7Lj7hkovAGk/ZAKN+mGAke9tuXZupzAu+aT
 0LpmOUD+RanWrYSkSWGaLSCvtWkrCJctoJ+i6f2EptYu4utEO+dB/hIqB0v2J27SORt1
 DoFFA1IA9V6PoAaNQuXmkthwx4ZrDabKd3fy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710280967; x=1710885767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
 b=OynGRRVYOpsiaD2KuU7a/5g6hiNHBrOKM7m9xJYQPeBxQhCtIc5mOce7gBz2tKreRl
 xplbKkR6Y1UcEqCdZmVrBsQh27BTY0CXVG5pbOegD1dTEXx+7ityP4CGMhq/txDm6Esg
 BDUkJpwLUnPt4JKwdhSpAMDoXf2mrNHd+TIfskYjAQqtIXC/xjRcEyGLYklnCzNpN/Z+
 otU2sA8+Cf0SP1O5ojguFiC4aM7NXRlCgAEZdf7vOlxWyOUT4r8KKqZ6K4SWamD2eGWH
 5dlqzLJSdd+4mInCPylDYF7CWGLtsKtxOUij1NJR+hWhBu6ZB92XlaeqYnk80d8TGE+D
 aEjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6+KLiyC5NiHeZ6DtWStTC/jvylwZgcj1MdX+XbQaDABC+2vOhj8zLg9N6laWTKqZnOEhvOWXqHfWUKHnLR9k8pciAV006flA1XLRTlUC
X-Gm-Message-State: AOJu0YyKLDlvtK47SyL5c+90IoU6ysud3UORU7B6yUvswNwWMA0Th966
 xu8zcsPs+KIeFxuKePadL+2gzvDOGRfDoaoQbhziB0Sv7E6cEnE5oqMpXXZ4Kg==
X-Google-Smtp-Source: AGHT+IFKZ+X2o3xvUM/DPjpn5dJMdSK/7jBm9riFOy6GxFDG2jNN2P7xmSx2+ecCvjPJ+atiR43WGA==
X-Received: by 2002:a05:6a20:9382:b0:1a0:efd0:b183 with SMTP id
 x2-20020a056a20938200b001a0efd0b183mr14145890pzh.44.1710280967019; 
 Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b001dd6c0800b4sm7193896plh.188.2024.03.12.15.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 15:02:46 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:46 -0700
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
Subject: Re: [PATCH 03/14] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <202403121502.95F27A01@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-4-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-4-linux@roeck-us.net>
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

On Tue, Mar 12, 2024 at 10:02:58AM -0700, Guenter Roeck wrote:
> Add unit tests to verify that warning backtrace suppression works.
> 
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
