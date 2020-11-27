Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001852C6CA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3D76F3F5;
	Fri, 27 Nov 2020 20:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147536EE8F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:41:47 +0000 (UTC)
IronPort-SDR: d7H7fanc8tefBud8imBeYOBbKHUlmcCYLXXO+tahzG1NJqEPKiwo9eE9HVu2aIDDAzP+0v6pvE
 zLdpF4dtZ1XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172587560"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="172587560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 12:41:46 -0800
IronPort-SDR: /V91eRKIuTLAILy1tUImAe6XFWHC6tY0UphkIqab9WXNkcn2317Iac+4cJHi0wLd5X7NlUr/y4
 49BkUeAe9xhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="537737692"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2020 12:41:45 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 5/6] tests: Add tests for dma-buf based memory
 regions
Date: Fri, 27 Nov 2020 12:55:42 -0800
Message-Id: <1606510543-45567-6-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
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

Define a set of unit tests similar to regular MR tests and a set of
tests for send/recv and rdma traffic using dma-buf MRs. Add a utility
function to generate access flags for dma-buf based MRs because the
set of supported flags is smaller.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 tests/test_mr.py | 239 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 tests/utils.py   |  26 ++++++
 2 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/tests/test_mr.py b/tests/test_mr.py
index adc649c..52cf20a 100644
--- a/tests/test_mr.py
+++ b/tests/test_mr.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved. See COPYING file
+# Copyright (c) 2020 Intel Corporation. All rights reserved. See COPYING file
 """
 Test module for pyverbs' mr module.
 """
@@ -9,9 +10,10 @@ import errno
 
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
@@ -366,3 +368,238 @@ class DMMRTest(PyverbsAPITestCase):
                         dm_mr = DMMR(pd, dm_mr_len, e.IBV_ACCESS_ZERO_BASED,
                                      dm=dm, offset=dm_mr_offset)
                         dm_mr.close()
+
+
+def check_dmabuf_support():
+    """
+    Check if dma-buf allocation is supported by the system.
+    Skip the test on failure.
+    """
+    try:
+        DmaBuf(1)
+    except PyverbsRDMAError as ex:
+        if ex.error_code == errno.ENOENT:
+            raise unittest.SkipTest('Device /dev/dri/renderD* is not present')
+        if ex.error_code == errno.EACCES:
+            raise unittest.SkipTest('Lack of permission to access /dev/dri/renderD*')
+
+
+def check_dmabuf_mr_support(pd):
+    """
+    Check if dma-buf MR registration is supported by the driver.
+    Skip the test on failure
+    """
+    try:
+        DmaBufMR(pd, 1, 0)
+    except PyverbsRDMAError as ex:
+        if ex.error_code == errno.EOPNOTSUPP:
+            raise unittest.SkipTest('Reg dma-buf MR is not supported')
+
+
+class DmaBufMRTest(PyverbsAPITestCase):
+    """
+    Test various functionalities of the DmaBufMR class.
+    """
+    def test_dmabuf_reg_mr(self):
+        """
+        Test ibv_reg_dmabuf_mr()
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off) as mr:
+                            pass
+
+    def test_dmabuf_dereg_mr(self):
+        """
+        Test ibv_dereg_mr() with DmaBufMR
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off) as mr:
+                            mr.close()
+
+    def test_dmabuf_dereg_mr_twice(self):
+        """
+        Verify that explicit call to DmaBufMR's close() doesn't fail
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off) as mr:
+                            # Pyverbs supports multiple destruction of objects,
+                            # we are not expecting an exception here.
+                            mr.close()
+                            mr.close()
+
+    def test_dmabuf_reg_mr_bad_flags(self):
+        """
+        Verify that illegal flags combination fails as expected
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
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
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        for mr_off in [0, mr_len//2]:
+                            with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
+                                write_len = min(random.randint(1, MAX_IO_LEN),
+                                                mr_len)
+                                mr.write('a' * write_len, write_len)
+
+    def test_dmabuf_read(self):
+        """
+        Test reading from DmaBufMR's buffer
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        for mr_off in [0, mr_len//2]:
+                            with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
+                                write_len = min(random.randint(1, MAX_IO_LEN),
+                                                mr_len)
+                                write_str = 'a' * write_len
+                                mr.write(write_str, write_len)
+                                read_len = random.randint(1, write_len)
+                                offset = random.randint(0, write_len-read_len)
+                                read_str = mr.read(read_len, offset).decode()
+                                assert read_str in write_str
+
+    def test_dmabuf_lkey(self):
+        """
+        Test reading lkey property
+        """
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
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
+        check_dmabuf_support()
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd)
+                length = u.get_mr_length()
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    with DmaBufMR(pd, length, f) as mr:
+                        mr.rkey
+
+
+class DmaBufRC(RCResources):
+    def __init__(self, dev_name, ib_port, gid_index):
+        """
+        Initialize an DmaBufRC object.
+        :param dev_name: Device name to be used
+        :param ib_port: IB port of the device to use
+        :param gid_index: Which GID index to use
+        """
+        super(DmaBufRC, self).__init__(dev_name=dev_name, ib_port=ib_port,
+                                       gid_index=gid_index)
+
+    def create_mr(self):
+        check_dmabuf_support()
+        check_dmabuf_mr_support(self.pd)
+        access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
+        mr = DmaBufMR(self.pd, self.msg_size, access)
+        self.mr = mr
+
+    def create_qp_attr(self):
+        qp_attr = QPAttr(port_num=self.ib_port)
+        qp_access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
+        qp_attr.qp_access_flags = qp_access
+        return qp_attr
+
+
+class DmaBufTestCase(RDMATestCase):
+    def setUp(self):
+        super(DmaBufTestCase, self).setUp()
+        self.iters = 100
+
+    def create_players(self, resource, **resource_arg):
+        """
+        Init dma-buf tests resources.
+        :param resource: The RDMA resources to use. A class of type
+                         BaseResources.
+        :param resource_arg: Dict of args that specify the resource specific
+                             attributes.
+        :return: The (client, server) resources.
+        """
+        client = resource(**self.dev_info, **resource_arg)
+        server = resource(**self.dev_info, **resource_arg)
+        client.pre_run(server.psns, server.qps_num)
+        server.pre_run(client.psns, client.qps_num)
+        return client, server
+
+    def test_dmabuf_rc_traffic(self):
+        """
+        Test send/recv using dma-buf MR over RC
+        """
+        client, server = self.create_players(DmaBufRC)
+        u.traffic(client, server, self.iters, self.gid_index, self.ib_port)
+
+    def test_dmabuf_rdma_traffic(self):
+        """
+        Test rdma write using dma-buf MR
+        """
+        client, server = self.create_players(DmaBufRC)
+        server.rkey = client.mr.rkey
+        server.remote_addr = client.mr.offset
+        client.rkey = server.mr.rkey
+        client.remote_addr = server.mr.offset
+        u.rdma_traffic(client, server, self.iters, self.gid_index, self.ib_port,
+                       send_op=e.IBV_WR_RDMA_WRITE)
diff --git a/tests/utils.py b/tests/utils.py
index 7039f41..d3d5c16 100644
--- a/tests/utils.py
+++ b/tests/utils.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved.  See COPYING file
+# Copyright (c) 2020 Intel Corporation. All rights reserved. See COPYING file
 """
 Provide some useful helper function for pyverbs' tests.
 """
@@ -94,6 +95,31 @@ def get_access_flags(ctx):
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
