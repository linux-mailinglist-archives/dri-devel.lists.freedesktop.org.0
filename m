Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B2471326
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 10:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7039E10E7AA;
	Sat, 11 Dec 2021 09:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85810E793
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639214811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FuzLqB82BcW0UP+PPCzPY/LPJgq+aPig3zfEP1M1Qiw=;
 b=F813cUURlJjmBcbdwRgiOFxz5Pas/02oYhQypyppczieTDv/hOlAnRVGOLkIX6XQiZ89za
 V5s26eE7P9XbnLOV+/mLJhtBejFbVyetSpRZOdGAmhopB8wj3VJzPfu1LaHsLcGVUPDOlA
 RoS7Twiejj+SqKm/c+3JwWVQdIJehtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-wb8vZXmRPh-pKWUdhmnIAQ-1; Sat, 11 Dec 2021 04:26:48 -0500
X-MC-Unique: wb8vZXmRPh-pKWUdhmnIAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B8E68042E0;
 Sat, 11 Dec 2021 09:26:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CBA545D66;
 Sat, 11 Dec 2021 09:26:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 38AED1800091; Sat, 11 Dec 2021 10:20:50 +0100 (CET)
Date: Sat, 11 Dec 2021 10:20:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
Message-ID: <20211211092050.wbczxxrnzoywbns6@sirius.home.kraxel.org>
References: <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
 <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
 <CADnq5_NqPEY6vPSsBQSst5Gsw-VpJ-sp-5DHMeB+EGA2t7KoAQ@mail.gmail.com>
 <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
 <d1de6ca3-11ae-af9e-a2fb-7bcb6fae01d6@amd.com>
 <3988a221-2f6a-540a-3d77-18c2c67ddbe7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3988a221-2f6a-540a-3d77-18c2c67ddbe7@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 kernel@gpiccoli.net, Baoquan He <bhe@redhat.com>,
 Samuel Iglesias =?utf-8?Q?Gons=C3=A1lvez?= <siglesias@igalia.com>,
 xinhui pan <Xinhui.Pan@amd.com>, kexec@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, pjones@redhat.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 07:54:34PM -0500, Felix Kuehling wrote:
 
> Do you actually need to restore the exact boot-up mode? If you have the same
> framebuffer memory layout (width, height, bpp, stride) the precise display
> timing doesn't really matter. So we "just" need to switch to a mode that's
> compatible with the efifb framebuffer parameters and point the display
> engine at the efifb as the scan-out buffer.

That'll probably doable for a normal kexec but in case of a crashdump
kexec I don't think it is a good idea to touch the gpu using the driver
of the kernel which just crashed ...

take care,
  Gerd

