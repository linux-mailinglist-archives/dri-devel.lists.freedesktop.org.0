Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10E896B89
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287011298A;
	Wed,  3 Apr 2024 10:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91411298A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:06:02 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C482D3EDD1;
 Wed,  3 Apr 2024 12:05:57 +0200 (CEST)
Date: Wed, 3 Apr 2024 12:05:55 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 4/4] drm: panel: Add LG sw43408 panel driver
Message-ID: <vcxytd7cxmvno3hb7tvxwfbnsupaw3mcqplt7mnrntjhkybklr@lxffwioi2bzn>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-4-144f17a11a56@linaro.org>
 <3hh7nfqflj73422q47p6do7aiormxwspwkfg557epeqn2krtcc@dsufsohfaz4l>
 <pair66urg2ecqhob5gzzdtzuyofrmcf6rk7v2akggbotcpv7ld@bxhxftbd4xbn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pair66urg2ecqhob5gzzdtzuyofrmcf6rk7v2akggbotcpv7ld@bxhxftbd4xbn>
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

On 2024-04-03 05:37:29, Dmitry Baryshkov wrote:
> On Tue, Apr 02, 2024 at 11:17:52PM +0200, Marijn Suijten wrote:
> > On 2024-04-02 02:51:15, Dmitry Baryshkov wrote:
> > > From: Sumit Semwal <sumit.semwal@linaro.org>
> > > 
> > > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
> > > phones.
> > 
> > @60Hz?
> 
> With the current settings and timings I'm only getting 30 Hz. I have to
> double the mode->clock to get 60.

Still seems useful to mention (here and in Kconfig).  The proposed driver emits
a mode to userspace of 60Hz, maybe the commit message should say that in the
current state "something" prevents it from going that fast?

Since I keep forgetting (because it's not mentioned anywhere) that this is a
cmdmode panel (or at least configured for that with the current driver), I'd
again suggest to play with sync_cfg_height.  If setting it to 0xfff0 results in
timeouts, your tear GPIO is misconfigured and not making the MDP aware of the
actual tick rate.

Otherwise, more likely, just bump up the porches a bit, based on the discussions
around reduce_pclk_for_compression() /not/ accounting for transfer time in
cmdmode.  In one of my drivers (pending eternal cleanup hell) I inlined the
calculation to reverse what the "right" porch should be based on a downstream
clock rate:

https://github.com/somainline/linux/commit/85978a69cde088a23963c03758dad5f1a2e79bab#diff-a9ac8689e45c59a4fe9aa150e4bd53675687f5c8b4aecb40b5b5b66b864257e0R353-R366

And separately, though I cannot find it, there have been (more accurate?)
calculations based on downstream `qcom,mdss-dsi-panel-jitter` and friends.

- Marijn
