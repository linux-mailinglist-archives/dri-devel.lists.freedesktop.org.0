Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496951A5D9
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7377810F784;
	Wed,  4 May 2022 16:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DF910F651
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651682761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t24tg6/LveWdhoRmGGn+/iiJbZYvngbtfY/IYKt0y+w=;
 b=VL29w52OtSvR7zUBOgYEdRHnY24v12XXXUW3MpL2+vASV1uPWOnpFk+qp1DGeDWJmbu/Lu
 9xObUnHo2YQfNYUkPfuAnUrsdCMmJGoRC4wZPbkkEAMY6ppCNb+VdlZOZB6ZJrs4y0AqHs
 85ssDlUUIouFw2PNTqdC9yYU08cPeFE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-6cTarRw5N92NohV02EtN2Q-1; Wed, 04 May 2022 12:46:00 -0400
X-MC-Unique: 6cTarRw5N92NohV02EtN2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 w11-20020adf8bcb000000b0020c550ba8d7so567484wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t24tg6/LveWdhoRmGGn+/iiJbZYvngbtfY/IYKt0y+w=;
 b=bS+cImbhjvgtfFC705mNEayxbqbf4cuqLbY0usbnyRZRWHRcws+gZBHlGZin/qC1Y6
 8XljGtz+Vv4F1tCLb+zy0UYnC7v5gR8srvi+rRGfIKaI2OXbdY2xiw/9vUvcn2DuDBA8
 dfAu5ENRM6VTGbAxSmHITGYhYrC8k7n1nbC/4jkWi3pnfvVbUVfDyiY7Ko518o5EQsRY
 NHLW4LozJ/DgF+Cphzx68J78Phpr11kIrFdSaIHAP9kWymq12+fMcC02WXdE0kg4WFx1
 nyUxaPYuEOmDIbCSXl0YPXtJXLa6065Tc/zTqEJQwt3Q6UT5IbJkffMOOmL8zlO193TH
 0j6w==
X-Gm-Message-State: AOAM530qRkSukaTkZclD3oCQLmS5dAACtjNiJu8XET7Cif45lWMzLPOI
 9j3wLk4Qt9pSBKUeacme48PIWffR1OLHGacxPNqknim3/BGh8H7d5Bn9tcuNfv/91cymlA+uCRs
 q8zXkkRYuWfp4BfikTJTJeIpqXjhq
X-Received: by 2002:a5d:5707:0:b0:20a:c768:bc8 with SMTP id
 a7-20020a5d5707000000b0020ac7680bc8mr17217019wrv.565.1651682759574; 
 Wed, 04 May 2022 09:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoBEhaKvAsH6E5U+GUSakxLdWaK4c4jZF2naFOjXjnwL8n8hWZp8qeW7Mx6pNpMgWwSO5Z0Q==
X-Received: by 2002:a5d:5707:0:b0:20a:c768:bc8 with SMTP id
 a7-20020a5d5707000000b0020ac7680bc8mr17217006wrv.565.1651682759336; 
 Wed, 04 May 2022 09:45:59 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003942a244f4fsm4143450wmh.40.2022.05.04.09.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:45:59 -0700 (PDT)
Message-ID: <f48a0482-7be9-29d5-b179-e572dfac11fa@redhat.com>
Date: Wed, 4 May 2022 18:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the
 primary adapter"
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504134833.1672728-1-alexander.deucher@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alex,

On 5/4/22 15:48, Alex Deucher wrote:
> This reverts commit b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b.
> 
> This workaround is no longer necessary.  We have a better workaround
> in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)").
>

I would write this line instead as:

in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are
displays attached (v3)").
 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

