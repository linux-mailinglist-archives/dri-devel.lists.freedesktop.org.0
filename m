Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E3AEB0AF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C5110E977;
	Fri, 27 Jun 2025 07:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LYTlJ9ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A4610E977
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751010985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Q4VTKj0+5MdcqxZstilZbvd2GN92E1ID201HEkjPSU=;
 b=LYTlJ9ns7ha4quc8aHRJFR52wNLefU1wk9ao56XhCWRIqWpuTxqfIbIO5APhHXPF9UgPLM
 WHR3HimlRzS4P4PgVzoqpMo+jJ1EZNMo5KREJneonx6wfKApVy788ZtDKRGKNGyRS6f/Ej
 X3+BFWJutpBa0qnOrw06s3Bnx23/2wU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-XPO77XcQMEKpw7Ak7a_N8Q-1; Fri, 27 Jun 2025 03:56:24 -0400
X-MC-Unique: XPO77XcQMEKpw7Ak7a_N8Q-1
X-Mimecast-MFC-AGG-ID: XPO77XcQMEKpw7Ak7a_N8Q_1751010983
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451dda846a0so13489945e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751010983; x=1751615783;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Q4VTKj0+5MdcqxZstilZbvd2GN92E1ID201HEkjPSU=;
 b=p5D3IYNPE+C2+yDbynE1kEQoIUk3LsHcyg95yYAi8pt+LjSXjripmRzqU4kgEZ4skm
 LPNggI1ohQ2n38v4+r1uk6bN0m9eyS2rA1BkBatBEs6GyYHA9NfuL5HPgzdd6Nvzo5cJ
 yMNmTClLpWEJBnPzAtiOUYY0nMacoe5BBmOBo2M2btzlGgWzzcXumWIiJ3AIOKLTSAZF
 RVInTgKgJxdHgfa4DJy5gB5H4ApvPOo+Hs4efkWEZipWKTTYRvK97zCU54pehyWMGcSB
 CiAo3iFudbIJkNkvYlKmsWKWJTa/ShNnBVaAjsvQPtPy5E14vfMD/ElLAoxEIxoXWHQC
 B6Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYhlJKj72SaxfmfBCaYxq8monkvwsDY8B8G2xoI6WKMsmPMO+EBL+HIXW7J8i8OYrMcXka84P96qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT/SzgqFlN6DjiPOYH8zkM/WVRMxJLkybXGA86MRLSkPGsmMed
 PwVvlLrDymxANzn9l47uraReo1MjEaQMQMYP5D4ClZnQcdMqf9s4UdU/nl6XolhKkxc75hXs843
 VsL7E1cGs3ctsix1Kh2K1If8VMj2c51JXZLPdMEUF7ELoItrsT7GDdWdgJouvH4AAdzqWtA==
X-Gm-Gg: ASbGncvcmqj4CO7aafTbBl5+jhv33e023EiAuc29WsN9IL4ivVoU0LiI9BmHHq/5aO8
 Ti9rkRBTTuZ/l+PKTjiIzf1ES9l5KBb15xzFnsAihSCJElzrbH7dys7NOuacl3VHIQnnDXmN+BT
 Vilgb+ubY3KeAn4BwHVzNBDnfPOsNeXT4bHH69H0zW8IGWshxIEVBOkFKstlMYAcWEC01canNl2
 /whwLcNwg7swCSHK1JdYFf5nR25yfe0MUjBR7oWmjWJicLEgfMUMe0uVkJvU9STPcuWwxgPshSj
 1fIhB6fheTEtCgcImKNsruABU/E1ceybIqJPQ5g6eAXkbrcnnHjRaqo+rh9BQgJfeUKlx9MMUjY
 dpMpa
X-Received: by 2002:a05:6000:64b:b0:3a6:d5fd:4687 with SMTP id
 ffacd0b85a97d-3a8f482bd31mr1975659f8f.18.1751010982944; 
 Fri, 27 Jun 2025 00:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcaHziqQErdzS3zBfEaj9TBNKZzm1QxKyX+r2W+yzOPLLnK2T4/8Tz2nVI+7oJ45W80EdV9Q==
X-Received: by 2002:a05:6000:64b:b0:3a6:d5fd:4687 with SMTP id
 ffacd0b85a97d-3a8f482bd31mr1975632f8f.18.1751010982567; 
 Fri, 27 Jun 2025 00:56:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f44dsm1931370f8f.87.2025.06.27.00.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:56:21 -0700 (PDT)
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
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
In-Reply-To: <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:56:20 +0200
Message-ID: <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XwF5GstUKg8zEI0_ujsvo5nzrDe7D52nHBif90XglEg_1751010983
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
>  drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>

[...]

> +static void simplefb_detach_icc(void *res)
> +{
> +	struct simplefb_par *par = res;
> +	int i;
> +
> +	for (i = par->icc_count - 1; i >= 0; i--) {
> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
> +			icc_put(par->icc_paths[i]);
> +	}
> +}
> +
> +static int simplefb_attach_icc(struct simplefb_par *par,
> +			       struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret, count, i;
> +
> +	count = of_count_phandle_with_args(dev->of_node, "interconnects",
> +							 "#interconnect-cells");
> +	if (count < 0)
> +		return 0;
> +
> +	/* An interconnect path consists of two elements */
> +	if (count % 2) {
> +		dev_err(dev, "invalid interconnects value\n");
> +		return -EINVAL;
> +	}
> +	par->icc_count = count / 2;
> +
> +	par->icc_paths = devm_kcalloc(dev, par->icc_count,
> +				      sizeof(*par->icc_paths),
> +				      GFP_KERNEL);
> +	if (!par->icc_paths)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < par->icc_count; i++) {
> +		par->icc_paths[i] = of_icc_get_by_index(dev, i);
> +		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
> +			ret = PTR_ERR(par->icc_paths[i]);
> +			if (ret == -EPROBE_DEFER)
> +				goto err;
> +			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
> +			continue;
> +		}
> +
> +		ret = icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
> +		if (ret) {
> +			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret);
> +			continue;
> +		}
> +	}
> +
> +	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
> +
> +err:
> +	while (i) {
> +		--i;
> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
> +			icc_put(par->icc_paths[i]);
> +	}
> +	return ret;
> +}
> +#else

These two functions contain the same logic that you are using in the
simpledrm driver. I wonder if could be made helpers so that the code
isn't duplicated in both drivers.

But in any case it could be a follow-up of your series I think.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

