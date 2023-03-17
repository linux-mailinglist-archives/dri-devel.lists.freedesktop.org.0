Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9F6BE979
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9A110E371;
	Fri, 17 Mar 2023 12:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2010E371
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679056804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D9XFTBb2zgyqIT4AVJNLKNEH3L+TYJBN/NaquSnfHGM=;
 b=LjThZsz27CkSlpEhXvfbwEQ5DWJb0W9ovEb5ltixwEstWjIF/nnPhEdNifWt4i/uJyYdM7
 lVpVfi2nl21swp+nsNHoxdH/sbj5jOxTgZJE3RWiH6RA8NBflK78U2Ep2SkUfbe0QrzmHx
 2V9vy8Lx6pieexex3yfFfgOqhTdE428=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-cK4JmznFP_6PcScWzF2Edw-1; Fri, 17 Mar 2023 08:40:02 -0400
X-MC-Unique: cK4JmznFP_6PcScWzF2Edw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m10-20020a05600c4f4a00b003ed74161838so1317454wmq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679056801;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D9XFTBb2zgyqIT4AVJNLKNEH3L+TYJBN/NaquSnfHGM=;
 b=2sAsc+rUeTBymKZgfuOutWqPTbjBw776QpnTLCoQDTJjBM+Z/vtac++NvzyOVh0yA+
 RbtmHeUECMwPqewrYX0NkZWTjQQrUL482xZxr7gSvpWFUvV1YYR4b0vyAdNZQNxfS4SR
 kcsTQng7KwkkdRTnwWNvicwqkR7M9tdyW3tJgXa/IZwnhlh+/7sjA9gZXgRnkB4VvXyk
 zpkYRupr6JtfLYzogxsZuGE3aLB+8d+YP3wGUBiLnvpnlbQzna0+BVUxRVr7VFDwo7s0
 4WTJcFrNVR8Ssj8lc2NuGnGnD9YBH0yCkaLHwb0t1W1zIOg0xfGaLDT7QTyJfcRFQgtn
 oS+w==
X-Gm-Message-State: AO0yUKWNth5dSdR8a8jsYM+HLcZHOBSW83LThpLx6Vujihso9ENElY/l
 UlwSEQIAuUSYiaJqKHUYWRlgladnEgV+rv4ppy6v6BGDFXiDAbSykcxJ4470tVyVpjbDWfszG0k
 KZ3e3F+py31bNrqTCJo2SBTbJDcrtkaOYcyaI
X-Received: by 2002:a5d:6a86:0:b0:2d1:3eb9:c3c2 with SMTP id
 s6-20020a5d6a86000000b002d13eb9c3c2mr5653502wru.54.1679056801473; 
 Fri, 17 Mar 2023 05:40:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set8fVPo2Hzk3uNiaDEXi36jkpGg3Gnx7Ku6RDiGi8gFJyUhmGDlA5amombYmeyrhCxvbDbLnOg==
X-Received: by 2002:a5d:6a86:0:b0:2d1:3eb9:c3c2 with SMTP id
 s6-20020a5d6a86000000b002d13eb9c3c2mr5653490wru.54.1679056801218; 
 Fri, 17 Mar 2023 05:40:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f18-20020adff452000000b002c5d3f0f737sm1897684wrp.30.2023.03.17.05.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:40:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 6/6] drm/fbdev-generic: Rename symbols
In-Reply-To: <20230315161442.27318-7-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-7-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 13:40:00 +0100
Message-ID: <87mt4bpn4v.fsf@minerva.mail-host-address-is-not-set>
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

> Rename symbols to match the style of other fbdev-emulation source
> code. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

