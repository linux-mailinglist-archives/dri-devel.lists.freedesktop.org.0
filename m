Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D8C6B8D3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4190910E513;
	Tue, 18 Nov 2025 20:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+MBW0/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA0410E517
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:06 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-9490b441c3bso104017839f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497146; x=1764101946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f30WX50HH1DSukzL5DV01QGs8uLxWoJEOO6kqzlIEss=;
 b=M+MBW0/mzzVPfcv93m/w4C1N9VHo5ErM9CTVkL016b1iz0uthPGCwf7VmpTCPUxdL0
 dLkeguUJ1JtKy23XuA+bF7GU18b7CB9w3wXKohQGyfh2kk69MnF9+INBsMm3Fp1cy0X4
 XuhDmLICVIBzY6NsO/BpbfZhPh+HRZSSaWtrfTr4G5tchmp9NjDMzB9fZqNPTF3WAMKM
 Zvz7AUy7zog346b7jm8sUs2lbFe79C8KzMpVb8VVcqs3ZIm+dgje9vDfx57HTICN1ANK
 Tk1lxwoMbZoaID9ir1c0fGP+pkukKOHZ7Y/odNlQR2B7CsAWwvm0eVdtdoXEfCxG9Kvr
 FVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497146; x=1764101946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f30WX50HH1DSukzL5DV01QGs8uLxWoJEOO6kqzlIEss=;
 b=JTPgQswqne1MKXKodV/ryz/MwyemM+8s3DjFHiW9yd+F7drEA8ltUitlLUBnSyHijL
 Q4qeZEryk1e8gOaIt+sHdVy0jDCLKgdlQD1WXdhhmvOSEgV3NYMlqCTwNcOJ4pOELwg3
 DbSS8Hrk7OAeYcBHaH+ap5JfJ5An4Fq2WhJIb3MBOuNczMpuitdxQgk4l2dMN8b4GxoT
 b4myxqw63gNsZfhPZ2QEc4DgYf9j0rDAbbg0SeVBi2XWrOS9QcfW/Gbl58uqaWnb6D7/
 GM8nFSHlf/hE2ndb0sHTLEZoOsfK8WvFDfhEiO0pbqHEjWdpi7MbEYvaoY1UDocV9CTi
 A1FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRkgEavNGmtgqUWqMl+MUmorSDwfqCr47wyFHU9RrUicRV5+Y/C9vQs+I+fK4Br1aFeQOZkjI01QU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaT5JIyU0sOOtovjI+2wBQB/JEENRd0K93tP+gjKH+drkWRpzp
 qdctL0bxzcFZ9M6MMTjVtaQBPiJmGIaE3Ry/WxRcamf92CR2dzc4xYVVkTAfrtxc
X-Gm-Gg: ASbGncvSBzHiYa+JmRPrKDANthGfr4ZH/Hfs1y/+gJHyJ35fXLWN1vETy8700QLFO1m
 Ahk4ddvdnlEMtCP+gw6sF2Tf9HwWFdTC+krzq8mxrT8ykoKWoULwucgi6dJEYx+yURb1jv5zcmo
 n/PF9G5yy+1oPlQ0ErJHCKCgOTK8Twx/VF81y5LhB441+Rtq3qZJ5O0E/kONAr2NBRQZJJdSvH/
 4BkDmmmrtIbckV7mITUBeNZ2KiNH8Bx4dg4N/jG9NRkEiYZS3eRHP0o3QsSi8j6hje9OZku5jZi
 FoNlkgJJYsMHlT1//6l+2/77VaNLNBliJph+W55II53wcBK24ZdknBSE/RsuB+DZaonLSnUcTKs
 FQr1+5s/2LMtGjilN1BpU6vVsXBPmRw0dMb2Uxsg1OtDqVy0NaF7IGeXH0IYL8BzMI8fm74fGYO
 H8UDGU1+CewT4okEwPsgDmsESY2Cg0hrmJhbcrVwZYWDAp4l6tnVgoCAQK7JwNXxsA2GBThgYlS
 WELCw==
X-Google-Smtp-Source: AGHT+IGCDomvmAK1QHEuZDft8S0sX/cmV3Cl8PE9rGTZLGnk4HKbc66rQv+BZepXiLczY7V4uTD7vA==
X-Received: by 2002:a05:6602:3fcd:b0:948:89f2:ea34 with SMTP id
 ca18e2360f4ac-948e0cff685mr2159542539f.5.1763497145967; 
 Tue, 18 Nov 2025 12:19:05 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Tue, 18 Nov 2025 13:18:15 -0700
Message-ID: <20251118201842.1447666-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.51.1

