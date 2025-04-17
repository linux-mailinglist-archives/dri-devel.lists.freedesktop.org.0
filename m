Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E524A91BFB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2B010EAE3;
	Thu, 17 Apr 2025 12:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Krgqvkxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC41D10E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744892812;
 bh=ojopRztzKPVRCLLKy8aV8hgS574nLCWJ9ltF38ifVnE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Krgqvkxt5D06ccgRe31XlRADcAHPrGxn2CBjFE+0N5YtTi0fLkEdSaU6xXILXudH4
 Ot0/xVy3Irz95IQ6FQ+UeriOAuyVCjxRgCw29fbakHWFu6ZHpLkUDZHYpJaAdRoOQ3
 OkFkHCRznQiJJnC2MH5KYznR6Lx6n+iukJtmC5FHJEih/tCrndkLU4rT0QnlHqsEig
 WTICPf3PG3wq3wC2JtcVBIooN40T07TQmTDLbxL7W20XeNM6wccQo6JkOjbOGoaCNK
 k0PjY0/T7rsWa+oDxNSLCWWb3dfJzDqz+itEElKYQRh67ymdnH8MVTo00riBzhDPiy
 93iYm1zfqTpcw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E19E217E0F66;
 Thu, 17 Apr 2025 14:26:51 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:26:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <20250417142647.5d287244@collabora.com>
In-Reply-To: <20250415191539.55258-2-adrian.larumbe@collabora.com>
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
 <20250415191539.55258-2-adrian.larumbe@collabora.com>
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

On Tue, 15 Apr 2025 20:15:31 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +/**
> + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTH=
OR_BO_SET_LABEL
> + */
> +struct drm_panthor_bo_set_label {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +

Funny that this one pops up just after I fixed a missing-padding-field
issue in panthor_drm.h. We really need to tool based on pahole to
detect those before merging.

TLDR;

	/**  @pad: MBZ. */
	__u32 pad;

> +	/**
> +	 * @label: User pointer to a NUL-terminated string
> +	 *
> +	 * Length cannot be greater than 4096
> +	 */
> +	__u64 label;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1037,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =3D
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =3D
> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  };
> =20
>  #if defined(__cplusplus)

