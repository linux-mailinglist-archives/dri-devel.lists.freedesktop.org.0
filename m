Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30855703E6C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 22:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155FD10E273;
	Mon, 15 May 2023 20:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B010E274
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 20:17:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 077BC1F987;
 Mon, 15 May 2023 22:17:06 +0200 (CEST)
Date: Mon, 15 May 2023 22:17:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Message-ID: <p475xm34vecvxeidwx5ztbk7wzvpeefw2mfzsfz47fgaftwocg@f7l2ku63yfww>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <mxdr37vle6x4wvidyh2tc5w77oqve556ogk4nu47efdjbstz6i@vz5hkydgie5g>
 <08b4b6b3-1401-c2dc-0270-c8f7d538ed9c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b4b6b3-1401-c2dc-0270-c8f7d538ed9c@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-15 10:06:33, Kuogee Hsieh wrote:
<snip>
> >> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)
> > Can you write out "ob" fully?
> >
> > These don't need to be marked "inline", same below.

Please add newlines around your reply, like I did here, to make it
easier to spot them in the context.  As asked in another thread, shorten
the original message around it if it's not relevant for your reply
message (see <snip> bits).

> are you means all functions in this file doe snot to be marked as inline?

https://www.kernel.org/doc/local/inline.html

In general, inline is fine for math functions that are small and useful
to be inlined (and functions in headers that get compiled multiple times
but need to be deduplicated when all the objects are linked together).
It has no sensible meaning on callback functions (of which their pointer
get assigned to a struct member), however.

In DPU1 for example, only dpu_hw_ctl.c erroneously does this for
callbacks (and this patch, but I presume you'll fix this up in v9).

> >> +{
> >> +	int max_addr = 2400 / num_ss;
> > ss -> slice (or subslice), right?
> ...
> slice (softslice)

Thanks if you can fix this up in v9!

- Marijn

<snip>
