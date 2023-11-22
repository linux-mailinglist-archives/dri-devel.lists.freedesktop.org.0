Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A87F5174
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D6410E2FC;
	Wed, 22 Nov 2023 20:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77910E148
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700684488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3BVhZG5LsRAUkYD7e/+h2TH6j1J+jVcWFbi2Qhl1fc=;
 b=G0Nbh4iqBHVTm5efWi6J525mqfzIlHfffkeqj4EJnWd5RBeC+oMcClM5IJTvrlAcwl7u1k
 XOAZmPHjxhg7O+HyxqDMgkzJjVpyH7flMIuYUtkFb1DE1i0qtxZV8umxMQvKpYoyemEuAh
 lpifvUIM9tFXPbOQ5Lw61j7CgCg328c=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-rWoEtF4ENxyekQZr9cTs0Q-1; Wed, 22 Nov 2023 15:21:27 -0500
X-MC-Unique: rWoEtF4ENxyekQZr9cTs0Q-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6d7e70f7e77so145813a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700684486; x=1701289286;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3BVhZG5LsRAUkYD7e/+h2TH6j1J+jVcWFbi2Qhl1fc=;
 b=nKhL/J2TEvsa/0BlnTs2NXuitj/eermwLxWwnmOdh3xFLgHeZLLpECCYPXDWZNpYvu
 blzHQl1t+ebSH8fn89zy7XHFGkxfva3/HywOq0WjMcsvJLZGfNUIoAP4rainFNvWuuhJ
 dVzrYFMw+Xu4ycZJzXQa+AgXo+3PhmE/ZzdDLhLFgmRcUyV/DWs0PGfitNsd9JYbka0g
 gFJs17Me8mOREapI6zhr6BPj/dphJgdEUD0k3cJZkwlCosJl2ezjof+ocYSmnkAJ2vMs
 dl9yXJkyEkNmPFidcS6D6x1FoxXXkRbgEGUxjDZ16gsk7w8GwffEacll79yOj/BKeejb
 P0Bg==
X-Gm-Message-State: AOJu0Yw5AYCt5Ny3SflBJsuYz0aWBSym8f9rxVebtU9p33O+lAozgn48
 c/A6uBfP8VoLZa/KubpWeA78Lbw7n+q/B6XeQYvMwT1ZKU9O6P2Rq4BfWCXPzDn1NbCM53cu2R2
 Gs3TPaG31B4xR1sQJazEjnK7aY6i/
X-Received: by 2002:a05:6830:4128:b0:6c6:18c7:7ca2 with SMTP id
 w40-20020a056830412800b006c618c77ca2mr4666274ott.12.1700684486501; 
 Wed, 22 Nov 2023 12:21:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvVrkc3v5No4q2mIgbDR41Xqf/9uVqeJ4fBmgbeOkBmOBDHi5mnqK7zdASidj8R5t6NtsvfA==
X-Received: by 2002:a05:6830:4128:b0:6c6:18c7:7ca2 with SMTP id
 w40-20020a056830412800b006c618c77ca2mr4666252ott.12.1700684486285; 
 Wed, 22 Nov 2023 12:21:26 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a0c9c07000000b0063d5d173a51sm72337qve.50.2023.11.22.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 12:21:25 -0800 (PST)
Message-ID: <76447329d6aaa46625e5cf6fa72e711a2c5fad50.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/fifo: Remove duplicated include in
 chan.c
From: Lyude Paul <lyude@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com,
 daniel@ffwll.ch,  kherbst@redhat.com, dakr@redhat.com
Date: Wed, 22 Nov 2023 15:21:24 -0500
In-Reply-To: <20231122004926.84933-1-yang.lee@linux.alibaba.com>
References: <20231122004926.84933-1-yang.lee@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Wed, 2023-11-22 at 08:49 +0800, Yang Li wrote:
> ./drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included mor=
e than once.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D7603
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/chan.c
> index 87a62d4ff4bd..7d4716dcd512 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> @@ -24,7 +24,6 @@
>  #include "chan.h"
>  #include "chid.h"
>  #include "cgrp.h"
> -#include "chid.h"
>  #include "runl.h"
>  #include "priv.h"
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

