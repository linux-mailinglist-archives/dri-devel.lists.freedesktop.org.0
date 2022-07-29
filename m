Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF8585415
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 19:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B0310E169;
	Fri, 29 Jul 2022 17:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E550210E048;
 Fri, 29 Jul 2022 17:01:07 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1EE76601B81;
 Fri, 29 Jul 2022 18:01:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659114066;
 bh=0DZzQCDhxMZyj8pa64Uer8N/SjmqS8UbUsoU385WfCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZuhQjA5Ti78yA6ymtTc+PGidQGdNkfWdhZNVtn9coYskHQ0beJC/AHZ8aFgw6RoYl
 gWiWnEQk2mUDJLJZQEZ1/wJt2epg5xkLELVnjTS4EOni/IUgOqA2/XFGJSD4FQlaTb
 1m3BsNqBnVZFI+BLjz4P6UbilH0t3Rq8K4Y24FQFQQaz6RfBlKtvNIuQZ3y98j811v
 3ZJ9gu9VeS+JfeheipDyJV3HsShOMU5Bo5TAjeYAeRpVJ6oyEBhDuJyNINWYrJoxnG
 ecfTjeKHwQTY1znUrDFjoN12398bBa6nFFg0/xW/To1DsfyWLevwLjGZFQhYlkEXwp
 pNg9BC6P/B2wA==
Message-ID: <6ceabe5a-a1ff-0717-96f1-0d28167ef649@collabora.com>
Date: Fri, 29 Jul 2022 20:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
 <49fe9ecf-b1bd-a21b-8d8c-e4a33e3fa821@collabora.com>
 <CAF6AEGuKU839m6TiARN3EwjPToo-qpdZR5cGD+BdJeiObjeY4A@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGuKU839m6TiARN3EwjPToo-qpdZR5cGD+BdJeiObjeY4A@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/22 18:40, Rob Clark wrote:
> On Fri, Jul 29, 2022 at 8:27 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 7/26/22 20:50, Rob Clark wrote:
>>> +/**
>>> + * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
>>> + *
>>> + * If the object is already in this LRU it will be moved to the
>>> + * tail.  Otherwise it will be removed from whichever other LRU
>>> + * it is in (if any) and moved into this LRU.
>>> + *
>>> + * Call with LRU lock held.
>>> + *
>>> + * @lru: The LRU to move the object into.
>>> + * @obj: The GEM object to move into this LRU
>>> + */
>>> +void
>>> +drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
>>> +{
>>> +     lockdep_assert_held_once(lru->lock);
>>> +
>>> +     if (obj->lru)
>>> +             lru_remove(obj);
>>
>> The obj->lru also needs to be locked if lru != obj->lru, isn't it? And
>> then we should add lockdep_assert_held_once(obj->lru->lock).
>>
> 
> It is expected (mentioned in comment on drm_gem_lru::lock) that all
> lru's are sharing the same lock.  Possibly that could be made more
> obvious?  Having per-lru locks wouldn't really work for accessing the
> single drm_gem_object::lru_node.

Right, my bad. I began to update the DRM-SHMEM shrinker patches on top
of the shrinker helper, but missed that the lock is shared when was
looking at this patch again today.

Adding comment to the code about the shared lock may help a tad, but
it's not really necessary. It was my fault that I forgot about it.

Thank you!

-- 
Best regards,
Dmitry
