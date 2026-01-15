Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFCD25C68
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3F10E7A7;
	Thu, 15 Jan 2026 16:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MkolHXwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E069910E7A9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768495015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YapI6yvvFKBlNsIuFY3dURmJ8ly4nR9lByNbPeI57Wk=;
 b=MkolHXwQUZK5PTvlhdsb8t8U5KQu8UeHxpk9Rrs+nW/mE2Inty/XbY8EexSYFAs9xYjkFl
 /+cr3I0x97v/BtvFQOVMJmDmQZLpNpDXX/KMNJnXYVgKI0amYGV1ho8/ZLqHmQzyMA0e7R
 7gDDxwZ5XWwRgFdpySyrxdwDyjG25iI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-EF4CM8dfMF-Md1jPR3oF-A-1; Thu,
 15 Jan 2026 11:36:53 -0500
X-MC-Unique: EF4CM8dfMF-Md1jPR3oF-A-1
X-Mimecast-MFC-AGG-ID: EF4CM8dfMF-Md1jPR3oF-A_1768495009
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DD6D7180035D; Thu, 15 Jan 2026 16:36:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.56])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFC961955F22; Thu, 15 Jan 2026 16:36:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9866C18483A0; Thu, 15 Jan 2026 17:36:43 +0100 (CET)
Date: Thu, 15 Jan 2026 17:36:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Ce Sun <cesun102@amd.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Helge Deller <deller@gmx.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, 
 nouveau@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, spice-devel@lists.freedesktop.org, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
Message-ID: <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com>
 <aWkDYO1o9T1BhvXj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWkDYO1o9T1BhvXj@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

  Hi,

> > At least for AMD GPUs remove_conflicting_devices() really early is
> > necessary because otherwise some operations just result in a
> > spontaneous system reboot.	

> It's similar for Intel. For us VGA emulation won't be used for EFI
> boot, but we still can't have the previous driver poking around in
> memory while the real driver is initializing. The entire memory layout
> may get completely shuffled so there's no telling where such memory
> accesses would land.

Can you do stuff like checking which firmware is needed and whenever
that can be loaded from the filesystem before calling
remove_conflicting_devices() ?

take care,
  Gerd

