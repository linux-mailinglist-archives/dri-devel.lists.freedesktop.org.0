Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C97A8B217
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCB210E869;
	Wed, 16 Apr 2025 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="S5c3Oq1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345F10E869
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 07:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744788460; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jzHMALNnVZclRFpYdMUQWgN9AdOD8nhv1KCiugwdDSW0do9aK/6QE0pcsIdaFAMRV7U0yUuL47+6kSVDSDpK654xnRh9fcNBXCRofUWUavRptEm5jvr01xK55N5qSR18SQY3vbIfpi9XHM96aZd7DuyEwdF8s85eCThfeqtDRKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744788460;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OvO+rifxs7u3SlGDXC7e5wWDU550XI2j4P8n5PbX5ek=; 
 b=RKyUhP0czcrraxkwEQe2w5Dx8HCSRV2X65bg2b5OsH2n5HF0WVVWCYzHWE/sXlBjGh16W0d0PYqBAhX3ZjcWQV0yEKG77yIk9Phhvo2JL3uFYXT4nm2YS8nWq7i5PSCQIPGIC5F1tcbjwBT+hvBqlKutXHyRwoEqZrmNIAo+mIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744788460; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=OvO+rifxs7u3SlGDXC7e5wWDU550XI2j4P8n5PbX5ek=;
 b=S5c3Oq1f4V5bkHMtvcSz1lpuJZ/J/FWuVax2n/3Almv6yGHQV2YnymOAgH7to8yD
 ZQG2fCPreCkhTtzKw3tKZib0rE6nK9NlutzOiU7Ln07WCjE1eH0i50PsZOl71LAWCxc
 5d7NF0xrrkmwwnZB9Mq5Fbglb9uS8f+OYHCPdMpc=
Received: by mx.zohomail.com with SMTPS id 1744788457648268.5754601252454;
 Wed, 16 Apr 2025 00:27:37 -0700 (PDT)
Message-ID: <b74f2219-9e5d-4736-9a70-194cc4e50b96@collabora.com>
Date: Wed, 16 Apr 2025 10:27:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/virtio: Avoid struct drm_gem_object.import_attach
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20250414131507.566072-1-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250414131507.566072-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/14/25 16:11, Thomas Zimmermann wrote:
> Avoid the use of struct drm_gem_object.import_attach to get the
> object's dma-buf or test for an imported buffer. The import_attach
> field in struct drm_gem_object is an artifact of the import process,
> but should not be used otherwise.
> 
> The helper drm_gem_is_imported() tests if a GEM object's buffer
> has been imported into the driver. The corresponding dma-buf is
> referenced by the object itself. Both cases avoid import_attach.
> 
> Thomas Zimmermann (2):
>   drm/virtio: Test for imported buffers with drm_gem_is_imported()
>   drm/virtio: Use dma_buf from GEM object instance
> 
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 7 +++----
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 

Applied to misc-next, thanks!

-- 
Best regards,
Dmitry
