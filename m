Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2C6C1BAF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 17:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D5D10E5EA;
	Mon, 20 Mar 2023 16:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6CE10E5EA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679329917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hMdEvkGZX6gP9t/tvB4hM1Y9DcXkYUFUsoGe13JtC0=;
 b=H8K0PAxgx7O0zoDck4Xy9U2TVEHq8x4B++Cv+c86ameUkWzPPvcPhs5S5xFmmAKKwds/Rz
 WJWZ9R58M2BXQxf7ScD2StN7/22uDtynd0Zo+f3D/ubvJ2W+UmXabIAPe3o43rHKmMgB+i
 P9ru11Qhalq48r+8UHThrCLVZQTkjhk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-pEsub2FmMvSzR6UAH4Xirg-1; Mon, 20 Mar 2023 12:31:55 -0400
X-MC-Unique: pEsub2FmMvSzR6UAH4Xirg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j13-20020a05600c190d00b003ed26189f44so8699169wmq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329914;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hMdEvkGZX6gP9t/tvB4hM1Y9DcXkYUFUsoGe13JtC0=;
 b=FrOXITko7D2q1fXAGgKaK3sMrSD+EaeNKk9DwWEJtM/umLuuCwRMeHHCd/RjRBS1Iy
 9qP9wPGvjmgx9C4Ow5C8z6PyPZQZiTVMEC2Vll1fD3qNP6gb60J8GQyvqo+CVOqb47SZ
 BnfkEhao2JaqMHZrh8vDX0VHK3htyyp6ySgzcKXfpPVlJW/t7mGdgUmP4Ee1J4DFiKEi
 OTwIqSYrouXA51nkZeAPiKuifZhCEUXNOqBR7pQPp2gHKJSutNXsBG+9YGQxfvEGjDS3
 Qy2ZFNCx8qUQA87B3EEO1Q40OcCOTVrs7VvrAFRTYtruKD8+lTsmwi2ZL08d6a8L+Dul
 m+sQ==
X-Gm-Message-State: AO0yUKXwVqMQm17yxC1uxSP3dSmlW34MWwgF686Kr9WadFkzk5cQw0lH
 16pQrBnAcUaVeeu//oVZ3Ky0t3SNiLwApWWy/dL8jfME5RQuEeYpibZkzFLbQKB3NkVozS0/TiZ
 GxZuPHJatmzZDWUabteKvoDHeaG7fmFBmfjCW
X-Received: by 2002:a7b:cd07:0:b0:3ed:d261:50a6 with SMTP id
 f7-20020a7bcd07000000b003edd26150a6mr143612wmj.9.1679329914614; 
 Mon, 20 Mar 2023 09:31:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set/x2KQ09J/l0c4Qtjw37mhjB/6/neHc+BjlbTD+3dOK6k5xoTsuftRjr2GXXV2MwCEKWECctg==
X-Received: by 2002:a7b:cd07:0:b0:3ed:d261:50a6 with SMTP id
 f7-20020a7bcd07000000b003edd26150a6mr143600wmj.9.1679329914339; 
 Mon, 20 Mar 2023 09:31:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b003edddae1068sm5136301wmo.9.2023.03.20.09.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 09:31:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH v2 4/8] drm/fb-helper: Support smem_len in deferred I/O
In-Reply-To: <20230320150751.20399-5-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
 <20230320150751.20399-5-tzimmermann@suse.de>
Date: Mon, 20 Mar 2023 17:31:53 +0100
Message-ID: <87sfdzo03q.fsf@minerva.mail-host-address-is-not-set>
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

> The size of the framebuffer can either be stored in screen_info or
> smem_len. Take both into account in the deferred I/O code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

