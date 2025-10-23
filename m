Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1FBFF280
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1810E86B;
	Thu, 23 Oct 2025 04:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwYMO0ym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4992510E86C;
 Thu, 23 Oct 2025 04:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761194696; x=1792730696;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9ZnD5V/9EOg3IDNbMFYdLKfSb8B/aKW4Ko4YIi3H74U=;
 b=MwYMO0ymlybmNhCSSpnGwV/4RfoDvXnivZZxvjpthwqE4+9iTgo1b61r
 N/a7o59jLmZqp8rsl0igAD27npjfDkRNlEWJf/XZRTSDKYrY4fnw957N0
 qxJuSrXyDWM95NLi1tpHy8Rz42MAG29/eUG6JNR+yPmBxQZHEau4fG88N
 /f6Q8ILOotJ9YglRUYxdEhovwO6dZfH+TWSXp+OLZ/gdSNWi7AqV19s+w
 M1DKb2ldb/ycy6+A2HQGsBEah5YS50G6XQxIBV6qGgp1HbKZHWyV9nTSK
 4pX5P5+cr8eWo5VNPMUQAEzrBTMxvFjDtGW8jeXKfHmrPax3Mo6iP7c5w w==;
X-CSE-ConnectionGUID: qzl5BJJxQ46OpjYxMiy+Ig==
X-CSE-MsgGUID: dxg3DSHDRgewkOyYott82g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63057797"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63057797"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:44:55 -0700
X-CSE-ConnectionGUID: LHAp3G80R0GWKPOGTCXrvg==
X-CSE-MsgGUID: HaazMa8bS9SRqZLOJR9FSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="221244091"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:44:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 21:44:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 21:44:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 21:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCG1tj0gVMSCy6VRvvVkXXJvy4MzGAQrOuZ3mwR+on+bYHFUtmMscAYDH4n+3qnMpX71q0siXG+L89pTrDHYgJLYUsTt7EydQssILyea1vS9NS/0Nxl800vBDezw/D/7db7v+rk/+qe/j7E1k/jumJQ09o/G4qP5au97cUtQRCFarKCJDXvc3z2gdbjGloKffm3lX+ohXiD2Um0zUX1e+HuKBiTJU97GCumdluUJRDni9aw95Tyk7vxTfFADjTQs7F8wQ7nE+M4eht9uV6MF7ebBSMd5nFCkTg1JB95Q9Z93bTX5vNiVdQqsO2PQqJGY4s60c7nBwap0/5bqs+LPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD+VJ/JjZuBi5MwWsw1zos1XV3oB2XmZ2GlFAyzmkhM=;
 b=JaPEU26yObBKp270VTadqke/X5RjaaYijixICKviDymmbJtiM6+ny2AGCjEne1JRBq2qksMSm4aH6I1nJWWYQH3irHDdHAJ9XvnBKkiyWfXR3KlAhwdEVSMURnglv0dwMVEYzZYPOmDVSdNxazGUcU3BUahnpNcJFSnZ8fhf3jiiYbQQh7MzR+gZMEp63M8v0vgjzGx61xidscdfjcQs8IzRnawDu85PojKFpIUEbo2Lfc19cvLhyeeJLxINfj4DIc0+O2OsVIadbDpFo2rdsJB62+MQFadmfSBQV4wj4WhYX9QMTm9vmlVLTDKjKuj+W+cuXjR1hPVr9Ap+YxWJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 04:44:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 04:44:51 +0000
Date: Wed, 22 Oct 2025 21:44:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <phasta@mailbox.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
Message-ID: <aPmywA4XExVj6s5a@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
 <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
 <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
 <aPmt1lZXAmom9Bko@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPmt1lZXAmom9Bko@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:303:83::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: b733a7d7-da31-4118-94d9-08de11eee72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGFnOGx3Wk1NS0hXODZjVWlweWhVQkRPUzVhTFR0c3ZRYVBZRGJVUXY5WnR3?=
 =?utf-8?B?eThQc0dLSC9EVDk1Qkg0Q3AvK2swaERmQlBVanJpZTY5bUs1NThtYXI5K2Z4?=
 =?utf-8?B?UXE4cjMvcU1ScFROM1hHN2JJK01CeXlESklIQVRvaURsTm9xcUM5NldTRjYz?=
 =?utf-8?B?ejFVVTJhazZXUGYwd1dxWUI5RlIybVE5VUVBYndnZVlyNFV2ZmVVOWl2M3hm?=
 =?utf-8?B?YmVxTUNYZTAyKzF5TXRKSmNyMWdRdnYvQk5SSWRUZ0dyVm5hSXRxZDZPRnpj?=
 =?utf-8?B?Sk9LQ3BnZGRFZW5XVXhoWTYzdVZTWWpLb2k2bE5aRm10R1I2SzNNVGphakgw?=
 =?utf-8?B?OHBjVkxEb0pycGF1WHZjRUE2a0UyMUlnSHhZODdBWXVPbnZETmZsWkUxWlo3?=
 =?utf-8?B?U05NTGJuSTVrbzdQUHBhRDk2dmtuZW5wMkQrK3hPK2tpSXg2UmJNWTg4RUNK?=
 =?utf-8?B?Z21KeFdTOHpyOG8xaW9uL3I1eVU1R2JZbGsrcDFoRTJ1aEdrY2FCSXpMUWtH?=
 =?utf-8?B?OVAySHgvWmExYjl1TjFVS21LTVhvc1lnbktPc0JES0pxZVVlbzQ3cUcwcEdj?=
 =?utf-8?B?K0JmTnVLOUNvR3I2dXoxTldaYk15bzNucFQrREdRRk9ZOU83YVJSak8yb004?=
 =?utf-8?B?S1BuRVZLUzdua1FyMWl3RkZNNE9IcW54c0kwQmxHZE9CeWVXR3dqb1FJcHNX?=
 =?utf-8?B?V2tmUnhBcE14RTJyUkFkMTJVcEpWYlcxQlJJbGNIRk51QkpzZnNJcXFIVjdO?=
 =?utf-8?B?Q2JCUFR1ZlpxQnMzNDZHdHhLaFhYQzFPYUlNUHRlbkl4ODEvUXNBN2pubE1H?=
 =?utf-8?B?U3JHd3c4NGU0WlowTVdxNjl6RlRFaFcyem5wUDVRWEs3WFNHc1gvUDY4Z1po?=
 =?utf-8?B?bjJEdENOc2llNGZ0cXEyYmhka044OURBajkrZGJyZU9XVW1UZXFUYUpZSVIz?=
 =?utf-8?B?L2RRTHM1WDB5MlNPQkVBZWRHdnhjS3l6cHRDeE4yemtMYUhxVU1JbWdUcUxl?=
 =?utf-8?B?WmJGQklTUGJtQ0FTVHpzcFZQRXVyalA5N3J4c1VGbWZ1UGdGdDVRTk1scTVw?=
 =?utf-8?B?eXRXbjQ1b3hFcjFhbnRvWk82MlFRbktiVVkvTDlRL3RxSjRzQzNTd3lCcnNj?=
 =?utf-8?B?UkRqYXN5U3FOdFJMckNFUGhvb0NLWW44WXM3T2RFajFDVk1zZjBoWFd3VWtU?=
 =?utf-8?B?Tzk0VTdsQU12bmJFY2tLdVg4dEp1L1oyZzNRa29iNmxpdjd2OE9GQ0xrTnp1?=
 =?utf-8?B?eTJvMW9wWTc4RVBiaEExYUhLVDZPNU9YK3ArU1I4a3hZTUxTUUMzTWxYYWpj?=
 =?utf-8?B?RkV0VzRhMVdVUTlyYVlJeG9JOGo5MDhlekZCNGlCSTVlUzhtNHlvR1cyd0l0?=
 =?utf-8?B?Nng2Snp4TnBJWEFvUXUzZ2Vsckd1NEMxYUZqQ3I1MFpjZEJtd213VjkzNkFK?=
 =?utf-8?B?VzdvMW80VGFjcW9HZldmL3h4QW1sUE9OUjM3WTgxdU1ZQlRCcW55cmtmWVhh?=
 =?utf-8?B?WkNuMk5tcXBySDJRT3I5YXJaemJFK3R6UUFuM3E0NE5CbjRzd3RVbUdlYmNr?=
 =?utf-8?B?NmlnSlF3bFBqVGpaNkNubVlmdWd5RzdveHhhOWh0SjIvZ3hqUlFRK3hmeXNX?=
 =?utf-8?B?WndqL0ZWRGFVbmhaUHNWZTBWQTEyL2NnMHpmbHpHY0hMaVgzbVVOWmcyV20r?=
 =?utf-8?B?NnQvN0hMZzRRNDcxKy9sSXAwNU5xYlNYN01raGl3S3hMdysvMEo2K3dES2Nh?=
 =?utf-8?B?cmRNM04vTENuUDlMWUt5bjdIeE9rUTFGYWhvSFVZZVZSaG1GT1hYMXlNb3ZB?=
 =?utf-8?B?U0RJNHBHNlppQkMvOGY3NWVBV21yNmtuY1dIRklwaXBrVVkrTWwyN3JLV1Z5?=
 =?utf-8?B?VjZ1UFE0L0EvMGJmazRuQXpPMTBPSWpVUkpWWm9iQThsSlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRUQ05CNWszd3FnV1puUmp3QTQ4MU05bUcwcVN5MVE4eXlzd0tqV2k0b0dk?=
 =?utf-8?B?bllaQnFVakZmSm1sbWlqSFdHZVhicmRDS1BmZDZoUlZ6OUxFSlNWRGJJaHRG?=
 =?utf-8?B?STNjK01jVGNDaGVOMWExT0J4YWt6Uzd0cVF2VFo4djlSeE5QaEprNUVwb3hV?=
 =?utf-8?B?bFpYcm9OMXhDK0xIblNmMHZNYTZ3d0d5MTR1ckpic3V6YzUrUmxla3pqQTZk?=
 =?utf-8?B?L1dYYlFmSjRVUVp0Zk5uNlN3ZHFOdUVubVhoOHArcVBDZncvbWNOcTBDUko3?=
 =?utf-8?B?NTdrQnlOK0h1R1dMSnhKNnc1U2VMZ3MxbTMzZTdmbllpcTRsb2FYZkVOQTZl?=
 =?utf-8?B?QjBnSU5JbjdPcGlIaGMwcWRUY2ZOWVpaSmtFaVdLTEFjM2JOMlUzcG9jbFEz?=
 =?utf-8?B?dDFSRDhnTE54QzJ0dXRIQWV4S2p5REhWSVdtUGNMV2lJWm01aWY2b0NoSzBp?=
 =?utf-8?B?dllZRUM5TkFUMTRlQllDVTRJazl3NFpBRnU5L0MrMTNGWHpYRS9LaHFxSEVt?=
 =?utf-8?B?YVNqKzZvWlRuNFRnVm4rT1VWYlZwd3NWYUdjZHFMZjFzZmZMRVVNNTRvY01Q?=
 =?utf-8?B?eG5YUzVJQTBWaXFNRUxOUG9wdTljeStqWW5kZ2tSUnVBckxpRUEyTXNLYW8x?=
 =?utf-8?B?MnIrZjBVS3dSRHkvTm1nTjR5WVkrS1BPUlVSM1BZcVFTY0VDR2tqVUVxMURX?=
 =?utf-8?B?TVZ2WHdLeVhROVovRnJyWDRrMFFhSkpKRzcwcHdXcnFsbEFBN3E1Rkhqcjgv?=
 =?utf-8?B?cmtUUWNxeUw0U0tNTmtsenBiTHdoM2dFTGlBeUZxb0pRQWZ1VW5LSlVxY2p6?=
 =?utf-8?B?bUw4SEhXQjBZQmtYMWNBSGhmQ0JQbDFuWXFHUTV5eWhLOG5ZZW9RS0xtbEtm?=
 =?utf-8?B?S09jTnNQZ2ZkZ0VCS2dOakNwMlh2cEFKT0ZTSG5xL1dBSyt5V2RoTzRJek02?=
 =?utf-8?B?YnVHTE4wajhuWENQbnhsT2JzSVlyNCtTY0pRWFhsbE9KUDkza1V3WTlJWTZy?=
 =?utf-8?B?U2R0NzNXdjFDS2VsWlNLNVNlL1lBYXY3Ni8xTmdjd2ZnRlROd3ZHWkYzT0N5?=
 =?utf-8?B?ZEVTb3JXQUNKUWdadURnR0hvTXRUVXhFeGtnVDRvRWlnNEp1V2wwSndkeFNk?=
 =?utf-8?B?WVdMMHZTWFZiRW8yQ1V5OGpOaXBMWVpEdnZvMGhWazFzWHl5bnYyM1VDYzZO?=
 =?utf-8?B?OENMbVlpM0lyRC8wYzMxODNVN3RNcHprNEZaMkg0a2ZmM1VsUkpUbWJhVkV3?=
 =?utf-8?B?aUdPZTdjUTdHUWgyQkRxcUo0YW9EZ09iSTBQUXQ4TVhiTEorWFR3YkJGTTNr?=
 =?utf-8?B?d2p3R2ZsVkhXaWhaQkNXQjc3UWhyd3hrNmRmR2twRUMyaGpkQUhPV0FBbVpv?=
 =?utf-8?B?RFlHcGlrR1VGSjdPNnQ3YittL0dla2FHeW1halVBckVuSURhamRhenlqK2JV?=
 =?utf-8?B?c2x5K3dhN1E2RWdTak9IYXc3Wlc5WC90VHNzeGpHWThlYjV5Ky9Ra3A5b1Na?=
 =?utf-8?B?OUtHcXdiMitubkExRVhPQzV4c3l0M3Z6c012b0dKSU0rbXFjUzd3VEh3SUp2?=
 =?utf-8?B?ajVGTEQzSEVuQlZKa2JuNHNTNEpUWncvM0ZHTllYVlhmTW5FT2FId2tvczdU?=
 =?utf-8?B?VUVZWk9hOUtuZGVrVGNlc291ZWxJQ2NJdTZOTGpMdy8wY05LZEdLVWFYMC84?=
 =?utf-8?B?UkJhbkU5RDlJTEprbXc2SDQ3elovTlpxbkpQQlgwTWdIZUloNnI2M0hpbXhy?=
 =?utf-8?B?UlcwZURMVjAxLy9BSzdldFJ0dGRVdngvK09aZkpHbzZOMzhRckVDR094V2ZY?=
 =?utf-8?B?NkJYVnU5ZytKTW95bEZNejNQazRvYnlOcjFjakFDSkRWRVg1WFpTL2ZQRlhZ?=
 =?utf-8?B?cGtRSk5rSXdHYWZKbWtLY2Z0RW53bFpqQXVJdVJoaWUzN3NWT015S2IydmVN?=
 =?utf-8?B?QUR4anRLL0dEc1Rma29LVGRvdnNlUDFLbjhTaXk4ZG43L0xXYXpYbno5ZkJp?=
 =?utf-8?B?UitGeEJ1YTgybm5NTVNrdlN5OGVQaDlKK3o4dHpCdmxLRkRacWk0eGRhL2tn?=
 =?utf-8?B?YzJOYnJEdExvVUpyQzluM3dISDFBOXU3Z0Q5S0dqbk9zUzJ4bDlxZ3ByVFBW?=
 =?utf-8?B?SlFnOVI0dXN6OGJEcDJWRGhGOGdLdDFDdEFtM245Q0VKOVV3ZXN6enpEUTIr?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b733a7d7-da31-4118-94d9-08de11eee72a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 04:44:51.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9UfHpd5dgosixNv5Sccc9jq6510aIHOhAbe4v3uls6RXWm6bddBaJXFbV4tlgTUoBtYlCt1xjQq11ln9L2j1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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

On Wed, Oct 22, 2025 at 09:23:50PM -0700, Matthew Brost wrote:
> On Thu, Oct 16, 2025 at 04:57:37PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 16/10/2025 09:56, Tvrtko Ursulin wrote:
> > > 
> > > On 13/10/2025 14:48, Christian König wrote:
> > > > When neither a release nor a wait operation is specified it is possible
> > > > to let the dma_fence live on independent of the module who issued it.
> > > > 
> > > > This makes it possible to unload drivers and only wait for all their
> > > > fences to signal.
> > > 
> > > Have you looked at whether the requirement to not have the release and
> > > wait callbacks will exclude some drivers from being able to benefit from
> > > this?
> > 
> > I had a browse and this seems to be the situation:
> > 
> > Custom .wait:
> >  - radeon, qxl, nouveau, i915
> > 
> > Those would therefore still be vulnerable to the unbind->unload sequence.
> > Actually not sure about qxl, but other three are PCI so in theory at least.
> > I915 at least supports unbind and unload.
> > 
> > Custom .release:
> >  - vgem, nouveau, lima, pvr, i915, usb-gadget, industrialio, etnaviv, xe
> > 
> > Out of those there do not actually need a custom release and could probably
> > be weaned off it:
> >  - usb-gadget, industrialio, etnaviv, xe
> > 
> > (Xe would lose a debug assert and some would have their kfrees replaced with
> > kfree_rcu. Plus build time asserts added the struct dma-fence remains first
> > in the respective driver structs. It sounds feasible.)
> 
> FWIW, I pulled this series from Christian into Xe and attempted to
> disconnect fences in Xe [1]. It seems to work in my local testing, but
> let’s see what CI says.
> 
> I still needed a release callback [2] to maintain an external lock for

I realized after I sent this release CB static ops disappear on driver
unload. I can drop the need for a release CB.

Matt

> our HW fences and the dma-fence signaling IRQ, but it should now be
> fully disconnected from the module. I coded this in about an hour, so
> take it with a grain of salt.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/156388/
> [2] https://patchwork.freedesktop.org/patch/682962/?series=156388&rev=1
> 
> > 
> > That would leave us with .release in:
> >  - vgem, nouveau, lima, pvr, i915
> > 
> > Combined list of custom .wait + .release:
> >  - radeon, qxl, nouveau, i915, lima, pvr, vgem
> > 
> > From those the ones which support unbind and module unload would remain
> > potentially vulnerable to use after free.
> > 
> > It doesn't sound great to only solve it partially but maybe it is a
> > reasonable next step. Where could we go from there to solve it for everyone?
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > ---
> > > >   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> > > >   include/linux/dma-fence.h   |  4 ++--
> > > >   2 files changed, 14 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > > index 982f2b2a62c0..39f73edf3a33 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct
> > > > dma_fence *fence,
> > > >                         &fence->flags)))
> > > >           return -EINVAL;
> > > > +    /*
> > > > +     * When neither a release nor a wait operation is specified set
> > > > the ops
> > > > +     * pointer to NULL to allow the fence structure to become
> > > > independent
> > > > +     * who originally issued it.
> > > > +     */
> > > > +    if (!fence->ops->release && !fence->ops->wait)
> > > > +        RCU_INIT_POINTER(fence->ops, NULL);
> > > > +
> > > >       /* Stash the cb_list before replacing it with the timestamp */
> > > >       list_replace(&fence->cb_list, &cb_list);
> > > > @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence,
> > > > bool intr, signed long timeout)
> > > >       rcu_read_lock();
> > > >       ops = rcu_dereference(fence->ops);
> > > >       trace_dma_fence_wait_start(fence);
> > > > -    if (ops->wait) {
> > > > +    if (ops && ops->wait) {
> > > >           /*
> > > >            * Implementing the wait ops is deprecated and not
> > > > supported for
> > > >            * issuer independent fences, so it is ok to use the ops
> > > > outside
> > > > @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
> > > >       }
> > > >       ops = rcu_dereference(fence->ops);
> > > > -    if (ops->release)
> > > > +    if (ops && ops->release)
> > > >           ops->release(fence);
> > > >       else
> > > >           dma_fence_free(fence);
> > > > @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct
> > > > dma_fence *fence)
> > > >       rcu_read_lock();
> > > >       ops = rcu_dereference(fence->ops);
> > > > -    if (!was_set && ops->enable_signaling) {
> > > > +    if (!was_set && ops && ops->enable_signaling) {
> > > >           trace_dma_fence_enable_signal(fence);
> > > >           if (!ops->enable_signaling(fence)) {
> > > > @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence
> > > > *fence, ktime_t deadline)
> > > >       rcu_read_lock();
> > > >       ops = rcu_dereference(fence->ops);
> > > > -    if (ops->set_deadline && !dma_fence_is_signaled(fence))
> > > > +    if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > > >           ops->set_deadline(fence, deadline);
> > > >       rcu_read_unlock();
> > > >   }
> > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > index 38421a0c7c5b..e1ba1d53de88 100644
> > > > --- a/include/linux/dma-fence.h
> > > > +++ b/include/linux/dma-fence.h
> > > > @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> > > >       rcu_read_lock();
> > > >       ops = rcu_dereference(fence->ops);
> > > > -    if (ops->signaled && ops->signaled(fence)) {
> > > > +    if (ops && ops->signaled && ops->signaled(fence)) {
> > > >           rcu_read_unlock();
> > > >           dma_fence_signal_locked(fence);
> > > >           return true;
> > > > @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> > > >       rcu_read_lock();
> > > >       ops = rcu_dereference(fence->ops);
> > > > -    if (ops->signaled && ops->signaled(fence)) {
> > > > +    if (ops && ops->signaled && ops->signaled(fence)) {
> > > >           rcu_read_unlock();
> > > >           dma_fence_signal(fence);
> > > >           return true;
> > > 
> > 
