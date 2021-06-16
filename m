Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04C3A9649
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7C89829;
	Wed, 16 Jun 2021 09:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10D889829
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 09:36:20 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G9VQ1B023330; Wed, 16 Jun 2021 09:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=qrIt9OkcksJG8Hzoo+m8TG/TF4FvSpIhsfa1qr7ALvU=;
 b=BdcZRemOAcpmfrdGB+10KSkYZWYTIsy+RexHPGUX4eMS4hVlrQvbWiWZzkaJty67Kbry
 2Kuri9L51hvUjM1BplLndmAB8Ova6CKYPeac8FyO/xLE8y3doC+88ZMHxHIp7i3mXKfP
 vHukx2B2XH6jY4wyjNcDHFyQTJiDQjhCSWS8APxLj5PaszoHOb9LotHhTOfzJ4iGjMYy
 2v9TtwcahUhi1x7IOZBpJ6ZFmY2AWPWVXAO/S8SnpAKj96Tb/9zH0vu7/0A4EvCHQ3Xw
 5sl7Kvi9MlNM+2/+DYLebPxiUazBCkMoMvylrEE4ycbtmZwEr30Zh6IyywRAfDl5+XvF qA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 396tjdsv25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 09:36:16 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15G9aGw8030461;
 Wed, 16 Jun 2021 09:36:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 396wau78ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 09:36:16 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15G9aFRF030440;
 Wed, 16 Jun 2021 09:36:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 396wau78f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 09:36:15 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15G9aCm1001681;
 Wed, 16 Jun 2021 09:36:12 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Jun 2021 09:36:12 +0000
Date: Wed, 16 Jun 2021 12:36:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix error handling in ttm_bo_handle_move_mem()
Message-ID: <20210616093604.GD1901@kadam>
References: <YMmadPwv8C+Ut1+o@mwanda>
 <03d0b798-d1ab-5b6f-2c27-8140d923d445@gmail.com>
 <20210616083758.GC1901@kadam>
 <520a9d1f-8841-8d5e-595d-23783de8333d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <520a9d1f-8841-8d5e-595d-23783de8333d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 2qZ2mbBvaaX2gIX11Cai09kvJ2R54kVW
X-Proofpoint-GUID: 2qZ2mbBvaaX2gIX11Cai09kvJ2R54kVW
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
Cc: B6@mwanda, m <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Thomas Hellstr <C3@mwanda>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 10:47:14AM +0200, Christian König wrote:
> 
> 
> Am 16.06.21 um 10:37 schrieb Dan Carpenter:
> > On Wed, Jun 16, 2021 at 08:46:33AM +0200, Christian König wrote:
> > > Sending the first message didn't worked, so let's try again.
> > > 
> > > Am 16.06.21 um 08:30 schrieb Dan Carpenter:
> > > > There are three bugs here:
> > > > 1) We need to call unpopulate() if ttm_tt_populate() succeeds.
> > > > 2) The "new_man = ttm_manager_type(bdev, bo->mem.mem_type);" assignment
> > > >      was wrong and it was really assigning "new_mem = old_mem;".  There
> > > >      is no need for this assignment anyway as we already have the value
> > > >      for "new_mem".
> > > > 3) The (!new_man->use_tt) condition is reversed.
> > > > 
> > > > Fixes: ba4e7d973dd0 ("drm: Add the TTM GPU memory manager subsystem.")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > This is from reading the code and I can't swear that I have understood
> > > > it correctly.  My nouveau driver is currently unusable and this patch
> > > > has not helped.  But hopefully if I fix enough bugs eventually it will
> > > > start to work.
> > > Well NAK, the code previously looked quite well and you are breaking it now.
> > > 
> > > What's the problem with nouveau?
> > > 
> > The new Firefox seems to excersize nouveau more than the old one so
> > when I start 10 firefox windows it just hangs the graphics.
> > 
> > I've added debug code and it seems like the problem is that
> > nv50_mem_new() is failing.
> 
> Sounds like it is running out of memory to me.
> 
> Do you have a dmesg?
> 

At first there was a very straight forward use after free bug which I
fixed.
https://lore.kernel.org/nouveau/YMinJwpIei9n1Pn1@mwanda/T/#u

But now the use after free is gone the only thing in dmesg is:
"[TTM] Buffer eviction failed".  And I have some firmware missing.

[  205.489763] rfkill: input handler disabled
[  205.678292] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084 failed with error -2
[  205.678300] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084d failed with error -2
[  205.678302] nouveau 0000:01:00.0: msvld: unable to load firmware data
[  205.678304] nouveau 0000:01:00.0: msvld: init failed, -19
[  296.150632] [TTM] Buffer eviction failed
[  417.084265] [TTM] Buffer eviction failed
[  447.295961] [TTM] Buffer eviction failed
[  510.800231] [TTM] Buffer eviction failed
[  556.101384] [TTM] Buffer eviction failed
[  616.495790] [TTM] Buffer eviction failed
[  692.014007] [TTM] Buffer eviction failed

The eviction failed message only shows up a minute after the hang so it
seems more like a symptom than a root cause.

regards,
dan carpenter

