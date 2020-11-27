Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41212C6875
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DD66EE46;
	Fri, 27 Nov 2020 15:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF17A6EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:09:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p8so5909994wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9VmoUHkcSYuVMI/yJkCFQIr4oYdNbC60zl32PtTl5m8=;
 b=FazESORPPR9vIRpsNKCJHfZWP0EsIA0Yja/bMoSSPbj43G6l6jBQjeFKt3C2YUCgWO
 dC368jMu9o1mAwGoJrCJyljUPqqbmJvRlTgaJ9I42dXBmMvhlUl2z1dYKKzizpwUFmeV
 hTqwhnWJY4fjlLHfUmPRhMXToQSWlgKxacU+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9VmoUHkcSYuVMI/yJkCFQIr4oYdNbC60zl32PtTl5m8=;
 b=I/RAa2wv2fdRDMmLH5lMisZ5VRkhVEABN2lEnszjNmt5K/k0cuFI2j3METHv1IbtGm
 N9TtrNajAqELJQBq250s6W2Gugz9/mMdKYcNITgeG3emngTnuJbznM1kVqNQ0zcqWZAY
 U8AVMFY4I7KXOvGq2eUXqm/47hoZfeVT0lQnAuihHb3V8fT7uppOPka52S/liDxpz13o
 LBaz7itF6OHGZdVFQKjAMGn7JNQs94vhsfVVfPby8ZdNTiBAWOJiwtCCDmAVjssW3qlA
 v3WGq5CfjFUV97Ih4p2lEGZS5eRyJ5OszM0EJAtIOmrGCXULjL4xvvaf/vIN5L80PYqX
 DAhg==
X-Gm-Message-State: AOAM530e0D9Jr0EKMQMoNh4cxfsnnvg2n7dukDBoP/NB9y//zsRRxqTa
 R0UGApKbwXn4kugP/nOCkt0gRw==
X-Google-Smtp-Source: ABdhPJxSN8cmDhEw3ED/+sLUy8P0F4+YnpzAZBFMdqpctDeMhAwl3qm3NGZSDRHW+5YsQupA+erqcA==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr11423465wrp.209.1606489785609; 
 Fri, 27 Nov 2020 07:09:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b73sm22011233wmb.0.2020.11.27.07.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:09:44 -0800 (PST)
Date: Fri, 27 Nov 2020 16:09:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/radeon: fix check order in radeon_bo_move
Message-ID: <20201127150942.GF401619@phenom.ffwll.local>
References: <20201125143424.1434-1-christian.koenig@amd.com>
 <CAKMK7uF7SZ_ihX+s6Rxg8Ws96vViu8Ab2vN+6VysWeDRkQMbNg@mail.gmail.com>
 <CAPM=9txqSCUcCoYKXxC6bX5Qx1SEBG4MPNTdKRybogwyOsZg5w@mail.gmail.com>
 <66a8a6f5-af8b-a46f-0dfa-417dd699b58f@gmail.com>
 <CAKMK7uEurRUDsK58xAiJ98xQckCeL6p+hFvbkx8AP6HAW-EsDw@mail.gmail.com>
 <5a88c54c-3731-856a-da3c-b084c9b33187@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a88c54c-3731-856a-da3c-b084c9b33187@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 03:49:31PM +0100, Christian K=F6nig wrote:
> Am 27.11.20 um 15:46 schrieb Daniel Vetter:
> > On Fri, Nov 27, 2020 at 3:10 PM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 27.11.20 um 09:31 schrieb Dave Airlie:
> > > > Oops sorry for delay LGTM
> > > > =

> > > > Reviewed-by: Dave Airlie <airlied@redhat.com>
> > > Thanks.
> > > =

> > > > On Fri, 27 Nov 2020 at 02:34, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Wed, Nov 25, 2020 at 3:34 PM Christian K=F6nig
> > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > Reorder the code to fix checking if blitting is available.
> > > > > Might be good to explain why blitting might not be available, e.g.
> > > > > suspend/resume and or chip death and stuff like that.
> > > > > =

> > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > Needs Fixes: 28a68f828266 ("drm/radeon/ttm: use multihop")
> > > Why does the subject of the patch needs to be in "()" ? I was already
> > > wondering why dim sometimes complains about my Fixes tag.
> > Hm I thought that's the official style. I kinda hacked around on it
> > until linux-next stopped complaining about our Fixes: tags. Maybe it's
> > not quite accurately reflecting the current bikeshed. Iirc checkpatch
> > even complains when you leave out the commit before the sha1, at least
> > in free-form text in the commit message.
> =

> Well "git log -1 --oneline 28a68f828266" gives me:
> =

> 28a68f828266 drm/radeon/ttm: use multihop
> =

> Which is what I would naturally expect here, but no idea what the official
> format should be.

dim cite $sha1 is our attempt at modelling it. And yeah it's just
bikeshedded differently for no good reason. And I just noticed that dim
cite doesn't include the commit before the sha1.
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > > > Btw
> > > > > =

> > > > > $ dim fixes [sha1]
> > > > > =

> > > > > generates that for you plus nice cc list of offenders. With the F=
ixes
> > > > > line added:
> > > > > =

> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Thanks,
> > > Christian.
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
