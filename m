Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFE6A3DF9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2578510E398;
	Mon, 27 Feb 2023 09:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A51C10E390;
 Mon, 27 Feb 2023 09:12:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC20060DBD;
 Mon, 27 Feb 2023 09:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58DCC433D2;
 Mon, 27 Feb 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677489142;
 bh=M73yfffVGAh8sWbCGSQU9guO48iLvbYQo53igIT8KqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=umkYI4Dkv7vJbXYspcgvjCpo61vd3SstOYuL5CeMkshATpTO5yxYQ5DvALqDlaZ93
 4n7hML65CU4ModwE9uR1oe8qjyuJ2Y6nkjDjRBlcMJmSbed4LUKNRhdJeWheqD5/B5
 KQMX8CmhKbRjtNN7kLYx8NQj9ZhXXOWLVoOYWBDuXTGQfM+9C8g/FrG8hVrbcN/N3N
 GZO/hje0SWhY216fAbwCQfGK/8t21VYP9ogPcZ/t/5r4BlH3Djvr0W1iUQjVy10psC
 9JEYk0h9cpn4BcxVaVee4UKmB+DRwSR9fH4Zr+1ZilFCf8ZBwcwsWdAJOUgws9zmAx
 JTX9q/CCS/Daw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pWZYo-0006Zu-DS; Mon, 27 Feb 2023 10:12:42 +0100
Date: Mon, 27 Feb 2023 10:12:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.1 18/58] drm/msm/dp: Remove INIT_SETUP delay
Message-ID: <Y/x0CpMmNV6pJlZB@hovoldconsulting.com>
References: <20230227020457.1048737-1-sashal@kernel.org>
 <20230227020457.1048737-18-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227020457.1048737-18-sashal@kernel.org>
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
 Bjorn Andersson <quic_bjorande@quicinc.com>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, swboyd@chromium.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 26, 2023 at 09:04:16PM -0500, Sasha Levin wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> [ Upstream commit e17af1c9d861dc177e5b56009bd4f71ace688d97 ]
> 
> During initalization of the DisplayPort controller an EV_HPD_INIT_SETUP
> event is generated, but with a delay of 100 units. This delay existed to
> circumvent bug in the QMP combo PHY driver, where if the DP part was
> powered up before USB, the common properties would not be properly
> initialized - and USB wouldn't work.
> 
> This issue was resolved in the recent refactoring of the QMP driver,
> so it's now possible to remove this delay.
> 
> While there is still a timing dependency in the current implementation,
> test indicates that it's now possible to boot with an external display
> on USB Type-C and have the display power up, without disconnecting and
> reconnecting the cable.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Patchwork: https://patchwork.freedesktop.org/patch/518729/
> Link: https://lore.kernel.org/r/20230117172951.2748456-1-quic_bjorande@quicinc.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This is not a bug fix and should not be backported.

Johan
