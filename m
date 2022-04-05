Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6E4F3CC2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B0810ECF7;
	Tue,  5 Apr 2022 17:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Tue, 05 Apr 2022 17:15:32 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B560210ECF7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:15:32 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4KXvK86vcYz9sQB;
 Tue,  5 Apr 2022 19:10:04 +0200 (CEST)
Message-ID: <4f5cd810-39e1-1c1f-4dd0-480fd6689d5c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649178602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gPm+YGf1BS4ytfTy3QeGfkO3s1G5nKbx3OaLy5QrKc=;
 b=eWEMnczoyNQoYpoX9SkpdgKQUTunS35yyZ7h8Hv75qzvSQ8wZx8GEgBmo41on3+J2+//IP
 fVG7LVJIbXhM52+sdhWNScPIQ4BU1cU9zhPwo2jb+zoPYa/Wjbf46QDP0e1qV+rH705rvZ
 NQY4vbuDH9PNVz0GqcMSgBP7gs/OP9Ej+HcqNp2mDrieDbRXrQiiqWIdljw3upoDcUqTy2
 nP11nTI97OHX6ffeitjwcfOcgk4Z2S0rDpD2hsB3Ro1S01cWMbd4K4ImWiRq5LiLAw7JVP
 mxEv6nyBHSLXzk5PCGqso0JK1BYgo9h8lmAoMEapfzKHcbWtyvvslh3Aa5Zc2w==
Date: Tue, 5 Apr 2022 19:09:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Content-Language: en-CA
To: Zack Rusin <zackr@vmware.com>
References: <20220404182115.18849-1-zack@kde.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220404182115.18849-1-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, mombasawalam@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-04 20:21, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> By default each flip times out after 0.1 sec

10 * HZ is 10 seconds, not 0.1.

> and a warning about the time out is added to the kernel log. The warning is
> harmless because there's another flip coming right after but it can quickly fill up
> the log, e.g. missing 2 flips every second over a 24 hour span will
> add about 172 thousand lines to the log.

As we discussed before, while this might be true for the vmwgfx driver, for other drivers this message indicates that either the GPU hung, or something else went wrong spectacularly. As such, I think we do want to see these messages by default for other drivers at least.

I suspect this just papers over the real issue even with vmwgfx though.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
