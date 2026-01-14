Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84ED1EA4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BD510E586;
	Wed, 14 Jan 2026 12:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Vkjqv8WL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FD10E604
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768392444;
 bh=2beE3e0kVcmEYa0zaIysPOw/L2ABDyyl1I4nqC0V1rA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vkjqv8WLar4Dwl5IyVXV3g5xUpMPM0JfWxXz2iUJ2tGlugQV7Wf8A79fRNxJ88fdN
 +hMG8FCh4CT4MPM4/RkUC429JYwfZzvV5WL6LlTxdHauIQnXwC/wvI7G1qEV2ezVMW
 pVbAVZZBNCAcWH6wYUML+1UPTdulL/gtolHX/ybZSx4XrRKUoT3vipGT6K1J3v5fv9
 5fv/MTw41L06827HyP/pnYTCw4ju2CMBa1gDQPsR9n/8CvchIe8nlEb57QFYm5St5T
 eNNHBghSkmzcSSA/DrbT3joOA22TzjH0Y2jG+vsQfoQffjXFutH+KFBYNl/c9D7vhf
 BRw2jhRk1K+nQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C794217E13F9;
 Wed, 14 Jan 2026 13:07:23 +0100 (CET)
Date: Wed, 14 Jan 2026 13:07:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 4/7] drm/panthor: Introduce sampling sessions to
 handle userspace clients
Message-ID: <20260114130717.4818e9d1@fedora>
In-Reply-To: <20251215171453.2506348-5-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-5-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Dec 2025 17:14:50 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> +/**
> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
> + *                        to the maximum number of counters available for selection on the newest
> + *                        Mali GPUs (128 as of the Mali-Gx15).

This statement worries me a bit. It seems to imply that we might have
more than 128 counters per block at some point, and the way the uAPI is
designed, it's going to be annoying to extend. Maybe we should come up
with an approach that would account for this from the start, like:

- Moving drm_panthor_perf_block_header::enable_mask in its own
  drm_panthor_perf_block_enable_header_mask whose size can be
  determined from perf_info::counters_per_block

- having the enable mask settings passed through an array of
  struct drm_panthor_perf_enable_counter_section looking something like
  that:

/** @struct drm_panthor_perf_enable_counter_section - Describes a counter section to enable */
struct drm_panthor_perf_enable_counter_section {
	/** @block_type: block type this section refers to */
	__u8 block_type;

	/**
	 * @block_counter_offset: counter offset in the block type
	 *
	 * This must bit 64 aligned, and block_counter_offset + 64 must be
	 * <= drm_panthor_perf_info::counters_per_block
	 */
	__u8 block_counter_offset;

	/** @padding: MBZ. */
	__u16 padding;

	/**
	 * @enable_mask: enable mask to set for this portion of the counter block.
	 *
	 * The targeted counters are [@block_counter_offset, @block_counter_offset + 63].
	 */
	__u64 enable_mask;
};

struct drm_panthor_perf_block_setup {
	...
        __u64 sample_freq_ns;

	/// All xxx_enable[2] fields are replaced by the following array.

	/** @enable_sections: Sections of the counter blocks to enable. */
	struct drm_panthor_obj_array enable_sections;
}


> + */
> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
