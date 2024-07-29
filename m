Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650B93ED70
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 08:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F44F10E2FD;
	Mon, 29 Jul 2024 06:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tDoLvKKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF8F10E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722234477;
 bh=c2Gb33yB6AGUPL7oB/bVbgijksIJQN8Vp6pPt6OQkXg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=tDoLvKKUFH90Zfy4QS9BC3Q8oXlzM1iVsd4bWvx+NrYo5aa8ZvMRU2X2Dgo1TCwOl
 BrHmLD8BRYw0WHcQcvtoe7SXbJgoEM2gZDOsQMvKuE+mB3sZZsunKwZAsNrxb5oToT
 xp/gqCD456E+Fmlcab15zjZvWCR/uqFji4qV0cXAHOl+V/sCCyeth2nJFCBliEedPH
 NghPSHqqMnUCfBz8fN0tYaRTOtrQs0DC2iyAzuc/vYlHVifRpsbyapUvaFI8Qg0yLX
 iYBqqMx7MOF2v1kVu41W33xUHRkYViJbxDucAPR9b3K9TXQZ8mdwQGk8pv1vnhtDkv
 zRe6Pf/5xmm2Q==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 51D4D37813E1;
 Mon, 29 Jul 2024 06:27:54 +0000 (UTC)
Message-ID: <c790e122-c656-4f2c-8f1d-6e405fc70233@collabora.com>
Date: Mon, 29 Jul 2024 11:57:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] drm/ci: rockchip: add tests for rockchip display
 driver
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
 <20240724101015.523535-6-vignesh.raman@collabora.com>
 <CAPj87rMJUSRJ9G1uv-w5a_4qqS0R1dDaUEofoJf=ehbMszdfOw@mail.gmail.com>
 <27bd3884-51d8-454f-9ddc-6b5765fd744b@collabora.com>
Content-Language: en-US
In-Reply-To: <27bd3884-51d8-454f-9ddc-6b5765fd744b@collabora.com>
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

Hi Daniel,

On 26/07/24 15:37, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 26/07/24 13:06, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On Wed, 24 Jul 2024 at 11:12, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>> For rockchip rk3288 and rk3399, the display driver is rockchip
>>> and gpu driver is panfrost. Currently, in drm-ci for rockchip
>>> rk3288 and rk3399, only the gpu driver is tested. Refactor
>>> the existing rockchip jobs to test both display and gpu driver
>>> and update xfails.
>>
>> Could you also please add RK3588 in a new series (no need to hold this
>> one up), with Rockchip KMS and Panthor GPU? You can use the
>> rk3588-rock5-b device type in LAVA.
> 
> Sure. I Will add and send it in a new series.
> 
>>
>>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt 
>>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>>> index cf3a747f7cec..826cca5efbff 100644
>>> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>>
>> This is in the wrong patch?
> 
> Yes, this needs to be dropped. Thanks for pointing that out.
> 
>>
>>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>>> @@ -0,0 +1,71 @@
>>> +# Suspend to RAM seems to be broken on this machine
>>> +.*suspend.*
>>> +
>>> +# Too unstable, machine ends up hanging after lots of Oopses
>>> +kms_cursor_legacy.*
>>> +
>>> +# Started hanging the machine on Linux 5.19-rc2:
>>> +#
>>> +# [IGT] kms_plane_lowres: executing
>>> +# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
>>> +# [IGT] kms_plane_lowres: exiting, ret=77
>>
>> ret 77 is a pure skip here, as you'd expect from a pipe F test,
>> because Rockchip doesn't have six CRTCs.
>>
>>> +# Console: switching to colour frame buffer device 170x48
>>> +# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
>>> +# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] 
>>> commit wait timed out
>>> +# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
>>> +# 8<--- cut here ---
>>> +# Unable to handle kernel paging request at virtual address 7812078e
>>> +# [7812078e] *pgd=00000000
>>> +# Internal error: Oops: 5 [#1] SMP ARM
>>> +# Modules linked in:
>>> +# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         
>>> 5.19.0-rc2-323596-g00535de92171 #1
>>> +# Hardware name: Rockchip (Device Tree)
>>> +# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
>>> +#  spin_dump from do_raw_spin_lock+0xa4/0xe8
>>> +#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
>>> +#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
>>> +#  drm_crtc_commit_wait from 
>>> drm_atomic_helper_wait_for_dependencies+0x44/0x168
>>> +#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
>>> +#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
>>> +#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
>>> +#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
>>> +#  drm_client_modeset_commit_atomic from 
>>> drm_client_modeset_commit_locked+0x60/0x1c8
>>> +#  drm_client_modeset_commit_locked from 
>>> drm_client_modeset_commit+0x24/0x40
>>> +#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
>>> +#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
>>> +#  drm_client_dev_restore from drm_release+0xf4/0x114
>>> +#  drm_release from __fput+0x74/0x240
>>> +#  __fput from task_work_run+0x84/0xb4
>>> +#  task_work_run from do_exit+0x34c/0xa20
>>> +#  do_exit from do_group_exit+0x34/0x98
>>
>> So this is pointing to the error being that, when a client exits, the
>> kernel attempts to restore fbdev and then it's broken. Pinning
>> pipe-F-tiling-y as specifically responsible for this seems quite odd
>> to me, given that it doesn't do anything but only skips. Is that maybe
>> just because it's the last test running in the kms_plane_lowres group
>> before it exits? Or does it occur more wildly on other test groups?
> 
> This was skipped for Linux 5.19-rc2. I will remove from skips and will 
> check the behavior.

This is for panfrost driver (rk3288). All kms tests are skipped for 
gpu-only driver. Will remove the other kms tests in this file as we have
separate skips file for rockchip driver now.

>>
>>> +tools_test@tools_test,Fail
>>
>> I keep noticing this failing everywhere. What's up with that? Have you
>> reported these logs to the igt list?
> 
> I will check this issue and report to igt developers.

tools_test is a wrapper for running tools/intel_reg and 
tools/intel_l3_parity. So skip these tests on non-intel platforms.


Regards,
Vignesh
