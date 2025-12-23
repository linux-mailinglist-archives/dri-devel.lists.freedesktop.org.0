Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8543CD841D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 07:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1A10E0DC;
	Tue, 23 Dec 2025 06:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="lA39fu/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFB10E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 06:31:32 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTPS id 5BN6V7ol026179-5BN6V7on026179
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Tue, 23 Dec 2025 09:31:07 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 23 Dec
 2025 09:31:06 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Tue, 23 Dec 2025 09:31:06 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Samasth Norway Ananda
 <samasth.norway.ananda@oracle.com>, Zsolt Kajtar <soci@c64.rulez.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, "Antonino A. Daplas"
 <adaplas@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH 5.10] fbcon: Add check for return value
Thread-Topic: [PATCH 5.10] fbcon: Add check for return value
Thread-Index: AQHcc9W32zQUeRD9Y0S9vQt0S50zYg==
Date: Tue, 23 Dec 2025 06:31:06 +0000
Message-ID: <20251223063055.77545-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 12/22/2025 10:06:00 PM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-BEC-Info: WlpIGw0aAQkEARIJHAEHBlJSCRoLAAEeDUhZUEhYSFhIWUhZXkguLVxYWC48UVlRWFhYWVxaSFlRSAlGHgkcBxoHGAEGKAsaGBxGGh1IWUhaXEgKRhIHBAYBDRoDAQ0oGwkFGx0GD0YLBwVIWEhaSFlaSFlRWkZZXlBGXlhGXEhQSFhIWEhZWUhYSFhIWEhZX0gJDAkYBAkbKA8FCQEERgsHBUhYSFpdSAkDGAUoBAEGHRBFDgcdBgwJHAEHBkYHGg9IWEhaXEgKRhIHBAYBDRoDAQ0oGwkFGx0GD0YLBwVIWEhbWUgMGgFFDA0eDQQoBAEbHBtGDhoNDQwNGwMcBxhGBxoPSFhIWl5IDxoNDwMAKAQBBh0QDgcdBgwJHAEHBkYHGg9IWEhaX0gEAQYdEEUOCgwNHigeDw0aRgMNGgYNBEYHGg9IWEhaXEgEHQsJG0YMDQUJGgsAASgBBhwNBEYLBwVIWEhaUEgEHgtFGBoHAg0LHCgEAQYdEBwNGxwBBg9GBxoPSFhIW1pIGwkFCRscAEYGBxofCRFGCQYJBgwJKAcaCQsEDUYLBwVIWEhZUEgbBwsBKAteXEYaHQQNEkYHGg9IWEhZUUgcEgEFBQ0aBQkGBigbHRsNRgwNSFg=
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=NmXWo8cqnFNX78iJ5OKHOK6zwMhrZ7kh7/MERegNA/g=;
 b=lA39fu/BqQS/xZVIKnQL+bzgWvxLLD+qKKh8hSbRK62x1rAjm+mP3xZRoEjD3futJ2e2dADCuQKt
 wlUoYWm1b8opOQ5SiAaPRv57OfJt4wpgCDuaKC5IvFffkb5cDzZS0t8ryXjMvl9YyYx8o7Iiyo2g
 D9pku7j8FM7HbfLeGAlwzUKJxAgSvgnvqSxLIOWIy1SOdyNEK+/lXJKPK6//xNT7z4tKTwECs7fg
 V5zRKCs8PP4VCIbvRddkLF+J7uoWeq6Qy2gCat8CnBFRKGTv2DZKC8OLTr5pZiOr2z3pSvduTJGK
 xyhbLWatUT1YzZ+pMc+nc/VCVXc208yF3/jxQg==
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

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

If fbcon_open() fails when called from con2fb_acquire_newinfo() then
info->fbcon_par pointer remains NULL which is later dereferenced.

Add check for return value of the function con2fb_acquire_newinfo() to
avoid it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d1baa4ffa677 ("fbcon: set_con2fb_map fixes")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
---
 drivers/video/fbdev/core/fbcon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fb=
con.c
index 3dd03e02bf97..d9b2b54f00db 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1057,7 +1057,8 @@ static void fbcon_init(struct vc_data *vc, int init)
 		return;
=20
 	if (!info->fbcon_par)
-		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
+		if (con2fb_acquire_newinfo(vc, info, vc->vc_num, -1))
+			return;
=20
 	/* If we are not the first console on this
 	   fb, copy the font from that console */
--=20
2.43.0
