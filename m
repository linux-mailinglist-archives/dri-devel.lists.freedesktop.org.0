Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24838A69AC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B048511208B;
	Tue, 16 Apr 2024 11:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IBZ3YjT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22B11208B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFzLrdpsAuEJPi669kzJMOzEGwWeiqROeSymInIGJc8=;
 b=IBZ3YjT6Vo+tCdSE3zvGWIj0FHuNW4KzCSWaCGZycB3lWeZY8zGVDGlFTZ866vJVm41+ep
 a+hLFn6sTZQfoxjBcsZxUGpqrkXVwft6QcP7fds9c8iBqGe6xhHomB3ABVRrctTafnRIIe
 JR64v/N5tA/+ENwWKIPTHehgkmys+lw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-VVNq_Rm-N-qFS_IfEDioJQ-1; Tue, 16 Apr 2024 07:35:46 -0400
X-MC-Unique: VVNq_Rm-N-qFS_IfEDioJQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-343c7fa0dd5so2867940f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267345; x=1713872145;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFzLrdpsAuEJPi669kzJMOzEGwWeiqROeSymInIGJc8=;
 b=JzSIeLzWRB2NhiLZrXctG4qb7sum6VqTi60kz8zqOaFWn5no3sbIbvfDCKl3SeIx/+
 A2uvZLrzpZu+eA4ZOYxAkLcQRsjDgw+6h3BnG8iv7yEvL1GOODEo4tgQdCwqUzod7gK+
 mnd7w24fqJeyWKFvMDSgClauSsiXZVjtRAd3APsV70y8346Lsb9DRst3D2Xhn7JwOtYP
 bTbeJlCGdQAEieQRT7bYJ5LcUe3X7QIrmjelieMGATO0zkfITj8xMUlWnURlY+XBvBja
 pAv72WcXLiMvkvK3hWjzeZzxsmxWvaGTMQluRpSv97xwEAFyQdW+B4vCbz9ZwOrxBsd7
 mMPg==
X-Gm-Message-State: AOJu0Yzd617rUkxXs004usQVKNM0VncVt6qNMz5GQSd7ZJ5ShS5AsIGp
 089R/qDQ8CZTKxeSGS/MGNKa13LgE8ZBDQp2KLfytqes9m2p9MeI79Q2BdAjuWmiq3o+ZI6GnD+
 WHRoNjHwNxr2WN+xFo9plqjHdGBnPqY3b5UoaNMx1/6lGzXThAiKGV1cP1E9sTp6BLX+ClJ1HKw
 ==
X-Received: by 2002:adf:e2c8:0:b0:343:6e18:5f09 with SMTP id
 d8-20020adfe2c8000000b003436e185f09mr8995326wrj.12.1713267344887; 
 Tue, 16 Apr 2024 04:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoYLuCkWWmzkqZ3Ar91Nqc34yB2NaDu4hW1xxK8WU603DhOp2GOeUJuetecJ7khZCb1oFPpg==
X-Received: by 2002:adf:e2c8:0:b0:343:6e18:5f09 with SMTP id
 d8-20020adfe2c8000000b003436e185f09mr8995313wrj.12.1713267344467; 
 Tue, 16 Apr 2024 04:35:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j20-20020a5d4534000000b003434f526cb5sm14575080wra.95.2024.04.16.04.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:35:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/43] drm/solomon: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-14-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-14-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:35:43 +0200
Message-ID: <87il0h7d68.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

