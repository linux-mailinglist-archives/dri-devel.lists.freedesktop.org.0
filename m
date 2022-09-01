Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B6B5A984B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 15:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED04D10E5A8;
	Thu,  1 Sep 2022 13:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994DA10E5A8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662038252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbU0ErSCeBzcqs0VQ9yr78KT5w2WG2r+58K65PvKptQ=;
 b=SmZ0mNBCdhdJ5C4A4eefTfWvROV2ESKzaw9sRo71lrdkiS7CFT5swtpSXbSvRXGKtzv45f
 f7Jd52dJHE6TFuXfXACO9KSEPtE7Ejc/HqZFiZnjdYbc3IRWW97PPEwnk8IR7h5Fy6xYsh
 bsklvI8mKNDgJo1CFiUiPowRNVdsBrQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-Tf8XcaVeM9uWRWgGWTM5mQ-1; Thu, 01 Sep 2022 09:17:29 -0400
X-MC-Unique: Tf8XcaVeM9uWRWgGWTM5mQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so1248940wms.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 06:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dbU0ErSCeBzcqs0VQ9yr78KT5w2WG2r+58K65PvKptQ=;
 b=qFGnEkytdJjYKAmN733avOrfhjhKX59CTj0oa4h7kmZoTtiFQccwghQT3fUYJTkjYp
 kk0pBvFRXZ6VtXH5YGC5YNdqAroB3zlYLQK05mpqOv5UXDgaFNggWdXXW9OzWImsE8DS
 7Tx+OSNtYmKD3oY9Ifsr3n0ogAfk+VsehT6RakZ2l2b4sDLEoXEu4NvsOYstINWz6mzj
 36nqlAuxtrVy3++x3FadUO9jxbd+r4KCHjDjD/XewBw6tOaDLY9KSsfJmD8RizQ24oI0
 mOLZq7cVIwYm6jJOZwWw/kiJsuPfGPLUi7pQB0bEOG6WUIyn5LuHaR7iRq0z9zNnetpJ
 ovuA==
X-Gm-Message-State: ACgBeo1dnOcgj94qHv245AzmtlLg0otgSVOZfesRX1RXYhQd4rvSK6hF
 gBZFnliSCCqhoSbBMADQSfuD6vXwAVpuskpau7lvpoILr4dZTU5VJipLB4CgfQQaAcb51uzcTCI
 reqkw5xyiKcgGZY6w3g4ZWmE7YXOQ
X-Received: by 2002:adf:eb10:0:b0:225:70d5:e994 with SMTP id
 s16-20020adfeb10000000b0022570d5e994mr14332338wrn.425.1662038248616; 
 Thu, 01 Sep 2022 06:17:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7MFLzLBOV4HiscaGRSbKZajVvC/dHCpC9549jZEyDkd1lo6YzUYUmct/A+r7uLnmWiTNjnrA==
X-Received: by 2002:adf:eb10:0:b0:225:70d5:e994 with SMTP id
 s16-20020adfeb10000000b0022570d5e994mr14332322wrn.425.1662038248419; 
 Thu, 01 Sep 2022 06:17:28 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z14-20020adfd0ce000000b002253fd19a6asm17374003wrh.18.2022.09.01.06.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 06:17:27 -0700 (PDT)
Message-ID: <087acab2-c230-fe5d-9ab3-2b8a18e42175@redhat.com>
Date: Thu, 1 Sep 2022 15:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220901125530.b56s4zisnkfuigvc@houat>
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
Cc: michal.winiarski@intel.com, Arthur Grillo <arthur.grillo@usp.br>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/22 14:55, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Maíra Canal wrote:
>> With the introduction of KUnit, IGT is no longer the only option to run
>> the DRM unit tests, as the tests can be run through kunit-tool or on
>> real hardware with CONFIG_KUNIT.
>>
>> Therefore, remove the "igt_" prefix from the tests and replace it with
>> the "test_drm_" prefix, making the tests' names independent from the tool
>> used.
>>
>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
>>
>> ---
>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing (Jani Nikula).
> 
> I appreciate it's a bit of a bikeshed but I disagree with this. The
> majority of the kunit tests already out there start with the framework
> name, including *all* the examples in the kunit doc. Plus, it's fairly
> obvious that it's a test, kunit is only about running tests in the first
> place.
>

Agree with Maxime on this.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

