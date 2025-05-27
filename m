Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B43AC5AF8
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 21:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6324910E2CE;
	Tue, 27 May 2025 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="t23FaRrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1C10E52F;
 Tue, 27 May 2025 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748375428; x=1748980228; i=natalie.vock@gmx.de;
 bh=Ldu07BMCPZHmtUsPr5Aje/T3s3dZonzuEAoEcA+44Uw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t23FaRrtalO/vgmh1KewMXEC2Z6MKcxIGD8nt+ZUcyFEkTmCjhekQBpsMT8iRbRZ
 3l3WtGd1s9eoz/Rn87n/7g9JGxHHtscYoUjpQBLU/ftAc6aBPaSLSBwVOQHP9s/kj
 hZ1OSJs4fMIrsdSxnaEdZMHHEXmCRLp7a20t8CB1hnPBRDb2V//dZya5WyKBRYdUf
 7ABNWQPgv+svkKO0++wif10D5Y7sGJlHMHtQB6akxy7HkfOONMEII0VdHJHF7QJe7
 +fmuFy/5FhswN9M1y2sSyXNvVXwIUUfANDYhF2htzH7maO8C6Ts/5govUlxyuRBeA
 gSGf5PO34A+Wom0P2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([109.91.201.165]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0XCw-1v5U9045em-00zVSF; Tue, 27 May 2025 21:44:59 +0200
From: Natalie Vock <natalie.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH 0/2] Fix AMDGPU VRAM zeroing
Date: Tue, 27 May 2025 21:43:51 +0200
Message-ID: <20250527194353.8023-1-natalie.vock@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sorOliCHv5zKU6f7YC2wExBoZgRucoGITxINra344mSpzl1CcrW
 pT0LMnZnInRSijbRbIkjrBajcWpbt4rZeB3UbE9vcv4ljD2EGg25+3Pq8kale57byNStXVx
 G6iXh2LmbcFncBOm7GVb7i3J/odvAzTIYmDVUpqcCK6786632Ov7sqmStwcF1yF3HL0+zBZ
 JuiJr81PXFViKtpKp0B0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TxkZEs2nspY=;9z6os+9EGb1iEpv300pgSZcFfWy
 Q+/43SmFPg4HYeRbvcB72KmDWQsArrcbjLGVBOa0ghi2ImoXKzMqt1mm1sSR9eaH+RKtnNrIy
 cYItekMfEBW764CiQsW+SKFKHaRjX8wDbRuHsNLrQr6n2SqJhr/MEuOKPZwx8KIQiUvQw8rO3
 bvNdJEkEFvrNwKnZSD1i42wOn+KHnsPCJtHI/0Qmr6kGOpttIOQ0U+xn9EeK3KYL2hLBl6LBf
 wZTEqJZs4PT4l7UcUxSitALS34KYMFHKfhRiYfGQC1g0dQmx1Bb88u57B5WsOYnO0hV/aitXC
 cu/oyibVLr6gJt+2qMF14aBkeYUnK5JlIUPW8qrKzDnfz2KJERwP1MLStY4JUWMAEmI6njSEJ
 GiAScUds3wzxDg6rH0GqE5jQPdgTJrYirOE9AANmIdpy/75vNw8gwGQxJRgE6luKFm3Ddy4z6
 6DRuFIP0RcC2bk5NqwIrgVDNx3sOQTdNEW1EgxojrHz8DC/mxWZOeidEhYWj1bl5+Xb0PjOx7
 c45NqUGyNa/nuhxnwgiKql+XvFrWpJ2O2Kv63n239By69nwbTQOJAjUQXZkVIjAkOZ5CSZRBl
 VkmQy0k9Ax6pVzjX8xDM5aG0k792MdZZaFqtkzmxpTVqw8GrNY2F0OzxgSWpb8uA0iJwmUaLi
 hTsIwyy1tX1YkzKmwgX1riCfVgRl77Yb4qxGBWT4MCi38/kN3PCdnRoVREdDfTPMGQxB4xf1I
 W2+A68Pp6qwBCpXoevJc3v4NTJMyyek9cuinMcUJoKPdLwkS5lsg1fumI/3BYWitZ4ES7xCYl
 w6YbcwTpAlUmmxzEJ7ziv+UMlB3AnOmzRyiBrAQ3N8hRtgYeDDV6kHaDSYxD10Fm1MyhNzKSt
 cUIoiZ+fVVOa41Tn+weMATbxb47fu/MxQFj8C8YzLhsucyqIoTnHfuR1fuCcV0GoIHkVyHtN0
 +6yjE4/suLjJPy9JlDZYT5de5OBEjVwHqfpikYJWJNA3AJVcxSPANkKzf0VzTFqymlajP1Mf/
 Hh23TYLi5KWzfEzvqVrppRkUNfpNDBmKoEdkC/eCwZm1ZPA5HpDov1bo0lxex59CcR+fsYGi9
 CXz2SVCVZmCszjV6j82ln0I3QKOr9KIxN1dfypVMyJKEvBc8UglQ5Rck/mHUKczW7s5zgrS1E
 yt6+yIMEss2fG3+3GyLOJMqh9GuX6vz+DuQB0WcXAP5jlr6yy5hix/rRIJ4C2q1hOH9DjWkRo
 bVzCsGZ3xSUBVlSgPpdfIjizF/HMa8bvKOqiGUYYa6qCZ09/MpDYLiZQU502LDwQ7ugginvFA
 mqcUCwLBqFNI4proz4XNjkMom+gEmFADQmwUAu8B0iqZc9Uq/UH+ZZN7SEQvyRrNAlnHyk83H
 Gr8SIaiTTzQZydZ4lWtKDKA4bnpzIxL1XD/jMZdCVwng/hoARZRlCLj4mGk0lvL9WS86Q4h3e
 +bv5zClHW8WE0EenIkkRXxgnFwoq5Aq6YiF/OzTKSq6cj7W38tlE5Ae8nK7agMw4Wme3JETlo
 BWmoIH6hsv0E0PScBT4lajrsepqeuzS8mwRTszO6TDGrwdiJ+aJnxbdKXibrzihxdgsRN7n3r
 clhMxU9r7kx/XUnquY6VaDRBlMgzA2YOcRU2NujsPhfVzmrj96Fc5LbYT+Yo2836QPnxII6KF
 hdK5VItGtVzrtzlX7oljoaelcfp+08V2Df0wNepWrKaiIPAJCOE/yMUyMCZRMNO0k2Reqaj0i
 x4mlADTm+E6sCHi/wcU0fMCW1arfwJ0no2UxoO7sEOhf1TtlGrCXPnMexfCWGfnQUk+70DS+k
 wXcMB3TfVU12bzZ8IzRiiHPVFAR728W1KNApTaMRplONVRnj5FmW1BUOAHUaAgX6cQgZ3qn1Q
 jllCMscO+D+gFVpHws//Lv1fEs3hxlp18Ut7ZkpG4IxhdrvRjbRWOTKwEpax8eLLB7Yv8CPpt
 E74OQZVff4GINrSk98xG4XC2PI7v+QXWRb2lks+yAY1UTlMvndPvSEbOSrlmlUc7+FFyBl1Lq
 6PbFehLTWPIJoFWa4pw6Yv/2OHogXkh+534cxz19ijuLzRyS22WqNIAkZBZoXsTPhmmaoRhyd
 H5+f6HmVPmKJV9501stUDQO+5p+i7L2PypHKsPD0A1mWjQHgtmLz0GVZ7OKf4ooLL4s7L1Pl1
 iikLVGsAOrdZpyDuyzCYscsOxXoFESSfXW8SHOh4IE82tBAqZ1leglRqDnIndTa4H34SDWclD
 h84ge+Y4QrqRysjuu/exWnwI/FgL5FLGbD+6hnlNLf7AjqTagYvuKYoE3RSRzDl+RQRxyVIvH
 VQ4xcOs+dAgJYILJeBDf+F2PUN+WUEskofQGQ5gx/8sgKfjLJHB4EjJ30mkj86KKsTibJdte0
 cYA92xgaGMusxrxMfDqkUQMLLR8bEN5nDL+/AtTwAjjYm9xeJBLkg3tF3ny/gOotcNPeb6g8f
 dfJqjhbf0Y4X3JNNgAg64GzojCrGmw5mN/3sekwLzHQWpoehKFPs5cyc4U+eU608Wplk9bMIK
 vZClw/yFMEmlhkdy1DZjaMH7mj8yqcFWOK2QQmqv1W+VR4kZCFvmkY5fURKPxnRT6Abd3zWhv
 4nDdEdMTK0CQub6p9wP2NgmCKDn3fdUM4j0PUyNJQ7JGwJ2Jow4GkXmwzzi0PUcmeNvnQvntr
 sjXsTsAJvwS6vxFYsKrpDSNNaSv6UtxOZC4mtEeTRh21S5cloAQwhEMLm1kcK7WjWUTrKsb9x
 GjtZIltYzbuIhtE3mnAh/zwcOO6nyZkv3yVUIUaXhlHTDiv97J92vt4eiM9JmZqE26UpUqN+5
 QsgTmQYzD2ue9BOe8tDuaGof2u0SELZSyvwFlrMRspyEmL7A1D7yx8vx8Rm/bvCUN3pyRw9jA
 BhndjrYQDZVRvO86t75lAoECtBYD2xf7fRLoMDOYUWpfLhHHqlL4U7g/wFnHLFLalrWRaW/Q3
 6i9VgSAK1aDaKjZqP6A3xW6pxerP17c7++t5LSYtK7K7da/CYn1s+X08JrcBi/7MzoIblpex9
 znsC3pPAEH2NwQwNjTG1FhtE8fwQtc+a3MIusPXTxu1rLfSivKd3sBJzoJI1KL7EHmeHiXeJb
 aqN85NR4X031AhinBidyKVEDbC2JY6MRUeEO0i3bRrLdaEPJGPuExS4g==
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

Hi all,

I've stumbled upon this while investigating why AMDGPU seems to fail at
providing cleared VRAM allocations despite being explicitly asked to
with AMDGPU_GEM_CREATE_VRAM_CLEARED[1].

After some code inspection, I believe the problem is actually much worse
than not providing cleared VRAM. AMDGPU fails to track dirty vs. cleared
allocations properly in general, and still considers initially-cleared
memory that has since been overwritten by applications as cleared. In
consequence, it will skip wiping the memory after the application frees
it, leaking the contents to arbitrary other applications.

With the new drm_buddy helper, there is some cleanup potential as
drm_buddy.c defines an identical helper as a static function. However,
to keep the patch as minimal as possible for stable backporting, I'll
submit the cleanup as a follow-up patch instead.

Thanks,
Natalie

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/3812

Natalie Vock (2):
  drm/buddy: Add public helper to dirty blocks
  drm/amdgpu: Dirty cleared blocks on allocation

 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++++
 include/drm/drm_buddy.h                      | 6 ++++++
 2 files changed, 13 insertions(+)

=2D-=20
2.49.0

