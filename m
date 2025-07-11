Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71458B01BE1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06B810EA37;
	Fri, 11 Jul 2025 12:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iq1NCaVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02D710EA37
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752236719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=By7W2pIF4NeZLcHLf/m3OzqWavRZkcD1clhjVWGAYUE=;
 b=iq1NCaVmJd+zsJnDlM062MNxQ1wxUGWA7cDTgsjyDc8hlbFrFnYjmh1HDLkOAgSUXZ5F3p
 H3z2sA6cSgs6Dc3Noi9zDu36nG6dXtHzXfKwFPnT3cAPxJ9mc51C14NuVW150fentBlz45
 eQevOPbxAeCecFgEceGn3dwdVtmfkk4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-qNom8qkWN-2g0QG_3dj56A-1; Fri, 11 Jul 2025 08:25:18 -0400
X-MC-Unique: qNom8qkWN-2g0QG_3dj56A-1
X-Mimecast-MFC-AGG-ID: qNom8qkWN-2g0QG_3dj56A_1752236718
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b20f50da27so1493329f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752236717; x=1752841517;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=By7W2pIF4NeZLcHLf/m3OzqWavRZkcD1clhjVWGAYUE=;
 b=L4+9MZadtjJ6DNoxCpCsAQsNluqAfM5wwbbpstPHFI3YplMiR3J2R2RQTZBp7zyuQO
 Dyq8atgAgZ2mn3O8BZgUYGHyUbSUDpu59C+UEDJ8Av/WkV5E1NPlwf+NnQMLqIbp76yh
 EmfoiUsxrwQ//68wVj4GXmIyjN1j+YAcBRTjM2fUaUynz0ejApgUNLngKI0WNqScTrEF
 LPg20YcBSaEeC/a+6TaXUzPf4CwYoB5KLNSiWpV2d5BXwnM2o9lqYF/KXdZXd+pfGNJ9
 nBflssk2pOx6+4j8xb8SpskMPtbCpU9aOGwSq5rAlY4IO1/IvkjinvF0jLuVDKK4AtSy
 RV6g==
X-Gm-Message-State: AOJu0Yy7cFiEsinrLBFH6gxFcpKIyamFoqFbfKePJC/NyKqC+eniFsRF
 6mUBkmfUnPi9aUXECOPSIQQX4ztkWzqk0cJsZ5F9W2KKRQvhVEYI3uGmDbbgEiJxllGbHziKadr
 ZCXRpVVXa2zLmtkyxAwfDkohGiuH5aKty9ftiA+Ubr1sXp++xBq1zz1hxilgOEId6TiBb+SdmxW
 WLwQ==
X-Gm-Gg: ASbGncue0/7zN822GtNSNrZClrmHF/AqJgIZycYeSsUtZr0ZK+k63jpar4gyvIH6WUc
 BssZ77lRYX8ZtXX4QMfSPgmGLi3eit1v2GXnflUzZbyTjDUAdmdyyXVGRaAAegRLplCzuSQazRY
 ZekT71rs5aSwk6WDEQC/UGtonArlovn9CXZ9P4s0QkPQ4DFB7obrcYVfh2XAJkBbakoR91CjD73
 bK0kFnYiQe+ABW8m9wyBI126UmGiSiBJOp5KiAkw+dzMC9JxJnQFBwqindbjvwCPtZ9djS+Qncx
 0Uj1d8kt0gSYSIQyWyM/VNWznuem5OIN6fOFBW4nEPDq66t/PBeX4nGQRNy4u5BVowAHQeSYvsu
 xFSVVzf4wOM8GHy2mveK9nA==
X-Received: by 2002:a05:6000:230c:b0:3a4:f7ae:77c9 with SMTP id
 ffacd0b85a97d-3b5f1c67bb3mr2588896f8f.5.1752236716714; 
 Fri, 11 Jul 2025 05:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO6tWsC/dogULr/NpxLZcm0ZXKA0zwQm/aCC0cgD8bYoChxe4wPfUsEqn/2OSEUBLupWHZ3g==
X-Received: by 2002:a05:6000:230c:b0:3a4:f7ae:77c9 with SMTP id
 ffacd0b85a97d-3b5f1c67bb3mr2588875f8f.5.1752236716292; 
 Fri, 11 Jul 2025 05:25:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1fd7sm4263943f8f.26.2025.07.11.05.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:25:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/9] drm/format-helper: Add XRGB8888-to-RGB332 to
 drm_fb_blit()
In-Reply-To: <20250617143649.143967-7-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-7-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:25:14 +0200
Message-ID: <87ms9aewyd.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4VlwilvFz6aizjKchiVKW-MJ21D5izL5vXJk2j_gTJw_1752236718
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

> List the conversion from XRGB8888-to-RGB332 in drm_fb_blit(), so that
> drivers based on sysfb-helpers can use it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

