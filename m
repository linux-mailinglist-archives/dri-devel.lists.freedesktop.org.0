Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B005776D0
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 16:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582490BCC;
	Sun, 17 Jul 2022 14:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C32A90BC8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658069623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViZS1Fqh4LrJmyEsY4LLYqY8ttoOfOBKJpZyPXIMcac=;
 b=VjwGicqsBCVQAAPw0uhV7T1gHlbz+H2IqbwbHHoHmQAuw6fR57cTilfM4G+ylBZ6VWZfSb
 4qLgu3+CP21G9M4c/9cvT0pAEwHeD1QO0IyVNu/6F9JemvWVArSkUIA3+cSOB1gNHFPpmQ
 l2VLaA0F6WJyrvPh5nSgvxbGqwoOHDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-5rVRMh-XOfuTJEzKnR_dHA-1; Sun, 17 Jul 2022 10:53:41 -0400
X-MC-Unique: 5rVRMh-XOfuTJEzKnR_dHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so1264615wms.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 07:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ViZS1Fqh4LrJmyEsY4LLYqY8ttoOfOBKJpZyPXIMcac=;
 b=q9vT1vVWumiTZQAVD0IHIYDky0iKtcIyqufHBt8akSldrSwj64XAWPvmW7HIpjNXsn
 Ja7uBS9gaoq64GaJwuM6U3FrBXwLl3R6lGQwn99cZR14Vrw+sjJD1iVZEvebYJ4X4sGX
 4VtAT74fcuq68y+InlAZ3HgiIaBb7zOG8a+htPmzmAfal5TuGvd7rURrOelqgKEywbyU
 PserihJkxcReCh5Uri5wOMXXHDYLkEj2+6tCWSvMYNFl7pVV4l+qT7nwkigiJXnLWoWy
 /h9lPB8a7rqQfKB2SzYLVQX02r0bVb5IPYlbk5JvVeKUXVk8z2ZH/snIgXTJCTBIZ4O8
 AVoA==
X-Gm-Message-State: AJIora+BMAlNgQis+HHFQzYYdriusVHYuwxDORxA1kSv5Avn6Ik7xCYR
 gW+3RceljAoGlMaFR++3NkPxaWb6ZdPtB4iHC2fhAK0iGkV7DBjY62vQUlmRAUPu9OeKDXjorCr
 Wtv+1CYyvQNR9fYD/GZxJPfIN9TWS
X-Received: by 2002:a1c:2b86:0:b0:3a3:7fb:52d9 with SMTP id
 r128-20020a1c2b86000000b003a307fb52d9mr14125500wmr.86.1658069620411; 
 Sun, 17 Jul 2022 07:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ue6hM9U7kXR7dCCLwoXIgnmw8QwRG01Ht3GdFZQ/sSKNvbaVowvn30MHLA3+XW3GHFNzkFUA==
X-Received: by 2002:a1c:2b86:0:b0:3a3:7fb:52d9 with SMTP id
 r128-20020a1c2b86000000b003a307fb52d9mr14125486wmr.86.1658069620132; 
 Sun, 17 Jul 2022 07:53:40 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a5d6607000000b0021b9504cc83sm8499918wru.31.2022.07.17.07.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 07:53:39 -0700 (PDT)
Message-ID: <c14adad9-7597-f16e-6f77-531f3c4852d3@redhat.com>
Date: Sun, 17 Jul 2022 16:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/11] drm: rename DRIVER_LEGACY to DRIVER_DRI1
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-2-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-2-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

Thanks a lot for working on this patch-set.

On 7/16/22 20:17, Sam Ravnborg wrote:
> "legacy" is a general term - be specific and use the term dri1.
> The first step is to rename DRIVER_LEGACY to DRIVER_DRI1.
> 
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

IIRC it was Thomas who suggested the s/DRIVER_LEGACY/DRIVER_DRI1
rename, while I suggested the move to a separate dri1 directory.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

>  	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&

Not for this series but I wonder when this could be dropped since is
only used by nouveau and only when CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT
is enabled.

AFAIK this is only needed for an old nouveau DDX so I wonder whether
someone even still uses that in practice. For example, we don't even
set CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT in the Fedora kernel configs.

--
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

