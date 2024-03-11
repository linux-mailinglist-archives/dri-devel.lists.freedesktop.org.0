Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F2877D81
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 11:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1E210F2E7;
	Mon, 11 Mar 2024 10:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="s0472jhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A162A112906
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710151230;
 bh=pDCfqAxwGPGKsmOS5gqNwrfB8JNvL9liHrD/+CR5be8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s0472jhwKH869ZqcPnqFEEwj97zm4jtSWr0URIEWkq0xmwZhxEJkcNiCAD2Tg2+Ab
 GV2jb6JNfVuX02IP9azzMX4owTYtSD1QdkgFF1gow0tWfvlzECnmicZZwdD+NwyhmE
 UqjTUnt4bKsn16HW9YCXsb4rxk+kyS67/gL6UBgJly5HGUkOITenWZg+gajgaCMNeX
 tfr5EhYyE0G8iS5ZSM8x93G0qAFVo9zDqcDCNfIegzcGE7tPgbGzgU2MOuABUU2pWl
 NgfhfVtrqNLp7rvJJCFreHyY8Q+j8dOPyhkmNy5LYOgEf/5TKonKtyKvhJfmKsRTXv
 M9eyeq5zM78dQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4A91637811D4;
 Mon, 11 Mar 2024 10:00:29 +0000 (UTC)
Date: Mon, 11 Mar 2024 11:00:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: robh@kernel.org, steven.price@arm.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Message-ID: <20240311110027.34b8b616@collabora.com>
In-Reply-To: <20240306015819.822128-2-adrian.larumbe@collabora.com>
References: <20240306015819.822128-1-adrian.larumbe@collabora.com>
 <20240306015819.822128-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Wed,  6 Mar 2024 01:56:36 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> =20
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", pfdev->profile_mode);
> +}
> +
> +

Dropped the extra blank and queued the patch to drm-misc-next.

> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +	bool value;
> +	int err;
> +
> +	err =3D kstrtobool(buf, &value);
> +	if (err)
> +		return err;
> +
> +	pfdev->profile_mode =3D value;
> +
> +	return len;
> +}
