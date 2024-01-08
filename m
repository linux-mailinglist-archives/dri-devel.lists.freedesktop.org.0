Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A37826AA2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E794710E1B0;
	Mon,  8 Jan 2024 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3510E1B0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704705994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6YTWyI9pnmCGgMl9btSzC0QrUqFEx74j7BArMXqCJjM=;
 b=TpdmEGa+yxgTz/pamGpGnxIzAcu1vqsJ261oSSUYD+Gni52ZmCCK3PUl06xSBBx9H0Mgbj
 ifUNx5H6ms+dSiVhmj3W1pUAlwpD30Im1UY5K465bQYd45xLSEuTVzsQdGFB8wQHGVIuiK
 JObHH4uYkHMS4Tp/n/a5yplBPZzNtPc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-roiY2nzZOjGlMiRfJtP0Vg-1; Mon, 08 Jan 2024 04:26:33 -0500
X-MC-Unique: roiY2nzZOjGlMiRfJtP0Vg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-336937af9e9so630763f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704705992; x=1705310792;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6YTWyI9pnmCGgMl9btSzC0QrUqFEx74j7BArMXqCJjM=;
 b=FEj7ilzjjr054NFAUObKBJROvZyfsEB3lFuPdp5jIz7shGfdjSX9uxFEEkPxL0QqA0
 S+40dCrABRegYpD/EY+Cuhp9LcIe4WMlXhAgMhVngRVYyEwBwcwtV1AXucO2RgrW2hSV
 nxvYNkvrde/a8kVc7VduohySA+xIeDVxDjIxMy2xeQ15TBmxnbW4+jmks1doJtv3cSSZ
 uFUijuVR0jtFka4HRhD76+2l78QZVSUgzot7EVFGP2aIGsF6cU0Dp+0OF5bZeWv1SB99
 5qsKmrbuLFNnvwXxVqmyPg4iHxxWV32enqWKmWadORNa9J5CS3CrUmNjBOBcKPEx6L1Q
 Lwtg==
X-Gm-Message-State: AOJu0YwdYuwILkeU2MJVQaqt8cqpObxBQTiXl0NlIv9c5plzh0l6r97C
 yZ6g48VDRaKb57ic7Gfk2e+kPcNRDVa+uy48c9NxKWSJxdH+1uTihUC4ULXtlHVao06SMmY26yI
 xNLI1DqKfvsglRUDExPE/vM6K09x44vTSiFpz
X-Received: by 2002:adf:f6cd:0:b0:336:8767:2e2f with SMTP id
 y13-20020adff6cd000000b0033687672e2fmr1627258wrp.7.1704705992344; 
 Mon, 08 Jan 2024 01:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElQ85E5AG8DGOKkrtDXTZaOebM+TMHkse/0Vdzz+KyAM6wy4odUSkHjozFDOl2/e8dH60OhQ==
X-Received: by 2002:adf:f6cd:0:b0:336:8767:2e2f with SMTP id
 y13-20020adff6cd000000b0033687672e2fmr1627242wrp.7.1704705992051; 
 Mon, 08 Jan 2024 01:26:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o14-20020adfeace000000b0033690139ea5sm7289677wrn.44.2024.01.08.01.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:26:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 deller@gmx.de, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com, daniel@ffwll.ch,
 airlied@gmail.com
Subject: Re: [PATCH 1/4] drm/hyperv: Remove firmware framebuffers with
 aperture helper
In-Reply-To: <20240103102640.31751-2-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-2-tzimmermann@suse.de>
Date: Mon, 08 Jan 2024 10:26:30 +0100
Message-ID: <87a5pgdvll.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Replace use of screen_info state with the correct interface from
> the aperture helpers. The state is only for architecture and firmware
> code. It is not guaranteed to contain valid data. Drivers are thus
> not allowed to use it.
>
> For removing conflicting firmware framebuffers, there are aperture
> helpers. Hence replace screen_info with the correct function that will
> remove conflicting framebuffers for the hyperv-drm driver. Also
> move the call to the correct place within the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

