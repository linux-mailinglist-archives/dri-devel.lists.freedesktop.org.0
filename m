Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C295CB7408
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67310E7C7;
	Thu, 11 Dec 2025 22:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VjCUMfhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9674010E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIJi8A5enw0jKPdBAcq9mdV3DtYs80Ia+m9Sa3y5QpM=;
 b=VjCUMfhKQPvKcQ0jN4H79CSAfi5gCvxfpgO2lYfr0iqqXXQzLgdD+US8YAdSaYgnFoLRt7
 lQ2cW6QKm36AO9wIFOCxnFck8A0dZv/28beumIxTKIY0jTg6pEZCNVOrcWwCZ+EzLRZ8gI
 d1bHAhzlw0Reb0I30v9LpbS4BdSwul0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-PYhrQd0lMD6efNI5uiCoIA-1; Thu, 11 Dec 2025 17:06:05 -0500
X-MC-Unique: PYhrQd0lMD6efNI5uiCoIA-1
X-Mimecast-MFC-AGG-ID: PYhrQd0lMD6efNI5uiCoIA_1765490764
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b245c49d0cso127269185a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490764; x=1766095564;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIJi8A5enw0jKPdBAcq9mdV3DtYs80Ia+m9Sa3y5QpM=;
 b=FOYUE6BfU/Lgywd1K1wjda4dAKCWdtyVLXOH3aCI65+EyAkesl/a3icVVjHJJsDi+2
 OSqC3ko66MfxLfPp3Oo0D6f30kOvDvbivhhtqh6Ckh+z+ZRVOKbcASmFp+29uGTwcstP
 bBIMsjD+k3GwlHCZZNjRdr8Co0MkFbAVCKeiaLAClFOx2RFxOhTuzqCd3MiG43/gsEFA
 kpVHHxH8Am7NbJ39btQCgKxDTCXqHCvMHkV6x1YyGp/XVFD+gx7F07cao2eGC6uFbiA8
 Sf5Z48Pvmcuyjt5IdaZn+v7779k+572OY+L/gzMqvnGnroXoGYxEI5r2jy8yBmfvmire
 B9gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1DJ0JiWzAxs/t79MYG9pXr2N3pp4eij5xcodt6yTabXANzLtlxKQ975moZg5FbuPzF8bTqXLiTwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6C2Hq5jTMhhl4EeztdxHjDpi3hD24MeZQzXz0EOosrnWWLd1V
 tem+YTEEW8wswW5QgVlILAiv9N6wrBmjPP6+nR6EfjNFzRCU6pa24UWUEJwB6suw7YYHhUu6eTT
 jSCjtT9zPL3xOENmTcVdMGLnGSADXrGVGvKo5IvfvgguGnr7c3Hd7weFxf9LMeFbcVmVNmQ==
X-Gm-Gg: AY/fxX4pwn0aET41cfllMAk5tvD+MZlQ1Jj24ccrmKJPXzdJ1A0UvB27QlLp70nzgqw
 YUP9lWbHBX7arrSrbNe84AmoAv+8U++NmMpiUUf7cug3JOkWw6sAfsaJLmuK2GQpj5Ixf4HuIFP
 Y7I+REW0qEv7RUOqaL8FRuKs/OBVyAWSttGatpR3VEkCfcAcpOFrZTfMBdPeMfkwkMcnnIQ2VEX
 jrbvZQlmkIWuzDzkdjyzHqBvE8EX0l65d2MulraYNUFFGxZmsu+MwK8yj60pGYbw7beYF46sh1S
 a1rOs8FBzTHsoNyMB3ds8izuo5VBwaqAaOhdJw5GQKo4cxDL/OMl6KpqhwPcbvts+jy7sPe3SnG
 OrJFanF8UoxNKFOo6TRM7IAibSlQ2vx2fSiiQ7h8TEGOhD20K1VAuFeg=
X-Received: by 2002:a05:620a:7007:b0:8b2:6538:6b4a with SMTP id
 af79cd13be357-8bb39faf64emr8428885a.20.1765490764127; 
 Thu, 11 Dec 2025 14:06:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeQGmo8QAzGHrPNh9dtBmXlMiOjCoOPGpEBjjdzbY/e4K13DUPj/88xc0QeIDjiQmjO9IPMQ==
X-Received: by 2002:a05:620a:7007:b0:8b2:6538:6b4a with SMTP id
 af79cd13be357-8bb39faf64emr8422985a.20.1765490763675; 
 Thu, 11 Dec 2025 14:06:03 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5665e0dsm318609085a.18.2025.12.11.14.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:06:03 -0800 (PST)
Message-ID: <2a416f38699994a6e709ab7e4990ff17023d4c16.camel@redhat.com>
Subject: Re: [PATCH 4/9] gpu: nova-core: gsp: remove unneeded sequencer trait
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:06:02 -0500
In-Reply-To: <20251208-nova-misc-v1-4-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-4-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xw6Oiqdq8EzEdcxY6JlhvYGLU4AXNFlLLuCECLy7V6w_1765490764
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
> The `GspSeqCmdRunner` trait is never used as we never call the `run`
> methods from generic code. Remove it.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
> =C2=A01 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 2d0369c49092..4efa048b9d93 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -147,12 +147,7 @@ pub(crate) struct GspSequencer<'a> {
> =C2=A0=C2=A0=C2=A0=C2=A0 dev: ARef<device::Device>,
> =C2=A0}
> =C2=A0
> -/// Trait for running sequencer commands.
> -pub(crate) trait GspSeqCmdRunner {
> -=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> Result=
;
> -}
> -
> -impl GspSeqCmdRunner for fw::RegWritePayload {
> +impl fw::RegWritePayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -160,7 +155,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegModifyPayload {
> +impl fw::RegModifyPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -172,7 +167,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegPollPayload {
> +impl fw::RegPollPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -197,14 +192,14 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::DelayUsPayload {
> +impl fw::DelayUsPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, _sequencer: &GspSequencer<'_>) -> =
Result {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsleep(Delta::from_micro=
s(i64::from(self.val())));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegStorePayload {
> +impl fw::RegStorePayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -212,7 +207,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for GspSeqCmd {
> +impl GspSeqCmd {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, seq: &GspSequencer<'_>) -> Result =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match self {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
GspSeqCmd::RegWrite(cmd) =3D> cmd.run(seq),

