Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44B91A560
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DEA10E199;
	Thu, 27 Jun 2024 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="bWfhjKvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC4610E199
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719488022; x=1720092822; i=markus.elfring@web.de;
 bh=A7rM3y/OMnB34PKR/RnqFiGJ+fS+Qyq19jgyL7mRwdI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bWfhjKvQNMn2j1KF83zywHnz+eoZxC6KaKuZxFmkweB+9RqypJ1Ah6Ia+fGBWyUc
 wv2ZVxfjRKCUldkP+B4V7a8eytwO9I49N5dDLv8Z0DbspzNOW7v6nR13IJMbB1RnS
 kiZm9647+hc4Nd4WkG7ak+v1XNEyo8FrHIudpjqbgZBPkt6q4UbrcJ3c4tJzTjGu2
 q9URQkqRnqAMqhx8OIKYUJult7ZEjOz0jyTMFdRttKZEmzyXs7Pde6/UtgIHcktLp
 PdtQyzTL0WNthjIl6kPn+Jphf5Kgo71LXqm65TO2Rf6XKf3X+NcpFME7YyUPYxACi
 FTgaA0+vys9tcV/XGg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1smGJO2SPs-00cmj0; Thu, 27
 Jun 2024 13:33:42 +0200
Message-ID: <eb14ae3b-7a4f-4802-b9a7-9ffec3b951f9@web.de>
Date: Thu, 27 Jun 2024 13:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@gmail.com>
References: <20240627063220.3013568-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240627063220.3013568-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AOehDKKFPtxRHQPkx+LUzANkyLhTBUvzpw4KeRmCd3rgH5fsgxR
 4hB57cBBQdjqt/ClaW4nBIog+T3Iadd5g5BlQPDYfJxlRtY3+TphaqUqIwXuOaBgcZa14VW
 vwMQmNT62qmSdaQH/4h5xTD/ZEE1kdLUYZy0U4cXKdxNpOEvVoz29cuP12WOzg9ha7023tX
 fSddlKToMHvRrbkMH+QbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JG+JqApF6Yc=;luGoJh8GDXk11DTuBXjZEvPBHkd
 ixtgHsNKOZX0DvF+p189t6tpAq8fTCFLkM8GQaKiPdUFZWMFof0C3W1dx4dARME4ukLKR1pe2
 wbmQuRGMbppG3tKXuLIdgjWsi+hrNY2jWcCaIPOZgP++KRFWMc9Eub/Mku0q6s615bAEr2110
 1UwtrJ8Gjf+Qc3Lqn6iLIb3XHp4JFPJgbsgXKiqsPtJQqsjTfJ1+aEimYnmfOdZeZLOHp3qtK
 FQr0o7xtcGnw3aVWWqi6GCbsdiCkVs0anW3WwRMkPuTWhWel0AkyAqvmyp9kq4i9of74nQNxM
 sDaHBQ4DwM4kgYJmVFh7RRiG2pnLL4c8ZPtbJkPzb+o8jCJkrEgz04YqGduIeUcbYobBwzL9v
 OjTm6hJ9QfnFQPi/De7zjiAaoAVnCwIMErYQOhdC4Kd8wt0wKl8bPybf5XDasS+r1l71oY2a/
 Q07IBWEnaFWVp21tTOSVTbNMPdtNLkr/muzQ6dX20xAaRikGiz9zyheNOCyJBvLpx0icKW25m
 pGJLMGX9FzAVTlwVSVs8wwuCxHnQz+jsCOn32KEayKGbl5nHDDx5vxmX1KofAR6ECRrRIZNl9
 IcOWdBnZsXkmCbpUPrQ2ICXhKFaMmx+IG+I+iZRyP8HFmlfxp4igmSX+fgVxXO4sjV1rgYl1H
 2uj1VWk88o6zIzmXXo/cDNzmGNRWAKBVHv4Typ+M2Q87VMLqEmg07gQGDOpRd/sSXGDndx2/Z
 YLNCn2mvqiYNNvxZoiokcMSsOiltY5kEA/RnrJ7BwIEtRUj5b2KDPLP7WjWe1BL2U2SLLk+tr
 kI9ozjveIVyvrDXhppRPlI22vu5gyFjXudWSg+0FCqvjk=
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

A) Can a wording approach (like the following) be a better change descript=
ion?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_mode_duplicate=E2=80=9D failed. This point=
er was passed to
   a subsequent call of the function =E2=80=9Cdrm_mode_probed_add=E2=80=9D=
 where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


B) Would you like to append parentheses to the function name
   in the summary phrase?


C) How do you think about to put similar results from static source code
   analyses into corresponding patch series?


Regards,
Markus
