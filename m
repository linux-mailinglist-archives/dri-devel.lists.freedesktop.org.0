Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7D46E74E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8B710E0E3;
	Wed, 19 Apr 2023 08:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E94410E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681892472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=blyeMnej/ZWQUIzL86aP9w1eTIPSx+cVSXGKg3I9FIM=;
 b=UzTXZZkvNyn0NaO1pAmNp/E0V0YT9fJgs0nVSHq+CImcBiMt32nkYOVXJiv6Fj8+OgCGek
 ZhwkIhn8DAFDZ3elwP4XFiQPNlgVC+l/0zYWSgpxWdhzKYy5kI/UBIuSHobhSOQ0QJPW+Y
 7gspV0TRXwnxpBoHLjfuE/HfDEfSjSo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-glrARri4OlKtZ6srtNDwmA-1; Wed, 19 Apr 2023 04:21:11 -0400
X-MC-Unique: glrARri4OlKtZ6srtNDwmA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s18-20020adfa292000000b002f562b8b12bso2667395wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 01:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681892470; x=1684484470;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blyeMnej/ZWQUIzL86aP9w1eTIPSx+cVSXGKg3I9FIM=;
 b=dzM1Y0Q0DzDenYhT0DNob792MC5yDIQYUZ5eg7+BDBuWham+p6FSV8bm5M188bvgcb
 Xs9+ceiFLstK9dhILtgyIwtpUF+UOZ0fweFgE+Wyg+2CtiuB5VNkVH+r6pZMqUNDOZ1n
 mnCzq0NHbnoIKZ7FWU0RwIq//5appAvREzyAbrrKd8JBP/iC15Gc4oOpMo1DrRRcPC4b
 w1GbBQCQTmfquaJ3W7hAp4S55g7zyeOEpPvPihlDlRxt1AWpAxzW1n2ELKqYr/3Th8GB
 uPpy9195bLysVzrWwhirMqRxJWiAchc1eke+rDjgAHJXuAN7YTW2C3QD1uVuY2HMDUEo
 Jbcg==
X-Gm-Message-State: AAQBX9cAUXYhIv1m3wj6SFuYwm3d0HXOK+nmopQXu2x3qA+Ha647miTB
 xS15AY/WJTrG6ny914ZPxoX8Sx1wydO8n0okAhymnSKMf7J3t0w/TCNDe2/w0a8+ybACzowbEjk
 md9LH3UNWtIWkWPGeM7H6zcJdMG1f
X-Received: by 2002:a1c:f612:0:b0:3f1:70cf:a2d9 with SMTP id
 w18-20020a1cf612000000b003f170cfa2d9mr8744682wmc.9.1681892470210; 
 Wed, 19 Apr 2023 01:21:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZlRNnBBsh00COjJ+pN5S5+Ilx0hpK+h6SApaydLTxJ7q8I55wPLH+b8inUu2rAfjVb0eb96Q==
X-Received: by 2002:a1c:f612:0:b0:3f1:70cf:a2d9 with SMTP id
 w18-20020a1cf612000000b003f170cfa2d9mr8744663wmc.9.1681892469870; 
 Wed, 19 Apr 2023 01:21:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k25-20020a7bc419000000b003f1736fdfedsm1416894wmi.10.2023.04.19.01.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:21:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] firmware/sysfb: Fix VESA format selection
In-Reply-To: <20230419044834.10816-1-pa@panix.com>
References: <20230419044834.10816-1-pa@panix.com>
Date: Wed, 19 Apr 2023 10:21:07 +0200
Message-ID: <87bkjki8p8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Pierre Asselin <pa@panix.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pierre Asselin <pa@panix.com> writes:

Hello Pierre,

> Some legacy BIOSes report no reserved bits in their 32-bit rgb mode,
> breaking the calculation of bits_per_pixel in commit f35cd3fa7729
> [firmware/sysfb: Fix EFI/VESA format selection].  However they report
> lfb_depth correctly for those modes.  Keep the computation but
> set bits_per_pixel to lfb_depth if the latter is larger.
>
> v2 fixes the warnings from a max3() macro with arguments of different
> types;  split the bits_per_pixel assignment to avoid uglyfing the code
> with too many typecasts.
>
> Link: https://lore.kernel.org/r/4Psm6B6Lqkz1QXM@panix3.panix.com
> Link: https://lore.kernel.org/r/20230412150225.3757223-1-javierm@redhat.com
> Fixes: f35cd3fa7729 [firmware/sysfb: Fix EFI/VESA format selection]

The convention is f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")

> Signed-off-by: Pierre Asselin <pa@panix.com>
> ---

[...]

> +		bits_per_pixel= max(bits_per_pixel, (u32)si->lfb_depth);

You are missing a space here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

