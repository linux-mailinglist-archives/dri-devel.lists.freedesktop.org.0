Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2ACC53C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB0710E98D;
	Tue, 16 Dec 2025 21:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRy/MTDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BBC10E98D;
 Tue, 16 Dec 2025 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765921217; x=1797457217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kq3wDnUk07Wx3FrPqVZNhqYl8nS0ErGgrhM0zKxSKHw=;
 b=eRy/MTDDrXCOvFa1lMlQemqN7C4UnNBI7IIit5G/iOqjzeKmp4N7Hm63
 oPsxDCBpNUGQOTMIRMzl/Oh0rWFVb9wQ5jrhIacd209xJfNYwZ4ucA9N1
 MpJ5AC1sdB59UJlxno3FG2mMJlCbf0YtEwxU8ZQkBMHn7TsEJWNKZ2ow2
 vsQ0ZriQEfASRyP33pmjUGcIzR4Fgec62hGxgGGQvNXqQkcih0RI1+CR5
 4SnNNZoh6SJpBPXAE6j5SD0ew1XyJJ/b7YhxQx9PeLil6fCFOURlGTYHu
 GtrffOIiKrTkEf4sCc78p+9zzpLRLFCdtpXIKbZ/MsbsOnBZwe6PRfU51 g==;
X-CSE-ConnectionGUID: CzRD8V/jTPCZ+RiWFbwOww==
X-CSE-MsgGUID: RzBSDt3HQEKvXsKceflCKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67734639"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67734639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:40:16 -0800
X-CSE-ConnectionGUID: s2G5/pYFS0aiJjLhpBXNVg==
X-CSE-MsgGUID: gRMphmTVRP2cmuNTcHkgvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="197419593"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:40:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 13:40:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 13:40:15 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 13:40:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB4k0FDE4nyOW9hXOdyH+kIOy9Q8+Bd0pSDOqvSefJRwWciDa9bTapGuV4XIpU2bQSYlDP8A0KB4bFtX323hqga7NA8U7z5zGjYAYJavezm2mRtmLNRsjWdqF5feD3rPDtQv3NNpYCXzrI4ZjqJSbROSaRhnIV2w4+lPdtd8HiZT7mJ3bu/5LGYyi9CKamL6y52a/DiFqtcUvkeTesWxTEmIYG6oUlRzlBmcd/tOemSsVcyjoKaF2drjRRdS35TagnblkYPTvQjtXa+G0sLLkjCcOsNv8a2L1N75uvNG38xC3CW8ao+fTzHdTaOLKI7Bh/10IsIxlem7AGIC9IgUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6MtlBLkYlwQUag/wE2fkthopf7Jkr5F0SSfn2t8YhA=;
 b=MEa1bADsnULDLutVMfeWd5VVVjiYf3gBsvDcneKurlv2vp33JuOt333F7dgC63H9wVVSLtjKxGJtEbeW4Psa7UyK4Z1bm/fDE6FaEmAIcUQp+SAW9BfRFWZd7SJdU0W6RVUpOEKbRphWGNlXn4b8y3K8wcXdOMFjX+/N/4AwiGFeGUyzKdz281WIOqUSrotgFSAt3p+qlmyT97nI7VSPFFFkL+P8X9WEhVbxfgjC+LED1C5wdLOzKsrWhbuVz3xJ7TWaaBFI/F0Ge+2pEUjQmEC5r/sbfJ71Zba3ZUqpn5L95n5eAJ159j7S7X0do7CNDzLSXS8EZ2xI1tqhDmf+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 21:40:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 21:40:08 +0000
Date: Tue, 16 Dec 2025 13:39:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <aUHRpvsa80wg04r7@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <aUHCZpnTNqv8wfdc@casper.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUHCZpnTNqv8wfdc@casper.infradead.org>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f57c5a-34bd-4abc-9fc8-08de3cebaec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUdXMEFYWFVFL1NJQTk1QmgvYzNZOGlMU3l3VVEzeWxJQXVIdUdUYmJhdzQy?=
 =?utf-8?B?SnhkZDFBd3VqVVRRa0lWZ2ZkZldXMElRSGhCZUFVRzBUdVIvcFdmWjd0SXBX?=
 =?utf-8?B?M2hWR09Wa1RkK0JDRU1PWG8zdVJGV1hJMEU2WmdsYkpiNGpibkR1Q3M1dy8v?=
 =?utf-8?B?OVhOU0l1K1FiLzdlbmlwSVByUVR4emgxVUl3T3VqcXlRTVBZZDYxL0VJeHJQ?=
 =?utf-8?B?dTZJVlhiSDFPZGNuN2crLzA0Sk9Jc0lBWlZNNmQ3M2JnL3N4eXZPMDQrNmgw?=
 =?utf-8?B?dzdyamVYYTNpZ1RXMlhlSVNmcWlrMlcwQ1lEOGZoTno3NHJ6aHZwemh6cmNG?=
 =?utf-8?B?MHJHbGpEOE1kZ2t1Yk9ybWJRVEpLZ0FjQ3UrcHJYZ2lVSEVhcjJ0S2MrMUQ2?=
 =?utf-8?B?UmlOcGhxQ2hmUVRlTE12SVdMaGtDL3hOc2hUYSt2QVl5ckwxOFllN1JleS9a?=
 =?utf-8?B?VmhtcEhhV2NwN3pXenFUM283VW4wcC9LUGliZEFucWhYcWluc012eHhJa25V?=
 =?utf-8?B?WGF5RjJEcXNWcnd6ZUlhNkJldE1Jamp6aHRPSEF2K2RkNEhhZkhkMXJkVmxy?=
 =?utf-8?B?ekc1L0RyN2JKUXhES1l1OFVGQ0JZRXNEVWozVmtkNkcrcGVER1pqWUdUNFZu?=
 =?utf-8?B?YlI5WFh4azJTNkdSSm1Ib2t5Z2drKzUybGp4Ui9sY3dDQzNxdHVDQk9GQUpq?=
 =?utf-8?B?djlaYi92eEVyQjhCVEZ4bG1IQzRJQVltd0RFa3N3NVRxSDl1RWk1MzRtRnBU?=
 =?utf-8?B?RnNDWENRQlVhWHVUZG9nK3JlU0RwSEFwSGhxNENtU2MyaTA1WmpqYU5ZTFlB?=
 =?utf-8?B?cTR5L2w0TzRKdDJ0V21WT3lNUUZCbW1BRmhxREFkajVGQWpYbXFJRHZmWFJm?=
 =?utf-8?B?VnNkVkZkWmI3QmU1a3B5UFFyRjRNaDdVTi9yRmhIZ3lOblg0OGhSalBYekJn?=
 =?utf-8?B?VWxDMElpbGU3cEpiRXFwbFlKNDBMQngvSGRJZXVyTGRpcGpBSm1sTGJ2MnM3?=
 =?utf-8?B?ejVVWnEwNHA4WFFaOHJoaWp1QXYzT2xEcS9vZFNTQTdhUWtXS1hsd2FpdW11?=
 =?utf-8?B?YW5QcU5sRU04Q3FjR0E4RDE0ME1oWEZ6STRoLzZhcUROekxkT0k1QWtWN0Jk?=
 =?utf-8?B?ejFoMFZad3d5b2tUMFQ0U25kWkpCTGJBSmpuZ1NvUTBEZnB6WDhzaWFOY0JX?=
 =?utf-8?B?RkR0QnhoRmpqRTZCekVLV0h2VEV1eTViUFpzc3pTVW9vZDd1Y0MvbGg4TVND?=
 =?utf-8?B?VWtTMngyNk5yTXpMQ1NFMEJIck1yenhOV1RlNnkySE9sTTJMYzVlRmlIcGJP?=
 =?utf-8?B?UkI5dFQ2ZzBxVEpTR1I1RXJmQ1p1Rm9aRURDL2IyeHl3eUhjKzFZUG5TTnJM?=
 =?utf-8?B?aFFBbElOMVYrRlJjdk5FMG1FRUtjS3pTSCtNZVBwREs2a1RYMDZURldvTGFa?=
 =?utf-8?B?NjhWeGpZaXFZQVhaa2VXS1BUZXA1WTBDSWNtMldlSWNuTGg0TXhZbFZwS2pj?=
 =?utf-8?B?TnFzcWt5dGM0YlFRSUtXYkhJSDlCVVd2SVE5a2QvRjZNanBwUkF5cnc5Nmhk?=
 =?utf-8?B?TzBWU1QxZGVmdTdmSWNBdUZXTTJZM3JMMjZsUXYxajNxSlBOTGNsVkFQV25J?=
 =?utf-8?B?SkMvUFpoekg1VVR0SmpZTU5CZk9SQ2t2R3czT0hacm56cXBrM1owemlHNTQ3?=
 =?utf-8?B?dTJETXBrNGc4S0hCMFdMT0UwVkJjeE03dGxBQytHYTEvcmlYOW1OUjF1cUdu?=
 =?utf-8?B?M0JCM2p6dDZJN0N3YksvTlVQQkJBcDRzMzZQWGpzUHhLL0lIemF4R0wwRHhR?=
 =?utf-8?B?MzNTQ2hpVjZpTGhYOEhtUjNHZU5wQUQydDFpdkhjc3pVRmppZWFjRjJIOXNM?=
 =?utf-8?B?WWxMRWdGNGxlQm5kRXhEQXpmMUdwcEg0cElZOFdIRXozTlVGR1RzWk9MdlZp?=
 =?utf-8?Q?xS8T1rls9/EDJRozPrJMkM2YANbXJK1r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pIeFlxV0VFRHozdEE1dWxsb3lPWlpiekw2L3hJM0dtZ1JFdDRWNVkwZXR1?=
 =?utf-8?B?RGpRY2xWQm5JRXNWRGd3SU9RK1Nra0FSTUliUW96OWFpZTZ3aVZKMUYzU3Fu?=
 =?utf-8?B?T0JIVm9pSFZ3eWNVbW5hYXNBWDRKbTQrTEVpdmdJb0FlWWxoZlZOTjZFMXNE?=
 =?utf-8?B?TWYyaUV6aHVpbnJQNmJLay92K3hKSlJoR2s3K1N3TFN1RWR0dXNzaTNKbWg4?=
 =?utf-8?B?M1dSVks4MVQ4RkI3YTg2aTNCMFRhbllkMU4xNzRSOUcvMkRMdVdsMUdqcVFJ?=
 =?utf-8?B?UVppaFFwL3JreVk5ZzczUW9Ob3gxMXhEK2VFZmxMU1gxc2VjN01URUoyTmRM?=
 =?utf-8?B?bStGczRXeDNVa2NUQ0ovUFp2YkNreHhrU1FVU3g0WlZxeENEN0kzenI0RHhF?=
 =?utf-8?B?K3N6eUozWFl0dE5UNW9yT21SbHdrMFY5VCsrbDFkYUVsVGt4VjliZWFvRWVa?=
 =?utf-8?B?RVNIUHlzcU1BTmx5MklCbTVia09ENytqd25kemEwWmFwdWRKVW8xZjRQRDhQ?=
 =?utf-8?B?K2pBMFZnVFd1Y0RSemkwNE9VR2VGRWNQdFNtUFhJbXBoR0VBb01SQmpmZ0Zp?=
 =?utf-8?B?ektxZFdiOHUrVk9ycDJncmdyN2ZMNGIyZW92bVhndnpFdnNtZ3dRNkNHSW9v?=
 =?utf-8?B?c1pQUkJKMk9rc1ZUTjZKMWZ3Sys4Q1hBQnFmQldVY00vbCtXUklNc2VWMy9q?=
 =?utf-8?B?empIVzdkK0RNNUhNNjR5QTNBSHpxNmxSQjZxSndqaEF1b3ZaNnI0T2ZNbWs1?=
 =?utf-8?B?SDdYU2JCL1o3OVdwcEtaM2VGMldJVDBuS1l1a3R4K2k1YThOTnlETFpBOGlh?=
 =?utf-8?B?NGZwYU5ZaXdjMkFUNnpoV2x1OElOT25hTlUrTnRQazZOUENYbzd2SnZFalN4?=
 =?utf-8?B?WEVYMWNFcmFvV1hyMFBrdlRtaEcwMng4a0xTQndCK01NcEEwZGxhK0xQa3dU?=
 =?utf-8?B?WnBEOU9rbG9ldzZuRFFNdnFDNmNvZVNxOW5oMkRZc3Y2Q1ppUlNCaG5wcEh6?=
 =?utf-8?B?OGhMb2Fkb1lNKzlyWDlQWmJQNGhMNWliQXp6cCtrQmovTW5UYUx3U3pta29T?=
 =?utf-8?B?MGsvVDA5OGZRb1FpSGdjQXoxbXp5QjFvRXcrUFBYS3FwZ1ZNV0gwMVB0OHAz?=
 =?utf-8?B?VGZ6S1N2M1dKMlBlVjVrdUQ5M0hRRUlaUzdLdTBjYTlTWERCL2RvY1RQZ3k5?=
 =?utf-8?B?ajRla253SnAxOExKNFJSVm5wWE1UYU9oNEo5clVFVmt1YWdoRlJ1TXlpTVZJ?=
 =?utf-8?B?cDlVc0RlT1I0bUo5Wk94cHA2T3czSXF3RTFyTk04L1hwdVpEck5FZXhpVGMw?=
 =?utf-8?B?OW9JTGNkakFwbGFDMnc1OXBVZjJTdlZoSXhvTS9PelRwS1YzNzlnWGI5eGFY?=
 =?utf-8?B?QlovOVR1QUVhRFJZdGszZzFYTmV0WTJnWGpvencyNmZjQWJiUDVYQmsxMVV5?=
 =?utf-8?B?eTZyeHRYa0pUWkhKQ2lRTmo3RXQzRDZMN0JJMWFReXlVclprMVVBY0k4SEJO?=
 =?utf-8?B?VDJWRVJ4ZFJDQ2c3UWMrMWJjenNRSVNmUExMaldoTnduRXNzMFpqTFFkUTFs?=
 =?utf-8?B?K2V4ZTRVakVrSTQ4SU5mRHFTUndLUkIrQ29EUmNRcUhoTVZFbWVteEk4ZFFB?=
 =?utf-8?B?OHArSldma2xnZWhUV1NjS1pFQStsSXVBZ0E2cDBRa25iNlJ6ZUI4YVdGVEJP?=
 =?utf-8?B?M0liRnppK2xCSWNqSXBnYWQwL2I0RjBkYzRlTEQwa1BSbm1jT2NlVXh6UGZi?=
 =?utf-8?B?d0hZbkxBOWNvRFpPcUtldDFES29wck00OGVSWVUybEw4UDBib1c3T3pQaXRD?=
 =?utf-8?B?RmNkdEs0Q1pnVXZFUld4ZUV2Sy92MnhpM3Avb0NTSnhvTFFncW1tWm5mMWx1?=
 =?utf-8?B?NXM2YytLNEthVElDMVhBSDlFTGUrTEUzRmRkaWkxcUc0aS9najlJZlNzUjdt?=
 =?utf-8?B?enZ2ZXIrdEdzRTdQNzY5Ukxrem5PTUdFZWFpbU5pZHREMmV6a3JXeU1Ha2JO?=
 =?utf-8?B?SmdFVHd4cEw1RVJaQTVjcUJOVzcrY09nREprcWhUZXBuNG5uY1dnbEZkcWdq?=
 =?utf-8?B?cUV3UzQ3YlZoaU9idGJpU2djTUlDYWlVYlZYWUFqWExUYmZCK29Oa25iUDdo?=
 =?utf-8?B?bzU0Mm92aGd5TVFjYWdPTHFNY3JKcFRhYjRrcHh0blQxNk83c3oyTWNjNDZF?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f57c5a-34bd-4abc-9fc8-08de3cebaec2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 21:40:08.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiG20vjrfr1efiWfqHBztCr89PoOmfsjBTwhvdSqTpnyg+pdCptpTbzHaH26ZwE/+vVY8roioSxfUFqPtFaqGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
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

On Tue, Dec 16, 2025 at 08:34:46PM +0000, Matthew Wilcox wrote:
> On Tue, Dec 16, 2025 at 09:10:11PM +0100, Francois Dugast wrote:
> > +	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);
> 
> We're trying to get rid of uniform splits.  Why do you need this to be
> uniform?

It’s very possible we’re doing this incorrectly due to a lack of core MM
experience. I believe Zi Yan suggested this approach (use
__split_unmapped_folio) a while back.

Let me start by explaining what we’re trying to do and see if there’s a
better suggestion for how to accomplish it.

Would SPLIT_TYPE_NON_UNIFORM split work here? Or do you have another
suggestion on how to split the folio aside from __split_unmapped_folio?

This covers the case where a GPU device page was allocated as a THP
(e.g., we call zone_device_folio_init with an order of 9). Later, this
page is freed/unmapped and then reallocated for a CPU VMA that is
smaller than a THP (e.g., we’d allocate either 4KB or 64KB based on
CPU VMA size alignment). At this point, we need to split the device
folio so we can migrate data into 4KB device pages.

Would SPLIT_TYPE_NON_UNIFORM work here? Or do you have another
suggestion for splitting the folio aside from __split_unmapped_folio?

Matt
