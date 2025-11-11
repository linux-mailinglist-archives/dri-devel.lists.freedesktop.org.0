Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F89C4DABB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B310E02D;
	Tue, 11 Nov 2025 12:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ukd8IXia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200D10E569;
 Tue, 11 Nov 2025 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762864076; x=1794400076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UQGsnSg1BaEGnQW/GmmVLAGeLaVWJuQCcCUScfVp7s=;
 b=Ukd8IXiakAsKABJwX6rupjwlFMODWkCZVETvkKuRI+AHZlfMn3kQuPts
 RUGT4tIUhPCk8sxcFVKCshlxyg3ZogYed7sCpQQB1HOSWCyDMROeX36e2
 SXB8VGJAtc3jfkNpcZbEq9OX96BE8vymoHp/Rr2VHld6/d80/Vwt07y1Y
 bQodZYrhEKw0Tgayy8g9ShIyQGB+wnJ0F7qhx0DkGR9o9K4OSkDFoz6HS
 PAtm+P3jEjyMSioLjZYczop1S9MJ4LMI4oW6x6fboAUGCvPU6RZE2eXSg
 HifT6WjQFEqq/5/0hWVPxQ1bDvwkwDRdx/veuausNJZ18y8dhlwKC/AyH w==;
X-CSE-ConnectionGUID: WpRKPtgKTdyWERF3xcHrYA==
X-CSE-MsgGUID: Q0Igfz8RRYWAys9dRa7v7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75606832"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="75606832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 04:27:55 -0800
X-CSE-ConnectionGUID: EF85IjB2TdiLGZsQTq6TSA==
X-CSE-MsgGUID: W0MVRMT/SGiKxXDFXSY42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188592903"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 04:27:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id D7E5398; Tue, 11 Nov 2025 13:27:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 02/21] ceph: Switch to use %ptSp
Date: Tue, 11 Nov 2025 13:20:02 +0100
Message-ID: <20251111122735.880607-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
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

Use %ptSp instead of open coded variants to print content of
struct timespec64 in human readable format.

Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/ceph/dir.c   |  5 ++---
 fs/ceph/inode.c | 49 ++++++++++++++++---------------------------------
 fs/ceph/xattr.c |  6 ++----
 3 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
index d18c0eaef9b7..bf50c6e7a029 100644
--- a/fs/ceph/dir.c
+++ b/fs/ceph/dir.c
@@ -2155,7 +2155,7 @@ static ssize_t ceph_read_dir(struct file *file, char __user *buf, size_t size,
 				" rfiles:   %20lld\n"
 				" rsubdirs: %20lld\n"
 				"rbytes:    %20lld\n"
-				"rctime:    %10lld.%09ld\n",
+				"rctime:    %ptSp\n",
 				ci->i_files + ci->i_subdirs,
 				ci->i_files,
 				ci->i_subdirs,
@@ -2163,8 +2163,7 @@ static ssize_t ceph_read_dir(struct file *file, char __user *buf, size_t size,
 				ci->i_rfiles,
 				ci->i_rsubdirs,
 				ci->i_rbytes,
-				ci->i_rctime.tv_sec,
-				ci->i_rctime.tv_nsec);
+				&ci->i_rctime);
 	}
 
 	if (*ppos >= dfi->dir_info_len)
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 37d3a2477c17..a596cb53f1ac 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -879,7 +879,9 @@ void ceph_fill_file_time(struct inode *inode, int issued,
 {
 	struct ceph_client *cl = ceph_inode_to_client(inode);
 	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct timespec64 iatime = inode_get_atime(inode);
 	struct timespec64 ictime = inode_get_ctime(inode);
+	struct timespec64 imtime = inode_get_mtime(inode);
 	int warn = 0;
 
 	if (issued & (CEPH_CAP_FILE_EXCL|
@@ -889,39 +891,26 @@ void ceph_fill_file_time(struct inode *inode, int issued,
 		      CEPH_CAP_XATTR_EXCL)) {
 		if (ci->i_version == 0 ||
 		    timespec64_compare(ctime, &ictime) > 0) {
-			doutc(cl, "ctime %lld.%09ld -> %lld.%09ld inc w/ cap\n",
-			     ictime.tv_sec, ictime.tv_nsec,
-			     ctime->tv_sec, ctime->tv_nsec);
+			doutc(cl, "ctime %ptSp -> %ptSp inc w/ cap\n", &ictime, ctime);
 			inode_set_ctime_to_ts(inode, *ctime);
 		}
 		if (ci->i_version == 0 ||
 		    ceph_seq_cmp(time_warp_seq, ci->i_time_warp_seq) > 0) {
 			/* the MDS did a utimes() */
-			doutc(cl, "mtime %lld.%09ld -> %lld.%09ld tw %d -> %d\n",
-			     inode_get_mtime_sec(inode),
-			     inode_get_mtime_nsec(inode),
-			     mtime->tv_sec, mtime->tv_nsec,
-			     ci->i_time_warp_seq, (int)time_warp_seq);
+			doutc(cl, "mtime %ptSp -> %ptSp tw %d -> %d\n", &imtime, mtime,
+			      ci->i_time_warp_seq, (int)time_warp_seq);
 
 			inode_set_mtime_to_ts(inode, *mtime);
 			inode_set_atime_to_ts(inode, *atime);
 			ci->i_time_warp_seq = time_warp_seq;
 		} else if (time_warp_seq == ci->i_time_warp_seq) {
-			struct timespec64	ts;
-
 			/* nobody did utimes(); take the max */
-			ts = inode_get_mtime(inode);
-			if (timespec64_compare(mtime, &ts) > 0) {
-				doutc(cl, "mtime %lld.%09ld -> %lld.%09ld inc\n",
-				     ts.tv_sec, ts.tv_nsec,
-				     mtime->tv_sec, mtime->tv_nsec);
+			if (timespec64_compare(mtime, &imtime) > 0) {
+				doutc(cl, "mtime %ptSp -> %ptSp inc\n", &imtime, mtime);
 				inode_set_mtime_to_ts(inode, *mtime);
 			}
-			ts = inode_get_atime(inode);
-			if (timespec64_compare(atime, &ts) > 0) {
-				doutc(cl, "atime %lld.%09ld -> %lld.%09ld inc\n",
-				     ts.tv_sec, ts.tv_nsec,
-				     atime->tv_sec, atime->tv_nsec);
+			if (timespec64_compare(atime, &iatime) > 0) {
+				doutc(cl, "atime %ptSp -> %ptSp inc\n", &iatime, atime);
 				inode_set_atime_to_ts(inode, *atime);
 			}
 		} else if (issued & CEPH_CAP_FILE_EXCL) {
@@ -2703,10 +2692,8 @@ int __ceph_setattr(struct mnt_idmap *idmap, struct inode *inode,
 	if (ia_valid & ATTR_ATIME) {
 		struct timespec64 atime = inode_get_atime(inode);
 
-		doutc(cl, "%p %llx.%llx atime %lld.%09ld -> %lld.%09ld\n",
-		      inode, ceph_vinop(inode),
-		      atime.tv_sec, atime.tv_nsec,
-		      attr->ia_atime.tv_sec, attr->ia_atime.tv_nsec);
+		doutc(cl, "%p %llx.%llx atime %ptSp -> %ptSp\n",
+		      inode, ceph_vinop(inode), &atime, &attr->ia_atime);
 		if (!do_sync && (issued & CEPH_CAP_FILE_EXCL)) {
 			ci->i_time_warp_seq++;
 			inode_set_atime_to_ts(inode, attr->ia_atime);
@@ -2780,10 +2767,8 @@ int __ceph_setattr(struct mnt_idmap *idmap, struct inode *inode,
 	if (ia_valid & ATTR_MTIME) {
 		struct timespec64 mtime = inode_get_mtime(inode);
 
-		doutc(cl, "%p %llx.%llx mtime %lld.%09ld -> %lld.%09ld\n",
-		      inode, ceph_vinop(inode),
-		      mtime.tv_sec, mtime.tv_nsec,
-		      attr->ia_mtime.tv_sec, attr->ia_mtime.tv_nsec);
+		doutc(cl, "%p %llx.%llx mtime %ptSp -> %ptSp\n",
+		      inode, ceph_vinop(inode), &mtime, &attr->ia_mtime);
 		if (!do_sync && (issued & CEPH_CAP_FILE_EXCL)) {
 			ci->i_time_warp_seq++;
 			inode_set_mtime_to_ts(inode, attr->ia_mtime);
@@ -2804,13 +2789,11 @@ int __ceph_setattr(struct mnt_idmap *idmap, struct inode *inode,
 
 	/* these do nothing */
 	if (ia_valid & ATTR_CTIME) {
+		struct timespec64 ictime = inode_get_ctime(inode);
 		bool only = (ia_valid & (ATTR_SIZE|ATTR_MTIME|ATTR_ATIME|
 					 ATTR_MODE|ATTR_UID|ATTR_GID)) == 0;
-		doutc(cl, "%p %llx.%llx ctime %lld.%09ld -> %lld.%09ld (%s)\n",
-		      inode, ceph_vinop(inode),
-		      inode_get_ctime_sec(inode),
-		      inode_get_ctime_nsec(inode),
-		      attr->ia_ctime.tv_sec, attr->ia_ctime.tv_nsec,
+		doutc(cl, "%p %llx.%llx ctime %ptSp -> %ptSp (%s)\n",
+		      inode, ceph_vinop(inode), &ictime, &attr->ia_ctime,
 		      only ? "ctime only" : "ignored");
 		if (only) {
 			/*
diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index 537165db4519..ad1f30bea175 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -249,8 +249,7 @@ static ssize_t ceph_vxattrcb_dir_rbytes(struct ceph_inode_info *ci, char *val,
 static ssize_t ceph_vxattrcb_dir_rctime(struct ceph_inode_info *ci, char *val,
 					size_t size)
 {
-	return ceph_fmt_xattr(val, size, "%lld.%09ld", ci->i_rctime.tv_sec,
-				ci->i_rctime.tv_nsec);
+	return ceph_fmt_xattr(val, size, "%ptSp", &ci->i_rctime);
 }
 
 /* dir pin */
@@ -307,8 +306,7 @@ static bool ceph_vxattrcb_snap_btime_exists(struct ceph_inode_info *ci)
 static ssize_t ceph_vxattrcb_snap_btime(struct ceph_inode_info *ci, char *val,
 					size_t size)
 {
-	return ceph_fmt_xattr(val, size, "%lld.%09ld", ci->i_snap_btime.tv_sec,
-				ci->i_snap_btime.tv_nsec);
+	return ceph_fmt_xattr(val, size, "%ptSp", &ci->i_snap_btime);
 }
 
 static ssize_t ceph_vxattrcb_cluster_fsid(struct ceph_inode_info *ci,
-- 
2.50.1

