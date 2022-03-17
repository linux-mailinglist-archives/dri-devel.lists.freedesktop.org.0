Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32604DC451
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C69910E27B;
	Thu, 17 Mar 2022 10:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DD610E27B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id DE2991F451E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647514401;
 bh=/G4cTqNCoQeslzG4iD/0pDjg5QHfuMTjhmg3lv9lhTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jYYTBY/2vSwJpOalQnVD1UyhELNkC0kezEv3mkgmvHoDKX1e8+HIC065El7hshqtG
 9L42enzL6xrZ/3RvNMD2MgiqgKUnXh/VDmSclEsybS6e/u1mqspvaMXqG00btxvfLU
 sSswi/evHinuotRnIgVGOjQ8vrAftn6XyTJqjEFAsM0YaG8gfgGoSJI5Oq5JZpMKOu
 V7ug8YCcdtzPlaODKjpjbgn1giYUwekN+IdUTn9oEhSRBKuYgAk5f/+qbJIY5y/yGe
 JphXMu9UAI6c0QNrusBdpJKvqUuM4Hux94Xpb32VDpIAJoHsH72WoZlkx/dapZBqG+
 q6XgjKSTPFXww==
Message-ID: <7984f270-99e3-e629-3162-ed31ac7c6eea@collabora.com>
Date: Thu, 17 Mar 2022 13:53:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220308133401.62340-1-dmitry.osipenko@collabora.com>
 <YjMExI9ONMa1AF7v@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YjMExI9ONMa1AF7v@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/17/22 12:52, Daniel Vetter wrote:
> On Tue, Mar 08, 2022 at 04:34:01PM +0300, Dmitry Osipenko wrote:
>> drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
>> Correct the doc comment which says that it returns NULL on error.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 8ad0e02991ca..37009418cd28 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -662,7 +662,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
>>   * drm_gem_shmem_get_pages_sgt() instead.
>>   *
>>   * Returns:
>> - * A pointer to the scatter/gather table of pinned pages or NULL on failure.
>> + * A pointer to the scatter/gather table of pinned pages or errno on failure.
> 
> Hm usually we write "negative errno" for these, since the error numbers
> are defined as positive numbers. Care to respin?

It's actually ERR_PTR that is returned here, "errno" was borrowed from
some other similar DRM comment. I added this patch to v2 of virtio
patchset [1] and will improve the comment in v3, thanks.

[1]
https://lore.kernel.org/dri-devel/20220314224253.236359-1-dmitry.osipenko@collabora.com/T/#t
