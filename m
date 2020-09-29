Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570C27D401
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 18:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A155D6E5AB;
	Tue, 29 Sep 2020 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E226E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 16:57:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t17so2917687wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQq4copkzrTWJFWPrIjoaGpC7LzDugYFHrKyuAj+WCk=;
 b=MzZghrQtN3nF8Y/lUEqyS+JQazMX4C8+eDh7eh/JV1dh3GOplVIGXXBw19lWPfy3ie
 4KC69ffpLyrDofRK+U2y6PDp9oQE6MdrBUO29+NC4yMyvU8RzsbuzWKxPr26qCD5YsPr
 R42W/BKz4oQEgnTPwd62+BkpjZfezYgWC17ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nQq4copkzrTWJFWPrIjoaGpC7LzDugYFHrKyuAj+WCk=;
 b=XRgW21Fpl4doLna0nUeTQqQ3Tcpo43m/ajHm4CRSNVSYx/x9od1w82My0KzoRERTdD
 76ax0DEwxKQYr+NTpat6N5Fk0Aq6dvKuXk1tSOoxRzLrHi/IWX7zZUKZrXDF1Hx644EX
 3xMGwo8IwauppysI9RPYgLYvwpLKXU3j0FE919ZxJIflKENDJSwseVqkTpJ4kMHrsGiB
 Doxpd3//qNlle+fZG/ML4l6Q7I1BXYbS25oRvpkttIb5S7hJLiHDO/Z6ZJ45ZVB00aAG
 4no5OqnFOsfLVvBG7fzsU9Lr8rwXTcLPrEG2A9SO43cjWa63vIqaogz4l84PXC+sq7QF
 peWg==
X-Gm-Message-State: AOAM530uPJ6dUayzQc1MPfkw+mwFxXqicipMHkedR0/Z9+6NuL0YFtPg
 Gw5m/SpivFZUgGbRwUhHfnNtPg==
X-Google-Smtp-Source: ABdhPJxSWkIHkpAEXbL2VmRDFNprfEkhWbClVdbLQTZbv7RVDpq4HuSembcT2Wrqfw7IxPzBCnBXdw==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr5501099wmc.142.1601398620840; 
 Tue, 29 Sep 2020 09:57:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u126sm8002518wmu.9.2020.09.29.09.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 09:56:59 -0700 (PDT)
Date: Tue, 29 Sep 2020 18:56:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Martin Hostettler <textshell@uchuujin.de>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
Message-ID: <20200929165657.GS438822@phenom.ffwll.local>
Mail-Followup-To: Martin Hostettler <textshell@uchuujin.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>,
 syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, deller@gmx.de,
 syzkaller-bugs@googlegroups.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
 <20200928175956.GF24673@neutronstar.dyndns.org>
 <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
 <20200929105203.GG24673@neutronstar.dyndns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929105203.GG24673@neutronstar.dyndns.org>
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>,
 b.zolnierkie@samsung.com, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 gregkh@linuxfoundation.org, deller@gmx.de, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>, daniel.vetter@ffwll.ch,
 jirislaby@kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 12:52:03PM +0200, Martin Hostettler wrote:
> On Tue, Sep 29, 2020 at 10:12:46AM +0900, Tetsuo Handa wrote:
> > On 2020/09/29 2:59, Martin Hostettler wrote:
> > > On Sun, Sep 27, 2020 at 08:46:30PM +0900, Tetsuo Handa wrote:
> > >> VT_RESIZEX was introduced in Linux 1.3.3, but it is unclear that what
> > >> comes to the "+ more" part, and I couldn't find a user of VT_RESIZEX.
> > >>
> > > 
> > > It seems this is/was used by "svgatextmode" which seems to be at
> > > http://www.ibiblio.org/pub/Linux/utils/console/
> > > 
> > > Not sure if that kind of software still has a chance to work nowadays.
> > > 
> > 
> > Thanks for the information.
> > 
> > It seems that v.v_vlin = curr_textmode->VDisplay / (MOFLG_ISSET(curr_textmode, ATTR_DOUBLESCAN) ? 2 : 1)
> > and v.v_clin = curr_textmode->FontHeight . Thus, v.v_clin is font's height and seems to be non-zero.
> > But according to https://bugs.gentoo.org/19485 , people are using kernel framebuffer instead.
> > 
> 
> Yes, this seems to be from pre framebuffer times.
> 
> Back in the days "svga" was the wording you got for "pokes svga card
> hardware registers from userspace drivers". And textmode means font
> rendering is done via (fixed function in those times) hardware scanout
> engine. Of course having only to update 2 bytes per character was a huge
> saving early on. Likely this is also before vesa VBE was reliable.
> 
> So i guess the point where this all starts going wrong allowing the X parts
> of the api to be combined with FB based rendering at all? Sounds the only
> user didn't use that combination and so it was never tested?
> 
> Then again, this all relates to hardware from 20 years ago...

Imo userspace modesetting should be burned down anywhere we can. We've
gotten away with this in drivers/gpu by just seamlessly transitioning to
kernel drivers.

Since th only userspace we've found seems to be able to cope if this ioctl
doesn't do anything, my vote goes towards ripping it out completely and
doing nothing in there. Only question is whether we should error or fail
with a silent success: Former is safer, latter can avoid a few regression
reports since the userspace tools keep "working", and usually people don't
notice for stuff this old. It worked in drivers/gpu :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
