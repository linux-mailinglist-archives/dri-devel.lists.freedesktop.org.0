Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62078A6B34
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E8110E50D;
	Tue, 16 Apr 2024 12:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eV0py2Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2710E9A7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ud3ijrfjplDarV9TLJPxsmDvriDToUgUKj0vhRoph4=;
 b=eV0py2CnqbtCdlEIyX6Ye6qEwV1qMc+KmeqLSqT+YY8FlsaH5GS2Bg9LskzYytMrjeFme7
 EanqDxIVdcBkOiCBsYVxY+dbPkAQKq5wGXcOhfSeLCmhlMQxTyGp3p0OVHJA0uBkynO5rt
 nTaLBCwRAtT/3EZ/sEEMhrzMiLDOMeU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-GnUfPPxJPLymVQAgJFQFeA-1; Tue, 16 Apr 2024 08:37:35 -0400
X-MC-Unique: GnUfPPxJPLymVQAgJFQFeA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-516de13dd48so2761736e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271054; x=1713875854;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ud3ijrfjplDarV9TLJPxsmDvriDToUgUKj0vhRoph4=;
 b=H0xlWWCWyDkxtnbqwQtIthnR9/stMDW2MZEyRSJOQQb1r0QQj2D7aTTkmYCqEchGRi
 5wziHeojLBm0dSOBpqY9mKIcCIv+rWvOTn6BfjfD6d3raNZWksKNxUyR4fke76oLVINy
 3j7vRlFRL6V020Zt5SqAf1g5rMB+gIMl3rOa7Nfzl9hrUPn2V8aZ62ZKUHV3J3gCL8tv
 gegVNUcxXofnaQReiaMKkOcgTmamN0eOO8xLhUSMNAFhDHuqEtaFv5pZOzXVg+RwNpED
 vi3q+J9mY1gUtZfcz7wC8VibwOfDKPvAfHxsIy6qIQ6mWaWJQUob3pz7f9DoiEhFRx8O
 q4zg==
X-Gm-Message-State: AOJu0YyIF5Ft8mW9uy+IsuXOm6z5BdxqNxMElc79mybwzVlXF93qkR2S
 c2G/a9k7Ma/7ZMbSu+Ud2zacgc51sX3DW4GdyuO6qYKYna6mzXmYdcEgbMy07QUDzbN8qoHLE03
 CrmeWgOtc19KQARrd4+YfbCXUU62KQXR5EwBJGN0GuiE16uZb9xXn+ePp6Xw12klqRw==
X-Received: by 2002:a05:6512:48cf:b0:516:d47d:34b9 with SMTP id
 er15-20020a05651248cf00b00516d47d34b9mr7499599lfb.22.1713271053854; 
 Tue, 16 Apr 2024 05:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGED1Mc4BtvceNGbCcF6kDEVs71CuWIOUPAUsCf/78LW6WWtjHnKqmejEA9mlBsBmW/kiIYiw==
X-Received: by 2002:a05:6512:48cf:b0:516:d47d:34b9 with SMTP id
 er15-20020a05651248cf00b00516d47d34b9mr7499581lfb.22.1713271053329; 
 Tue, 16 Apr 2024 05:37:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 dl5-20020a0560000b8500b00345fb949c28sm14750918wrb.100.2024.04.16.05.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:37:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 33/43] drm/tiny/ili9163: Use fbdev-dma
In-Reply-To: <20240410130557.31572-34-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-34-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:37:31 +0200
Message-ID: <87edb55vqs.fsf@minerva.mail-host-address-is-not-set>
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
> damage handling, which is required by ili9163. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

