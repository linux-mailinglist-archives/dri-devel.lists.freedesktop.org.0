Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFEEA762DA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF310E29A;
	Mon, 31 Mar 2025 09:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VthHaUK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835B210E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743411629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FjT5sMTN0Cbvlp8512i/Spe8E8s8Ms5Cb5B/TXaeuWc=;
 b=VthHaUK8CLpH8fpLZWfTp44dshJEBD4f8HAeqr+Qs/SVXRX8eMiZMkWPdvkJe8+ydfuyzn
 ppndSCokspYSoWyMgZQpyBDRV4Y+N/3X6Rh45Iv5/s5GwlI7gIVF6ehlj/cc2FDB+vyC3M
 nHnL+S/vXBOZodwRvudHblgAAm7h/To=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-AshyhAnnM4yZ1hl9PqXzbw-1; Mon, 31 Mar 2025 05:00:27 -0400
X-MC-Unique: AshyhAnnM4yZ1hl9PqXzbw-1
X-Mimecast-MFC-AGG-ID: AshyhAnnM4yZ1hl9PqXzbw_1743411627
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fe32a30so1332097f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743411626; x=1744016426;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FjT5sMTN0Cbvlp8512i/Spe8E8s8Ms5Cb5B/TXaeuWc=;
 b=CyQugXWeP+QQ+GTg0SVmMXqPJAgri8NMr6bOO9Rcv565bzIte9fsrplS5Cb4bcMl8J
 E/u5Tc7+KQFREGxwBotaOSs5PWXidsn5p8LTFIeIOOblIqqQlxzcYrn1SdlPP4EcEcaW
 zRJQaA+0gLBccmKo0PtpmkRvj7jI9XMiqAvaY6Oy7mgbdH8PyfggNR/gaLJITrxH59cS
 6u4zpbg1M9u0w1ba3cgus34OSjsbNo48Ab803iKnQ0EEymmAoNKE1dzrgkuWHdKL+Hx3
 S4vhXan5wEFYm2R6DytDwn4ygvak6lw+TdUsYc3e67uIUAxTCySV/lAHk3C+Y/xUdUQH
 K6pA==
X-Gm-Message-State: AOJu0YwGV3TbNWhDWaZPqouQiAGR1M4Qe5VNn+60FI6Hq31EHrObhVBE
 d2XfSpWs3+fh4Rj4CU04SeA0cipSvXb5ERu/kc/URqtWSv5zyhQQaT2cZLKQoYp/m++01fAAxxo
 Rz9YcYR6/QphCGT97GLDymhqtTvQcdWn/j5ZGSvm40n0fCMvh0/BrEMZ9XwL5gX/4Vw==
X-Gm-Gg: ASbGnct/uVFsOlSL7uf1w3p/04gv7z3dtr7WBkKb1TEBqoU5ZN71acgNotZd5pIZDUN
 4PkYq8Ds1EH98X3x0+AvPN7wcK6bPaLmNP5veeZ5XcN5UA11Nhu0lLo3sFdHFMxyc+L2PWsD6Np
 fC4wtcmoXH5oCDIrwkBQuLhv7SixqB4yq7/Y9nOvGGr0712nNeH7i7WM5f1JTRqorsfI6+JJo8D
 v7mkMqrX9qqT//pY9TSPOSsHZFFolHyk48KyFJQMfDtPduvBtrvf/sXVJ/6HQyqquo6OE0njCHy
 pzFQzFsZx/dpae1ulzUndXro9jxmvqr5k8K4ZPJttDOhIg==
X-Received: by 2002:a5d:64c6:0:b0:390:d796:b946 with SMTP id
 ffacd0b85a97d-39c12117a89mr6099811f8f.44.1743411626692; 
 Mon, 31 Mar 2025 02:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEotdPcfhJj2gY0WFcwicYT87MI/v9jSoaUZ/RTxLUof+lMhqCMaGntUh551JKUvVqciDKzDw==
X-Received: by 2002:a5d:64c6:0:b0:390:d796:b946 with SMTP id
 ffacd0b85a97d-39c12117a89mr6099775f8f.44.1743411626337; 
 Mon, 31 Mar 2025 02:00:26 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e12bsm10861149f8f.62.2025.03.31.02.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:00:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/18] drm/sysfb: Merge CRTC functions
In-Reply-To: <20250319083021.6472-11-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-11-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:00:24 +0200
Message-ID: <87iknph8wn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5SDARxyoolS1Jtc-P4IBoKZGgCy-KSGgefV1XEktmlI_1743411627
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

> Merge the CRTC functions of ofdrm and simpledrm. Replace the code
> in each driver with the shared helpers. Set up callbacks with
> initializer macros.
>
> Ofdrm supports a gamma LUT, while simpledrm does not. So far ofdrm's
> LUT size has been hard-coded in the driver CRTC's atomic_check helper.
> Now pass the size of the LUT to the sysfb device. Ofdrm's custom
> atomic_flush is still required to apply changes to the LUT. Simpledrm
> passes a LUT size of 0, which disables the gamma LUT.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

