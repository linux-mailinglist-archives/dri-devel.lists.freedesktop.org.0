Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB01690D7F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD010E5F3;
	Thu,  9 Feb 2023 15:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2710E5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675957646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99X2d/7PnkDB3y5oN6cAQuHXSUMM+INOtp1CuXvzmRI=;
 b=aFxULGl1d+fJp8h3HlShyXaYcA+KLFHlTk/Dvy20d7Sw2XDscHN2z1N5J1wWNxyhe8DZMq
 QLgjmLrn/jGxuwHm92CTLEVuolZvQJFno/8d9YiRzoB1h/XdnEbYbWhtyfzpg37FygMv2F
 Yh8MEOELc0dNsLBDZnn4X/dZZatGXMQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-1v7Uxe5oO5SjV0dvjFKTUA-1; Thu, 09 Feb 2023 10:47:23 -0500
X-MC-Unique: 1v7Uxe5oO5SjV0dvjFKTUA-1
Received: by mail-ed1-f71.google.com with SMTP id
 fd23-20020a056402389700b004aaa054d189so1728618edb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 07:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=99X2d/7PnkDB3y5oN6cAQuHXSUMM+INOtp1CuXvzmRI=;
 b=ZtcxJ7mMaD1PxLWPTpvlu7Hy5FxgdhfnVONM2xK7V1pTvyP9LMvyHIH+9+cXMOmcRj
 Uzhp6UFbb/jM7jzLRjQHeYYeDIK97yQZwlAmPzm3SVSu86xqB3kICj+3RGaHzFJlXflb
 fWGx8YlIl7KLtLsL9VOmhaFAjOEcqhkHZo5JTJnrhBrxz83arQQVv6JhpUBaZLNsVjTr
 u5baQwg7RufPNkYmOZblH1TgzwyaUg9Aj/TXdbGfTsqfxG/6vgcS1idCOPFOG6vGM37s
 6UtjupYe449Yxf7TEYvF1XfxMCcnUsb2r3v5rNKI8EfwIRvFee1ZFimgsN4oVhUoLlVf
 CN2w==
X-Gm-Message-State: AO0yUKVes/a3axODZNLFUjn40H2rqUVWF1lBEOKpyY0qMKlbB4mmHgeL
 2hUr5281i0fJDmNBS3XkdqFONpNh/USloR782q34Pds1AEKW/OBknh1titpvnbjyGrp39KMBeVY
 JnbsRDAfxAqKvj+2t3gucpkmK2UuX
X-Received: by 2002:a17:906:798:b0:88f:6a7e:5fe8 with SMTP id
 l24-20020a170906079800b0088f6a7e5fe8mr13388230ejc.22.1675957642175; 
 Thu, 09 Feb 2023 07:47:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8bH9yXuyJR9Eq5RXP63IN3huxAmn1Eoy+f/b6jPBUGaB8xRuruSmBZGeDEKDCr9mS4qoPgqg==
X-Received: by 2002:a17:906:798:b0:88f:6a7e:5fe8 with SMTP id
 l24-20020a170906079800b0088f6a7e5fe8mr13388216ejc.22.1675957642021; 
 Thu, 09 Feb 2023 07:47:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 se26-20020a170906ce5a00b0086621d9d9b0sm1012318ejb.81.2023.02.09.07.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:47:21 -0800 (PST)
Message-ID: <f04fb55c-5fa8-f38d-d6e0-7ba29c1973f6@redhat.com>
Date: Thu, 9 Feb 2023 16:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet
 3 10IGL5
To: Darrell Kavanagh <darrell.kavanagh@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Darrell,

On 2/3/23 19:32, Darrell Kavanagh wrote:
> Hi,
> 
> This is another Lenovo with detachable keyboard and 1200x1920 screen
> mounted sideways.
> 
> The following has been tested with 6.2.0-rc6.
> 
> Thanks,
> Darrell

Thank you for your patch. Note that instead of "Hi, ... Thanks, Darrell"
there should be a message describing the what and why of the patch
here, see e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_panel_orientation_quirks.c?id=653f2d94fcda200b02bd79cea2e0307b26c1b747

I also notice that the diff output below has a bit weird file-paths,
so this patch is clearly not the output of "git format-patch" +
"git send-email" on a standard linux source tree git clone.

The whole kernel patch workflow can be a bit daunting if you are just
trying to submit a small quirk like this.

So you can either try again if you want to, or I can fix all of this up
for you if that is preferred.

If you want me to fix this up for you, there is one thing which I still
need from you, your patch is missing a Signed-off-by line in the commit-message.
I can only accept patches with a Signed-off-by line in the commit-message like
this:

Signed-off-by: Your Real Name <email@your.domain>

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

If you want me to fix this up for you, please reply to this email
with the proper Signed-off-by: ... line for me to add to the commit
message.

Regards,

Hans




> 
> index 3659f04..590bb7b 100644
> --- a/kernel/drm_panel_orientation
> _quirks.c
> +++ b/kernel/linux-6.2-rc6/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad
> D330-10IGM"),
>                 },
>                 .driver_data = (void *)&lcd1200x1920_rightside_up,
> +       }, {    /* Lenovo IdeaPad Duet 3 10IGL5 */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_rightside_up,
>         }, {    /* Lenovo Ideapad D330-10IGL (HD) */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> 

