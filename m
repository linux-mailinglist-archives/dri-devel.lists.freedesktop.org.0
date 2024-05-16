Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1A8C7187
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE710E002;
	Thu, 16 May 2024 06:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="eyN+MCwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704D10E002
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715839283; x=1716444083; i=markus.elfring@web.de;
 bh=Cyh+eg/yRQoUJohGczjwN4WgfqvUfMeQ6xYM9LQpmSM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eyN+MCwhadgWF7AkhcROllHdp96/idsb7fQuCeahUz4X1pcYx8Lrvrndo4lCH8WK
 OHBGvrUzuGH6/uviHkA1Mr04siqg8WoJt2j2ZsaoNRqU2xioFOcPOHV6kjDbkEADr
 sWaJavXhxwl8xzgjncmvIp4ATu7Hp5MNau7QNCopjcNOr6JLbzh16nBBamx8/BSCK
 bfJCp1VR0FXIMGTWgeV7zNzIup+ta0NDhCYfWI6jDxS0InYm//VFOkZeMC2yrDzAP
 qvcWeKhkqh8dQYUAJLUeAjLiXArfnReNpgzmdaBKjfY1SUfcS4d+0VcGsPK0Frmh7
 Knp5DXs8IeZe257v7A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3tF-1sJqdQ35Xz-000szD; Thu, 16
 May 2024 08:01:23 +0200
Message-ID: <68b2d167-6241-44af-b50a-feb4257e5a78@web.de>
Date: Thu, 16 May 2024 08:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-3-sui.jingfeng@linux.dev>
Subject: Re: [PATCH 2/3] drm/loongson: Introduce component framework support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240513001243.1739336-3-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TaIRuGzWCIt3tYqyHddJHcD7QI6a0iTTV8jXc9ueJegtw2j5MEg
 nYPLHiwDo6jdy3YGU8XkshijPrVdV1WsKEHB8GDRC6x03m5ur9t2DlC2JvuzOi9Q5G3LiaN
 zDmIarFJ/Y5QJ7b/edk3MEbfiKJT/+raoY8RuKmH2NzqvakVvamhPZdW705v4tOBqdS2WVd
 J/jCz453Xh2mFc4bEEeag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FVEYT3FbxY4=;tNVf7Y6TSTVEAMpSIU5NAdbOy6u
 PaQpOQ7d1Ixbm1+WQK3wUNYpulXmpRDZpsaD8ZKbKWALzgNAp6RCngttJrH/czd48VXpLiHx6
 XRMjCE4m6T658yi4i4ZXoZed/PtOFxjCqRWyZU/yVmX3bqS6JVpPTLvzvYqS/mf5FmVLUOYuE
 nVMdiqYw8pGhaPJOLp3DpUisfdqTGqLG4q+MH/WvQ/xXNlFJZolfDrLComS8aaPxFFndwbaus
 8CVJHyRWrwHZOIudo7dGmroM2D1ix/YafcyXGyhhtJz6JANqmJcq1FXhjrTMmWBRcw9d4ou3o
 OKkHXJul4zs8OIZzHjlsO0LKuhVwOISGaVZ6/8QQGime9lw9bXphgPZhjeC92vppL7f0qzEJ+
 G6LT9E3qeT/xLaY+0377Abq3l8IE6Ngl2toI7J4+x33kYqa5SpEl5rwiQRWH1gSsSUTAKkOjy
 lc/FzJiq5dJhiDKuFNr1v1THHQkE1bvc213rFnj+CjQP+/lnLFNxSelm5/2CLatf+TPuUInwX
 fu7udLsTvDbdzZ56EnLdQlVARdpt/5nmSfG+8wTl3kqdlrtrn6A8t6aklLnBKIPAlWupmbCzG
 GVLab7fs1NuwUz/0nxzvagACquiQGPScrl07NG8jzL6/mwGCGSh6reEZUMDcg25PFXiodvOOR
 w6jRZANacKFdAKacMWZyGp3n2B0JrIrGkmsXIQHevR0sjCjGO3KzVyYpzCFkQEvLn6nou2qKY
 uq0O82yz55o2m4bjww+9G/o6ZGwwQRT0GunUE9iN5ETZNg7kMxpkBw72CcFPJTOpANxWmtbBc
 al/RSSajyeUyjyB6sM3EPCcGUHFaIl68qd5hE7mAs+VZ4=
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
> The idea is to devide the exterinal module dependent part =E2=80=A6

                 divide | separate the external?

Please avoid typos in such a change description.

Regards,
Markus
