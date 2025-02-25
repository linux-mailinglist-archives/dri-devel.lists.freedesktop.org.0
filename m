Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF7A43F9E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480A10E665;
	Tue, 25 Feb 2025 12:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ahtVADj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9C10E665
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740487414;
 bh=ThZw8T6DuX3V5frsHq3jSN62Ru0Y+m5d8yUPxihXdE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ahtVADj3Eee4RvfCy9YX0ZRDzziZHexss9gc6QtR9GrJjhUjtv2cKhh+oKVFYHI68
 nVn/jcuQkf48vWYnsE/lKjawfIwFDwu9ZaeZLvUKrTnpJwXt2y+lQwEC2guMISSjOI
 5TC5m8B9Ntkh262//3SkgI0NK9umoEZ/g44iCiSMuwzrxLlwG+uXIYLOrEtImjCvVE
 eh0LK8loXyo1gL4mAhLTzCyXQh4GlwKw4Z4riNJm1cLg5pYzkEgG0cHsrSjvnRWHzH
 QI7aGcj+fIRlYXc8GI7T6kUrewUcFt1D7Zn+BHguyeX93oRTwmzKFWVLoE2zzKscpr
 bMJmV5l6oWU5Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B9E1317E0B59;
 Tue, 25 Feb 2025 13:43:33 +0100 (CET)
Date: Tue, 25 Feb 2025 13:43:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven
 Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, Hugh Dickins
 <hughd@google.com>, kernel@collabora.com, linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/7] shmem: Introduce non-blocking allocation of
 shmem pages
Message-ID: <20250225134325.72a071b6@collabora.com>
In-Reply-To: <20250218232552.3450939-2-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
 <20250218232552.3450939-2-adrian.larumbe@collabora.com>
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

On Tue, 18 Feb 2025 23:25:31 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> With the future goal of preventing deadlocks with the shrinker when recla=
iming
> GEM-allocated memory, a variant of shmem_read_mapping_page_gfp() that doe=
s not
> sleep when enough memory isn't available, therefore potentially triggerin=
g the
> shrinker on same driver, is introduced.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/linux/shmem_fs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 0b273a7b9f01..5735728aeda2 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -167,6 +167,13 @@ static inline struct page *shmem_read_mapping_page(
>  					mapping_gfp_mask(mapping));
>  }
> =20
> +static inline struct page *shmem_read_mapping_page_nonblocking(
> +				struct address_space *mapping, pgoff_t index)
> +{
> +	return shmem_read_mapping_page_gfp(mapping, index,
> +					mapping_gfp_mask(mapping) | GFP_NOWAIT);
> +}

Just my 2 cents, but I'm not entirely sure it's worth adding a helper
for the non-blocking case given we can pretty easily call
shmem_read_mapping_page_gfp() with the GFP_NOWAIT addition where needed.

> +
>  static inline bool shmem_file(struct file *file)
>  {
>  	if (!IS_ENABLED(CONFIG_SHMEM))

