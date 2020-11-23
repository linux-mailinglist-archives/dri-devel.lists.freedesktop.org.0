Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098032C1215
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 18:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FA96E06B;
	Mon, 23 Nov 2020 17:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ACF6E083
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:39:11 +0000 (UTC)
IronPort-SDR: DkGR7k22GBso8xI/Hj7DpCc/rDZyW3BxsojnIPTlIM0oDMuyhE4XEgT5+dloB3SOpsyRujW7/6
 sPVxOgfLQxQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233421244"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="233421244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:39:10 -0800
IronPort-SDR: glbKYsYF/s4/8XJkW7gu3ZfUKhZDWV0rCHbLSxwq8/+giGmEeseqmjIcnENUdheNVW6vyYmGmv
 6+9Imk/FTg6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="361525799"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2020 09:39:09 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 4/5] tests: Add tests for dma-buf based memory
 regions
Date: Mon, 23 Nov 2020 09:53:03 -0800
Message-Id: <1606153984-104583-5-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a full set of tests similar to regular MR tests. Add a utility
function to generate access flags for dma-buf based MRs because the
set of supported flags is smaller.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 tests/test_mr.py | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 tests/utils.py   |  25 +++++++++++
 2 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/tests/test_mr.py b/tests/test_mr.py
index adc649c..8d7f002 100644
--- a/tests/test_mr.py
+++ b/tests/test_mr.py
@@ -9,9 +9,10 @@ import errno
 
 from tests.base import PyverbsAPITestCase, RCResources, RDMATestCase
 from pyverbs.pyverbs_error import PyverbsRDMAError, PyverbsError
-from pyverbs.mr import MR, MW, DMMR, MWBindInfo, MWBind
+from pyverbs.mr import MR, MW, DMMR, DmaBufMR, MWBindInfo, MWBind
 from pyverbs.qp import QPCap, QPInitAttr, QPAttr, QP
 from pyverbs.wr import SendWR
+from pyverbs.dmabuf import DmaBuf
 import pyverbs.device as d
 from pyverbs.pd import PD
 import pyverbs.enums as e
@@ -366,3 +367,130 @@ class DMMRTest(PyverbsAPITestCase):
                         dm_mr = DMMR(pd, dm_mr_len, e.IBV_ACCESS_ZERO_BASED,
                                      dm=dm, offset=dm_mr_offset)
                         dm_mr.close()
+
+class DmaBufMRTest(PyverbsAPITestCase):
+    """
+    Test various functionalities of the DmaBufMR class.
+    """
+    def test_dmabuf_reg_mr(self):
+        """
+        Test ibv_reg_dmabuf_mr()
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    off = random.randint(0, len//2)
+                    with DmaBufMR(pd, len, f, offset=off) as mr:
+                        pass
+
+    def test_dmabuf_dereg_mr(self):
+        """
+        Test ibv_dereg_mr() with DmaBufMR
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    off = random.randint(0, len//2)
+                    with DmaBufMR(pd, len, f, offset=off) as mr:
+                        mr.close()
+
+    def test_dmabuf_dereg_mr_twice(self):
+        """
+        Verify that explicit call to DmaBufMR's close() doesn't fail
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    off = random.randint(0, len//2)
+                    with DmaBufMR(pd, len, f, offset=off) as mr:
+                        # Pyverbs supports multiple destruction of objects,
+                        # we are not expecting an exception here.
+                        mr.close()
+                        mr.close()
+
+    def test_dmabuf_reg_mr_bad_flags(self):
+        """
+        Verify that illegal flags combination fails as expected
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                for i in range(5):
+                    flags = random.sample([e.IBV_ACCESS_REMOTE_WRITE,
+                                           e.IBV_ACCESS_REMOTE_ATOMIC],
+                                          random.randint(1, 2))
+                    mr_flags = 0
+                    for i in flags:
+                        mr_flags += i.value
+                    try:
+                        DmaBufMR(pd, u.get_mr_length(), mr_flags)
+                    except PyverbsRDMAError as err:
+                        assert 'Failed to register a dma-buf MR' in err.args[0]
+                    else:
+                        raise PyverbsRDMAError('Registered a dma-buf MR with illegal falgs')
+
+    def test_dmabuf_write(self):
+        """
+        Test writing to DmaBufMR's buffer
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    mr_off = random.randint(0, mr_len//2)
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
+                            write_len = min(random.randint(1, MAX_IO_LEN),
+                                            mr_len)
+                            mr.write('a' * write_len, write_len)
+
+    def test_dmabuf_read(self):
+        """
+        Test reading from DmaBufMR's buffer
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    mr_off = random.randint(0, mr_len//2)
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
+                            write_len = min(random.randint(1, MAX_IO_LEN),
+                                            mr_len)
+                            write_str = 'a' * write_len
+                            mr.write(write_str, write_len)
+                            read_len = random.randint(1, write_len)
+                            offset = random.randint(0, write_len-read_len)
+                            read_str = mr.read(read_len, offset).decode()
+                            assert read_str in write_str
+
+    def test_dmabuf_lkey(self):
+        """
+        Test reading lkey property
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                length = u.get_mr_length()
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    with DmaBufMR(pd, length, f) as mr:
+                        mr.lkey
+
+    def test_dmabuf_rkey(self):
+        """
+        Test reading rkey property
+        """
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                length = u.get_mr_length()
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    with DmaBufMR(pd, length, f) as mr:
+                        mr.rkey
diff --git a/tests/utils.py b/tests/utils.py
index 7039f41..0ad7110 100644
--- a/tests/utils.py
+++ b/tests/utils.py
@@ -94,6 +94,31 @@ def get_access_flags(ctx):
     return arr
 
 
+def get_dmabuf_access_flags(ctx):
+    """
+    Similar to get_access_flags, except that dma-buf MR only support
+    a subset of the flags.
+    :param ctx: Device Context to check capabilities
+    :return: A random legal value for MR flags
+    """
+    attr = ctx.query_device()
+    vals = [e.IBV_ACCESS_LOCAL_WRITE, e.IBV_ACCESS_REMOTE_WRITE,
+            e.IBV_ACCESS_REMOTE_READ, e.IBV_ACCESS_REMOTE_ATOMIC,
+            e.IBV_ACCESS_RELAXED_ORDERING]
+    if not attr.atomic_caps & e.IBV_ATOMIC_HCA:
+        vals.remove(e.IBV_ACCESS_REMOTE_ATOMIC)
+    arr = []
+    for i in range(1, len(vals)):
+        tmp = list(com(vals, i))
+        tmp = filter(filter_illegal_access_flags, tmp)
+        for t in tmp:  # Iterate legal combinations and bitwise OR them
+            val = 0
+            for flag in t:
+                val += flag.value
+            arr.append(val)
+    return arr
+
+
 def get_dm_attrs(dm_len):
     """
     Initializes an AllocDmAttr member with the given length and random
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
