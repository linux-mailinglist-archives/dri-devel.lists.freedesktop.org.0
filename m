Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D77BD04E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 23:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1000A10E072;
	Sun,  8 Oct 2023 21:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26DA10E072
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 21:32:17 +0000 (UTC)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B8BDB6607095;
 Sun,  8 Oct 2023 22:32:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696800736;
 bh=XUtLmucQmSmbTeOzlijxRbhLNkEky+Jw98wNMb8b+Kc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jSl976mlAr4sN985I9ZG4oY1UqjTKcMGlAaA3bEvzUvcT1Pt21wfVmh3x0toX9Lo4
 XOkm5OvIAKAq8mJoiGzBqpkbb2Z8Or6lfmiBRcsPSEFzXJfOASv6QLGI3gN3zsDgdF
 OhzibDAkUNwvWhPQFiZIfX8MwY5Rw1B2yn6rW/13C9OUYbYytdHgNzUhWYqgbWAsR6
 R8t8/gcTF1iFAWhS0Ae9WBaWMU7/O50h5c2nJfn1G1bsXkxE0tohcOUucVgslwxpkr
 Q4+PVq8GVvCUAwelNT47w/cnv7F4Y/eULUSCgB3at+KCetvR/kLx/4sB/USqtH2AED
 v9hIFQjJl6rmA==
Message-ID: <938d1363-849b-0d7d-0ca3-03d6162fe0cd@collabora.com>
Date: Mon, 9 Oct 2023 00:32:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
 <454c464e-4534-7ec3-6d38-49b7df83c7be@collabora.com>
 <20230926093517.11a172ad@collabora.com>
 <bbbd82a5-41bf-4ca3-476d-e5039e94631b@collabora.com>
 <20231003110055.346fd94c@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231003110055.346fd94c@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/23 12:00, Boris Brezillon wrote:
>> I'd prefer to keep refcounting as is, don't see how to implement your
>> suggestion.
> Can you be more specific? I don't really see what the problem is with
> decrementing pages_use_count when you free the sgt (eviction), and
> re-incrementing it when the sgt is restored (swapin).

For the reference, we further discussed this question about refcounting
with Boris offline and found how to implement the refcnt drop done by
shrinker's evict/purge.

For evict/purge we can do:

    if (!refcount_dec_not_one(&shmem->pages_use_count))
        refcount_set(&shmem->pages_use_count, 0);

and then for swapin:

    if (!refcount_inc_not_zero(&shmem->pages_use_count))
        refcount_set(&shmem->pages_use_count, 1);

This resolves the issue with dropping refcnt to zero I was talking
about, allowing to delegate sgt's refcnt ownership to shrinker.

-- 
Best regards,
Dmitry

