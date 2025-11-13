Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3DC55B33
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031C410E1EF;
	Thu, 13 Nov 2025 04:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ba2Sipha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EB010E1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763009489; x=1794545489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qq9EYIVJ3Tncasnn1UTSERO1iZT9ZPhsPZrFE8rSO+g=;
 b=ba2SiphanIQSLLEYT6Z5q02feeIuvfS9J0gbivsA0e1qvsWnb+KkTIKK
 eFzODK9MNoqTIgzWbvz09FUSfzGdHt+W2z3fdOTgIExJjDcOwq2HPf5VV
 VZGfAOM5l46dxnkpwPka0+v3P1Rqx/+TXB+tBgXXXd/u8J07pnz/iWNhf
 Vy+0nOYTi2P4jP1SFGzdvQRKATNuSAaLvJzh/VTZH08jp9e/ztdxzZB8I
 s4xH5FNFXI17EN3bEQUD9rXhHtMmKe14kIPatb0hiQyioVDNQcdCOCRCA
 HVXS8SWOM5SL+v9K89wwUM6rql+8dS1aal0dEJOD3xbCehym/9ptyZwQ/ Q==;
X-CSE-ConnectionGUID: FZ0QWBuaS9qb/CfCA8cmzw==
X-CSE-MsgGUID: Jmm1jrt9TnG+uuSv3Xncrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008635"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65008635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 20:51:28 -0800
X-CSE-ConnectionGUID: EyZILhKdS5u4MltFhc7Aiw==
X-CSE-MsgGUID: upuRXUuxTLyWjRI+sgT0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194586243"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2025 20:51:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vJPIk-0004tL-3A;
 Thu, 13 Nov 2025 04:51:18 +0000
Date: Thu, 13 Nov 2025 12:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Corey Minyard <corey@minyard.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 19/21] scsi: fnic: Switch to use %ptS
Message-ID: <202511130449.Q1mCZRpT-lkp@intel.com>
References: <20251111122735.880607-20-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111122735.880607-20-andriy.shevchenko@linux.intel.com>
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on ceph-client/testing]
[also build test ERROR on ceph-client/for-linus cminyard-ipmi/for-next mkp-scsi/for-next jejb-scsi/for-next linus/master v6.18-rc5 next-20251112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/lib-vsprintf-Add-specifier-for-printing-struct-timespec64/20251111-203105
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20251111122735.880607-20-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 19/21] scsi: fnic: Switch to use %ptS
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251113/202511130449.Q1mCZRpT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130449.Q1mCZRpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130449.Q1mCZRpT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/fnic/fnic_trace.c:234:2: error: cannot take the address of an rvalue of type 'struct timespec64'
     234 |         &timespec64_sub(val1, stats->stats_timestamps.last_reset_time),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/fnic/fnic_trace.c:235:2: error: cannot take the address of an rvalue of type 'struct timespec64'
     235 |         &timespec64_sub(val1, stats->stats_timestamps.last_read_time));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +234 drivers/scsi/fnic/fnic_trace.c

   198	
   199	/*
   200	 * fnic_get_stats_data - Copy fnic stats buffer to a memory file
   201	 * @fnic_dbgfs_t: pointer to debugfs fnic stats buffer
   202	 *
   203	 * Description:
   204	 * This routine gathers the fnic stats debugfs data from the fnic_stats struct
   205	 * and dumps it to stats_debug_info.
   206	 *
   207	 * Return Value:
   208	 * This routine returns the amount of bytes that were dumped into
   209	 * stats_debug_info
   210	 */
   211	int fnic_get_stats_data(struct stats_debug_info *debug,
   212				struct fnic_stats *stats)
   213	{
   214		int len = 0;
   215		int buf_size = debug->buf_size;
   216		struct timespec64 val1, val2;
   217		int i = 0;
   218	
   219		ktime_get_real_ts64(&val1);
   220		len = scnprintf(debug->debug_buffer + len, buf_size - len,
   221			"------------------------------------------\n"
   222			 "\t\tTime\n"
   223			"------------------------------------------\n");
   224	
   225		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   226			"Current time :          [%ptSp]\n"
   227			"Last stats reset time:  [%ptSp]\n"
   228			"Last stats read time:   [%ptSp]\n"
   229			"delta since last reset: [%ptSp]\n"
   230			"delta since last read:  [%ptSp]\n",
   231		&val1,
   232		&stats->stats_timestamps.last_reset_time,
   233		&stats->stats_timestamps.last_read_time,
 > 234		&timespec64_sub(val1, stats->stats_timestamps.last_reset_time),
   235		&timespec64_sub(val1, stats->stats_timestamps.last_read_time));
   236	
   237		stats->stats_timestamps.last_read_time = val1;
   238	
   239		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   240			  "------------------------------------------\n"
   241			  "\t\tIO Statistics\n"
   242			  "------------------------------------------\n");
   243		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   244			  "Number of Active IOs: %lld\nMaximum Active IOs: %lld\n"
   245			  "Number of IOs: %lld\nNumber of IO Completions: %lld\n"
   246			  "Number of IO Failures: %lld\nNumber of IO NOT Found: %lld\n"
   247			  "Number of Memory alloc Failures: %lld\n"
   248			  "Number of IOREQ Null: %lld\n"
   249			  "Number of SCSI cmd pointer Null: %lld\n"
   250	
   251			  "\nIO completion times: \n"
   252			  "            < 10 ms : %lld\n"
   253			  "     10 ms - 100 ms : %lld\n"
   254			  "    100 ms - 500 ms : %lld\n"
   255			  "    500 ms -   5 sec: %lld\n"
   256			  "     5 sec -  10 sec: %lld\n"
   257			  "    10 sec -  30 sec: %lld\n"
   258			  "            > 30 sec: %lld\n",
   259			  (u64)atomic64_read(&stats->io_stats.active_ios),
   260			  (u64)atomic64_read(&stats->io_stats.max_active_ios),
   261			  (u64)atomic64_read(&stats->io_stats.num_ios),
   262			  (u64)atomic64_read(&stats->io_stats.io_completions),
   263			  (u64)atomic64_read(&stats->io_stats.io_failures),
   264			  (u64)atomic64_read(&stats->io_stats.io_not_found),
   265			  (u64)atomic64_read(&stats->io_stats.alloc_failures),
   266			  (u64)atomic64_read(&stats->io_stats.ioreq_null),
   267			  (u64)atomic64_read(&stats->io_stats.sc_null),
   268			  (u64)atomic64_read(&stats->io_stats.io_btw_0_to_10_msec),
   269			  (u64)atomic64_read(&stats->io_stats.io_btw_10_to_100_msec),
   270			  (u64)atomic64_read(&stats->io_stats.io_btw_100_to_500_msec),
   271			  (u64)atomic64_read(&stats->io_stats.io_btw_500_to_5000_msec),
   272			  (u64)atomic64_read(&stats->io_stats.io_btw_5000_to_10000_msec),
   273			  (u64)atomic64_read(&stats->io_stats.io_btw_10000_to_30000_msec),
   274			  (u64)atomic64_read(&stats->io_stats.io_greater_than_30000_msec));
   275	
   276		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   277				"------------------------------------------\n"
   278				"\t\tIO Queues and cumulative IOs\n"
   279				"------------------------------------------\n");
   280	
   281		for (i = 0; i < FNIC_MQ_MAX_QUEUES; i++) {
   282			len += scnprintf(debug->debug_buffer + len, buf_size - len,
   283					"Q:%d -> %lld\n", i, (u64)atomic64_read(&stats->io_stats.ios[i]));
   284		}
   285	
   286		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   287			  "\nCurrent Max IO time : %lld\n",
   288			  (u64)atomic64_read(&stats->io_stats.current_max_io_time));
   289	
   290		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   291			  "\n------------------------------------------\n"
   292			  "\t\tAbort Statistics\n"
   293			  "------------------------------------------\n");
   294	
   295		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   296			  "Number of Aborts: %lld\n"
   297			  "Number of Abort Failures: %lld\n"
   298			  "Number of Abort Driver Timeouts: %lld\n"
   299			  "Number of Abort FW Timeouts: %lld\n"
   300			  "Number of Abort IO NOT Found: %lld\n"
   301	
   302			  "Abort issued times: \n"
   303			  "            < 6 sec : %lld\n"
   304			  "     6 sec - 20 sec : %lld\n"
   305			  "    20 sec - 30 sec : %lld\n"
   306			  "    30 sec - 40 sec : %lld\n"
   307			  "    40 sec - 50 sec : %lld\n"
   308			  "    50 sec - 60 sec : %lld\n"
   309			  "            > 60 sec: %lld\n",
   310	
   311			  (u64)atomic64_read(&stats->abts_stats.aborts),
   312			  (u64)atomic64_read(&stats->abts_stats.abort_failures),
   313			  (u64)atomic64_read(&stats->abts_stats.abort_drv_timeouts),
   314			  (u64)atomic64_read(&stats->abts_stats.abort_fw_timeouts),
   315			  (u64)atomic64_read(&stats->abts_stats.abort_io_not_found),
   316			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_0_to_6_sec),
   317			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_6_to_20_sec),
   318			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_20_to_30_sec),
   319			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_30_to_40_sec),
   320			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_40_to_50_sec),
   321			  (u64)atomic64_read(&stats->abts_stats.abort_issued_btw_50_to_60_sec),
   322			  (u64)atomic64_read(&stats->abts_stats.abort_issued_greater_than_60_sec));
   323	
   324		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   325			  "\n------------------------------------------\n"
   326			  "\t\tTerminate Statistics\n"
   327			  "------------------------------------------\n");
   328	
   329		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   330			  "Number of Terminates: %lld\n"
   331			  "Maximum Terminates: %lld\n"
   332			  "Number of Terminate Driver Timeouts: %lld\n"
   333			  "Number of Terminate FW Timeouts: %lld\n"
   334			  "Number of Terminate IO NOT Found: %lld\n"
   335			  "Number of Terminate Failures: %lld\n",
   336			  (u64)atomic64_read(&stats->term_stats.terminates),
   337			  (u64)atomic64_read(&stats->term_stats.max_terminates),
   338			  (u64)atomic64_read(&stats->term_stats.terminate_drv_timeouts),
   339			  (u64)atomic64_read(&stats->term_stats.terminate_fw_timeouts),
   340			  (u64)atomic64_read(&stats->term_stats.terminate_io_not_found),
   341			  (u64)atomic64_read(&stats->term_stats.terminate_failures));
   342	
   343		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   344			  "\n------------------------------------------\n"
   345			  "\t\tReset Statistics\n"
   346			  "------------------------------------------\n");
   347	
   348		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   349			  "Number of Device Resets: %lld\n"
   350			  "Number of Device Reset Failures: %lld\n"
   351			  "Number of Device Reset Aborts: %lld\n"
   352			  "Number of Device Reset Timeouts: %lld\n"
   353			  "Number of Device Reset Terminates: %lld\n"
   354			  "Number of FW Resets: %lld\n"
   355			  "Number of FW Reset Completions: %lld\n"
   356			  "Number of FW Reset Failures: %lld\n"
   357			  "Number of Fnic Reset: %lld\n"
   358			  "Number of Fnic Reset Completions: %lld\n"
   359			  "Number of Fnic Reset Failures: %lld\n",
   360			  (u64)atomic64_read(&stats->reset_stats.device_resets),
   361			  (u64)atomic64_read(&stats->reset_stats.device_reset_failures),
   362			  (u64)atomic64_read(&stats->reset_stats.device_reset_aborts),
   363			  (u64)atomic64_read(&stats->reset_stats.device_reset_timeouts),
   364			  (u64)atomic64_read(
   365				  &stats->reset_stats.device_reset_terminates),
   366			  (u64)atomic64_read(&stats->reset_stats.fw_resets),
   367			  (u64)atomic64_read(&stats->reset_stats.fw_reset_completions),
   368			  (u64)atomic64_read(&stats->reset_stats.fw_reset_failures),
   369			  (u64)atomic64_read(&stats->reset_stats.fnic_resets),
   370			  (u64)atomic64_read(
   371				  &stats->reset_stats.fnic_reset_completions),
   372			  (u64)atomic64_read(&stats->reset_stats.fnic_reset_failures));
   373	
   374		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   375			  "\n------------------------------------------\n"
   376			  "\t\tFirmware Statistics\n"
   377			  "------------------------------------------\n");
   378	
   379		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   380			  "Number of Active FW Requests %lld\n"
   381			  "Maximum FW Requests: %lld\n"
   382			  "Number of FW out of resources: %lld\n"
   383			  "Number of FW IO errors: %lld\n",
   384			  (u64)atomic64_read(&stats->fw_stats.active_fw_reqs),
   385			  (u64)atomic64_read(&stats->fw_stats.max_fw_reqs),
   386			  (u64)atomic64_read(&stats->fw_stats.fw_out_of_resources),
   387			  (u64)atomic64_read(&stats->fw_stats.io_fw_errs));
   388	
   389		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   390			  "\n------------------------------------------\n"
   391			  "\t\tVlan Discovery Statistics\n"
   392			  "------------------------------------------\n");
   393	
   394		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   395			  "Number of Vlan Discovery Requests Sent %lld\n"
   396			  "Vlan Response Received with no FCF VLAN ID: %lld\n"
   397			  "No solicitations recvd after vlan set, expiry count: %lld\n"
   398			  "Flogi rejects count: %lld\n",
   399			  (u64)atomic64_read(&stats->vlan_stats.vlan_disc_reqs),
   400			  (u64)atomic64_read(&stats->vlan_stats.resp_withno_vlanID),
   401			  (u64)atomic64_read(&stats->vlan_stats.sol_expiry_count),
   402			  (u64)atomic64_read(&stats->vlan_stats.flogi_rejects));
   403	
   404		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   405			  "\n------------------------------------------\n"
   406			  "\t\tOther Important Statistics\n"
   407			  "------------------------------------------\n");
   408	
   409		jiffies_to_timespec64(stats->misc_stats.last_isr_time, &val1);
   410		jiffies_to_timespec64(stats->misc_stats.last_ack_time, &val2);
   411	
   412		len += scnprintf(debug->debug_buffer + len, buf_size - len,
   413			  "Last ISR time: %llu (%ptSp)\n"
   414			  "Last ACK time: %llu (%ptSp)\n"
   415			  "Max ISR jiffies: %llu\n"
   416			  "Max ISR time (ms) (0 denotes < 1 ms): %llu\n"
   417			  "Corr. work done: %llu\n"
   418			  "Number of ISRs: %lld\n"
   419			  "Maximum CQ Entries: %lld\n"
   420			  "Number of ACK index out of range: %lld\n"
   421			  "Number of data count mismatch: %lld\n"
   422			  "Number of FCPIO Timeouts: %lld\n"
   423			  "Number of FCPIO Aborted: %lld\n"
   424			  "Number of SGL Invalid: %lld\n"
   425			  "Number of Copy WQ Alloc Failures for ABTs: %lld\n"
   426			  "Number of Copy WQ Alloc Failures for Device Reset: %lld\n"
   427			  "Number of Copy WQ Alloc Failures for IOs: %lld\n"
   428			  "Number of no icmnd itmf Completions: %lld\n"
   429			  "Number of Check Conditions encountered: %lld\n"
   430			  "Number of QUEUE Fulls: %lld\n"
   431			  "Number of rport not ready: %lld\n"
   432			 "Number of receive frame errors: %lld\n"
   433			 "Port speed (in Mbps): %lld\n",
   434			  (u64)stats->misc_stats.last_isr_time,
   435			  &val1,
   436			  (u64)stats->misc_stats.last_ack_time,
   437			  &val2,
   438			  (u64)atomic64_read(&stats->misc_stats.max_isr_jiffies),
   439			  (u64)atomic64_read(&stats->misc_stats.max_isr_time_ms),
   440			  (u64)atomic64_read(&stats->misc_stats.corr_work_done),
   441			  (u64)atomic64_read(&stats->misc_stats.isr_count),
   442			  (u64)atomic64_read(&stats->misc_stats.max_cq_entries),
   443			  (u64)atomic64_read(&stats->misc_stats.ack_index_out_of_range),
   444			  (u64)atomic64_read(&stats->misc_stats.data_count_mismatch),
   445			  (u64)atomic64_read(&stats->misc_stats.fcpio_timeout),
   446			  (u64)atomic64_read(&stats->misc_stats.fcpio_aborted),
   447			  (u64)atomic64_read(&stats->misc_stats.sgl_invalid),
   448			  (u64)atomic64_read(
   449				  &stats->misc_stats.abts_cpwq_alloc_failures),
   450			  (u64)atomic64_read(
   451				  &stats->misc_stats.devrst_cpwq_alloc_failures),
   452			  (u64)atomic64_read(&stats->misc_stats.io_cpwq_alloc_failures),
   453			  (u64)atomic64_read(&stats->misc_stats.no_icmnd_itmf_cmpls),
   454			  (u64)atomic64_read(&stats->misc_stats.check_condition),
   455			  (u64)atomic64_read(&stats->misc_stats.queue_fulls),
   456			  (u64)atomic64_read(&stats->misc_stats.tport_not_ready),
   457			  (u64)atomic64_read(&stats->misc_stats.frame_errors),
   458			  (u64)atomic64_read(&stats->misc_stats.port_speed_in_mbps));
   459	
   460		return len;
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
