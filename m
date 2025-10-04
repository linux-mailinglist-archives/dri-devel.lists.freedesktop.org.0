Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C2BB8C1C
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 11:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD0110E215;
	Sat,  4 Oct 2025 09:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gLxYlWyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06DC10E1FF;
 Sat,  4 Oct 2025 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759570767;
 bh=qisPUywAbG75IngeanB4QRWIZ3GHsT6vh+Z8ufjXF68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gLxYlWyCPWNrBp7a7jJiAVFHXUsoxmnDJmdwJfGbhsSLfVzaamN1+Mu/C/H4snDWv
 1vTK+1BMDuhsEbugYcUo9aLzxlm42VZkwXqFLT3bA/aJ9ifD0kyjvLrOHOtOh04e9P
 sdy/EHQa78XMogigp2dQMaWfhSDGX6I14G4AdzY+1AOqM2r5lH7flkL+VXh3Sxid++
 oocuhJKL0AKYis3/uW2TF6YxxT1DJO4PZr+7BIjDIbD3ywew4RmJ2FwhEA6/RUfGVr
 Pmrzr5DmT+7UMout1aiJSIUVfbzMhoUuH2kNEZ8iD6O2JkmfsiYw+uGsFXXe0wiAaK
 +yWAZc6KypL0w==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4820A17E055D;
 Sat,  4 Oct 2025 11:39:26 +0200 (CEST)
Message-ID: <f9f92476-c218-40d0-bb45-382252e2f288@collabora.com>
Date: Sat, 4 Oct 2025 11:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/panthor: Introduce huge tmpfs mount point option
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com
References: <20250929200316.18417-1-loic.molinari@collabora.com>
 <20250929200316.18417-7-loic.molinari@collabora.com>
 <20250930123416.4ff59b11@fedora>
 <d3b927b9-ddcb-492a-a72c-d42abbb11cff@collabora.com>
 <20250930185216.0219a542@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20250930185216.0219a542@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/09/2025 18:52, Boris Brezillon wrote:
> On Tue, 30 Sep 2025 18:31:11 +0200
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> On 30/09/2025 12:34, Boris Brezillon wrote:
>>> On Mon, 29 Sep 2025 22:03:14 +0200
>>> Loïc Molinari <loic.molinari@collabora.com> wrote:
>>>    
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>>>> index 4fc7cf2aeed5..54ca61567426 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>>>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>>>> @@ -135,6 +135,9 @@ struct panthor_device {
>>>>    	/** @devfreq: Device frequency scaling management data. */
>>>>    	struct panthor_devfreq *devfreq;
>>>>    
>>>> +	/** @huge_mnt: tmpfs mount point with Transparent Hugepage enabled. */
>>>> +	struct vfsmount *huge_mnt;
>>>
>>> Now that we have a helper to create a huge mountpoint, wouldn't it
>>> make sense to have this field in drm_device instead of having each
>>> driver add a huge_mnt field to their <driver>_device object.
>>
>> Not sure this should be enforced for all DRM drivers since most of them
>> don't create separate huge mountpoints (only 4 for now including this
>> patchset) and I guess some maintainers might prefer to depend on the
>> sysfs interace to enable huge pages.
> 
> I'm not saying we should create the huge mountpoint by default, but if
> this is a generic helper, it makes sense to also manage this mountpoint
> internally. In the end, it'd be a small price to pay for drivers that
> don't need it (the size of a pointer in the drm_device object), and
> with this in place, driver wouldn't even have to call
> drm_gem_shmem_huge_mnt_free() manually (can be automated with a
> drmm_add_action_or_reset() calling kern_unmount() inside
> drm_gem_shmem_huge_mnt_create()).

Ok. I've just sent a v3 of the series with the huge vfsmount stored in 
the drm_device struct. This also allowed to get rid of some of the 
*_with_mnt helpers.

> 
>>
>>>> +
>>>>    	/** @unplug: Device unplug related fields. */
>>>>    	struct {
>>>>    		/** @lock: Lock used to serialize unplug operations. */
>>>    
>>
>> Loïc
> 

Loïc
