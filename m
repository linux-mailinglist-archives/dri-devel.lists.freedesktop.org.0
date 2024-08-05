Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEB9481EB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 20:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2396710E27E;
	Mon,  5 Aug 2024 18:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tbez+VbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913210E27E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 18:49:34 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A5C618D;
 Mon,  5 Aug 2024 20:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722883721;
 bh=JfOE8OL4fdEdXCxtzEzAD4XsYqtIDh84FgS4MxwmU2I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tbez+VbXgblzEGgl4XzM0czEBVeLLzIKFvb+LXfsyU4SvWqBygnIiNWHaIk1tjdpV
 gZxmv0bvJgOzC7OjzWSwTE4791tAM7PmPEBY9/PYwDiW7vx73Kh265eOF5hwG/SLGf
 RpFq/edTuwrKcPRpJeIma7N3/A7F3m3VNUsVQG7A=
Message-ID: <e7a417b2-2aad-47d5-9209-a86ffafe5d7a@ideasonboard.com>
Date: Mon, 5 Aug 2024 21:49:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/omap: gem: Replace struct_mutex usage with
 omap_obj private lock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
References: <511b99d7-aade-4f92-bd3e-63163a13d617@stanley.mountain>
 <20240731122602.GV8146@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240731122602.GV8146@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 31/07/2024 15:26, Laurent Pinchart wrote:
> Hi Dan,
> 
> (CC'ing Tomi)
> 
> Thank for the report. It indeed seems that something is wrong.
> 
> Tomi, could you handle this and send a fix ?
> 
> On Tue, Jul 30, 2024 at 05:01:35PM -0500, Dan Carpenter wrote:
>> Hello Laurent Pinchart,
>>
>> Commit 3cbd0c587b12 ("drm/omap: gem: Replace struct_mutex usage with
>> omap_obj private lock") from May 26, 2018 (linux-next), leads to the
>> following Smatch static checker warning:
>>
>> 	drivers/gpu/drm/omapdrm/omap_gem.c:1435 omap_gem_new_dmabuf()
>> 	warn: 'omap_obj' was already freed. (line 1434)
>>
>> drivers/gpu/drm/omapdrm/omap_gem.c
>>      1386 struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
>>      1387                                            struct sg_table *sgt)
>>      1388 {
>>      1389         struct omap_drm_private *priv = dev->dev_private;
>>      1390         struct omap_gem_object *omap_obj;
>>      1391         struct drm_gem_object *obj;
>>      1392         union omap_gem_size gsize;
>>      1393
>>      1394         /* Without a DMM only physically contiguous buffers can be supported. */
>>      1395         if (!omap_gem_sgt_is_contiguous(sgt, size) && !priv->has_dmm)
>>      1396                 return ERR_PTR(-EINVAL);
>>      1397
>>      1398         gsize.bytes = PAGE_ALIGN(size);
>>      1399         obj = omap_gem_new(dev, gsize, OMAP_BO_MEM_DMABUF | OMAP_BO_WC);
>>      1400         if (!obj)
>>      1401                 return ERR_PTR(-ENOMEM);
>>      1402
>>      1403         omap_obj = to_omap_bo(obj);
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This is omap_obj
>>
>>      1404
>>      1405         mutex_lock(&omap_obj->lock);

I wonder why we even lock it. We just allocated it above, no one else 
can be using it.

Not only that, but omap_gem_free_object(), which is called in the error 
paths, _also_ takes the same lock.

I think we can just drop the locking from this function. But first I 
need to figure out how to run this piece of code to test it...

  Tomi

>>      1406
>>      1407         omap_obj->sgt = sgt;
>>      1408
>>      1409         if (omap_gem_sgt_is_contiguous(sgt, size)) {
>>      1410                 omap_obj->dma_addr = sg_dma_address(sgt->sgl);
>>      1411         } else {
>>      1412                 /* Create pages list from sgt */
>>      1413                 struct page **pages;
>>      1414                 unsigned int npages;
>>      1415                 unsigned int ret;
>>      1416
>>      1417                 npages = DIV_ROUND_UP(size, PAGE_SIZE);
>>      1418                 pages = kcalloc(npages, sizeof(*pages), GFP_KERNEL);
>>      1419                 if (!pages) {
>>      1420                         omap_gem_free_object(obj);
>>                                                        ^^^
>> It gets free inside this function
>>
>>      1421                         obj = ERR_PTR(-ENOMEM);
>>      1422                         goto done;
>>      1423                 }
>>      1424
>>      1425                 omap_obj->pages = pages;
>>      1426                 ret = drm_prime_sg_to_page_array(sgt, pages, npages);
>>      1427                 if (ret) {
>>      1428                         omap_gem_free_object(obj);
>>                                                        ^^^
>> Same
>>
>>      1429                         obj = ERR_PTR(-ENOMEM);
>>      1430                         goto done;
>>
>> So I think we can just return directly instead of unlocking.
>>
>>      1431                 }
>>      1432         }
>>      1433
>>      1434 done:
>> --> 1435         mutex_unlock(&omap_obj->lock);
>>      1436         return obj;
>>      1437 }
> 

