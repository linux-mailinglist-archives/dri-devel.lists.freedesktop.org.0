Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60A733BCE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBBC10E11E;
	Fri, 16 Jun 2023 22:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0B410E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:00:05 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B9B7740F37;
 Sat, 17 Jun 2023 00:00:03 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:00:02 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag
 for DPU >= 5.0
Message-ID: <uvfqlaez2jxiacacl7ndhuj4oqjtuboqz42sacxlavcxd3vqtf@hl7rajyglvc2>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <i5trozzoexkm7taojob4c53sajm2w6tnasj2yfzjy3a77oqvw7@wadk7g7op2kp>
 <3791f18c-89f1-f066-38c4-d8d13a3ab611@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3791f18c-89f1-f066-38c4-d8d13a3ab611@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-16 14:06:47, Abhinav Kumar wrote:
> On 6/14/2023 3:49 PM, Marijn Suijten wrote:
> > On 2023-06-14 14:23:38, Marijn Suijten wrote:
> > <snip>
> >> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >> corrupted with this series so something else on this series might be
> >> broken.
> > 
> > Never mind, this was a bad conflict-resolve.  Jessica's original
> > BURST_MODE patch was RMW'ing MDP_CTRL2, but the upstreamed patch was
> > only writing, and the way I conflict-resolved that caused the write of
> > BURST_MODE to overwrite the RMW DATABUS_WIDEN.
> > 
> > If both are moved to dsi_ctrl_config(), we could do a read, add both
> > flags in conditionally, and write.
> > 
> 
> So just to confirm, there is no issue on your 8350 setup with widebus 
> enabled right?

After properly conflict-resolving both series so that they either both
RMW, or combine the two bit-sets (the same you just discussed _not_
doing on the DPU side for DATABUS_WIDEN|COMPRESSION...) before a single
write, it works fine!

- Marijn
