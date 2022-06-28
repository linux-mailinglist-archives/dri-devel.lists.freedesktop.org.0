Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F455F19B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 00:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00416112737;
	Tue, 28 Jun 2022 22:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C59112737
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656456701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyl/HZb3SI8HFuQLBD60pevZNI/Uhf0WHtxfzC/4dus=;
 b=RW/8D/AwKM6KpiCwyg2vht2Gu+z7nuH4XybF53RZ4fuOSo5I+ejlPyNvQnl9O5XHFJ/G2W
 vq/Za6WF1KiScqfqYHyQ/jA5i1qK2VqnjgmSx6SjgOHXV0rm7v2zhLmDVU8i4P4zxXhmR0
 PpXCD4NdXPIwOANXJ1nHAqTtWr5MvSo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-d5oUO6FZMxKJqGlE56Wkkw-1; Tue, 28 Jun 2022 18:51:39 -0400
X-MC-Unique: d5oUO6FZMxKJqGlE56Wkkw-1
Received: by mail-qv1-f71.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so13747940qvs.16
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 15:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oyl/HZb3SI8HFuQLBD60pevZNI/Uhf0WHtxfzC/4dus=;
 b=0EO6JFViDgrzozjDPk/Mv/YUhVJWrYbdyGtgj+YRSxJOZpKsxUi5bCxhvupJf1e5Uc
 nDWB8MwpCM4ryI7SSqM519OkAJTEss6aiKYpGCy/kRmK09IuOH7f0Zq2iv0shveUSe2B
 oxLK//13YWY4g9Uh9hijHFllQJAPMrYSOKc5FMJiXqCXdKHrijHo2I2Mk3qbPg6foJ4A
 /UNQGu/qo+s/16q9oP4pGri/+ZRKwA5BLQet2xH0wNUaPenl3eL6LUHnVc7EXEqJ5cXB
 QMzDnZ89OFIf7kHAKrykNSxc7PhpBFULbIvo6gcaMuXhkgHqEpxJqC27qTpdEx7Cp6hh
 g5Dg==
X-Gm-Message-State: AJIora/27DJj5MZGwzeflOhN1V+ikZdnTlf6Lm1CMdYrXvRX3gxptXxU
 E2jEhJ4jzC2JQm3HJ0ka808xjIuNoAp1sunO6rhLbFwGBSX3/zNA3S2QAnZRA83ZtuNj5xY52Id
 6ldZTeNHGliJZYk+aNFPBiShZbhxU
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr5547802qvb.103.1656456699045; 
 Tue, 28 Jun 2022 15:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udyDEQwXavpJIYVRyrsdyEvotjuTUkOt6UvxlkbJ5gGTgtNxqyAFCyPEfK8HrsRHYsZtNJUg==
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr5547782qvb.103.1656456698661; 
 Tue, 28 Jun 2022 15:51:38 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a05622a121200b002f90a33c78csm10673903qtx.67.2022.06.28.15.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 15:51:38 -0700 (PDT)
Message-ID: <a9b1cc1bdc9830a6fd368c87fd514c7e560139f0.camel@redhat.com>
Subject: Re: [PATCH] gpu: drm: selftests: drop unexpected word 'for' in
 comments
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 28 Jun 2022 18:51:36 -0400
In-Reply-To: <1bce93a46a6ff3ec5b228ea390ba7257f4512480.camel@redhat.com>
References: <20220623100632.27056-1-jiangjian@cdjrlc.com>
 <1f196235b92e4123ce171980dd7bdbfe9bb0e055.camel@redhat.com>
 <1bce93a46a6ff3ec5b228ea390ba7257f4512480.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, jose.exposito89@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh-it's back up now! will push now :)

On Tue, 2022-06-28 at 17:35 -0400, Lyude Paul wrote:
> …ah, I totally forgot that gitlab happens to be down right now which part of
> the DRM maintainer scripts rely on - so I can't actually push this patch
> upstream right away. I will set this email as unread so hopefully I don't
> lose
> track of this, but please feel free to ping me if I do end up forgetting.
> 
> On Tue, 2022-06-28 at 17:32 -0400, Lyude Paul wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Going to change the name of the patch slightly so it's more obvious this
> > is
> > just about the MST selftests
> > 
> > On Thu, 2022-06-23 at 18:06 +0800, Jiang Jian wrote:
> > > there is an unexpected word 'for' in the comments that need to be
> > > dropped
> > > 
> > > file - ./drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > > line - 3
> > > 
> > > * Test cases for for the DRM DP MST helpers
> > > 
> > > changed to:
> > > 
> > > * Test cases for the DRM DP MST helpers
> > > 
> > > Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> > > ---
> > >  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > > b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > > index 967c52150b67..4caa9be900ac 100644
> > > --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > > +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: GPL-2.0-only
> > >  /*
> > > - * Test cases for for the DRM DP MST helpers
> > > + * Test cases for the DRM DP MST helpers
> > >   */
> > >  
> > >  #define PREFIX_STR "[drm_dp_mst_helper]"
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

