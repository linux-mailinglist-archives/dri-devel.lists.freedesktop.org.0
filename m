Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A180A7A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B3C10E27C;
	Fri,  8 Dec 2023 15:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201410E27C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702050064; x=1733586064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PxrakpGuqUfUuHtiDzTjJnJ7tn9jbK7epdaQHMlqyWM=;
 b=V7CqWEmU1VEA4v5o0N9Od+tWqFighb/YOrIibWTHEc08H22b7N/5Nm0n
 7+gQyDIknC9EQiiI9IV0yd0hYnNJO2iSe5EClBy1c6AmIZ8ijkjQQpLJt
 IfOP6aF9tgXrAFf01oqXs8vQR5dGYAwBlURYaukiG8deJEJixk5jOR3Uj
 L9lbJAWac4vLMh/SsHjJa4LSi/W6mfjnpazTwQUK85DF2Xf5f3AIoBcDs
 NVWiOq/yS/vHTQGIyoFhg+RN7Mqx4h7SjW/NBmKr/YDZIbYw6lDM9duWN
 rH3uZLzc5U8FZ3fgBK1RwH6MScf+WQAqO8VwZtT2FAqdgolE43opxz2JK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="397212539"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="397212539"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 07:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="842650843"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="842650843"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2023 07:40:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rBcyF-000DuR-3A;
 Fri, 08 Dec 2023 15:40:55 +0000
Date: Fri, 8 Dec 2023 23:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [net-next v1 13/16] tcp: RX path for devmem TCP
Message-ID: <202312082353.lFKTtexo-lkp@intel.com>
References: <20231208005250.2910004-14-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208005250.2910004-14-almasrymina@google.com>
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
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Eric Dumazet <edumazet@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, oe-kbuild-all@lists.linux.dev,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Paolo Abeni <pabeni@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mina,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-page_pool-factor-out-releasing-DMA-from-releasing-the-page/20231208-085531
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231208005250.2910004-14-almasrymina%40google.com
patch subject: [net-next v1 13/16] tcp: RX path for devmem TCP
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231208/202312082353.lFKTtexo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312082353.lFKTtexo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082353.lFKTtexo-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2348:57: error: 'SO_DEVMEM_LINEAR' undeclared (first use in this function)
    2348 |                         err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
         |                                                         ^~~~~~~~~~~~~~~~
   net/ipv4/tcp.c:2348:57: note: each undeclared identifier is reported only once for each function it appears in
>> net/ipv4/tcp.c:2411:48: error: 'SO_DEVMEM_DMABUF' undeclared (first use in this function)
    2411 |                                                SO_DEVMEM_DMABUF,
         |                                                ^~~~~~~~~~~~~~~~


vim +/SO_DEVMEM_LINEAR +2348 net/ipv4/tcp.c

  2306	
  2307	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2308	 * user. May not consume all of @remaining_len.
  2309	 */
  2310	static int tcp_recvmsg_dmabuf(const struct sock *sk, const struct sk_buff *skb,
  2311				      unsigned int offset, struct msghdr *msg,
  2312				      int remaining_len)
  2313	{
  2314		struct dmabuf_cmsg dmabuf_cmsg = { 0 };
  2315		unsigned int start;
  2316		int i, copy, n;
  2317		int sent = 0;
  2318		int err = 0;
  2319	
  2320		do {
  2321			start = skb_headlen(skb);
  2322	
  2323			if (!skb->dmabuf) {
  2324				err = -ENODEV;
  2325				goto out;
  2326			}
  2327	
  2328			/* Copy header. */
  2329			copy = start - offset;
  2330			if (copy > 0) {
  2331				copy = min(copy, remaining_len);
  2332	
  2333				n = copy_to_iter(skb->data + offset, copy,
  2334						 &msg->msg_iter);
  2335				if (n != copy) {
  2336					err = -EFAULT;
  2337					goto out;
  2338				}
  2339	
  2340				offset += copy;
  2341				remaining_len -= copy;
  2342	
  2343				/* First a dmabuf_cmsg for # bytes copied to user
  2344				 * buffer.
  2345				 */
  2346				memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
  2347				dmabuf_cmsg.frag_size = copy;
> 2348				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
  2349					       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
  2350				if (err || msg->msg_flags & MSG_CTRUNC) {
  2351					msg->msg_flags &= ~MSG_CTRUNC;
  2352					if (!err)
  2353						err = -ETOOSMALL;
  2354					goto out;
  2355				}
  2356	
  2357				sent += copy;
  2358	
  2359				if (remaining_len == 0)
  2360					goto out;
  2361			}
  2362	
  2363			/* after that, send information of dmabuf pages through a
  2364			 * sequence of cmsg
  2365			 */
  2366			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2367				skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2368				struct page_pool_iov *ppiov;
  2369				u64 frag_offset;
  2370				u32 user_token;
  2371				int end;
  2372	
  2373				/* skb->dmabuf should indicate that ALL the frags in
  2374				 * this skb are dmabuf page_pool_iovs. We're checking
  2375				 * for that flag above, but also check individual frags
  2376				 * here. If the tcp stack is not setting skb->dmabuf
  2377				 * correctly, we still don't want to crash here when
  2378				 * accessing pgmap or priv below.
  2379				 */
  2380				if (!skb_frag_page_pool_iov(frag)) {
  2381					net_err_ratelimited("Found non-dmabuf skb with page_pool_iov");
  2382					err = -ENODEV;
  2383					goto out;
  2384				}
  2385	
  2386				ppiov = skb_frag_page_pool_iov(frag);
  2387				end = start + skb_frag_size(frag);
  2388				copy = end - offset;
  2389	
  2390				if (copy > 0) {
  2391					copy = min(copy, remaining_len);
  2392	
  2393					frag_offset = page_pool_iov_virtual_addr(ppiov) +
  2394						      skb_frag_off(frag) + offset -
  2395						      start;
  2396					dmabuf_cmsg.frag_offset = frag_offset;
  2397					dmabuf_cmsg.frag_size = copy;
  2398					err = xa_alloc((struct xarray *)&sk->sk_user_pages,
  2399						       &user_token, frag->bv_page,
  2400						       xa_limit_31b, GFP_KERNEL);
  2401					if (err)
  2402						goto out;
  2403	
  2404					dmabuf_cmsg.frag_token = user_token;
  2405					dmabuf_cmsg.dmabuf_id = page_pool_iov_binding_id(ppiov);
  2406	
  2407					offset += copy;
  2408					remaining_len -= copy;
  2409	
  2410					err = put_cmsg(msg, SOL_SOCKET,
> 2411						       SO_DEVMEM_DMABUF,
  2412						       sizeof(dmabuf_cmsg),
  2413						       &dmabuf_cmsg);
  2414					if (err || msg->msg_flags & MSG_CTRUNC) {
  2415						msg->msg_flags &= ~MSG_CTRUNC;
  2416						xa_erase((struct xarray *)&sk->sk_user_pages,
  2417							 user_token);
  2418						if (!err)
  2419							err = -ETOOSMALL;
  2420						goto out;
  2421					}
  2422	
  2423					__skb_frag_ref(frag);
  2424	
  2425					sent += copy;
  2426	
  2427					if (remaining_len == 0)
  2428						goto out;
  2429				}
  2430				start = end;
  2431			}
  2432	
  2433			if (!remaining_len)
  2434				goto out;
  2435	
  2436			/* if remaining_len is not satisfied yet, we need to go to the
  2437			 * next frag in the frag_list to satisfy remaining_len.
  2438			 */
  2439			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2440	
  2441			offset = offset - start;
  2442		} while (skb);
  2443	
  2444		if (remaining_len) {
  2445			err = -EFAULT;
  2446			goto out;
  2447		}
  2448	
  2449	out:
  2450		if (!sent)
  2451			sent = err;
  2452	
  2453		return sent;
  2454	}
  2455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
