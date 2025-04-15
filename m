Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35738A898DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AE110E0D8;
	Tue, 15 Apr 2025 09:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rkPuy3kI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF210E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aVE3ys2H0ZE2L4vhU1OtGMX1gKYJ5pVKDRlGVUs/XQs=; b=rkPuy3kICy9JO9c5e0021FxgAD
 mBkR/STQHWIkVsg+DQl8csjc7VfarNTW2PaNJziehMaHjigrS8SOqxtbOoFoSqJB7T+r8RmGMpr4d
 Bacful9JICYHsDseIELotOGtqpFTV5v/lH0+Rt9KOYN1legXJQ4/kKT/QSN/RymvCXP7v6zN+dllg
 U770S/8ZLHQhG4M9h6Zrrbii/lUiYSzJVbudQtLPsRs9egC3CbBsl/0hxvShVy12Mx0BwUmyP4Hjb
 q+CF7GBmior+z7nue3OdsPW3yiWxKWmnvz6RkKmBzNJKeXYWl7xaIfAAQLarU6STMEcoexIUWd9p1
 yDCPPnpg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4d1Z-00Gt2C-US; Tue, 15 Apr 2025 11:56:13 +0200
Message-ID: <9af2aff7-0ea0-4e37-9509-0203f2a9c376@igalia.com>
Date: Tue, 15 Apr 2025 10:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] few drm_syncobj optimisations
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20250328164621.59150-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250328164621.59150-1-tvrtko.ursulin@igalia.com>
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


On 28/03/2025 16:46, Tvrtko Ursulin wrote:
> A small set of drm_syncobj optimisations which should make things a tiny bit
> more efficient on the CPU side of things.
> 
> Improvement seems to be around 1.5%* more FPS if observed with "vkgears
> -present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant to make a
> definitive claim on the numbers since there is some run to run variance. But, as
> suggested by Michel Dänzer, I did do a five ~100 second runs on the each kernel
> to be able to show the ministat analysis.
> 
> x before
> + after
> +------------------------------------------------------------+
> |                          x         +                       |
> |                   x      x         +                       |
> |                   x      xx      ++++                      |
> |                 x x      xx x    ++++                      |
> |                 x xx   x xx x+   ++++                      |
> |                xxxxx   xxxxxx+   ++++ + +                  |
> |                xxxxxxx xxxxxx+x  ++++ +++                  |
> |              x xxxxxxxxxxx*xx+* x++++++++   ++             |
> |        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
> |       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
> |x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
> |               |_______A______|                             |
> |                             |______A_______|               |
> +------------------------------------------------------------+
>      N           Min           Max        Median           Avg        Stddev
> x 135      21697.58     22809.467     22321.396     22307.707     198.75011
> + 118     22200.746      23277.09       22661.4     22671.442     192.10609
> Difference at 95.0% confidence
>      363.735 +/- 48.3345
>      1.63054% +/- 0.216672%
>      (Student's t, pooled s = 195.681)

Intel Alderlake laptop, KDE Wayland:

x base
+ syncobj
+--------------------------------------------------------------+
|                                                       +      |
|                                                       +   +  |
|                                                       +   +  |
|                                                       +  ++  |
|                                                       ++ ++  |
|                                       x               ++ ++  |
|                       x               x             + ++ ++  |
|                       x          xx   xx x x        +++++++  |
|                       x   x   xx xxx xxxx*xxx      +++++++++ |
|x       xx x  x    x  xx xxxxxxxxxx*xxx****xxx  +x+ ++++++++++|
|                      |__________A_M_______|     |____A_M___| |
+--------------------------------------------------------------+
     N           Min           Max        Median           Avg        Stddev
x  55      7158.232      8058.753      7803.506     7754.5195     191.69526
+  55       7801.23      8272.271      8172.435     8150.6303     105.84085
Difference at 95.0% confidence
	396.111 +/- 57.8717
	5.10813% +/- 0.746296%
	(Student's t, pooled s = 154.838)

* Scores may seem low but I had to fix CPU freq to avoid some pretty 
strong thermal throttling causing wild swings within a run.

Benchmarking script:

#! /bin/sh

base=$1

for i in $(seq 5)
do
	timeout 60 vkgears -present-mailbox | tee -a "vkbench-$base.log"
	sleep 5
done

Regards,

Tvrtko

> 
> v2:
>   * Implemented review feedback - see patch change logs.
> 
> v3:
>   * Moved #define DRM_SYNCOBJ_FAST_PATH_ENTRIES one patch earlier for less churn.
> 
> Cc: Maíra Canal <mcanal@igalia.com>
> 
> Tvrtko Ursulin (7):
>    drm/syncobj: Remove unhelpful helper
>    drm/syncobj: Do not allocate an array to store zeros when waiting
>    drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
>    drm/syncobj: Use put_user in drm_syncobj_query_ioctl
>    drm/syncobj: Avoid temporary allocation in
>      drm_syncobj_timeline_signal_ioctl
>    drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
>    drm/syncobj: Add a fast path to drm_syncobj_array_find
> 
>   drivers/gpu/drm/drm_syncobj.c | 286 ++++++++++++++++++----------------
>   1 file changed, 154 insertions(+), 132 deletions(-)
> 

