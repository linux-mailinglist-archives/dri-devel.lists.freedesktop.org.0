Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E4937FEE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 10:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5ED10E27C;
	Sat, 20 Jul 2024 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="pyt5pvMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842410E27C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721462759; x=1722067559; i=markus.elfring@web.de;
 bh=J2t61GWW3REmuis12f1LLVLCFhXcXognXwQFM1bnBwo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pyt5pvMJRTCMuUKVWUSV/4gAq9BQ9UzappHUjzh0NuaVbKRF/LpQTujSpqGBoysp
 buS9phH+qdZ4LnIfkn06z8y3/8PVA3G3SuAqZ1Cq5AXIPKSuN88fWd5BGTdw+GRxM
 0XzGW9bqYaWkfRH1WIn0Ug/Q8Kit1rjV27+IVi2bLWJz9MpILX2QL9PtWZDL+UuwM
 p6fW2SLtjYlZSUzZHvzU+zdQqJokQ9CXLnqxwhgSuQ4/JJVpZ66ZosW53rsySQs58
 dOM47ND350xFNtkehiRjeB7OeIFZ+ruFnxUAaRuJH4tJkU+hx1fXit9gUwltAejD0
 Zgi3NqCzX25W0dldow==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHmqC-1sa0Vl050Y-00FVi0; Sat, 20
 Jul 2024 10:05:59 +0200
Message-ID: <f9100627-ada0-4d78-8b98-15d6aef64d9a@web.de>
Date: Sat, 20 Jul 2024 10:05:58 +0200
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
X-Provags-ID: V03:K1:57w+CsTSOckOVyVlPWbbo/hHQqSD4779xgQm/wtX026ldaAtQHa
 p+5z0cgDngoSWBXCiH+8UbYObfT/HS+9slm3t+Uuxz/jPd3OozKpVI8Z//ZFbw1xeiYw5yD
 t13pWIwlbDDsJyrMPGm90u0Z8fnRHOO7lsDTmJ3SCN73zDzkZOYE8v1M3bcP84ElFDo9TjJ
 IaXEzxZMDfQkrJPOjFQUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KJTEVVoI8C8=;O7kiy57ni35JuLZLXdN4Y7sRIyo
 bSetC+tCsvX/9Ceqb3mj2UTlQSek9e6Gmlr3KFgEJ3Psc6lziyw4CiC1CLPG8UuHF0Y7kXs8f
 fIWYeRuYkEo5DpjKXRuyK2oYU7ub0+oD2zvpFIabTJYU1VrCxYu13qN9x5xwTiHOampYO4f9b
 spnZ9bovEHPzqxs1v44Txwm7AloOm8XXdTlCh0gVBM+dhGb6bx3MpEMG6vX1PXiA/22eRijq8
 yJY3tm5O6bGEiGuHKOszIgoacoE2JNDyCQaPwMEvjG2/OJacoGq9LrCBJJmnQEGfPMBfWIvMn
 Q4O+z9dl86T3iiJokjFhAioCnCgzqn9G6Et/CNlu8sam28vDo8fM7H4OKCjY/PFzJjHw4ZL1e
 ZYRtvCh2VrDbg5csPNj3I1CXjFK1x1IU2ESWBIa/hbnmf9GU8i4MmfJlO+tmtrKnTCvCycnoB
 DP055aIJtF3OosXkMH3ybT0HnvUt6FOFmWZFa2ku9wcdt7hY+3czmgY4ewT3y+9MA52uTNQ0u
 mjL+U7u39MrIgGJrJNQkM86NO7r4hwxWWm0aY1CW4jWrDmDNMAXRIIL5oIj9CHN3pyW0hCSPg
 46Y80IsRI86xM/obGhFW5pUszraPnAehykBUMNtbDFnbQyMAwDHiVMHi2asjHoM7LNx+6EZm9
 +IsQzy4BbVFeZFp7754eoVacvd+QFFw3D2MxyKPmBHbl7i8VIjd3m7UTdBwozPhHbAvg7s0Wn
 UG4B9YYJWO5p7YT9pbo7T5zlqEAq4YebGTMLYTORamKh2d4WpoenEB14RqDCKA7b7k6bLXTOQ
 4RxdP9ujtXBIMyroFrBIm2Zg==
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
> +int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
> +			  const struct xdna_mailbox_msg *msg, u64 tx_timeout)
> +{
> +	struct xdna_msg_header *header;
> +	struct mailbox_msg *mb_msg;

I propose to take another software design option better into account
also according to the application of scope-based resource management.

* You may reduce the scopes of such local variables.

* Would you like to use the attribute =E2=80=9C__free(kfree)=E2=80=9D acco=
rdingly?
  https://elixir.bootlin.com/linux/v6.10/source/include/linux/slab.h#L282

=E2=80=A6
> +	mb_msg =3D kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
=E2=80=A6


Regards,
Markus
