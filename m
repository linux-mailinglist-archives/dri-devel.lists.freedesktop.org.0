Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C897C7C754F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392010E576;
	Thu, 12 Oct 2023 17:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E9010E56E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697133486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVsd25JJrPKVfuhRRuS6kpquTIw0T//+HNpizwkPWZ0=;
 b=i8Af84QsdEPVaXK2hh2DrRQJHaoCXNu51Ta5PgrDLJ7CGTCIu13rywyzkBE6R/zyDfedJy
 J2oUB+6x5KyHD7WvQ+jWNTjaqv9j+NWRQnJ5/+tk8bcQ3GqHJuFw+Uby9Tmh3zQNIqRCf/
 cqlJuiucoxDTapz0SE8K1JNp1bBTW58=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-3cu8CEzRM3eO2xtKjOlQLQ-1; Thu, 12 Oct 2023 13:58:05 -0400
X-MC-Unique: 3cu8CEzRM3eO2xtKjOlQLQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9b2e3f315d5so136345066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 10:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697133484; x=1697738284;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVsd25JJrPKVfuhRRuS6kpquTIw0T//+HNpizwkPWZ0=;
 b=J1I9DwZl8qAvgw9XEtYxEbcKY+jq4Xa4MGde+U5YrxDESbMiv2G+7jeTLNrDSfJiQD
 WQnUYyrD7e9ya8rCm7HCAxEsb2RkSU91y9F88jaBbROrBuM1CaOVt+o2mTCe2iELOkRK
 8G1LknYIeko9gJi2TsBRMCXx44GQEc9FxcyE7OF8rsTCpRNrCLILcqmZxAsMSlzW7SJh
 BasFehZSuvGBGGyybrtl7JPpookQJK09uRAuZfWtn6w57ksFHwLWxLfK8qsimrwf7iqw
 SQhSEvDKWfFxKmH91u0sGe8lRrT0PkynV+XqAsevPe2KeBMFEpdE2O8Jtve+CSU2krLc
 Hzsw==
X-Gm-Message-State: AOJu0YyCWY0UzHab8bs1LG/fCEgXXwxkXUsxUlgCneJFtfdQjrS9Rp7p
 5p+VWa17mI+12ee4Uyk9ijYjPUXHJdRwX/nRp9WEDyWGcQ5U/mT5+N9fgtXyz+rU5ZXxbACux9M
 350ueokOrTInpwW0MJVb360S25Z9q
X-Received: by 2002:a17:907:7601:b0:9ba:b5:cba6 with SMTP id
 jx1-20020a170907760100b009ba00b5cba6mr16976174ejc.14.1697133483534; 
 Thu, 12 Oct 2023 10:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Ev4jZ1AjQIWBFFW64KwIs1qrFVUApRQO2mPNRQF9ONEf/GfLbNT6HeVYBtT/urA60vGy7A==
X-Received: by 2002:a17:907:7601:b0:9ba:b5:cba6 with SMTP id
 jx1-20020a170907760100b009ba00b5cba6mr16976161ejc.14.1697133483205; 
 Thu, 12 Oct 2023 10:58:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gz24-20020a170906f2d800b00985ed2f1584sm11393950ejb.187.2023.10.12.10.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 10:58:02 -0700 (PDT)
Message-ID: <78f3a73d-3c2a-4432-8ac5-9e4418f509cb@redhat.com>
Date: Thu, 12 Oct 2023 19:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/dispnv04: fix a possible null pointer
 dereference
To: Ma Ke <make_ruc2021@163.com>
References: <20231007032349.3997387-1-make_ruc2021@163.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231007032349.3997387-1-make_ruc2021@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tzimmermann@suse.de, kherbst@redhat.com, jani.nikula@intel.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/23 05:23, Ma Ke wrote:
> In nv17_tv_get_ld_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..4a08e61f3336 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -209,6 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
>   		struct drm_display_mode *mode;
>   
>   		mode = drm_mode_duplicate(encoder->dev, tv_mode);
> +		if (!mode)
> +			continue;
>   
>   		mode->clock = tv_norm->tv_enc_mode.vrefresh *
>   			mode->htotal / 1000 *

