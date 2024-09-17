Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6E97B0F1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 15:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F15610E47D;
	Tue, 17 Sep 2024 13:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MqMdtRRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F4710E47D;
 Tue, 17 Sep 2024 13:47:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01E43A4164C;
 Tue, 17 Sep 2024 13:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AF5C4CEC5;
 Tue, 17 Sep 2024 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726580835;
 bh=7y6lHUpzj4ENEmnHvaebsCoZS+iyBAZnVBKU3B6lWDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MqMdtRRZV63AnQHWPtxOTGhHtWlxc1KhYE0chiME/JxAPNt0dL+J9PwCVMjLgITC3
 JwVuprAk32FrR4PtfFncK/8RNYTSI0uIfqyQAk7IVrs9IR9bQd8qhyK4ACpNUxFble
 NCw4Joz4goylRplx33CNtvyZYwIoOq8hOWQyoiymF/EZ+7BDM00AoX/cLpNdu4zItA
 I01I0V5yKd21Z5yXy7+kjAN2rLwGopNRzEPF5DFB5XqzviNUBL6iktN/zqzifAqJlK
 r5B0tptlap2UpngcqoqQ1eluLD6uV/xZjZ+fMg+oR+T4HeVmd5b/fZQI/KaHS+fN65
 i6BsaaAGgMpjA==
Message-ID: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
Date: Tue, 17 Sep 2024 15:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240913195132.8282-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240913195132.8282-1-robdclark@gmail.com>
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

On 13.09.2024 9:51 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> devices (x1-85, possibly others), it seems to pass that barrier while
> there are still things in the event completion FIFO waiting to be
> written back to memory.

Can we try to force-fault around here on other GPUs and perhaps
limit this workaround?

Akhil, do we have any insight on this?

Konrad
