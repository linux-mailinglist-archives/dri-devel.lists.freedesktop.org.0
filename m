Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0EA78F40
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C137010E78C;
	Wed,  2 Apr 2025 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cHyYb0iB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E4510E78C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743598742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hWlg2avs/Yb+ObDwA71DvUeMcy8yfPeW9OHpG0OijtPInz7V7bvqE2pSPX7Xy/VbnNqNNmXUeOMwe1YF2fY9iY/Z1GX4OYYos/UVFlrpyd6gpA236mhcA41EkR1w+i+XYgd+8E65VBLaBq7SXg6KWKf2miiGXkFS9m7Yik2jP68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743598742;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mZ8fonKlky+JNA4Rhn203pUe67ljBH0B+8f/AS8ommA=; 
 b=YzuqZOYLiGHdSSjs2ggS16Wi+Yo2CN/x3YdN1/SI9djQkP9DLqlQWJwWfJLOAIMcZE+9i1jkJzCCktW8uq9bxh251vRixhqKrjndFxnKb+ueW/JHJycbfq7CB2mjsm0Gif5snN8qVznJIkm7/vhL4dybwyQ8wQLN59SuYwjNzNw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743598742; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mZ8fonKlky+JNA4Rhn203pUe67ljBH0B+8f/AS8ommA=;
 b=cHyYb0iBWAdvdSAa5YVuJNIS7yT6O736AQe/Q0lGvjr3WN+wAIYt9Is73tBEbMO3
 cFtlB2CJ5QMelefbGw2e0ep5HIdkTrzJsQY8QezK/QSI+K53m8FNlaQ43svVHpQcSA5
 E6+945ZeRYklEn9x42yAq5sTcB5eyLvMw6rR10G4=
Received: by mx.zohomail.com with SMTPS id 1743598740489912.9935045232037;
 Wed, 2 Apr 2025 05:59:00 -0700 (PDT)
Message-ID: <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
Date: Wed, 2 Apr 2025 15:58:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 4/2/25 15:47, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.03.25 um 22:26 schrieb Dmitry Osipenko:
>> The vmapped pages shall be pinned in memory and previously get/
>> put_pages()
>> were implicitly hard-pinning/unpinning the pages. This will no longer be
>> the case with addition of memory shrinker because pages_use_count > 0
>> won't
>> determine anymore whether pages are hard-pinned (they will be soft-
>> pinned),
>> while the new pages_pin_count will do the hard-pinning. Switch the
>> vmap/vunmap() to use pin/unpin() functions in a preparation of addition
>> of the memory shrinker support to drm-shmem.
> 
> I've meanwhile rediscovered this patch and I'm sure this is not correct.
> Vmap should not pin AFAIK. It is possible to vmap if the buffer has been
> pinned, but that's not automatic.  For other vmaps it is necessary to
> hold the reservation lock to prevent the buffer from moving.

Hi, with vmap() you're getting a kernel address. The GEM's memory should
be not movable while it's vmapped as we can't handle kernel page faults.

Not sure what you're meaning by the "other vmaps", please clarify.

-- 
Best regards,
Dmitry
