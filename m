Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLTkBxifq2m6ewEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 04:44:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92274229FE0
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 04:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12D310E012;
	Sat,  7 Mar 2026 03:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AF24SIQN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZhNmsshK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034B910E012
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 03:44:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fSTfT2rDtz9tdp;
 Sat,  7 Mar 2026 04:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772855057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4Pgh4WefMLVX+2LXxiaugedxOTkXzJWSQIMEPmphhE=;
 b=AF24SIQNhTwwDjApGXpwDzhJOYm70/sSFUJP3gDTtMNhgyj8rMDOGhQeyQCOkxvRUSszG+
 aBoZ9cZy2TNQRJXlAwXmtU4bDhqGloZOhZdpRnjPviVQ/6NwPApPboZVd/fO3ZmXxl1Slz
 BTMSvL4iAzKq2xF+PFC5znAVb3vtYqpZdSgsXaibBuPgxkWh0Ku61s9oDWEopGIU1TO/6R
 xqPVvog/Yt2jJjVtIP78n9WWDHYav1/P6vJWBuyHpdx7cE4d38DROWxdt4osx9X2JbCYOu
 w1TPv/KDF7yC/bwr18e2HNTMxgoIR+rhH2OrIR5kVYiMsdUlYgYtPJYLVl0z+Q==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZhNmsshK;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <fe3c0b16-1d29-4bca-bff3-15217f9b73f7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772855055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4Pgh4WefMLVX+2LXxiaugedxOTkXzJWSQIMEPmphhE=;
 b=ZhNmsshKF4QM3HVBKLuqqKDQJcllNHMw96ogCrnDF0tmaBXhKVkH5H1WHK/WJxGpMKb0EF
 sDydn4C2GVbOhaRZgEvFWZ6/2Ukqe56MMVymDnRUAEYeK11zm19Xk3vh4JQ54j9jUIYNoh
 MpbGcGZ2hukMYl+Jc9ta5b1ZRDxJ9ktxY63ZQYzmewfkMIwO8G+PrrmXtA7q0JMMZvmyTZ
 SnwvgXG+ZgHAg8mhwP+8d5F6hdsetjnv6jKz8b2heegIH3DXuK6auKhp1lX+9dyijZCmhx
 WiqmSgPbWBfXcpwFy+VwHHiZfFTSWjvRuQus7Kx3ooFoLWWLNKfJSCvTe934Jw==
Date: Sat, 7 Mar 2026 04:44:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Fix signedness bug
To: Ethan Tidmore <ethantidmore06@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Joseph Guo <qijian.guo@nxp.com>, kernel test robot <lkp@intel.com>
References: <20260307033245.71666-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260307033245.71666-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6207d88a42b8b91a028
X-MBO-RS-META: ff8ar6k6pyuepp3x53h1mn1yi7rtnwbu
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
X-Rspamd-Queue-Id: 92274229FE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:qijian.guo@nxp.com,m:lkp@intel.com,m:jernejskrabec@gmail.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,mailbox.org,nxp.com,intel.com];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/7/26 4:32 AM, Ethan Tidmore wrote:
> The function drm_of_get_data_lanes_count_ep() returns negative error
> codes and dsi->lanes is an unsigned integer, so the check (dsi->lanes <
> 0) is always impossible.
> 
> Make the return value of drm_of_get_data_lanes_count_ep() be assigned to
> ret, check for error, and then assign dsi->lanes to ret.
> 
> Detected by Smatch:
> drivers/gpu/drm/bridge/waveshare-dsi.c:70 ws_bridge_attach_dsi() warn:
> unsigned 'dsi->lanes' is never less than zero.
I already sent:

[PATCH] drm/bridge: waveshare-dsi: Use temporary signed variable for DSI 
lanes validation
