Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E57A24F35
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 18:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937FA10E009;
	Sun,  2 Feb 2025 17:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="c6fM4DhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9610E009
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 17:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738516678; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=e4pxc2FLCEXzOdlFOI/jgu8M0yESAGJWJnBuSDpMM5SRAJzMcemVWDkh3AVO9UoaC9by7Nq/dO+VuUyptMwNkzXZgfOjhxodtoy45SkqO58RFSJhF7tDta/sHzIgRNJ7J14hIKqS8P3JdIytM0yV7o3PcrSm2v0kRP/ILTUf7Uc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738516678;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=X/vlOnLkPRBbjPH4Q6TlcEVhimS3kOUQzFNFBD7KWFM=; 
 b=JevBlmf8hsGHSiXyy/WvYuCh2oi0gmZlowiSIrS0vKTtEnQsdmles7q2V/8EGO+NuszGoZp945HUQVznZDv58PFt47TlHRFKaYArUylTJbXuhEGKkXHlrL3bVX45vuyBWGpazCex0tIvyUNVW+f9VPk18TRfWxPE3zxKyMEuWYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738516678; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=X/vlOnLkPRBbjPH4Q6TlcEVhimS3kOUQzFNFBD7KWFM=;
 b=c6fM4DhBYTp7quzY7c+hUZHSTLjrNYIjothC+X0cW993zAZ7ij+R+PVPbM2HflRh
 OYnH5rgunDcK6Zj6zdOmjjh8MIUcZQQmmbXmyYZzTf3hvT1Qty2zV3CHxwg+FEDZXkc
 yyMXL/79dDjTmum5C4JHpO1Yednleui4JauU5j6U=
Received: by mx.zohomail.com with SMTPS id 1738516672033583.4125691983685;
 Sun, 2 Feb 2025 09:17:52 -0800 (PST)
Message-ID: <75cf3adc-400e-44a6-b653-bee1f0cb43ec@collabora.com>
Date: Sun, 2 Feb 2025 20:17:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel@ffwll.ch, jfalempe@redhat.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250130090517.201356-1-ryasuoka@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250130090517.201356-1-ryasuoka@redhat.com>
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

Hi,

On 1/30/25 12:05, Ryosuke Yasuoka wrote:
...
> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
> +					 struct drm_scanout_buffer *sb)
> +{
> +	struct virtio_gpu_object *bo;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
> +		return -ENODEV;
> +
> +	/* try to vmap it if possible */
> +	if (!bo->base.vaddr) {
> +		int ret;
> +
> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);

drm_gem_shmem_vmap() requires BO resv to be locked, it also may invoke
drm_gem_shmem_get_pages() that sleeps. This function can't be used in
atomic context.

For the starter, let's reject !bo->base.vaddr BOs. Normally, shmem FB
BOs are always vmapped.

-- 
Best regards,
Dmitry
