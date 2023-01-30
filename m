Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2DE681FFE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 00:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC0110E0F3;
	Mon, 30 Jan 2023 23:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0DD10E13C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 23:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675122721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAdTklmEDyAgRNbObsy/Ygo6Kv9vgqHE1ov2RCXdrFg=;
 b=XzD3+pXtOuUm7LFGNDuV9pO+NVEusnfG73SEnPM84oeLJRi/IOl8FfuJZ0iUSscWHvJkH+
 FXspl4bk8GqY4uSWHVqLsQoIECXCbgC7Es35WHjmjuJI8quTDtgMYyVyvuMW6c5LKh7djo
 C6yJZeEe8DAyABw2VPMuv2NpKOobjWw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-OdTF6ewXNuOW1w29ZPDnMw-1; Mon, 30 Jan 2023 18:52:00 -0500
X-MC-Unique: OdTF6ewXNuOW1w29ZPDnMw-1
Received: by mail-io1-f70.google.com with SMTP id
 u1-20020a5d8181000000b006ee29a8c421so7583259ion.19
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 15:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAdTklmEDyAgRNbObsy/Ygo6Kv9vgqHE1ov2RCXdrFg=;
 b=XvZgRJnYuCmw/RB7knPRv0Mn/NuDd6O6Zgjs/VgjI8MUjldHjSNanF/RnJIpg0FLTp
 kzmCDni7j82Uqj+KrZSGHT/K6QVGW9Il3OyxEKCQZNq49HQ4sRuSxyNOkUGgVAL2TeEI
 t0jrqoHkn832Goga0Z0dbaTISwIxxdWO0DlmTxgA++q3G5QupD6ohzA724oxWpGRjM3m
 UGQrUubB5YvytNTJnZ/CZWHBTQefT87WGu3J5cfAymyVU9MmRH+8lyj5l2mdfa1930n8
 Z3LImyvnM5uI8IkIa5cXok3X+aIesea/ahlmICaZFHBMd2KwjkgjKApLrNcswwPlefYn
 mn4Q==
X-Gm-Message-State: AO0yUKVbmuwknx7n2sX0ra2smLWxewPx5QdG6N/VEB8IM4zUWRV1LT2r
 M3L38sXslAtYCFgdJoY4pLvv7pBhy87JqF/i4s7qCdqr1H6zyFn/CQKYpFwvPzq2f3McbmypMuJ
 yYlX452jePumDazvKe2dgE/FeExaE
X-Received: by 2002:a05:6e02:190f:b0:310:eb55:3856 with SMTP id
 w15-20020a056e02190f00b00310eb553856mr6886973ilu.9.1675122720177; 
 Mon, 30 Jan 2023 15:52:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+Tjuh/QLV5ACoKjB78BPy3FHiMPojdoqjURp7yFxxmHnP5uajB9G0cNMY2hpBpgzJz6u+eCQ==
X-Received: by 2002:a05:6e02:190f:b0:310:eb55:3856 with SMTP id
 w15-20020a056e02190f00b00310eb553856mr6886951ilu.9.1675122719932; 
 Mon, 30 Jan 2023 15:51:59 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w65-20020a025d44000000b0039deb26853csm5227538jaa.10.2023.01.30.15.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 15:51:59 -0800 (PST)
Date: Mon, 30 Jan 2023 16:51:58 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] vfio-mdev: add back CONFIG_VFIO dependency
Message-ID: <20230130165158.6993fc28.alex.williamson@redhat.com>
In-Reply-To: <20230126211211.1762319-1-arnd@kernel.org>
References: <20230126211211.1762319-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Tomas Winkler <tomas.winkler@intel.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Jan 2023 22:08:31 +0100
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_VFIO_MDEV cannot be selected when VFIO itself is
> disabled, otherwise we get a link failure:
> 
> WARNING: unmet direct dependencies detected for VFIO_MDEV
>   Depends on [n]: VFIO [=n]
>   Selected by [y]:
>   - SAMPLE_VFIO_MDEV_MTTY [=y] && SAMPLES [=y]
>   - SAMPLE_VFIO_MDEV_MDPY [=y] && SAMPLES [=y]
>   - SAMPLE_VFIO_MDEV_MBOCHS [=y] && SAMPLES [=y]
> /home/arnd/cross/arm64/gcc-13.0.1-nolibc/x86_64-linux/bin/x86_64-linux-ld: samples/vfio-mdev/mdpy.o: in function `mdpy_remove':
> mdpy.c:(.text+0x1e1): undefined reference to `vfio_unregister_group_dev'
> /home/arnd/cross/arm64/gcc-13.0.1-nolibc/x86_64-linux/bin/x86_64-linux-ld: samples/vfio-mdev/mdpy.o: in function `mdpy_probe':
> mdpy.c:(.text+0x149e): undefined reference to `_vfio_alloc_device'
> 
> Fixes: 8bf8c5ee1f38 ("vfio-mdev: turn VFIO_MDEV into a selectable symbol")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: fix the s390 and drm drivers as well, in addition to the
> sample code.
> ---
>  arch/s390/Kconfig            | 4 +++-
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  samples/Kconfig              | 3 +++
>  3 files changed, 7 insertions(+), 1 deletion(-)

Applied to vfio next branch for v6.3.  Thanks,

Alex

