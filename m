Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DF571C53
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA493D69;
	Tue, 12 Jul 2022 14:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3599354A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657635850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpPPaMxB6IyUiSQjmMliZXXQEteaEEZHAD8jA7VrypY=;
 b=ejHzLyMhldY2HupUfHra6up7egCXwLlvP7l/U5fdtc3MfnsnM2uNeVM1PV9tl1YXj71KtU
 GbNS/hZ67JPHhxH+8mc4il/35EJji2CNMLvwP4VC1+bIXD9cfHjU/wsWNoHvuJlIk0jFw2
 g0pGbAGtH1CBEN/yAZEi917cSz0E4aE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-rzQWbXY0NQih1JLiZ0EZyQ-1; Tue, 12 Jul 2022 10:24:09 -0400
X-MC-Unique: rzQWbXY0NQih1JLiZ0EZyQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so3048311edd.17
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VpPPaMxB6IyUiSQjmMliZXXQEteaEEZHAD8jA7VrypY=;
 b=UGLGaAptgaQKjCRppcvnow8ey1RcXnQlWliOswN74dJ4iaQ/ecdNoA8FnJSKGOJ4pd
 bcfJ/hynlHrzU0dj4WW2rZPGT1KgtM4N5gzwI22u72WcRRrYf4KtzHH6+1/o7hIWtPil
 0SKPmSfM1dgpJ4Oe4Sgs03x7V0J3Ey0wPEh7gvlIXRqUFTte4g2ofMTsoyKWVPqTkre2
 PAavX/W3KBWJfaOdVbhlRg5ohlir4OGo1qWo/4IKtF7EmqCdknXHJpBxeCoCuk6rsfHn
 Eksl9/A/4p0g89Sl7TC8ar8HHMakNPzNfQLMhA3bIilzQ/zK8EAHoEM1PlnXmCT1Eq8B
 iVEQ==
X-Gm-Message-State: AJIora8i353gApYRMp7ElJAWqUV5Pm4tD7PGSNAb5gAd8b/VmpKtSwpv
 yuQGYuHBcKRh/6fxc4stfkUHxZ6Xs+KLlVbpIYuG3r9vNhmwdoIewotwny22FS6NfTB9bqkaaD1
 7FpYCiYJcnno83QyQYy0DNKnqh/0p
X-Received: by 2002:a05:6402:27c8:b0:43a:f392:8fdd with SMTP id
 c8-20020a05640227c800b0043af3928fddmr2611173ede.328.1657635848767; 
 Tue, 12 Jul 2022 07:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4wQpjcVWwljO59+q92/Dr3RNmAg0cRGxfNUMtLSU00uxqRapRz78u14FG7PWyFrp5JBx+DQ==
X-Received: by 2002:a05:6402:27c8:b0:43a:f392:8fdd with SMTP id
 c8-20020a05640227c800b0043af3928fddmr2611156ede.328.1657635848623; 
 Tue, 12 Jul 2022 07:24:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709067c4400b00726abf9cd8esm3794533ejp.125.2022.07.12.07.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 07:24:08 -0700 (PDT)
Message-ID: <1c0cbab1-f920-3565-f326-189cbac56da0@redhat.com>
Date: Tue, 12 Jul 2022 16:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] drm: use idr_init_base() over idr_init() if
 applicable
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220701185303.284082-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 7/1/22 20:52, dakr@redhat.com wrote:
> From: Danilo Krummrich <dakr@redhat.com>
> 
> This patch series initializes IDRs with idr_init_base(&idr, 1) rather than
> idr_init(&idr) in case for the particular IDR no IDs < 1 are ever requested -
> this avoids unnecessary tree walks.
>
Guess this would go through drm-misc too?

- Danilo

> Danilo Krummrich (10):
>    drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
>    drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
>    drm: use idr_init_base() to initialize master->magic_map
>    drm: use idr_init_base() to initialize master->lessee_idr
>    drm: use idr_init_base() to initialize mode_config.object_idr
>    drm: use idr_init_base() to initialize mode_config.tile_idr
>    drm/sis: use idr_init_base() to initialize dev_priv->object_idr
>    drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
>    drm/via: use idr_init_base() to initialize dev_priv->object_idr
>    drm/todo: remove task for idr_init_base()
> 
>   Documentation/gpu/todo.rst              | 12 ------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>   drivers/gpu/drm/drm_auth.c              |  4 ++--
>   drivers/gpu/drm/drm_mode_config.c       |  4 ++--
>   drivers/gpu/drm/sis/sis_drv.c           |  2 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c       |  2 +-
>   drivers/gpu/drm/via/via_map.c           |  2 +-
>   8 files changed, 9 insertions(+), 21 deletions(-)
> 

