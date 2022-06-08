Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29BF542ACB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DED10E3AE;
	Wed,  8 Jun 2022 09:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F110E3A4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654679477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mce/AbWJS8N2abWnygb+NCcQbErCMoK/WZZka14SPg=;
 b=ZBpQfhIldPL1wv9SnXyc8D3G5+Mm1hPp3L8M7GbrpAvZjaK3ySEltNzzKmDuuugRdyPfnW
 Q/j3J11ofQIkN7rf11UWvYo8xDgLmv4gC1WMzj3yuEvm2HXt/stNu6rOToOZ3fNeGxM9Rd
 k/6ORZsCvwKFtKSHuItjyuD8PmM+0RA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-ecap_Jd4Puen-NXH4ANqQw-1; Wed, 08 Jun 2022 05:11:14 -0400
X-MC-Unique: ecap_Jd4Puen-NXH4ANqQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8633685A583;
 Wed,  8 Jun 2022 09:11:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49AFC40CF8E8;
 Wed,  8 Jun 2022 09:11:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B2E2B18003AA; Wed,  8 Jun 2022 11:11:11 +0200 (CEST)
Date: Wed, 8 Jun 2022 11:11:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Improve vfio-pci primary GPU assignment behavior
Message-ID: <20220608091111.wx2dbboxg2ntuapw@sirius.home.kraxel.org>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
 <20220608074306.wyav3oerq5crdk6c@sirius.home.kraxel.org>
 <b8eee5a7-7428-fcfd-9266-fa63b9fde5e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8eee5a7-7428-fcfd-9266-fa63b9fde5e9@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: tzimmermann@suse.de, kvm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> >> But also, this issue isn't something that only affects graphic devices,
> >> right? AFAIU from [1] and [2], the same issue happens if a PCI device
> >> has to be bound to vfio-pci but already was bound to a host driver.
> > 
> > Nope.  There is a standard procedure to bind and unbind pci drivers via
> > sysfs, using /sys/bus/pci/drivers/$name/{bind,unbind}.
> >
> 
> Yes, but the cover letter says:
> 
> "Users often employ kernel command line arguments to disable conflicting
> drivers or perform unbinding in userspace to avoid this"

Thats helpful at times to deal with driver and/or hardware quirks.
Example: Years ago drm drivers used to be horrible when it came to
unbind, leaving oopses and panics left & right when you tried (luckily
it works much better these days).

[ leaving this here for completeness, snipping the remaining reply,
  noting that we are on the same page now ]

thanks & take care,
  Gerd

