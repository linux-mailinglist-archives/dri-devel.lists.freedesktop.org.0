Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B137A65B3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 15:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007310E09A;
	Tue, 19 Sep 2023 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D86F10E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695131433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wyjlC6jvKki/d/AFtWf0GNSkfVlfpkzAsY5hgPuCaGk=;
 b=KWda+f+Z0BDvq4YeoLLcjB6o86h/TQuXt4F3d/X6uFuucl/LG5b6nsRwUT2oI0XJM7nOZi
 QpyHF4yxkRUxe2ztv7TlnoABfmQ0qsVK1nefAWGVC9vpNMMPrX2dpytsYTWCNIUT3NCQ92
 rMJeBisEB+xpOjEV2PW5IdzNgCaevFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-jeJDGZhaPG2CKqqWVIzFMQ-1; Tue, 19 Sep 2023 09:50:12 -0400
X-MC-Unique: jeJDGZhaPG2CKqqWVIzFMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-402d63aeea0so44476645e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695131402; x=1695736202;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyjlC6jvKki/d/AFtWf0GNSkfVlfpkzAsY5hgPuCaGk=;
 b=D1hC8wxNbJSOdX5TLBuknp7JjATaY+25+FiJYQl90hA/7/b8coIYFA2Nx4uYm1wi4e
 GUzdAK4VEoWpn5dRAL7zk5OhhLdDeOdnmtTieNK5YWYl/rqakkYaun6z5dKvZ7WWGvjg
 kfHMVDP7UOIYVU2SwmjhI63m6FrfMMS8Hmazb86aD9O6VXG8zLzMk25t3/t2LCAS6eab
 8xlEWmNyNUxgYDsNhOJAgu9tk/TVIK8dLak7N84+hZakbQqY/rC6t/CfPsBFbRZyqcXT
 q4iS8qTb5rNf8nJbNV93oh0PNPteF1rv4FlIRXBYmHBvOrRjQInWYmUc9HaLpU/aluo1
 NU5g==
X-Gm-Message-State: AOJu0YyOkFp1ojlydr1UyHKagFHumJnpjmf3Tee0AD1HDW1hsYGa2rHv
 MqFDHJuBOd4Ey/tWcvVcJH6fcpjKcA4srT0L4IF98L+MOcDHmAa2d/Rhnk+QI+40i+ncZ1ObFdK
 FoPvAISdPo+lX2mEXRb2rHX5aj5ZC
X-Received: by 2002:a5d:6845:0:b0:319:6d91:28bf with SMTP id
 o5-20020a5d6845000000b003196d9128bfmr10172737wrw.60.1695131402524; 
 Tue, 19 Sep 2023 06:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0iYYDeXqv2TFX2qqzd5kEt/uXjFh1qbfAteCkbBkcJsaT3iSm1X2kX0l/P4l0pxG9s5UzGQ==
X-Received: by 2002:a5d:6845:0:b0:319:6d91:28bf with SMTP id
 o5-20020a5d6845000000b003196d9128bfmr10172715wrw.60.1695131402076; 
 Tue, 19 Sep 2023 06:50:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w4-20020a5d6804000000b003197efd1e7bsm15736497wru.114.2023.09.19.06.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 06:50:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann
 <tzimmermann@suse.de>, Janne Grunau <j@jannau.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
In-Reply-To: <c6dd2daf-f833-4c2f-9a67-640fb2c424fc@app.fastmail.com>
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
 <c6dd2daf-f833-4c2f-9a67-640fb2c424fc@app.fastmail.com>
Date: Tue, 19 Sep 2023 15:50:00 +0200
Message-ID: <87led2l1br.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Sven Peter" <sven@svenpeter.dev> writes:

> Hi,
>
>
> On Mon, Sep 18, 2023, at 09:11, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
>>> From: Janne Grunau <j@jannau.net>
>>> 
>>> Multiple power domains need to be handled explicitly in each driver. The
>>> driver core can not handle it automatically since it is not aware of
>>> power sequencing requirements the hardware might have. This is not a
>>> problem for simpledrm since everything is expected to be powered on by
>>> the bootloader. simpledrm has just ensure it remains powered on during
>>> its lifetime.
>>> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
>>> systems. The HDMI output initialized by the bootloader requires keeping
>>> the display controller and a DP phy power domain on.
>>> 
>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>
>> As a simpledrm patch:
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Do you want to wait for another review from  someone with 
>> power-management expertise?
>
> I can't claim to have a lot of genpd experience but we use very similar
> code in a few other M1/M2 drivers that also require multiple power domains
> to be up without any sequencing constraints. So for whatever it's worth:
>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
>

Can't claim to be an expert on genpd either but it looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

