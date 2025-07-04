Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA528AF96D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589D710E29B;
	Fri,  4 Jul 2025 15:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="JUA/N1wA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06C10E29B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:29:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5647IGcl164149;
 Fri, 4 Jul 2025 16:29:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=3
 e/tr1MQ5X6F+3Xjz6MhIIh8rXhLQCGZQFsuCvAv3EU=; b=JUA/N1wAIf1DZTPQn
 SJDKjSqPtiUYtdYbmO6V6XHLmFMGaJMP695TaErGuNaXru/+gPVbSzYKjOTwVgV9
 8oQs4dSyFZ6EBLj/4HHuBvf7RavebywHufC33QcknXV8CmFUS0epbCiN6xk5OkIX
 21gC+lyIbiJ5Z0TOAEXWoyEOZhVUONiwa07xxwvDBDZH/aR26C7Fui0oibvXqL8E
 PFGYi3mj1pdsnmT+a47NgP4GJ0eUFeiRe4EPU2JGEBUl5qckjTyEHyDbim7oQBYO
 jprh0fKDQXW9qvwiSe9UvwOAHWUv5C3MsQhQnda3zZjubPtfqhX7lBzszWyRmbby
 tMh/A==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47n1d91up4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Jul 2025 16:29:40 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.125) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Jul 2025 16:29:39 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
References: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Clear runtime PM errors while
 resetting the GPU
Message-ID: <175164297965.68064.9466068700510801982.b4-ty@imgtec.com>
Date: Fri, 4 Jul 2025 16:29:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.7.125]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 2yiag1doPMQYHXMUnLETdw98OiuFh3ou
X-Proofpoint-GUID: 2yiag1doPMQYHXMUnLETdw98OiuFh3ou
X-Authority-Analysis: v=2.4 cv=JNM7s9Kb c=1 sm=1 tr=0 ts=6867f364 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=fFtJDOQOLN4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=r_1tXGB3AAAA:8
 a=FLNaFda3mgrzrB3-JzIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OCBTYWx0ZWRfX+iCJwlH/rUVU
 U7p/r9hzZ7rqnWKRM4X7xabKi58WfbAciKFrAmvo5bfSn+/Me8Fzacf1yYoFVicF9ng9R2ewyTi
 co564QGB8+e4NoUuRLNkY5VMxGcSU4w69e9E41VbmkfIF8AAytDtylX06AagH44WZYZhgvpv77f
 9Bz/k1pMSmkgQxKdkGlyWEnnZUXZ9L0pQNV6cheiD/3HFvW+tJQBvEONsGVqCPTd4nD9l+KBrqf
 /2j6ZXpe6Jx/jtXNIMSqRWgXK5SCKZtZ9cEZfzEk0yotpAS13pl8cCQCeMsnWD/1EzGIsiAQnrF
 qCTaODFDMYTa/dUuxRVzOh1CfsaYVyfzRvD2jiSbq74FGgHQzPC272sJmpPyn2hQWwEARS9dB6B
 J1wErhSz
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


On Tue, 24 Jun 2025 16:01:31 +0100, Alessio Belle wrote:
> The runtime PM might be left in error state if one of the callbacks
> returned an error, e.g. if the (auto)suspend callback failed following
> a firmware crash.
> 
> When that happens, any further attempt to acquire or release a power
> reference will then also fail, making it impossible to do anything else
> with the GPU. The driver logic will eventually reach the reset code.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Clear runtime PM errors while resetting the GPU
      commit: 551507e0d0bf32ce1d7d27533c4b98307380804c

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

