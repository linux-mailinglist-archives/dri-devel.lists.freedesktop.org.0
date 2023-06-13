Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8872F5F4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D9610E08E;
	Wed, 14 Jun 2023 07:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5545 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jun 2023 15:40:28 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359D610E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:40:28 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
 by m0047961.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 35DBW7Z7016138
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:08:02 -0400
Date: Tue, 13 Jun 2023 17:07:55 +0300
From: Ian Ray <ian.ray@ge.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon
 hactive aligning
Message-ID: <20230613140755.GA9128@zoo6.em.health.ge.com>
References: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: xYpunfZqBPcjWxUlkdYngmQso4go6uz5
X-Proofpoint-ORIG-GUID: xYpunfZqBPcjWxUlkdYngmQso4go6uz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_16,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130124
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 01:14:56PM +0200, Alexander Stein wrote:
> When hactive is not aligned to 8 pixels, it is aligned accordingly and
> hfront porch needs to be reduced the same amount. Unfortunately the front
> porch is set to the difference rather than reducing it. There are some
> Samsung TVs which can't cope with a front porch of instead of 70.
> 
> Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Tested on the same 1366x768 display hardware that required the original                                                                                                                                                                                                         
fix in commit 94dfec48fca7.                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                
Tested-by: Ian Ray <ian.ray@ge.com>                                                                                                                                                                                                                                             


> ---
> AFAICS ipu_di_adjust_videomode() checks that front porch is big enough to
> reduce the alignment difference.
> 
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> index 1d306f7be9fd..341e9125bf2c 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> @@ -311,7 +311,7 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>                          sig_cfg.mode.hactive, new_hactive);
>  
>                 dev_info(ipu_crtc->dev, "hfront_porch: %u\n", sig_cfg.mode.hfront_porch);
> -               sig_cfg.mode.hfront_porch = new_hactive - sig_cfg.mode.hactive;
> +               sig_cfg.mode.hfront_porch -= new_hactive - sig_cfg.mode.hactive;
>                 dev_info(ipu_crtc->dev, "hfront_porch: %u\n", sig_cfg.mode.hfront_porch);
>                 sig_cfg.mode.hactive = new_hactive;
>         }
> -- 
> 2.34.1
> 
