Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C876508D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A91910E217;
	Mon, 19 Dec 2022 08:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125D10E213
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2GUNp9aRPX3m7GTSyF3PSRJZCqqc/1SL0Z+/iGLies=;
 b=PJYB/P0HJB7Jlhq0ZvPL2fQzGn3gbFXRjDCt8cFAl45RJf+jpKjHOq3Bc+zFyaDFlCvX5C
 fnXnwvMLPC5NS0+whkaWwPLST4natu7SDvLX1DFjpjNTCkkDphfCDuKJWfGl/oTgN/Hn95
 titP1Pv3d++0MlN8HRph/ObjMhMCFmA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-u0jXTe9SNfaHZtk9JhiTxg-1; Mon, 19 Dec 2022 03:49:56 -0500
X-MC-Unique: u0jXTe9SNfaHZtk9JhiTxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so4893583wmh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 00:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2GUNp9aRPX3m7GTSyF3PSRJZCqqc/1SL0Z+/iGLies=;
 b=P+yLYmPGIOHxo1Iq7imddm0MqvzpSo0+GC/3Twr2OFmaH1RyESoh9tBIDNCv+N3dAt
 +krWaj4P25BG7VHOvtMHQWjJq34ULevhhYERw2uQLfhgpf+w9fiTQNRpEa68WiqA3zmx
 dw1prEpBbp3eOnwGkqn0GtUgvBJwppXN6u0sIQ+3mvjFpZqWzhUtsMN1KcW8IG2/svpj
 Nv0s9vlk40ph0kSC371oyEjdRaf/srm0fX65vtR4ICfHh6LVPT+uGsppMCNLal3tTPr/
 L2Q84nxkoaLzvYX6O10krKMxZ/Cs5OAk+I4+F50HqBXNenuADzgL0SQ/poCZQE30dqWy
 WXsw==
X-Gm-Message-State: ANoB5pmHpoA2C4fooloHeTPgY3wB0BEkzLdh+UhWYZQGj7efrYMKzfBw
 Qrc5nLhBz3JbXhK1lw7K8869pHn1Si6xsB7i0Q7XNvkdRP+1h6f7aj0ARndnAp4yEhhD6STC3df
 iBSYUYLk/MdKRnc23RiZKKr7XEjcn
X-Received: by 2002:a05:600c:3c9c:b0:3cf:497c:c4f5 with SMTP id
 bg28-20020a05600c3c9c00b003cf497cc4f5mr32228472wmb.13.1671439795531; 
 Mon, 19 Dec 2022 00:49:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71uAIN6ZfhvQ+gcywBCPRQ3+U/OGp9imSzLq4sZ/31lKdnUvpwi811RVoHnqvnWeGuNHxtNA==
X-Received: by 2002:a05:600c:3c9c:b0:3cf:497c:c4f5 with SMTP id
 bg28-20020a05600c3c9c00b003cf497cc4f5mr32228467wmb.13.1671439795360; 
 Mon, 19 Dec 2022 00:49:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c44c900b003d1e4f3ac8esm10896275wmo.33.2022.12.19.00.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:49:55 -0800 (PST)
Message-ID: <2e7b9b94-0ae8-d596-354f-3bf9a6c37e5a@redhat.com>
Date: Mon, 19 Dec 2022 09:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/vc4: dsi: Drop unused i2c include
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>
References: <20221219084023.1402282-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219084023.1402282-1-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 09:40, Uwe Kleine-König wrote:
> The driver doesn't make use of any symbol provided by <linux/i2c.h>. So
> drop the include.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

