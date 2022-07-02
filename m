Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAD563FF4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473818A828;
	Sat,  2 Jul 2022 11:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0618B0AE
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwZGWyzbjndeRVONcRo/Y/Xi6a7qOfJRRZZ6iABpQ64=;
 b=PLwNShmg41MeYHWwlaHWngpK4TdhD4DCpRPT43Esyl+gM8LEF+3NqUdg7QPriyhqFgWFLr
 VBlooAUUyaEwn7GO9otG/RA1kkVX7T1URcCeTxNUT7ptnbRIHIRJG1IA5aSemOSJrsurPV
 t/9zRd2r6xyudmYpxuE9+7PLV8jGR6Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-bJZ4B91tN7enmQBsc2TwXg-1; Sat, 02 Jul 2022 07:56:31 -0400
X-MC-Unique: bJZ4B91tN7enmQBsc2TwXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 130-20020a1c0288000000b003a18127d11aso1349127wmc.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cwZGWyzbjndeRVONcRo/Y/Xi6a7qOfJRRZZ6iABpQ64=;
 b=2SdUULMKlyI03KfnAEK2j4ZSOOd+k6UXFD9HdmnGrYidV1rkUHsxpuzWSudtcpGskH
 inQcLMB8EvNG44QhnLJdQ4q+0XN0C+mAod3PPkFeEdZM0kZk+dmj8CGrb5uDOlNwe8nj
 ki2c2TpK7KMvkr0ITeCpb5VkN9yzEbxOdSU6Eq5wlprnCoOPs8SLecmTTDsW0VVYLFnR
 Sm1j3MbNQOGDjMPIfVSBA6ipgDgUBsMG3fRsHkUQAgvq/jxaISzhcFohmAAXoNvAWIC1
 R/Yvjcgme+OEqJ8Il1MhkVWbbQv8BW+BFnh0FfXKZOmWTxE6/+CaS1CKw9HeSxt45Lc6
 0RCA==
X-Gm-Message-State: AJIora9861eZniD1mMsk8S6tCUt7gn9UAFNQccZN4J4/yiNMmxjl0ztD
 iZokZUmf3Npj69o4LZnXIFM1F3Vvu+vpUjOxKRGYQ1sNQHTpEmuQH45K5xKUsCkuw+yhyZtAyi5
 sykVp0D+feI1row+1BHvshV8fLsdB
X-Received: by 2002:a05:600c:1d96:b0:3a0:30b6:bb1a with SMTP id
 p22-20020a05600c1d9600b003a030b6bb1amr22390000wms.93.1656762989837; 
 Sat, 02 Jul 2022 04:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uk1mCSCBDnIRoFf17fUzrFaDhgaShQwBHJ3hzA8TaQPISsd83pmv8uOjG8mUc6UBeHaesGRw==
X-Received: by 2002:a05:600c:1d96:b0:3a0:30b6:bb1a with SMTP id
 p22-20020a05600c1d9600b003a030b6bb1amr22389983wms.93.1656762989620; 
 Sat, 02 Jul 2022 04:56:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b0039c4f53c4fdsm12403602wmq.45.2022.07.02.04.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:56:29 -0700 (PDT)
Message-ID: <9185aadb-e459-00fe-70be-3675f6f3ef4c@redhat.com>
Date: Sat, 2 Jul 2022 13:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/9] drm: selftest: Convert to KUnit
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
References: <20220630004611.114441-1-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-1-maira.canal@usp.br>
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

On 6/30/22 02:46, Maíra Canal wrote:
> Hi everyone,
> 
> Here is the v3 of the conversion of selftests to KUnit. Since the v2, there
> have been minor fixes. drm_format_test received the biggest change: the
> KUNIT_EXPECT_FALSE and KUNIT_EXPECT_TRUE macros were changed to KUNIT_EXPECT_EQ,
> as suggested by Daniel.
> 
> Most of all, the patches were rebased on top of the recently applied patches
> for drm_format_helper tests (8f456104915f), in order to avoid conflicts when
> applying the tests.
> 
> Thanks for your attention and any feedback is welcomed!
> 
> Best Regards,
> - Maíra Canal
>

Thanks a lot for working on this! The patches look good to me, I just had some
minor comments. If you re-spin, I think that we can just push the whole series
to drm-misc since the patches have been in the mailing list for some time and
have already been tested/reviewed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

