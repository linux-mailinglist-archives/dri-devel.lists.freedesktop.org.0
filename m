Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F39402F26
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 21:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ABF6E09F;
	Tue,  7 Sep 2021 19:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E53E6E09F;
 Tue,  7 Sep 2021 19:50:46 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a10so92753qka.12;
 Tue, 07 Sep 2021 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BbK79M4K1NScSC56f9H+WVaEri++PPqYND9B3MRUuGU=;
 b=KMSrSr+OYgzXWdEHpRPwrcf4fMhrB0mC+itfbrLvojQurxnPv1upC4wplV8jRnkml4
 9QWQSER7ulkA/aUeKCckwDaiLS42qUfgE4pok9bUs/3SngMjijMyAySemf+v0jwucdW+
 36MV9HW9DvI0sV5tPU90JHc2WWoiEDyp2g20mCeGUps8KWRTqNOIe3VdlvYKM6B3GKCk
 HSj6EYz8EkCdNwjJ70Fv7BU3IfTApzWMnBt0jBKjMPlY7jiLcWr6Doa79lD3U1veeck5
 3WIwYPVjkZKIQdZBDWTu6NcSDr94dL0VcVI+HZymoQ2KkqojmiI08Zngjz4U52bCRTxT
 Fjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BbK79M4K1NScSC56f9H+WVaEri++PPqYND9B3MRUuGU=;
 b=tdhyLs0QfQmnF8puRt1xKhFDcsuw0PrGmfb2CjyUNEn3W9vWJLvQ+w333HdKSXygmW
 M2KPe/G+Vyi5BzbVK2DH0a5oVj8gM3wExMQWdCeFTUO3Vs67IDuahz7IwgvrsbhV8X4l
 8fo1X3NuvkTf3lTPdH1zqivpINzOZjGbmMjHAiqLS5N2w8bZQuntvB3PuUfhpo+Vf6LX
 ESEL7pJWNpRuJ2RCXvHLtznslg8ax+NTfPsnEdEPJJyorqe67/cngqzfhNhLbHnRfsTQ
 Zbsc+QNjLbSYZnnf9VC6u4GX4oSf4qYTFEQY6HfqyWly66K1hzqAJ8SAyzSOD8H067Ub
 CZYA==
X-Gm-Message-State: AOAM5334G2Qr+ELkZ1uzOerYazW07Bx+YV7yGIX0gmZn2OzCJIzyJWUW
 06BpBGgX+NtEVpRcNa0S/Dw=
X-Google-Smtp-Source: ABdhPJy4jrz4dsxFLhW/UWMHYDJZ1OjsaqTiC38KylBj+fSKTnzLQjjo+pWzSVXRdzeHKBfP3bE6JQ==
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr17273471qkg.83.1631044244942; 
 Tue, 07 Sep 2021 12:50:44 -0700 (PDT)
Received: from [192.168.4.142] (pool-72-82-21-11.prvdri.fios.verizon.net.
 [72.82.21.11])
 by smtp.gmail.com with ESMTPSA id 187sm21924qke.32.2021.09.07.12.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 12:50:44 -0700 (PDT)
Subject: Re: [PATCH v10 0/4] drm: update locking for modesetting
To: daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, tzimmermann@suse.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 christian.koenig@amd.com
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <8fcb9450-5284-ff2e-8a0b-d16ba4591ab2@gmail.com>
Date: Tue, 7 Sep 2021 15:50:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

On 31/8/21 3:24 am, Desmond Cheong Zhi Xi wrote:
> Sorry for the noise, rebasing on top of drm-misc-next. Please ignore the
> v9 series.
> 
> Hi,
> 
> I updated the patch set with some suggestions by Daniel Vetter, and
> dropped the patches after patch 4 so that we can stick the landing for
> avoiding races with modesetting rights before dealing with the tricky
> spinlock.
> 
> Overall, this series fixes races with modesetting rights, and converts
> drm_device.master_mutex into master_rwsem.
> 
> - Patch 1: Fix a potential null ptr dereference in drm_master_release
> 
> - Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)
> 
> - Patch 3: Update global mutex locking in the ioctl handler (avoids
> deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)
> 
> - Patch 4: Plug races with drm modesetting rights
> 
> v9 -> v10:
> - Rebase on top of drm-misc-next, caught by Intel-gfx CI
> 
> v8 -> v9 (suggested by Daniel Vetter):
> - Drop patches 5-7 to handle it in another series
> - Add the appropriate Fixes: tag for the null ptr dereference fix
> (patch 1)
> - Create a locked_ioctl bool to clarify locking/unlocking patterns in
> the ioctl handler (patch 3)
> - Clarify the kernel doc for master_rwsem (patch 4)
> 
> v7 -> v8:
> - Avoid calling drm_lease_held in drm_mode_setcrtc and
> drm_wait_vblank_ioctl, caught by Intel-gfx CI
> 
> v6 -> v7:
> - Export __drm_mode_object_find for loadable modules, caught by the
> Intel-gfx CI
> 
> v5 -> v6:
> - Fix recursive locking on master_rwsem, caught by the Intel-gfx CI
> 
> v4 -> v5:
> - Avoid calling drm_file_get_master while holding on to the modeset
> mutex, caught by the Intel-gfx CI
> 
> v3 -> v4 (suggested by Daniel Vetter):
> - Drop a patch that added an unnecessary master_lookup_lock in
> drm_master_release
> - Drop a patch that addressed a non-existent race in
> drm_is_current_master_locked
> - Remove fixes for non-existent null ptr dereferences
> - Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
> master_lookup_lock
> - Drop the patch that moved master_lookup_lock into struct drm_device
> - Drop a patch to export task_work_add
> - Revert the check for the global mutex in the ioctl handler to use
> drm_core_check_feature instead of drm_dev_needs_global_mutex
> - Push down master_rwsem locking for selected ioctls to avoid lock
> hierarchy inversions, and to allow us to hold write locks on
> master_rwsem instead of flushing readers
> - Remove master_lookup_lock by replacing it with master_rwsem
> 
> v2 -> v3:
> - Unexport drm_master_flush, as suggested by Daniel Vetter.
> - Merge master_mutex and master_rwsem, as suggested by Daniel Vetter.
> - Export task_work_add, reported by kernel test robot.
> - Make master_flush static, reported by kernel test robot.
> - Move master_lookup_lock into struct drm_device.
> - Add a missing lock on master_lookup_lock in drm_master_release.
> - Fix a potential race in drm_is_current_master_locked.
> - Fix potential null ptr dereferences in drm_{auth, ioctl}.
> - Protect magic_map,unique{_len} with  master_lookup_lock.
> - Convert master_mutex into a rwsem.
> - Update global mutex locking in the ioctl handler.
> 
> v1 -> v2 (suggested by Daniel Vetter):
> - Address an additional race when drm_open runs.
> - Switch from SRCU to rwsem to synchronise readers and writers.
> - Implement drm_master_flush with task_work so that flushes can be
> queued to run before returning to userspace without creating a new
> DRM_MASTER_FLUSH ioctl flag.
> 
> Best wishes,
> Desmond
> 
> Desmond Cheong Zhi Xi (4):
>    drm: fix null ptr dereference in drm_master_release
>    drm: convert drm_device.master_mutex into a rwsem
>    drm: lock drm_global_mutex earlier in the ioctl handler
>    drm: avoid races with modesetting rights
> 
>   drivers/gpu/drm/drm_auth.c    | 39 ++++++++++++++++------------
>   drivers/gpu/drm/drm_debugfs.c |  4 +--
>   drivers/gpu/drm/drm_drv.c     |  3 +--
>   drivers/gpu/drm/drm_file.c    |  6 ++---
>   drivers/gpu/drm/drm_ioctl.c   | 49 ++++++++++++++++++++++-------------
>   drivers/gpu/drm/drm_lease.c   | 35 +++++++++++++++++--------
>   include/drm/drm_auth.h        |  6 ++---
>   include/drm/drm_device.h      | 16 +++++++++---
>   include/drm/drm_file.h        | 12 ++++-----
>   9 files changed, 104 insertions(+), 66 deletions(-)
> 

Hi Daniel,

Just pinging so this doesn't get buried, though I guess it's also a busy 
merge window. Any thoughts on the series as it is? Tests seemed to have 
passed with the Intel-gfx CI [1].

Not sure if I can set up the CI to do otherwise, but I think this series 
has to go in before I can test new patches to remove the 
drm_file.master_lookup_lock spinlock.

As always, thank you for your time.

Link: https://patchwork.freedesktop.org/series/93864/ [1]

Best wishes,
Desmond
