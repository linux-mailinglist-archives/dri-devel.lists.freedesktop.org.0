Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C3A24C62
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 02:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F69A10E004;
	Sun,  2 Feb 2025 01:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mgnet.work header.i=pancake@mgnet.work header.b="jkPsuu/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sun, 02 Feb 2025 01:14:37 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238510E004
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mgnet.work;
 s=s1-ionos; t=1738458875; x=1739063675; i=pancake@mgnet.work;
 bh=xdkTyvHke+UW9F/xe1ZLw3fqGDMIz+1hJpVx9DlGfCU=;
 h=X-UI-Sender-Class:Content-Type:Content-Transfer-Encoding:From:
 Mime-Version:Subject:Message-Id:Date:To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jkPsuu/MOQVh7ctCOChdWHvNqfIF1fy0mcRU+jLVnhMZyIoP8AqCETm9IjG0tkgI
 ClVV/LSN50KCT0AnXuEkclDj95gAEvhxsi42TKLTmg1wDJbbKOw79IcGlVoDyOLNs
 36WxXcHE4I7TLnjn+xoXs6H5okkJN1xqHlYRalcRATnbrdeRwc/OO2tmx6H3Rf1Ay
 wIkI+U+dfLFAMboZkl6wXU5Aa3ieuermZJyCSux2G3yLxK5jIR/WWk0CoPWubXOzK
 oH//4e5wAQPJAdtlpwrOl2Kdap5iaWlAGhR2YqSlXBAxpG/itQr0RoEQqicivPUqf
 yiCRmehpmmelfpV5XQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from smtpclient.apple ([84.136.91.147]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mfpf7-1syl512Cd7-00leW3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 02:09:30 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Pancake <pancake@mgnet.work>
Mime-Version: 1.0 (1.0)
Subject: [Question] drm: Picking a compatible CRTC for a connector seems not
 to work as expected
Message-Id: <516D691A-CFAE-4340-9EC0-5DFC8C7357DD@mgnet.work>
Date: Sun, 2 Feb 2025 02:09:19 +0100
To: dri-devel@lists.freedesktop.org
X-Mailer: iPad Mail (22B91)
X-Provags-ID: V03:K1:xB8OSlotrrsK9d0OMei1mOcjTYyJ+YvPkw1eI0f2/IVfFpXcqPw
 IfiuVhfz5l/NXokiA9LJYEXkob6KfOyMJDoTbx+P8BpeIvP/dX/erXH+7hH05Q+JbuIN4ak
 fMWgTqhhwPdoD1Itn/ZFZ/WZuorwNhBhdXsQgiJW3yUnpI3zxSLEZVr5Dze/l2pjhCqW0nD
 uS5ixa6vahEOc/2r2r/PQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Zl91FzUpdjI=;FC+zHQJYHA3F53cwUUUt7nrGYoG
 msgRyjS6kbHHxJaCkHBySwwqCCfRSU3D6RaM1mEUoiAVRKBMAFgGUTBUDhN/f9kAtsJEn2Ndp
 J2A1BmFovMrSdT3b6Ozvd1xfM5OAwqB1msiFYCFBDq+j1An4Sikj9M01daYlZiGdz5C0wjmmP
 ZCHwRmtFZfKapUcd08IJth0px7w0U7/px0ByvGCE+niYa6XguDuIR7OeATXhCwjXJ0uYcBRap
 QBLpPSu030SmmHBcYXD9NX4ueP+VDjeW6spOBG1hkIKW63ThU7SmSkkm1SxrNcPuqJgPDNETB
 Ny8rKolC2udgeTx7P63OrAIRqqy/ZABDJEdQUlIHpEn9wNaaF9Vi7z3RxPC3NHac5DdJ7N5H1
 GoSwQcAcHXuAaq6jqHUxxbQ2A2e/srEAz6v5yOT3sMzjFoG5gFxCwdS4LfQg8BPnhs01fIgRp
 DFdQifXt+36XO3zQAvYA6As48GB0fyYkuLdcQrKRs6vcPj9OKbqTAxNGSqH/6V8D8nQhl77Xv
 BwfrIkdS0igqdKyGmKFL1QchrFRiPmMCmZ0rToAe8cgDBACCwqko22aQpjJxDsu0ATKviinV/
 tqLjYtTCO3sSLG6ArN64PvF2s36aGaHZuOPmJD4R/63FT1mui5M5jnu7xTQ0sUyXHVFM+s6Al
 dHYc0+HGon/lVa0KmuVsYe8ATvfiRuS9cBTfBhOE8DHK4BSf5yAOjkprgkqDoQnxWd0KdiSVK
 v1J821SdqJT6UL2j99GYIEQpx3jrAVmTzvA8Ie05+ScHreuY+VDUr6M3Ntaa67obSa1uury99
 PFu7RugLqJvhZloxQrCsuluwsH3HCWF7WbhZOzImnhAiTNA6mu+1MW4UNQGcbXWZx3LGO8rnQ
 OgG67bJDC+azlpQlJSlOxNxsvZH5FCoLREiHZo4Q3kiNgbSE6e1K7A5tm9Z+uvhKmvb6lV7IM
 cZqJmLWiWMlcQrQ+2qZqarKpDXLnuNwyvJdmMrk+ACTQ/D3sSLvZj/V7KJ4g/WLD+G7Pmtz22
 swgtIAM0R6KZqH3jPRLQoRNHFVsgm+szkyeBTJYSLEuRLfN+XxyHPYxk2Nv91rcILxLb/vUeI
 gx8zYSvzD86CydjYGiP4fco1inRvauxWbpSMMXBCVN/6P3muzPkxjGS/iCPmjrYGQ0PjGewVW
 Ma0Up5TgfOMCZoxlxEfZj7nWb5xEZAZxYsCfiGG7m4hH9DfdBhER1rUl0ZahH/GEKX/K8Oh1l
 LP9M4zh6KvZatTUU6kSJTyr+ZOvQjZX4H/7jRHkgPy2GAZXUjylafSE=
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

=EF=BB=BFHello!

I'm working on getting a modeset to happen via atomic commit and I've got mo=
st of my code done already but there's one small thing I'm getting hung up o=
n.
In order to display something I need to dedicate a CRTC to a connector, but n=
ot all CRTCs can be used for all connectors. As far as I have understood, ea=
ch connector has a list of compatible encoders and every encoder has a bit s=
et for all compatible CRTCs. Now I've used a variety of things to check whic=
h connector is compatible with what CRTC:
- I ran drm_info which showed that each connector supports a unique subset o=
f encoders, but each encoder supports all 4 CRTCs.
- I wrote a small c program where I called drmModeConnectorGetPossibleCrtcs(=
), which resulted in the same outcome.
- And I used my main application written in rust, which I encountered this i=
ssue with in the first place.
I tested this both on an NVIDIA GPU with proprietary drivers as well as an i=
ntegrated AMD GPU with, I believe, the amdgpu driver. Same outcome.
This leads me to believe I can freely choose any CRTC to attach to a connect=
or (as long as I don't reuse them, obviously), however this isn't the case. O=
nly when iterating through the connectors and CRTCs in the order that I init=
ially received them in when getting the resource handles, does my modeset wo=
rk. If not in this exact order the atomic commit fails with invalid paramete=
r and logs into dmesg something along the lines of "CRTC/connector mismatch"=
.
Am I encountering bugs in both the AMD and NVIDIA drivers here, or is there s=
omething I'm missing when it comes to choosing a compatible CRTC?
If this is some sort of quirk, what's the best way to work around it?

Easiest way to replicate this is to simply grab drm_info from emersion's git=
lab, or write a small c program that fetches the resource handles and iterat=
es over all connectors, calling drmModeConnectorGetPossibleCrtcs() and obser=
ving the lower 4 bits.

Thanks!
Emilia

