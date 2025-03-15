Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A5A62EDC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 16:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE32C10E172;
	Sat, 15 Mar 2025 15:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kq9r7O/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAA510E172
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742051132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pz/YPpmWdsbQE5PKSDoHxsTdkjzaBFZlOw9AoLo0QNQ=;
 b=Kq9r7O/YyPc9YJ6jsp2Qux9AXCzyDcjSy2LjbKLIVFvVPbrM36OVgUyD23S96+Z0T0FnpG
 mfXJev7F/eGID6xHSNXHJZeR4p5s2IGw7+uKjLndKKA+Kd8wtLeuoOfBG5TGp69/OkUU1q
 gqbJ0gXqrWaqqLV/Yl0BCTf6a6mXE/k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-c8OiaA5IMfWPcTuuTeI85Q-1; Sat, 15 Mar 2025 11:05:31 -0400
X-MC-Unique: c8OiaA5IMfWPcTuuTeI85Q-1
X-Mimecast-MFC-AGG-ID: c8OiaA5IMfWPcTuuTeI85Q_1742051130
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac313093ed8so270614066b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742051130; x=1742655930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pz/YPpmWdsbQE5PKSDoHxsTdkjzaBFZlOw9AoLo0QNQ=;
 b=oXyJSbb3GREyzgiE22zFrjgJNO2ZuQ87fS7C5O4Hf71yphph77lpLD5UNGXHWmE6fq
 dCfQH5e0TCgB8XSs2h5vjhwteUMI/eLPN2bKCNh1sQMISZXZsBW35J1vKsbQMKtFx48X
 GTBJptJPyfhm4uyoXe64qVyu+tcOwL80zKU9ep7fJ4zybbSNBCvLWrcbZJMrJAa4BG1d
 F5Xsb95Zli45zy4Uj6xNgM3nYcpVrFHWIZbbpXLcxQ9V5yPzv3aelEF0AK59LdnqNJh/
 Uwp0R8wSoyqzQOLrkXyVnYC18PVLwkJbFEggnelv7OGru6YMn0G/6wTu09jQR3F+WWtN
 aTSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdgCehSHZnZoUHsGe5w0tXgSSKP5uEg4qxDE1RBy4hzItHCHkHco/IYmp23YFxAR0Ttpjtuy75IWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz95tuExhRJftuDBWqH7f/Dwh5RmnSH/GqLI794+cU47HjZubSm
 xNhlc51qKbfO+o04ONtVTfLfmeJ+7QgpEPEixsx2Bog14pm8KnIoJRKMH1fyuGEm1qmvbHPgNmU
 yVIJRTMRpANLODXq35/tU8P7hcdJXiOWzbJt4KaQpq1kN1eIN0+B0+CiQlhPq4mXvPg==
X-Gm-Gg: ASbGnctW8KI436dM7XINR85tmDftWVgqtevdHg+h9Fq6alGRkyd89tVDxHAAU5bJGiM
 Kh96USl79psBbEtC2t0KBD1IqkxaBddCIwn+Y8WnuG3LU6QeHL7RrO1yHHnqd11zK1YOD+4XU+d
 snkyLb2rthTRycWIkMci/ypwSjgtbX+W2vh4adYgjcYRpP8xxN89fnzab5Hwc4wJls++umapy2u
 1e9vzHR47Kep2ENF8to+jjF++2vxuZShhtovWIKxSV+XQWGreJNkvQ0ekovAoqWRcDJvH8hRPt6
 +SF5YReO+IzxcJ7vxOafdEbvQZZLW95hKO/AOxpqaJO4P0e/0VKQEm7gV/9Ka3PZmp+jToDSJwp
 Xp2pXhSWnPzybUCKO+8zfX/J4D7NJLguMhbOY0FmD7uPdw9eve+/31XSvNqapVXxKAg==
X-Received: by 2002:a17:907:2d89:b0:ac2:7d72:c2ab with SMTP id
 a640c23a62f3a-ac3304d68e3mr740659066b.47.1742051129681; 
 Sat, 15 Mar 2025 08:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01OeVALzFSUJQXR5kuA8/gWWs6gZF8stOKsOeNSOZSCmEBS6cJB2pMYlQnp0VEs4L83HKRQ==
X-Received: by 2002:a17:907:2d89:b0:ac2:7d72:c2ab with SMTP id
 a640c23a62f3a-ac3304d68e3mr740655366b.47.1742051129253; 
 Sat, 15 Mar 2025 08:05:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a49d33sm384772166b.141.2025.03.15.08.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Mar 2025 08:05:28 -0700 (PDT)
Message-ID: <4a73a6ea-7001-484b-a286-ff6e089d731b@redhat.com>
Date: Sat, 15 Mar 2025 16:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add ZOTAC Gaming Zone
To: Vicki Pfau <vi@endrift.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
References: <20250313211643.860786-2-vi@endrift.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250313211643.860786-2-vi@endrift.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x2yH2DYgKHdPsr_yj0GZakRTxN-xtHRlJIZ5Ab5lvxs_1742051130
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

On 13-Mar-25 10:16 PM, Vicki Pfau wrote:
> Add a panel orientation quirk for the ZOTAC Gaming Zone handheld gaming device.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

drm-misc maintainers, I'm dealing with a huge backlog of
patch-review, bugs and other work. So I would appreciate it
if one of you can pick this up and merge it into drm-misc.

Regards,

Hans




> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index c554ad8f246b..7ac0fd5391fe 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -517,6 +517,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* ZOTAC Gaming Zone */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "G0A1W"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* One Mix 2S (generic strings, also match on bios date) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),

