Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3CD9003BE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519210E127;
	Fri,  7 Jun 2024 12:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bp2hwSdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3F510E127
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717763871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6GgoPxB/ji/Pk/VvVdpRr7XCPGmqFTWzXgM8MhOw7M=;
 b=Bp2hwSdFGmG4rD/3qI+1zrdTgnbiE3DFjD2qblXptbel7hET+P3D5XZjZDSZRyZ8Csce9P
 vxIJRsoKpGT8USaBdXBQgEDCoGphhBTLyGTbTLIfb0OVmQDb0MX4EDhCQEF8aT7JVN/G2d
 OTic1Agq+feQK94y9bHYF8quco2P+iQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-pjh6yT54M7iLaP0c3kjJHw-1; Fri, 07 Jun 2024 08:37:48 -0400
X-MC-Unique: pjh6yT54M7iLaP0c3kjJHw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ead17d8db6so12466921fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 05:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717763867; x=1718368667;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6GgoPxB/ji/Pk/VvVdpRr7XCPGmqFTWzXgM8MhOw7M=;
 b=Qd5ogu/KnS4a/MXMkEQGz59hj3EVnpTQUq5PsOGYA4XcDW/dkrQtgFr3ebW0R039R1
 k1AHZeZLi1H8v19evy3t/3qvhzLwwFfa6Aubk9Efn2QpsgV33CuvlEVtjh65uoDH5J8H
 eaAOrb7X5oHxb3uVBCc8WbBx7qDLa8XOqcUlqr41u0FMR4jMs5sQqCqUmQylP4GAknZ9
 DcqY/MbzIQFXTV0fL3be8q8poYn/+AC788rRA6q7iq3CTYCl6sRbMUZrcR1MP/1hyfqC
 mXdbfYGp2DJe+r3kJXUcASf+dwmwmA/a0wKQSp/A56bD5mE58ZZd7Z5Hng2pdXCEc1dB
 IIEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2TiRla4wesSVvQ1AWpn2xH5pUABfp/1t8JexmILINhadNpffOwn3AGjYB9n7qU+5FpV+afK60scoRREoYmzWw+jKRpgUsxIHPfM/rR7Sh
X-Gm-Message-State: AOJu0Yy9Iw2k9d9FJhBXPD9QNnkisCAGFhqDgNsxBOwXQYRhch7gpHXO
 hU4v3mP6IeGzg2vHt7BAykUzGeJ3VDu8//z5+riz24RR8tDmlDh8+mlabGuPJTc6tJFSBB8KdL8
 RtwfNFAmPdjD3a7AwCjxRG7qhqBk1utw40sHeuk1PzNRl3/8ms913LGoyFqPfI5G3tQ==
X-Received: by 2002:a2e:a585:0:b0:2e8:60e2:3c8d with SMTP id
 38308e7fff4ca-2eadce3446fmr19304491fa.12.1717763867337; 
 Fri, 07 Jun 2024 05:37:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfdaDQLfxYRj9whdTwklDrvhu8U+rGdl3eDPKZ3aGGJAVI/BLPDYqbPnJxlvXYfHGILxaEvA==
X-Received: by 2002:a2e:a585:0:b0:2e8:60e2:3c8d with SMTP id
 38308e7fff4ca-2eadce3446fmr19304321fa.12.1717763866905; 
 Fri, 07 Jun 2024 05:37:46 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc12a2sm3923992f8f.104.2024.06.07.05.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 05:37:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com, Jani Nikula
 <jani.nikula@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] drm: have config DRM_WERROR depend on !WERROR
In-Reply-To: <20240516083343.1375687-1-jani.nikula@intel.com>
References: <20240516083343.1375687-1-jani.nikula@intel.com>
Date: Fri, 07 Jun 2024 14:37:45 +0200
Message-ID: <87tti5j5d2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> If WERROR is already enabled, there's no point in enabling DRM_WERROR or
> asking users about it.
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com
> Fixes: f89632a9e5fa ("drm: Add CONFIG_DRM_WERROR")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

The change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

