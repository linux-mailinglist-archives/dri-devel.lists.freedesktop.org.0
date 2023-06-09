Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814117296C9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9310E67A;
	Fri,  9 Jun 2023 10:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611BA10E67A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686306285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
 b=R6RJLxBRS6rm1AaS3vt+1vdVjEGTkpLUg8Wk+s9ez74joqZOnuiWQmvxl/yPSwtDR383sM
 vs2HWMZGOTeslK7UnxzJtRshemffGnQ8b+U6O59yAM2r03RxOtFt2CuE59xq74hSZkho0S
 Q8YnpIeH6Mq7R+WzPL6fvbdEvM8BKys=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-ERXFdAXGPtS84pBVQoUwJg-1; Fri, 09 Jun 2023 06:24:39 -0400
X-MC-Unique: ERXFdAXGPtS84pBVQoUwJg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f60dd5ab21so1324065e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 03:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686306277; x=1688898277;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
 b=c0lj3EEXi7nCfY2rVn1GMkT+LUd5TvvICZNlXjMOZzrdkqyawfqkdu0otfb3yV0sz3
 ZNdpWBJoJ82ev10T1ejr94kFI9UFzSb0pmLe4eXYOlPADKZa7gSkIM4kDhaIRQDNMIEf
 jQDG/Wd2O9S5FbKTDgwtU7niopLXKroT2/IdxKaTQqEdF+zDlhhoQV4SqN8v4CPmvr7l
 24LrZdxZZ/+/80AM3jd31aRkC5D07GZjwQwqSfpj8ggLeA+iT6il9nkWXCjChssDlNoG
 5qlrAjfbxd0zZqcn/3M9qYki5xlmmqLw7az+12T3WSfuzrxU0eR4IBfHAc/jX6r7cPfb
 37LQ==
X-Gm-Message-State: AC+VfDw5snuFvk52EXaWVFJpXAFnqKBrwaanRDfrej0Enl2aZIYnCF/k
 QFJ7I3UIFdqUrfCFzQsH6Zcp84KM6g1Y4FLWESJ9svIjaJ0Tsnv7tI1uIQnGSv4np4P/WCjwifB
 SEsLo7YrnjmOJM3dqKWpsqGRFx8sE
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id
 y15-20020a19914f000000b004f3a4830557mr619109lfj.5.1686306277831; 
 Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6S3RszxExiKf60rjrxsF2OLyJFkoRpusOuEfLcjyVkibfQrgNaGV/G0ODH5bqwWreayNq8WQ==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id
 y15-20020a19914f000000b004f3a4830557mr619101lfj.5.1686306277475; 
 Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y14-20020adfdf0e000000b003063772a55bsm4046255wrl.61.2023.06.09.03.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Date: Fri, 09 Jun 2023 12:24:36 +0200
Message-ID: <87edml53x7.fsf@minerva.mail-host-address-is-not-set>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:


>> * fbdev drivers + DRM fbdev emulation + fbdev user-space
>
> "fbdev drivers + fbdev user-space", I assume?
>

Right, I meant to also include "only fbdev drivers + fbdev user-space"
but forgot :)

>> * only DRM drivers without fbdev emulation nor fbdev user-space (your series)
>
> Thomas' series includes fbdev emulation here, for the text console.
>

Yes, I meant fbdev emulation for user-space. Probably should had included
fbcon in the options too...

But what I tried to say is that we need all combination of DRM drivers,
fbdev drivers, DRM emulation for fbcon and emulation for fbdev user-space.

And I think that Thomas' series + a FB_CORE as you suggested and done in
my old series should be enough to have that.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

