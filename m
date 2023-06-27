Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C673F903
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7468E10E2C6;
	Tue, 27 Jun 2023 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686CB10E2C6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687859384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDMolGe46QplsEcZcMLMBcT9vux9Sa9bWofnaqJ12E0=;
 b=b1wv7ulhveUIdycSkbM58hKYejIUQFFlFQ/g5ZWW+j4+DDth/94vU0ZsY1jG/NtNlf1oXq
 TIDOzP2u1kz1L/o0+oRwVb4FI7+Y5jDdV+KbLK++ADh8MSLTFNglm62/7Q5Tbb8/PIm1zX
 O2hHIi3kyvv8NiSmvDQma8mqcJNcHfw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-ICH1HFqcNJWUMxp2ha2SxQ-1; Tue, 27 Jun 2023 05:49:43 -0400
X-MC-Unique: ICH1HFqcNJWUMxp2ha2SxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa979d0c32so8784055e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 02:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687859382; x=1690451382;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDMolGe46QplsEcZcMLMBcT9vux9Sa9bWofnaqJ12E0=;
 b=M2uA6OqDJkoWgvJcAYFTwXN5cqJDVWn8HAvQW+E8UmZnAPXcubTO92FDzpwZuALU2J
 t7xwDC2SDY1yTLdKnwyHBf1CfhbX1dha/UPSprffIeD53wsJNURau/zj4euYhTw08p/E
 t2i2pcaeSA54eR2IuEjD86Ov01ISHuFodB6TqLqJN4ETr067sToV9o29/o/IuzR1hHFQ
 8lo/jmaHnK3gyMJAguptmY3KgrAcwcsFPWJn2ersMyDw/bXuDUcer1suZh5q21OPYlZd
 3zupOv+PNy4Z2v/foxZifUvHODFH+5w7kIuYSaj7AXSyjneC4VGCxzIgWp1cAi9PE+sH
 l8vw==
X-Gm-Message-State: AC+VfDyvWNbpoqgIwb4R7T/lH/ysKLvPXLvNx2ilQ/GumhyOddoOdFYm
 w80DFYADYrWJG3mMvT/kKsAfc5S+0agJeQz8GsNVK9HMvwaO12xIO5qigikQBwlsJjikMdRvzfl
 r56RibQs2jhi/tTOTbFE7L2ahSasJ
X-Received: by 2002:a7b:c017:0:b0:3f5:ffe3:46a7 with SMTP id
 c23-20020a7bc017000000b003f5ffe346a7mr21876452wmb.9.1687859381980; 
 Tue, 27 Jun 2023 02:49:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vuBaSKrN7CLXVhG/j2ShVD0xFqKIjcxNBdS8rtrCbm0XIH4dz4kZ8aHrZyUcS4dq8vGb0ww==
X-Received: by 2002:a7b:c017:0:b0:3f5:ffe3:46a7 with SMTP id
 c23-20020a7bc017000000b003f5ffe346a7mr21876446wmb.9.1687859381683; 
 Tue, 27 Jun 2023 02:49:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003fba92fad35sm425821wmj.26.2023.06.27.02.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 02:49:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/8] drm/vmwgfx: Use the hotspot properties from
 cursor planes
In-Reply-To: <20230627035839.496399-4-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-4-zack@kde.org>
Date: Tue, 27 Jun 2023 11:49:39 +0200
Message-ID: <87wmzp2q18.fsf@minerva.mail-host-address-is-not-set>
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
Cc: krastevm@vmware.com, ppaalanen@gmail.com, iforbes@vmware.com,
 mombasawalam@vmware.com, banackm@vmware.com
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
> Cc: Martin Krastev <krastevm@vmware.com>
> Cc: Maaz Mombasawala <mombasawalam@vmware.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

