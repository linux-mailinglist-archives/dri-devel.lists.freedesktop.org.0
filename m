Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE857B5E3D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 02:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD2510E10E;
	Tue,  3 Oct 2023 00:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761710E10E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 00:31:37 +0000 (UTC)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C79A66072AF;
 Tue,  3 Oct 2023 01:31:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696293095;
 bh=Q7Lly/fabU+asTB6nUOlm3sUI4Epx0pqEjs+/1oqAuU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IMSXJglYchP3I2/mWfSU5Q+ooRhU8A5AB8g7x0nSbkr0nH/NI4StYIJsR3KQdxkmT
 QwfA+ci9dNhpMZM5YKMRfY3cO7oI6jpydqj473pyh4gnB6wEcjOyfPbRRcuFus8MN8
 Y5jK12LehhxBi3gnz8ug2q1jpF4OQp1PPF647zgrXoCKl1Kdua2fC5SD/NyrqF2xGl
 7pkA4KnlPUUbZzJR9I24uCo/pYg7G6bpokYPlhq1qbCb/Q4i+2jqiUqKz9k37VpAkj
 lHqww54SrVncjgJ4Fauuk0aABMIlAvKX7VieJ78jJD5HUlENvU0Xr/lolJRvMMkitX
 kTJMrNOcKg0Mg==
Message-ID: <bbbd82a5-41bf-4ca3-476d-e5039e94631b@collabora.com>
Date: Tue, 3 Oct 2023 03:31:32 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230926093517.11a172ad@collabora.com>
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

On 9/26/23 10:35, Boris Brezillon wrote:
>>>> +	__drm_gem_shmem_release_pages(shmem);  
>>> Make sure you drop the implicit pages_use_count ref the sgt had, this
>>> way you can still tie the necessity to drop the pages to sgt != NULL in
>>> drm_gem_shmem_free().  
>> This will require further refcnt re-initialization when pages are
>> restored if it's dropped to zero. I don't see how this will improve
>> anything.
> Sorry to disagree, but I do think it matters to have a clear ownership
> model, and if I look at the code (drm_gem_shmem_get_pages_sgt_locked()),
> the sgt clearly owns a reference to the pages it points to.

It creates too much unnecessary trouble because, again, pages_use_count
can't drop to zero easily. Shrinker doesn't own the refcnt and not
allowed to touch it. The pages_use_count is then used by things like
mmap() and etc that use get_pages(), which can be invoked for evicted GEM.

I'd prefer to keep refcounting as is, don't see how to implement your
suggestion. Will be happy to help with reviewing and testing patches
made on top of this series ;)

-- 
Best regards,
Dmitry

