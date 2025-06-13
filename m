Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89690AD8A73
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250610E115;
	Fri, 13 Jun 2025 11:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DwhLojgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D0C10E996
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749814162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPJQfDGnoZl3sUs7qFNKz3BkWf0vtGuE2bf6XnkDBrk=;
 b=DwhLojgbw9hdeiyDn9qVymLVNbHyMy5hqgnrrllHcBwm5kbbrwdkPc1LrexAt+mu0kBtCg
 O4Uay5XhFDPWzICBKc9OWCr6jyz2fbUbnbIv+02W93OEFkvQ+Ab7GVClLFhjVg7X8WHrJ7
 Au1VTmQNXEdags6jtk1LVPoIttcNCW8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-uGSwVbYjOhCozZC2Da8p4w-1; Fri, 13 Jun 2025 07:29:20 -0400
X-MC-Unique: uGSwVbYjOhCozZC2Da8p4w-1
X-Mimecast-MFC-AGG-ID: uGSwVbYjOhCozZC2Da8p4w_1749814160
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so17190545e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 04:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749814159; x=1750418959;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPJQfDGnoZl3sUs7qFNKz3BkWf0vtGuE2bf6XnkDBrk=;
 b=WwPwOrTeDFc03wvey+43cXF3x+ZNhhdp6iDhlRR24Y3w/iPAvrJWr7mKstzuEQdsBv
 JSiia+0sGYl6qP6IKMEhtsoACu6vekhyQf4a6iTTfbvKTFL4BjE71zIdjqXuys+WgHP/
 1hwZ1kYZPaEp+jfIOangGjV82CqZzL8maRJpvbxk2X7NiB7xB+3NUblaQmNBYtpvnPka
 C8g5c3Cf3D9pkLYU2LxCttL39uEJzi1KF5T+pqv3PmCecUHzvxp5t8So4ifgX4ceY+sR
 VNIpFM+fPMFC/FeudaR5R/YdOnapFoiuiBOhC02in1UkVOvjuWzyDBDBxpwa/dTjrUug
 r1Vw==
X-Gm-Message-State: AOJu0YxqtK3y0BKXCUdSu58ShGwSTQhPVQeRYI/tCiSvmrnDy+2Rd8sW
 soEW/0Jpcj03nWQX/Q4JH2blisq4Fpt5O8Xuvi+8UhXsP0DlaH+JY+V3uBw7NRnF7t4CVGSWx9n
 eYivkaye8OnotIfLST1UIy8BE7w9E9wJmaRXeSGwlfkrWj42NzcyTb7ZPhBtAzulOMvhyjg==
X-Gm-Gg: ASbGnctASekq/WjHzZGSrHy2XXXZjGmvNZwKkL5qhW91cYZiPKirTf3SOE0B6J4ieAL
 IHXO112YDmI0cT0GyuK2hKr7Q3afgw9C91lknV/nrxjI6ESOyUfDal608+UKSUI88tfL1m2W783
 8HT1F7GoXbbHkhW05we1sTfMI8moG2FUrskpqypCWroBlHVgu8fZJUdgf8PVt4kZ4F6qmaU1T7W
 FOHZBw+B5Y/JcxLocwMGfOapJklQk97L3un2FveMlZwqhjCGRftoOFsVZ4dRNVB+b6AaVb6jcJi
 I/gn3Q0TLhDNdwSL9X/h4pi6ZM5Sdd+nYbTOAHtoP35Lw0/3Xp4Zjb2OCsLhekNglAa1z4hlr2E
 aW01/
X-Received: by 2002:a05:6000:2289:b0:3a4:eeb5:21cb with SMTP id
 ffacd0b85a97d-3a568717b09mr2660661f8f.26.1749814159621; 
 Fri, 13 Jun 2025 04:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ+3DYuduGfq6V28PY0cTyuX7XpJwlFxHFHRjq5eCFGpvZEHnGqRqGUClgqx7lyvVJ642rRw==
X-Received: by 2002:a05:6000:2289:b0:3a4:eeb5:21cb with SMTP id
 ffacd0b85a97d-3a568717b09mr2660636f8f.26.1749814159239; 
 Fri, 13 Jun 2025 04:29:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b4c969sm2038967f8f.85.2025.06.13.04.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:29:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/format-helper: Normalize BT.601 factors to 256
In-Reply-To: <763322bb-04d1-4c93-ac4c-777bfaa58be1@suse.de>
References: <20250603161158.423962-1-tzimmermann@suse.de>
 <763322bb-04d1-4c93-ac4c-777bfaa58be1@suse.de>
Date: Fri, 13 Jun 2025 13:29:17 +0200
Message-ID: <87o6urvq0i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0-JBiFFJC6ZD7FbnbtSIgVRxQjptdVAH1r9s9-tlRKE_1749814160
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

> This patch also requires an update to the test cases, which is available 
> at https://patchwork.freedesktop.org/series/150218/
>

I was going to suggest to instead post a v2 with the test changes
included but I noticed now that you already pushed this patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

