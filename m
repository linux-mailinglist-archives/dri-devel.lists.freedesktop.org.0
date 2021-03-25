Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268353499E1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41F56EE1C;
	Thu, 25 Mar 2021 18:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060156EE1E;
 Thu, 25 Mar 2021 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hiler.eu;
 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
 :Message-Id:Date:Subject:Cc:To:From;
 bh=XKEPUcginBRrGqcMEowuAtdUfBN+L4i35Fgl79e0nLU=; b=aYNySqrr+y/atiZsBDHUe4kwMV
 tA5hIM931b40gNYeF23tuaMI3oP0RUYLkMTsTV85jeXXNY2PhywGx+H+r4y3tyQ7+ryzYTmaTOTAU
 QgUNGNpo9kCUTTq597eXrQvXpXYglIGmP4hcPTGwqTiLY8x/QiadcDG6n5oCQuwm4cmlni2ukk1Mf
 ZbQpY4ahI3gD66Lg4V6Z0/pLNfDw4KZTnhGFt8lNa+eGJOz/N64IYzpGqvuBeSsPhaMFF9CBrEh1w
 Yg9EKBn9SfS+4sRVWZrHnvNwtC15lnhSzrs5kdmKxYAms2RltsHhIZJsLNxTv3tATD8VQaZFhpE8I
 FYZ39dLw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <arek@hiler.eu>)
 id 1lPVCm-0007Dp-As; Thu, 25 Mar 2021 19:59:40 +0100
Received: by submission03.runbox with esmtpsa [Authenticated alias (933559)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lPVCU-0001QH-U0; Thu, 25 Mar 2021 19:59:22 +0100
From: Arkadiusz Hiler <arek@hiler.eu>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/5] tests: Build gem_concurrent_all with meson
Date: Thu, 25 Mar 2021 20:59:12 +0200
Message-Id: <20210325185915.51590-2-arek@hiler.eu>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325185915.51590-1-arek@hiler.eu>
References: <20210325185915.51590-1-arek@hiler.eu>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

...and add it to test-list-full.txt just like we do when building with
autotools.

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 tests/meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 54a1a3c7..8e3cd390 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -402,6 +402,19 @@ test_list_target = custom_target('testlist',
 	      install : true,
 	      install_dir : libexecdir)
 
+test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
+	   dependencies : test_deps + [ libatomic ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'gem_concurrent_all'
+
+test_list_full_target = custom_target('testlist-full',
+	      output : 'test-list-full.txt',
+	      command : [ gen_testlist, '@OUTPUT@', test_list ],
+	      install : true,
+	      install_dir : libexecdir)
+
 test_script = find_program('igt_command_line.sh')
 foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
