Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7F366626
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 09:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A926E12E;
	Wed, 21 Apr 2021 07:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68B6E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618989589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpJvWuAak+WCSJcZ0A3y08kYBdBcvdyj4u51SSX61Nc=;
 b=RvAS1v6Dvz2wHqvQJA8pxXCwrD+8vEPe3O/vsOZnRmIAILKFq/C9dMMv9DaG0Ki4FbH36D
 7WkWUyvEU3DhrUY2Oyq1iYIt9HAzXkPeke97lwy1iGeqbDIPLTWkZCwwUS0Ku3TGeB9HR5
 PP01shwTKRmDMpl5gsjc3TnR7mnh5To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ZEMhuHKQPiSF4Io-fVMqtQ-1; Wed, 21 Apr 2021 03:19:45 -0400
X-MC-Unique: ZEMhuHKQPiSF4Io-fVMqtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442C9343A2;
 Wed, 21 Apr 2021 07:19:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 057321007604;
 Wed, 21 Apr 2021 07:19:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6AF14180084D; Wed, 21 Apr 2021 09:19:42 +0200 (CEST)
Date: Wed, 21 Apr 2021 09:19:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bochs: Add screen blanking support
Message-ID: <20210421071942.eyzbao63pn54loj2@sirius.home.kraxel.org>
References: <20210420165659.23163-1-tiwai@suse.de>
 <6d2f59c0-113f-2d9e-1fb3-a794dafbd74a@suse.de>
MIME-Version: 1.0
In-Reply-To: <6d2f59c0-113f-2d9e-1fb3-a794dafbd74a@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > However, a tricky part is that the QEMU vga code does treat VGA_ATT_IW
> > register always as "flip-flop"; the first write is for index and the
> > second write is for the data like palette.  Meanwhile, in the current
> > bochs DRM driver, the flip-flop wasn't considered, and it calls only
> > the register update once with the value 0x20.
> > 
> 
> Unless bochs does things very different, the index should first be reset by
> reading 0x3da. Then write the index, then the data.
> 
> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/vgareg.htm#attribute

bochs should follow standard vga logic here.
Also a bochs_set_blank(true/false) helper function probably makes sense.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
