Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4B750AFB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75FD10E54D;
	Wed, 12 Jul 2023 14:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168A310E54E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:29:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6ABD061820;
 Wed, 12 Jul 2023 14:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7056C433CA;
 Wed, 12 Jul 2023 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689172140;
 bh=HQ7aGbV4C7uaZAHLezNUkQSJsAkwtDjgQS3l2fLDv8g=;
 h=From:To:Cc:Subject:Date:From;
 b=uRpRe2FBwR2ytkiG/aO3Bgltf6Rdz5u2Hx/03RuV00p8Npi4EuH/K0928b5lJ9oF2
 RmzOqo+2LMt6zjoDLTjyEwk3SHpJSSq/K4PwkpYk8GRpw2p6oBBeaya0FEt0YM7OXu
 OKltFvcyQrcfuXzCbVYENGQQvcDJvO8idxR92BNmXt50jz/lHK34Tu2IKAbfo31pG7
 h5itJpBHiK+TzHHO2zuHsylG65j9wV7cpHkqW7IeFs58fSIuH6nKcuhMew8FdnSWax
 jUbccFbSCDs6uTd8yLMxYeN+UFu4JFntosz8h7ij9pKeF7lLgDQoQkgQ+FUL2IDcYU
 QHQH2PQWCwQsA==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1qJapt-003bek-1S;
 Wed, 12 Jul 2023 16:28:57 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC 0/2] Add support for inlined documentation for kunit and
 kselftests
Date: Wed, 12 Jul 2023 16:28:53 +0200
Message-Id: <cover.1689171160.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: David Gow <davidgow@google.com>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmoar@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mauro.chehab@intel.com, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This RFC is a follow-up of the discussions taken here:

   https://lore.kernel.org/linux-doc/20230704132812.02ba97ba@maurocar-mobl2/T/#t

It adds a new extension that allows documenting tests using the same tool we're
using for DRM unit tests at IGT GPU tools: https://gitlab.freedesktop.org/drm/igt-gpu-tools.

While kernel-doc has provided documentation for in-lined functions/struct comments,
it was not meant to document tests.

Tests need to be grouped by the test functions. It should also be possible to produce
other outputs from the documentation, to integrate it with test suites. For instance, 
Internally at Intel, we use the comments to generate DOT files hierarchically grouped
per feature categories.

This is just an initial RFC to start discussions around the solution. Before being merged
upstream, we need to define what tags will be used to identify test markups and add
a simple change at kernel-doc to let it ignore such markups.

On this series, we have:

- patch 1:
  adding test_list.py as present at the IGT tree, after a patch series to make it
  more generic: https://patchwork.freedesktop.org/series/120622/
- patch 2:
  adds an example about how tests could be documented. This is a really simple
  example, just to test the feature, specially designed to make easy to build just
  the test documentation from a single DRM kunit file.

After discussions, my plan is to send a new version addressing the issues, and add
some documentation for DRM and/or i915 kunit tests.

Mauro Carvalho Chehab (2):
  docs: add support for documenting kUnit and kSelftests
  drm: add documentation for drm_buddy_test kUnit test

 Documentation/conf.py                  |    2 +-
 Documentation/index.rst                |    2 +-
 Documentation/sphinx/test_kdoc.py      |  108 ++
 Documentation/sphinx/test_list.py      | 1288 ++++++++++++++++++++++++
 Documentation/tests/index.rst          |    6 +
 Documentation/tests/kunit.rst          |    5 +
 drivers/gpu/drm/tests/drm_buddy_test.c |   12 +
 7 files changed, 1421 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/sphinx/test_kdoc.py
 create mode 100644 Documentation/sphinx/test_list.py
 create mode 100644 Documentation/tests/index.rst
 create mode 100644 Documentation/tests/kunit.rst

-- 
2.40.1


