Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3658AA8DC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354B210E7A4;
	Fri, 19 Apr 2024 07:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QE+b5leQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78110E7A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713510273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RrF53ndQa9Sgu43CWLxXlJZq6iA0dd4wA/lH76Cjdg8=;
 b=QE+b5leQxVrQ2iwm760KN44GOl5RNHFsGfHHsK6jFrpdkOnX5kzHTNLOT1QzOGS15+tpcf
 CTvmosOYjilDOl18XV/m8u9iHdU0kYW4jbsaSzfo3y1QIK7vRlVsF3Z+tYMyuY3KEVGZHc
 Hc8hAp5ChG0kl0vkFmc64vnjy9FWIDk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-b0y5HYfbOCWZOShURv4j3Q-1; Fri, 19 Apr 2024 03:04:32 -0400
X-MC-Unique: b0y5HYfbOCWZOShURv4j3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3455cbdea2cso1188816f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713510271; x=1714115071;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrF53ndQa9Sgu43CWLxXlJZq6iA0dd4wA/lH76Cjdg8=;
 b=pp50OOW+vSppT8ZTc9PL4UsPdlmldDIqzwfPyFi1CDRcdQE3RT6gUlcZvTEuO5TPgo
 Rv5LVWDmPlKVs+oRjosSSGxB3UcbBJX5a1cBtRkVPZ2mEcYZrSI2n/qKMq8Cfpz40B0v
 lBT68rzZnrC1qWJn3KCbvAjig4+n7njrK7Th8zWEy1hF2SqdJWaWEg3xrrF0kR0A7K3X
 q/9k4ZA4yvqkSskNgtm32rizbJJW4IfgeKa6VbWvwbWIhaUzDvodbjHWSBHKUF15AGGY
 EY0kxSeq9T1C4EpY5rEs3D4/AH4KlMqGvLv1rvkCoznCBMe3zmEk0gWr6UWAGc5V30SX
 NxRQ==
X-Gm-Message-State: AOJu0YzMDlW6i3vGx5uQH9qVpYNQ7mfZLMmz1Z2Oa4FFqxLdP0h0dp1w
 XmGytMCilqy2IAMMCXaKj7nHTaU5udPcppSlvvYOo5lxPO/xqIrlWaDr6+CNxG7qPLBaz5ndtil
 yQsYywOQ5+CxKLf0PB379M8zpBM6n8tKf2dVRrwS/PQIKr/V9Oqvd7wIVVgPzGVRg8A==
X-Received: by 2002:a05:6000:1868:b0:349:af80:9b67 with SMTP id
 d8-20020a056000186800b00349af809b67mr3789506wri.30.1713510270824; 
 Fri, 19 Apr 2024 00:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPpkcAcvPPXH0B3Lun7mewkPmrcqy/fRLjlykJWcvyGXZveMZJ9WqJmQsdTv0gouAOu6XXhw==
X-Received: by 2002:a05:6000:1868:b0:349:af80:9b67 with SMTP id
 d8-20020a056000186800b00349af809b67mr3789487wri.30.1713510270437; 
 Fri, 19 Apr 2024 00:04:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c00d800b004185be4baefsm7724246wmm.0.2024.04.19.00.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 00:04:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 29/43] drm/renesas/rz-du: Use fbdev-dma
In-Reply-To: <20240410130557.31572-30-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-30-tzimmermann@suse.de>
Date: Fri, 19 Apr 2024 09:04:29 +0200
Message-ID: <875xwdesua.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by rz-du. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

