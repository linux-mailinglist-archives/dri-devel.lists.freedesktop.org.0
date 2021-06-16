Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363F3AA42E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 21:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323D89F4F;
	Wed, 16 Jun 2021 19:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E9B89F4F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 19:20:14 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GJ1iOD030557; Wed, 16 Jun 2021 19:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=qxlfK6s5fjhU7CEysH2v1Wn4vERUVU2EayDHnegq7ZE=;
 b=bhRx71PpWeL+gfotgN5kSqoE2f/CrF5+fCEluitluXAl9AKN8lzAd4mXHWd11STa2xuw
 ZymzspFalgH70aYLwUV3OU5TVwmU2A4H3IrWhRF8JOkDDPyC0CO1X2w7Nu9j7PX66IqW
 mh6qe4cVlyCXCotBMiGWpfsrnoaNJue6vdWowkwSCdPeyqMYBvzESpwJnRJpyHmUo/Oq
 x+J2K66k1a2IngMS5uSyKeR5M0YFvKd7CQnrmQRTIBKgQCt9EBqdv3udoN/ZN7nU8deX
 aj0mBUIE7jV9jFklDQ+3ltaCkt57CJrdJo/EPDqucZUpuI+c+UjPUclbcfn04n2BPCbD pQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 397jnqrmuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 19:20:09 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15GJINmr072918;
 Wed, 16 Jun 2021 19:20:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 396wap7dkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 19:20:08 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15GJJc2Y075033;
 Wed, 16 Jun 2021 19:20:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 396wap7dkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 19:20:07 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15GJK1tN008068;
 Wed, 16 Jun 2021 19:20:01 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Jun 2021 12:20:00 -0700
Date: Wed, 16 Jun 2021 22:19:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix error handling in ttm_bo_handle_move_mem()
Message-ID: <20210616191951.GE1901@kadam>
References: <YMmadPwv8C+Ut1+o@mwanda>
 <03d0b798-d1ab-5b6f-2c27-8140d923d445@gmail.com>
 <20210616083758.GC1901@kadam>
 <520a9d1f-8841-8d5e-595d-23783de8333d@gmail.com>
 <20210616093604.GD1901@kadam>
 <7354cd94-06bf-ec36-4539-c3570c1775ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7354cd94-06bf-ec36-4539-c3570c1775ae@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: cCWwZ7K6LpTJTkbqFBaA9NTMuTsCuzPw
X-Proofpoint-ORIG-GUID: cCWwZ7K6LpTJTkbqFBaA9NTMuTsCuzPw
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
Cc: thomas.hellstrom@linux.intel.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Thomas Hellstr <C3@mwanda>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 01:00:38PM +0200, Christian König wrote:
> 
> 
> Am 16.06.21 um 11:36 schrieb Dan Carpenter:
> > On Wed, Jun 16, 2021 at 10:47:14AM +0200, Christian König wrote:
> > > 
> > > Am 16.06.21 um 10:37 schrieb Dan Carpenter:
> > > > On Wed, Jun 16, 2021 at 08:46:33AM +0200, Christian König wrote:
> > > > > Sending the first message didn't worked, so let's try again.
> > > > > 
> > > > > Am 16.06.21 um 08:30 schrieb Dan Carpenter:
> > > > > > There are three bugs here:
> > > > > > 1) We need to call unpopulate() if ttm_tt_populate() succeeds.
> > > > > > 2) The "new_man = ttm_manager_type(bdev, bo->mem.mem_type);" assignment
> > > > > >       was wrong and it was really assigning "new_mem = old_mem;".  There
> > > > > >       is no need for this assignment anyway as we already have the value
> > > > > >       for "new_mem".
> > > > > > 3) The (!new_man->use_tt) condition is reversed.
> > > > > > 
> > > > > > Fixes: ba4e7d973dd0 ("drm: Add the TTM GPU memory manager subsystem.")
> > > > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > > ---
> > > > > > This is from reading the code and I can't swear that I have understood
> > > > > > it correctly.  My nouveau driver is currently unusable and this patch
> > > > > > has not helped.  But hopefully if I fix enough bugs eventually it will
> > > > > > start to work.
> > > > > Well NAK, the code previously looked quite well and you are breaking it now.
> > > > > 
> > > > > What's the problem with nouveau?
> > > > > 
> > > > The new Firefox seems to excersize nouveau more than the old one so
> > > > when I start 10 firefox windows it just hangs the graphics.
> > > > 
> > > > I've added debug code and it seems like the problem is that
> > > > nv50_mem_new() is failing.
> > > Sounds like it is running out of memory to me.
> > > 
> > > Do you have a dmesg?
> > > 
> > At first there was a very straight forward use after free bug which I
> > fixed.
> > https://lore.kernel.org/nouveau/YMinJwpIei9n1Pn1@mwanda/T/#u
> > 
> > But now the use after free is gone the only thing in dmesg is:
> > "[TTM] Buffer eviction failed".  And I have some firmware missing.
> > 
> > [  205.489763] rfkill: input handler disabled
> > [  205.678292] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084 failed with error -2
> > [  205.678300] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084d failed with error -2
> > [  205.678302] nouveau 0000:01:00.0: msvld: unable to load firmware data
> > [  205.678304] nouveau 0000:01:00.0: msvld: init failed, -19
> > [  296.150632] [TTM] Buffer eviction failed
> > [  417.084265] [TTM] Buffer eviction failed
> > [  447.295961] [TTM] Buffer eviction failed
> > [  510.800231] [TTM] Buffer eviction failed
> > [  556.101384] [TTM] Buffer eviction failed
> > [  616.495790] [TTM] Buffer eviction failed
> > [  692.014007] [TTM] Buffer eviction failed
> > 
> > The eviction failed message only shows up a minute after the hang so it
> > seems more like a symptom than a root cause.
> 
> Yeah, look at the timing. What happens is that the buffer eviction timed out
> because the hardware is locked up.
> 
> No idea what that could be. It might not even be kernel related at all.

I don't think it's hardware related...  Using an old version of firefox
"fixes" the problem.  I downloaded the firmware so that's not the issue.
Here's the dmesg load info with the new firmware.

[    1.412458] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    1.412527] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[    1.412710] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    1.417213] Console: switching to colour dummy device 80x25
[    1.417272] nouveau 0000:01:00.0: NVIDIA GT218 (0a8280b1)
[    1.531565] nouveau 0000:01:00.0: bios: nvkm_bios_new: version 70.18.6f.00.05
[    1.531916] nouveau 0000:01:00.0: fb: nvkm_ram_ctor: 1024 MiB DDR3
[    2.248212] tsc: Refined TSC clocksource calibration: 3392.144 MHz
[    2.248218] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x30e5517d4e4, max_idle_ns: 440795261668 ns
[    2.252203] clocksource: Switched to clocksource tsc
[    2.848138] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    2.848142] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.848145] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.848147] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.848149] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000302 00020030
[    2.848151] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300 00000000
[    2.848154] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011362 00020010
[    2.848155] nouveau 0000:01:00.0: DRM: DCB outp 03: 01022310 00000000
[    2.848157] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    2.848159] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002161
[    2.848161] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000200
[    2.850214] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.908409] nouveau 0000:01:00.0: DRM: allocated 1600x900 fb: 0x70000, bo 00000000091fb080
[    2.908518] fbcon: nouveaudrmfb (fb0) is primary device
[    2.955528] Console: switching to colour frame buffer device 200x56
[    2.957780] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[    2.957926] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
[    2.959816] loop: module loaded

regards,
dan carpenter
