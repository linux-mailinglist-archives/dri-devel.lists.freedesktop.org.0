Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03558B922A5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 18:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6C910E156;
	Mon, 22 Sep 2025 16:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="cX2QzIr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381E10E156
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1758557810; x=1759162610; i=markus.elfring@web.de;
 bh=I8Jm+BtLCOfPFPkOJcSYGezIXJ1kj0/IaJCMO99n4jY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cX2QzIr8hD+Uxilr6Lp5I9cvUno244j48PuEKqUhV1smOWgIruTWVqnVi5a/WpqA
 cXl0PQvqwRdMw2bzBQ40rx/aVMG2U+HgHAvp95oj9pXsgpDvZzH94z3vhTrXKHufA
 0VGlN53IkkomVa4RMmhra2Q9Aw3x6tnhuY6tKSxea9NoH/q4gJOLJHKX7bexsd4bM
 dFUeWjk4a01wYOneVAwFqBH2BJ2F1XXMHQ2qzEBHvbo5+HnTsFG2IoBnC7oktqmPj
 SuYuw9KPH9h1pPb8sP6+QXf0n/ktvPsxSudS5RlKfwzMQ1YmPE7ZgzMOqN3Tqq+UZ
 PycikOS4T9JWto0hHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.175]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0Zo6-1u6gBa0OA8-011N67; Mon, 22
 Sep 2025 18:16:50 +0200
Message-ID: <d1c2e56b-2ef9-4ab1-a4f8-3834d1857386@web.de>
Date: Mon, 22 Sep 2025 18:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250922122012.27407-1-johan@kernel.org>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250922122012.27407-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a+AtYotd606Xa21CbGi3o7GaI5bhai9FYkRwUp61htil2YrJ/+c
 FyRvqii7mj/w9zncs2ubBjvbKUa4J7YuKI9wz9zt/LTX8O/CxO4WUxDLkJm4uSESmRiYgD1
 BZNXUrgfr5kPg6tX9YO8kDGaOpXyA+V88WX+CqriyupwwcE9Lymovitrg19K8YIS0TSqYhf
 bDkowCv5EDjXR4K3dGKmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GkWc9pE//4E=;2AdirriGddFOhYmYm096rakQFlM
 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
 R1jSo8jNmXNuedbXprfMkiOgYolr
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

> Make sure to drop the references taken to the vtg devices by

                                                VTG device?


> of_find_device_by_node() when looking up their driver data during
> component probe.
=E2=80=A6

How do you think about to increase the application of scope-based resource=
 management?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L=
1180

Can a summary phrase like =E2=80=9CPrevent device leak in of_vtg_find()=E2=
=80=9D be nicer?

Regards,
Markus
