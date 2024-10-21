Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D99A6B97
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC65710E517;
	Mon, 21 Oct 2024 14:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R+ZT0LCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1AC10E517
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729519680;
 bh=hp1nFcv/cw2s7r/PFwgkDdXRyrA3l8PSWu+z40NPYF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R+ZT0LCkIgysznj3jyQGw/RCgT60fIQRhn13UUZHe5CGoSZ3H71HAMXwKIAsKX8od
 HcqAYENXbN5F109ijKQBbKPYa+zlp4YiUpkdXFKxUQ6pzDIhceodsqWaNwZQ2PA6Q+
 HbOtJsjmdNLfi8wd3yfFZeGUzWvxGhKRIsXO4gu4cbIepxaOXIR+9eWAi5JotCF7MG
 SPNSqSjdq66UJxWe1rYV6GfSqPFnjqUkfCApmuVey3uJqfb61ZR5f2mes2Tkul6GQ3
 PNRB0RM2IVJpeoEpGl7UxyNKsdLU8QnJy4S02yP9sCROCqTHHu3d/rEqg3Q3uMaYpQ
 TUGtGvinFC0iA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0484D17E361F;
 Mon, 21 Oct 2024 16:07:59 +0200 (CEST)
Date: Mon, 21 Oct 2024 16:07:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/panfrost: handle error when allocating AS number
Message-ID: <20241021160756.442e7e55@collabora.com>
In-Reply-To: <20241014233758.994861-3-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-3-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 15 Oct 2024 00:31:38 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> -u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu)
> +int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu, u32 *asi)

Or, we return an int that encodes the AS id when >=3D 0, and the error
code when < 0.

>  {
>  	int as;
