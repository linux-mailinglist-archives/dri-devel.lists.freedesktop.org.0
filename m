Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9490AD67
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E81010E182;
	Mon, 17 Jun 2024 11:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j998YShG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C710E377
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:55:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so49047011fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718625325; x=1719230125; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BTP9DM7co0CqG/PyEvgqiBat1H97eczrXBXnO7IsIQ0=;
 b=j998YShGrdlFe2mJ2q44QSVj3GrrOZ/8FlyvwEJFTp0hyAg7b2U3BzgEQa3T0gSV3i
 XrvSCsiXWkem92dQKwCHyl3kihXUr+8KvQc/q7Rg7nl09QvvsGJFtcpIVGGo3gOogoH0
 zvbvY2vrZ2HYNx3BzT2rDqDfJDpkY/dOFF1K8piaHA7/CqSJ4tEPezBU9IBgZW6e4z2T
 NzLAn3rv7zrr5fN4KK8PaMYvGYiuIhD3lBHN0M37wACBbHIKPGmCVm8lpNkJT7cKdT+o
 7MXeLWuAmzfo6qGVDofHFHt2Ow4ukr8odneqFzIt0LrKxj+WZ8ckwre8uRYGrV4caX5h
 ru6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718625325; x=1719230125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTP9DM7co0CqG/PyEvgqiBat1H97eczrXBXnO7IsIQ0=;
 b=D4J8jg2PRUBrGtCNlmZ3N4XJ8c6mArrcs9ihPvd3FjRsKY+CeuoW/l/VxTqGMb4tbz
 BWzGGnQevTbSirzJem5cW+gZdY2GjdDQkLQ0HTd+8s5EaCmrrKUrfDwc0CFoVkm3dTr5
 kRvLH4AGphab5naeSoeB0DVhWPlP05pTxPcQxcVMciCKbXlwxTENWdDgqB0S3hejujHH
 uxDuiOlNYj//I1VBSZvFGlrJecivuST6H7ronF09fjBCwXdGnydet3DnNd+3GBwW6b79
 4UtPGtDmZJpOfPMIk4CZwY6rcWIV39PChq6PE8+ycQRdxmx2TSn68aKRNCoLIOcy4xZe
 lBsQ==
X-Gm-Message-State: AOJu0Yw6P76iEneBMsw1th6M31TsLBHrWcWIwe0e4ApRMfsiPgDYqnr6
 KTr4qsNHH/HkqlMD+hR/m++33g87lDtfTzAeVRDA9lecjHL+9Fx+94G2JKM/8dw=
X-Google-Smtp-Source: AGHT+IFLaKeMhww3DPJ8alINmerXwIJfdEn65l/MZqsr/LBdFmg8y/Oix9ULNXsk0CIZxIubiFcLig==
X-Received: by 2002:a2e:9a8b:0:b0:2ec:c8:2755 with SMTP id
 38308e7fff4ca-2ec0e5d085amr57141031fa.24.1718625324912; 
 Mon, 17 Jun 2024 04:55:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c8b0ebsm13614061fa.121.2024.06.17.04.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 04:55:24 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:55:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jean Delvare <jdelvare@suse.de>, Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617132348.5f20bf89@endymion.delvare>
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

On Mon, Jun 17, 2024 at 01:23:48PM GMT, Jean Delvare wrote:
> Hi Dmitry,
> 
> Thanks for your feedback.
> 
> On Mon, 17 Jun 2024 12:57:19 +0300, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:
> > > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > > is possible to test-build any driver which depends on OF on any
> > > architecture by explicitly selecting OF. Therefore depending on
> > > COMPILE_TEST as an alternative is no longer needed.  
> > 
> > The goal of this clause is to allow build-testing the driver with OF
> > being disabled (meaning that some of OF functions are stubbed and some
> > might disappear). I don't see how user-selectable OF provides the same
> > result.
> 
> Historically, the goal of this clause *was* to allow build-testing the
> driver on architectures which did not support OF, and that did make
> sense back then. As I understand it, building the driver without OF
> support was never a goal per se (if it was, then the driver wouldn't be
> set to depend on OF in the first place).
> 
> Some of my other submissions include the following explanation which
> you might find useful (I ended up stripping it on resubmission after
> being told I was being too verbose, but maybe it was needed after all):
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.

This doesn't seem to match the COMPILE_TEST usage that I observe in
other places. For example, we frequently use 'depends on ARCH_QCOM ||
COMPILE_TEST'. Which means that the driver itself doesn't make sense
without ARCH_QCOM, but we want for it to be tested on non-ARCH_QCOM
cases. I think the same logic applies to 'depends on OF ||
COMPILE_TEST' clauses. The driver (DP AUX bus) depends on OF to be fully
functional, but it should be compilable even without OF case.

I'll let Douglas (in cc) comment if my understanding is incorrect.

-- 
With best wishes
Dmitry
