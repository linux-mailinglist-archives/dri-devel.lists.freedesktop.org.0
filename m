Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC019E2CE0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 21:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352B210E0DD;
	Tue,  3 Dec 2024 20:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="zfNuEh+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6510E0DD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 20:16:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5603E8939D;
 Tue,  3 Dec 2024 21:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733256966;
 bh=HFPgWtx/TvkI7sUbV4S3AebYBzGL0Om0FylGOBaC01s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zfNuEh+YGm64pqvTE5IVmbBqQHfINNBourjZvZT663OEq7FyAZiJDneSPNUGaT0qS
 ncK5QiGOEynd24gmprB1IfpzrtbtJbSURmT6Ucr0ka1j6hpi4fBxzswdxc7U5H1ukh
 XPEKa0oseZw7YL8XDz4LzwozTRg7ftM9o5kq3UCuOEvlHoUZh3dzyYXmHmqyYFmA5W
 LcmBV4ShDFkiU/RBU+r+VFJvQs4aOsA+gHfQM1Uj6hiRxYRy9/7u874NVPpJ8ONvbi
 LfVP+CTcaueZwLVe0M6bRuKYXx4WtybumcpWG9PrPxqqXLQTBT4/zqoW+zbJbILPZ5
 9LqB1gfX9BfAw==
Message-ID: <2d7f8afc-119a-4080-93be-bf3daf017e5e@denx.de>
Date: Tue, 3 Dec 2024 21:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241203191111.47B56F7@mail.steuer-voss.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241203191111.47B56F7@mail.steuer-voss.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 12/3/24 8:09 PM, Nikolaus Voss wrote:
> LDB clock has to be a fixed multiple of the pixel clock.
> As LDB and pixel clock are derived from different clock sources

Can you please share the content of /sys/kernel/debug/clk/clk_summary ?

LDB and matching LCDIF should use the same PLL on MX8MP , else you might 
really run into odd issues.
