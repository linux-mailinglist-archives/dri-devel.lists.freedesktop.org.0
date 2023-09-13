Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9779DD49
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 02:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AAA10E0DF;
	Wed, 13 Sep 2023 00:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE110E0DF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 00:56:20 +0000 (UTC)
Received: from [192.168.2.112] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 44D9766072F1;
 Wed, 13 Sep 2023 01:56:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694566578;
 bh=B4W7pjVOWkb2G7sLJ6XC/Gd9ZbgLTD16lqLUgQ1+rTg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kP5fdOEN5h6usdOBFOJ+J0yMygCVmvvfdfCn7ce8MMxK/QYYJqMlSmo8cCD5wBEAj
 U3Dlpshx0OoomJihvk6sbmd9YIbYPfPFq0BzyJE3wemqWRn5p2PBy5Gny1XN77yCuh
 BYb8HUwHkjWJKlXJX6jL9XTWNk89RoCyn/T9bid7Grwv1kmOaf9qw91hs13c1+N/n6
 BLMz2JxaUiSzR+oPgifQfbAUlolCXfknJRR9/4rY6YcQ9eMT9G414Xeksy+1SBg9KP
 T0HO4LYXnT2Mxhp6jcufEPYRffF0mdczq6CQcO4WOVlAcs2HfI0p49XPBxrNugnCZs
 XAcwaTP89mFzA==
Message-ID: <26f7ba6d-3520-0311-35e2-ef5706a98232@collabora.com>
Date: Wed, 13 Sep 2023 03:56:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-16-dmitry.osipenko@collabora.com>
 <20230905100306.3564e729@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230905100306.3564e729@collabora.com>
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

On 9/5/23 11:03, Boris Brezillon wrote:
>>                * But
>> +		 * acquiring the obj lock in drm_gem_shmem_release_pages_locked() can
>> +		 * cause a locking order inversion between reservation_ww_class_mutex
>> +		 * and fs_reclaim.
>> +		 *
>> +		 * This deadlock is not actually possible, because no one should
>> +		 * be already holding the lock when drm_gem_shmem_free() is called.
>> +		 * Unfortunately lockdep is not aware of this detail.  So when the
>> +		 * refcount drops to zero, don't touch the reservation lock.
>> +		 */
>> +		if (shmem->got_pages_sgt &&
>> +		    refcount_dec_and_test(&shmem->pages_use_count)) {
>> +			drm_gem_shmem_do_release_pages_locked(shmem);
>> +			shmem->got_pages_sgt = false;
>>  		}
> Leaking memory is the right thing to do if pages_use_count > 1 (it's
> better to leak than having someone access memory it no longer owns), but
> I think it's worth mentioning in the above comment.

It's unlikely that it will be only a leak without a following up
use-after-free. Neither is acceptable.

The drm_gem_shmem_free() could be changed such that kernel won't blow up
on a refcnt bug, but that's not worthwhile doing because drivers
shouldn't have silly bugs.

-- 
Best regards,
Dmitry

