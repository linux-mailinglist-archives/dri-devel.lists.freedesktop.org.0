Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA255F067
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74557112D77;
	Tue, 28 Jun 2022 21:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7FC112DFF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656452154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAz+Ersm/fEoXHVd+3Jugkc8TnaRByQcUpDjv1kspq4=;
 b=FO5XjPQxDdOoWUXVA4Hr5+2DtyFlG1a9ZZXDkRJ8MUtWmGqRY6ZomgIPNfFL/cWsMlurYG
 PdC9NL78bajl1FRmBnWxQGh4QFA8fkZf/MV/U5vwWSf4vLT9AH11DVWbq1ApzZ/AmWaH7A
 bLoSKC6FUATI+3Ji497ZcR5QKAY4wIA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-6WGJVW37MNGY0WbN7jsj_A-1; Tue, 28 Jun 2022 17:35:53 -0400
X-MC-Unique: 6WGJVW37MNGY0WbN7jsj_A-1
Received: by mail-qv1-f71.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso13598443qvb.15
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=FAz+Ersm/fEoXHVd+3Jugkc8TnaRByQcUpDjv1kspq4=;
 b=dYD4jQ4SxEo84yFttCK7JkeaNl5CqEDCuCDIyDGGs3LXsnbzogbcj0BbhdIYvGJ54y
 kGMmuyOrFOPx1dGEIkKiM01jM9EAykc/1hXqf1XJw2dBKK8a6RKsx+896PVdfl/ACg3H
 hAsgKPut0BA3vu7fSCFWqi55LpKRG/nwcIfPMOo+tWFcMZTg1fu6jHVUsq78Xu1BfLCC
 H7iNymiWi5vq1mvnHZ5WO45SsLA4oZqgMaz65pm2Rsh4fB7Rn1rA4Yj2uQGuKHzfW3Dj
 WX1oyk+GN6EBEa4To5DL8ezHofItWDiLsu51V+aEZhPA3RRIRmCkqnspkVb2BEAWN8He
 qCJA==
X-Gm-Message-State: AJIora+EiUCQE8UjXKwki200gakDaiJJ+1Du1VzHXzTV0eSCjrfaqBVw
 k0942qkVYu/jPg9rLEdwGyNmmIrq9fIbutj8fLIWZkADk7t7kCJZqtHfXduGdYbnuM1KMi+3Ufz
 IoKUySDokTukDM6JCzJdPxeLGPxkE
X-Received: by 2002:a05:620a:2807:b0:6a6:6ef1:fb9d with SMTP id
 f7-20020a05620a280700b006a66ef1fb9dmr4354qkp.146.1656452152677; 
 Tue, 28 Jun 2022 14:35:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZoHh3YsNnPzx9FM3hTwLmyU9VU2X0ooJ/Q2yDYQ/e4IXAyqy8coVeXXF6BSXLjLjgmeSHEg==
X-Received: by 2002:a05:620a:2807:b0:6a6:6ef1:fb9d with SMTP id
 f7-20020a05620a280700b006a66ef1fb9dmr4324qkp.146.1656452152234; 
 Tue, 28 Jun 2022 14:35:52 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05620a245400b006a75e8d920bsm12794082qkn.88.2022.06.28.14.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:35:51 -0700 (PDT)
Message-ID: <1bce93a46a6ff3ec5b228ea390ba7257f4512480.camel@redhat.com>
Subject: Re: [PATCH] gpu: drm: selftests: drop unexpected word 'for' in
 comments
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 28 Jun 2022 17:35:50 -0400
In-Reply-To: <1f196235b92e4123ce171980dd7bdbfe9bb0e055.camel@redhat.com>
References: <20220623100632.27056-1-jiangjian@cdjrlc.com>
 <1f196235b92e4123ce171980dd7bdbfe9bb0e055.camel@redhat.com>
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

…ah, I totally forgot that gitlab happens to be down right now which part of
the DRM maintainer scripts rely on - so I can't actually push this patch
upstream right away. I will set this email as unread so hopefully I don't lose
track of this, but please feel free to ping me if I do end up forgetting.

On Tue, 2022-06-28 at 17:32 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Going to change the name of the patch slightly so it's more obvious this is
> just about the MST selftests
> 
> On Thu, 2022-06-23 at 18:06 +0800, Jiang Jian wrote:
> > there is an unexpected word 'for' in the comments that need to be dropped
> > 
> > file - ./drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > line - 3
> > 
> > * Test cases for for the DRM DP MST helpers
> > 
> > changed to:
> > 
> > * Test cases for the DRM DP MST helpers
> > 
> > Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> > ---
> >  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > index 967c52150b67..4caa9be900ac 100644
> > --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Test cases for for the DRM DP MST helpers
> > + * Test cases for the DRM DP MST helpers
> >   */
> >  
> >  #define PREFIX_STR "[drm_dp_mst_helper]"
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

