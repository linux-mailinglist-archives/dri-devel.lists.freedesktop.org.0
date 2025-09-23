Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F915B952BD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6110E5BC;
	Tue, 23 Sep 2025 09:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LcHkazmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137810E5BC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:11:43 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWDkM6r9Yz9tcL;
 Tue, 23 Sep 2025 11:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758618700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wORAbE+fa3VQa1/NpkSIjaheDrhD2YrnQjGxBf0E86Y=;
 b=LcHkazmEKu/juvjliE8SiysSiob7L928/BkYRTwmYAKlwMQsr+II46XDltoTcpR/YJbA3K
 ptVr2l42L1P0uxZ4sOgqoYGJOYSpp2ZFwJqrb2yWSVpc6iKhIVQRfCJJXTGMQbvGTmVhND
 n2D4GXm52gKkF+GWyVFU9jXx3wJQrtZNkZQNRlq0t6zeI4eSMRH//H8ZiwLP5ST65m/nQN
 Y/lBIRz3A+P9kdgYtlgq5NsvXyMLz2jJgI+pDxHPF+NuqtPYfuVDCaHraIyl1g5a/7gVXO
 nXWMIN0i0nlxDN/CgU/pTR8ApwdoUBgs4rcRH1Y/fUXZUOKaa8DyB+W2TrfNvQ==
Message-ID: <856fe0f1-3bf3-4ad2-9e62-a8b1d7dc7eee@mailbox.org>
Date: Tue, 23 Sep 2025 11:11:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
 <TY3PR01MB1134662359F7FADC6919AE0B8861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB1134662359F7FADC6919AE0B8861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21ace9840633f30e14d
X-MBO-RS-META: g798ejwgtpi3rm9pecnybkhiju5quqzc
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

On 9/23/25 11:04 AM, Biju Das wrote:

Hello Biju,

>>>> -#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>>>
>>> 0
>>>> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
>>> 4
>>>> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
>>> 8
>>>> +#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
>>>> +#define CLOCKSET1_CLKINSEL_EXTAL	0
>>>> +#define CLOCKSET1_CLKINSEL_DIG		1
>>>> +#define CLOCKSET1_CLKINSEL_DU		2
>>>
>>>
>>> Looks like this patch breaks existing functionality,
>>
>> There are no users of this bitfield, hence no updates to the DSI driver.
>> (see commit message). Therefore there is no breakage.
> 
> Can we remove it, if there are no users? Or you still prefer to keep it.
The header does contain a complete list of bitfields, that's why I kept it.
