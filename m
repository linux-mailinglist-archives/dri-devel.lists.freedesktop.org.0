Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D67A11C63
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A52B10E573;
	Wed, 15 Jan 2025 08:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T4p8DUeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07F510E566
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736930925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2mBc0QRvYiLVwmI9T+O0jGisNngAza9/FNxt6ukUj8Y=;
 b=T4p8DUeCNr5+CPT49GRWvNMKhAG9QR0PrwC1XlKU6/2mIEprrX1XiFQmxEs9l23IFD4Ktd
 eUUJZJ+CeZy5QLDuWf9hKbvFxFAZpVJN0loHW+AmDdIyoj3bfOpH4YeUNizEZ2IktZm2VR
 Cjy1wH0QZdyhq1gCS/VxP8q9BZzL294=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-xSAnvJ8wM0yUeShFwE2y2w-1; Wed, 15 Jan 2025 03:48:41 -0500
X-MC-Unique: xSAnvJ8wM0yUeShFwE2y2w-1
X-Mimecast-MFC-AGG-ID: xSAnvJ8wM0yUeShFwE2y2w
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436248d1240so30322905e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 00:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736930920; x=1737535720;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2mBc0QRvYiLVwmI9T+O0jGisNngAza9/FNxt6ukUj8Y=;
 b=gCxkYqqIVBwGceaEirajuE7BlNEhbFnk6/11h2Og6xuz7r5OEOJ+Yc23y5gLFFA/ec
 QRf6XuE8zgf9vfejzcyLwnsK6wW1jfmyIXB3THhcI08pMjye/X9r5EfEskUhHPFBLLok
 7khIwWJYFWNIMGQf0tt1fAiN6Tr96xh1gYAwCgYqxsN8LNvjesyFcS4k2XEHAVxcAmao
 Dpcf9Ee1AlYn3qO7c4mgpvalLUQmA2hHmVij5cPAicXxj/R9AlFNurC0PJ1NU4+7Gs/v
 aWjwNJLm+ZnEOu+RhKhS8tWETs8O/vu1MqBBdQwrBY8S01ppbV5uorCqT5dgEedKSEcP
 rl5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkEy1aG+g5/5s6+I6FFA5SzhsGO8UD+Dp12ugmkFlCJH3zzF5sDk3aMWz+4APHrKwaRP/U9Lo0yY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkupN/R6CMKwvNKhCg254lYesUjuPzb1bpTb7sqsyQGIuEUuZn
 sDNd51Tz6H+HV4A7U7sji3UqzaWB5QOltSNFkXlvID0SYWNM+CYtpy2Yo49RS4s5ZP7QXcmOLYK
 Eic5XuUP8YxVD/EKMcPXL7RbOMqNdtcp+6i5jObPGdH1PlO6XB9WQ/XpFSHKT/2iD8g==
X-Gm-Gg: ASbGncs6ptiaXOr/kcW+SruPGbpjfkVNK2IaFrZ5W+ki2gnqANHMBOJuA9HADguNmEw
 2DfWeON4BcHuHNzXo1iDoQUXJYLi55pdwl/MBhkBr+Yd1bLEEBZrjh/qVr36bzf8LWHB+mUsYe9
 XWM0JVkZ05VaETaZ/v2f8gqUPPFWdVtZ3Ke9YIMdpbsgYpzCUeTioluW/kF2NEF6Oh6XNZdaL38
 ia+yrOCncQrdpZSVUH6RhpfMfH4V0v2ZpoBHUuxN1GG5uTfdNjoP498kmXn+zhCJ+SWeEEDVxsj
 EDri3eoC4D7CbNvkc5AIjFZP8oDOnlgUwm7dkVU=
X-Received: by 2002:a05:600c:1c98:b0:436:1b7a:c0b4 with SMTP id
 5b1f17b1804b1-436e2677c65mr204961865e9.1.1736930920689; 
 Wed, 15 Jan 2025 00:48:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEByt9TVNmo8VpKoSlqzpJvSj2F5T/QXyBHxvqsrx6e3VzKTQNKwSuUcdaJFMk4BdGbfc4P9w==
X-Received: by 2002:a05:600c:1c98:b0:436:1b7a:c0b4 with SMTP id
 5b1f17b1804b1-436e2677c65mr204961655e9.1.1736930920329; 
 Wed, 15 Jan 2025 00:48:40 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753ca42sm15059645e9.35.2025.01.15.00.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:48:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/ssd130x: ensure ssd132x pitch is correct
In-Reply-To: <87seplvv9b.fsf@minerva.mail-host-address-is-not-set>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-4-jkeeping@inmusicbrands.com>
 <87seplvv9b.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 15 Jan 2025 09:48:38 +0100
Message-ID: <87o708wjh5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5d567lsctvsOw84lFu_SlsTgEhyX-lwlKFLdLDvWb-Y_1736930921
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> John Keeping <jkeeping@inmusicbrands.com> writes:
>
>> The bounding rectangle is adjusted to ensure it aligns to
>> SSD132X_SEGMENT_WIDTH, which may adjust the pitch.  Calcuate the pitch
>
> Calculate
>
>> after alighting the left and right edge.
>>
>
> aligning
>

I forgot that this patch also needs a

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")

>> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

