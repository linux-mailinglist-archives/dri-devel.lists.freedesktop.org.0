Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8419C3E59
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCF210E48A;
	Mon, 11 Nov 2024 12:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Tdk0hYFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6510E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731327508; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GtBLxRb0/a/pGnZBdkapmI8yoYQ6aIy0iSqSGE+OJbDvYmqNFq4BJV6uhJmF8O9Mwu9YeB0Itf7wfxpYzxjbW3GpHnuoU5BQXlGlb14STfS1QesEcGFTRU1NQJxgyJlSK32SFo0In10l9Vnmfcm5o0sGsyIBsYjJvFCgYUbKLN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731327508;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WmK2xlQ+zyobePquUkVhqfJy16+HvtgT370hP1XsPfo=; 
 b=fIVsWDdJsO7HkZtBDDPaD1ml90vOxjbbqwmc2fIEAFvcGijjN5ZOJhy/wkDCtKascZtTsLsNom9QxisZmW4x4z3lb7XTa2iVAMPXqOR/+C6qgIuHPgjfhyB01HHGV5EktDGel4hiXj5Q2Ma921NNeNIKnUH8NUBZHygG8Yy4Vs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731327508; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WmK2xlQ+zyobePquUkVhqfJy16+HvtgT370hP1XsPfo=;
 b=Tdk0hYFkM+heWlAhdQat/RUTeeOnYjfXp+GxYl0UBJFOcLFS9Ta8uvs50MjSWhRe
 EJxLrNFpfOKUyVEudlqbjPPVxaAkfePbGRFnjheySt9F1gjUA9BlTEG009FmWmHCdKd
 rXnmRUkNZ/fR7Z4jreUNEdVsRS0I0TVp48LOD3dE=
Received: by mx.zohomail.com with SMTPS id 1731327496153595.5978690443898;
 Mon, 11 Nov 2024 04:18:16 -0800 (PST)
Message-ID: <09d9815c-9d5b-464b-9362-5b8232d36de1@collabora.com>
Date: Mon, 11 Nov 2024 15:18:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241108032603.3164570-1-ryasuoka@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241108032603.3164570-1-ryasuoka@redhat.com>
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

On 11/8/24 06:26, Ryosuke Yasuoka wrote:
> +struct virtio_gpu_panic_object_array {
> +	struct ww_acquire_ctx ticket;
> +	struct list_head next;
> +	u32 nents, total;
> +	struct drm_gem_object *objs;
> +};
> +
> +static void *virtio_panic_buffer;

This won't work well if there is more than one virtio-gpu device in the
system. Please make it private to the virtio-gpu dev.

Otherwise looks okay. I've tested v3 on QEMU, panic screen works.
Looking forward to v4, thanks.

-- 
Best regards,
Dmitry

