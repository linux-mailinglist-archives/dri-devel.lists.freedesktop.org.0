Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BD6949DB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011310E5D4;
	Mon, 13 Feb 2023 15:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499CD10E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 15:02:30 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D91E01F55E;
 Mon, 13 Feb 2023 16:02:27 +0100 (CET)
Date: Mon, 13 Feb 2023 16:02:26 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 05/10] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Message-ID: <20230213150226.du27ocydnyrkvuin@SoMainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-6-konrad.dybcio@linaro.org>
 <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
 <e6653ceb-bce1-9552-019d-278f455ba8a5@linaro.org>
 <20230213143148.qvyagudd3qm5jgwd@SoMainline.org>
 <e3c1a048-a9e1-53fa-5a19-cba62e8b1580@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c1a048-a9e1-53fa-5a19-cba62e8b1580@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-13 16:40:56, Dmitry Baryshkov wrote:
> On 13/02/2023 16:31, Marijn Suijten wrote:
> > On 2023-02-13 13:38:33, Dmitry Baryshkov wrote:
> >> On 13/02/2023 13:12, Marijn Suijten wrote:
> >>> On 2023-02-11 13:26:51, Konrad Dybcio wrote:
> >>>> These blocks are of variable length on different SoCs. Set the
> >>>> correct values where I was able to retrieve it from downstream
> >>>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
> >>>> intf) otherwise.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 242 +++++++++---------
> >>>>    1 file changed, 121 insertions(+), 121 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> index 802050118345..d9ef1e133c1e 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> [..]
> >>>> @@ -1848,10 +1848,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
> >>>>    /*************************************************************
> >>>>     * INTF sub blocks config
> >>>>     *************************************************************/
> >>>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> >>>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> >>>
> >>> Dmitry and I discussed in #freedreno to instead add the INTF_BLK_DSI_TE
> >>> macro that accounts for the INTF TE registers using this higher register
> >>> area, as well as an extended signature to configure extra interrupts.
> >>
> >> Yes, that's still the plan. It's slightly painful that we are touching
> >> this are simultaneously.
> > 
> > Should we (Konrad) then drop this patch as there's no need to add these
> > (mostly RAZ/WI) registers to the dump until my INTF TE series starts
> > using them?  That'll make rebasing easier on everyone too.
> 
> RAZ/WI is for not present registers (read-as-zero/write-ignore). I think 
> that the growing register space is getting populated with registers 
> (which we have been ignoring up to now).

They are, but not until my INTF TE series lands; hence again the request
to drop this patch until that happens?

- Marijn
