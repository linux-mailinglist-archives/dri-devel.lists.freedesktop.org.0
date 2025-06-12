Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00133AD7C56
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8DC10E149;
	Thu, 12 Jun 2025 20:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JtxOZU0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BC910E149;
 Thu, 12 Jun 2025 20:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1749759910; x=1750364710; i=markus.elfring@web.de;
 bh=l//TA/wIxUleMp15iIiBD/Mnz0+P2PcGzVXJQCu7cgo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JtxOZU0Bb0KCjL9undv45j90FKoU0oXbT5ZXeDKxESLRRyeH27izkwlNfCqD/xB1
 eupaVVNcSWV/pQ5BhiRZHjMWjCixqahN1FpSa7sIWJVYdr8G52EoSJWxsZ0mooDr9
 lpGPPzZDW4LhS8yYosXle0boqUmhmoZ8PmflJebw70C/P0VomAnJT16DrUIbnuvMj
 G49qSrG0iDoIxjo50WIbu+EX2ynnadglzcglZnAqpSrx2ZqnT11na3mp5MxPrSDrr
 2jt7p3m7HwjbOw8lbp4pTKyUz8uEwFwZKuqcGGvHQRTHB3TxKaf1sL34EmOamX5RR
 8ZOVnylZ05HUdBQA+w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK574-1u6dTM0xYc-00YXDn; Thu, 12
 Jun 2025 22:25:10 +0200
Message-ID: <a0f391bd-4bea-41c9-8c4c-cc1237261e0c@web.de>
Date: Thu, 12 Jun 2025 22:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
 cocci@inria.fr
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
 <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CwmAqMJtLC/WOX/lrln3aBeTTfzPJqj7veTvO0d7RPoT+Y3/0x2
 AUU2rmDO2pYs/7lyefDrbNyuFHKGmp7+SKOtv9CFLhYt8x5gCete32jmT96nsZqLwM9BCAM
 JoihQ6ARUa6+c1VrSTcPQNxBSw3tiwIhWuMvjzIJk8oXZLyWr6ahx/ai4C4md4+8I8EVlKw
 sBja6Xq/hztnkH89OaHjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ktVqxSortBc=;8nMd/P9Mkb4oM6NrEJRSTJVAxNq
 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
 1j8v78ikg+0Dj83zdoN+HSdtzmCmn4nvu+NpSA==
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

>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp=
@intel.com/
>=20
> As the patch wasn't merged yet, don't add these two kernel-bot-related l=
ines.

Can such information eventually be omitted also by a final committer (main=
tainer)?

Regards,
Markus
