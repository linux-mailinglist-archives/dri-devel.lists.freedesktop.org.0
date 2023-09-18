Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46DD7A4222
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533410E1F5;
	Mon, 18 Sep 2023 07:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BE510E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695021551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jJuO9DejLukgU1wcStY8CFd7ozDVd8lIMTfDSXmwzw=;
 b=TSwlknCvsHEoVgSNDKHaxmn7Nli4uRtlv7+rLBz6a307Ax5ano/GDqEsJnU1AGHOk8SbOK
 mB6x3LGQpisbGgENbxNa2I3KM6yQT7lHPQ+BbrAuNkwjWNwck6HeBKfDsYSc190LMvXZKt
 Se4IayR56JByyhP6EBcVW/YsvLzCiNs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-aomY-Y_0PbKK5dac6JSMWg-1; Mon, 18 Sep 2023 03:19:10 -0400
X-MC-Unique: aomY-Y_0PbKK5dac6JSMWg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso2772164f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 00:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695021549; x=1695626349;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jJuO9DejLukgU1wcStY8CFd7ozDVd8lIMTfDSXmwzw=;
 b=F13UrfrsaezIBWBw+eydXj+I7AN7TDIjqDRuEl1xXRI0+DotVTwq+gu5svIZzQFefw
 TyFIES8QKa0ROFX3g7l+xtL1iUZ4AGeev52VkBCbmSx3xGJDvUNmyNOD7hXyZHJEu4XA
 zZT7ETiJbmd/wBtVHAynNCEjFnKvanP79k61FqB2dncQv5s2zPi/FUFIxs2Vk0t09pBw
 ip5ZDEtCp3myRfN5Uuumnu8jh/LEStPvHG2gbKB39NAg3SXJsh0uOfNkiJgv2xnL56uZ
 DHMJ65tfvaSv583WjXvrDrnEL6TZ82UDkrmZsiXR08gDrc5hnSatUj9DgPntKDR/YmDD
 pCFQ==
X-Gm-Message-State: AOJu0YzRvtTKZdJnq8RyZaZ2juZLY02bCFhPHZK7JbtKkxuOkTn7+hjg
 bA0VFyymcYjin1GPU8EcEmTl3lYjHpTPRFMjuHZZGNMmXDUqkgG5XJOicuLEAufD9YtxqMnvaBq
 upgNZISzYWugMWu8z1nRgn94AxCTw
X-Received: by 2002:a5d:64e3:0:b0:321:5969:d465 with SMTP id
 g3-20020a5d64e3000000b003215969d465mr887839wri.65.1695021548985; 
 Mon, 18 Sep 2023 00:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MtgGPRsBh/wAWRyBIYIEDogHk4lMwlYiuzy3YndduPnhkLzO3H9Of13YjunrxAa2N2KUlg==
X-Received: by 2002:a5d:64e3:0:b0:321:5969:d465 with SMTP id
 g3-20020a5d64e3000000b003215969d465mr887828wri.65.1695021548689; 
 Mon, 18 Sep 2023 00:19:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4c8f000000b0030647449730sm11723549wrs.74.2023.09.18.00.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 00:19:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
In-Reply-To: <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
Date: Mon, 18 Sep 2023 09:19:07 +0200
Message-ID: <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
>> The driver uses a naming convention where functions for struct drm_*_funcs
>> callbacks are named ssd130x_$object_$operation, while the callbacks for
>> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operation.
>> 
>> The idea is that this helper_ prefix in the function names denote that are
>> for struct drm_*_helper_funcs callbacks. This convention was copied from
>> other drivers, when ssd130x was written but Maxime pointed out that is the
>> exception rather than the norm.
>
> I guess you found this in my code. I want to point out that I use the 
> _helper infix to signal that these are callback for 
> drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs. The 
> naming is intentional.
>

Yes, that's what tried to say in the commit message and indeed I got the
convention from drivers in drivers/gpu/drm/tiny. In fact I believe these
function names are since first iteration of the driver, when was meant to
be a tiny driver.

According to Maxime it's the exception rather than the rule and suggested
to change it, I don't really have a strong opinion on either naming TBH.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

