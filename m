Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCDD3A6B9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656D610E3FA;
	Mon, 19 Jan 2026 11:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vMBVvIEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92F10E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7xnoC2378295; Mon, 19 Jan 2026 11:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=v
 2+HvGghzJ43WgCsyUbdH115MHquZ1aG1uWbSRxbWPw=; b=vMBVvIEHZ3T+ppllH
 78+tNDApY4spfs7Kodb9N7aHfsuxYx/XX9Z/ldte52IZeJNo8RGSFQ98AVVGtC46
 JpAcpNsF30YZgc6kYw0/Uw02fi4Rzun3lkiv9z0XF6lMPt0d82GqaaZxLBfpaKqU
 FIK7YEEHZ5alt/bRdF636fujp02KVnRhdFCr+DUa+TzRDCfuaXTbHX2xGihvVx3c
 e0z363P7wpI5zp0iLEeGX2H3fCYbMuQ2MDY6dzKl0v6eZ4nuQJ4onVNgfRdTeEYU
 61i8/jPBtRLKJyC1Aa+6tGzN0ItdAf4U/SMxtlLBCabStM7unKnlAzZqWWAQW9cZ
 1sRMQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4br3cv9auy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 11:23:46 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.28) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 11:23:45 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: <frank.binns@imgtec.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <alessio.belle@imgtec.com>,
 <alexandru.dadu@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
References: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Wait for FW trace update command
 completion
Message-ID: <176882182554.5508.3413577800755650601.b4-ty@imgtec.com>
Date: Mon, 19 Jan 2026 11:23:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.28]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX/d5gBjcPiMg6
 chmu+NwQC+0z3J9S3jUDBZEnzBp8Z/GATOJ/yI262Yf/3Ybs75ax1IdLM/wS0PoPMq7bO5CMaEn
 HGsg+5fCq/hnUO6829kUNCkPJC+0DgMZqKZMuX/uoWdwW6TY6FM6GS8T06BFo4yB3wFeWUZSJCU
 KH1NlPvSGrc1RMQkx3V6KiGFFmEvl8/yMGjpkhAJlNCJPYLdEgZaWkEM+Z/hz50kLL6XOH1eZ9s
 9gbVaGC+QIuHQja9IApGpC++QBPjuP9Sj3WG8Uh3LRGFUty0Wg9KVGrK4Pe1mjs22pyROxL5QUS
 pftFccb9cgRGXR26QX/xoUaPOeDBAh4vcjyWp82X7QJjPE/Zi/bL2HB1tFgbz92Pnd7RwLNxd2x
 PIQA/9ztClwOsQ940nUqrwZQHeALMrkPV8oytYADAU2yiVItlWTo3qZJo7jw41xUHcmFMxV2SYD
 Rks4zdmPPXtGrDza0Jg==
X-Proofpoint-GUID: 4zKiaN5QKH-ZKsw6jqGIHPkOl24H6RtQ
X-Proofpoint-ORIG-GUID: 4zKiaN5QKH-ZKsw6jqGIHPkOl24H6RtQ
X-Authority-Analysis: v=2.4 cv=HrN72kTS c=1 sm=1 tr=0 ts=696e1442 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CzDp7rjNS_MA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=yZ21L5JCK6vwprR6UgsA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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


On Thu, 08 Jan 2026 04:09:36 +0000, Brajesh Gupta wrote:
> Possibility of no FW trace available after update in the fw_trace_mask due
> to asynchronous mode of command consumption in the FW.
> 
> To ensure FW trace is available after update, wait for FW trace log update
> command completion from the FW.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Wait for FW trace update command completion
      commit: 812062e74a3945b575dce89d330b67cb50054a77

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

