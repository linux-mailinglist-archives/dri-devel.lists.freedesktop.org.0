Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIoeNdJ0oWkPtQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:41:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671641B619E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAC10EAF7;
	Fri, 27 Feb 2026 10:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hiX3S0gD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F73F10EAF7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:41:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fMlHH73q0z9sZZ;
 Fri, 27 Feb 2026 11:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772188876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8yNHrrv8hSbIol16MyTEr4gp82KA1j7w7oSm0UgB4U=;
 b=hiX3S0gD7vIoc4g2amN34KUBr/5pehQhklGW8kRGIc/fmgEwPBDYzNOFwjY1iXF5ultF2K
 eOnxr4WSwbotJ5DQI+g+VUeH+5TgK/J+t7nO0erjf7VAeMGPvcpr9vKQxI3lZJxnLiE7ri
 PLjjZe9+yXiFHUeyvB7fs68OaOaqkt51G4zBDoxLmO3WxzGPeMqSVra4N2eMLF2jWrz60i
 dGq/WMv7TUKtcEdgodDdG3XkkVZrifQngq6k43rzwVG5JVa250UQDB7IDmb2frjg4f4xXU
 bdRW2LTA6aujo3dmf82hpg3vp38iFh0xrZN/jqgmgHrsXDwcaEtzvu9CyvdwwQ==
Message-ID: <4b796cc7-bf3d-4eb1-8e29-33e90851c34d@mailbox.org>
Date: Fri, 27 Feb 2026 11:41:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi83: halve horizontal syncs for
 dual LVDS output
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
 <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-2-2e15f5a9a6a0@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-2-2e15f5a9a6a0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: cba5140bc5ed835239e
X-MBO-RS-META: rinne88hpm9po5saewn6i3bhefqz3wx7
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frieder.schrempf@kontron.de,m:linusw@kernel.org,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,kontron.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 671641B619E
X-Rspamd-Action: no action

On 2/26/26 5:16 PM, Luca Ceresoli wrote:
> Dual LVDS output (available on the SN65DSI84) requires HSYNC_PULSE_WIDTH
> and HORIZONTAL_BACK_PORCH to be divided by two with respect to the values
> used for single LVDS output.
> 
> While not clearly stated in the datasheet, this is needed according to the
> DSI Tuner [0] output. It also makes sense intuitively because in dual LVDS
> output two pixels at a time are output and so the output clock is half of
> the pixel clock.
> 
> Some dual-LVDS panels refuse to show any picture without this fix.
> 
> Divide by two HORIZONTAL_FRONT_PORCH too, even though this register is used
> only for test pattern generation which is not currently implemented by this
> driver.

Reviewed-by: Marek Vasut <marek.vasut@mailbox.org>

Thanks !
