Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F052400BF2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 17:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF026E907;
	Sat,  4 Sep 2021 15:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190F6E907;
 Sat,  4 Sep 2021 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630770087;
 bh=OZtiJphuOZiymShv6jIHIa+0m3md61/j1EJ52nNdmpU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=abE/QikUO73fUuTEdflYyli8YfMo7zoy7HI+1snwhtqYVfwgaps69o+ArL97Ew+g7
 cj5zjhNXiYb1DNZ7slmZpLKXiIk5IbXBRM0BCKu4oZkva2tS7fXNiotmoGMIJSPTD1
 NIczoAXAizyqoRRKlSUZii6lKeN4XE5aFHkPKM+I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MryXH-1mjFYY2AEv-00nwYh; Sat, 04 Sep 2021 17:41:27 +0200
From: Len Baker <len.baker@gmx.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: Prefer kcalloc over open coded arithmetic
Date: Sat,  4 Sep 2021 17:41:06 +0200
Message-Id: <20210904154106.9550-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g78TReDYEcEf342gsWjMpYj895XYqOvDT7IgDccIGAZ3cG9CKY8
 J3OarlOX08+QjZpPDCsJ2h8Vep7hMZ1g8Wm9xhuAJ4V3LXZgvIGYtaUrr6UFJ1NQzxB5YLw
 BXe0HeK8+mOHBYfy6tEcsqcAhRk2cuRNxaC/CtUd76HFciMzDGwEzQyzUNFlisPxjGdVR2t
 Xr3LTk6QlVSnKVxpnPiEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eGRB9xg1zms=:85yEomvdk+F7/JkBp56Nji
 YzEcCkNvC3r6w2zSxUHtid69XdzZZbPxxsfA6tDlgGYQr/0tP9FJZMMn4n+Mxq6x19QG+ttj2
 qYAxIwh5LDvOuz4Cci6GqATzYKS6A6EFYsOlZmU4vM85IHOXTnL49qLRc0e/YN+EuLfcGJGvb
 XASMgKJASIhhxbWuk9RkQ9v7Y49A8C8+ElPkO1G0oQxE6UJ9nAMsyx99/s3oG+tqgDpDnEwPa
 gXhpONB7OeY5VIM2okfL7VOOGU2A6y05GvufPYHB4YHrjVpvjUxvq2BQxROy0D+xOSE7G9JaW
 /tiZF4Bn3HXxiHMOBrh8UcE2j2A7u5ETRE8fOhP67lD4AyV6rEMCTSu4ic0DPejDbwik3PRPt
 8D7JLtp5NWszZ8MgxtXykz0jjqUbe/Ey645HHfBH0S+PKJBeTLF0pZid/CaVflv2mAOz6KaYR
 lakhzO8nh691l6kJTgIPyq3zlKBS2U7F3zhAjTvQDKt7S/gtRqMZ07o3GJ0VkidAnkZFVcCO9
 KTOsJd4ZR2QLGoS0U5eJ8BETYlyTs9QZEZb23MhP8DmkXsMJl3jpOI6ivedrhWCHFVZRHC95S
 /zm37SRWCZ7H+FAtHP4rqg5oG+wvPj0VTxd/rVhag7VqnJw5+wfLmWlImCHz62oEmGBzurcCT
 512U8fUkfN6PgHrhcWAiJZoG94uhN21v4alOcjYM13gn4fT6PHshd7kbxUf/5rVSvCCjoIeiP
 /8gC9zvaLvI+y3RXuH38Jo/i3HqWxr51Q2SDt7cRk1FGQCxsa1Fr5BATHg0ttg48EeuMZqWBm
 YlkXNwOc0v5vRWA9k6hU6FttIaz468AOh6MROW4wgUOqZ70O8gxYC2cP8oK4zUUUxeMM1ebm7
 TGmnywDLShYqgi2UqIsSc/fJyCumSFiN9yevBoiw4PJMmGeSwUKWIoGHbeuykqQO8cc4hik7R
 YLe8oghDabqcT0jCAaQ/y4N5Pcya8HoIi4HyZ9vmuBS92hhHr/UGK4Ke8FyjkUZtMttyWRqwo
 AhOmvGvRMO9X1x0KOhmsMfFjKxHBNoPZ1lBR1kYxYGE3PhRisZwbArzufpl3AUTr+++Y6CIGA
 o8dnWf3NH1KYvP/xSTcTsPZEd+nqQGb60sRTs0zTpILFnIIwa6TUSt+rg==
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

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, refactor the code a bit to use the purpose specific kcalloc()
function instead of the calculated size argument in the kzalloc()
function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-cod=
ed-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/gpu/drm/radeon/r600_dpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r6=
00_dpm.c
index 35b77c944701..fd4226b99862 100644
=2D-- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -820,12 +820,12 @@ union fan_info {
 static int r600_parse_clk_voltage_dep_table(struct radeon_clock_voltage_d=
ependency_table *radeon_table,
 					    ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
 {
-	u32 size =3D atom_table->ucNumEntries *
-		sizeof(struct radeon_clock_voltage_dependency_entry);
 	int i;
 	ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;

-	radeon_table->entries =3D kzalloc(size, GFP_KERNEL);
+	radeon_table->entries =3D kcalloc(atom_table->ucNumEntries,
+					sizeof(struct radeon_clock_voltage_dependency_entry),
+					GFP_KERNEL);
 	if (!radeon_table->entries)
 		return -ENOMEM;

=2D-
2.25.1

