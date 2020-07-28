Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE32312B1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A0A6E3CE;
	Tue, 28 Jul 2020 19:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97076E262
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:15:30 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 2so14086276qkf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QIWDEkYc8mxAlKuadsKFH4VbD1YSAM7HFnbpBmNVSO8=;
 b=ig4tkCGz3vBobXOMO7BoapRzWs6lWMRevLLAhF4HMFvFHk51aV5q+u29L0ciq0z5Bw
 9heErKQGzKLJu5Sw+Tw8VfRTOpDfyoBOqwfy2SZT/dmbgSiqBwmyZDc5LBGtDvPp23+u
 ofAVBqom40t6XY+Ryc4eHoYhp7jof7gqfisCiwstRZMWzsipSyHPeAlmGRCltZqByuur
 l5qxWpuYjXF5o+VAXFK8pnsE41kEu8Ku+gq4KJ+NjXqKFmQyHyT29aBk3fOpJmkdk56z
 gTlNgo1uRetcwRU0yFDtYZBt1QJi9/sa5lS94DXH4cgYhPvvM969UBD0TUp9jO4NsJC8
 Z2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIWDEkYc8mxAlKuadsKFH4VbD1YSAM7HFnbpBmNVSO8=;
 b=kzHNp5H2TcTQofrV4bHzwHajiU4E2xNPUjZDsMll03j0+5lIYHDKSsK6kyal8IrmRJ
 L6MVU9H3MxNXyPHw64wKVICTKw1h1EofOwOG8XhooLj1zI+VwQOEIrhaaPjqHLCM6WPn
 3pon8qh7+HQjSX5Iurq/iVFdtE28ZioNbYdT2zP8/5zY9wuRb7owDK9cznGX182axPpX
 tYrAATLJRdh4XYw88m8+opGFlpQXNmeEPvQwQXfN+EIwUkU+ZnYwe84u3z3I+LHhyc+u
 SE93LJfyQ1V/h3wgPcjmGlcxSkB1KLUd12d3qc9BnbZ05zvZ9619f2Ek3ZnoM3VEvDg+
 FDjQ==
X-Gm-Message-State: AOAM5329dXiQZXVgYKcfZ++GJvvrL/MgPqfzEhVUHGT0QjLTR5NIicp1
 +/rOB/DRQ+ZBeIN1ixJEdQ==
X-Google-Smtp-Source: ABdhPJwnCLW6FdwCOh5nOUuPdn7nxL775A6fuG5o1mUkIc3N4vsgVbSbHf8jAqg4H/8NhGRdHWbh9g==
X-Received: by 2002:a05:620a:151:: with SMTP id
 e17mr27492002qkn.173.1595934929870; 
 Tue, 28 Jul 2020 04:15:29 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id w27sm17261967qtv.68.2020.07.28.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:15:29 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:15:27 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent kernel-infoleak
 in copy_one_buf()
Message-ID: <20200728111527.GA407693@PWN>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
 <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 10:11:09AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 28, 2020 at 3:45 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > copy_one_buf() is copying uninitialized stack memory to userspace due to
> > the compiler not initializing holes in statically allocated structures.
> > Fix it by initializing `v` with memset().
> 
> I would add 'potentially' somewhere in that description: it is architecture
> dependent whether there are holes in this structure as 'enum' types
> and 'long' are both dependent on the ABI, and even if there is a hole,
> it is undefined behavior whether the hold gets initialized.

I see. I will fix that up. Thank you for the advice!

Peilin Ye

> Other than that, the patch looks good.
> 
> > Cc: stable@vger.kernel.org
> > Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
