Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6C915722
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 21:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A3A10E56D;
	Mon, 24 Jun 2024 19:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="gF7CDuFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1386E10E56D;
 Mon, 24 Jun 2024 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719257235; x=1719862035; i=markus.elfring@web.de;
 bh=aPrgENly1DR9PH/wdtIbg/hUadyOA+qJD/H7Iz6sMP0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gF7CDuFFsPMkq55gL++PZQnaBvPNfrsLcFDaC5Gn6ETiz9h1NCfMbw1kS1cjDAFL
 4roaIiv0lQU4VNam3oWBGaq1rNRQudAxstQFKSl6eQMHXzBKJ3Gvg0oCDS8OQGMZk
 iPuwDclIMKq/N82kjzh33YZOcWB/wStExXYqk7eiOC/brFUpC2ziZjiCyTO8xgu2m
 JQOeyR68hH4R78gRclgjehaj2260/FnRDLLaZ1maEMpFkzPIiCeFs4kxPS25LIjRK
 ShL5QDaIbp+5qlbC3nS2yzW2isjgEgRoy0YwpOy0qfvPvx+ye6Fo/+f5oyxy9puE6
 SkwZRwOi1hyq95aEtg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1sBgTe0HC1-001mBe; Mon, 24
 Jun 2024 21:27:15 +0200
Message-ID: <b3492198-5345-4bb6-ba89-5efed7ee2440@web.de>
Date: Mon, 24 Jun 2024 21:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Check pipe_ctx before it is used
From: Markus Elfring <Markus.Elfring@web.de>
To: Ma Ke <make24@iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dillon Varone <dillon.varone@amd.com>, George Shen <george.shen@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Natanel Roizenman <natanel.roizenman@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
References: <20240624024835.2278651-1-make24@iscas.ac.cn>
 <8d9791ba-14cf-481f-8964-341880865a0a@web.de>
Content-Language: en-GB
In-Reply-To: <8d9791ba-14cf-481f-8964-341880865a0a@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QsoC4SXldUzuk375Wc2WXmE91WuMdOt4J165MAo1T/Xm4WI8sDt
 UkA4C/GmyyhBo/SKIBS9z1TwoSbHvJAxi+X86SGr2txUMITQrkUGi/UMa7HA/z4s9RE7kKV
 kUzBUHz8aPd/H5w/C1UoLAeLcefnWp00R43lS8UC+sUjR9hNeAFetTmL8psYtT44BbS4M0E
 1VxnGZ6svJM3C2cRjgoEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Js37ALAPEAk=;yne6aFhk+Z7F/RX1fsfiZBHhWLF
 HFyvXBX4LgW2UjswFYv6nrBC+5q3DRepStb137Z0h01MG15wDNLJkpMzBexoYTosFHDIPwr/K
 hR67oFGyTo3pNZFNVBT+A+veLGbMxw/c00AtHgm9wzz7mwwbCJN5bIo90iA1bnaCBTKGYRKWh
 O/JT37JysiO98iYXC2JuTyqEPZxNneG0/vgFiZrtH038Le5uvvifif2s+iZBps8KmO7yZ10aT
 4QzQGkf3k1F5BjwUeHacmA8Izzn83Q1mmUcQYBc8rNdI3+i+MhFGLy4vQp9saa1lw4CFXi72A
 rDbrVBnWxfoLEXQ6HI52yNJDgcXJuq8On4uEF1UhSp4qyy/P6bxc5KwyD0zWJJ9TBIf5dsjTn
 4yzYRDbswggBHnEzqy057B560PTQHXPOgD7Mu2wBTqMFC3yVpTTfKXnTxvJtjJi2iYHkt6kEK
 OYl/rti+o0wx02VIIy0AmoSv2a0+X7tHo0JOy17LQDqeBAnpTm4nvBKPRx8V/E4z4UkF+rrW7
 3HfkKK17zO52uMrHP60Ta/gbBm3pVHfHtHahPL7lAi8c3b+gW69+BMJ9W3wDzPDBUNdDND2LU
 i0XfUkd8KJly6YXFOCZBGvV3Sypj1/D5Ehv+Y0tPxiS5H7qxqX1FCYO+R32/IA3pQoRnNDW6X
 eQIhn5kTiKaKCnC6hZrM1kiacz46gCO4L+ngCS6zo4dHCgomrMJnHJSEpt+5eSb8OVZftNW15
 IdLl23Pdz8Lt71q/Hi61PUv2ksuc69D46DMEXcia/X+PMIs0mju8EwjrN3cQCfSuKw+P87bOU
 kZRPWCYoVFjnIVbHHLgdndT6RdGn9lH6T1iiIDv6o1x68=
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

>> resource_get_otg_master_for_stream() could return NULL, we
>> should check the return value of 'otg_master' before it is
>> used in resource_log_pipe_for_stream().
>
> A similar fix was integrated already according to a contribution
> by Natanel Roizenman.
> From which Linux version did you take source files for your static code =
analyses?
>
> Please take another look at the corresponding software update.
> [PATCH 16/37] drm/amd/display: Add null check in resource_log_pipe_topol=
ogy_update
> https://lore.kernel.org/amd-gfx/20240422152817.2765349-17-aurabindo.pill=
ai@amd.com/

How =E2=80=9Cinteresting=E2=80=9D is it that a similar source code correct=
ion needed
to be repeated by Hersen Wu?

drm/amd/display: Add otg_master NULL check within resource_log_pipe_topolo=
gy_update
https://lore.kernel.org/amd-gfx/20240501071651.3541919-31-chiahsuan.chung@=
amd.com/

Regards,
Markus
