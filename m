Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDB7758FCB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF610E41A;
	Wed, 19 Jul 2023 08:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE2410E416
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689753602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=speJPG1ycW/BkN4uS1NK3jR/omXFRRfNvkd75pwFmqw=;
 b=SO9CuQvKFtQ4DcxlS4H4HDihSQ9jLvgmd3xJl3kmvfSMdM7+YkQriEeOsSsMLT/AKyiwzZ
 WGYpxFUVoxepfaZ5Oi6WQeog9jsV+o7vDYF21jRvh7Bel3/h6oe6/n/EKYDjU1FRnLFj38
 iBzAzX1mdTs3EG5TY3APSC6bCaf6bZw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-2rRz6XjJPYOqNhnbKZ4eWg-1; Wed, 19 Jul 2023 04:00:01 -0400
X-MC-Unique: 2rRz6XjJPYOqNhnbKZ4eWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-316f39e3e89so200007f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689753600; x=1690358400;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=speJPG1ycW/BkN4uS1NK3jR/omXFRRfNvkd75pwFmqw=;
 b=OWNRQYlFDVz2VMsehnTSSUzq4zUnzZezhh7zJJTwEEwkQ+AG2zBbNQAzx8P7TrKIWD
 vXstYjBc+Nry93sflrbqm4NkWg9jcfmnYNAIKkUVN+8AsatCK0QO22M/FhtXu0481LtC
 sHRNbEn57pWVqCcK1fzsd8lqXgRcIcfS1q6uKXgsXdlYGjarBW3fz2gCQyTQQjl5H6o6
 IQt1xM0DC9f1nGDNJ4P0Uv2mFscp3iwaV50nDNtz4uysbbNCz1C/R1MvhmuJd1Awp+m4
 ZPJRBIBH2AwFljzPuFhoVco1ZoXBfICmTi1UYzYRJUZb2ILH8KS3ibtz5wohHR+O4rVi
 iDkQ==
X-Gm-Message-State: ABy/qLZ1OHsJATbsEQto0knV1cxoX2Ew7rqSqaJTophhLVPySNsplhRQ
 lkRLVdbzAwZSPK034gRQiusbBcvkxj84psgrEMr4iEhOs46qHDSY0rzNf0bRYMrclyiyacGEAPb
 f6CiP7q66IzCRYLCRwloa53U1J6+I
X-Received: by 2002:adf:f183:0:b0:315:a235:8aa8 with SMTP id
 h3-20020adff183000000b00315a2358aa8mr1151880wro.2.1689753600520; 
 Wed, 19 Jul 2023 01:00:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGbErd5rOGWg9sKl7p9YbHezYUElnKB4HQRHgHvdWvGr5xTLlQhBGuXUlUSr7TY0UzQpwLZSQ==
X-Received: by 2002:adf:f183:0:b0:315:a235:8aa8 with SMTP id
 h3-20020adff183000000b00315a2358aa8mr1151868wro.2.1689753600230; 
 Wed, 19 Jul 2023 01:00:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020adfe483000000b00313f61889ecsm4551037wrm.66.2023.07.19.00.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:00:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] fbdev: Move core fbdev symbols to a separate
 Kconfig file
In-Reply-To: <f925fa1c-a6db-4032-8adc-d6aba8cd2ef8@app.fastmail.com>
References: <20230714171642.91185-1-javierm@redhat.com>
 <20230714171642.91185-3-javierm@redhat.com>
 <f925fa1c-a6db-4032-8adc-d6aba8cd2ef8@app.fastmail.com>
Date: Wed, 19 Jul 2023 09:59:59 +0200
Message-ID: <87lefcib5s.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 14, 2023, at 19:16, Javier Martinez Canillas wrote:
>> The drivers/video/fbdev/Kconfig defines both symbols for fbdev drivers and
>> core fbdev symbols, that can be enabled independently of the fbdev drivers.
>>
>> Split the Kconfig in two, one that only has the symbols for fbdev drivers
>> and another one that contains the fbdev core symbols.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>
> While testing this patch series, I noticed a conflict against
> Thomas Zimmermann's series for FB_SYS_HELPERS_DEFERRED, so you'll
> have to adapt the patches in order to apply them on top.
>

Indeed. That was my bad when doing the conflict resolution on rebase.

>> +
>> +config FB_HECUBA
>> +	tristate
>> +	depends on FB
>> +	depends on FB_DEFERRED_IO
>> +
>> +config FB_SVGALIB
>> +	tristate
>> +	depends on FB
>> +	help
>> +	  Common utility functions useful to fbdev drivers of VGA-based
>> +	  cards.
>> +
>> +config FB_MACMODES
>> +	tristate
>> +	depends on FB
>> +
>
> The FB_HECUBA now needs 'FB_SYS_HELPERS_DEFERRED' instead
> of 'FB_DEFERRED_IO', which is the change done in the other
> patch. I think the best way of doing that would be to just
> not move the three symbols above to core/Kconfig but leave them
> in place, as they are all just helper modules for some other
> drivers, rather than core code.
>

Agreed. I'll change that in v6 as well.

>       Arnd
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

