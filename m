Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD996735E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 23:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFA710E033;
	Sat, 31 Aug 2024 21:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="Epo4RKkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F9A10E033
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:50:55 +0000 (UTC)
Message-ID: <1f6676ae-62bf-40e1-b93c-463fa7d04cef@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
 s=default; t=1725141053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTTxbm5FRKBWZJPjYUBnkFj2GnM7Zwi1RSotZuqKSv0=;
 b=Epo4RKkbvgj0Pu3nc0WR0rnBMIqrltiBcOrQH60nPt+RmBRL4pTlEiqvDdGCqzQHLaQphA
 GxHcqdRBReY4Aby9hey2tRCLxkBRnlBjht5nKuPUJHYsGx3htSfPomMuRmcijkhmf5e5VH
 LA00B8U2KZCkpHSIrjeY0l+AmXfD9pU=
Date: Sat, 31 Aug 2024 23:50:50 +0200
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
 <56bf547a-08a5-4a08-87a9-c65f94416ef3@kuruczgy.com>
 <9d359542-bd16-4aba-88a8-0bdea1c1de44@lausen.nl>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <9d359542-bd16-4aba-88a8-0bdea1c1de44@lausen.nl>
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

I installed KDE. First, I ran it with the my regular kernel without this 
patch. The first interesting thing I notice is that the screen *does* 
come back after resume. (The error messages are still present though.)

> Ack. Do you mean that Rob Clark also uses Yoga Slim 7x but does not face the "screen never comes back (always have to switch VT back-and-forth to bring it back)" issue?

Yes, at least that's what I gathered from our conversations on IRC. But 
with the above in mind, I now suspect that this comes down to desktop 
environment differences.

> It would be great if you can validate whether this patch breaks CRTC state (which includes the CTM state) on Yoga Slim 7x, or whether that is specific to the trogdor lazor (Chromebook Acer Spin 513), though it may require you to install KDE.

Well "Night Light" seems to be even more broken under KDE. I went into 
System Settings, set it to "Always on night light", and tried to adjust 
the temperature slider. While adjusting the slider, the screen goes 
black, and only comes back after a few seconds. The color temperature 
does not change, no matter what I change the slider to. Afterwards I 
tried with this patch as well, but it produces the exact same behavior.

Best regards,
György
