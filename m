Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHqhNQ9LrGn+oQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 16:58:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FD22C990
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 16:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10B410E082;
	Sat,  7 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YT+7HYXh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MwCxDgVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD97710E082
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 15:58:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fSnx54vnPz9skw;
 Sat,  7 Mar 2026 16:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772899081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JM3mlCY0oAZwd1B4MX8jyeQmW1EEfB6+qZIvVw3tLrE=;
 b=YT+7HYXh/eoeKr1f/mJ6Tc8Wwm6PNDivffSu99k3KEcxDvsEEv/vDGLQWH/FGDGBBTjbz0
 +BlUK6q7SgWe6HrdLyISd6LKOp42gHrRDqKhRkA6KAQeDn7JM0txNF/NneLvV6w2bnJ2Fl
 za8xjnCTE/H8gMp5N/FKvA/S8owTQq3zp6LPMuYtDKuZCNC1uLfAC3fgGFSrV0MLe5zpHh
 darpv+TsdyPFOgUB+7F7fBhT78lcu4hSbLfC92AOPVfpLkqhe7m4C+QH5rpzXJemFSKkJq
 RoIXq/sBWRrVwPTe6eubxLVSh5uefOHFttOC6lCFtIGM/Aa95paT6xGe+DFVzA==
Message-ID: <7b3bca76-27be-48f5-9c00-1f670346fe49@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772899080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JM3mlCY0oAZwd1B4MX8jyeQmW1EEfB6+qZIvVw3tLrE=;
 b=MwCxDgVpoHbEOICut3hUnIRmcqt+nBppufEBmGKmwc3IbO2Jq38CnuZrDMLNwVdfMzgwzj
 7jPubM5Qc2ZMv6ho5NR1+sb0x1pc0dGWQPQFQin5+lEv65HCb28UjV/IZyjI4kIsAovK6w
 Wxvc/9kL42pkodWLoaVia94i9KtCkpT9DYB8YmH9qICpH+Y0kvVD0/e8YJSG1heKg9fyhH
 YQA/+a+boKz2pDjnsCMqMpen5+KM5xOokl5aCoTPTmfW7WqCqjpa/gpkvtaYxf410vKbYg
 F+u5ZL38IEOFjrMd07/NPNzhrslnuZVee4ybkKJMmeGgyxUkv7e5uYgKJWu7Tg==
Date: Sat, 7 Mar 2026 16:57:53 +0100
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
 <fe3c0b16-1d29-4bca-bff3-15217f9b73f7@mailbox.org>
 <DGWCGTZNG2VK.3DIFKJWW3SPUW@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DGWCGTZNG2VK.3DIFKJWW3SPUW@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: p8m61snkg9wmqwqoa5hoig4q7or6ny87
X-MBO-RS-ID: 2afaf9786d8a7c7e8e6
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
X-Rspamd-Queue-Id: 5C0FD22C990
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 3/7/26 7:42 AM, Ethan Tidmore wrote:
> On Fri Mar 6, 2026 at 9:44 PM CST, Marek Vasut wrote:
>> On 3/7/26 4:32 AM, Ethan Tidmore wrote:
> 
>> I already sent:
>>
>> [PATCH] drm/bridge: waveshare-dsi: Use temporary signed variable for DSI
>> lanes validation
> 
> Sorry about that! I glanced at lore looking for the kernel test robot,
> should have looked for patches already for this.
Actually, looking at it one more time, the patch I sent is missing the 
update of dev_warn() , so this patch is the better fix:

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !
