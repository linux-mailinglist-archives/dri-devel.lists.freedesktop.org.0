Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D369134AE
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 17:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128810E052;
	Sat, 22 Jun 2024 15:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="nMd4E4gZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D710E052
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719068920; x=1719673720; i=markus.elfring@web.de;
 bh=NFuZ6M2STN20QrhZvyeG736clc+fBOFNekM/fFkH9Vc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nMd4E4gZwwFFno24Ni5ZQVe67BTK3FOhC+Sjcglh8OoJ16pD+j/fiY46GObKlfzR
 WatA2CR3VgLc5HKX4x+wLXaWNYNjoNFKFQehaJkdmKEtUBxvh4Er6h26DI7CU1Q57
 P2Zk+BDUwFL4Fl7tEAKaUh4IafIgd7azz7vwgwz1KSQjKACj2JX+FbrwJEyrhWyNm
 hIfFXJ934kiEP1CQ2vzDsQsOja3v2xJwW/7fNPZcTZ781dsWKBGVsA6Gv5+sAavTV
 F8KCME25R/6WXWRxlVtwuFCaXejZ63AqgFrimUE45w/OgsqiVW6ZziVaJbAAfZW/S
 CjLVoNFvAl81jiezFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrPT-1ryiNP32Yd-00X1nu; Sat, 22
 Jun 2024 17:08:40 +0200
Message-ID: <22810fcc-4de8-4f2e-886a-6af83195028c@web.de>
Date: Sat, 22 Jun 2024 17:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240622072514.1867582-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/gma500: fix a possible null pointer dereference
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240622072514.1867582-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uKlUyj3Lobz03Dm+uCTyo7AVFryCJFA1isK7uPlHq3jgrmTjUSG
 EkgC84iTkkbyLp4QzGCzgr5aZYxvU5OODpWu7mlpwofCyDwGXEZ90UG2T9jJU3kOd3yKn5b
 iPDaZOsyMRdAoryOHvttOchWqOGkKaphMbV4qym+LnqcE5Aln2p2fcnZNR+ULfxKR0TZvO3
 MfhychZs2PSGoJGkBwysg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J7ICRNDoOl4=;qeMy2KtaPZ0r60MYq0eOTO/JqOt
 NBB5ASspRnUZ+KARRQUoPV58jJFYsngKokwrfoXxQ4K+BMwydVj2nScYNyLBOzsOCRtwCoKr2
 UdqDPAOAHCMvE/wa/hwrFBRCTNPoEOsQ4Tc2fEOP+KSVgSGQookBRL3khNZW3csZGohHD75Q4
 2nGvaeXVKqWRVMC9s7dOd8iClbtF1dSeQ547ZjVREEyIC3sXq61yV9Y/oG6aiEhuVvbZUzYHZ
 eIxD+yj+koeti56zGfZzUuSROhNB8h5wkX/q8eFkEtibBfYf/4LQKFsD9QTiGbcNAEqTilp5E
 jFLc8iCCyYByMwmoALPkh4fJ5OEqrJ0xe2zu05i73kmu7eWVLYV1ruJVyZV9IOZVKwxhIZspV
 cyWVQvDPt8jqVZYJ4rm1HRyTrrRLP3E7qin6rw/Vbe8zSX5m9QPzf0MzIhfhjd+hQEKC9vfKw
 YJ96lOW2xf0er2NA4UI5G/XFmQgnyb6k7vaunFGyAREdTDfW5d7OuIS9UIkVDHW7nBvYsfMov
 3N3fZTyxgN7UDEHpCjHqv5cR1HZ5hg/2EPvwIf+ARf+glaj5AN2W2W5326UyOVTnNjFwk2x4d
 cY60/9IfQg5YGgk4ouu9HEvtqEtgcP3DR4gcRJ+7PUjzJaQstyEot3zdmPeGYDU5S9bvSgCqN
 1crk0zcJ4bqnLTVvNtv4Fn71XNIuZ044LZl3tRWaU20F4aCTRzTLdqEm4vhCOGSh0ugorNYbg
 Q3JoVyAxBHgPaJVhdrTHkU3auQCqoVrF7SNLUiQHPygTILeXRHs9fxbHyXSqB8ag0pP73Ls8e
 0ivsZQw087a7ye95sOWsXci9MSuPmMuJ1wsLY55fmMdng=
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

> In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). Add a check to avoid npd.

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


2. Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D) according=
ly?


3. How do you think about to use a summary phrase like =E2=80=9CAvoid null=
 pointer dereference
   in cdv_intel_lvds_get_modes()=E2=80=9D?

Regards,
Markus
