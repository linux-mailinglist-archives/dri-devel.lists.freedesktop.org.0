Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DEBA714F5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4F10E6A5;
	Wed, 26 Mar 2025 10:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jT1yUdlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636210E6A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742985365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sxtRYmgT7m7fJujiUxxbIz+1Fm2iJf1VrTa3KX7BD1k=;
 b=jT1yUdlJDvEzv+Hwzp/EO4/yGRsmYx+RLkUCpjMVWrWBIHQrF6eEEZY/LwIPwkVoeUI34Q
 Yj3V4V5aftOVDp1qtOyZkSPCmVujKouni9c4I2gyp0U8eZ8hTqEfCiVtZQjcwvfiPJ8zJ5
 9CLWTW3dxKDsEKGCeUlSX6YgHuv0v10=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-cNdV2pSsPoyiHBBCPtHOSg-1; Wed,
 26 Mar 2025 06:36:02 -0400
X-MC-Unique: cNdV2pSsPoyiHBBCPtHOSg-1
X-Mimecast-MFC-AGG-ID: cNdV2pSsPoyiHBBCPtHOSg_1742985361
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0B8E8196D2CD; Wed, 26 Mar 2025 10:36:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.27])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96EDB1956095; Wed, 26 Mar 2025 10:36:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B3461800787; Wed, 26 Mar 2025 11:35:58 +0100 (CET)
Date: Wed, 26 Mar 2025 11:35:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/cirrus-qemu: Use framebuffer format as-is, drop
 adjustments
Message-ID: <hujnqeg74eoiz4lj46xhetdpytfgndg4iegwpszqf3ztjzuw6o@tis4zsp7slc3>
References: <20250325171716.154097-1-tzimmermann@suse.de>
 <20250325171716.154097-4-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20250325171716.154097-4-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KDYaNJdFRz1ZyJoBgr0Vm0S2ilL9mnE3GDsrYB-NlXI_1742985361
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

On Tue, Mar 25, 2025 at 06:12:51PM +0100, Thomas Zimmermann wrote:
> Remove internal adjustments to framebuffer format from cirrus-qemu
> driver. The driver did this to support higher resolutions by reducing
> the per-pixel memory consumption.
> 
> DRM has a policy of exporting formats as they are implemented in
> hardware. So avoid internal adjustments if possible.

Well.  While this policy makes sense for modern hardware this is IMHO
not the case for the cirrus.

First, because there is almost no userspace which can handle the ancient
24 bpp format (DRM_FORMAT_RGB888).

Second, because there is no way to communicate the hardware constrains
of the cirrus.  userspace can query the formats, and userspace can query
the resolutions, but there is no way to tell userspace that not all
combinations are valid and that you have to go for the DRM_FORMAT_RGB565
format if you want higher resolutions.

Essentially the format conversations allows the driver to hide the
oddities of the prehistoric hardware from userspace, so things are
more smooth when running wayland on the cirrus.

take care,
  Gerd

PS: https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
still applies of course.

