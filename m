Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4535973F78
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9784E10E8B2;
	Tue, 10 Sep 2024 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="TK2UKA0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9D10E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 17:28:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ABmRVG026944;
 Tue, 10 Sep 2024 19:28:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=LPcqWQK585FTA09IXMoe7dAv
 hjuyVFvkXrm8oqa/JDw=; b=TK2UKA0GJ+VSG4eXsasS8mf6P8ZbKUrR5zB5121m
 mTF6Q7I9xWoU+JmvlPtpbP7tS3m4JUoMMaLWLMGavkrHTRG7het9V9cpc8QVlhK7
 Xosz/FlovhL76E3jDN9Xs+ylhRnORDCVIDzOGFOCSHNNINzXLVgPQqQoZrrOlqh+
 eQy7WUrUaTAf6aRWMBEygNWVPdD7kKWDJ+1ep8gQJ0Mdc5DdSgz6Gw7v7eJlUsYV
 8m9MhNvocNrHq+R6W/E6A/xCo2qKG0fmLYogqvTfj1esKiq6bJJnNQZ01yplRpCf
 fvPCCt41t5HmperAsUi3u041s6at//hrE4KrtZeLn9LLlg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41h0cyjse2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 19:28:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 89D8340046;
 Tue, 10 Sep 2024 19:26:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2C012786E4;
 Tue, 10 Sep 2024 19:25:53 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Sep
 2024 19:25:53 +0200
Date: Tue, 10 Sep 2024 19:25:43 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ma Ke <make24@iscas.ac.cn>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <akpm@linux-foundation.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <alain.volmat@foss.st.com>
Subject: Re: [PATCH RESEND] drm/sti: avoid potential dereference of error
 pointers
Message-ID: <20240910172543.GA3518200@gnbcxd0016.gnb.st.com>
References: <20240826052652.2565521-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240826052652.2565521-1-make24@iscas.ac.cn>
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

Thanks for your patch.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Mon, Aug 26, 2024 at 01:26:52PM +0800, Ma Ke wrote:
> The return value of drm_atomic_get_crtc_state() needs to be
> checked. To avoid use of error pointer 'crtc_state' in case
> of the failure.
> 
> Cc: stable@vger.kernel.org
> Fixes: dec92020671c ("drm: Use the state pointer directly in planes atomic_check")
> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/sti/sti_cursor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
> index db0a1eb53532..e460f5ba2d87 100644
> --- a/drivers/gpu/drm/sti/sti_cursor.c
> +++ b/drivers/gpu/drm/sti/sti_cursor.c
> @@ -200,6 +200,8 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
>  		return 0;
>  
>  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
>  	mode = &crtc_state->mode;
>  	dst_x = new_plane_state->crtc_x;
>  	dst_y = new_plane_state->crtc_y;
> -- 
> 2.25.1
> 
