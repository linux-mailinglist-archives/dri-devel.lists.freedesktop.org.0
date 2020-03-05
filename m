Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99B17A670
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 14:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE94E6EBC0;
	Thu,  5 Mar 2020 13:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA746E326;
 Thu,  5 Mar 2020 13:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccmvgWkqv/cia6B5VNDoB0uVQ+GW03LtXZWjtjewZiXdVOoZSDGBCed3CphM4MukAvFtF80tbdkUp3PELwyqbQURCWbMOAolcjBYdicRW/BTPqAp/TtOD1xC0hP/okZ1XfEfnitfWHq5L/6tfnEAnnQveLEblWXbJ2wLgHpL7BhL8mFRA43kYtmlPgHj6SOKy7gTymzaaLw6s+u2/CCiI0rokgaaoVaVCLbEZyqe4MW9++sIPoF9AmAOq4Ikrac2fe2i5I7GMMun3t4TlHNa4/If7YyllIvm5RDeRNHiSe6B98qObBfqxmhbL3+Js+YzlBsr6lm9KbXWXjDZab7YaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQMJqLOdazGOb1eVeM7tNkWKk31vabEYA3l9d+W4dD4=;
 b=Z06J4ojE1L4YLWRRLTP3UTgl1vuJRk8V67YSPnxRdJJcudGOCbNE6vBHhoscZ01h8Fd5YfO8fkw3+/X2mAgGGybZZC6IBNChnxs4ilxWitSlqrY1W02OAvpjU4EkeKkyBm4WDRrhKtvNRuxHjo2Eh/Sc9JOMEEFvs6m1QsfHjSPF9CXmP2eMFgEmjG46CHjB2PcMood/BY2iTeQiARcnhjkYzDjgsTu78+0+xOMZnx5X3WuHXqc1VhJNXDmCnAC82sI3JtGY2u+YPoICGuCYuPKDebEiiqcPshAEd8BMBiFWtbe6HXQUO6PZ7J/Oiu1afZv37OlngSKaEJW44hZauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQMJqLOdazGOb1eVeM7tNkWKk31vabEYA3l9d+W4dD4=;
 b=dzMHCmjUbaMUPwtNn/F51C8RHaM3GKz7m1x80iokH97u8XIzITAYcjnz+x/j1ZlOTHv+iC+dWqDdnVhk6vml7tAkWQNwDWIVwkFapTSbarSKHVRyDLRXsIkmlppQMy26A7/9a0c67PXHkMabUePe++XqiKfR2Xxf7lgRPDSYvTg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1369.namprd12.prod.outlook.com (2603:10b6:3:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Thu, 5 Mar
 2020 13:34:01 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 13:34:01 +0000
Subject: Re: [PATCH 4/8] drm/nouveau: don't use ttm bo->offset v3
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-5-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b8fc1925-ae06-8885-c751-2e038a49cead@amd.com>
Date: Thu, 5 Mar 2020 14:33:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200305132910.17515-5-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::48) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0080.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Thu, 5 Mar 2020 13:33:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 730251b7-eb2c-4c9b-ed3b-08d7c109dd64
X-MS-TrafficTypeDiagnostic: DM5PR12MB1369:|DM5PR12MB1369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1369D531FE121565744F6E2D83E20@DM5PR12MB1369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(316002)(52116002)(4326008)(478600001)(2906002)(31686004)(86362001)(31696002)(7416002)(36756003)(5660300002)(16526019)(2616005)(6666004)(30864003)(186003)(8676002)(8936002)(81156014)(66476007)(6486002)(81166006)(66556008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1369;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuzwWeZlI50QBUX5SsG9VhLRucSaJH4aaJ95MJceQhwHxibyKZEuiGFZ//rZjmqQLdBT7ZaWLuypVrBrRdDEmruag+UfJ+NiGiSuJCEj05uF1XFdVhrjhBTH0DlMLQjlN8E9DF9wOpNIa/yxsHT/4SOPP04sYwPTZNuQNYHmC0KvsVHYtejcs0QumEmfLg3d5tlpbQeFwVROXJNwCjc4PhEfSt162a7V+iGt5GKe96s/LA7gXKeqtRzRG0XlAWaqVW22R+kfLhfivogfztcc0dynoEvMs1W3pDnDAx4Hk4wbQeEDTdKDCwvsqMut25jEpOml2I5edm0Bs4WvyhskDbSXBwUaAeQDvBIKzkBXtHRAFIjzolosBRrTHrTHbn+RjazFAXf5LFccSIUP6sMNt6nQRJNKDBAhH5EvbA83A/NVNLKcuGz936ejxeoi9wIt
X-MS-Exchange-AntiSpam-MessageData: jJISHCBLICtRKXimjKGEwTYwpsNJtrcevkkHw5AiEYrZV/cqVsrjiM4UcV611y6pcOgHaqnnqBXCd1eLKlEs+KcIdajH0qopxoMHdy5eDunIOOWSmitp2/hyyOTrChJRvnzFtvI3e2PU48RqM33OK1+yemTs2WOuYlsm4TIVAAVTJor3HM/SKjOujVm7CzQJr/1aFGzbGz935u73Pm/+Xw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730251b7-eb2c-4c9b-ed3b-08d7c109dd64
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 13:34:01.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4S2Af9uehIgrlaIrqN5pvDLFjxynJoeq5CZCizmAg9PA6HUxMwGwExXRTtkjRqG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1369
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
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.03.20 um 14:29 schrieb Nirmoy Das:
> Store ttm bo->offset in struct nouveau_bo instead.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Looks like this is the only patch without an rb or at least acked-by. 
Can anybody comment or at least throw a quick tested-by on it?

With that done I would say I would pick this series up for inclusion 
into drm-misc-next.

Regards,
Christian.

> ---
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 +++---
>   drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>   drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 +++---
>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 ++++----
>   drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++++
>   drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>   drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++++-----
>   15 files changed, 35 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 1f08de4241e0..d06a93f2b38a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -845,7 +845,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
>   		fb = nouveau_framebuffer(crtc->primary->fb);
>   	}
>   
> -	nv_crtc->fb.offset = fb->nvbo->bo.offset;
> +	nv_crtc->fb.offset = fb->nvbo->offset;
>   
>   	if (nv_crtc->lut.depth != drm_fb->format->depth) {
>   		nv_crtc->lut.depth = drm_fb->format->depth;
> @@ -1013,7 +1013,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
>   		nv04_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
>   
>   	nouveau_bo_unmap(cursor);
> -	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->bo.offset;
> +	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->offset;
>   	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
>   	nv_crtc->cursor.show(nv_crtc, true);
>   out:
> @@ -1191,7 +1191,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>   	/* Initialize a page flip struct */
>   	*s = (struct nv04_page_flip_state)
>   		{ { }, event, crtc, fb->format->cpp[0] * 8, fb->pitches[0],
> -		  new_bo->bo.offset };
> +		  new_bo->offset };
>   
>   	/* Keep vblanks on during flip, for the target crtc of this flip */
>   	drm_crtc_vblank_get(crtc);
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index 44ee82d0c9b6..89a4ddfcc55f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -151,7 +151,7 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
>   			continue;
>   
>   		if (nv_crtc->cursor.set_offset)
> -			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->bo.offset);
> +			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->offset);
>   		nv_crtc->cursor.set_pos(nv_crtc, nv_crtc->cursor_saved_x,
>   						 nv_crtc->cursor_saved_y);
>   	}
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index a3a0a73ae8ab..9529bd9053e7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -150,7 +150,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>   	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
>   
>   	nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
> -	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
> +	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->offset);
>   	nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
>   	nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
>   	nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
> @@ -172,7 +172,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>   	if (format & NV_PVIDEO_FORMAT_PLANAR) {
>   		nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
>   		nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
> -			nv_fb->nvbo->bo.offset + fb->offsets[1]);
> +			nv_fb->nvbo->offset + fb->offsets[1]);
>   	}
>   	nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
>   	nvif_wr32(dev, NV_PVIDEO_STOP, 0);
> @@ -396,7 +396,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>   
>   	for (i = 0; i < 2; i++) {
>   		nvif_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
> -			  nv_fb->nvbo->bo.offset);
> +			  nv_fb->nvbo->offset);
>   		nvif_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i,
>   			  fb->pitches[0]);
>   		nvif_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index 00a85f1e1a4a..67829f04b2c7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -274,7 +274,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
>   
>   	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>   			       &oclass, head, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>   	if (ret) {
>   		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> index e7fcfa6e6467..793dcb2ea196 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> @@ -99,7 +99,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
>   
>   	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>   			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &core->chan);
> +			       disp->sync->offset, &core->chan);
>   	if (ret) {
>   		NV_ERROR(drm, "core%04x allocation failed: %d\n", oclass, ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> index 8ccd96113bad..4cce1078140a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> @@ -186,7 +186,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
>   
>   	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>   			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>   	if (ret) {
>   		NV_ERROR(drm, "ovly%04x allocation failed: %d\n", oclass, ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 890315291b01..e90ffa4a5230 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -509,7 +509,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>   	}
>   
>   	asyw->state.fence = dma_resv_get_excl_rcu(fb->nvbo->bo.base.resv);
> -	asyw->image.offset[0] = fb->nvbo->bo.offset;
> +	asyw->image.offset[0] = fb->nvbo->offset;
>   
>   	if (wndw->func->prepare) {
>   		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> index b92dc3461bbd..bb84e4d54a33 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> @@ -298,7 +298,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
>   
>   	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
>   			       &oclass, 0, &args, sizeof(args),
> -			       disp->sync->bo.offset, &wndw->wndw);
> +			       disp->sync->offset, &wndw->wndw);
>   	if (ret) {
>   		NV_ERROR(drm, "qndw%04x allocation failed: %d\n", oclass, ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index e2bae1424502..c32a8ca67f82 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -558,13 +558,13 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>   	if (drm->agp.bridge) {
>   		args.target = NV_DMA_V0_TARGET_AGP;
>   		args.access = NV_DMA_V0_ACCESS_RDWR;
> -		args.start += drm->agp.base + chan->ntfy->bo.offset;
> -		args.limit += drm->agp.base + chan->ntfy->bo.offset;
> +		args.start += drm->agp.base + chan->ntfy->offset;
> +		args.limit += drm->agp.base + chan->ntfy->offset;
>   	} else {
>   		args.target = NV_DMA_V0_TARGET_VM;
>   		args.access = NV_DMA_V0_ACCESS_RDWR;
> -		args.start += chan->ntfy->bo.offset;
> -		args.limit += chan->ntfy->bo.offset;
> +		args.start += chan->ntfy->offset;
> +		args.limit += chan->ntfy->offset;
>   	}
>   
>   	client->route = NVDRM_OBJECT_ABI16;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 2b4b21b02e40..b7a9b9e85355 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1317,6 +1317,14 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
>   			nouveau_vma_unmap(vma);
>   		}
>   	}
> +
> +	if(new_reg) {
> +		if (new_reg->mm_node)
> +			nvbo->offset = (new_reg->start << PAGE_SHIFT);
> +		else
> +			nvbo->offset = 0;
> +	}
> +
>   }
>   
>   static int
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
> index 38f9d8350963..e944b4aa5547 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -24,6 +24,9 @@ struct nouveau_bo {
>   	int pbbo_index;
>   	bool validate_mapped;
>   
> +	/* GPU address space is independent of CPU word size */
> +	uint64_t offset;
> +
>   	struct list_head vma_list;
>   
>   	unsigned contig:1;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index d9381a053169..3d71dfcb2fde 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -162,7 +162,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
>   	 * pushbuf lives in, this is because the GEM code requires that
>   	 * we be able to call out to other (indirect) push buffers
>   	 */
> -	chan->push.addr = chan->push.buffer->bo.offset;
> +	chan->push.addr = chan->push.buffer->offset;
>   
>   	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
>   		ret = nouveau_vma_new(chan->push.buffer, chan->vmm,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 0ad5d87b5a8e..475ed53b99f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -89,7 +89,7 @@ static unsigned long nouveau_dmem_page_addr(struct page *page)
>   	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
>   	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
>   
> -	return (idx << PAGE_SHIFT) + chunk->bo->bo.offset;
> +	return (idx << PAGE_SHIFT) + chunk->bo->offset;
>   }
>   
>   static void nouveau_dmem_page_free(struct page *page)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 0c5cdda3c336..508b118c0953 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>   
>   	/* To allow resizeing without swapping buffers */
>   	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
> -		fb->base.width, fb->base.height, fb->nvbo->bo.offset, nvbo);
> +		fb->base.width, fb->base.height, fb->nvbo->offset, nvbo);
>   
>   	vga_switcheroo_client_fb_set(dev->pdev, info);
>   	return 0;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index f5ece1f94973..cadff37eade8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -232,7 +232,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
>   		rep->domain = NOUVEAU_GEM_DOMAIN_GART;
>   	else
>   		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
> -	rep->offset = nvbo->bo.offset;
> +	rep->offset = nvbo->offset;
>   	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50) {
>   		vma = nouveau_vma_find(nvbo, vmm);
>   		if (!vma)
> @@ -516,7 +516,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
>   		}
>   
>   		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
> -			if (nvbo->bo.offset == b->presumed.offset &&
> +			if (nvbo->offset == b->presumed.offset &&
>   			    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
>   			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
>   			     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
> @@ -527,7 +527,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
>   				b->presumed.domain = NOUVEAU_GEM_DOMAIN_GART;
>   			else
>   				b->presumed.domain = NOUVEAU_GEM_DOMAIN_VRAM;
> -			b->presumed.offset = nvbo->bo.offset;
> +			b->presumed.offset = nvbo->offset;
>   			b->presumed.valid = 0;
>   			relocs++;
>   		}
> @@ -805,7 +805,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   			struct nouveau_bo *nvbo = (void *)(unsigned long)
>   				bo[push[i].bo_index].user_priv;
>   
> -			OUT_RING(chan, (nvbo->bo.offset + push[i].offset) | 2);
> +			OUT_RING(chan, (nvbo->offset + push[i].offset) | 2);
>   			OUT_RING(chan, 0);
>   		}
>   	} else {
> @@ -840,7 +840,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   			}
>   
>   			OUT_RING(chan, 0x20000000 |
> -				      (nvbo->bo.offset + push[i].offset));
> +				      (nvbo->offset + push[i].offset));
>   			OUT_RING(chan, 0);
>   			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
>   				OUT_RING(chan, 0);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
