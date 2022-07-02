Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFA563FE2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8383610E2FB;
	Sat,  2 Jul 2022 11:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ADC1132FA
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QljAW1wpF5LQ6Lppj4LbpD/NKcPDm0Kt2W7p8Nse1Y=;
 b=UFMTu9ACPN2ZUNQLOzOzdFYCwFIKHwHN0LCLv54quqUDlqH6clvJlaC/327B1VX8z4zyW0
 3BpVTT+LYz44mG0Eg3rgznyVMcbDD5X4OyxXfPr4MV06hMC16P7bh2wGD14/G7TvzqLxE8
 M2ZJKn3Psab3pVfSV6tiTf0/3XySD4o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-ami2AwnbP4ipGK5F8LbuTA-1; Sat, 02 Jul 2022 07:49:18 -0400
X-MC-Unique: ami2AwnbP4ipGK5F8LbuTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so2639576wms.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QljAW1wpF5LQ6Lppj4LbpD/NKcPDm0Kt2W7p8Nse1Y=;
 b=siOUCWRI4PR7jilBVrJOzSrW9Yp+q80puTsDMjZ+KeoMDfvapnYJXyyivRZlAHG+h7
 kFLBrVbw1JLi72yRK6GkAZxPI44EFR4WM52s7JYVWliVVtY4zjYLnzMbIj5t4G1Pqjsw
 iVDf4boIjx/pYFc8qJM54+iX9eeOkHuwVHt8RP7E6T9bk/cpOU+Ac6sXXwqtOQWluJvn
 WFW4zLh7dNyva7BxQsRnJqgk9lkQGmMQd+w8IMy01vIuNC3HlvFibO/yCAxuflvvihbf
 J90fXDOB1jT7/o1yOS2Yj6PIEiul0UY+ufUMnLpwz7w2a7IKqhFSezSj6Gy6Hwp7GCVF
 qGJg==
X-Gm-Message-State: AJIora+Tf94HNiFwmvuMiAtcnt2pJzBRKtRXxCrme2GR8QW29ghJCkM5
 NxkQI+UhtW5/21/txMjFCaqM1tMjWTaIwsLO6sOuPjnO7mbjNKQRuIsOZu6qqVGtGzDcG1LGFCP
 jioH+Da4iELBdfjoApabUBiTkq2GM
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr23130309wmc.30.1656762556857; 
 Sat, 02 Jul 2022 04:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uL6HCPra+ZwxL9odjC4yxV6gp1l0uanbnl1D0jTwoMGNi5QU3bPL4RKfaaq5orx/y4BlNXNw==
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr23130289wmc.30.1656762556606; 
 Sat, 02 Jul 2022 04:49:16 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m17-20020adfe0d1000000b0021b866397a7sm25369955wri.1.2022.07.02.04.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:49:16 -0700 (PDT)
Message-ID: <a32a8720-f2e3-c80e-3ece-4822e9088254@redhat.com>
Date: Sat, 2 Jul 2022 13:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 7/9] drm: selftest: convert drm_framebuffer selftest to
 KUnit
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
 <20220630004611.114441-8-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-8-maira.canal@usp.br>
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
> DRM framebuffer selftest to the KUnit API.
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

