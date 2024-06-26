Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D01917FD5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDAE10E841;
	Wed, 26 Jun 2024 11:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="lCJOiuLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A308F10E841;
 Wed, 26 Jun 2024 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719401727; x=1720006527; i=markus.elfring@web.de;
 bh=Dwr9KGkAvi7dk8APk978FQGIUeYfNk2QkN6QDYEkC/g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lCJOiuLXoeLABxcpKmSDv3kfLJVJrDSsgZ2E4m1jn8FkpyniN/jZ/5AW+MIwgF1+
 LILPyrfexqdKtyTekSHIVuestAGKu2aMZaZXTbqUvWNWoQGPLsXx7Tpa7k8YqiCyS
 PaORiKyzMMtZwognSKmFFq+RDbNNUr1c9Jl2lvg7rTiul+RgeZqsAadsY/SxFT5LH
 zt6h9nYOoe9q3vmETv6YnhHbWqU8XcYa4Q49yZVTDLbGbSncaXQLmc2hR+QUM1gpA
 kHBWrN9g+nWiPj1LTECi1xb45h4U2jQjjKLqTkr3D6Z1Zawly9KiSyoc8fvLBsBVM
 9YqzNhqdVAUcQWGDtA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTvrs-1rvNr32ceg-00P15i; Wed, 26
 Jun 2024 13:35:27 +0200
Message-ID: <8b3ce177-96c1-4f6d-bf8b-dc466ab95162@web.de>
Date: Wed, 26 Jun 2024 13:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240626013013.2765395-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626013013.2765395-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vdUoZWbQeUPEE1CrCCpqXIhXfPjlHqMGoiMqlueLyAOOdfqi/Ix
 iAYZyBhapo6R10KYw5JshwGWYqrEIzqLP2todlpAoVGAk8/4O9lCokApTeDkMSsbfbyljlQ
 AfsuabdulpjcZakzrii2vczz9uHTq+NXQ0pH3X6w7DpBgaSFBl6HI84nP7By/JfBI61jp0n
 ZD8TD3ityNvJjY64kDQYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F0+NrcTHtxs=;pyOXLYtsch5ZYLx8z7KNdJtGc7Z
 wATn6kwfBTuPeuotutgxncuInlajhMKG9as4SoYo28LLF6z3sdXCmhT+76Wkp4wC9ZhZcLXq1
 W6iXMS3WEbhKIlBEEn0WTOfnl/REEjzJnzBoZP7YPghzkzpq+Bp43aiWLv+ph4bQd5TUh1S6X
 f039OtbVKQ/eZHaXjAJ4PH48cpjuXzjk1NLdvVSb/S/5wX505zR9fR1lS4b2zQ7/6oCMJcAqR
 z4nWbNgBIJUKYbs7/mq46lY4dkU6QsUlsrKQrIeQ/iKB81HIlIfbFPUn+xGwaaXFqaWmBcZTk
 K4Ffjc/nXy/K+oPlOXRj8vBntofWu3/z5s+GVBrXNratWBK4kBo9oGyq6LBQSLANZciIH5NDb
 5c78886WO5k4oa3cL24AsWPPmT8hiHHZ7ZyS/7buWpmmI9XIpKO+UtHYUGDNGbmt1iOl4RuF/
 ua++zxkuCLFx2AEU3t4X/vspmExHrkO0hWCDWji1uswUV993u6kTFy/wURCHgczcusHJ46aJW
 UBX10Co7IWqDbYbOkQMMhQq8VCNOUSL9vxhVKaRLGEkkvYjtcB6bhCYgQxmsjWJXU6AGDmpNz
 l6pNKQijrWxMgqWN0lfQSl5fK1wIPps+v4v/McmmUtH50CBES9INmDK2iqmbezC+NFFf8HxbU
 gtmksprIPkMy6dB62TQNp2hxrw/g0/QT6b3nYOj25oI3/9WTdSHJ0iwuGQ5+pv1GtquXU96rf
 5PmRC56bEhKrbJzMyxAToLTYB2KE+1vBUKMhtkxmNiHqmDLO5VHLGb5XxSdE1aiKe5CMiaJ/2
 vP6HOTeG+ZbxBA/t77z/8VvR+EkUDLcGYU3NHXX2G6PgU=
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

> In nouveau_connector_get_modes(), the return value of drm_mode_duplicate=
()
> is assigned to mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Add a check to avoid npd=
.

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


2. Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=
=9CCc=E2=80=9D) accordingly?


3. How do you think about to append parentheses to the function name
   in the summary phrase?


4. How do you think about to put similar results from static source code
   analyses into corresponding patch series?


Regards,
Markus
