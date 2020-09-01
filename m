Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D99258947
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC696E7D5;
	Tue,  1 Sep 2020 07:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDB26E7D5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:34:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so316290wrx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uBet/qOZ4arKPd9HG45s6/yizvDfyghb5+cpF1ynNlk=;
 b=WvVYlLyur5enfsW0jQmGhW/33TGWeA+s81WiSCZtZGnTGInRKT4lauH7Tv1Ncl35e2
 MBX5Tgg7qp8H8HcEG0u+P7InO1kW6IesVw7yOSV3w6hoG7v7YNwh+0elQjnUhzR8dPSM
 ehQdEWDPud2Aj7A0/V0iRfznqpu4qvj7PURgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uBet/qOZ4arKPd9HG45s6/yizvDfyghb5+cpF1ynNlk=;
 b=UodDMFEbpnfGXiPLZMJWi2AymEo9fps+IrqTJoEln1LP26VDtN+I9YQCbqEc+MiwTd
 ob5HbCQzkyTU+A6lxlQAiIXZ7TUz6oLb7RwcGNo/GPca/4hgRsPJ4Yi+EtQzDIN2TjRb
 21UpUn0Ex0KmBnUNbkwppwbrtMWt03D/ZO6HOjTkBQ6qkZNdNtBzBpMG2JCQCxgX9g0x
 OBcI8Q0E3D6C00KZ2mqxDoEsq+2fVY6oyaSOG7Ef9PgsO61S9y/5O7xXpjKts5CoyCae
 22ls2BfcBQTadJSmR48HZsyLRYIPYp+9Nq5uuNi0xJ/o+PicxuxqobJdFncsYUsxHsOg
 bSqA==
X-Gm-Message-State: AOAM531hal81desHpGzGVeajnn5wIgSTo29GxvUt1lrHo6p7sj1d2iyq
 YPsco6TigTpVVAQwr7AVbedOrA==
X-Google-Smtp-Source: ABdhPJyt8crlnEcBML2lk0r4FJiVx9broYmBFybtfg7pUBuXao0ZikQLrPS8dTTtHkn7WHCj3P0hHw==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr408449wrj.110.1598945675900;
 Tue, 01 Sep 2020 00:34:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 2sm831925wrs.64.2020.09.01.00.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:34:35 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:34:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] drm/virtio: fix unblank
Message-ID: <20200901073433.GS2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Slaby <jirislaby@kernel.org>, David Airlie <airlied@linux.ie>,
 1882851@bugs.launchpad.net,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
References: <20200818072511.6745-1-kraxel@redhat.com>
 <20200818072511.6745-2-kraxel@redhat.com>
 <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
 <20200828112759.rmeeh5bonrewiqte@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828112759.rmeeh5bonrewiqte@sirius.home.kraxel.org>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 1882851@bugs.launchpad.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 01:27:59PM +0200, Gerd Hoffmann wrote:
> On Mon, Aug 24, 2020 at 09:24:40AM +0200, Jiri Slaby wrote:
> > On 18. 08. 20, 9:25, Gerd Hoffmann wrote:
> > > When going through a disable/enable cycle without changing the
> > > framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
> > > skip set_scanout if framebuffer didn't change") causes the screen stay
> > > blank.  Add a bool to force an update to fix that.
> > > 
> > > v2: use drm_atomic_crtc_needs_modeset() (Daniel).
> > > 
> > > Cc: 1882851@bugs.launchpad.net
> > > Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't change")
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > Tested-by: Jiri Slaby <jirislaby@kernel.org>
> 
> Ping.  Need an ack or an review to merge this.

In case you still need that, on both patches:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> thanks,
>   Gerd
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
