Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A467DEE5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3110E3EB;
	Fri, 27 Jan 2023 08:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E464310E3EB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674807228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQyPt/6bZriSvjC5ZXh5l3TKz/N7A4kc1yntO2MilN0=;
 b=iP0ZxLbGyVGSfrhpV5PxEwmfmE2S6u/W0f+NKIkXh+vSqVLHDyUnTFCCqrkZDr1v9WrZTm
 jIRUcV60spwTHKhdb+ZrkhxiBaTRQdTTDCnDrwbDxsxjtWYziVknuHA24E7+IM6q+8vOAs
 SWXJlWDRh15i8+6UTP3Bre1eqfv/Z+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-Z6Nj1TXBPmq0ujnQ2BEItg-1; Fri, 27 Jan 2023 03:13:42 -0500
X-MC-Unique: Z6Nj1TXBPmq0ujnQ2BEItg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FAA3C0D845;
 Fri, 27 Jan 2023 08:13:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9E5400DE84;
 Fri, 27 Jan 2023 08:13:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B10301800606; Fri, 27 Jan 2023 09:13:39 +0100 (CET)
Date: Fri, 27 Jan 2023 09:13:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Message-ID: <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
> Hello Thomas and Gerd,
> 
> On 1/9/23 00:04, Dmitry Osipenko wrote:
> > This series:
> > 
> >   1. Makes minor fixes for drm_gem_lru and Panfrost
> >   2. Brings refactoring for older code
> >   3. Adds common drm-shmem memory shrinker
> >   4. Enables shrinker for VirtIO-GPU driver
> >   5. Switches Panfrost driver to the common shrinker
> > 
> > Changelog:
> > 
> > v10:- Rebased on a recent linux-next.
> > 
> >     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
> > 
> >     - Added Steven's ack/r-b/t-b for the Panfrost patches.
> > 
> >     - Fixed missing export of the new drm_gem_object_evict() function.
> > 
> >     - Added fixes tags to the first two patches that are making minor fixes,
> >       for consistency.
> 
> Do you have comments on this version? Otherwise ack will be appreciated.
> Thanks in advance!

Don't feel like signing off on the locking changes, I'm not that
familiar with the drm locking rules.  So someone else looking at them
would be good.  Otherwise the series and specifically the virtio changes
look good to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

