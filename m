Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366024440A1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 12:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ADD73440;
	Wed,  3 Nov 2021 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C0173440
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 11:31:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="212230450"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="212230450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 04:31:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="501022434"
Received: from bmagdala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.215.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 04:31:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Yuan\, Perry" <Perry.Yuan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
In-Reply-To: <MWHPR12MB163124867D43AD8E19EED1D39C8C9@MWHPR12MB1631.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211101061053.38173-1-Perry.Yuan@amd.com>
 <87a6iodnz7.fsf@intel.com>
 <MWHPR12MB1631610D235FCC3B47064F6B9C8B9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87y267c5nc.fsf@intel.com>
 <MWHPR12MB163124867D43AD8E19EED1D39C8C9@MWHPR12MB1631.namprd12.prod.outlook.com>
Date: Wed, 03 Nov 2021 13:31:25 +0200
Message-ID: <87wnlpbhma.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Huang, Shimmer" <Xinmei.Huang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
> [AMD Official Use Only]
>
> Hi Jani:
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Tuesday, November 2, 2021 4:40 PM
>> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie>;
>> Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Huang,
>> Shimmer <Xinmei.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>
>> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
>> drm_dp_dpcd_access
>> 
>> [CAUTION: External Email]
>> 
>> On Tue, 02 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
>> > [AMD Official Use Only]
>> >
>> > Hi Jani:
>> > Thanks for your comments.
>> >
>> >> -----Original Message-----
>> >> From: Jani Nikula <jani.nikula@linux.intel.com>
>> >> Sent: Monday, November 1, 2021 9:07 PM
>> >> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
>> >> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> >> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> David
>> >> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
>> >> Cc: Yuan, Perry <Perry.Yuan@amd.com>;
>> >> dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org;
>> >> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
>> <Ray.Huang@amd.com>
>> >> Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
>> >> dereference on drm_dp_dpcd_access
>> >>
>> >> [CAUTION: External Email]
>> >>
>> >> On Mon, 01 Nov 2021, Perry Yuan <Perry.Yuan@amd.com> wrote:
>> >> > Fix below crash by adding a check in the drm_dp_dpcd_access which
>> >> > ensures that aux->transfer was actually initialized earlier.
>> >>
>> >> Gut feeling says this is papering over a real usage issue somewhere
>> >> else. Why is the aux being used for transfers before ->transfer has
>> >> been set? Why should the dp helper be defensive against all kinds of
>> misprogramming?
>> >>
>> >>
>> >> BR,
>> >> Jani.
>> >>
>> >
>> > The issue was found by Intel IGT test suite, graphic by pass test case.
>> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitl
>> > ab.freedesktop.org%2Fdrm%2Figt-gpu-
>> tools&amp;data=04%7C01%7CPerry.Yuan
>> > %40amd.com%7C83d011acfe65437c0fa808d99ddc65b0%7C3dd8961fe4884e6
>> 08e11a8
>> >
>> 2d994e183d%7C0%7C0%7C637714392203200313%7CUnknown%7CTWFpbGZsb
>> 3d8eyJWIj
>> >
>> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100
>> 0&am
>> >
>> p;sdata=snPpRYLGeJtTpNGle1YHZAvevcABbgLkgOsffiNzQPw%3D&amp;reserved
>> =0
>> > normally use case will not see the issue.
>> > To avoid this issue happy again when we run the test case , it will be nice to
>> add a check before the transfer is called.
>> > And we can see that it really needs to have a check here to make ITG &kernel
>> happy.
>> 
>> You're missing my point. What is the root cause? Why do you have the aux
>> device or connector registered before ->transfer function is initialized. I don't
>> think you should do that.
>> 
>> BR,
>> Jani.
>> 
>
> One potential IGT fix patch to resolve the test case failure is:
>
> tests/amdgpu/amd_bypass.c
> 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> 					 - AMDGPU_PIPE_CRC_SOURCE_DPRX);
> 					 + INTEL_PIPE_CRC_SOURCE_AUTO);
> The kernel panic error gone after change  "dprx" to "auto" in the IGT test.
>
> In my view ,the IGT amdgpu bypass test will do some common setup work including crc piple, source. 
> When the IGT sets up a new CRC pipe capture source for amdgpu bypass test,  the SOURCE was set as "dprx" instead of "auto" 
> It makes "amdgpu_dm_crtc_set_crc_source()"  failed to set correct  AUX and it's  transfer function invalid .
> The system I tested use HDMI port connected to monitor .
>
> amdgpu_dm_crtc_set_crc_source->    (aux = (aconn->port) ? &aconn->port->aux : &aconn->dm_dp_aux.aux;)
> 	 drm_dp_start_crc ->   
> 		drm_dp_dpcd_readb->   aux->transfer is NULL, issue here. 
> The fix will  use the "auto" keyword, which will let the driver select a default source of frame CRCs for this CRTC.
>
> Correct me if have some wrong points. 

Apparently I'm completely failing to communicate my POV to you.

If you have a kernel oops, the fix needs to be in the kernel, not IGT.

The question is, why is it possible for IGT (or any userspace) to
trigger AUX communication when the ->transfer function is not set? In my
opinion, the kernel driver should not have exposed the interface at all
if the ->transfer function is not set. The interface is useless without
the ->transfer function. IMO, that's the bug.


BR,
Jani.

>
> Thank you!
> Perry.
>
>> 
>> >
>> > Perry.
>> >
>> >>
>> >> >
>> >> > BUG: kernel NULL pointer dereference, address: 0000000000000000 PGD
>> >> > 0 P4D 0
>> >> > Oops: 0010 [#1] SMP NOPTI
>> >> > RIP: 0010:0x0
>> >> > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
>> >> > RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
>> >> > RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
>> >> > RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
>> >> > RBP: ffffa8d64225bb10 R08: 0000000000000001 R09: ffffa8d64225ba60
>> >> > R10: 0000000000000002 R11: 000000000000000d R12: 0000000000000001
>> >> > R13: 0000000000000000 R14: ffffa8d64225bb5e R15: ffff931511a1a9d8
>> >> > FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000)
>> >> > knlGS:0000000000000000
>> >> > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >> > CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
>> >> > PKRU: 55555554
>> >> > Call Trace:
>> >> > drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
>> >> > drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
>> >> > drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
>> >> > amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
>> >> > crtc_crc_open+0x174/0x220 [drm]
>> >> > full_proxy_open+0x168/0x1f0
>> >> > ? open_proxy_open+0x100/0x100
>> >> > do_dentry_open+0x156/0x370
>> >> > vfs_open+0x2d/0x30
>> >> >
>> >> > v2: fix some typo
>> >> >
>> >> > Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
>> >> > ---
>> >> >  drivers/gpu/drm/drm_dp_helper.c | 4 ++++
>> >> >  1 file changed, 4 insertions(+)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
>> >> > b/drivers/gpu/drm/drm_dp_helper.c index 6d0f2c447f3b..76b28396001a
>> >> > 100644
>> >> > --- a/drivers/gpu/drm/drm_dp_helper.c
>> >> > +++ b/drivers/gpu/drm/drm_dp_helper.c
>> >> > @@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct
>> >> > drm_dp_aux
>> >> *aux, u8 request,
>> >> >       msg.buffer = buffer;
>> >> >       msg.size = size;
>> >> >
>> >> > +     /* No transfer function is set, so not an available DP connector */
>> >> > +     if (!aux->transfer)
>> >> > +             return -EINVAL;
>> >> > +
>> >> >       mutex_lock(&aux->hw_mutex);
>> >> >
>> >> >       /*
>> >>
>> >> --
>> >> Jani Nikula, Intel Open Source Graphics Center
>> 
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
