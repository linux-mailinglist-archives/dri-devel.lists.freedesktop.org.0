Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B3281310
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D46E94C;
	Fri,  2 Oct 2020 12:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430AC6E94C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:45:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 13so1570175wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=wFV5imeeVNh4aFNipAcfdjblW/ZOSyL9D39PK7KSmYo=;
 b=lWxGJoebMl3Ow+l/cLANA9HhBH3zJXSC8xy+gtbKmRCNZf7WDvBhpyDDf83Zz5iQFC
 j5b61CbPjBbeYKNb5XcJ48lV5DcDUV8mFTEGv+dRdnlL/n6mucyiuK6rch3ueoR2B+bd
 tCbjia8xLyjBuvY2Ss7GvcAQ6mXD1/P8aULn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=wFV5imeeVNh4aFNipAcfdjblW/ZOSyL9D39PK7KSmYo=;
 b=s5VrLmlsO3hrQxuWbi24tFHzuPFQrzlWj1om3NNmpw+jCHfQGtd0rt7kRP5/XvzthG
 b512WPDOwe2NqXSQWQXoRA9/oGIzMljoQmM59oHjPps+9qiq8/ZRNOR5+X54wwTd1a/C
 u/KtD04mco796ivCEGJZQQ3wNoJO2FdgpVKhSe2QwwnAimPD91QFSqv5R7drwb3THVGo
 emT6sG8hF1AEY+lGKdcVbCiim6GhYScmfa+I53615QK02bV2y5KXYCc8tTUF2OG8+nQ8
 h8VzgKbSyO1moxYrNDpPqXkmxY8HCmtjYSI0l22J7cdmHLo3uoenF/FoqTxAnmqknd9G
 boCg==
X-Gm-Message-State: AOAM533FEA5CO2akKgXMC/RoOQN5r6NuQz+qeuYQvDOej7PCKiguSI68
 b5HOYM3qnxLEwn+rhS9WuChHnw==
X-Google-Smtp-Source: ABdhPJy1lt6kNIxeUs6/VE8gsVST8rl8/txotIGZob4YZPT7AgI1xK1NnarLou4liJCfaYVaPQX8LA==
X-Received: by 2002:a1c:5a05:: with SMTP id o5mr2589737wmb.7.1601642732877;
 Fri, 02 Oct 2020 05:45:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u13sm1616278wrm.77.2020.10.02.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 05:45:31 -0700 (PDT)
Date: Fri, 2 Oct 2020 14:45:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 0/2] Add configurable handler to execute a compound
 action
Message-ID: <20201002124529.GI438822@phenom.ffwll.local>
Mail-Followup-To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20201002123158.GA3346786@kroah.com>
 <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
 <9bd7ff2e-ddf3-f950-54ad-c143e9c60daa@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bd7ff2e-ddf3-f950-54ad-c143e9c60daa@collabora.com>
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 02:36:33PM +0200, Andrzej Pietrasiewicz wrote:
> W dniu 02.10.2020 o=A014:33, Andrzej Pietrasiewicz pisze:
> > W dniu 02.10.2020 o=A014:31, Greg Kroah-Hartman pisze:
> > > On Tue, Aug 18, 2020 at 01:28:23PM +0200, Andrzej Pietrasiewicz wrote:
> > > > This is a follow-up of this thread:
> > > > =

> > > > https://www.spinics.net/lists/linux-input/msg68446.html
> > > =

> > > lore.kernel.org is easier to pull stuff from :)
> > > =

> > > Anyway, what ever happened to this series?=A0 Is there a newer one
> > > somewhere?
> > > =

> > > thanks,
> > > =

> > > greg k-h
> > > =

> > =

> > https://lkml.org/lkml/2020/8/18/440
> > =

> > Andrzej
> =

> Sorry about confusion.
> =

> This is the same thing, so there is nothing newer.

Maybe split out the s/V/v/ in drm so I can pick that up? Alternatively
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> if Greg takes it all.

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
