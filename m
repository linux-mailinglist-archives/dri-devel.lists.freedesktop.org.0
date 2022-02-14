Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4634B5135
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791D610E541;
	Mon, 14 Feb 2022 13:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64F10E540
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644844232;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=nNzXcocpTLziiaXmJXtXXzZBikFlCFD2wzE+bmt0ETw=;
 b=j0JvdQarOl8QpUohjaJWAQGyijsKWzKTLGKxsVfCIblPtaURsH1lTToLD+8UoMhlYX
 /hoQ/oyp/mY1UhNg9iE4pW+w8DgIQKEc5Z+aJ51WlfbZHUbYxM5kpIudNUWpnuSHqljK
 dgasBbt43oSuXsfm82Ki3L9I09EIxqQj8KK15KiZGHadefAGFGmxMqXuga+RkLfrdE7+
 6Q2uWphFmQGH1WgOHHDhLQNK3ukqbZVJ5iofPMWZpUcV8rwab7Mu0JolL4BFDlV0MyHB
 uwFyRAmVXbfuq3W7KJ/zjzDcCfyedSJZeGmbc1YhP+U38NzWSPx5uy03PqvN71Kk9jvd
 Z/Qw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1EDAWyqv
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 14 Feb 2022 14:10:32 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <3DOA7R.Q4SJK4LGL46R2@crapouillou.net>
Date: Mon, 14 Feb 2022 14:10:31 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <EAF5E05C-EF33-4064-B9C3-D59C19815D5B@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
 <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
 <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
 <U0OA7R.MYFTV5LL3N4A2@crapouillou.net>
 <93A6366F-1B51-459B-9927-04FCF730698E@goldelico.com>
 <3DOA7R.Q4SJK4LGL46R2@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 14.02.2022 um 13:36 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le lun., f=C3=A9vr. 14 2022 at 13:33:25 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 14.02.2022 um 13:29 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi,
>>> Le lun., f=C3=A9vr. 14 2022 at 11:19:40 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> Hi Paul,
>>>>> Am 14.02.2022 um 11:13 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>>> Hi,
>>>>> Le sam., f=C3=A9vr. 12 2022 at 16:50:49 +0100, H. Nikolaus =
Schaller <hns@goldelico.com> a =C3=A9crit :
>>>>>> From: Paul Boddie <paul@boddie.org.uk>
>>>>>> We have to make sure that
>>>>>> - JZ_LCD_OSDC_ALPHAEN is set
>>>>>> - plane f0 is disabled and not seen from user-space
>>>>> Actually it will still be seen from user-space, but it won't be =
possible to use it. So before applying I'll change this to:
>>>>> "plane f0 is disabled as it's not working yet"
>>>>> If that's OK with you.
>>>> Yes. You understand much better than me the implications...
>>> I reworded it to "plane f0 is disabled as it's not working yet", =
added a Fixes: tag, and pushed this patch to drm-misc-next.
>> great and thanks.
>> So I drop it from v16.
>=20
> Neil told me he'd review patch [4/7] this week so maybe hold off v16 =
for a few days.

Ok.

BR and thanks,
Nikolaus

