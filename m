Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48A7A0C4E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 20:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802510E242;
	Thu, 14 Sep 2023 18:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8051510E242
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694715332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dy26rnYnSre5SG2YZYk/2IdgLmOT/zD6uaKbupR7dh4=;
 b=R4Pnn/5DcehTvErLAxPqRbS/HVbAsDZPFjdNUG25ochAtknxkPHW73sHTwmR/yWFKZiOR2
 OnwHopmBGd+kPf/mmz/x1YEnVW4DFp3CPGHxAQZSYdZywxOgas8B0PKXzks+0qK/qYqqa0
 e0pXuyE6bxWDBwLKdDcxODci5Us8Kw4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-37z1bjW_OKqfgiSoy3vhUg-1; Thu, 14 Sep 2023 14:15:31 -0400
X-MC-Unique: 37z1bjW_OKqfgiSoy3vhUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401e1c55ddcso9936035e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 11:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694715330; x=1695320130;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dy26rnYnSre5SG2YZYk/2IdgLmOT/zD6uaKbupR7dh4=;
 b=GCZUpQYruIySUYUuezhtBKHV0A+hzQCGbFouYDMfDExjlCbKDbg+EA3OER2vQLxgJG
 WqDmzKJ4J8nqrrLYt6PDqT6aBZm9reIt07ExKeVPmSZlrzakevCwciFu2QVEBZeiQfWH
 UQPmT0gM44bXaedTBtgOBNX2VfuMqz6KEeUf94tNxT+/aBPXC6ZHtI+EtMFANn14xDvH
 XCPSFr1+zoNaYz32mhN3uKnJ7O2iJxBkes27DJUqpu+XUsFCWt5H2CARUjUJSggPb3Y1
 kb9+MPbh9yZ56h0eh3aHag64h0gObWyAIWJy/nLh4BQIPFtJRTwlWxdwVGFE5MU+COiV
 eWqg==
X-Gm-Message-State: AOJu0YxFGc1fjlNXMMGlPx4/OXFIuAv2v+J8Qkd8KQzlbXAvv6qfxXIX
 1taG0jDB3z1GZoGP4F75852E+Z+9neAcnrw0Cc4RDp3ds9eF0325swmHE5YaW56OuD+QIymqX+3
 n86IHWb9K0AIc3bt487wJTd92xklQ
X-Received: by 2002:a7b:c849:0:b0:3fe:e8b4:436f with SMTP id
 c9-20020a7bc849000000b003fee8b4436fmr5681452wml.14.1694715330410; 
 Thu, 14 Sep 2023 11:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4/VHO9ItawVeRoyh64koWKwWeYA/G98YGxWIEMSTyHFtsg2Bl1IJBbt4F2rkWPnywStgDA==
X-Received: by 2002:a7b:c849:0:b0:3fe:e8b4:436f with SMTP id
 c9-20020a7bc849000000b003fee8b4436fmr5681435wml.14.1694715330029; 
 Thu, 14 Sep 2023 11:15:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c22c400b00403b63e87f2sm2611719wmg.32.2023.09.14.11.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 11:15:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
In-Reply-To: <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
References: <20230913052938.1114651-1-javierm@redhat.com>
 <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
Date: Thu, 14 Sep 2023 20:15:29 +0200
Message-ID: <87zg1o4o5a.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

[...]

>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

