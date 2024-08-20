Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21789583FD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22A310E6B9;
	Tue, 20 Aug 2024 10:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5meRtdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9391810E6B8;
 Tue, 20 Aug 2024 10:18:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01A7B60DE1;
 Tue, 20 Aug 2024 10:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DC8C4AF0B;
 Tue, 20 Aug 2024 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724149127;
 bh=iLG40Q2AHLIVrku5jyBHXVAf9G9PJDBm/KoBNZ8yUwI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=c5meRtdKTdaxQiOUyFVtpQ7XmUaFJEsD2An6yi9uDidjxc3iBbNwo4UAMbMHXlWax
 Mv7M4xcFPjIhs9pAxjaMIl8mhnZtyl7xXhyr/2LXVVKRPtXOl6jNc9lAgiwyUM5IzP
 x5X0YIyycRsLgimSjwnHzOfRVPIesPpWh1A7uycpAW35SrG5i2SYEDbQSjuZKHB2tY
 8XzvN5i10c2iGnFAaK5fvQqr/WhzAE1TCXQcT2nbk/hjdxvgOnLdEhHUPOGmFbkRD+
 EisVak9k6q7QWLsJr9gxBKHCNb345cBsr3IzhpFn5+J2o686nlUZ9qIBn405HLP0fA
 DazX7wTAKydHw==
Message-ID: <5e911abd-6681-4c44-8b97-2d263f4bb13a@kernel.org>
Date: Tue, 20 Aug 2024 12:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
From: Konrad Dybcio <konradybcio@kernel.org>
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
 <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Content-Language: en-US
In-Reply-To: <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 20.08.2024 12:16 PM, Konrad Dybcio wrote:
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
>> Some userspace changes are necessary so add a flag for userspace to
>> advertise support for preemption.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
> 
> Squash this into the "add preemption" patch, or add the flag earlier
> (probably the latter, as that one is already big enough)
> 
> As it stands, just applying patches 1..5 will break GPU IIUC.. and
> that's no bueno for running git bisect

Or not, since the ring number isn't increased until the next one..

Konrad
