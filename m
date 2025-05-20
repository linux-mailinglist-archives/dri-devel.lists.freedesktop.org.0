Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF9ABD61F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D035010E44E;
	Tue, 20 May 2025 11:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VhLY7ldY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA4210E44E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747739316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxUYo1Urh2LJpKOT5tOj/9WFAhIvPO2kGyKrSUMibIQ=;
 b=VhLY7ldY5JugRZfamLz4ZqIesjTESScD0l30jUw0MF5w9h2KagywppQgX4YytTFEYp/6wt
 xVSYvp4pNWnsz2iX8VXc7i24CexCiJ2fV6lk/4tUeWhylI7M4YlKbfBp6jdxTSQWfhgEVb
 tUUa4hQsqKhss7jblTggyqN0mWrLN2w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-Gigt525dMFqTtR7G29_SNQ-1; Tue, 20 May 2025 07:08:34 -0400
X-MC-Unique: Gigt525dMFqTtR7G29_SNQ-1
X-Mimecast-MFC-AGG-ID: Gigt525dMFqTtR7G29_SNQ_1747739313
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so8344345e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 04:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747739313; x=1748344113;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxUYo1Urh2LJpKOT5tOj/9WFAhIvPO2kGyKrSUMibIQ=;
 b=cqu8V4DLTnRDnr970vcAqoVMbHgFDaxQXy78Kpbe2wnQ3OXypO66JpDctQahIAe46D
 DahrTYFAUcqGARjYbzS7AdHn9LZ29/SQfK1BgA/UvYbyG/Xk+6JdDNWNlN1OdcjWw2U4
 +mib5lOL/5rWf4maE9vzvucmoCtF/KPBPa36xuun8KQE9yrW9w2QnMke19FtTif3iUee
 otcByDCwbv76S0XB31+t1d2RYXwazfhlZD8HyfvgGC+uYKT3vN1t6b+2hF0qE0a2BS4/
 kS1e3QEjNqKGAMa5dSOc2U3tjzRzwE5G3k+RYgcLXZOhXN2uJa3jMWz0x+Sp72+1Cxfu
 lTFQ==
X-Gm-Message-State: AOJu0Yx6vtfeauqUm4SX9W6+xbEjyX1WusIM115hVKxtA4w6ySvTSzHr
 JqVngqbrrLrP6Bigt+wbEXx5G76qO2ThT9i0pB0jkWBLWrepunVLWOEXPUbYPesr2ZShEJ84Crj
 3H7WkoFpitb7WO70EJD9PWw1W0b4cOPDXkUoDKa3BD+cNSzYQ3mavTvXuWDU+oEtUqV3G7g==
X-Gm-Gg: ASbGncvgLFXHRmQtxhyIptGg17/8AlxmNmBR5q6liGuvWDspNQ1K9thG1ceorCzTxPZ
 Ru/iGzfdD5gEzBgXFgFgrUbb8WlBOQEiTYR0S0ze7fSbM1Ku10+vVc+W2EBvKR/Dn1alf1vXm0X
 fN8WKFk3JeeqoATdlaFhTtPKTl6mBLxeQFsjLUkT3TKZlc5OjGnc0RRJygXkmOXuQDrt70tgXXA
 Fom/z8c3/pVKKyldJduXHLbhmEoZND9Nes5CuXC2gqFufTEKAlUw2kWkk17d8svOMZ5DprIur0B
 T6DmNRnfF1kUYTR2WTsrsUlmSc5+r8gVH4llrANOX26ISOt3F6zuuuQL4StictZJszM2YA==
X-Received: by 2002:a05:600c:c092:b0:440:66a4:8d1a with SMTP id
 5b1f17b1804b1-442fd950b76mr132552325e9.7.1747739313501; 
 Tue, 20 May 2025 04:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZc7qATM4MBWUNUBilF5T0DmPr4EJEIcBkyY+LMVrmz47arJ/a8B0toLpgj2JqWF48fQWEcw==
X-Received: by 2002:a05:600c:c092:b0:440:66a4:8d1a with SMTP id
 5b1f17b1804b1-442fd950b76mr132552145e9.7.1747739313174; 
 Tue, 20 May 2025 04:08:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f74cce5bsm25741755e9.24.2025.05.20.04.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:08:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/5] drm/ast: Use helpers for programming gamma ramps
 and palettes
In-Reply-To: <20250520094203.30545-3-tzimmermann@suse.de>
References: <20250520094203.30545-1-tzimmermann@suse.de>
 <20250520094203.30545-3-tzimmermann@suse.de>
Date: Tue, 20 May 2025 13:08:30 +0200
Message-ID: <87sekzo7yp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKDITdHthdOC0UTgJxGd0whzqkUHmat4NUuw282Eay8_1747739313
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

Hello Thomas,

> Replace ast's code for programming the hardware gamma/palette LUT
> with DRM helpers. Either load provided data or program a default.
> Set the individual entries with a callback.
>
> Each gamma/palette value is given as 3 individual 16-bit values
> for red, green and blue. The driver reduces them to 8 bit to make
> them fit into hardware registers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

I think this patch was acked by Jocelyn, not me. You can fix it
just before merging the patch. No need to resend the series IMO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

