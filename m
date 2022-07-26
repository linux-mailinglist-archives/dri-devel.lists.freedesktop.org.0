Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BD58144F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8690572;
	Tue, 26 Jul 2022 13:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91D90516
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658842725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Adj4jrU1SP5osnWw1jwoXpRrBSvPiISvLrv57eggvs=;
 b=gpKi9+W9y9WFIkTGRS8lmMVSiMpjjcAq33XprPWTOJoKipe1/dl1dbNtpA4o+2Jyl2S29U
 0bPcwVTteOxaMhwI5knBviCRRpfuGDiGhG6s2T4yQvHIUawOfadjioST6p4U4AXxOhoXCh
 lE+F6kAagMIxAoWJmu56HOI2Cq/ElvA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-m4LORTuYO4WKxeI1fPfxjA-1; Tue, 26 Jul 2022 09:38:41 -0400
X-MC-Unique: m4LORTuYO4WKxeI1fPfxjA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d26-20020adfa41a000000b0021eaa649d81so312912wra.16
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Adj4jrU1SP5osnWw1jwoXpRrBSvPiISvLrv57eggvs=;
 b=Hc7zSju32wZ7DAmoCHSvBCvoU10Fvj3sJh6fPgK7qqE3ADgM7h0siGHIQYc03Treka
 gPvfpRwwEBP/MRWYmR+qA9xdtlk3UTZokS0FXLZ8SYAvVgxxTzkkkXHd1f3xRMJYiMoP
 f9iO5GsSeg+WFL4XQJoshoPgG5BUHcV60NEp7tsWauM7PWtpUancuil8qCpk2wqZ8mzW
 rPJ+AoShTF5ppkqYTedYfqeNEhJcH/UqAdyo5/Gpls9kqhrppQdMVGVAde4KkQRtZqpJ
 Urj0EOmbmBZs+/4r6rvYXB1GvqsqWnDJD7uIzGUC3wZFrI97aDzBVeAYpKZ5hvMjmLyS
 h01A==
X-Gm-Message-State: AJIora+yrA21UA/N8CnMsfAZHzBMqawqrkJtcMDF1lzXNkoKuy3QbyuS
 tLqOzXhsXLVPl05uV+df00oHjb9UdrXDnUvaTIn754u7VQ7hlGmTp5sv4/jIaDjw+f6TnS2Yb1j
 gtZkEm3B6c/jjea3VrBeN2Vzw/ej9
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id
 1-20020a056000154100b0021db29896bemr10656800wry.206.1658842719917; 
 Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vn5gO3Bopg+51fzCZTQS+LUztnjj2PQ5ldn7oubUEVRSuljc6/I3CCwqkTlMx6jNch/xeE8g==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id
 1-20020a056000154100b0021db29896bemr10656771wry.206.1658842719436; 
 Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c248500b003a3279b9037sm21045175wms.16.2022.07.26.06.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
Message-ID: <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
Date: Tue, 26 Jul 2022 15:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-10-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Add a per-model device-function structure in preparation of adding
> color-management support. Detection of the individual models has been
> taken from fbdev's offb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static bool is_avivo(__be32 vendor, __be32 device)
> +{
> +	/* This will match most R5xx */
> +	return (vendor == 0x1002) &&
> +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
> +}

Maybe add some constant macros to not have these magic numbers ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

