Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C1C2DC45
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B810E216;
	Mon,  3 Nov 2025 18:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3ZFc1TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8610E216
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 18:57:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso53323425e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762196230; x=1762801030; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8+eN+6lfnONIl6DhyaJPvMKjY4jky2Hy+ffm+J1z/H4=;
 b=X3ZFc1TIS9xD1fNmhKAcUBdWrVfl5HgHF+IDuGaM20xIvx53v8xmsNGlXJS4jX0p/+
 SvWdeJhPECuEL4OKSw+ifx8uPUQtRJp1YpRanqzIzThHq2FavdNHJjXdRv4ifWZvFRD8
 7ykuMZi3p38CRL/3UTiCNmc5s13O+uYxQqOkFQIGNtFr7tlz9FzxgT11pBwsZOEEtkbi
 AB4sdB+qntY1SK3eRMG6iM/SmqxqZi9AqIi7VvCE8q5Ka6T7FtmII3Wo7Vfrp3FP6qig
 eFiIpvfP9blCn3//vQYLC6lkn4CI3lZMY1nKZPSIrkHMPYhedpR+k82IpPRUhUIw+sD0
 X86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762196230; x=1762801030;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+eN+6lfnONIl6DhyaJPvMKjY4jky2Hy+ffm+J1z/H4=;
 b=JqGJtsL36slkzFHr93GqoKuaTZy/RaU/NF7SUMvL2sNSu0iDAuOvxD+OOOAzlwjzF8
 sOKg3tUxkLIx/BIcBClDiqocqZg7e7GTCUIyza+HNmEAZ2f+YQ3OvR2Ybo+yVdGkeRYp
 sc1Be06BVliX+hku4zM8iC9MY4gw/OzhUNSoQnVxvKwl+kEURsqBdgP1ndbZUN3a5EgU
 e+NQWSXHNlRyuMzLCJ9s5FWbMFdws4IHLdsxBYwN94Qz7+2LubKaWyOyWS8e7lC4lo70
 5rZvT7UUfTjOyMoGb9YwrBIZkawv0/hCOjD3l+K0ItNk4GwBTdT2LvvMfjQongNaDqAi
 4jDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqCJRmvpd1a3m5YBAikZ76qMBO0ow/iVqJBvAeyfzzndOtGY71KQ/6q8R50Bla9OembB+jZ1efsqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx06aGAPWysynSkfD2jpA+YN53EEOSW3nCJqOOVYcG/3EkaWTYs
 4k0widxwJDwVUmfOEtUrxmqVsPCDtiMPtwlwIEyEpKjw3jkCQScCFBvg
X-Gm-Gg: ASbGncv+x6kw8xnEZ9ZOYzE1lTdAew03Mk77t+9mcPKNSx4Htnd+a4VrHQX4MRJC0sl
 SlHDwu7ajfCGtalJ17AX7epC3cigEUuRI7JTE+c1xxdEeCzrojdTCkXzihg68iFs3m6CSFNgnDH
 boiFUyxa2LLwgsXu0zxLjrfgxuWZ2XqfLu1xQXQXM5dP+aBBBJ2JZhaR4t7ergdX5loinVXe9k9
 ZPo7YqhaD/9bE7X1g71h6kJnj+2fareyKiYGcJOlTp+Sb66WXLJmNBlKSBCm3NPe23lVMNPJ90E
 PU9b65JYervqi1dcI1hos0HkKGgjKU1L9eqAUbJCFFGarOITTb0xNs8fVQ4DyQEkk2PXw5x3bTF
 1acCPcJwJnIhL7ezLDrG7fjbenVfbcb17DJEGylxeHH59xmq05Prq1YU3BFqMcIe41jBvtvZ2nm
 B0Qg==
X-Google-Smtp-Source: AGHT+IEK2+4nBd40SRJ0qYnaqIkscu36w0iUBumg+gWmVgTn8vW7aAbSUdB2E3eeUqZt28T5ziAh9A==
X-Received: by 2002:a05:600c:a08:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-477308c9355mr115909985e9.27.1762196230208; 
 Mon, 03 Nov 2025 10:57:10 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773d81cb03sm162334735e9.13.2025.11.03.10.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 10:57:07 -0800 (PST)
Date: Mon, 3 Nov 2025 19:56:55 +0100
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aQj69wzTceDklx2Y@thinkstation>
References: <20250922122012.27407-1-johan@kernel.org>
 <d1c2e56b-2ef9-4ab1-a4f8-3834d1857386@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1c2e56b-2ef9-4ab1-a4f8-3834d1857386@web.de>
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

Le Mon, Sep 22, 2025 at 06:16:47PM +0200, Markus Elfring a écrit :
> > Make sure to drop the references taken to the vtg devices by
> 
>                                                 VTG device?

Video Timing Generator.  This IP creates a vsync pulse and synchonize
the components together.

> 
> 
> > of_find_device_by_node() when looking up their driver data during
> > component probe.
> …
> 
> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L1180

Oh... I wasn't aware of this.  FWIU it is a way to directly free an
allocated memory whenever a variable goes out of scope using the cleanup
attribute.

IMO this is also a clever solution to prevent the memory leak, and it
would be a shorter patch.  So basically, instead of calling put_device()
as Johan did, you would suggest something like this ?

diff --git i/drivers/gpu/drm/sti/sti_vtg.c w/drivers/gpu/drm/sti/sti_vtg.c
index ee81691b3203..5193196d9291 100644
--- i/drivers/gpu/drm/sti/sti_vtg.c
+++ w/drivers/gpu/drm/sti/sti_vtg.c
@@ -142,7 +142,7 @@ struct sti_vtg {

 struct sti_vtg *of_vtg_find(struct device_node *np)
 {
-       struct platform_device *pdev;
+       struct platform_device *pdev __free(put_device) = NULL;

Best regards,
Raphaël


> 
> Can a summary phrase like “Prevent device leak in of_vtg_find()” be nicer?
> 
> Regards,
> Markus
