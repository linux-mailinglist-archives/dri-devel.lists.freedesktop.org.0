Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06082304C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 16:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD110E2B4;
	Wed,  3 Jan 2024 15:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A997A10E2B4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 15:16:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T4tbs0ZVNz9stN;
 Wed,  3 Jan 2024 16:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1704295001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuXh48BAQbEdwA1TrRsSkNBESpC4cFsNlnC9KrshjaA=;
 b=gjuyWpIFQp9owXYt+yhOUAOair3NQQNvAXllOaRD0rUDOhMJr2LZjnCTp+Sb/obKXFsS4m
 IX2sf329qhiaS/ZCZFSpC+8/SmKjXGMCi9Q67UCLSawNnVyKegbU5QjzuLQeSPxwdql6NU
 FuV+VWzKu3njPey5FYyq7RPdYZ0XNt8EdC2NrXK/SdqZHIGQFqr4ot82BH1+SiGYqfSO0I
 PV7trpSAwdtb0toiQtleokzH9Np0cjgS4hSsnVCz1bThYoSJSnUaTAuDNkHggfytNiK510
 YdEbogxr4MJrxEZbFEwKC2XHQh5tHqr2NjXlRBe6wSbT6X+xlZd/cm6Vk97pCQ==
Message-ID: <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
Date: Wed, 3 Jan 2024 16:16:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-CA
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: a3tith5w19ocqf5if416i7ko7o9xc9da
X-MBO-RS-ID: 90cb4ebc5a3fddc3ff6
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-26 10:38, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Dec 2023 08:44:37 +0100
> 
> The kfree() function was called in one case by the
> drm_property_create() function during error handling
> even if the passed data structure member contained a null pointer.
> This issue was detected by using the Coccinelle software.
> 
> Thus use another label.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/drm_property.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index 596272149a35..3440f4560e6e 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -117,7 +117,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
>  		property->values = kcalloc(num_values, sizeof(uint64_t),
>  					   GFP_KERNEL);
>  		if (!property->values)
> -			goto fail;
> +			goto free_property;
>  	}
> 
>  	ret = drm_mode_object_add(dev, &property->base, DRM_MODE_OBJECT_PROPERTY);
> @@ -135,6 +135,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
>  	return property;
>  fail:
>  	kfree(property->values);
> +free_property:
>  	kfree(property);
>  	return NULL;
>  }
> --
> 2.43.0
> 

This change is pointless at best, kfree(NULL) works fine.


Out of curiosity, what exactly did Coccinelle report?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

