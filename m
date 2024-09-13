Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A7978AC1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E610EDB7;
	Fri, 13 Sep 2024 21:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BNJaGVPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C070710EDB7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726263839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=fKkSG8VqZnRHGkrVPV+pI0HT1H3VA+Urh2h620VqLak=;
 b=BNJaGVPbDWm9+SVkG+lhHbGkaN+Ln1IpYAUhJ5HiQAAxlBfuRsMCA1rMOVBvZdnwtK+bPX
 9RWzaIvn9t0DXxImOJSivxlZoYA64EVBrybQqB6imiN9X3k8QML7kSnShAD/qWhQUHA/E4
 ctu30RRldynp8Ii+kVLEB1hloGbICCQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-xLeW_MjHMo22cnFmp_SKeQ-1; Fri, 13 Sep 2024 17:43:58 -0400
X-MC-Unique: xLeW_MjHMo22cnFmp_SKeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb635b108so18564715e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726263837; x=1726868637;
 h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fKkSG8VqZnRHGkrVPV+pI0HT1H3VA+Urh2h620VqLak=;
 b=ia16cp+Djblw9Jvp02CrOgPjgQJV4gvgy1mvwWephursclaYPbVDsLEIflPyj1N8DE
 uBq80r48swJTNps8R3s1VFqId0nD0LJEixLE/KtjzxmxbGABhp/3MIzteZUJgl0ftdq0
 Pp7FtrUvV3ZfN2uj8BRCYUNOn+bg4XbuW3ttQY5E6W2rlDrhv4PwNc98jT3aIpXz8K2s
 T+QJX2jgNJYyM210zSFnb2NfQ2fUMLtISk/jgBZFBNGZpp6W4okJ2XHdqwKvfZdWEvF/
 WsStgqwwLT3JWNGcWCc53EksLCmr/XH1AxQKhjqfCfbCIfH0kB9p0QgZmNAC80nqdhNw
 aUzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLoPyi1AHhJHJ/q1mVJiM4uVHnpuwFiDJj7fvEnrfoopLS3bCArYZ46U6hTPe7Wl9nGxzJo6uNgAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzIQzZB6d9rnNne3yySkwRVeq76kGYCs9MwB71ErMFoX/P6R5A
 H4ud5DpVsEs6Z2bSQkWCB9ONJFbzAiTReDWWe53f8fUx2i/UBo6bNhGhJ11Yhidm+uGFkN/o7cF
 mCWRmrQncxNipseL2lrS+JCbplJBdFV10NhkTC3VgtPFZl4TmIOMKW9YKEaNJ372CnA==
X-Received: by 2002:a05:600c:4e10:b0:42b:a9b4:3f59 with SMTP id
 5b1f17b1804b1-42cdb529b15mr63531165e9.14.1726263837559; 
 Fri, 13 Sep 2024 14:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmgVixelwyphAF04b6dZiaPA5Oxiya0I3gktrct+B5i0gL94h0PMPytDOlN/HdvI08wJsm+g==
X-Received: by 2002:a05:600c:4e10:b0:42b:a9b4:3f59 with SMTP id
 5b1f17b1804b1-42cdb529b15mr63531025e9.14.1726263836950; 
 Fri, 13 Sep 2024 14:43:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da242736bsm2598215e9.40.2024.09.13.14.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 14:43:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Hugues
 Bruant <hugues.bruant@gmail.com>, Julius Werner <jwerner@chromium.org>,
 Brian Norris <briannorris@chromium.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Borislav Petkov <bp@alien8.de>, Tzung-Bi Shih
 <tzungbi@kernel.org>
Subject: Re: [PATCH v2] firmware: coreboot: Don't register a pdev if
 screen_info data is present
Date: Fri, 13 Sep 2024 23:43:55 +0200
Message-ID: <87h6aj6xgk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 1
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

Julius Werner <jwerner@chromium.org> writes:

Hello Julius,

>> +       /*
>> +        * On Coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
>> +        * in the Coreboot table should only be used if the payload did
>> +        * not pass a framebuffer information to the Linux kernel.
>
> nit: The official brand spelling is "coreboot", always lowercase (even
> at the start of a sentence). Not a big deal though.
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
>

Thanks for pointing that out, I wasn't aware. I just posted a v3 with
the proper coreboot spelling and your Reviewed-by tag collected.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

