Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB367DED6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBEF10E179;
	Fri, 27 Jan 2023 08:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733310E179
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674806768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WQuD4/LhmMQmyGAfci83sbqVYALJwpjalG6/ork/Os=;
 b=jL8kbGxbSjFFFrqO2voNw3GWOwYawqM5SPGCxUDHGJev33x/IceV6nYhtSTYsgFtemqZ70
 ftmuV77rOWgWO+1Zs3ZYJLRncJC2AME8NFuXUXVjHlSwwAmekeLLVRcCKPlwvaFNyGj9DU
 UGUm7RMFecANS874B1H9Jk/FJGa0mco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-j9-8DRbVNNi1maITv3YBSQ-1; Fri, 27 Jan 2023 03:06:06 -0500
X-MC-Unique: j9-8DRbVNNi1maITv3YBSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6503815F67;
 Fri, 27 Jan 2023 08:06:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE848492C14;
 Fri, 27 Jan 2023 08:06:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E9AC1800606; Fri, 27 Jan 2023 09:06:03 +0100 (CET)
Date: Fri, 27 Jan 2023 09:06:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 06/11] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
Message-ID: <20230127080603.ioybmevyflhewdxe@sirius.home.kraxel.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
 <20230126121705.wsm62yxco7cubwyf@sirius.home.kraxel.org>
 <75698ab8-2e0b-8673-2f7d-83ffa37f447b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75698ab8-2e0b-8673-2f7d-83ffa37f447b@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 03:24:30PM +0300, Dmitry Osipenko wrote:
> On 1/26/23 15:17, Gerd Hoffmann wrote:
> > On Mon, Jan 09, 2023 at 12:04:40AM +0300, Dmitry Osipenko wrote:
> >>  its own refcounting of vmaps, use it instead of drm-shmem
> >> counting. This change prepares drm-shmem for addition of memory shrinker
> >> support where drm-shmem will use a single dma-buf reservation lock for
> >> all operations performed over dma-bufs.
> > 
> > Likewise truncated?
> 
> Should be the email problem on yours side, please see [1][2] where the
> messages are okay.

Indeed, scratch the comments then.

take care,
  Gerd

