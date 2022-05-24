Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E1532414
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 09:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFD410E6DF;
	Tue, 24 May 2022 07:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA3110E6DF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 07:29:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BCAE383612;
 Tue, 24 May 2022 09:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653377384;
 bh=NZIZAdF0Kxn9DcjmhLs72BvDxKiYAyxZey0N1C8Pibc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cZ0JaHobfBWNk7VTikXsDwlqDF5y16HsgL3QM/8pPuH5GsDsAY8pA9Hfxl82K6gKp
 fjt12ibMI3iHWqvoOQmLvYf+OcvnGKS9X+il+fwdaKoxBwQxIt7dF/klUr/HAj6NbT
 mQkuo5Vx5ASMmCz2w6vmkByc3gGATjCptisT/mb7yjnF7BQNLFSm57rOTRjey0aQzO
 LBexP9H8UaJIIq0ZGSwPAGa4LXEJ6pc8T9St/llbIoJa0cu8iSFyjsyuJBeneVTxiR
 IKEBNr8+jlUOQdA5pzjkKLA90GTvS9VuWG93cqlbTVtv4eEY7iBsALz2hxOq9Vp0c6
 cN/vAfMPBXGKA==
Message-ID: <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
Date: Tue, 24 May 2022 09:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220519114849.69918-1-marex@denx.de>
 <20220519114849.69918-2-marex@denx.de> <4403432.LvFx2qVVIh@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4403432.LvFx2qVVIh@steina-w>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 martyn.welch@collabora.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/24/22 09:09, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Donnerstag, 19. Mai 2022, 13:48:49 CEST schrieb Marek Vasut:
>> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
>> completely different from the LCDIFv3 found in i.MX23 in that it has
>> a completely scrambled register layout compared to all previous LCDIF
>> variants. The new LCDIFv3 also supports 36bit address space.
>>
>> Add a separate driver which is really a fork of MXSFB driver with the
>> i.MX8MP LCDIF variant handling filled in.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Robby Cai <robby.cai@nxp.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
>> ---
>> V2: - Drop the pitch check from lcdif_fb_create()
>>      - Drop connector caching
>>      - Wait for shadow load bit to be cleared in IRQ handler
>>      - Make all clock mandatory and grab them all by name
>>      - Wait for EN to be cleared in lcdif_disable_controller
>>      - Rename to imx-lcdif
>>      - Move shadow load to atomic_flush
>> V3: - Invert DE polarity to match MX8MPRM datasheet
>>      - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
>> V4: - Drop lcdif_overlay_plane_formats, it is unused
> 
> Thanks for the update. With your change in V3 my HDMI output works now without
> that hack mentioned. weston screen as well as 'fb-test -p 5' output seems
> sensible.
> Unfortunately this isn't the case for LVDS output on LCDIF2. I somehow managed
> to get the DT nodes for LCDIF and LDB done. Also the necessary addition to
> imx8m-blk-ctl. So eventually I can see some output. But the screen is cutoff
> on the right side of about 15-20% and the screen is flickering slighty. This
> is especially visible in 'fb-test -p 5'. The red bars are only visible to less
> than 1/3 and the text as well as the diagonal lines are flickering. Colors are
> correct though.
> For the record: I am using a 'tianma,tm070jvhg33' panel.

Does LDB start working if you apply:

  static const struct drm_bridge_funcs funcs = {
         .attach = fsl_ldb_attach,
-       .atomic_check = fsl_ldb_atomic_check,
         .atomic_enable = fsl_ldb_atomic_enable,
         .atomic_disable = fsl_ldb_atomic_disable,
         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

to

drivers/gpu/drm/bridge/fsl-ldb.c

?
