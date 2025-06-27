Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C9AEB239
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDB010E070;
	Fri, 27 Jun 2025 09:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HL+SYS+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03B10E070
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751015459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mUC4ot/biTlOA3flAzZtM+HH2WgND0ss9Osu67FHk8w=;
 b=HL+SYS+RTTjzW65oCPrK1xsWSLgXQMIYo4Yp61bNyyBdfyzhczLVp5qmH90LpnJBJRm91W
 +KXraU7ukMTnC1Op0IIswVHcJ7mwCfSBaLNFD5pUZLXmGKBJIgdE4rAoPxDXxiW4LMg7pD
 M6H3AJ/s7L/n9Lw7xMI204Fu6wmP11E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-wCw4urYiMraeTATEm1YfDA-1; Fri, 27 Jun 2025 05:10:56 -0400
X-MC-Unique: wCw4urYiMraeTATEm1YfDA-1
X-Mimecast-MFC-AGG-ID: wCw4urYiMraeTATEm1YfDA_1751015455
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4538f375e86so4146755e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751015455; x=1751620255;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUC4ot/biTlOA3flAzZtM+HH2WgND0ss9Osu67FHk8w=;
 b=M9AZdwAkkwHm6KrU1JEUHZWv+ufMx6G571d2bv+QQs7lPci3erfMoEFSro6VhZMpF5
 CaDXOvukqdaHfi4gkSklxKqFEMg2PiQuVo+19TFPs1A+pOocQ6y1q+fVn0wKdRbsRIO3
 oCUDXOhraqmgu9qsrxFRbWAAD3bWIU6AwzOmqGKozh1m/a5MZoTm10xqvz7a5iFMxqst
 piJTRV0wCkzxYIPHnAOi4lZDltfjj97dr1I/nXZoZb/cXKLGGLoGoTSS7NURdp0Q7H2d
 wuaTQPNlVfIZENjl6WfAmkxf6+53B/8xbo/P492GbCQuCJqWLHAmRQW4fQmToH5jVIdt
 sn8Q==
X-Gm-Message-State: AOJu0YyHT2K3eni98V9BO7daySuJYVeL8vxJqlua/Lj/dm1kabNw9fut
 d6YZvkb57WWa/KK9gv3RY+fLFDKpuZvYaIrjXmqt0+2hMSckNaxh9sEzcSCinkWZOyaMfhD8L8V
 3aDKpwVKJu27GffSsXIg61X/kuX58YQVu59yaozJvbl9UboQGzEBKeGBNz5h4CTFINImftw==
X-Gm-Gg: ASbGncuoiple/KfRYx3y1I4JuXt/2waVqs0Z55Erl5xgnrOOpOtIdPbed+IpmbbtSD2
 KkV1MLun4MuDvVc6i5E+zZxBZyTU8Lp7IXRQJZ8jEMcxVT6v8J8LtO3c6YFZyuVdGIfxXqpDiWx
 goJ6IwR1/V2p0wUE00BFjqBPxRJHJTtTpbVipRr9u2o6F0lbaWF6dtJqMa6INu01sL+rM3fgUWT
 jKexahXEnTsgk1iddBiyKgJRaAO/g4LLFv/tjaeAr4ZN1YIUfY4Bl0QJ/QH3k+y5Bouvgp7+96Q
 8AnK8oHighWm3DJz/U2bsG1ai87G9y27LSfqdUEwPPR6ezZk4Wf+/pMxRF6DxPr0tmJ5PUOlTO0
 XlxRY
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id
 5b1f17b1804b1-4538ee55a30mr23815225e9.16.1751015455335; 
 Fri, 27 Jun 2025 02:10:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ7MaK0HmuWyyuY3zMxmw4kpnQSfAZcXQCqQyG9nCH8ffS6eu1mWyaOP2gY64R2TPU1aKhZA==
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id
 5b1f17b1804b1-4538ee55a30mr23814955e9.16.1751015454908; 
 Fri, 27 Jun 2025 02:10:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538f2fec5fsm18153555e9.40.2025.06.27.02.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:10:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 3/5] drm/panel: panel-simple: Make panel_simple_probe
 return its panel
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-3-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-3-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:10:53 +0200
Message-ID: <875xghczxe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 86JSqunah-7LI5UJnTzHF3AsuzLUlUp37fCXgkJAnPg_1751015455
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> In order to fix the regession introduced by commit de04bb0089a9
> ("drm/panel/panel-simple: Use the new allocation in place of
> devm_kzalloc()"), we need to move the panel_desc lookup into the common
> panel_simple_probe() function.
>
> There's two callers for that function, the probe implementations of the
> platform and MIPI-DSI drivers panel-simple implements.
>
> The MIPI-DSI driver's probe will need to access the current panel_desc
> to initialize properly, which won't be possible anymore if we make that
> lookup in panel_simple_probe().
>
> However, we can make panel_simple_probe() return the initialized
> panel_simple structure it allocated, which will contain a pointer to the
> associated panel_desc in its desc field.
>
> This doesn't fix de04bb0089a9 ("drm/panel/panel-simple: Use the new
> allocation in place of devm_kzalloc()") still, but makes progress
> towards that goal.
>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

[...]

> -static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> +static struct panel_simple *panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  {

[...]

>  
>  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>  	if (ddc) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
>  
>  		if (!panel->ddc)
> -			return -EPROBE_DEFER;
> +			return ERR_PTR(-EPROBE_DEFER);

Not related with your patch, but it would be great to also add a
dev_err_probe() here to record the reason of this probe deferral.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

