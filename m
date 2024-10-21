Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6E9A6BD6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7710E52A;
	Mon, 21 Oct 2024 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pi/CJZBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976E10E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729520081;
 bh=CbK/TUhgKsr7R3sfPkrt8loPP4+oBOUaltz2In+SVk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pi/CJZBosApQDNCSxMR6aYEEiN8RtoyXYUgBtdQyKh68xTJRc3wKlXFiYUOp1WYo3
 iPt8cOY33j6YJFQo+Au4HiFIapGdtNlAsF86Z/l1xQF1XXK73q72uxDgeLMJSaZbiU
 q5rHB8Dh5nvDB+bhYe+5M8QmkB1GpItJxx7rlxJIIljk1qtkgq0pFxOUAx76j1kB3U
 F+QWaiRrVHBo2UBZpKsn94lOuMD7PSMuW0nSylPDbzvWR92sOIXSaQcqKflrpkJA1B
 cGvQh9FJh9a87XujYIbndpGbBojeVP9doa3qWpsBqwgtsWtuPNzuNXH7KzH4tIfLl3
 gVsAy6F0IyeuA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C16917E3621;
 Mon, 21 Oct 2024 16:14:41 +0200 (CEST)
Date: Mon, 21 Oct 2024 16:14:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] drm/panfrost: handle job hw submit errors
Message-ID: <20241021161437.4555a490@collabora.com>
In-Reply-To: <20241014233758.994861-4-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-4-adrian.larumbe@collabora.com>
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

On Tue, 15 Oct 2024 00:31:39 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> -static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> +static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  {
>  	struct panfrost_device *pfdev =3D job->pfdev;
>  	unsigned int subslot;
> @@ -207,15 +207,15 @@ static void panfrost_job_hw_submit(struct panfrost_=
job *job, int js)
> =20
>  	ret =3D pm_runtime_get_sync(pfdev->base.dev);
>  	if (ret < 0)
> -		return;
> +		return ret;
> =20

You need to call pm_runtime_put_autosuspend() if something fails after
that point, otherwise you're leaking a runtime-PM ref.

>  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> -		return;
> +		return -EINVAL;
>  	}
> =20
>  	ret =3D panfrost_mmu_as_get(pfdev, job->mmu, &cfg);
>  	if (ret)
> -		return;
> +		return ret;
> =20
>  	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
>  	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
> @@ -263,6 +263,8 @@ static void panfrost_job_hw_submit(struct panfrost_jo=
b *job, int js)
>  			job, js, subslot, jc_head, cfg & 0xf);
>  	}
>  	spin_unlock(&pfdev->js->job_lock);
> +
> +	return 0;
>  }
