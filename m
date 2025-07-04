Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA6AF96E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C68010E2A3;
	Fri,  4 Jul 2025 15:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="okGCi0zX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114810E2B9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:35:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5648IYGi172034;
 Fri, 4 Jul 2025 16:35:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=i
 c4dCORjyUvIUluNdB6Hv8sLxo7aFOVTQQMZZh4ItpY=; b=okGCi0zXLFdWJ15MR
 LHKKZLE0JRbUuCkUuzKJjHXBS+X/haRD1jjNDZdjFhqg0aCmVA5osQE0Efrk5eds
 dxgJD+uTbs07RhfE8+F43At4Kw2oAiMl9uFlFAMERG7wy3FhNYXAH3dBzkrx0GbR
 kRH07RiUcVdL793kyuWnCHPlCn00laVE+lSaGaQVUN9Pjo/q7BpXLF07/Vy3ee+B
 eNR/AxnP/Itdg0h7wHyjXnQ97/EBQpnpIsao0Djr+OTM85qpTgQnIkXkp6kUSXiL
 JuarBF6Aa7x2oQD5p/khqCaLHm1ri/ir3YEHZIVyuhJ3bUqwUDAfyxxsqzdQroxN
 C9Qdw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47j8ftcxep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Jul 2025 16:35:10 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.125) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Jul 2025 16:35:08 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
References: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix kernel crash when hard resetting
 the GPU
Message-ID: <175164330873.70322.8845862980956103647.b4-ty@imgtec.com>
Date: Fri, 4 Jul 2025 16:35:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.7.125]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyNiBTYWx0ZWRfX5Gs7zLjaetpy
 VqUtRFg6YPs9FkUBve99ajWSgqxlSNPybyzcqzaLmL6kAikZL7tbnovI74FHmXtt59+C6iK9i0m
 AGmKMzmVHUNjJiTv4buna52i35SYEpVPiuyVVZ/94f3C9DSgE2auhm0bvFKgdDXxVFgFI06PNCK
 /iPv3XIxQIOiJ6y0FwFxXqfPFbEFPYNRvK6KCzBndvVwD7Kg8MLM3f9qRdAuEPUra+KJ0ahLAyd
 5jEWspJpeP6kwAH7aCDeLnqpO3BVVHMFBFJ9SnNxTrR4LCRrZS+4adb2Wmzt8DR30we7OMJwj7Z
 L5UXKfXWNJHTfobG7N6HIFlVzA00tqiG1VoCnxqyj6ota4d1k6Xyz4IglBJbwTCIC5rEGM1UZJm
 mYQMZnDR
X-Proofpoint-ORIG-GUID: JKLeiVrMa3mQVAY2PDaW3BOGxbFwL4kL
X-Authority-Analysis: v=2.4 cv=LpiSymdc c=1 sm=1 tr=0 ts=6867f4ae cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=fFtJDOQOLN4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=r_1tXGB3AAAA:8
 a=_LgECFMNShmt_M_GEIUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: JKLeiVrMa3mQVAY2PDaW3BOGxbFwL4kL
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


On Tue, 24 Jun 2025 15:22:08 +0100, Alessio Belle wrote:
> The GPU hard reset sequence calls pm_runtime_force_suspend() and
> pm_runtime_force_resume(), which according to their documentation should
> only be used during system-wide PM transitions to sleep states.
> 
> The main issue though is that depending on some internal runtime PM
> state as seen by pm_runtime_force_suspend() (whether the usage count is
> <= 1), pm_runtime_force_resume() might not resume the device unless
> needed. If that happens, the runtime PM resume callback
> pvr_power_device_resume() is not called, the GPU clocks are not
> re-enabled, and the kernel crashes on the next attempt to access GPU
> registers as part of the power-on sequence.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Fix kernel crash when hard resetting the GPU
      commit: d38376b3ee48d073c64e75e150510d7e6b4b04f7

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

