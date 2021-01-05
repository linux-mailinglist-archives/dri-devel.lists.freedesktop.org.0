Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AD2EA968
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A636E0D0;
	Tue,  5 Jan 2021 11:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC66E0D0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609844688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9l0tND+UxcCMLDlOD7Ol3zZinY+fs8qgyUo+4LEabfk=;
 b=atw2Y/3QsauLFsszuPQnqO4rlqbwZwJv4w16K4tOmCRuzB8LIZkjd13blL1xp7IpAbNQyn
 /08ZpOLJBynMCvC7pFyZUrfrtQCTVPiHfYb3oMj1wKWFXQi3QTY/y3h/y+2ZItNIJ0lkfO
 EHHYxE6ifOtXae3ohCtBAcFxX4jo2x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-p0Bee2lZNj-8jO8rBHNv6A-1; Tue, 05 Jan 2021 06:04:44 -0500
X-MC-Unique: p0Bee2lZNj-8jO8rBHNv6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05435107ACE3;
 Tue,  5 Jan 2021 11:04:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-209.ams2.redhat.com
 [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA0F5D9CC;
 Tue,  5 Jan 2021 11:04:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3994A1800099; Tue,  5 Jan 2021 12:04:38 +0100 (CET)
Date: Tue, 5 Jan 2021 12:04:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
 <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > It's not possible to do page flip with this virtual device. The call to
> > SYNTHVID_VRAM_LOCATION is only honoured once. So unfortunately need to
> > use SHMEM helpers.
> 
> I was thinking about using struct video_output_situation.vram_offset; in
> case you want to tinker with that. There's a comment in the patch that
> vram_offset should always be 0. But this comment seems incorrect for devices
> with more than one output.

Where does the comment come from?  fbdev drivers support a single
framebuffer only so for a fbdev driver it makes sense to set the offset
to 0 unconditionally.  With drm you probably can handle things
differently ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
