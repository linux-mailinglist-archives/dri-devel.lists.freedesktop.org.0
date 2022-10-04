Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B35F3C32
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 06:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CF010E430;
	Tue,  4 Oct 2022 04:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DBE10E430;
 Tue,  4 Oct 2022 04:43:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9327B81243;
 Tue,  4 Oct 2022 04:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECE7C433C1;
 Tue,  4 Oct 2022 04:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664858583;
 bh=eYy7EY3wMGZQPeArL+2hroT5fu2zAsiPf6zlIP9+Gm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LwErs2ts4afxfSLyft8B10Lg3CRv3yfwGdn0RW2OozMWrmg6HpA9ebRxLny+aKKNl
 ojMXD2JpInZesbJ5C5dH6v8X5akzAA/PjKH29ojszQdp4omrh4g9jD8HIkv6lVIx6o
 htDoicY1k3fY3qPJ8ieSkRUnT0gitArCGM71VhiHUHHTn1cJB9DQ30yxOM9LhMPvXu
 uAOTAWNlYUfxhGG3pg+o94/mxZBf2EBaVpfPMmIb9k6XY0egzYdYhqZPDxd0S8YLEs
 fdlv5dGGUhf24B0/I15ZuweoCf4kZifJzlhds7tyC65N6caF0T1wCIcK82HzKarQbK
 fIEzbrfEwVgOw==
Date: Tue, 4 Oct 2022 10:12:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 0/5] drm: Fix math issues in MSM DSC implementation
Message-ID: <Yzu50ly1AxZwmyvi@matsya>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001190807.358691-1-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-10-22, 21:08, Marijn Suijten wrote:
> Various removals of complex yet unnecessary math, fixing all uses of
> drm_dsc_config::bits_per_pixel to deal with the fact that this field
> includes four fractional bits, and finally an approach for dealing with
> dsi_host setting negative values in range_bpg_offset, resulting in
> overflow inside drm_dsc_pps_payload_pack().
> 
> Note that updating the static bpg_offset array to limit the size of
> these negative values to 6 bits changes what would be written to the DPU
> hardware at register(s) DSC_RANGE_BPG_OFFSET, hence the choice has been
> made to cover up for this while packing the value into a smaller field
> instead.

Thanks for fixing these. I dont have my pixel3 availble but changes lgtm

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Altogether this series is responsible for solving _all_ Display Stream
> Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
> smartphone (2880x1440p).

Does it need two dsi lanes?

-- 
~Vinod
