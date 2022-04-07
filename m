Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92914F8086
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8CF10EA15;
	Thu,  7 Apr 2022 13:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282FF10EA12
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649338210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFOEsWzoiUS9y0uNWiK+Uj/FvgEiEbzhwqlHCzAenJo=;
 b=ZYfgUd6YdYRJcoKk45yoz38cTmhbxYExfVay+KYBnYYqvnicOixjvR8VrgEBSaZifBLSn1
 YxTq/uPwgiN86IfJCnQqjnh1iJR1Z19NXfpjXrOiL8YL83PW82Bj1Tkz40y9AQPgnbd8ZU
 AzRUHaVi1PwNReLm0rRThD3sbbKvDaU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-WAiGUNlJOOKvlko56P9kYw-1; Thu, 07 Apr 2022 09:30:09 -0400
X-MC-Unique: WAiGUNlJOOKvlko56P9kYw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so2992643wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oFOEsWzoiUS9y0uNWiK+Uj/FvgEiEbzhwqlHCzAenJo=;
 b=GdQLJ2Fx7nZGIRapS/DT9nZqXdNwwwfCc44ShSzx1LXmbufb2J9zNfEAVP7KfZFX22
 KH5mvYtdUC8ieyXimdkU5zjl0FRj3w+28WVG/63+hb3hV5XwFpqGcdDtn22+yfnT8QxQ
 IGb5eeRgSxytb2LpeTPn8KhGyhYvkNbBXlIDoBVAnFJbmuxzv9rICiTsc/UU892L/nbD
 vbpwyh5FfVNsrW1Y4SyiUU9S+CWRQrPGw4+++/NntMH9h6PT6U+oz0maBZkRRkSieTXV
 8P4PbjriuWRMa7rnIubRukrR6TVQfod2ATRHaBWI5WUxUzvRKtpDYAZJoQ4Pmez+HHxx
 GIhw==
X-Gm-Message-State: AOAM532RtUBg4s7oHgSXqJf5U8t8DxUWtBo87AyOgT+Uqu9utt0FHTZt
 0mF3nZhkpHiWNe2RMxZXmSBnW1k3OZx4lUjBeUmPVDDeilBEj2q2rfbhnGX8xHiYZM9tOxjAmFw
 BDDayZf+CK4kLfLRA1a2xu8OefEY3
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id
 n7-20020a5d5987000000b002041f216a29mr11125682wri.716.1649338206614; 
 Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHhyt6TJv9cnYh3O+w2+P8EerBGfzJnZrRoxkX8R2UxyrNxuqiqRa2rKZwAlKyV73pUqeKBQ==
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id
 n7-20020a5d5987000000b002041f216a29mr11125665wri.716.1649338206429; 
 Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a5d5602000000b00206120e0b0fsm14766168wrv.18.2022.04.07.06.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
Message-ID: <a6e442f1-cb22-e196-1546-67e0c9b1a921@redhat.com>
Date: Thu, 7 Apr 2022 15:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/vc4: Use newer fence API properly to fix build errors
To: linux-kernel@vger.kernel.org
References: <20220407131950.915091-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220407131950.915091-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 15:19, Javier Martinez Canillas wrote:
> The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
> dma_resv obj v7") ported all the DRM drivers to use the newer fence API
> that specifies the usage with the enum dma_resv_usage rather than doing
> an explicit shared / exclusive distinction.
> 
> But the commit didn't do it properly in two callers of the vc4 driver,
> leading to build errors.
> 
> Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
Pushed to drm-misc (drm-misc-next) since this fixes a build error and
Christian already reviewed it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

