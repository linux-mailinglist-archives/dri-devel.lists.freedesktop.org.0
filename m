Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0AC6B868
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034610E508;
	Tue, 18 Nov 2025 20:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="quiVWOGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4410E508
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:08:26 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d9wfH16TQz9v6T;
 Tue, 18 Nov 2025 21:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763496503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62JbVR0rfXOv5ktjxfrITbxdHa9P8CnEO8KeHvj0UO0=;
 b=quiVWOGlLM7ObPjgW9oRstr2jgcysxVx8IM7nauUYgahiBaTPByepE/uHZIuqHJfw+tGqt
 Gq/jqe2nrgaff56cpUhFjN0WKJIh7WtxQfFegX7T+JYgbn268ul83BaFOxU8B3GCCHAZD0
 qzoUzJbipQIxfevKwU7BEb4lLj6kbl0viQVNTIK/ayGqprUTY9ZVRXMI7IlyBuwS8fnJ+R
 y/+An1P/0XyTFIPf5qlRvvkjb/LKQtctnUFBr7hYQFjRBGdSb8SJRbo8IRiTXE5xnuyDBa
 4MWy0pgvZUttQMgQ9qVapAh2bVKa3McklMnTnPtJOhqB+7bo4Qxz7wyi4Ok5fg==
Message-ID: <246dfc90-5d6c-4bac-8e13-ce95653fa6d7@mailbox.org>
Date: Tue, 18 Nov 2025 21:08:18 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>
 <2v43kghgrw7qeh7l77czahr5ms34raykviuzetdbda7wuvh2ic@mc5stkequmh3>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2v43kghgrw7qeh7l77czahr5ms34raykviuzetdbda7wuvh2ic@mc5stkequmh3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: i99pdnje8uybuybh7fpgq4rb1rkmtw7t
X-MBO-RS-ID: c41cec412c7958fb13d
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

On 11/18/25 5:49 PM, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Nov 08, 2025 at 12:04:26AM +0100, Marek Vasut wrote:
>> Introduce a variant of drm_atomic_helper_commit_modeset_enables()
>> which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> where the CRTC provides clock to LVDS and DSI, and has to be started
>> before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>>
>> This specifically fixes the case where ILI9881C is connected to R-Car
>> DU DSI. The ILI9881C panel driver does DSI command transfer in its
>> struct drm_panel_funcs .prepare function, which is currently called
>> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
>> and the DSI command transfer times out.
>>
>> Fix this by restoring the enable ordering introduced in commit
>> c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>> and post-disable"), to enable CRTC early.
>>
>> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c           | 24 +++++++++++++++++++
>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>>   include/drm/drm_atomic_helper.h               |  2 ++
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 5a473a274ff06..c0cdd36a03df1 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
>>   
>> +/**
>> + * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
>> + * @dev: DRM device
>> + * @state: atomic state object being committed
>> + *
>> + * This function is a variant of drm_atomic_helper_commit_modeset_enables()
>> + * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> + * where the CRTC provides clock to LVDS and DSI, and has to be started
>> + * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>> + */
>> +void
>> +drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
>> +						    struct drm_atomic_state *state)
>> +{
>> +	crtc_enable(dev, state);
>> +
>> +	encoder_bridge_pre_enable(dev, state);
>> +
>> +	encoder_bridge_enable(dev, state);
>> +
>> +	drm_atomic_helper_commit_writebacks(dev, state);
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
>> +
>>   /*
>>    * For atomic updates which touch just a single CRTC, calculate the time of the
>>    * next vblank, and inform all the fences of the deadline.
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> index 116ad9605704b..b7e2a735a03ae 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> @@ -547,7 +547,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>>   	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>   	drm_atomic_helper_commit_planes(dev, old_state,
>>   					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
> 
> Just like we discussed on Linus' series for MCDE, we don't want to have
> an helper variant for every driver variation. If rcar is the only user
> of that helper, rename and export the symbols you need, and roll yor own
> commit_tail implementation.
It seems both Linus and me are affected, and those are now two different 
drivers ?
