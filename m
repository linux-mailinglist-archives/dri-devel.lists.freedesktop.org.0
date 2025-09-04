Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F75B43F73
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4CA10EA6F;
	Thu,  4 Sep 2025 14:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="F2iBe9zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5510EA72
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 14:46:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHj3D3blCz9tFV;
 Thu,  4 Sep 2025 16:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756997176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3GFnHtIblNt4J73Ub9v6dpzDoaywFOdLjrcnDFlhlw=;
 b=F2iBe9zdgFRK2TtiNEprqg+Jymv+RN2AS6WabCLEtHcjyuSYku9hArJ1Xc0XhqALy4lOaR
 e30O4AdWf9E+JT7UAJ2GhQGKJBNJNJX/6YIL824tgVX07kN2wTdSbCROvUHJmHeTciKwCV
 yFASCZV++Xm05PDyCxpqET79B6r8Em6FZusqntwMa9MIQbP5aH34Yc2zMp1+/SE3ZqZDsh
 ZhyYoiz/TrGr3QQlHXgd6HlYBIPc2c0VTnn4WoM59ngfUVLHDkNjik2P7Qdg/49VPia6vB
 DkxFilh8AqD7Hn0Usg1LZTa1nBCpU5h6rD8wEGltJsn+GrpcwIxQx5IGMcPnPw==
Message-ID: <8cc352ee-8279-46c5-901b-e6624156263a@mailbox.org>
Date: Thu, 4 Sep 2025 16:46:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20250321200625.132494-1-marex@denx.de>
 <3372501.aeNJFYEL58@steina-w>
 <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
 <7020337.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7020337.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: k5w75xojfhphx8ai93r4gzgxiibg3nfm
X-MBO-RS-ID: 3e8e287770314cb04a9
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

On 9/4/25 4:39 PM, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 4. September 2025, 15:52:38 CEST schrieb Marek Vasut:
>> On 9/4/25 8:36 AM, Alexander Stein wrote:
>>
>> Hello Alexander,
>>
>>>>> Maybe the GPU remains halted because
>>>>> setting the GLB_HALT stops command stream processing, and the GPU never
>>>>> samples the clearing of GLB_HALT and therefore remains halted forever ?
>>>>
>>>> Exactly that, and that's expected.
>>>
>>> FYI: in a new release of system manager software (starting from lf-6.12.3-1.0.0),
>>> the GPU reset is reasserted in SM software already [1] and access to GPU
>>> block control has been removed from Cortex-A [2]. Starting from B0 step this
>>> version is required AFAIK.
>>
>> I don't think the SM is involved in this, because if I do the following
>> test, the MCU also fails to boot unless I do a reset:
> 
> Is this some other reset than BLK_CTRL_GPUMIX? If so, it might be required.
> Don't know much about internal details though.
Yes

    296	/**
    297	 * panthor_gpu_soft_reset() - Issue a soft-reset
    298	 * @ptdev: Device.
    299	 *
    300	 * Return: 0 on success, a negative error code otherwise.
    301	 */
    302	int panthor_gpu_soft_reset(struct panthor_device *ptdev)
    303	{
    304		bool timedout = false;
    305		unsigned long flags;
    306	
    307		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
    308		if (!drm_WARN_ON(&ptdev->base,
    309				 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
    310			ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
    311			gpu_write(ptdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
    312			gpu_write(ptdev, GPU_CMD, GPU_SOFT_RESET);
    313		}
    314		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
    315	
    316		if (!wait_event_timeout(ptdev->gpu->reqs_acked,
    317					!(ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED),
    318					msecs_to_jiffies(100))) {
    319			spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
    320			if ((ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED) != 0 &&
    321			    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
    322				timedout = true;
    323			else
    324				ptdev->gpu->pending_reqs &= ~GPU_IRQ_RESET_COMPLETED;
    325			spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
    326		}
    327	
    328		if (timedout) {
    329			drm_err(&ptdev->base, "Soft reset timeout");
    330			return -ETIMEDOUT;
    331		}
    332	
    333		return 0;
    334	}
