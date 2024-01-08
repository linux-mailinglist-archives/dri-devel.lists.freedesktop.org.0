Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854A826ACF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F31510E094;
	Mon,  8 Jan 2024 09:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FAC10E094
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704706583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QF07YVQH2syGFQtZnfOAe1/qfQiBqJlIcNmMYcsZHj4=;
 b=b6+tCI8540hDwwUawJ08pw/neM1+mjYRjbg44lF8LEULHthdR/5WwY3Hp6zXXGTxXpDFNf
 YYPdNUYDZFhZaHeKrZaibNCcnSyYhjURPcHLaFGMun2Ze7l6RcGuxo9SMV1A5BKF4R53cq
 nNAC3uvx7kxayq9x51wR5rYozUPpAPc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-l_ruypQMMhu9_8838rzdpw-1; Mon, 08 Jan 2024 04:36:19 -0500
X-MC-Unique: l_ruypQMMhu9_8838rzdpw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2cce9d6ec6bso13028281fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704706578; x=1705311378;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QF07YVQH2syGFQtZnfOAe1/qfQiBqJlIcNmMYcsZHj4=;
 b=n1ga37IpicxdIF7vDfqmDAHdn3Mi+1uzFkMy+XHjjr/COAQfBFzuB0Kte6Xr1KitdC
 B+Mr5N4GkYc754+J2bQDNVxP5x4jIjjBkjZOMYAFAQfoedG4BHlI/TGvYfBJJD/mimPb
 tfewFYveFKr6LXJGAsJoMPs6e0TziMP7wwiu1pbSythy5URSg85gxEWGlh6MCsyeZN2M
 D0iGpEEOZ/D9F60nhNeOvAAgymbs9ig18qvhXTckgUtltFra7JxpZSLio9vbNrII22yB
 NmxW03plZu45hv+7ldgk5xzYkJ+FLI9Bl2iyPqay75eEdrUm2Y4IgfGW30yTDNeouH8w
 75OA==
X-Gm-Message-State: AOJu0Yzk97zaGLdDgA6Dfyc0UUNg6lbnDem+QY/K20Ldla5tPKvX3KA/
 PzVvYpY0TgPw2s9xvJXqy0DyyPLqE/iOBmq9IBqMbDIYahZJcs9A24Y1edp7CZy7n1tidnuecHM
 LQmlOyGOJZDfl4EbrmQ09PrdB9rBczwfg+nwZ
X-Received: by 2002:a05:651c:a07:b0:2cd:10be:cf14 with SMTP id
 k7-20020a05651c0a0700b002cd10becf14mr1730540ljq.19.1704706578546; 
 Mon, 08 Jan 2024 01:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEofyXwklxoZpXnBRHO6GYjy+PST2V1Cnh2j8jUOksB0ztim7vP0b57O9VfxEXUzcwJzK8ZbA==
X-Received: by 2002:a05:651c:a07:b0:2cd:10be:cf14 with SMTP id
 k7-20020a05651c0a0700b002cd10becf14mr1730525ljq.19.1704706578200; 
 Mon, 08 Jan 2024 01:36:18 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d410f000000b00336e43e8e57sm7273851wrp.58.2024.01.08.01.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:36:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 deller@gmx.de, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com, daniel@ffwll.ch,
 airlied@gmail.com
Subject: Re: [PATCH 4/4] fbdev/hyperv_fb: Do not clear global screen_info
In-Reply-To: <20240103102640.31751-5-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-5-tzimmermann@suse.de>
Date: Mon, 08 Jan 2024 10:36:17 +0100
Message-ID: <871qasdv5a.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not clear the global instance of screen_info. If necessary, clearing
> fields in screen_info should be done by architecture or firmware code
> that maintains the firmware framebuffer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

