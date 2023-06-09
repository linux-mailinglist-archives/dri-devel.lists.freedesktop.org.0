Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA72729828
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9957F10E688;
	Fri,  9 Jun 2023 11:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE01510E688
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686310033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aq1HmhmHxt8U2DdHW6bpTJ6Q+ZwtPsKU6Rb33d5Ew+Q=;
 b=jEQUIkK/gucjVugNCDvsozoARj6YxcZWEQbiWI9zoJqAz0xS/BRy0rAik6wOEbHMUtUL+p
 P8WrIk/weEPEj4x0C4+FfgEcvJpC1r8ymvuVFpktXOvxfcZ4kzYzOP+WdcPfdYtT6nPMKu
 L+apyijlMfnGe38VgWgpyMM69eSqyDk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-sXHNjtNPOkyC9vDYKe68Xw-1; Fri, 09 Jun 2023 07:27:12 -0400
X-MC-Unique: sXHNjtNPOkyC9vDYKe68Xw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f7f8d101b1so27764955e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 04:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686310031; x=1688902031;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aq1HmhmHxt8U2DdHW6bpTJ6Q+ZwtPsKU6Rb33d5Ew+Q=;
 b=KEMMqBnK4vxgmA998Pa5cRVAh2DHb8mSsW7/8mXkRvKL2zcxZc5rJNBOKYw50tBuG2
 8ebY6s1QPB5+sWwIuBdyGcF+v8atNscXV22unwS7hlzTNAJ1oCdKZ8S5obnlVj2oAFbR
 2iqZOTvhjz8NbXPZMFCHFpzwjt70jXmdjhoDWy2JGVqCgGvGNgWwtIsOLiDVUnmyWwta
 y1EbPsm653Cw1C0HkjjjnAjjgT9abd6NWfXBAa6T0g4+nsbY3l9HynaaJKo5S+j12EqS
 sjTBfPCauJ0i9rAkaa66b+WOysr+L0lY/JZDyJREYf+cD9NM2ZzinwF5kv43tyPze+Mp
 9QTA==
X-Gm-Message-State: AC+VfDzwDyQOk12bG63ZsPJDVRg3ifvynJbuyRiej+OcFsqjBWpR8RJi
 ZMi9Wn7o4Wg6rV4lXplozMFXgJHG6VJo7dXErfkVjl/96mTzBGr2eTV4Ivy/RQO6WKlPtnOtBhh
 gfwYZJSM24ngBpyn3cmn181M35EYz
X-Received: by 2002:a1c:4b0f:0:b0:3f5:6e5:1689 with SMTP id
 y15-20020a1c4b0f000000b003f506e51689mr962602wma.17.1686310031580; 
 Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6w7LsURM3swKe92CefNektpkFsYqmjCbB+q5BkwoFvHxCz92JpRifnJNOzeTnxZcxMM5HBOg==
X-Received: by 2002:a1c:4b0f:0:b0:3f5:6e5:1689 with SMTP id
 y15-20020a1c4b0f000000b003f506e51689mr962588wma.17.1686310031334; 
 Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d48c4000000b0030903d44dbcsm4191258wrs.33.2023.06.09.04.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date: Fri, 09 Jun 2023 13:27:10 +0200
Message-ID: <87o7lodgfl.fsf@minerva.mail-host-address-is-not-set>
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> 
>> So with FB_CORE, you can have default y if you have a real fbdev driver,
>> and default n if you have only DRM drivers.
>> 

All this discussion about FB_CORE is unrelated to your series though and
that is covered by enabling CONFIG_FB_DEVICE. I think that there's value
on a FB_CORE option to allow disabling all the fbdev drivers with a single
option but still keep DRM_FBDEV_EMULATION enabled.

But I can repost my old series on top of this patch-set once it lands.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

