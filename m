Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F299DC62
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 04:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D1A10E126;
	Tue, 15 Oct 2024 02:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYFRSHme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7212210E126
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 02:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728960278; x=1760496278;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=kwMpNci2k4quHUBY0DxtcWqkYR3X8FqluSWQqHIEOkU=;
 b=UYFRSHmeeAOt0tnM5fcFO1OnFQLyms2qfjNgDxgYBhh1AFoSMXkMCA7R
 km3IKmEAyjBXguGEAZ8vUVsFHwkwc8DqKro4rZB4Gld5rZJffEE5L+4be
 XJQ6cq8EwLU4NGJ3QZ+dgVD0+T8giYcICxnnV2EnqHO/89U8KUZA/YIsn
 rG563hYBm1I6Zj5NUv21dWTF763BGvVRUDtmh7IgwQ3JLAQu3HnWsihwL
 2TTEDzujal/4W8R4QJO+Qofw+Q/cysFVUXHf7XwBwHz80+U1ZyoDNK2a4
 JYbXzoWACW7UMDMgBbm0kN/6dlTAvtJGPIhgqkSVIdkik8bC8yxszS6zq Q==;
X-CSE-ConnectionGUID: V7ptIm5WRfKycD+JxGBXcQ==
X-CSE-MsgGUID: ZLGGsxLcSCuziL/Q7hTjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28421032"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28421032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 19:44:37 -0700
X-CSE-ConnectionGUID: LiebxSTKSnOuzrxJNj0WqA==
X-CSE-MsgGUID: WkFGO8NmRVyFRZwYk5V5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="78184959"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 19:44:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 19:44:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 19:44:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 19:44:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 19:44:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 19:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4RFF8OXHYZkGN7s6HPMcZ2Mp1MooyrnnTcbesu8r5oQXyrXkGVR5sHt67TfanTWXby069F5/CGpOCzn/rxaBl8bSMFv4J1MR594okzqOH7HX1vbAIwcNnwvzNeyrj1ffzooYcvpuGGTwRRg9HC9xnykk0CxR+S1/3Wq/bj4BW/RhxMdzU3Ju7D+BSWA37fjdgLVzY5TTFgOdF08DAX1KB8/dNnDHxYcvtYtEZWha3iWyWRclnhF2ybe1/ZFaIB6TdFPTtGB0cm7XnfIuQiLd1P18xhluIj1jJS2dT+QFBKHWog8SOrI81gtWPfTExZXDNnm3zaT2F9AfMpMlzGNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlcgBCfq/Frxl1jXDJhC9aUcQaDbUU7MyW/AICKbp4Q=;
 b=WC/3JJh29Ga4WIw9aKNGAc9wjlJ7i4jQfpsSZktDWrA5inJvZMIN6Fsjg44IINnB42ATCJL8NyBc7RRhusdR16MUBYc6xdxggefj1z3yowmaRhmypFuz7a1Cx6D9I7gCjhAW6s4z3jUr0RvxcULwfLYPvgx11yHLCJqspg674KafH1t4digt03lE2/STrDE6iqY5akZ8BH7cwwIHiAf03eWC+LeLbf9coxkGORUKdfOLnmEKHOZPhREyV8Ia2rTxSZNCf9NvyAot313CwrlPa1p2jfQM0msCI2d3wXDeg5TxPAYwnivz5yS6SH+1vm6di1ZggrP25wzceD7tECPJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 02:44:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 02:44:33 +0000
Date: Tue, 15 Oct 2024 10:44:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jocelyn Falempe
 <jfalempe@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linux-next:master] [drm/ast]  4e29cc7c5c:
 WARNING:at_drivers/gpu/drm/ast/ast_dp.c:#ast_dp_set_enable[ast]
Message-ID: <202410151028.f9a3ee37-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: e47a96fb-dcc7-49a5-9de3-08dcecc34cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i9OKghPkLmRWILxOqmNOFa2Wq+FKU1NVaEiRqCLPHNK5ubOd1M+4/IvVzFrq?=
 =?us-ascii?Q?D8n4yOchaZw5AbPqezsuLQElBqFZmxhBnmR+3leUZ5pbnTHXhfU6hOhZrDCv?=
 =?us-ascii?Q?2QnvUHDqvw8OMGWCBZ0jSXW7XJ31inM9u6xvlMr2CZJtHqynayjevH2iNCJF?=
 =?us-ascii?Q?PH7+Y17JdtkCaQffbAEZzF1C/Gb6MT5tXve0euAxSm5y0Qxwz1yIPv8Hhb+O?=
 =?us-ascii?Q?8e48Yn9WO9Wr6+qXAyWZ+WEPkvG/gVZf89Qvvpk3R7RiBZQSkMMVNJg8kyl5?=
 =?us-ascii?Q?epmr7lmVuZBFRf4LkFdSoIjhvPW+7X0Z4SBc1ltDOU1tYt1ku0GpmSa3dUKo?=
 =?us-ascii?Q?V703+qPPcEqKRz7th4U2hvJyvQCGsCTWlZJzhf4JSkmvEjDLZuAu+z2mzBto?=
 =?us-ascii?Q?ExQHUmrEbC0tHYnl5Xm2ZhwZxCsJA8X5PfQfwdC3MrEXsIjSPEjRN3VzGjE3?=
 =?us-ascii?Q?RagwosLbCbc3tF8DDDr8QLqhjutw3wMl0evWdNtRX5pdEsN5CoOZNBI1pyQG?=
 =?us-ascii?Q?gD628nzmj19+RUZr5juWAzsN6Bw7w6+ZhrU+RFhwYyQvDSD3vZip1rRYIXvT?=
 =?us-ascii?Q?a/wC1dcJlwkL+ryJadRE9L8y+Gj4tYdLF8Nyb1EAILzngYkDpXV3UaIhxa/9?=
 =?us-ascii?Q?pi0vrTD2s+AoC6wKE4kKsz+m6ZRnKcbxHCAZvigz58ak4pW3uOdZdVT7GTiI?=
 =?us-ascii?Q?4oz1192GOmRv2qwJSkjlEEiBIdjosXkREbK2MrXReuaOb/be06spbityf0jQ?=
 =?us-ascii?Q?5ss7PF6QCIfD7p3VN3xXJmx95cOwJIkPQyp7PpG2aGQqg7l0V6pzI6gy46vs?=
 =?us-ascii?Q?G+VAR8oMGQcwLN68ifMjaaqJ4GVZVt5wKmjwufOUctuESWgLKmD7mreJqPFa?=
 =?us-ascii?Q?fNSj21a0sJrArTZqd83QiS+W+RvqTWR9errk0VYXa3fa9CxvcNO/uzTpUZ4G?=
 =?us-ascii?Q?xt/n5Yf8VGmlHjH3k71v/rt3DiasrHOpdyS3Zo8EHiIMJ+jBE7wZHo9cPH4m?=
 =?us-ascii?Q?fCImFkoPEP1crnLKzGh0nJoQ84F3iuXNkNQEVnkCSZiGlm99LmCkYEQ6nXxq?=
 =?us-ascii?Q?HunVB7agSG8pf94MCPw1jpex0OmwL7eVyacHcqpHULFG3fSmASHjCjrttuSE?=
 =?us-ascii?Q?ANlzjF3zAQfF7nnG8acYUmNr2tvWpp/XNBmEqTAX4PuX74HQDEmet8W+QGva?=
 =?us-ascii?Q?oYzKxx/IYgL0MeAXA+f8qqjq8VS73oGoGtNVhv6fdK1vFfebe/kkzRhfGLM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkbk3RZYlzIhrs0Sm1coxwa8INoOC61jLHLKqAyWcQTyy6RH41nOaLMHS0zQ?=
 =?us-ascii?Q?6GIh43oPWbXb0+MwTLMv5V7duJ0f/vODwNE0HQ/3vgCq+Wv4AZ5VSYqqjJcx?=
 =?us-ascii?Q?VMKg/EOzAGFtcJpOeT9in6fV4dW7l0XRDIzwablB8g5CkY40A3dIDxX2wyJm?=
 =?us-ascii?Q?cQPEOgrI6ZtSMvMgQFwz8sgVxiigWWcnRVUhqfnGSJPXABzK8Owl5dSz1AaR?=
 =?us-ascii?Q?VcBmZp7zHYmyUQ1MYjnLTAx47SbNDX6XKCwIoo1aOMNJeS8+kTXfFfvLkwMd?=
 =?us-ascii?Q?/TManFcO1Mnqi4yYAgQr3BIn1fgB3M7gA3ao+etKqRWHahjzpV4Y5VCtsvgy?=
 =?us-ascii?Q?pJzCrFZWYwhrz04PdjEq5AcmdL93QTRKSMESlnnnEDaknAdOTYKl4Xfkavdj?=
 =?us-ascii?Q?Rzi7d3kD6OHmVuA2TM1A+EiAKcIQumpV8a9GbEe2+awnrXGmVTfppC16mSiy?=
 =?us-ascii?Q?KuPIrdiFPkzzZX045FHNRxofV6C5nuiZIbsVM1uO0PcH50vlXZKKytGS64Ju?=
 =?us-ascii?Q?PIki6lM4mO1+w9xkyIH0K+uGLNfEwlXhU7oF6JDKSoSnmeTUkimOfZsNel+m?=
 =?us-ascii?Q?/6/6bP+nG+1b2ggA5y2OfEDUn7wjKOnq5MxwlxNA/YpmkfVJXsMLiVJz4CTI?=
 =?us-ascii?Q?6DMaaOpObOL6BtixBhPyQMz7syF8TnjnjBX1NlDsmxR68M2TG3E1+j5AX8gD?=
 =?us-ascii?Q?uzV1R7L5f1tMMcSrpk0jWt+yEoySMbG+QQLRB7dSLwZCuT3tQgCBwklQMyBW?=
 =?us-ascii?Q?xlO76amn8PAugQ2FhtxqWTq7ZTNLB59sjhsGvSENV/vQQjecqiIHgokjRwJY?=
 =?us-ascii?Q?VItfE0nTfXQTEAn7+yZ+uSLxzscKr6eOaV3z356YFQuziE0//iKr3A33csg6?=
 =?us-ascii?Q?wFg7hWa5uhy0zDrisU7iZZYl3/fibE6orsmyo/1zx4t+7EkMzl30G+eiYEXQ?=
 =?us-ascii?Q?7/Vmqy5CSYPoqFfA5t323gB8XcAThGHF7kiGmNAMW1iwOWrIxSm5lRNITr28?=
 =?us-ascii?Q?nqwPrb76SzojVO7UeE7kUOQrwIktjcx5VUl/B6Kt5k4mUH0/KQffhfJJlJ68?=
 =?us-ascii?Q?0gmQJ03Ls4IUwWL26LHHSWG3/zNM0CX06rN8cnFN4Cj8vcegnzxum8kMIniF?=
 =?us-ascii?Q?a9S/YxJn8NtTHPZJ7uQ2Iv7stK2FTp3kqc2O7GJJ4O1IqqnkfghuLavLAzS4?=
 =?us-ascii?Q?CJ60yGKkUC/YpCMSmLP2cWrKlVwvlK7mdh3n13Pr7JUVT1XfqqcfeGnIasnd?=
 =?us-ascii?Q?VgaaolnrDbkMzf6J9cV1uvbjXp7AFC2SVLxay4rRG5UwXzMWqwdsrskinlmW?=
 =?us-ascii?Q?zxn+5bg7fPdlKm5lqZWwefBvioQCwc4rU40l0GN3C3mwUUFRvdZ1G+3Ko4Ms?=
 =?us-ascii?Q?JpOsFL6FyoStcX0e9tixHKTyUQxcBazoj+BYy2HsO9C2FGw3Hkb66BW+gmC4?=
 =?us-ascii?Q?h8GQDBFmv7XHGFkrxCcHeiDZqKQd1oGr4G0Gg9ckWpluu8mcknH9/G9bBZky?=
 =?us-ascii?Q?j5w55UyTeVqacYI33HhLi5nP8k+XABLheISC5648scwWi0DwTnFoGc8KSUeo?=
 =?us-ascii?Q?u6n9fyQVSrWwhNnebSsokSwG/Cp+u7YcaeJsHtccjgYEiq87UZAr5Pe8jFXn?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e47a96fb-dcc7-49a5-9de3-08dcecc34cbc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 02:44:33.3041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCbUlieQUU83PgNDuSuWVEZ649JnNqc21cEOpNhblZsC7TEEhYQWzM2to5nVPxxk8exHxSZrWgxkeR5ZEvEStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
X-OriginatorOrg: intel.com
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



Hello,

kernel test robot noticed "WARNING:at_drivers/gpu/drm/ast/ast_dp.c:#ast_dp_set_enable[ast]" on:

commit: 4e29cc7c5c673299cfbaf4982fc8b6a72c9f706f ("drm/ast: astdp: Replace ast_dp_set_on_off()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master d61a00525464bfc5fe92c6ad713350988e492b88]

in testcase: lkvs
version: lkvs-x86_64-8e3b482-1_20241008
with following parameters:

	test: rapl-server



config: x86_64-rhel-8.3-func
compiler: gcc-12
test machine: 384 threads 4 sockets GENUINE INTEL(R) XEON(R) (Granite Rapids) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410151028.f9a3ee37-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241015/202410151028.f9a3ee37-lkp@intel.com



kern  :err   : [  234.161306] ast 0000:2d:00.0: [drm] *ERROR* Link training failed
kern  :warn  : [  234.375338] ------------[ cut here ]------------
kern  :warn  : [  234.375347] ast 0000:2d:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
kern  :warn  : [  234.375489] WARNING: CPU: 0 PID: 8 at drivers/gpu/drm/ast/ast_dp.c:221 ast_dp_set_enable+0x153/0x1c0 [ast]
kern  :warn  : [  234.375541] Modules linked in: intel_uncore_frequency_tpmi ast(+) nvme intel_uncore_frequency_common intel_cstate intel_vsec_tpmi drm_shmem_helper intel_uncore dax_hmem drm_kms_helper qat_4xxx intel_th_gth nvme_core intel_qat dh_generic idxd intel_th_pci crc8 i2c_i801 intel_vsec i2c_smbus intel_th authenc idxd_bus wmi ipmi_ssif joydev acpi_ipmi ipmi_si ipmi_devintf ipmi_msghandler binfmt_misc loop fuse drm dm_mod ip_tables
kern  :warn  : [  234.375610] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.11.0-rc7-01434-g4e29cc7c5c67 #1
kern  :warn  : [  234.375622] Workqueue: events work_for_cpu_fn
kern  :warn  : [  234.375657] RIP: 0010:ast_dp_set_enable+0x153/0x1c0 [ast]
kern  :warn  : [  234.375667] Code: 48 8b 6b 50 48 85 ed 74 32 48 89 df e8 f6 73 1f bd 48 c7 c1 20 e4 80 c5 48 89 ea 48 c7 c7 80 e4 80 c5 48 89 c6 e8 6d a2 9e bb <0f> 0b 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 b8 00 00 00
kern  :warn  : [  234.375675] RSP: 0018:ffa0000000f87480 EFLAGS: 00010286
kern  :warn  : [  234.375684] RAX: 0000000000000000 RBX: ff110910893960c8 RCX: 0000000000000027
kern  :warn  : [  234.375687] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ff1100081d030b08
kern  :warn  : [  234.375692] RBP: ff110910898e8e40 R08: 0000000000000001 R09: ffe21c0103a06161
kern  :warn  : [  234.375696] R10: ff1100081d030b0b R11: 0000000000000016 R12: 0000000000000010
kern  :warn  : [  234.375699] R13: ff11000171490000 R14: ffe21c002e2920c4 R15: ff11000171490620
kern  :warn  : [  234.375702] FS:  0000000000000000(0000) GS:ff1100081d000000(0000) knlGS:0000000000000000
kern  :warn  : [  234.375706] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  234.375708] CR2: 00007f5f08e5e423 CR3: 000000017b5a2002 CR4: 0000000000f71ef0
kern  :warn  : [  234.375710] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kern  :warn  : [  234.375712] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
kern  :warn  : [  234.375714] PKRU: 55555554
kern  :warn  : [  234.375716] Call Trace:
kern  :warn  : [  234.375722]  <TASK>
kern  :warn  : [  234.375727]  ? __warn+0xcc/0x260
kern  :warn  : [  234.375740]  ? ast_dp_set_enable+0x153/0x1c0 [ast]
kern  :warn  : [  234.375749]  ? report_bug+0x261/0x2c0
kern  :warn  : [  234.375772]  ? handle_bug+0x3c/0x70
kern  :warn  : [  234.375789]  ? exc_invalid_op+0x17/0x40
kern  :warn  : [  234.375793]  ? asm_exc_invalid_op+0x1a/0x20
kern  :warn  : [  234.375813]  ? ast_dp_set_enable+0x153/0x1c0 [ast]
kern  :warn  : [  234.375822]  ast_astdp_encoder_helper_atomic_enable+0x215/0x280 [ast]
kern  :warn  : [  234.375831]  ? __pfx_ast_astdp_encoder_helper_atomic_enable+0x10/0x10 [ast]
kern  :warn  : [  234.375841]  drm_atomic_helper_commit_modeset_enables+0x52a/0xb20 [drm_kms_helper]
kern  :warn  : [  234.375891]  ? drm_atomic_helper_wait_for_dependencies+0x45f/0x7d0 [drm_kms_helper]
kern  :warn  : [  234.375912]  drm_atomic_helper_commit_tail+0x72/0xd0 [drm_kms_helper]
kern  :warn  : [  234.375934]  ast_mode_config_helper_atomic_commit_tail+0x44/0x60 [ast]
kern  :warn  : [  234.375945]  commit_tail+0x227/0x4b0 [drm_kms_helper]
kern  :warn  : [  234.375969]  drm_atomic_helper_commit+0x1ff/0x280 [drm_kms_helper]
kern  :warn  : [  234.375991]  ? __pfx_drm_atomic_helper_commit+0x10/0x10 [drm_kms_helper]
kern  :warn  : [  234.376014]  drm_atomic_commit+0x1ec/0x2b0 [drm]
kern  :warn  : [  234.376114]  ? __drm_atomic_helper_set_config+0x49f/0x6c0 [drm]
kern  :warn  : [  234.376164]  ? __pfx_drm_atomic_commit+0x10/0x10 [drm]
kern  :warn  : [  234.376214]  ? __pfx___drm_atomic_helper_set_config+0x10/0x10 [drm]
kern  :warn  : [  234.376263]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
kern  :warn  : [  234.376350]  ? drm_atomic_set_fb_for_plane+0x1bf/0x280 [drm]
kern  :warn  : [  234.376404]  drm_client_modeset_commit_atomic+0x528/0x680 [drm]
kern  :warn  : [  234.376460]  ? __pfx_drm_client_modeset_commit_atomic+0x10/0x10 [drm]
kern  :warn  : [  234.376517]  ? __pfx___might_resched+0x10/0x10
kern  :warn  : [  234.376534]  ? __pfx_mutex_lock+0x10/0x10
kern  :warn  : [  234.376552]  ? __pfx_mutex_lock+0x10/0x10
kern  :warn  : [  234.376556]  drm_client_modeset_commit_locked+0x125/0x440 [drm]
kern  :warn  : [  234.376616]  drm_client_modeset_commit+0x3c/0x60 [drm]
kern  :warn  : [  234.376671]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xd5/0x120 [drm_kms_helper]
kern  :warn  : [  234.376693]  drm_fb_helper_set_par+0xae/0xe0 [drm_kms_helper]
kern  :warn  : [  234.376719]  fbcon_init+0x77d/0x1760
kern  :warn  : [  234.376742]  visual_init+0x2ff/0x5e0
kern  :warn  : [  234.376771]  do_bind_con_driver+0x4b3/0xb50
kern  :warn  : [  234.376783]  ? do_register_con_driver+0x3ab/0x5b0
kern  :warn  : [  234.376788]  ? _raw_spin_lock_irqsave+0x8b/0xf0
kern  :warn  : [  234.376797]  do_take_over_console+0x37/0x50
kern  :warn  : [  234.376801]  do_fbcon_takeover+0xaa/0x1b0
kern  :warn  : [  234.376805]  fbcon_fb_registered+0x23/0x80
kern  :warn  : [  234.376809]  do_register_framebuffer+0x39d/0x710
kern  :warn  : [  234.376821]  ? __pfx_do_register_framebuffer+0x10/0x10
kern  :warn  : [  234.376824]  ? __pfx_mutex_lock+0x10/0x10
kern  :warn  : [  234.376827]  ? __pfx_mutex_unlock+0x10/0x10
kern  :warn  : [  234.376831]  register_framebuffer+0x21/0x40
kern  :warn  : [  234.376834]  __drm_fb_helper_initial_config_and_unlock+0x173/0x3e0 [drm_kms_helper]
kern  :warn  : [  234.376858]  drm_fbdev_shmem_client_hotplug+0x161/0x220 [drm_shmem_helper]
kern  :warn  : [  234.376872]  drm_client_register+0x168/0x240 [drm]
kern  :warn  : [  234.376927]  ast_pci_probe+0x2f9/0x4b0 [ast]
kern  :warn  : [  234.376941]  ? __pfx_ast_pci_probe+0x10/0x10 [ast]
kern  :warn  : [  234.376950]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
kern  :warn  : [  234.376956]  ? __schedule+0x7ec/0x1950
kern  :warn  : [  234.376972]  ? __pfx_ast_pci_probe+0x10/0x10 [ast]
kern  :warn  : [  234.376979]  local_pci_probe+0xda/0x190
kern  :warn  : [  234.376999]  ? __pfx_local_pci_probe+0x10/0x10
kern  :warn  : [  234.377002]  work_for_cpu_fn+0x52/0xa0
kern  :warn  : [  234.377006]  process_one_work+0x676/0x1000
kern  :warn  : [  234.377021]  worker_thread+0x714/0xf10
kern  :warn  : [  234.377024]  ? __pfx_worker_thread+0x10/0x10
kern  :warn  : [  234.377027]  kthread+0x2d8/0x3c0
kern  :warn  : [  234.377041]  ? __pfx_kthread+0x10/0x10
kern  :warn  : [  234.377044]  ret_from_fork+0x31/0x70
kern  :warn  : [  234.377063]  ? __pfx_kthread+0x10/0x10
kern  :warn  : [  234.377066]  ret_from_fork_asm+0x1a/0x30
kern  :warn  : [  234.377080]  </TASK>
kern  :warn  : [  234.377084] ---[ end trace 0000000000000000 ]---
kern  :info  : [  234.377496] Console: switching to colour frame buffer device 80x30
kern  :info  : [  235.421603] ast 0000:2d:00.0: [drm] fb0: astdrmfb frame buffer device

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

