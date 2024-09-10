Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04585973CF7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 18:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C7410E881;
	Tue, 10 Sep 2024 16:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtKBJUD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12710E87B;
 Tue, 10 Sep 2024 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725984420; x=1757520420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9mg7NtFK4F98wT6NQxAxwcGR9BEO1EoQv3UwJOxsALg=;
 b=KtKBJUD+RLyyzSG9ZgjAUZjcx/IY23o+1VQA5KCyY2nVXyoiAQ83PIrx
 7TK8s+mMHd7eSpgxiyb+3T1G7NiiRxYAWf+d2JziqtZyuWdcqPM/6H0g0
 pFq9rTE9W41kaKucUzBWG2brrnDX7j9OyuS/1GkhNzi0fJGxsssea4CzI
 ZpX+NRq7F1qwlD3SyjoBQkZ+7o60c7WmJ72o9qaiqvCn/sTWxFagN4dRN
 zLpGVA1CL8PWizXgvR6HXRrZ4GfUPpKSLwfPmNb3PzOaaUSsoE5FhwmHh
 tLI/XKrYYkl/tkv9aqT9xnXMsOMVD4kOcymPYUecam4/bBy/UKeEY2Q50 Q==;
X-CSE-ConnectionGUID: dJ8r1NJ+TxiDf/06FajWkQ==
X-CSE-MsgGUID: QNQUbXmbQoqmwoBt0/7Cng==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50156533"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="50156533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:06:58 -0700
X-CSE-ConnectionGUID: ScIfXihHRi+OoogKucue9w==
X-CSE-MsgGUID: CaY4R/X/Tz68Rm22jKwTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71218648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:06:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:06:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:06:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:06:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjMTbZjgQjiNvf0EBSq+7gQLEMJ5Os5WBgyfWuOyWqTiOyUL9h8QpBozO3Hul2Ek51rrHf0DYjbeAcCgGW2YwylG4r+BRhNcxwvrQP/jSzEegeRzyOjx0pl24zIzdOPjbnqARatr4/DAm0haouSdoNzn8girIr4CuaKcZht6Dwn0rbWtfw7mb/X/QK2jfSTmP/zfJ6sRCmXQdPgdMS8bxaCme3MRJPNBt4+sdIqMA9HoCImv+rciM/NWQ+KEbs9iFExS8KcqSQRgl/PyqxuXlbzILovmjhPgXrAg8G/9gjPCmwKaH0nS65gkaX8gifRaT+yjYREyHZDFG2Q4FaaQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e7iir1GbOWRbfNLfF20OXvBEMVdgclU3drnbqYqcOY=;
 b=bOuxv5XUocaqUiCuEziCy1VXhzbOTJH2zGM/9UsgJWGw2XLB3eaiA5ICDwxYFG0tyi1Upyddm36Zwt3VwWZDyZf7i7/Rr18PUN58DXSyABuMXrnDR3uCNnfAX2vyZLqckvPe5Npzxdu/M/E4AijuyvrONUNNGBRkoF0iXiNtoeqHiAPFcYwC6XdrGTMLRIeJeaoIw/dwOpv2arAIBJMNSlXHqfJPVgHjiHuXgC5xfQuIg290ZS+j0PwwdaX1tp+I7r0WD006nAQ+av6GG9G3qloP8BPZYQY5+gx+ZlZ6QOpNCiuIIPmE5l3GW7UC+Xpky1aD2eEqkDwOoJA1SZgPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 16:06:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:06:54 +0000
Date: Tue, 10 Sep 2024 11:06:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Asahi Lina <lina@asahilina.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <mp3a32i4s4xqt6zgkf2bu5ygxw7iarbmgcaaigdnt3fgjx4huc@aake5i4o5dyj>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
 <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
 <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
 <dk67ybpmfdx5dabrcsu4ueesk4prcrifhwcvoo73epskyimyfa@x54wxfe6lagf>
 <ZuBrb0KTIxHtio7Z@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZuBrb0KTIxHtio7Z@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7465da-6ea2-4ce5-161a-08dcd1b296d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XahzVAD8TU0JHcQhFvGY9vPQJLm5eqqUVf52FHgNNZjgcDEB5PVoBZjJOlpt?=
 =?us-ascii?Q?d6YiHANML4PN2LA7JFS3lmC4lq1vTgx3SqHd4di2DLeQbnSRD0Cfmh2b2vmt?=
 =?us-ascii?Q?rxUPSPVcu6tVdW/aF1aaqJzgwHfa4JygjikTrkBkBVSMYI4b0NPLZowWPRwP?=
 =?us-ascii?Q?bKyNTPCYHSmRRIty0Wh45CDRPHkDh6ax5aT7S5jhshhlLEDaUt2VY1ZCn4Pd?=
 =?us-ascii?Q?0+54iUVCEpCh3Qsqonfso4vMDlzvYrmKY/wvG5QfEmcylgPrrjXQw4N0nDCW?=
 =?us-ascii?Q?7T8VdxxfBdroo2gbdgo4DZ3UpgAVvBnD0xpM5kpl4MLePOxRtqrFaUZlk0nk?=
 =?us-ascii?Q?onU8MzGVyWKgbPXjCtbi3AyEox8PHaxrVMjrnATwb/D00Vi+XScSgrmVyyPr?=
 =?us-ascii?Q?1nHuL46lwOunFSh2TMdzIaUopEmADbuJG7ynA9CAtIPsQ44KUNw2yKn5fDEr?=
 =?us-ascii?Q?Glicas/WqZCDaV1miQKAbBiA2D3+RHPXJol5lTMhptv9amDhEz/cDDWktHp1?=
 =?us-ascii?Q?kIlwGSObGNoUMfaKA6uE+1cE4i/XhBEhfnxX6DDYjr+k3a8WNUC5eGmIo+vb?=
 =?us-ascii?Q?xg2enisnI0aUNTCFynwPJsl/SVxDwy+fDameW86BV0pm0IX2FpTRSKgeh0f7?=
 =?us-ascii?Q?JQi6IpKG7I2A6eAH7oMmmSXRnhwn12zlUvnqGO2B+IYuxE4bI5J3B8lwMbxX?=
 =?us-ascii?Q?BghCcsu/LwPq4EdTdgbWSKQqbd6LnaxsVOxhjY6D7g82FIJVvoL4jxuJrIyB?=
 =?us-ascii?Q?J7IP+yWUSufF+TLe8h6+yyv+s8PrQ+Wk+Z0ryX+378KjTiQsGgKhS6sTs8GQ?=
 =?us-ascii?Q?cjQVxrOrdGLWQpnV2QmALwOU95iz8RioY/ZfF8/I0L+jk+kcTk8m3pGctun9?=
 =?us-ascii?Q?qXPRbOJvEfHHfiEWIozfKqjNkTWBFLPNDxMlsanyJUJglrnHw7HMArIDgMOO?=
 =?us-ascii?Q?C3cxQJI//+xQt4z8oKRxTssZ7UmhsJKxbwi0CfFGUndAZvtw2ja5ouiXNjvN?=
 =?us-ascii?Q?ryQCP2c9/TyRbBrtfuSK/p5p5vqhvp3MCSZZnXeh4/FdKAyS2mbmXC5Ai0B6?=
 =?us-ascii?Q?8Qj47u2uRaaLTNsrib/0Jc2pP4V7udGp+uLmBWgy6imdFGDF40W0XMscCmWw?=
 =?us-ascii?Q?h0duBuKivlIBr5wl8XR8Hx8IJ4VMsbjE/DYHKAhDYb75eM+F/9rfcrsNSZyi?=
 =?us-ascii?Q?TtQ/MJkM2ngC+0s5uxZ1lqPrqVHzpoZctrojB8CuitPDCbibLdZT13gDzl08?=
 =?us-ascii?Q?ZiSLTs9ZarDj1PLxBaA2aQg/PULeNnQ8sN6tBKliuWbQMODLnZZu2QTSaDTa?=
 =?us-ascii?Q?LtAN+wBHEclt8fVxieB/no5aPMhWskw5s/k7hJiea6Ap/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyotsM5xdsNMc9xPXJ6WIFUyqT+g4hF5xz1ROX2vk6XuGniLRKRqTwfvUnEd?=
 =?us-ascii?Q?bhlKYxFVwP3ukUqseNGiJtMUgimhrry9OcbulTaSVcBvuR7zIVTd1Vu04LQp?=
 =?us-ascii?Q?47ISab50ZKZjguRa98qdRzsVx9BJ9UDTvtzNf05jYrWZfz1HR5IyAxHs229x?=
 =?us-ascii?Q?FO7S3+ar+NE3sNtd9cnBQ1E7GjMtqsKU3kho10Xn1qYVuDWwdLhYohNEaw3v?=
 =?us-ascii?Q?kGtgTi1zwvqyGf93jcYgohXIzsVq1+6rd621nIOJUAKjiqwLCBCDREeUnlqj?=
 =?us-ascii?Q?5Sk1xcnkh7sjQ0JsKaXK+XLdQu+5uI9xlKxqYtNwah1l6CJSUdnSOYHIYeie?=
 =?us-ascii?Q?xVixkumNHAz5tqPNjAaIQcai1QmNpSFkpcD9Vv/P6zs/AA4i6fapAvDQmdCt?=
 =?us-ascii?Q?JWfxghLArT1jDl2J5II5ebdgnsG/ye1K3CWq+lTzNHlAD4RZLjLIpI7wJCjK?=
 =?us-ascii?Q?WdMQ4NYs7pPBhJWNJiOU5grDhRZkOpYv86kxwGgfxWJ8W5tfpa4oMt2vLJah?=
 =?us-ascii?Q?uOyyP+mF5aLTrjOtI/7nHkpQLqi74qsIJSkvgXE95fhXWnZMb/Pe+u5loh/7?=
 =?us-ascii?Q?Y6lSvccQJpRa+yHy/zo0wojygxk5zHP16Bky87dQsCw45PxP74hK9v0DjLAN?=
 =?us-ascii?Q?eN7ZylL3UmgmUvzlEUHyIRw60uDJAXqzrbUIjh72QBd3k5xO3cp4TOXi8/8X?=
 =?us-ascii?Q?dcuW8EsJ5Yht54l3mUXEVNa5kOD15kHWMETHJEudIUhxyxZTQpb8JNiU9HLb?=
 =?us-ascii?Q?Is7PHfFjt17VNZ6smx1vmYj14dos/C1hK5UWEyq4jbrgzH4/yLcys/pFD8P+?=
 =?us-ascii?Q?3Q1iduswejUS74JXv3rVyBrX4Dw6q6L3UXFjvyPF16IVjEafdb3i0hwIF3ws?=
 =?us-ascii?Q?zeDfYjp73G3e5xJvZtZlARO3B8hIoy2ritmzTE8BsNUFZeEmCh88aleHf5AZ?=
 =?us-ascii?Q?nfZt450tHB1r92r/n761S2P+BBl7mvBXYfAP4WmxuyShHtiIX/xB3NRU5Tcw?=
 =?us-ascii?Q?mUkKMmfUDID1+MrxLkacvh5O9zj41NXF7m25yn6AXeLqRkiZ9tN6nIXVdTrP?=
 =?us-ascii?Q?QkWea778toMtHPhbpYULhrbaxQ2TgC2W4vmPce5pY0kIB1qn/o1hLMePRNF7?=
 =?us-ascii?Q?xxyJaMyH9fbhHWJVGLbPIthHDmaKTneKrgTm5Ven+jUZKr+mQlpQHwfqK7kp?=
 =?us-ascii?Q?FKuaiFkBL5NV1DMz2zgY3+xTSlNHHEsdd6ClaMOCb23DAtQKTpCMrb40sKqU?=
 =?us-ascii?Q?HVm6TcJP2VU2tyrcYLNRhXhwVF2S6Wkxw7zpNMwFx/AUno8sHk0hhISHMlTu?=
 =?us-ascii?Q?44Mguroq10SkhXLX9Pd7YcdguZgkrM2wGgumpVRZn6l0d+n36YVvPNHALMGG?=
 =?us-ascii?Q?7XM6MfYv/0dCP6PLiqoBvFx1O98rrnIvKR699/fWzXJ5ThEe1T00YjgxgErI?=
 =?us-ascii?Q?MQiyuQbJxqh4lpa0r9ka1NwlEh/xVOAxf7R9Tfyeb7fA3XEqriah0h2ay7bT?=
 =?us-ascii?Q?429jdnQPYMeaVKjw4jVfBe0mkTL/u1p59nTVn8vwED1LUfVmYAd3q7VhvJOi?=
 =?us-ascii?Q?MlVDQbCQrXl3B0n3joX8mW3Sy6hSZgvJ+E/7MmqcxEoJtr7no/9MrNe975zR?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7465da-6ea2-4ce5-161a-08dcd1b296d2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:06:54.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg0YvJyoxJA/urwqtyH0tLE/pLyAGBUZ2OA0zDYR8/EpdMrUjVfgpAUAKB53fHsoRCi4DIsgfOGyvb71sK1OYsBiihCpacdN3HO5YHfGFTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
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

On Tue, Sep 10, 2024 at 06:53:19PM GMT, Raag Jadav wrote:
>On Mon, Sep 09, 2024 at 03:01:50PM -0500, Lucas De Marchi wrote:
>> On Sun, Sep 08, 2024 at 11:08:39PM GMT, Asahi Lina wrote:
>> > On 9/8/24 12:07 AM, Lucas De Marchi wrote:
>> > > On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
>> > > > On 9/6/24 6:42 PM, Raag Jadav wrote:
>> > > > > Introduce device wedged event, which will notify userspace of wedged
>> > > > > (hanged/unusable) state of the DRM device through a uevent. This is
>> > > > > useful especially in cases where the device is in unrecoverable state
>> > > > > and requires userspace intervention for recovery.
>> > > > >
>> > > > > Purpose of this implementation is to be vendor agnostic. Userspace
>> > > > > consumers (sysadmin) can define udev rules to parse this event and
>> > > > > take respective action to recover the device.
>> > > > >
>> > > > > Consumer expectations:
>> > > > > ----------------------
>> > > > > 1) Unbind driver
>> > > > > 2) Reset bus device
>> > > > > 3) Re-bind driver
>> > > >
>> > > > Is this supposed to be normative? For drm/asahi we have a "wedged"
>> > > > concept (firmware crashed), but the only possible recovery action is a
>> > > > full system reboot (which might still be desirable to allow userspace to
>> > > > trigger automatically in some scenarios) since there is no bus-level
>> > > > reset and no firmware reload possible.
>> > >
>> > > maybe let drivers hint possible/supported recovery mechanisms and then
>> > > sysadmin chooses what to do?
>> >
>> > How would we do this? A textual value for the event or something like
>> > that? ("WEDGED=bus-reset" vs "WEDGED=reboot"?)
>>
>> If there's a need for more than one, than I think exposing the supported
>> ones sorted by "side effect" in sysfs would be good. Something like:
>>
>> 	$ cat /sys/class/drm/card0/device/wedge_recover
>> 	rebind
>> 	bus-reset
>> 	reboot
>
>How do we expect the drivers to flag supported ones? Extra hooks?

The comment above... wedge_recover would be a sysfs exposed by the
driver to userspace with the supported mechanisms.

WEDGED=<mechanism> (which is also crafted by the driver or with explicit
functions in drm) would report to userspace the minimum
needed mechanism for recovery.

Lucas De Marchi
