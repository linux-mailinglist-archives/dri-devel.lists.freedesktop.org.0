Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C27563FD0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445C12BAED;
	Sat,  2 Jul 2022 11:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC922BA9A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbzjeP733JJcvTiFZgcVN9MLGyXZoHJ3An9xaE9Mer0=;
 b=IY8dqthGRmYre1Y4W7Sp9QSypJh2QhGu3ScRfwggBQ0IGOGWRgdzS5sR0uHOdGm1pudPJq
 BD8L2x5PGWzI4+69do8kNdr8CVzsSR4R6PGJL5TXM9Y6RTBJjpvDUkoDtGq23dW7HXRoWO
 WQW7f1lPozQs+TigX/jUQtWUUfjftac=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-nVBm_M-RM7id_DfzUTj3hg-1; Sat, 02 Jul 2022 07:43:31 -0400
X-MC-Unique: nVBm_M-RM7id_DfzUTj3hg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso2627123wms.9
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PbzjeP733JJcvTiFZgcVN9MLGyXZoHJ3An9xaE9Mer0=;
 b=xob1CRCrOD/JDxylW+0nRgT78AceJaMsRbezH6hhfbCPHn2QkChcy0siVZE9H8CpT5
 GTQzFEeDtgfIRQRfCKyX3l6aYVNpZANrnL65wyESdxVca0PYIOwfepDIAfDmeSjTKcgS
 9+AUAdbJjrRSrBo6lxJITPnLhmiOLc7zIssiN/BPx0hUoEYllkZnv3sjdCK1C9kyjl+B
 GHMjzeSy+GUvOyesqVpf2XfvD1hIEsnQ4ZWSzvqniqYtgvP/wfK/8GPPW/cwRdDeL9Tf
 DmVdNQVYlNx8ADRn8+/gsi+uvwTH6JTdkzHoZlip0JN1AZ/GWZyetJJWk7kGfnjCEbtt
 5+3Q==
X-Gm-Message-State: AJIora9XRFMTcocJal7JvNKBp7Bp5xyvSGRsFXpzFwhxUMHxSemzj4kf
 6BKMwRSvyy832czB7fixwppqH+NnXoDiDB8VPmbXQizFHv41MDXBlAOKpF9AhvJW9eSjE/QOFSJ
 NdPLzNQ3TXU6ZKzfLOGnSoVGLE5mB
X-Received: by 2002:a05:600c:4fcc:b0:3a1:987c:82c9 with SMTP id
 o12-20020a05600c4fcc00b003a1987c82c9mr1512531wmq.73.1656762209861; 
 Sat, 02 Jul 2022 04:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQcHugUEZ9KO1/nr+/RF7l5XX6tPDRbcp0l1WhZlrP6E+q6SRGmu/furjWiHWsdioaZ4tj0Q==
X-Received: by 2002:a05:600c:4fcc:b0:3a1:987c:82c9 with SMTP id
 o12-20020a05600c4fcc00b003a1987c82c9mr1512497wmq.73.1656762209598; 
 Sat, 02 Jul 2022 04:43:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003a03e63e428sm12286686wms.36.2022.07.02.04.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:43:29 -0700 (PDT)
Message-ID: <b6ea63c2-afa0-6310-dcbb-0ca29c864963@redhat.com>
Date: Sat, 2 Jul 2022 13:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/9] drm: selftest: convert drm_format selftest to KUnit
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220630004611.114441-1-maira.canal@usp.br>
 <20220630004611.114441-5-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-5-maira.canal@usp.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM format selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

