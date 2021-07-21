Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D56B3D0C8D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 12:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE06D6E8A3;
	Wed, 21 Jul 2021 10:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17C6E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626864580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F3RQTKa3gf+g0XLLKgSHTzce5vFg2zB1K4M/uNdXGCI=;
 b=Ah8YfRzmXovTNrQbCShKgj+iPZWz/rR/Kdguu5dux9HudOC7fMhBlQuAWL39QWd8uIz9zz
 OKtic3wY3JSrZ0ppxHcQ3lNazJdxfIOguGN+ChIeoO9QmgOOrrHx5iWwdmp2lDd/P2pQEH
 FHSSfp/qdFl6AWabJdkobTdtFYCzllQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-DcNLpZOuM-2d9izdkDpZbg-1; Wed, 21 Jul 2021 06:49:36 -0400
X-MC-Unique: DcNLpZOuM-2d9izdkDpZbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBECF107BEF5;
 Wed, 21 Jul 2021 10:49:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D448461E;
 Wed, 21 Jul 2021 10:49:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA07018000B2; Wed, 21 Jul 2021 12:49:33 +0200 (CEST)
Date: Wed, 21 Jul 2021 12:49:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: understanding virtio-gpu
Message-ID: <20210721104933.ncvs3oku2lxiaix5@sirius.home.kraxel.org>
References: <6cd88dd5-edaa-de0b-754d-754b5cb71285@metux.net>
MIME-Version: 1.0
In-Reply-To: <6cd88dd5-edaa-de0b-754d-754b5cb71285@metux.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> 1. virtio_gpu_pci_quirk():
> 
>   * what is the explicit framebuffer removal about ?

unregister boot framebuffer (typically efifb or vesafb on x86).

>   * why is it necessary to rename the device with "pci:" prefix ?
> 
>     does it only work w/ pci transport ?
>     what's the background of this ?

IIRC an Xorg hardware probing quirk.

>   * shouldn't we add some endianess handshake to the protocol ?

Doable, but worth the effort?  Which bigendian hardware platform has
hardware-accelerated mesa opengl drivers?  With even ppc moving to le
these days s390x is the only relevant bigendian platform left, and it
isn't exactly famous for their graphics performance ;)

take care,
  Gerd

