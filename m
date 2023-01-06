Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C76609AB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 23:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D7E10E170;
	Fri,  6 Jan 2023 22:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563E310E170
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 22:46:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2113269wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 14:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzqP04USoFIby+HEXep+3hJAGRxvsp5L+xLira7xfHg=;
 b=gfw7TY3dKnUK/QGyYCdXS9j6zn3HRs3r64YEs5PPtxKUu5b7cb1NGSMmS4vCE3qSuU
 OvSSUAFk+9rBRp9a9JJFYCGhVGlgfJ3lDjIDIqPTV7nKzXonqiDG4DB5+WkRIE1QfLXi
 wKnqyXYXC1u+fLaTfS+Sh20g7fQvee7Wjysx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nzqP04USoFIby+HEXep+3hJAGRxvsp5L+xLira7xfHg=;
 b=s3fDT8+ap1MVod3N43OKBEbYImJfyo11n5k59MUv8NeeibfGWqd4/cbnaql/cBgI/i
 csFe4ldKQh6IdK+qdoHNNEbH1LoqNQoY8u/R6rnTjdpnoTsF8VJsNk7GpuxDz+Z7y5Qf
 APUvKr8aVRj6LwFiL3hGVSvZq/yo/4TnCuFsPbOMPt+OO/eFYjCSiAbr+4UZj0glrWmw
 GA5elnJIM/zhtW70/yNtWZJDI72M3Fm+rAdHxesHwQGfJZBi5Rkd7nqNDjf7kxYeSrAB
 eyK+ZFBc62nzk7aufQEihGF8ig6A8dOqrcxfQkjBn+mRrE7NfChzhUjbzVSVn0CuH1Kf
 IHng==
X-Gm-Message-State: AFqh2ko6rfnl9V3fX9nJANERT2CU0Eub2ODyKj1W/lOAnAVIk+lfGxbG
 q9glcA3Qd9lHWfknI/b9LOqZiQ==
X-Google-Smtp-Source: AMrXdXslz4blP81M3W6GoFIqzvARXTxMb6uRo+Cakzp+vFWOecq/6a74aUHECo6VNF8l8x7L4fm6JQ==
X-Received: by 2002:a05:600c:ace:b0:3d1:fe0a:f134 with SMTP id
 c14-20020a05600c0ace00b003d1fe0af134mr40601523wmr.19.1673045214780; 
 Fri, 06 Jan 2023 14:46:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003c5571c27a1sm3771606wmq.32.2023.01.06.14.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 14:46:54 -0800 (PST)
Date: Fri, 6 Jan 2023 23:46:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hang Zhang <zh.nvgt@gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
Message-ID: <Y7ik3ONV5ba7UXQB@phenom.ffwll.local>
Mail-Followup-To: Hang Zhang <zh.nvgt@gmail.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
 <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
 <Y7hvhtHeivfsnBtE@phenom.ffwll.local>
 <CAO2zrtb9H=OWPbrgmqTxQnHqETt-P4K6AxiwdtN7guxUYL2NCw@mail.gmail.com>
 <Y7h++5sU/hGJ/yTS@phenom.ffwll.local>
 <CAO2zrtaB3GZRSzgWu2kV_jTojwuhtL_kFz0gpzPPVGe9D8kVbQ@mail.gmail.com>
 <Y7iQckF/6EMYVpQt@phenom.ffwll.local>
 <CAO2zrtY+mMBTLimW6aZhOGFqqw53EVdP0CT8ieW6iVUXevZ7ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO2zrtY+mMBTLimW6aZhOGFqqw53EVdP0CT8ieW6iVUXevZ7ag@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:12:57PM -0500, Hang Zhang wrote:
> On Fri, Jan 6, 2023 at 4:19 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Jan 06, 2023 at 03:25:14PM -0500, Hang Zhang wrote:
> > > On Fri, Jan 6, 2023 at 3:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Fri, Jan 06, 2023 at 02:58:27PM -0500, Hang Zhang wrote:
> > > > > On Fri, Jan 6, 2023 at 1:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > BTW, if this is worthed a fix and the performance of console_lock() is a
> > > > > major concern, then I think there may be alternative solutions like adding
> > > > > a lock_fb_info() to the free call chain - if that's better in performance,
> > > > > or maybe selectively protect the matroxfb ioctl but not vblank ioctl as you
> > > > > mentioned.
> > > >
> > > > Please start out with explaining what kind of bug your checker is seeing,
> > > > and why. Not how you're trying to fix it. Because I'm pretty sure there
> > > > isn't a bug, but since I've already spent a pile of time looking at this,
> > > > I want to make sure.
> > >
> > > We are sorry for the inconvenience caused, we'll follow these practices and
> > > guidelines in the future. Thank you!
> >
> > Once more: Please explain what you're static checker is seeing. I want to
> > understanding this, and I'm hoping at least someone involved in this
> > static checker can explain what it thinks is going on.
> >
> > Thanks, Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> Thank you for your interest, Daniel. The checker tries first to find
> the free and
> use sites of a certain object (in this case "fb_info"), then reason
> about whether
> the use can actually happen after the free (e.g., taking into account
> factors like
> state set/check, locks, etc.), if so, it will flag a potential
> use-after-free. As a static
> checker, is doesn't execute a program or generate a PoC. We then manually
> review each flagged issue by inspecting all related code. In this
> case, the checker
> (and us) are unaware of the lifetime management logic, which may cause
> problems.

Lifetime management is and absolute basic part in the linux kernel. So if
your checker flags every free which isn't protected by a lock, then you'll
creating endless amounts of false positives. Is this really what you're
doing?

I'm still very confused ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
