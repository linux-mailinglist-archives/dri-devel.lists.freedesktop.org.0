Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921BC51D59
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB510E6EC;
	Wed, 12 Nov 2025 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ZvD1+XRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987C610E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762945652; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=I3rqzHGJlqI2bsW+8253CqxDXFcBiYiUvVtK74JC0WhiMb9CFafMkNCTPKjgiiDlhnNmm3hWnDM3rh45yYp0YvdCA3/5hUhsjzMcom66agxYkKryfQaf+diaR7Txq9JDAXxPegq5M5HEhQwJxQzQGM5hnT98zCa/cqujKiWl+SE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762945652;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rwdU2pk95xV3XVvdyn1gKcRWRFh75a5iVdcNa7YU4Ag=; 
 b=FMKqI+tigeG2YGDYs52kPShp7B+CbK0L687qkn36mtQlQtKf3z8yMY1xjheHzfNoio2ey+1ePDFkFYuZFgyoV+PuN1A2O5JsLLKa9f+4SvcxJso2BtIv7rrxYH3vX+RqjLY7JM9prEgTlld+zKsqFpzGC+KwrEcU3J40/s++jvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762945652; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rwdU2pk95xV3XVvdyn1gKcRWRFh75a5iVdcNa7YU4Ag=;
 b=ZvD1+XRomeet5t3BjuilLUPr6t4G6RBFxnXboBTN/XA7qF9nmbqV2f/yLo/rOe0D
 rmkwkmOuYk+38CiGdaUL9NihcFNej4nrNk8Gs9D/DISMLdetLZxvW6GzByt76r7mD1V
 UlgHU4gKg1oEgOpQHErUQcxhj+dUJI4zFlQ5mjxs=
Received: by mx.zohomail.com with SMTPS id 1762945650895279.16412509689815;
 Wed, 12 Nov 2025 03:07:30 -0800 (PST)
Message-ID: <c35336e9-a500-437b-8d25-38d57f4dc7d9@collabora.com>
Date: Wed, 12 Nov 2025 14:07:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, kraxel@redhat.com, nirmoyd@nvidia.com
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-3-dongwon.kim@intel.com>
 <80e30da1-1a66-47ba-a773-ea4e3ea94740@collabora.com>
Content-Language: en-US
In-Reply-To: <80e30da1-1a66-47ba-a773-ea4e3ea94740@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/12/25 14:03, Dmitry Osipenko wrote:
> On 10/27/25 23:53, dongwon.kim@intel.com wrote:
>> +	/* store the dmabuf imported object with its params to
>> +	 * the restore list
>> +	 */
>> +	memcpy(&bo->params, &params, sizeof(params));
> 
> Nit: using memcpy is unnecessary for structs, "bo->params = params"
> would look cleaner

Won't hurt to add helper for adding obj to a restore list since same
code repeats two times.

virtio_gpu_add_object_to_restore_list(struct virtio_gpu_device *vgdev,
                                      struct virtio_gpu_object *bo)
{
  ...
}

-- 
Best regards,
Dmitry
