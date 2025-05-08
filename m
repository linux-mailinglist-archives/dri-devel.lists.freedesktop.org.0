Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF71AAF83E
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 12:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE1F10E1D0;
	Thu,  8 May 2025 10:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xvjc6BH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30510E1D0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746701093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kg0VQN380cNy38+THmalJtzeh1gOYnZWm93pCjMLjOk=;
 b=Xvjc6BH0Ysranwamgiu5GoLNm219axZo9KsY/Hxm/gkqmFutB/hbJ5fxlIpfT6nzExKJW0
 m+M2TgjXhXOMEruI3gjtTAIwyEhhE75vuOI9iQCINzKTzFcvxs6QfZTB53R8PXLDxRCAkz
 N3/WsoWyiR/w+ZzJEyQtA0oAK+SP1DE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-vof06KW8PViUnyl4S4QTSQ-1; Thu, 08 May 2025 06:44:50 -0400
X-MC-Unique: vof06KW8PViUnyl4S4QTSQ-1
X-Mimecast-MFC-AGG-ID: vof06KW8PViUnyl4S4QTSQ_1746701089
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso7103565e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746701089; x=1747305889;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kg0VQN380cNy38+THmalJtzeh1gOYnZWm93pCjMLjOk=;
 b=aoR8rVhZCHw51AHNPSRHHh8MpT2VCKZ02JYw4OS+2xRX2Xbo5vf4avLCRRz4u6JVBe
 ZMAfhi04T4ojNanZr1K6iU2fQu5mG1/PVyE29eLlcKdWnfcXSj+5Vu2KybNCO3cYrvNm
 DVei/THDyIHMU9b0VcZwS4umJReWCwA76N0xqe8W53TO7MoU/bqmHF3l2DsqttzH5RYc
 P9aLhBVKSiw2LzCTOs323YHCeiP+LZvft5vaM8GLlsAfAok1ydSsKsOw42e0HgMHe5uF
 HPYjNiCD6FYR6B94GXhl3F9slKLdd0Zngl8aS2nlf5L7kelLsQ/Y86xThKWeRO2N6LMj
 c/dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ40sIUJGCBdIkpAbg3lE93tjDncuis6ihXCU0ZrhMofHgx3MCIT+sFyxd9F+sAH0xOSgfs2nFnqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKAvnAXHusqCImfINw4y/Buv3b7t58RYQIAiD+rDkn/5PNN9+Q
 UkgXG2UwjAv+dFPSI4Yx8WR7rcxBH0OxlQg6vEMYo731F5V5Re+0atkSRWn2hi79hSK434pZqxH
 17PHa5MoYTBR2N3NjreHxl4G2IROoGipBoc8roDpSVOY8/+6jt6qM4c2omrhvlCQQ+Q==
X-Gm-Gg: ASbGnctywlZW3WWD6sl6VgWwp6lI/g0ILYQZUamgiEmE4Cj8SW+SaQd0+5UzYJaJXFu
 LA46NjT6JgworKgKsRhDZunhOgIPgQGvcYPqvvvpXnkUyMNeEmD092B2lPznCqqKLlDXm4Y2YKK
 6EouYdx5iOzhcNZ1xLgYh6Ah0I6Q0RJZAIX1u7mMF8U/oKldaLouHZcHOsXqCdaREzprziR9ptQ
 LNHIRBKB+FRL5gkel6LKeCX9bSGoRxkbjdesIaQ/gS85vntMkZFht1DwfG/yvH3LYqbN84qt0Op
 iUgztUejxRq9bHFaZAROD5/oqRqmuqmnGTJmzYg76gCbhe/JCW3VyCjb76Cf8d9X4wEy1w==
X-Received: by 2002:a05:600c:5027:b0:43c:f64c:44a4 with SMTP id
 5b1f17b1804b1-441d44c41a5mr60707255e9.8.1746701089369; 
 Thu, 08 May 2025 03:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKWHQImK0mQVYX3JJhEVaBoNakORu3NGB6ausgRqlBfk0NSvqhDkPdCLTMr4AX1Nn44y4TLQ==
X-Received: by 2002:a05:600c:5027:b0:43c:f64c:44a4 with SMTP id
 5b1f17b1804b1-441d44c41a5mr60706975e9.8.1746701089048; 
 Thu, 08 May 2025 03:44:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d14e6d74sm23818755e9.21.2025.05.08.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 03:44:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Stanner <phasta@mailbox.org>, Philipp Stanner
 <phasta@kernel.org>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
In-Reply-To: <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
References: <20250417094009.29297-2-phasta@kernel.org>
 <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
 <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
Date: Thu, 08 May 2025 12:44:46 +0200
Message-ID: <87a57ns7oh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yX8xbxG7LhnkRe-BRRmfU_x6lhWIgfq2WhXGZAh58O8_1746701089
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

Philipp Stanner <phasta@mailbox.org> writes:

Hello Philipp,

> On Tue, 2025-04-22 at 23:51 +0200, Javier Martinez Canillas wrote:
>> Philipp Stanner <phasta@kernel.org> writes:
>> 
>> Hello Philipp,
>> 
>> > cirrus enables its PCI device with pcim_enable_device(). This,
>> > implicitly, switches the function pci_request_regions() into
>> > managed
>> > mode, where it becomes a devres function.
>> > 
>> > The PCI subsystem wants to remove this hybrid nature from its
>> > interfaces. To do so, users of the aforementioned combination of
>> > functions must be ported to non-hybrid functions.
>> > 
>> > Replace the call to sometimes-managed pci_request_regions() with
>> > one to
>> > the always-managed pcim_request_all_regions().
>> > 
>> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> > ---
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>
> Who's in charge of applying this? Any objections with me just putting
> it into drm-misc-next?
>

Sure, go ahead.

> P.
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

