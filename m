Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F2B5A1CE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C44610E783;
	Tue, 16 Sep 2025 20:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPLfrM8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBEB10E781;
 Tue, 16 Sep 2025 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758053200; x=1789589200;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=2L2ifVhx2cC2n43dBgoVI8nlDzdlP68qFNqQuB9SeMo=;
 b=mPLfrM8xoo/WqU+nxj3lHmdkJ6iAK3y4iBJBfX0Lh2296JfkQRzr5yJ/
 TGdLWvGJ1N6k8yjw5vkoXpQ4WpSWkcWKAG6fQYJTpGN9PKfej6e3OpRiz
 2JootbggzFzPNCL6cmllMG+xiItU0KzGhckR5bmI5Re6E2jVHwklPtfCD
 EgTxaMtqPvyLFPPH+mCmHQdbupkvVJ0TjbVkTl3SWy/XKNB10XS6EnYoN
 lxVSalJ4s0078OLzx7bKK5g2fpMRLrxDbtU+Dp24Dvyl8KXo0LtpdRXe2
 rVN26O4r84/gr0LuLJliD+D1r0uQMuc4vkM/ArtCEq2QSU0iW/6IzycJS w==;
X-CSE-ConnectionGUID: 2TcRkqisSauR767qpzPwnA==
X-CSE-MsgGUID: tdsvsGLeQs+foq/m5Qf0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60416160"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60416160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:06:39 -0700
X-CSE-ConnectionGUID: Km8MnseATi21fZFNolLQ9A==
X-CSE-MsgGUID: Syo8K809TWChhGHYySzFLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="179339828"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.138])
 ([10.245.245.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:06:37 -0700
Message-ID: <a28534edd2c0d496317869a6f85d199d6fbfef54.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/5] drm/xe/pf: Add a helper function to get a VF's
 backing object in LMEM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 16 Sep 2025 22:06:34 +0200
In-Reply-To: <20250915072428.1712837-4-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-4-vivek.kasireddy@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Mon, 2025-09-15 at 00:21 -0700, Vivek Kasireddy wrote:
> To properly import a dmabuf that is associated with a VF (or that
> originates in a Guest VM that includes a VF), we need to know where
> in LMEM the VF's allocated regions exist. Therefore, introduce a
> new helper to return the object that backs the VF's regions in LMEM.
>=20
> v2:
> - Make the helper return the LMEM object instead of the start address
>=20
> v3:
> - Move the declaration of the helper under other lmem helpers
> (Michal)

In XeKMD we're typically using VRAM instead of LMEM, IMO we should try
to be consistent with this.

>=20
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23
> ++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |=C2=A0 1 +
> =C2=A02 files changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6344b5205c08..1bfcd35cc8ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1535,6 +1535,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct
> xe_gt *gt, unsigned int vfid)
> =C2=A0	return size;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_gt_sriov_pf_config_get_lmem_obj - Get VF's LMEM BO.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: BO that is backing VF's quota in LMEM.
> + */
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
> +						 unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config;
> +	struct xe_bo *lmem_obj;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	config =3D pf_pick_vf_config(gt, vfid);
> +	lmem_obj =3D config->lmem_obj;

Bump the reference count? I think Matt mentioned this as well?

> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return lmem_obj;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
> =C2=A0 * @gt: the &xe_gt (can't be media)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575..bbc5c238cbf6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt
> *gt, unsigned int vfid, u64 size
> =C2=A0int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned
> int vfid, unsigned int num_vfs);
> =C2=A0int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned
> int vfid, unsigned int num_vfs,
> =C2=A0					u64 size);
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
> unsigned int vfid);
> =C2=A0
> =C2=A0u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt,
> unsigned int vfid);
> =C2=A0int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt,
> unsigned int vfid, u32 exec_quantum);

