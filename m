Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFF69794E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 10:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5234D10E030;
	Wed, 15 Feb 2023 09:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9810E030
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676454616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcMX9LswzVinYrSSqtf/kn94Dz0WUH4Iw3gNLASSJxI=;
 b=AFvPIU3gTHWFGhxN/GL47PmnPJYDRX0hxn7iZJPfDxqkoMbdL7HNroTNMeSFjYCqEarqbl
 UhxIiAJtY7r3MBlAlteouXqO1sIbk4iCu6LIiucpN0Z1QQK66zetOKBzVu87d5EQjPQAYP
 ent1LVs0IJmjx03YY8vYpJGqxMpf70A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-5jLG8tEQNSuhx9CR0DMwVQ-1; Wed, 15 Feb 2023 04:50:12 -0500
X-MC-Unique: 5jLG8tEQNSuhx9CR0DMwVQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 wu9-20020a170906eec900b0088e1bbefaeeso12080713ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 01:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jcMX9LswzVinYrSSqtf/kn94Dz0WUH4Iw3gNLASSJxI=;
 b=TqZSxcDtTouZ4St3CBL1LNan2FVbwecvdS0sioOKF3xlaKNhzdSQzcqNkcLWzcGmqX
 54R+hRhztBVbj+wQJKCemSImVDSJm87PCq4UMWs9alLGBDmmEyQ4Ma4mP9fEoXEqCIc9
 KeL2AwVgQ6tzgIR5jKVidR7o7NOYfuCCghL5Fk4GAAp0wUGmAgX2BoEJ6TaE9iDUEIJ3
 +Q6yIpK4X/eVKAlZWbT175sALUGpQib40bUthmcgiEFVVMuE6/E5qI1ufxOcaR9x0n1a
 mNskH+O9LMpFADrUGl/q4pQS3zpMZVgbj2XQSAzqFSpFVNi8x87XBMNv49e39HePFgz5
 oN3A==
X-Gm-Message-State: AO0yUKXd0IvUwVv1XS/81MglnSgS7e9Ry61fcNSBvNCeCVhfyEI3WaLw
 /o8rmjsU+AFo4b03isrlH4Ur+qRxc+yzwc/raEWZoXFhRY56wXJ2rP7Afc9N3hEp0X4RUngQ50O
 SVZ20f7ZhmY1iHMnt4Dgx8LyI0tHt
X-Received: by 2002:a17:907:78c1:b0:8b1:32dd:3b0 with SMTP id
 kv1-20020a17090778c100b008b132dd03b0mr1308647ejc.57.1676454611003; 
 Wed, 15 Feb 2023 01:50:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/1B5F2JJA6J9BwR3jcoc1w244uesea4sFIU/wNa6v2mH3fs14SgZu4h6CBQOMkHlLMas2QIg==
X-Received: by 2002:a17:907:78c1:b0:8b1:32dd:3b0 with SMTP id
 kv1-20020a17090778c100b008b132dd03b0mr1308632ejc.57.1676454610775; 
 Wed, 15 Feb 2023 01:50:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 mm15-20020a170906cc4f00b008b130155fd1sm2008677ejb.6.2023.02.15.01.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 01:50:10 -0800 (PST)
Message-ID: <c7e2b879-6f4c-5c74-ed28-5bcb0d446ad6@redhat.com>
Date: Wed, 15 Feb 2023 10:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Lenovo
 IdeaPad Duet 3 10IGL5
To: Darrell Kavanagh <darrell.kavanagh@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230214164659.3583-1-darrell.kavanagh@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230214164659.3583-1-darrell.kavanagh@gmail.com>
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

Hi,

On 2/14/23 17:46, Darrell Kavanagh wrote:
> Another Lenovo convertable where the panel is installed landscape but is
> reported to the kernel as portrait.
> 
> Signed-off-by: Darrell Kavanagh <darrell.kavanagh@gmail.com>

Thanks, I have pushed this to drm-misc-next-fixes now, so it should
get merged upstream as part of the 6.3 devel cycle.

Regards,

Hans



> 
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index b409fe256fd0..5522d610c5cf 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -322,6 +322,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
>  		.matches = {
>  		  /* Non exact match to match all versions */

