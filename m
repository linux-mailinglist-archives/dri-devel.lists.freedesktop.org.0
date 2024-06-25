Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943CC916939
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 15:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8179910E1BD;
	Tue, 25 Jun 2024 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JZtLw47+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38C10E64C;
 Tue, 25 Jun 2024 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719323019; x=1719927819; i=markus.elfring@web.de;
 bh=DW1LoQxnS5f5LRrDsRgHA085uas+2Iji0oND03zB5nw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JZtLw47+8ZyxUQil47G0W9CULuQE+/JfNdpxAWvPwO4MAdZGujO9q9ZLMc8pZUsq
 8dT5qM08y4b+8tg0bJfgPWZhQU3HC1Z0eIarKnMEtuphSCvFEvHILuhd/hR3y8QDq
 aZl1Vto3FAg+Tt7+rHw0pL6WXGKCV7allTAHdPIKI20Od5oWPiucLMLedhBNKpRGl
 Cnw86c5noH+bom6O86Rq/oseOUbYM7mnXhj4aO2qyJ0pD4jBCD2K26+E9D8IAXasX
 77N1Tlyt0tZNGrCcqoeVGIl3TB1MBA8Q3Iud0KOQophl0EJAQTX+MMnJkdzYK6NWo
 ahwsti5odAruw0244w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ml4B4-1slIGt03yO-00aZqS; Tue, 25
 Jun 2024 15:43:39 +0200
Message-ID: <8517da06-3010-4356-b5df-d9a14454feec@web.de>
Date: Tue, 25 Jun 2024 15:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240625081828.2620794-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau/dispnv04: fix null pointer dereference in
 nv17_tv_get_ld_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240625081828.2620794-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8F+pc+WjJBMs7OzY5IXr8xjes+NHPd6uUM/JgMMrj0JM3JjYtro
 7+xVBXbK1BB3qzpe8Vj63qlrfX6Iz4XB4uAaeID6Oi6sX/8dwbygMeWaU8XJd5zmjv7wvhz
 HbdjafVWM8k8//vuS5mQ8TqHrsP5E3LxNsv8fZJtil7uYGTVby9/NkoOGZ68Rdt1J80WzRg
 rI+Ddk6GAKKeXXlYhzf2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UFhOZZ2eABg=;aZuRWvDiFzEGW8Ba2s44hN220sC
 Gh24rZ7uhloY3U1kRDLb1bj3kxglyTcH2SzKcb63zeF9DrpELlVQs74PzIi0DTQMKqETyC1x/
 A/ZR6Z1s1X80DPDTbWZNHuu1stccBrSg16ByR5cnNzbubMOd10Wj6xrkPatWpcyesm85DFdci
 hWqcnPAU26WwTvUGcFeNre4DWx7u+/Kzlne6/mmFz88v9k5H/eIFW/byTObUixhWEweafb5Dr
 iGMs+NUHYv5bRwRFsmOXrx5VinQD1sFyes9brzw9VhHSK6S8ayNQt9HQdYAmruGurxBNiySo3
 GoaUMbD880Pa8rOMxyEnnlZUjx9y61q9sVT0ByFTm9GPRIZKi1O5Z6a4021dBassSlp5DGDYa
 0Qcl1YAQPG+TspeMG2yniEQgXWzQ7kBo2yas0Vnm8NaryHdPri0HmiSpUKWJ0c5j0PPzkZgN1
 rM0Jr1MbiENq2E/MDbYZlz26A0NrR4ConxomQz72+nTwhUCaNcDxFMY0fdHxcTe8LkWpuZ6BG
 yMjlxYPIzUiS18kSrHV7iVPn/xBVsQMDoPWAF2qLpSiN16QXKr2NBk/S2eeOkuudaPc+xxF4V
 IcMlrb57nadyFv+smgIwXDbxp6bA+Eh2oergs38lwk3ovBAW5dPpMtYzm3pjOF0IBA/Kt/IWH
 LTlntl3lrQZxtj6wgiGL+oeK80uxjXVA1TiDEJcO1Om6sudghNwirfZ280uKovxElkjlOZi9n
 1UB993xA+H//Zig609Ut/fAnVz3N+ffZTLt3Cyh2TuP6LsNx3jWeuey3OSi9Uwf4Ab/3ljbdn
 MzjLGUYSMU3TfsrQ4QhQ7ToqOjZOA7jwwdofEuIbRTRV0=
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

> In nv17_tv_get_ld_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.

Can a wording approach (like the following) be a better change description=
?

  A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D af=
ter a call
  of the function =E2=80=9Cdrm_mode_duplicate=E2=80=9D failed. This pointe=
r was used
  in a subsequent statement where an undesirable dereference will
  be performed then.
  Thus add a corresponding return value check.


> Cc: stable@vger.kernel.org

Would you like to add the tag =E2=80=9CFixes=E2=80=9D accordingly?


How do you think about to use a summary phrase like
=E2=80=9CPrevent null pointer dereference in nv17_tv_get_ld_modes()=E2=80=
=9D?


Regards,
Markus
