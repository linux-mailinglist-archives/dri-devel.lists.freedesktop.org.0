Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC7E7F7699
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 15:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0AB10E7FA;
	Fri, 24 Nov 2023 14:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA83F10E7F7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700836908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3K50cOwL2e/Sm1/EHsvbvDxOsSWvo2nEBpLvx7bOk4=;
 b=OgaXH2lNxWR1gBvmlfemE5YJRfMg/ei3nYx5R81wNllbgM6D0f2sDH+52oCS2K8D/6kGc7
 dFtzpjALnycerIauog+iE8qOAEwa5+YnEkJ+lfIlhZRQTdh/5B9tcY55+lgbXaVy5yDkxs
 V1KiWlOKQB+epLsw/JaKwwXHS7u8vKc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-xOF2S6KTNOiHDZoWHc4zUg-1; Fri, 24 Nov 2023 09:41:47 -0500
X-MC-Unique: xOF2S6KTNOiHDZoWHc4zUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-332e82bb756so595167f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 06:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700836906; x=1701441706;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3K50cOwL2e/Sm1/EHsvbvDxOsSWvo2nEBpLvx7bOk4=;
 b=MRfbum+ENAVcu8UiBu+CKKby6B4cJHlFWZIHq2Yld0xadFR657y8jSsLMgd6sSvaAY
 Kgez9iI7FdlblzSrKJsDA4yHPO6qFLJyhnv9az7T3FtqLN7HwgdJ/5D68spnQkujpEpv
 lmEhgmfCTJcuspbLU1NvqYoZGoHlNaUkRTblQle+zlDMjGFuuQ6q+FhFleig+oBf+xhY
 LvtlMQY4xofB8y14u5mehTjximiXUHDosMlU7Tb6g3O15NmY+Bzq7ACl+aNtbXGpl0Ea
 4B87R/zG0UdLm2bKfpdkEMsuwP90LY1I57Je2VRcSH/XcxhT2OYpYhciGsZ6uFx38Woh
 Zkiw==
X-Gm-Message-State: AOJu0Yyhkw4GctB8Pwzl+Bghw80wxf0R1RBFXI0Gsr3Y7Y1ZMKb/1HHx
 QF8E4uvbPkHmNVNb14+BQksn3K3nUpNYPuw9zum+Sg/fTLxWqE8snRjSiM7AwkvgEdA3CwQgWXT
 Cm/Sli6ighiD8WBiV3Sp9g1lJ+7H7
X-Received: by 2002:adf:ff92:0:b0:332:eacf:c9d7 with SMTP id
 j18-20020adfff92000000b00332eacfc9d7mr2292962wrr.8.1700836906404; 
 Fri, 24 Nov 2023 06:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE53BbITSRE5erDBMKhplTxbIjo+7N2xRO0vWBt96X5OYz91Q7KP0WC4vmV1rL31vNgSjrYww==
X-Received: by 2002:adf:ff92:0:b0:332:eacf:c9d7 with SMTP id
 j18-20020adfff92000000b00332eacfc9d7mr2292920wrr.8.1700836906054; 
 Fri, 24 Nov 2023 06:41:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s15-20020adf978f000000b00332d41f0798sm4514822wrb.29.2023.11.24.06.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 06:41:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
Date: Fri, 24 Nov 2023 15:41:44 +0100
Message-ID: <87h6lbcixj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Albert Esteve <aesteve@redhat.com>, linux-doc@vger.kernel.org,
 banackm@vmware.com, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, mombasawalam@vmware.com, iforbes@vmware.com,
 Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Albert Esteve <aesteve@redhat.com> writes:

> v6: Shift DRIVER_CURSOR_HOTSPOT flag bit to BIT(9), since BIT(8)
> was already taken by DRIVER_GEM_GPUVA.
>
> v5: Add a change with documentation from Michael, based on his discussion
> with Pekka and bump the kernel version DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> might be introduced with to 6.6.
>
> v4: Make drm_plane_create_hotspot_properties static, rename
> DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE to DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> and some minor stylistic fixes for things found by Javier and Pekka
> in v3.
>
> v3: Renames, fixes and cleanups suggested by Daniel, Simon and Pekka
> after v2. There's no major changes in functionality. Please let me know
> if I missed anything, it's been a while since v2.
>
> Virtualized drivers have had a lot of issues with cursor support on top
> of atomic modesetting. This set both fixes the long standing problems
> with atomic kms and virtualized drivers and adds code to let userspace
> use atomic kms on virtualized drivers while preserving functioning
> seamless cursors between the host and guest.
>
> The first change in the set is one that should be backported as far as
> possible, likely 5.4 stable, because earlier stable kernels do not have
> virtualbox driver. The change makes virtualized drivers stop exposing
> a cursor plane for atomic clients, this fixes mouse cursor on all well
> formed compositors which will automatically fallback to software cursor.
>
> The rest of the changes until the last one ports the legacy hotspot code
> to atomic plane properties.
>
> Finally the last change introduces userspace API to let userspace
> clients advertise the fact that they are aware of additional restrictions
> placed upon the cursor plane by virtualized drivers and lets them use
> atomic kms with virtualized drivers (the clients are expected to set
> hotspots correctly when advertising support for virtual cursor plane).
>
> Link to the IGT test covering this patch (already merged):
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Mutter patch:
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Michael Banack (1):
>   drm: Introduce documentation for hotspot properties
>
> Zack Rusin (8):
>   drm: Disable the cursor plane on atomic contexts with virtualized
>     drivers
>   drm/atomic: Add support for mouse hotspots
>   drm/vmwgfx: Use the hotspot properties from cursor planes
>   drm/qxl: Use the hotspot properties from cursor planes
>   drm/vboxvideo: Use the hotspot properties from cursor planes
>   drm/virtio: Use the hotspot properties from cursor planes
>   drm: Remove legacy cursor hotspot code
>   drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

