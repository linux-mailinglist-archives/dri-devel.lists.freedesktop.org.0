Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99D74767D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2973510E2FA;
	Tue,  4 Jul 2023 16:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D6F10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688488024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
 b=IoqvCJX6lE4j+UmnwZA7z72UsV2S3zbHIP+YGKf3IZISnldZ+S+YvM/oWwWGbPjxdGwUm9
 e3gS7cE5UoYMvY5+mkvxusNW+bm6C7YoKtP5ydBHx/ylP++wrzhLliGjD+XYeQJvfQWsLB
 GLdRYMAsBRYT9d7SaAdBt8+BiAkEFcA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-N7h6AqmrNSmD9TKDrNAVCw-1; Tue, 04 Jul 2023 12:27:03 -0400
X-MC-Unique: N7h6AqmrNSmD9TKDrNAVCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa8cd898e0so40058855e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688488022; x=1691080022;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
 b=Pxx7t7AmAuCNC2Lz1ybav/2BH+CEefCMpBPpwIMzbP9lY526PA8j3bzVubW5zYB5/K
 NVer6Cfykk82eiDc/EscItdws8WfX/+1vwDsPUvqYc4z9jlOUG0KdvUq1H0YXvVxn5RT
 zBNOu2shU4/eu3T6U2PXMoibSOacBPH5og55y5vOgjDEch/HSHrUyYY7UN+/cIfExGvt
 ZKseAdC8A45DO8OwCWPW0OSh3sApqWw/Ad6+GaNJBBb56eVBZ0mMuFQesVC7PcKHbpTm
 kpxq349QWlamHqF+9qjqA2iX4hOjvw5nI0MA48gDcGEtz+t1cyPti0UO218MHc3Yl7rA
 GWDg==
X-Gm-Message-State: AC+VfDwvdU4Om4lcEvOQ0ePm5cSz317ROr3TMGp9Lg+M5LI+PQ0FQArr
 x/hpVMOvvTInhROuxiKGPdwVUPV1MxNGnyZZtg9lvFqsIXk6Y8G8gvcWfL9gVf/MaxBh5QtRq/s
 IXlI51yyMNl0EYDZlawar9m/cGzMP
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id
 12-20020a05600c22cc00b003fb40ee5465mr13432862wmg.22.1688488022231; 
 Tue, 04 Jul 2023 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NuEVxTetvep8Gr1fgiFutV/xXoEkUhrAhQSPThqJdTuxw2Km/uBAzmwN3pOgdQUZIHRImng==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id
 12-20020a05600c22cc00b003fb40ee5465mr13432831wmg.22.1688488021988; 
 Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f3-20020a5d58e3000000b00314329f7d8asm7499354wrd.29.2023.07.04.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 04/12] staging/sm750fb: Do not include
 <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-5-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-5-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:01 +0200
Message-ID: <87a5wblk16.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Teddy Wang <teddy.wang@siliconmotion.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

