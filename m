Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA2663CCA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEB610E575;
	Tue, 10 Jan 2023 09:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C8610E575
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673342796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuNcw5SWJjsELAHtdMJ9OrTaUpcJL3h/bOH4/pKd/u8=;
 b=HS7a40ccnhBOSDZnjK/I9R4kdHyknwY3UX1smCG3wzyxL03CRh10Z0+9ku1+2Wb1TNaE87
 AaIaPBZUPtJDpx6wG8KekqRaBBJz3N2HH9EaAMgNQFHkFNnksGDHlB6XIgp5ChpbOb014p
 CqO+meMQ4Z0+WcMpeL+g287Iza0GJwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-nuTK_jVaOAyL5DdrrczNxA-1; Tue, 10 Jan 2023 04:26:35 -0500
X-MC-Unique: nuTK_jVaOAyL5DdrrczNxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v23-20020a05600c215700b003d9e9974a05so3786747wml.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BuNcw5SWJjsELAHtdMJ9OrTaUpcJL3h/bOH4/pKd/u8=;
 b=TiQoM64zTWJfh6exDe/O2Spz7TFRWRhoveMIWJX5mBeEXc3vfySm6GgUfouNyaBsBQ
 EWG7hTEQDCVC8RWuLXHJbQpVjBJAaU9QHGG83mGTlmFysoZ4JGgU7t5AaDUgD7v6ONz6
 TF0fqUIark//WUh18IErxvJGcFw/iCKqT1+N3BmGQPUn4hV4ZRpC2EdaQZl/JQiHN5PU
 fgCLICJw9z0hJaDILmEioHMqTOoK1ayH/ezBUVcbqC/fKz4bHqRkOmOoRinUzTycylp6
 l5g8FgQf+9LgSuQTe+ERmM8MWPACXWk93NByN9+WGlcjm0vx5U/Z45j562QTeTUnveRb
 wY/w==
X-Gm-Message-State: AFqh2kqQRmMs7/IHO30TEYZsqzily2Bv05FU14PAP5f/6qD4DUQnzei4
 6xy7Y6dfUJZaKMR85e4J9ojr3ArHITrd/sKKbFG09gTIwjnuR0cnT7lgmklh3OcqIsH3eoSaSy+
 /9JWJc+jrAmE8JCWLsvOgHW+8DwOw
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id
 bv20-20020a0560001f1400b002425a34fb7bmr43601846wrb.70.1673342793959; 
 Tue, 10 Jan 2023 01:26:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7s2tNT4DHD5yOumIsx0893Lyb4qC9TwuYSVzYsgmLQ/J0TWsVZqMUqSYrUANiM+0d9NpWiw==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id
 bv20-20020a0560001f1400b002425a34fb7bmr43601836wrb.70.1673342793739; 
 Tue, 10 Jan 2023 01:26:33 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002bb6b45ab57sm8761466wrm.85.2023.01.10.01.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 01:26:33 -0800 (PST)
Message-ID: <b404a675-a186-1253-e8ad-762461526594@redhat.com>
Date: Tue, 10 Jan 2023 10:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mxsfb: improve clk handling for axi clk
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200720153254.18071-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20200720153254.18071-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

On 7/20/20 17:32, Uwe Kleine-König wrote:
> Ignoring errors from devm_clk_get() is wrong. To handle not all platforms
> having an axi clk use devm_clk_get_optional() instead and do proper error
> handling.
> 
> Also the clk API handles NULL as a dummy clk (which is also returned by
> devm_clk_get_optional() if there is no clk) so there is no need to check
> for NULL before calling clk_prepare_enable() or its counter part.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

