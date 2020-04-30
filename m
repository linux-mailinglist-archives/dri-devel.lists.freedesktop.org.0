Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDC1BF0BB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16326EB47;
	Thu, 30 Apr 2020 07:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225566EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588230236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dnqk8J4NZfmNbFklauTGOEtNDtalY1ujNiDhzXG401M=;
 b=AFoaNXkJaybUjXez2G4QI8H9Xh/mCy6KG1bnny7jipTq9DeI+c0GUeR+Aa5rCqZA+t/diz
 yWi3efec7CLGn/pOZIjjaWmgbP9HTSvJBFmY83gAbFfVvhEFv9WlUOewJca9GcjmUuKPjj
 k3orApnqYvooqh7836EHgy26bkJMHDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-41ymztbLMd6tU_FrBK_QPg-1; Thu, 30 Apr 2020 03:03:50 -0400
X-MC-Unique: 41ymztbLMd6tU_FrBK_QPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09B77108BD0F;
 Thu, 30 Apr 2020 07:03:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2D2C6153B;
 Thu, 30 Apr 2020 07:03:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 890139D98; Thu, 30 Apr 2020 09:03:47 +0200 (CEST)
Date: Thu, 30 Apr 2020 09:03:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/17] drm/mgag200: Remove HW cursor
Message-ID: <20200430070347.jahwjqwcm3kmspla@sirius.home.kraxel.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-2-tzimmermann@suse.de>
 <20200429175107.GC31071@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200429175107.GC31071@ravnborg.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: john.p.donnelly@oracle.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 07:51:07PM +0200, Sam Ravnborg wrote:
> On Wed, Apr 29, 2020 at 04:32:22PM +0200, Thomas Zimmermann wrote:
> > The HW cursor of Matrox G200 cards only supports a 16-color palette
> > format. Univeral planes require at least ARGB or a similar component-
> > based format. Converting a cursor image from ARGB to 16 colors does not
> > produce pleasent-looking results in general, so remove the HW cursor.
> 
> What impact does this have in useability?
> Does the cursor behaviour stay the same or?

xorg/wayland switch to software cursor then.  Shouldn't be a big
difference.  If you wanna check how userspace behaves without g200
hardware you can try qemu.  stdvga (bochs-drm.ko) has no hardware
cursor, virtio-vga (virtio-gpu.ko) has a hardware cursor.

> The patch looks fine, but it seems a bit gross ditching curcor support.
> But maybe it is the right choice, I dunno.

cirrus driver does the same.  The hardware has cursor support, but not
rgba, and it is not used.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
