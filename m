Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2BA6E0115
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F80110E99F;
	Wed, 12 Apr 2023 21:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438210E99F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3402ptPprQnICYcpNgka/a4MlqR0CMRNa5wxHl7tKqM=;
 b=TMkaf7m6jiUJs1XZXmBpz5oaD9/19bVIkmfbP2/WK5B1OqAwH+slmbFMuugFgaA2XkY/06
 zhFjqQHrG/y4VkXIjPMznpK8/yln0BDQKhVVblXlOC8sZjwTTKFSeDyyoZenfb8LKyipDN
 3kl+0nDUcXH9Om/40hjNecYNPSmueZ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-r6U8BHiuNP2gefii8JOjeA-1; Wed, 12 Apr 2023 17:40:45 -0400
X-MC-Unique: r6U8BHiuNP2gefii8JOjeA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k24-20020a05600c1c9800b003ef6ed5f645so2900559wms.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681335644; x=1683927644;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3402ptPprQnICYcpNgka/a4MlqR0CMRNa5wxHl7tKqM=;
 b=a7cn8IZ07ArMh/q7r9iVzINQ3Rn9kYrNyl7IiZPsrpZ13r13rvVBcLurPtb4viLCD1
 kfOctq1AFFUAZiYZTTrC+WgQ2aXUTesAdv4CDOaVKTvmjTAUxQSzmhA5wVoRcUKN1kl1
 oGxk/JPQM5rTXzZgWOrWAIt+6MFMQksyKjMmNN1Gs4gc8KxIRhaCC0wXT4QVpwRAjkjD
 QzEJM4GdI+Ca6GcKd6hA/08kWMOCsP4FpYsPNWtVIbIRrjPsrHMtvyFBWevRIROTcV+I
 A8nwUxaAys0e+ICuJjYiztYiJgk4FB8SQsktya0JWgqtaKOZ/yHsTamguN3jmk1ctUuU
 ExhA==
X-Gm-Message-State: AAQBX9fqiyI7boGO/44cCL0c4K4gNOlqql8lRXEV9Mom3aNB4iQ4zMa2
 tvy0cyb1a3LFV4AHcOa/vXP9LzM02WlrpkEzuHx1l4vaHZHk3NKQtcRTw41oM76pMo2KIywFaxo
 OttAliQhL7ReZ3azi5FMU3iKokpOu
X-Received: by 2002:a05:6000:1281:b0:2ee:d53b:d9ef with SMTP id
 f1-20020a056000128100b002eed53bd9efmr9963637wrx.55.1681335644313; 
 Wed, 12 Apr 2023 14:40:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y0roijCU4a1Gl2gjyzIFHhagHW9zTdNa2E+8Ko5ITsQqw0KUkF7702LR5DmI7Huudjddqhqw==
X-Received: by 2002:a05:6000:1281:b0:2ee:d53b:d9ef with SMTP id
 f1-20020a056000128100b002eed53bd9efmr9963629wrx.55.1681335644030; 
 Wed, 12 Apr 2023 14:40:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d420b000000b002ceacff44c7sm18073377wrq.83.2023.04.12.14.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:40:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 12 Apr 2023 23:40:43 +0200
Message-ID: <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> ========== Bad after patch, typing blind to log in !==================
>> grub: gfxpayload=keep
>> [    0.003333] Console: colour dummy device 128x48
>> [    0.003333] printk: console [tty0] enabled
>> [    0.423925] fbcon: Taking over console
>> [    0.520030] pci 0000:01:05.0: vgaarb: setting as boot VGA device
>> [    0.520061] pci 0000:01:05.0: vgaarb: bridge control possible
>> [    0.520085] pci 0000:01:05.0: vgaarb: VGA device added:
>> decodes=io+mem,owns=io+mem,locks=none
>> [    0.520120] vgaarb: loaded
>> [    3.290444] simple-framebuffer simple-framebuffer.0: framebuffer at
>> 0xd8000000, 0x240000 bytes
>> [    3.290483] simple-framebuffer simple-framebuffer.0: format=r8g8b8,
>> mode=1024x768x24, linelength=3072
>
> Now, this is the part where things start to break I believe. Because you
> mentioned before that gfxpayload=keep used to set the format to xr8g8b8
> but now after my patch (and also after the original commit f35cd3fa7729)
> it is set to r8g8b8 instead.
>

I still don't understand why this particular configuration didn't work...

The framebuffer starts at 0xd8000000 and has a size of 0x240000 bytes, so
a r8g8b8 pixel format with resolution 1024x768 should be correct. Since is
1024 * 768 * (24 / 8) = 2359296 = 0x240000.

In any case, it seems that there is something wrong on how the screen_info
is reported to sysfb since you mentioned that gfxpayload=1024x768x32 leads
to a format=r8g8b8 and mode=1024x768x24, instead of the format=xr8g8b8 and
mode=1024x768x32 that is expected.

Could you please apply the following diff that will print all the relevant
fields from the screen_info that are used to calculate the bpp and stride.

My guess is that the rsvd_size and rsvd_pos are not correct and that's why
the bpp is set to 24 instead of 32.

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 5dc23e57089f..6678ac6ff5b1 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -58,6 +58,13 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
         * If a calculated bits_per_pixel is used instead of lfb_depth,
         * then also ignore lfb_linelength and calculate the stride.
         */
+
+       printk("sysfb: si->lfb_depth %u si->lfb_width %u\n", si->lfb_depth, si->lfb_width);
+       printk("sysfb: si->red_size %u si->red_pos %u\n", si->red_size, si->red_pos);
+       printk("sysfb: si->green_size %u si->green_pos %u\n", si->green_size, si->green_pos);
+       printk("sysfb: si->blue_size %u si->blue_pos %u\n", si->blue_size, si->blue_pos);
+       printk("sysfb: si->rsvd_size %u si->rsvd_pos %u\n", si->rsvd_size, si->rsvd_pos);
+
        if (si->lfb_depth > 8) {
                bits_per_pixel = max(max3(si->red_size + si->red_pos,
                                          si->green_size + si->green_pos,
@@ -69,6 +76,9 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
                stride = si->lfb_linelength;
        }
 
+       printk("sysfb: bits_per_pixel %u si->lfb_linelength %u\n", bits_per_pixel, si->lfb_linelength);
+       printk("sysfb: stride %u\n", stride);
+
        for (i = 0; i < ARRAY_SIZE(formats); ++i) {
                const struct simplefb_format *f = &formats[i];
 
@@ -86,6 +96,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
                        mode->width = si->lfb_width;
                        mode->height = si->lfb_height;
                        mode->stride = stride;
+                       printk("sysfb: format %s\n", f->name);
                        return true;
                }
        }

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

