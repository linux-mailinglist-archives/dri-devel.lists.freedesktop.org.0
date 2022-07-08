Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA956B9E3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328C113787;
	Fri,  8 Jul 2022 12:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000E5113787
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657284182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncQ+KfyiHNfyVvOAGnrmlZhB6oXAdw/76/PZWEd53BA=;
 b=Vey5MbRf7Qv/m5M3SCtbGHnDYHPXHj8mn0jPqIN9sgBaUQxpoJZP5tbv8Au/D9e77nA2Ob
 ICOhjv+6W9JXkZLK8ecoR96vw9T0CJHbHBL9C2tWKjwncX+OCi6uUtMIizUT+/cHJpDV3t
 eVuz4LUAm2d0plnERBVXajIWYERC/G8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-QyYX7jqVOUywCcohgAjOWg-1; Fri, 08 Jul 2022 08:43:01 -0400
X-MC-Unique: QyYX7jqVOUywCcohgAjOWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g10-20020adfa58a000000b0021d419f7751so3865732wrc.23
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ncQ+KfyiHNfyVvOAGnrmlZhB6oXAdw/76/PZWEd53BA=;
 b=lU0cNHbQoNFUwj17gXMhK9Tg4NYABdAwdxhPceuS6fZkjZkzzl4WgGH+DHfB5LrgdE
 SQrcU82WZ7z4IRyAMGGVIF/yDcx9k3E8zs85TygG4mJLk0nRA0yB7Tu1Xr9Q1aUQVvFW
 XY84nDG32gUCMLTwY1dRmOIv0VbuA323nPrEqUQzmEX0XK1U6I7dXj/Upr6RyoWbeU7y
 48x2sIRBz/70F5YLOIknNk/mudkgrl3pS1EHvKphmKknnf9J2mJiQU5RHbAYnNq8vQb7
 Cl3Iqg1zRC53VAQ8E8C/irQcSMB3GoxM+BaCzc5vTk5Fb7sehAHcBV634SR+cQQOB1EU
 CTeQ==
X-Gm-Message-State: AJIora+rg3n/m2ppirfR8/Fid8hiZcQxBpiaoR29TyUNP4dlwuKJfF1+
 NfIrqDPjNT+Avj3eYbK0dXKxKPuq90T+Exs5gqtEkOZDPE30erDx0HzZXtPUodv7dedzv7Nr5ei
 l16ZrEUPdGmvOIuCbFUmcLT/NvKOq
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id
 bk4-20020a0560001d8400b0020e5fae6e71mr3107636wrb.224.1657284180423; 
 Fri, 08 Jul 2022 05:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uceXvLb2nTRXllLSEuJcv3LiXxdEtNQWkA9mvcK64CjX5el+CmC6lNxnhsOQy3kBPHocjj7g==
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id
 bk4-20020a0560001d8400b0020e5fae6e71mr3107608wrb.224.1657284180216; 
 Fri, 08 Jul 2022 05:43:00 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 id8-20020a05600ca18800b0039c4b518df4sm2469004wmb.5.2022.07.08.05.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 05:42:59 -0700 (PDT)
Message-ID: <e49487ae-3531-1baa-4277-83d858c28837@redhat.com>
Date: Fri, 8 Jul 2022 14:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/9] drm: selftest: Convert to KUnit
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220702131116.457444-1-maira.canal@usp.br>
 <4c2dc8cd-56c4-6e15-d76e-429dba87407c@redhat.com>
In-Reply-To: <4c2dc8cd-56c4-6e15-d76e-429dba87407c@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maíra,

On 7/2/22 15:17, Javier Martinez Canillas wrote:
> On 7/2/22 15:11, Maíra Canal wrote:
>> Hi everyone,
>>
>> Here is the v4 of the conversion of selftests to KUnit. Since the v3, there
>> have been minor fixes, asked by Javier. Basically, fixes on the SoB chain and
>> addition of Copywrites.
>>
>> Thanks for your attention and any feedback is welcomed!
>>
> 
> Thanks a lot for the quick re-spin of the series! I'll wait a few days in case
> someone else has additional feedback and then push to drm-misc (drm-misc-next).
>  

I wanted to apply this but noticed that there are a tons of checkpatch script
warnings and checks failings. Could you please take a look with the following:

./scripts/checkpatch.pl --strict -f drivers/gpu/drm/tests/*.c

and fix the ones that you think are not false positives (I think most of the
issues pointed out are correct). I could fix them before pushing but I prefer
if you do, to prevent me adding any regressions while modifying your patches.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

