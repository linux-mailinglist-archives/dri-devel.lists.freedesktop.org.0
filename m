Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL7+Dn+qb2lUEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7A473F7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAD10E608;
	Tue, 20 Jan 2026 14:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IVXvK30T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179810E608
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:32:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 34C011A2965;
 Tue, 20 Jan 2026 14:32:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0777B606AB;
 Tue, 20 Jan 2026 14:32:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0BCC610B6B3C2; Tue, 20 Jan 2026 15:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768919566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CnR4HH0qbA5JMdYprFWKRDPXqXPpkZ+LLXc3tQitS84=;
 b=IVXvK30TnSaepMj69bYNn55/lQxwgSv1HQzFNJJIZOQbbC4QqLAHwPsE44r8RFYo9uc7AL
 1X47C3e+f4USmaWZ9TvXrF4Jluk+xG4bUi7Pdbpt7BhP1K2QZBjaWpwt+kif1ykOyWSU/B
 osFs2+I54bNKxMzJ0I7VCyqXKVY5NdoU+0FQz+MPUf98xintblaldXhpYdNBugVwN8sHBh
 ZLCjOnjo8qIiK8AfGbJBQdLGQJOKjAR9QrI4NVHW93vM+/jIC4LBL7aeO7WzZAxMiyYGbp
 UF+tiQmAUU0Yn1UdnQzF9KAy6qJjfU3O13QiG0ExWcIcQaPRAymf4dUG5290Eg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andy Yan <andy.yan@rock-chips.com>, 
 Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: stable@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260102155553.13243-1-osama.abdelkader@gmail.com>
References: <20260102155553.13243-1-osama.abdelkader@gmail.com>
Subject: Re: [PATCH v3] drm/bridge: synopsys: dw-dp: fix error paths of
 dw_dp_bind
Message-Id: <176891955882.652956.206927403017627596.b4-ty@bootlin.com>
Date: Tue, 20 Jan 2026 15:32:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy.yan@rock-chips.com,m:osama.abdelkader@gmail.com,m:stable@vger.kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[rock-chips.com,gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E6C7A473F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 02 Jan 2026 16:55:52 +0100, Osama Abdelkader wrote:
> Fix several issues in dw_dp_bind() error handling:
> 
> 1. Missing return after drm_bridge_attach() failure - the function
>    continued execution instead of returning an error.
> 
> 2. Resource leak: drm_dp_aux_register() is not a devm function, so
>    drm_dp_aux_unregister() must be called on all error paths after
>    aux registration succeeds. This affects errors from:
>    - drm_bridge_attach()
>    - phy_init()
>    - devm_add_action_or_reset()
>    - platform_get_irq()
>    - devm_request_threaded_irq()
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: synopsys: dw-dp: fix error paths of dw_dp_bind
      commit: 1a0f69e3c28477b97d3609569b7e8feb4b6162e8

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

