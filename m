Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E3724A73
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB84310E391;
	Tue,  6 Jun 2023 17:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099C10E391
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686073317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ehih7kzwBGgwCJj3UTcS4dS0mJ/LugmyUCndLHgspm0=;
 b=cB9aZiQKWVjiLb+ZbXfo19KSNcU5bRr4y9MFI56DYA3UUHBwluVfcNX9uElQBVYzgO8bnk
 OOA2oetH0sDRcBm7wyfdn3rPq7+vIWIdT5rpWm7ta3rpIwI3lt5dMSS/BcVF0QorV2MMgg
 U8zulwdbn0O6CcyyYS22d2gLZdgZKPE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-ZS9gzcO9Mk2ma3l-F0GY6A-1; Tue, 06 Jun 2023 13:41:56 -0400
X-MC-Unique: ZS9gzcO9Mk2ma3l-F0GY6A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30ae9cf0178so2983838f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 10:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686073315; x=1688665315;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ehih7kzwBGgwCJj3UTcS4dS0mJ/LugmyUCndLHgspm0=;
 b=AGe1Vs6NYSmyLJaPrrY1iRDtpu9rH3oG+8SvXoFQT4d6j/qcBFIx8o5zn5YFUHGlRx
 saQusPukodwwQ5ZWhAQbxzScx3TsmnRnN3P0rIHY3F/vQVOqC6JSqbqQemgs7P+ohcHO
 sC8Uc8MNJRmPJEKGJPCthSelw6K9mWu5AjlGqT/fPvRDPDYYwi9J2ZIgQMAPITOlMKJJ
 cPC3Q9iE/YRG+b8wbJJZonDIZcgbbsawdC3tl+fnwRrnzq3Yki+jBEELnHYXSxyohPJ5
 zlN3KnqMfpjy//NyVTuM9ajULyUsgxdmI2arEBb74XzdYJ2NGiju2Y/wOhnTsGzmcrrI
 sB3g==
X-Gm-Message-State: AC+VfDxfe/cdLLR6l2/rE53xyp9zV3pdJC8cNIgUcoO0Rm+SIOcWZTiT
 eJ8BTvVWo4yatzmC4TL6xQiwjGtXPnJdZvrrkkDLbo6TtqdmOkNZVyT3wfiXu7nR19Mrn5dqE+R
 fNCm9kPVNoU6fAKfYMDc+ddJTGyqN
X-Received: by 2002:adf:fccf:0:b0:309:5068:9ebe with SMTP id
 f15-20020adffccf000000b0030950689ebemr2185077wrs.50.1686073315162; 
 Tue, 06 Jun 2023 10:41:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PoSad/Tt2Oy0SvGIrBP6Mt5gL3475P13DSUJ6diM91HbqqXJzEaLtIwQQ33eHQ9izor8ipw==
X-Received: by 2002:adf:fccf:0:b0:309:5068:9ebe with SMTP id
 f15-20020adffccf000000b0030950689ebemr2185067wrs.50.1686073314924; 
 Tue, 06 Jun 2023 10:41:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a056000010a00b002e5f6f8fc4fsm13119884wrx.100.2023.06.06.10.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 10:41:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <mwen@igalia.com>, Haneen
 Mohammed <hamohammed.sa@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm/vkms: Fix all kernel-doc warnings of the
 vkms_composer file
In-Reply-To: <20230508220030.434118-2-mcanal@igalia.com>
References: <20230508220030.434118-1-mcanal@igalia.com>
 <20230508220030.434118-2-mcanal@igalia.com>
Date: Tue, 06 Jun 2023 19:41:53 +0200
Message-ID: <87jzwgh4im.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

Hello Ma=C3=ADra,

> Fix the following warnings:
>
> drivers/gpu/drm/vkms/vkms_composer.c:42: warning: Function parameter or m=
ember 'frame_info' not described in 'pre_mul_alpha_blend'
> drivers/gpu/drm/vkms/vkms_composer.c:42: warning: Excess function paramet=
er 'src_frame_info' description in 'pre_mul_alpha_blend'
> drivers/gpu/drm/vkms/vkms_composer.c:93: warning: Cannot understand  * @w=
b_frame_info: The writeback frame buffer metadata
>  on line 93 - I thought it was a doc line
>
> by correcting variable names and adding function name.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

