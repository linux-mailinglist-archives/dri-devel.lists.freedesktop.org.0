Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F427FB3A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BDD6E860;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A744389B20
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 12:59:05 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s19so983526plp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BGONJfBGfiZJ8B5gVDKbSF1BVGKwQjHdLl3ddJo9tVY=;
 b=eJKbz8Q0kBy+c9iBIWhnx+5lDxtWn3fntLUDzpGUW709Er3KPWJPiwrRw6GnRMJeGn
 xodi9WCSndpOjnrfs4XfsryyUrXfJmelVfDFngugKTT/TIFNXxrsEiPfUMqP1E3vrCD3
 Ujq0ESsfFS5bbg1mDhmeYuLR1dazAfdE7Uq5/bVNFR4L68c6+6C+ex5KCWxd9DrWxrL8
 l9Xg8oS6UFCyOsOj81oskbHKdF5QskffRIDpTO3vpxBIuOadWbgZ13hoHaeNF+VI1jCG
 Vaato+9lnzp0K1IkdzExljN8tXbUqiyHcLJodvjhypXRNCpVPsE8Zc3bZbit2DkzcNcL
 wkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BGONJfBGfiZJ8B5gVDKbSF1BVGKwQjHdLl3ddJo9tVY=;
 b=NY2IDhd+G5M1RNGHI+9QxcYjIImQrZxuuwDcMdUp80ZuMFy/QKrEIOmGmsIWadKi9Q
 ecuiNFDLwM9zoLzEFDsy7Iu9iLpz2YkpOhLDEmJ35MuQybDeO+y9an9qUW1drzrQkIaG
 ocPJwcT9apMsgCzwJMIP9sZocVPrxILtQOqEGq0Fkj2zVwG1zH8DSoI7BHQUd2AMAqeK
 vfT/OJxXgkFY6JwLa/ng4t9RmCU1pw+o4nfoL8gWyB/TWlZYg/O1HkI4Yx/HoNNFbOx6
 F/E4Zx3Nk9FQaPL2bKE1ZuFyQgcYPSnGznZa+wK+6k9OrBJl1IsRYRVgm0Yfqbx4p4vl
 UUWQ==
X-Gm-Message-State: AOAM530mXsFbYOzllpyIrIDNDPFvPEDLUd02hDTFVR3ObeZHL2Jmbi6l
 HbnWcIZDUkBhIdboA/xr2A==
X-Google-Smtp-Source: ABdhPJwbSPtClFFI3ea1mNKe4eO1VEd6GSD/SvuAQtvcm7zxPoV0QkXo2AazrpiYHQjW/KT/XysBXQ==
X-Received: by 2002:a17:90b:30c2:: with SMTP id
 hi2mr921373pjb.89.1601470745283; 
 Wed, 30 Sep 2020 05:59:05 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id u15sm2536438pjx.50.2020.09.30.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 05:59:04 -0700 (PDT)
Date: Wed, 30 Sep 2020 08:58:55 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200930125855.GA1155358@PWN>
References: <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
 <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
 <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
 <20200930115211.GC1603625@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930115211.GC1603625@kroah.com>
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 01:52:11PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2020 at 01:25:14PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > Yes, and built-in fonts don't use refcount. Or maybe we can let
> > > find_font() and get_default_font() kmalloc() a copy of built-in font
> > > data, then keep track of refcount for both user and built-in fonts, but
> > > that will waste a few K of memory for each built-in font we use...
> > 
> > A possible trick for this would be to make sure built-in fonts start
> > out with a refcount of 1. So never get freed. Plus maybe a check that
> > if the name is set, then it's a built-in font and if we ever underflow
> > the refcount we just WARN, but don't free anything.
> > 
> > Another trick would be kern_font_get/put wrappers (we'd want those
> > anyway if the userspace fonts are refcounted) and if kern_font->name
> > != NULL (i.e. built-in font with name) then we simply don't call
> > kref_get/put.
> 
> Ick, don't do that, the first trick of having them start out with an
> increased reference count is the best way here.  Makes the code simpler
> and no special cases for the tear-down path.

I see, I'll just let them start out with 1, and only check `->name !=
NULL` in kern_font_put(). Thank you!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
