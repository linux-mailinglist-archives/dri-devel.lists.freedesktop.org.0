Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFE29732C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989B6F8B9;
	Fri, 23 Oct 2020 16:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 16289 seconds by postgrey-1.36 at gabe;
 Fri, 23 Oct 2020 16:06:01 UTC
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1596F8B9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 16:06:01 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBOxfq013150;
 Fri, 23 Oct 2020 11:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tbKiGTsT3s13Xp9OSxn215JhwhGeMxGx2qrXzzVgyvI=;
 b=B8KcomkT8cV4HfCW1C7w22aZJIcXSiso+p9BX+YeETprhJNWQPMo4Of4gMPkBbrh4bWA
 rWUrXWUEf2+bdC5TQI9TbLRMEwLri58JhRW7nk6bgKlXqWTBMLZlyyawWSDJIti+8CJU
 PM4/VccVK7Shix04PVGJDqp5icPvr9GyOCZrQDqirUEzC20hnRWGMpdW1HhVJWRDeAl5
 rBERygRKZlpEVdSANOYYk/JOlI01IFHQtVti0m/9E+BDf7o+AB/Dc2i+7iWOPn0wWKMJ
 e41JXGGWJq2KW4G/Li6tTbE7ap35E9ojfgmfM5BGF++o0yyutSgGK50/M+JKrUQGqbKy TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 347p4barwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Oct 2020 11:34:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBQ2xK151409;
 Fri, 23 Oct 2020 11:34:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 34ak1ayjv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Oct 2020 11:34:18 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NBYBgc010958;
 Fri, 23 Oct 2020 11:34:11 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 23 Oct 2020 04:34:10 -0700
Date: Fri, 23 Oct 2020 14:34:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH] drm/i915: Fix a crash in shmem_pin_map() error handling
Message-ID: <20201023113401.GG282278@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230081
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a signedness bug in shmem_pin_map() error handling because "i"
is unsigned.  The "while (--i >= 0)" will loop forever until the system
crashes.

Fixes: bfed6708d6c9 ("drm/i915: use vmap in shmem_pin_map")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index f011ea42487e..7eb542018219 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -52,8 +52,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 void *shmem_pin_map(struct file *file)
 {
 	struct page **pages;
-	size_t n_pages, i;
+	size_t n_pages;
 	void *vaddr;
+	int i;
 
 	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
 	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
