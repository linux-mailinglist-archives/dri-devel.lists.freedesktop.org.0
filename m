Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5789BC5748
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3AC10E832;
	Wed,  8 Oct 2025 14:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Freee+YL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C1F10E84C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759934333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JkTI8QZNoSWAXTBH7aMuJjS39CxZo4GnqrPRIh0slw=;
 b=Freee+YLat/56Qc/n7ZYrdYYCIMFdDKmjJ1tVch0lfRVGD9Q2xanU7tCB3aI74VeVT2QsF
 HyfnS0vaDgmaFKNDxNSAQUD5p002ZfKyAJPiYk4Pm9q9eniDknGEIVSWhglpgPzTJCQUKW
 DlHhFeFF2SP1RdWFV1Rau5/YMklxn9Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-54Hq9rQjMNqVMwl43zMidA-1; Wed,
 08 Oct 2025 10:38:47 -0400
X-MC-Unique: 54Hq9rQjMNqVMwl43zMidA-1
X-Mimecast-MFC-AGG-ID: 54Hq9rQjMNqVMwl43zMidA_1759934325
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3BEA81800343; Wed,  8 Oct 2025 14:38:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.183])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC17418004D8; Wed,  8 Oct 2025 14:38:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C136180009C; Wed, 08 Oct 2025 16:38:42 +0200 (CEST)
Date: Wed, 8 Oct 2025 16:38:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 spice-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/qxl: Use vblank timer
Message-ID: <fmzp2c2ir76bypfo3tzc4dxba3dduqdi7myzejxcenkw3mon2f@orpoujw77ul2>
References: <20251008122911.231674-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20251008122911.231674-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ydzt1CYtozR3nHJSJrJZE9Ib1S9tICE7GAbA5-SoOHI_1759934325
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

On Wed, Oct 08, 2025 at 02:29:06PM +0200, Thomas Zimmermann wrote:
> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> helpers provide an implementation on top of Linux' hrtimer. Qxl
> enables and disables the timer as part of the CRTC. The atomic_flush
> callback sets up the event. Like vblank interrupts, the vblank timer
> fires at the rate of the display refresh.
> 
> Most userspace limits its page flip rate according to the DRM vblank
> event. Qxl's virtual hardware does not provide vblank interrupts, so
> DRM sends each event ASAP. With the fast access times of virtual display
> memory, the event rate is much higher than the display mode's refresh
> rate; creating the next page flip almost immediately. This leads to
> excessive CPU overhead from even small display updates, such as moving
> the mouse pointer.
> 
> This problem affects qxl and all other virtual displays. See [1] for
> a discussion in the context of hypervdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

