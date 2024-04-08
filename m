Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C728489C99D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 18:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864D4112786;
	Mon,  8 Apr 2024 16:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mBm8RbPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC768112788
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 16:34:33 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1e2178b2cf2so42472105ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712594073; x=1713198873; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
 b=mBm8RbPyUzfAnQGGEpDeSLUTgke+sHhNbjmV6QAsu6D6aGgmmIabX2AsJ2Io2dkpA3
 t0UJZb33KRQVsoL0ow2OLeTrk7ruVH/JgIa5ago8y3abcAJ+RDbCCIoloyIeY40aiRDa
 fr1cK1g9J1SoSel7wOross3KwNbSZ0mTAbGFCpIPNDJ6/c3oLClFLJehUIYIYB5k9iwA
 PvV1KR4IkznNrv4hETD1r3vqp8eraI41oNxjVO70ljchWbRPZaDTR/F4g5esKrbp4jda
 CF1qXz9GOUFaIuOE6itiuAC73oLcm+jMsBjSxfgGyyYFjyet1Ix4K4WAmAYJZSSpG+yy
 ao4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712594073; x=1713198873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
 b=T8VgsTVVyqad0z+Eee/f3nXB17oDSrFHzaPifOghoW1fMhHRbuOY7c9i/E9nTPI7bt
 aoAdGbi8Fkqpj5wK+M55V/2Sd9Kzw/lTjX0i2boMHewoboymjoO/9o8DvjtBFt/Soy39
 bFoc/EjxwKu1602VyWh6+Rit07mLBbDvqaFGWZ+7ZlBEFkmVh7loDgOS66DcWw2UH0cW
 dktczkzn+DHtH8SVMfs8J0TnweFlYfBidASDi8cbRE6svWzHxgAJfWw+AUM/x2UKqgtr
 cGDTO3HPNg7oizntnKHgdu9Kkcpfo4IzAycbccQgFytAdHgGQM2rXjin/hMJIZ6S67Gb
 TIeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNu0th9QHTazElYUs1M0ayt9M9uxehBhW2EalqtPvpymd4BTaosPoJxrakkS9Hm3Ar4hgpwz5BNZOrhiENHdw3P40c1VsooJ8Ijt9f/+5a
X-Gm-Message-State: AOJu0YxrNYtY/OZegfeX01hDZfm3it8OBzt9+mIcwInkXgEJ5SJUJtSJ
 cc8YCyJ21ryWPqfsGJcMgNfs1nQM67wl+mDR6EYWv1kIPclzAX/r
X-Google-Smtp-Source: AGHT+IHjgwPwZy3e5AEopzEIQpEcmD2hcpsHcoA+sLwIBYMIqqkK3bLGAgIh/jDVDgJdWRaZ9xWs0g==
X-Received: by 2002:a17:902:cec7:b0:1e3:f911:22b2 with SMTP id
 d7-20020a170902cec700b001e3f91122b2mr6050960plg.7.1712594073047; 
 Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170902e54400b001e2b36d0c8esm7189331plf.7.2024.04.08.09.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 09:34:32 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:34:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
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
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <9e8718bf-da81-463b-9436-6c8b0881a045@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-7-linux@roeck-us.net>
 <20240403183412.16254318@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403183412.16254318@kernel.org>
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

On Wed, Apr 03, 2024 at 06:34:12PM -0700, Jakub Kicinski wrote:
> On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> > dev_addr_lists_test generates lock warning noise at the end of tests
> > if lock debugging is enabled. There are two sets of warnings.
> > 
> > WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> > DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> > 
> > WARNING: kunit_try_catch/1336 still has locks held!
> > 
> > KUnit test cleanup is not guaranteed to run in the same thread as the test
> > itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> > be called from different threads. This triggers the warnings.
> > Suppress the warnings because they are irrelevant for the test and just
> > confusing and distracting.
> > 
> > The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> > and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> > the second warning, it is necessary to set debug_locks_silent while the
> > rtnl lock is held.
> 
> Is it okay if I move the locking into the tests, instead?
> It's only 4 lines more and no magic required, seems to work fine.

I don't think it is that simple. Unit tests run in a kernel thread
and exit immediately if a test fails. While the unit test code _looks_
sequential, that isn't really the case. Every instance of KUNIT_ASSERT_x
or KUNIT_FAIL() results in immediate kernel thread termination. If
that happens, any rtnl_unlock() in the failed function would not be
executed. I am not aware of an equivalent of atexit() for kernel threads
which would fix the problem. My understanding is that the kunit system
doesn't support an equivalent either, but at least sometimes executes
the exit function in a different thread context.

Guenter
