Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B749B36D5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99FB10E50F;
	Mon, 28 Oct 2024 16:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="YDPMWx+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AAF10E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1730133652; x=1730392852;
 bh=YnLp2twzv2TNQbo4aCFZTZoiRr0XaMjJP+UKxGSJsRk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YDPMWx+VopN7IYplxBpOGlkFuWwiT0GjcLnCz/I7w3zK8cYhr/x9MRkDkWtFKNbt0
 GuokZV2xiVMslVNXUso5BClJwe29PB0anTiGBGDxkAH4/4g/0Pdq/ZQYpn1tbsis8d
 Jh/j1593zuLLkEzL9LtnyXZiyk1dsrdn/4GOXE9o+SzVZclfjLV25zyy4eABWHjZXo
 ReRwqZJjW7aUN0dQyecLkqMMwEg4saP5paeE4yNMUL+uPOQp2W+WM/cuuDVY7VukL/
 p2OCHCd9MA/8rzOp1+hz9J9t+5YSuQPGA8qkRUx2Kdddk4PakB/P4Ex23rK+F2UQDU
 rqdNzkUVc3Qdw==
Date: Mon, 28 Oct 2024 16:40:46 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re: [PATCH v6] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <-rVNN65kgfRzFJBJDIwQF3jNMfXIZFP8GibtUgB_p-eWGLBkNZhYFr-BXEas8IjjofHxWQUqNicUSTp5rb9XmuLi35XsDd0PzJPz79j-M-8=@proton.me>
In-Reply-To: <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com>
References: <20241016223558.673145-2-pZ010001011111@proton.me>
 <DurUfF_0TBHKv4DHKIP3ggQh_85nRY0usYWn_fu_oJ45txO7dGKv-OK5rl6EDEPmX5l8WzrwPCzAvYz0xFPfeKGyx7enu1g-prsWIpilv88=@proton.me>
 <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 70c53b22f6b3d3f24ee6b0df1f6f75d1e7f29476
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Monday, October 28th, 2024 at 7:42 AM, Andy Yan <andyshrk@163.com> wrote=
:

> Hi Piotr=EF=BC=8C

Hi Andy

> Tested on top of Linux 6.12-rc5 with rk3566-box-demo in a buildroot + wes=
ton environment:
> weston --backend=3Ddrm-backend.so -i 0 --continue-without-input
> weston-simple-egl

Thank you for testing it!

> simple-egl will draw a triangle on the desktop.
> After the patch applied=EF=BC=8Cthe triangle will flicker again and agian=
=E3=80=82
> So it break some function=E3=80=82

Did you have gamma on? The screen flickered for me when I ran something=20
writing gamma LUT frequently because of disable step I reckon.

> I've been quite busy lately, and it will take some time before I can anal=
yze what the specific reason is.

Np, I will try to reproduce this behavior with weston on Pinetab2 in the
meantime.

Best Regards, Piotr Zalewski

