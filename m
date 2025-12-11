Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0ACB7417
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28310E71C;
	Thu, 11 Dec 2025 22:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gB2Omo69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966DE10E71C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
 b=gB2Omo699JL5OExcl2v4o9ePDous08aufMOj6YqwnP00yh4m8rWvl1/UCnMLvYhl6GqWL8
 T50eE6Qis7Y3uM7QKaCeDQH6Q5JvcEtu1Lw5YStY8cOmQi4/BTvwdi13s1zNyUMIsXwMJS
 GS701rqNwQRF3XnJxR3h9lu5flRoLmA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-tnt4XyCzNM6R6ha-a9HBvQ-1; Thu, 11 Dec 2025 17:06:35 -0500
X-MC-Unique: tnt4XyCzNM6R6ha-a9HBvQ-1
X-Mimecast-MFC-AGG-ID: tnt4XyCzNM6R6ha-a9HBvQ_1765490795
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f183e4cc7bso11217981cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490795; x=1766095595;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
 b=of6UdJ/HXM710fH/Mo06PMwHidjr1txZy1ZUrOgsBkPtm0hdpB8EOF1JpA+Hs8+VlT
 kmNOCnWSC6PGJUUDTIsSOtw/wCXdZVI4KrLrFTOA5tu1+7rhnr0YdHIOa3ujZ0YxTQqd
 NGgQwtUycdxSJwhywFrxlVBtGNYViwfnPwg6G5cz7BqdP3Th0/7Sxvz4jSbpvZT21Syu
 XfsZHDaENCFpsWevqt4BdbvC2UTVj0YZbdKzk7fIj3/xC8l07SAsI8A4ep+/GzP/FlZJ
 yWMCQo8lPRo1HhKHkTHqX0A3mQll9By6dIrIQVqyxFhjfFTo30Ya1MSRSySYpRDIxsUg
 sHmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj/3BgLWKrC1rG9qX+F+LQUAx722PAJ+kshJhIJcBQ6jCJL1H0//7d42UAuJQwnVT13sbNC927GZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygCRwIson+3wbVIpqsJXpqtXG6Y3S7nEDKx3Kxo5ssPw+9xc/z
 ZrdxFwSL2g676jx0x9bkDkZ64dBIkUEBEatAHUXo5wqW+oTcOcxcLUWkxelozrWVsU6kNDabN6h
 d8AijWgXSIF/MIylioL+Z7YGs0LZ0Fmzd4jPVChiIHqdZrys5dGIw5X8n4VPGE0Ihf1B7EA==
X-Gm-Gg: AY/fxX71kLCA0ASRlgznxiAvInTVhfQR5HEM2fZaQx2IpBke9Kh/6KYlNw8zqDfmruF
 xvTetmncCRDh6AAl3MILsCV7ekXhIgJnjlI0DFsMj6Yn3BOFyZSGY01QbVDNLPBEeTdT595AouJ
 aH/RIUicxWlRl0IiKkpbVWCSlG2d08ZvYq2x8quk7us4fZEGaAaPYmZ4ZrJxw2THxRCkt+i2CB3
 n1nPAGr7rJFDjJMbOaROLdjR5S262vxwSgUykF9z8sHDEOo8UVuz9BM3jiiV1OU/TTDpjlkk/LZ
 hTm5N7q8I6UkfM1Y8CnbVhUVfQRCEW5E8LiBgskIhtax8l4PAy1IF4DdkEgn3aKQ2Bz2l//03Qv
 7UllvyM1eDULUqIBg6bZPcHLaXk30cbbG3e+Je/TMvDopIM3W5eojJxE=
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id
 d75a77b69052e-4f1b1a7e143mr102089771cf.41.1765490795197; 
 Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaqeBiuM6CsFwruI5tizpjX8j7kpXn5KxhwmEige7pYuP2pDesrOgqZ9YYEKxErZ2GWsjRPA==
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id
 d75a77b69052e-4f1b1a7e143mr102089381cf.41.1765490794825; 
 Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd5c5e17sm27572841cf.14.2025.12.11.14.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Message-ID: <2a80f215aafcc39fad8eaab5a84ca499d8c40500.camel@redhat.com>
Subject: Re: [PATCH 5/9] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:06:33 -0500
In-Reply-To: <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FBIEraTlMhCK4_5jqZ7_UwmQ-X7i6DgzV40pkBsi5YI_1765490795
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
> Being able to print these is useful when debugging the sequencer.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 +++++-----
> =C2=A0drivers/gpu/nova-core/gsp/sequencer.rs |=C2=A0 1 +
> =C2=A02 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-
> core/gsp/fw.rs
> index d06c0fdd6154..d1fc8f111db1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register write payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
> =C2=A0
> =C2=A0impl RegWritePayload {
> @@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register modify payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
> =C2=A0
> =C2=A0impl RegModifyPayload {
> @@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register poll payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
> =C2=A0
> =C2=A0impl RegPollPayload {
> @@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer delay payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
> =C2=A0
> =C2=A0impl DelayUsPayload {
> @@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register store payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
> =C2=A0
> =C2=A0impl RegStorePayload {
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 4efa048b9d93..5eead7ad4cbd 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -70,6 +70,7 @@ fn read(
> =C2=A0/// GSP Sequencer Command types with payload data.
> =C2=A0/// Commands have an opcode and an opcode-dependent struct.
> =C2=A0#[allow(clippy::enum_variant_names)]
> +#[derive(Debug)]
> =C2=A0pub(crate) enum GspSeqCmd {
> =C2=A0=C2=A0=C2=A0=C2=A0 RegWrite(fw::RegWritePayload),
> =C2=A0=C2=A0=C2=A0=C2=A0 RegModify(fw::RegModifyPayload),

