Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0B8C568E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 15:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E6B10E210;
	Tue, 14 May 2024 13:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="lj70rQ3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6B510E1F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 13:09:10 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44ECvVAL008897; Tue, 14 May 2024 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NIEWrCE+EdiQqXy1hNkxLGXUsjxDWcgkeePbCyVah0c=;
 b=lj70rQ3lrEHlDIoei5NoZGpYpKcG38Cl3taPMAzDbXxecdXnnbXtgzGg4DTRpdiZ0mCS
 knPxHA4rSRZPJZG3qkmSYHiF2+dRDWr2ZJucyT3kELLL+o2r6cl1L2lRLrFrUoI3tRUB
 vRdkZu6MyQ/cIxRPsj/PqisHINtsssvC1BlhIxY9nhzF3onWBScN3AMXP1NTg9FnyWxl
 h7dNMA2bgbngSgJ1aDy8yHNIZ4wNI1jAjH5aDEn2MIBxIf5xKrZn/70uRzytNnXgeMr2
 tpUMuz2xHy1q7yVGCkMe9coFRCgEhsJzn93QESIU41TXOS62o/4VcFB/b5zHtPNUldKL bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y48dng1d3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 13:09:07 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44ED96eN027495;
 Tue, 14 May 2024 13:09:06 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y48dng1cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 13:09:06 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 44EBvl4O002310; Tue, 14 May 2024 13:09:05 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0p5gy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 13:09:05 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 44ED921Y25887146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2024 13:09:04 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C93658043;
 Tue, 14 May 2024 13:09:02 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B8EB58061;
 Tue, 14 May 2024 13:09:01 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2024 13:09:00 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v2 1/1] video: Handle HAS_IOPORT dependencies
Date: Tue, 14 May 2024 15:08:58 +0200
Message-Id: <20240514130858.3048650-2-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514130858.3048650-1-schnelle@linux.ibm.com>
References: <20240514130858.3048650-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bb69n2Nnk5IDSX7GYEemP6FIN41cMW0E
X-Proofpoint-GUID: 7ljIGCu-7onwjuyv_xbkVFG4f-OymCrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_06,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405140093
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

In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
compile time. We thus need to #ifdef functions and their callsites which
unconditionally use these I/O accessors. In the include/video/vga.h
these are conveniently all those functions with the vga_io_* prefix.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
and may be merged via subsystem specific trees at your earliest
convenience.

v1 -> v2:
- Moved vga_mm_r(), vga_mm_w(), vga_mm_w_fast() above #ifdef CONFIG_HAS_IOPORT
  to use them in with or without I/O port variants.
- Duplicated vga_r(), vga_w(), vga_w_fast() functions as non-I/O port variants
  to get rid of in-code #ifdef (Arnd)
- Got rid of if (regbase) logic inversion needed for in-code #ifdef

 include/video/vga.h | 58 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/video/vga.h b/include/video/vga.h
index 947c0abd04ef..468764d6727a 100644
--- a/include/video/vga.h
+++ b/include/video/vga.h
@@ -197,9 +197,26 @@ struct vgastate {
 extern int save_vga(struct vgastate *state);
 extern int restore_vga(struct vgastate *state);
 
+static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned short port)
+{
+	return readb (regbase + port);
+}
+
+static inline void vga_mm_w (void __iomem *regbase, unsigned short port, unsigned char val)
+{
+	writeb (val, regbase + port);
+}
+
+static inline void vga_mm_w_fast (void __iomem *regbase, unsigned short port,
+				  unsigned char reg, unsigned char val)
+{
+	writew (VGA_OUT16VAL (val, reg), regbase + port);
+}
+
 /*
  * generic VGA port read/write
  */
+#ifdef CONFIG_HAS_IOPORT
 
 static inline unsigned char vga_io_r (unsigned short port)
 {
@@ -217,22 +234,6 @@ static inline void vga_io_w_fast (unsigned short port, unsigned char reg,
 	outw(VGA_OUT16VAL (val, reg), port);
 }
 
-static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned short port)
-{
-	return readb (regbase + port);
-}
-
-static inline void vga_mm_w (void __iomem *regbase, unsigned short port, unsigned char val)
-{
-	writeb (val, regbase + port);
-}
-
-static inline void vga_mm_w_fast (void __iomem *regbase, unsigned short port,
-				  unsigned char reg, unsigned char val)
-{
-	writew (VGA_OUT16VAL (val, reg), regbase + port);
-}
-
 static inline unsigned char vga_r (void __iomem *regbase, unsigned short port)
 {
 	if (regbase)
@@ -258,7 +259,24 @@ static inline void vga_w_fast (void __iomem *regbase, unsigned short port,
 	else
 		vga_io_w_fast (port, reg, val);
 }
+#else /* CONFIG_HAS_IOPORT */
+static inline unsigned char vga_r (void __iomem *regbase, unsigned short port)
+{
+	return vga_mm_r (regbase, port);
+}
 
+static inline void vga_w (void __iomem *regbase, unsigned short port, unsigned char val)
+{
+	vga_mm_w (regbase, port, val);
+}
+
+
+static inline void vga_w_fast (void __iomem *regbase, unsigned short port,
+			       unsigned char reg, unsigned char val)
+{
+	vga_mm_w_fast (regbase, port, reg, val);
+}
+#endif /* CONFIG_HAS_IOPORT */
 
 /*
  * VGA CRTC register read/write
@@ -280,6 +298,7 @@ static inline void vga_wcrt (void __iomem *regbase, unsigned char reg, unsigned
 #endif /* VGA_OUTW_WRITE */
 }
 
+#ifdef CONFIG_HAS_IOPORT
 static inline unsigned char vga_io_rcrt (unsigned char reg)
 {
         vga_io_w (VGA_CRT_IC, reg);
@@ -295,6 +314,7 @@ static inline void vga_io_wcrt (unsigned char reg, unsigned char val)
         vga_io_w (VGA_CRT_DC, val);
 #endif /* VGA_OUTW_WRITE */
 }
+#endif /* CONFIG_HAS_IOPORT */
 
 static inline unsigned char vga_mm_rcrt (void __iomem *regbase, unsigned char reg)
 {
@@ -333,6 +353,7 @@ static inline void vga_wseq (void __iomem *regbase, unsigned char reg, unsigned
 #endif /* VGA_OUTW_WRITE */
 }
 
+#ifdef CONFIG_HAS_IOPORT
 static inline unsigned char vga_io_rseq (unsigned char reg)
 {
         vga_io_w (VGA_SEQ_I, reg);
@@ -348,6 +369,7 @@ static inline void vga_io_wseq (unsigned char reg, unsigned char val)
         vga_io_w (VGA_SEQ_D, val);
 #endif /* VGA_OUTW_WRITE */
 }
+#endif /* CONFIG_HAS_IOPORT */
 
 static inline unsigned char vga_mm_rseq (void __iomem *regbase, unsigned char reg)
 {
@@ -385,6 +407,7 @@ static inline void vga_wgfx (void __iomem *regbase, unsigned char reg, unsigned
 #endif /* VGA_OUTW_WRITE */
 }
 
+#ifdef CONFIG_HAS_IOPORT
 static inline unsigned char vga_io_rgfx (unsigned char reg)
 {
         vga_io_w (VGA_GFX_I, reg);
@@ -400,6 +423,7 @@ static inline void vga_io_wgfx (unsigned char reg, unsigned char val)
         vga_io_w (VGA_GFX_D, val);
 #endif /* VGA_OUTW_WRITE */
 }
+#endif /* CONFIG_HAS_IOPORT */
 
 static inline unsigned char vga_mm_rgfx (void __iomem *regbase, unsigned char reg)
 {
@@ -434,6 +458,7 @@ static inline void vga_wattr (void __iomem *regbase, unsigned char reg, unsigned
         vga_w (regbase, VGA_ATT_W, val);
 }
 
+#ifdef CONFIG_HAS_IOPORT
 static inline unsigned char vga_io_rattr (unsigned char reg)
 {
         vga_io_w (VGA_ATT_IW, reg);
@@ -445,6 +470,7 @@ static inline void vga_io_wattr (unsigned char reg, unsigned char val)
         vga_io_w (VGA_ATT_IW, reg);
         vga_io_w (VGA_ATT_W, val);
 }
+#endif /* CONFIG_HAS_IOPORT */
 
 static inline unsigned char vga_mm_rattr (void __iomem *regbase, unsigned char reg)
 {
-- 
2.40.1

