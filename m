Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474139B884
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 13:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857296E334;
	Fri,  4 Jun 2021 11:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEACD6E334
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 11:54:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dg27so10775246edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=KhneuRZfKrlUmP1WEvuP9WQpr3jp7S7gT8J7CWD77Po=;
 b=RCtc2bMtCS7+pwkLCL2bHug16OfPeagL+6YDNfqjPPIxyQh34rcJ7o/Z9pXUhCkIV/
 Mo9vpHm2iZsfAMfbpZgOyuIVmtmh3LJwF/vDyMDi0Os4tMdfV9lyonkIMz04OjzhYXL4
 QlDqzG7GZT8F8A2upYApKfX6J/5QpbarsrnQvS4Kc7YM2sjPyNSxXN4Z5JfEndSRCk+7
 V11Y4IQIQH/IbPexhM7Y4OLa+geb4fBKlzISUFPxM2gHJW5yiaYSgQk+D31QvyMFurWT
 RgkAwyUbwgUiFhniNypcqGV1nY/J8jhSqQzBjYjve8iYWgPl9tAsXhkJ8Gwg8HAbp47l
 Zxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KhneuRZfKrlUmP1WEvuP9WQpr3jp7S7gT8J7CWD77Po=;
 b=q3gb9UCaFui1Q90/O/ixim8KFKj3gxt/bCJZVOQhBFAakNo4Hp2oy0Lv1DFLFE0G9S
 YsWo9/w2j/wyuHEDGV0mEhhjU+4ocET+8WI8xnyQFmQCyDOGO/3txBB+YckZ7p3UlYS9
 JIofk/tww5IyfPtpt9cqn27ata8HjKnOkVkv58CVHrjOp9hCAwxd8HBGK3itryJ7NAtd
 EWico0KGlsAkUt9roRjbHmK8bR94RJqiU3D/+gxYViwppYHbX//HvesnYr+Aoi8NJOry
 QcYrJeTdqwrhiFZQCI2k0Y0PZq3RpXtiWDsUY34Dmo/6RwI8C72G9U+dE8AbAtnx00rg
 Gvuw==
X-Gm-Message-State: AOAM532M2nvvzAGFuvIDo85+zeWZkNr1cRguy6ML2Og12iyzjNsY+F6l
 mqj8I2s0sudiOC7/yTtTX4iEQGVF2oQ=
X-Google-Smtp-Source: ABdhPJxBYsH06KeamIjAWsZYLJwZdMOrs3s9wstam31h0lGAXERyTtMSZh+Kxi9l4dsMZufM0G3WXw==
X-Received: by 2002:a05:6402:50d2:: with SMTP id
 h18mr4338881edb.10.1622807698704; 
 Fri, 04 Jun 2021 04:54:58 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id g11sm3142617edt.85.2021.06.04.04.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 04:54:58 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: Matthew Auld <matthew.auld@intel.com>, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <a17599a1-97c9-0b35-82f8-b06a0526af22@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5e0d46e4-dd77-2d79-9912-b5d105b3ef72@gmail.com>
Date: Fri, 4 Jun 2021 13:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a17599a1-97c9-0b35-82f8-b06a0526af22@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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



Am 03.06.21 um 10:45 schrieb Matthew Auld:
> On 02/06/2021 11:09, Christian König wrote:
>> [SNIP]
>> -/**
>> - * ttm_bo_mem_placement - check if placement is compatible
>> - * @bo: BO to find memory for
>> - * @place: where to search
>> - * @mem: the memory object to fill in
>> - *
>> - * Check if placement is compatible and fill in mem structure.
>> - * Returns -EBUSY if placement won't work or negative error code.
>> - * 0 when placement can be used.
>> - */
>> -static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
>> -                const struct ttm_place *place,
>> -                struct ttm_resource *mem)
>> -{
>> -    struct ttm_device *bdev = bo->bdev;
>> -    struct ttm_resource_manager *man;
>> -
>> -    man = ttm_manager_type(bdev, place->mem_type);
>> -    if (!man || !ttm_resource_manager_used(man))
>> -        return -EBUSY;
>> -
>> -    mem->mem_type = place->mem_type;
>> -    mem->placement = place->flags;
>> -
>> -    spin_lock(&bo->bdev->lru_lock);
>> -    ttm_bo_move_to_lru_tail(bo, mem, NULL);
>> -    spin_unlock(&bo->bdev->lru_lock);
>
> Why do we drop the move_to_lru_tail here?

Ah, good point.

The move_to_lru_tail() was here to make sure we see the BO in the new 
LRU instead of the old one before actually doing the move.

Since we haven't allocated the mem structure at this point that is no 
longer possible, but I think it is ok to do this for now.

One motivation of doing this is to move the LRU handling into the 
resource backend, so that tricks like those are not needed any more.

Regards,
Christian.
