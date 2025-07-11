Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF2B01B4C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4E10E27C;
	Fri, 11 Jul 2025 11:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N9oQAhQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2710E27C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752235125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ntww76Xd2QFeWIsH9WqSn/Nd6aCeKdQxKD07XjvLwgA=;
 b=N9oQAhQF74wIsWJZK5/pZkpLFa3xvhLWggR00f306ndY/CYl9hrFwUSMYlV5lo0uVN7jKP
 9BpI9ww7PkLfSjKBf6HW196tHr/22BdZ1+r26wonFm3BB95eaW63KIIip+0FAZn1mYUyMn
 H2pGflYRNZax4bn9Mv5/G7Et/paSpLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-aL06LYb8PFacS2ysw8Xh0w-1; Fri, 11 Jul 2025 07:58:44 -0400
X-MC-Unique: aL06LYb8PFacS2ysw8Xh0w-1
X-Mimecast-MFC-AGG-ID: aL06LYb8PFacS2ysw8Xh0w_1752235123
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-454acc74f22so13025705e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235122; x=1752839922;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ntww76Xd2QFeWIsH9WqSn/Nd6aCeKdQxKD07XjvLwgA=;
 b=HsHpXtvp0J8wZNxnsoNfawZrGpatTbr++cqUyoGKwo+PzqbvtjMOkGTFak2J/QbmIV
 UT5yZg0v0NJOkTvM8HCnRNZvrIC4FQxFUSDZO95yvVJZHsabg6u3vhmbHvOBcsqrfxdv
 3TkPKFqYIB/v9ogv6MhuziPi3IlK11CppdvzOgbQytxKyziEkYEEb6/p2BkrCg5G8mDa
 a8vKWfaXqVWQ7HvikunqdcR/yenHN1PQmyTlmYPKKaih+eALVsMeSi56bNQCoJtgvFBs
 cNZ2y5o4xdyzMRGGSpdZNOPqZKuBsKDRGdZhQZk3w5ns3nFdAb8d+37iBGyCZEfmXJzB
 q0nQ==
X-Gm-Message-State: AOJu0YyNK4XyIrxHxu7cXu+6d3/7aMjDrz5SokK4MeYPSShrxRUts9Sq
 pYu5yVmtvSyVCO11Q/VnGktKGpezChX8zJcBk0OeimeRvqDGd+oo4ESkHbkmWDDfzBAH3JYKCoh
 KZDQ0F1dLwpWykXGVTe+2szTMQYkjYYv8tWw2WqfW4wW16QDZhfE/pxtZXw20SacRxNWsZ1er8I
 veew==
X-Gm-Gg: ASbGncuXXNgENubWjok+ZYeGVAvGXsXOxQ2q8Fj7zMMZPwadzm6dqvtf628bc3Uy4Tb
 j4RAzZLInoi+VwtmSmxaQnGKGJNB8yd1n0/wQgkU8a+mGi79NndffUrcQTIafIFgf18tpg6C8bd
 xXcW1NY3fDpwRL4pwU46oGDe4uAXfvIHuYoRJ4KWYF6Dljk+DFpIWHvAWe+nHI09SJ0iUZaD981
 hOpfupwVQ7pxevkXs9K09qNKDDkQd3mmnzHYwAaoE8CSkwrdiE+mF9JFcyd2TzUKziCNawe9QqX
 YFuYGx3mav0Yh8VwyJdha6jmAZ3lgo60WisnHyYLWwmlXaX5pXycsbT9wYMzAmUykVqVc+DhoQR
 sGq6Z742Q1isJdJ9xAlmuOQ==
X-Received: by 2002:a05:600c:35d1:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-45565ee297emr21355635e9.30.1752235122386; 
 Fri, 11 Jul 2025 04:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGY6os5JEmGeWKE3RyUnstRiNX3vdFtaZZVu2Jtpc1FiIetXr7wtnBTWboWgZS92BGJfWRRw==
X-Received: by 2002:a05:600c:35d1:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-45565ee297emr21355395e9.30.1752235121876; 
 Fri, 11 Jul 2025 04:58:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc9298sm4261126f8f.44.2025.07.11.04.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:58:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/9] video: screen_info: Add pixel-format helper for
 linear framebuffers
In-Reply-To: <20250617143649.143967-3-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-3-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 13:58:40 +0200
Message-ID: <87y0svdjm7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CfQqv_h3KxIs3GRFNqrghd0DxH61y4VQFAxZJoAAUcA_1752235123
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add screen_info_pixel_format(), which converts a screen_info's
> information about the color format to struct pixel_format. The encoding
> within the screen_info structure is complex and therefore prone to
> errors. Later patches will convert callers to use the pixel format.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

