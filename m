Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF18A6B53
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AD810EFBD;
	Tue, 16 Apr 2024 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eX2jnkHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A1B10EFBD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEzqBt99V/qjK/q3dhyjW2ywFnVT6g8gHK8Q3RaZPnU=;
 b=eX2jnkHERL29Fg/WZdSsJyleqdrXU8mMhubZ9M1KIbIOjtKk8eEfO9FWB2X09/cSGMZsHw
 Q7wr60zfAd+0vGSFDp/jhpBykhg0m83cYn1nMg4tst5OYdJoddhzk3IoAPguxtZ7aMmXhE
 5pmxC+gSfqoquMh9yBgnOmBSBqQkvLo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-2CtK-rpcPV-UwOo0ydg9pw-1; Tue, 16 Apr 2024 08:41:42 -0400
X-MC-Unique: 2CtK-rpcPV-UwOo0ydg9pw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-418a673c191so527455e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271301; x=1713876101;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JEzqBt99V/qjK/q3dhyjW2ywFnVT6g8gHK8Q3RaZPnU=;
 b=qUpo+W2fgBE4nWwgcUAxhFmsxnLQ3SOdNaHjEMZcD8kajv8szFtMkxYIAZUzSqSKsS
 xbLkSk+pOJZ47mafDVd24AMKjVDrwQseO7Z0EwGkdie/IxTGNLztNc72YqP4aKSZDiw3
 Q+TYqLmubp4PvswldIszxR7Xp9enUzwWEXaTbgom0pkAqwwtxVj9ogcoBJfURaljcLIP
 2uoPkbReRjkXFL3PziRvsXH3Emnj9esoDso/+8fNo5+ASGi1JZ89Owj9tAKlAEKLQxtg
 FYt+zk+0w6kyP7SxdeSdz7Ky4/wUW/Y+W/h9rSD3vBBQVuT9JkFflK3QtvIhsT2j0d0c
 Wj3g==
X-Gm-Message-State: AOJu0Yy5015OqXe/UqFkIPrUirUlqZ793hqnfST/vMIr1mwvxJawi3Im
 fW7w8K8GSY0uWXVaZXPROfETwxhyNh7Z6spJhgn7eIiwv67Rsnr6h7cYzUBirg12aCF2dBEpgDC
 1W111pQcuusBtandvorKjMwgFTTj9VOtaFB4f0JjxWbbdLklQxjduuvMmZTOsepvR9A==
X-Received: by 2002:a05:600c:5251:b0:418:1e00:12d with SMTP id
 fc17-20020a05600c525100b004181e00012dmr5861486wmb.17.1713271301244; 
 Tue, 16 Apr 2024 05:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1+v/UZupgeBk6llFP+UkLAmWoQ5iO5NgJ3iL3Z/guXwO+xwUxUldecOPPuQfhEXYpVwgZew==
X-Received: by 2002:a05:600c:5251:b0:418:1e00:12d with SMTP id
 fc17-20020a05600c525100b004181e00012dmr5861475wmb.17.1713271300868; 
 Tue, 16 Apr 2024 05:41:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b004182b87aaacsm12528502wms.14.2024.04.16.05.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:41:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 42/43] drm/fbdev-generic: Convert to fbdev-ttm
In-Reply-To: <20240410130557.31572-43-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-43-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:41:39 +0200
Message-ID: <875xwh5vjw.fsf@minerva.mail-host-address-is-not-set>
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

> Only TTM-based drivers use fbdev-generic. Rename it to fbdev-ttm and
> change the symbol infix from _generic_ to _ttm_. Link the source file
> into TTM helpers, so that it is only build if TTM-based drivers have
> been selected. Select DRM_TTM_HELPER for loongson.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

