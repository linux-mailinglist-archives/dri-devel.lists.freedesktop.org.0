Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A96CD7FA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 12:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86E10EA6C;
	Wed, 29 Mar 2023 10:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52A10EA74
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eeKNNTaluB3jSL4ect8rCFF9mBvDp31l7Qb11QUW504=; b=OYVD1jd3ZMstpRUlyLr8dYIkqo
 luefwzcNrQ2RfrHlZoaLYqYNhaA3MPMxnkaPoonRLKI3mWN64SrR+b0S5xKA4ycw+ohKO3I39L75E
 3jnzLZvN7tPmK4nUZJ6VX5VzVumBgl5nGTvyCniX1VeVdbk4SXPe/WderSkqQxmuRW6eFyYrPw1Ln
 pgEgeNCY6GL7wk9YVyJCx6SKfOq3ghMSjqJywtM9IVyODmLDFE2Rp0Q8fz0cSJjG98TRjFB0lIXVY
 CgdwvmPsvrDDAXtKSQnD+eFDhgURGzpcfns+b+U4qfn7ATD8EFK9+JdL9dJZvsGZAF9+t9u/a8jM2
 P2xMzaCA==;
Received: from [177.34.168.16] (helo=[192.168.0.3])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1phTSH-000aFq-J7; Wed, 29 Mar 2023 12:55:01 +0200
Message-ID: <ceb0b1e8-6c7a-8564-156f-fcf0f0e4a95e@igalia.com>
Date: Wed, 29 Mar 2023 07:54:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm: test: Fix 32-bit issue in drm_buddy_test
Content-Language: en-US
To: David Gow <davidgow@google.com>, =?UTF-8?Q?Lu=c3=ads_Mendes?=
 <luis.p.mendes@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230329065532.2122295-1-davidgow@google.com>
 <20230329065532.2122295-2-davidgow@google.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230329065532.2122295-2-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/29/23 03:55, David Gow wrote:
> The drm_buddy_test KUnit tests verify that returned blocks have sizes
> which are powers of two using is_power_of_2(). However, is_power_of_2()
> operations on a 'long', but the block size is a u64. So on systems where
> long is 32-bit, this can sometimes fail even on correctly sized blocks.
> 
> This only reproduces randomly, as the parameters passed to the buddy
> allocator in this test are random. The seed 0xb2e06022 reproduced it
> fine here.
> 
> For now, just hardcode an is_power_of_2() implementation using
> x & (x - 1).
> 
> Signed-off-by: David Gow <davidgow@google.com>

As we still didn't consolidate an implementation of is_power_of_2_u64(),

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
> 
> There are actually a couple of is_power_of_2_u64() implementations
> already around in:
> - drivers/gpu/drm/i915/i915_utils.h
> - fs/btrfs/misc.h (called is_power_of_two_u64)
> 
> So the ideal thing would be to consolidate these in one place.
> 
> 
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index f8ee714df396..09ee6f6af896 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_buddy *mm,
>   		err = -EINVAL;
>   	}
>   
> -	if (!is_power_of_2(block_size)) {
> +	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
> +	if (block_size & (block_size - 1)) {
>   		kunit_err(test, "block size not power of two\n");
>   		err = -EINVAL;
>   	}
