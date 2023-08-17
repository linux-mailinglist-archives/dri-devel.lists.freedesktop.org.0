Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550B77F676
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 14:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3954C10E1D5;
	Thu, 17 Aug 2023 12:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A01410E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692275492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+xsGM0xCcV9RwUrKQrUxI1E3eQXED1KqHZXvIE2BI4=;
 b=h9LfUD6Mbl5OaVd+quNritAsm/n5WFjLOJ50AYweCL9nkpzdhS3ZnFo2/rqDivYyMbVWp1
 xto/PQWWAEiYNiqwVU9mQs0ybZ3/8LeoO9EQgNxJsaXBOzddLDXkHgSxEihSX/YeqfvpQ5
 iQVIE9g43hM11aBudpAdEOJj1mDhg9I=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-DBd_46-kN4auGO1uzSlaIg-1; Thu, 17 Aug 2023 08:31:28 -0400
X-MC-Unique: DBd_46-kN4auGO1uzSlaIg-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6b9e081b9f7so6110304a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 05:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692275487; x=1692880287;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+xsGM0xCcV9RwUrKQrUxI1E3eQXED1KqHZXvIE2BI4=;
 b=Tk45iI3iZckokncEr2I7FKhJvIMEIK2pME8eKjug2rgH2Iqw77kVQeDHvLYVa0j4RI
 L2rEb/kqUMGYP1Y/CacbLOMnYSseroGz1hdTQ/8S9IHHjXs71qL4GEbjNH9aZIkgTRSC
 Zf3rbZjpMMzo2Qzv5tq/g03tNJCxgwIj4umeMVzHlyzPCiZcAW8u6RcablJsUYV6NIIn
 mCVPG2mPpucVNhRLfUzX71qP0gIzo4D76ZM6P0ZJfCGG4j1T7/Onmj+Aw/v1YJrYITgY
 8pXkdxJrijqjPSqahM3RC5gRvKadudjUBxUKOc8PXO15Sq236lWxdMI+4W9QYFpwSVVR
 4fYg==
X-Gm-Message-State: AOJu0YyIPfq7LK/+5cZPAW9Vn4KMyEt6pMJbgCjQftwm81iQmSnAA+Pz
 r9QnTeCO18kjjmo+lidAQeJmoNOxx34B7+F2Fk8IQVDgdCiOZwJ9uDCovXv0udG8Ux8vhrevRfx
 ai/kmPBmqOSBf1d2tYpwQI4RVV73l
X-Received: by 2002:a05:6830:1314:b0:6bc:f328:696e with SMTP id
 p20-20020a056830131400b006bcf328696emr4382923otq.0.1692275487740; 
 Thu, 17 Aug 2023 05:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbLMPcppybJV+jOD4Mzdj/MSx7jY9uLAskDT3+YlZ3091KhVbY1KfqBrUcpg47H2FQH6IE8A==
X-Received: by 2002:a05:6830:1314:b0:6bc:f328:696e with SMTP id
 p20-20020a056830131400b006bcf328696emr4382911otq.0.1692275487502; 
 Thu, 17 Aug 2023 05:31:27 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 a9-20020a05683012c900b006b74bea76c0sm7126970otq.47.2023.08.17.05.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 05:31:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: Simple DRM frame buffer driver not working on Dell desktop with
 Nvidia card
In-Reply-To: <7287c4cc-2ac4-43a7-a60d-466d5299f576@molgen.mpg.de>
References: <7287c4cc-2ac4-43a7-a60d-466d5299f576@molgen.mpg.de>
Date: Thu, 17 Aug 2023 14:31:24 +0200
Message-ID: <87bkf5g89v.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:

Hello Paul,

> Dear Linux folks,
>
>
> On the Dell OptiPlex 7021 with a dedicated Nvidia card, the monitor is 
> only connect to that, Linux 6.1.39 does not display any messages, and 
> the GRUB messages stay until the X.Org X Server starts.
>

It's a known issue. The Nvidia proprietary driver doesn't register an
emulated fbdev device and it relies on efifb to have fbcon/VT support.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

