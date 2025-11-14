Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E40BC5D48F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7693F10EA6C;
	Fri, 14 Nov 2025 13:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EuCVDOYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFCF10EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 13:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763126137; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mAACW0p97Ho40lQeluVX/4/rw4pMCDggaYwMqSU7RRM+c3Uzy1TGUISUnnT5+TomgR1s8WDWNeA+Aeb7O6HneRIsV052fF1adDuJUAgl5Uf8/Ak1Zkeu2VRhJUfK1sfrH/5a/rGEfdhW09K3m15zlHf91xkRvx9ozZbAJVHCeSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763126137;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vhjVqBE+SsYVPCJkETGPdzM1S6OEDGXn9RqvBW7Rn64=; 
 b=F6j0faQs4+r2Afbon9ENj3UfGqTgQ4Z4NbmPrvGUiVHauMGoZGPPFT32jmuLqQEwl3+VmASObV978J2aisuedFAXamiKBGNGQJBYJDqYnfRdK6uzqUbc9PBgT+Xs8TKaL8RE+HohbnAfS9mukBtkKRFF2EYuzRHBxR3GXWnMZ5U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763126136; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vhjVqBE+SsYVPCJkETGPdzM1S6OEDGXn9RqvBW7Rn64=;
 b=EuCVDOYbdAVfnmfoUcKrqQhgkgDKEYF97KK7q9xQiSo3GBEEzm++yK0Q/NlPGfXP
 B1qEG2Tirilx64n4QXVoUN0iQkrAZ1Ahz+7XK7rFlWYx280VJUnxgVpr2E7p7Uurasq
 LqCW8nE9jCCBJmulojvCTFDOV+ITaGbymmIgZofc=
Received: by mx.zohomail.com with SMTPS id 176312613558136.38274839537121;
 Fri, 14 Nov 2025 05:15:35 -0800 (PST)
Message-ID: <66183a1b-c724-41fe-ae90-4d73e5f2aa67@collabora.com>
Date: Fri, 14 Nov 2025 16:15:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
 <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
 <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
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

On 11/13/25 23:47, Kim, Dongwon wrote:
>> One option could be to explicitly destroy all stored objs upon hibernation, that
>> way the restoring will always work.
> Yes, we can do it to avoid that corner case. Or maybe we can just let it just run.
> In this case, virtio_gpu_object_restore_all won't fail as shmem init will still work
> but QEMU will justsend back errored replies as all of those resources for BOs are
> still there in QEMU side but I think it won't break anything. Do you see any issues in
> doing this that I might be missing?? My assumption here is that the QEMU hasn't
> done any of virtio-gpu resets here as hibernation failed.

Correct, QEMU will emit a ton of "resource already exists" errors on
aborted hibernation. There should be no errors neither from guest, nor
from host. Note that QEMU is not the only VMM using VirtIO-GPU.

Two options here:

1. Destroy stored host resources upon hibernation
2. Extend hibernation core [1] with addition of PM_HIBERNATION_UNPREPARE
event that will be invoked when hibernation fails, while
PM_POST_HIBERNATION will be invoked only after a successful hibernation

You may start with implementing the first option right away and later
implement the second.

[1]
https://elixir.bootlin.com/linux/v6.17.7/source/kernel/power/hibernate.c#L827

-- 
Best regards,
Dmitry
