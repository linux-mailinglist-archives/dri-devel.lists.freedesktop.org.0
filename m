Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC3ABBEF0
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498A810E321;
	Mon, 19 May 2025 13:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WXoLwmMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F61210E321
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747660648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6G0kZGOUAs6V7WmPjcYaPJge23aPAYpNapv1UlFIr40=;
 b=WXoLwmMcAiFl94glCe2UJZD9f+cSgWPESACGX5nkWClMtbx6tVsJeQD/fyxgs/MrxVmela
 ZpFtyM7MVmCSg0kOW61BbM2wow2xNfXWXGZu3nt2FvfHaOP4D7ROjQLXbelfBziGqKK8yA
 4Dk0kXuFIeHtbbk1xma0q9xX8LueXug=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-RsRLkrtwOOGUms4CXXUj0Q-1; Mon, 19 May 2025 09:17:26 -0400
X-MC-Unique: RsRLkrtwOOGUms4CXXUj0Q-1
X-Mimecast-MFC-AGG-ID: RsRLkrtwOOGUms4CXXUj0Q_1747660645
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so23872305e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747660645; x=1748265445;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6G0kZGOUAs6V7WmPjcYaPJge23aPAYpNapv1UlFIr40=;
 b=bg/vtkkgteUYTLcyoylUdexB9vydg90/GOFODWoqFvwdofh5rSsoFp2QBf+eGkUotp
 eGJ6MBz+A40Nki+NOf8GQwOgvLtGcFYMvrLGO8FY89/TeG8fGJGz7YaGwzrjx1yayr6B
 WiNCWJWjQaozkA1eg3AbxJ/JkQO02FX2I5+tt0NJXnyUE1RLzfFD0xrPpeh13F4aMq37
 n040PhPX+qr3yZtFN3OX1FHrnqZPtANKSEzf2WUz0g8BOk2FWyofkY4+ow/+J3W7KeZH
 uyMEQmwCyGmrb7xxfpD6GUKkkhpBy9vHA8FwjOpgLUfLvCrMs5OwTPieVq94xKfQZnDK
 ko7w==
X-Gm-Message-State: AOJu0YyJ5E6bdPO2xMMGEo1tq+7w7Ttha+AHvnI6QhXqJKkQw3OjObqj
 3GbCUsU7LdngxkAZ9BKC4XfMnFPjgOD32EedQyvgV2OsQD9+6jFxiWPdyYrXH3Dh6/VVfuTVwHr
 ZOEO5CDjGTUmjeawim8OtSA4pVEAMt3Zyqv1lYydlgwqq37t4VhvouS7kSylC8HfmiL/lgg==
X-Gm-Gg: ASbGnct/z38fyzfi81WRjOtjSQ1GwU+IImyf+9ZAGxlUWsNxbYt1eXyzbv8XJMP6Msu
 xK0aIPhwaJB98FPzSSGOZ8OON9G49BjvYO5WnSYrUsxaw48GAe48KOrtobJXrWPxYk8OlwTu6fA
 ByFiKRlNoAWkJXR0Z1Rmn/0nKGNc3jSLgKJyHx9J4ZetlEM1PnaRGSTSl2rKjBuxoms6DbWkKkU
 KptjAaAGxvlfTrl+qaI/pyIAtuZMa1dln+m6GuTKVc0p6dhYCdwMG1r0dF1yLoPlKuHTzwAtkS5
 u+pDSdo8wg9+e4LgzwNy66rknzLBYU8U3WF4Q3UAsw==
X-Received: by 2002:a05:600c:8709:b0:43b:ca8c:fca3 with SMTP id
 5b1f17b1804b1-442fd97a524mr127614205e9.11.1747660645325; 
 Mon, 19 May 2025 06:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPG6fOUQBH5lLmThPo/ALTXoZrSmVaYiFVEzYBxAvJEKfoxEdvh3Ph1ShRfshDSO51t2ULcg==
X-Received: by 2002:a05:600c:8709:b0:43b:ca8c:fca3 with SMTP id
 5b1f17b1804b1-442fd97a524mr127614045e9.11.1747660645032; 
 Mon, 19 May 2025 06:17:25 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm221113015e9.29.2025.05.19.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:17:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/5] drm/vesadrm: Use helpers for programming gamma ramps
In-Reply-To: <20250509083911.39018-6-tzimmermann@suse.de>
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-6-tzimmermann@suse.de>
Date: Mon, 19 May 2025 15:17:23 +0200
Message-ID: <87v7pwoi3g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cGKmurKdi_0KBOdhZfBDgcJ71vIZL0gRDQbZttjLSt4_1747660645
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

> Replace vesadrm's code for programming the hardware gamma LUT with
> DRM helpers. Either load a provided gamma ramp or program a default.
> Set the individual entries with a callback.
>
> Each gamma value is given as 3 individual 16-bit values for red,
> green and blue. The driver reduces them to 8 bit to make them fit
> into hardware registers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

