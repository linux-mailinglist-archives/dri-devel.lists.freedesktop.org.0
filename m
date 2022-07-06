Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41654567F98
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0101120EA;
	Wed,  6 Jul 2022 07:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41F1120EA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657091588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xC/tPIV26dzWDx6JEF57ktxGrZ/+tVkL24+pBomvNqw=;
 b=QW2XJxk/ICnMgyDtGJPSylssiDkhWQmX7Ttyku5KYtFSftfS5Qnz4yWO3vzdoMD1LMdMwZ
 NAcBz2YQn0BKkfYsrLQEAMhW/Ot/LEHkzppXbdRcXj9QgY+DGDfCbZAj7jKIVQk5DHorGj
 3R0Gk6ZNoTrtW6M7OJcj7fugkt3+ezc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-JJgkedS7NV2rpdhWsPVb4Q-1; Wed, 06 Jul 2022 03:13:03 -0400
X-MC-Unique: JJgkedS7NV2rpdhWsPVb4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B51461C08969;
 Wed,  6 Jul 2022 07:13:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E1E42166B26;
 Wed,  6 Jul 2022 07:13:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10D1518003AA; Wed,  6 Jul 2022 09:13:01 +0200 (CEST)
Date: Wed, 6 Jul 2022 09:13:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Message-ID: <20220706071301.43fvbioka4iksqup@sirius.home.kraxel.org>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> Gerd, thank you very much! It's was indeed unclear to me how to test the
> MMIO GPU, but yours variant with microvm works! I was looking for trying
> aarch64 in the past, but it also was unclear how to do it since there is
> no DT support for the VirtIO-GPU, AFAICS.

aarch64 uses acpi by default (can be disabled via 'qemu -no-acpi').
Not fully sure about arm(v7).

Even with DT it should work because DT only describes the virtio-mmio
'slots', not the actual virtio devices.

> There is no virgl support because it's a virtio-gpu-device and not
> virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.

It's named 'virtio-gpu-gl-device'

take care,
  Gerd

