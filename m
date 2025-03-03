Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C8A4C006
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1E510E281;
	Mon,  3 Mar 2025 12:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="siAw71ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785510E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:14:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52382ge9017916;
 Mon, 3 Mar 2025 12:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=7
 HBksRmujiRqIhNMXWm0stTBBO2G8Z6mwPtk8Cx3/I4=; b=siAw71cknw6UcArEi
 KI2X+NtfzjLCrCpIBNyKK1AMdQ2nRJPzdvXV1IX70Lrtgg0YmTAPb9wxsbyZLuFf
 LqYXtePCrMCTCK039JRsJO6Aunc/KEd0XibKFbjezJS7TceS709/l52RGTMVCw1F
 +8R+NaZpwAarOvr8CMDvsivEil2Lk7GT5ASBs6UY8skmClFJ8U5oDt9vDwX7XP0A
 uB4XfAJuvxksC5hOc1SCvOZKYVNpKjG6FTIC6rkuEGu9xk69/9wGBlWRZoPq2nl3
 8qIrV6/KMlcHMlL1qV4CobbujgPiEZJaSksqG64Fy7QqrC5m4dqyQzqliOHbON03
 3qYaw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 453u711fe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 03 Mar 2025 12:14:28 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.8.157) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 12:14:26 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brendan King <Brendan.King@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Brendan King <brendan.king@imgtec.com>
In-Reply-To: <20250226-fence-release-deadlock-v2-1-6fed2fc1fe88@imgtec.com>
References: <20250226-fence-release-deadlock-v2-1-6fed2fc1fe88@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: avoid deadlock on fence release
Message-ID: <174100406750.47174.5779964447854559103.b4-ty@imgtec.com>
Date: Mon, 3 Mar 2025 12:14:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.8.157]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: bpIBZufc03XJfFS43l1NXtmySg71wGFl
X-Authority-Analysis: v=2.4 cv=LrJoymdc c=1 sm=1 tr=0 ts=67c59d25 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=LHZ2_XVCwAsA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=r_1tXGB3AAAA:8
 a=Jn6vUoLUptEalpbYKOgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: bpIBZufc03XJfFS43l1NXtmySg71wGFl
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


On Wed, 26 Feb 2025 15:42:19 +0000, Brendan King wrote:
> Do scheduler queue fence release processing on a workqueue, rather
> than in the release function itself.
> 
> Fixes deadlock issues such as the following:
> 
> [  607.400437] ============================================
> [  607.405755] WARNING: possible recursive locking detected
> [  607.415500] --------------------------------------------
> [  607.420817] weston:zfq0/24149 is trying to acquire lock:
> [  607.426131] ffff000017d041a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: pvr_gem_object_vunmap+0x40/0xc0 [powervr]
> [  607.436728]
>                but task is already holding lock:
> [  607.442554] ffff000017d105a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_ioctl+0x250/0x554
> [  607.451727]
>                other info that might help us debug this:
> [  607.458245]  Possible unsafe locking scenario:
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: avoid deadlock on fence release
      commit: df1a1ed5e1bdd9cc13148e0e5549f5ebcf76cf13

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

