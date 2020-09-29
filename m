Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247B327C08B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3626E152;
	Tue, 29 Sep 2020 09:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF906E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:09:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t17so1340579wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=k2Jah2mTmKFXktqL5V+63tK4qiHDFQHzYLeyJvDVPh0=;
 b=cdJuKv1N4Ay7T+1odQicxDmvixgp3UfzwGJ44dWwPD3Nhz6tOT4snh0SWEeUh5GOVN
 siVoWvDApLOjBe05bkHCwJfu+guxnMoh5LeRYx8gVR6PkAUfcuUYnV/f/NETb9NtcYmg
 IMQXaApU3y+qqAHTNaz75srn6pK2eP3TXXz8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=k2Jah2mTmKFXktqL5V+63tK4qiHDFQHzYLeyJvDVPh0=;
 b=gUkuAKSp6zcMMv0iXRLtKrCnFB4+n6qQWc8HFQ/XTRFOLVVJGbSnWRg8KL7fl7+Jhn
 W9c1grHSoU3zlNTnU525ZaSmN+Wfq5UOzWibHS7wQ6nMgnXKjjr7/397QzkpJuyZxWno
 R7ymhDeeQcfGnNFmITpQYHAPekGo00/wofnmAbRNSbvErUb/ZmnYZJRuf1U46akWFrhm
 8TDh3yEBgqhMUXl1u6n2A9wGiVcY8/yAsn7SRLvIKgvUPdvc9Y9Uh/FftFcrZCqh1E0p
 VyZpppSPRSEhDyK3lCdCOX1UtP+HctgHA2/3cjAmw/f7p9Qv3uJy29KO3ZRxTQ3k2ijM
 eu2g==
X-Gm-Message-State: AOAM532+t2vUhldg5eGVmumA15IBXpjNuwxobdMeYxaLWLZbKEdqREKY
 YfBazuJ9+6o1+7zqKYpO3MFiNd6G8W/osNku
X-Google-Smtp-Source: ABdhPJwbXkSqn/soEsjXFr0B8n/TfVrEea1RkaZ7ua6qf3Lf9fEN5hqRo7zhI4TKIy8gRsTDA4fcvg==
X-Received: by 2002:a7b:c105:: with SMTP id w5mr2997053wmi.120.1601370588192; 
 Tue, 29 Sep 2020 02:09:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm5164350wrp.84.2020.09.29.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:09:47 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:09:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200929090945.GH438822@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200925153509.GA895804@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925153509.GA895804@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 11:35:09AM -0400, Peilin Ye wrote:
> On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> > I think the only way to make this work is that we have one place which
> > takes in the userspace uapi struct, and then converts it once into a
> > kernel_console_font. With all the error checking.
> 
> Ah, I didn't think of that! When trying to introduce
> `kernel_console_font` I ended up using the uapi version and the kernel
> version in parallel...
> 
> > Then all internal code deals in terms of kernel_console_font, with
> > properly typed and named struct members and helper functions and
> > everything. And we might need a gradual conversion for this, so that first
> > we can convert over invidual console drivers, then subsystems, until at
> > the end we've pushed the conversion from uapi array to kernel_console_font
> > all the way to the ioctl entry points.
> > 
> > But that's indeed a huge pile of work, and fair warning: fbcon is
> > semi-orphaned, so by doing this you'll pretty much volunteer for
> > maintainership :-)
> >
> > But I'd be very happy to help get this done and throw some maintainership
> > credentials at you in the proces ...
> 
> Sounds exciting, I will be glad to do this! I'm just a beginner, but I
> will try to do what I can do.

If you want to follow along a bit I think would be good to subscribe to
the dri-devel mailing list. At least for all the fbcon/fbdev/gpu stuff.

I don't think there's a dedicated list for vt/console stuff, aside from
Greg's inbox :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
