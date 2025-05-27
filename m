Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05626AC4A21
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F1510E416;
	Tue, 27 May 2025 08:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MmB223AX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1777A10E448
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748334252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wmg0zgm8bwqGKOccpFTuoOfVUzJFvXK1R5rq2g9wG2w=;
 b=MmB223AXYLQRXrVmKrlXTfYuNhJ8uvJxzJSMYqij2+KoIx4lPtPnvXwxy4Dcb7KyvFSYEl
 jypZ4BAoWrPdNbw8mY2UXHswiB8dGg7g2KSAsHomJCLr7NMMAssbRHiVmkmzyfvcTZIAxn
 DI7iDSv2zlncxMY5xZkYNLrnityjA/I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-JaSBKqGdPx-uMr4we00NfA-1; Tue, 27 May 2025 04:24:10 -0400
X-MC-Unique: JaSBKqGdPx-uMr4we00NfA-1
X-Mimecast-MFC-AGG-ID: JaSBKqGdPx-uMr4we00NfA_1748334249
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a370309e5cso1768351f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748334249; x=1748939049;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmg0zgm8bwqGKOccpFTuoOfVUzJFvXK1R5rq2g9wG2w=;
 b=g8KOoeVxM/DCBt5VVkoWhd+3XSTocu/lrGoKCrjzRkwNsYW4cGyOgj5dmE4qSwGku0
 IKd49NBo5f2wfRVdsV0cL5wLEOWDTAMVlUvw1udvl5n3Lgku2QkyOfBl4AH85hWhR6+0
 nLXAvzJNTSfgeQIKv9XkDNbNkHvD14nB/dd8T71PecpIXmrbw4lB6r8S5mz/fq8lLPkp
 No4FV42tmS1JJjFlF4Pq64dVdzElCN5tWnmCAWPsM3/hV2vN7l0BqPlVEW7Bcw17yzbu
 lWf30SpnfXseUaX/atLZ9WDzZaqZ5kZbfX2k8OZjAo6TbqVgG37H8pQ/MWGeSV2SEzs8
 RJkQ==
X-Gm-Message-State: AOJu0YzWkKqUq8esGPEWTOo+PoOAA2HQh9bP1YLx7V787L7xmj6nGPDd
 LfhA6wnYMOHCnDIS7EKmMxY30ctBMMXKHW8KOQbaoosmBOqSDnNVl+Ep3RIZJRGVZFTD+xbOnv7
 jWRtcuutA0fPxBbNambG9ZrjEdHa97Bt3csPLqx0JJ4CsSji1dazHF0Yuh6il33IHh61eWA==
X-Gm-Gg: ASbGnct0rM4B9QqYcFISB90h5cwcz8p+oa/2O9J/ZBrSDX2U7enHFpZlWPEKgi/9KXY
 QJ9RiDNWKSnZyc76Vn1Ej/SCwMSmNqbZmc60X3Qbp/L8Qen6k7PS0lHKl4ms27SzYAjn9rPdNOt
 kbFRcjsnnZYAeQelYcHJaced4dlmz86chE9d3yAenfXufPto/aIgnijZYlz9Ep5ylrpVO/VeFyG
 U2lK3jcRu29b9eLOyaYx2/zG3nrqS+Xpv52K/3C0pHRo6BlsJQkV2TZ+6uz8ecDGMCgBmLw0BfL
 MEvIApKifq+exYv+N/ZiZNQGQ/2CqFGnOzy54Se/YVT1dzpMQyBaYHtNSq1+bgww9FMeUQ==
X-Received: by 2002:a05:6000:2586:b0:3a4:c6bc:df46 with SMTP id
 ffacd0b85a97d-3a4cb498f7cmr9722394f8f.49.1748334249343; 
 Tue, 27 May 2025 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NpPfVPLaTXD9jufYOsVImLYDjqmB2qgUWGjuL2yiKQhM/XPh2hThBUvyKuRRzV/QF6aQjw==
X-Received: by 2002:a05:6000:2586:b0:3a4:c6bc:df46 with SMTP id
 ffacd0b85a97d-3a4cb498f7cmr9722355f8f.49.1748334248920; 
 Tue, 27 May 2025 01:24:08 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4e4f4d58esm39466f8f.28.2025.05.27.01.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 01:24:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility
 layer
In-Reply-To: <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
References: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
 <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 27 May 2025 10:24:06 +0200
Message-ID: <87h616tqah.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sFogVpOlMXfbWBDrM5b6FUHOPObCAYGW3t-RfZ6993I_1748334249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>
> Hello Geert,
>
>> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
>> the old symbols were kept, aiming to provide a seamless migration path
>> when running "make olddefconfig" or "make oldconfig".
>>
>> However, the old compatibility symbols are not visible.  Hence unless
>> they are selected by another symbol (which they are not), they can never
>> be enabled, and no backwards compatibility is provided.
>>
>> Drop the broken mechanism and the old symbols.
>>
>> Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> -- 

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

