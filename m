Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7366A49333
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA35E10E24D;
	Fri, 28 Feb 2025 08:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="il+YwljU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F065E10E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740730708;
 bh=g791kg9Jj13cPSH7pEkjvldmLvRdZOxf2VzDKwaVK74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=il+YwljUM0dzlAlgcvtUcIG4r4cvos9WFqe7HoNh0VX1GyA4btPUFpWu7ZMgbHLb6
 ZN1hYL1Xt+Gdg+iMwGHJyMjmEqrf6k/++MMmMLHRG7S0Ya15ubPmv26qrumBc0TONC
 c+4zlo+nD9LgfuYloQ+cPB9vnsYQS1ifZV8KSHJ7OL1C+93j8FZIXAwTJ/F8JMKQuO
 DND1cv3VH2OleNf/+NveRO8ywJvpWOyiv+mloyBGrBrkarQmSPExqsb5hnI0zkGsOI
 6c12Z53GIl9f9egDkiCaiD0jmpE8sVPS50nOH1YdJshvXvo3IVm7sHAsHBRqaICZd1
 B06/IDCm+GsBQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DBD6E17E017D;
 Fri, 28 Feb 2025 09:18:27 +0100 (CET)
Date: Fri, 28 Feb 2025 09:18:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mihail Atanassov
 <mihail.atanassov@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panthor: Avoid sleep locking in the internal
 BO size path
Message-ID: <20250228091821.75d4d436@collabora.com>
In-Reply-To: <20250227231628.4048738-2-adrian.larumbe@collabora.com>
References: <20250227231628.4048738-1-adrian.larumbe@collabora.com>
 <20250227231628.4048738-2-adrian.larumbe@collabora.com>
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

On Thu, 27 Feb 2025 23:16:26 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> -static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
> +static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
>  				    struct panthor_vm *vm,
>  				    struct panthor_heap *heap,
>  				    bool initial_chunk)

The pool has a ptdev and a vm, so we can get rid of the vm field and
make the panthor_alloc_heap_chunk() and panthor_fre_heap_chunk() helpers
consistent.
