Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C797755F02
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1602410E11E;
	Mon, 17 Jul 2023 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D6010E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689585186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71JsynjW/KQpwayDg//wnopWoPZOFEfPGsag3ba/YyU=;
 b=Zc8kjViHsW0+y5dW/PZXRlcphoHSXHpcL2uQz3jalvc/XFNT6BNITE/ys8p93Ca+/wTQsK
 Fjz1nCdDTK+jehNgMbVltjCGiSQ/sdS3GHhOtaS9JamzLW/wOzLLi9QbuYc27RLko3ob6h
 mhJ5AI98F1HsvIy2hnrNiOHmkgDTyBw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-fHzzcGt8O_63-wYIM5LHjA-1; Mon, 17 Jul 2023 05:13:03 -0400
X-MC-Unique: fHzzcGt8O_63-wYIM5LHjA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-315af0252c2so2751053f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689585182; x=1692177182;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keqI7eQeQialpYPZhV1gk9xVsIEgPh1j6VE155PsvVk=;
 b=HgQcerQVps994tEwhWcyZ+H6abdtmCdZJVsWRbMS5W8dqwKowhXNMZx/y9p50QR+/P
 KeZxIrPvi6mw8m9ayH5Og90NJsmvuUot6SrKS+98WhuwDBQaYxzLUsCxDB75TQgy+WwF
 0bg6RCfOBo6/UUot4HKq59z8OUJ+NqpwLNMvP87jw/lf+rGDWjOwMUCLYZBz4aoG0y79
 N1TF6La8qkHJxu0ZJGGiOsgSKBxcsNx/LdEwt5MBdr9a4RrOfI83BPwjVToDdEO011hv
 WA9lFCEWJG8csmCDPj9oB8Ftk1KNNzKaiQ/ixio8XdcOqPfKSdwe8+bc6ei7y+e5zatL
 Qsug==
X-Gm-Message-State: ABy/qLY7UriAFnX/XU78mFdyNhucy7bBq3oYPX/U+OINDa9lE0aB2vcK
 GTaUxJsmww9L4Gy/a3uaYUrvWmp5DPN2uo2Gn1dkBHq5mI3mcxceaRkvwBIqy/UVrs5Lygu5PJE
 LpJL9a40Rh7CAp5RyAA6qJ+ehemLM
X-Received: by 2002:a5d:498d:0:b0:314:13d8:8ae7 with SMTP id
 r13-20020a5d498d000000b0031413d88ae7mr10466562wrq.26.1689585182187; 
 Mon, 17 Jul 2023 02:13:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH8lCDMio8tFul/5Qv25azDKCGZD8zr/blt36VIhUszZMLPmhAMnSvst/4EY9PYiW7tLIuHCQ==
X-Received: by 2002:a5d:498d:0:b0:314:13d8:8ae7 with SMTP id
 r13-20020a5d498d000000b0031413d88ae7mr10466547wrq.26.1689585181899; 
 Mon, 17 Jul 2023 02:13:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e22-20020a5d5956000000b0031431fb40fasm8006314wri.89.2023.07.17.02.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 02:13:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
Date: Mon, 17 Jul 2023 11:13:00 +0200
Message-ID: <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Sun, Jul 16, 2023 at 3:30=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> > The native display format of ssd1306 OLED displays is monochrome
>> > light-on-dark (R1).  This patch series adds support for the R1 buffer
>> > format to both the ssd130x DRM driver and the FB helpers, so monochrom=
e
>> > applications (including fbdev emulation and the text console) can avoi=
d
>> > the overhead of back-and-forth conversions between R1 and XR24.
>>
>> I've tested your series on a ssd1306 I2C OLED panel and fbcon did work f=
or
>> me, but had some issues when trying to run your fbtest suite. Because th=
e
>
> Thanks, due to the limited userspace environment on my RV32 test system,
> I didn't run fbtest myself.
>

You are welcome.

>> test005 gets killed with a SIGSEGV.
>>
>> $ ./fbtest -d
>> fb_init()
>> fb_open()
>> fb_get_var()
>> fb_get_fix()
>> fb_map()
>> fb_start =3D 0, fb_offset =3D 0, fb_len =3D 1000
>
>    [...]
>
>> Running test test005
>> Caught signal 11. Exiting
>
> Strange.
>
>> Maybe more tests are missing the minimum num_colors requirement? Also, t=
he
>
> On monochrome, test005 should make the left half of the screen black,
> and the right half white.  It works on ARAnyM, and there don't seem
> to be off-by-one errors in the call to fill_rect().
> Can you please run this under gdb or valgrind?
>

Sure. I only spent my free time on these panels though so likely will do
during the week or more likely the weekend. I believe the bug is somewhere
in the test though and not in your kernel patches.

>> penguin in test004 is not displayed correctly. I was expecting that to b=
e
>> working correctly since you mentioned to be using the Linux logo on boot=
.
>
> Linux has logos for displays using 2, 16, and 256 colors. Note that the
> default logos are 80x80, which is larger than your display, so no logo
> is drawn.
> Fbtest has only the full color logo, so it will look bad on a monochrome
> display.
>

I see. Should the test check for minimum num_colors and skip that test then=
?

>> Another question, do you know if is possible to change the default forma=
t?
>
> AFAIK DRM does not support that.
>
>> I believe that fbset won't work because the DRM fbdev emulation layer do=
es
>> not implement mode settings but I thought that changing the mode using t=
he
>
> Correct.
>

[...]

>> Maybe I'm doing something wrong or misunderstading about how should work=
?
>
> Do you need the "-d" option (drop master after mode set) of modetest?
> Still, that would only impact DRM.  The fbdev emulation on top of DRM has
> already been initialized before, and is never reinitialized.
>

Ah, that explains and makes sense now. I tested other user-space fbdev
programs that only support XRGB8888 and those were working correctly so I
guess that user-space that supports R1 be defaulted to that and not able
to change is an acceptable behaviour.

When you post v2, feel free to add:

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

