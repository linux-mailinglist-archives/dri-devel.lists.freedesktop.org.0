Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A752CB0B96
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 18:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7977510E618;
	Tue,  9 Dec 2025 17:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GW7sOmGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D910E522
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 16:21:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so55425291fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 08:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765297305; x=1765902105; darn=lists.freedesktop.org;
 h=mime-version:user-agent:organization:date:to:reply-to:from:subject
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kpTpPvpJYZBwEs/V99hrcOioosEWA8oqzQuGHzceb4c=;
 b=GW7sOmGOZ+0kLk9Abce2I5WzdOSPJVROpU1rlTMSzjLbQMnKsQfC17TTQmcR5Taqku
 YzkAwIow+lECwiEnI73VWR5/vLdTzqD6Q697LTZjGWn6RohRCp7QVkVg89SrFOXxhgpu
 fCd/Fm4psWaKIAOscqAs63JKHJtp3bKMflExaHZ8PYAviTT7su+Gfceg3gHTiqXNZck/
 qY4/Wj1pbIYooYCB1rWYpIaxZxTHDtDMB2h0i9PqRnutchAAte/xmKapVWpxG4wPUrBB
 hh6SuJdJI6KPw7OCSHXLuUOYHbBU3D76Ia+XgtC63DE1SglzmyJFarQBD5z51/Korjg+
 1Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765297305; x=1765902105;
 h=mime-version:user-agent:organization:date:to:reply-to:from:subject
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpTpPvpJYZBwEs/V99hrcOioosEWA8oqzQuGHzceb4c=;
 b=Ysdk1tIr5XFH+3vlgN3m2zceWaTnWEGp1Jw1TY5CGeva9b3uY+AU8qBtCWn2rTonAw
 7h9OS/8vfR/JuKocmqkxKLpwk1LHYbB+obnoETCq0e2khYlUyB+/y8zLbmavcJEatckG
 O4/cK1MJz/Nk0B+cdV5UuBZGMHI5eoacAledelAHDAfZcfS+OgV/Nj6qQH9gehaly3OR
 9kZiarftxuxlrAGp0dOICAZu7CyaQI9j4roQ77T/+0WTE6jBc3petgavnJHYyFbumUVr
 irZUcNq/1A2MliBKFPNy9nuyJJH+uoEUsMdNmeaCzIUEoeXEa2LEdcTt/Rbj3pjlXykQ
 /jwA==
X-Gm-Message-State: AOJu0YyxLCmjDNKoCmN++0Yl7zWuNQkFsxuvn8y5PsmO7cJ7p3oOG/ga
 73Ut5l3luXdaD9khoMlx4XEKDugLoshq10gjHUh70egriYIh4jdtkAzR2Xjymw==
X-Gm-Gg: ASbGncuySXpgAqb8/MIxwk8kFuOwws0jfS5lsdkfVTu6YDYWQMmWnwvGsUC2f24vuSI
 BuTagt27+nnf+A+r+BPqmH/7ba8aEpkTlgSmYZhTA5TcyFmHFoY3DkceXB5in+CdNnTolY37bBN
 rEhOftjDXjQHQH80FkRSAfCefFrAgtpR+ccBPlCwi4syeG/jXTrtcX9L8ZptCQvMCnZx08ZELyb
 Zq7Ae6gVNkNrZUzbeZJWsCXx0DWSDxukzOwUW7rXQiLFLYCfdtc89wjbeUCcmO24GIoIsur+4dR
 dvJvLUpjz2d294h0amow37ZpsvX80Den9f4Rcf3DWucl/giddWMEiJ0ECHm8ZUVBsSsAa81cnD8
 /wbISrO4MwcKqGlSoK0B3LocoeToTRN6BhXwr6f2/wtIaiPhlpRF04Q7J1aNNORgTztocuwjsE1
 SPrEbSzQA6wRcJ+fbYYEAwqdK7mmlZ0PYP2FqNDxds7OYrdI/yyxEFrn8Ccb2Y
X-Google-Smtp-Source: AGHT+IHpX2ELjMSjUY9g6F6vJf/nOwiPt5NpS8RjIsY+G8i6LqmIwlAZnax6pmRr4G9MH5zPx40UEg==
X-Received: by 2002:a05:651c:41c7:b0:37d:1fa0:92bc with SMTP id
 38308e7fff4ca-37ed205df8fmr33326481fa.29.1765297304671; 
 Tue, 09 Dec 2025 08:21:44 -0800 (PST)
Received: from G3620.lan (178-78-231-178.customers.ownit.se. [178.78.231.178])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37faa443749sm5745381fa.25.2025.12.09.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 08:21:43 -0800 (PST)
Message-ID: <f3d038d708ddc2d7dd929b8125e417cb473a2fdf.camel@gmail.com>
Subject: PATCH libdrm: Add Hurd-specific code to drm.h
From: Svante Signell <svante.signell@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 09 Dec 2025 17:23:10 +0100
Organization: Home
Content-Type: multipart/mixed; boundary="=-lqgumdqMFlGkQVwMeWGJ"
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Dec 2025 17:28:12 +0000
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
Reply-To: svante.signell@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-lqgumdqMFlGkQVwMeWGJ
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

In order to make libdrm build on GNU/Hurd the file include/drm/drm.h needs =
to be
modified with Hurd-specific entries, see attachment. According to libdrm
documentation this file needs to be modified upstream. Once the file drm.h =
is
modified the patches submitted to libdrm will hopefully be committed, see
https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/443

Thanks!

--=-lqgumdqMFlGkQVwMeWGJ
Content-Disposition: attachment; filename="include_drm_drm.h.diff"
Content-Type: text/x-patch; name="include_drm_drm.h.diff"; charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SW5kZXg6IGxpYmRybS0yLjQuMTI5L2luY2x1ZGUvZHJtL2RybS5oCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGxp
YmRybS0yLjQuMTI5Lm9yaWcvaW5jbHVkZS9kcm0vZHJtLmgKKysrIGxpYmRybS0yLjQuMTI5L2lu
Y2x1ZGUvZHJtL2RybS5oCkBAIC00MSw2ICs0MSwyMSBAQAogI2luY2x1ZGUgPGFzbS9pb2N0bC5o
PgogdHlwZWRlZiB1bnNpZ25lZCBpbnQgZHJtX2hhbmRsZV90OwogCisjZWxpZiAgIGRlZmluZWQo
X19HTlVfXykKKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KKyNpbmNsdWRlIDxzeXMvaW9jdGwuaD4K
KyNpbmNsdWRlIDxtYWNoL2kzODYvaW9jY29tLmg+Cit0eXBlZGVmIF9faW50OF90ICAgX19zODsK
K3R5cGVkZWYgX191aW50OF90ICBfX3U4OwordHlwZWRlZiBfX2ludDE2X3QgIF9fczE2OwordHlw
ZWRlZiBfX3VpbnQxNl90IF9fdTE2OwordHlwZWRlZiBfX2ludDMyX3QgIF9fczMyOwordHlwZWRl
ZiBfX3VpbnQzMl90IF9fdTMyOwordHlwZWRlZiBfX2ludDY0X3QgIF9fczY0OwordHlwZWRlZiBf
X3VpbnQ2NF90IF9fdTY0OwordHlwZWRlZiBzaXplX3QgICBfX2tlcm5lbF9zaXplX3Q7Cit0eXBl
ZGVmIHVuc2lnbmVkIGludCBkcm1faGFuZGxlX3Q7CisKICNlbHNlIC8qIE9uZSBvZiB0aGUgQlNE
cyAqLwogCiAjaW5jbHVkZSA8c3RkaW50Lmg+Cg==


--=-lqgumdqMFlGkQVwMeWGJ--
