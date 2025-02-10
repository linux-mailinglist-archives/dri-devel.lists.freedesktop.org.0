Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476EA2E68E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 09:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C2F10E068;
	Mon, 10 Feb 2025 08:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="hFTG77JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 560 seconds by postgrey-1.36 at gabe;
 Mon, 10 Feb 2025 03:42:23 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441E10E116;
 Mon, 10 Feb 2025 03:42:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Yrr4C4hG0z9sc4;
 Mon, 10 Feb 2025 04:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1739158939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9z64xaAcptd3m22dbWB7eghov4SGAeR/tFjHud6L30=;
 b=hFTG77JRQ2XMSvS6Ohuu2Mq/JN0NYyUaJMbDj7PvF8vkosVh/hZ9cnqZD9SssHW9JtchFM
 MsxRXIK4WKWCUX9Ycx9Fg31jb06SLk41R6w0Aqxvk2dHV1WT4Z3LBCNWK6e+5p4s9CC3eP
 GZEsebw7rKPjAXTItGCUqHK50zfwhwOVgW2+Ljd7/ZFZ/lgdo/azqCZ31vm0af3OjgTH9T
 QBYMno8tTkt/nIYZ6bPcnU8GRDFi1l3PsikTHGQnU2h6Jxvv2sGVu38hraiaW47ekS2kBO
 9IsLVGY7tXaBD9k8J5+In5hGacRprkCgIiIp/74IX5tPjbZn06nzVwqh5HNfUA==
Date: Sun, 9 Feb 2025 22:42:16 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <ycd7uds73swh2ql42455ifv6fmdpa5sklmldgdfk5y2b5is6jk@etmnysxnenn7>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
 <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
X-Mailman-Approved-At: Mon, 10 Feb 2025 08:37:43 +0000
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

On 25/02/10 05:41AM, Dmitry Baryshkov wrote:
> On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> > There is a possibility for an uninitialized *ret* variable to be
> > returned in some code paths.
> > 
> > Fix this by initializing *ret* to 0.
> > 
> > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >  			       unsigned int num_planes)
> >  {
> >  	unsigned int i;
> > -	int ret;
> > +	int ret = 0;
> 
> Thanks, but I think it better to make the function return ret from
> within the loop and return explicit 0 if there was no error.
Will do, v2 incoming...


> 
> >  
> >  	for (i = 0; i < num_planes; i++) {
> >  		struct drm_plane_state *plane_state = states[i];
> > 
> > ---
> > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > change-id: 20250209-dpu-c3fac78fc617
> > 
> > Best regards,
> > -- 
> > Ethan Carter Edwards <ethan@ethancedwards.com>
> > 
> 
> -- 
> With best wishes
> Dmitry
