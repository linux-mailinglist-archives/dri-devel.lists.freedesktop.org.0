Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FC59B7EF2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA0010E8D1;
	Thu, 31 Oct 2024 15:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="hHSxl4eB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124D810E8D1;
 Thu, 31 Oct 2024 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1730389711; x=1730994511; i=markus.elfring@web.de;
 bh=GUkc+8RtKgct7Ds7007ROrUDlEaBE1pheQ4JLEh1vQc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hHSxl4eBGwxPkinGGhMBcvDfO3gmITWzyeW+Rnb0BhMWV7cNEpV3RxfeU4+QBnEF
 qEJJsXu8OBfEC0zPbm9X7Nc0Os9ypCC5X3hEd0F++ujKDy2TY5ptbH4zrfd3Jw8YR
 lmK3Ll78hghm20H6Gs9nVNsKdKDYDly5bsKNvY/ivzmGfG9QUfBqOcuDepe58q7fv
 60dDsvF+27IBGfPvGzt9ddLemm+0XFeGQG7RRM3eKNa2bl3CbPCNXhPv8qRTEM6Xm
 3GD3zBTdaK0Plj67J0pbyZ4EnvfJfiMOVHvSTOHVtQLmAY7VrVL2hUWtR4RLPQYme
 jJh2ASgVK/8VdgX/Sg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MALeR-1sz5Qi0eAV-005zOr; Thu, 31
 Oct 2024 16:48:31 +0100
Message-ID: <7d4df724-5b83-4e0f-8fa1-c1eaa77827c2@web.de>
Date: Thu, 31 Oct 2024 16:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Quartulli <antonio@mandelbit.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241031152848.4716-1-antonio@mandelbit.com>
Subject: Re: [PATCH v2] amdgpu: prevent NULL pointer dereference if ATIF is
 not supported
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241031152848.4716-1-antonio@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oFvdSBs0i2J2tNH0lC2KClHbAr9sjTfhbq8SdyVrZ51wHeM6wuu
 Gnb5U5Cp4CrLPuIhy64Wdor4jWXM5wM8dgm+aupVdBgfoGNyIRDQy6s4Pa/v5FOb4rXYg+n
 bxHHisnM6wdMzXi9lIHFzP7r2LpzacKS+r2FbYRgl8En/GmyOD1ZsqX2/4+IXYjX+nFcV8b
 gw/X9uL9KJHcQSg3qs+Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3zpQau4nCug=;KYT02Py5jdhE7pWn7ip55fHqLMc
 4TLIQCYYfm0ZFqvSNVlQG5dvTd61jT7ly/I2WFM4hzKHZ8+x4cej9k1dLYHa65vScx7+IKeEP
 JyQcTC/ojQCXzEy+SKIeVq4S0VxRQLfxRR2dZAGeg/HJ/Djmj+2ZOWBCu2MaRehhKiTX8XUUF
 aJqREMeNCnz6bzqlpwYOdT8YIyPdb9OF56hcONymSY4bvF4SIwSORoTWc9srPKzoMNvTOe9SA
 MF11gSDO+awVwQwDyVYrD/viRSF/8lFYofmVl6ML03CVvjbxg93cDXcRyQhcYZRWXhlM33T1h
 1SPs1MRzn+DlkUBNvO7rON/dtSzQPNWQIotdx8mmbYF3CIX6UVRrsVYtJ+kUCzzI+R4YKYuxR
 Nh4uSk9g2Kwib+Ni9uVaKY+1luy9u+ff56ThBvcMrzIAe5na7T8o+tgOvv6po4WNrGM7UTWG4
 TO/cEYN+Avm8Q4PfzUSP8/6bxQufn3XBB6ZITdMrmhHCgW8aGiGnRm6O45tzP/axitIol0tk6
 zasoZPmiovRz5GOsdvsWF2BDUcMwoJAzvtqecwkJ32t+gvZmUdznfFaHagVHHiTv33HFx9iqq
 NdhLvWu5ekLQ7Wn9qD71qv6Kp1BJ3vVxF9/B6cNQgCZhqOgKUtwpF/NP2MezHW0khNdjowqTF
 TSo/luESv0afm4v/O7+lbZBEEMEOZlJa45m+W2xQk/IbqJMCZZhLQgNI/b4oRBuTEaE1iGQ8b
 eTGcc6EC9tB+GaY3Um7fMvP8V0tAjUoVQtEEfTjjzvL2umFD9cKsJ/+kjDhMyZQy9cWSy3KKA
 +RoSU61OvQZDgL4pX+fkY1dg==
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
> Although this case may be unrealistic for the current code, it is
> still better to protect against possible bugs.
>
> Bail out also when status is AE_NOT_FOUND.
=E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n145


Regards,
Markus
