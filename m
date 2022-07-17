Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115735776F2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C041290EDC;
	Sun, 17 Jul 2022 15:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542D90EDA
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658070836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XNJ18YLcvtfGpj8wGpvqNWr3OYMHHLbLMiQ9wli0uI=;
 b=bPAq8RmznuFUi6y4BtzJqskp2wlapeSEebI33vLRKBHKkIeS0dNbKOuXtrNB0m7YlK7ikF
 kR6dBKkmcx4+16BcaJN3XyHBM4VFYg8B4uJBLAjg4jfS95FyTF5LE9/dp3BTviPkcF+3s/
 Er+6uej36LP//pncyDo5Fj/fs4eg0rU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-jLY5Mu8gPw6Zmb5sJVdR0Q-1; Sun, 17 Jul 2022 11:13:50 -0400
X-MC-Unique: jLY5Mu8gPw6Zmb5sJVdR0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so3821589wma.5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+XNJ18YLcvtfGpj8wGpvqNWr3OYMHHLbLMiQ9wli0uI=;
 b=wMKtkk1GO1nRhrB01oPP6EWFO1RXoNio7blGOysARzCXNvDF475kKYtQMD4PFBehDT
 rBAFEL9wyBNgCztvRKilcMWkIkhKLgFEbsb8mLWe3RNR1wB+9yNc9c2DmkEK/4ShMVGY
 nFmi4QdiN+8oJD1lcHQBaM60/UHP2kwc4FwZPi/HNGL+RJ6fXFF3FBteCKV+KuyRfzrn
 ciG86PHdIHQScyVRRP5Cj8Net/Idq3NtOdzxyx0dyCux0zJ3yESaLfVw9wd8iKVXxmdA
 NePuPgwBgq9dbZZAXpA7FpA/UpLnw0FGVCbbxWA4VgrreFY7ouxkXzoYFirhmHRNiAsS
 otEQ==
X-Gm-Message-State: AJIora+MlGTilXzDXztKyQjJuIlKhC9LxcrjRkyvj0HWJaSHjlAWcCvO
 PCwuDcls7c6QH7+ZFwZGfPzKQtVqcboqXfEM0EcW4H+C9PA4Ec1xJfMmCzo7N+fUXIMk7aSUMw4
 LDGwFnM4hPFL6DZQV5DUD4g1OPtjX
X-Received: by 2002:adf:f1ca:0:b0:21d:5eec:1320 with SMTP id
 z10-20020adff1ca000000b0021d5eec1320mr20373207wro.196.1658070829041; 
 Sun, 17 Jul 2022 08:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBqHCECMp4XDXPXgQcWdKh/5mAhhdk6rWp+KpWp+pFDzokAjPXpDp8eqg75hyY8wlz9UCnxQ==
X-Received: by 2002:adf:f1ca:0:b0:21d:5eec:1320 with SMTP id
 z10-20020adff1ca000000b0021d5eec1320mr20373200wro.196.1658070828823; 
 Sun, 17 Jul 2022 08:13:48 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc30f000000b0039c54bb28f2sm11946838wmj.36.2022.07.17.08.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:13:48 -0700 (PDT)
Message-ID: <6a30fa35-02c9-e085-49b8-e440d56eddb2@redhat.com>
Date: Sun, 17 Jul 2022 17:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 03/11] drm/tdfx: Move the tdfx driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-4-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-4-sam@ravnborg.org>
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
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

I believe these should be chronological and so the order inverted.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

