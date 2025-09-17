Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72577B7EC13
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE8010E446;
	Wed, 17 Sep 2025 09:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A52adJwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688310E446
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758100989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvSCxZfh1AeN+mbSyVIIhh7UrokaGa4ZRWUpU2AZ1oA=;
 b=A52adJwVqyig4qCd47ZFRx7ow4QBPp7VCtLoa5HUOv8VZyLQTadjNx5hAm70FFByE2RUG9
 vNi1Dan5kioQ6psxuRkdgdrocjtlqSCntTBHaGbaqn6QJo0XH7PunYL4x1YJSb4pYYAxgi
 1op0cNdN3e86anGfvGc8Vhn8BI9OjP4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-tTyxU-ZBOGuoLkSoosDUnA-1; Wed, 17 Sep 2025 05:23:08 -0400
X-MC-Unique: tTyxU-ZBOGuoLkSoosDUnA-1
X-Mimecast-MFC-AGG-ID: tTyxU-ZBOGuoLkSoosDUnA_1758100987
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3ece0fd841cso227225f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758100987; x=1758705787;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OvSCxZfh1AeN+mbSyVIIhh7UrokaGa4ZRWUpU2AZ1oA=;
 b=kAkbtO7OzQWZwvLgFwyyok0du6WlVaNbVmKBmEYFU7BO0m9N1s6tvx5DDfw3Zugyix
 +ru2UNXSDdqTUkQahuNnhDcd0cj38PtLhnc9VccBjhpr1yo1jjChd2JqNG8HfXNHjJ1T
 ZZNdoNzznPaO2mSOu0v+AKdRZKRmT7ZXskfcDhOf5jeEq/kZIvE2WecqQ9IQzMAtLr9i
 gUSnKWsITiVPCjaFfcAuoxStJTEyhEwpbWw7GPnU/ngwhYTlbDWkVIMWnQqvSfGlbOsS
 +YXn2QcdgohiomUuI07YuIHWCRnguk8qiUe5YY62wwFQ+0SlJlAfwi9g6ga/aA79fgNE
 BokQ==
X-Gm-Message-State: AOJu0YwCKjPvOJC3bRQHBVchJESrBGsuQZYsig5YbYXKqFRjPms36FdJ
 mEc0c8c5wduQN04oK5+2gNBThns0haxIEoIi6iKtVAgdkcpU+N+V+KuWRtlWJ7voJfoOLE2ZYzR
 sulC95kK94NpxtQtTvKy4NOXJK8sGujDSTts+ojdiVtgvmK43zuBSHxAqxIyi+O7XeX4NrQ==
X-Gm-Gg: ASbGncsVng1HDckscoWFUqNFyMHC5M64QE4LcAxSXSXXFvLmnYW9Cr0hpeEQOC9w4/f
 x0Y03kUrJAVQ6gF5L+AZzYbL7Y4+bJEtPLwPg+HTU36jGpfKnKZRbtI6beYhBUSg5srzUOyyhM3
 PZPgp4LvG3wCatj7UTdMFxfPh5dk+KtzYXL7RkxqUCGjd09Dv+/UUnBet01UU453gQghajLVh2Z
 qeKy9esyPw+370ZKeHWcbi34flShWO6upbL9JHk9mzaHzUs01esY/AzVAcA/FRBKmaRYgwRQ/zJ
 wncfUAVIvROyaf3fa95RVWPRGaGnBe27+4aHw8epdG6XtTLPKRpMkdMnykqJwol4lxwnG1vCszD
 cttT9dYQ1waBlwAEz2G3RLg==
X-Received: by 2002:a05:6000:4287:b0:3ec:db87:e9d2 with SMTP id
 ffacd0b85a97d-3ecdfa4d33bmr1584040f8f.44.1758100987064; 
 Wed, 17 Sep 2025 02:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFqihtnYAqZ3D3nSwkTZLk2BK6pesDEk8SJPPmPKbgYsWaRJlkSUXI+rL4TmJt9PjMeujIMQ==
X-Received: by 2002:a05:6000:4287:b0:3ec:db87:e9d2 with SMTP id
 ffacd0b85a97d-3ecdfa4d33bmr1584015f8f.44.1758100986681; 
 Wed, 17 Sep 2025 02:23:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e900d8f0e9sm16348063f8f.35.2025.09.17.02.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:23:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 2/5] drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
In-Reply-To: <20250912-improve-ssd130x-v1-2-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-2-bc9389ed299e@gmail.com>
Date: Wed, 17 Sep 2025 11:23:04 +0200
Message-ID: <871po5ph53.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wBQ4LR9JvbtmWUscHbBzVrGO6JAHAHY4WNmh94a4k14_1758100987
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

> To prevent log spam, convert all instances to the DRM-specific
> drm_WARN_ON_ONCE() macro. This ensures that a warning is emitted only
> the first time the condition is met for a given device instance, which
> is the desired behavior within the graphics subsystem.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

