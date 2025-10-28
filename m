Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808EDC175E4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6400E10E6BA;
	Tue, 28 Oct 2025 23:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="I+UFeKaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B2D10E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx67Z25Qgz9tN2;
 Wed, 29 Oct 2025 00:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9BmYL/i6Hyf7UCiTg5HAmzogLkrlL+L3F4jpUu6knFQ=;
 b=I+UFeKaTcB5gBy3REC3lkbLDmUTpSQqfRT130ZbXue6jwi/dWhXz7IwMJ71aqZjrf5PKs+
 8fG9lhlosXr87U1JHM+g7TeQjwiA4UR8uHEyO4lnv6cC6oxJZCdIRMYp9QkOk3tp8Dbecg
 3O2l2dpUSRBuhYCltnEA+IxfzDGKkXkj4uTgg7CJDfAVO8D3b4NGKcEB9XzW4tMaYP+99q
 42FkW5Dnjt5Bc9UQfUxPqgSLRTZjhAL+y9/BUifnVvmdJZpFdsiusCQC6Ncj1O3nn6vlXz
 6MyhkiXNuUO/KxLBqS/2qJYyCQ/QQOkyPoblKtpdTKWFEeCq19AWNwjiv0n8iQ==
Message-ID: <214eaf54-f77e-4d04-85ef-38801f88f5c9@mailbox.org>
Date: Wed, 29 Oct 2025 00:30:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0af70b5789e28b4449e
X-MBO-RS-META: h7mardtic5shnaaax9gwsp4qkzg6whc9
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

On 10/28/25 6:28 PM, Tomi Valkeinen wrote:

Hello Tomi,

> On 05/10/2025 06:02, Marek Vasut wrote:
>> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
>> Most of this patchset is boring mechanical conversion.
>>
>> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
>> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
>> should not have any adverse effect on existing hardware.
> 
> After the few minor comments I sent resolved, for the series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Remaining issues are fixed in V4, thank you for the review.

-- 
Best regards,
Marek Vasut
