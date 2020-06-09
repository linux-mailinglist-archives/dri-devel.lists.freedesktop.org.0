Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6391F3711
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 11:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D989E08;
	Tue,  9 Jun 2020 09:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848089E08
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 09:29:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200609092944euoutp0167646ceeab589e3bba47036140860bb9~W1ifKetB_0933309333euoutp01I
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 09:29:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200609092944euoutp0167646ceeab589e3bba47036140860bb9~W1ifKetB_0933309333euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591694984;
 bh=lmO8I2gtlDKBhQn6Df7D6vscoa/y6HaOIRRQcnneCm0=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=DFuPykEnIKC55yJ/Z/1LqJrf46bV3mne0voUWld9BZrwQKb8y2Mtz/ns04dZHxsRY
 C61hOn26X4h30dOrM+4XwLG+onkhZEeC9OPYD09b3PckpfJ6IQCQPIW3yrZT2yxLwp
 yzBqyrIQ2D7m1h3HV3Qf5xR1vCfk6Qgy0Zt5v0S0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200609092944eucas1p29f2a16c4fd24c531a62959ec05680ce7~W1ifDH1ET1567215672eucas1p2H;
 Tue,  9 Jun 2020 09:29:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 88.63.60679.8865FDE5; Tue,  9
 Jun 2020 10:29:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200609092944eucas1p1e76c223fcfbede0c75d9e91780ffd44b~W1iesRbie3209832098eucas1p1L;
 Tue,  9 Jun 2020 09:29:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200609092944eusmtrp2245759b48870a0bd4a17f7c43e351c1a~W1ier6KDn1661316613eusmtrp2T;
 Tue,  9 Jun 2020 09:29:44 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-d1-5edf56887a02
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1E.8B.07950.8865FDE5; Tue,  9
 Jun 2020 10:29:44 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200609092943eusmtip2c8abf5624327a794a4d6441a39f37ed4~W1iecbHvP0192401924eusmtip2B;
 Tue,  9 Jun 2020 09:29:43 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: uvesafb: fix "noblank" option handling
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <81c9f140-d6fb-803a-18c8-04dae1007ab3@samsung.com>
Date: Tue, 9 Jun 2020 11:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200422071845.403-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djPc7odYffjDKadl7W48vU9m8WJvg+s
 Fpd3zWGzWPFzK6PFoj2dzA6sHi1H3rJ63O8+zuSxZNpVNo/Pm+QCWKK4bFJSczLLUov07RK4
 Mr6dXMFU8JS9YvWsDUwNjAfZuhg5OCQETCQWXSrsYuTiEBJYwSjxfdt3NgjnC6PEte8LWSCc
 z4wS188/YILpeD2LAyK+nFFiy5HPUB1vGSUaZh1m72Lk5GATsJKY2L6KEcQWFvCQaFxyiAXE
 FhFwkJhyYwJYDbNAisSFi9vAangF7CQ+fO9gBrFZBFQktv9YAFYvKhAh8enBYVaIGkGJkzOf
 gMU5Bcwl3h7/yAwxR1zi1pP5TBC2vMT2t3OYQQ6SEJjHLjHv9hGwBgkBF4lT194xQdjCEq+O
 b2GHsGUk/u8EaQZpWMco8bfjBVT3dkaJ5ZP/sUFUWUvcOfcLHGLMApoS63fpQ4QdJc4f2AwN
 SD6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJa7OQvDMLyTuzEPYu
 YGRZxSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZhkTv87/mUH464/SYcYBTgYlXh4b4jf
 ixNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tS
 s1NTC1KLYLJMHJxSDYxr2W3+XWuZ8n1x7IuJ27sj7v5pnuT3yEFJpUzos9i02ddnG1mn6tse
 dZ/sW5bonl++YfHDg3JP7vBsflMocfpf4haFLQJKcsZ+z3L3RZv68xZPUJItqnHfcfVHZVNA
 3J3ri0OW8Sy+57xuUbIx88drPD0Wokzabw5fZa6LvLPGVs5gr1NtVaASS3FGoqEWc1FxIgD+
 kcfKLgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7odYffjDFau57a48vU9m8WJvg+s
 Fpd3zWGzWPFzK6PFoj2dzA6sHi1H3rJ63O8+zuSxZNpVNo/Pm+QCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr6dXMFU8JS9YvWsDUwNjAfZ
 uhg5OCQETCRez+LoYuTkEBJYyijx8Go2RFhG4vj6MpCwhICwxJ9rXUDVXEAlrxklzp1tYwVJ
 sAlYSUxsX8UIYgsLeEg0LjnEAmKLCDhITLkxgR3EZhZIkZi2cB8LRHMXo8Sre0fZQBK8AnYS
 H753MIPYLAIqEtt/LABrFhWIkDi8YxYjRI2gxMmZT8DinALmEm+Pf2SGGKou8WfeJShbXOLW
 k/lMELa8xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7
 iREYU9uO/dyyg7HrXfAhRgEORiUe3hvi9+KEWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqU
 H19UmpNafIjRFOi5icxSosn5wHjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQ
 WgTTx8TBKdXAaMaw6f23MJPvJvJCAisWhqes9I08/k7qi92vR+l/f1wOeytxJyz2z+k3Jdd/
 fF94bob83ZqsYyxu3Kduc/R6zHJ571q560JOWPTliJ4DknLTdu+4lLI5q3r7agfP+W6ezG6G
 03d9naoYp9j6XLndVcxTmclAof/B0RccnZ2bvoQvm/5Yatrq/0osxRmJhlrMRcWJAM3baNO/
 AgAA
X-CMS-MailID: 20200609092944eucas1p1e76c223fcfbede0c75d9e91780ffd44b
X-Msg-Generator: CA
X-RootMTR: 20200422071952eucas1p219bc9ef0a74220149966ecb03688681c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200422071952eucas1p219bc9ef0a74220149966ecb03688681c
References: <CGME20200422071952eucas1p219bc9ef0a74220149966ecb03688681c@eucas1p2.samsung.com>
 <20200422071845.403-1-yanaijie@huawei.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the recent regression.

Fixes: dbc7ece12a38 ("video: uvesafb: use true,false for bool variables")
Cc: Jason Yan <yanaijie@huawei.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
v2:
- added Reviewed-by tag from Sam
- removed no longer working Michal's email address from Cc:

 drivers/video/fbdev/uvesafb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/uvesafb.c
===================================================================
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1836,7 +1836,7 @@ static int uvesafb_setup(char *options)
 		else if (!strcmp(this_opt, "noedid"))
 			noedid = true;
 		else if (!strcmp(this_opt, "noblank"))
-			blank = true;
+			blank = false;
 		else if (!strncmp(this_opt, "vtotal:", 7))
 			vram_total = simple_strtoul(this_opt + 7, NULL, 0);
 		else if (!strncmp(this_opt, "vremap:", 7))
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
