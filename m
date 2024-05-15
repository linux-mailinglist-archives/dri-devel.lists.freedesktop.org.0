Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705B48C6AA8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 18:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1756610EB0C;
	Wed, 15 May 2024 16:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="iaz+Kt6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0E110E272
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715766620; x=1716371420; i=markus.elfring@web.de;
 bh=SqxkZvoN9xImjR8xkMwC+V+NgpQ/yJZtwSs0BJUtt7g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iaz+Kt6fMpL217FzXfk2gk1GKgPQof91/TUnFK1Gm0RG+gp578YvmL2rE5nwqi7h
 kFIpdLZeIR98oY6zFF1pGygsh4EbSyDIWoONoHSCvxU3sPlcIrta+9grWwxMPm+j5
 2J1zejUMl+T8bojWCSfOXRbzcR4OXNG1YTm9UrXdq4+1+cQXAbB0Z8kIc7xEEW5VD
 0HBzEZpCq+zDQeon8eVoDkDIEmCt2INwg7PpD8YAHE+xWwo4bMpNxowBwlhMuNUus
 ugQXqKxmO7OKwQVq9AvTiSDXk9CTxrJlmWAaoDfU4aEP0+shYyEDIiFu+Q6U7nmXb
 Pv4yBMwJxTudCXGXBQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjMO-1sH7RI2yU8-00CIiy; Wed, 15
 May 2024 11:50:20 +0200
Message-ID: <b0c57221-25d1-418e-85ce-d5a8d31a674f@web.de>
Date: Wed, 15 May 2024 11:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuro Chung <kuro.chung@ite.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Allen Chen <allen.chen@ite.com.tw>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kenneth Haung <kenneth.hung@ite.com.tw>, Kuro Chung <kuro.chung@ite.com.tw>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240515072328.1010920-2-kuro.chung@ite.com.tw>
Subject: Re: [PATCH v8] drm/bridge: it6505: fix hibernate to resume no display
 issue
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240515072328.1010920-2-kuro.chung@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CJ6RIIFqLGJvulUgVtl5ZxlIfTQd+O+AlqIfJkYaxdN0UrkuvhZ
 p+3W7No3kexCVFkkFUqpdiFEREbi+W45nGGTCN45G6dfQNjHXcFJ7FjZEsiaIPtus2nsQJI
 Nc5uD9VmIbYLNr/ssagNb1CqjZypULVq4yeO4kWUxmB/NytyMBUlOsEN7nPjZojAhf0PLyt
 y7Jp6cwOip1O2zrPvWobw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ydA1YKoQGlM=;e3sVT5ewC1KaQdhHnhDcc8hXaVX
 +nnDYQid5AnAn9MnFY2N5XBbD9OXnz/Oy2TUMaTtjJcXgEge9DKJ8VG6++k4NT0eDtXooRX8/
 siG7V3wr7X0yJkLQ3WXkxxgMLBCUpdAy2PnyqX0S8/und8qWyA/ad51lPFXVl9igaDNOxQeLS
 o8kZ3N6ZNSFMMMwp1YU4D5PEbRQFJVgwgHTsE2NqCDyb64HhLg2hJnMtGNec7LiV9Bs97srNk
 mngBaieLEOLN0BB3sXppwD4MLIuYNJtoy7D0hG08OFVpWZ10NwTGGFy2NTOPJRCyshgsquh3D
 +wAh+Ovl5zGjZ1eTjCTysufezWeJE12ZJtB1pGzvn1abSlWfTu49VOXNxzVe3DBkE7kraFg5a
 z5JJfl/oPrQrCTb862Xdl4w/hQYprlRTer0uQVml30WJJDQOosyTL1ViovMGGswdwvEzYbtt5
 t+t7xymeiIf9bdhT4jhqlAM7g+S6VSbiezbF/pOHAntPWZ6cC7CdBndgzvm/wAAlBk0BD3pQ6
 UXq0QQ5P/4pfynRsbfPA32+uHbZYcDJcDRHGWVdFU/LAWu+ehC0vDmzijLRy+OfqDf3C1W0LG
 mmHTuGEYHWjQvW4dN//di0gTfRgPYwH+V7mBAdvj0Aw/NOccGV9RSyeulL2U/cxm3IiXdfevu
 v2wqc6luPg1kQkdfB6oumrFK5M3pI//oTUGWrkCu1jLMOOZ3lU5b1O5UvoJE6yjiB/N/ysiXw
 McVohdygQTwbiHNLBfOgTM4c0Clt3jPl3G8Nh9YSJ+mZQlknFMdTMjSdN7mjtpjCuk8JCGGoX
 v5dkszirEFKutw1o7YlfuZhxBnFMOu/FUDYckXgptkJUI=
X-Mailman-Approved-At: Wed, 15 May 2024 16:33:39 +0000
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

I suggest to reconsider the distribution of email addresses over recipient=
 lists
once more.


=E2=80=A6
> But the input FIFO reset will also trigger error interrupts of output mo=
dule rising.
> Thus, it6505 have to wait a period can clear those expected error interr=
upts
> caused by manual hardware reset in one interrupt handler calling to avoi=
d interrupt looping.

* Please reconsider also the usage of word wrapping in such text lines.

* Will another imperative wording be desirable for an improved change desc=
ription?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.9#n94

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D?


Regards,
Markus
