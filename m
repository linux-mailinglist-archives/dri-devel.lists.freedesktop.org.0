Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC93C6D1D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 11:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294F989F85;
	Tue, 13 Jul 2021 09:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jul 2021 09:19:00 UTC
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6C989F71
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:19:00 +0000 (UTC)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3E7981F887;
 Tue, 13 Jul 2021 11:10:31 +0200 (CEST)
Subject: Re: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
From: Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
Date: Tue, 13 Jul 2021 11:10:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, khsieh@codeaurora.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/21 9:04 PM, Abhinav Kumar wrote:
> During board bringups its useful to have a DSI test pattern
> generator to isolate a DPU vs a DSI issue and focus on the relevant
> hardware block.
> 
> To facilitate this, add an API which triggers the DSI controller
> test pattern. The expected output is a rectangular checkered pattern.
> 
> This has been validated on a single DSI video mode panel by calling it
> right after drm_panel_enable() which is also the ideal location to use
> this as the DSI host and the panel have been initialized by then.
> 
> Further validation on dual DSI and command mode panel is pending.
> If there are any fix ups needed for those, it shall be applied on top
> of this change.
> 
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Tested-by: Marijn Suijten <marijn.suijten@somainline.org>

[...]
> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +	u32 reg;
> +
> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
> +
> +	reg |= (0x3 << 0x8);
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +	/* draw checkered rectangle pattern */
> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));


How about BIT(7)?

On SM6125 this seems to change the color intensity of the pattern; it is 
always colored lines of a few pixels wide alternating R, B and G from 
left to right.  Is it possible to document the meaning and available 
values of these registers, especially if they differ between SoC / DSI 
block?

Kind regards,
Marijn

> +	DBG("Cmd test pattern setup done\n");
> +}
[...]
