Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27FD13428
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E100E10E3FD;
	Mon, 12 Jan 2026 14:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DFNd2RQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F6810E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1768229162; x=1768833962; i=markus.elfring@web.de;
 bh=JB3LMZssOC1R7HPEWMIahRL/6h3qVOlsb2QWOfHvkSs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DFNd2RQeTcl7cOt+nep42ABUF8OuRRwFf/GWhkLWIzZJlOvzTtVBWnqvWtTd3N2S
 qoctqabKCA8ENsEucYI4Zd6vFuC+xym5q/bAAuMPNmMJcfq3/KzczN1jIKEdC1UT6
 Kx6J8SHJqavA1g3HGB51jIkRN2uzzYJjkEYyDXqPyZ9rZMtLW3K9IcfSCet2RaL8K
 wQ5dzvaYCqD0I/+GiLpXXIjqaHqYthcF86U3he47bKnKw7k8ucw67+plxQ79KVZbx
 i3O+7mMhIzjpmrqhZxjcHippWm9gYIKgtGhee1hvtFEEp0GhKHRmkwYzpjn2F1tLs
 dz0UhigjLBtYC1HnLw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.241]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtyA2-1vyD4g0wn6-012qGd; Mon, 12
 Jan 2026 15:46:02 +0100
Message-ID: <32d0d8bb-0bf2-47ed-abfb-d84b475ab16a@web.de>
Date: Mon, 12 Jan 2026 15:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Fourier <fourier.thomas@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260112140031.63594-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH] fbdev: vt8500lcdfb: fix missing dma_free_coherent()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260112140031.63594-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Shb2M78DrD2g1TfnTywKZORPLW09S1hkc4jdIdfzicgt50u2r6R
 z9qbaRHP2ci7avAl8Di2N3QsKCaSAVGoz3cirybCMvFMIPJHKYrn7fLgFUdmmYxYcg/lDZN
 M9cnaSbL4+VMkqMJpqGB6BvJsbQet0xTV/dILP1mNRdlj/FuFWNlx7sl1IR4dYO5Hn7MmFQ
 I8K6fC/6D8xXvsATAxe2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sAjdl+rkN2s=;nB+ui51iYZXP6FmQEUJFgnSQH2U
 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
 thJ0ElIfQDqA4IUFo=
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

> fbi->fb.screen_buffer is alloced with dma_free_coherent() but is not

                           allocated with a dma_alloc_coherent() call?

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/video/fbdev/vt85=
00lcdfb.c#L352-L362


> freed if the error path is reached.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc4#n94


You should probably not only specify message recipients in the header fiel=
d =E2=80=9CCc=E2=80=9D.

Regards,
Markus



