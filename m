Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9059A71710
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9610E124;
	Wed, 26 Mar 2025 13:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ExEvdhg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0976610E124
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742994301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DVQHKi1v6ZJuoZpbTUeTTwk753IlYenrtjuxZpJpJjA=;
 b=ExEvdhg9hZbr8VHcDSQOjzqQfNghhi7RbIW+qiIKBY3Fkrcu36tt/+Cmu+s1xeZ9ZIkrMo
 F9UKDcVDZ2eR0UMYNNTl2GGdZ5256RF3/RqHwx4qC8Opve9kJh4R9QtZIKV8SF5ZBM/C5N
 GYWSEoIS2mPF5apt4GMAjao1OPNWv3s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-jrUx5pFNNvaUdDFRIVmFcg-1; Wed,
 26 Mar 2025 09:04:59 -0400
X-MC-Unique: jrUx5pFNNvaUdDFRIVmFcg-1
X-Mimecast-MFC-AGG-ID: jrUx5pFNNvaUdDFRIVmFcg_1742994298
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 784641809CA5; Wed, 26 Mar 2025 13:04:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.27])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B5711801756; Wed, 26 Mar 2025 13:04:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D2741800787; Wed, 26 Mar 2025 14:04:55 +0100 (CET)
Date: Wed, 26 Mar 2025 14:04:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/cirrus-qemu: Use framebuffer format as-is, drop
 adjustments
Message-ID: <iks6ntl56uyo2cx3k4trgeu5z6ilxe6leaoexi7azd4woutefa@yct7554fra2i>
References: <20250325171716.154097-1-tzimmermann@suse.de>
 <20250325171716.154097-4-tzimmermann@suse.de>
 <hujnqeg74eoiz4lj46xhetdpytfgndg4iegwpszqf3ztjzuw6o@tis4zsp7slc3>
 <98df4fc3-019f-4feb-a49e-987a97e36c95@suse.de>
MIME-Version: 1.0
In-Reply-To: <98df4fc3-019f-4feb-a49e-987a97e36c95@suse.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wsa6rY4oxfPcU-kp0NfDBVMuMC1W3BMrk5yeV4RUzuU_1742994298
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

On Wed, Mar 26, 2025 at 01:30:13PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> first of all, what about the other patches?
> 
> - Patch 1 is a bugfix.
> - Patch 4 depends on this one.
> - Patch 2 should be given consideration.

Looks reasonable to me.  Don't feel like giving a reviewed-by due to not
following drm development very closely any more, so

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> > Second, because there is no way to communicate the hardware constrains
> > of the cirrus.  userspace can query the formats, and userspace can query
> > the resolutions, but there is no way to tell userspace that not all
> > combinations are valid and that you have to go for the DRM_FORMAT_RGB565
> > format if you want higher resolutions.
> 
> The viable strategy for user space is to allocate a variety of different
> configs and check them one by one, thus filtering out the ones that work.

Last time I checked (which has been a few years) alot of existing
software didn't do that.  Maybe that changed with atomic becoming
more mature though.

> > Essentially the format conversations allows the driver to hide the
> > oddities of the prehistoric hardware from userspace, so things are
> > more smooth when running wayland on the cirrus.
> 
> I'm aware of the situation. We've had similar discussions about other
> low-end hardware, but generally went with the hardware limits.
> 
> Please note that there is a trade-off here: the effect of this series is
> that the maximum resolution will be limited to 800x600.

Ah, ok, this is how you deal with the problem, go with the max
resolution the cirrus can support at 32 bpp.

Could be more explicit in the commit message, especially the 800x600
limit, there is a high chance people search for that when their display
resolution changes after a kernel update.

> If user space would appropriately validate atomic states, lower bpp
> could still support higher resolutions. But converting color formats
> on the fly isn't free. I recently did some simple measurements in a
> different context and converting from 32 bpp to 16 bpp took 3 times as
> long as memcpy'ing the raw pixels.

Ouch.  That is alot.

> > PS: https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
> > still applies of course.
> 
> It's been 10 years since you wrote that. So maybe it's time to re-consider
> cirrus' exceptions and just go for a 'dumb implementation'. Anyone can
> easily switch to better alternatives.

Fair enough.

With an improved commit message:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

