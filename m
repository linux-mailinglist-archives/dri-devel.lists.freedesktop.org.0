Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBF196730E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 20:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3D910E155;
	Sat, 31 Aug 2024 18:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="JxihGx2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Sat, 31 Aug 2024 18:54:31 UTC
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0910E155;
 Sat, 31 Aug 2024 18:54:31 +0000 (UTC)
Message-ID: <56bf547a-08a5-4a08-87a9-c65f94416ef3@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
 s=default; t=1725129996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaG84+/bdNFcK2s0BzGgnXzJQNkNWYStcn1LGw6NrpU=;
 b=JxihGx2lGXxk+1WGBTTuLdHOlldL9esbNFKgrjCnLAABchnfXS1f4YyejhWdaZOvPtciMw
 wN2a2kbxQgedVuJA7mGyVB9uFjzls6GGqwb0CoG0rcQicGxeJYp7R81Djg6V+l4xFEAb5d
 KmV3hpY477EDPzZFKcsB7qgQhSRVy94=
Date: Sat, 31 Aug 2024 20:46:32 +0200
MIME-Version: 1.0
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Leonard Lausen <leonard@lausen.nl>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <0b2286bf-42fc-45dc-a4e0-89f85e97b189@lausen.nl>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <0b2286bf-42fc-45dc-a4e0-89f85e97b189@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Dear Leonard,

> Do you observe this issue on every suspend-resume cycle?

I just did 10 suspend/resume cycles in a row to double check, and 
without this patch the screen never comes back (always have to switch VT 
back-and-forth to bring it back). The

[dpu error]connector not connected 3
[drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-22)

pair of error messages also consistently appears after all resumes.

Though I think e.g. Rob Clark reported that suspend/resume already works 
properly for him without this patch, so this experience is not universal 
on the Yoga Slim 7x.

> On sc7180 lazor, I do observe that this patch deterministically breaks restoring the CRTC state and functionality after resume. Can you please validate if you observe the same on Lenovo Yoga Slim 7x? Specifically, try set Night Light in your desktop environment to "Always On" and observe whether the screen remains in "Night Light" mode after resume. For lazor, "Night Light" is breaks after applying this patch and even manually toggling it off and on after resume does not restore "Night Light" / CRTC functionality.

Unfortunately I cannot test this, as color temperature adjustments seems 
to be completely non-functional for me in the first place. For color 
temperature adjustment, I use gammastep on my machines, which uses 
wlr_gamma_control_unstable_v1 under the hood. It outputs the following 
warnings:

Warning: Zero outputs support gamma adjustment.
Warning: 1/1 output(s) do not support gamma adjustment.

I haven't dug deeper into the cause yet, based on these it seems that 
wlroots isn't detecting the display as being gamma-adjustable in the 
first place.

Best regards,
György
