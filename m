Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16394AD89EF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243D10E954;
	Fri, 13 Jun 2025 11:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="W74bGSVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FB810E954
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:03:22 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0CB3B25F8B;
 Fri, 13 Jun 2025 13:03:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCIuwyLbpHdc; Fri, 13 Jun 2025 13:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749812582; bh=xSacqbNIg/9oGP/awU7ktqaXCqSMSf5bNRHv9Vu8nMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=W74bGSVu8Tkpq7tIWHOgrW5bDW+opJlr9W6rbqBkSHFmg1nBgI1YXJ3qYYlPHqkHc
 5XRB08DesTbYTA2e600cDbpii29hkzuDYpEj1arI8OmQ2fNroCbMoWsVyIKpvdHY9L
 dvFT2OqNJKZWZJhMm+l6KYlG+I0NdDgE73rEmo7MeFGe7IQQxVd7cML6QGj28V6Mg4
 8OHWi77df+UfFnNnHne80ZmAgOJC66QxL3tiZJ10dAIg4Ac+D10tgwTjaybRjZzVz0
 wUrOaLpZCMyL3t9ygNw/9PgziZxlrHLT2wHqtrvuEhMZKOr2p6FgHOkXIIRvfIxGIt
 F/u/xfLvxfdsw==
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 11:03:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jessica
 Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: panel: add support for Samsung S6E8AA5X01 panel
 controller
In-Reply-To: <84ee6388-92af-49c8-988b-b79ed1453d5e@suse.de>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-2-06dcba071ea6@disroot.org>
 <84ee6388-92af-49c8-988b-b79ed1453d5e@suse.de>
Message-ID: <84663a88789b993a1cab8c55af4e03a7@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8
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

On 2025-06-13 09:39, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.25 um 16:52 schrieb Kaustabh Chakraborty:
>> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Implement
>> a basic panel driver for such panels.
>>
>> The driver also initializes a backlight device, which works by changing
>> the panel's gamma values and aid brightness levels appropriately, with
>> the help of look-up tables acquired from downstream kernel sources.
>>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

[...]

>> +
>> +static void s6e8aa5x01_mcs_protect(struct mipi_dsi_multi_context *dsi,
>> +				   struct s6e8aa5x01_ctx *ctx, bool protect)
> 
> I found this interface confusing. Rather split it up into .  It also does two different things AFAICT.
> 
> - The mcs_mutex protects against concurrent access from update_status and enable

mcs_mutex is meant to prevent any early access protection of the MCS commands.
Suppose there are two functions, A and B, accessing MCS.

ENTRY: A()
(access protection disabled)
...

ENTRY: B()
(access protection disabled)
...
(access protection enabled)
EXIT: B()

[!] cannot access MCS commands here anymore
(access protection enabled)
EXIT: A()

And to avoid such errors a mutex is provided.

> 
> - MSC_ACCESSPROT enable access to hardware state.
> 
> Maybe try this:
> 
> - Move msc_mutex into the callers, so that ->update_status and ->enable acquire and release the lock.
> 
> - Move MCS_ACCESSPROT into ->enable and ->disable and leave it accessible, if the hardware allows that.

Yeah this is a good idea, I'll try it.

>> +{
>> +	if (protect) {
>> +		mipi_dsi_dcs_write_seq_multi(dsi, MCS_ACCESSPROT, 0xa5, 0xa5);
>> +		mutex_unlock(&ctx->mcs_mutex);
>> +	} else {
>> +		mutex_lock(&ctx->mcs_mutex);
>> +		mipi_dsi_dcs_write_seq_multi(dsi, MCS_ACCESSPROT, 0x5a, 0x5a);
>> +	}
>> +}
>> +
>> +static int s6e8aa5x01_update_brightness(struct backlight_device *backlight)#
> 
> Maybe call this function s6e8aa5x01_update_status() to match the callback.
> 
>> +{
>> +	struct mipi_dsi_multi_context dsi = { .dsi = bl_get_data(backlight) };
>> +	struct s6e8aa5x01_ctx *ctx = mipi_dsi_get_drvdata(dsi.dsi);
>> +	u16 lvl = backlight->props.brightness;
> 
> backlight_get_brightness() here ?
> 
> 
> I think you should also check panel->enabled and return if false. AFAIU there will be no gamma changes on disabled hardware anyway.
>

The enable function is never executed when the panel is disabled. This is
because flag checking is done by drm_panel anyway. See drm_panel_enable()
in drivers/gpu/drm/drm_panel.c [1]

>> +
>> +static int s6e8aa5x01_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct s6e8aa5x01_ctx *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> 
> You're possibly using the instance after the hardware device has been removed. Alloc with drmm_kzalloc() or you might end up with UAF errors.

Hmm, none of the panel drivers are using drmm_kzalloc(), or even any
drmm_*(). Are you sure I must use it?

>> +	ret = devm_mutex_init(dev, &ctx->mcs_mutex);
> 
> You're taking this mutex in DRM code, so rather use drmm_mutex_init() here.

(The comment by me above applies here too)

> 
> Best regards
> Thomas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/drm_panel.c#n209
