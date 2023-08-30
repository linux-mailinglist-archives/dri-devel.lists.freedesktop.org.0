Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244878D74A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 17:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6F110E550;
	Wed, 30 Aug 2023 15:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6135210E550;
 Wed, 30 Aug 2023 15:51:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C084D66071C9;
 Wed, 30 Aug 2023 16:51:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693410677;
 bh=kjUaL5VR03TEh1MPjIv78EGFfK/hRCmMtUCTAAdazBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GukEUIfKnpFKvAszreQSRQAt6GYkCQaSzGgV7+bPCcAEFLBL1TsDtLAgZ4Uu6B9Ck
 S4JzqnYTBrMnTsl3nON6wFXADZAZ9ZV4gtS+R3Y2WBEwMH4jN//LLVtZYE8cfcGPmE
 9x9J6KOX/jdB2LsHF3BdFkd4HifeIs9D5hqZgkt3S537FFnJWObNqYETpCxK4qMBAN
 LU4Y/LbaZDn9p6svH8gBC5xD4u9oIrVWE4onSyqUPBrYVty56x3V/qbaBAmJkxPx5W
 vGkg5/PO7rmy+LBwQSc3U1QpydyVmMzE/tyPyKchthI7INU1KefPF3CIUP3Ap2zao4
 d9UK9/dxkQ4pA==
Date: Wed, 30 Aug 2023 16:51:15 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 6/6] drm/drm-file: Allow size unit selection in
 drm_show_memory_stats
Message-ID: <tc7x4uzxvfwakzoqxgaxbkzh3nyhub56ksrgaqmrb4uaq4rruw@7xwan7qfofw7>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-7-adrian.larumbe@collabora.com>
 <CAF6AEGtXUTs3ta0N+0hiORa+Tsyh94AXPYm9XdaK6xZbqf+nzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtXUTs3ta0N+0hiORa+Tsyh94AXPYm9XdaK6xZbqf+nzA@mail.gmail.com>
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
Cc: kernel@collabora.com, tzimmermann@suse.de,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, sean@poorly.run,
 quic_abhinavk@quicinc.com, mripard@kernel.org, steven.price@arm.com,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The current implementation will try to pick the highest available
>> unit. This is rather unflexible, and allowing drivers to display BO size
>> statistics through fdinfo in units of their choice might be desirable.
>>
>> The new argument to drm_show_memory_stats is to be interpreted as the
>> integer multiplier of a 10-power of 2, so 1 would give us size in Kib and 2
>> in Mib. If we want drm-file functions to pick the highest unit, then 0
>> should be passed.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_file.c              | 22 +++++++++++++---------
>>  drivers/gpu/drm/msm/msm_drv.c           |  2 +-
>>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>>  include/drm/drm_file.h                  |  5 +++--
>>  4 files changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 762965e3d503..517e1fb8072a 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -873,7 +873,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>  EXPORT_SYMBOL(drm_send_event);
>>
>>  static void print_size(struct drm_printer *p, const char *stat,
>> -                      const char *region, u64 sz)
>> +                      const char *region, u64 sz, unsigned int unit)
>>  {
>>         const char *units[] = {"", " KiB", " MiB"};
>>         unsigned u;
>> @@ -881,6 +881,8 @@ static void print_size(struct drm_printer *p, const char *stat,
>>         for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>>                 if (sz < SZ_1K)
>>                         break;
>> +               if (unit > 0 && unit == u)
>> +                       break;
>>                 sz = div_u64(sz, SZ_1K);
>>         }
>>
>> @@ -898,17 +900,18 @@ static void print_size(struct drm_printer *p, const char *stat,
>>  void drm_print_memory_stats(struct drm_printer *p,
>>                             const struct drm_memory_stats *stats,
>>                             enum drm_gem_object_status supported_status,
>> -                           const char *region)
>> +                           const char *region,
>> +                           unsigned int unit)
>
>I'm not really adverse to changing what units we use.. or perhaps
>changing the threshold to go to higher units to be 10000x or 100000x
>of the previous unit.  But I'm less excited about having different
>drivers using different units.
>
>BR,
>-R

Would it be alright if I left it set to the default unit, and allow changing it
at runtime with a debugfs file?

>>  {
>> -       print_size(p, "total", region, stats->private + stats->shared);
>> -       print_size(p, "shared", region, stats->shared);
>> -       print_size(p, "active", region, stats->active);
>> +       print_size(p, "total", region, stats->private + stats->shared, unit);
>> +       print_size(p, "shared", region, stats->shared, unit);
>> +       print_size(p, "active", region, stats->active, unit);
>>
>>         if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>> -               print_size(p, "resident", region, stats->resident);
>> +               print_size(p, "resident", region, stats->resident, unit);
>>
>>         if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
>> -               print_size(p, "purgeable", region, stats->purgeable);
>> +               print_size(p, "purgeable", region, stats->purgeable, unit);
>>  }
>>  EXPORT_SYMBOL(drm_print_memory_stats);
>>
>> @@ -916,11 +919,12 @@ EXPORT_SYMBOL(drm_print_memory_stats);
>>   * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
>>   * @p: the printer to print output to
>>   * @file: the DRM file
>> + * @unit: multipliyer of power of two exponent of desired unit
>>   *
>>   * Helper to iterate over GEM objects with a handle allocated in the specified
>>   * file.
>>   */
>> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, unsigned int unit)
>>  {
>>         struct drm_gem_object *obj;
>>         struct drm_memory_stats status = {};
>> @@ -967,7 +971,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>>         }
>>         spin_unlock(&file->table_lock);
>>
>> -       drm_print_memory_stats(p, &status, supported_status, "memory");
>> +       drm_print_memory_stats(p, &status, supported_status, "memory", unit);
>>  }
>>  EXPORT_SYMBOL(drm_show_memory_stats);
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 2a0e3529598b..cd1198151744 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1067,7 +1067,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>
>>         msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
>>
>> -       drm_show_memory_stats(p, file);
>> +       drm_show_memory_stats(p, file, 0);
>>  }
>>
>>  static const struct file_operations fops = {
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index 93d5f5538c0b..79c08cee3e9d 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -563,7 +563,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>
>>         panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>>
>> -       drm_show_memory_stats(p, file);
>> +       drm_show_memory_stats(p, file, 1);
>>  }
>>
>>  static const struct file_operations panfrost_drm_driver_fops = {
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 010239392adf..21a3b022dd63 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -466,9 +466,10 @@ enum drm_gem_object_status;
>>  void drm_print_memory_stats(struct drm_printer *p,
>>                             const struct drm_memory_stats *stats,
>>                             enum drm_gem_object_status supported_status,
>> -                           const char *region);
>> +                           const char *region,
>> +                           unsigned int unit);
>>
>> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, unsigned int unit);
>>  void drm_show_fdinfo(struct seq_file *m, struct file *f);
>>
>>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>> --
>> 2.42.0
>>
