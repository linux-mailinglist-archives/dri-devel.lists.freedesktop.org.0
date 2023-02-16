Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD502699F24
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 22:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAB010E1A0;
	Thu, 16 Feb 2023 21:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCB010E38B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 21:47:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 911AC3F623;
 Thu, 16 Feb 2023 22:46:57 +0100 (CET)
Date: Thu, 16 Feb 2023 22:46:55 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Read previously-uninitialized SSPP
 scaler version from hw
Message-ID: <20230216214655.a3ajtegqwattn2rt@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 phone-devel@vger.kernel.org
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
 <CAA8EJpq1L32VQ1eQEk2YQWqCwHgdFQfuWPhQx=PmhzXvazLgPA@mail.gmail.com>
 <20230216083119.6ispk2xhahhzn5sx@SoMainline.org>
 <305a468a-d792-4f51-5a7a-bf38b9c685eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305a468a-d792-4f51-5a7a-bf38b9c685eb@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-16 18:34:43, Dmitry Baryshkov wrote:
> On 16/02/2023 10:31, Marijn Suijten wrote:
> > On 2023-02-16 04:22:13, Dmitry Baryshkov wrote:
> >> On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
> >> <marijn.suijten@somainline.org> wrote:
> >>>
> >>> DPU's catalog never assigned dpu_scaler_blk::version leading to
> >>> initialization code in dpu_hw_setup_scaler3 to wander the wrong
> >>> codepaths.  Instead of hardcoding the correct QSEED algorithm version,
> >>> read it back from a hardware register.
> >>>
> >>> Note that this register is only available starting with QSEED3, where
> >>> 0x1002 corresponds to QSEED3, 0x2004 to QSEED3LITE and 0x3000 to QSEED4.
> >>
> >> This is not purely accurate. 0x1003 (sdm845) also corresponds to QSEED3.
> >> I'd say instead that there are several variations of QSEED3 scalers,
> >> where starting from 0x2004 it is called QSEED3LITE and starting from
> >> 0x3000 it is called QSEED4.
> > 
> > Good catch, I'll update that.
> > 
> >>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> >>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 8 +++++++-
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 3 +++
> >>>   3 files changed, 10 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> index ddab9caebb18..96ce1766f4a1 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> @@ -324,11 +324,9 @@ struct dpu_src_blk {
> >>>   /**
> >>>    * struct dpu_scaler_blk: Scaler information
> >>>    * @info:   HW register and features supported by this sub-blk
> >>> - * @version: qseed block revision
> >>>    */
> >>>   struct dpu_scaler_blk {
> >>>          DPU_HW_SUBBLK_INFO;
> >>> -       u32 version;
> >>
> >> No. Please keep the version in the scaler subblk.  It is a version of
> >> the QSEED (scaler block), not the SSPP's version.
> > 
> > You are right that the new variable in the parent (SSPP) block is
> > nondescriptive and should have been named scaler_version.
> > 
> > However.
> > 
> > dpu_scaler_blk is only used as a const static struct in the catalog,
> > meaning we cannot (should not!) store a runtime-read register value
> > here.  Instead I followed your IRC suggestion to read the register in
> > dpu_hw_sspp_init, but my original implementation called
> > dpu_hw_get_scaler3_ver in _dpu_hw_sspp_setup_scaler3 where we already
> > have access to the subblk_offset, allowing us to delete
> > _dpu_hw_sspp_get_scaler3_ver.  Would you rather have that?  We don't
> > need the register value anywhere else.
> 
> After giving it another thought, let's follow the vendor's approach and 
> store the predefined scaler_version in hw catalog (in dpu_scaler_blk, as 
> it currently is). This way we can still drop all QSEED3/3LITE/4 
> crazyness, while keeping the data sane.

You want to drop the descriptive #define's, and replace them with magic
0x1002/0x2004/0x3000 and whatever other values we know?  That seems
impossible to port without reading back the register value, which we've
only done for a handful of SoCs.  I hope I'm misunderstanding you?
After all the vendor approach (in a random 4.14 kernel I have open now)
is to read the register value at runtime but their catalog is also
dynamic and built at runtime based on version ranges and register reads,
which sometimes is more sensible.  Ours is const.

> Then _dpu_hw_sspp_get_scaler3_ver() can also be dropped (or you can use 
> it as a safety guard while doing dpu_hw_sspp init).

That (safety guard) is exactly what Abhinav requested against, since the
kernel (and our catalog) should be trustworthy.  I'll let you two fight
this out and come to a consensus before sending v2.

> >> There is a block called DS (destination scaler), which can be used to
> >> scale the resulting image after the LM. This block also uses the
> >> QSEED3(,LITE,4) scaler block.
> > 
> > Is this already supported in mainline, and is it the reason for
> > previously having qseed_type globally available?  Is my understanding
> > correct that this scaler subblk in the SSPP is merely an interface to
> > it, allowing the same hardware to be used from the SSPP for intputs and
> > after the LM for outputs?
> 
> No, I think qseed_type is a leftover from having the same thing 
> implemented in three different ways. Maybe because of NIH syndrome?

Could be, downstream uses it to steer its catalog logic for example
(which happens before later reading the version register).

> DS is not supported, it was removed in the commit 
> b033def8741aab3fb58e4bf6c1d5cd73b3beb357. I do not have a clear usecase 
> for this block and of course we don't have uABI for it.

Is there no common DRM property to composite at a lower resolution and
upscale the final displayed image to match a CRTC/encoder?  I wish I
understood the commit message better :)

> It would still be nice to keep it in the picture though. It was the main 
> reason for moving scaler code from dpu_hw_sspp to dpu_hw_util.

Downstream SDE already has this code moved to sde_hw_util as far as I
can see (and SSPP and DS call into it).  But I fully agree as a
mostly-oblivious-outsider: it seems like there are a lot of features,
hardware blocks and optimizations not implemented, things which I still
have no knowledge/experience/understanding of/about.  Let's first focus
on making it work _on all relevant SoCs and boards_ though :)

- Marijn
