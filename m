Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91346BFBA7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 17:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5810E0CA;
	Sat, 18 Mar 2023 16:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD4910E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679158172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYLPi961rrhMuWDEVxQoLmOJ4qh13a023msrkQ97CyQ=;
 b=eMq2JpTnP9BEa8eX0oAJgwhCKi9Zo2zpg6fVCsyc6F3K+xbe7ChDhKf8Fv9H/Rg5ycgpfs
 XmcQCkncyCIfvK4VpDUeIN6m3+z399dDCs7vBlh1pf66wA2R19HePKBrpi7sKX1KfffFhF
 WdbJPZkZzJGjv3Hjee4kPC1+StFy9O4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-xEDOymdoPbG8uXcYwWHZ9A-1; Sat, 18 Mar 2023 12:49:30 -0400
X-MC-Unique: xEDOymdoPbG8uXcYwWHZ9A-1
Received: by mail-ed1-f72.google.com with SMTP id
 i42-20020a0564020f2a00b004fd23c238beso11817123eda.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 09:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679158169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iYLPi961rrhMuWDEVxQoLmOJ4qh13a023msrkQ97CyQ=;
 b=gH1guBNdS7nhH66Q5BEgOcGhRZyhbn12y3iFJJN6K4AQPvFm8YZSFDYbuJaLnVwQQO
 WEUgibWNEkidfuij4PmlveMO7nAtDKIGiG4L39ol75/jSqmTQBT72N31zM29gYllnFmG
 wuIE5A+kYj1w5h8QWEdjOnGSLqU3gANvX4/UgqVzgEk1yh9diWPt2LGqVTvZYi9rULR6
 dkUOZqDm/szWkqKzm0MqIaqR25AgY7aP6cG3LsjdTUvDWe29Nvo4DnnZHhTVaUAzh8fo
 cGohZ88aJ5D++osTCdk3EOdJJFpNaYasfVYHg11b1EfUlpcFYi2JsIdUxnUfnL9vV5yw
 KqXQ==
X-Gm-Message-State: AO0yUKXMdZeZ3g1G8hcc6DzOKMeuua+j2XJWfnLKQfJUeVBp9KFboXwU
 b7b+vu2ZVnxWSkGUgSKzce8SN28zg8UjGyHmzlxSUTgBCaPHaJFoAnZGb3HwX4sP8o6yxTOv39l
 7B5zuVkoaWyTIb4XeF8cP55Uto45h
X-Received: by 2002:aa7:c90f:0:b0:4fc:687a:c29d with SMTP id
 b15-20020aa7c90f000000b004fc687ac29dmr6847322edt.1.1679158169289; 
 Sat, 18 Mar 2023 09:49:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set82X+r0HM83cSH5tYRr+jo2nTQ//vjM+T3XwYju9aqTznKPN6KcewIP3GtDMriqb/zd1kr+Kg==
X-Received: by 2002:aa7:c90f:0:b0:4fc:687a:c29d with SMTP id
 b15-20020aa7c90f000000b004fc687ac29dmr6847313edt.1.1679158169062; 
 Sat, 18 Mar 2023 09:49:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a50d086000000b004fb00831851sm2537072edd.66.2023.03.18.09.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Mar 2023 09:49:28 -0700 (PDT)
Message-ID: <09d1ba06-a034-165d-2f7d-fba7d379e026@redhat.com>
Date: Sat, 18 Mar 2023 17:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] Missing nouveau backlight control on 6.2.x kernel
To: Takashi Iwai <tiwai@suse.de>
References: <87wn3f8zj7.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87wn3f8zj7.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Takashi,

On 3/17/23 11:04, Takashi Iwai wrote:
> Hi,
> 
> we've received a regression report on openSUSE Bugzilla about the
> missing backlight control of nouveau device:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209296
> 
> On 6.1, with acpi_video=native option, the system provided
> /sys/class/backlight/nv_backlight entry.
> 
> On 6.2, with acpi_video=native option, there is no entry in
> /sys/class/backlight.  And without acpi_video option, it falls back to
> /sys/class/backlight/acpi_video0, which doesn't work as expected.
> 
> Hans, could you check whether the recent change in video_detect.c (or
> anything else) may influence on this?  My gut feeling is that the
> culprit could be rather some change in nouveau (so dri-devel is
> Cc'ed), but I'm not entirely sure...

As I already told the reporter, who first contacted me by private email about this, all the drivers/acpi/video_detect.c changes which may influence this are also present in 6.1.y (IIRC >= 6.1.5) . So since this is being reported as only happening with 6.2.y I don't think the recent backlight detect rework is involved.

And even if the recent backlight detect rework were involved, specifying acpi_backlight=native on the kernel commandline (as the reporter was doing before) should still work since it overrides all other backlight detection.

So yes this seems to be a nouveau bug and should probably be reported following the instructions from: https://nouveau.freedesktop.org/Bugs.html  (which I havealso told the reporter already).

Regards,

Hans



