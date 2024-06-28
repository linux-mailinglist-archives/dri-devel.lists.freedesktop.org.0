Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8E91C5F9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DBC10ECFB;
	Fri, 28 Jun 2024 18:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="gOE6ZzD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE0C10ECFB;
 Fri, 28 Jun 2024 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719600173; x=1720204973; i=markus.elfring@web.de;
 bh=8kLvuMEKGAQyx6cCtZ+QA/+5maKkTMNiGRPBdMABdqU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gOE6ZzD8J+wqX9HjXsnxngvxbfKfQDJSMN1B5vqGqN8glDHH5e613E8jTqeSpqyI
 zhAjOn78zJCZlKCBIortA+tT29V46BeqHZ167JJ4CcCb+kr+kEpKPnCHhSZWw/WHJ
 W6Eg/GMjch8C5yUbAk7J5pZlyUMOR8GuAxU4lRfVMk5+K4C0rbW9QaDoHoypf/UDU
 elRxkfnKZCbYvHI9z6ZgKKgjSAEdgeEeFBPdAgFkP+DmnJML4R4+xlHgM8oY2W/9B
 kbeFKt59ND/RGhE9B4d/r7KmR9AuM/ZnmTRNJqD3mGBzeBMmY2WlJSt48uF4AoWsp
 hwt05fS7wFgy3zUluw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2BHw-1sSSnL1o0k-00wyOJ; Fri, 28
 Jun 2024 20:42:53 +0200
Message-ID: <a91bbb5f-8980-420b-b465-97691203347e@web.de>
Date: Fri, 28 Jun 2024 20:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
To: Lyude Paul <lyude@redhat.com>, Ma Ke <make24@iscas.ac.cn>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Karol Herbst <kherbst@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Julia Lawall <julia.lawall@inria.fr>
References: <20240627074204.3023776-1-make24@iscas.ac.cn>
 <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
 <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PIL72wbX7r9QZ/mWZLwKF7K8YC1+hNv2EH5ZjPvIhLoaNH3QPtb
 L0VAS7M7j07sfJZ/F2MWvpWAIYJTVzjB2x9tAU2pio8nGAcnftuaTTEErc0GHDci0TO1ChN
 w3ov5KWvo/DVz3Bi36FPjwsBvfxfbTcMYBVx2h52SSNf2UIj9lDszwyw/AxB2i0YQzaZdQm
 fRKP3/stIlvW1CE7tGTiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pweuqzOFyZE=;Tgc+8iwH3HQUokQiNbFoAlSoTjM
 TPqxWWxXB9kukXsacDcZZQRwO6QLIf63UpfXR9PhK3NVUkI8UUpl42ABm+AfcX1qi8D7jeKNK
 hVR6ESGiYP6oL9MlAy4IeRCLQ5Fjuk/44pO5mmjNy3GqhRz/hJybqXd/eEnAMwRENsJ8swmTb
 AudSqXJtUManOQZD/eCqQEHy6Fv8od0Q8MPoBW9FENgahpZLAsxTM01TNIrZ9JTmW96Xe5JGt
 1W5KsbX7HAOZO278O+qjq9CIVo+p7tqiVoBPiYyCbNg0geKnu10yHJFZQM5m/Z5Z73ulekfhH
 qyEz4iYi15gxBAEy0Rr+g2e8DsmaXiU8SHDy7scZB0w4j0kdAXO5lD1n6Z6zX2U9Gku8hKWSQ
 LtglatLo2GJb6fZhOXNfx5aFtFYzGREe00oEEWeE2T8m5gAGlstVbPbQRD5dTAarCLaQrTL6c
 Q0oMHEzovXXnkEuoj5a8j6qnSu1Qn6RQRa/DLARNk0wn/37Fi2mxBp/zsYImhCQf+2xxcRTT+
 ohVvx2vb4JV0PiHdIOeIJmW7+YsZbRsmhqAxg/K3OqE62TVXGWreLuKIpA5V4GYWKYpwJVEsg
 RlsAGIzNM0BT84HQwDf+ArLo34CL5TOkxRzXg0d+Zbrbpwou18p5OpDDXe145/Tz1qDfmWPd5
 bUnLLOGt9RtDtHOInG1sZKrrLYrRV5xKkyTGXsJVNC3ZsmSjPgQAEJ6AHxGfWmo0pV3zx/hct
 60bQ3TPjeKghL8yKkL4FO1TrCMiE7Jf80xr7Jtrw62Uif5PqvysTUnRyDRk0bC0BrRZDelI1L
 EoJ0Q8uvOPxCha6jnUR0jjS/CH7OFCe1KHPrCaUrOJ9JY=
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

> (...I doubt I'll get a response from Markus,

Why?


>                                              but I certainly want to
> make sure they are a bot

Can I ever adjust your views into more desirable directions
(as it occasionally happened with other contributors)?


>                          and not an actual person before removing them

I hope still that affected development discussions can become
more constructive again.

Regards,
Markus
