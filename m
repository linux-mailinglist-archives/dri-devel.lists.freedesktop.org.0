Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB9D0BC0F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A3810E288;
	Fri,  9 Jan 2026 17:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZvoQCd7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918610E15D;
 Fri,  9 Jan 2026 17:50:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15503600B0;
 Fri,  9 Jan 2026 17:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBBBC4CEF1;
 Fri,  9 Jan 2026 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767981049;
 bh=8PhSao9uMJFk+J0HXROjvaNSIa0Lee+U2jcKlvVBRKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZvoQCd7/+Kz/IUkv1Uht6QGxxBYjZiChBkbaJK7rtKu2AsQ4WRe3WvtkJU2K7jQsm
 xPSk4BNt53pLK4MygnhqndH9UBv3C1xWACokq6K1wRXre9JQeeoBAglYK8Si5XlV72
 5fFiFFTzOkTFp78FL+VvdlDF9GD+kfdzP0vtOlrXt9HgmLBCJRDBCE6/pIQolv6D4l
 E8TOUua4r0e0Czw9RaHKNnaZBlUps9HzEBVD2FzcHqPj3p/MF4FdUwwVBkklb2ymWu
 /R8be/oqNhbd7P0209b9eaq5icvs/ZF1R/BwnHmju2hVzvm+JAtClqyZWJUKv6ryth
 tpniUEbJ8qBLg==
Date: Fri, 9 Jan 2026 11:50:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
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

On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > 
> > > > To make sure the correct settings for a given DRAM configuration get
> > > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > > what the BSP kernel does, albeit with through convoluted means of the
> > > > bootloader altering the DT with this data).
> > > > 
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > 
> > > > ---
> > > > I'm not sure about this approach - perhaps a global variable storing
> > > > the selected config, which would then be non-const would be better?
> > > 
> > > I'd prefer if const data was const, split HBB to a separate API.
> > > 
> > 
> > I agree, but I'd prefer to avoid a separate API for it.
> > 
> > Instead I'd like to either return the struct by value (after updating
> > the hbb), but we then loose the ability to return errors, or by changing
> > the signature to:
> > 
> > int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > 
> > This costs us an additional 16 bytes in each client (as the pointer is
> > replaced with the data), but I think it's a cleaner API.
> 
> What about:
> 
> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> 
> I really want to keep the data as const and, as important, use it as a
> const pointer.
> 

I guess the question is what are you actually trying to achive; my goal
was to keep the base data constant, but I'm guessing that you also want
to retain the "const" classifier in the client's context struct (e.g.
the "mdss" member in struct dpu_kms)

If we're returning the data by value, there's no way for you to mark
it as "const" in the calling code's context object (as by definition you
shouldn't be able to change the value after initializing the object).

You also can't return the data by value and then track it by reference -
as that value lives on the stack. This has the benefit of making the
lifecycle of that object clear (it lives in each client) - but perhaps
not a goal of ours... 

How come the ubwc config is const but the hbb isn't?


If we want both the per-target data to remain const and data in the
client's context to be carrying the const qualifier, the one solution I
can see is:

const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
        const struct qcom_ubwc_cfg_data *data;
        static struct qcom_ubwc_cfg_data cfg;
        int hbb;

        ...

        data = of_machine_get_match_data(qcom_ubwc_configs);
        ...

        hbb = qcom_smem_dram_get_hbb();
	...

        cfg = *data;
        cfg.highest_bank_bit = hbb;

        return &cfg;
}

But we'd need to deal with the race in cfg assignment...

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> 
> -- 
> With best wishes
> Dmitry
