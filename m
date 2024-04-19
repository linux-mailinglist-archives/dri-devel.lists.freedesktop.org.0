Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2F8AB5C5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 21:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304010E949;
	Fri, 19 Apr 2024 19:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="th3KrTi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Fri, 19 Apr 2024 19:54:56 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF7210E949
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1713556493; x=1714161293; i=markus.elfring@web.de;
 bh=0Uhmvl5HH++g4NG6yHvutmuZjckI/vNIFAeTfiT5pCY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=th3KrTi/ufPXgvwciIOJpWw5lQQ8PmBCT2rzgeIXK4oam64OyWVweByrzpqnnii6
 ab+aoLfgNiWpwm1/BQWliknQMbA5HIlGpIY0tfxdV2Tqc5/jhMAJVQu/fp7ksCcO1
 Me2misRCfd0h9WVgkdBD3QmS64/ZtdLE5fWE1P86SgBN4p0imc6DRpBNYd6UIAYX0
 0YK+9DyZrmRPIy2oq+OaIzn7Cj+85+/+E3JjBmjKObzyQR6+/aR/RT2OUmXQmWd/8
 ChgNVdgCkfN7n5CN+k7zjzcsmfCR1EFZ1VwMtP4gF5Ym94jjX5Nhwr0aXkJ9U8pQ+
 j4kK90tphyBYd8W32A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MIL0C-1ruf5B2Vuu-00HBKU; Fri, 19
 Apr 2024 21:47:45 +0200
Message-ID: <4938c547-04c1-448a-8435-1193e9c37595@web.de>
Date: Fri, 19 Apr 2024 21:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aleksandr Mishin <amishin@t-argos.ru>, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org, kernel-janitors@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Rob Herring <robh@kernel.org>, Swapnil Jakhade <sjakhade@cadence.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yuti Amonkar <yamonkar@cadence.com>, Zhu Wang <wangzhu9@huawei.com>
References: <20240419113637.25745-1-amishin@t-argos.ru>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on
 error path
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419113637.25745-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lLMzIzXyrO29Y4hG5MWHuBvr7iCi/ITtAQTGuj37Qq1b+mSzK7k
 LLRmjMVCsrJdk+Vx/D1rpDJN4vVbC0ucZdP/jBD+M6TyBlcHNntJdeiz4syK5VildrZszk5
 p6meGtq65UIbDm8ccaCA6nBhSau9XOec2PdFAFDJrsJqU/1asG4s8Dv5gSW/5/d6WSLGaLI
 LNRFLhW4NfSJslqxpnn4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Sr7iHjyZLtk=;mnxESbVu/yGwxEPvbSbVlyWbOz0
 gSZPSMHQWsHEFgAk49LiKwfOQdCu0h/hlgMz7+cJkIoGMVWxBF1At3dHFyfPsDrS4nNJXoKS8
 QNNNv6v4EcX2+iE28nG6/HIFQE0fFHPCTng6Htft5R3jiGqr+euapTO2nLBQIDqGmSTEbNl/b
 oI52vR2Duu0HDseHKOowgtWLIxYVkjY8g3Xf7BpnN5nSKhXB4ltU7ol2+YKKdT8sRadek4xJj
 GppKwMJgHArjDg0DVS1eBX6/yEyiJ0uLRhtvzHapilqaC5dvpP5cejGxn+lgAgyuMJxbI4iZm
 v8jtAs0FT7wbM5+rLh+cp3Gt4zLh436tAZ/hrWQNB5JZSxFkBMYJI3LSzy8V16+9pO0KDFw2f
 1LJYeW4VlWayQdfpKPrHcvY1KkKoIsJZAe9ilvmXcQHPveIkxxCxq6wap5TaCAIFIl9E9Jv3i
 7ag8DyOyCW+qGMzER6628tm5eDM5aWcIDxZtPhTBJ2azB9kU4DNJcWzNzZS9H2E0dnVr4+ya2
 p73QyOFcQG9pa9OsdzvQl3KuLU3cEZoq90eVKneW8s8qcCFmPrL5CLFyrsC7WAMRWC9bWLGMo
 sTTk0BJ/jMtwYrfL0j/2lRIclaLoIX5RNN1I/XIZVuHZHLaKu/j8d0ZxMlXcCzRc4U+nL0QDj
 IseqZkR61azAXB2Qmh2CQSi+zRMj1SQ/ouKNcAyb1pday46X/uqXPS1MPz/6pTv4i630dSk+A
 jFjjk8YPc0xeZUS/BydzVzT1My5Jo8N2eW3JO/xpEK3dr+d6wokBPYzYhiaqrwmAJYUy1sIDC
 ZK7a0STm8dJwtGds/yB+OIgsx6LZxLgkhsOVdaDPYakbk=
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
> Add a mutex unlock call.

How do you think about a wording variant like the following?

   Extend the exception handling so that the missed mutex_unlock() call
   will be performed finally.


Regards,
Markus
