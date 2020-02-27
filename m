Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35C171161
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 08:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256346EBF6;
	Thu, 27 Feb 2020 07:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2666EBF6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582788206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOJ6fi8Oh6XiqgNLYpFQAYgFo78K/2LPKEsjGMv870o=;
 b=G9T+Hr5OnkNvr0rj1vFyQlRCbueLHIwxhgZZsHrwFsCSqMxriaJx8XZqUjpzkDgOA0uI0c
 VcPQzrz7POfRqJm0oFnlaTeI2IMxVKSlK9PnkCrS9kwk5Dt6yg8ioXKu39+1HaecAorgZH
 6BSnARr9G6JnrS8ve0ZZdmOFb9VSg94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-0OFTpV3wPOKhCFw7K_StQw-1; Thu, 27 Feb 2020 02:23:21 -0500
X-MC-Unique: 0OFTpV3wPOKhCFw7K_StQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F33107ACC5;
 Thu, 27 Feb 2020 07:23:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 142FF8C073;
 Thu, 27 Feb 2020 07:23:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5032E1744A; Thu, 27 Feb 2020 08:23:19 +0100 (CET)
Date: Thu, 27 Feb 2020 08:23:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Refactor struct virtgpu_object ***
Message-ID: <20200227072319.qimkovn7ncx35no5@sirius.home.kraxel.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: dri-devel@lists.freedesktop.org, jbates@chromium.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 04:25:53PM -0800, Gurchetan Singh wrote:
> The main motivation behind this is to have eventually have something like=
 this:
> =

> struct virtio_gpu_shmem {
> =A0 =A0 struct drm_gem_shmem_object base;
> =A0 =A0 uint32_t hw_res_handle;
> =A0 =A0 struct sg_table *pages;
> =A0 =A0 (...)
> };
> =

> struct virtio_gpu_vram {
> =A0 =A0 struct drm_gem_object base; =A0// or *drm_gem_vram_object
> =A0 =A0 uint32_t hw_res_handle;
> =A0 =A0 {offset, range};
> =A0 =A0 (...)
> };

Given that we probably will not use drm_gem_vram_object and
drm_gem_shmem_object->base is drm_gem_object I think we can
go this route:

struct virtgpu_object {
	struct drm_gem_shmem_object base;
	enum object_type;
	uint32_t hw_res_handle;
	[ ... ]
};

struct virtgpu_object_shmem {
	struct virtgpu_object base;
	struct sg_table *pages;
	[ ... ]
};

struct virtgpu_object_hostmem {
	struct virtgpu_object base;
	{offset, range};
	(...)
};

Then have helpers to get virtgpu_object_hostmem / virtgpu_object_shmem
from virtgpu_object via container_of which also sanity-check
object_type (maybe we can check drm_gem_object->ops for that instead of
adding a new field).

> Sending this out to solicit feedback on this approach. =A0Whichever appro=
ach
> we decide, landing incremental changes to internal structures is reduces
> rebasing costs and avoids mega-changes.

That certainly makes sense.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
