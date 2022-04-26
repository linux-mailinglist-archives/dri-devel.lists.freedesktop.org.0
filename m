Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C690510AFF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 23:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40AA10E11E;
	Tue, 26 Apr 2022 21:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82BA10E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 21:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651007426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1xUmUaJR9nVwa8kwrC84DvO0esO5yMuCRE+UvNdUm4=;
 b=f4rjVlR1lhbFcihgHttVrTaFqA0KWM6rsZm0Ork80H4kas/Q/gy6/GRxEMoD577XSsAXu6
 EHh36VgL0GewVhjQXv8YitPCc2UYRa9MEoQuF+qUsX01syanjiNl6Nfq7w5sH0wJEc7+9T
 o0LCOTcdb4NgV1Cuf07lJEKp/UPnp/M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-f0Ljktx7MW6l2GwVbbQOOQ-1; Tue, 26 Apr 2022 17:10:25 -0400
X-MC-Unique: f0Ljktx7MW6l2GwVbbQOOQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso15759285qvb.15
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 14:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=d1xUmUaJR9nVwa8kwrC84DvO0esO5yMuCRE+UvNdUm4=;
 b=2D04p7fN45X3kfaZVzP2YHwf5hl5fsRBV8Uyc7p0cqNxlYrtc9TSCvTqPUFkZQnzXf
 neUezSYVR9fUPA20AN8XPb6pn5T6AD8mZzSxnnOlF64A0ucZ/lGFzQp3D1zops3YiVLN
 iBhzKXMHLzFf+YQixPA2bUx83E2MixDP95TWfKe5FkVoq7Rr3eU+Oi91Q0DxjtBsm8qk
 TJAcO0G8Fg1Vj+Fzu8g4333F18rIN1da6F/R5/ugVqnrEGGUbOVUxeKcqL6voZjUhayy
 eSPJ+/qJrm6pw869c+CXCAGTyGhDf4mJHVQVEFFPSzTDasesal3EdSfe42cJwL6wFRr+
 U/5A==
X-Gm-Message-State: AOAM5307LWR3Q4y9/bI4CcCcmwYkjNoTAFolaewqYJodGWLm7kpgAi3d
 oo/ll9LromJQ/NQN38eDJvGW6r9WNhGu6xQTqUe4b535MyfCKW88KzuFYNevTOIuraL7tEwCqzU
 5S5kgJmXKcmTC8Ig4XJGWF1D3/jwe
X-Received: by 2002:a0c:ab02:0:b0:443:a395:cc1c with SMTP id
 h2-20020a0cab02000000b00443a395cc1cmr18111030qvb.72.1651007425055; 
 Tue, 26 Apr 2022 14:10:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi3A2T7MWR5Ov5/naHijo/ad6sFHiC9WiLTVH6XaNlzZBPk9plxzH7h4pZkYSw6LXk2YZGYA==
X-Received: by 2002:a0c:ab02:0:b0:443:a395:cc1c with SMTP id
 h2-20020a0cab02000000b00443a395cc1cmr18111015qvb.72.1651007424883; 
 Tue, 26 Apr 2022 14:10:24 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 22-20020ac85916000000b002f3402e34a3sm9049212qty.55.2022.04.26.14.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 14:10:24 -0700 (PDT)
Message-ID: <cfc9bb52f5128ae35287da478ad88ddd9c8de5e7.camel@redhat.com>
Subject: Re: [PATCH 0/4] mgag200: Improve damage handling
From: Lyude Paul <lyude@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Date: Tue, 26 Apr 2022 17:10:22 -0400
In-Reply-To: <20220426164108.1051295-1-jfalempe@redhat.com>
References: <20220426164108.1051295-1-jfalempe@redhat.com>
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice work! For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will probably let it sit on the ML for a little bit just to make sure that
Thomas gets a chance to look at this

On Tue, 2022-04-26 at 18:41 +0200, Jocelyn Falempe wrote:
> This series improves the damage handling on Matrox gpu, and allows
> Gnome/Wayland to run much better.
> Also include some driver cleanup.
> 
> Tested on a Dell T310 with Matrox MGA G200eW WPCM450 (rev 0a)
> 
> Thanks,
> 
> Jocelyn Falempe (4):
>   mgag200: Add FB_DAMAGE_CLIPS support
>   mgag200: Optimize damage clips
>   mgag200: remove unused flag
>   mgag200: remove mgag200_probe_vram()
> 
>  drivers/gpu/drm/mgag200/mgag200_drv.c  |  3 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  3 --
>  drivers/gpu/drm/mgag200/mgag200_mm.c   | 50 ++++----------------------
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 17 ++++++---
>  4 files changed, 20 insertions(+), 53 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

