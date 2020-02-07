Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3452B1557E4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 13:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785A86FC6C;
	Fri,  7 Feb 2020 12:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8856FC6C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581079153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IwNz7m8EBxgaV/gA8k+cJl/cgQQuSz8wqKKuyY3Q8c=;
 b=SJSezu3VpGPCtR/7BUxTxf/uSTxGD0A+MAshzdi7xCOBMnhNmnHKrwVTIZo6OTBgQPw2Pg
 BbER/CQLhA6ZGiISN+6lW74LNHz4bHEmcdQkA7Iafg9acBLKbVeqG/8C/U/ZgDhO2tdAV7
 In86+ggS2jmQtNWs2/hzeuoC1ucAUpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-8tXZMvjUMeS2wSNC7jAClg-1; Fri, 07 Feb 2020 07:39:07 -0500
X-MC-Unique: 8tXZMvjUMeS2wSNC7jAClg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC52800E21;
 Fri,  7 Feb 2020 12:39:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A617487B1C;
 Fri,  7 Feb 2020 12:39:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E73C5A1E0; Fri,  7 Feb 2020 13:39:04 +0100 (CET)
Date: Fri, 7 Feb 2020 13:39:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200207123904.vvueifnbcfzlb7gx@sirius.home.kraxel.org>
References: <20200207115744.4559-1-kraxel@redhat.com>
 <04783a3f-daae-47a3-d2a7-d42f192daf23@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04783a3f-daae-47a3-d2a7-d42f192daf23@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, marmarek@invisiblethingslab.com,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 01:06:00PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.02.20 um 12:57 schrieb Gerd Hoffmann:
> > Shutdown of firmware framebuffer has a bunch of problems.  Because
> > of this the framebuffer region might still be reserved even after
> > drm_fb_helper_remove_conflicting_pci_framebuffers() returned.
> 
> Out of curiosity: what's going wrong here?

Very short version: userspace keeping /dev/fb0 open delays
firmware framebuffer deinit.

Long version by Daniel Vetter:
https://www.spinics.net/lists/linux-fbdev/msg28178.html

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
