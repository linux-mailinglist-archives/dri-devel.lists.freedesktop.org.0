Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDC91940E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 21:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752AD10E9A8;
	Wed, 26 Jun 2024 19:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="TM6eDvG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C320E10E9A8;
 Wed, 26 Jun 2024 19:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719428410; x=1720033210; i=markus.elfring@web.de;
 bh=29KHwZye0kesocr9dbrXEFn2i9JHQORDS/QSHCR5JkE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TM6eDvG/9OoSM+SVdICxRRIMdx6I/27LLao9HyGCgKqu7eCw9JftV/l1QQcQ9190
 nWpBPHbBiVsaTqz9RpURaQJ2E8tezAtmqts2UpDMY862srNiCQXTto9U5iiuE+tkT
 EP7FvY3FL3Tv1+4CsPoVICzDDgDNSbdjolOm3v1vxoDfQkWkvwo38WJtzBDSkxB4u
 ug//suhD2qi6q36ep/1ZBhYO6HYr8hc7pw2JSnkbq1pHNUJRe/TVYt3QHS5jB7tr+
 Am7ktLx52BCbqIFT/9RImbkwbKKGyort17DVS68D+mjAmgStqA7vc5/m9I5J6aW4/
 AljtGV8lDzXjWV2bhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6Jxd-1sP50t2yXR-00vvCj; Wed, 26
 Jun 2024 21:00:10 +0200
Message-ID: <9789db5b-faff-422f-a772-d3c4be1fbb37@web.de>
Date: Wed, 26 Jun 2024 21:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, Ma Ke <make24@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <d62e10cd-6e27-4498-b90f-3ec891686070@amd.com>
Subject: Re: [PATCH] drm/amd/display: Add null check before access structs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d62e10cd-6e27-4498-b90f-3ec891686070@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N+qiR8aDMloWDxybWsjmFMuQPscTm7+84T56DXRpPb7kAjI+KLE
 QKSu6Cie3RSPvfNjF9vLArLxaIC10u2DbIZO90rISaM3A5u/q54aRbz9XGgM+NjARiRZ/x+
 snzgJPAw4CMgppfsFLBK1YMZSNgtIDzKzkAMhO1rLYUNe9acr5zntwppUrKOCnQY1yFnjPT
 f11Qgzqylv6rb97vfcIlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GA+IBcd9gGo=;KPp2FlQiLy41n6X8fBfmcAFqaq0
 RJ5OB2Um2s3/olhxCjMg7LX3VaydggOTlQvvvmUh5Pb3W5KycafMTDtvEVfvP16V3C3nZi7Go
 sRMz6pdU6sTx76HCWh80gsKzXsjl/ds1alc4ZtB1Q5Jl7srqVN4QLkIRa3mhxSnqGfiODls+j
 fU7DUiWsWQmynL2XEBRIHHttqOjyEBQgZOAO5SO9UzdlhtPn9FgD8zJOmDhZmbuy7P3FjiDS+
 LZGHkUNcCiq0nj+smNehKsz/5UIzn8yFe8m6YigK3erzVApNKxo/b7/dqFH6zPy1/+y78uOyS
 LKdrQCp4G5RtkAPUNRco5pfeGWgbk6MVnHYcluAQxXG0rpWawSWYLT6hr6fM9v0/aH1L82onQ
 cs9Wntd1Eh78F1sHQSeBKKyjhrOIIG8RmzbrigUBaw/a3ijEtyTZoo4Yyjj94cfONcqkepZ9C
 0xkRyrv7SiSdx5+g5roKJ9l25sxxkFDTZghj0U3dhPOYGvaer24U3csUB5/32fSSwrH2fYh0v
 NRTc3KV6x9lOT3ZdljZTrm2zHfUFhO3HxTgMdqCyVFrLml90H2XuO87E53PJTSvkNITsZOV73
 fVFuZiBtrlnH0EuyL7VbBpBESAQ3PVpx28G06NDMOC8FXnSvo0CA7fQcIK/7/rNly3/vt3ju6
 /WxqBs7FlOePcuiUgawwhG8vb6SLvfyaA/GJ1rUJz1GHuxUIB2f2hDxRXZQnlUi2FiQGp43PA
 ZQAD1zrweILEHI8S04RNB/E3ZZqSL2IHTLkwQeBaenOk/mkYvXB3zf8ZY40JvhvKqiqgKEj7w
 B7pKbbtFV6kGV1Wx6ijEpNPYgGdR6/TryDN8gYUkOmhgA=
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

> > In enable_phantom_plane, we should better check null pointer before
> > accessing various structs.
>
> Thanks for the fix, I'll apply this.

Do you care for better commit messages and summary phrases?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc5#n45

Regards,
Markus
