Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E444FD2CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404910FB4F;
	Tue, 12 Apr 2022 08:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF110FB4F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649750644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbhl05HtZCAM0QbsYgzFCTx28ZJJnBHmU8lbBNZDClo=;
 b=VUu1DAQFREtABIaWbgyYa+PfFsyzyANY+oXmNFG6pX9R2zocLQBFF43G6N6VpNWS3u1+39
 Evwmvuyyw/0KFBneNQQRjPcWl4BgU5XrF29Em97goUGL0fU59URrhawcSx6tnaaQ9RmdAt
 nWV003jYiucSIS4uuYoLwQx9p5jVHEk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-isvGAqfrNeGv7EG3xiM8VA-1; Tue, 12 Apr 2022 04:04:02 -0400
X-MC-Unique: isvGAqfrNeGv7EG3xiM8VA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g13-20020a1c4e0d000000b0038eba16aa46so921533wmh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rbhl05HtZCAM0QbsYgzFCTx28ZJJnBHmU8lbBNZDClo=;
 b=N8FOE7S3uK243KQsQaJ7/SrPKvpEJiI8k+UP0hhkpZ713tS/oQ+RD2VnlZfCNewzbQ
 eNI//u0UKGFT0U18iCT7vaQlW/B5jX8QikGD13LhkmAeT1MqckAYhUD47qoVnCAlxFQH
 lhiHL9PM8ki31pZqMss0aEHVUHbiR5ViW/SPf5NGuMYkW7NbM4e3ugD3hWUGZOpMiIZG
 fto08G7PFQExNidYZzuyHfnyWRS6wJ8p/BlQOemt+M7fhxtb5XwdN+YnEM+7aFD5i0wU
 BY55MnqdyMRc4YfK3hdKiP6DJ8jvQg/gi+kcIb2BlSR7OZ2ECEtZOSctJ9a6h8yutIFh
 xCdw==
X-Gm-Message-State: AOAM531FuOSSvfqDgJHtfVqUkJkLSugQg+tfu4ZM+EJbCZqHCj2aBFVL
 dREv4847WwKuB86MYL1HgAA3NOpYGMLG5CgIik1j0Ixg054CoqxMDEZC8JdNnmiMfm5O4UrFHOr
 wDviURDy4J4R3l3kg4i+oj819DGRb
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr2903818wmc.2.1649750641727; 
 Tue, 12 Apr 2022 01:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNulvYOKyNljk5aO/TEUcOBw7IP2//9iJfeiOVa008fbcM5pJ/mjc3Z/KG9RH+aMGBaU2irg==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr2903798wmc.2.1649750641518; 
 Tue, 12 Apr 2022 01:04:01 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b00207ab405d15sm2767291wrv.42.2022.04.12.01.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:04:01 -0700 (PDT)
Message-ID: <bf65cc48-d7af-150e-b6c5-84721b9175e8@redhat.com>
Date: Tue, 12 Apr 2022 10:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/5] drm/solomon: Add ssd130x new compatible strings
 and deprecate old ones.
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-4-javierm@redhat.com>
 <CAMuHMdWVZ2+YYkLUjCYLjCQx27AvMUPkwrUkTX52w0dyjVjOEg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWVZ2+YYkLUjCYLjCQx27AvMUPkwrUkTX52w0dyjVjOEg@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 09:19, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The current compatible strings for SSD130x I2C controllers contain an "fb"
>> and "-i2c" suffixes. These have been deprecated and more correct ones were
>> added, that don't encode a subsystem or bus used to interface the devices.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> ---
>>
>> (no changes since v1)
> 
> That's not really true ;-)
>

Ups, I did indeed update the compatible strings to drop the "-i2c" as you
asked. I'll add that in the patch history for v2 when posting v3.
 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

