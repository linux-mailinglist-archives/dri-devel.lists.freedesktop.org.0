Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497E59E514
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8575D10FB80;
	Tue, 23 Aug 2022 14:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765710F393
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:24:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27NEN8gZ126479;
 Tue, 23 Aug 2022 09:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661264588;
 bh=w2M9k1z8HIg0p+jzhTKFDs39c75CRYokPJ6B9ZyfQvE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=D61qTElXYGmFOYkqueJdGuTqTgvNvuJEFznvq/CnYdw9kqxbBhKen0eV7ebLZuBho
 ggNMRr/iQR34353ALEMefr3f+ANG5z/3CFJFs9RF3IfbGwXhZX9mywAgKeYls7DVpz
 80C9tCDmmq2Twd8LVf6RwalYJix1s8HQJ73/SiRE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27NEN8pO005141
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Aug 2022 09:23:08 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 23
 Aug 2022 09:23:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 23 Aug 2022 09:23:08 -0500
Received: from [10.250.32.19] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27NEN7g1015523;
 Tue, 23 Aug 2022 09:23:07 -0500
Message-ID: <bf3dbf22-e41c-c15f-942c-834bbefbdc66@ti.com>
Date: Tue, 23 Aug 2022 09:23:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: cma_heap: Check for device max segment size when
 attaching
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark
 <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <20220822233025.3965-1-afd@ti.com>
 <202208230840.npLcmvVn-lkp@intel.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <202208230840.npLcmvVn-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/22 7:45 PM, kernel test robot wrote:
> Hi Andrew,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linus/master v6.0-rc2 next-20220822]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/dma-buf-cma_heap-Check-for-device-max-segment-size-when-attaching/20220823-073240
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220823/202208230840.npLcmvVn-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/f390cef50ba6681ea767283e413cb8e9f8f2b426
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Andrew-Davis/dma-buf-cma_heap-Check-for-device-max-segment-size-when-attaching/20220823-073240
>          git checkout f390cef50ba6681ea767283e413cb8e9f8f2b426
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/dma-buf/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_attach':
>>> drivers/dma-buf/heaps/cma_heap.c:61:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]


Hmm, thought someone removed this warning after we switched to C11, maybe it
is time again for some brave soul to re-poke that topic..

Not sure why I missed it when compiling though, will fix for v2.

Andrew


>        61 |         size_t max_segment = dma_get_max_seg_size(attachment->dev);
>           |         ^~~~~~
> 
> 
> vim +61 drivers/dma-buf/heaps/cma_heap.c
> 
>      49	
>      50	static int cma_heap_attach(struct dma_buf *dmabuf,
>      51				   struct dma_buf_attachment *attachment)
>      52	{
>      53		struct cma_heap_buffer *buffer = dmabuf->priv;
>      54		struct dma_heap_attachment *a;
>      55		int ret;
>      56	
>      57		a = kzalloc(sizeof(*a), GFP_KERNEL);
>      58		if (!a)
>      59			return -ENOMEM;
>      60	
>    > 61		size_t max_segment = dma_get_max_seg_size(attachment->dev);
>      62		ret = sg_alloc_table_from_pages_segment(&a->table, buffer->pages,
>      63							buffer->pagecount, 0,
>      64							buffer->pagecount << PAGE_SHIFT,
>      65							max_segment, GFP_KERNEL);
>      66		if (ret) {
>      67			kfree(a);
>      68			return ret;
>      69		}
>      70	
>      71		a->dev = attachment->dev;
>      72		INIT_LIST_HEAD(&a->list);
>      73		a->mapped = false;
>      74	
>      75		attachment->priv = a;
>      76	
>      77		mutex_lock(&buffer->lock);
>      78		list_add(&a->list, &buffer->attachments);
>      79		mutex_unlock(&buffer->lock);
>      80	
>      81		return 0;
>      82	}
>      83	
> 
