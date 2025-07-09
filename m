Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB3AFE796
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A91E10E799;
	Wed,  9 Jul 2025 11:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="gWevokZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0C10E799
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 11:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752060189; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UfJPTKnwn3JPN2S+0aD2MO7VCYGCwozl+IPypxiaIiZXdSQ0ntQjGm3PN6MA1QMaeaKEvHtWQJjfTqbt82DwOabyeHc8kwQBhg3Q7Rxv+mNOlFNXINFYiQ4k7JFxguc07+Y1V4zxx+66Nwo/njOi1q73ZB+QAuDV8xv7D2bKAwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752060189;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iXv9rGA2UeogkrezMXbL3Z9/SYXbt44tqUJ4LePWQRg=; 
 b=eD1MdGHpa5nK2vrnWYdgYqsw+DSogkH+IHTIsDn+0LV77c91uFsBrBYrvBxuCkAtIxLX3RKmsbR70S11A8ny71g1+GQMiV946APLRBDPNAWjxPY3UlUaSAbgkO691NQgoYj6HVC9fODVKsZjDEMWz7ptPr4iTlVSDIRHqcZaMDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752060189; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=iXv9rGA2UeogkrezMXbL3Z9/SYXbt44tqUJ4LePWQRg=;
 b=gWevokZkD4H8/iW2chTsMIdOOuZmf7ZPTnDwhlQaVH+uPedOibtdrQHcQTexzxAP
 QISdfwjVcTIE30vMsMmbccft7ArKv2Kx3oxqtfbTRqn/2lRIHl7XngH8xsRHyFHwN7n
 3ogv8wm+oRlhKsjfUgCrWb7Vm/wRgdUz5iXFjzjw=
Received: by mx.zohomail.com with SMTPS id 1752060188368111.76228535990845;
 Wed, 9 Jul 2025 04:23:08 -0700 (PDT)
Message-ID: <9e02b46b-da07-4e09-ab34-5813e42b0977@collabora.com>
Date: Wed, 9 Jul 2025 14:23:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250702222430.2316723-3-dongwon.kim@intel.com>
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

On 7/3/25 01:24, dongwon.kim@intel.com wrote:
> @@ -257,8 +290,11 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  					       objs, fence);
>  		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>  	}
> +	/* add submitted object to restore list */
> +	virtio_gpu_object_add_restore_list(vgdev, bo, params);

The list should be protected with a mutex

-- 
Best regards,
Dmitry
