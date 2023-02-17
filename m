Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383E69A7C1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23E10EF20;
	Fri, 17 Feb 2023 09:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EFE10EF20
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/Vg/oi7sg0lEBjm9qSqwVJEQFFplyI3DAHqU5zgGyM=;
 b=JXeLXkEYASJ2sawSgXvcJCO59cBXttxK9A/aNLxiTSB2wVrXpnx6eeQI9v6y5x1FghhoFY
 CcAWQb7qjlB9ik/jp3gjBKQWUHetnAtkRek0r8dDvblW384z0w2kQrMaA9VXLgPWxIiDqh
 PSNsCAumK6GpgqHcfB2CMit1FVdkAiI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-DGjA0LsTMeqr5poVqfaWwQ-1; Fri, 17 Feb 2023 04:04:19 -0500
X-MC-Unique: DGjA0LsTMeqr5poVqfaWwQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h8-20020a5d5048000000b002c557db0e0fso26703wrt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/Vg/oi7sg0lEBjm9qSqwVJEQFFplyI3DAHqU5zgGyM=;
 b=OetJonEPUGJ62uLItAnMIHFL5XXM9DLhsTZmSKMEUstITwxYj/YVAWVXuZyLHB2s3X
 QHhuVDyPbJWDgKui04AEhcIQ3Cyih2eN0Zky2C7bbRUXdhxbXHgCqdrR5jGIz/itozx+
 +OdDRpg84kHQGXLgcC9LFBuUF0ownwH9Sbs0comBCj5X2Y7sIpsoZ9eyuCw1ImX173TT
 GfmktWCsAxanW2zoX9o7yrNeMCv6TCIylpwpgxmFCCGaXmhk/SIJTgb0x17YnRotxO/+
 5uwEObv5IzanP1R9FXvxFFbheYLExdmq3hXSBCYgCPjbDxRjMXk7FQIHn7Q0isc+Zk9G
 JeWg==
X-Gm-Message-State: AO0yUKWX4vq1QlD6P4L/mkJ0OyTmwtFt1QQ9Xb/oZvwP5s8N9qf0PIQg
 p6vpgM8XfvMbGngJXtGy0YoGGmKuVlahVmDR0a873SPEsiJADiZp0FTpIWa7tgePQUb4TMtfmVv
 vXZxdKmAHfM25TFbpH9Xjeuv7VRrz
X-Received: by 2002:a5d:5274:0:b0:2c5:6c26:1f73 with SMTP id
 l20-20020a5d5274000000b002c56c261f73mr7413165wrc.20.1676624658127; 
 Fri, 17 Feb 2023 01:04:18 -0800 (PST)
X-Google-Smtp-Source: AK7set98GWM304I+yPyS58qtsFdfDQC0E6UdjQSZ+kNzg9KXWfZpJwMOLAHu6SxeCJt3DfODLkCIXA==
X-Received: by 2002:a5d:5274:0:b0:2c5:6c26:1f73 with SMTP id
 l20-20020a5d5274000000b002c56c261f73mr7413138wrc.20.1676624657852; 
 Fri, 17 Feb 2023 01:04:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w6-20020a5d6806000000b002c6d0462163sm965896wru.100.2023.02.17.01.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:04:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 11/11] drm: Fix comment on mode parsing
In-Reply-To: <20230209135509.7786-12-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-12-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:04:16 +0100
Message-ID: <87h6vkwtm7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not claim that there's a default mode in the video= option parser.
> if no option string has been given, the parser does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

