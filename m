Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174A3022FA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5D89CDE;
	Mon, 25 Jan 2021 08:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B2789BBD;
 Mon, 25 Jan 2021 08:48:48 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8ip5d172065;
 Mon, 25 Jan 2021 08:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=L7ODlPnGNK523JXoce5JEfvkhpSmcTncF671W+J7cIU=;
 b=eTRlnR7XuSgeu0LL4RsbbWa1Ml5/4QHkE0w91KCnH5aKKLhH1DYvmNGD50O2JA+yDMAw
 BpVd8ZKBcy7quqocM8CErg+RJVWEFqq/XYxefJ0JviZxY8q63kv+MjBlTjbLJMhgait7
 FZGGFxC4+smCZGetNlrvA0cCFKxQDylAv5EJa64QEdaLCsoKrJ2pPdwVS1XS3JrgsIEd
 dAGYo3qWaN2HEdY4iZe5PT92w2jrmtMHKtNk1+XguS3lUTteEDNc4etNuOZMtFHhKRw0
 vbZ3iWaJLE7gWkxokZcsLJVPRoE7D7VuH2EVciODTXRV5DGkbWMZW1OtCtxfN8pqeg1A AA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 368brkc476-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 08:48:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8jT9S128273;
 Mon, 25 Jan 2021 08:48:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 368wjpdy5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 08:48:42 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10P8me0J010887;
 Mon, 25 Jan 2021 08:48:40 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Jan 2021 00:48:39 -0800
Date: Mon, 25 Jan 2021 11:48:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH] drm/i915/gvt: fix uninitialized return in
 intel_gvt_update_reg_whitelist()
Message-ID: <YA6F3oF8mRaNQWjb@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250052
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250052
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch found an uninitialized variable bug in this code:

    drivers/gpu/drm/i915/gvt/cmd_parser.c:3191 intel_gvt_update_reg_whitelist()
    error: uninitialized symbol 'ret'.

The first thing that Smatch complains about is that "ret" isn't set if
we don't enter the "for_each_engine(engine, &dev_priv->gt, id) {" loop.
Presumably we always have at least one engine so that's a false
positive.

But it's definitely a bug to not set "ret" if i915_gem_object_pin_map()
fails.

Let's fix the bug and silence the false positive.

Fixes: 493f30cd086e ("drm/i915/gvt: parse init context to update cmd accessible reg whitelist")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 7fb91de06557..d54ea0e4681d 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -3103,7 +3103,7 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	struct i915_request *requests[I915_NUM_ENGINES] = {};
 	bool is_ctx_pinned[I915_NUM_ENGINES] = {};
-	int ret;
+	int ret = 0;
 
 	if (gvt->is_reg_whitelist_updated)
 		return;
@@ -3157,6 +3157,7 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 		if (IS_ERR(vaddr)) {
 			gvt_err("failed to pin init ctx obj, ring=%d, err=%lx\n",
 				id, PTR_ERR(vaddr));
+			ret = PTR_ERR(vaddr);
 			goto out;
 		}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
