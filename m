Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BCC4FCD3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 22:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47A810E652;
	Tue, 11 Nov 2025 21:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ApCSoVk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3572D10E652
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 21:09:33 +0000 (UTC)
Message-ID: <d2759f7e-23a5-4d68-b50f-4c510540bcdd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1762895371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWZSjPeTHOwQQ/fMrt+3ARQrsSB/sn9y1Zax5yNuBX4=;
 b=ApCSoVk/a826CZMkyfwKzQ17VO4isZTG0H6VWc/GDizbMn7q8twT5poc+r2k3fIMGrkoZ2
 Z65SBZKzL1IkVSGYJyzEvMo/hWHyJVeqz8kwRn34epuz3GSZyjoUXy4IVBOk56te2c2DTW
 lyhHBoNPeuzbqaAXC/F8BoiH8X/uHg0=
Date: Tue, 11 Nov 2025 16:09:13 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <a8f0de1d-07e8-4e48-8495-9cafa0febcf5@linux.dev>
Content-Language: en-US
In-Reply-To: <a8f0de1d-07e8-4e48-8495-9cafa0febcf5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 11/4/25 16:53, Sean Anderson wrote:
> On 6/27/25 10:50, Mike Looijmans wrote:
>> XRGB8888 is the default mode that Xorg will want to use. Add support
>> for this to the Zynqmp DisplayPort driver, so that applications can use
>> 32-bit framebuffers. This solves that the X server would fail to start
>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>> 
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 80d1e499a18d..501428437000 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>  		.swap		= true,
>>  		.sf		= scaling_factors_888,
>> +	}, {
>> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
>> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>> +		.swap		= true,
>> +		.sf		= scaling_factors_888,
>>  	}, {
>>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,
> 
> Tested-by: Sean Anderson <sean.anderson@linux.dev>
> 
> I can confirm that this provides a nice performance boost :)

Actually, I think a better fix would be to make the "video" plane the
primary one. That plane supports XRGB8888 natively, and then the
graphics plane can be used as an overlay for e.g. windows or cursors.

--Sean
