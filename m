Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B87B9CC7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749DC10E1EB;
	Thu,  5 Oct 2023 11:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016E10E1EB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696506207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y4BzSPuYTD1RVTmtiPYRc2B/emmSLddqafmsMxkTjF0=;
 b=f3vvIdG6xVQ4eUqzIu7yEM2k1EmrRirPjhCzWyFuos/jOORVO0MNJ+oP8vJCCyifyIzjfO
 K+NM6Ogy87EmneBisnaMrAkyPpGj2Zdqs4j2F670NcUHOKqJK2p202/eyg6KmWl6d+qXOY
 ZlrzoGtbBJRyxtbmMnAzSoH505CNx9k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-Du4CeHwlPdyu6m9qUpVN0Q-1; Thu, 05 Oct 2023 07:43:24 -0400
X-MC-Unique: Du4CeHwlPdyu6m9qUpVN0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4054016ff33so4441705e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 04:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696506203; x=1697111003;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y4BzSPuYTD1RVTmtiPYRc2B/emmSLddqafmsMxkTjF0=;
 b=h4qzZKLrmwx88kT3e7y45bKfIB3K60rR4qS3iHl6bBhizBDw+JkEl9OyqciowKvcKr
 3mtlnlPVfgKm3cE1hSqGqxgm4GS27ZMxFi0qNtQejAWVBIE1mmMrLH8ZdpA/0OifB+6z
 1vliB1p7+ppSOLtA+joVIH8caDllYQ7KfSqDOK5e0U4ynT3T9vpOrsXRRcea/yRgiqdz
 m+augtlMJ6QjT+YDVudLqvN3yDJyPbciwkSudGnb8pOBeL5qVtl4nMihpzuJnn4cLZkg
 CW4hEQUNhFd940Tm/Ja4dlgTe8PAyqS0lcAEUPABjZE4Wxgn9cUl5KatwoJF+Et8dq5k
 687Q==
X-Gm-Message-State: AOJu0YwIWTSlLpaQAJeypgWkqXT20rvCKwgzE52DxsgYZdU+VK7aERWD
 JgX2rLHrV27W372gCUlf32GvsllQCY7LMAVLhFTsey61mf7IoKyBqGAgbriMb++3uk8+5mDnUad
 a92g+lfJ1+PTWNCzI5rO7rnd48ICV
X-Received: by 2002:a05:600c:1c96:b0:405:3622:382c with SMTP id
 k22-20020a05600c1c9600b004053622382cmr1193566wms.17.1696506202960; 
 Thu, 05 Oct 2023 04:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGk2s+KSDiwz1IGM50cbC10slcMP+pa8JWn+JhQhAGbcjzZ86s/NiTCKhvWqtW662VSZY0AQ==
X-Received: by 2002:a05:600c:1c96:b0:405:3622:382c with SMTP id
 k22-20020a05600c1c9600b004053622382cmr1193547wms.17.1696506202630; 
 Thu, 05 Oct 2023 04:43:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b0031ae8d86af4sm1587316wrr.103.2023.10.05.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 04:43:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 7/7] drm/ssd130x: Preallocate format-conversion
 buffer in atomic_check
In-Reply-To: <20231005090520.16511-8-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-8-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 13:43:21 +0200
Message-ID: <87zg0xuwfa.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Preallocate the format-conversion state's storage in the plane's
> atomic_check function if a format conversion is necessary. Allows
> the update to fail if no memory is available. Avoids the same
> allocation within atomic_update, which may not fail.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

I like that the preallocated format conversion state is now part of the
shadow plane state. That makes a lot of sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

