Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9376F5059
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 08:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42510E058;
	Wed,  3 May 2023 06:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076CB10E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683096702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZAUDt/vzN1VeMkqTdFA804MyRykQ+diCShj5qJ6AEJ4=;
 b=MvIO55iJzCpWo6HC2nhW8MYqihcPqEp/6HMhPssgpVke1kyjZNXmhTfZqCO3bs8M72Zj1+
 vn3TjGH5HfW51VZDgO6efE9sNWJaW0K4AXqaVkshFVmUOzqNwCzLoLekJNju/aKcoDnlvK
 wv1bA9imi3tRFR6fQcMyb9yOAZMJT2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-gXx-JDx6N4OsBA4ZlslPRw-1; Wed, 03 May 2023 02:51:39 -0400
X-MC-Unique: gXx-JDx6N4OsBA4ZlslPRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78C12185A78B;
 Wed,  3 May 2023 06:51:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F5740F2D4B;
 Wed,  3 May 2023 06:51:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E967180093A; Wed,  3 May 2023 08:51:36 +0200 (CEST)
Date: Wed, 3 May 2023 08:51:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
Message-ID: <6g5bonxpnlw7pcyt3pqrcty2exknpesst4i3v24nqxi3fy5gkr@5rej6zbfadta>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 06:38:45PM +0300, Dmitry Osipenko wrote:
> On 4/16/23 14:52, Dmitry Osipenko wrote:
> > We have multiple Vulkan context types that are awaiting for the addition
> > of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
> > 
> >  1. Venus context
> >  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
> > 
> > Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
> > generic fencing implementation that we want to utilize.
> > 
> > This patch adds initial sync objects support. It creates fundament for a
> > further fencing improvements. Later on we will want to extend the VirtIO-GPU
> > fencing API with passing fence IDs to host for waiting, it will be a new
> > additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
> > drivers in works that require VirtIO-GPU to support sync objects UAPI.
> > 
> > The patch is heavily inspired by the sync object UAPI implementation of the
> > MSM driver.
> 
> Gerd, do you have any objections to merging this series?

No objections.  Can't spot any issues, but I also don't follow drm close
enough to be able to review the sync object logic in detail.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

