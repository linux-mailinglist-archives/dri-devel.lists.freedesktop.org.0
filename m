Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4FD5168EB
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 01:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8127B10E037;
	Sun,  1 May 2022 23:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B0510E037
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 23:54:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E739A83040;
 Mon,  2 May 2022 01:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651449263;
 bh=ZM/TjWWWX6RCDuMlnC9/fxi/GT4UVgUhlkLTrkdnk2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B4D0HFTywab4jMdWlVMgghLhdEPQxRrJFegHy7hX/M8v2Z6m8W3QpPxw0993DRvfB
 bMgJF8rn4ZanJ4pLmim1W4jCf23Xp6KCevwk++PsH/s87oRve67KLJbG0W0h6Y9WyX
 uEz4sNesLeRB9Vd/ccyp51Q6KCe/ujf/t0RTp/Bfr1o7b3hQpGQRmUT+ow15L2h010
 13zdp7qG2Y+NcPtgwYwbtZC31Cxrkh9j7+5mYO1sK8WMF7uabXmzVGbR7pHIExBfEM
 yftvpDaeN9F2o6Wlv0y+l2brSAF2Icnwu2MkxKBUaQPl8p5WJYyHeLK+0aZUWG+bKJ
 I/yEpi98mST3g==
Message-ID: <7ed8291e-8e04-4f31-99f5-b2f69f42e9da@denx.de>
Date: Mon, 2 May 2022 01:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm: mxsfb: Implement LCDIF scanout CRC32 support
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220429212313.305556-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220429212313.305556-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 23:23, Marek Vasut wrote:
> The LCDIF controller as present in i.MX28/i.MX6SX/i.MX8M Mini/Nano has
> CRC_STAT register, which contains CRC32 of the frame as it was clocked
> out of the DPI interface of the LCDIF. This is most likely meant as a
> functional safety feature.
> 
> Unfortunately, there is zero documentation on how the CRC32 is calculated,
> there is no documentation of the polynomial, the init value, nor on which
> data is the checksum applied.
> 
> By applying brute-force on 8 pixel / 2 line frame, which is the minimum
> size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
> 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
> of the entire frame and the resulting CRC has to be also bitrev32()ed.
> 
> Doing this calculation in kernel for each frame is unrealistic due to the
> CPU demand, so attach the CRC collected from hardware to a frame instead.
> The DRM subsystem already has an interface for this purpose and the CRC
> can be accessed e.g. via debugfs:
> "
> $ echo auto > /sys/kernel/debug/dri/1/crtc-0/crc/control
> $ cat /sys/kernel/debug/dri/1/crtc-0/crc/data
> 0x0000408c 0xa4e5cdd8
> 0x0000408d 0x72f537b4
> "
> The per-frame CRC can be used by userspace e.g. during automated testing,
> to verify that whatever buffer was sent to be scanned out was actually
> scanned out of the LCDIF correctly.

If this is OK with everyone, I will apply this soon.
