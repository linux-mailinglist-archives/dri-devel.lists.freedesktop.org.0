Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B3AF63CB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99B10E082;
	Wed,  2 Jul 2025 21:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="QcK29Qvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4142510E082
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0lnNT7VXFrd5hFSMTB8A5PSAxW/oCHup8N9yaRGth44=; b=QcK29QvsYVGRGkdCtd/fjh8LFU
 OUvu58zeu0jFID8JeERStNKf+LjLUxo1VxxdSo+xJq4c+Z1e4dP6Td8akMwn1K4iNffENyJBRh+55
 U3ddwQjPDeUbyPmEaLNjca+pq7QdU8eXdISrZ5GmM8goDfLsxj14glmkH2iDMjlPkQqnCC3uAVBsO
 f8o4a9QPYaLA6LoWjzxagmyg1xj/Dr6oSJG0dvq62lWMmB0ab1w+C9PnAEhAjzC4Vpe/Z53Pl2YJe
 itm8IOsGuPsdyJFPYSWB2842A0LRRaV6EW1vQihPRcXwgNgaYTG+PA8D/wSUJslXAdv+ZuW74fUgA
 3YRMgXBg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uX4mO-0000000EImB-3Cny; Wed, 02 Jul 2025 21:14:08 +0000
Date: Wed, 2 Jul 2025 22:14:08 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] zynqmp: don't bother with debugfs_file_{get,put}() in
 proxied fops
Message-ID: <20250702211408.GA3406663@ZenIV>
References: <20250702211305.GE1880847@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702211305.GE1880847@ZenIV>
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

When debugfs file has been created by debugfs_create_file_unsafe(),
we do need the file_operations methods to use debugfs_file_{get,put}()
to prevent concurrent removal; for files created by debugfs_create_file()
that is done in the wrappers that call underlying methods, so there's
no point whatsoever duplicating that in the underlying methods themselves.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 38 ++++----------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 238cbb49963e..197defe4f928 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1869,20 +1869,14 @@ static int zynqmp_dp_test_setup(struct zynqmp_dp *dp)
 static ssize_t zynqmp_dp_pattern_read(struct file *file, char __user *user_buf,
 				      size_t count, loff_t *ppos)
 {
-	struct dentry *dentry = file->f_path.dentry;
 	struct zynqmp_dp *dp = file->private_data;
 	char buf[16];
 	ssize_t ret;
 
-	ret = debugfs_file_get(dentry);
-	if (unlikely(ret))
-		return ret;
-
 	scoped_guard(mutex, &dp->lock)
 		ret = snprintf(buf, sizeof(buf), "%s\n",
 			       test_pattern_str[dp->test.pattern]);
 
-	debugfs_file_put(dentry);
 	return simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 }
 
@@ -1890,27 +1884,20 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
 				       const char __user *user_buf,
 				       size_t count, loff_t *ppos)
 {
-	struct dentry *dentry = file->f_path.dentry;
 	struct zynqmp_dp *dp = file->private_data;
 	char buf[16];
 	ssize_t ret;
 	int pattern;
 
-	ret = debugfs_file_get(dentry);
-	if (unlikely(ret))
-		return ret;
-
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
 				     count);
 	if (ret < 0)
-		goto out;
+		return ret;
 	buf[ret] = '\0';
 
 	pattern = sysfs_match_string(test_pattern_str, buf);
-	if (pattern < 0) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (pattern < 0)
+		return -EINVAL;
 
 	mutex_lock(&dp->lock);
 	dp->test.pattern = pattern;
@@ -1919,8 +1906,6 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
 						 dp->test.custom) ?: ret;
 	mutex_unlock(&dp->lock);
 
-out:
-	debugfs_file_put(dentry);
 	return ret;
 }
 
@@ -2026,20 +2011,13 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_active, zynqmp_dp_active_get,
 static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
 				     size_t count, loff_t *ppos)
 {
-	struct dentry *dentry = file->f_path.dentry;
 	struct zynqmp_dp *dp = file->private_data;
 	ssize_t ret;
 
-	ret = debugfs_file_get(dentry);
-	if (unlikely(ret))
-		return ret;
-
 	mutex_lock(&dp->lock);
 	ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
 				      sizeof(dp->test.custom));
 	mutex_unlock(&dp->lock);
-
-	debugfs_file_put(dentry);
 	return ret;
 }
 
@@ -2047,18 +2025,13 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
 				      const char __user *user_buf,
 				      size_t count, loff_t *ppos)
 {
-	struct dentry *dentry = file->f_path.dentry;
 	struct zynqmp_dp *dp = file->private_data;
 	ssize_t ret;
 	char buf[sizeof(dp->test.custom)];
 
-	ret = debugfs_file_get(dentry);
-	if (unlikely(ret))
-		return ret;
-
 	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	mutex_lock(&dp->lock);
 	memcpy(dp->test.custom, buf, ret);
@@ -2066,9 +2039,6 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
 		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
 						 dp->test.custom) ?: ret;
 	mutex_unlock(&dp->lock);
-
-out:
-	debugfs_file_put(dentry);
 	return ret;
 }
 
-- 
2.39.5

