Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F46FBF8A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 08:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B3110E32C;
	Tue,  9 May 2023 06:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DCD10E32C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 06:49:38 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D63791F4B7;
 Tue,  9 May 2023 08:49:32 +0200 (CEST)
Date: Tue, 9 May 2023 08:49:31 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/dpu: Set DATA_COMPRESS for
 command mode
Message-ID: <shb54ebrjuhl5xqhlbb2vlilnwckzm5x2wan7sa3sl2deyqjfg@3xjfe7txpbn6>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
 <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
 <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
 <f99c5891-5d46-b39e-929a-00aedb068fb5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f99c5891-5d46-b39e-929a-00aedb068fb5@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-08 17:00:12, Jessica Zhang wrote:
> On 5/8/2023 4:17 PM, Jessica Zhang wrote:
> > On 5/7/2023 9:06 AM, Marijn Suijten wrote:
> >> On 2023-05-05 14:23:51, Jessica Zhang wrote:
> >>> Add a DPU INTF op to set DATA_COMPRESS register for command mode 
> >>> panels if
> >>> the DPU_INTF_DATA_COMPRESS feature flag is set. This flag needs to be
> >>> enabled in order for DSC v1.2 to work.
> >>>
> >>> Note: These changes are for command mode only. Video mode changes will
> >>> be posted along with the DSC v1.2 support for DP.
> >>
> >> Nit: the "command mode" parts of both paragraphs only apply to the call
> >> in dpu_encoder_phys_cmd, right?  If so, and the INTF op remains the same
> >> for video mode (but only the call needs to be added to the
> >> dpu_encoder_phy_vid), make this a bit more clear in your commit message.
> 
> (Sorry, forgot to address this comment in my initial reply)
> 
> The op will be available for video mode to use, but most likely video 
> mode will set DATA_COMPRESS (or call dpu_hw_intf_enable_compression()) 
> directly in dpu_hw_intf_setup_timing_engine().

Sounsds good, if you can clarify something along those lines so that it
is clear that the call is valid on video mode too, and that the callback
is also available there.

e.g. 
- Drop "for command mode panels" from "op to set DATA_COMPRESS
  register";
- "Note: the op is currently called for command-mode encoders only,
  video mode changes..."

Thanks!

- Marijn
