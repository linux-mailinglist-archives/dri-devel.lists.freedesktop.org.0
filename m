Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B04BD7F1D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595EA10E565;
	Tue, 14 Oct 2025 07:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iMdIXGjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E508810E565
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZAYJ7xq6WZ4FioBhdfbaQnlgRPAlKAdI8jcSI5iXTs=;
 b=iMdIXGjqdcdMDoRIKCjXv4W8pnoSXZYu+OiqyLVQdbWgVIr8SIaM1OLTk1g/vZKLjsAOYm
 JKaYFOVRx6eakAIoBQn9k7I1XEmSymfiXszJnStjMSTzWnAOSwadZQfb4nOOzODIGRQfFa
 ztu5jaU/mrt/dYAjWbWjsSA7hHuVihA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-4SIBFbeUOl-BrErL0WQRxQ-1; Tue, 14 Oct 2025 03:34:53 -0400
X-MC-Unique: 4SIBFbeUOl-BrErL0WQRxQ-1
X-Mimecast-MFC-AGG-ID: 4SIBFbeUOl-BrErL0WQRxQ_1760427292
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-401dbafbcfaso3924083f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427292; x=1761032092;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZAYJ7xq6WZ4FioBhdfbaQnlgRPAlKAdI8jcSI5iXTs=;
 b=JLpqPdCkkLR0Yu77vXCrLD3OTfhPFcVfZ7ySjW0omtBiAZcEjS8r/asXKG9LKbhREn
 i6VLYlwIccD/mtqwK3FTewis2dF3jvy6BMecZm7KlOjsgkcO/miEr0uj/wR68mhYwxah
 0L2tiyiiuREF5w1u1SzfIzvlZKoM83q7TOTa5suonZFQkppDU/qBWXqdH3YauJiuOYCQ
 wWhe/BnqvlgScB9yMqm6mJzONvlWpMbQ7qfcIJw5iTf8+QT2m93dcNGSxYHv5MAxkL8G
 Rbt46LL2K1TpiK3jTV/S4zn0sMmav64rGGeByg8a4E27ecl74K25vaBOcNc0e11n8T1Y
 g5Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcF+lQ1orOqKMQB99VVpnZGyOcSSRA0JERSwV/aQnySC57sbpH53Tb07V3q74qYt0hoscIM8Xphuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJpsmMf6kYFnH1paRMESeZfxUJnaWb0WsfTXy508Wx/h0sbQjp
 naQuA+yZgmaA/4zODwcc4JVBCNY4Mcht3u1kgbOInMN8Id4wwN1i+gkR6Sy2T8nv5Xyqe9z2xk9
 lkqdZBM2qTkM8GdgPgKK3hPjOnj28CPrJwKzXbsMBQKntVa1brrFgfdZrA7H3yz8R0pdi/A==
X-Gm-Gg: ASbGncuxVbMBwMWOzfZERz1PCf12wVSQmzY28GgbUBx8sc9VJG760397dBgzaM6iXPc
 jiRuvcj/3dADPUMjXz4K6+ZoMIv8yLAzYIFDNMJ0MPC7IPveLHWE4v/2ZSRA6crsjwMrM4LOYHh
 SGng1l7YdvkQF/A5tuY0V/r2TRJxyBjZZ4Iv7RLWkkU2JicFtMS6cgf3BGyyIfAOr3/XbHXs9Sd
 Fp610UvOHVLj8NyDsjuhQ/0Uld8qTyvRGKE2zVbQDRi2453yKxVumFj51J6mmqcVytwrHUBccJi
 3nZEdp+OE6DCECP9fWwHjsQxIp4+4pLf8zMZy9BrORngjOYGPDRN/hwmWD2CUP/hQcYmdd11cb3
 mkDC+i+F1U8h23W+7loWQKkQ=
X-Received: by 2002:a05:6000:2401:b0:3e7:46bf:f89d with SMTP id
 ffacd0b85a97d-4266e8de2c2mr16860033f8f.44.1760427292313; 
 Tue, 14 Oct 2025 00:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxNwSeqZAx1bogXJDeVtjJdr6RSvW9zsie6Xf2fYECED9RUObVAre57ulfyG8aTO0EyMtU8g==
X-Received: by 2002:a05:6000:2401:b0:3e7:46bf:f89d with SMTP id
 ffacd0b85a97d-4266e8de2c2mr16860020f8f.44.1760427291948; 
 Tue, 14 Oct 2025 00:34:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5d015esm22720436f8f.33.2025.10.14.00.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:34:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/panic: Fix qr_code, ensure vmargin is positive
In-Reply-To: <20251009122955.562888-4-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-4-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:34:50 +0200
Message-ID: <87cy6qq6lh.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EfTaxS5rPQ7-jYSVdmwTO0R5IQDwTYyIJkBwAfKL8GE_1760427292
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> Depending on qr_code size and screen size, the vertical margin can
> be negative, that means there is not enough room to draw the qr_code.
>
> So abort early, to avoid a segfault by trying to draw at negative
> coordinates.
>
> Fixes: cb5164ac43d0f ("drm/panic: Add a QR code panic screen")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

