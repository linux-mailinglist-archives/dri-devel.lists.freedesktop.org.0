Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E387BE67
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1F10FB74;
	Thu, 14 Mar 2024 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i4WMVPJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CBF10FB7B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 14:06:29 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33e972c8b67so262340f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1710425188; x=1711029988; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8pQ1l+MVwXlBnQJuFCGfCMOAeHIFtVSkzqeu2rgt2U=;
 b=i4WMVPJBPdT4vJ/UDpXfXTkvUeC/eOo5US2Y6xtQfYA0LPaVWviTy/swh1i0K28FdT
 SdVB+u9v23kNHlvcxcSa8MjtT7x+rHpx7C+G9tIfiFp06Oaqw7ySzt/NI+AKaGhgGiS0
 BLoA70EOWN1eHL4374ksksaRs4N2moqLT5rBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710425188; x=1711029988;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P8pQ1l+MVwXlBnQJuFCGfCMOAeHIFtVSkzqeu2rgt2U=;
 b=dSRyUq6P/T7RUEhzNF7+uI+FjKtjTDduZmYgr89B+MJRsmClVsH+GZ132m/oT+dCCE
 rjhGD+qdeS6VwCZvEjXFlBCNjfYFEWZL07+r4uo3s4jQuYexgwoh3Wyw6iBTyggxBoeN
 PWQIWJC/0SHQElD9yfwhEoWR5gcFrpdbpkPk//jze3TfdnDTthIUN8I5rEsZO6pcBwPm
 DGQegDCt9V91p5FeFOwQ10/IcqZBO+WwV4/DhiRHkC4Gai9+KtSCUigdF9EJYzyp9F0T
 Qbi7jtv+szQ3s7cvoJpR/hbUIY1ExEFFEppbOaPEdEoq97tknU3HSgTgYabLgk0yehVR
 3zYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU43u1HibLCNKS9d2whw84Mg9G5XhfgZU+EiRmOcR+NctBSmBjuvW1ysk3GCYrFd9rxITmJxKD8zZ7pg6qxgwbHkOTbp5qMwvJvzCgD8H4s
X-Gm-Message-State: AOJu0YzwUuvHxKSV2OsfdWHiQUoECgaWMatxb0txsvqoOG/gD+rJ++GY
 zNVfLzulwB92iDQjOQ/1FthxsZwZAgvnfxCbZUgorgxL6P9F0ZUg8OyFQwHpaC8=
X-Google-Smtp-Source: AGHT+IExxoAOUpYvXMrjNM7aEFoJfpTDSDysmUmnKGih3LPpSITnQuFjpS56zA1GupHQLuuj8OHUoA==
X-Received: by 2002:a05:6000:4021:b0:33e:7077:4b57 with SMTP id
 cp33-20020a056000402100b0033e70774b57mr1890153wrb.1.1710425188089; 
 Thu, 14 Mar 2024 07:06:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 du18-20020a0560000d5200b0033b7ce8b496sm806034wrb.108.2024.03.14.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 07:06:27 -0700 (PDT)
Date: Thu, 14 Mar 2024 15:06:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Ogness <john.ogness@linutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] drm/panic: Add drm panic locking
Message-ID: <ZfMEYZZN2fd9FeEi@phenom.ffwll.local>
Mail-Followup-To: John Ogness <john.ogness@linutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20240301100516.2516297-1-daniel.vetter@ffwll.ch>
 <20240301103903.2538083-1-daniel.vetter@ffwll.ch>
 <87o7bt6qpf.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7bt6qpf.fsf@jogness.linutronix.de>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Mar 05, 2024 at 09:20:04AM +0106, John Ogness wrote:
> Hi Daniel,
> 
> Great to see this moving forward!
> 
> On 2024-03-01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > But for the initial cut of a drm panic printing support I don't think
> > we need that, because the critical sections are extremely small and
> > only happen once per display refresh. So generally just 60 tiny locked
> > sections per second, which is nothing compared to a serial console
> > running a 115kbaud doing really slow mmio writes for each byte. So for
> > now the raw spintrylock in drm panic notifier callback should be good
> > enough.
> 
> Is there a reason you do not use the irqsave/irqrestore variants? By
> leaving interrupts enabled, there is the risk that a panic from any
> interrupt handler may block the drm panic handler.

tbh I simply did not consider that could be useful. but yeah if we're
unlucky and an interrupt happens in here and dies, the drm panic handler
cannot run. And this code is definitely not hot enough to matter, the
usual driver code for a plane flip does a few more irqsafe spinlocks on
top. One more doesn't add anything I think, and I guess if it does we'll
notice :-)

Also irqsave makes drm_panic_lock/unlock a bit more widely useful to
protect driver mmio access since then it also works from irq handlers.
Means we have to pass irqflags around, but that sounds acceptable. So very
much has my vote.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
