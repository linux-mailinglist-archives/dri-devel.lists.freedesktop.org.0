Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3DAAA4C28
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FDE10E2FE;
	Wed, 30 Apr 2025 13:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dXGzfKoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B813110E2FE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746018040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
 b=dXGzfKoRhBNqoc/G5b7bXSbcgH5quBL545ZWMVuoqo4tYvZJamTnZqFpKnEwqEK0rUwZeV
 A0KR9UE3XT1Be9W+2Iw8RZ+jAvxA1WxDAeH1NL8k23dxyk52Ep6vi2chQXGMbGOyb/4rXJ
 W/ivqUAPLte5v0XZWVM0IxOC5MDv6Uk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-P_4yRiBbNaq5ThKUKGO2SA-1; Wed, 30 Apr 2025 09:00:39 -0400
X-MC-Unique: P_4yRiBbNaq5ThKUKGO2SA-1
X-Mimecast-MFC-AGG-ID: P_4yRiBbNaq5ThKUKGO2SA_1746018039
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-391492acb59so3398213f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018038; x=1746622838;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
 b=bWf/uDVM9wSpslGApT1uE/hxodVQqzURVSxxFtqSdE2ujOpi12Da6XO/UiyZrJIQz0
 hLH0nCpXDcGNXqGXej2q8LThLUqERDTF8smAHDYG6p/2oe0dyZHJF6/Pzxz848LizMuw
 aAuTOcWbZeaW8EhwHSE+KlO4s9t7x5tX3kSeiwis/WA8V/o8W5eqyJjYUtRQ55/wcAbV
 fSeMLEfCYUn5xZb6eGx+3BTX1/fHEbc1Dt4SPCWhHtgrI28WCPyTcRfNncEOec8B84Vj
 9BN2gp54sGKxfSC0yiT3s8F1fo9z/jKrqgh+RfvHYwhONhZt8Yto/5+lnd0poTBdXpdL
 rj6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNhHkaKq2spvL0k57LD3n9AohZk3I3cLubz5yhZtd0mOrfdsp6Stg4rsOVagj9ojvhKMwcco350gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp3tmwtf5zC4SJo2US6EHeCoXX4jjDTbth4fYDySNEDZDFnclz
 /3DVwSRol7CCpeyVH7RorlokwnrOl7J4UZtxp9lXo9mJyQmSC734xyxjUlC04ABdL+EFM5UxH6J
 Tq0IeNsEZlU3QJ1pIBIi4by3O6xxHTbJTCEzoyWqptGJjhceX6IyngAwsQTebRFqKmw==
X-Gm-Gg: ASbGncv1Uq418n/q2+Jn9h1is2pxn2QHGKjgGZUXqFwZMxpVSwPOOCEkvPwFamRvctu
 MoFPjZUwkjmM+zFqb+6a+oVhoB4qJnNpsGsa0aQ+ynAgkTQzFbXxL+oXXl/Nm5OS078UTd9/wH5
 +Iujg4lcS5lDSxQEKIP8eujZrCM1Q9xrY1HXg1UXrl8wYKaIaN3quocrGUSSLPKjG0MG6XFLOfG
 1XCkepfOPmt5z1IoTLR0vuqsfiFAJa7ZxPtX9+jNiiDK9WIdlLBZbxX7dVLMGn0aejYBkIamwNl
 oaOPA/gMetDJxfsKEQgsiP+z3tGw3QsNjLzeW+9xPEyjlDCRauW4Wz05gI8cdlUFiOxe3w==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id
 ffacd0b85a97d-3a08f752666mr2847930f8f.7.1746018035214; 
 Wed, 30 Apr 2025 06:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH00zIXR/QJpX2r62x/BnijgtG/melnBE3UE7Sv8nmaQkGLGVWABf71hYp4Wd9Pcm+gpDIP2g==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id
 ffacd0b85a97d-3a08f752666mr2847668f8f.7.1746018032433; 
 Wed, 30 Apr 2025 06:00:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5cffasm17192690f8f.96.2025.04.30.06.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:00:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in
 probe()
In-Reply-To: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
 <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 30 Apr 2025 15:00:30 +0200
Message-ID: <87jz71ztw1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8h-fi5faBjC5_dJCH8S00Dr6hqtKzmwInluj-dLFB1M_1746018039
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

> Dan Carpenter <dan.carpenter@linaro.org> writes:
>
> Hello Dan,
>
>> The devm_kzalloc() function returns NULL on failure, not error pointers.
>> Also printing an error message for kmalloc() failures is against kernel
>> style so just return -ENOMEM without printing a message.  (Kmalloc
>> already prints a message).
>>
>> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

