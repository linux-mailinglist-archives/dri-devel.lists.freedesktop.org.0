Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABB973FB5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 19:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7A10E8B3;
	Tue, 10 Sep 2024 17:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="muuZ7fOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC610E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 17:32:08 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AGx2pQ002705;
 Tue, 10 Sep 2024 19:31:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=6ws8DZHi3fGww8Oc+C3Gn/62
 lB+b6V2NTWERTjva7Os=; b=muuZ7fOSWhUxNay+jXU8tahr27iS4oGdalKlgCAv
 GFP2EyAP7u4ESgKDDy9Fe4wj+XaqCRfQv3gJt4+83wKVkbpEZIImPS24USD4tude
 PlZK35AjO++fSCYpVvga43B0RJLa+5Z9UEs+7vSwZyqkT4acTYx3vMoi4Tr6oGeU
 u7D7NDhWzROllyPFxqClxSIZKcgBBm3melPjWTmyZnYthVfM+Itv9ZOj+jaBCRPm
 QwIXAcvyll/EPRN1EXnAfXhOAJC+083UCH+bFJ/9PPigTu49fOJu6Na/e1UsoyNI
 Y7uVbmL04DSgaPvQdIGAgEYo/dvK6f0pz5v5VcwjtX3AJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41h1sgafs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 19:31:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDC9240049;
 Tue, 10 Sep 2024 19:30:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E84527D535;
 Tue, 10 Sep 2024 19:26:54 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Sep
 2024 19:26:53 +0200
Date: Tue, 10 Sep 2024 19:26:52 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ma Ke <make24@iscas.ac.cn>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <benjamin.gaignard@linaro.org>, <vincent.abriou@st.com>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 <alain.volmat@foss.st.com>
Subject: Re: [PATCH RESEND] drm/sti: avoid potential dereference of error
 pointers in sti_gdp_atomic_check
Message-ID: <20240910172652.GB3518200@gnbcxd0016.gnb.st.com>
References: <20240909063359.1197065-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909063359.1197065-1-make24@iscas.ac.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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

Hi,

Thank you for your patch.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Mon, Sep 09, 2024 at 02:33:59PM +0800, Ma Ke wrote:
> The return value of drm_atomic_get_crtc_state() needs to be
> checked. To avoid use of error pointer 'crtc_state' in case
> of the failure.
> 
> Cc: stable@vger.kernel.org
> Fixes: dd86dc2f9ae1 ("drm/sti: implement atomic_check for the planes")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/sti/sti_gdp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
> index 43c72c2604a0..f046f5f7ad25 100644
> --- a/drivers/gpu/drm/sti/sti_gdp.c
> +++ b/drivers/gpu/drm/sti/sti_gdp.c
> @@ -638,6 +638,9 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
>  
>  	mixer = to_sti_mixer(crtc);
>  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
>  	mode = &crtc_state->mode;
>  	dst_x = new_plane_state->crtc_x;
>  	dst_y = new_plane_state->crtc_y;
> -- 
> 2.25.1
> 
