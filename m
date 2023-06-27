Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614173F991
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7A910E2D5;
	Tue, 27 Jun 2023 10:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FAB10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687860179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZ9epXWZEZlabn7h4ZqVHrVA3iMxyMBvBGddL9c0ZJY=;
 b=fJSP6jw8PlAfQ6Otr702q0kYdd5xu7uvhNmjBROTrmf9zThYaThdWljARmAVSFfKAFVzjV
 wi0u9XQ9P/gqlQ6I/rCODjv24Sv2oQq2g6lwbdGFGDRadYM8FzSOmIiG2A+bT5sS+HHwGY
 dJKqnORpoo26ucToAN6XJBVeIn813sU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-z0zMEXWeO9-02zkt48fzew-1; Tue, 27 Jun 2023 06:02:57 -0400
X-MC-Unique: z0zMEXWeO9-02zkt48fzew-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31286355338so2442699f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687860176; x=1690452176;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ9epXWZEZlabn7h4ZqVHrVA3iMxyMBvBGddL9c0ZJY=;
 b=YOvLLq9PiSx6wbZ0hzkZESJ+hAkv/GHEqBjT5Che3HJd2vxAHHlWm43qxYFwPe1b8j
 hiMumMw46YkhalvacP5RCBUkvZBrB1eEAghvm0C7iUauplmY65dWq39lNjo2AtHr/oGL
 Dxgwq/szgo7uy8XzmDt9LJYENfL45/LY1VNG+ZXeFqwatDefj5/SajiPofY10/Ap1iwQ
 j+lHann42NbHKy3aWKABNP8qa/O5j2GGQMuPFcmUTYTSxh+KwiMpU1jlFBiwdpbbdKGp
 rYq+EIvCAL2dfqWH/7WytbfOZlKruEyaoQKH5WjEjxkT/Z27IuxtmEhQF5PZFs57wiHo
 /x8g==
X-Gm-Message-State: AC+VfDxLOqmwuJ8jqMRQNV1O9nmEu/TgOfp0Lu/Kv31MnAtPTvVvOOhB
 Hrl8uaqTLqzthHoZpsdP5xEaThDgcAZx5b3IUTYTTdr7LNuj1/Q+clslmJoLMCkPyPn/45u76Z5
 f68f3NVKz25cQXnTlLAVI/YCQnK9S
X-Received: by 2002:a7b:c388:0:b0:3fb:a46c:7eac with SMTP id
 s8-20020a7bc388000000b003fba46c7eacmr1117443wmj.7.1687860176365; 
 Tue, 27 Jun 2023 03:02:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VF/tI1kxxaelpLpijtHYrlpJll9VMrGoGXNuzX544+t1vdWAGL6TmOJJWgnXl/1XWXxMAgQ==
X-Received: by 2002:a7b:c388:0:b0:3fb:a46c:7eac with SMTP id
 s8-20020a7bc388000000b003fba46c7eacmr1117424wmj.7.1687860176056; 
 Tue, 27 Jun 2023 03:02:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfe54d000000b00313ee3e50c7sm6686565wrm.97.2023.06.27.03.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:02:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
In-Reply-To: <20230627035839.496399-6-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-6-zack@kde.org>
Date: Tue, 27 Jun 2023 12:02:33 +0200
Message-ID: <87r0px2pfq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>, banackm@vmware.com,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Port the legacy kms hotspot handling to the new properties
> on cursor planes.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

