Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A7B164B5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 18:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1AF10E371;
	Wed, 30 Jul 2025 16:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="quhF3/Ao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5C10E371
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1753893013; x=1754497813; i=markus.elfring@web.de;
 bh=lOMtUaYx3i8bMy9bYIr/qCsiAGICtIDD+fh3Mzcc04Y=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=quhF3/AoOkmBX/br0M11hZ5eg8gMFX/mcygzvlNwqMTL9xQ7yv5HlzIQnVx4WVkc
 WNeSSJAvgGNtbJV41pTEPUXw0yil3N1IyLQg5tQfOIAjZckFTt3aPvzyV88rgQh1I
 Ymh7p4CYQU4kArH9hI/cchLC4xkQ1dp5ZV9X0SKd/hGc5cTa3Q74KtCpgmTlAlgh8
 L6Nz7WRdn3DTKYwrRM9AuaSiYb7j31VB3TwpkXTWrrpB478V+jp3J4LPWJQzL0UOz
 /poKoHapug2iGyw0Ht19UjDWGDmmW+4dPwcy2tXEbGbLTKsiUQXHAXwdxN08nWihn
 nR5QV8+YNpUK0ArXog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.238]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXXRF-1vAYoc0anH-00QKeu; Wed, 30
 Jul 2025 18:30:13 +0200
Message-ID: <20574d0a-0a8e-4b54-afe3-8a0744df9d09@web.de>
Date: Wed, 30 Jul 2025 18:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Ian King <colin.i.king@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250730142905.2080035-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] drm/msm: Fix dereference of pointer minor before null
 check
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250730142905.2080035-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MYt42syjUbB2ixPRz8ILRnIR9ELZrqzsuVLn6eHJLa6anlgJgmV
 nZbNwhXhaQsUDIHP3T+Q/3uRHlmvUntQku1SAxvO6m+4aytLlsPOuQBuxnH9Lenmoucrq55
 zlNXLbrwq0Su/xLDO+yvbsNA27DLfJAUSI/q4hxk9ZfjDx2Fd6NbBxZ5SOLnjx4FE1MhDni
 1vSQZ7qVjSDwgrNU3oquQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oCDTdeEbe28=;2hv7EIh5M27uoZTJcjCnaOb1Mpo
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
> by dereferencing the pointer only after it has been null checked. Also
> Replace minor->dev with dev.

I suggest to separate desirable changes into another patch series.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n81

Regards,
Markus
