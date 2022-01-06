Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AC7486284
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761210EA08;
	Thu,  6 Jan 2022 09:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EB510E9FF;
 Thu,  6 Jan 2022 09:57:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E9DBB81FEB;
 Thu,  6 Jan 2022 09:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444E6C36AEB;
 Thu,  6 Jan 2022 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641463036;
 bh=XHcihxlg55irUljDtcOsfIt5U7f67CRr+vIMHJeiFXE=;
 h=From:To:Cc:Subject:Date:From;
 b=BGsrLo5/J8jfvBjvOmPv1Xb6uZc7IWrJSkkjO3HxD+zq/3DxibGbNylHVJ48il4yi
 0x6/mnqAbYv3kD+QYRZzUrqFZP0NuIX48W4YU8ZdG6EDPR8YNygB2re+VW+tVG9SZH
 svXnI5OqAkI5E3zSEyQA9VWR/T/Q4Jg1rvbonkvk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: use default_groups in kobj_type
Date: Thu,  6 Jan 2022 10:57:13 +0100
Message-Id: <20220106095713.3276112-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; h=from:subject;
 bh=XHcihxlg55irUljDtcOsfIt5U7f67CRr+vIMHJeiFXE=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDInX9vxUTf3ySzPPzGfz/Pw9nwr9SltW+wi1rM94YpeQyBXR
 PkuhI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACYy14ZhnoHLu0Va6z+mfZzVt2TTkj
 lle75KNDIs6CqwlzolOevO1NXc5j+3iEgnJHBKAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the amdkfd sysfs code to use default_groups field which has
been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index b993011cfa64..1f4a07f984eb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -462,6 +462,7 @@ static struct attribute *procfs_queue_attrs[] = {
 	&attr_queue_gpuid,
 	NULL
 };
+ATTRIBUTE_GROUPS(procfs_queue);
 
 static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
@@ -469,7 +470,7 @@ static const struct sysfs_ops procfs_queue_ops = {
 
 static struct kobj_type procfs_queue_type = {
 	.sysfs_ops = &procfs_queue_ops,
-	.default_attrs = procfs_queue_attrs,
+	.default_groups = procfs_queue_groups,
 };
 
 static const struct sysfs_ops procfs_stats_ops = {
-- 
2.34.1

