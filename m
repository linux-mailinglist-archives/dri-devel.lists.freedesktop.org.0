Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9A915533
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 19:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D62C10E25B;
	Mon, 24 Jun 2024 17:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="QMoJrn1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4043010E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719249403; x=1719854203; i=markus.elfring@web.de;
 bh=GMEQP3jd8WRb2V1nPNUL0HSascCCaN0HsToYXwfFS2k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QMoJrn1LD5lVdyjr6qrnNyWBC9Ki0fPFxYP+xV8jVYyKjVESnnioV/BDJTTirsS9
 GDQIARYffI53kzX88EjdN9KTz0Fuv/tQNQ78sFHto5jSXXBZPMi7SHQyXpU57VrDw
 wXqeLG7oqcyHV/bE3WQa3+i5mJ6RyiD7sAgfAfCqFs12C8Fz4d+N3zRAa0wWW2s48
 PHNjCcLZmFNW9e76FRN9lZGMjECc6EcXDGGWURCDWLxomWYSvXTkYWg9WWdgejGKb
 EfAlspgPvguakHZzls5iavUCbavzqtCJsVP7Q3o3/KtT/tKm2iUSPPuqLZhCCd2kc
 aGY1Xc1tZIgJYkSLBg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdwNg-1swVhd2Q90-00mAhP; Mon, 24
 Jun 2024 19:16:43 +0200
Message-ID: <8d9791ba-14cf-481f-8964-341880865a0a@web.de>
Date: Mon, 24 Jun 2024 19:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dillon Varone <dillon.varone@amd.com>, George Shen <george.shen@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Natanel Roizenman <natanel.roizenman@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20240624024835.2278651-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/amd/display: Check pipe_ctx before it is used
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240624024835.2278651-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:iYOxbUd/7f3wK5ncEyBEN/Q53syMelXlMbVXqlZkEbL8mvcBZ6k
 ZrOms3leP2hoDMYqxo0dms8w44Dmr/iNZZ7w692BEhxfOZiYi+xgqiYUU6IK2zdnwpbyops
 xRSRpnX319A30gWC1+zvcpJpP+cu0n0yvD4xhJv0mOp98jFlyb8ILsG8sDVsR3Ax31U7R62
 mxwISQHFqPAKYd/Oj/OfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0FDCty/50O4=;LrAnG81ZmgYLa0YVEo58iS38UZ9
 y3xoIvBTWSsZzgqcBjpOBeApuEp38UKLHl/yMigDPUCFljO/tBRQ2fEJfZdGw8bs4jZTpg9Oh
 jfO+oBRhQOFKJLdgAZvmNeg4uds0gUO2pVyLnOBwegymz8jg+ciZeUT03IvKBjniqALbhedFY
 MSF2zaRByPL1srQTxDqI3EOSGXsVP89bPSIp7XEPnwaJc93lP671jA1iE6kJPS/4oqZcogvQR
 cZ5RPnalOZZb/rJRMxZuXFRXmAf2SRe5aorN7al1eHxtK46BR0yxGZbPzblKEZFzdtbyeErUm
 amMoO4byxprl7ZbBE4qFm9LQ4zgt0xbXSQU2f0FJ5C+lDD5+rtlbhZ/xUz5lXpkY8iO+PeOKi
 0ZotloisqAEFfoNiFUWCT/OmB2Rd6LXuMTqH5nOenHlzg649SG8Itg3kZW+o9qXbJ2sJ8pxqB
 FlPBLZL24WZ2dB19zjNv8OBb5Q+SdQ8PALd43U+uP25MW8970VFRI2loz0MWG+YEIF+sGLXwc
 6mijamvwM9Ul4XjWeaqODOLCFOOztr162i8DUKHmA/Hyu+ULnuAyPpkHaPRDXGZ7b2Y6mrYIm
 J4CuPJdQNV1sJh0vgD7VPz552b7NYbc9Bil2KDuHnoVyA6P/Ti2rCPPYKz+kYsT6dbELiUwHt
 ffrJhP0hZeNVP1hLi2qkyekWShsSrmoGDjMACW43n+j0unMm18AR+KzfrxbZabb0G2ZNBr6hj
 heK7Cfn47qc7jnu0W1pMY6RZagmvGypflug/SIc68vhna+hFM9mopX0IRd+UYsH6ZWKa8B3PK
 t8U3DX2Rklww8E3bSirqq52JMdX0ugPNxj9fIG5Vvi+PU=
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

> resource_get_otg_master_for_stream() could return NULL, we
> should check the return value of 'otg_master' before it is
> used in resource_log_pipe_for_stream().

A similar fix was integrated already according to a contribution
by Natanel Roizenman.
From which Linux version did you take source files for your static code analyses?

Please take another look at the corresponding software update.
[PATCH 16/37] drm/amd/display: Add null check in resource_log_pipe_topology_update
https://lore.kernel.org/amd-gfx/20240422152817.2765349-17-aurabindo.pillai@amd.com/

Regards,
Markus
