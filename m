Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5ECB7423
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7EA10E78C;
	Thu, 11 Dec 2025 22:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TwHsRSIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950C10E78C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
 b=TwHsRSIsJ6s9Kt5a+slTqyEicycgAovhxYryD6RFK6t6FA7lm3km1WjGUk9l/DfM+VKecs
 W7ZmVmafXBnblVboPWtA/Fz2jAHSwOSMsxnBC0fe9eHi3jlfh+NKIGMHt4Y0o/srqY+y0Y
 5/t2bYq5P50FYJbLxtaZ9Qg7gI5YxdI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-GsOzyLJSNWu-HwjyxQTGeA-1; Thu, 11 Dec 2025 17:07:17 -0500
X-MC-Unique: GsOzyLJSNWu-HwjyxQTGeA-1
X-Mimecast-MFC-AGG-ID: GsOzyLJSNWu-HwjyxQTGeA_1765490837
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-882485f2984so11050706d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490837; x=1766095637;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
 b=eYPa84nokUbPMdEr+E6FsR/WxyF+3T7Q7RGutomEn0rlAfivRmDNA+Yjb9272e3KrK
 QxBH7EbYVtJakth6Oy/tSSWWyL3l87cEXnCOw2L3SraFHoFtw5nAO0+K85iVDUthOr1l
 kgrF73UDdSgDwKWrgHJk5HkfMiZKTPxbZEvRbNzYs6ncqSJeyskErdgkKaRK4lRCj61E
 RnrQ+TU9Haqw32LeNSG+ULOdW+lWuiyQTv2F1CLogs/NRLsTvpZeVR6ztHQ9XHvpzh53
 z5OLwUpMdv8jL/Gb3S/SSWtx7s6WhexWB7i6oQKCoykMGvw6Dt25vfmnEQnRUCUaghMF
 oamA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgCNeguT3F8CC/T3lX8zoUyPhS07njLAjzvDrN7NIvOeKSgUIvdeKgKnp9OxYsxcLvWw58G8hK9eo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/yTJMa4vQrtaOlba5bHBURuow2c4BLO9suMnhIAcfiLDUUZZT
 gI/Bu2+BjK29beYCfheIP07MubXKLoa4GFxQAXUMcBNzUdueggjJFhDYdGh1kT00ITmAJ/qSG1p
 vEtbreQwOsx3PQveIFt9mkPeJUEdFz9eWdMqK7cFo9PCvOicFJvNnI06PAzcgdxygXyXcSA==
X-Gm-Gg: AY/fxX4PPPMoJW9CJaOrd3pl9ZGEHZ32tt50rzMrwlVc5UreGCnfXx+srfMEM9Z/bUr
 6YaOmS1opyhfLpwt7cL9tU8ZDMRpEGoC8lcmO8SohsiUsw9po/gCxKNgzwbv8UCMc1jNWJx+thL
 SpeZtUebp4WiL7izytgmkm2vjWwTAT/yPWw8YmP+0D2NON4XUeyRzU74M6YCfHhaIUiGScuxs7S
 vzyHH/0DSVku7JgZ4ZWCLrmrTLPd9M9orE/gsh6EjaHIiBwyn4Giw2yHZZWOg9OfkfdfQBy8A2b
 UED3AD1Ww4lxAJdEindB1/3/iuLX2OGyMOBwUN+xldZsTnF6qALPW91v4Q2MPwBicdvx5HVGKiR
 ibQmJLw3+pyXnSbI7IPELg1F2zYZttq9t0MtGQwP3WvEEI8DctX9ZmKE=
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id
 6a1803df08f44-8887e7f4717mr2002916d6.59.1765490836922; 
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpL7P109j0TrrJ6OMch/eU/9skpG1csWeSXfbkzBfpFzWr1R23nHPE1F9w7iK8jbzWzXkOng==
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id
 6a1803df08f44-8887e7f4717mr2002536d6.59.1765490836603; 
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8886ec56964sm31777496d6.21.2025.12.11.14.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Message-ID: <a8276c36fe1638cc584262d0d722623987deb1ae.camel@redhat.com>
Subject: Re: [PATCH 6/9] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:07:15 -0500
In-Reply-To: <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6hKJng4C7p0nrJVPWznZeep1uyRFQj69t2dRgEtySu8_1765490837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> We can derive `Zeroable` automatically instead of implementing it
> ourselves if we convert it from a tuple struct into a regular one.
> This
> removes an `unsafe` statement.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
> =C2=A01 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs
> b/drivers/gpu/nova-core/gsp/fw/commands.rs
> index 21be44199693..85465521de32 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable
> {}
> =C2=A0
> =C2=A0/// Payload of the `GetGspStaticInfo` command and message.
> =C2=A0#[repr(transparent)]
> -pub(crate) struct
> GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
> +#[derive(Zeroable)]
> +pub(crate) struct GspStaticConfigInfo {
> +=C2=A0=C2=A0=C2=A0 inner: bindings::GspStaticConfigInfo_t,
> +}
> =C2=A0
> =C2=A0impl GspStaticConfigInfo {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Returns a bytes array containing the (hopefu=
lly) zero-
> terminated name of this GPU.
> =C2=A0=C2=A0=C2=A0=C2=A0 pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.gpuNameString
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.gpuNameString
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> @@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
> =C2=A0// SAFETY: This struct only contains integer types for which all bi=
t
> patterns
> =C2=A0// are valid.
> =C2=A0unsafe impl FromBytes for GspStaticConfigInfo {}
> -
> -// SAFETY: This struct only contains integer types and fixed-size
> arrays for which
> -// all bit patterns are valid.
> -unsafe impl Zeroable for GspStaticConfigInfo {}

