Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD0128566
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 00:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E923C6ECCE;
	Fri, 20 Dec 2019 23:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DF96ECCE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 23:14:00 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfd55980001>; Fri, 20 Dec 2019 15:13:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 15:14:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 15:14:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 23:13:58 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Leon Romanovsky <leon@kernel.org>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca>
 <f10b2a18-a109-d87d-f156-2e5941cbf4a0@nvidia.com>
 <20191220184821.GB10944@unreal>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <b70ac328-2dc0-efe3-05c2-3e040b662256@nvidia.com>
Date: Fri, 20 Dec 2019 15:13:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191220184821.GB10944@unreal>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576883609; bh=YyPKn1pTUo9maui0Cl8wPUC9pCaG4pozfEeSM/q2Xuw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=BbpbjMRADbiieG0wZwg7/MNcvb0htkXoIVaUqVfL2cVFSq6P/VSfqRlwCWpnneJfD
 xftzXoBcLiTWuqMXsQ7t6AWCT71WLO1xkGZrhrOn0tcyM5yAfm54j70C7fBwcgnofn
 b/9H8aCfEVq0LawCERbdcQV3VCGhVN60vVxhAFwFbbDtIhnnLa+AeJbbNjJrpU3Dje
 2yRq6wb9M/4s8MWJ9EJb7rqgBCMp3VCFwcIApBLsdFacXnYn6jAEGhJxMH7ZmKJPOr
 2JhGFatda38gjZx3YL2suxRK7cjyk0lHKZiEYew9WUnhSKJKmAtAm3lHA3ArKec7HY
 TMeZ1MUC9Bnkw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/19 10:48 AM, Leon Romanovsky wrote:
...
>> test_query_qp (tests.test_qp.QPTest) ... ok
>> test_rdmacm_sync_traffic (tests.test_rdmacm.CMTestCase) ... skipped 'No devices with net interface'
>>
>> ======================================================================
>> FAIL: test_query_port (tests.test_device.DeviceTest)
>> ----------------------------------------------------------------------
>> Traceback (most recent call last):
>>   File "/kernel_work/rdma-core/tests/test_device.py", line 129, in test_query_port
>>     self.verify_port_attr(port_attr)
>>   File "/kernel_work/rdma-core/tests/test_device.py", line 113, in verify_port_attr
>>     assert 'Invalid' not in d.speed_to_str(attr.active_speed)
>> AssertionError
> 
> I'm very curious how did you get this assert "d.speed_to_str" covers all
> known speeds according to the IBTA.
> 

Hi Leon,

Short answer: I can make that one pass, with a small fix the the rdma-core test
suite:

commit a1b9fb0846e1b2356d7a16f4fbdd1960cf8dcbe5 (HEAD -> fix_speed_to_str)
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Fri Dec 20 15:07:47 2019 -0800

    device: fix speed_to_str(), to handle disabled links
    
    For disabled links, the raw speed token is 0. However,
    speed_to_str() doesn't have that in the list. This leads
    to an assertion when running tests (test_query_port) when
    one link is down and other link(s) are up.
    
    Fix this by returning '(Disabled/down)' for the zero speed
    case.

diff --git a/pyverbs/device.pyx b/pyverbs/device.pyx
index 33d133fd..f8b7826b 100755
--- a/pyverbs/device.pyx
+++ b/pyverbs/device.pyx
@@ -923,8 +923,8 @@ def width_to_str(width):
 
 
 def speed_to_str(speed):
-    l = {1: '2.5 Gbps', 2: '5.0 Gbps', 4: '5.0 Gbps', 8: '10.0 Gbps',
-         16: '14.0 Gbps', 32: '25.0 Gbps', 64: '50.0 Gbps'}
+    l = {0: '(Disabled/down)', 1: '2.5 Gbps', 2: '5.0 Gbps', 4: '5.0 Gbps',
+         8: '10.0 Gbps', 16: '14.0 Gbps', 32: '25.0 Gbps', 64: '50.0 Gbps'}
     try:
         return '{s} ({n})'.format(s=l[speed], n=speed)
     except KeyError:


Longer answer:
==============

It looks like this test suite assumes that every link is connected! (Probably
in most test systems, they are.) But in my setup, the ConnectX cards each have
two slots, and I only have (and only need) one cable. So one link is up, and
the other is disabled. 

This leads to the other problem, which is that if a link is disabled, the
test suite finds a "0" token for attr.active_speed. That token is not in the
approved list, and so d.speed_to_str() asserts.

With some diagnostics added, I can see it checking each link: one passes, and
the other asserts:

diff --git a/tests/test_device.py b/tests/test_device.py
index 524e0e89..7b33d7db 100644
--- a/tests/test_device.py
+++ b/tests/test_device.py
@@ -110,6 +110,12 @@ class DeviceTest(unittest.TestCase):
         assert 'Invalid' not in d.translate_mtu(attr.max_mtu)
         assert 'Invalid' not in d.translate_mtu(attr.active_mtu)
         assert 'Invalid' not in d.width_to_str(attr.active_width)
+        print("")
+        print('Diagnostics ===========================================')
+        print('phys_state:    ', d.phys_state_to_str(attr.phys_state))
+        print('active_width): ', d.width_to_str(attr.active_width))
+        print('active_speed:  ',   d.speed_to_str(attr.active_speed))
+        print('END of Diagnostics ====================================')
         assert 'Invalid' not in d.speed_to_str(attr.active_speed)
         assert 'Invalid' not in d.translate_link_layer(attr.link_layer)
         assert attr.max_msg_sz > 0x1000

         assert attr.max_msg_sz > 0x1000

...and the test run from that is:

# ./build/bin/run_tests.py --verbose tests.test_device.DeviceTest
test_dev_list (tests.test_device.DeviceTest) ... ok
test_open_dev (tests.test_device.DeviceTest) ... ok
test_query_device (tests.test_device.DeviceTest) ... ok
test_query_device_ex (tests.test_device.DeviceTest) ... ok
test_query_gid (tests.test_device.DeviceTest) ... ok
test_query_port (tests.test_device.DeviceTest) ... 
Diagnostics ===========================================
phys_state:     Link up (5)
active_width):  4X (2)
active_speed:   25.0 Gbps (32)
END of Diagnostics ====================================

Diagnostics ===========================================
phys_state:     Disabled (3)
active_width):  4X (2)
active_speed:   Invalid speed
END of Diagnostics ====================================
FAIL
test_query_port_bad_flow (tests.test_device.DeviceTest) ... ok

======================================================================
FAIL: test_query_port (tests.test_device.DeviceTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/kernel_work/rdma-core/tests/test_device.py", line 135, in test_query_port
    self.verify_port_attr(port_attr)
  File "/kernel_work/rdma-core/tests/test_device.py", line 119, in verify_port_attr
    assert 'Invalid' not in d.speed_to_str(attr.active_speed)
AssertionError

----------------------------------------------------------------------
Ran 7 tests in 0.055s

FAILED (failures=1)



thanks,
-- 
John Hubbard
NVIDIA

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
