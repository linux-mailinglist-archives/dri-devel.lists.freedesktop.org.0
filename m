Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KQVFV6HjWkZ3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:55:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80A12B0CE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A8410E6E8;
	Thu, 12 Feb 2026 07:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KewKGDm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42EB10E0FD;
 Thu, 12 Feb 2026 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770882905; x=1802418905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6zZ9itGmJwuo74alx9OPMLDhPEgKuZt0jeh7XAsjVcA=;
 b=KewKGDm9Xxwx/Mf4hFA+sQvGYlHjjOPnukIcZQVNPakZQaDz95aAMgsY
 eNehRqMtZWvZfJt7UEnNX79qnqpO8I4FpdLqHBFGCR7TnozFDcU655fpQ
 eBOa4DLyX9IQrXqf2PhKWMNjtTY2czZqe3UmIytFvdOIoLcl4w90olT4E
 GSTP7d5kJLbop0HF7rjTLkT/5mX5t+29q7guHwDAQcjp+VFVxqpRRqeKD
 Woe9IV6mjjcrlKpctTRRz03qBQIxU5E4hEP+M1Y1c87ELvPqYseqjTUdE
 CFpRw7e+NrcO64Rezdc8Wr1VJrCZF+8Y9oANlm3mmNVWh/3SRnXUDyMRc A==;
X-CSE-ConnectionGUID: Bhsowj+eQhmYsYxOY1MN+A==
X-CSE-MsgGUID: ogqNQsNCQO+OfTnQczYNTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83415944"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83415944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 23:55:04 -0800
X-CSE-ConnectionGUID: A2IKQoF3RcCuMRruX+BEgw==
X-CSE-MsgGUID: KTI6qrhcRd+iWQR0pKYh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211506058"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 23:55:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 23:55:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 23:55:03 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 23:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBwIduqTF/TAOmIFqIKXAoaZdAymufOK0iwwYMFClCsvbcsLpcZx4OLhke8UvqJ9TUOk/2hxxJzCBgFd0XaeVSqQBmlCNrqtvK4aqllrqM5o774azVkQinO/xL4LtkRBClYJ0spcInD+kKyk1IkLm8oze18b3gDwbvNOfNXqyi5+k7caTWPMSpoDKpg4ZN1hZxuZ01tYXxU/uicsxq/XGJQqzLHOH0lIIJueFZtn3zuMvMXuebeyqLmGq+DLgoLMUGiDq34jD4yF/YBmHqzTdYnDEA+WAsge3SkCbx07u5LjE3+rpmZsVLxa8G/9vKk97b7Y9+/zPKUTk/YDmlyOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BW0lgWgKRe65jaG9DU0C6kBUCtkZFFFRqBOSjbgyaQ=;
 b=aZLuna0UcL6B2H2FfYuMRiALFWNnyVd5yUQzp6uVZiFopoo5REdNTQiOqKVrjThy9FE7ht0R0ch2PhlTgsImwIhuw+rN0RrKL0BBpkegMm/A7YhA4q5W7TWkoF4Cw7+lYcKejhxgItBk98gYiCSibYh+OE5weY6kOBFzQK/zx2zz2r0e31DB21VPZA1MF516RXgJBxDOBaOM5IKvnpjdO71r5Nupvmisnx729lCcvgeQZDSBhMDbIJnGXyffhl2FW0cyTLF0iqdaaLeR0zQ8LV38so2+pLMHjx2rfCvd2w+5IppyEfW7/YWbUgZ9GPYdlGQrKGytFFllFJqgvAZQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:54:56 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 07:54:56 +0000
Message-ID: <d05886d7-ffc7-4aa4-b94a-9c30a6081845@intel.com>
Date: Thu, 12 Feb 2026 13:24:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET
 recovery method
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <andrealmeid@igalia.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <mripard@kernel.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
 <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
 <baaa52a6b75c783b7f65e626b7577e383e0da5b8@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <baaa52a6b75c783b7f65e626b7577e383e0da5b8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a88624-c220-419b-5414-08de6a0c02b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3dQUk9OUVhkNUtjOVQrb3FWazk2NVhyc0ZCV3VrYjMwUEpqd2ZId2Z2bDZF?=
 =?utf-8?B?akhYU0tqcVUwR05XQnZtM29OTnJ1bEg4TEtvbmhBWEo0cTdSSHRibmtvbGNI?=
 =?utf-8?B?V0tuWXpTUmlQZVFjL0g4YVFQbTJvbGNJRzVrVXM0aWJWTU9qenBqSHVQcnpV?=
 =?utf-8?B?SFBvVHJlc1p5OXZoVjZVMkNidGtQQzRjeko3dXZvMVd6V0d3cVJjRkpVcnRm?=
 =?utf-8?B?eWlUeGZnU1ZWTzlDejJ5elBVK1VjUmN5RTY4L3Y3eG5JQUZZdEVBQWlGejEz?=
 =?utf-8?B?aTRjdllYQkdlN3kwd09sQkZvaHNGOXpjTCs1d1UvR1dmWmo2WXhmYUNveWR2?=
 =?utf-8?B?UXI3dG0zOGRzcGNVcC9BTGY0VS84TmtzTk5acE1WTUluajVzL3dSQU9HaW5Y?=
 =?utf-8?B?Z29TaW84ZUpKYlZSeTAwYzRvd0VueVMvM1FWTjIxY2lTZTVkN1JYZG9nVzJr?=
 =?utf-8?B?cEpyUVozdjA4Wk90VllSVUdROWo0eFlGYUVLT1c2d0tSSW9jMzh1T3ZSOVZI?=
 =?utf-8?B?MlR5NUg2WDRCZytlWndtNmhSRFdjbXJTMkN5aFcwMG02dXRZVDU5YVV4UFdY?=
 =?utf-8?B?NEZvNFJRWVo2dnNZYTNsMWNoMkJ3T1NZMFJvTDJDelFYWEF3NmprY3FYWldR?=
 =?utf-8?B?MnU2bkJyYmtFWVVodzM5aGYrdmVEbVovczFtZjVSaW5tTDlITkNmWXVCekNE?=
 =?utf-8?B?Q1hvdDJ6TmVnNkwvYnJrUFRkcytEdXhwd2Z2eXpEUnBEZUFsU1BHL1g0L1pP?=
 =?utf-8?B?Y0Z3ZUhiemhNYU1tQWx6MExxR1YzbDhDa3dyRC81QnJEY0dqM0dtc0c2YnhH?=
 =?utf-8?B?SnBnVXhnVStnS3B3VU5DY1BMTjkwMERQcjVOZDNRM1dFL2hOWmE5Qlg1Zk5p?=
 =?utf-8?B?V3dzdkI2RnZ6RGYybWxpdmNRVW8xb3FoOWoyU1dTNXVyMGpSTWNydEJFbDIr?=
 =?utf-8?B?aDNqbDZqV0NnbHczNlRVUk1RbWhmVkx2YTJPMHdEaU14RTZuOCtUS0k4V3R4?=
 =?utf-8?B?S2dxSVRYL1NqOVZKQU5FcmlSakxMSVI4ZEVaWXB6dm1mZkcySzlia2NLM3lr?=
 =?utf-8?B?dmhMTkQ3Q2Y2dmVOa21SOGlrL3lLV054NzhSUE5LbE91UFFweVlPMFdWVnVR?=
 =?utf-8?B?cWtJR3dtbU1DTEQ0UUliZUhac3dKRUpyRVU0V2lkNFhtY1drSytiQm5vRUdz?=
 =?utf-8?B?MWpaN2hhVjZhaXdSQlRKcTJPcGg4T1IrNFRwU3Z2QitLTThDSER6RlN3ZGhP?=
 =?utf-8?B?RnlLeitPa2QxOURveEh4RW1rWHlBaE9aWVhESHVMeExUWlc5VDBNcjBFT1Jq?=
 =?utf-8?B?NlZJWm50RElvdlFBZzVCNWhyVUtSSWhaTEsyWFpKSlhUdVdoZ0psdTZNbm12?=
 =?utf-8?B?WnhvNEVmOWtEV2lMMkY5MS9oMHVnSHVJTHhwZXU4dU1sMmFHVVVYUXh1V25n?=
 =?utf-8?B?ZWpoNFBWVlk5U3pHczAweFpmUExvQXRLcXB6TGdPcVdwQWgrQXJIbTd2ODlM?=
 =?utf-8?B?YzhGVFJkbTZrTTljVXhVYkV6TE44QzJtU2dkMEVWRDczQnh5cEExS0JUUnox?=
 =?utf-8?B?SmdpTDBVVVBsRjh0NXh1MEMrS1pjZk5GWm9HM2ZJUXlIV01wV2dpWHBGZm0x?=
 =?utf-8?B?elByd2QxMkxYZUUxamdpVjVQaE9BbzIvd1Z2Qkh1eE1pdGYwckFZS2t4SG9a?=
 =?utf-8?B?c1d4RnMycUJJSXB4bzFUTzRDZFlVUklva3E0ckhNVHVhRVZOckJnQVV4TDRa?=
 =?utf-8?B?TVlldEp1clpRa24vaUp3MWwrbmdVSkV4bXhkdWxVeWppK0VZUzM4ZmwyS1hy?=
 =?utf-8?B?OXVPNXRPMHlzeXZ1N1JCYzY3SnRLbjV6NU9pT0VBSGIvNXFUVEQxSkp3Wkt4?=
 =?utf-8?B?SEgwMWpYVXpTeXBYUlJwVEY0c2tpY0RyTzgvVGxIdk5CdTJ1eTNGdCtZUzh5?=
 =?utf-8?B?bDhYc2I3a056c0gyWG44VXIrYjA1TGV5L3N1eEswK1Z2SU8zcW5ESzV6TDJG?=
 =?utf-8?B?bTRkenlwdXdHWEY0WGVVU1AyMm9WcGF1ZllLeFlvdmF4SVRwMVAxZnpiMnZT?=
 =?utf-8?B?RlNqQWtkaGpGczN4WFU3RTdyUWtXOW45M1VVVE5MaERFNXoxNlhQR0tjRWdS?=
 =?utf-8?Q?UIeM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDdqbXJlaTB4UDZXSjNXUjIvWHJaUExySVBhUFZCVngxYlIza2VneEhPQW1s?=
 =?utf-8?B?OFRscVlOdWpVOHV3V0tYVVEzSkQvY0xEQkF4NmtMS1Q5MWhGVnFlYVRSeWZH?=
 =?utf-8?B?d1lHdjc1djQyK2J4bnoycUlNQXdtdXNmdjJWTEZkeGpBSGdxWGZiNGp0UFFi?=
 =?utf-8?B?Rzh1c3NrQzRKb1pJRk9Rc2dBTVdhNEw0enMxeUdzTFFFOVBUcFkweG5Mak1W?=
 =?utf-8?B?UldlYTlGY1JMbmJvb3had3kyU2wrQ1ZMUTdBQkJBbSs3Q1lkYUNDYm5YbzRp?=
 =?utf-8?B?YWZuQ0lsWmpXLy9XY0ZKdzN2cS9pMmR0ZHRlNFE4L3lWYUN5OW5mMWcwMjJB?=
 =?utf-8?B?dTRSditoVG5aTG44aUhnT2hUd2E3UFdyTVYwVXlGaFRNK1V6VDRoM2l0eGNP?=
 =?utf-8?B?THl6TTlsZ3Mra1lSQWFrZnZaZE9iOXpnSmNiRkNMd2tMMmdFR05qRXRKUVZ1?=
 =?utf-8?B?cm9lQU5MVnVsVVhFRlFSR3lIS1NHbzM4YUhyUEJxLytQNURYa3QyWWRzVGFl?=
 =?utf-8?B?VXdJRUgyNTFGdWNEQWlZejZIRlZGcXJBd01zempJUzZMRkZtYks3MkwxcXhC?=
 =?utf-8?B?dk8vSzIxMGVKYVBzMUYzWDV0YmJ1Y3MvVHRQY2lraW9XanU4YVNEaTc5cFEz?=
 =?utf-8?B?KzArYS80V09UUUZaZU1LSTZUbFEzU3BPb1lsNitvbzJXWVl1VWlOV3laRGxp?=
 =?utf-8?B?QnVtb0czS3ZKTTY3bXZ5SFRZbUR6a1ZCaXIyWXJLVHpvZEFKMXFsRlJXTXRr?=
 =?utf-8?B?L2xEVnJnbHNlbFMwTThGOGd2c1pLT29XcE9mVzljNkU2bGNDbFZtMGE0THRK?=
 =?utf-8?B?SGFmeFBlWkVrRmx2aFhpQTVsSVVHRlpzdzErcy9UdTZaNGtwTm9pWTh3K0lo?=
 =?utf-8?B?eUJPV25zRTlPZ0FSS1dkZTZrRlN5Q0ZXS0VLeERjWThyQkhzRGZNMTZqMnd5?=
 =?utf-8?B?ek9GdG50d3NCem1TWkx5cmZab3g2enUyVXovY29VSmpsRTdrSjViS1Vza1cz?=
 =?utf-8?B?S1p6ZHNiNzhrdVNiamhRb2pRckRnNUFpeEZGWjdoK0NmbVorMUg2SWtDMnFr?=
 =?utf-8?B?RHU2ZDN2TXpqR0piS1FJZEpUUGJMNmlQM1dIREh2RWM2WTdLd2FyOU5ETUx3?=
 =?utf-8?B?ZjZiVloyTzcydmxFNFBwMUR2aXJSZUpJalBEcjlXaStZbytkLzVaaTJOZkZl?=
 =?utf-8?B?aEZBc2FBQjlGYk5YeXRkNWtxT25ibDh3THJ1akpFMGVCK1FlQXFzdWZIMFNp?=
 =?utf-8?B?RkJEendReGpNeVg2ZnM2VEc5UnNWN2ZDWlVBRE5mWnFtMTRScSs0b3I5Yi8r?=
 =?utf-8?B?elVZSXVaTXRiLzNRMFUzbnF0TW05d1FzSXdMU3VPZFhxOGRmRzJpeGc2RzE2?=
 =?utf-8?B?dTBwWVJNZldEenhhcFZzdkZlRU8rUlhMTlJVOXZSVmdKb0pob0sxWjhIbzFl?=
 =?utf-8?B?U25BZEs2eGNZbXo4ODdrdk95cFQwZ2c3eU9DZGVUaWdnSS9uRU9Rck5uVlRi?=
 =?utf-8?B?UEZsckJBazhaTU9uVnMySXpERW1PN3FXc2VaUnltcUFsUGUyRmt2aFhNRUVG?=
 =?utf-8?B?RmpXUzF5TXRDeTV5MHlkdEpwaXdZSU1aeGdoTjdMWTFlb1hKU0VhZ1V1ZUN4?=
 =?utf-8?B?V0Q1RnBHY3N1eE1qSFZNWFlULzZsYmhLaDVMOWE2WTh4d0VHTVZFNWVNajM2?=
 =?utf-8?B?Sm9ycG1kNjk4eWx6UktIS0d1YS8ydU5jbmhDdCtCWmp6OXZMZUdwQkZ6RndD?=
 =?utf-8?B?ODdPTG4yOUUrMVA4S2RGQzVvc1RObCtsN2VJcmkyQ2ZvSGtJOFZHNHpWdmF0?=
 =?utf-8?B?U2JQTnVnTkxVdFF2TWZIY3NRTVFVTVArNDh5RVcydEhaOGhZaEVoREk3eVh4?=
 =?utf-8?B?cXdVT2hiUmdhbURFMTNZT0EweDE3SkRyZXNBcis1bllFVldTTTdyL1ZoaXg3?=
 =?utf-8?B?eU1Qcm5uZ3kzVHZ0SU5iY3VzVkdxTlFhWFRrK1FKV3BiNVdPM0x6NUEvcXV3?=
 =?utf-8?B?di9tZGNHUFA3QmdDejJSVlI3OWdNc09jUS9LQWdaVEFLSUdjRVU5dEZiRVZu?=
 =?utf-8?B?NjVJdXcrZ3VLZjU5QlYxWHpEVTB2TGxoRi9LbmlVZmw2NUZkRWZSYTNQTlpH?=
 =?utf-8?B?Mk1lTDF2SXpVbi9rNVVoZ085SmtHVVpQbDVhdXFmZVVFT016QVRNMTdZNWxQ?=
 =?utf-8?B?TEQwY0htQmk4c3BxU2plWnBaMkZzUFBveWdNdGl3MmJGQWhPcmp2UkdVVFRs?=
 =?utf-8?B?aG1VWm1kSGpMU0pvVzdVYkJ0cDhkNWwyWEFUam8xSU5ja2cwYmI0dFczcGJW?=
 =?utf-8?B?ZzlsRVVyU0xNNGlqb0lLT0hKUENOSWRackZ4dmlrT1huUDhPd3Q5WitXcWp1?=
 =?utf-8?Q?tvzPz2l5YuHOWdhM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a88624-c220-419b-5414-08de6a0c02b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:54:55.5194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yncmwfGrznKgw1rll/9r8zLgSeSzWoTocRyF0Tlhr5BrxO/Xw2p9cfteYsLpY/OJTcRKZh/TlC7Mktx906+QX41gh0MsSHhlkqVq7/QIMlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 9C80A12B0CE
X-Rspamd-Action: no action


On 11-02-2026 06:59 pm, Jani Nikula wrote:
> On Wed, 11 Feb 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
>> Add documentation for the DRM_WEDGE_RECOVERY_COLD_RESET recovery
>> method introduced for handling critical errors. This method is
>> designated for severe errors that compromise core device functionality
>> and are unrecoverable via recovery mechanisms such as driver reload or PCIe
>> bus reset. The documentation clarifies when this recovery method should be
>> used and its implications for userspace applications.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 73 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 72 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index d98428a592f1..eae6aef68876 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -418,7 +418,7 @@ needed.
>>   Recovery
>>   --------
>>   
>> -Current implementation defines four recovery methods, out of which, drivers
>> +Current implementation defines five recovery methods, out of which, drivers
> "several" to avoid having to update this?

Good catch! yes, will update it.

Thanks

-/Mallesh

>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>   more side-effects. See the section `Vendor Specific Recovery`_
>> @@ -435,6 +435,7 @@ following expectations.
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>>       vendor-specific vendor specific recovery method
>> +    cold-reset      full device cold reset required
>>       unknown         consumer policy
>>       =============== ========================================
>>   
