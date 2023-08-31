Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7C78F207
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 19:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3810E102;
	Thu, 31 Aug 2023 17:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661A10E102
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693503556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AtJ/xu3bwCImw2coTT6CdE5L9VMjGKy3wVeoWmhJJx8=;
 b=f35wo+Aq7w30lgD/ndI9a7lIvhxAQkZOUJiQyS1yvlT45Py2Wy0ZeYVyAht1sEPpdWqqlR
 UZavsK6AgivG2IW6NpSHygsqWGZxx3DihRZ4XhJKdPcG7Rl/Ksb/qHI1aE7zSdN6qVCGke
 V7+MVUYmtLPJrQKtyGG0Vw6yCiZP3ck=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Qe2-c2L7Of247eeZUdWIIA-1; Thu, 31 Aug 2023 13:39:13 -0400
X-MC-Unique: Qe2-c2L7Of247eeZUdWIIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401db0c9d3eso7802005e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 10:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693503552; x=1694108352;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AtJ/xu3bwCImw2coTT6CdE5L9VMjGKy3wVeoWmhJJx8=;
 b=cXQKXL3+vWqtkE0CR/b5/4C+KmYDLMW97aFrRc8bMzZo9PasrpWxWZ4WH7kB1OqTSY
 tqiS9k703rrjc87+hm3X+d5in54sBU2IsFHBbWl8PuxALgfvanaryeyjwyQ2OIwKxQcw
 C9qxEzCW36cnrzUVsDeeYJldnKAMX72p3Xga+om6KCHA+upbg0iu44W/5AE+GUKKKiaU
 h7I6y2gUz8SWXCzsqiMSyD85VXQIb1F73HHg5DOAD5M0nWdy1+NfNcsikPxhpODeTrvv
 /I/DfIQ19yV2ORVDDcuXTfakBpk+ZCsaHtMK0rWZ34PMonil/eqeu9wjICiNdts/LMMO
 vLkQ==
X-Gm-Message-State: AOJu0YwQj6mixPQDRIH2vgnLOqSHD+S/ONtdZXTIvrgN1mhPOvdwHiNK
 ZQvQusqXa6cFGDrdMs95u3rOX80TFUO1ghbxCdhWCz7pHUTgb0RkEN4yOhLugldZgPGhgb2rGpK
 6/344GCpMstt2Fcp1rMQSv7eS8hcg
X-Received: by 2002:a05:600c:c2:b0:401:bf56:8ba6 with SMTP id
 u2-20020a05600c00c200b00401bf568ba6mr4495wmm.28.1693503552780; 
 Thu, 31 Aug 2023 10:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEivxTh4Rq8dPVE35ney4tz4ygOX1lBKSZsUkTZIjeqJXTZbZCqBVjVM7uY5scHsqy1MGfxAQ==
X-Received: by 2002:a05:600c:c2:b0:401:bf56:8ba6 with SMTP id
 u2-20020a05600c00c200b00401bf568ba6mr4482wmm.28.1693503552430; 
 Thu, 31 Aug 2023 10:39:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfe7c4000000b0031c6581d55esm2861784wrn.91.2023.08.31.10.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 10:39:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: ssd1307fb: Use bool for ssd1307fb_deviceinfo flags
In-Reply-To: <303bb1a5012862f0003d3246a0c8120b97ea995b.1693483416.git.geert+renesas@glider.be>
References: <303bb1a5012862f0003d3246a0c8120b97ea995b.1693483416.git.geert+renesas@glider.be>
Date: Thu, 31 Aug 2023 19:39:10 +0200
Message-ID: <87o7inaz7l.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> The .need_pwm and .need_chargepump fields in struct ssd1307fb_deviceinfo
> are flags that can have only two possible values: 0 and 1.
> Reduce kernel size by changing their types from int to bool.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

