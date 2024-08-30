Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664D966C18
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8925010EAE9;
	Fri, 30 Aug 2024 22:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="ZCb3ubIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 17:42:32 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B810EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:42:32 +0000 (UTC)
Message-ID: <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
 s=default; t=1725039397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z8u6d0217V5Y/FNALKuOgpP9nl8oH/BQ1NaMD7vo7Q=;
 b=ZCb3ubIvTlPDtoBTf/DvHqLb7WEGL8/gB9SLOThcW8kMMmmCkvtnmQgKfyFZQdurXp8L3f
 3wjZnevzcNpeQ84NCNtcMk7RcM+VBPqVyiEc2mXruLxmL0/hoYU33eNylk++XXx5XSS0eB
 K3P98H5FM2yMTgepxqpRe5lOXtmfiKM=
Date: Fri, 30 Aug 2024 19:36:32 +0200
MIME-Version: 1.0
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Leonard Lausen <leonard@lausen.nl>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

Dear Dmitry,

For context, I have a Lenovo Yoga Slim 7x laptop, and was having issues 
with the display staying black after sleep. As a workaround, I could 
switch to a different VT and back.

> [ 1185.831970] [dpu error]connector not connected 3

I can confirm that I was seeing this exact error message as well.

>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> -	} else if (conn_state->connector->status != connector_status_connected) {
> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> -		return -EINVAL;
>   	}
>   
>   	crtc = conn_state->crtc;

After applying this patch, the screen now resumes successfully, and the 
errors are gone.

(For future reference, I am using this kernel: 
https://github.com/jhovold/linux/commits/wip/x1e80100-6.11-rc5/, commit 
cc2cb95cc77fec43edd407c993122085fa8c2dd7.)

Tested-by: György Kurucz <me@kuruczgy.com>

Best regards,
György
