Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF48C6387
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AE510E1DA;
	Wed, 15 May 2024 09:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="sx0abYUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E8A10E1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715764722; x=1716369522; i=markus.elfring@web.de;
 bh=bxm7PFm+rie4ZzlAqjg1Ckv2mEApVqgNMxWFDmfQvTk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sx0abYUlHgKmKAmfrT+gBwD4ZZCmtouEawn4YVPGklkN1ErubE7RuXCxI8AFz0hK
 m5k3Wz85YPT8tCSQV5d0Ovxe9FH6KuYnoiRhwFxhpZoHnumzjumkunZ+cPULywwS/
 mLcvbmz+/ajl55peTsQfhsTEBH+ISMoxg28AyPP8HFUJcGaTeHTw48sMZnwseOhCO
 2o+jgsRQnYAROZrzsF/ciFiadX9rA52xPpxc369WfiaHCskS4JbOWxTsAu4xTSfhp
 roBwQ+u/5fy9GNXipSqKwMbhFwuazpUrvGxB9O8WpT9beFKkQJ/FJipSMl81pBU/a
 BxLhB/gCzVLMHWumDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmhjm-1soijE1lWo-00ZOaR; Wed, 15
 May 2024 11:18:42 +0200
Message-ID: <bfece5e7-3c7f-44fd-9cf4-dc541d4e47e7@web.de>
Date: Wed, 15 May 2024 11:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuro Chung <kuro.chung@ite.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Allen Chen <allen.chen@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kenneth Haung <kenneth.hung@ite.com.tw>, Kuro Chung <kuro.chung@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pin-yen Lin <treapking@chromium.org>
References: <20240515072328.1010920-1-kuro.chung@ite.com.tw>
Subject: Re: [PATCH v8 0/1] drm/bridge: it6505: fix hibernate to resume no
 display issue
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240515072328.1010920-1-kuro.chung@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kt7Z/wCrNxfV+dApqAha9L9wWAGslnES7TINSjFONy6KeqA744M
 sIOzWZovzfVs9NC+gmGrFxw7rPpxcJwBU1X7Fl/x9FOOov1oA50MXw79/ms1doYhlai+vib
 OkcBqhM99p3QEN0ZZ7aiYRWTKEvQto3aVCPGK96RKOabFTphsmM54fG2TpKNYltU/mqYIef
 btyGAi4FXZEMltQZOwgfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+RE1U0i96s4=;cWv86TqIwSZ+CYb9HILeajltDJw
 2bmAspgNWJSaClNGfmSFZzgL6+ncUz2fmwuO7ZGc4qlHGZ8xBIvWDKiCqOP0Sh/9rVtWcHopP
 np/U0hjcRxQcf/J/oyCoAMXiGJ235AZxQ+g6MjqQaPaEcypoShvaceJKo7xQMvwZSsZt5CinI
 dseLiM75+pIjDx9K8+BHkwI+Yt8hUIjX8WIsVGu0bbEV1MnHH55MQQ0SI4+NPBoj3oGY3+r5H
 0alyDIZtyhZpLX7F+FBItM6hRkIYeJK9kQJGj8RhbfBZw+VLKAiwoWh1fLv4JQrBYhXlYVY3z
 947lolQIWwGHd2Ck4qr1Jm8X47OcK7VrdhsYdaushGA0x/606TC0K2/eS+Cej1hkygJ0PCMAR
 r2fIL/eoC+JnR9ozuIV75HSZh0nbPrQvulSt6MabrToXt+BCdKxUElWsDXpxrmAMLD0/RA8V5
 bPG47mR/MIoUP7xnK3gFlEqkw//osTcK9KlKAnBE8W3Eu7LHxP7jgyT59GxyTMACu3HIYgE6P
 K1rZJ2ivuNSCf5FXNdonkvB2ANJLX4Ii8pDIYuCLo+o7xMjZpAK6tcIjpYlHfiJjjfHj1W6Da
 q0d3lboVTj4iV4Kxukw54eBvEOsAA/bBWmxjjyBn95BOyqCS7SEGOhZ5FtGSFZUkHolTnINBK
 5jgHd3UORJj0nTjbiu1bQCx0XXJhmHIpunIXPttPctS4wsgTOeeJemu4ciVFwxIY8ndIi5WZq
 w9s04c/ZRpul1aaLE1QYsuWqqbuBNICUp8SQqCbHWAdo219blnR0TbgnZrASgqyfGYQ374E/i
 yp9KbV9ko8S+LebEYyTfNQnXHiLktPrxIZZLGuadNJchs=
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

> New patch description for =E2=80=A6

* How do you think about to omit a cover letter for a single patch?

* Would it be helpful to specify any email addresses in the message field =
=E2=80=9CTo=E2=80=9D
  (besides =E2=80=9CCc=E2=80=9D)?

Regards,
Markus
