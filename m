Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAF309B2D
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 09:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5AC6E095;
	Sun, 31 Jan 2021 08:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Sun, 31 Jan 2021 08:49:48 UTC
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589BC6E095
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 08:49:48 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60166dff0001>; Sun, 31 Jan 2021 00:44:47 -0800
Received: from [10.2.50.90] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 31 Jan
 2021 08:44:40 +0000
Subject: Re: [PATCH rdma-core v7 5/6] tests: Add tests for dma-buf based
 memory regions
To: Jianxin Xiong <jianxin.xiong@intel.com>, <linux-rdma@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-6-git-send-email-jianxin.xiong@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b147c3ca-5754-f317-9f3b-5fbd42eaf4c0@nvidia.com>
Date: Sun, 31 Jan 2021 00:44:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <1611604622-86968-6-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612082687; bh=oj3YCe8M1DH9eZT2qTwLLd29vY3WVVNKOYm3laAu++g=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=f2uUIX8s2xTAfq05101SnY2FKQSvUvU5pQNEFmZoMH+DHBWPMYYV94k/isQmrYYLT
 j/zWNjerBTBpi14zyafjHRQLn5MXegMGBT3uSgESEFN+kcU65sZfBa/czdGJnm7X/E
 pDcqGJ2YkijTx4QO9mbZaxF+y2XDT4ofkQbYovvzALVazO5uegNiVBr6HIMtEgE5Na
 TFQgOf/k06gVGmXZ7ukbt4Gh+E2sGRS1+SxQBzgWEp3RyU6Q0Zl//cMI8rXMA7rDQ0
 +h8mHGDO6WiFzwpudrw0wUP3kNtb80p6aRX7QCA0WVFNAtc5SZnPNJUHYNyLdmIH0+
 yaKNIIvXf6CoA==
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/21 11:57 AM, Jianxin Xiong wrote:
> Define a set of unit tests similar to regular MR tests and a set of
> tests for send/recv and rdma traffic using dma-buf MRs. Add a utility
> function to generate access flags for dma-buf based MRs because the
> set of supported flags is smaller.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>

Hi Jianxin,

It's awesome to see a GPU to IB test suite here!

> ---
>   tests/args_parser.py |   4 +
>   tests/test_mr.py     | 266 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   tests/utils.py       |  26 +++++
>   3 files changed, 295 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/args_parser.py b/tests/args_parser.py
> index 446535a..5bc53b0 100644
> --- a/tests/args_parser.py
> +++ b/tests/args_parser.py
> @@ -19,6 +19,10 @@ class ArgsParser(object):
>           parser.add_argument('--port',
>                               help='Use port <port> of RDMA device', type=int,
>                               default=1)
> +        parser.add_argument('--gpu', nargs='?', type=int, const=0, default=0,
> +                            help='GPU unit to allocate dmabuf from')
> +        parser.add_argument('--gtt', action='store_true', default=False,
> +                            help='Allocate dmabuf from GTT instead of VRAM')

Just to be kind to non-GPU people, how about:

	s/GTT/GTT (Graphics Translation Table)/


>           parser.add_argument('-v', '--verbose', dest='verbosity',
>                               action='store_const',
>                               const=2, help='Verbose output')
> diff --git a/tests/test_mr.py b/tests/test_mr.py
> index b88ad23..03a645f 100644
> --- a/tests/test_mr.py
> +++ b/tests/test_mr.py
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
>   # Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved. See COPYING file
> +# Copyright (c) 2020 Intel Corporation. All rights reserved. See COPYING file
>   """
>   Test module for pyverbs' mr module.
>   """
> @@ -9,15 +10,18 @@ import errno
>   
>   from tests.base import PyverbsAPITestCase, RCResources, RDMATestCase
>   from pyverbs.pyverbs_error import PyverbsRDMAError, PyverbsError
> -from pyverbs.mr import MR, MW, DMMR, MWBindInfo, MWBind
> +from pyverbs.mr import MR, MW, DMMR, DmaBufMR, MWBindInfo, MWBind
>   from pyverbs.qp import QPCap, QPInitAttr, QPAttr, QP
>   from pyverbs.mem_alloc import posix_memalign, free
>   from pyverbs.wr import SendWR
> +from pyverbs.dmabuf import DmaBuf
>   import pyverbs.device as d
>   from pyverbs.pd import PD
>   import pyverbs.enums as e
>   import tests.utils as u
>   
> +MAX_IO_LEN = 1048576
> +
>   
>   class MRRes(RCResources):
>       def __init__(self, dev_name, ib_port, gid_index,
> @@ -423,3 +427,263 @@ class DMMRTest(PyverbsAPITestCase):
>                           dm_mr = DMMR(pd, dm_mr_len, e.IBV_ACCESS_ZERO_BASED,
>                                        dm=dm, offset=dm_mr_offset)
>                           dm_mr.close()
> +
> +
> +def check_dmabuf_support(unit=0):
> +    """
> +    Check if dma-buf allocation is supported by the system.
> +    Skip the test on failure.
> +    """
> +    device_num = 128 + unit
> +    try:
> +        DmaBuf(1, unit=unit)

unit?? This is a GPU, never anything else! Let's s/unit/gpu/ throughout, yes?

thanks,
-- 
John Hubbard
NVIDIA

> +    except PyverbsRDMAError as ex:
> +        if ex.error_code == errno.ENOENT:
> +            raise unittest.SkipTest(f'Device /dev/dri/renderD{device_num} is not present')
> +        if ex.error_code == errno.EACCES:
> +            raise unittest.SkipTest(f'Lack of permission to access /dev/dri/renderD{device_num}')
> +        if ex.error_code == errno.EOPNOTSUPP:
> +            raise unittest.SkipTest(f'Allocating dmabuf is not supported by /dev/dri/renderD{device_num}')
> +
> +
> +def check_dmabuf_mr_support(pd, unit=0):
> +    """
> +    Check if dma-buf MR registration is supported by the driver.
> +    Skip the test on failure
> +    """
> +    try:
> +        DmaBufMR(pd, 1, 0, unit=unit)
> +    except PyverbsRDMAError as ex:
> +        if ex.error_code == errno.EOPNOTSUPP:
> +            raise unittest.SkipTest('Reg dma-buf MR is not supported by the RDMA driver')
> +
> +
> +class DmaBufMRTest(PyverbsAPITestCase):
> +    """
> +    Test various functionalities of the DmaBufMR class.
> +    """
> +    def setUp(self):
> +        super().setUp()
> +        self.unit = self.config['gpu']
> +        self.gtt = self.config['gtt']
> +
> +    def test_dmabuf_reg_mr(self):
> +        """
> +        Test ibv_reg_dmabuf_mr()
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                flags = u.get_dmabuf_access_flags(ctx)
> +                for f in flags:
> +                    len = u.get_mr_length()
> +                    for off in [0, len//2]:
> +                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
> +                                      gtt=self.gtt) as mr:
> +                            pass
> +
> +    def test_dmabuf_dereg_mr(self):
> +        """
> +        Test ibv_dereg_mr() with DmaBufMR
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                flags = u.get_dmabuf_access_flags(ctx)
> +                for f in flags:
> +                    len = u.get_mr_length()
> +                    for off in [0, len//2]:
> +                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
> +                                      gtt=self.gtt) as mr:
> +                            mr.close()
> +
> +    def test_dmabuf_dereg_mr_twice(self):
> +        """
> +        Verify that explicit call to DmaBufMR's close() doesn't fail
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                flags = u.get_dmabuf_access_flags(ctx)
> +                for f in flags:
> +                    len = u.get_mr_length()
> +                    for off in [0, len//2]:
> +                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
> +                                      gtt=self.gtt) as mr:
> +                            # Pyverbs supports multiple destruction of objects,
> +                            # we are not expecting an exception here.
> +                            mr.close()
> +                            mr.close()
> +
> +    def test_dmabuf_reg_mr_bad_flags(self):
> +        """
> +        Verify that illegal flags combination fails as expected
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                for i in range(5):
> +                    flags = random.sample([e.IBV_ACCESS_REMOTE_WRITE,
> +                                           e.IBV_ACCESS_REMOTE_ATOMIC],
> +                                          random.randint(1, 2))
> +                    mr_flags = 0
> +                    for i in flags:
> +                        mr_flags += i.value
> +                    try:
> +                        DmaBufMR(pd, u.get_mr_length(), mr_flags,
> +                                 unit=self.unit, gtt=self.gtt)
> +                    except PyverbsRDMAError as err:
> +                        assert 'Failed to register a dma-buf MR' in err.args[0]
> +                    else:
> +                        raise PyverbsRDMAError('Registered a dma-buf MR with illegal falgs')
> +
> +    def test_dmabuf_write(self):
> +        """
> +        Test writing to DmaBufMR's buffer
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                for i in range(10):
> +                    mr_len = u.get_mr_length()
> +                    flags = u.get_dmabuf_access_flags(ctx)
> +                    for f in flags:
> +                        for mr_off in [0, mr_len//2]:
> +                            with DmaBufMR(pd, mr_len, f, offset=mr_off,
> +                                          unit=self.unit, gtt=self.gtt) as mr:
> +                                write_len = min(random.randint(1, MAX_IO_LEN),
> +                                                mr_len)
> +                                mr.write('a' * write_len, write_len)
> +
> +    def test_dmabuf_read(self):
> +        """
> +        Test reading from DmaBufMR's buffer
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                for i in range(10):
> +                    mr_len = u.get_mr_length()
> +                    flags = u.get_dmabuf_access_flags(ctx)
> +                    for f in flags:
> +                        for mr_off in [0, mr_len//2]:
> +                            with DmaBufMR(pd, mr_len, f, offset=mr_off,
> +                                          unit=self.unit, gtt=self.gtt) as mr:
> +                                write_len = min(random.randint(1, MAX_IO_LEN),
> +                                                mr_len)
> +                                write_str = 'a' * write_len
> +                                mr.write(write_str, write_len)
> +                                read_len = random.randint(1, write_len)
> +                                offset = random.randint(0, write_len-read_len)
> +                                read_str = mr.read(read_len, offset).decode()
> +                                assert read_str in write_str
> +
> +    def test_dmabuf_lkey(self):
> +        """
> +        Test reading lkey property
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                length = u.get_mr_length()
> +                flags = u.get_dmabuf_access_flags(ctx)
> +                for f in flags:
> +                    with DmaBufMR(pd, length, f, unit=self.unit,
> +                                  gtt=self.gtt) as mr:
> +                        mr.lkey
> +
> +    def test_dmabuf_rkey(self):
> +        """
> +        Test reading rkey property
> +        """
> +        check_dmabuf_support(self.unit)
> +        for ctx, attr, attr_ex in self.devices:
> +            with PD(ctx) as pd:
> +                check_dmabuf_mr_support(pd, self.unit)
> +                length = u.get_mr_length()
> +                flags = u.get_dmabuf_access_flags(ctx)
> +                for f in flags:
> +                    with DmaBufMR(pd, length, f, unit=self.unit,
> +                                  gtt=self.gtt) as mr:
> +                        mr.rkey
> +
> +
> +class DmaBufRC(RCResources):
> +    def __init__(self, dev_name, ib_port, gid_index, unit, gtt):
> +        """
> +        Initialize an DmaBufRC object.
> +        :param dev_name: Device name to be used
> +        :param ib_port: IB port of the device to use
> +        :param gid_index: Which GID index to use
> +        :param unit: GPU unit to allocate dmabuf from
> +        :gtt: Allocate dmabuf from GTT instead og VRAM
> +        """
> +        self.unit = unit
> +        self.gtt = gtt
> +        super(DmaBufRC, self).__init__(dev_name=dev_name, ib_port=ib_port,
> +                                       gid_index=gid_index)
> +
> +    def create_mr(self):
> +        check_dmabuf_support(self.unit)
> +        check_dmabuf_mr_support(self.pd, self.unit)
> +        access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
> +        mr = DmaBufMR(self.pd, self.msg_size, access, unit=self.unit,
> +                      gtt=self.gtt)
> +        self.mr = mr
> +
> +    def create_qp_attr(self):
> +        qp_attr = QPAttr(port_num=self.ib_port)
> +        qp_access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
> +        qp_attr.qp_access_flags = qp_access
> +        return qp_attr
> +
> +
> +class DmaBufTestCase(RDMATestCase):
> +    def setUp(self):
> +        super(DmaBufTestCase, self).setUp()
> +        self.iters = 100
> +        self.unit = self.config['gpu']
> +        self.gtt = self.config['gtt']
> +
> +    def create_players(self, resource, **resource_arg):
> +        """
> +        Init dma-buf tests resources.
> +        :param resource: The RDMA resources to use. A class of type
> +                         BaseResources.
> +        :param resource_arg: Dict of args that specify the resource specific
> +                             attributes.
> +        :return: The (client, server) resources.
> +        """
> +        client = resource(**self.dev_info, **resource_arg)
> +        server = resource(**self.dev_info, **resource_arg)
> +        client.pre_run(server.psns, server.qps_num)
> +        server.pre_run(client.psns, client.qps_num)
> +        return client, server
> +
> +    def test_dmabuf_rc_traffic(self):
> +        """
> +        Test send/recv using dma-buf MR over RC
> +        """
> +        client, server = self.create_players(DmaBufRC, unit=self.unit,
> +                                             gtt=self.gtt)
> +        u.traffic(client, server, self.iters, self.gid_index, self.ib_port)
> +
> +    def test_dmabuf_rdma_traffic(self):
> +        """
> +        Test rdma write using dma-buf MR
> +        """
> +        client, server = self.create_players(DmaBufRC, unit=self.unit,
> +                                             gtt=self.gtt)
> +        server.rkey = client.mr.rkey
> +        server.remote_addr = client.mr.offset
> +        client.rkey = server.mr.rkey
> +        client.remote_addr = server.mr.offset
> +        u.rdma_traffic(client, server, self.iters, self.gid_index, self.ib_port,
> +                       send_op=e.IBV_WR_RDMA_WRITE)
> diff --git a/tests/utils.py b/tests/utils.py
> index e2ab669..8546329 100644
> --- a/tests/utils.py
> +++ b/tests/utils.py
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
>   # Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved.  See COPYING file
> +# Copyright (c) 2020 Intel Corporation. All rights reserved. See COPYING file
>   """
>   Provide some useful helper function for pyverbs' tests.
>   """
> @@ -96,6 +97,31 @@ def get_access_flags(ctx):
>       return arr
>   
>   
> +def get_dmabuf_access_flags(ctx):
> +    """
> +    Similar to get_access_flags, except that dma-buf MR only support
> +    a subset of the flags.
> +    :param ctx: Device Context to check capabilities
> +    :return: A random legal value for MR flags
> +    """
> +    attr = ctx.query_device()
> +    vals = [e.IBV_ACCESS_LOCAL_WRITE, e.IBV_ACCESS_REMOTE_WRITE,
> +            e.IBV_ACCESS_REMOTE_READ, e.IBV_ACCESS_REMOTE_ATOMIC,
> +            e.IBV_ACCESS_RELAXED_ORDERING]
> +    if not attr.atomic_caps & e.IBV_ATOMIC_HCA:
> +        vals.remove(e.IBV_ACCESS_REMOTE_ATOMIC)
> +    arr = []
> +    for i in range(1, len(vals)):
> +        tmp = list(com(vals, i))
> +        tmp = filter(filter_illegal_access_flags, tmp)
> +        for t in tmp:  # Iterate legal combinations and bitwise OR them
> +            val = 0
> +            for flag in t:
> +                val += flag.value
> +            arr.append(val)
> +    return arr
> +
> +
>   def get_dm_attrs(dm_len):
>       """
>       Initializes an AllocDmAttr member with the given length and random
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
