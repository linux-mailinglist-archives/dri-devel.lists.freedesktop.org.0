Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CC976212
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D09710EAE3;
	Thu, 12 Sep 2024 07:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="GW7WJBQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2176710EAE3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:03:22 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BMuH40012392;
 Thu, 12 Sep 2024 09:03:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=3mki8FvljTnvJDZ5qn4LULmA
 s0UwFtiL5BA99RUWmWs=; b=GW7WJBQRm7G8yIgBLmp9t91VXgIt4WcGpx4cVQM3
 FkiIi4v/2rDrAl+CF44UqFrb6XULXRMEgu6yeFqjKa1w/v2wOXPwvbS+kiteaQJ3
 5Ip2YwN1gg7HAzGbk/29jvjwwkTWCzac/R6VDJGF9C9ZsCT4yd4zBwSot7FeEsV9
 sYoAk9yB2JImyaHbhF7yeOCfCpOTJBGNdaQzy0UmtV1WBHcoPqABgeTL0xDl8MN7
 ryHFM/s8wahv/oEy0kvG7N4wbQAyrQhE/haPVih7ToyyyFgwjIHbvhpgKqKrkHAw
 DVDXy8GrjhuVTN7NISWWodXP6PyqTur0+Tzh6niP1hYAPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41h0cytf9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 09:03:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C19D440045;
 Thu, 12 Sep 2024 09:01:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E98BA24D998;
 Thu, 12 Sep 2024 09:01:29 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Sep
 2024 09:01:29 +0200
Date: Thu, 12 Sep 2024 09:01:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ma Ke <make24@iscas.ac.cn>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <akpm@linux-foundation.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <alain.volmat@foss.st.com>
Subject: Re: [PATCH RESEND] drm/sti: avoid potential dereference of error
 pointers
Message-ID: <20240912070118.GA3783204@gnbcxd0016.gnb.st.com>
References: <20240826052652.2565521-1-make24@iscas.ac.cn>
 <20240910172543.GA3518200@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910172543.GA3518200@gnbcxd0016.gnb.st.com>
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

I probably went a bit fast on the commit message.  It seems to me that
the Fixes line would be probably better with below one instead.

Fixes: dd86dc2f9ae1 ("drm/sti: implement atomic_check for the planes")

The same fix is actually necessary for all planes (cursor / gdp / hqvdp),
which is related to the same original commit.  Hence sti_cursor/sti_gdp
and sti_hqvdp.

Would you be ok to have those 3 fixes within a commit ?

Regards,
Alain

On Tue, Sep 10, 2024 at 07:25:43PM +0200, Alain Volmat wrote:
> Hi,
> 
> Thanks for your patch.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Regards,
> Alain
> 
> On Mon, Aug 26, 2024 at 01:26:52PM +0800, Ma Ke wrote:
> > The return value of drm_atomic_get_crtc_state() needs to be
> > checked. To avoid use of error pointer 'crtc_state' in case
> > of the failure.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: dec92020671c ("drm: Use the state pointer directly in planes atomic_check")
> > 
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >  drivers/gpu/drm/sti/sti_cursor.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
> > index db0a1eb53532..e460f5ba2d87 100644
> > --- a/drivers/gpu/drm/sti/sti_cursor.c
> > +++ b/drivers/gpu/drm/sti/sti_cursor.c
> > @@ -200,6 +200,8 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
> >  		return 0;
> >  
> >  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> >  	mode = &crtc_state->mode;
> >  	dst_x = new_plane_state->crtc_x;
> >  	dst_y = new_plane_state->crtc_y;
> > -- 
> > 2.25.1
> > 
