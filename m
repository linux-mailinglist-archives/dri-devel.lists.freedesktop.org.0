Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59915F404D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 11:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8459610E410;
	Tue,  4 Oct 2022 09:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284710E4C8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 09:51:19 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4972C3F2EB;
 Tue,  4 Oct 2022 11:51:16 +0200 (CEST)
Date: Tue, 4 Oct 2022 11:51:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 0/5] drm: Fix math issues in MSM DSC implementation
Message-ID: <20221004095114.tr2gk76epbycflfa@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <Yzu50ly1AxZwmyvi@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzu50ly1AxZwmyvi@matsya>
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

On 2022-10-04 10:12:58, Vinod Koul wrote:
> On 01-10-22, 21:08, Marijn Suijten wrote:
> > Various removals of complex yet unnecessary math, fixing all uses of
> > drm_dsc_config::bits_per_pixel to deal with the fact that this field
> > includes four fractional bits, and finally an approach for dealing with
> > dsi_host setting negative values in range_bpg_offset, resulting in
> > overflow inside drm_dsc_pps_payload_pack().
> > 
> > Note that updating the static bpg_offset array to limit the size of
> > these negative values to 6 bits changes what would be written to the DPU
> > hardware at register(s) DSC_RANGE_BPG_OFFSET, hence the choice has been
> > made to cover up for this while packing the value into a smaller field
> > instead.
> 
> Thanks for fixing these. I dont have my pixel3 availble but changes lgtm
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Thanks; any comment on the self-review I sent in for patch 3 and 5?

> > Altogether this series is responsible for solving _all_ Display Stream
> > Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
> > smartphone (2880x1440p).
> 
> Does it need two dsi lanes?

This panel has the default of four dsi data lanes enabled:

https://github.com/sonyxperiadev/kernel/blob/f956fbd9a234033bd18234d456a2c32c126b38f3/arch/arm64/boot/dts/qcom/dsi-panel-somc-akatsuki.dtsi#L74-L77

Unless you are referring to dual-dsi (ctrl/phy); this panel doesn't have
a dual connection, but I do have devices on sm8350/sm8450 with a
"4k"@120Hz display that have this, in case you want it to be tested?

However, for the time being I'm focussing on a similar panel (4 data
lanes, single DSI ctrl/phy) on sm8250 which keeps showing corrupted /
garbled data and resulting in ping-pong timeouts.  I haven't yet
confirmed if this is due to the "integration" of the pingpong block with
the intf (since relevant registers and interrupts still seem to be
accessible), a mismatching resource topology, or a misconfiguration
elswhere.  Relevant panel dts if you're interested:

https://github.com/sonyxperiadev/kernel/blob/e70161ec43b147b0b02578d05ab64552fd2df2cd/arch/arm64/boot/dts/somc/dsi-panel-sofef03_m-fhd_plus.dtsi

- Marijn
