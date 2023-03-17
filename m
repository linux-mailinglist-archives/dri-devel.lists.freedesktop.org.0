Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D06BE883
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 12:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453610E105;
	Fri, 17 Mar 2023 11:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF310E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679053635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hI3L9hrAihHETIeCxDjASUcWbVB3+GqPGjTZpo1htfw=;
 b=h8MuODO5QHp69t9b1gTEVEnsCeyvV3/B8P2hjeaL/oog2EUVGzVRMhn6EDs0qZGYLaskWq
 j95T6sTistKRK795XgrRKQHtDMNv6Nt+lamYcUN0SmA0wxV2xlgVRwhoHb4n9VN2EweplT
 Ck/le9Sfdd6NYLKXB5IUP7sxSHqqWZc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-I-MqAbIpNZCdAMtTCvlh7A-1; Fri, 17 Mar 2023 07:47:11 -0400
X-MC-Unique: I-MqAbIpNZCdAMtTCvlh7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003ed245a452fso2157603wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 04:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679053630;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hI3L9hrAihHETIeCxDjASUcWbVB3+GqPGjTZpo1htfw=;
 b=L7o+ThJ4vX4bvVOYYr0AF8X/VTETF3r48sBQNouS0HLvKnBubu4rtnidOPkSCpEnl8
 vUoxBAUIhzTMiBqUy6mGeh4CKxunVjeMl8b3qvIXAgLGUPBvTi/dNUP1eAn1bAUC+h7s
 8t78yVKFFTL5NegCNafu7cnuVyT8yhriU3pCuKNKXeYd5d6dI2NxXZXVLGwTR1p51Phf
 MU5iBbLWVk9bOOEFJ4dXT5eNhO1QmIPkuhWfwmqusargBnMCb9BHoBWVWRE/wBqQvOBb
 A+uFJZGIGUwPFCFMsPmpl2FQG1bqFS4EFH3s/DzceM97yRf22NvQsLjC5qMxokIHBmKP
 xIWA==
X-Gm-Message-State: AO0yUKXdWbd9ZJo9d20K2DH9lbaByEoRjzc1HLFt2Pa9mM/DJLJCora/
 0yQvx627L/1svW92hftPYS/vuUE7FymkcC0n1+XIksCwkovg/prjUhQ1dQocGJCRHLlN6c75EY3
 MynBlGxZsn2NtVxCZWEqxXgMovY6n
X-Received: by 2002:adf:f7cc:0:b0:2cf:f3e8:910d with SMTP id
 a12-20020adff7cc000000b002cff3e8910dmr6935642wrq.16.1679053630759; 
 Fri, 17 Mar 2023 04:47:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8+jG8RXJ2I6fuXcx2nwI3HbsZkah9pNnMvXVftlA/SCG04uNXuT/TtBoE9UdSQBFAyf4ppw==
X-Received: by 2002:adf:f7cc:0:b0:2cf:f3e8:910d with SMTP id
 a12-20020adff7cc000000b002cff3e8910dmr6935635wrq.16.1679053630497; 
 Fri, 17 Mar 2023 04:47:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056000109000b002c56013c07fsm1745540wrw.109.2023.03.17.04.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 04:47:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 1/6] drm/fbdev-generic: Always use shadow buffering
In-Reply-To: <20230315161442.27318-2-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-2-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 12:47:08 +0100
Message-ID: <871qlnr45f.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Remove all codepaths that implement fbdev output directly on GEM
> buffers. Always allocate a shadow buffer in system memory and set
> up deferred I/O for mmap.
>
> The fbdev code that operated directly on GEM buffers was used by
> drivers based on GEM DMA helpers. Those drivers have been migrated
> to use fbdev-dma, a dedicated fbdev emulation for DMA memory. All
> remaining users of fbdev-generic require shadow buffering.
>
> Memory management of the remaining callers uses TTM, GEM SHMEM
> helpers or a variant of GEM DMA helpers that is incompatible with
> fbdev-dma. Therefore remove the unused codepaths from fbdev-generic
> and simplify the code.
>
> Using a shadow buffer with deferred I/O is probably the best case
> for most remaining callers. Some of the TTM-based drivers might
> benefit from a dedicated fbdev emulation that operates directly on
> the driver's video memory.
>

But it's questionable if that would be useful due the limited ammount of
video memory that most of the devices using TTM-based drivers have, right?

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It's much cleaner indeed to have fbdev-dma separated from fbdev-generic.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

