Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B271663D80
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652B410E57C;
	Tue, 10 Jan 2023 10:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125B910E57C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAavMdLMYQS8KDvy/QmYwp3yAiQs3jp3ojR6iwULEP8=;
 b=fg6tz6M/wYM8TDdljQ05YEHA+eb1Dm6ZI70rDfowv3oD4obb2cUVuRi/hTliJe5SInp2Ss
 UWTTG1GiHPmnb9yKgH2V97bp4ipuH3BSZOoJE6dcqvcsHzTxtL73vzxBCfSUM6mFuz7sLR
 9L/n/mSva12aMaoZzQrhs5EJyN0UnB0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-eLa8gcT4OO6CO7_C0WrKSA-1; Tue, 10 Jan 2023 05:06:44 -0500
X-MC-Unique: eLa8gcT4OO6CO7_C0WrKSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so8793730wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DAavMdLMYQS8KDvy/QmYwp3yAiQs3jp3ojR6iwULEP8=;
 b=WHC0kg9A/UCVgrXk9AtwrH7YlC4dtn5CsmlPurZ50QR+chx7qxG6/s/f0oYirKvnCw
 mQLBrTK9U7GfiQ2x7rJr2FQo05nhwMppTdQL53OvOXMMuqoN1W1VafmvaUb+yvwQFOI3
 80wyixuIdQCc9KSCFtqSbP2emXIs64cc8YDobSUGLmR+tDRl0TucgA92myj4nVWYzWCZ
 k4GwrHeK4FQthB8umC+oKPntPl3v2kZHVJPUmVp1DdI5BIv76Yh4kwJ1O9JOe52VAUty
 6HcAMA/k6ElggMI0C+IkrdjbQu/An6eWvVJabXD/Ey3dQTU2Q5ahtM9NM4EO9ZhxUlIa
 zd6A==
X-Gm-Message-State: AFqh2krQ6FM5VclN6xoWcaiIqv+H4ssFjpP2dOMyr6gdDGUiWj23ZdFn
 wfKLQQJyMrYtmR1yUWvy13ZrIDlx0BlsMrzGrsVBtWRbe13lMsQue7ZDtYoUVyBLrTpuQ0qsY+i
 YfYPwA8sd5COEZ167/TI4+4kPBsLR
X-Received: by 2002:a05:600c:a4e:b0:3d1:baf7:ceae with SMTP id
 c14-20020a05600c0a4e00b003d1baf7ceaemr48470363wmq.39.1673345203573; 
 Tue, 10 Jan 2023 02:06:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXustVBLFMod0Ysl9pp1lSFcTlLRBNXkhTnrLQgzZI7f9seODCVijOnxicu6ku/QJEPJaopMGg==
X-Received: by 2002:a05:600c:a4e:b0:3d1:baf7:ceae with SMTP id
 c14-20020a05600c0a4e00b003d1baf7ceaemr48470347wmq.39.1673345203391; 
 Tue, 10 Jan 2023 02:06:43 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm21059069wmq.33.2023.01.10.02.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:06:43 -0800 (PST)
Message-ID: <b94b0717-db66-6ce0-5277-f3ce5b1d22d2@redhat.com>
Date: Tue, 10 Jan 2023 11:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mxsfb: improve clk handling for axi clk
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200720153254.18071-1-u.kleine-koenig@pengutronix.de>
 <b404a675-a186-1253-e8ad-762461526594@redhat.com>
In-Reply-To: <b404a675-a186-1253-e8ad-762461526594@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/23 10:26, Javier Martinez Canillas wrote:
> Hello Uwe,
> 
> On 7/20/20 17:32, Uwe Kleine-König wrote:
>> Ignoring errors from devm_clk_get() is wrong. To handle not all platforms
>> having an axi clk use devm_clk_get_optional() instead and do proper error
>> handling.
>>
>> Also the clk API handles NULL as a dummy clk (which is also returned by
>> devm_clk_get_optional() if there is no clk) so there is no need to check
>> for NULL before calling clk_prepare_enable() or its counter part.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

