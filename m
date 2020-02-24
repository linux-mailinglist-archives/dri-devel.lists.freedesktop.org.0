Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28018169FCC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 09:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267AF6E171;
	Mon, 24 Feb 2020 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080C96E171
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582532056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HofajG8Thk+9pvlBPBHW8l0F0JUnZ2ab75YJ2dkMXxY=;
 b=C5ZFws/UU6teWf1zsDL4KyUtk8NP/rsv/Rbn+Riz1epiy3eTYVeC5JZpcjFSsyZtbw1lsq
 5XsxZkCRORqVKNOKhiweohxPLXi8D1Y9GpU4+PfnCShS8ZKf7uhKZv9aO7DbtrBj4wJMc+
 7+MgO5fm6Whl9XZQwDg7bIiMC9MZigc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-4EyumPL-MTK2MSPuaMCMlg-1; Mon, 24 Feb 2020 03:14:14 -0500
X-MC-Unique: 4EyumPL-MTK2MSPuaMCMlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C305318C8C00;
 Mon, 24 Feb 2020 08:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F681001902;
 Mon, 24 Feb 2020 08:14:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D70EF1747F; Mon, 24 Feb 2020 09:14:09 +0100 (CET)
Date: Mon, 24 Feb 2020 09:14:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 28/52] drm/bochs: Remove leftover
 drm_atomic_helper_shutdown
Message-ID: <20200224081409.htxwzgavauh6kutu@sirius.home.kraxel.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200219102122.1607365-29-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 11:20:58AM +0100, Daniel Vetter wrote:
> Small mistake that crept into
> 
> commit 81da8c3b8d3df6f05b11300b7d17ccd1f3017fab
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Feb 11 14:52:18 2020 +0100
> 
>     drm/bochs: add drm_driver.release callback
> 
> where drm_atomic_helper_shutdown was left in both places. The
> ->release callback really shouldn't touch hardware.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
