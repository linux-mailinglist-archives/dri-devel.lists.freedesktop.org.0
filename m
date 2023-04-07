Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E66DAB29
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 12:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF02C10E2BF;
	Fri,  7 Apr 2023 10:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E498310EDAA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680861601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
 b=b55S+Cg5V0i28P9GrB6V5udzxBKUGFndWawpcIzht83qM4FSaakwDsXBgk4XVvtG9GsYQL
 k9uEPc8V04uPJUEqsAWtK9vMBKv0YcoNS4kLxGNpm6i6P707OJPj8NngdyzL8S2V1HKTJ7
 V/+6lU9JmNJJAUaiUl0lhLeCEA80+qw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Eze2Hvo1P0CNkH2FVRzv6Q-1; Fri, 07 Apr 2023 06:00:00 -0400
X-MC-Unique: Eze2Hvo1P0CNkH2FVRzv6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n36-20020a05600c502400b003ee93fac4a9so309186wmr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 03:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680861599;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
 b=da/N2lsPVztfZ5KoAVfQTn7zcjr36OxAxELotlcW3LAZi98aPgiYrpuPZhIFkzbJsI
 DTnyKwr6l1DIZEK1XMCpd7dwBsQihRWS/kynZg2msqYhiyIBTpDt8BJoSL60xTw8c5aY
 RQCZxsBnGskDHo6DNu57W+ysU6LSya6cqaJP9kelFnT278taOTDIqGT2b6FsfH/KpfZI
 GV0FD9f5ICBKCPOKaaViu2rcbpU98+PblF9fexEDYzPOvSEFVOWnLeZc4N+1NFAKqZaY
 cFoRMcGYPqGO1OOCnfzTsA3jiici60ueHdArg6Zn6BXmv6hsietZCST5jeqvwaQumS7u
 6Axg==
X-Gm-Message-State: AAQBX9flZJRYZbWjYOf0lqT7LE9dcOigpgnOqbNUd51990Hkdx2SVAsG
 1xznTgZQ6vQW9m0NybYiSmgWEr6u2GY1X7m4EmSZt+/tqoCgzdEyRtKDwzOgqDwJxmYrxu7wo9q
 KtipLuwEcWR8arpQGLB35xDOWTi+g
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id
 z17-20020a7bc7d1000000b003eb38b0e757mr1043866wmk.10.1680861599791; 
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAbkcTuKHHx1PTF9JjuVOy7h+gk03bYHMX2Dd+d/sWYJgdy2EcgK92+pjvlc6XSCkqiq+Z6Q==
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id
 z17-20020a7bc7d1000000b003eb38b0e757mr1043856wmk.10.1680861599506; 
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b002e40d124460sm4075512wro.97.2023.04.07.02.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
In-Reply-To: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
References: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
Date: Fri, 07 Apr 2023 11:59:58 +0200
Message-ID: <87355c8129.fsf@minerva.mail-host-address-is-not-set>
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Sparse reports plenty of warnings against the a6xx code because of
> a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
> defined as __iomem pointers rather than pointers to __iomem memory.
> Correct the __iomem attribute.
>
> Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

