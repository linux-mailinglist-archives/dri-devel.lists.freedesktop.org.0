Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA357770F
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257A8D916;
	Sun, 17 Jul 2022 15:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2FC8D916
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiYjzk6khkVRwH0Lf1K5nVqmd/H8pBMnxgFeeU5FoQo=;
 b=OpPEuUZXNrBVIkobOtkFhrq4TPxt/0ygJ+bApBOdRkogaH0EJTfwZZ0AuKcTi+AnWtf/V1
 mzJc9e73lj0FSPwqIeEX0ZA4CjT2k51IRaGFbrBRnpd11hQ6y9AWd/4dCLn7gW5eBOlTuJ
 oe1m6lBG8HxJ/H4wGA14+XoIDF5BSKk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-eVReHL6NPESUyo6YxUD7aA-1; Sun, 17 Jul 2022 11:26:29 -0400
X-MC-Unique: eVReHL6NPESUyo6YxUD7aA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m10-20020a05600c3b0a00b003a318c79bebso1023387wms.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QiYjzk6khkVRwH0Lf1K5nVqmd/H8pBMnxgFeeU5FoQo=;
 b=h4e0klrWgL9BWCfTLhQeNxGtQILR630DGyTQ+fz2d0p/DZJ4wzOR6GGZHrsne1y6uP
 NZTtndhV4KtQRYC4opOTYTKnMMOVvT7Izs+EsaZ2bUkAGweyICIGr/GjOkjILrCwOOA2
 jvyPWBC1A82CifavZ+jOna8RmD5+g+SK6P50W6TP8pLM8m0ilvR5KZIXhlUoEoKwZwiM
 2UVMbUfra1k5ywynp1a3W9MstTv54VttRDJheKqs03Eeg6nyrgiXwVmGnyK4VwAJCL9S
 Jd8mA6qko/2Q6EidfUGY1grlfhkRrymfuDYuMyjreDj3M//Q3G2OX0NHqU5NSBz2/A9W
 bYXA==
X-Gm-Message-State: AJIora8szTGzfmzUo2/yT5J1WD+IXjV5PWF2Fg5Ev7xesAYBATnLMUkN
 iwMaOR4GLpywfkAKvT4mkW6Rac4aSjs75qGelJrmN15hL1+uyVcOr5xlA/g9/39yvlxfrc8kOPE
 wii/UaUNGyo810ZBVsuR1AYkCxR+0
X-Received: by 2002:a5d:6288:0:b0:21d:6c75:82 with SMTP id
 k8-20020a5d6288000000b0021d6c750082mr19374690wru.218.1658071588586; 
 Sun, 17 Jul 2022 08:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swxkrv0XxuYzZPX2xKnom9nYwtPC/J/Dn9PFnwerzXnWHg+1fI7jqufqD+9sPwELEVmrjnTw==
X-Received: by 2002:a5d:6288:0:b0:21d:6c75:82 with SMTP id
 k8-20020a5d6288000000b0021d6c750082mr19374681wru.218.1658071588413; 
 Sun, 17 Jul 2022 08:26:28 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a5d6607000000b0021b9504cc83sm8552845wru.31.2022.07.17.08.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:26:28 -0700 (PDT)
Message-ID: <5afb3329-c23f-b924-2db9-62989756c2fe@redhat.com>
Date: Sun, 17 Jul 2022 17:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/11] drm/via: Move the via driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-9-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-9-sam@ravnborg.org>
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

On 7/16/22 20:17, Sam Ravnborg wrote:
> drm/dri1 is the new home for all the legacy DRI1 drivers.
> Used the opportunity to rename the file to via.c to match the
> name of the driver.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

