Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F25760F3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12B518A851;
	Fri, 15 Jul 2022 11:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B43818A851
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657886207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGkIOwyvFmzhbCUYm5+8xL8ziiXjaFbbfd3qqafzd8M=;
 b=X8l2m5+jRG8YRt9nn/ZsgWTSC/14kA7xx5hlxT3Yn1VxuO4JeCBtiDHeTvfIy+9TX/TUjv
 aF0KtQyJtqfYUBp7g7wsDxvX/THJF/cdPRxh4ZDtZHq/m3HiqkkqzbHzi39/d+h9tTrAvx
 9LWKyhZCZ+2khqsvDRZrbNAM3Z6hgb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-JbVqWTD0NHKegFVSpcbXpw-1; Fri, 15 Jul 2022 07:56:40 -0400
X-MC-Unique: JbVqWTD0NHKegFVSpcbXpw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so3156485wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZGkIOwyvFmzhbCUYm5+8xL8ziiXjaFbbfd3qqafzd8M=;
 b=yR1xctkyobcfqIJpn7bbsPdARnKc4ZqcrbA6qMMIfuPBSn7d5vQ0jnvQdqjm/soePB
 Tf6wGXjPJUsmuHBBZ5MOVOcKlu8ZlmukJg3Gk9DCRsVaJ6t5PxQY8UFSTaxYZOP5yHQo
 TB+WG12ZgKrcZqcVObWlZSr1u2h0rMItp91cVcPnAlpQ4M8ETno/a2nnRuOeTCoN4YJy
 eLrD+qwn4S47tJyZkUKjxAacbEqguYHq5p/q/EE4Bl/weAJjC3/BOu+M/XV9+KxCiZ8d
 ijtb2Ck6ZqO/wUHIbXfetFECdZRSCMbCcLVxHTvzYWh061YuYcvijpjeFWjTOCjYvp+U
 oYwg==
X-Gm-Message-State: AJIora98v01kRwEU9u0OCEVSBdfJpq4FQwwLAwLOq7dzJf4Sl33ytWpd
 av0SKJu+7BWjUn7zefoDSpkb3V7qA/NRoixB7OcFjNWoywg+2qXhtQg8iH5MwMelzAmYdv0/Fyy
 JwxXSdK0BUGJiyPWLCPJ27O0vMXOb
X-Received: by 2002:a5d:56d1:0:b0:21d:78ad:c8bf with SMTP id
 m17-20020a5d56d1000000b0021d78adc8bfmr12518030wrw.175.1657886199154; 
 Fri, 15 Jul 2022 04:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smSq19q7Fkw60FMFkswIMOeyBLouoE4txw/9cp+WjMYOqudNHfchdpbzC3yv2/xNNoXTjqGA==
X-Received: by 2002:a5d:56d1:0:b0:21d:78ad:c8bf with SMTP id
 m17-20020a5d56d1000000b0021d78adc8bfmr12518016wrw.175.1657886198959; 
 Fri, 15 Jul 2022 04:56:38 -0700 (PDT)
Received: from [172.20.10.7] ([84.78.249.231])
 by smtp.gmail.com with ESMTPSA id
 e39-20020a5d5967000000b0021badf3cb26sm4476823wri.63.2022.07.15.04.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 04:56:38 -0700 (PDT)
Message-ID: <3b707e5f-ce33-b08d-371b-701b3a84f549@redhat.com>
Date: Fri, 15 Jul 2022 13:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-6-tzimmermann@suse.de>
 <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
 <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/15/22 13:48, Thomas Zimmermann wrote:

[...]

>>> +
>>> +	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");
>>
>> Do you know why this can't just use aperture_remove_conflicting_pci_devices() ?
> 
> I simply don't want change too much at once, because there was this 
> problem with the PCI helper on ast.
>

Makes sense. Feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> At some point we can make a push to really fix this throughout the code 
> base. And that would include an update to fb_is_primary_device(), [1] 
> which doesn't fill well into the new interfaces.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

