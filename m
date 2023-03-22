Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A456C47B7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8910E8F5;
	Wed, 22 Mar 2023 10:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4110E8E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679481282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAw1kb+1MttUiaf7ZI4njfkrYYVFnkuOfRgsWc6OSNg=;
 b=U6ADbOB4labQQJP4oCd8f2cIwF/qRaceJ4ZvcuhHtpEgp5WllQoiF+St++w+JgVfcsbvCE
 02TNrKQBMf5SzTLRtdcmzhaV44UNtzPX4NCZ7LjiyDs0msxAf8E9xFInSeqwYFKohZ25ni
 wKB8HQhsZlMQa/Bxqd7U/0J1dG/d/3I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-5o_CO4N0PuOjPgCzzkc0CQ-1; Wed, 22 Mar 2023 06:34:41 -0400
X-MC-Unique: 5o_CO4N0PuOjPgCzzkc0CQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r35-20020a05600c322300b003edce6ff3b4so4258285wmp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679481280;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sAw1kb+1MttUiaf7ZI4njfkrYYVFnkuOfRgsWc6OSNg=;
 b=HJmJ4L5Oa5AIzBI8vakut5ObtNddRyoDK9vOM6ecL7qwoIl1znV9E35byOHXRfFTzi
 G0W/+S7fEPZCUHltFZw7mcsArC+tvBA4uhxLBtX/nKLsUSbS1p8WWtsPGubOSkqvbJNI
 krb3R4DEjIq5CRH4aXMktC0iQ40KllyD3tepPCdyBLTFdyDFI8EYIuB8vsfCfm35Y3eS
 rrc+uHp7nzv2wZie1q60/pp4he0bQ1oijPjDWk8EzNIniJw+rZGgb8f5MxwTOVQX57R5
 +NToVdIoKbd1WlblMvN4j8evgGCi+owpr0QjFaGaHkHMxh054jmmP/pf1MlARqTlP6cu
 ERcw==
X-Gm-Message-State: AO0yUKWpqdlL64jtWJvd+s8Wpv/OPlEFULwYJ//OLd1scxpP7hIahIeY
 ksr72yuXpalHxey5W6/XrF2FeZ/etfOdqRl+TS9Y8t1n7jFEYtvRxpsbfglPIxsFcO14cOVdDAo
 vleZEkhiFHq4s8IiBS+9l87Sprb4C
X-Received: by 2002:a05:600c:ad3:b0:3eb:2b88:9adc with SMTP id
 c19-20020a05600c0ad300b003eb2b889adcmr4782445wmr.25.1679481280058; 
 Wed, 22 Mar 2023 03:34:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OJEunbX5gMc6MC+xeRbrZtBcXx8fDHwdAWSwBMT23hK8lYvS2ivGhxvkhzDa1tAAGkQFT7w==
X-Received: by 2002:a05:600c:ad3:b0:3eb:2b88:9adc with SMTP id
 c19-20020a05600c0ad300b003eb2b889adcmr4782415wmr.25.1679481279722; 
 Wed, 22 Mar 2023 03:34:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x33-20020a05600c18a100b003ede3f5c81fsm10182838wmp.41.2023.03.22.03.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:34:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 0/8] Support ROHM BU27034 ALS sensor
In-Reply-To: <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
 <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
Date: Wed, 22 Mar 2023 11:34:38 +0100
Message-ID: <87edphnkg1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hello Andy,

> On Wed, Mar 22, 2023 at 11:05:23AM +0200, Matti Vaittinen wrote:
>
>> Revision history:
>> v4 => v5: Mostly fixes to review comments from Andy and Jonathan.
>> - more accurate change-log in individual patches
>
>> - copy code from DRM test helper instead of moving it to simplify
>>   merging
>
> 1) Why do you think this is a problem?
> 2) How would we avoid spreading more copies of the same code in the future?
>
>
> 1) Merge conflicts is not a bad thing. It shows that people tested their code
> in isolation and stabilized it before submitting to the upper maintainer.
>
> https://yarchive.net/comp/linux/git_merges_from_upstream.html
>
> 2) Spreading the same code when we _know_ this, should be very well justified.
> Merge conflict is an administrative point, and not a technical obstacle to
> avoid.
>

I believe this was suggested by Maxime and the rationale is that by just
copying the helpers for now, that would make it easier to land instead of
requiring coordination between different subystems.

Otherwise the IIO tree will need to provide an inmutable branch for the
DRM tree to merge and so on.

I agree with Maxime that a little bit of duplication (that can be cleaned
up by each subsystem at their own pace) is the path of least resistance.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

