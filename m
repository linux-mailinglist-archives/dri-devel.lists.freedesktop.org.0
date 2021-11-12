Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E644EB18
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 17:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC3A6ECFE;
	Fri, 12 Nov 2021 16:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9235B6ECF1;
 Fri, 12 Nov 2021 16:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C7302202042;
 Fri, 12 Nov 2021 17:10:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id dDjhs9_njTlo; Fri, 12 Nov 2021 17:10:28 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 77597202034;
 Fri, 12 Nov 2021 17:10:28 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mlZ8F-0008ch-P2;
 Fri, 12 Nov 2021 17:10:27 +0100
Message-ID: <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
Date: Fri, 12 Nov 2021 17:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Yu, Lang" <Lang.Yu@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Questions about KMS flip
In-Reply-To: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-12 16:03, Christian König wrote:
> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
>> On 2021-11-12 15:29, Michel Dänzer wrote:
>>> On 2021-11-12 13:47, Christian König wrote:
>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://bugzilla.kernel.org/show_bug.cgi?id=214621
>>>>
>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
>>>>
>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
>>> dm_plane_helper_cleanup_fb.
>>>
>>>
>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
>> This should say amdgpu_display_unpin_work_func.
> 
> Ah! So that is the classic (e.g. non atomic) path?

Presumably.


>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> 
> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
> 
> E.g. not pin unbalance, but rather use after free.

amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
