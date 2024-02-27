Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24B8690C5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 13:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269C10E133;
	Tue, 27 Feb 2024 12:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oUXpD7UM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68210E133;
 Tue, 27 Feb 2024 12:40:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D840CE1B43;
 Tue, 27 Feb 2024 12:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDDDC433F1;
 Tue, 27 Feb 2024 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709037626;
 bh=4zJjHVcptMKGc+hFgx7D5SAukwz7yawFk+xDkB/Py4Y=;
 h=Date:From:To:Cc:Subject:From;
 b=oUXpD7UMRxUc6WK2I+jo3QEw7Y25GPBMfNtWVCBism4ohrDV/ZH9SxfzYyAOF6ZiF
 7CjPLDlNjDquv5OEvQgRKFu68KjjOeq7wKWZty70p6ccb0wkpOfW35KvATwy7reCYT
 hJokEChlGxZBjxXx01PYulU6G6LCpvIIF5bBHsQeyqbaRErjgb0YQvI4Dd/gyet9y6
 SK7rpCWxr9FcC/BHtNTFTDKBCzYE6XiRmlyAuS23R2ElO7ykqYzJlKCntIRr79KbYP
 zSIJy76pgczWKKx09WGkcQ2yXkZ3dVGjZam0L69zENZmMUHINg0j3botqASqfvq/m8
 OsNl8Jxfs7IAw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rewl2-000000000DS-26x3;
 Tue, 27 Feb 2024 13:40:29 +0100
Date: Tue, 27 Feb 2024 13:40:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: drm/msm: VT console DisplayPort regression in 6.8-rc1
Message-ID: <Zd3YPGmrprxv-N-O@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

Since 6.8-rc1 the VT console is no longer mirrored on an external
display on coldplug or hotplug on the Lenovo ThinkPad X13s.

The hotplug notification appears to be generated immediately but it is
no longer forwarded or processed correctly:

[   22.578434] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
[   22.953161] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
[   23.095122] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
[   24.185683] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
[   24.186197] msm-dp-display ae98000.displayport-controller: dp_pm_runtime_resume
[   24.188098] msm-dp-display ae98000.displayport-controller: dp_ctrl_phy_init
[   24.191805] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
[   24.275904] [drm-dp] dp_ctrl_on_link: dp_ctrl_on_link - drm_dev = 0000000000000000
[   24.276474] [drm-dp] dp_ctrl_enable_mainlink_clocks: dp_ctrl_enable_mainlink_clocks - drm_dev = 0000000000000000

as the external display remains off/blank.

I've verified that reverting commit e467e0bde881 ("drm/msm/dp: use
drm_bridge_hpd_notify() to report HPD status changes") fixes "both"
issues.

I've previously reported this here:

	https://gitlab.freedesktop.org/drm/msm/-/issues/50

Note that a couple of times the display was eventually mirrored after a
very long timeout, but this doesn't seem to always be the case.

Johan


#regzbot introduced: e467e0bde881
