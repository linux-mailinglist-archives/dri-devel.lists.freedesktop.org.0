Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6E8AEB08D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672A10E598;
	Fri, 27 Jun 2025 07:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LmXn5LPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437EF10E598
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751010706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ri0+PoGBbyLJmIsWOHAGRErY0fpNzrIikLK+X0yMjKY=;
 b=LmXn5LPixTX2Q5OODSmEVTOeZWjytL4+l7tvZAW71QHK1oDx3F4fmtmo1mufgTZewB1RD2
 LaUcCrmAhikSSsZnI1SuXQ8welQRm2Zw1NdDijNRa3kImovqkSItpUp6jxLejsvynK1bvr
 EX9z3Zgq0GbfhjtjxxPqAkSWFrLaxNI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-TqutroxXM8yXIvUr9FBgNg-1; Fri, 27 Jun 2025 03:51:44 -0400
X-MC-Unique: TqutroxXM8yXIvUr9FBgNg-1
X-Mimecast-MFC-AGG-ID: TqutroxXM8yXIvUr9FBgNg_1751010703
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4538f375e86so3522855e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751010703; x=1751615503;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ri0+PoGBbyLJmIsWOHAGRErY0fpNzrIikLK+X0yMjKY=;
 b=nL5AmVITm2QrR3tI+xyE+/4I4d1WXvZHrp3HrUltthCgUAig/hy0HBCn/2wYdWY70t
 +AODbMlRDI74VP8gM0K6Nxo2lnmnTPDZO27QTpnGsl95FKcTA8eDoTlI5hV44ex4fWtC
 KAh75Eqb6etTAajGEweObw3MKkg/uSiw9Jsb/RWkvkYiM8yvjcDkDqD+XsD62+twwHmK
 ytcmbV4e8DgF4KbeN4+DOR41xOnu4TfNeTDe+L5rFunan05vce+AI51nm6eTTGyRX2yN
 VZDZtWcuTJhYM6c24ec4IHEmCRopotNYAD3AiMEXe4IRHGkKhB3XPzECW2dFbKcqjbd3
 KdlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDHcu0Ys71HiZ9dQ0RwBHVqb3SqhvZxZOT/SJqjXgknMXvIQCM0n8PGLSLimKLjaWqY9V8iRzTzf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysDcpyFk9GdP0b9HxBbBKt4/YTBhFhpSAYhhXpI7XP7U/sruPj
 kkDuwQ8VyRB9kTxvBdSjDHNrUZywYm3g9BBIPq9ocrzp3O53jIw3SttKzQ7zj+w4dw4RHxr5nJ4
 cwVlClR8ZFtRn8IQ/ZxR5Bm9UwWPx1kL/X3yAxsoK5L1+A10/n0R21gqsFAphow+25qy79A==
X-Gm-Gg: ASbGnct0Tw3xM2o7zNb8KAwA/yjCuNgCHr8JZbNr4SQl4qPYtX1vFAiR5VJfneXVlIi
 CRuU4VW25U2AEZZIsHtCgFJhGg7oClYhp7Jcd3mJzopcYEAlz/AnwSICZGyKXPFU9n7OsEagX7g
 HVy/9v3ea8UdXYMad7USV1+SKj4YB7RV59lXkgRinjnLqZ3hD+n+cKUAeXTSjmaoXFlB85zrYP9
 imPGZiUhojHppdre/GSfM7Xfvaa0CHuWN2e6zo7tU0En/iDLfYb+NvOYkbARHf4czXkB8BGdDRC
 lCbilnXB3Kep/0bybMvbWv0FyQHar6+/cJn6k4fc3b1+Slj2FgD5AZdozdM207OWkPI751m5n7b
 zUH4h
X-Received: by 2002:a05:600c:3ba2:b0:441:b00d:e9d1 with SMTP id
 5b1f17b1804b1-4538ee15a09mr27052135e9.2.1751010703344; 
 Fri, 27 Jun 2025 00:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG84NMS43tLU4/bepm0RU/vh1jVbKdij5j7ryp5JJCNaNfJj8+Z/Tw54L4wr9lRRNPbvhEdWQ==
X-Received: by 2002:a05:600c:3ba2:b0:441:b00d:e9d1 with SMTP id
 5b1f17b1804b1-4538ee15a09mr27051735e9.2.1751010702905; 
 Fri, 27 Jun 2025 00:51:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c5fasm74208765e9.8.2025.06.27.00.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:51:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
In-Reply-To: <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:51:41 +0200
Message-ID: <87qzz5d3le.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9_b6dpDKR7_dAULIxc3yoMblyhHRESMaLa5iiYx_sqw_1751010703
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

Luca Weiss <luca.weiss@fairphone.com> writes:

> Some devices might require keeping an interconnect path alive so that
> the framebuffer continues working. Add support for that by setting the
> bandwidth requirements appropriately for all provided interconnect
> paths.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
> index 349219330314e3421a6bb26ad5cf39a679a5cb7a..47d213e20cab1dd1e19528674a95edea00f4bb30 100644
> --- a/drivers/gpu/drm/sysfb/simpledrm.c
> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/aperture.h>
>  #include <linux/clk.h>
> +#include <linux/interconnect.h>
>  #include <linux/minmax.h>
>  #include <linux/of_address.h>
>  #include <linux/of_clk.h>
> @@ -225,6 +226,10 @@ struct simpledrm_device {
>  	struct device **pwr_dom_devs;
>  	struct device_link **pwr_dom_links;
>  #endif

Can you add a /* interconnects */ comment here? Similarly how there is one
for clocks, regulators, power domains, etc.

> +#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
> +	unsigned int icc_count;
> +	struct icc_path **icc_paths;
> +#endif
>  

...

> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
> +{
> +	struct device *dev = sdev->sysfb.dev.dev;
> +	int ret, count, i;
> +
> +	count = of_count_phandle_with_args(dev->of_node, "interconnects",
> +							 "#interconnect-cells");
> +	if (count < 0)
> +		return 0;
> +
> +	/* An interconnect path consists of two elements */
> +	if (count % 2) {
> +		drm_err(&sdev->sysfb.dev,
> +			"invalid interconnects value\n");
> +		return -EINVAL;
> +	}
> +	sdev->icc_count = count / 2;
> +
> +	sdev->icc_paths = devm_kcalloc(dev, sdev->icc_count,
> +					       sizeof(*sdev->icc_paths),
> +					       GFP_KERNEL);
> +	if (!sdev->icc_paths)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sdev->icc_count; i++) {
> +		sdev->icc_paths[i] = of_icc_get_by_index(dev, i);
> +		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
> +			ret = PTR_ERR(sdev->icc_paths[i]);
> +			if (ret == -EPROBE_DEFER)
> +				goto err;
> +			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n",
> +				i, ret);

You could use dev_err_probe() instead that already handles the -EPROBE_DEFER
case and also will get this message in the /sys/kernel/debug/devices_deferred
debugfs entry, as the reason why the probe deferral happened.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

