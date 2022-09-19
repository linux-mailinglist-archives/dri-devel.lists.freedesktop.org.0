Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B464E5BC561
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 11:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F3B10E5E5;
	Mon, 19 Sep 2022 09:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E3F10E5EB;
 Mon, 19 Sep 2022 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663579852; x=1695115852;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Wm82v0gvwNP1lKdhTEKnO4gPdEPdmnpw+d87R28dzDA=;
 b=gpsKfr19L9Iwb8NPDiIywedg6ShpbAsR3IjCl9fb73Fe2A+APwGg/b3o
 twn61de6w2+0DJvnY8WIukobIITnJPY5kBb6xOMxoVbPlKZP3Nnlpl5s0
 O5jCe68Nvw7PzTXGFB3n3VGWq84jZrvAbaJ1T2tGJbE02S/GvV75XoWCf
 G7ZuLxrCkvGs7WZf6paaGaw1zSK6UY/WSJR6IiKtwkORV5TXZdmjevSok
 K0dLIa3+3/OhOttU6duZzWVMsSrGV99ZUddOZQkRI8LIDCbUCL7ZEmEuR
 4ALlLLzNq4kMnbiL/pBkkBH4Uqw4/pDdG9GryYDeDy7Ukp7BwF8VbXvLu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299343787"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="299343787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 02:30:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="793787602"
Received: from jjohns2-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 02:30:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zheng Wang <1002992920@qq.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry
In-Reply-To: <tencent_ED24158E83CB9885E8BDD173EB5896B51906@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <tencent_ED24158E83CB9885E8BDD173EB5896B51906@qq.com>
Date: Mon, 19 Sep 2022 12:30:33 +0300
Message-ID: <87pmfrpv7q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Sep 2022, Zheng Wang <1002992920@qq.com> wrote:
>  From afe79848cb74cc8e45ab426d13fa2394c87e0422 Mon Sep 17 00:00:00 2001
> From: xmzyshypnc <1002992920@qq.com>
> Date: Fri, 16 Sep 2022 23:48:23 +0800
> Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry
>
> There is a double-free security bug in split_2MB_gtt_entry.
>
> Here is a calling chain :
> ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
>
> If intel_gvt_dma_map_guest_page failed, it will call
> ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> kfree(spt). But the caller does not notice that, and it will call
> ppgtt_free_spt again in error path.
>
> Fix this by only freeing spt in ppgtt_invalidate_spt in good case.
>
> Signed-off-by: xmzyshypnc <1002992920@qq.com>

Please use git send-email. The patch is whitespace broken and line
wrapped, making it unusable.

BR,
Jani.


> ---
>  =C2=A0drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
>  =C2=A01 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index ce0eb03709c3..550519f0acca 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct=20
> intel_vgpu_ppgtt_spt *spt)
>  =C2=A0=C2=A0=C2=A0=C2=A0 return atomic_dec_return(&spt->refcount);
>  =C2=A0}
>
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int=20
> is_error);
>
>  =C2=A0static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu =
*vgpu,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct intel_gvt_gtt_entry *=
e)
> @@ -995,7 +995,7 @@ static int=20
> ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 ops->get_pfn(e));
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENXIO;
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0 return ppgtt_invalidate_spt(s);
> +=C2=A0=C2=A0=C2=A0 return ppgtt_invalidate_spt(s, 0);
>  =C2=A0}
>
>  =C2=A0static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_sp=
t *spt,
> @@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct=20
> intel_vgpu_ppgtt_spt *spt,
>  =C2=A0=C2=A0=C2=A0=C2=A0 intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAG=
E_SHIFT);
>  =C2=A0}
>
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int=20
> is_error)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct intel_vgpu *vgpu =3D spt->vgpu;
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct intel_gvt_gtt_entry e;
> @@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct=20
> intel_vgpu_ppgtt_spt *spt)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>
> -=C2=A0=C2=A0=C2=A0 trace_spt_change(spt->vgpu->id, "release", spt,
> +=C2=A0=C2=A0=C2=A0 if (!is_error) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 trace_spt_change(spt->vgpu->id, "r=
elease", spt,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0spt=
->guest_page.gfn, spt->shadow_page.type);
> -=C2=A0=C2=A0=C2=A0 ppgtt_free_spt(spt);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ppgtt_free_spt(spt);
> +=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>  =C2=A0fail:
>  =C2=A0=C2=A0=C2=A0=C2=A0 gvt_vgpu_err("fail: shadow page %p shadow entry=
 0x%llx type %d\n",
> @@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu=20
> *vgpu,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D intel_gvt_dma_map_gu=
est_page(vgpu, start_gfn + sub_index,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 PAGE_SIZE, &dm=
a_addr);
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (ret) {
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ppgtt_invalidat=
e_spt(spt);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ppgtt_invalidat=
e_spt(spt, 1);
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return re=
t;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 sub_se.val64 =3D se->val64;
> @@ -1393,7 +1395,7 @@ static int ppgtt_handle_guest_entry_removal(struct=
=20
> intel_vgpu_ppgtt_spt *spt,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D -=
ENXIO;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto fail;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D ppgtt_invalidate_spt(s);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D ppgtt_invalidate_spt(s, 0);
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (ret)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto fail;
>  =C2=A0=C2=A0=C2=A0=C2=A0 } else {

--=20
Jani Nikula, Intel Open Source Graphics Center
