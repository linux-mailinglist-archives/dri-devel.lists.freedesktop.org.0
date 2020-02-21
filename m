Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB7D166C42
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 02:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C086EE8C;
	Fri, 21 Feb 2020 01:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A156EE8B;
 Fri, 21 Feb 2020 01:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/cOEVBI8Ana3rokcKVhMHfoLg+7M1HtqCIMEQr4WsvcFOTk+9ei4RUWhwpW+rjmMAK+2SbAjbEr3kLv3Ik/3uNorglcrw826uwrybft/Htmy5eOktWkI3KtsQ4Z4f6909DDT0CH1rkkpad6KH8GO/hYXXX3UFfPlXDxugSkCjQwP0Xh3b00SwbiNCrfggcezY6GVncdjEzLu/W1OC3ZyBRJHvFlsxvwBSr2Q1iK0YyCJbJn6WW1ILw9i9C6imgKHHXMT+M49aiKguYwYKIyP65LSacIJS1RIw4m0sp/hyvfMc+L34eJ7RVqX7uoUsjMEyVt8jLJawVzgDTVxGchiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tr+sGfrJkFHbydv3G1yX2Uew5eNc4zBSmbUsesRsKE=;
 b=M0csE6za++34aCcOMhWkxmDS8qR1OVmP/SU0WC/tuq2bcgbccISSFy8OLtRAe7a6CLwO8G1uPMXWc7NuiExeMN6eJZi4TnOJhcLwux/faeactPxCuJrwPGmX0vNkC7/4vDqjjkSyWrlHTaQteJBCSSRQaY21QTiADnHzhmZMSWl3YDgrzILsRtrfYh+mJPlfpWXsl3hh8G6M+djYRV6Kw3jeuArxK8VK7nW3Hv+WiwP/zxyktOHC21XAP9WavkCwaRe6vDbc4XkSqeNaAR74X0SPTHXoBW+YTN4WCMFRjVgwiIQUel/fElJx8pQ98GTCg9iPyrwZmnMVT23MWk7lVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tr+sGfrJkFHbydv3G1yX2Uew5eNc4zBSmbUsesRsKE=;
 b=FHiEVk6tIH7aq/0ALz9SVCicGSsr+1cK1jAe1u4dn+fjmu4LLGVEILrZKrHDPAemZUqtuv0zuHfsvTvOhLP9767MvUS+nBL0asTHia/LiDRYqSMAVqVhGXUMA45Vnnn2LDvZukeCj99lRT6pvOPgRv0pSVgG5bPRATiAaRj2JvA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26)
 by DM6PR12MB3913.namprd12.prod.outlook.com (2603:10b6:5:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 21 Feb
 2020 01:22:44 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd%6]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 01:22:44 +0000
Subject: Re: [PATCH 4/8] drm/nouveau: don't use ttm bo->offset v3
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-5-nirmoy.das@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <bb500a8b-8d63-896f-ad4f-e2583349e210@amd.com>
Date: Thu, 20 Feb 2020 20:22:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200219135322.56463-5-nirmoy.das@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
Received: from [10.252.35.64] (165.204.54.211) by
 YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Fri, 21 Feb 2020 01:22:42 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9382226-6fc4-404c-d308-08d7b66c8d38
X-MS-TrafficTypeDiagnostic: DM6PR12MB3913:|DM6PR12MB3913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3913FA744E4B5D78C5812ED899120@DM6PR12MB3913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(26005)(86362001)(8676002)(16576012)(81156014)(478600001)(81166006)(31696002)(316002)(186003)(8936002)(16526019)(45080400002)(30864003)(966005)(5660300002)(2906002)(2616005)(36756003)(7416002)(66946007)(6486002)(31686004)(4326008)(53546011)(44832011)(66476007)(52116002)(66556008)(956004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3913;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Y0nqB6kJrma1sp5szVqGZHWLtHqrW0oR+VuuqXGWzdlbSeWcjpT1+4AGJO/Ky6dY/RtbNorq+a59JKsZfS7RM/3onAhH5ddmFVqJwSlO4MO060RowUcJ8+FXAKWifOKRuM2mJnc4QCFRlSJwr556kOUF/qF3BuXtAvbpfncukpCXeWGcDnF1sVDiub4/JPTx8F5kq917lKMlJSt+GCSKEjrjMEtQy6kl45Jh8C8JtHeTLSltqxV4ZswG9f2H+Co+rp2B/MYHOleMRthGPcBLXCvcqbw/pgbQOtpNMf5rbXbpMsViHIsIxXBm517wj+Ryty+YNOtHnAVwwGbMfeJYJDm4FTmHmbsvISJB5p0iWzbiM7w9lI9SKsoM3bYblp2PNnlAkM+Gv7s9cLT+rs9hJPQWILZ5wGc3bTCTyT6qqkKbW5f5zMwLF1uRVexYE1Tq9qcciaMV9jxrGUn53uQz4Bygl731/MkPjRPYuq6Jg1o+0jpy0sTcwlQP6NvBMfxwdTgqlIgpLIjPjcC5ZejtQ==
X-MS-Exchange-AntiSpam-MessageData: 13uibPoY5eDepMn8+bEik/tvmggut8SN7yKAsKE1JgWzbUa2bZamJgEPkG9WoevpJ7nU4j7klb9PCXYSf+PImw71mWwCx7xSaVwty5jq6jg+Un7WHkYUS7jDgq2AcKkptR2b5ZAmBmHBrVcXm12vaQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9382226-6fc4-404c-d308-08d7b66c8d38
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 01:22:44.0248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rxtj3ehvHGeduhIEXPIAj7Ghst37IpKOJJS7Cm9oaf1hOpMhD0mw3PT8E5JDPEjd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3913
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-19 08:53, Nirmoy Das wrote:
> Store ttm bo->offset in struct nouveau_bo instead.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 +++---
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 +++---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 ++++----
>  drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++++
>  drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++++-----
>  15 files changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 1f08de4241e0..d06a93f2b38a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -845,7 +845,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
>  		fb = nouveau_framebuffer(crtc->primary->fb);
>  	}
> 
> -	nv_crtc->fb.offset = fb->nvbo->bo.offset;
> +	nv_crtc->fb.offset = fb->nvbo->offset;
> 
>  	if (nv_crtc->lut.depth != drm_fb->format->depth) {
>  		nv_crtc->lut.depth = drm_fb->format->depth;
> @@ -1013,7 +1013,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
>  		nv04_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
> 
>  	nouveau_bo_unmap(cursor);
> -	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->bo.offset;
> +	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->offset;
>  	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
>  	nv_crtc->cursor.show(nv_crtc, true);
>  out:
> @@ -1191,7 +1191,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>  	/* Initialize a page flip struct */
>  	*s = (struct nv04_page_flip_state)
>  		{ { }, event, crtc, fb->format->cpp[0] * 8, fb->pitches[0],
> -		  new_bo->bo.offset };
> +		  new_bo->offset };
> 
>  	/* Keep vblanks on during flip, for the target crtc of this flip */
>  	drm_crtc_vblank_get(crtc);
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index 44ee82d0c9b6..89a4ddfcc55f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -151,7 +151,7 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
>  			continue;
> 
>  		if (nv_crtc->cursor.set_offset)
> -			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->bo.offset);
> +			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->offset);
>  		nv_crtc->cursor.set_pos(nv_crtc, nv_crtc->cursor_saved_x,
>  						 nv_crtc->cursor_saved_y);
>  	}
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index a3a0a73ae8ab..9529bd9053e7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -150,7 +150,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>  	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
> 
>  	nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
> -	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
> +	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->offset);
>  	nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
>  	nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
>  	nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
> @@ -172,7 +172,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>  	if (format & NV_PVIDEO_FORMAT_PLANAR) {
>  		nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
>  		nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
> -			nv_fb->nvbo->bo.offset + fb->offsets[1]);
> +			nv_fb->nvbo->offset + fb->offsets[1]);
>  	}
>  	nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
>  	nvif_wr32(dev, NV_PVIDEO_STOP, 0);
> @@ -396,7 +396,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
> 
>  	for (i = 0; i < 2; i++) {
>  		nvif_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
> -			  nv_fb->nvbo->bo.offset);
> +			  nv_fb->nvbo->offset);
>  		nvif_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i,
>  			  fb->pitches[0]);
>  		nvif_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index 00a85f1e1a4a..67829f04b2c7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -274,7 +274,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
> 
>  	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>  			       &oclass, head, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>  	if (ret) {
>  		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> index e7fcfa6e6467..793dcb2ea196 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> @@ -99,7 +99,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
> 
>  	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>  			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &core->chan);
> +			       disp->sync->offset, &core->chan);
>  	if (ret) {
>  		NV_ERROR(drm, "core%04x allocation failed: %d\n", oclass, ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> index 8ccd96113bad..4cce1078140a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> @@ -186,7 +186,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
> 
>  	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>  			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>  	if (ret) {
>  		NV_ERROR(drm, "ovly%04x allocation failed: %d\n", oclass, ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 890315291b01..e90ffa4a5230 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -509,7 +509,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  	}
> 
>  	asyw->state.fence = dma_resv_get_excl_rcu(fb->nvbo->bo.base.resv);
> -	asyw->image.offset[0] = fb->nvbo->bo.offset;
> +	asyw->image.offset[0] = fb->nvbo->offset;
> 
>  	if (wndw->func->prepare) {
>  		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> index b92dc3461bbd..bb84e4d54a33 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> @@ -298,7 +298,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
> 
>  	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>  			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>  	if (ret) {
>  		NV_ERROR(drm, "qndw%04x allocation failed: %d\n", oclass, ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index e2bae1424502..c32a8ca67f82 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -558,13 +558,13 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>  	if (drm->agp.bridge) {
>  		args.target = NV_DMA_V0_TARGET_AGP;
>  		args.access = NV_DMA_V0_ACCESS_RDWR;
> -		args.start += drm->agp.base + chan->ntfy->bo.offset;
> -		args.limit += drm->agp.base + chan->ntfy->bo.offset;
> +		args.start += drm->agp.base + chan->ntfy->offset;
> +		args.limit += drm->agp.base + chan->ntfy->offset;
>  	} else {
>  		args.target = NV_DMA_V0_TARGET_VM;
>  		args.access = NV_DMA_V0_ACCESS_RDWR;
> -		args.start += chan->ntfy->bo.offset;
> -		args.limit += chan->ntfy->bo.offset;
> +		args.start += chan->ntfy->offset;
> +		args.limit += chan->ntfy->offset;
>  	}
> 
>  	client->route = NVDRM_OBJECT_ABI16;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 2b4b21b02e40..b7a9b9e85355 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1317,6 +1317,14 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
>  			nouveau_vma_unmap(vma);
>  		}
>  	}
> +
> +	if(new_reg) {

LKCS wants a space after a C keyword: "if (".

https://www.kernel.org/doc/html/v4.10/process/coding-style.html#spaces

Regards,
Luben

> +		if (new_reg->mm_node)
> +			nvbo->offset = (new_reg->start << PAGE_SHIFT);
> +		else
> +			nvbo->offset = 0;
> +	}
> +
>  }
> 
>  static int
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
> index 38f9d8350963..e944b4aa5547 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -24,6 +24,9 @@ struct nouveau_bo {
>  	int pbbo_index;
>  	bool validate_mapped;
> 
> +	/* GPU address space is independent of CPU word size */
> +	uint64_t offset;
> +
>  	struct list_head vma_list;
> 
>  	unsigned contig:1;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index d9381a053169..3d71dfcb2fde 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -162,7 +162,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
>  	 * pushbuf lives in, this is because the GEM code requires that
>  	 * we be able to call out to other (indirect) push buffers
>  	 */
> -	chan->push.addr = chan->push.buffer->bo.offset;
> +	chan->push.addr = chan->push.buffer->offset;
> 
>  	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
>  		ret = nouveau_vma_new(chan->push.buffer, chan->vmm,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 0ad5d87b5a8e..475ed53b99f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -89,7 +89,7 @@ static unsigned long nouveau_dmem_page_addr(struct page *page)
>  	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
>  	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
> 
> -	return (idx << PAGE_SHIFT) + chunk->bo->bo.offset;
> +	return (idx << PAGE_SHIFT) + chunk->bo->offset;
>  }
> 
>  static void nouveau_dmem_page_free(struct page *page)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 0c5cdda3c336..508b118c0953 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
> 
>  	/* To allow resizeing without swapping buffers */
>  	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
> -		fb->base.width, fb->base.height, fb->nvbo->bo.offset, nvbo);
> +		fb->base.width, fb->base.height, fb->nvbo->offset, nvbo);
> 
>  	vga_switcheroo_client_fb_set(dev->pdev, info);
>  	return 0;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index f5ece1f94973..cadff37eade8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -232,7 +232,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
>  		rep->domain = NOUVEAU_GEM_DOMAIN_GART;
>  	else
>  		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
> -	rep->offset = nvbo->bo.offset;
> +	rep->offset = nvbo->offset;
>  	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50) {
>  		vma = nouveau_vma_find(nvbo, vmm);
>  		if (!vma)
> @@ -516,7 +516,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
>  		}
> 
>  		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
> -			if (nvbo->bo.offset == b->presumed.offset &&
> +			if (nvbo->offset == b->presumed.offset &&
>  			    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
>  			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
>  			     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
> @@ -527,7 +527,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
>  				b->presumed.domain = NOUVEAU_GEM_DOMAIN_GART;
>  			else
>  				b->presumed.domain = NOUVEAU_GEM_DOMAIN_VRAM;
> -			b->presumed.offset = nvbo->bo.offset;
> +			b->presumed.offset = nvbo->offset;
>  			b->presumed.valid = 0;
>  			relocs++;
>  		}
> @@ -805,7 +805,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>  			struct nouveau_bo *nvbo = (void *)(unsigned long)
>  				bo[push[i].bo_index].user_priv;
> 
> -			OUT_RING(chan, (nvbo->bo.offset + push[i].offset) | 2);
> +			OUT_RING(chan, (nvbo->offset + push[i].offset) | 2);
>  			OUT_RING(chan, 0);
>  		}
>  	} else {
> @@ -840,7 +840,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>  			}
> 
>  			OUT_RING(chan, 0x20000000 |
> -				      (nvbo->bo.offset + push[i].offset));
> +				      (nvbo->offset + push[i].offset));
>  			OUT_RING(chan, 0);
>  			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
>  				OUT_RING(chan, 0);
> --
> 2.25.0
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C2d69616c9f5c473d149308d7b542bb7b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637177170570012927&amp;sdata=bATVFqGPVQiqoDjWJSUDZujqG5HRDhKw3M11ykMbgaE%3D&amp;reserved=0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
