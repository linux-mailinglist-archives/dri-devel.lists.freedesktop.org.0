Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677927A84E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E316E425;
	Mon, 28 Sep 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFBE6ED15
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 15:35:17 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o25so2916681pgm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H/9+qYXF9GN9bRK/C5H5FmZN11jhXx2ehr1k98ass28=;
 b=bQGnqsi9trU4rchmHNT+IDgA2k6+MHytIahgg3FdvAvXLkOqo3HSiPipNaPY6tzrU0
 saZMEvvp18hb5cctMiXbAwwdqEtAcLz7sPvZhAyVhlZpBF4LYs/hKpLIA5BlM5T20YeV
 tPTDEoH1GxEm2CV8U0/mJ2mOBJ9L7PUKyJbQqCPOnpyX8ohd15TlgMC+DsiZGV26XGE+
 2z1CA7TU+0K7gKWYNUiZQKGUlLyMebr9WRQx81Q6djTGlGxLXvfJaDgaOcnN1p4Ru3Hc
 IRA49OvXD0yIN8n62rf0CT17tM4MRnhc4nUc9FKLj1sZrJjcK+wxUdsUOgzFdSL/g+p4
 fzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H/9+qYXF9GN9bRK/C5H5FmZN11jhXx2ehr1k98ass28=;
 b=iL4Pg5f1WS1f+tD6mk74u4TORYuy4XSBKK5RGVZodZxHVn4EhueL4U9zZd8fZJsoTJ
 1E8oL+NuAu6dDLeGbdngjavgcDO1z3V/0iJ+ej+cU9iOAZndQKEqUbX03iju/+UJEAyk
 8dg/zcL0n5263G917DLwNsscBse3Rv6SXogTjyMuihQ81LewQUVmJ5DJtljTJuw99dpf
 ERYrw5ddi76WObJwzvnnmCO4aaOe7r9eQa2bvGKdrnsVeST9j8yPyk2u8e4Z6B25js2m
 9/kPEWf6i/bZ8Cm+58QI92Md8syZ2KulCrZrEu6IgUgaRCfUppO2LNYPxCnb2V5HTBd7
 2dNw==
X-Gm-Message-State: AOAM531Gyj+2igJTWzdA17y2ebze6m3wJDPMGMtpkhnhhrhCVKpMQvc/
 QkiZF257xYAl1VcjB5slQQ==
X-Google-Smtp-Source: ABdhPJypCGDd/spbzL267gES6OYRMPR4S4hEJjiFO5vQCn8uHug/BJxwZZg36Chf8IEvIzbCNPLsJw==
X-Received: by 2002:a62:7c43:0:b029:139:858b:8033 with SMTP id
 x64-20020a627c430000b0290139858b8033mr4515529pfc.3.1601048117493; 
 Fri, 25 Sep 2020 08:35:17 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id 123sm2680229pgd.83.2020.09.25.08.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 08:35:16 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:35:09 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200925153509.GA895804@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925132551.GF438822@phenom.ffwll.local>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> I think the only way to make this work is that we have one place which
> takes in the userspace uapi struct, and then converts it once into a
> kernel_console_font. With all the error checking.

Ah, I didn't think of that! When trying to introduce
`kernel_console_font` I ended up using the uapi version and the kernel
version in parallel...

> Then all internal code deals in terms of kernel_console_font, with
> properly typed and named struct members and helper functions and
> everything. And we might need a gradual conversion for this, so that first
> we can convert over invidual console drivers, then subsystems, until at
> the end we've pushed the conversion from uapi array to kernel_console_font
> all the way to the ioctl entry points.
> 
> But that's indeed a huge pile of work, and fair warning: fbcon is
> semi-orphaned, so by doing this you'll pretty much volunteer for
> maintainership :-)
>
> But I'd be very happy to help get this done and throw some maintainership
> credentials at you in the proces ...

Sounds exciting, I will be glad to do this! I'm just a beginner, but I
will try to do what I can do.

Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
