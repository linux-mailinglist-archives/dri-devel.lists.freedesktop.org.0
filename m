Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037149B94D3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 17:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153B10E15F;
	Fri,  1 Nov 2024 16:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MFAlVqSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63210E15F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 16:00:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d51055097so1332534f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730476852; x=1731081652; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KYqd6sY/o2ysYuNR1j+SafoMA71bgV0zKTYA4WAwzK4=;
 b=MFAlVqSHPf9zjeJn30qgPctjL7k9Ewo79RL1NQ0MKxUwBfGwBpdD2flad5yp4to7Hx
 RcJg2QlIuRzs/WgLEKhnjg9uslHtcTZIooog2RyHkP55x57hfJlZuGNM5vkIkZGU1BiV
 3kGwEoy9hScSz3u0ZlUjDtKbp1a7qvqYj6vbu4GZ+DPPNzUtFwGvOpI2lDl3afrU0nBY
 Gbd3SVJKTiXbGxg6JxBhClpRxh5wksjGOVudTReRTbLUTsJXFZIdSSDhuxq3RG+/wZtO
 9pdvABbFhEBHbcXeW5jv8SC2kXnty+QJXjibxrM54xkXJQ3hvz+BcmJlatJZG9+iUnIQ
 nb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730476852; x=1731081652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYqd6sY/o2ysYuNR1j+SafoMA71bgV0zKTYA4WAwzK4=;
 b=rhGKfVtcKjF0oBipx94YeHOdbK0gnn70zyN5y3S0asTqgZxXSg5sCb8sqVHZAM0zGq
 q7NRr8Hvvw2QN4WzuDRs9P7kZBnjwWZiM0xHz40W6Va0S2TV6mpLPprOHUue9LEMtPHn
 ihlENMzQb2hBJEsOU15vCZCMkxbIGRTWE0EcCmHyV3DNEVGQKGAlCSSFxllJAZvfGSZl
 +oeOW/+lnQI7nS90bzlojl20LEsxxEIlbPTgY878HvzlekejzEwSaD6TqrZV/Pxn7AjN
 b3s8Zu0XUorGtHpfdyiYVgTKn5xSdAWH32uzDxcol3yEhO+LpzD6Pkjg+cpJ6x+H2zEh
 KlFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlAuVHs6MQhEGOsANo0l70MQzGaYtmHZrDvI+dfQpKg39sbM313wo7xMgKMfKSQU8VqQLnyRyojYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQxyd21e1wKW5nf2le7LFYBQC1TIfLuDgAgglC8fFeQng249NS
 /h1MysuFrYqNtin2huIJbFTGD5IHDXeO6RMWo/EeL8dWF6JV0UY4/jnn2WVtF9I=
X-Google-Smtp-Source: AGHT+IF+31UkaQD4Bk2fch44Q3qhLJYU672Ie9wm0eb8mrfqiYkGyMRSjiGLJiq4SX/KWz14kzhHDQ==
X-Received: by 2002:a05:6000:1a8c:b0:37d:48ee:d6fc with SMTP id
 ffacd0b85a97d-381c7a3a486mr2824859f8f.7.1730476851641; 
 Fri, 01 Nov 2024 09:00:51 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b8csm5613158f8f.5.2024.11.01.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:00:51 -0700 (PDT)
Date: Fri, 1 Nov 2024 17:00:49 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
Message-ID: <ZyT7MScAsHxkACfD@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
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

On Fri 2024-10-25 11:46:16, Jocelyn Falempe wrote:
> On 25/10/2024 01:11, Jocelyn Falempe wrote:
> > On 24/10/2024 16:34, Petr Mladek wrote:
> > > On Wed 2024-10-23 14:00:13, Jocelyn Falempe wrote:
> > > > The console is already suspended in printk.c.
> > > 
> > > Does this mean that drm_log_client_suspend() is called
> > > after suspend_console(), please?
> > 
> > To be honest, I wasn't able to tell which one is called first, and if
> > the order is enforced (I didn't check if drivers can be suspended in
> > parallel, or if it's all sequential)..
> > 
> > I then checked if it's possible to suspend the console, but didn't found
> > an easy API to do so, so I went with this lazy patch, just ensuring
> > we're not writing to a suspended graphic driver.
> 
> I've run some tests on my hardware, and the console is suspended before the
> graphic driver:
> 
> [   56.409604] printk: Suspending console(s) (use no_console_suspend to
> debug)
> [   56.411430] serial 00:05: disabled
> [   56.421877] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [   56.421954] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
> [   56.422545] ata1.00: Entering standby power mode
> [   56.422793] DRM log suspend
> 
> But because there is the "no_console_suspend" parameter, and we should make
> sure to not draw when the graphic driver is suspended, I think this patch is
> needed, and good enough.
> I will just rephrase the commit message, to make it clear, that some message
> won't be drawn, only if "no_console_suspend" is set.

Ah, I forgot about the "no_console_suspend" parameter. The problem
with this patch is that it would quietly drop all pending messages.

drm_log_write_thread() does not have any return value.
nbcon_emit_next_record() would assume that the message was printed.
And the kthread would continue emitting next message...

In compare, CON_SUSPENDED would cause that console_is_usable()
returns false. As a result, nbcon_kthread_func() would not try
to emit any message and go into a sleep.

If we set CON_SUSPENDED then the pending messages will get printed
after the resume. If we use this patch, the messages would get lost.


This is why I am not happy with this patch. I would prefer to
block the console. I see three better solutions:

  1. Set CON_SUSPENDED from drm_log_client_suspend even when
     "no_console_suspend" is used.

     It is a bit dirty and might cause some confusion.


  2. Add a new flag, e.g. CON_BLOCKED or CON_DRIVER_BLOCKED,
     which might be used for this purpose.


  3. Allow con->write_thread() to return an error code.

     The question is how exactly the error should be handled.
     The kthread would not know when the printing might succeed
     again.


I personally prefer the 2nd variant.


Best Regards,
Petr

PS: I am sorry for the late reply. I had vacation...
