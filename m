Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D5A71618
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 12:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70B510E0A1;
	Wed, 26 Mar 2025 11:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="C7b1qYoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECD10E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 11:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742990047; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KgSFBxidFYS8wsR76dLRI60ogFkOoLXRtvh+dsrfbsEF1qylvk8qEbnn4h9ND+xDc9CrJNqCt1kp53XtvNvA6aS9mxwLvS4/KmW4iYwYf9XJ/DEM2la5Ipm3pXO7MKHN6LMDqZrjVEsY73hIcQ9bW0pCLJNKHO/L1LKWiGgvvIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742990047;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AceXwwk0dg/5R7XIw5oul2ygSeDFRaSA96BeLYqo5pM=; 
 b=njQiBcAByIRup3mqBmEQIqLkpwZmnRDCVo4N30weZFdIi5Ieqh3zyQa2cWcUFro3Kj9K3hKyVk7tPDUuTSlxMqKgmu50/W3nkj96wH+In2+HSkvSX4lj5gf2DbCXN2Wtr8kDnFs3XAnRrYnm0dQAQm6hMeGXu8ycCg3xkfpcdBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742990047; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AceXwwk0dg/5R7XIw5oul2ygSeDFRaSA96BeLYqo5pM=;
 b=C7b1qYoMraqTVE/p4+HACSFAM3pkzupchC001ua9JTLrVZEusvj/voC+NZOBFM/d
 MLoq4faBDdt5kVtuw3IMG2inJmIcwjhnaIImCkNwLx1nRz/VzSpaQ4BFw2rIEvkifNA
 19a7ZDWxA2HROxOg797hvpzBC6htiCp3FOi+fpBU=
Received: by mx.zohomail.com with SMTPS id 1742990044468581.4583932676458;
 Wed, 26 Mar 2025 04:54:04 -0700 (PDT)
Message-ID: <16a30d03-9c98-47a4-959f-8671f7cb7fab@collabora.com>
Date: Wed, 26 Mar 2025 14:54:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error
 path of prepare_fb()
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20250326014902.379339-1-dmitry.osipenko@collabora.com>
 <20250326014902.379339-2-dmitry.osipenko@collabora.com>
 <IA0PR11MB7185345D3DFA8C7900059144F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <IA0PR11MB7185345D3DFA8C7900059144F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 3/26/25 08:14, Kasireddy, Vivek wrote:
...
>>  static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>>  				       struct drm_plane_state *new_state)
>>  {
>> @@ -376,23 +386,16 @@ static int virtio_gpu_plane_prepare_fb(struct
>> drm_plane *plane,
>>  		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
>>  						     vgdev->fence_drv.context,
>>  						     0);
>> -		if (!vgplane_st->fence)
>> +		if (!vgplane_st->fence) {
>> +			if (obj->import_attach)
>> +				virtio_gpu_cleanup_imported_obj(obj);
> I think checking for fence allocation failure before import would be much better.
> In other words, cleaning up the fence in case of any import errors would be
> much simpler IMO.
> 
> Regardless,
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com> 

Another question, why do we need this fencing for imported dmabuf?
Fencing isn't done host/guest blobs in this code, while dmabuf is
essentially a guest blob. Could you please clarify why this fence is
needed? Maybe we shouldn't allocate fence in the first place for the dmabuf.

-- 
Best regards,
Dmitry
