Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238DD08930
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811410E88D;
	Fri,  9 Jan 2026 10:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZWIYWrI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262310E88D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAlQtNmtIWNkGsFyRvvL4elBNAjOXcmk4EMceP10HwM=;
 b=ZWIYWrI+lruCHL6XxrE64R56LbLhRlqPsyJ0jyOn3NPzu/CwC6logn2c/zwC+q8dpqiMot
 c2xsEcTf7ZT/Zk+ESYg12UZt1Dw4DhXhrDkLQn18wNt6O7SZsj2AMMXXvWZnxkDGuVDZlY
 tRbp8GlZefpUQFjCX/mXns0fKESq6D0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-pTbF-OM5MRKe3NDYoKWmGg-1; Fri, 09 Jan 2026 05:32:36 -0500
X-MC-Unique: pTbF-OM5MRKe3NDYoKWmGg-1
X-Mimecast-MFC-AGG-ID: pTbF-OM5MRKe3NDYoKWmGg_1767954755
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d5c7a2f54so20659375e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954755; x=1768559555;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAlQtNmtIWNkGsFyRvvL4elBNAjOXcmk4EMceP10HwM=;
 b=vIhUOLq5aeDaQr6v5+ziHL3ISifFf8axQIuR9FMEtfGXeu7aScr+cuImFek4v1H57U
 akSTPT4aW3fGx2tmgioGMzgAbjM8sJ5TavHr+U9eDRCBiRSxAFdDXyHKEKkHjrK2fszh
 ku3GOMHu1zLAu6gwULJbk5BltLXoyiRn0W0FtnMhG6WUtEME/gjtbco0r9p2xlPZA5mi
 185x5U0I3XuDYfMRg8iOiW5h1lppcrpMLFWAC3vG7T3Awgp4tdPgvCHV1IWSOjKGqWHe
 a0mUxhZfgKvGDQUPOgEQRHtyD/OeY1ugh6KqYXcJS1TpQnzk/r+A6HvHV1AG5ddowm+d
 VKzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlNl7uWcp+1QFqJPsi3ICJ3Mf+1yPLkssPBO36ME/b8T9rt4KScXsbg2hJWRtt45U2twGfGySbORU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEG2r1+mFBIRKyaOireAYMrwwCIwQ0RAxhdOvPBvqOsB16C4Hb
 V5ZX/d8Ypdi7wIDtiuObvZmz9HIZr7I6hVbd7o9Nk38eIOmAFpwlY5J455cKGrKbtuzcxdX4F4Y
 9nxs9JPpv8Hn7chxT5X6K0CeQCnjLUlV44Uv4evUQw1CLWTFY+aKCIu5FgAJlKTBuTsV9/Q==
X-Gm-Gg: AY/fxX60NgqfGhRDjC6Li7X5muQZqPQPEJ3zeTYJQaEgDp2SzG7zL0bmM9G/eFQfi4y
 1E9ai/s7dBJwEgRtNpyRDDRjAibwyxAz+gF4OEMASs4wdre67x9RG2OSrwvibqXVAh8JKiuKGuV
 7l+VVwnqjdLtNwXu8y1Gp6d4nTcJLJQkkz4vaf2d0H1qAj3c3N2k+F4JCIef13kDjR6y4ApBsNo
 vwrrOC8mm58kcitn2ZhBQafCyvqKwMqo0oyymCKk5sC+rrvZNWBxBdFA5b1X4ShQKKSSR/6Y4ta
 gW0okjoDfrAoQq2KzeiamgcocLg/oQdKEJfJA5rZMkZWrP/9OjPRL85YyVqsrZJGJOB+RpogWr8
 /yIy1Y8W5VfKa0p2UwUtmbZhZh44SQLseCRPRb17seBBz7dUIB+O70gUIBwf0o7gQDayM
X-Received: by 2002:a05:600c:348c:b0:47b:deb9:163d with SMTP id
 5b1f17b1804b1-47d8484a329mr100760615e9.7.1767954755298; 
 Fri, 09 Jan 2026 02:32:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETFBS/84c6OLlNUw1c46PhgMv94/Y+DtAyEqQRjy5tiBzm3ee/UaLuzoWFK41czGzScD/9kg==
X-Received: by 2002:a05:600c:348c:b0:47b:deb9:163d with SMTP id
 5b1f17b1804b1-47d8484a329mr100760375e9.7.1767954754942; 
 Fri, 09 Jan 2026 02:32:34 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm212778215e9.1.2026.01.09.02.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:32:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/8] drm/sysfb: Generalize pixel-format matching
In-Reply-To: <20260108145058.56943-8-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-8-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:32:33 +0100
Message-ID: <87bjj3f54u.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OIoQ3ihCaTrlD2tRvWxovJibBhX-k4lN3IhdsP4Kqf8_1767954755
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

> Provide drm_sysfb_get_format(), a helper that finds a specific DRM
> format from a list of pixel formats. The new function builds upon
> drm_sysfb_get_format_si(), which finds the DRM format from a given
> instance of struct screen_info. Now get the screen_info's pixel format
> in the caller. Allows for matching pixel formats in drivers without
> screen_info.
>
> Convert the callers in efidrm and vesadrm to the new interface.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Again another patch that could just land and doesn't need to wait for the rest.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

