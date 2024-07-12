Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBC92FB7D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405710ED03;
	Fri, 12 Jul 2024 13:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NIpY/lPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B1210ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 13:34:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6266A61EFF;
 Fri, 12 Jul 2024 13:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBED9C32782;
 Fri, 12 Jul 2024 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720791274;
 bh=5l82faOt0Ftj9KB/8OhC//sWOYz4iWkq9/TcEQ4beHA=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=NIpY/lPlSWZI3R+9H16iJmlQjohMYFbKAnN1ICZijVCIxlgCeDDozmphS3SENp6t9
 NaJhKqPC2L8m/HhmUn3W6QwjFQd/BxayAj7rZgH6JmROTNvSjCqWErvxVjIADxA0Jj
 LgbR9KZgDD9ky0QfIk3xvRcWppmfvG3dVyOk8VOviNIbK5nTvzjFYb7I8uWRBNSMRu
 d3nU3c8KR4w4tG0Xzv7Pz8rfkjFWDVpKrAc2CF3WVWE56Xl+ySb8aCouJ2iNi1EcRY
 0JGEMFMckUZ1xp20pBOl/IX9BbWxSmIcNIpXGqtp5j++B+0GSe+alM11vUY6Dxvl2r
 WcfbiWV3jxNxw==
Date: Fri, 12 Jul 2024 06:34:33 -0700
From: Kees Cook <kees@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
User-Agent: K-9 Mail for Android
In-Reply-To: <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
Message-ID: <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On July 12, 2024 2:59:30 AM PDT, Jocelyn Falempe <jfalempe@redhat=2Ecom> w=
rote:
>Gentle ping, I need reviews from powerpc, usermod linux, mtd, pstore and =
hyperv, to be able to push it in the drm-misc tree=2E

Oops, I thought I'd Acked already!

Acked-by: Kees Cook <kees@kernel=2Eorg>

And, yeah, as mpe said, you're all good to take this via drm-misc=2E

Thanks!

-Kees


--=20
Kees Cook
