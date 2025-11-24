Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21EEC814ED
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 16:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397710E2E9;
	Mon, 24 Nov 2025 15:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="PRcWDjSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A691E10E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 15:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763997792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iNB7BxoqiLAq10HGNy7UNMt+FVvadPlofhvAdncbXm5RVwtSJIsWMy8F/UjgIlRwJ0NVzhVKP93MBcbF5Xjr2AcHs8LmY6hy31oRC39SSk0XK5qqsgTVXB3/8tHFDYT/G3ek0UB7xYV3vpwdZZ1viTrChvOYhEq45Vd/7TRWnx0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763997792;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ed8aM3uE6K2wq2P/cGnFcTZ4sC7TrbmDm4/XKpy1kbU=; 
 b=OyBKSWBa8ciG2bXtDOnJjGzxu+Kn6PqYA3WGzZ6DcxQup0fDF5H5wSFwJa4hXt/mE3KABehj/C7y/rpB834sHe6X9uxsayqI++QRJp5elRS2DkVl5ISehdY68H+hp+RwYEt6FmoZF6pRzPHUVAyl6XzOPafsdmfqgklVBqZLM9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763997792; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Ed8aM3uE6K2wq2P/cGnFcTZ4sC7TrbmDm4/XKpy1kbU=;
 b=PRcWDjSR64CsYv0s1t2Wf6bNKMc9RQlLGOlTNXqNQW3b3RquFKp8Zh1Viq5LgJy+
 VaW7DZS4Fg9s11NZpuDBlokGYhxfu83Sm/Ou0EfsVGcAMSCY1ny1tzNpkN2W3rd5ERN
 KSZjDxVCgqkla6JEweKfsIYaAdeRyyE99adaW0G4iKBm4hUG/oHMcUvXZQ7UC3XuChw
 bD9sCVSzqS34PWNJwdU0l6BMEIjfWq81v6zdby+4OqpxdyQqUCp1/3hCcp6S63OTDIS
 io87bLHe+n9+9KarbPqDkPURtsrJRFVS0ULz/DgOCrHDvog9DaV/CeiryDlKc5SQmmG
 wlS0DwPlHQ==
Received: by mx.zohomail.com with SMTPS id 1763997790359486.0877922892978;
 Mon, 24 Nov 2025 07:23:10 -0800 (PST)
Message-ID: <24a3104c9879519c70554510766aba98afd663e7.camel@icenowy.me>
Subject: Re: [PATCH v3 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 24 Nov 2025 23:23:01 +0800
In-Reply-To: <374aa38b-c16f-46da-985e-266fdfb4c717@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <374aa38b-c16f-46da-985e-266fdfb4c717@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-11-24=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:57 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 24/11/2025 11:52, Icenowy Zheng wrote:
> > This patchset tries to add a driver for Verisilicon DC8200 driver,
> > and
> > demonstrates the driver on T-Head TH1520 with its HDMI output.
> >=20
> > This display controller IP is used on StarFive JH7110 too, but as
> > the
> > HDMI controller used there isn't as common as the DesignWare one, I
> > choose to use TH1520 in this patchset.
>=20
>=20
> That's a v3, so please kindly always write changelog.

Well I list changes in all individual commits.

Should I merge them to the cover letter the next time?

>=20
> Best regards,
> Krzysztof

