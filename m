Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4714CB7435
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6210E812;
	Thu, 11 Dec 2025 22:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W9PyciTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701310E812
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
 b=W9PyciTqqDWrV4BUqQ8khvsG8CcrjyBl56hO5/ATHQpdlJ528Of+YqfRvbdWyNMspd7nx4
 z2ZSM0qZQbBu7n7pKNEWVgnkT8mRLAwDqWyR8XKTcxl6YiuEPUjZHbJN37gCMBf0OBNEe2
 dLigUKQhaqG6TAA0sb1oRZwXCiXZ5t4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-8cwjodSQNUeVbqxBTXeOmA-1; Thu, 11 Dec 2025 17:08:31 -0500
X-MC-Unique: 8cwjodSQNUeVbqxBTXeOmA-1
X-Mimecast-MFC-AGG-ID: 8cwjodSQNUeVbqxBTXeOmA_1765490911
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-880441e0f93so15544816d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490911; x=1766095711;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
 b=hwtxcjzr/HOwu24m4OrYZCihmRdLucRkZZMFKutTiF12ge5KKDeE1lS2fgyDCm3EB0
 nuQZ1u2rPo3D3BI3EVj0wUv/MbZ04kWc1Qr48BP9uUnJFo/e0LN98mJDtzNafqpGpUlx
 xWfbWiRhWBtJc7IcxsCrKyecsUsfSpEVxh/aQNiD7n1CGwK4igCeIn4ZwEnMAiTDdgxt
 M9da4yT+f2FfUCaSOpJlmWokHq6c7Z4CUKnLVhbAhmorXJUrbv0/RC4ZKwV5xTxDEYGL
 NrTjIqDwGdMxDtfaaQLrY1kWKu3DFrPPUVOxzKCbu09otQS6bU5qwi5CPv4Ljc0CqwIc
 mGQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmK4lGpeLJdxr9V9lsLrjt8gEv3viqjOKICQuUS2/hsBqHZsJj41Ppa5byYrDrVhTuACbiboPGaFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZf4nJ1++Qltc67fMCtBzwj5su/LVlrNtjxyvDi8mdbN/Ni7kh
 tnXRCu5f9cw17mAPwF+eKrOkxQ7dqrUGWiyp6YW56qZsTPf4uTTPxZD/Lv/AY1m50hfUlPr1WdU
 gDwwlgYEWZ2HQwj9x1R/Pw61jRsf5iRC0Jn34dbuZ8ydo+YexPkKRiWceZPzn0icTgFJDEw==
X-Gm-Gg: AY/fxX7su3ipqoRzVXJ/Y/ZXQgGa8eJkHP4P1G7mesDk8dly3YexgzQgzCbIb1Y483P
 2sWB2dNDTHn7+y3we7JnB0fFjVAv8uYz+P3S+v3RuhcOzTtRYNCwP/n8GhHEEYbxflLKToR2GqH
 gugkXmLFhY60y11gu9sJvkLdz6kY71UWLJZ/4ybENKWWMYjnCDOeaS/p5qeHy55C2HQoOIFWEIz
 sBG06ssGVLTa7KXxsmrXNzt9E95G/eQP0d0RBHjDyidHTMy8Hl0npjRxSx75CW9GIX6h9slunPb
 jX9gIiR8WZhbsTyvzBmPELzboG8MJo+FzacfBnsAhESPhWmhl9bvjT19BoWMbR73K48ZIO1a4DW
 I1QXRF9yoTzFoVsCtqCIRkZQTMHQfgVVpYDOacOKJDuHK2Jfs28y6moU=
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id
 6a1803df08f44-888715bbbdemr57238306d6.33.1765490911208; 
 Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTDQTVTO5abPiPnspbVewsjfe+HupVyKsPE/ZW6MQ2Op6oHfEVczT7wvjjsERpI1G70gtkQ==
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id
 6a1803df08f44-888715bbbdemr57238006d6.33.1765490910860; 
 Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8886ef0d332sm35706406d6.45.2025.12.11.14.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Message-ID: <8067808d2dda24ce27359e26653839a127eaa974.camel@redhat.com>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:08:29 -0500
In-Reply-To: <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: noeXkK815ZzNh-WAsVB-nU9bObMDJLQia8vozZIluXo_1765490911
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
> `run` doesn't require a bound device as its argument.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/firmware/fwsec.rs | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs
> b/drivers/gpu/nova-core/firmware/fwsec.rs
> index b28e34d279f4..b98b1286dc94 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -412,12 +412,7 @@ pub(crate) fn new(
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Loads the FWSEC firmware into `falcon` and e=
xecute it.
> -=C2=A0=C2=A0=C2=A0 pub(crate) fn run(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &Device<device::Bound>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon: &Falcon<Gsp>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bar: &Bar0,
> -=C2=A0=C2=A0=C2=A0 ) -> Result<()> {
> +=C2=A0=C2=A0=C2=A0 pub(crate) fn run(&self, dev: &Device, falcon: &Falco=
n<Gsp>,
> bar: &Bar0) -> Result<()> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Reset falcon, load th=
e firmware, and run it.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.reset(bar)

