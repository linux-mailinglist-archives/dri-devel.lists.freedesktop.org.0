Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69754E77C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947910EAE4;
	Thu, 16 Jun 2022 16:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F4210E265
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655397830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjMtM8OGnDrbMwcn+8vKnlZdrkOGRhE/5nADc7InRc4=;
 b=QQuXwHmE67b/gsrG9OI8Lv0R9GTGYVZkMj5OXclXbD1Z0yzpbna4l1uPx/0g28Ljd0kR/x
 MRWqiRtwEdU0GghJi+VmHwaoHYAlBtvcqcho6jHADJVBRQU19Bn+Qyo3fUlP+L38NFPqQm
 9yXvmGsI+oR2EnTPgzZsX1BQR9PqWsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-RIRYARKzOVuUMhkRSqbqCA-1; Thu, 16 Jun 2022 12:43:49 -0400
X-MC-Unique: RIRYARKzOVuUMhkRSqbqCA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so852168wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AjMtM8OGnDrbMwcn+8vKnlZdrkOGRhE/5nADc7InRc4=;
 b=G+6Dd7ogeVWRlUz/P6C0Y+ZA3yOScTbH5h22KZ8KnO+HNNIF1bwsYXyZ3nydlPT0gL
 ohqmHB6B/l6aWiYedA+tlSiJvG4u/ZvAn3VV5WXpdwKVqU/8+bkmtUFE6s+8/gty+XLe
 5hrNCY7LDEHoIxouvmsLajMh+RHFzb6Jb3M59t7AiSWGe+/B8EtDZ58cakeDkBSanMAK
 mccfSWndsHSPU6oyvVWg6vNuTZ9pofisq+x2MrdicZTAYnqHu9tNyMFjNqdC9Ov8w+ph
 uGfiaSl3TkxHyBkU+LcPZRXKqHPNjIfzWfS9GYerK/fHMUebtTwPwvSyR+pgD+Lx7sLI
 JHEw==
X-Gm-Message-State: AOAM531LSbDsFsnyBsSB7ga8WWTK54sfxhfX6u3TrBbtTx1cks6XOSo0
 sTvK+QFr8FRhrDDBXwAa6VNvQWU078mi/MUH7q/9w1t+/FarAC0gtIVZUxykq6gU7u5UtrD72Vs
 8+tF/jmWgSmAd9AWgEgL8nBKK2h25
X-Received: by 2002:a05:600c:10cf:b0:39c:8270:7b86 with SMTP id
 l15-20020a05600c10cf00b0039c82707b86mr16724421wmd.180.1655397828435; 
 Thu, 16 Jun 2022 09:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8+fKsEXIAvNyB94ZpK27ofIlM12w0GekOLSDeZEFo92yryX6GxBCFSwKJr3GgRIgUlCaqhQ==
X-Received: by 2002:a05:600c:10cf:b0:39c:8270:7b86 with SMTP id
 l15-20020a05600c10cf00b0039c82707b86mr16724402wmd.180.1655397828203; 
 Thu, 16 Jun 2022 09:43:48 -0700 (PDT)
Received: from [172.20.10.8] ([185.124.31.117])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b0020e63ab5d78sm2381222wrn.26.2022.06.16.09.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 09:43:47 -0700 (PDT)
Message-ID: <d6c00532-5546-ea4a-1927-9d4ea5e83741@redhat.com>
Date: Thu, 16 Jun 2022 18:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/10] drm: selftest: Convert to KUnit
To: David Gow <davidgow@google.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <maira.canal@usp.br>
References: <20220615135824.15522-1-maira.canal@usp.br>
 <CABVgOSkVOKx1EEYtg-Os+kui-UivfFLT9OSEB9+sDxcgcxh5Mg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CABVgOSkVOKx1EEYtg-Os+kui-UivfFLT9OSEB9+sDxcgcxh5Mg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 michal.winiarski@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 KUnit Development <kunit-dev@googlegroups.com>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, mwen@igalia.com, n@nfraprado.net,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/22 16:55, David Gow wrote:
> On Wed, Jun 15, 2022 at 9:59 PM Maíra Canal <maira.canal@usp.br> wrote:
>>
>> KUnit unifies the test structure and provides helper tools that simplify
>> the development of tests. The basic use case allows running tests as regular
>> processes, which makes it easier to run unit tests on a development machine
>> and to integrate the tests into a CI system.
>>
>> That said, the conversion of selftests for DRM to KUnit tests is beneficial
>> as it unifies the testing API by using the KUnit API.
>>
>> KUnit is beneficial for developers as it eases the process to run unit tests.
>> It is possible to run the tests by using the kunit-tool on userspace with the
>> following command:
>>
>> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests --arch=x86_64
>>
>> For CI system, it is possible to execute during the build. But, we also think
>> about IGT: we are developing a patch to introduce KUnit to IGT.
>>
>> These patches were developed during a KUnit hackathon [0] last October. Now,
>> we believe that both the IGT side and the Kernel side are in good shape for
>> submission.
>>
>> If you are willing to check the output, here is the Pastebin with the output
>> and execution times [1].
>>
>> [0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
>> [1] https://pastebin.com/FJjLPKsC
>>
>> - Arthur Grillo, Isabella Basso, and Maíra Canal
> 
> Great to see these going upstream!
>

Indeed, this is pretty awesome!
 
I haven't reviewed the patches yet but just have a meta comment. There's a TODO
entry for this [0] in Documentation/gpu/todo.rst, so I think that you could add
a patch removing that as a part of this series.

[0]: https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n620

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

