Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7FC05494
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF710E186;
	Fri, 24 Oct 2025 09:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NZeCJzSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE3210E186
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761297422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSq+81cUiZb8O293RwSjZvZpm0NekppDqE5YvfNwlF8=;
 b=NZeCJzSFoHsEKSM8Wt5Jz8CxwIPtQV4EEGJr7smzOGx3e2g3ICbyYx3PsMH13HZaM+wzbB
 t7xTwcSaD8E7NKOK0XLldwIVlsl036zm86C9anTI1Qep4s0UvOVq8Tbn9q8BuhP9YLww9y
 aExqGBIoize+pwsVuIHUrw5MzX5Ak+k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-QxL-gQVUNBeOoHFYJoYgfA-1; Fri, 24 Oct 2025 05:17:00 -0400
X-MC-Unique: QxL-gQVUNBeOoHFYJoYgfA-1
X-Mimecast-MFC-AGG-ID: QxL-gQVUNBeOoHFYJoYgfA_1761297419
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46eee58d405so10679145e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761297419; x=1761902219;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSq+81cUiZb8O293RwSjZvZpm0NekppDqE5YvfNwlF8=;
 b=biHXgqjUA+99uX23byllJxuB5dqwtVyhl5JhHcVYsDiKpvDfuCKnLsMS5oRApwGSi0
 qcfx6qXgRDXkd6l02pUnZpNPsepZPSFUjdyTYLCls3eVYdXLxmICEonmumQHuSpQtKuk
 th3MmFmg3CTJGfZyo3ukV5C4GbqIDnE4KzBhV+iYnFKPRG7ulR9/sRVtdWQiyZiGkrNl
 roJPSok5DNrfgG+itSdTUGaQgApyG1wOXVn88Yc9X/+i+fTNX4YgtoaIQ3FPmxJqKe9Q
 Vt6xJDQ4zsZkm5Qo7bnPvWoL3btL4wDGFG2mFcMda51FzT1oRmYfDFJ93XV+nEUl963K
 MU4g==
X-Gm-Message-State: AOJu0Yz2UxvbunhdsSbgm2zD5010p9/AEp9mrDUSjxANzoRA4IDyTDfU
 2o5OT42XOceDofzbMYDFy3JmBDIAOacYK46AWPcGbLHo896HS0LqanO5xsICEsMo/hcB5ir2bNb
 +iSa5mAQtBzMeATsuVapjWPQAtY8UYd7rI6jKkOaFkK7qh3wWRmUD1P4XxHm6KngsWXQDFw==
X-Gm-Gg: ASbGncsQUwP1WD1I1kspMDThy7SPiiM0EKvAvCYaaa8a9++TyjltNB6f1kaiuLf8UcA
 5nGtrT6Iuq2kVIwMSFTbV8sTXo/5EpxyGRjqdBuQvy/J6DrZCox0UGmaiMgA4oJajGoQCLXMXNe
 /w9SOWPQ+SOcK68H45Ms/RUD9ONx33QUQu3X25tKATgcvuMM/G48omo3OrZgrea42/94H12lkj4
 bbPZl1C9JPRviIv0NS1ytV1pRsbbKj2FQDHMYPSvnmlb598wLhxgnvS56q5nP3gvhtubR74BK0+
 4CVE//T1g06NS3InX6Xm/dVTemCWEFuEUhH0lAnUBYOXg/wqVy3hTwPKV+Y8gMpb71leAA/hAtj
 N/Y2bHQ+ozhaXCopfaWhpVwt3pWWOmD1G3JG20XcpJd87movbqKwxQfy+sQ==
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id
 5b1f17b1804b1-471178a80f7mr195431095e9.17.1761297419467; 
 Fri, 24 Oct 2025 02:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk/qqQN3PPoawELhMs1hXkX34drDe5aOw5h6yQ+0rtvBQM8acSA/lOqGGSqNXzCUZEDfaiuw==
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id
 5b1f17b1804b1-471178a80f7mr195430815e9.17.1761297419046; 
 Fri, 24 Oct 2025 02:16:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949f0312sm81594105e9.0.2025.10.24.02.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:16:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dan.carpenter@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Melissa Wen <melissa.srw@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/sysfb: Do not dereference NULL pointer in plane reset
In-Reply-To: <20251017091407.58488-1-tzimmermann@suse.de>
References: <20251017091407.58488-1-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:16:57 +0200
Message-ID: <875xc4acc6.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A85UnA5o9llGLMF2Bg_XOhx665fVlzHtGttNzuK_YnE_1761297419
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

> The plane state in __drm_gem_reset_shadow_plane) can be NULL. Do not

That ) is off. I guess you meant either () or just the function name.

> deref that pointer, but forward NULL to the other plane-reset helpers.
> Clears plane->state to NULL.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b71565022031 ("drm/gem: Export implementation of shadow-plane helpers")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/aPIDAsHIUHp_qSW4@stanley.mountain/
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

