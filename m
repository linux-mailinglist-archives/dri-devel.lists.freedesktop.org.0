Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D70758F9D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499AE10E40C;
	Wed, 19 Jul 2023 07:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A410E40C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689753212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ymq+ZIyupFmiQKCd4p/A5S41PdGXMNvtqQQqokZ7xU=;
 b=UvsLq5U3+rW0psD6tg1eIFZV3MZLcM7iSo7ZaRqFk9PshIl8xdk30+GtPYHrQdzAcdRy8p
 4ys9NITsFQ9AEjnGHCn/A+h1x+zMLi2F4nWabs11C2UwlRP7X1IUJa5XAVX8nRXoKhk7ut
 LIt7rdd8eTDOCPE60LIp2SlFp5hbMQk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-190FC0jXOXarrcZynCUkdQ-1; Wed, 19 Jul 2023 03:53:31 -0400
X-MC-Unique: 190FC0jXOXarrcZynCUkdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbdd5d09b8so41274665e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 00:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689753210; x=1690358010;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ymq+ZIyupFmiQKCd4p/A5S41PdGXMNvtqQQqokZ7xU=;
 b=URenNLjYzJjJgY70G2trLjhb8cb/8xoLs0JDuaS1lPKtDR6f7qOz6eZAucZI3FPnLd
 Cn/urlJBsXYOsi6ZDSNywIZhDjIZSrTIlfCqwfHtW4M1FzW8koGLwaFVtuDeCzjJ97vy
 p89OxO381dvxqVv8MtPstI1xO2uoAuon/HuVao54Uw+AXrjZ2oiSEMskHljF0a4xhxTM
 iduunriHvuyzCSS72dNKj4glaVCFAFWkplqjuV8d9UM6Jay995TKAeJf7alH9zAiyjtF
 PzPmLRZOEOAafTMhKxG87v/ZjhoOLjXOtGdxLB41vxaljHQqTnBpI4r8Mrd9mnOBz7jy
 x/2A==
X-Gm-Message-State: ABy/qLY9YeBwEeDIPEaB4F39tb1nq9g7pIyHjAr9cI3h6zrq3xWDFhLR
 pPLv3+8M1+1WcLj29x3hr4td/j0tn4p4/904VM+Iaug8VMNxEKAP7lud0Bw14xpr7ctxE7bgmRq
 wzb3n9C8fuWKxsqL8dK8Xog2Mtrp33A6rLiBp
X-Received: by 2002:a05:600c:ac9:b0:3fc:5606:c243 with SMTP id
 c9-20020a05600c0ac900b003fc5606c243mr3730547wmr.13.1689753210098; 
 Wed, 19 Jul 2023 00:53:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHHbnZDQkFP3+k7SInhxUMujzhA9QVNpdaE1Idu3jqio84iit4UcaiHDntAC4a6/aMVJVB8Lg==
X-Received: by 2002:a05:600c:ac9:b0:3fc:5606:c243 with SMTP id
 c9-20020a05600c0ac900b003fc5606c243mr3730535wmr.13.1689753209818; 
 Wed, 19 Jul 2023 00:53:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bc5d3000000b003fc02e8ea68sm1038264wmk.13.2023.07.19.00.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 00:53:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <20230719014218.1700057-10-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org>
Date: Wed, 19 Jul 2023 09:53:28 +0200
Message-ID: <87r0p4ibgn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: banackm@vmware.com, krastevm@vmware.com, ppaalanen@gmail.com,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

Hello Zack,

> From: Michael Banack <banackm@vmware.com>
>
> To clarify the intent and reasoning behind the hotspot properties
> introduce userspace documentation that goes over cursor handling
> in para-virtualized environments.
>
> The documentation is generic enough to not special case for any
> specific hypervisor and should apply equally to all.
>

This is missing the S-o-B from Michael. But no need to resend I think, you
could just fixup that when applying the patch.

> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---

I think this documentation is great and it personaly closed some conceptual
gaps for me. Thanks a lot for that.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

