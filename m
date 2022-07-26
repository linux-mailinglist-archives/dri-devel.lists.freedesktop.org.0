Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90A581406
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30729028D;
	Tue, 26 Jul 2022 13:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D9F902B6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658841480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZLeEqH10vqusPd0IzJaPflqD8TZSc6CiZ1X6z5OlBM=;
 b=VPtHivyxieTqICBH9mv5B4Irp9KgxiFB8HjkxKvZcMkIMoGsZlsEybMThNoO2JBoSQSMuZ
 hZzzSB1AF7PS6XYgfcfRTprvvcKfnPi+g7IOHox+fMFRXkkWpIJ8gP7HTPugA6X0JIxRXm
 xeKOuoUT5vzYzmnQ904H+UwGRqxJk2c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-X5v3pwIUOw6er_FZ6L3WGQ-1; Tue, 26 Jul 2022 09:17:56 -0400
X-MC-Unique: X5v3pwIUOw6er_FZ6L3WGQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x17-20020a05600c21d100b003a32dda6577so5392363wmj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QZLeEqH10vqusPd0IzJaPflqD8TZSc6CiZ1X6z5OlBM=;
 b=5podLtQqlkxh5SZaC3RY7JgYlSzPabrbGFWPK9Bfielq/6FYPG8pkDVhuE3mQRF0wJ
 8TaU8xQXk4+QovimOTN/lkitimwU6MgvsEzy8AurBvcGX4nKEpTbGDOaYBq6J8jJBQwh
 nVCkOUzEVTqdOFBxs6YVOJlSe2IgG8X6YGcQHM8zvCIJBSAFFtC67peHqcWc1n6cV5Zy
 cSWFeLhTQvtZ9VoLtnDye9U6/FevsMxhK9RPiKNf/Bz8RAOplD/ti01FQd8/GRQB4FIl
 FABtjYUeKEvTQCOsxFx835zQYyUbPVqAap5L7rdWuwExqKjCbkJKgHU9ZKKnNKaQUYpF
 aHKw==
X-Gm-Message-State: AJIora/OqWzIOCQRW7JomT/rBpA11YNa5YhYRz2kTpbM0pHuiu6i0FGW
 x7N3NbdAsSjsmZZ5xMO75U8OrUBkZg48Dh1DwiBxwHumIwKSgV5qyq2CAsJXLTSL+WkILMSaZSn
 b93Hq1D1ZJEi3gAWqf/TUHLcufs+e
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id
 o9-20020a5d58c9000000b0021d93741373mr10809115wrf.20.1658841475080; 
 Tue, 26 Jul 2022 06:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwK0jaZriyb3HLzd94qTq2w3igX18xuKp7Xs7KKT1Eo3AyBh6uAmDSNtcGDrxJn9ORe+mJkw==
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id
 o9-20020a5d58c9000000b0021d93741373mr10809097wrf.20.1658841474813; 
 Tue, 26 Jul 2022 06:17:54 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg17-20020a05600c3c9100b003a04d19dab3sm3251267wmb.3.2022.07.26.06.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 06:17:54 -0700 (PDT)
Message-ID: <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>
Date: Tue, 26 Jul 2022 15:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/10] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-8-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
> 

I'm not familiar with OF display but the driver looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I just have a few questions below.

[...]

> +static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						   struct drm_atomic_state *new_state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_crtc_state *new_crtc_state;
> +	int ret;
> +
> +	if (!new_plane_state->fb)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

This seems to be exactly the same check than used in the simpledrm driver.
Maybe could be moved to the fwfb helper library too ?

[...]

> +
> +static void ofdrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; disabling clears the screen in the
> +	 * primary plane's atomic_disable function.
> +	 */
> +}
> +

Same comment than for simpledrm, are these no-op helpers really needed ?

[...]

> +static const struct of_device_id ofdrm_of_match_display[] = {
> +	{ .compatible = "display", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
> +

I don't see a binding for this in Documentation/devicetree/bindings/display.
Do we need one or it's that only required for FDT and not Open Firmware DT ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

