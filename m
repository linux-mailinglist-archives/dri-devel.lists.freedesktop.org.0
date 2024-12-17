Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DA9F5828
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3241610EA80;
	Tue, 17 Dec 2024 20:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gGkDczDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17AD10EA80
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734468746;
 bh=QTgTwjrLzq+Vh3vlJUekypbgmjzQ4zFJ9paCtPkW590=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gGkDczDweBrHtxydhN7MEf8Pgf0FmBXq6Z860ntzw+x4TerllQUvTIbx8BZLHLxwc
 lQD8Qe3C01isMn2ZlHk4JGoDudQc2VyxV8dBoyiDMMBxfUp5qhCAQT+M5EkZAzV9iQ
 7iPiioHO2joqDxWOYGzvItswwkXYqtvFjOy5R92OYOk7bfrHX2LCPKLTjIGmhUvFj4
 fEYT11ZdPZo6NlFVDxf8+N+LJcTNw/DfdACT+D+/NLaq6yteMODWLiVpjVNRgGhQmA
 p2p/DMGGMX0YpKIgohX9+dpGT9Xb9cHysiLSkh2Spui1zjeDquY+PbG6/NtT7JEsPK
 IwNXHq1qS+L3w==
Received: from [192.168.1.90] (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DA7CC17E380A;
 Tue, 17 Dec 2024 21:52:25 +0100 (CET)
Message-ID: <2be9721e-62f3-41cc-83a8-5189b750a655@collabora.com>
Date: Tue, 17 Dec 2024 22:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: Don't change hdmi reference clock rate
To: Derek Foreman <derek.foreman@collabora.com>,
 Algea Cao <algea.cao@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241217201708.3320673-1-derek.foreman@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20241217201708.3320673-1-derek.foreman@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/24 10:17 PM, Derek Foreman wrote:
> The code that changes hdmi->ref_clk was accidentally copied from
> downstream code that sets a different clock. We don't actually
> want to set any clock here at all.
> 
> Setting this clock incorrectly leads to incorrect timings for
> DDC, CEC, and HDCP signal generation.
> 
> No Fixes listed, as the theoretical timing error in DDC appears to
> still be within tolerances and harmless - and HDCP and CEC are not
> yet supported.
> 
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 -------------
>  1 file changed, 13 deletions(-)

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
