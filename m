Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62FBB73F5
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E31810E149;
	Fri,  3 Oct 2025 14:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="foaE5GPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42F610E149
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759503300; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M1YAcYSoe5SyPzA/Map085nz27BSDmBNwyoeMmfMos31g6oq3ygOY2DtN4juScnmW0XsQeV07T8fCJwqLzKz/K9CbJ4hm1Tm5AHgCARCkejaIDqVqRYT7IjGaHp/B+hDP+wYsbLKV6/doyg9ukfcrcqYaVSRyJckm5Qtb+EMoW8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759503300;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=i8Lnkug7ofgJ8WOFSwbyK2MnS4BeE2XxkWN2q+TCqsk=; 
 b=Pt3NU6kMdmVNLY21WpDRcZOx6dCT4tm9/X4DFiCcy4JCCGGsdC1x+VXKGSuEynPnaW7LTmP/+Xe1UJs3bmdWm31ByjCRjRpMzw60T2hrQjICTOfYRn6A1wW76E0x5Zf2EK5BRrmpdVLWxph1GLZG2ygJSoCNjPq2M11Gh1k1HNY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759503299; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=i8Lnkug7ofgJ8WOFSwbyK2MnS4BeE2XxkWN2q+TCqsk=;
 b=foaE5GPTJtRv452C+IFQOSOzM387MmwQPwo21hEWsia1zBmGD21PB7LmW3qwieGa
 89rE4MukZYvCkQQkywF2BaVMobZ6lR9kWhX60f866ATSQRwZHM+lS6+ySnWQKPGQV6y
 +IceVSTdxtGmXnKExf6sbZZRMlgDczf8LjlhcIXM=
Received: by mx.zohomail.com with SMTPS id 1759503298924565.6249917669974;
 Fri, 3 Oct 2025 07:54:58 -0700 (PDT)
Message-ID: <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
Date: Fri, 3 Oct 2025 17:54:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: nirmoyd@nvidia.com
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003053402.732218-3-dongwon.kim@intel.com>
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

On 10/3/25 08:34, dongwon.kim@intel.com wrote:
> +	/* for restoration of objects after hibernation */
> +	struct virtio_gpu_object_params params;
> +	struct list_head list;

These are bit too generic names for struct members that are supposed to
be used for hibernation-restore only.

what about this variant:

struct virtio_gpu_object {
	...

	struct virtio_gpu_object_params params;
	struct list_head restore_node;
};

> +static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo)
> +{
> +	struct virtio_gpu_object *curr, *tmp;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore_list, list) {
> +		if (bo == curr) {
> +			spin_lock(&vgdev->obj_restore_lock);
> +			list_del(&curr->list);
> +			spin_unlock(&vgdev->obj_restore_lock);
> +			break;
> +		}
> +	}

1. The whole list_for_each_entry_safe() needs to be protected with a
lock. But you don't need this iteration at all. Instead of using
cleanup_object(), unconditionally remove object from list in
virtio_gpu_free_object(), since we care only about shmem objects.

2. Use mutex instead of spinlock, we don't want problems with mem
reclaim situations

static void virtio_gpu_free_object(struct drm_gem_object *obj)
{
+	mutex_lock(&vgdev->obj_restore_lock);
+	list_del(&bo->restore_node);
+	mutex_unlock(&vgdev->obj_restore_lock);

	if (bo->created) {
		virtio_gpu_cmd_unref_resource(vgdev, bo);
		virtio_gpu_notify(vgdev);
		/* completion handler calls virtio_gpu_cleanup_object() */
		return;
	}
	virtio_gpu_cleanup_object(bo);
}

-- 
Best regards,
Dmitry
