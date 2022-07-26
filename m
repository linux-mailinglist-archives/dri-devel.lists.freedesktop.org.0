Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1F581447
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46120113BB3;
	Tue, 26 Jul 2022 13:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CB0113BB3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658842592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2u/FwFPSYIYZn3XhpsCa5MLVVbvOOeOfOubBmW1ly8=;
 b=aHWeQ1bK9lmZgDDcaiyBlX//x3ifmSYTdUlCJaIBjJj9sDiHuatUXt7AK5etOYdus6cfBH
 IwQshcXNehQTjaEXnT7noPD84pabXwoujgo9kiHZSRJaqzWD32+m9oiBvGpqDsG0oMN5R9
 X6fFiJjopHXo0IugXRwkuJzse6Nq4jA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-DDqsrpE6ODGclVCYdHxfnA-1; Tue, 26 Jul 2022 09:36:28 -0400
X-MC-Unique: DDqsrpE6ODGclVCYdHxfnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so811816wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o2u/FwFPSYIYZn3XhpsCa5MLVVbvOOeOfOubBmW1ly8=;
 b=QTX2jeufFP+Oz4FEo7RXk3hK6QAATlp/mzOqJZyE2TFhp9pn+9vD29PCY58nkRxk6M
 k9ZsVnkzrC8V6yeaIkkPRKQulc9/CcsdnwTePrxz+Jn0X9WW8+HsApsP9zoA4m1DFlvz
 tSrbGgE1uLW8JvP/F+1Bim+JbkNIYdYY5SUa/+O+zzI6yW6XpzCgx6f1k6wM77mUDLwe
 hUzUCvI7xxDmdIMmGemNaxkx/S4cIWFyJL3tssUL/4YvrwFKp73bQ1PeX/2M8AEYYaO3
 kKdQREVjCQ6mKjHHebUSk2QjuM0e0eKd1s1fU3a3WeNVxsR4dfnNfQ9hC/7mV5Py6xVT
 bKCQ==
X-Gm-Message-State: AJIora8p/fJbMYg8NokIF0+KtymcgyTKtiOLBBoyl10RH7hGH5Nx6Q74
 HwMdcsYzHuNUVjYI2B9wj2cRLlFupZ5UDTH445+jc6gmrx4zZi8BmRkjqvcUted8DmndFF8G6Fn
 6iXLGYBkSRv3JOrWhU8q4kmkqSXxJ
X-Received: by 2002:a1c:e902:0:b0:3a0:2d95:49d4 with SMTP id
 q2-20020a1ce902000000b003a02d9549d4mr12603654wmc.189.1658842587588; 
 Tue, 26 Jul 2022 06:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+6AG/nzdOXc385y1ed+df7G89IH7y4dgdzREPE3h30Z3oCxeMhVdXILhe/dWGuohiWiGT+A==
X-Received: by 2002:a1c:e902:0:b0:3a0:2d95:49d4 with SMTP id
 q2-20020a1ce902000000b003a02d9549d4mr12603622wmc.189.1658842587119; 
 Tue, 26 Jul 2022 06:36:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003a326ba4e99sm16742676wmb.34.2022.07.26.06.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 06:36:26 -0700 (PDT)
Message-ID: <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>
Date: Tue, 26 Jul 2022 15:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/10] drm/ofdrm: Add CRTC state
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-9-tzimmermann@suse.de>
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

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Add a dedicated CRTC state to ofdrm to later store information for
> palette updates.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 62 ++++++++++++++++++++++++++++++++++--
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void ofdrm_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct ofdrm_crtc_state *ofdrm_crtc_state;
> +
> +	if (crtc->state) {
> +		ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
> +		crtc->state = NULL; /* must be set to NULL here */
> +	}
> +
> +	ofdrm_crtc_state = kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);
> +	if (!ofdrm_crtc_state)
> +		return;
> +	__drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
> +}
> +

IMO this function is hard to read, I would instead write it as following:

static void ofdrm_crtc_reset(struct drm_crtc *crtc)
{
        struct ofdrm_crtc_state *ofdrm_crtc_state = kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);

	if (!ofdrm_crtc_state)
		return;

        if (crtc->state) {
                ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
		crtc->state = NULL; /* must be set to NULL here */
	}

        __drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
}

Also with that form I think that the crtc->state = NULL could just be dropped ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

