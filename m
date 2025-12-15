Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FFCBF5F2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 19:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039CB10E0FB;
	Mon, 15 Dec 2025 18:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7/Kn8ut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326CC10E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 18:16:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso1952781f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765822571; x=1766427371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgNHGQuNqJYS8SDNw0YQDcQ0j9dj4XHzKQA/e9DbvTI=;
 b=d7/Kn8utOqkxC5OyHTFZJnrlU2xtCabLbeo/24YSjSMrQQ8lKjZQ4+C/1TIoO9i/YY
 hZFBFiVlYMXi9RIPRCIyMt9xqWm0iz0E/GiYotiY02KZrp5m2Lz/pyOtrFDBPpdLOuj0
 mrCWyDlyrqFJSS2B2xjP5xMyGy9obxdCHOxUaekgR6t1DHv1zXry/8wWj+9lB+bIOeil
 I2O2llf5fECRe+lKXHC1n2KxM67UfRNxdy43jUdefkimVJCMOQGl1BFRFWe1EtJCRbNY
 mS3BIWm4YNKbPNiDQIDSTcx4j/u9O4abSo2m/IUdFOKmSzlUlsGVxwa06jDo/Zz0JtbP
 4taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765822571; x=1766427371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mgNHGQuNqJYS8SDNw0YQDcQ0j9dj4XHzKQA/e9DbvTI=;
 b=rZREX7SDTxw9iaucGm/k6xC5bzq3QNIWcp++IiOYuhXNHG2y+t6uaE2kEH1WH/AsRs
 eYzALkmkFYpwZMcNcW5Wq3wOH6tiDt1cKxjjGu1PR3J+CJ39Mo6+tjDAMzXz7NaZZcbN
 IYGKpNG4Tbf1m2+BZOO7kFYNJDxvVkH+zg1AFMmlmvif//FgoPmH6QuNa2Q2O1tcr+sz
 JkE5SCfHOiRDN7USR3qmu7VaPkltFAWkKXd5/CPmZmT685YVbz6il8ybRKIk6yTqumNo
 7JSTKMk2uIeF/953XNElWV78ZHFlF91m37tWaVd9CUZJpvO3n14UQA08qBuv5wgiMkXc
 uXXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3r3VzL2GQtBdi4Mer4eAmQA+CCPZO/iCTQYN5+8cNlRWUAXqN5KqArxxvs6cgcc7EHAcfkY3laXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6xymGKVOX0MPh1Ucew9WyhYu29/GXyPMNx6D4EUYjDKEtuGIB
 a8/8HPLSx5gyQcnoj5ypz47m89re8C75IqutJSLNEZnLnhu7mA0//m/y
X-Gm-Gg: AY/fxX7q6R9b0gQYhWUNZD5aMwFAMc/b6EOAH9nLp30mlzCRYNnaRKuykSJGG64sn4Q
 SsnMMbLUhbyffG/yTJKlU5RxOiizPzS7uH+uYnJ7MfO0bzMEb73C5ixsWmh7AIF7Mwguhv6Snoh
 AtpifGpZf5OosFvcZ95q6kR1vGacZGX0eU3vc40O1LUi9VqhMN/6zbZd47ZgXAod28XcCmpttgW
 /z7rCEpEn+aKlnEptuW+WgiCgq9vLRQZKxtLv7h6WZXwTY/brNMQaZDQymBeuveBFB8Rid+R6Lu
 udNU8mcaYEgXvvMzy+TT99c6grqmpoIhKwA0giIRJkAGl7qVJRvAqsUQoUZJrYXsk6PJcRmkAZh
 ES7B5XxtVaU+lOalY5j93wg3Bgd1n5ht1CrzM9QSfHCfWSm7RmkX/ZEJLTytWpUy0Mvk/Msq90k
 jKHZRiIwKiW+kM7sNBUdWxZkOacXxTvn9q4s2R1H8vFiHYse5maga1fZUGzD3mEXw=
X-Google-Smtp-Source: AGHT+IHyDJpQHBms/ienI8KAmWZu5MhqukBnjyYtenMu2CYLWW1CjFUhtTLo4yMnCvX9Pd/MmTJfXQ==
X-Received: by 2002:a5d:6643:0:b0:42f:bad9:20c9 with SMTP id
 ffacd0b85a97d-42fbad92628mr9345753f8f.19.1765822570360; 
 Mon, 15 Dec 2025 10:16:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f9339d86sm11129355f8f.29.2025.12.15.10.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 10:16:10 -0800 (PST)
Date: Mon, 15 Dec 2025 18:16:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Stone <daniels@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Message-ID: <20251215181605.29f6afcc@pumpkin>
In-Reply-To: <CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
 <20251211223822.6eeabb4d@pumpkin> <14738785.uLZWGnKmhe@workhorse>
 <CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
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

On Mon, 15 Dec 2025 17:55:13 +0000
Daniel Stone <daniel@fooishbar.org> wrote:

> Hi,
> 
> On Fri, 12 Dec 2025 at 12:46, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> > On Thursday, 11 December 2025 23:38:22 Central European Standard Time David Laight wrote:  
> > > Except that all the systems with PANIC_ON_WARN set will panic.
> > > I believe that is somewhere over 90% of systems.  
> >
> > I also like making up statistics. Warning here is the correct move
> > in my opinion because this warning being triggered indicates a bug
> > in the kernel code, and with PANIC_ON_WARN the user explicitly says
> > they would rather panic in such a case than treat it as an abnormal
> > condition that is recoverable.
> >
> > The reason why this condition ever occurring should be treated as an
> > abnormal condition is because the DRM subsystem should guarantee we
> > don't get a framebuffer of a format we didn't explicitly declare
> > support for in the first place. So this condition being hit either
> > means drm_universal_plane_init is broken, or the array of formats
> > that's passed to it is out of sync with the conversion code, which
> > is also a bug. Or someone managed to thoroughly hose DRM's internal
> > kernel-side data structures, which is precisely the kind of thing
> > PANIC_ON_WARN users want to abort for.  
> 
> Yes, that's exactly it. We make all kinds of load-bearing assumptions
> everywhere: that PM code won't pass in a NULL struct device pointer to
> the resume handler, that our driver callbacks won't get called whilst
> the device is runtime-suspended, etc. We could try to handle every
> single one of those with if (clk == NULL) return 0; /* ??? */, or we
> could not.
> 
> If you'd like, we could just delete every one of these checks and
> replace them with comments, explaining what we assume the invariants
> to be, and wait for an OOPS due to dereferencing invalid pointers. But
> the MISRA style of 'handling' every possible impossible case is not
> tractable.

Especially since it is often easier to debug the NULL pointer reference
that the work out why a BUG_ON(!ptr) happened.
(In the former case you should have the contents of all the registers
making it easier to backtrack to where the NULL came from.)

	David

> 
> Cheers,
> Daniel

