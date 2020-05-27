Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E41E452F
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19AB899DC;
	Wed, 27 May 2020 14:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51804899DC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:05:47 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MLiXQ-1jMHJG1tIG-00HfcC; Wed, 27 May 2020 16:05:34 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/3] drm/i915: work around false-positive maybe-uninitialized
 warning
Date: Wed, 27 May 2020 16:05:09 +0200
Message-Id: <20200527140526.1458215-2-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527140526.1458215-1-arnd@arndb.de>
References: <20200527140526.1458215-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XhGV89xHEat1ahk9vDcOini1cTFmNy3hR/+IomNkF0dDIF4zpZG
 mVIweZpVkM1y3GUbDfSqkcJna53e8KALJOgJZmp7Twzav4yEeJLd9a6aGl9MuGJqv39Lm+1
 UtuYJ1CEH/1ruBsaqZOgZiXbw7k0vnL6MV+C46oN8FSuiZglkpaYnFEdXhsjxXy83Lxm7fj
 j/oHTDzvKdfuKAtc5lVow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6q9GEMSIHfE=:SltPygotEWIkp2d4ogF7Xh
 /11yqp6Cat0DU8un95gA2KmZtYE9HHXVtHZWdKUFy8jKARI09BnD2IaSlg+gSu+qXXjECpw8O
 Nmssz5cvCcpTfBEv7Pg/cq/E9/ovouVQKX2MWMwY5ErZZRWmfc20gWK1T89hu+THfWJqGzOe6
 CzA7LNT3yMZcHdJggP/7tfUkYqXAD1CSFsNyVug8P2XohAYxcgOIVSUFAPWO5jlaT4CViV8j/
 3+JnU9ZXvcj3AVo284Hl+LeQFkDHLgK3oyxmlqn2WekqfQwm98VFnDVy7+BMKPvN7mabLSObM
 O5L7RvJkLuJQ/jqervAFpQIQadbT5KmsAg/eozGNXzwF6b5TQbmSUqacFl1xkTDtbHGtRRxmD
 9OlJxUwEUprL7JYG+SPKYYtESmYyJBpl2gwRGZbrEsK+sglA3RT5UBg7JjcTLSFJoQ1keu5fd
 bmkQgC54zI0YVmzI2wTKO/WhGLYvD/sgEe0FchAyRtG5TmxCwg1750u88DoGWLJt+d4IlGvXI
 4Mc5eM6xRxA7FWg/7nKQHN91Y60RdBMuBEJL4Fn4pLRc7e87OE2gcRg49T1zA7hGhfoAWNNne
 IHZs7ga+SUKRamSlNHYzv3X+PwqrpO95LlHdYUZdGZoRYsLjygLNFSwZ8awuZ/wjRWasrPX22
 XntKSboFHKLVVtGycIjfMi6oiWKOUr/u+gNXpcCHIGIJbg+KkSg08qHassdnEP5BWJeFPfR/i
 0TJrW0I6oAV8Rg1e4jyE26Q+iP61WXH4YquhmXgh0hIyx5YpSDYXTZQyVgs5DgqZjuZC0Fl5o
 7OoEUiu1SKQ7zRG7QhhQL0dEeqyQ6EKyJ++8ntVMyzszopcOLc=
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 "Robert M. Fosha" <robert.m.fosha@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc-9 gets confused by the code flow in check_dirty_whitelist:

drivers/gpu/drm/i915/gt/selftest_workarounds.c: In function 'check_dirty_whitelist':
drivers/gpu/drm/i915/gt/selftest_workarounds.c:492:17: error: 'rsvd' may be used uninitialized in this function [-Werror=maybe-uninitialized]

I could not figure out a good way to do this in a way that gcc
understands better, so initialize the variable to zero, as last
resort.

Fixes: aee20aaed887 ("drm/i915: Implement read-only support in whitelist selftest")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/gt/selftest_workarounds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 5ed323254ee1..32785463ec9e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -623,6 +623,8 @@ static int check_dirty_whitelist(struct intel_context *ce)
 				err = -EINVAL;
 				goto out_unpin;
 			}
+		} else {
+			rsvd = 0;
 		}
 
 		expect = results[0];
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
