Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691736D54C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 12:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70296EB03;
	Wed, 28 Apr 2021 10:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A56EB04
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:01:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so4788997wry.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AwCigqyzYECkqxWIhQoT8XfofzwB/nqaJFQ3l9EoSRc=;
 b=lmr4Zx1TVAd+VpltPHZIDWxj7WjuF5m1rvK6eQIjuDpNPRBmp5pSIKUvUiFkunU0hg
 XKYyxERGc7Qksu2kvpskjn4Z1o/R57f7m3JuAWTb573gQ9MohkoJWBapTyuhYgwdU9gT
 GEl3ZMICEN+9ufshly/DXFKs29t250XJjIUrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AwCigqyzYECkqxWIhQoT8XfofzwB/nqaJFQ3l9EoSRc=;
 b=ePd2snKsYDKYIpHuPQERb8hyEsu5+ayHhQkNSXgTuJT5x9vwr931Grgop4k4lstc3a
 lxb3gj+Y0GEyXMXtKHeP8I1+J8SQCENYQbv+zBfCyQTmVpH5+HTncSLTHR/cCSFU8fea
 ViL/rD+c7rBJHc9Eema4wsUeIPse7vWh3pnQE6D+QALw9oATWJ/WB5IRnqns+3MJ+loZ
 Pa254BKO4s+1L73PRuJ+Q6e8dD8harxB8a2MQeSeEytvTdMd/DiIvECDu8HT3VtE98pi
 xeqc6xyy15bQMBvW+mLDwXhgYiCAEqaDvTmyd9uoxV1jM8YXmQuN0l6zcY7H/igEFVV9
 64fA==
X-Gm-Message-State: AOAM530OGggidioZYHIZ567yz5STXHvr0cGa0V528sF7ZF8PZGlwkN23
 zQ1mHv79MPpqnNgIstOX/qfWIQ==
X-Google-Smtp-Source: ABdhPJyT0oAMrom6JJuehUHJ+roWJB1XXsDxgGYRMdYQacVP0c6KrqZ1SiThQYXos6PDPqiVV6HC/Q==
X-Received: by 2002:a5d:6a84:: with SMTP id s4mr18671425wru.178.1619604103733; 
 Wed, 28 Apr 2021 03:01:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l13sm7131611wrt.14.2021.04.28.03.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:01:43 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:01:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIkyhZ9OleISMSGs@phenom.ffwll.local>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <Z2lezWwTor_DcjuKJjjxZ1CsyzBEWodc15u50cf_VrlRvK2_X36YR4drAEJ7nSJKe7tKzA6U2b6ahbu_fLrAl6M-VtO6kZ9leecS5EvLV2Q=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2lezWwTor_DcjuKJjjxZ1CsyzBEWodc15u50cf_VrlRvK2_X36YR4drAEJ7nSJKe7tKzA6U2b6ahbu_fLrAl6M-VtO6kZ9leecS5EvLV2Q=@emersion.fr>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 06:27:27PM +0000, Simon Ser wrote:
> On Tuesday, April 27th, 2021 at 8:01 PM, Alex Deucher <alexdeucher@gmail.com> wrote:
> 
> > It's an upcoming requirement for windows[1], so you are likely to
> > start seeing this across all GPU vendors that support windows. I
> > think the timing depends on how quickly the legacy hardware support
> > sticks around for each vendor.
> 
> Hm, okay.
> 
> Will using the existing explicit synchronization APIs make it work
> properly? (e.g. IN_FENCE_FD + OUT_FENCE_PTR in KMS, EGL_KHR_fence_sync +
> EGL_ANDROID_native_fence_sync + EGL_KHR_wait_sync in EGL)

If you have hw which really _only_ supports userspace direct submission
(i.e. the ringbuffer has to be in the same gpu vm as everything else by
design, and can't be protected at all with e.g. read-only pte entries)
then all that stuff would be broken.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
