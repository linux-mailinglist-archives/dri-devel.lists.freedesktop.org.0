Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20DC25DB8
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2C10E07E;
	Fri, 31 Oct 2025 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="w++npf0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5210E07E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761924903; x=1762529703; i=markus.elfring@web.de;
 bh=lSvuC/KcxKeVuAb60LPnWWm4nybSjq56GDvtKBR7ZDw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=w++npf0jE1C9TUmzat86JRZ2EP3Zfo2HGZEyptFBTYPNcbfEvP+xDRe8YAd8HGkB
 7tUz5TN5nAmHOgv7s9nq9R4NMOsIPvyAjzdxwEBRbjc9zUxTTB2tfOz4tv4DWQf28
 ckp53NQei0wWhy1aq+Vse4CT7J2PM/MS6bN1SpeT1BalR/ACRIxNEWsY5p01mvzZ9
 RTIXDUNMybC6Ec7xgcW8tsXMOYbbHDqL3rwwdraKgrx+GlQ+KiRSZbvVQurfHDZFO
 b5W8QBHxQmOLGH4bsalfmR+ZmZwkiKRezApRULtvKJs0JOJREhwVgDjTYzSEQ/3vb
 gvexq3a55oqpEIIj9A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mi4z5-1vsZct3n3h-00p3Zj; Fri, 31
 Oct 2025 16:35:02 +0100
Message-ID: <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
Date: Fri, 31 Oct 2025 16:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
 <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QQ69HncWRHyZuyvGaUuWLaFhIt0L1EXDVyvCv2b6FDcfYGAPQSD
 JhzivJCPjdpZb+PqLh5Y/ra4qNOHEWl+KpiWmuVZ86rh7M10JV79tN1IOzshR2HC2hYTsgW
 IWe9em6Wgm37RMQ+/itD/h1LWNuSHwKznWn2fqEPLsJyKd7FfwSi7Qhgv07WfW9VtsaUl4f
 mcsLK5UhSL65tjPd07uUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bimFpOyyXuc=;chMbPRywxQ1rvlagtHj/ePTUlqF
 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
 +qc3nDzDvIckVpgkU=
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

>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Fri, 31 Oct 2025 11:26:33 +0100
=E2=80=A6>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>=20
> This does not match the address this patch was received from, therefore =
DCO does not appear to be satisfied.=C2=A0 I cannot accept this.

I find such a change rejection questionable.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc3#n409

Regards,
Markus
