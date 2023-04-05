Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75B6D799B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 12:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A8810E8BA;
	Wed,  5 Apr 2023 10:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7CD10E8BA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680690077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LwnbCCnkeV6p0EMxwdcDykkMOdpfLU8p8aqNhgjGBpc=;
 b=KYyFTHWtyMygPzoiW/mXglG/0x+Pyn7H2KbbfRm+djdgRzBsRAmFePMiD+WV+BoXgVPPrL
 Mo1rJmfuURXVV5YQU7Asy7RG42i90Gs33aOXvtRw7ZiEMJUnQombCTBy1HGKjp0RggsoPs
 +2KH7vyW5i7PX/YZ5yDcGALt+9X9HVY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-T1gEdUldPVWEwoUnsXu8sA-1; Wed, 05 Apr 2023 06:21:13 -0400
X-MC-Unique: T1gEdUldPVWEwoUnsXu8sA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u27-20020adfa19b000000b002d3b9266941so4322809wru.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 03:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690073;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LwnbCCnkeV6p0EMxwdcDykkMOdpfLU8p8aqNhgjGBpc=;
 b=x5L5+PIjxhwMF/ow76BIQJCmFp1Qod2dUVaeoJIUOxgtc9/A7c+PMSd4j9+6H8ba9h
 73CIo6DhBA0ORG1yuPZvf9reXz2FaqC5fJz7HylSPFL/pzeQWwUNKf3n1QaWKEk7nly3
 nrkjx4GrlxXVNIqSta95UmQ7tHzWtN/niGiSl1fSFe3wihqNUng4cp17w/uebjUs4Ceb
 /APxsfJGEvlW/GL9G3Q06z2++uX3ej/Pd8+mqI9s3VHHMDT+/B36y9tZIX2HEoCPTOlr
 meH5dUgDeriORXCziIF8tTYeeqA1wa2UuZa3lZZtW3BmSzAnt3XD/boESY2hd5A13E+r
 FOvA==
X-Gm-Message-State: AAQBX9d8ckFaeFx/ojkkE+ahm1kqLLbZ+wboEyv3jg0em7+2xl1pAy5T
 bgwfUlWQkgxunwYbAtJ1PNGnY1lruoW5NBKNJf4dSZF4PKoPN6jOr2hL1midjFpI0D70bMqnlQz
 nENguPpx3715bk6jGP4DXotG99gLM
X-Received: by 2002:a5d:4dc3:0:b0:2cf:e3d0:2a43 with SMTP id
 f3-20020a5d4dc3000000b002cfe3d02a43mr3590095wru.4.1680690072796; 
 Wed, 05 Apr 2023 03:21:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIH4THo9EGjZAKkNBuLIQorIFwZkRC/w8hM10CIdydl5OhWOL9N0N6G0GANIOc9qFkYKffXA==
X-Received: by 2002:a5d:4dc3:0:b0:2cf:e3d0:2a43 with SMTP id
 f3-20020a5d4dc3000000b002cfe3d02a43mr3590080wru.4.1680690072550; 
 Wed, 05 Apr 2023 03:21:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y13-20020adff14d000000b002c55306f6edsm14670568wro.54.2023.04.05.03.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:21:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/fb-helper: set x/yres_virtual in
 drm_fb_helper_check_var
In-Reply-To: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 12:21:11 +0200
Message-ID: <87h6tud3zc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Drivers are supposed to fix this up if needed if they don't outright
> reject it. Uncovered by 6c11df58fd1a ("fbmem: Check virtual screen
> sizes in fb_set_var()").
>

Should have a Fixes: tag ? I understand what was uncovered by that commit
but it help distros to figure out if something has to be cherry-picked by
them. So I believe that would be useful to have it.

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

