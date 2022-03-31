Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B84EE421
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 00:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8F410E313;
	Thu, 31 Mar 2022 22:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1E610E313
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 22:35:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bg10so2229912ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nik1iTbxoUWnG6UF8WspcQRjvneqvZ965qd0fvy6u0Q=;
 b=onwlNXEfsXY5267AxROmbVgwPHyozyAkfW/eFrSTJ29X2muD4OpT4LcAzhalPbQd/b
 CKKvVbnuI0cwUFkWWUdzbnGsJSK/fRV89XUWiC/WnV/yncPvIhtMQLgUICGaLathnPov
 SQyfqPvBUDIKdjR1LnGVk9ymAD/jMYdQ11bhYyZ6DboyOFk2Q51P/4WpDFx66Om+IUPr
 oLc4SWKuRN472tKQAwpou0cQPzrxZnWOpoX0P8iqr85CgjGt3djEDjxAQwAcR9K779Qe
 brkBa++inBLdnrRA2nDX/4m88mHASicccPQr2P8VaqCzfDtNDb6I/AVh+jqSYcSwCVvh
 1sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nik1iTbxoUWnG6UF8WspcQRjvneqvZ965qd0fvy6u0Q=;
 b=t2ayZTQmLDUukYsPzq4QL3VBIiAPmh10TvRT2oPLL6bCzE+Rvt01nu2NV6R/aV02t5
 aCgcG8IcL79j9Vf90STwbsc98v5+37/8x7kIyLQA0HIJWfvBU7zoX8L5N1yeaElQzH7d
 p0tm38fRSF9mKVR4XzB1Msfzem9LBtMMXTd4vj5oj4jRE3Z60oVZTCIwGCGRrFhwiS3+
 3YhydcNFRBBLJ7puHPs/fKiaXxq+0eWWhlqWdH4i84AMkrGxrXaxdWJPIShg0ExI72/v
 WerM4LtjAFgZ+XaBWe8BswO7q8/x0nSGypmK7hb5J+i1af/6j/f86JAVqvYlRMI5Mmas
 RHhw==
X-Gm-Message-State: AOAM531Vk/iTh0RVKvhN5cbLvD0J9mymnxPujKsZbnP4/ioQ0G9WBhNS
 ulVsWo4Fadx81PwgiUVowEg=
X-Google-Smtp-Source: ABdhPJwvadEyXeLejHBvKE54rjB5jVViHNh1B2AJIl0ecn//oet1U6QeTVIECiwaHI2D6i+E5n0PVw==
X-Received: by 2002:a17:907:9725:b0:6e0:b274:aa4c with SMTP id
 jg37-20020a170907972500b006e0b274aa4cmr6900584ejc.565.1648766146417; 
 Thu, 31 Mar 2022 15:35:46 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm337761edu.51.2022.03.31.15.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:35:46 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev-MMP: replace usage of found with dedicated list
 iterator variable
Date: Fri,  1 Apr 2022 00:35:03 +0200
Message-Id: <20220331223503.902142-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Mike Rapoport <rppt@kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/video/fbdev/mmp/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/mmp/core.c b/drivers/video/fbdev/mmp/core.c
index 154127256a2c..03707461eced 100644
--- a/drivers/video/fbdev/mmp/core.c
+++ b/drivers/video/fbdev/mmp/core.c
@@ -127,19 +127,18 @@ EXPORT_SYMBOL_GPL(mmp_unregister_panel);
  */
 struct mmp_path *mmp_get_path(const char *name)
 {
-	struct mmp_path *path;
-	int found = 0;
+	struct mmp_path *path = NULL, *iter;
 
 	mutex_lock(&disp_lock);
-	list_for_each_entry(path, &path_list, node) {
-		if (!strcmp(name, path->name)) {
-			found = 1;
+	list_for_each_entry(iter, &path_list, node) {
+		if (!strcmp(name, iter->name)) {
+			path = iter;
 			break;
 		}
 	}
 	mutex_unlock(&disp_lock);
 
-	return found ? path : NULL;
+	return path;
 }
 EXPORT_SYMBOL_GPL(mmp_get_path);
 

base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
-- 
2.25.1

