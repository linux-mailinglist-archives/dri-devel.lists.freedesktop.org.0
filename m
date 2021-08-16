Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1673ECDC3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 06:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C46F8808E;
	Mon, 16 Aug 2021 04:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD5E89B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 04:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629089161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x/koUi1kpfz563cDv3JNvArId4m5JWPZYGaR4q3ae3U=;
 b=IbqJpeziQB++kI837V/ARpIV9goXASYcANEaiSIvxqJWlsOXb3IPcUDJ0XVcNlccgHtbOm
 WHIaVxqUhsiA7JWCny+E0METhLk6k5W3lP8ixlOevjLxREyYerbR+dhPFlNo5L6puJ+ugj
 xH+UdLeflYlvj2hywjomQOKy1joB0h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-ZGYHKk5CPiC-eoVzjMcdbQ-1; Mon, 16 Aug 2021 00:45:59 -0400
X-MC-Unique: ZGYHKk5CPiC-eoVzjMcdbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 946FB1008060;
 Mon, 16 Aug 2021 04:45:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 607DA10013D6;
 Mon, 16 Aug 2021 04:45:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B17D01800382; Mon, 16 Aug 2021 06:45:56 +0200 (CEST)
Date: Mon, 16 Aug 2021 06:45:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: lepton <ytht.net@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Why we didn't use embedded gem object for virtio gpu when making
 ttm bo a gem bo subclass?
Message-ID: <20210816044556.iqkdatwbkdig2pr2@sirius.home.kraxel.org>
References: <CALqoU4wAf2EcedVJ+favUQv+3Pfj-3_OvONGY=ae3a6zrk2_OA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALqoU4wAf2EcedVJ+favUQv+3Pfj-3_OvONGY=ae3a6zrk2_OA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 12:42:51PM -0700, lepton wrote:
> Hi Gerd,
> 
> We found a bug in 5.4 kernel and virtgpu_gem_prime_mmap doesn't work
> because it references vma_node in gem_base object while ttm code
> initialized vma_node in tbo.base object. I am wondering, in your
> original serial:
> https://patchwork.kernel.org/project/dri-devel/cover/20190805124310.3275-1-kraxel@redhat.com/
> (drm/ttm: make ttm bo a gem bo subclass), why you changed to use
> embedded gem object for most gpu drivers but skipping virtio gpu? Is
> there some specific reason?

commit c66df701e783bc666593e6e665f13670760883ee
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Aug 29 12:32:57 2019 +0200

    drm/virtio: switch from ttm to gem shmem helpers

HTH,
  Gerd

