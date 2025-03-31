Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B53A762F9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974C410E100;
	Mon, 31 Mar 2025 09:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YESCAVqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355610E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743412354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFBeWNl2yPKwtYZobCVL1f6BQmpwGgGjuYymMrbwcMU=;
 b=YESCAVqLrEeCk6UtKd4Dmm0JRW4h7cKm5sJmqKt0JrXrjkKGcJtfnpuL+YmIF4It8XSLi1
 ki0aGtXSSCrz8AECzo3ML7Pa7nAP5tuc9ZcIS8tJ9kOH7abqUIl6JsNQ/qZzJH79dLVDqm
 6WyUARll1gUgvlqD+boIKx91fnvtQC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-5wKPyhdbMcidRPpBIhybBA-1; Mon, 31 Mar 2025 05:12:33 -0400
X-MC-Unique: 5wKPyhdbMcidRPpBIhybBA-1
X-Mimecast-MFC-AGG-ID: 5wKPyhdbMcidRPpBIhybBA_1743412352
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so41905795e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743412352; x=1744017152;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFBeWNl2yPKwtYZobCVL1f6BQmpwGgGjuYymMrbwcMU=;
 b=nXsaUJEyuI+Ga55D60zw0jDpRDk7Wi/6ouv5wKUOEYSXoyev7i4jDVKDLYwCZoMKpV
 zQax4WCsAIpKzYljiyqdnwdXrAliG2NmxvovFdUonAmm8u9/oymeeCgCKQq1ougTsZrX
 SHbCa7lxZP5OfPVHN80BpZitwXCKuzfpNwqW7aYT3tpjRi1Huxb9VNIgW2zPm9vf0UKY
 Sqikwx4QeaZ62h7BTa/cTWHxdt7e/sH/b1hq9+AASaF1W81yEXFrDMl5aYMjZ0mvlbNw
 9sHkfi1S5V2rj3Eq/7SqKxM34yw3coyx6MAsToRAuVotS6FatM6HKigpbN2hWZIYNjrL
 UrWA==
X-Gm-Message-State: AOJu0YwDtugVhjjNVZrYyroRpeYBRdRReWRPQbq4i3R2nsarmJ3sAK65
 mOfjlt0F6EQXlbxgaSoRIbjabPex6NtGqDsztn8oppSm02zjrd0mbpYnTdcYb04TlbVJtZlfSK3
 ACt8IF/VU+1AjY2YlJMAxsEHjr1GYYB/Gq5pF+q75szyKwo8Em0DExHhwJf2SiWle5A==
X-Gm-Gg: ASbGncvvIH/j3aWXLKyCzNg8tQm0WaIMYzB54NB8dmJ3rL79PlgcagsPFaQiYOPpFRo
 fo5NozmfIRwXugtw41sE4qeDiiyzyZXm2fzshJcS5mAIIqvB8JahqLx+C3Zj69gUbCcWN3zH2Qv
 hB+Dqn9HEN2s+ym9E+1AmAwWVa6JrZR7rgTB/++Z12Rhfrwu1PL62rMTGlJDUjlWcIKq3i6IX2J
 liOgMUNUxuRp23jZye8n0o8/V06ayVOJjRC3GvRnmXVx1gGbh01uP5TI79V1xPPbXsewR3lR28r
 bBhCbNK4d6L58kaC5v3IPoHRF0qasbUyFsWJbjOqyjN+hw==
X-Received: by 2002:a05:6000:2d83:b0:39b:fa24:950a with SMTP id
 ffacd0b85a97d-39c12118f6amr4506859f8f.36.1743412352385; 
 Mon, 31 Mar 2025 02:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+mg1ka/uEx8Sjl9VDPufoXxZ5M79pQNboGWnqxQR2gZpdRu0yzwHKjI64qfSjJgFzrzTECg==
X-Received: by 2002:a05:6000:2d83:b0:39b:fa24:950a with SMTP id
 ffacd0b85a97d-39c12118f6amr4506840f8f.36.1743412351991; 
 Mon, 31 Mar 2025 02:12:31 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede5csm162559005e9.8.2025.03.31.02.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:12:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/18] drm/sysfb: Merge primary-plane functions
In-Reply-To: <20250319083021.6472-12-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-12-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:12:29 +0200
Message-ID: <87frith8ci.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O3o9KOUm7v3-XUTK6GXMqDqHZ0geEwPJ7U8nC6H5oMk_1743412352
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

> Merge the primary plane code of ofdrm and simpledrm. Replace the
> plane implementation in each driver with the shared helpers. Set
> up driver callbacks and format modifiers with initializer macros.
>
> The plane code in ofdrm and simpledrm is very similar. Ofdrm has a
> more sophisticated implementation of atomic_disable, which clears
> individual scanlines. The code in simpledrm clears the whole buffer
> at once. Take the ofdrm version.
>
> Simpledrm supports get_scanout_buffer. Import it into the shared
> helpers, which makes it available in ofdrm.
>
> The supported formats are all native formats plus an optional enulated
> XRGB8888 if that's not already a native format. Provide an initializer
> macro that computes the size of the formats array.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

