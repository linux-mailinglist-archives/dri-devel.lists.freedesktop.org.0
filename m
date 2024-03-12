Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6239879F84
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 00:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877010E298;
	Tue, 12 Mar 2024 23:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNWl6sZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858F10E298;
 Tue, 12 Mar 2024 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710284853; x=1741820853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ge6ttgn3NmEwP3Qje70F9qDcEEjm33hMtnwgNcFViAc=;
 b=FNWl6sZnQeAXSPgdpoTZzYTCqBobqK6gHGPDmfI+R/MzI03uqLKZLcuq
 WBULKDhYsekhEz8syKfM60jT8wP3dF6X823LSBkTspuggsOB5fg+fiXeK
 83bzXjE/i1ZhDxh0g8rFyV3w8fENSdwF3t8TJ+hdqVGwK2TAmIOtwt6oC
 QpV8ceL+UoNIIIfkiHD0frGNsfD/O8nx7YE+4LTIRWMgL+s3HgRQlYcAM
 z0BRl/UDaje9uN9khvvplsVaqi6w1q9rTv9ohF27+8c1yauQWauuZDU/H
 geFpGhvTX6wfa+3I+vMziQEi8JBb/oV52FXaRXHv3QaYjND5cfPhVo7kz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4883016"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4883016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11634763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:07:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:07:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:07:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH+jWmVs9pw9kkutZVNErxxi3ECFU3O78BU5Pz2BEjLWLNulW/sqGpo/HH7yf4a8DcuQie+gbfgcxUSdaT22bhRq33wnHGeFYypYYK4EIkM+ecK4P++MLA0avholAiT5PNsk9P8cBzHmX8kjxcw4hSii3v0wdz69qvdMX66tvKeRJdpsEDbrxZ1d4cIa5xa61CCtPkd8qa+Il6mXYRfBB6hxm7C91r7HdpDbI9KAjLlkGiYiB0NQjANJDrAZ1K4kHWoZD3bqPdE0VHIPV4rnDnxSHLPNkQBUfq+X/+ez/0WLpKDbS8EhZVpuvV7AJLQu7EKFvj55fUwl6EcGxwITMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cqge45qn5l1wy0ZntqNidGQZsL4z3H8pUIu0vk5Y3E=;
 b=O3R4H0PsQdpMwT9T7bYZB58qc24Ulz0kHigrwZUPcWrnHAdikfQQZbC8qxb49oFLowFNpcqn5bh3vrbaM0F03K1ssg5mzecfp95CZY5AOPoJSgRMvtAKCTa0tmpe9dwJQWpRSpA/uqle8rMmwAuB7qb4rNaW05TnnYyIicv2jOxhJ34yJi66VRe+lkV/5JLUAAUCK9ShmBpUnqfmBVQY+cLUcglJsWSjWwS7V2JFJ5tWSbc8yCRSE3k5iFsz0AXNrVFy88p925RM2ccxttiZGyk6MgA7xSbZ3Ylpo2EKBfEeQOwHlVTpEUkBVMmBapZ5P5SJwbTlwZDmEJrGFEIwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 23:07:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 23:07:28 +0000
Date: Tue, 12 Mar 2024 18:07:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/i915: Drop dead code for xehpsdv
Message-ID: <hesar2gmni4blkfqul6hopyitbm375woe4utfzwuruyvfzadbb@tvotimqmi26q>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-3-lucas.demarchi@intel.com>
 <20240312225819.GN718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240312225819.GN718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:a03:54::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7522fdff-6701-497b-0389-08dc42e92fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLhIRvl/+17XuMCXZOI0gfhlKInU352i31ZekWwESzCkHW1fTUYOKunQSqNI+RyuSdoAsigXisEvdP6uJHAdVs9WzrsHQ50L/9q19BGehNKUH1UJBpteteFQcVC4M3Qnr0J3a+ao8IMHM3yCh7+KmGUrcbZtBCI3NsbNCmZI/ir2gQD25RRe9c1Q+L06V3/EJSqtN2TIFxnCqut2qrQig89zHpm0K/oe6Zw9AOYiamhB9fen7SnOrZNb6BRFkHOs0+DNi/ruBdpfI/0bF2cYVO/hVm+ah7sJ/05jHh7BbB6amX3mi7xzkntarU9J5zF4cnr+Dd+skRAgFUE1sQmcPXxCOXkMjeHV2MNiZVvollGN08PMBx6tnUxM7OHeza+4LIPnDDNyqbzBS9zNQOq/cP0QHaNMfHg775vv4/ibp+Se3bzkMIi/Z4j12AllnQl3gsR4O9nP4GggkIyhz11ofBegqfBG+Zc0bbiyWCbQA81WsWXMVgkngDXMj9pYBFdA8opqfKCmelGvmhvAXioC7HO0mvm+mDZXUv+X0Z5Cfb0g2Zav6DbaHNKVT34eFJtKm/XWSdlu00cM9FXaEYstDG+q4lzwYJ/xDb1mZ7Hk3THXq7wvwZXqf/LtMtfK4V2V85BR4mUDZECkq4b9zbEpBjTgaiGXmKBjnkTWhwXloKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGuYX/5590u7uTcEQz/4q6fz9Kpl7j0BsgTb+7oNlPfGyDuMiiLPzL8QTt5j?=
 =?us-ascii?Q?XOQLrXra92/5XAjnNCCiY9bwakk1J7XJn2oKWrH4fsBfPQozGSAOXLone9wd?=
 =?us-ascii?Q?YWTxI1VrwVmdY3qRyBpIxgMrq3+pnRT+QYom83+ar06/TLd1m7UN6VuTvheV?=
 =?us-ascii?Q?LAn5LNSKDCvgpYTXC0Sp8d1ioqHsF0wQWIvY4Olchnjoon4wn8lGB5J0G/5x?=
 =?us-ascii?Q?4Lu9ICxb4EumuT2sZve1Y4kD1APkPhFAsHz68Tv7LayG3ydOkXgWu7eO8fOP?=
 =?us-ascii?Q?uewLSnudnrjiAGPX5LI+6pB2LcByWEBGVNBlm9MradCebO2IxPxsfPvKW2kq?=
 =?us-ascii?Q?0bl+Mw+TvJWiIj2VidjVDF5vYtPr1UostGaiesDoDTYrJB285Aj2KYXOK0Ec?=
 =?us-ascii?Q?CyVs+WKKXZFGMEpJfn7IChMpERGaf2us5YQKU5X7j6jU+aKQOolCbB+LvvGQ?=
 =?us-ascii?Q?sQcLDe9cM0H58GnRyGVLRyakGkvdV8sgvFwvl7LYXhOMfbmZ4Wqf39PxBDDg?=
 =?us-ascii?Q?btrYQ48ZQyr9/pSxPQ2moDNXTJw8Wl2FwspxwjJHQojjVHhdx05+3ltD6OSS?=
 =?us-ascii?Q?jQzILxVSZMG/sE6kbLr8px/sZFKRdvFGnkMyHueXFlriDkz6gIXtHU2wpgmR?=
 =?us-ascii?Q?VJXzxS/IVaDcmkuhUkM7zcKbApiFi7QDPgfOv5d7NELY5HVVSH/UWi1i1iev?=
 =?us-ascii?Q?w5J4cuJyLrYCqB0VwzQCQ9Sn4pQTmeh3t3B3Cq+zXC141ABRzjQD4OTYaI1+?=
 =?us-ascii?Q?CKrIyIesksBQFRpcSgIfkIGO0eYYljUlCDMuSeI/uXpvzbISvWmLsTBxJjGO?=
 =?us-ascii?Q?YOgw9FnP7xEUAQm6On3rcszq5s9oxy/kQmJBPLOajzl+009cqfZfOJWA12cA?=
 =?us-ascii?Q?pMRul0Kp3UNKAoaONV7t+0La6ve1/I7dVtabnGQjzGNUz5Vv1BSLnAa+UANl?=
 =?us-ascii?Q?5Tqk9JtcbzdXtcNP1BI6mG8ZL00S4wx2aWLL1UUBb2cCzeJ6OVS3AQZ0cBOp?=
 =?us-ascii?Q?GJWg6DEHJeHbGNLtsH9iyV4HF87+lXS3eh2FN0U+CIYIRlEd7JksqNXWRFbA?=
 =?us-ascii?Q?yHn29i6nYz+un/8HLIdw216THBRpi6jNxTgbVKyix3vXGJeO3CmgLqyfHQZH?=
 =?us-ascii?Q?BkmU7SnbOvgDR9Sa8MAKerqZICR05CsU8gJCkBqjsplbOPYmU1NX76qpgTUj?=
 =?us-ascii?Q?c8+1QmzQLkn5ThgLyBbK+9iQaWLP9odAVGAhHPj/y+uVG0MW5OqdEhMN1DX7?=
 =?us-ascii?Q?PdbFOtjPSymuggg7iMII8n3sspycungoPuxt8DZJKM8Prg7+moq1/JGzXbr4?=
 =?us-ascii?Q?IN2RSk6fWRB3e6JYY49cIhk6rpbVd/EtFTY900cpt+EbKF/ixC2M7IEnOtkZ?=
 =?us-ascii?Q?YfdSEdSGe+a16B5pI07r0BWA/rLVqQ1lC1jNAYuKbquu3I8cQHSH8pFBRRDU?=
 =?us-ascii?Q?xEwMIdDQV8QTNLNpBIRLWEYObP9SMAXSMeq2SXk3qVgZDJ5WVdTunZNh6/dJ?=
 =?us-ascii?Q?WCcHP/C2gN7l9ojAG6uA8PSGuv4OQOluJp0jhWXPAJ9G6U4HhKlxOzwJA0xM?=
 =?us-ascii?Q?WzXvxU+sLCTFVtsXKNRnq0M8W444E7fOWZYG75nBEkRq0607dkBg5oRuJ04U?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7522fdff-6701-497b-0389-08dc42e92fef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 23:07:28.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5Ap4OAWWWNpp2YbvhnVmru9VFlFL/ecku0BkoCtNk3IjNoA1Pu8zkt9j8inEDpt2OH/quBMCxL2Ujx7dW5d9Me+F+t3IHZG0L1IzU63LXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

On Tue, Mar 12, 2024 at 03:58:19PM -0700, Matt Roper wrote:
>On Wed, Mar 06, 2024 at 11:36:40AM -0800, Lucas De Marchi wrote:
>> PCI IDs for XEHPSDV were never added and platform always marked with
>> force_probe. Drop what's not used and rename some places to either be
>> xehp or dg2, depending on the platform/IP checks.
>>
>> The registers not used anymore are also removed.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Potential problem here that needs a deeper look, the changes in
>> __gen12_fw_ranges. Some ranges had comments saying they were XEHPSDV so
>> I removed them, but it needs to be double checked with spec and CI
>> results.
>>
>...
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>> index 76400e9c40f0..4f1e56187442 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -1536,17 +1536,12 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
>>  	GEN_FW_RANGE(0x13200, 0x13fff, FORCEWAKE_MEDIA_VDBOX2), /*		\
>>  		0x13200 - 0x133ff: VD2 (DG2 only)				\
>>  		0x13400 - 0x13fff: reserved */					\
>> -	GEN_FW_RANGE(0x14000, 0x141ff, FORCEWAKE_MEDIA_VDBOX0), /* XEHPSDV only */	\
>> -	GEN_FW_RANGE(0x14200, 0x143ff, FORCEWAKE_MEDIA_VDBOX2), /* XEHPSDV only */	\
>> -	GEN_FW_RANGE(0x14400, 0x145ff, FORCEWAKE_MEDIA_VDBOX4), /* XEHPSDV only */	\
>> -	GEN_FW_RANGE(0x14600, 0x147ff, FORCEWAKE_MEDIA_VDBOX6), /* XEHPSDV only */	\
>
>We can't just remove ranges in the middle of the table since that breaks
>the "watertight" table requirement that our selftests check for.  We
>need to either roll the now-unused ranges into an adjacent range, or add
>a new "reserved" range.

see 23n224gu57lfd4wbroqflav4pih6usrkf53q2ve4ntekhueylb@eqigxyktri6b


>
>>  	GEN_FW_RANGE(0x14800, 0x14fff, FORCEWAKE_RENDER),			\
>>  	GEN_FW_RANGE(0x15000, 0x16dff, FORCEWAKE_GT), /*			\
>>  		0x15000 - 0x15fff: gt (DG2 only)				\
>>  		0x16000 - 0x16dff: reserved */					\
>>  	GEN_FW_RANGE(0x16e00, 0x1ffff, FORCEWAKE_RENDER),			\
>> -	GEN_FW_RANGE(0x20000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
>> -		0x20000 - 0x20fff: VD0 (XEHPSDV only)				\
>> +	GEN_FW_RANGE(0x21000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
>>  		0x21000 - 0x21fff: reserved */					\
>>  	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),				\
>>  	GEN_FW_RANGE(0x24000, 0x2417f, 0), /*					\
>> @@ -1627,10 +1622,6 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
>>  		0x1f6e00 - 0x1f7fff: reserved */				\
>>  	GEN_FW_RANGE(0x1f8000, 0x1fa0ff, FORCEWAKE_MEDIA_VEBOX3),
>>
>> -static const struct intel_forcewake_range __xehp_fw_ranges[] = {
>> -	XEHP_FWRANGES(FORCEWAKE_GT)
>> -};
>> -
>>  static const struct intel_forcewake_range __dg2_fw_ranges[] = {
>>  	XEHP_FWRANGES(FORCEWAKE_RENDER)
>
>We can drop the macro here now and just make this a normal table like
>everything else.

will add that in v2 too, thanks

Lucas De Marchi
