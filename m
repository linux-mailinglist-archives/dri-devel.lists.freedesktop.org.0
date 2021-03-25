Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4E3499DB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D396EE10;
	Thu, 25 Mar 2021 18:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74626EB7A;
 Thu, 25 Mar 2021 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hiler.eu;
 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
 :Message-Id:Date:Subject:Cc:To:From;
 bh=MBrCQbzWkuPBZIkmn0psZIDfuj9I2Ot/AHJNEjerLe4=; b=kBHhuf6xfrgBg+rGt4/2Bn1AZB
 cQ0OiQzGAY3T/hzaf6dxpptrt/+UKB1ygGdWDRU7C3kCAjlja9n9g+cNdVbg79vnd8o0DyMA94CEk
 PmmK2BwAOwVYihajFSwRoviN4NiRgImjV2cVTaPt/f0sEOUnbv1BnuCf8N94z2lENDpdUzA6GQdne
 IYYvCxz29a0APaF4AV3p/1nmae14t2DD9jiyXqwE1S24aiwbnfe9K71ZiBE9LzNZp+UjuZ74HAmVX
 pMDkDwIFL/MIiSIjZYR02HMp3Knw8VI+3iOjd8/LSzygC9S7etyqiF+migWgsGA7jJgJ5mWyWaWCa
 6VOVI8qQ==;
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <arek@hiler.eu>)
 id 1lPVCd-0001yq-QZ; Thu, 25 Mar 2021 19:59:31 +0100
Received: by submission01.runbox with esmtpsa [Authenticated alias (933559)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lPVCW-0001ML-6q; Thu, 25 Mar 2021 19:59:24 +0100
From: Arkadiusz Hiler <arek@hiler.eu>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] .gitlab-ci: Don't test Autotools
Date: Thu, 25 Mar 2021 20:59:14 +0200
Message-Id: <20210325185915.51590-4-arek@hiler.eu>
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

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 .gitlab-ci.yml          | 18 ------------------
 Dockerfile.build-debian |  8 --------
 2 files changed, 26 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e226d9d7..2b03fc98 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -154,17 +154,6 @@ build:tests-debian-meson-mips:
     paths:
       - build
 
-build:tests-debian-autotools:
-  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
-  stage: build
-  script:
-    - ./autogen.sh --enable-{chamelium,audio,intel,amdgpu,nouveau,tests,runner}
-    - make -j $(nproc) || make -j 1
-    - cp tests/test-list.txt autotools-test-list.txt
-  artifacts:
-    paths:
-      - autotools-test-list.txt
-
 #################### TEST ##########################
 
 test:ninja-test:
@@ -236,13 +225,6 @@ test:ninja-test-mips:
       - build
     when: on_failure
 
-test:test-list-diff:
-  dependencies:
-    - build:tests-debian-autotools
-    - build:tests-debian-meson
-  stage: test
-  script: diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost\|nouveau' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)
-
 test:list-undocumented-tests:
   dependencies:
     - build:tests-fedora
diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index b143a532..454f4bce 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -20,12 +20,4 @@ RUN apt-get install -y \
 			peg \
 			libdrm-intel1
 
-# autotools build deps
-RUN apt-get install -y \
-			autoconf \
-			automake \
-			xutils-dev \
-			libtool \
-			make
-
 RUN apt-get clean
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
