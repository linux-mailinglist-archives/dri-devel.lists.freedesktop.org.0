Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71199913472
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 16:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ABB10E00C;
	Sat, 22 Jun 2024 14:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="omYtq9hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B6710E00C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719066428; x=1719671228; i=markus.elfring@web.de;
 bh=OU3x5Yr/XJbHSekpCJjHsOQ0enVAT5S79Ev31+LNqlc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=omYtq9hd4Du2D3dE0n391ig+RBOnSzAX1G6h2QdmCIyoIOdmYTJmuHsMmtaw75nU
 laIbmpDhvHCPn4xrb7uitoEKNlkGCpuWFaXV6PxjTqJMF+lHE60wlZ0GrsYMPlH+q
 SZQddArm1M6fxFBdEk1DBN57OHhdcogk/3p/vNRaOCW41l5gcJu0n15zfv7ocdyfH
 csU6rpciG8FUwddNCdEvJ4GTmAROFGxuOsT6LlxIsCTwN4dKRE6m2OV+i8RQLIGeI
 vip0uBu3E1zavbvkKJwTtIBETBbXrfakbbKhNZYFA2+5dofep76SDZwu9idMuBS42
 kyYP/VYU8LJsAqvntg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwNW-1ssQmY0mBS-00lnt8; Sat, 22
 Jun 2024 16:27:08 +0200
Message-ID: <0032d02a-b5ae-452e-b26e-14dc7f091e6b@web.de>
Date: Sat, 22 Jun 2024 16:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Chen Jiahao <chenjiahao16@huawei.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guchun Chen <guchun.chen@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240622082219.1876200-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/amdgpu: fix a possible null pointer dereference
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240622082219.1876200-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UEl50w9SKYfEiP4nvrpAPA/v1Qhr4FoGAsA/ycA54SOmxbzGd/H
 axwN+KFtDoIptrKRtu76J2DyX5IDAGzPlrG89mVteXjbymSd4zMntXERGDnV4agdj3ynHeL
 Wh0P1qvUAjv3fR3A6UMsfroWT60pkAR56evrkpxSvzRDNpQNxGMqcMuw5ixWPr0SS6+LLDh
 ymINEHB7UHz5sEgWogZ4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mEgeRSeD7oM=;JwuzwH1XlfI/DqiThZ861vIU57u
 /Tw0ZE2FHOVYj0R2f0QNYFwqeXlQN3v71UfzBEAofL2QPnq8jERFdoAXwo1Z2/jn42NxhlU3d
 kRBmrjKsGfJ3mKPQBNO+v/iJ3c15JZ5/XqSIJ/3IW2906hRN0XaC+V9wF63vv/2ENonkWVCaL
 U372v3r6N7vbqKwpO+RZVUeLJQi040IRZePhxiR+rk+2/L84dzrNQHw4GtaXEitHIAUYe8XmZ
 MvJV/hLhSOEs8uTUWIQddAtW2NTu5NG6acIX7J0iJTpQM79faSEHI5ARGc2ofCXPIus5wPhhJ
 oTN4PalqGjfTlba66wU9Q6dMEmdpiSfo1WMmAoblYd3APgRsa2E4yMsF50YLrfnGZV7Cz5VUU
 9N8E4K4vWSV0xoHySbp1t6HhtZ5sJaMehaPO5vu8heuRllhuIJr6nAgFHr5nHkUNPDBMMLo+n
 /pgc7rlzJMbGkc60w1YBLye+vEfmvFwFVdE+lD2VmcLsA7MUypnWOhYE5eVlhYn0cB/bNoXYP
 Sjt51mrG+fdJBlYpx47CyvOKiguSBSpuqeIo311LeGH+CXIQC9FpXW2Yimzre23IO3dqPFJyz
 6ZzQ2PSZl3L1T+d57CYUo49w65PxeETN4qa8DXSviZTO7YCQsWaSBLMZuXClAGeskCbj3lIv5
 QDR7fiX2liuT79TceSaHbBMNbbC0+mdiqLqI36tev9ej8lE3a1otAXHV8FuJNXiUmTxv+CFf/
 h+RFmcKme3NBdV36rRS/CXtNKDV4LTaxRVUJDE2pWEr3QYo0W9I+n3F4JdVMwWEfMBmKFcgZh
 kwNVos00kuEgqWKNkXfNLXdJRuKQ/lTUfxhpFALEqYVYk=
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

> In amdgpu_connector_add_common_modes(), the return value of drm_cvt_mode=
()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_cvt_mode(). Add a check to avoid npd.

Can a wording approach (like the following) be a better change description=
?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_cvt_mode=E2=80=9D failed. This pointer was=
 passed to
   a subsequent call of the function =E2=80=9Cdrm_mode_probed_add=E2=80=9D=
 where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D) accordingly?


How do you think about to use a summary phrase like =E2=80=9CAvoid null po=
inter dereference
in amdgpu_connector_add_common_modes()=E2=80=9D?

Regards,
Markus
