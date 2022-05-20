Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4991652E4E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 08:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64411B4DF;
	Fri, 20 May 2022 06:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7A11B4DF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653027558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWnyUXwbnXllaQ0uv1b5t0P1ieqzLCHOX4I/wGwYkZE=;
 b=dv33vae/q6R133aTOEuR7ZgcVIk6x++T7txCoP8qdnwNq2XudQG/rQIH89DSqIQ6knhXcM
 eX9dQbcjUZ9iCROfmiqjFhevTEPUpOknj6XXRNPMS/MRc8obA2mOud67BMIO9UU7n7jgq2
 2Tl7MZG+WQabqmJYYvpDBBetF0ZVfWg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-QUyC9TbxM_G0g75OeFPJyg-1; Fri, 20 May 2022 02:19:14 -0400
X-MC-Unique: QUyC9TbxM_G0g75OeFPJyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v124-20020a1cac82000000b003948b870a8dso5647834wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 23:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WWnyUXwbnXllaQ0uv1b5t0P1ieqzLCHOX4I/wGwYkZE=;
 b=6mAvbZVzYX6Hf8KfLfxyXHFcyMrDyKSqq01hLlIxuIUH8Vcf32ff5oP/4XyB8r8tIf
 C8PO54w5kWbd2vowvIhH6QnPWsM2vTw//+u+N0N4325HkXERW9ueq8aT4/Sc2pEfV5d/
 EJT0WcmzyzN4wzM6HbsofvgdmtdEDk+4NDVFsA+wa9BJYDoq2kqr/sicGPAaRFUWYe2H
 JlXlDpnLlPEWsfCqFR3Xa46N4DaMFppvrpDwDp6w1+ln8lUJQErsUpEkRF/bzlnPBEkC
 kJ3oaosr9xky7qBX8YwVf35oD5jJJjhx54ooObkdkWlPzYm3cap0Y5ueyQKivzIUz7pA
 ppog==
X-Gm-Message-State: AOAM531bhUMfvd4mp5q2dZFC4BuvNOazrz7Wbg5LnR7r3fYauSuhyeNe
 O1slka3hBqbzmaEfHRJn80Wdf+mcUvw3a+YpZJT2oxv/+JYP+IVgzUB0xeJ6WJw9snNtS8VrQbd
 a3FctfNRVmuv2D/UYWzpF0KB6JEYq
X-Received: by 2002:adf:ea0a:0:b0:20f:afa:c885 with SMTP id
 q10-20020adfea0a000000b0020f0afac885mr947013wrm.640.1653027553117; 
 Thu, 19 May 2022 23:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1apKhwtDuwN5y6ql+wtzPt4dv5/GCFcazI5SvaYczGFn7reMg6aU/08qipp7Qzw+vBvg6qg==
X-Received: by 2002:adf:ea0a:0:b0:20f:afa:c885 with SMTP id
 q10-20020adfea0a000000b0020f0afac885mr946992wrm.640.1653027552861; 
 Thu, 19 May 2022 23:19:12 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b0020d069148bcsm1433018wra.110.2022.05.19.23.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:19:12 -0700 (PDT)
Message-ID: <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
Date: Fri, 20 May 2022 08:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220518183006.14548-3-tzimmermann@suse.de>
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

On 5/18/22 20:30, Thomas Zimmermann wrote:

>  
> +config DRM_OFDRM
> +	tristate "Open Firmware display driver"
> +	depends on DRM && MMU && PPC

Shouldn't depend on OF? I mean, is a DRM driver for Open Firmware after all :)

I know that the old drivers/video/fbdev/offb.c doesn't, but I think that is a
but and should `depends on OF || COMPILE_TEST`

> +
> +/*
> + * Helpers for display nodes
> + */
> +
> +static int display_get_validated_int(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int display_get_validated_int0(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (!value) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return display_get_validated_int(dev, name, value);
> +}
> +

These two helpers are the same that we already have in simpledrm.c, maybe could
include a preparatory patch that moves to drivers/gpu/drm/drm_format_helper.c
and make them public for drivers to use ? Or maybe even as static inline in
include/drm/drm_format_helper.h ?

> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +								  u32 depth)
> +{
> +	const struct drm_format_info *info;
> +	u32 format;
> +
> +	switch (depth) {
> +	case 8:
> +		format = drm_mode_legacy_fb_format(8, 8);
> +		break;
> +	case 15:

I think is customary now to add /* fall through */ here to silence GCC warns ?

> +}
> +
> +static int display_read_u32_of(struct drm_device *dev, struct device_node *of_node,
> +			       const char *name, u32 *value)
> +{
> +	int ret = of_property_read_u32(of_node, name, value);
> +
> +	if (ret)
> +		drm_err(dev, "cannot parse framebuffer %s: error %d\n", name, ret);
> +	return ret;
> +}
> +

[snip]

> +static u64 display_get_address_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 address;
> +	int ret;
> +
> +	/*
> +	 * Not all devices provide an address property, it's not
> +	 * a bug if this fails. The driver will try to find the
> +	 * framebuffer base address from the device's memory regions.
> +	 */
> +	ret = of_property_read_u32(of_node, "address", &address);
> +	if (ret)
> +		return OF_BAD_ADDR;
> +
> +	return address;
> +}
> +

All these helpers seems to be quite generic and something that other OF
drivers could benefit from. Maybe add them to drivers/gpu/drm/drm_of.c ?

> +#if defined(CONFIG_PCI)
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	const __be32 *vendor_p, *device_p;
> +	u32 vendor, device;
> +	struct pci_dev *pcidev;
> +
> +	vendor_p = of_get_property(of_node, "vendor-id", NULL);
> +	if (!vendor_p)
> +		return ERR_PTR(-ENODEV);
> +	vendor = be32_to_cpup(vendor_p);
> +
> +	device_p = of_get_property(of_node, "device-id", NULL);
> +	if (!device_p)
> +		return ERR_PTR(-ENODEV);
> +	device = be32_to_cpup(device_p);
> +
> +	pcidev = pci_get_device(vendor, device, NULL);
> +	if (!pcidev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return pcidev;
> +}
> +#else
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +

Unsure about this one, I don't see other display driver using a "vendor-id"
or "device-id" when looking at Documentation/devicetree/bindings/, so guess
this one would have to remain in the driver and not in a helper library.

But since you have #ifdefery here, maybe would be cleaner to have that stub
defined as static inline in include/drm/drm_of.h ?


> +static struct ofdrm_device *ofdrm_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct ofdrm_device, dev);
> +}
> +
> +/*
> + *  OF display settings
> + */
> +

This seems like another candidate to move to the include/drm/drm_of.h header. 

> +static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
> +{
> +	struct drm_display_mode mode = { OFDRM_MODE(width, height) };
> +
> +	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;

Maybe a comment here about the clock value chosen ?

> +	drm_mode_set_name(&mode);
> +
> +	return mode;
> +}
> +

[snip]

> +
> +	/*
> +	 * Never use pcim_ or other managed helpers on the returned PCI
> +	 * device. Otherwise, probing the native driver will fail for
> +	 * resource conflicts. PCI-device management has to be tied to
> +	 * the lifetime of the platform device until the native driver
> +	 * takes over.
> +	 */

Ah, was this the issue that you mentioned the other day? How interesting.


> +/*
> + * Support all formats of OF display and maybe more; in order
> + * of preference. The display's update function will do any
> + * conversion necessary.
> + *
> + * TODO: Add blit helpers for remaining formats and uncomment
> + *       constants.
> + */
> +static const uint32_t ofdrm_default_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGB565,
> +	//DRM_FORMAT_XRGB1555,

Wonder if makes sense to keep this commented and the TODO, why not
leave that format from first version and just do it as follow-up ?

> +static const struct drm_connector_funcs ofdrm_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};

All of the callbacks used comes from helper libraries so I maybe we
could have a macro or something to set those ? It's the same set that
are used in simpledrm so it would make sense to have them defined in
the same place.

> +static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +

Same for these. We could also have a macro to define this for both
simpledrm and ofdrm.

> +static const uint32_t *ofdrm_device_formats(struct ofdrm_device *odev, size_t *nformats_out)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	size_t i;
> +
> +	if (odev->nformats)
> +		goto out; /* don't rebuild list on recurring calls */
> +

Nice optimization to cache this.

> +	/*
> +	 * TODO: The ofdrm driver converts framebuffers to the native
> +	 * format when copying them to device memory. If there are more
> +	 * formats listed than supported by the driver, the native format
> +	 * is not supported by the conversion helpers. Therefore *only*
> +	 * support the native format and add a conversion helper ASAP.
> +	 */
> +	if (drm_WARN_ONCE(dev, i != odev->nformats,
> +			  "format conversion helpers required for %p4cc",
> +			  &odev->format->format)) {
> +		odev->nformats = 1;
> +	}
> +

Interesting. Did you find some formats that were not supported ?

The rest of the patch looks good to me, thanks a lot for writing this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

