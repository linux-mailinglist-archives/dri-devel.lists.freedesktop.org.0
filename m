Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA454378F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA302112895;
	Wed,  8 Jun 2022 15:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82561112897
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654702677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxVgCrklswpT7+9OTco4k57y0oY6Ie2TEna3/n27Pv0=;
 b=JkmWQBXiTlv0HIteccG6b9z6KAJjiB5DS1KzVQPuabWTa9iACSyRZ+We0npQruRkscj1Qb
 qhbXlEsvIMUq6T2dGVK1GMNwT0XJCUOlXgBAKguov9sxAo8AyomcFPQD+O5w6is34Q2RZE
 qoYOaLUHLBu8ylOYg7KfzxAMdp7FENg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-1N_yXshMOpCapjyVnQXy2A-1; Wed, 08 Jun 2022 11:37:51 -0400
X-MC-Unique: 1N_yXshMOpCapjyVnQXy2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7D3A801755;
 Wed,  8 Jun 2022 15:37:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2111121314;
 Wed,  8 Jun 2022 15:37:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6FB4818003AA; Wed,  8 Jun 2022 17:37:47 +0200 (CEST)
Date: Wed, 8 Jun 2022 17:37:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20220608153747.5d5h446vzbteqzwb@sirius.home.kraxel.org>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
 <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, dri-devel@lists.freedesktop.org,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> You shouldn't have to copy any of the implementation of the aperture
> helpers.

That comes from the aperture helpers being part of drm ...

> For patch 2, the most trivial workaround is to instanciate struct drm_driver
> here and set the name field to 'vdev->vdev.ops->name'. In the longer term,
> the aperture helpers will be moved out of DRM and into a more prominent
> location. That workaround will be cleaned up then.

... but if the long-term plan is to clean that up properly anyway I
don't see the point in bike shedding too much on the details of some
temporary solution.

> Alternatively, drm_aperture_remove_conflicting_pci_framebuffers() could be
> changed to accept the name string as second argument, but that's quite a bit
> of churn within the DRM code.

Also pointless churn because you'll have the very same churn again when
moving the aperture helpers out of drm.

take care,
  Gerd

