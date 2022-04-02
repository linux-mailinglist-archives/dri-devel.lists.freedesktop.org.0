Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C024F0006
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 11:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FC510E629;
	Sat,  2 Apr 2022 09:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46C210E629
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648890905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXdqP9zE7LBfSRWNpgzsUsb+Q78+F/WT2YIOnHUTmfQ=;
 b=GYD+aEnYgKT7N6dPlaWDq2UxbbmjrofYlg+aAb3CkSD4pGqjKAFyMaUcMtDMAqGRFMhVtO
 PH3X196ZIggnby0fdDcUHqivTqXOX7hgiwKuG1JOQSKoQESRZejiZAydeO3rbV/ko3cQUd
 rLzhBJpGsznqpLk3GaSRtfNKM24a6hU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-E9AWAyslPCCK_uS_NlqNYA-1; Sat, 02 Apr 2022 05:15:01 -0400
X-MC-Unique: E9AWAyslPCCK_uS_NlqNYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b71-20020a509f4d000000b00418d658e9d1so2696988edf.19
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Apr 2022 02:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FXdqP9zE7LBfSRWNpgzsUsb+Q78+F/WT2YIOnHUTmfQ=;
 b=Vg1j7/1Yf+1ypzbJR89HQLpWulz+C+pkHBRrrJAMlKn/0o/C6Zba+rw5MVdGz6pqo8
 MXQnjVNDpEHq5O/DRezn8sWA4lUbcXAASo8bO6ygqPqitV8NCV9IZtqxH+iQl2O1cuVl
 j98/hbYN+P2OfEfm/yEg6qQK8NxLNaXTjXVtdFb2FxUbMScVldiriVysifNIZ/KukbYT
 +f1AHEctpChpoB5nbx2S4pdDcSehFvJT3DyVD0QGSM80KnYj0lN4M5wBMKnkbfxtAoIa
 /bfFJO3EjQFIx6O9qtoHuAzeAF4acyKrYIQPJS2I3JblnmayS1ZOGLij3HE7nhTz9yKg
 K8mA==
X-Gm-Message-State: AOAM531T2mj9yDz7eRMfBSK+TFBetq1IZH4gTPrthuJwmTJz7GxOKL5C
 MRepgAFV5Ll202axnZw8IoA5N3tVoMDrL71m1CkQFf9if/eHu/gd52heXMsdK+S0X0Wxymermqr
 oKPsJeLlMVypSTS3OA2oFk4AH0YOz
X-Received: by 2002:a17:906:4786:b0:6e0:c7b:d267 with SMTP id
 cw6-20020a170906478600b006e00c7bd267mr3133452ejc.115.1648890899886; 
 Sat, 02 Apr 2022 02:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmctKj/v9mEgm3bFTAayqwUgHbGVFGNbKm1A5bUq5M707BxXCi0ZcxpQ4c72TKk4YGOmhvSw==
X-Received: by 2002:a17:906:4786:b0:6e0:c7b:d267 with SMTP id
 cw6-20020a170906478600b006e00c7bd267mr3133435ejc.115.1648890899682; 
 Sat, 02 Apr 2022 02:14:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a50cd47000000b004187eacb4d6sm2229189edj.37.2022.04.02.02.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 02:14:59 -0700 (PDT)
Message-ID: <dcc41ac1-107b-7ada-ff41-da69d94f1274@redhat.com>
Date: Sat, 2 Apr 2022 11:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH AUTOSEL 5.17 001/149] drm: Add orientation quirk for GPD
 Win Max
To: Anisse Astier <anisse@astier.eu>, Sasha Levin <sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
 <YkdhftH7tyPU8Gqt@bilrost>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YkdhftH7tyPU8Gqt@bilrost>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, airlied@linux.ie,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/1/22 22:33, Anisse Astier wrote:
> Hi Sasha,
> 
> Le Fri, Apr 01, 2022 at 10:23:08AM -0400, Sasha Levin a écrit :
>> From: Anisse Astier <anisse@astier.eu>
>>
>> [ Upstream commit 0b464ca3e0dd3cec65f28bc6d396d82f19080f69 ]
>>
>> Panel is 800x1280, but mounted on a laptop form factor, sideways.
>>
>> Signed-off-by: Anisse Astier <anisse@astier.eu>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20211229222200.53128-3-anisse@astier.eu
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> I don't think this patch will be very useful, because it won't fix the
> device's display orientation without the previous patch it came with,
> titled "drm/i915/opregion: add support for mailbox #5 EDID"
> (e35d8762b04f89f9f5a188d0c440d3a2c1d010ed); while I'd like both to be
> added

Well actually it will already put e.g. the text console the right way up
since efifb also uses this quirks and gives a hint to fbcon to rotate
the text. So it is not entirely useless.

And since all quirks added to drivers/gpu/drm/drm_panel_orientation_quirks.c
typically get backported having this one in place now will avoid conflicts
with future backports.

That combined with not really seeing a downside to already having
this in place even without the i915 support being sorted out makes
me lean more towards the direction of believing that having this
in 5.17 is fine...

Regards,

Hans

