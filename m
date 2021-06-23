Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08F3B16D3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 11:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C906E895;
	Wed, 23 Jun 2021 09:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780F76E895
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:28:18 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9BLRS006208; Wed, 23 Jun 2021 09:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=OZgDAAB/4jnzoen8zljnpzLeRTcRHe3+B7Io1zKSfr0=;
 b=nn1umI4UQh9XsCrxQIwb7pQbOLqdmucZpC1jeSwYuDxQRD5Gajw6WYYL8gVlRrhC8qV6
 bE8miQOczqtIO12Pcx/Xry0bSgZnuCJpLKL8S1SojekuzriLNcCikx6ihywdQ6dMIBjv
 RMjzMVmJOBNz8YAm6o4ZGuR88p0+rOPDplI5N6dB5mp7IdYyqvp4nGy7NLUtEL5NfU0J
 U/y2fTPQSvKwehsTui1MUCUBnUt6s5NR9NSmypMckAj3qZeLcQeAGaKb97w/i5QklWc9
 6unmtKu97HVJOdn1w1A8axQu3jo/u8pLUF04VdfjEAPtRVhlcYKCY4U9/ZDMJiwydFCv eA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39bf94td3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:28:14 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15N9SDbs106842;
 Wed, 23 Jun 2021 09:28:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3998d8vene-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:28:13 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15N9SDd3106827;
 Wed, 23 Jun 2021 09:28:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3998d8ven0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:28:13 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15N9SAkL002318;
 Wed, 23 Jun 2021 09:28:10 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Jun 2021 02:28:09 -0700
Date: Wed, 23 Jun 2021 12:28:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v3
Message-ID: <202106230954.VIV4hcoW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622130459.122723-1-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: XJY4NQc0pPEDxR0at4Yrgj3Xj3Sl30Sk
X-Proofpoint-GUID: XJY4NQc0pPEDxR0at4Yrgj3Xj3Sl30Sk
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
Cc: kbuild-all@lists.01.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Christian,

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/dma-buf-fix-and-rework-dma_buf_poll-v3/20210622-210643
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: i386-randconfig-m021-20210622 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/dma-buf/dma-buf.c:290 dma_buf_poll() error: uninitialized symbol 'fence_excl'.

vim +/fence_excl +290 drivers/dma-buf/dma-buf.c

afc9a42b7464f7 Al Viro           2017-07-03  208  static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
9b495a5887994a Maarten Lankhorst 2014-07-01  209  {
d40fce0f010662 Christian König   2021-06-22  210  	struct dma_buf_poll_cb_t *dcb;
9b495a5887994a Maarten Lankhorst 2014-07-01  211  	struct dma_buf *dmabuf;
52791eeec1d9f4 Christian König   2019-08-11  212  	struct dma_resv *resv;
52791eeec1d9f4 Christian König   2019-08-11  213  	struct dma_resv_list *fobj;
f54d1867005c33 Chris Wilson      2016-10-25  214  	struct dma_fence *fence_excl;
b016cd6ed4b772 Chris Wilson      2019-08-14  215  	unsigned shared_count, seq;
d40fce0f010662 Christian König   2021-06-22  216  	struct dma_fence *fence;
d40fce0f010662 Christian König   2021-06-22  217  	__poll_t events;
d40fce0f010662 Christian König   2021-06-22  218  	int r, i;
9b495a5887994a Maarten Lankhorst 2014-07-01  219  
9b495a5887994a Maarten Lankhorst 2014-07-01  220  	dmabuf = file->private_data;
9b495a5887994a Maarten Lankhorst 2014-07-01  221  	if (!dmabuf || !dmabuf->resv)
a9a08845e9acbd Linus Torvalds    2018-02-11  222  		return EPOLLERR;
9b495a5887994a Maarten Lankhorst 2014-07-01  223  
9b495a5887994a Maarten Lankhorst 2014-07-01  224  	resv = dmabuf->resv;
9b495a5887994a Maarten Lankhorst 2014-07-01  225  
9b495a5887994a Maarten Lankhorst 2014-07-01  226  	poll_wait(file, &dmabuf->poll, poll);
9b495a5887994a Maarten Lankhorst 2014-07-01  227  
a9a08845e9acbd Linus Torvalds    2018-02-11  228  	events = poll_requested_events(poll) & (EPOLLIN | EPOLLOUT);
9b495a5887994a Maarten Lankhorst 2014-07-01  229  	if (!events)
9b495a5887994a Maarten Lankhorst 2014-07-01  230  		return 0;
9b495a5887994a Maarten Lankhorst 2014-07-01  231  
d40fce0f010662 Christian König   2021-06-22  232  	dcb = events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
d40fce0f010662 Christian König   2021-06-22  233  
d40fce0f010662 Christian König   2021-06-22  234  	/* Only queue a new one if we are not still waiting for the old one */
d40fce0f010662 Christian König   2021-06-22  235  	spin_lock_irq(&dmabuf->poll.lock);
d40fce0f010662 Christian König   2021-06-22  236  	if (dcb->active)
d40fce0f010662 Christian König   2021-06-22  237  		events = 0;
d40fce0f010662 Christian König   2021-06-22  238  	else
d40fce0f010662 Christian König   2021-06-22  239  		dcb->active = events;
d40fce0f010662 Christian König   2021-06-22  240  	spin_unlock_irq(&dmabuf->poll.lock);
d40fce0f010662 Christian König   2021-06-22  241  	if (!events)
d40fce0f010662 Christian König   2021-06-22  242  		return 0;
d40fce0f010662 Christian König   2021-06-22  243  
b016cd6ed4b772 Chris Wilson      2019-08-14  244  retry:
b016cd6ed4b772 Chris Wilson      2019-08-14  245  	seq = read_seqcount_begin(&resv->seq);
3c3b177a9369b2 Maarten Lankhorst 2014-07-01  246  	rcu_read_lock();
b016cd6ed4b772 Chris Wilson      2019-08-14  247  
b016cd6ed4b772 Chris Wilson      2019-08-14  248  	fobj = rcu_dereference(resv->fence);
d40fce0f010662 Christian König   2021-06-22  249  	if (fobj && events & EPOLLOUT)
b016cd6ed4b772 Chris Wilson      2019-08-14  250  		shared_count = fobj->shared_count;
b016cd6ed4b772 Chris Wilson      2019-08-14  251  	else
b016cd6ed4b772 Chris Wilson      2019-08-14  252  		shared_count = 0;
d40fce0f010662 Christian König   2021-06-22  253  
d40fce0f010662 Christian König   2021-06-22  254  	for (i = 0; i < shared_count; ++i) {
d40fce0f010662 Christian König   2021-06-22  255  		fence = rcu_dereference(fobj->shared[i]);
d40fce0f010662 Christian König   2021-06-22  256  		fence = dma_fence_get_rcu(fence);
d40fce0f010662 Christian König   2021-06-22  257  		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
d40fce0f010662 Christian König   2021-06-22  258  			/* Concurrent modify detected, force re-check */
d40fce0f010662 Christian König   2021-06-22  259  			dma_fence_put(fence);
b016cd6ed4b772 Chris Wilson      2019-08-14  260  			rcu_read_unlock();
b016cd6ed4b772 Chris Wilson      2019-08-14  261  			goto retry;
b016cd6ed4b772 Chris Wilson      2019-08-14  262  		}
b016cd6ed4b772 Chris Wilson      2019-08-14  263  
d40fce0f010662 Christian König   2021-06-22  264  		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
d40fce0f010662 Christian König   2021-06-22  265  		if (!r) {
d40fce0f010662 Christian König   2021-06-22  266  			/* Callback queued */
d40fce0f010662 Christian König   2021-06-22  267  			events = 0;
d40fce0f010662 Christian König   2021-06-22  268  			goto out;
9b495a5887994a Maarten Lankhorst 2014-07-01  269  		}
d40fce0f010662 Christian König   2021-06-22  270  		dma_fence_put(fence);
04a5faa8cbe5a8 Maarten Lankhorst 2014-07-01  271  	}
9b495a5887994a Maarten Lankhorst 2014-07-01  272  
d40fce0f010662 Christian König   2021-06-22  273  	fence = dma_resv_get_excl(resv);
d40fce0f010662 Christian König   2021-06-22  274  	if (fence && shared_count == 0) {
d40fce0f010662 Christian König   2021-06-22  275  		fence = dma_fence_get_rcu(fence);
d40fce0f010662 Christian König   2021-06-22  276  		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
d40fce0f010662 Christian König   2021-06-22  277  			/* Concurrent modify detected, force re-check */
d40fce0f010662 Christian König   2021-06-22  278  			dma_fence_put(fence);
d40fce0f010662 Christian König   2021-06-22  279  			rcu_read_unlock();
d40fce0f010662 Christian König   2021-06-22  280  			goto retry;
9b495a5887994a Maarten Lankhorst 2014-07-01  281  
d40fce0f010662 Christian König   2021-06-22  282  		}
9b495a5887994a Maarten Lankhorst 2014-07-01  283  
d40fce0f010662 Christian König   2021-06-22  284  		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
d40fce0f010662 Christian König   2021-06-22  285  		if (!r) {
d40fce0f010662 Christian König   2021-06-22  286  			/* Callback queued */
d40fce0f010662 Christian König   2021-06-22  287  			events = 0;
9b495a5887994a Maarten Lankhorst 2014-07-01  288  			goto out;
3c3b177a9369b2 Maarten Lankhorst 2014-07-01  289  		}
d40fce0f010662 Christian König   2021-06-22 @290  		dma_fence_put(fence_excl);
                                                                              ^^^^^^^^^^
Never initialized.  Is part of the commit missing?

04a5faa8cbe5a8 Maarten Lankhorst 2014-07-01  291  	}
9b495a5887994a Maarten Lankhorst 2014-07-01  292  
9b495a5887994a Maarten Lankhorst 2014-07-01  293  	/* No callback queued, wake up any additional waiters. */
9b495a5887994a Maarten Lankhorst 2014-07-01  294  	dma_buf_poll_cb(NULL, &dcb->cb);
9b495a5887994a Maarten Lankhorst 2014-07-01  295  
9b495a5887994a Maarten Lankhorst 2014-07-01  296  out:
3c3b177a9369b2 Maarten Lankhorst 2014-07-01  297  	rcu_read_unlock();
9b495a5887994a Maarten Lankhorst 2014-07-01  298  	return events;
9b495a5887994a Maarten Lankhorst 2014-07-01  299  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

