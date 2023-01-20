Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BA6754A0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5FA10EA49;
	Fri, 20 Jan 2023 12:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295910EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:35:43 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id i1so3849771pfk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lvj+lN3n7gefBrB84WznopDQnyQbloNFZJdkxIWwwlI=;
 b=ZfW1d0HR/tk/QCHoZnAMTXPdoeTVIT2gV3uMXWQzT31Mdof6xlOLODGS0vst1zBZS4
 CCRjOqDiJBHMLCYX8bcdF4wSwTJUAe3h+tOzX1pwue5irt+hVJ0mFE5Wvql40VLysVl2
 mi1AVGI9o5zTyIHpqUkINK4BZcV3J/Ir0nX2llGk9OTbPthamRiAEfTkkCNgt5Y2SeZt
 7Am4smTPmyoY5pvr8pjx0qiHjuAg2w5lYIk7uyZ7HE7lAcUeJHv4u9XpHfxcTmcmlaax
 SYgaHTUjDIntLvPXlLZtZNvYljq6URzR4B+e2A+TuDb6ZGSGA8YoqyURoPTi7laUPjrz
 cDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lvj+lN3n7gefBrB84WznopDQnyQbloNFZJdkxIWwwlI=;
 b=Px83RfX27tX6m044UUDy2Q8ylTJ7mWy1mTE8OBLQeHn/HfcfP/13EYjdveZb1nhqyc
 nJgz697IsjvOB8QFeVDNuRDY6cRFbf/TwslXYFqvCsOJgCW61DlHyMMy6HCslpDWtbdx
 SLTjpqmOi0HQgE5RVDQxtbN72Z9UnLk21ZNe7ky8stTH6zVlfLNasVVU5+VQ5ZIseCQ9
 0L4E7CDJVqs3Q6vpfMj+fc2ohH++wtDgHV/bgFSvLC2pvTgYbMBR4W3Nl7+qzAEcjlNI
 KXG2+518VkUipTf91Ujb2fvFf9uN6UZTYXApez11QlZ88p24mFBBX3nFOuF+p1JhdYvM
 8aLw==
X-Gm-Message-State: AFqh2krKrICnJ5G2ZOvyGid4QJUEhmEs+/Clc74Q6z/ildWVGtTGxoz6
 w6MrnX5pVGvwY+TyJ0pYOys=
X-Google-Smtp-Source: AMrXdXtZ/M/gTDupP1SLugiGMDeZsFeFVq5ip3UIWgzNz4DvstctcAj8vF4TfiG0adZJw226cSjXwg==
X-Received: by 2002:a62:aa0c:0:b0:58d:af0c:92f with SMTP id
 e12-20020a62aa0c000000b0058daf0c092fmr14179055pff.27.1674218143425; 
 Fri, 20 Jan 2023 04:35:43 -0800 (PST)
Received: from debian.me (subs02-180-214-232-6.three.co.id. [180.214.232.6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620586000000b0058b9dc62071sm15752917pff.6.2023.01.20.04.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:35:42 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 5A7E5104FA0; Fri, 20 Jan 2023 19:35:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH linux-next 2/3] habanalabs: Fix list of
 /sys/class/habanalabs/hl<n>/status
Date: Fri, 20 Jan 2023 19:35:33 +0700
Message-Id: <20230120123534.137413-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120123534.137413-1-bagasdotme@gmail.com>
References: <20230120123534.137413-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954; i=bagasdotme@gmail.com;
 h=from:subject; bh=xOFrJ7qMCcoxa1ECSCebtHmj8ODJRFVzE+m4j/iDdnc=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnuqbeEXh1nd/aolWu1juU49p54U+xwWqVWwMfn1EV2bzf
 /ldQRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACYi7M3IsP6SoMTCC1xWYhNMViqZfm
 3/53r29KqM49VitaEPFVQrdjMyzIxuln19YPMTNe9i51DHGQm9IaV9LjWC4euaA2LZFK4zAwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Oded Gabbay <ogabbay@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warnings when merging accel tree:

Documentation/ABI/testing/sysfs-driver-habanalabs:201: ERROR: Unexpected indentation.
Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-driver-habanalabs:201: ERROR: Unexpected indentation.
Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Block quote ends without a blank line; unexpected unindent.

Fix these by fixing alignment of list of card status returned by
/sys/class/habanalabs/hl<n>/status.

Link: https://lore.kernel.org/linux-next/20230120130634.61c3e857@canb.auug.org.au/
Fixes: 0a14c331682f61 ("habanalabs: update device status sysfs documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../ABI/testing/sysfs-driver-habanalabs       | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-habanalabs b/Documentation/ABI/testing/sysfs-driver-habanalabs
index df2ca1a401b5a1..1b98b6503b23f5 100644
--- a/Documentation/ABI/testing/sysfs-driver-habanalabs
+++ b/Documentation/ABI/testing/sysfs-driver-habanalabs
@@ -202,17 +202,18 @@ Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Status of the card:
-                "operational" - Device is available for work.
-                "in reset" - Device is going through reset, will be available
-                        shortly.
-                "disabled" - Device is not usable.
-                "needs reset" - Device is not usable until a hard reset will
-                        be initiated.
-                "in device creation" - Device is not available yet, as it is
-                        still initializing.
-                "in reset after device release" - Device is going through
-                        a compute-reset which is executed after a device release
-                        (relevant for Gaudi2 only).
+
+                  * "operational" - Device is available for work.
+                  * "in reset" - Device is going through reset, will be
+                    available shortly.
+                  * "disabled" - Device is not usable.
+                  * "needs reset" - Device is not usable until a hard reset
+                    is initiated.
+                  * "in device creation" - Device is not available yet, as it
+                    is still initializing.
+                  * "in reset after device release" - Device is going through
+                    a compute-reset which is executed after a device release
+                    (relevant for Gaudi2 only).
 
 What:           /sys/class/habanalabs/hl<n>/thermal_ver
 Date:           Jan 2019
-- 
An old man doll... just what I always wanted! - Clara

