Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A11A6EC1B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64410E51F;
	Tue, 25 Mar 2025 09:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KcxwqmKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629EE10E51F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742893519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrC6whXEB8tIJZm3Od4OEZVDDngb94gqrtSVDSXgtaI=;
 b=KcxwqmKBavatPD1sMsk30qZBb+d/+bkdCl9uXpc4dDOqzwIuvyls17bVVSqA+mvq0fjp8W
 gjdWLJikCR+eSkK0tV48+Gu4wsnCUdtn3+wCX/CqGiAuk/FxJmo2+AhQdc5htEPlyEu9By
 piaUc0XveDP3+GyeWVqks52T5eFKBd8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-95hI5cqxMnGa6BbZTAoMuw-1; Tue, 25 Mar 2025 05:05:18 -0400
X-MC-Unique: 95hI5cqxMnGa6BbZTAoMuw-1
X-Mimecast-MFC-AGG-ID: 95hI5cqxMnGa6BbZTAoMuw_1742893517
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39123912ff0so2335790f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893517; x=1743498317;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PrC6whXEB8tIJZm3Od4OEZVDDngb94gqrtSVDSXgtaI=;
 b=oVd4Bq7yQ2Vt/sQJSGLLSBrSKA9yWxGLSACpPEYiLa52CRW0vzLM1B0TLZE8nbWv0+
 fjEInhirrtk37RsyGQAYI3x/L+h9Vz/sUYlyRjazgD33iIOfqlw/QnmLnZ1SfxelFtJ9
 Xm1QxsGXrYM/uPLe1aSN/CizP6SBDQiKNyzQMJ3Ay4ln7wCsora+p2R/sfPS+azJiI6R
 fGoVhGsSu28ByprIeKzf/3dwCAiO51vDpp2qJyTMElGyh33cAdoIT5h7PSkOs/y++1bz
 I9pvjco7N3yOGxnfo0t0TkYI/lm/fuoSKyM6jC6isPexf1EsPgMjFbmodTs2r67HquAh
 t+8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFrDMsryv6W3vZ2n9bRsY3rLr83k3trnxiCPNHVvyjUTKbvOqzGOzaPiNeJmflsidrEOxmMeExcNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi0xDNHdSRYNBNfT+nwSI1+nEwKqYD8PT7udmOKCC+ddUgo4lO
 0Fm4P0oMs5PeZJyU4cWOZTIIOmn0ezY+dH0TRSwmaz+gk2IWUDj9xDmlXqcVDptVdoSyafbxktS
 I4XuKe7EjHBu0nrn4ensz43gs7V9InuN7bEahNlhv+6R075iwoUfg/7Wmjs2zaK01rQ==
X-Gm-Gg: ASbGncurqp4EFoBVTVGYoVchkNOtFrc92iIKSOFUSlfHSbdeDtmprAea0iLsEjaATES
 IGyjpImw0oprNjy9W4BjCDpKG7/iEqBjIwSWNLMJxacZUSY8xIyKr6FxdOb9hwfNgllmWCuzSWK
 D2cQiYACmlNP771S+aKzL822nADRkKXQc7GaPZSfWdiMq/WHzr7nRT5VmLDsu0lvz1Rj8K5g7lK
 JfLP2/Fjt4gNc56nGkqlGIQlC5HLmKcdVDypyhcYyabsR9SIfU2OMuxRRasF0Z0wdX187lqLe/q
 NlQzMQE1j1ehxnNITW1Ar0s0I5RRhfYk79IA5exDPFWxDJM6gBibt44=
X-Received: by 2002:a05:6000:2a4:b0:391:ba6:c066 with SMTP id
 ffacd0b85a97d-3997f932dc7mr15340754f8f.35.1742893516838; 
 Tue, 25 Mar 2025 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTBT9UgEXQQoZOQCZf+geD9eCV4pZV+LkpuIAC9M/oAzFE2WYScIhUIhi8NX1J2SaBNujAOg==
X-Received: by 2002:a05:6000:2a4:b0:391:ba6:c066 with SMTP id
 ffacd0b85a97d-3997f932dc7mr15340713f8f.35.1742893516379; 
 Tue, 25 Mar 2025 02:05:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fcea6ecsm145624925e9.5.2025.03.25.02.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:05:14 -0700 (PDT)
Message-ID: <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
Date: Tue, 25 Mar 2025 10:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/panic: add missing Markdown code span
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-3-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250324210359.1199574-3-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbmriN2e4T2FmyDcKAqj-Za-VNIAuTMGip0PbYDm2Gs_1742893517
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2025 22:03, Miguel Ojeda wrote:
> Add missing Markdown code span.
> 
> This was found using the Clippy `doc_markdown` lint, which we may want
> to enable.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

You want to take the whole series in the rust tree?

Otherwise I can push the patch 1-2 to drm-misc-next if needed.

-- 

Jocelyn

> 
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 9bd4d131f033..a8f832598c70 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -914,7 +914,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   ///    will be encoded as binary segment, otherwise it will be encoded
>   ///    efficiently as a numeric segment, and appended to the URL.
>   /// * `data_len`: Length of the data, that needs to be encoded, must be less
> -///    than data_size.
> +///    than `data_size`.
>   /// * `data_size`: Size of data buffer, it should be at least 4071 bytes to hold
>   ///    a V40 QR code. It will then be overwritten with the QR code image.
>   /// * `tmp`: A temporary buffer that the QR code encoder will use, to write the

