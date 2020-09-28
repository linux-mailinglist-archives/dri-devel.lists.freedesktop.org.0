Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526027ABBF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 12:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B692389CB5;
	Mon, 28 Sep 2020 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707FD89CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:24:35 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601288674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMSU9xcKJcBn6z9ETPEhLj/MWrekJcU/XVOL610uM2s=;
 b=QGSHeyAgTuMsiOOStWnd9G2679cGkDg+5eOchVZMNWpaGgn2u/MxaOO6HKH21MOYruePFK
 V6RDpVBv0NWWJM0wL1n4jV+CD6KXKiMOTTbLgel7707ScAN3GgLArd/STdpS/CwOR94T7W
 60GFEPIMcZIm9B7A0qY3J54+tEc+wmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-FDPcWzniMkCU6HSD1tH1UA-1; Mon, 28 Sep 2020 06:24:32 -0400
X-MC-Unique: FDPcWzniMkCU6HSD1tH1UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91490186840D;
 Mon, 28 Sep 2020 10:24:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D32427C2A;
 Mon, 28 Sep 2020 10:24:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C3E09CAE; Mon, 28 Sep 2020 12:24:28 +0200 (CEST)
Date: Mon, 28 Sep 2020 12:24:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Message-ID: <20200928102428.23kix246wli3knjs@sirius.home.kraxel.org>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
 <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
 <CAKMK7uGem0wKdmRwmk-ztNZbVW6UFmnPkXWSxicRG1S+8VszbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGem0wKdmRwmk-ztNZbVW6UFmnPkXWSxicRG1S+8VszbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > I don't quite remember where exactly this was implemented. It was not a
> > shared buffer, though. IIRC the buffer allocation code in one of the
> > libs rounded the size towards multiples of 64. I remember thinking that
> > it was probably done for tiled rendering.

Happens when running gnome in wayland mode, so whatever the display
server is in that case (mutter?) or one of the libraries it uses.

> Yeah, but you don't do rendering on dumb buffers. Like ever. So this
> smells like a userspace bug.
> 
> If it's for shared buffers then I think that sounds more reasonable.

Well, wayland can use dma-bufs for buffer sharing between wayland server
and wayland client.  Dunno whenever it also does that for the software
rendering case, and I have absolutely no idea how the buffer allocation
code paths look like.  But possibly it isn't known at buffer allocation
time whenever a given buffer will be touched by a gpu at some point in
the future?

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
