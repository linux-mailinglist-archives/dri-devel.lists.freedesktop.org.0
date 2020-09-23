Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D992763B0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 00:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474996EA0A;
	Wed, 23 Sep 2020 22:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BE506EA0A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 22:18:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88DB8113E;
 Wed, 23 Sep 2020 15:18:23 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05AC13F73B;
 Wed, 23 Sep 2020 15:18:21 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] drm: rockchip: hdmi: enable higher resolutions
 than FHD
To: Vicente Bergas <vicencb@gmail.com>, Doug Anderson
 <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
References: <20200922203107.2932-1-vicencb@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <340b1e7f-9149-3dcc-e6a3-74ab02fcc6e5@arm.com>
Date: Wed, 23 Sep 2020 23:18:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200922203107.2932-1-vicencb@gmail.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-22 21:31, Vicente Bergas wrote:
> This patch series enable a QHD HDMI monitor to work at native resolution.
> Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60

Indeed for RK3399 it also allows my 1920x1200 monitor (Dell U2415) to be 
driven at its native resolution with a 154MHz pixel clock. However, as 
predicted, it also breaks RK3328 for the same monitor - instead of 
rejecting the native mode and falling back to "standard" 1920x1080, it 
now tries to use it, which results in no signal and a spam of CRTC 
timeout warnings in dmesg :(

I'll try to test RK3288 as well soon - I tried hacking a specific entry 
for 154MHz into the tables a while ago, and while it worked perfectly on 
RK3399, RK3288 gave a fairly glitchy picture as if the clock signal was 
unstable or slightly out of spec. I'm interested to see if patch #1 
makes any difference there.

Thanks,
Robin.

> 
> Changes since v1:
> Use alternative clock rounding code proposed by Doug Anderson
> 
> Vicente Bergas (3):
>    drm: rockchip: hdmi: fix clock rounding code
>    drm: rockchip: hdmi: allow any clock that is within the range
>    drm: rockchip: hdmi: add higher pixel clock frequencies
> 
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 8 +++++++-
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 7 ++-----
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
