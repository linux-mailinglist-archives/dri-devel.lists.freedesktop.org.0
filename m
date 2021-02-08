Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4A312FAC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 11:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51176E880;
	Mon,  8 Feb 2021 10:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561656E88A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612781641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQVbdOsEZJXaBu6WmqIHG/d67j0agxNgNmLPFRLrqY8=;
 b=hn/ilxXDQBgNIwgi61JAYzqHxG+qBF6wRPY0D+p2FXa5dGzEUkQ533KdWP13lKZKAgfJLs
 5gVC3augFmYWbe+Xh/JdtLGqdMeF1K4ay/6enisOtehgVGzrdEq4osLI15/b7waGUlN4FB
 uHYe2858AmraYs6Iw0thrswAapVZPeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ZnCfFjIEOueUOJ1oojTEqw-1; Mon, 08 Feb 2021 05:53:57 -0500
X-MC-Unique: ZnCfFjIEOueUOJ1oojTEqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D65CC62B;
 Mon,  8 Feb 2021 10:53:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com
 [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BAB5D9DD;
 Mon,  8 Feb 2021 10:53:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F28A91800D5D; Mon,  8 Feb 2021 11:53:52 +0100 (CET)
Date: Mon, 8 Feb 2021 11:53:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
Message-ID: <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
 <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
MIME-Version: 1.0
In-Reply-To: <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 07, 2021 at 07:33:24PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.02.21 um 10:05 schrieb Gerd Hoffmann:
> >    Hi,
> > 
> > > I smoke-tested the code by running fbdev, Xorg and weston with the
> > > converted mgag200 driver.
> > 
> > Looks sane to me.
> > Survived cirrus smoke test too.
> > 
> > Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> I had to add one additional patch to v2 of this patchset to make things work
> with module-only builds. If you have a minute, could you ack this as well?
> Thanks!

Works fine too.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
