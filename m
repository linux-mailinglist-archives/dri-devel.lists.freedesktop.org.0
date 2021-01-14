Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0912F6D03
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 22:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39A86E150;
	Thu, 14 Jan 2021 21:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAF56E150
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 21:20:26 +0000 (UTC)
IronPort-SDR: Vs4G67+LYQ8Ryb3LQSQ1kcQ+RfXpRWi7m5M2C1JnM+NNxxQTD9KWUY1MSv3XfC67fGGh9axNP3
 OHodRXCb+lHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="263238071"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="263238071"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 13:20:25 -0800
IronPort-SDR: mT54iL+CQLkC9muGZZQxyW+zSGKyssjxizZPd7hBt5GH3txCHEeSjAk+kx0AHQdtBtytFuddvX
 6edT4J5we96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="499717154"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga004.jf.intel.com with ESMTP; 14 Jan 2021 13:20:25 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v5 5/6] tests: Add tests for dma-buf based memory
 regions
Date: Thu, 14 Jan 2021 13:35:35 -0800
Message-Id: <1610660136-126627-6-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610660136-126627-1-git-send-email-jianxin.xiong@intel.com>
References: <1610660136-126627-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 tests/args_parser.py |   4 +
 tests/test_mr.py     | 264 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 tests/utils.py       |  26 +++++
 3 files changed, 293 insertions(+), 1 deletion(-)

diff --git a/tests/args_parser.py b/tests/args_parser.py
index 71a0f34..4e12d52 100644
--- a/tests/args_parser.py
+++ b/tests/args_parser.py
@@ -16,6 +16,10 @@ class ArgsParser(object):
         parser = argparse.ArgumentParser()
         parser.add_argument('--dev',
                             help='RDMA device to run the tests on')
+        parser.add_argument('--gpu', nargs='?', type=int, const=0, default=0,
+                            help='GPU unit to allocate dmabuf from')
+        parser.add_argument('--gtt', action='store_true', default=False,
+                            help='Allocate dmabuf from GTT instead of VRAM')
         parser.add_argument('-v', '--verbose', dest='verbosity',
                             action='store_const',
                             const=2, help='Verbose output')
diff --git a/tests/test_mr.py b/tests/test_mr.py
index adc649c..6915853 100644
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
@@ -366,3 +368,263 @@ class DMMRTest(PyverbsAPITestCase):
                         dm_mr = DMMR(pd, dm_mr_len, e.IBV_ACCESS_ZERO_BASED,
                                      dm=dm, offset=dm_mr_offset)
                         dm_mr.close()
+
+
+def check_dmabuf_support(unit=0):
+    """
+    Check if dma-buf allocation is supported by the system.
+    Skip the test on failure.
+    """
+    device_num = 128 + unit
+    try:
+        DmaBuf(1, unit=unit)
+    except PyverbsRDMAError as ex:
+        if ex.error_code == errno.ENOENT:
+            raise unittest.SkipTest(f'Device /dev/dri/renderD{device_num} is not present')
+        if ex.error_code == errno.EACCES:
+            raise unittest.SkipTest(f'Lack of permission to access /dev/dri/renderD{device_num}')
+        if ex.error_code == errno.EOPNOTSUPP:
+            raise unittest.SkipTest(f'Allocating dmabuf is not supported by /dev/dri/renderD{device_num}')
+
+
+def check_dmabuf_mr_support(pd, unit=0):
+    """
+    Check if dma-buf MR registration is supported by the driver.
+    Skip the test on failure
+    """
+    try:
+        DmaBufMR(pd, 1, 0, unit=unit)
+    except PyverbsRDMAError as ex:
+        if ex.error_code == errno.EOPNOTSUPP:
+            raise unittest.SkipTest('Reg dma-buf MR is not supported by the RDMA driver')
+
+
+class DmaBufMRTest(PyverbsAPITestCase):
+    """
+    Test various functionalities of the DmaBufMR class.
+    """
+    def setUp(self):
+        super().setUp()
+        self.unit = self.config['gpu']
+        self.gtt = self.config['gtt']
+
+    def test_dmabuf_reg_mr(self):
+        """
+        Test ibv_reg_dmabuf_mr()
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                                      gtt=self.gtt) as mr:
+                            pass
+
+    def test_dmabuf_dereg_mr(self):
+        """
+        Test ibv_dereg_mr() with DmaBufMR
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                                      gtt=self.gtt) as mr:
+                            mr.close()
+
+    def test_dmabuf_dereg_mr_twice(self):
+        """
+        Verify that explicit call to DmaBufMR's close() doesn't fail
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    len = u.get_mr_length()
+                    for off in [0, len//2]:
+                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                                      gtt=self.gtt) as mr:
+                            # Pyverbs supports multiple destruction of objects,
+                            # we are not expecting an exception here.
+                            mr.close()
+                            mr.close()
+
+    def test_dmabuf_reg_mr_bad_flags(self):
+        """
+        Verify that illegal flags combination fails as expected
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                for i in range(5):
+                    flags = random.sample([e.IBV_ACCESS_REMOTE_WRITE,
+                                           e.IBV_ACCESS_REMOTE_ATOMIC],
+                                          random.randint(1, 2))
+                    mr_flags = 0
+                    for i in flags:
+                        mr_flags += i.value
+                    try:
+                        DmaBufMR(pd, u.get_mr_length(), mr_flags,
+                                 unit=self.unit, gtt=self.gtt)
+                    except PyverbsRDMAError as err:
+                        assert 'Failed to register a dma-buf MR' in err.args[0]
+                    else:
+                        raise PyverbsRDMAError('Registered a dma-buf MR with illegal falgs')
+
+    def test_dmabuf_write(self):
+        """
+        Test writing to DmaBufMR's buffer
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        for mr_off in [0, mr_len//2]:
+                            with DmaBufMR(pd, mr_len, f, offset=mr_off,
+                                          unit=self.unit, gtt=self.gtt) as mr:
+                                write_len = min(random.randint(1, MAX_IO_LEN),
+                                                mr_len)
+                                mr.write('a' * write_len, write_len)
+
+    def test_dmabuf_read(self):
+        """
+        Test reading from DmaBufMR's buffer
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                for i in range(10):
+                    mr_len = u.get_mr_length()
+                    flags = u.get_dmabuf_access_flags(ctx)
+                    for f in flags:
+                        for mr_off in [0, mr_len//2]:
+                            with DmaBufMR(pd, mr_len, f, offset=mr_off,
+                                          unit=self.unit, gtt=self.gtt) as mr:
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
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                length = u.get_mr_length()
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    with DmaBufMR(pd, length, f, unit=self.unit,
+                                  gtt=self.gtt) as mr:
+                        mr.lkey
+
+    def test_dmabuf_rkey(self):
+        """
+        Test reading rkey property
+        """
+        check_dmabuf_support(self.unit)
+        for ctx, attr, attr_ex in self.devices:
+            with PD(ctx) as pd:
+                check_dmabuf_mr_support(pd, self.unit)
+                length = u.get_mr_length()
+                flags = u.get_dmabuf_access_flags(ctx)
+                for f in flags:
+                    with DmaBufMR(pd, length, f, unit=self.unit,
+                                  gtt=self.gtt) as mr:
+                        mr.rkey
+
+
+class DmaBufRC(RCResources):
+    def __init__(self, dev_name, ib_port, gid_index, unit, gtt):
+        """
+        Initialize an DmaBufRC object.
+        :param dev_name: Device name to be used
+        :param ib_port: IB port of the device to use
+        :param gid_index: Which GID index to use
+        :param unit: GPU unit to allocate dmabuf from
+        :gtt: Allocate dmabuf from GTT instead og VRAM
+        """
+        self.unit = unit
+        self.gtt = gtt
+        super(DmaBufRC, self).__init__(dev_name=dev_name, ib_port=ib_port,
+                                       gid_index=gid_index)
+
+    def create_mr(self):
+        check_dmabuf_support(self.unit)
+        check_dmabuf_mr_support(self.pd, self.unit)
+        access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
+        mr = DmaBufMR(self.pd, self.msg_size, access, unit=self.unit,
+                      gtt=self.gtt)
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
+        self.unit = self.config['gpu']
+        self.gtt = self.config['gtt']
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
+        client, server = self.create_players(DmaBufRC, unit=self.unit,
+                                             gtt=self.gtt)
+        u.traffic(client, server, self.iters, self.gid_index, self.ib_port)
+
+    def test_dmabuf_rdma_traffic(self):
+        """
+        Test rdma write using dma-buf MR
+        """
+        client, server = self.create_players(DmaBufRC, unit=self.unit,
+                                             gtt=self.gtt)
+        server.rkey = client.mr.rkey
+        server.remote_addr = client.mr.offset
+        client.rkey = server.mr.rkey
+        client.remote_addr = server.mr.offset
+        u.rdma_traffic(client, server, self.iters, self.gid_index, self.ib_port,
+                       send_op=e.IBV_WR_RDMA_WRITE)
diff --git a/tests/utils.py b/tests/utils.py
index e2ab669..8546329 100644
--- a/tests/utils.py
+++ b/tests/utils.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved.  See COPYING file
+# Copyright (c) 2020 Intel Corporation. All rights reserved. See COPYING file
 """
 Provide some useful helper function for pyverbs' tests.
 """
@@ -96,6 +97,31 @@ def get_access_flags(ctx):
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
