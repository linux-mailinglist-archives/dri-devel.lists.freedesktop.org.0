Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB52A4C007
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB810E3E1;
	Mon,  3 Mar 2025 12:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gkODV0mH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577E710E281
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:14:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52382geA017916;
 Mon, 3 Mar 2025 12:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=e
 Wf6UfpGRBwwk8RKifIcIZGcFzxMgif6kyP1suPkusM=; b=gkODV0mH6q8KPZx/k
 mEHB5dh69em4eoKOovZDYJLCEl3sTfhRKBJs7j7ofQtUpZ/ufqpx2kptuiGoxBAA
 y/Vmo6TLTHyiHyS9BdwNAXwB/vmoU1a79DYW1Y23CNsHN821HFttCMaWnmnWRDd5
 kQd5RW2k2L+eF1pFyXW8iv/HZWAFjrzuugQy26VXrs8zSzsaxxgXQVnkX8gcF0J0
 3AUuBdSIc6mU6PnQA1bQDMex4NeyLkERc7BGhfLZlkyzDTkSm5hbgtoVWGsCboaW
 5Es8oCQleBCgg7XYBX3zA/79SgUepiRWH9f1H92UGf2xd3O17zpCHSCdV0D+Orsg
 775iA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 453u711fe4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 03 Mar 2025 12:14:29 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.8.157) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 12:14:27 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brendan King <Brendan.King@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Brendan King <brendan.king@imgtec.com>
In-Reply-To: <20250226-hold-drm_gem_gpuva-lock-for-unmap-v2-1-3fdacded227f@imgtec.com>
References: <20250226-hold-drm_gem_gpuva-lock-for-unmap-v2-1-3fdacded227f@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: Hold drm_gem_gpuva lock for unmap
Message-ID: <174100406813.47174.5029499450421532895.b4-ty@imgtec.com>
Date: Mon, 3 Mar 2025 12:14:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.8.157]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: MBgX6RdhLT-wlApSMlb2hVmtXwXw0j5C
X-Authority-Analysis: v=2.4 cv=LrJoymdc c=1 sm=1 tr=0 ts=67c59d25 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=LHZ2_XVCwAsA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=I97S-O_Z-kIA:10
 a=r_1tXGB3AAAA:8 a=HtLarFGESsWcHrEFRNYA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: MBgX6RdhLT-wlApSMlb2hVmtXwXw0j5C
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


On Wed, 26 Feb 2025 15:43:06 +0000, Brendan King wrote:
> Avoid a warning from drm_gem_gpuva_assert_lock_held in drm_gpuva_unlink.
> 
> The Imagination driver uses the GEM object reservation lock to protect
> the gpuva list, but the GEM object was not always known in the code
> paths that ended up calling drm_gpuva_unlink. When the GEM object isn't
> known, it is found by calling drm_gpuva_find to lookup the object
> associated with a given virtual address range, or by calling
> drm_gpuva_find_first when removing all mappings.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Hold drm_gem_gpuva lock for unmap
      commit: a5c4c3ba95a52d66315acdfbaba9bd82ed39c250

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

