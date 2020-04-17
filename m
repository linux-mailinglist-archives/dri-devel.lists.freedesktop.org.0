Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B71AD436
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 03:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D176E0C6;
	Fri, 17 Apr 2020 01:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F59D6E02F;
 Fri, 17 Apr 2020 01:39:37 +0000 (UTC)
IronPort-SDR: ht5CkTrPb9diqKI76mkvogBjpYRjVxvI+xbrWYk5PLXI8lqqSVW7Di2nxRqEQqBrejV2SYlx2b
 JWOOMcxLLoNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 18:39:36 -0700
IronPort-SDR: XHgJfoJB9xJ/bDfTI/0tU9Kn9/lMzSpo4lRB+eMk8DVkRMq8PMOOrBs3jL2RnLW1Yz3JdUGqkq
 t+AVCB2KWbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="257424632"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 16 Apr 2020 18:39:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jPFyg-000FHr-DI; Fri, 17 Apr 2020 09:39:34 +0800
Date: Fri, 17 Apr 2020 09:38:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-intel:topic/core-for-CI 2/20] kernel/locking/lockdep.c:2744:49:
 sparse: sparse: cast truncates bits from constant value (a0000
 becomes 0)
Message-ID: <202004170938.8GXieSzC%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   d0435a9b45070b945578c093dcd363b6b73a502c
commit: cbc1ad45be43de36150fd98dae644fc89a69a5a0 [2/20] lockdep: Up MAX_LOCKDEP_CHAINS
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout cbc1ad45be43de36150fd98dae644fc89a69a5a0
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/locking/lockdep.c:2744:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
>> kernel/locking/lockdep.c:2744:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)

vim +2744 kernel/locking/lockdep.c

810507fe6fd5ff Waiman Long 2020-02-06  2736  
810507fe6fd5ff Waiman Long 2020-02-06  2737  static inline void init_chain_block(int offset, int next, int bucket, int size)
810507fe6fd5ff Waiman Long 2020-02-06  2738  {
810507fe6fd5ff Waiman Long 2020-02-06  2739  	chain_hlocks[offset] = (next >> 16) | CHAIN_BLK_FLAG;
810507fe6fd5ff Waiman Long 2020-02-06  2740  	chain_hlocks[offset + 1] = (u16)next;
810507fe6fd5ff Waiman Long 2020-02-06  2741  
810507fe6fd5ff Waiman Long 2020-02-06  2742  	if (size && !bucket) {
810507fe6fd5ff Waiman Long 2020-02-06  2743  		chain_hlocks[offset + 2] = size >> 16;
810507fe6fd5ff Waiman Long 2020-02-06 @2744  		chain_hlocks[offset + 3] = (u16)size;
810507fe6fd5ff Waiman Long 2020-02-06  2745  	}
810507fe6fd5ff Waiman Long 2020-02-06  2746  }
810507fe6fd5ff Waiman Long 2020-02-06  2747  

:::::: The code at line 2744 was first introduced by commit
:::::: 810507fe6fd5ff3de429121adff49523fabb643a locking/lockdep: Reuse freed chain_hlocks entries

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
