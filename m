Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73592CD14
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30B10E06C;
	Wed, 10 Jul 2024 08:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="BX2XRfzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9ED10E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720600511; x=1721205311; i=markus.elfring@web.de;
 bh=YLjYF/eFVWGg/xIW1xPAMIzk49GaK0gZOh85xXj6gpM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BX2XRfzT8priNv5di15/HMx5X9rHSfQ/Iw1YFnUWIsojTQLYhzeiHnnD4ijQSQIk
 P2gsH3xMRJ5DgqAIPcMv3fba2FQftOCoCZGX2EPhUdvLPxWBGzb8toK8pSBeefuBP
 WkCdtuKAKNtax3FYT8vq1iIk60HVQGaXRvfMPxHozukakoSD5qOZvSKkAvuDVo0CK
 naB+HARwqS8+4evcJJ6q9Cz81+XcBTm/VtbUmY1OxLYb/pPfUaQ/RQld2C/tnkmzf
 dwHCK1d5gpbEcAkgOq8M309TpQrArbeauwyfBwD+j/snHjtcbzVSPrhJ5T/52/2SA
 W3NCEWbZ/omseIiRoA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Xjb-1sIULU0c9T-00tC6R; Wed, 10
 Jul 2024 10:35:11 +0200
Message-ID: <7eabf6b3-e9fd-4c59-8c2d-8dfdf05ddb55@web.de>
Date: Wed, 10 Jul 2024 10:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, make24@iscas.ac.cn,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wei Liu <wei.liu@kernel.org>
References: <CAMeQTsZojC24Hs_zy0UX0Zjq42zLH21yn_hZhkcSKbL5X1jiSA@mail.gmail.com>
Subject: Re: [v4] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMeQTsZojC24Hs_zy0UX0Zjq42zLH21yn_hZhkcSKbL5X1jiSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ztBwSIUruFgutnrDH/yIK49xLeUe4QbnRCIEIQKFqESog/Ybbyt
 iw7A5NjiZgHUCNbH0waliVLhepQbQ4dD900Mi/RFDDDxEaCww5oxcL1wJ9OwtVCkc+PaD7w
 B5lphAlk1pv+FfY3Fuc/uSIyTLEuboJhpI+H985+C9i9YsqMT84lkGohqdf0Yt/KBbYcmOq
 EvFcHOgFrkRHlJxw5c8Tw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lEmTYdWidZc=;iMWpbu+WPrflaguxPa0NHvvIT2w
 p0veKle+VCyYtnui1D8IV36ib/RDceUBy+wJbhJWLGi20/1SiQGwJvNpMV6NgwN484aelKpFT
 V0fT/6hCpqBHSspX8C7IsvXn+OPWol367rK/Q9TmqHm5uF0er4+RrUJAKEmxc+l4nYfBN4rBp
 nfikqoshmdJttbXIoi1yIUPwZnyrpZU+Rw5gOPuy1mmgAmjTfEooKC/9/wUou48p6v1DWzPTi
 uaYfup75enS3jcRUm84EEv+ahJ4kQOLHZW2KgV1K6inEsiG0cLN0pWt+QAI7EiSkb1Kh9Vi+a
 umyGRLjvTmJkr9cVruS8aKQlHFgV7cOlxICHTVmWfZ1v9PU5YICZ458O/p8JA0ssMyvVWWwP3
 L2s5AT0bS93hNR/0vf6pe5E8ah2VybxmBR3SO12NtqF6EqdYxV/OYy/FZzYYOsav0XDXRBeAl
 OwhO/tBxpK2pjnBCfUz1p+58hcMsb2apdNfOcJCfXhHeFQCNNNfgZ2RYoICo24dN9A0fGHgsi
 5I6a90C+1L90JcgfOYzVukMVnZnuf9JT9eSlVbYxZmazo/WIooOs/aT8fFL/K2a7UDPvf9pOF
 OZakTDID+MMXX6QXr5Za4h0ugBM/ijoUpB6K7H2zJ7kAZ9ybK8WIVfXGBzGiOP6677ZqKUmC5
 vxduJZtOWG5gVDFNBRuz6kGJEhLmp+Yk/bQ58PostAQOX347oRVISe8FBEmPBkIuVQdRCajHX
 XgpH3SEIiuFjmzIk5/eXQV250ap5In9zGIUuMv/FqM4LwjQBkp/rRsuj/Rs0hQ/u4VtVnCEDt
 ljxzWab3eu+sFBDzirapH0zTsMM01q4GUz6SG8vdzlB/0=
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
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>
> Thanks for the patch!
> Pushed to drm-misc-fixes

Do you care for the applicability of the available information
according to this tag?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc7#n398

Regards,
Markus
