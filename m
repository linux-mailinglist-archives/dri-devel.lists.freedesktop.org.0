Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B3CAF609
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 10:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D3010E4E4;
	Tue,  9 Dec 2025 09:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OViWGS1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701F710E4E4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765270962; x=1796806962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3ipPpRju3G3JkV8qv/NsrL4jqBolaaYSewOEjyJ1wdw=;
 b=OViWGS1o+rjvctb48e2xcCNlEs+lrsSbljjXyiiMvP5aNc1FXCTWDoHX
 aFrmdpesV2d2aycJO3HfAARXLHBXKJjIwLd4LuBw42mw1snscJl7NVjlS
 dakkn0O4dhq/pFq+HYxVjDNHDWj+ockkhKJDkAkTrUD7YMCWuEXECuafD
 c5cU4tHG/NiR47fLcucxzoXReV44nN7nIvdunYZewUNgekO+e5yBrFXQ1
 7VFrlZ077OXJnZP4Tvtf2uxMKkjHAghDLm8mdI6d3eB7JPH0h9CpBhB7d
 GvOrbeo3Zya9W2SEe8W3+bl4b5XZDwNVWJJQIhNt4SJlxUFtpSv9kGH+j w==;
X-CSE-ConnectionGUID: SZVs+zGtSUCG+XebHtJr3A==
X-CSE-MsgGUID: vw2kfSUHQju4iMOsvInNRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67107606"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67107606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:02:26 -0800
X-CSE-ConnectionGUID: ObM+KXxvSpq/dHXvfzpwig==
X-CSE-MsgGUID: /qaCQFBrTTOqaYh6kf0mZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="227210093"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 01:02:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vStbw-000000001XZ-2FOs;
 Tue, 09 Dec 2025 09:02:20 +0000
Date: Tue, 9 Dec 2025 17:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guangshuo Li <lgs201920130244@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] riva/fbdev: fix divide error in nv3_arb()
Message-ID: <202512091641.0Nz2KxpF-lkp@intel.com>
References: <20251207072532.518547-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207072532.518547-1-lgs201920130244@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guangshuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/riva-fbdev-fix-divide-error-in-nv3_arb/20251207-152840
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251207072532.518547-1-lgs201920130244%40gmail.com
patch subject: [PATCH] riva/fbdev: fix divide error in nv3_arb()
config: x86_64-randconfig-161-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091641.0Nz2KxpF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091641.0Nz2KxpF-lkp@intel.com/

New smatch warnings:
drivers/video/fbdev/riva/riva_hw.c:439 nv3_arb() warn: inconsistent indenting

Old smatch warnings:
drivers/video/fbdev/riva/riva_hw.c:982 nv10CalcArbitration() warn: inconsistent indenting

vim +439 drivers/video/fbdev/riva/riva_hw.c

   154	
   155	typedef struct {
   156	  int gdrain_rate;
   157	  int vdrain_rate;
   158	  int mdrain_rate;
   159	  int gburst_size;
   160	  int vburst_size;
   161	  char vid_en;
   162	  char gr_en;
   163	  int wcmocc, wcgocc, wcvocc, wcvlwm, wcglwm;
   164	  int by_gfacc;
   165	  char vid_only_once;
   166	  char gr_only_once;
   167	  char first_vacc;
   168	  char first_gacc;
   169	  char first_macc;
   170	  int vocc;
   171	  int gocc;
   172	  int mocc;
   173	  char cur;
   174	  char engine_en;
   175	  char converged;
   176	  int priority;
   177	} nv3_arb_info;
   178	typedef struct {
   179	  int graphics_lwm;
   180	  int video_lwm;
   181	  int graphics_burst_size;
   182	  int video_burst_size;
   183	  int graphics_hi_priority;
   184	  int media_hi_priority;
   185	  int rtl_values;
   186	  int valid;
   187	} nv3_fifo_info;
   188	typedef struct {
   189	  char pix_bpp;
   190	  char enable_video;
   191	  char gr_during_vid;
   192	  char enable_mp;
   193	  int memory_width;
   194	  int video_scale;
   195	  int pclk_khz;
   196	  int mclk_khz;
   197	  int mem_page_miss;
   198	  int mem_latency;
   199	  char mem_aligned;
   200	} nv3_sim_state;
   201	typedef struct {
   202	  int graphics_lwm;
   203	  int video_lwm;
   204	  int graphics_burst_size;
   205	  int video_burst_size;
   206	  int valid;
   207	} nv4_fifo_info;
   208	typedef struct {
   209	  int pclk_khz;
   210	  int mclk_khz;
   211	  int nvclk_khz;
   212	  char mem_page_miss;
   213	  char mem_latency;
   214	  int memory_width;
   215	  char enable_video;
   216	  char gr_during_vid;
   217	  char pix_bpp;
   218	  char mem_aligned;
   219	  char enable_mp;
   220	} nv4_sim_state;
   221	typedef struct {
   222	  int graphics_lwm;
   223	  int video_lwm;
   224	  int graphics_burst_size;
   225	  int video_burst_size;
   226	  int valid;
   227	} nv10_fifo_info;
   228	typedef struct {
   229	  int pclk_khz;
   230	  int mclk_khz;
   231	  int nvclk_khz;
   232	  char mem_page_miss;
   233	  char mem_latency;
   234	  u32 memory_type;
   235	  int memory_width;
   236	  char enable_video;
   237	  char gr_during_vid;
   238	  char pix_bpp;
   239	  char mem_aligned;
   240	  char enable_mp;
   241	} nv10_sim_state;
   242	static int nv3_iterate(nv3_fifo_info *res_info, nv3_sim_state * state, nv3_arb_info *ainfo)
   243	{
   244	    int iter = 0;
   245	    int tmp;
   246	    int vfsize, mfsize, gfsize;
   247	    int mburst_size = 32;
   248	    int mmisses, gmisses, vmisses;
   249	    int misses;
   250	    int vlwm, glwm;
   251	    int last, next, cur;
   252	    int max_gfsize ;
   253	    long ns;
   254	
   255	    vlwm = 0;
   256	    glwm = 0;
   257	    vfsize = 0;
   258	    gfsize = 0;
   259	    cur = ainfo->cur;
   260	    mmisses = 2;
   261	    gmisses = 2;
   262	    vmisses = 2;
   263	    if (ainfo->gburst_size == 128) max_gfsize = GFIFO_SIZE_128;
   264	    else  max_gfsize = GFIFO_SIZE;
   265	    max_gfsize = GFIFO_SIZE;
   266	    while (1)
   267	    {
   268	        if (ainfo->vid_en)
   269	        {
   270	            if (ainfo->wcvocc > ainfo->vocc) ainfo->wcvocc = ainfo->vocc;
   271	            if (ainfo->wcvlwm > vlwm) ainfo->wcvlwm = vlwm ;
   272	            ns = 1000000 * ainfo->vburst_size/(state->memory_width/8)/state->mclk_khz;
   273	            vfsize = ns * ainfo->vdrain_rate / 1000000;
   274	            vfsize =  ainfo->wcvlwm - ainfo->vburst_size + vfsize;
   275	        }
   276	        if (state->enable_mp)
   277	        {
   278	            if (ainfo->wcmocc > ainfo->mocc) ainfo->wcmocc = ainfo->mocc;
   279	        }
   280	        if (ainfo->gr_en)
   281	        {
   282	            if (ainfo->wcglwm > glwm) ainfo->wcglwm = glwm ;
   283	            if (ainfo->wcgocc > ainfo->gocc) ainfo->wcgocc = ainfo->gocc;
   284	            ns = 1000000 * (ainfo->gburst_size/(state->memory_width/8))/state->mclk_khz;
   285	            gfsize = (ns * (long) ainfo->gdrain_rate)/1000000;
   286	            gfsize = ainfo->wcglwm - ainfo->gburst_size + gfsize;
   287	        }
   288	        mfsize = 0;
   289	        if (!state->gr_during_vid && ainfo->vid_en)
   290	            if (ainfo->vid_en && (ainfo->vocc < 0) && !ainfo->vid_only_once)
   291	                next = VIDEO;
   292	            else if (ainfo->mocc < 0)
   293	                next = MPORT;
   294	            else if (ainfo->gocc< ainfo->by_gfacc)
   295	                next = GRAPHICS;
   296	            else return (0);
   297	        else switch (ainfo->priority)
   298	            {
   299	                case VIDEO:
   300	                    if (ainfo->vid_en && ainfo->vocc<0 && !ainfo->vid_only_once)
   301	                        next = VIDEO;
   302	                    else if (ainfo->gr_en && ainfo->gocc<0 && !ainfo->gr_only_once)
   303	                        next = GRAPHICS;
   304	                    else if (ainfo->mocc<0)
   305	                        next = MPORT;
   306	                    else    return (0);
   307	                    break;
   308	                case GRAPHICS:
   309	                    if (ainfo->gr_en && ainfo->gocc<0 && !ainfo->gr_only_once)
   310	                        next = GRAPHICS;
   311	                    else if (ainfo->vid_en && ainfo->vocc<0 && !ainfo->vid_only_once)
   312	                        next = VIDEO;
   313	                    else if (ainfo->mocc<0)
   314	                        next = MPORT;
   315	                    else    return (0);
   316	                    break;
   317	                default:
   318	                    if (ainfo->mocc<0)
   319	                        next = MPORT;
   320	                    else if (ainfo->gr_en && ainfo->gocc<0 && !ainfo->gr_only_once)
   321	                        next = GRAPHICS;
   322	                    else if (ainfo->vid_en && ainfo->vocc<0 && !ainfo->vid_only_once)
   323	                        next = VIDEO;
   324	                    else    return (0);
   325	                    break;
   326	            }
   327	        last = cur;
   328	        cur = next;
   329	        iter++;
   330	        switch (cur)
   331	        {
   332	            case VIDEO:
   333	                if (last==cur)    misses = 0;
   334	                else if (ainfo->first_vacc)   misses = vmisses;
   335	                else    misses = 1;
   336	                ainfo->first_vacc = 0;
   337	                if (last!=cur)
   338	                {
   339	                    ns =  1000000 * (vmisses*state->mem_page_miss + state->mem_latency)/state->mclk_khz; 
   340	                    vlwm = ns * ainfo->vdrain_rate/ 1000000;
   341	                    vlwm = ainfo->vocc - vlwm;
   342	                }
   343	                ns = 1000000*(misses*state->mem_page_miss + ainfo->vburst_size)/(state->memory_width/8)/state->mclk_khz;
   344	                ainfo->vocc = ainfo->vocc + ainfo->vburst_size - ns*ainfo->vdrain_rate/1000000;
   345	                ainfo->gocc = ainfo->gocc - ns*ainfo->gdrain_rate/1000000;
   346	                ainfo->mocc = ainfo->mocc - ns*ainfo->mdrain_rate/1000000;
   347	                break;
   348	            case GRAPHICS:
   349	                if (last==cur)    misses = 0;
   350	                else if (ainfo->first_gacc)   misses = gmisses;
   351	                else    misses = 1;
   352	                ainfo->first_gacc = 0;
   353	                if (last!=cur)
   354	                {
   355	                    ns = 1000000*(gmisses*state->mem_page_miss + state->mem_latency)/state->mclk_khz ;
   356	                    glwm = ns * ainfo->gdrain_rate/1000000;
   357	                    glwm = ainfo->gocc - glwm;
   358	                }
   359	                ns = 1000000*(misses*state->mem_page_miss + ainfo->gburst_size/(state->memory_width/8))/state->mclk_khz;
   360	                ainfo->vocc = ainfo->vocc + 0 - ns*ainfo->vdrain_rate/1000000;
   361	                ainfo->gocc = ainfo->gocc + ainfo->gburst_size - ns*ainfo->gdrain_rate/1000000;
   362	                ainfo->mocc = ainfo->mocc + 0 - ns*ainfo->mdrain_rate/1000000;
   363	                break;
   364	            default:
   365	                if (last==cur)    misses = 0;
   366	                else if (ainfo->first_macc)   misses = mmisses;
   367	                else    misses = 1;
   368	                ainfo->first_macc = 0;
   369	                ns = 1000000*(misses*state->mem_page_miss + mburst_size/(state->memory_width/8))/state->mclk_khz;
   370	                ainfo->vocc = ainfo->vocc + 0 - ns*ainfo->vdrain_rate/1000000;
   371	                ainfo->gocc = ainfo->gocc + 0 - ns*ainfo->gdrain_rate/1000000;
   372	                ainfo->mocc = ainfo->mocc + mburst_size - ns*ainfo->mdrain_rate/1000000;
   373	                break;
   374	        }
   375	        if (iter>100)
   376	        {
   377	            ainfo->converged = 0;
   378	            return (1);
   379	        }
   380	        ns = 1000000*ainfo->gburst_size/(state->memory_width/8)/state->mclk_khz;
   381	        tmp = ns * ainfo->gdrain_rate/1000000;
   382	        if (abs(ainfo->gburst_size) + ((abs(ainfo->wcglwm) + 16 ) & ~0x7) - tmp > max_gfsize)
   383	        {
   384	            ainfo->converged = 0;
   385	            return (1);
   386	        }
   387	        ns = 1000000*ainfo->vburst_size/(state->memory_width/8)/state->mclk_khz;
   388	        tmp = ns * ainfo->vdrain_rate/1000000;
   389	        if (abs(ainfo->vburst_size) + (abs(ainfo->wcvlwm + 32) & ~0xf)  - tmp> VFIFO_SIZE)
   390	        {
   391	            ainfo->converged = 0;
   392	            return (1);
   393	        }
   394	        if (abs(ainfo->gocc) > max_gfsize)
   395	        {
   396	            ainfo->converged = 0;
   397	            return (1);
   398	        }
   399	        if (abs(ainfo->vocc) > VFIFO_SIZE)
   400	        {
   401	            ainfo->converged = 0;
   402	            return (1);
   403	        }
   404	        if (abs(ainfo->mocc) > MFIFO_SIZE)
   405	        {
   406	            ainfo->converged = 0;
   407	            return (1);
   408	        }
   409	        if (abs(vfsize) > VFIFO_SIZE)
   410	        {
   411	            ainfo->converged = 0;
   412	            return (1);
   413	        }
   414	        if (abs(gfsize) > max_gfsize)
   415	        {
   416	            ainfo->converged = 0;
   417	            return (1);
   418	        }
   419	        if (abs(mfsize) > MFIFO_SIZE)
   420	        {
   421	            ainfo->converged = 0;
   422	            return (1);
   423	        }
   424	    }
   425	}
   426	static char nv3_arb(nv3_fifo_info * res_info, nv3_sim_state * state,  nv3_arb_info *ainfo) 
   427	{
   428	    long ens, vns, mns, gns;
   429	    int mmisses, gmisses, vmisses, eburst_size, mburst_size;
   430	    int refresh_cycle;
   431	
   432	    refresh_cycle = 2*(state->mclk_khz/state->pclk_khz) + 5;
   433	    mmisses = 2;
   434	    if (state->mem_aligned) gmisses = 2;
   435	    else    gmisses = 3;
   436	    vmisses = 2;
   437	    eburst_size = state->memory_width * 1;
   438	    mburst_size = 32;
 > 439		if (!state->mclk_khz)
   440			return (0);
   441	
   442	    gns = 1000000 * (gmisses*state->mem_page_miss + state->mem_latency)/state->mclk_khz;
   443	    ainfo->by_gfacc = gns*ainfo->gdrain_rate/1000000;
   444	    ainfo->wcmocc = 0;
   445	    ainfo->wcgocc = 0;
   446	    ainfo->wcvocc = 0;
   447	    ainfo->wcvlwm = 0;
   448	    ainfo->wcglwm = 0;
   449	    ainfo->engine_en = 1;
   450	    ainfo->converged = 1;
   451	    if (ainfo->engine_en)
   452	    {
   453	        ens =  1000000*(state->mem_page_miss + eburst_size/(state->memory_width/8) +refresh_cycle)/state->mclk_khz;
   454	        ainfo->mocc = state->enable_mp ? 0-ens*ainfo->mdrain_rate/1000000 : 0;
   455	        ainfo->vocc = ainfo->vid_en ? 0-ens*ainfo->vdrain_rate/1000000 : 0;
   456	        ainfo->gocc = ainfo->gr_en ? 0-ens*ainfo->gdrain_rate/1000000 : 0;
   457	        ainfo->cur = ENGINE;
   458	        ainfo->first_vacc = 1;
   459	        ainfo->first_gacc = 1;
   460	        ainfo->first_macc = 1;
   461	        nv3_iterate(res_info, state,ainfo);
   462	    }
   463	    if (state->enable_mp)
   464	    {
   465	        mns = 1000000 * (mmisses*state->mem_page_miss + mburst_size/(state->memory_width/8) + refresh_cycle)/state->mclk_khz;
   466	        ainfo->mocc = state->enable_mp ? 0 : mburst_size - mns*ainfo->mdrain_rate/1000000;
   467	        ainfo->vocc = ainfo->vid_en ? 0 : 0- mns*ainfo->vdrain_rate/1000000;
   468	        ainfo->gocc = ainfo->gr_en ? 0: 0- mns*ainfo->gdrain_rate/1000000;
   469	        ainfo->cur = MPORT;
   470	        ainfo->first_vacc = 1;
   471	        ainfo->first_gacc = 1;
   472	        ainfo->first_macc = 0;
   473	        nv3_iterate(res_info, state,ainfo);
   474	    }
   475	    if (ainfo->gr_en)
   476	    {
   477	        ainfo->first_vacc = 1;
   478	        ainfo->first_gacc = 0;
   479	        ainfo->first_macc = 1;
   480	        gns = 1000000*(gmisses*state->mem_page_miss + ainfo->gburst_size/(state->memory_width/8) + refresh_cycle)/state->mclk_khz;
   481	        ainfo->gocc = ainfo->gburst_size - gns*ainfo->gdrain_rate/1000000;
   482	        ainfo->vocc = ainfo->vid_en? 0-gns*ainfo->vdrain_rate/1000000 : 0;
   483	        ainfo->mocc = state->enable_mp ?  0-gns*ainfo->mdrain_rate/1000000: 0;
   484	        ainfo->cur = GRAPHICS;
   485	        nv3_iterate(res_info, state,ainfo);
   486	    }
   487	    if (ainfo->vid_en)
   488	    {
   489	        ainfo->first_vacc = 0;
   490	        ainfo->first_gacc = 1;
   491	        ainfo->first_macc = 1;
   492	        vns = 1000000*(vmisses*state->mem_page_miss + ainfo->vburst_size/(state->memory_width/8) + refresh_cycle)/state->mclk_khz;
   493	        ainfo->vocc = ainfo->vburst_size - vns*ainfo->vdrain_rate/1000000;
   494	        ainfo->gocc = ainfo->gr_en? (0-vns*ainfo->gdrain_rate/1000000) : 0;
   495	        ainfo->mocc = state->enable_mp? 0-vns*ainfo->mdrain_rate/1000000 :0 ;
   496	        ainfo->cur = VIDEO;
   497	        nv3_iterate(res_info, state, ainfo);
   498	    }
   499	    if (ainfo->converged)
   500	    {
   501	        res_info->graphics_lwm = (int)abs(ainfo->wcglwm) + 16;
   502	        res_info->video_lwm = (int)abs(ainfo->wcvlwm) + 32;
   503	        res_info->graphics_burst_size = ainfo->gburst_size;
   504	        res_info->video_burst_size = ainfo->vburst_size;
   505	        res_info->graphics_hi_priority = (ainfo->priority == GRAPHICS);
   506	        res_info->media_hi_priority = (ainfo->priority == MPORT);
   507	        if (res_info->video_lwm > 160)
   508	        {
   509	            res_info->graphics_lwm = 256;
   510	            res_info->video_lwm = 128;
   511	            res_info->graphics_burst_size = 64;
   512	            res_info->video_burst_size = 64;
   513	            res_info->graphics_hi_priority = 0;
   514	            res_info->media_hi_priority = 0;
   515	            ainfo->converged = 0;
   516	            return (0);
   517	        }
   518	        if (res_info->video_lwm > 128)
   519	        {
   520	            res_info->video_lwm = 128;
   521	        }
   522	        return (1);
   523	    }
   524	    else
   525	    {
   526	        res_info->graphics_lwm = 256;
   527	        res_info->video_lwm = 128;
   528	        res_info->graphics_burst_size = 64;
   529	        res_info->video_burst_size = 64;
   530	        res_info->graphics_hi_priority = 0;
   531	        res_info->media_hi_priority = 0;
   532	        return (0);
   533	    }
   534	}
   535	static char nv3_get_param(nv3_fifo_info *res_info, nv3_sim_state * state, nv3_arb_info *ainfo)
   536	{
   537	    int done, g,v, p;
   538	    
   539	    done = 0;
   540	    for (p=0; p < 2; p++)
   541	    {
   542	        for (g=128 ; g > 32; g= g>> 1)
   543	        {
   544	            for (v=128; v >=32; v = v>> 1)
   545	            {
   546	                ainfo->priority = p;
   547	                ainfo->gburst_size = g;     
   548	                ainfo->vburst_size = v;
   549	                done = nv3_arb(res_info, state,ainfo);
   550	                if (done && (g==128))
   551	                    if ((res_info->graphics_lwm + g) > 256)
   552	                        done = 0;
   553	                if (done)
   554	                    goto Done;
   555	            }
   556	        }
   557	    }
   558	
   559	 Done:
   560	    return done;
   561	}
   562	static void nv3CalcArbitration 
   563	(
   564	    nv3_fifo_info * res_info,
   565	    nv3_sim_state * state
   566	)
   567	{
   568	    nv3_fifo_info save_info;
   569	    nv3_arb_info ainfo;
   570	    char   res_gr, res_vid;
   571	
   572	    ainfo.gr_en = 1;
   573	    ainfo.vid_en = state->enable_video;
   574	    ainfo.vid_only_once = 0;
   575	    ainfo.gr_only_once = 0;
   576	    ainfo.gdrain_rate = (int) state->pclk_khz * (state->pix_bpp/8);
   577	    ainfo.vdrain_rate = (int) state->pclk_khz * 2;
   578	    if (state->video_scale != 0)
   579	        ainfo.vdrain_rate = ainfo.vdrain_rate/state->video_scale;
   580	    ainfo.mdrain_rate = 33000;
   581	    res_info->rtl_values = 0;
   582	    if (!state->gr_during_vid && state->enable_video)
   583	    {
   584	        ainfo.gr_only_once = 1;
   585	        ainfo.gr_en = 1;
   586	        ainfo.gdrain_rate = 0;
   587	        res_vid = nv3_get_param(res_info, state,  &ainfo);
   588	        res_vid = ainfo.converged;
   589	        save_info.video_lwm = res_info->video_lwm;
   590	        save_info.video_burst_size = res_info->video_burst_size;
   591	        ainfo.vid_en = 1;
   592	        ainfo.vid_only_once = 1;
   593	        ainfo.gr_en = 1;
   594	        ainfo.gdrain_rate = (int) state->pclk_khz * (state->pix_bpp/8);
   595	        ainfo.vdrain_rate = 0;
   596	        res_gr = nv3_get_param(res_info, state,  &ainfo);
   597	        res_gr = ainfo.converged;
   598	        res_info->video_lwm = save_info.video_lwm;
   599	        res_info->video_burst_size = save_info.video_burst_size;
   600	        res_info->valid = res_gr & res_vid;
   601	    }
   602	    else
   603	    {
   604	        if (!ainfo.gr_en) ainfo.gdrain_rate = 0;
   605	        if (!ainfo.vid_en) ainfo.vdrain_rate = 0;
   606	        res_gr = nv3_get_param(res_info, state,  &ainfo);
   607	        res_info->valid = ainfo.converged;
   608	    }
   609	}
   610	static void nv3UpdateArbitrationSettings
   611	(
   612	    unsigned      VClk, 
   613	    unsigned      pixelDepth, 
   614	    unsigned     *burst,
   615	    unsigned     *lwm,
   616	    RIVA_HW_INST *chip
   617	)
   618	{
   619	    nv3_fifo_info fifo_data;
   620	    nv3_sim_state sim_data;
   621	    unsigned int M, N, P, pll, MClk;
   622	    
   623	    pll = NV_RD32(&chip->PRAMDAC0[0x00000504/4], 0);
   624	    M = (pll >> 0) & 0xFF; N = (pll >> 8) & 0xFF; P = (pll >> 16) & 0x0F;
   625	    MClk = (N * chip->CrystalFreqKHz / M) >> P;
   626	    sim_data.pix_bpp        = (char)pixelDepth;
   627	    sim_data.enable_video   = 0;
   628	    sim_data.enable_mp      = 0;
   629	    sim_data.video_scale    = 1;
   630	    sim_data.memory_width   = (NV_RD32(&chip->PEXTDEV[0x00000000/4], 0) & 0x10) ?
   631		128 : 64;
   632	    sim_data.memory_width   = 128;
   633	
   634	    sim_data.mem_latency    = 9;
   635	    sim_data.mem_aligned    = 1;
   636	    sim_data.mem_page_miss  = 11;
   637	    sim_data.gr_during_vid  = 0;
   638	    sim_data.pclk_khz       = VClk;
   639	    sim_data.mclk_khz       = MClk;
   640	    nv3CalcArbitration(&fifo_data, &sim_data);
   641	    if (fifo_data.valid)
   642	    {
   643	        int  b = fifo_data.graphics_burst_size >> 4;
   644	        *burst = 0;
   645	        while (b >>= 1)
   646		    (*burst)++;
   647	        *lwm   = fifo_data.graphics_lwm >> 3;
   648	    }
   649	    else
   650	    {
   651	        *lwm   = 0x24;
   652	        *burst = 0x2;
   653	    }
   654	}
   655	static void nv4CalcArbitration 
   656	(
   657	    nv4_fifo_info *fifo,
   658	    nv4_sim_state *arb
   659	)
   660	{
   661	    int data, pagemiss, cas,width, video_enable, bpp;
   662	    int nvclks, mclks, pclks, vpagemiss, crtpagemiss, vbs;
   663	    int found, mclk_extra, mclk_loop, cbs, m1, p1;
   664	    int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
   665	    int us_m, us_n, us_p, video_drain_rate, crtc_drain_rate;
   666	    int vpm_us, us_video, vlwm, video_fill_us, cpm_us, us_crt,clwm;
   667	
   668	    fifo->valid = 1;
   669	    pclk_freq = arb->pclk_khz;
   670	    mclk_freq = arb->mclk_khz;
   671	    nvclk_freq = arb->nvclk_khz;
   672	    pagemiss = arb->mem_page_miss;
   673	    cas = arb->mem_latency;
   674	    width = arb->memory_width >> 6;
   675	    video_enable = arb->enable_video;
   676	    bpp = arb->pix_bpp;
   677	    mp_enable = arb->enable_mp;
   678	    clwm = 0;
   679	    vlwm = 0;
   680	    cbs = 128;
   681	    pclks = 2;
   682	    nvclks = 2;
   683	    nvclks += 2;
   684	    nvclks += 1;
   685	    mclks = 5;
   686	    mclks += 3;
   687	    mclks += 1;
   688	    mclks += cas;
   689	    mclks += 1;
   690	    mclks += 1;
   691	    mclks += 1;
   692	    mclks += 1;
   693	    mclk_extra = 3;
   694	    nvclks += 2;
   695	    nvclks += 1;
   696	    nvclks += 1;
   697	    nvclks += 1;
   698	    if (mp_enable)
   699	        mclks+=4;
   700	    nvclks += 0;
   701	    pclks += 0;
   702	    found = 0;
   703	    vbs = 0;
   704	    while (found != 1)
   705	    {
   706	        fifo->valid = 1;
   707	        found = 1;
   708	        mclk_loop = mclks+mclk_extra;
   709	        us_m = mclk_loop *1000*1000 / mclk_freq;
   710	        us_n = nvclks*1000*1000 / nvclk_freq;
   711	        us_p = nvclks*1000*1000 / pclk_freq;
   712	        if (video_enable)
   713	        {
   714	            video_drain_rate = pclk_freq * 2;
   715	            crtc_drain_rate = pclk_freq * bpp/8;
   716	            vpagemiss = 2;
   717	            vpagemiss += 1;
   718	            crtpagemiss = 2;
   719	            vpm_us = (vpagemiss * pagemiss)*1000*1000/mclk_freq;
   720	            if (nvclk_freq * 2 > mclk_freq * width)
   721	                video_fill_us = cbs*1000*1000 / 16 / nvclk_freq ;
   722	            else
   723	                video_fill_us = cbs*1000*1000 / (8 * width) / mclk_freq;
   724	            us_video = vpm_us + us_m + us_n + us_p + video_fill_us;
   725	            vlwm = us_video * video_drain_rate/(1000*1000);
   726	            vlwm++;
   727	            vbs = 128;
   728	            if (vlwm > 128) vbs = 64;
   729	            if (vlwm > (256-64)) vbs = 32;
   730	            if (nvclk_freq * 2 > mclk_freq * width)
   731	                video_fill_us = vbs *1000*1000/ 16 / nvclk_freq ;
   732	            else
   733	                video_fill_us = vbs*1000*1000 / (8 * width) / mclk_freq;
   734	            cpm_us = crtpagemiss  * pagemiss *1000*1000/ mclk_freq;
   735	            us_crt =
   736	            us_video
   737	            +video_fill_us
   738	            +cpm_us
   739	            +us_m + us_n +us_p
   740	            ;
   741	            clwm = us_crt * crtc_drain_rate/(1000*1000);
   742	            clwm++;
   743	        }
   744	        else
   745	        {
   746	            crtc_drain_rate = pclk_freq * bpp/8;
   747	            crtpagemiss = 2;
   748	            crtpagemiss += 1;
   749	            cpm_us = crtpagemiss  * pagemiss *1000*1000/ mclk_freq;
   750	            us_crt =  cpm_us + us_m + us_n + us_p ;
   751	            clwm = us_crt * crtc_drain_rate/(1000*1000);
   752	            clwm++;
   753	        }
   754	        m1 = clwm + cbs - 512;
   755	        p1 = m1 * pclk_freq / mclk_freq;
   756	        p1 = p1 * bpp / 8;
   757	        if ((p1 < m1) && (m1 > 0))
   758	        {
   759	            fifo->valid = 0;
   760	            found = 0;
   761	            if (mclk_extra ==0)   found = 1;
   762	            mclk_extra--;
   763	        }
   764	        else if (video_enable)
   765	        {
   766	            if ((clwm > 511) || (vlwm > 255))
   767	            {
   768	                fifo->valid = 0;
   769	                found = 0;
   770	                if (mclk_extra ==0)   found = 1;
   771	                mclk_extra--;
   772	            }
   773	        }
   774	        else
   775	        {
   776	            if (clwm > 519)
   777	            {
   778	                fifo->valid = 0;
   779	                found = 0;
   780	                if (mclk_extra ==0)   found = 1;
   781	                mclk_extra--;
   782	            }
   783	        }
   784	        if (clwm < 384) clwm = 384;
   785	        if (vlwm < 128) vlwm = 128;
   786	        data = (int)(clwm);
   787	        fifo->graphics_lwm = data;
   788	        fifo->graphics_burst_size = 128;
   789	        data = (int)((vlwm+15));
   790	        fifo->video_lwm = data;
   791	        fifo->video_burst_size = vbs;
   792	    }
   793	}
   794	static void nv4UpdateArbitrationSettings
   795	(
   796	    unsigned      VClk, 
   797	    unsigned      pixelDepth, 
   798	    unsigned     *burst,
   799	    unsigned     *lwm,
   800	    RIVA_HW_INST *chip
   801	)
   802	{
   803	    nv4_fifo_info fifo_data;
   804	    nv4_sim_state sim_data;
   805	    unsigned int M, N, P, pll, MClk, NVClk, cfg1;
   806	
   807	    pll = NV_RD32(&chip->PRAMDAC0[0x00000504/4], 0);
   808	    M = (pll >> 0)  & 0xFF; N = (pll >> 8)  & 0xFF; P = (pll >> 16) & 0x0F;
   809	    MClk  = (N * chip->CrystalFreqKHz / M) >> P;
   810	    pll = NV_RD32(&chip->PRAMDAC0[0x00000500/4], 0);
   811	    M = (pll >> 0)  & 0xFF; N = (pll >> 8)  & 0xFF; P = (pll >> 16) & 0x0F;
   812	    NVClk  = (N * chip->CrystalFreqKHz / M) >> P;
   813	    cfg1 = NV_RD32(&chip->PFB[0x00000204/4], 0);
   814	    sim_data.pix_bpp        = (char)pixelDepth;
   815	    sim_data.enable_video   = 0;
   816	    sim_data.enable_mp      = 0;
   817	    sim_data.memory_width   = (NV_RD32(&chip->PEXTDEV[0x00000000/4], 0) & 0x10) ?
   818		128 : 64;
   819	    sim_data.mem_latency    = (char)cfg1 & 0x0F;
   820	    sim_data.mem_aligned    = 1;
   821	    sim_data.mem_page_miss  = (char)(((cfg1 >> 4) &0x0F) + ((cfg1 >> 31) & 0x01));
   822	    sim_data.gr_during_vid  = 0;
   823	    sim_data.pclk_khz       = VClk;
   824	    sim_data.mclk_khz       = MClk;
   825	    sim_data.nvclk_khz      = NVClk;
   826	    nv4CalcArbitration(&fifo_data, &sim_data);
   827	    if (fifo_data.valid)
   828	    {
   829	        int  b = fifo_data.graphics_burst_size >> 4;
   830	        *burst = 0;
   831	        while (b >>= 1)
   832		    (*burst)++;
   833	        *lwm   = fifo_data.graphics_lwm >> 3;
   834	    }
   835	}
   836	static void nv10CalcArbitration 
   837	(
   838	    nv10_fifo_info *fifo,
   839	    nv10_sim_state *arb
   840	)
   841	{
   842	    int data, pagemiss, width, video_enable, bpp;
   843	    int nvclks, mclks, pclks, vpagemiss, crtpagemiss;
   844	    int nvclk_fill;
   845	    int found, mclk_extra, mclk_loop, cbs, m1;
   846	    int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
   847	    int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
   848	    int vus_m;
   849	    int vpm_us, us_video, cpm_us, us_crt,clwm;
   850	    int clwm_rnd_down;
   851	    int m2us, us_pipe_min, p1clk, p2;
   852	    int min_mclk_extra;
   853	    int us_min_mclk_extra;
   854	
   855	    fifo->valid = 1;
   856	    pclk_freq = arb->pclk_khz; /* freq in KHz */
   857	    mclk_freq = arb->mclk_khz;
   858	    nvclk_freq = arb->nvclk_khz;
   859	    pagemiss = arb->mem_page_miss;
   860	    width = arb->memory_width/64;
   861	    video_enable = arb->enable_video;
   862	    bpp = arb->pix_bpp;
   863	    mp_enable = arb->enable_mp;
   864	    clwm = 0;
   865	
   866	    cbs = 512;
   867	
   868	    pclks = 4; /* lwm detect. */
   869	
   870	    nvclks = 3; /* lwm -> sync. */
   871	    nvclks += 2; /* fbi bus cycles (1 req + 1 busy) */
   872	
   873	    mclks  = 1;   /* 2 edge sync.  may be very close to edge so just put one. */
   874	
   875	    mclks += 1;   /* arb_hp_req */
   876	    mclks += 5;   /* ap_hp_req   tiling pipeline */
   877	
   878	    mclks += 2;    /* tc_req     latency fifo */
   879	    mclks += 2;    /* fb_cas_n_  memory request to fbio block */
   880	    mclks += 7;    /* sm_d_rdv   data returned from fbio block */
   881	
   882	    /* fb.rd.d.Put_gc   need to accumulate 256 bits for read */
   883	    if (arb->memory_type == 0)
   884	      if (arb->memory_width == 64) /* 64 bit bus */
   885	        mclks += 4;
   886	      else
   887	        mclks += 2;
   888	    else
   889	      if (arb->memory_width == 64) /* 64 bit bus */
   890	        mclks += 2;
   891	      else
   892	        mclks += 1;
   893	
   894	    if ((!video_enable) && (arb->memory_width == 128))
   895	    {  
   896	      mclk_extra = (bpp == 32) ? 31 : 42; /* Margin of error */
   897	      min_mclk_extra = 17;
   898	    }
   899	    else
   900	    {
   901	      mclk_extra = (bpp == 32) ? 8 : 4; /* Margin of error */
   902	      /* mclk_extra = 4; */ /* Margin of error */
   903	      min_mclk_extra = 18;
   904	    }
   905	
   906	    nvclks += 1; /* 2 edge sync.  may be very close to edge so just put one. */
   907	    nvclks += 1; /* fbi_d_rdv_n */
   908	    nvclks += 1; /* Fbi_d_rdata */
   909	    nvclks += 1; /* crtfifo load */
   910	
   911	    if(mp_enable)
   912	      mclks+=4; /* Mp can get in with a burst of 8. */
   913	    /* Extra clocks determined by heuristics */
   914	
   915	    nvclks += 0;
   916	    pclks += 0;
   917	    found = 0;
   918	    while(found != 1) {
   919	      fifo->valid = 1;
   920	      found = 1;
   921	      mclk_loop = mclks+mclk_extra;
   922	      us_m = mclk_loop *1000*1000 / mclk_freq; /* Mclk latency in us */
   923	      us_m_min = mclks * 1000*1000 / mclk_freq; /* Minimum Mclk latency in us */
   924	      us_min_mclk_extra = min_mclk_extra *1000*1000 / mclk_freq;
   925	      us_n = nvclks*1000*1000 / nvclk_freq;/* nvclk latency in us */
   926	      us_p = pclks*1000*1000 / pclk_freq;/* nvclk latency in us */
   927	      us_pipe_min = us_m_min + us_n + us_p;
   928	
   929	      vus_m = mclk_loop *1000*1000 / mclk_freq; /* Mclk latency in us */
   930	
   931	      if(video_enable) {
   932	        crtc_drain_rate = pclk_freq * bpp/8; /* MB/s */
   933	
   934	        vpagemiss = 1; /* self generating page miss */
   935	        vpagemiss += 1; /* One higher priority before */
   936	
   937	        crtpagemiss = 2; /* self generating page miss */
   938	        if(mp_enable)
   939	            crtpagemiss += 1; /* if MA0 conflict */
   940	
   941	        vpm_us = (vpagemiss * pagemiss)*1000*1000/mclk_freq;
   942	
   943	        us_video = vpm_us + vus_m; /* Video has separate read return path */
   944	
   945	        cpm_us = crtpagemiss  * pagemiss *1000*1000/ mclk_freq;
   946	        us_crt =
   947	          us_video  /* Wait for video */
   948	          +cpm_us /* CRT Page miss */
   949	          +us_m + us_n +us_p /* other latency */
   950	          ;
   951	
   952	        clwm = us_crt * crtc_drain_rate/(1000*1000);
   953	        clwm++; /* fixed point <= float_point - 1.  Fixes that */
   954	      } else {
   955	        crtc_drain_rate = pclk_freq * bpp/8; /* bpp * pclk/8 */
   956	
   957	        crtpagemiss = 1; /* self generating page miss */
   958	        crtpagemiss += 1; /* MA0 page miss */
   959	        if(mp_enable)
   960	            crtpagemiss += 1; /* if MA0 conflict */
   961	        cpm_us = crtpagemiss  * pagemiss *1000*1000/ mclk_freq;
   962	        us_crt =  cpm_us + us_m + us_n + us_p ;
   963	        clwm = us_crt * crtc_drain_rate/(1000*1000);
   964	        clwm++; /* fixed point <= float_point - 1.  Fixes that */
   965	
   966	  /*
   967	          //
   968	          // Another concern, only for high pclks so don't do this
   969	          // with video:
   970	          // What happens if the latency to fetch the cbs is so large that
   971	          // fifo empties.  In that case we need to have an alternate clwm value
   972	          // based off the total burst fetch
   973	          //
   974	          us_crt = (cbs * 1000 * 1000)/ (8*width)/mclk_freq ;
   975	          us_crt = us_crt + us_m + us_n + us_p + (4 * 1000 * 1000)/mclk_freq;
   976	          clwm_mt = us_crt * crtc_drain_rate/(1000*1000);
   977	          clwm_mt ++;
   978	          if(clwm_mt > clwm)
   979	              clwm = clwm_mt;
   980	  */
   981	          /* Finally, a heuristic check when width == 64 bits */
   982	          if(width == 1){
   983	              nvclk_fill = nvclk_freq * 8;
   984	              if(crtc_drain_rate * 100 >= nvclk_fill * 102)
   985	                      clwm = 0xfff; /*Large number to fail */
   986	
   987	              else if(crtc_drain_rate * 100  >= nvclk_fill * 98) {
   988	                  clwm = 1024;
   989	                  cbs = 512;
   990	              }
   991	          }
   992	      }
   993	
   994	
   995	      /*
   996	        Overfill check:
   997	
   998	        */
   999	
  1000	      clwm_rnd_down = ((int)clwm/8)*8;
  1001	      if (clwm_rnd_down < clwm)
  1002	          clwm += 8;
  1003	
  1004	      m1 = clwm + cbs -  1024; /* Amount of overfill */
  1005	      m2us = us_pipe_min + us_min_mclk_extra;
  1006	
  1007	      /* pclk cycles to drain */
  1008	      p1clk = m2us * pclk_freq/(1000*1000); 
  1009	      p2 = p1clk * bpp / 8; /* bytes drained. */
  1010	
  1011	      if((p2 < m1) && (m1 > 0)) {
  1012	          fifo->valid = 0;
  1013	          found = 0;
  1014	          if(min_mclk_extra == 0)   {
  1015	            if(cbs <= 32) {
  1016	              found = 1; /* Can't adjust anymore! */
  1017	            } else {
  1018	              cbs = cbs/2;  /* reduce the burst size */
  1019	            }
  1020	          } else {
  1021	            min_mclk_extra--;
  1022	          }
  1023	      } else {
  1024	        if (clwm > 1023){ /* Have some margin */
  1025	          fifo->valid = 0;
  1026	          found = 0;
  1027	          if(min_mclk_extra == 0)   
  1028	              found = 1; /* Can't adjust anymore! */
  1029	          else 
  1030	              min_mclk_extra--;
  1031	        }
  1032	      }
  1033	
  1034	      if(clwm < (1024-cbs+8)) clwm = 1024-cbs+8;
  1035	      data = (int)(clwm);
  1036	      /*  printf("CRT LWM: %f bytes, prog: 0x%x, bs: 256\n", clwm, data ); */
  1037	      fifo->graphics_lwm = data;   fifo->graphics_burst_size = cbs;
  1038	
  1039	      /*  printf("VID LWM: %f bytes, prog: 0x%x, bs: %d\n, ", vlwm, data, vbs ); */
  1040	      fifo->video_lwm = 1024;  fifo->video_burst_size = 512;
  1041	    }
  1042	}
  1043	static void nv10UpdateArbitrationSettings
  1044	(
  1045	    unsigned      VClk, 
  1046	    unsigned      pixelDepth, 
  1047	    unsigned     *burst,
  1048	    unsigned     *lwm,
  1049	    RIVA_HW_INST *chip
  1050	)
  1051	{
  1052	    nv10_fifo_info fifo_data;
  1053	    nv10_sim_state sim_data;
  1054	    unsigned int M, N, P, pll, MClk, NVClk, cfg1;
  1055	
  1056	    pll = NV_RD32(&chip->PRAMDAC0[0x00000504/4], 0);
  1057	    M = (pll >> 0)  & 0xFF; N = (pll >> 8)  & 0xFF; P = (pll >> 16) & 0x0F;
  1058	    MClk  = (N * chip->CrystalFreqKHz / M) >> P;
  1059	    pll = NV_RD32(&chip->PRAMDAC0[0x00000500/4], 0);
  1060	    M = (pll >> 0)  & 0xFF; N = (pll >> 8)  & 0xFF; P = (pll >> 16) & 0x0F;
  1061	    NVClk  = (N * chip->CrystalFreqKHz / M) >> P;
  1062	    cfg1 = NV_RD32(&chip->PFB[0x00000204/4], 0);
  1063	    sim_data.pix_bpp        = (char)pixelDepth;
  1064	    sim_data.enable_video   = 0;
  1065	    sim_data.enable_mp      = 0;
  1066	    sim_data.memory_type    = (NV_RD32(&chip->PFB[0x00000200/4], 0) & 0x01) ?
  1067		1 : 0;
  1068	    sim_data.memory_width   = (NV_RD32(&chip->PEXTDEV[0x00000000/4], 0) & 0x10) ?
  1069		128 : 64;
  1070	    sim_data.mem_latency    = (char)cfg1 & 0x0F;
  1071	    sim_data.mem_aligned    = 1;
  1072	    sim_data.mem_page_miss  = (char)(((cfg1 >> 4) &0x0F) + ((cfg1 >> 31) & 0x01));
  1073	    sim_data.gr_during_vid  = 0;
  1074	    sim_data.pclk_khz       = VClk;
  1075	    sim_data.mclk_khz       = MClk;
  1076	    sim_data.nvclk_khz      = NVClk;
  1077	    nv10CalcArbitration(&fifo_data, &sim_data);
  1078	    if (fifo_data.valid)
  1079	    {
  1080	        int  b = fifo_data.graphics_burst_size >> 4;
  1081	        *burst = 0;
  1082	        while (b >>= 1)
  1083		    (*burst)++;
  1084	        *lwm   = fifo_data.graphics_lwm >> 3;
  1085	    }
  1086	}
  1087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
