Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C327CD052EC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02310E20C;
	Thu,  8 Jan 2026 17:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKg1kNbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7210E20C;
 Thu,  8 Jan 2026 17:49:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54E836012B;
 Thu,  8 Jan 2026 17:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5788C116C6;
 Thu,  8 Jan 2026 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767894597;
 bh=yHXzZ4miF7zh5XwZfOW7e/mH9PaCOotHUPX6zGX/Uos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKg1kNbfR7AwjZlLXGLigURd6geItf/1jIcBGUAQTH+bRwf8/Q8/8CCSOmoky3qX9
 KeCK9KH5x9DbICdcKOqRZ1OVmeysHblEGw8bOMB/mbaJhvC2Sgntiej5Bxg+PI/6UZ
 XKG9QlGnN9x5K8l7FBDByJLSV7CNjc70R4MOJIKhLbvS5x8c7jGYKNVthyuwGTIn7B
 +Xi6C3MjUPd2vMQ1Od3L4DUL9pV0nYQJH/mIxKLcneX+0l65StmljCEt4qE1caNvUJ
 /9Aa4J99EJG+sPw+bYcAVPcWLUephad2ahlaEJV9ncUZCNpzuwxV5HOmszziUICAB8
 0C0w6a1tJRVkA==
Date: Thu, 8 Jan 2026 11:49:54 -0600
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
Message-ID: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
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

On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > To make sure the correct settings for a given DRAM configuration get
> > applied, attempt to retrieve that data from SMEM (which happens to be
> > what the BSP kernel does, albeit with through convoluted means of the
> > bootloader altering the DT with this data).
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > ---
> > I'm not sure about this approach - perhaps a global variable storing
> > the selected config, which would then be non-const would be better?
> 
> I'd prefer if const data was const, split HBB to a separate API.
> 

I agree, but I'd prefer to avoid a separate API for it.

Instead I'd like to either return the struct by value (after updating
the hbb), but we then loose the ability to return errors, or by changing
the signature to:

int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)

This costs us an additional 16 bytes in each client (as the pointer is
replaced with the data), but I think it's a cleaner API.

Regards,
Bjorn
