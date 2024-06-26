Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE29180CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750B110E883;
	Wed, 26 Jun 2024 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="OrNn3f1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A985F10E883
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719404288; x=1720009088; i=markus.elfring@web.de;
 bh=yUPAIAof3AkzY+BmPwggZrxS5owZtdhbXK8kkUOSg5c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OrNn3f1X2IUD5M4sIr9wqstdaJaB72n7F4OiQN/C4hhyFZd/tw7A0+GNPYfGQNtq
 k8O8NLzl8Xdqtvq/09CWapuEueBn8eQSTCoYftkMbwTerLYwQJg+yKutf66C0zLaM
 FB4pN9iBH0PSn5BIgZclTJxldgH4GcPK+LWGkUeA/ios8DseolRFH0jZbIFDNO+uG
 6jVjb3M8fm7HgucbaEaGev2Z0vazbQ6s+5Y/QjG9vqFjg7xLFfJSxf/NizWb74q19
 XbOfIOcCD6czEahZilGZfnPCrbcVsD7c/shJFP0wLwIhd+p5nEfp3Jt+Yn9j+P0tm
 XFTZLD7DGXSYBdgKQA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30ZN-1sSSoc3rPZ-00sdVt; Wed, 26
 Jun 2024 14:18:07 +0200
Message-ID: <7efdcd35-7511-491a-a0b2-c500ebb2256d@web.de>
Date: Wed, 26 Jun 2024 14:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20240626064024.2811255-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/qxl: fix null pointer dereference in qxl_add_mode
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626064024.2811255-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C60OHFSjUuj7c1Ny1z+3dfhRyGU9CgYduGDl5Y0uOjNWFaNRIBg
 pZn9Q1V4E276IQizd99IZn+VBG3/z4MThrqGn+8Zf43SzQz9WiXCEuvVJq53xuWJGmsubrO
 A+k/2CYu4mODi/iGDVY6OwkP55j6PQzl9r/vRNqwosZBvTUXyQcRdzvzfXq0RKHg/Y6SccJ
 tIoZ/gnAkHy1336uFBbig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8l6RBOATA38=;k3Ef5uHGkoup54xiTgrtslyJhyB
 8qsV6Y68qgY1O30UVdyYKXiZJiWeypvHKHgXUYOTEpgUR1F6dstjJ1FWWM1SFR+3YC+BJIEUB
 Uy86NirTHEraqqqf5DVheVAnFIPyCogdGluIZknBWrx09x2M3V+ganzKkjy885E6F2E23h1vc
 Hma/UYfAs3KN6AfrAZhU8wRyfi3Nh0z2zXv2OYj/mDRndnB7SGBq6ZBy7yZSzWL/6lpB/lpiV
 N32AqwSRwVx2k/o55YSMxDCyJzkYSaSbdRNy/uO40QWLE69mLKc6Ir7eLBGNYUXn9jzvmMLap
 ODT37KSAGcydgciEDT4y3M2UJ8W+XS/GVLaKNAcjGiIarKUU4medUIn2Fc4rNa7WGjEqZ302H
 a4g04HAn8U95oYPkX6M0+Dqsrbdb2cXvfVPrfN/FNiDsINxoClU4UcBF6FWrH3O1r+1oO5E3W
 qdMTQA0l0bT6o0YuHTpr8LpkxNXfmAK1WyvtaSOLE18AvxqfYvBFJi/Ae/8xGLJ0dPnMHzwHd
 RIiASKB6tyTkjNLqX/dQIPDwsZC7R8DQ2j0ZgPEw7HC6g8lMI8PI7J839xXk3aKXW60bo9GAB
 NxemrNOs+c87ww5r/EQaRinoJe9x1ZcrUlttenTgiv0MZu1ALqZdFMK+H+3aCETpOr3oQu1uY
 ZtyTcf1F+XYPiYAWkFtcFMXcEBWSkkjYwlj8Onl6SgMR7iLNLh1pfYSx03d1QWrisg8t22cTZ
 qaHfMBT3NnkZwruCDIBxKDL7yQdjpsvNUTNtTWjXOa24He+gL7cmaxfWMZsyb4NOBGGtaHQO/
 i32qOJYTULauwOM+r/guAnVvsBUiYHFmOHcisD9uF8y78=
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

> In qxl_add_mode(), the return value of drm_cvt_mode() is assigned to mod=
e,
> which will lead to a possible NULL pointer dereference on failure of
> drm_cvt_mode(). Add a check to avoid npd.

1. Can a wording approach (like the following) be a better change descript=
ion?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_cvt_mode=E2=80=9D failed. This pointer was=
 used
   in subsequent statements where an undesirable dereference
   will be performed then.
   Thus add a corresponding return value check.


2. Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=
=9CCc=E2=80=9D) accordingly?


3. How do you think about to append parentheses to the function name
   in the summary phrase?


Regards,
Markus
