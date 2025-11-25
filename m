Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4BC86396
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 18:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA52D10E585;
	Tue, 25 Nov 2025 17:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="pBQQqga6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35110E585
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1764092049; x=1764696849; i=markus.elfring@web.de;
 bh=pHQrJ0QTrzteA5L23VKLWIdkwyRtKvK58MocoIVLthc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pBQQqga6X04+kJAcy7Ot67eFiUUXKpEp+CmPEMGvLsTDUqrM/2108Eog0bNJw5RG
 psN4OIPJIlGpenL58bDIiEvka3PBXHxplO+B30MjRRYbM6Cz7UfHbPvLwUhK/ZjYA
 JaA0wun4tc2oeIXqhXOrLbR0wqEoBIlb76C4ScznZS20tmsC2NbhBtY2E+tyFSNAX
 x96ay8ttQhuPFiCcJzrxOnD0ajmA23mS3znkUQMcF0JP+nhDAYtpSegTBc5pmpfZ1
 pmE2VrdWw40xuFPaDd5qaT0SPqqsPvj9tOfF+NnOoz0o14GixbWoRmvHOvoxE2Yy3
 tq8TjGvz5n0xMMIa5A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.234]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gbY-1wAftz1okE-0119xf; Tue, 25
 Nov 2025 18:34:09 +0100
Message-ID: <d2359ac1-f511-4080-8fc5-e3aa6af3011f@web.de>
Date: Tue, 25 Nov 2025 18:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Qiang <liqiang01@kylinos.cn>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251107024620.912403-1-liqiang01@kylinos.cn>
Subject: Re: [PATCH] drm/rocket: Add scheds pointer to file_priv and fix
 memory leaks
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251107024620.912403-1-liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hSIYMP/YZnMv7Y9ECfHsh2AG9hlfbJISTNTwhYbEx6Hh84SOAmY
 75P5FtYTIwfYoKr/laT0kjG69uYtqedwl5wfDpDBdNXuTofKo9k9LKsTHUHNEQHMYMmG3sW
 XdCSlUMdxgvkvDK1oZ2G/mvbd0LJuC78pxlWVfZTNf/XaM4GYpnfX3d15EF+vUDn7Zoj1U9
 4941+lpmJlKLZCFPe18iA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hHtIwlLiBEI=;4UPNEgdc2Cc2aF8javiYmv9F8w7
 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
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
> This patch introduces a new =E2=80=A6

Would a corresponding imperative wording become helpful for an improved ch=
ange description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc7#n94

Regards,
Markus
