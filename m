Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D09165C18
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9B96ED21;
	Thu, 20 Feb 2020 10:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309276ED21
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:48:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5AC8F294D60;
 Thu, 20 Feb 2020 10:48:01 +0000 (GMT)
Date: Thu, 20 Feb 2020 11:47:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 01/34] drm/core: Add afbc helper functions
Message-ID: <20200220114757.1b972bbd@collabora.com>
In-Reply-To: <20191217145020.14645-2-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-2-andrzej.p@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 15:49:47 +0100
Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:

> +/**
> + * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
> + * @modifier: the modifier to be looked at
> + * @w: address of a place to store the block width
> + * @h: address of a place to store the block height
> + *
> + * Returns: true if the modifier describes a supported block size
> + */
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)

You should probably take the multiplane case into account now.
Maybe introduce the following struct and pass a pointer to such
a struct instead of the w/h pointers:

	struct afbc_block_size {
		struct {
			u32 w;
			u32 h;
		} plane[2];
	};

Note that you could also directly return a
const struct afbc_block_size * and consider the NULL case as
'invalid format'.

> +{
> +	switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
> +		*w = 16;
> +		*h = 16;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
> +		*w = 32;
> +		*h = 8;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +		/* fall through */
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +		/* fall through */

I guess display controllers might support a subset of what's actually
defined in the spec, so maybe it makes sense to pass a 'const u8
*supported_block_sizes' and then do something like:

	block_size_id = modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK;

	for (i = 0; i < num_supported_block_sizes; i++) {
		if (supported_block_sizes[i] == block_size_id)
			break;
	}

	if (i == num_supported_block_sizes)
		return false;

The above switch-case can also be replaced by an array of structs
encoding the block size:

	static const struct afbc_block_size block_sizes[] = {
		[AFBC_FORMAT_MOD_BLOCK_SIZE_16x16] = { { 16, 16 } },
		[AFBC_FORMAT_MOD_BLOCK_SIZE_32x8] = { { 32, 8 } },
		[AFBC_FORMAT_MOD_BLOCK_SIZE_64x4] = { { 64, 4 } },
		[AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4] = { { 32, 8 }, { 64, 4} },
	};

	*block_size = block_sizes[block_size_id];

	return true;

> +	default:
> +		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		return false;
> +	}
> +	return true;
> +}

To sum-up, this would give something like (not even compile-tested):

struct afbc_block_size {
	struct {
		u32 width;
		u32 height;
	} plane[2];
};

static const struct afbc_block_size superblock_sizes[] = {
	[AFBC_FORMAT_MOD_BLOCK_SIZE_16x16] = { { 16, 16 } },
	[AFBC_FORMAT_MOD_BLOCK_SIZE_32x8] = { { 32, 8 } },
	[AFBC_FORMAT_MOD_BLOCK_SIZE_64x4] = { { 64, 4 } },
	[AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4] = { { 32, 8 }, { 64, 4} },
};

const struct afbc_block_size *
drm_afbc_get_superblock_info(u64 modifier,
			     const u8 *supported_sb_sizes,
			     unsigned int num_supported_sb_sizes)
{
	u8 block_size_id = modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK;


	if (!block_size_id ||
	    block_size_id >= ARRAY_SIZE(superblock_sizes)) {
		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
		return NULL;
	}

	for (i = 0; i < num_supported_sb_sizes; i++) {
		if (supported_sb_sizes[i] == block_size_id)
			break;
	}

	if (i == num_supported_sb_sizes) {
		DRM_DEBUG_KMS("Unsupported AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
		return NULL;
	}

	return &superblock_sizes[block_size_id];
}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
