Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C27706310
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582A610E3CD;
	Wed, 17 May 2023 08:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F410E3CD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684312711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Awr4gRZsdLGQYIUyMmed1KNNdKfsJvua5DQtUGISNWs=;
 b=MDd63lb9lBuv8ujcA3EyjNe1W58J1YNGQPq5p0vEHTfyTN0MehFytLuVruh/KlYlhLNyuh
 kw3XUMKcTe6c+smUWd+BXTlU1MNobbgBd/mF3DPSCmeIVptwsLxwu0lyzle8IUtjmO8O/F
 +7z/nKFOlv1lOxdb/xztAA/KMHqDyA8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-5s5AvnBmM0CKJEGQ_id09g-1; Wed, 17 May 2023 04:38:26 -0400
X-MC-Unique: 5s5AvnBmM0CKJEGQ_id09g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f41dcf1e28so1761155e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 01:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684312705; x=1686904705;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Awr4gRZsdLGQYIUyMmed1KNNdKfsJvua5DQtUGISNWs=;
 b=QDwTDdJh1jfmelFf6NLrOmoeNap0O+Ge6xIWchBcSEaDj3ZYXlN0EHV1+jwowhlh+k
 yCdrroe0iXoK9Ebo8UNDuqrpwncKfrl9hWKLsa/MyhfY+I4ULfEbQCojfpQtS0lx0hTv
 xVH67ggp+QGYtVPRWi5yU2tzIsNiASbx5thELD2RmFqPpbzwdFRrubLGiUhZwui/cYxX
 0pdRzSEvcqjCoXYeLpnMCkseY8dlljSb67kqMIK+31owiFa3rLSCmOpm5obUXH9ZabrE
 bB3p3SUvKuLmENNpxk36mw/hWoexJMTS4NLxNFWM/wRmjhbjauXAkI1fCvsTWsMPCTXh
 uN9A==
X-Gm-Message-State: AC+VfDwzpmkth+yclW516GBy8wDMLVeDLvrBhg67UVUrjQ9QmZYD80vT
 nYr1V6rnN1YEnDHI4HYwOC6xlrXklRslx0tVXBMa6GZh92mLnRQ/2c/5MqCQRQr++ite/W+t/Gr
 N0aXcU+pxdbLmagLNBfbJJbMTmNL0
X-Received: by 2002:a05:600c:296:b0:3f4:1dd9:e9e4 with SMTP id
 22-20020a05600c029600b003f41dd9e9e4mr25183087wmk.4.1684312705172; 
 Wed, 17 May 2023 01:38:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+xQB/WwSfZGlVBWz3pf1X3XrZ6616+LvJs0buY0t+QlE+UE09KziCsrhgVjdn2XBjNLyu9g==
X-Received: by 2002:a05:600c:296:b0:3f4:1dd9:e9e4 with SMTP id
 22-20020a05600c029600b003f41dd9e9e4mr25183070wmk.4.1684312704870; 
 Wed, 17 May 2023 01:38:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y26-20020a7bcd9a000000b003f42a75ac2asm1536196wmj.23.2023.05.17.01.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 01:38:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>
Subject: Re: [PATCH] drm/drm_atomic.h: fixup typos
In-Reply-To: <20230517082322.3230271-1-suijingfeng@loongson.cn>
References: <20230517082322.3230271-1-suijingfeng@loongson.cn>
Date: Wed, 17 May 2023 10:38:23 +0200
Message-ID: <877ct79wu8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Sui,

I would still add something to the commit description even when your
changes are trivial.

Sui Jingfeng <suijingfeng@loongson.cn> writes:

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

The fixes look good to me though

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

