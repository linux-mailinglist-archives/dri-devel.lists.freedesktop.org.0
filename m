Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52F315B8C6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 06:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C586EB26;
	Thu, 13 Feb 2020 05:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAC6EB26;
 Thu, 13 Feb 2020 05:01:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 21:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; 
 d="gz'50?scan'50,208,50";a="226990954"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 12 Feb 2020 21:01:40 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j26dA-0009M3-1F; Thu, 13 Feb 2020 13:01:40 +0800
Date: Thu, 13 Feb 2020 13:00:55 +0800
From: kbuild test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [drm-intel:drm-intel-next-queued 5/5]
 drivers/gpu/drm/i915/gt/intel_lrc.c:2335:16: error: unused variable 'regs'
Message-ID: <202002131327.2Lo5hM6f%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IS0zKkzwUGydFO0o"
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
head:   c616d2387aeeb987f03eee848f04ffdc248c7aae
commit: c616d2387aeeb987f03eee848f04ffdc248c7aae [5/5] drm/i915/gt: Expand bad CS completion event debug
config: i386-randconfig-h003-20200213 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
reproduce:
        git checkout c616d2387aeeb987f03eee848f04ffdc248c7aae
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'process_csb':
>> drivers/gpu/drm/i915/gt/intel_lrc.c:2335:16: error: unused variable 'regs' [-Werror=unused-variable]
        const u32 *regs = rq->context->lrc_reg_state;
                   ^~~~
   cc1: all warnings being treated as errors

vim +/regs +2335 drivers/gpu/drm/i915/gt/intel_lrc.c

  2222	
  2223	static void process_csb(struct intel_engine_cs *engine)
  2224	{
  2225		struct intel_engine_execlists * const execlists = &engine->execlists;
  2226		const u32 * const buf = execlists->csb_status;
  2227		const u8 num_entries = execlists->csb_size;
  2228		u8 head, tail;
  2229	
  2230		/*
  2231		 * As we modify our execlists state tracking we require exclusive
  2232		 * access. Either we are inside the tasklet, or the tasklet is disabled
  2233		 * and we assume that is only inside the reset paths and so serialised.
  2234		 */
  2235		GEM_BUG_ON(!tasklet_is_locked(&execlists->tasklet) &&
  2236			   !reset_in_progress(execlists));
  2237		GEM_BUG_ON(!intel_engine_in_execlists_submission_mode(engine));
  2238	
  2239		/*
  2240		 * Note that csb_write, csb_status may be either in HWSP or mmio.
  2241		 * When reading from the csb_write mmio register, we have to be
  2242		 * careful to only use the GEN8_CSB_WRITE_PTR portion, which is
  2243		 * the low 4bits. As it happens we know the next 4bits are always
  2244		 * zero and so we can simply masked off the low u8 of the register
  2245		 * and treat it identically to reading from the HWSP (without having
  2246		 * to use explicit shifting and masking, and probably bifurcating
  2247		 * the code to handle the legacy mmio read).
  2248		 */
  2249		head = execlists->csb_head;
  2250		tail = READ_ONCE(*execlists->csb_write);
  2251		if (unlikely(head == tail))
  2252			return;
  2253	
  2254		/*
  2255		 * Hopefully paired with a wmb() in HW!
  2256		 *
  2257		 * We must complete the read of the write pointer before any reads
  2258		 * from the CSB, so that we do not see stale values. Without an rmb
  2259		 * (lfence) the HW may speculatively perform the CSB[] reads *before*
  2260		 * we perform the READ_ONCE(*csb_write).
  2261		 */
  2262		rmb();
  2263	
  2264		ENGINE_TRACE(engine, "cs-irq head=%d, tail=%d\n", head, tail);
  2265		do {
  2266			bool promote;
  2267	
  2268			if (++head == num_entries)
  2269				head = 0;
  2270	
  2271			/*
  2272			 * We are flying near dragons again.
  2273			 *
  2274			 * We hold a reference to the request in execlist_port[]
  2275			 * but no more than that. We are operating in softirq
  2276			 * context and so cannot hold any mutex or sleep. That
  2277			 * prevents us stopping the requests we are processing
  2278			 * in port[] from being retired simultaneously (the
  2279			 * breadcrumb will be complete before we see the
  2280			 * context-switch). As we only hold the reference to the
  2281			 * request, any pointer chasing underneath the request
  2282			 * is subject to a potential use-after-free. Thus we
  2283			 * store all of the bookkeeping within port[] as
  2284			 * required, and avoid using unguarded pointers beneath
  2285			 * request itself. The same applies to the atomic
  2286			 * status notifier.
  2287			 */
  2288	
  2289			ENGINE_TRACE(engine, "csb[%d]: status=0x%08x:0x%08x\n",
  2290				     head, buf[2 * head + 0], buf[2 * head + 1]);
  2291	
  2292			if (INTEL_GEN(engine->i915) >= 12)
  2293				promote = gen12_csb_parse(execlists, buf + 2 * head);
  2294			else
  2295				promote = gen8_csb_parse(execlists, buf + 2 * head);
  2296			if (promote) {
  2297				struct i915_request * const *old = execlists->active;
  2298	
  2299				GEM_BUG_ON(!assert_pending_valid(execlists, "promote"));
  2300	
  2301				ring_set_paused(engine, 0);
  2302	
  2303				/* Point active to the new ELSP; prevent overwriting */
  2304				WRITE_ONCE(execlists->active, execlists->pending);
  2305	
  2306				/* cancel old inflight, prepare for switch */
  2307				trace_ports(execlists, "preempted", old);
  2308				while (*old)
  2309					execlists_schedule_out(*old++);
  2310	
  2311				/* switch pending to inflight */
  2312				WRITE_ONCE(execlists->active,
  2313					   memcpy(execlists->inflight,
  2314						  execlists->pending,
  2315						  execlists_num_ports(execlists) *
  2316						  sizeof(*execlists->pending)));
  2317	
  2318				WRITE_ONCE(execlists->pending[0], NULL);
  2319			} else {
  2320				GEM_BUG_ON(!*execlists->active);
  2321	
  2322				/* port0 completed, advanced to port1 */
  2323				trace_ports(execlists, "completed", execlists->active);
  2324	
  2325				/*
  2326				 * We rely on the hardware being strongly
  2327				 * ordered, that the breadcrumb write is
  2328				 * coherent (visible from the CPU) before the
  2329				 * user interrupt and CSB is processed.
  2330				 */
  2331				if (GEM_SHOW_DEBUG() &&
  2332				    !i915_request_completed(*execlists->active) &&
  2333				    !reset_in_progress(execlists)) {
  2334					struct i915_request *rq = *execlists->active;
> 2335					const u32 *regs = rq->context->lrc_reg_state;
  2336	
  2337					ENGINE_TRACE(engine,
  2338						     "ring:{start:0x%08x, head:%04x, tail:%04x, ctl:%08x, mode:%08x}\n",
  2339						     ENGINE_READ(engine, RING_START),
  2340						     ENGINE_READ(engine, RING_HEAD) & HEAD_ADDR,
  2341						     ENGINE_READ(engine, RING_TAIL) & TAIL_ADDR,
  2342						     ENGINE_READ(engine, RING_CTL),
  2343						     ENGINE_READ(engine, RING_MI_MODE));
  2344					ENGINE_TRACE(engine,
  2345						     "rq:{start:%08x, head:%04x, tail:%04x, seqno:%llx:%d, hwsp:%d}, ",
  2346						     i915_ggtt_offset(rq->ring->vma),
  2347						     rq->head, rq->tail,
  2348						     rq->fence.context,
  2349						     lower_32_bits(rq->fence.seqno),
  2350						     hwsp_seqno(rq));
  2351					ENGINE_TRACE(engine,
  2352						     "ctx:{start:%08x, head:%04x, tail:%04x}, ",
  2353						     regs[CTX_RING_START],
  2354						     regs[CTX_RING_HEAD],
  2355						     regs[CTX_RING_TAIL]);
  2356	
  2357					GEM_BUG_ON("context completed before request");
  2358				}
  2359	
  2360				execlists_schedule_out(*execlists->active++);
  2361	
  2362				GEM_BUG_ON(execlists->active - execlists->inflight >
  2363					   execlists_num_ports(execlists));
  2364			}
  2365		} while (head != tail);
  2366	
  2367		execlists->csb_head = head;
  2368		set_timeslice(engine);
  2369	
  2370		/*
  2371		 * Gen11 has proven to fail wrt global observation point between
  2372		 * entry and tail update, failing on the ordering and thus
  2373		 * we see an old entry in the context status buffer.
  2374		 *
  2375		 * Forcibly evict out entries for the next gpu csb update,
  2376		 * to increase the odds that we get a fresh entries with non
  2377		 * working hardware. The cost for doing so comes out mostly with
  2378		 * the wash as hardware, working or not, will need to do the
  2379		 * invalidation before.
  2380		 */
  2381		invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
  2382	}
  2383	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--IS0zKkzwUGydFO0o
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--IS0zKkzwUGydFO0o--
