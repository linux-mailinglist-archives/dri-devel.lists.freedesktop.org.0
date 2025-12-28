Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33BCE4A56
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 09:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BB8112F1F;
	Sun, 28 Dec 2025 08:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GypS8CuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3281.qiye.163.com (mail-m3281.qiye.163.com
 [220.197.32.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8C112F1F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 08:58:23 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2ec8cc6f1;
 Sun, 28 Dec 2025 16:53:15 +0800 (GMT+08:00)
Message-ID: <2a492d96-44b2-476a-9adf-644ce061073b@rock-chips.com>
Date: Sun, 28 Dec 2025 16:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Apply DP helper APIs to do link train
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251110085823.1197472-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251110085823.1197472-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9b64296e4903a3kunme557d35f1c0e76
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1CTVZIGRpDSx5MThpOHx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=GypS8CuPE2+lvs3Ucb52/WtBLhVx2N6tzQ/RuN3ORK1z1nAI76oK6bgljepZrIjomBpLRPetR+Fh3VJFBaYBRwZWJwOkvOAY4uT9Fg4BYpsIsLksjz5nA1y2ZhsFcA+LIvLrchm0+YJUE3JeDsAd3E8BHZ9rktw03ve9HAYMun0=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=mquczp2fALVbclEBtdxIeHK4pLTEOPFeF5t6fF+VQCE=;
 h=date:mime-version:subject:message-id:from;
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

On 11/10/2025 4:58 PM, Damon Ding wrote:
> Use the existing DP helper APIs instead of repeated self-defined
> interfaces with the same functions. It can help make codes more
> concise.
> 
> Damon Ding (4):
>    drm/bridge: analogix_dp: Apply DP helper API
>      drm_dp_dpcd_read_link_status()
>    drm/bridge: analogix_dp: Apply DP helper API
>      drm_dp_clock_recovery_ok()
>    drm/bridge: analogix_dp: Apply DP helper API drm_dp_channel_eq_ok()
>    drm/bridge: analogix_dp: Apply DP helper APIs to get adjusted voltages
>      and pre-emphasises
> 
>   .../drm/bridge/analogix/analogix_dp_core.c    | 123 +++---------------
>   1 file changed, 18 insertions(+), 105 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Update Tested-by tag.
> 
> Changes in v3:
> - Update Reviewed-by tag.
> 

Gentle ping.

The patches in v3 already have reviewed and tested tags. Could this 
series be applied?

Best regards,
Damon
