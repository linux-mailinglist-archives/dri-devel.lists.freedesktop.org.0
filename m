Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA01BC5730
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9510E831;
	Wed,  8 Oct 2025 14:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MJ5FlHjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDCC10E834
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759934277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dchCMVZ+CKcTImYvSYXlRWnDOdGkh1Qf1tqStte3bbA=;
 b=MJ5FlHjGyg2u0AKARPptIkyUr769u+TLCyg6p0kFGRH3ZDTrL/ulCfTP87T6sIHNXROgbQ
 rEwe02Z2nFZODH3L1avrvsayDfOTk+jYDXUbKXCrsrCls68Uc1AbwWtfIpP9Y6506rRG/Z
 dRxVnmrBYWh+plOT8XXBcVXMUnp9lAU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-L4lUrBJQMhGfUiqq4sJSXg-1; Wed,
 08 Oct 2025 10:37:53 -0400
X-MC-Unique: L4lUrBJQMhGfUiqq4sJSXg-1
X-Mimecast-MFC-AGG-ID: L4lUrBJQMhGfUiqq4sJSXg_1759934272
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 03A3B180057A; Wed,  8 Oct 2025 14:37:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.183])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5CAA919560A2; Wed,  8 Oct 2025 14:37:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0FA4180009C; Wed, 08 Oct 2025 16:37:48 +0200 (CEST)
Date: Wed, 8 Oct 2025 16:37:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bochs: Use vblank timer
Message-ID: <rh66ged6cx56dosejdhfzsbfviknuf7byeo6pmfyztibrtcz57@3sccpqdhc24k>
References: <20251008093931.19138-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20251008093931.19138-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uq7UFkRug6eTKjB4jDCbEdYlQBXs0CPLQpIsa3VQwD4_1759934272
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

On Wed, Oct 08, 2025 at 11:36:55AM +0200, Thomas Zimmermann wrote:
> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> helpers provide an implementation on top of Linux' hrtimer. Bochs
> enables and disables the timer as part of the CRTC. The atomic_flush
> callback sets up the event. Like vblank interrupts, the vblank timer
> fires at the rate of the display refresh.
> 
> Most userspace limits its page flip rate according to the DRM vblank
> event. Bochs' virtual hardware does not provide vblank interrupts, so
> DRM sends each event ASAP. With the fast access time of virtual display
> memory, the event rate is much higher than the display mode's refresh
> rate; creating the next page flip almost immediately. This leads to
> excessive CPU overhead from even small display updates, such as moving
> the mouse pointer.
> 
> This problem affects bochs and all other virtual displays. See [1] for
> a discussion in the context of hypervdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

