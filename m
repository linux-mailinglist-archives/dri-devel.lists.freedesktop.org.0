Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6306997B43
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 05:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A6210E280;
	Thu, 10 Oct 2024 03:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="EdaNHOIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7AB10E280
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 03:29:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BDCF988BBE;
 Thu, 10 Oct 2024 05:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728530964;
 bh=QwGekSSA7O3pnyxbG9NtJGrZrglqZzj4wmagUDahZ8A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EdaNHOIK0z7nDrPdmVkqiIUfXChTPqnLH1r0X8UXV/DGyxlp78CElexg8r5hvFyxc
 FpaAg7mV3sY+xsGBJ3kj2EB4s6HCH3OFmoyNKaEsA2o3ydHn08LDOXAvhDait0ONPJ
 ZOVCkb/R1kljP7T6vk4C8qQ5hrOtugftqpI00odoa+WTAuhqtebLok1qSY9fIx1Q8+
 I0abl3kyuuPot8BDD64JmvrmLl0uNnUnBEe/Dumn4Fg7XK0J0VtSzhc5jnhDOI7f6U
 jy2wyfiygQ/wFI/LvUrYN5VnNDm1chQRPL1/LNHF3PdcbANq2+dr3cwUTWwlewumeg
 vfCLh4f5xPRKg==
Message-ID: <5d31b798-f4ba-4fc4-a10b-3e9a03bdd066@denx.de>
Date: Thu, 10 Oct 2024 02:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Isaac Scott <isaac.scott@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, kieran.bingham@ideasonboard.com
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w> <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <50f10a422dd3a7099e2e2724f9401dbae41ea529.camel@ideasonboard.com>
 <36a3425d-54f5-4c14-b2de-ef8b74f47ed0@denx.de>
 <c1ed4bec322bb27860b1a9f4776cc45e37ce093e.camel@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c1ed4bec322bb27860b1a9f4776cc45e37ce093e.camel@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/9/24 5:58 PM, Isaac Scott wrote:

[...]

>>>                   media_mipi_phy1_ref  0       0        0
>>> 23036364
>>> 0          0     50000      N                  deviceless
>>> no_co
>>>                      media_mipi_phy1_ref_root 0       0        0
>>> 23036364    0          0     50000      N
>>> 32ec0000.blk-ctrl
>>>
>>> The media_disp2_pix clock now seems to be correct at 724000000
>>> after
>>> your changes.
>>
>> Do you want to submit the DT patch with correct Fixes: tag ? :)
> 
> I thought this wasn't needed with the other two patches?
The DT change is not needed with the other patches, however, I believe 
the DT change is the correct fix for current Linux 6.12-rc and the two 
patches are feature development for the Linux 6.13.y cycle.
