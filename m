Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE7916A83
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB57010E31D;
	Tue, 25 Jun 2024 14:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="u7Fr9UsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A609910E31D;
 Tue, 25 Jun 2024 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719326060; x=1719930860; i=markus.elfring@web.de;
 bh=4hqmfo5ctGH968xUb+z+rr8LiHMCJOdB3zcu6j3LRIo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=u7Fr9UsU3M+6VBd5zDYTpRGJhqFvgvzY4YrzX23C5I6Lgp0KbH8vx9cc2MKyZNCp
 dkzT37MWVnNmUEpcdL076Ok7w7LDZVochztC4Ty3iBgmpD70AP8+ZXC9RpH6uPqu+
 D+6Yk7PbqPZQPeUtuCCRyq7FJDub299czeluVijqPMelRaeXRE+zYx0obeXQiPA9B
 G6Pz5Xb1GnoHDYG71clPNaeyEb/HfpC8u8yaGsv20FSeyqlEVKg+E49m7YzwEuSBJ
 N3N4vo+0W6jFwDHR07KswcvJrxnwHdRHEkOiRn2s8TWg6NC3gw8SYEIjmcviicgh1
 1JHYofBhbeDOo8I7bQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mkmzl-1sl2f63wn1-00fa6K; Tue, 25
 Jun 2024 16:34:20 +0200
Message-ID: <c7969a4e-61aa-479f-89c8-0373e84c43be@web.de>
Date: Tue, 25 Jun 2024 16:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240625081029.2619437-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau/dispnv04: fix null pointer dereference in
 nv17_tv_get_hd_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240625081029.2619437-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w+lKWxONvobVkG1JBjQ5wfxpvmogK7zfC3one7JxNJttL0yxtRT
 2X3FNzQnbkxaLdb0QHQefzMbPsBUfPIZBpc17M3CtJkoxYSpCVRop7sRcgsds0cCrzG16JL
 45sBtaD4ZQLCbci57s7tU6j4/EnczQZ9ldF89yqCNo7uLR/WEgR67k03y/u/VqbI+aIUgaR
 XzVzJnh9Z66x/b49M7tAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:trJvbE4vUhE=;eCQIKaNK/fS/KPnXOL1hOZwQ4wD
 515WonsX5Vk7h9q7pmgwOtGWyFaCet7T6v+AZVm5PSUfqS7y6d3fAHfcUS7T4r0spc4lKcpPk
 wP2fRFk2qJIOfx3XYpHaUj1Un55DWZNBHbFcly+meblXwapr4wX2U2JdVDWOmlLIXIg7Wuwcu
 OWcjYmRKmZMrwUadiNtgncjLPE7cGJxQYexPcACsLCFeHoOnwcji81IVi6rKJ5DrMXlWMrKJU
 /tby3YQp5CgALY1vqtPIALu/vMtiLKVLsAJAVFHTpvBby15EaKO8hMCjtrMdnu9v8dBVIIizZ
 iVLSmdGiqTL6p36JQCxIw8O837C5lxTeIBeE09mAt/dZEuQvBC67JVyvS4z2IBozGt4Az9wIT
 96RnxFazx5gaUlwa18DAS5UzJHqyrJxO7b867L3j5ysvCwFR9e10MIZemuHeYXwqUKoEj4K/f
 qP2DZhspPlq+Fs2CM+SG18tOdJdJ2vFnbXgDKguPRZUfVCT0C1wHmQi+iBO6k0uEUWOuPo7/v
 OLezWGdUCdUoebLnlGPp3DIORuJvVtYwnDzZe/lQGxOepiZvVSwTRsf2DC7Cm0QtlMcp7l+4X
 8ofuF+uAqVlGK6h+HP3vXCxbBk1QB6lPnnRNeJbxSRXvQUCvfv3BJLmLzvHkVIiqZEowcJL29
 b8ER3rE931Lxr9INbkCj/QBJnDKCzqjiNS283Sq3pQRYCkTY1kWUbNYH1EDY4gGOGK7d6mmd5
 eSJ5B++ussY1vK6rfYjT4/El97/sTzSyq0aoJozgYil1SzQyTSgSj77jBEaWoRrHf9pl+nNuO
 CiRyhbn/PlOyELAV9EH2hhAa999Bw4yCLh6PEAK5a/8no=
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

> In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_mode_duplicate(). The same applies to drm_cvt_mode().
> Add a check to avoid null pointer dereference.

Can a wording approach (like the following) be a better change description=
?

  A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D af=
ter a call
  of the function =E2=80=9Cdrm_cvt_mode=E2=80=9D or =E2=80=9Cdrm_mode_dupl=
icate=E2=80=9D failed.
  This pointer was used in subsequent statements where an undesirable
  dereference will be performed then.
  Thus add corresponding return value checks.


> Cc: stable@vger.kernel.org

Would you like to add the tag =E2=80=9CFixes=E2=80=9D accordingly?


How do you think about to use a summary phrase like
=E2=80=9CPrevent null pointer dereferences in nv17_tv_get_hd_modes()=E2=80=
=9D?

Regards,
Markus
