Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A05AA4B89
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653B110E298;
	Wed, 30 Apr 2025 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VBmsEN8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0536D10E298
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746017265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
 b=VBmsEN8/cchqW5QIprdptL4es3VaflZai1PQqallAID65kYrOEU4LqKuyMwTTkUQ0ronVH
 AgwBtsw//+dmkQBrzSaIaYsFC2ZimuN3tGUOB7GHrSEJcStftMAGc6pUYhw2h4VWSJ8/Ia
 XWoGnfSqyDHcIN+VPN8MfpspN18sbv8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-Fv8N2NqKMnW00UodLyiDKQ-1; Wed, 30 Apr 2025 08:47:44 -0400
X-MC-Unique: Fv8N2NqKMnW00UodLyiDKQ-1
X-Mimecast-MFC-AGG-ID: Fv8N2NqKMnW00UodLyiDKQ_1746017263
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912d5f6689so3804313f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017263; x=1746622063;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
 b=rs5hanOH7DWupQ8zyDzVWuZdYC2EWraiSjlwe62UAN4rJgSJsNHopXH0sDFkQl/GZU
 9EVsV8cvdNJ9RVExstq2Wk/9XtrvAHjIs5dQC4WscZj31FCHwAxnGfHWWalKonwQ/W3z
 fakawVyxKM3nvUMFq3AUvdGPZ8vplACfu7oHcLidrKOQJB8AK4nC5XzbiipzOAEsEmhI
 WqeSustEOBN/9I5Ja+rKwQrPBxXHYuT0uRsSVxYUoPOJn4BfoabkTiIuDb6/crRoZzL/
 phGUjfzhZVxKZQL84ycKQUug9dWnbDxx/pRUshK0eoQlORH55/zYlXhbv5lHelVva+cY
 1cDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg5gwCcxdnB5sFc/dGGR+eJUcgW2hRP9Hq2emQCNKtrO/hgfAlX17Aip1T5p/Nn94sQ9m3/31VbNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNDKjpk2cwSF9whOV8rK4G6XJEACUpVLfo6zFhEsApzR3dxy4o
 jY2Pppd5tia+gwYQAeB1ILLHlQo+C+pitmoYgiXKKN3TGIq13HMkbtyiGMLBDDzwQYBIzuH/kU/
 4R0/M/lIAlofosfUZABo88SSfdbyv3fZojVS2hCMlHZ2LOro88C7zqSiQAAXq9Ntu+Q==
X-Gm-Gg: ASbGncuj13X6UPH3/eUfoNPx6hFYIyUwUDrj7kPvtEegxmH1Qyw6dT98k7sILvmUQ3d
 tnpA0ZO4cVykit1z0RzUDZ0N+7nmH6MkcJGPqTJFMA5TdkWI6FV6bGkgii9IQhtzigKwKR/1PEn
 jmEJaequIXN7cAGLMQGzM7wtO7IRjPB6Uw7BPo4bY5csbxGGxecNG/uONMnosrygVYzQJdt/hb6
 65xwVil1cG4pM+BZ1BkL3rYaTagixXjJoSeN/UUyUDVTVGru5OH/djZC5glPZexzZUS6dXMVp+/
 07AnkRhMaLFX5d5g04KcehZUNgBiqiDlAzuMBoTiBvnVSLgDUfYPr2EE+725ENNIblWwGA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-441b1f5bffamr23643485e9.25.1746017262826; 
 Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM+ceGhOv4JKCvz5Fh82bRAJjwTkYhN8POhSnvp7s6BTnIqcTj6XXd3hkyknjVQdUMFaljyA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-441b1f5bffamr23643345e9.25.1746017262451; 
 Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20b36sm24245465e9.25.2025.04.30.05.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 05:47:40 -0700 (PDT)
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
In-Reply-To: <aBHZYgPPPYY-J8Vd@stanley.mountain>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
Date: Wed, 30 Apr 2025 14:47:38 +0200
Message-ID: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h1aYeU4YNo5qa_EZL9DhyA6cBE2oie9NEKAhGjPxw4M_1746017263
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

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> The devm_kzalloc() function returns NULL on failure, not error pointers.
> Also printing an error message for kmalloc() failures is against kernel
> style so just return -ENOMEM without printing a message.  (Kmalloc
> already prints a message).
>
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

