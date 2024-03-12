Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D6879E1B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 23:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA22C10F12B;
	Tue, 12 Mar 2024 22:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Iu6fIeJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBFA10F123
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 22:03:07 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-366753f1477so956855ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710280986; x=1710885786;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
 b=Iu6fIeJlVNXlTumBA3PDJDcckVbaCtriMANvbst2H8ukgYHQ3hYtwcpuUBwoJhLrZ7
 RzoNTC1xlQPfNh6i5Clsjl8VbmiK3YNYIZcmSinohOSfhr3bFe1UzprFeKcfJLq4uGVB
 8cqaXzepfFLg18pW/niF/uI4KueuIB5E5DUqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710280986; x=1710885786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
 b=IzSTyz9M2Hwtv5tPd+xJnVgOEvj+rBqe/WwJ+oxUVWsvkF8U+qjMIxwyJjtFZnUXmL
 dxqt+zehEQlsbPgyGf1D04jmJGZj5D0Y4rnYMorU6IQOu013Mrsr1DK/yIfyZM4M2xvC
 etucr6TkQrWGInEBzL9KfhKrhwVMi1EcBi+VHfIOoZugwAA53iDz2mI5H97opnHQo6wU
 mgepxXf8Cf7L0q9fU+Welz4lPnnKpG7yPX4Qdw7AKZFrQnzq1YFOLfkmUuDXowgawjdI
 p7TBeEjKqF4BSh3cp2Uuluam9SidqqFkIofHqt5V27o00+CRIBDvXxibCqpxd9BdxSDt
 DYGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIhUBD2zSBnsky63pFyW/+jplTV441fw6fBh81C/DYodZZJBgBh4wVzZ3vaYhCskAJ545EeIZrP0CUV82O7ZTZh1Sv6xVmnuAwVjxd9gcp
X-Gm-Message-State: AOJu0YzNFQMu0T6ja6SjZcMnH3Bfx2ajTg0UmHl4V5R6COEGyQUQyyDv
 VwwnXiw4e5mRSxG3gVtD+ebE8lWGkfUH6JjmtLZ5SdTiGw5SeoG+jyba78A/gQ==
X-Google-Smtp-Source: AGHT+IEdwN1SY2GeciEHPDmRWgTgdPa04evl6KEFQYoPJeYQSV2BmWI4216WoCmzy6l7zJDsrZVhNw==
X-Received: by 2002:a6b:e719:0:b0:7c8:bf15:5653 with SMTP id
 b25-20020a6be719000000b007c8bf155653mr4918871ioh.20.1710280986087; 
 Tue, 12 Mar 2024 15:03:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a63ed4e000000b005dc816b2369sm6650251pgk.28.2024.03.12.15.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 15:03:05 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:03:05 -0700
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
Subject: Re: [PATCH 04/14] kunit: Add documentation for warning backtrace
 suppression API
Message-ID: <202403121503.B97DE8A60E@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-5-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-5-linux@roeck-us.net>
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

On Tue, Mar 12, 2024 at 10:02:59AM -0700, Guenter Roeck wrote:
> Document API functions for suppressing warning backtraces.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
