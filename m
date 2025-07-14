Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A95B03C66
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095710E201;
	Mon, 14 Jul 2025 10:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H+LwT+k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7828910E201
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752490141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ltPdQyqHBsra0GyTjq74zXTigFI2B8itXhZ/svYCZPs=;
 b=H+LwT+k8Iov3agwbZu1h30PVHagN8FiZKSg8CAfmsrfzP6ihgUuAeHWNzl8yLg6ZEjqM89
 ZXb3audFay9hYKTryFQMT+TPS0mLDKoDnczohrYJj0Fk+opeBDWNet+4BhIS7bZrv6I6Ox
 6fl70ZYKFj4F7kcpMRmVYGOwCBsP4Ug=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-EaWILjpBOj6JkgUiySZS6A-1; Mon, 14 Jul 2025 06:49:00 -0400
X-MC-Unique: EaWILjpBOj6JkgUiySZS6A-1
X-Mimecast-MFC-AGG-ID: EaWILjpBOj6JkgUiySZS6A_1752490139
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso1835590f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490139; x=1753094939;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltPdQyqHBsra0GyTjq74zXTigFI2B8itXhZ/svYCZPs=;
 b=kxE+UvF26gXb5mGcSFoPkJgGSP6FiIryvLwnwqhGMZYghFdhnVVpi/zkBeT4OVCrpi
 4yY3JMEUcuzhQZ/OPs/IKkAL5HKnXi1hAlzWgnzfq4Xu12SVEMGOe9h3DwHDAK/9EzGA
 zt27QbeiwFYGh6b4phRzsC28mSeyfM+MwMzg6BeLAfWQ9YvWcpqMNc7KNfH2my+D6FKA
 RjYynHZXwTL5gEHvRDFIfQV5dlfTn41pmdOLs0/DVkpamnUXkP+OnmDas1GZcoT0x6EC
 bks8xUKCxkbAYhK34GZUXxJ8Pv5Y9D+hjoTjb61VQjBUgOgPsUfpRS1cFMjIh64u8ZQ7
 4IJg==
X-Gm-Message-State: AOJu0YyDbTCYQrDTVdTiXdcdKE1shwMh/ZvO3UmcKBLj+WLSNxeiBfrS
 9KZxEmv2+IwXbARLR/pGEIQPT8mdW6Eaf2t7NVfISS8TqkIjIGPEL6yvKGzsgSLn5cxdRT02r3A
 qIUibEBMI15epl9bFrqeh5J2eXoyIWuMkBbDmwJk6T/p52pnLapaP4ehyr90+SY+Rv3XiwQ==
X-Gm-Gg: ASbGncskAXZYCnJL2uIcXMzNMk9gH4NeekOWhWcgekZdDv3qQDFNAaSnzZuaIzAXaiG
 xQolK/j5/HLg6eePchEX5FOF0t75jr+1wIwunbaz9O8YSl/QSuv8ZORNGyRw2bmZw01bZXBfUa7
 29H0UvBHA623pnW0eT4+8/gyH7SiwBCr8zG6zoRw/DkLtaYMTPWcVk08d2wL60Mdb5HNrQMe7ui
 NmezByald/Rw0JzJ24KPx5PnSoXhmJ3xcFyqdl7Q+DafUIzh1jdoBh5t+kMx1oUh3g/G929cXN5
 iU+tGbut+sgY1xfpkJPbiq8xXv3Qy6katUfRlmudz1WTSkRxq1xXG5cCI+Tu8raVIg==
X-Received: by 2002:a5d:54c1:0:b0:3b5:def6:4e4 with SMTP id
 ffacd0b85a97d-3b5f18dc957mr9051337f8f.46.1752490139163; 
 Mon, 14 Jul 2025 03:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHImDSBSOZrXKdE7d+lK2DHEqPaurxGJM74dxsib/ppONQQBriF16K2WMaXixkeJMLS5CC1Jg==
X-Received: by 2002:a5d:54c1:0:b0:3b5:def6:4e4 with SMTP id
 ffacd0b85a97d-3b5f18dc957mr9051311f8f.46.1752490138729; 
 Mon, 14 Jul 2025 03:48:58 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d76fsm12336085f8f.64.2025.07.14.03.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:48:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 1/5] drm/st7571-i2c: correct pixel data format description
In-Reply-To: <20250714-st7571-format-v1-1-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-1-a27e5112baff@gmail.com>
Date: Mon, 14 Jul 2025 12:48:56 +0200
Message-ID: <87qzyjkpyf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z4okbwznmZ5LSzrdfwMnh86mEWzd9cu_qL20hQHvkgY_1752490139
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> The comment describes the pixel data format as stated in
> the st7571 datasheet, which is not necessary the same
> as for the connected display.
>
> Instead, describe the expected pixel data format which is used for
> R1/R2/XRGB8888.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

