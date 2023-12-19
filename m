Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FA818AF0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9513710E2E9;
	Tue, 19 Dec 2023 15:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57CB10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 15:14:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so1848615f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 07:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702998878; x=1703603678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bRzX3hUbPtrAVrbHdB/NlfsXUqLfq91OinN9p1IBzVk=;
 b=nr/GQWm+WFbYE85P3Rg6ztXnIoIka/HL3xdyt4XwmIJHuseon07Z1e7shFjmks7h3q
 bRQ3GoYCnwbV8WXumlyEyxx39rUHd5rYInSzdDhD9VmoMJEgLE0BL1JjCv2YaKkylbqO
 w4o35VpHHP9yYGwHHtksoopTJYGmDa1IeoxlIQVCaz2OrDevS015f72V/xD+CQH/OE9t
 Bz/7Na8A5SeIcfZeS3Ql1c53EaTaM6xqCQDK16/VPlashr15aa2VF/N035LXIlrsG2Vm
 ogLwbwJ+JrbsfQfDzLT4/PCfZomHn3iksklRJdEhpKMkJWwk69Ov536lisUDuEjvJcP5
 kkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702998878; x=1703603678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bRzX3hUbPtrAVrbHdB/NlfsXUqLfq91OinN9p1IBzVk=;
 b=cnEOOKRSugaCxkLDoi1NR79uTsXdf5YbLy3VZX5DX99ozJThpXvlyyXL8EKP5ubaRg
 wJClHb1Prfm+s+dEsy+Ss/nzMM5Zw3x+4lU1/maEJjhfYpHfi8SYME19ICsVWbe3nXoN
 n4EUvtH4FOEQuRA0f2CuFDXwsNqlcngp9lR0GarfkN38E+8hhXnvr3bAvKwM3UVi45Mb
 c692yO9h21VxjEpeqgHObjztHPWdf4atainHPjAyRS/sfNAX9cWmx1utXE4knFtp7zO/
 CSft51Yn+BWzKf2mIKlK0Vl0mRrl3HlzgiH3vi4qvH+2ECC1X53+BrWIvtUXBiGuPam9
 p2Fw==
X-Gm-Message-State: AOJu0YyTtfdL5+2yC/hjETyCdd5Rlr9IBSy+9vrl9Une3xpTX/+kc3JG
 LlYjA5FCd45qjR9pof//Bo8=
X-Google-Smtp-Source: AGHT+IEgxSk4I/pZ3tdRsHVUcpmoX5T3UR/Qn+n42lmm5pkIOSmNqTF+iyUc87KbTBOBW/gp1MkJuQ==
X-Received: by 2002:a5d:47cf:0:b0:336:3db1:1c1f with SMTP id
 o15-20020a5d47cf000000b003363db11c1fmr4370056wrc.235.1702998877941; 
 Tue, 19 Dec 2023 07:14:37 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v30-20020adfa1de000000b003366cb73f74sm4217956wrv.66.2023.12.19.07.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 07:14:37 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, Nikita Romanyuk <ufh8945@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drivers: video: logo: use %u format specifier for unsigned
 int values
Date: Tue, 19 Dec 2023 15:14:36 +0000
Message-Id: <20231219151436.368696-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the %d format specifier is being used for unsigned int values.
Fix this by using the correct %u format specifier. Cleans up cppcheck
warnings:

warning: %d in format string (no. 1) requires 'int' but the argument
type is 'unsigned int'. [invalidPrintfArgType_sint]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/logo/pnmtologo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
index ada5ef6e51b7..2434a25afb64 100644
--- a/drivers/video/logo/pnmtologo.c
+++ b/drivers/video/logo/pnmtologo.c
@@ -249,10 +249,10 @@ static void write_footer(void)
 	fputs("\n};\n\n", out);
 	fprintf(out, "const struct linux_logo %s __initconst = {\n", logoname);
 	fprintf(out, "\t.type\t\t= %s,\n", logo_types[logo_type]);
-	fprintf(out, "\t.width\t\t= %d,\n", logo_width);
-	fprintf(out, "\t.height\t\t= %d,\n", logo_height);
+	fprintf(out, "\t.width\t\t= %u,\n", logo_width);
+	fprintf(out, "\t.height\t\t= %u,\n", logo_height);
 	if (logo_type == LINUX_LOGO_CLUT224) {
-		fprintf(out, "\t.clutsize\t= %d,\n", logo_clutsize);
+		fprintf(out, "\t.clutsize\t= %u,\n", logo_clutsize);
 		fprintf(out, "\t.clut\t\t= %s_clut,\n", logoname);
 	}
 	fprintf(out, "\t.data\t\t= %s_data\n", logoname);
-- 
2.39.2

