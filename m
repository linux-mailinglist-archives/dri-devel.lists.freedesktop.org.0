Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AA5FADAC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 09:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4AA10E7CD;
	Tue, 11 Oct 2022 07:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287F10E363
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665474381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSO31FFSWdoXBgwUfILs3D/eoN5/MJjkcgNLNdrIA0I=;
 b=M5MocYAOobdoqhLDbm3x6fsN5RJNGfGy1et/9Npi8f8IAOhrOHIq7/mzu+gYSBbW1LKGgh
 UIwLTJ+HCMj2zrlJfq8ZegZUiGtzzHjrg/6baWwZ3xCo74HHkQ7lO3OOrjCIi5J3Fvibl7
 ds0g3j/VHU+y3zzemZudWgbXqOLytVI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613--evEx8agP8u6EWE_49bq4g-1; Tue, 11 Oct 2022 03:46:20 -0400
X-MC-Unique: -evEx8agP8u6EWE_49bq4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso5163598wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 00:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSO31FFSWdoXBgwUfILs3D/eoN5/MJjkcgNLNdrIA0I=;
 b=NaH0PV2WIn1W//oMQSedEuJAAjbRkdsIWE1I2OE1BIRGMm3RcGn13fipmxlgcuENNd
 3JKT59ZKR8WVxASjOsKFZXGVEU1vRziJrCySbvKNnmfVMCfc5382nXk3E6iVMNlGhYZO
 8z354EVUgbStdr4Ib+0825JKxPMnvsDTnkfQ14s5dG7v+ody312IXiKScPtxlgYBapSs
 d7MgkpvTwYx92A5rsiZh5LJO2hJ9NKNMP1sgwBldWN3W6IoZHjZeX+TCDAG9gF0Zi8Kl
 kDsdtMeI9KXl8wxDl4pXGdXnG8zyHrCmdev/E5Fu/HKqtkp3GGdguLGN23+b7ekGTod2
 xLBA==
X-Gm-Message-State: ACrzQf0kaE5YGHl3ny+Z1hzsFBHhjBS9BrHSi+C5kdo+LSpwm0CtZm49
 g/kLMDbWac5cbGcqRO4UoEvg+FWuEoItxJDGdDVZ7kFJi39b5acZgQF25cdFltYDTDNvWiuZjKs
 WaPIuQeSoHNw2i0mKkS1PVYEKkZaG
X-Received: by 2002:a05:6000:184c:b0:22f:edd8:821f with SMTP id
 c12-20020a056000184c00b0022fedd8821fmr7415901wri.363.1665474379317; 
 Tue, 11 Oct 2022 00:46:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dmWgqCGPFqZN8NPA8TsXuF3935TrGX3QAoadmbEV1e0/uHHFpUzYt1J3ZTNf2xQER2QOE6g==
X-Received: by 2002:a05:6000:184c:b0:22f:edd8:821f with SMTP id
 c12-20020a056000184c00b0022fedd8821fmr7415879wri.363.1665474379063; 
 Tue, 11 Oct 2022 00:46:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp15-20020a5d5a8f000000b0022cbf4cda62sm13716589wrb.27.2022.10.11.00.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 00:46:18 -0700 (PDT)
Message-ID: <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
Date: Tue, 11 Oct 2022 09:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220928105010.18880-6-tzimmermann@suse.de>
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

On 9/28/22 12:50, Thomas Zimmermann wrote:
> All DRM formats assume little-endian byte order. On big-endian systems,
> it is likely that the scanout buffer is in big endian as well. Update

You say it is likely, not always then? Does it depend on whether the Open
Firmware is BE or LE ?

[...]

> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	bool big_endian;
> +
> +#ifdef __BIG_ENDIAN
> +	big_endian = true;
> +	if (of_get_property(of_node, "little-endian", NULL))
> +		big_endian = false;
> +#else
> +	big_endian = false;
> +	if (of_get_property(of_node, "big-endian", NULL))
> +		big_endian = true;
> +#endif
> +
> +	return big_endian;
> +}
> +

Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
Tree has an explicit node defining the endianess. The patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

