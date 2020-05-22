Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5851DEE1D
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 19:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E296E197;
	Fri, 22 May 2020 17:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10C86E197;
 Fri, 22 May 2020 17:22:46 +0000 (UTC)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C958D206C3;
 Fri, 22 May 2020 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590168166;
 bh=+UXZQwfEnFZd4EW9Ome4HVj9Xjqma2zwTir5fmlya1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0fxmFlzEjIQFqm/XLuLZvBvgmZZ4P/r2dua4DmOBSPbSD//Lr5grBTuGCOLt0oy7
 Yxq1H2WPFmVsh040JvskRu3TzA0OKNNkNDgdvYN0UKf+aZAMe4Yw0pSMn069BVHpZK
 Cz80vznWgKwkFQY+psno6S4FND+imLrvVZh03MI4=
Date: Fri, 22 May 2020 12:27:36 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/radeon/dpm: Replace one-element array and use
 struct_size() helper
Message-ID: <20200522172736.GE29907@embeddedor>
References: <20200522012547.GA6783@embeddedor>
 <753faa45-247c-536c-d85a-5c1385ed0049@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <753faa45-247c-536c-d85a-5c1385ed0049@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 09:00:09AM +0200, Christian K=F6nig wrote:
> > +++ b/drivers/gpu/drm/radeon/ni_dpm.c
> > @@ -2685,11 +2685,12 @@ static int ni_upload_sw_state(struct radeon_dev=
ice *rdev,
> >   	struct rv7xx_power_info *pi =3D rv770_get_pi(rdev);
> >   	u16 address =3D pi->state_table_start +
> >   		offsetof(NISLANDS_SMC_STATETABLE, driverState);
> > -	u16 state_size =3D sizeof(NISLANDS_SMC_SWSTATE) +
> > -		((NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1) * sizeof(NISL=
ANDS_SMC_HW_PERFORMANCE_LEVEL));
> > +	NISLANDS_SMC_SWSTATE *smc_state;
> > +	u16 state_size =3D struct_size(smc_state, levels,
> > +			NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE);
> =

> Probably better to use size_t instead of u16 here. With that fixed feel f=
ree
> to stick my rb on the patch.
> =


Sure thing. I'll send v2, shortly.

Thanks, Christian.
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
