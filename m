Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049AD0C0FE
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561DE10E93F;
	Fri,  9 Jan 2026 19:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="GDdPPL8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8410E93F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=58j9AgUfzZ/38ftGIgW2X6tV4I+EPs5M/SNwfN2BsMU=; b=GDdPPL8pVT0S6NQabzZd9Lbmjy
 uro84EPVRHokVNyuOITSp2kVrCBLzF5pePkyt2bE7d3DMpPvPAjgDLB0g8oPspP7IFh2MaeGKzcsP
 YO1fEWTd7HdOthDr8zi+uUsEheMDZ977Qi6kfP0lppST/RdYC3bzMd19JQgk1zGmO03eZ9gf3dGxp
 JHciIMdYOc0h3BRjjHbEDovqN/UyRjVPIG5EBxaMZ7Ki6MbsQ3w+13GR/8lbTAX02dLIR1YxmYSmn
 Q/xx9Jrtgb7+Px0pPKxpK1S33/0qK6O33DppbdyfEkxLYSgdyJTL33jmc3t4ysgWR/onsoMPclvZ6
 3wRarG0Q==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1veI6z-001fmF-0u; Fri, 09 Jan 2026 20:25:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
Date: Fri,  9 Jan 2026 20:25:23 +0100
Message-ID: <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
References: <20251031104846.119503-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 31 Oct 2025 11:48:44 +0100, Marco Crivellari wrote:
> === Current situation: problems ===
> 
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
> 
> This leads to different scenarios if a work item is scheduled on an
> isolated CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
      commit: 0650f4909af2bafe49322c91dd8dd0f68abfdf4f
[2/2] drm/rockchip: replace use of system_wq with system_percpu_wq
      commit: ab8559d44de5750e03778c42311aec8dd41a61f5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
