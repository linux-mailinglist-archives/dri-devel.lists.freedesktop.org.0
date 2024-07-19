Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CF937D22
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 22:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEE910ECAD;
	Fri, 19 Jul 2024 20:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="PM4Iiq6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614FE10ECAD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721419493; x=1722024293; i=markus.elfring@web.de;
 bh=R9jxLflpcSdMk7trtrZDbkZwir57Xu0Y57MmRqddR/4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PM4Iiq6eSd4vJzp4Jw9V6V+qFDpXKebHRP/9HabT5bfiGzqLoMjs+lHMuLvIYPOu
 6G3HgPI6P2Dyav/pckM/VfpmZAmsP9R5LTiglL3tL0f0CP7aOB7ihP9r/7V/McUu1
 GdAL7xqpDdrwtAilf+jneWQrMTIQ9kPeu/jWdbGKo38dE5vCpLi19uu+U6xK2aObK
 3pB7oVIHbQUVvHXGks9ZrJX0iOr9Ikxk/pF5TfRhxibwUeU8+FjT93S2Sn5AV6q5/
 1hwVmKLlD+O3ZG9nn63/fQmBpyP2k0l2sjUgTP/GIyhyvNXjwuLlKxAXxeWdIdWKY
 /Pl6iO9xuBiRYKsQfg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrg7-1swdQe1rIz-00RcPq; Fri, 19
 Jul 2024 22:04:53 +0200
Message-ID: <198384d7-23a6-4866-9f22-3aac028e0ee0@web.de>
Date: Fri, 19 Jul 2024 22:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Yang <George.Yang@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Min Ma <min.ma@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240719175128.2257677-3-lizhi.hou@amd.com>
Subject: Re: [PATCH 02/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240719175128.2257677-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b7Bd8PQGXZNNTXQ5cchbuNbvP4kWwX7zVqY6GVQgKzVzCw66v5W
 3F9nWuXsjpz4W6L+qfEr6V0Ffs3hdWHgiYPDGRHOCLNl0yfbjwLWKZMBgORNCNTLbKf4NIO
 QpBNwk4/F2lfmy340ab5rvf6rerzINKWXqxxImH/XCKWDCydwmjANQ1y1hjxIPoOzY/GWNe
 RjhZAx3keS7fxZqFtTWHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jpR54G7ergQ=;Eb3YztXnztUA0Yl4vvLhPxUygIz
 IOUeTYqQAvb8A0P/ogdCvWYtziucIBW0C2sZ5ta/6ws6XK0K9DlTeYr+MTbRO/Fqrhj+xZdUa
 TeOfcYIPsZmXgOkMB1YwkPxz4ItZRBQj1uq+tk2sLEvvwOw23Aosz9/1EUABFtzE35coFrnWx
 3AACOq72rophWIye04EO8aiAlNYEbSkDJDBD1X+zJH13pLKKWvsT4+i/FkWy2l2B6YDiRhhSZ
 ivs5R70bN6gSf4GQkgrGK8TbLBvxcOwzwSouIAOZg/YZNbb6lWboplFibcwsVM0nMmogOVvuW
 CtBrpXsTmb4t117zVm4wpwuyLegwn/q/kllbcwhVmnF2QUqocUhFOoqfDsPmMVWMM9+QrUBR6
 2BbeHgp8keCm2vaWK6Bm1OYMKW+56CxUHK15TxzPTZt1fuNFmqHbMLlsKmAteY5I0qjpYwXSx
 VWg20citUNkMJt7TAk2FE96BUUknfkuzv5huEj0ljXcZuhJn/7tZFUGv98ueSUx/mp7K9h/IZ
 PEVpxRw6/k2ss6pL4Uhcs0RSbWjmkVJRbd+c165jBpHkyvfy/NBrOB2EhC2Q0/4SWgT9HLmIx
 jcmit6r0msXiBCA8Ec+zvG4Blyu7B/sL0Z8TzXb12aSxFx4eo0sNdPTKkfpctFkN8lvrZSiTk
 oA6Dyr2yahS5usgazbKWXjl89KnKOEQl35iCR34J/+dH2KPvh8Y2nRMtAW7bpIy/AIBfBOnBe
 N6H91qgmDLJpneVosPuRvLOskZvyIu9bvi3axp0KrCD6PfXvWOqDUCjNXW7Wo3GRiQzCQnKJI
 CunBDU9xK0sTQhfTRiPFTkIg==
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

=E2=80=A6
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -0,0 +1,582 @@
=E2=80=A6
> +static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, stru=
ct mailbox_msg *mb_msg)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
> +	msg_id =3D idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
> +				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
> +	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&mb_chann->chan_idr_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10/source/include/linux/spinlock.h#L57=
4

Regards,
Markus
