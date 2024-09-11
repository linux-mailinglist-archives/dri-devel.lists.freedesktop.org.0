Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA48975124
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D710E9BF;
	Wed, 11 Sep 2024 11:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="OtrxramE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87A310E9BE;
 Wed, 11 Sep 2024 11:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726055620; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ffe6Mj882aL3Oan09wgXiMxfYT3t4iUjmQEVmF6PENS8HaaBYeGOFkojuOXlJilDmE641DR2WHeU/MFEXXkQ+gLFpzA8AeS5oLSXdX7vYpxhFvd4UN2KawhWDDd0TQMxf9eHQx4bXb23ntfaj2vV278j4rT5BXA4nw9mIgN95Xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726055620;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TkWrsY6A2OrEHWlL+vFcgYS/ZSRypgxW3gP/fSCiyhQ=; 
 b=n9TPxNcGOSKzk/QsKGR5Bauevva0lVdcFuRaRMZQVP0eSUJln+3ZDg4TYt2Wz5x/BezSy21nx/9o5zeo5J8OEie2IVvftWHo78vZBC1V+OjGrFRSNVeIYnZz3HM25M3dQgRRn5gTnihf1OV817Brx+ztN2YgmrUcMvydpX0AFRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726055620; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=TkWrsY6A2OrEHWlL+vFcgYS/ZSRypgxW3gP/fSCiyhQ=;
 b=OtrxramEr/js4CoDsBv8UJMKEgw0V4Oi94Ium5NZ4+EosGQ3J0u7ZUw+8L+DG3JQ
 fT7TSstKop58WGOAQgzIWQyaMpyCHyRi3YMA0FuM0h1Y60NbJ/cioYg+IXdecgOSeNt
 gPy7YTLBYYiA8rJZYdQLGBSLfADTWMH5v6Jl8qpQ=
Received: by mx.zohomail.com with SMTPS id 1726055619007402.2625058274426;
 Wed, 11 Sep 2024 04:53:39 -0700 (PDT)
Message-ID: <e50f1614-d70d-4766-8c08-20bde7af56ea@collabora.com>
Date: Wed, 11 Sep 2024 17:23:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for i915 driver testing
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 robdclark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
References: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
 <48fb86a9-b863-468e-ae74-35423b22b76d@collabora.com>
 <61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com>
 <ZuCfdbFZiJ-1z4pU@intel.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ZuCfdbFZiJ-1z4pU@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Rodrigo,

On 11/09/24 01:05, Rodrigo Vivi wrote:
> On Tue, Sep 10, 2024 at 07:32:56AM +0530, Vignesh Raman wrote:
>> Hi Maintainers,
>>
>> On 12/07/24 11:22, Vignesh Raman wrote:
>>> Hi Maintainers,
>>>
>>> On 28/05/24 12:07, Vignesh Raman wrote:
>>>> Hi Maintainers,
>>>>
>>>> There are some flaky tests reported for i915 driver testing in
>>>> drm-ci for the below boards.
>>>>
>>>> *)
>>>> # Board Name: asus-C523NA-A20057-coral
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> kms_fb_coherency@memset-crc
>>>>
>>>> *)
>>>> # Board Name: asus-C436FA-Flip-hatch
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> kms_plane_alpha_blend@constant-alpha-min
>>>>
>>>> *)
>>>> # Board Name: hp-x360-12b-ca0010nr-n4020-octopus
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> core_hotunplug@unplug-rescan
>>>> kms_fb_coherency@memset-crc
>>>>
>>>> *)
>>>> # Board Name: hp-x360-14-G1-sona
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> prime_busy@hang
>>>>
>>>> *)
>>>> # Board Name: dell-latitude-5400-8665U-sarien
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> kms_pm_rpm@modeset-lpsp-stress
>>>>
>>>> *)
>>>> # Board Name: asus-C433TA-AJ0005-rammus
>>>> # IGT Version: 1.28-g0df7b9b97
>>>> # Linux Version: 6.9.0-rc7
>>>> # Failure Rate: 50
>>>> i915_hangman@engine-engine-error
>>>> i915_hangman@gt-engine-hang
>>>> kms_async_flips@crc
>>>> kms_universal_plane@cursor-fb-leak
>>>>
>>>> Will add these tests in,
>>>> drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>>>> drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>>>> drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>>>> drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>>>> drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>>>> drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70
>>>>
>>>> Please could you have a look at these test results and let us know
>>>> if you need more information. Thank you.
>>>
>>> There are some flaky tests reported for i915 driver testing in drm-ci
>>> with the recent IGT uprev in drm-ci (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
>>>
>>> *)
>>> # Board Name: asus-C433TA-AJ0005-rammus
>>> # Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
>>> # Failure Rate: 50
>>> # IGT Version: 1.28-gf13702b8e
>>> # Linux Version: 6.10.0-rc5
>>> kms_sysfs_edid_timing
>>> i915_hangman@engine-engine-hang
>>> kms_pm_rpm@modeset-lpsp-stress
>>>
>>> *)
>>> # Board Name: asus-C436FA-Flip-hatch
>>> # Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
>>> # Failure Rate: 50
>>> # IGT Version: 1.28-gf13702b8e
>>> # Linux Version: 6.10.0-rc5
>>> kms_atomic_transition@plane-all-modeset-transition-internal-panels
>>>
>>> The expectation files have been updated with these tests,
>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>>>
>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>>
>> There are some flaky tests reported for i915 driver testing in drm-ci with
>> the recent IGT uprev in drm-ci.
>>
>> *)
>> # Board Name: asus-C433TA-AJ0005-rammus
>> # Failure Rate: 50
>> # IGT Version: 1.28-ga73311079
>> # Linux Version: 6.11.0-rc2
>> kms_pm_rpm@drm-resources-equal
>>
>> *)
>> # Board Name: asus-C523NA-A20057-coral
>> # Failure Rate: 100
>> # IGT Version: 1.28-ga73311079
>> # Linux Version: 6.11.0-rc2
>> kms_universal_plane@cursor-fb-leak
>>
>> *)
>> # Board Name: asus-C436FA-Flip-hatch
>> # Failure Rate: 100
>> # IGT Version: 1.28-ga73311079
>> # Linux Version: 6.11.0-rc2
>> kms_plane_alpha_blend@constant-alpha-min
>>
>> # Board Name: asus-C436FA-Flip-hatch
>> # Failure Rate: 50
>> # IGT Version: 1.28-ga73311079
>> # Linux Version: 6.11.0-rc2
>> kms_async_flips@crc
>>
>> The expectation files have been updated with these tests,
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>>
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>>
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>>
>> Please could you have a look at these test results and let us know if you
>> need more information. Thank you.
> 
> Hi Vignesh,
> 
> Where are exactly the logs? Any gitlab/issue reported for each case?

There is no gitlab issue created. It is a good idea to create a gitlab 
issue in https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ (for 
i915 driver) and https://gitlab.freedesktop.org/drm/misc/kernel/-/issues 
for other drivers for each flake test.

Please let me know if this works.

> 
> Getting this for instance:
> 
> # Board Name: asus-C436FA-Flip-hatch
> # Failure Rate: 100
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_plane_alpha_blend@constant-alpha-min
> 
> Looking to drm-tip CI:
> https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=constant-alpha-min
> 
> it doesn't look like a 100% failure there.

Yes, so it is reported as flake.

Logs are in,
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/63394178
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/63340372

The artifacts are available for only 4 weeks.

 From the artifacts,
IGT-Version: 1.28-ga73311079 (x86_64) (Linux: 6.11.0-rc5-g5d3429a7e9aa 
x86_64)
Using IGT_SRANDOM=1725947780 for randomisation
Opened device: /dev/dri/card0
Starting subtest: constant-alpha-min
Starting dynamic subtest: pipe-A-eDP-1
Testing plane 0
Testing plane 1
Dynamic subtest pipe-A-eDP-1: SUCCESS (1.094s)
Starting dynamic subtest: pipe-C-eDP-1
Testing plane 0
Testing plane 1
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 [igt_assert_crc_equal+0x9b]
   #2 ../tests/kms_plane_alpha_blend.c:376 constant_alpha_min()
   #3 ../tests/kms_plane_alpha_blend.c:568 run_subtests()
   #4 ../tests/kms_plane_alpha_blend.c:752 __igt_unique____real_main730()
   #5 ../tests/kms_plane_alpha_blend.c:730 main()
   #6 [__libc_init_first+0x8a]
   #7 [__libc_start_main+0x85]
   #8 [_start+0x21]
Dynamic subtest pipe-C-eDP-1: FAIL (1.334s)
Subtest constant-alpha-min: FAIL (2.568s)


> 
> Also, nothing special on 6.11.0-rc2 that could trigger that I'm afraid.
> 
> So, it would be good to have real individual bug reports [1] for each case
> and some help on bisecting the commit level as well.

Agree. Will create individual gitlab issues.

> 
> So, with more information we might get more attention to help these cases.
> Otherwise I believe this list will just grow without a proper plan to move
> back to the basic test list.
> 
> Thanks,
> Rodrigo.
> 
> [1] - https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> 

Regards,
Vignesh
