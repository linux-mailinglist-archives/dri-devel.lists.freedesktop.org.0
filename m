Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309A273ABC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 08:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7BB6E081;
	Tue, 22 Sep 2020 06:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218D6E081
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600755646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiEhQTm7qhJA+cnpKmIJ3EMC0NTEyvC9K7HGCZ1UQvc=;
 b=hP/00HR8UXm7MfShr8JiI/bYw8+EDS19kafwj3jh2pnMjK/4QGK985eHpp2UdEA7O8PRrM
 mlMWbbO1tPejQ60GyIUwyDi/Q7ZjiU5ZXL8STj9/H+kIqAL+0D7NzDtn6eQXdglgCDdr79
 pRr7EEM39LdBkwNpuDu57LutkyS4Few=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-idKzNO-HMHCcXD1D1amS4A-1; Tue, 22 Sep 2020 02:20:44 -0400
X-MC-Unique: idKzNO-HMHCcXD1D1amS4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E906F8064BA;
 Tue, 22 Sep 2020 06:20:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98AEF55768;
 Tue, 22 Sep 2020 06:20:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61E5D9D5A; Tue, 22 Sep 2020 08:20:41 +0200 (CEST)
Date: Tue, 22 Sep 2020 08:20:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/11] drm/qxl: switch over to the new pin interface
Message-ID: <20200922062041.kictherakjfgc6hg@sirius.home.kraxel.org>
References: <20200921144856.2797-1-christian.koenig@amd.com>
 <20200921144856.2797-8-christian.koenig@amd.com>
MIME-Version: 1.0
In-Reply-To: <20200921144856.2797-8-christian.koenig@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 tzimmermann@suse.de, airlied@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 04:48:52PM +0200, Christian K=C3=B6nig wrote:
> Stop using TTM_PL_FLAG_NO_EVICT.
> =

> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/qxl/qxl_debugfs.c |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.h     |  1 -
>  drivers/gpu/drm/qxl/qxl_ioctl.c   |  4 +--
>  drivers/gpu/drm/qxl/qxl_object.c  | 44 +++++++++----------------------
>  drivers/gpu/drm/qxl/qxl_object.h  |  2 +-
>  drivers/gpu/drm/qxl/qxl_release.c |  4 +--
>  drivers/gpu/drm/qxl/qxl_ttm.c     |  2 +-
>  7 files changed, 20 insertions(+), 39 deletions(-)

Looks sane, survived smoke test.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
