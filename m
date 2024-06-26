Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35F917DA3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 12:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3196C10E82A;
	Wed, 26 Jun 2024 10:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="u8Mx57jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B77310E82A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719397090; x=1720001890; i=markus.elfring@web.de;
 bh=GDfZxGNUScq9YaFwJpm3DeNY9vXyehcx9Z/G4rNFFu8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=u8Mx57jxnQA2HGD/gqjBu6F8uG5HKfa2F+2OBaRwkr+20LWk4RYqw447eO6jBvn8
 X7Mcesplc1Yl1OZoJp2nRkOfxRC+p4MyzDaU884Kc2nOs2bOZKMcshkWyzAQRJ6jK
 OHjgYBnCvFSgm451jc43H/jLjN+4IsmYw8fgSOR9hom1SB9yscjI5n2gng9BGKamS
 TWUBM3eKePNFEcPLox/5lyhan7VWMKgmwGWs4HcuVsQHIX+/n4QOIJiSOaUI1+Cfg
 C2VLkVnl6ZF/2niC0x77oaau7l3YPTS7lF8MDtEHv/Mph5e3uAjp2QS2q1H0CoFp6
 ILRzqZ1A9A3unx0vuA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7elj-1sGeZb1TB7-00EUgG; Wed, 26
 Jun 2024 12:18:10 +0200
Message-ID: <84c7c61a-9de2-47d7-8420-87a2b389e684@web.de>
Date: Wed, 26 Jun 2024 12:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240626011656.2763368-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/gma500: fix null pointer dereference in
 psb_intel_lvds_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626011656.2763368-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:01rFRwMVi3531kRlSNqKJqy4VVaSc7+o4NHk0MEHOFFnMzxhibA
 OivBn4+Jls90kxeCzxTEwynhxV0OwQNDGRzP4wVoPgwaVfgWvb/PoSayUoqslQu9/Z7Y9zQ
 4d285myX/qYl+Aa+0vSnFYUU554DZdMMHnkwQpYDvrWQae1VihS6vbtWKxpYmS+nKkR2iV6
 ldUqX3PD7wEBblXES11lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/inCr0aeIyA=;nhO+xV00Cmbe7kK9azANZthrrjl
 PBrZsmpM0GtlAby7gaDXVpqMPIXRglE3SBCutqGW5fJHCG7RqgbPfDxb4k7rbMBsUKOgNJJpx
 j7wS/agVibvRNb90iGvtO2xKjnYy5CHBg9JV0xtch4paWLQFy7pbFaNOsuO8Nr9RJW0G+4qHu
 mexbUT9rnWQAdTUz1rLOJbaU60QF/qlVITn4uPN5pbLNlSsYVKNFU+5Cvm7RNTrgpIaJu+EWv
 8R3mqfpDsyTQm9pZa/OEVaI9lIkqN4MwaifT1aMTClWs1FzALN7L1qJg8dP0MoiXUk1WYeWYh
 5z7dYWGwA0wEvaPlgNZhKCBryhrPHMrQuzHA8vZVSR8TclHpWlvuffqVipnuHHwrREJW/3nx3
 ojhdX5N3Fo48hMJkF6Vvb+UCrHQ/9biZ171+bXiqEtn+l0+XlpFdwb1vwrLOdMHcm+8lViNTr
 Wan7w8dZUkkvJeWZ7cDOc+dDDrdryk2SaDyIWvpG2mv9J6U/WL2AaKh3g3tLVnKeij4S8R5zo
 50wag07jxlQv7FHdFSKKWrhgtvcfXZRW9kfhGA/IWDSeZOLCejZupPSWPLF+/tZEBb9rlDPfl
 dvoaCV+sBtBeU0tcE72DohGfKkpPfVxj1UMkoWc6Lk0G852MAUaT8lht2lNIiGuz/I1+i3i02
 N/px5BICmuIdqET1HOAkIdEK8QcIzoZJDu6jgi0zozqBr1tNyxh8MSKr0T3PnqWoFOuZNtGBY
 wcyoryzCv6M0u3VGX3oiu39xRcQEmYuEHfZ8C1spLSOQikSAl5VKrFXTZZdXGoesdlPJhsYnI
 5gg0I/Z2+rnCr24QYTFiBy/HQWRYOlioF0xWWMdzJsK7o=
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

> In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate() =
is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.

1. Can a wording approach (like the following) be a better change descript=
ion?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_mode_duplicate=E2=80=9D failed. This point=
er was passed to
   a subsequent call of the function =E2=80=9Cdrm_mode_probed_add=E2=80=9D=
 where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


2. Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=
=9CCc=E2=80=9D) accordingly?


3. How do you think about to append parentheses to the function name
   in the summary phrase?


4. How do you think about to put similar results from static source code
   analyses into corresponding patch series?


Regards,
Markus
