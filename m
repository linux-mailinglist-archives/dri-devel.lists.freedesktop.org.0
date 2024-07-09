Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C492B915
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3323710E524;
	Tue,  9 Jul 2024 12:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="PtUSgGH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD1C10E524
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720527033; x=1721131833; i=markus.elfring@web.de;
 bh=07u+d8/VVabnzNsgDPxn1WvWRdYn18Z+KZmEgI742IA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PtUSgGH/zk1ZLSvEsUj1h7TmqoGPsawvcXuKyULGBvdgP+WcdjoKlcKN82t61B0X
 oDDIiirI53CUXCHi6uEPFMNSk42roQOATaaBMkgO55Vomvoh0QwzwDwOd9+jYjEyU
 sEQOOw/uL4DtvetB7R1R94lpqDvzycQF7cZITY+VgZpOiLKaJU0KHKuumeYDdkIMw
 1/Zgk0SqKwwRI7F/n7j+smTiLiFGwDFQra7cfde0Fz73vDvyMymrsfRYHqeBZ+iS4
 WGaj/Rhc9O+QRvVC0/OgTF8Fe9YYtr+cNHkVvymRAlXSTZFZLFMigUsQSQJLrRagF
 DQlpalzJzPOunqAsqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVJNd-1sqlpe2EcB-00LfaQ; Tue, 09
 Jul 2024 14:10:33 +0200
Message-ID: <1fe42fac-b3b0-43fe-9270-79afed5fba6c@web.de>
Date: Tue, 9 Jul 2024 14:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wei Liu <wei.liu@kernel.org>
References: <20240709113311.37168-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v4] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240709113311.37168-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d1pJZ68qXVLC5hDwh5dRD6Gu4W2nu8B0JaP0M5KPoZ4RDYSO2li
 54bTlvMJ+AgnnVabxrF789qHsFdBA8tafROZY+vtw2bjb4lDnngz8EweGuhNMimNbojDr91
 yY2StoZShqaVh+L+Pkju90eaafFKr1mdk/CX/fhqJE9q1m10cUIUIKLGuOhzEtJ1yMFYDqq
 AkbP11Bm8UZnaCwvJDMRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SB8L1Y85kb4=;IdtYRSGC0esrjCM//uktqOB6+Z7
 8jcwx3fpx3XaQNYh5US3nMVLJcmk2q+Ijg6X23q0bGq+hNmP3dvTKf6mAu5ObhZ81s5AJ9c6y
 dmhBGa93Nwec2NACODNAFrNomMkpemPjqziDZV3o80TDYl//Q4S7i6b11ElDt/OUYZGHlg4/X
 GGC1pyUJUWoCivIaI9PHxSlgFZ1aQnJwmRwPtRU8KwDjFU/Kz7uVnvGspAsEMpvF/xCw9guOU
 bzonFA4hCKKFbsA5qCRKbiZysTC3kWxO9rhN/wkkQxNEzL6XW5utLELYrKMlDKdGIPXB26+LM
 YwmmBdazbZbCyYZRXHTjaLjmt0SqNipBf+WGdXXp68I+zJjz5hG228RxWJjM9CwML8Dw7uJyY
 BI15TCjUJvbD86mjVjXxPM8UwPv6QRS77F5PHNGlb4hjasqoNNZMZVCM/HoPzRCVaYhG/pXIx
 VqbxFMGv7hVLjh4vBg93Y01+CzcVC6DP/CSZmb1ExsZTP+HpU9QqwT6/sTW3rfv5q3DULch1S
 1dgOgCBH9b0N6C7X3/9HW/Aw6quP1JBr2lwexuFAny3C3LuIS/CbAK2b/yr2E5cyJosTwoUIB
 Hn6neTn+1mfyHpp4L7BzoqfqYdbpsYNG2RDS+Z4fMcUk9x42XULh+NluKOmynfCnPAgn6iT3D
 AR5yNhlGPvbJBZ0B3ayDbEJPI9dWOd1dWSbuc/r0siTaxm0bRgNawhnlCa/vbkRyrhfKKsh3D
 jDh93qeAwIwM4DhryRAFT18CBg80askcrlNUwz8Z7RzUhvesZvH0KJCqz8X5pXjsKSOmxFn7J
 D5Acyn++A6C3j8ZMEccxNltpdYqVEGHJjUeoDnmnmRweU=
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
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Are you going to adjust this information anyhow?


> ---
> Changes in v4:
> - revised the recipient email list, apologize for the inadvertent mistak=
e.
=E2=80=A6

The usage of mailing list addresses is probably undesirable for
the Developer's Certificate of Origin, isn't it?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc7#n398

Regards,
Markus
