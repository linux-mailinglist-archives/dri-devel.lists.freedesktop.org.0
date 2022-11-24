Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4736372E0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 08:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F4D10E163;
	Thu, 24 Nov 2022 07:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E659910E163
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 07:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669274995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bTI6njseVR+SJYrnLmEsAgR/iOZqJjjFs8hwOBW7QoE=;
 b=dBJnxJdjiw0YdDMxV3fZi/sZT55m6LVF68ol7VQsjezUShhmMDas0J0kKXbOQprKGW52Ka
 GxshCbC1fQUlFb2PaaPTWblYqKPqDyPnH+3jbWTaFVoA8/Sgzi2O1jMxB6Yhp47w56hKhj
 htvRztODLJm47YjVWW3AYAh7fQQzkIw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-gMryAAnqPKGMWM7c5YgH5w-1; Thu, 24 Nov 2022 02:29:52 -0500
X-MC-Unique: gMryAAnqPKGMWM7c5YgH5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9512585A59D;
 Thu, 24 Nov 2022 07:29:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0FD4EA61;
 Thu, 24 Nov 2022 07:29:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8424180039D; Thu, 24 Nov 2022 07:51:48 +0100 (CET)
Date: Thu, 24 Nov 2022 07:51:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555
 and RGB565 formats
Message-ID: <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local>
 <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > > +#ifdef __BIG_ENDIAN
> >
> > Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> > scanout registers, so could supprt this unconditionally if there's no
> > #ifdef around the format defines. Some drivers might then also want a
> > DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> > bikeshed.
> 
>  "Limit this to big-endian platforms, as there is currently no need
>  to support these formats on little-endian platforms."
> 
> Will anyone make use of this? In theory, all of the 16-bpp formats
> can have a big-endian counterpart.

Highly unlikely.  Dealing with 16-bpp formats in non-native byte order
is a PITA because it isn't enough to simply adjust the masks and shifts
to pick the correct bits and be done with it.

The qemu stdvga happens to have a register to switch framebuffer
byteorder (so both x64 and ppc are happy), and the bochs drm driver
actually supports that no matter what the cpu byte order is, but it
supports only DRM_FORMAT_XRGB8888 + DRM_FORMAT_BGRX8888.

Supporting 16 bpp in the driver wouldn't be that much of a problem, but
processing the framebuffer on the host side when emulating a big endian
guest on a little endian host is painful.  I think I can't ask pixman to
do a conversation from DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN to
DRM_FORMAT_XRGB8888 on a little endian machine.

take care,
  Gerd

