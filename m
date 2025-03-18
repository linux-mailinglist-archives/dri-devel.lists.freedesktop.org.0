Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3EA67B57
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7EC10E4BC;
	Tue, 18 Mar 2025 17:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdO3iP4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407010E4BB;
 Tue, 18 Mar 2025 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742320125; x=1773856125;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jy8f49IHmjKh1Wyc42X/jCQTMT54YFQP9BnCsgWU4Lg=;
 b=UdO3iP4hF20Niaz16m2nBvwE4HCyYM3MJDHt+g/g97z9r5O+xaq+xwsk
 srQYtImNhX9gSajslZSUC6YFjzqi4wIUg/MhhxLxqpgPaTTnhfZFhT8ZA
 NLmjC+UmCngynMIt8MkACs7E00VlKCZrUeFQ01wHU85edArStxrl5VLd7
 SolUUh7dryyA2kSjuaGTtvdOOJ6aSyNDB9e0rNPdWLo7f5Vh956mCx8qB
 pcatriwCzOnqCuYxyeQMopRkVO83Rng3CnbDRFlWj0PUci0Jqwd33awdI
 7ZKmjrolb6Ijs2Ge201CDvOTI2pGwL0qi7pY0qe2yl4g/fHAQIPiwfN+h w==;
X-CSE-ConnectionGUID: Ny5tElc2Tfi6bEkR2GnyXg==
X-CSE-MsgGUID: 1XwBrz0yTZ2mY/2CCrWgpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="31060257"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="31060257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 10:48:44 -0700
X-CSE-ConnectionGUID: hhW102PwSyy5Q2SaAmyoEA==
X-CSE-MsgGUID: X5wVoiEjRzmmq3eZ8GFKNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="153187375"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2025 10:48:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 10:48:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 10:48:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 10:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9G/0UMiRfeE6dtUK6JAGsElZaCjbqXJVIc4OKtby81eqYuX0mBi8Z+OVaZZEDJxDyTRmzvJoVDhUQlfK4jMH2JtK2+ah6BDNtuwn2G0iRiFi33skaslxui+mB/CgAHsK8iizvQZZIphWkHOO+j2Za4aUyVGvHfgIv81qEB8xha1nIUVQqvlxIjD0XlCLN+OOBJeK4y09uMivUsntTArAsVsy3xbnLhXrYpleUDO0vYrEv3jKneQQTIOvYv7JH+Olz5qT0LI7Li3yKV5zMC3y6RaN46nB5v95AFnndBQsN7ojYpfGSZ7kmJqNlGzbxdZW4w+M1LH6pF90GWKfK7BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czgQA1a9freq7e44exl9I0cD2oqBvGpRZYx9GkpHK3U=;
 b=BgrdgMOO146dbO9S5dYmM0mR3bCpLej3HEKkW9himOS0P6f6qu9zP6fbpEWOrbzvhShL+DBNXJRxdxDQGPAfPc0uwJYmrVT9ptyHBP+Z9jV/qkunrI1Jz5wd/+2lmIGkkL4sPIq37G6imXP9tUQX1k5DR2kXEov5SBj+8I/5r9zMsudF37xjpDNBV6UMt2DfqpborkU1b+oHR1aNSNRJ28hhcC6N8yejOxFeXNAfA33TqO/OjU+H9wTcyxfrn7DmcVGv2t99/vzLuvlADkXH8oiII/tq0kg+v/4jlwFSuaAToHyIulzSZjSp+cNRBG1IrUoZSuXOz9k6bhSB+M6VqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 18 Mar
 2025 17:48:39 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 17:48:18 +0000
Message-ID: <a8eaeaa7-ba27-4d57-b20b-caf36b1d9fee@intel.com>
Date: Tue, 18 Mar 2025 10:48:15 -0700
User-Agent: Mozilla Thunderbird
From: Jianxun Zhang <jianxun.zhang@intel.com>
Subject: Re: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mzorek@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-7-jonathan.cavitt@intel.com>
Content-Language: en-US
In-Reply-To: <20250313183415.133863-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: d62be441-9ab4-4292-3b68-08dd66451107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnd5YTZYQVFCdlpMcCtIYTdVczI3cDlwTERNNkdFb21GM2wwU3doOHYvTHdG?=
 =?utf-8?B?MTNsaWhBYWlqdG9pczVrWjdKUVh2SU8zcjFUTUVsOUVHS1NoQ1JpOXI4Qmc4?=
 =?utf-8?B?L01xWCtQK1NTUlVCY0JXNkhZY0RuMmk3cEJpa21FZ2dqSmRnMlZMNUUvUEZO?=
 =?utf-8?B?cGR1emFVVmZOUksvS0UwZTdFQ0QxK0xLODRURlFYU0J6TjNSdGEyclhkQUpK?=
 =?utf-8?B?cmNyK0V3Z01xQW8vY2p4M1VpMUl6SmNza0ZobW1LZG0vdG82dTYya3dwUjhY?=
 =?utf-8?B?bDQ2S0t2VXRjRkgreFFoLzRGdUd1QzQzZVlHMHNsV3dJZkliN2h3dGwxRlZo?=
 =?utf-8?B?ME0rWUlnd1NFek5uYkU5dFV0T1NOWVRySFIxLzBqckxnUCtKRnRrUVRwcDRC?=
 =?utf-8?B?Q3pESG9Ma3lnQTBVY2p0SWFtbmZHa1pVZ29FRnBXRWMyNjZja0VhK2gyZzRD?=
 =?utf-8?B?dENMcURKaUNjYlUxcmpFVFBFUmUxKzM3ZUtsQ0xXb0Q3Y2dGNG4wRjRLaUJm?=
 =?utf-8?B?NlQ4SnhpUi8xTU4rUjh2NGpuMHdIR2o1bUU1b0o5SHZXU1NlWnhLV0lpQ1dC?=
 =?utf-8?B?cjBmQW9xend1VGt5Z1lKK1pzRE0vczBkbFNLemdwdkRmREN3MklaN1RmODN4?=
 =?utf-8?B?UTFGOE0xRktYcGVuVEFLd21UbnZtMHdYNHd0UGZyTm82R2hXalZ2UTdHaVdW?=
 =?utf-8?B?dUcxWDNTUFpOd0UxbW1WOGhSVXpMZkJNQzJzMzF5VXdJY1RSNkxPeXJMRVFN?=
 =?utf-8?B?WUUwdm40R3UwU0t4R1RLWWNxMWMrN2ZXTkZ1R1pnZGxsMk0zU1JFWjkwOHBu?=
 =?utf-8?B?RE9xalNLalg0bTQ3bWlFcXRNMlFWS2thWVRwZDdxQnd1VzlBZXlkUVpPUDZx?=
 =?utf-8?B?VDdWOVZ1VERXdHlwTk9OdnJKRjllWmFxOWp4c2crTFluSnJLNkxRZTYxck9O?=
 =?utf-8?B?N1RLalQwUWJSOHl3MStoT1hOWG56Znk1Nk5wbjRRMEI2NVFKYmRQQUhRRUQ3?=
 =?utf-8?B?RWUxY20vKytRVTYzL3ErZTV4ZDVSNmVWQ2x3Y2ZXWDBqMGZlK1V5NWhZNjRN?=
 =?utf-8?B?UGxPVjRJZ29tcW9oalIzVC96WXlwTDJGY1psUEpLR0tCQWloT1M3OWNhWDRq?=
 =?utf-8?B?SHRxQTRuMDVDcnUvOGpwMTlpdzlQbHlrUDFGWjNoYk5yWkJXWGExU1VZZitq?=
 =?utf-8?B?SklSc2xRZWJyYitGMFdFVVJLQXNPRGFESVltdHM3Wi9uOGJSMGhRNkhBT2p0?=
 =?utf-8?B?UWsrcWFMTUFtRDZWOGRCeFVyNlE2ZmRpaXUvMnFXN2JuWmFmN0piMGIwc2Uy?=
 =?utf-8?B?RmwxK3hYclZsbUowM0RNY3NjeE1rcnNqSHNGSkhWVW9NVUdySGs5RXNvZ3Vu?=
 =?utf-8?B?S3dzM1Y1YVB1TzJ0TlUzR2h3Y3Q1aHp4UEZDM1NEWmZMblpuUzhaK1ZlSHdF?=
 =?utf-8?B?T09OTWQxN2E4TXRiOTlLcXJ4UkpaeVJEOXdzYUUxRzd4c0ZvZzhRNkkzN2RQ?=
 =?utf-8?B?Rmc1aUVvVVY4czlJZ0dLRFU2M3k3SEJnZHNxOTFZSUR4U2ovL28raGRxemh5?=
 =?utf-8?B?cnVOYVFsT093QVh5aEhmYjVkMGdKRmhNZUROQXVlcDc4OU1uZkFCaGRFeGdx?=
 =?utf-8?B?dy9QYXM3Rmczb2NDdC9LZUtndzk5M3huaG9yWWpIbkU0QnNNZXgrSFFXcVJp?=
 =?utf-8?B?QXN0YlFILy84RFMvSzhjRTlpS1dXdUhmUUNpNWp5UzJpMFdacXVzOHBJTXUw?=
 =?utf-8?B?YUxYVk9YV0kvNExhQW5TMEgwRDVaNVVDMEdSZjJyNkJTUmUwZkRhZW05cnU4?=
 =?utf-8?B?SDF3NzRmb0NnYStPUGRoMFFBYXFVbXFjVzB1dW51S1VsYWhoM2k5NXdOaUhV?=
 =?utf-8?Q?Nneoxbi+CLdSh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5mQlprWFZ5elNiWTRvYzQ1ZlF6SVlpZ255VXZPNDVhNDhTYzAvT3dGNnNY?=
 =?utf-8?B?ZytseU0yVG9XUnhsK0t4ZW43TTZ1VnFpUHcrN2VYNkt1dmEyaXRBRGhPb3B6?=
 =?utf-8?B?bU52WmhPaE1INndWVitTYmQxZThBa3ZLVzZ2dXZwNXFwajBXVm1Ib3BHMllG?=
 =?utf-8?B?SFVHVzluQXFFdi9kL2xvZHMwTVdsdEI2SlpBNDJ0MndKcGlUN2h5OHpDNjBq?=
 =?utf-8?B?b1JPK1dXK0JrblliZ3hTQ2JBcVJQME9uRU1yVXlpRG5PdDFpTmwycGpzWDNk?=
 =?utf-8?B?Um42MkpnYTdLWmxrQnE4dzB0b1BBNDB6THI2Tmd2elpVTXkrQzBGUjBjK1Q3?=
 =?utf-8?B?MFVtMTZUTnoyRTJ5L2RzaEtIZkV2VG5lMGR4d1hZc0hXN1lUaWxZQm5peG1L?=
 =?utf-8?B?TGNrV2diSzQvWThJaEE0Yk1Qa1BLdTh2UGpYZHRpUjk1VEt1YkdRaU0vdmlS?=
 =?utf-8?B?d0sxT1gzVHAxT0NLaEhzZlBUOS81Q1Y2Qkl0R3VxQzVEU1ByQndoaVB4WHdh?=
 =?utf-8?B?S0MyOVJmRUEvZHJjaHlzODlGN0NIKzlVR1k0eFlhaHNTL1RpNFVkMkdGTVNR?=
 =?utf-8?B?eFZ2dk4wbmVaQ3NLUUxSeFZMSXFlOWN3YkI1eUpZVjJzSWRKRnowMThSdStS?=
 =?utf-8?B?VkE0ZUhJOXJ6Q1gvelpvdEc5QTJCVThBWGJHdGdLK24wakxxSEZ5dXZwb3E2?=
 =?utf-8?B?TUdwMExQTWxwVFQ3T0VqemVDQ0JwbU15d1BPTUZ3Q2lzN0d1N1pqVTREazZZ?=
 =?utf-8?B?Ty9tdENPMnByeW9vclpSRDIyRVlGV1BaMGlIenplMjZvY2pzQ2R0bnQ3T1JU?=
 =?utf-8?B?cEJTYXUzeEw1UXY2bWJnYlRJTHlqdnZLVnordVNRdHZZM2hZT1ZQWVdBMk9n?=
 =?utf-8?B?d05kMkRBZklqejVWRVI0a096ckk2aW9udm00VUo0M1BodU9kZnNpbGwvL0Jo?=
 =?utf-8?B?L0V4KzlaV3JlTXZoYWRkZUhPRzNDcDcyRWNFdVFjcG9kZ1EyWHFWeVBleHVM?=
 =?utf-8?B?MjZxeUtwZWcyWTFpakdvTmNJZXA3d3JmTUZEU213RjFBRkd1TUZXMWlsTTNk?=
 =?utf-8?B?R3kxNnB5Q2JScmVzUXRNbGNqdGNHSFZBOVk4UERmYnhiaUNwTnNvcFlXenpi?=
 =?utf-8?B?WEw1MkUvbG55UUhSaUQwSUhhMWt5eUdGaFI1ekpBNnlnR3dTZEwzVjRHNHFn?=
 =?utf-8?B?MGpqUmxpMG9HQVA5OFRtTnFXV2Y3UkR4Y0JXUmloNVZWUTExMzU4TmhCQ0N1?=
 =?utf-8?B?alVIWS8zWWx4bVhrTXR5d1RiKytmYjBaUEM3NFFaNll4NFcvL2dEOG14M0t3?=
 =?utf-8?B?Z1hCVGc3bXA2WWhqOUJ1RXdKWVZ4T2lMVG11SnhqVnNhOXVwc2F1cWxJWTA4?=
 =?utf-8?B?VTM0dVUwck04L2dZLzh4RmdzVUR1K2NhVEVLZE54M1pybDFwV01zejV3TWZt?=
 =?utf-8?B?SmJkNTVyRSs2MGo0bnNuUjRVT0ZKaHN1L0M3UWZpZkVaUDNBL1NwQXdrU1Va?=
 =?utf-8?B?VXo4cmdPU2tRanMramIyMU5ZL1kwUXdDdWVpSXN0K1FZOVRkNE5QNjFycFZp?=
 =?utf-8?B?RkhBZXFzVlROcnB0Z3pMRDdVd1BzdU5lSTBVVjhHL1B2QVpkQWpwNVZDQ3Nz?=
 =?utf-8?B?eGlSRjRhVk81a0hpYWMvNTNRemhrKzFQREFFWSt6OWU1Y3gwNks2dlViOGlP?=
 =?utf-8?B?Q2c2N2xlam4zZ2pSSnJNS2tFWURlTG9mNXhUSEhZSjdzZi84REI4RkhxRWlQ?=
 =?utf-8?B?aXJVUnVlR2g2YTJnOHM0Tk83bTI2R0syQWM5ZlpidHR0TFQ1VjZqRWh5enJt?=
 =?utf-8?B?Y3ZRSkdkbW1uZS9NQldVY1QxL3BCVmx0N3N1bk5GbVFUamZsZkZLa2Z6MXlC?=
 =?utf-8?B?STRIWkN4VUVhTTBwbWo1VHcvbVlmSFFpOGt0RlB2NVJ1ZVdMeGladlFFd3R4?=
 =?utf-8?B?Qmh3eVBOWXU1ZkhHbktta0NUekI4dHZoRnkwNU9sWFUrWXF6UGMzZVcxUzlI?=
 =?utf-8?B?TzlWV0dRYlhTSERaZEJaM25WaVhvOE9lMCtMc2N5MkZyTXNjM3Y5ZEdpam5n?=
 =?utf-8?B?bDQ1c2lMdUw2TndkY3lhWVZVSTFyQWNkc3h0NEx0b3NYVERCaWoxZm5MVmkz?=
 =?utf-8?B?cnlJd0duQTJobmgzWlJyOXNLSG1OQXB4Nm9QL1duajhWUjJpaHhRTDJ6Tnd5?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d62be441-9ab4-4292-3b68-08dd66451107
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 17:48:18.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5b08RbBCU8rUegocroH2OkUh1wuTfdxXyxtzJksPnMZed4RdzvsSGlGikYiYdeEM9tRUTM837WcOcV2UgYKJPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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



On 3/13/25 11:34, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |   3 +
>   drivers/gpu/drm/xe/xe_vm.c     | 134 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h     |   2 +
>   3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b2f656b2a563..74e510cb0e47 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -194,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 067a9cedcad9..521f0032d9e2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -42,6 +42,14 @@
>   #include "xe_wa.h"
>   #include "xe_hmm.h"
>   
> +static const u16 xe_to_user_engine_class[] = {
> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> +};
> +
>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   {
>   	return vm->gpuvm.r_obj;
> @@ -3551,6 +3559,132 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> +{
> +	int size = -EINVAL;
> +
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = vm->faults.len * sizeof(struct xe_vm_fault);
> +		spin_unlock(&vm->faults.lock);
> +		break;
> +	default:
> +		break;
> +	}
> +	return size;
> +}
> +
> +static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 property,
> +					  int expected, int actual)
> +{
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		/*
> +		 * Number of faults may increase between calls to
> +		 * xe_vm_get_property_ioctl, so just report the
> +		 * number of faults the user requests if it's less
> +		 * than or equal to the number of faults in the VM
> +		 * fault array.
> +		 */
> +		if (actual < expected)
> +			return -EINVAL;
Application should be allowed to provide more memory than the needed. In 
return, the driver should update the arg->size with number of bytes 
actually written to the memory.
> +		break;
> +	default:
> +		if (actual != expected)
> +			return -EINVAL;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count;
> +
> +	count = args->size / sizeof(struct xe_vm_fault);
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, sizeof(struct xe_vm_fault));
> +
> +		store.address = entry->address;
> +		store.address_type = entry->address_type;
> +		store.address_precision = entry->address_precision;
> +		store.fault_level = entry->fault_level;
> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
> +		store.engine_instance = entry->engine_instance;
> +
> +		ret = copy_to_user(usr_ptr, &store, sizeof(struct xe_vm_fault));
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
Update the args->size with the amount of the written. Refer to my 
another comment above. Also document this in the comment of the interface.
> +	return ret;
> +}
> +
> +static int xe_vm_get_property_fill_data(struct xe_vm *vm,
> +					struct drm_xe_vm_get_property *args)
> +{
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_faults(vm, args);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int size, ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size = xe_vm_get_property_size(vm, args->property);
> +
> +	if (size < 0) {
> +		ret = size;
> +		goto put_vm;
> +	} else if (!args->size) {
> +		args->size = size;
> +		goto put_vm;
> +	}
> +
> +	ret = xe_vm_get_property_verify_size(vm, args->property,
> +					     args->size, size);
> +	if (XE_IOCTL_DBG(xe, ret)) {
> +		ret = -EINVAL;
> +		goto put_vm;
> +	}
> +
> +	ret = xe_vm_get_property_fill_data(vm, args);
> +
> +put_vm:
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>   /**
>    * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>    * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>   		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>   
>   void xe_vm_close_and_put(struct xe_vm *vm);
>   

