Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E583B08B24
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 12:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6501610E800;
	Thu, 17 Jul 2025 10:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="akf2AHgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970F010E800
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1752749433; x=1753354233; i=markus.elfring@web.de;
 bh=bimHPaBVRFzOcIg3hsOFOyJmN+xsJmZuG39O1v5bTas=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=akf2AHggwn+Aep1URneTLW2uzULXnOCMAyaEeA3UnobWXA5sr1NssSc2gR7X5MyK
 MlwHiOETwO4CfJJHbH7isSCjBhbLRkACAYYlwUw/w/dYbhWJOSTV1JQXTVFzVfE54
 AUYSazV0FrZB+ZKW3kE4jheUNhqXN+xXP9IBqSN5S/yzj5upiOMBEsy9wDzjleHq8
 nMkyvz8VBsPPW+Y3KeYQEYx8wdZkjyFLJ2tRNCCqwVu/ui6KPXkpGZg0zcnTn9rLD
 0A1a3etw/sAJWwaRecNfct0g2IeJhCWKYPbC/BhsV02OL3HcuQcv+7ItzSvMI1B7p
 5wcLDI0udZNEn/uBNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.185]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTL1-1v9V5M1Jof-00kWzM; Thu, 17
 Jul 2025 12:50:33 +0200
Message-ID: <e46c137e-8d31-4c61-83b0-ec01e1d8513d@web.de>
Date: Thu, 17 Jul 2025 12:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lihongtao@kylinos.cn, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250710030527.167710-1-lihongtao@kylinos.cn>
Subject: Re: [PATCH] drm/panfrost: Fix leak when free gem object
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250710030527.167710-1-lihongtao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NBgso35dyLgdBM7vmiBKrv/TFW4bOmXCDYZ1muVQgmvlmXby2nJ
 0pKCx0hPIMaRH3YtDLcM+aj318jhhx7nDWmK+0FTIH7zGHXw+4q0jZz6O2T063SqPXGupe0
 YGi6vL446fb11C9cuIBcaPhqvPQktGf1kwJ6q9yKWE0SK6oambNzwGtC0EjzJjuSmdrSxm+
 yu4Hf8AiNtQbHsJoW8I7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UUVsK4oT/w8=;441H2mriJgR5bJznIpan8tFWcFt
 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
 kO0ZSWQLUHCRiC7KLZmqiqhLww
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

> obj->mappings.lock should be destroyed when free
> panfrost gem object in panfrost_gem_free_object.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n94

Regards,
Markus
