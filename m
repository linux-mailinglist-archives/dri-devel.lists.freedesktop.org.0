Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0491874B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E1C10E957;
	Wed, 26 Jun 2024 16:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="BUopx4bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627610E94A;
 Wed, 26 Jun 2024 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719419156; x=1720023956; i=markus.elfring@web.de;
 bh=+BOJNdTWEc0DoeEIadfvO9hcM5W1C0uZqLmVuEgings=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BUopx4bm5LepcSY9IGuR2p7li7I8+ZvtMbKcbPkK24fKoOGXW7RRR4WDEKvKEI3K
 3Bz/P/EO4IWVje5Y7d0cjg95elb2TI1JDeDVQ5BydMtlUkzLAlH7/+8g+wUIuBRd0
 EduNZrAi/1lt96GkBBQGGYvjkjtaEaqY59W+MWww6qr8o1OCvE9DLW06A+FrHtbXI
 XSFgHSH70p9jwP+ILpkrlsuR92Jvgo+VikjANgHKiZzO7rAa6RpMfCIx59mAvzrob
 3hVmGHuotkix2FUk3Urx4Uz/w/tlVktXnvpSTF5h5eTJsd1iXAUXobRPKAri3k32m
 ahvdxqkLEzy4+3zk4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGgJK-1s9uYI0kEM-0070K0; Wed, 26
 Jun 2024 18:25:56 +0200
Message-ID: <a8470f92-8059-46b3-b50d-5ed776d5b087@web.de>
Date: Wed, 26 Jun 2024 18:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240626130650.2866706-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/amd/display: Add null check before access structs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626130650.2866706-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hW5T3ytNJy84MW/WoW5rqy1HSSQrjRdA2CQImSwGMFGq+ssNq1U
 2KmdBKYZeF+wxg9l+M2L/2jHW5jC5t+/lswua/aMyCTz9p2rh8pAlhkiYmFyXUnnOzIzO+n
 EqqNO3rgp/TM9HvF3VEe0xF6RNO7J7QVEjCVn2urM4xiJfVlXb6Hr4r/bnGKQRYEgQ/lu43
 7WoEaxsY/oaV3nNnEDWhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BrK4kecaDD8=;x68V+m7KY51k84B+tcqQPLPp5Z/
 02focIqKuCbb14UU9GVSNkg4W0t/t8tKvY2jkL6Mzh3HIBeI5Rkl0m3cwCEKuCqcCgyLoy1Ny
 b5ciZCTEVHM56RKL/1o8Xe8maOPzwYtpWA9EPcb3cvx1MBowLlgYChSjz9VZLbL9s2IHBKxOi
 ZgABaH+zEQ/w/4avT64YEZAU3if2MsivhbfhD5YdM8cMMsWJv5wyHsBTTONawFTXj7CojnjFC
 yY8QA2iZTjeKuLDqppGfzutKJ9M+uPxvD66mKbXAcCh7gBx1kCUgt9QuhLvrbeohFpBJhwAYI
 3I9sfHjQFexgRX4PBIzYdtrg87X9eZHPrU5olO0bwKzeaPYeb/rHsLms257vzy+2YJqzERpzO
 jlq2HwU1uVYia9H1FWTJKrd7osYOYUpg8mSZbyGu8Q/lbR+YaoXdRLKT026iX1+Mhiz/NWyqA
 NPE1hfyN/cBH+DStzuXk0VmcVKTrmdjyjGBqU5mze0F49u8C5UoouniI21U90O26cMv+PcYRq
 b34XFj6f0ZuUq60BpCO3sLJnH15XmU8nxHog8D0KPEkewD5vDdAXaHxV5BnCs7hJuGAqp5jCP
 d5m5iC22zZFRkOvlc0xvp+EidS9CPJDCQ87RsWkFMvplV0zbtd3yChdnotxPIY7SiIuN0rZAw
 lN6MxRh6xEgqjTHSxu5wRWA/IwpI8BU0WKSrECVUYgXARhiqTHGd7LRMCSwtOb9ZlreN5vF/K
 E/nGZBT6IvPWdr9VyBFoJ+f5JCAosy7bf5OrYgMRR/21IxDoSl7ieVAI3Rf+Su+nZI4Oe+RHo
 QgVfioky/3erOihTVwCE+bNVhpCxbVClqx2n69vtaOEys=
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

> In enable_phantom_plane, we should better check null pointer before
> accessing various structs.

1. Can a wording approach (like the following) be a better change descript=
ion?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.10-rc5#n45

   A null pointer is stored in the local variable =E2=80=9Cphantom_plane=
=E2=80=9D after a call
   of the function =E2=80=9Ccreate_phantom_plane=E2=80=9D (as a data struc=
ture menber) failed.
   This pointer was used in subsequent statements where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


2. How do you think about to use a summary phrase like
   =E2=80=9CPrevent null pointer dereference in enable_phantom_plane()=E2=
=80=9D?

Regards,
Markus
