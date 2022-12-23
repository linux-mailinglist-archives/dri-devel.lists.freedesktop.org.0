Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B231654DA0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D13B10E16D;
	Fri, 23 Dec 2022 08:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200410E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671784989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgXrKZUe+WALJkno7gEXFcqYGH8VWbaDYjiO7PdT1GY=;
 b=GZ6JecKqjveu6IauqKWh4fBPjT4oKedXidJD9IDoKTv+yrZnw8YHVg3b2Zz2tkzbaM70SG
 pugaZeXxjqL+NS/9Z8FvEBlNsbwUPnHCSYZgHl2q1HJYJyMtPVu1Sui2dBskiDwjF7NTtS
 88bkwNviAt8TbLfYlqGaAd/FDGKLYBA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-FnOaK1ulNnSh5y-yxGMDgA-1; Fri, 23 Dec 2022 03:43:07 -0500
X-MC-Unique: FnOaK1ulNnSh5y-yxGMDgA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso1930735wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 00:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgXrKZUe+WALJkno7gEXFcqYGH8VWbaDYjiO7PdT1GY=;
 b=0dJ2Yxw3TOk4Svq9pGFeVD7d61KYyFONAsEvj1Q3H5yTnrXYExUGcoYJLLGZszc7ky
 2Vj9Ck9m71LZaYwN4vcEBSVSfLTMI5eYaag3qKncILHHTFDhoiozW57i1ejCtWn5j3wA
 aqDcUR9MpYd6MGyK4p0eJ3bXsDpjXa0l2VT9IxdbM02hk6rQWGYRUxvr4Gq6EEPv97Ab
 GNX9TftswENF0a0LDxJ6ucPW6A5hHG+r7wX+agJK03GK0AwkBgIONnIEe9FQA5pOXmDw
 WmZe51CFbbHquumP0OAZwrNok0xiOIqPSsSRxGQ7tMkjnwYC/MaBXm+X8uJmT4KcoF1s
 ttPg==
X-Gm-Message-State: AFqh2krEC4jLK2PkLRINahpN/rkPM0aABGQBodfN7lHrVkLjBZq7ksGS
 YmCkNMnB3V0arAm3Y472sWwuolwrp9xNSGEOzxLBDn1URYzQxd2fTDrgL1qVi2un/MnsM8i1a/p
 09XYd6RoqP9768s+Wxm2ig0OnLMkE
X-Received: by 2002:a05:600c:4b1d:b0:3d3:3deb:d916 with SMTP id
 i29-20020a05600c4b1d00b003d33debd916mr6521875wmp.4.1671784986897; 
 Fri, 23 Dec 2022 00:43:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3UL952lVtLJ0qs53l9fiyT+QZnYGFRXQO2Ej3Ix2fHwc2pFojvZWk3mRXz2OYnq1zBbZe4g==
X-Received: by 2002:a05:600c:4b1d:b0:3d3:3deb:d916 with SMTP id
 i29-20020a05600c4b1d00b003d33debd916mr6521855wmp.4.1671784986719; 
 Fri, 23 Dec 2022 00:43:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d12-20020a5d4f8c000000b002421a8f4fa6sm2422507wru.92.2022.12.23.00.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 00:43:06 -0800 (PST)
Message-ID: <61684a3a-a225-59cd-ade6-ad4ae7d1d8b3@redhat.com>
Date: Fri, 23 Dec 2022 09:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] dt-bindings: display: Add Himax HX8394 panel
 controller bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20221222223830.2494900-1-javierm@redhat.com>
 <20221222223830.2494900-3-javierm@redhat.com>
 <9636776f-d7f5-02cf-7290-69dbba6de6ab@linaro.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9636776f-d7f5-02cf-7290-69dbba6de6ab@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Martijn Braam <martijn@brixit.nl>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

On 12/23/22 09:12, Krzysztof Kozlowski wrote:

[...]

> With three above:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Thanks a lot for the review! I'll fix the issues you pointed out in v2.
 
> Best regards,
> Krzysztof
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

