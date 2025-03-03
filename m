Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D0A4C016
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46010E3FA;
	Mon,  3 Mar 2025 12:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="rz/GZhXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6BF10E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:18:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52366LPT030025;
 Mon, 3 Mar 2025 12:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=I
 ACcxyKg7TW1vKNpcncfde9wIFZQNcBnyTKlGa9d23M=; b=rz/GZhXyOdw86R0qr
 SlmjMILVOlWpcNsnblhWkzL/9WI0C5ALtgxInILRzpZxv9+23RVB5wFq4qOcMwfs
 MtIIvExJAPo+nwG2zy0WLze+rterJ7infujy+z/LMB8OozLA6G6p2E9JKhMtFMoi
 8Ip9Xf8VzTLShRoxEGEYjsOgbfroyLZcQtJk5WJfjhH/seryPU5TNr3I7camaAaB
 0Cb148WNrrEXkhjJu7l3LiPw+5MOEbWzwOvb+1xLS5R8Wd/9VhPS+5j/kqH1PjmL
 3ajnCYpWCjGvvhWjU3a1z2lCXJvcyv2wXxK/B0k/b4eDXRicaVKfmFqo8Syx2mnM
 aPJQA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 453u711fgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 03 Mar 2025 12:18:18 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.8.157) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 12:18:16 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
References: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix timestamps in firmware traces
Message-ID: <174100429775.48500.17495795495631967155.b4-ty@imgtec.com>
Date: Mon, 3 Mar 2025 12:18:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.8.157]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: TpCqr_jqam6nbrfmskjOPEz6n61kqCLe
X-Authority-Analysis: v=2.4 cv=LrJoymdc c=1 sm=1 tr=0 ts=67c59e0a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=LHZ2_XVCwAsA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=r_1tXGB3AAAA:8
 a=C5DFhOZCARBVFH9tFowA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: TpCqr_jqam6nbrfmskjOPEz6n61kqCLe
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


On Fri, 21 Feb 2025 10:49:35 +0000, Alessio Belle wrote:
> When firmware traces are enabled, the firmware dumps 48-bit timestamps
> for each trace as two 32-bit values, highest 32 bits (of which only 16
> useful) first.
> 
> The driver was reassembling them the other way round i.e. interpreting
> the first value in memory as the lowest 32 bits, and the second value
> as the highest 32 bits (then truncated to 16 bits).
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Fix timestamps in firmware traces
      commit: 1d2eabb6616433ccaa13927811bdfa205e91ba60

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

