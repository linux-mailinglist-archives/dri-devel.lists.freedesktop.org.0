Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B26A565F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33B410E037;
	Tue, 28 Feb 2023 10:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CAB10E037
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677579098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdvB+P4eoLUT11Ndi/CDZkO7atqyQtI0E8Cf3YLMEZw=;
 b=NnI2Nib2IMNG+/2xVxFaOa0vt5NNV8w33geZhIcDuijKAYSCh0+/eO3BbVGrnOdwqlTui3
 cSsAuu1fHjLgOd1RBE3pcL7WYYbSYhbe6/419czvahSL0/xxBvtavGMe3XJqL5GA9f7CWH
 rcqT8TkrJGF+U/g/p8vskcMbnxwt7io=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-Izl_ztIGNw2foDjtgcyBTw-1; Tue, 28 Feb 2023 05:11:35 -0500
X-MC-Unique: Izl_ztIGNw2foDjtgcyBTw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ba28-20020a0560001c1c00b002cc6d1f0c06so654834wrb.17
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579094;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdvB+P4eoLUT11Ndi/CDZkO7atqyQtI0E8Cf3YLMEZw=;
 b=Gg/A1ZMQaZYTNOkccr8TfynVjyl+6PGXeXuYkA2Jy1GCDcjJdEus20fuYWSEH16rIQ
 o7HsX96GXXN7MTEblSxHudGXVDDowjByWl0JSpWm35VvgTtqjrspFkN8xNF5oGm81uaM
 8ycTx5xd3Iz/Cgfm55oUgEGmku+v7c7WPntBZ6h1qbPyRYvCoBfLkLPZ1gfvh7Mqa5aN
 RqNBCaSeZ9x1C7+ImiJMoCoeT57dpsHYh0gX1/7zSFHL3FQgktDJAvvCsZL321EfVCD3
 xZZEhKTHn6LCGNYxeAlkoi7tCSIxsoQKl+RX8RdLOeqNFbwkyvH01du+e9JJczVm6dG4
 B9Aw==
X-Gm-Message-State: AO0yUKVEh+HaB63RiPrugxhYNdYcZ0rsRe06TM1Wj2NrcbsnjW6/Goxw
 icfEFE8c7I15wDD9sRbIUXcgc8uzSa9v3nl6vWyJWzefvT9qwkKfoWqL3L8ynf+GTKK79I4jE/m
 FXqQgu9Ik1tHERaXF+EWvpAoj4mYp
X-Received: by 2002:a05:600c:4f16:b0:3eb:3998:36fa with SMTP id
 l22-20020a05600c4f1600b003eb399836famr1797377wmq.29.1677579094790; 
 Tue, 28 Feb 2023 02:11:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8+K8u4V9G1SYSnYeNE/poWEp7BJBI1AKTDveaCv9MnXpdQOLm1QnVYpJbBN48iJbJjQVDnKg==
X-Received: by 2002:a05:600c:4f16:b0:3eb:3998:36fa with SMTP id
 l22-20020a05600c4f1600b003eb399836famr1797361wmq.29.1677579094492; 
 Tue, 28 Feb 2023 02:11:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q10-20020adfea0a000000b002c567b58e9asm9440194wrm.56.2023.02.28.02.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:11:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Daniel Vetter
 <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Melissa
 Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/vc4: replace obj lookup steps with
 drm_gem_objects_lookup
In-Reply-To: <20230202111943.111757-3-mcanal@igalia.com>
References: <20230202111943.111757-1-mcanal@igalia.com>
 <20230202111943.111757-3-mcanal@igalia.com>
Date: Tue, 28 Feb 2023 11:11:33 +0100
Message-ID: <874jr6yu96.fsf@minerva.mail-host-address-is-not-set>
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
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

> As vc4_cl_lookup_bos() performs the same steps as drm_gem_objects_lookup(=
),
> replace the open-coded implementation in vc4 to simply use the DRM functi=
on.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---

It is indeed the same logic. Nice cleanup!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

