Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB880178C4D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 09:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED59893CD;
	Wed,  4 Mar 2020 08:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B8A893CD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583309429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qsOrIZFC/dR/9AUboofvnlvRdw428kZNHAMbY44Lrw=;
 b=NbK0LjXyN5LBhd1jQOUBGeDVDTowo9Uzg3iG4J/2kQ1oKFhKSGQLc3TEg5/KWbJFczBJ1D
 hfYwXsOfrE5JczWdGczJM3pKrSv71qP9NGHUEtCbNxPQJJQ+B55EgVKell/3+dwvRJPg5g
 sPoj/w+pUSjkTN0tldknQYw9puYXZRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-NlYw28siNGm0qCEtAeD4kg-1; Wed, 04 Mar 2020 03:10:26 -0500
X-MC-Unique: NlYw28siNGm0qCEtAeD4kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF04E8017DF;
 Wed,  4 Mar 2020 08:10:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B22F710013A1;
 Wed,  4 Mar 2020 08:10:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3C8B17506; Wed,  4 Mar 2020 09:10:23 +0100 (CET)
Date: Wed, 4 Mar 2020 09:10:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/virtio: add case for shmem objects in
 virtio_gpu_cleanup_object(..)
Message-ID: <20200304081023.mc5335mrhdgbnz3j@sirius.home.kraxel.org>
References: <20200304020559.551-1-gurchetansingh@chromium.org>
 <20200304020559.551-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200304020559.551-2-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +		drm_gem_shmem_free_object(&bo->base.base);
>  	}
> +
>  	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);

use-after-free here.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
