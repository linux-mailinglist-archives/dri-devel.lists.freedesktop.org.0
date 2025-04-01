Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EBDA776A8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCD210E513;
	Tue,  1 Apr 2025 08:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MiJIQkjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B32310E516
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:42:35 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316j2iT027691;
 Tue, 1 Apr 2025 09:42:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=R
 8TCmtRbqOlDrGi1Q5AjHaOUy2iI6+a6JqFKx2HI1T0=; b=MiJIQkjsAZPWoW+4z
 fF9W2XYmhZpzmPi/kofq1YxITdtR/0VxfY7nIqYbraiDKbqvBkVLp/hbKuMvgl/H
 TFWcoYLAdG6cY5KucHKq09lpKiaw28OufDYF5wDzr2LDADHcZ+c6Jo0XB0IAhqcq
 wuFaeFx0rogHIAHbvYq9hgWkaV6cVhyRxAwHyhDYrWiZYtnnlLRdh+SyU2VGfpJ0
 4N+YS6Y8DAUhB68EhsyrTkbUWiCZPXx/Zf6FmshQHwGanwD3l7FVhwYuEqtVNmIg
 zqiCx8b0L8f5NH1YJhohoiAKZ84T7uA1WRyDNo5sizqvDUDRwpJs8X9d9kS7VKyl
 L8/sg==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45p9u0t0cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Apr 2025 09:42:13 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:42:12 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Brendan King <Brendan.King@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Brendan King <brendan.king@imgtec.com>
In-Reply-To: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>
References: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>
Subject: Re: [PATCH] drm/imagination: take paired job reference
Message-ID: <174349693233.75513.9819587084207763142.b4-ty@imgtec.com>
Date: Tue, 1 Apr 2025 09:42:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: rXrcd4LUK4OaPkzD9an5f0DhBOyUSUr5
X-Authority-Analysis: v=2.4 cv=c/CrQQ9l c=1 sm=1 tr=0 ts=67eba6e5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=r_1tXGB3AAAA:8
 a=dJcJSLYtkHp847Acm8sA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: rXrcd4LUK4OaPkzD9an5f0DhBOyUSUr5
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


On Tue, 18 Mar 2025 14:53:13 +0000, Brendan King wrote:
> For paired jobs, have the fragment job take a reference on the
> geometry job, so that the geometry job cannot be freed until
> the fragment job has finished with it.
> 
> The geometry job structure is accessed when the fragment job is being
> prepared by the GPU scheduler. Taking the reference prevents the
> geometry job being freed until the fragment job no longer requires it.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: take paired job reference
      commit: 4ba2abe154ef68f9612eee9d6fbfe53a1736b064

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

