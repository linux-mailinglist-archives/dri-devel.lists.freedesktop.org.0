Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC39074EA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 16:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845D10EA9A;
	Thu, 13 Jun 2024 14:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bL2P2cfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B12F10EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718288215; x=1749824215;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WAgIKctPXo618HX4GNh/QQLPeDPEo2vqY+Ess8QvtDc=;
 b=bL2P2cfMEL0V1qBOB0Mxw2q0M+J/Dy5zpfEqaH6dDNkTyoivzitfyTL3
 NzkUAN8CNS0XeFUyKPTk+aaoB3DRoyoW/aRztFiyN2ekkiFzUwwrJi/zU
 20qE7T71ppK61NdMIKjP6uLEAEzbji7DLMKXVDom39SRErcJxhG0t3lSX
 qTezawN66mPIOBM1s5YljCuCqZC7Py/QBh3ltKDqZvw7zfsGq1MnnWdc7
 EeFHmHZKkQIF/g+51BKCSrCeR1RfaiWJuPSUmhOBVlkwe3LtkPpuMUd/C
 resBLP6P4LSAAc8sA6jFH31TFKYL9KojJFnzNVDerDkEHrAj+lko89qSc w==;
X-CSE-ConnectionGUID: vGCNYamJRuKpKpD4zGK6OQ==
X-CSE-MsgGUID: m29zETTRQeKJQ+irzsYH/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18940495"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="18940495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 07:16:44 -0700
X-CSE-ConnectionGUID: 1iBJ2JfJTzeBFghhHRNdeg==
X-CSE-MsgGUID: ruPiU75oTBKCnWpVCABumA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="71377484"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 07:16:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 07:16:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 07:16:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 07:16:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 07:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg3Uvt9iVAsiJbdL/Y3btLVvtBNawZlTY3WAYAnjKiiHa5rpAw7NtZoBB6OVg7oQWCxcP3ZfbNqKp3f3phPYOkNPyk8/nRe3qVDdvYc9tjj8IfnV65nSP+oGGqt/zPIeRlLplFU1TfkgtqQX7VD+ktk8nNMutSUeeWG0EpfdPfX/9CIeNMMMDYEg65A3/BgEiivzHm0mBCOAmEqM5+EuRHN5r9iAGWfbFdXKx9ZtX46VH3zLAXhQdTC8WyaCoLCMSW3IwbMyGVRCEAtT5Iv8Mj4xrxn/7WGdRcb78uN6ERHOJ7poK4qIWbVwHBxi+B/GcA9bO/HkGTTAo+A8HAgheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiyNPNDaAjLbysq3UeXt41dqBsABhp2Bmj8JlgKKkZI=;
 b=WHVRfIpOF0qiSozsuk0VFbY4OG9pQjUwHtjpDEWS2epCn1MeYAhz+HsO6ZzgDyUz+VLu5v4sN5ShxXjcORwte3CzxeWzxgPaBJup7hUX8/PgcaDAmeuMv0z3dgg6crmgjD5oCdLs7lohbX85DjA0zfp85dQmauGJsei3w4B10ATn+7y/rd/g7GrlSBzkkKb49oFdVA2pg92Hxn/B3Ms/z90DlqqaNVT3U5vlMje4VuclfcOLsXzUvfkpgcqch0ZuL6+zhrsawUrpf+9OLzrwXNznMZU0ohW+S2j0QjGHa+pSjumFrexZtmLPGe4vG+HVMabXz9Nw6afmZ74gor/Udg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 14:16:38 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 14:16:38 +0000
Message-ID: <153c853c-9fbe-45ca-8a39-d382eeeb1871@intel.com>
Date: Thu, 13 Jun 2024 16:16:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: Omer Shpigelman <oshpigelman@habana.ai>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <ogabbay@kernel.org>, <zyehudai@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
 <a0e8f31e-fa12-4f48-853d-16c78bce1d76@intel.com>
Content-Language: en-US
In-Reply-To: <a0e8f31e-fa12-4f48-853d-16c78bce1d76@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5c26db-8323-4f20-d97a-08dc8bb37036
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUQ0WDM0WWNPZ2UrT1Vyb1VENk1iNzc3UVRxMHBubTN6UzBtVzUwYVQ1Z0Js?=
 =?utf-8?B?cGlBclRBeCtBbDFGZjl3NlEvdGlvZEF6M25IaE02KzVNL0tBeFc5eGhrU3ds?=
 =?utf-8?B?SGpNcjJtcXJsOGQ5TE52S3ZWVklrWmdkT2FqUktYNmhTeHFNaS9VUDRRK0Q0?=
 =?utf-8?B?a3FYbFZkaERRWkY3MEFQSWF5ZnpyTHJZZjZFYml4VkJ4NGNMemlBWjZIcG0y?=
 =?utf-8?B?aFFERDNKaDBjODAvUTIvOU1Eb2NtWVB6cjZWR3pPQStzOGpvcE5aTXNMWGh5?=
 =?utf-8?B?OEpXbm9yaHY4WFVmTDRPQ01sam43bE9qamVxdEZUYlJIaXpSc01EMHo3akNE?=
 =?utf-8?B?L1lzQnRVNmdZMjJ4dkdvNkR1bERLcEcwZEpjUWxiYytncjdJL2dKNENiWXlV?=
 =?utf-8?B?R0tkWmRkbnhyYTQ3Vll1WHpHVFdicXBIekRsV2hWTi9hSnpPa2JCRzNIVnZl?=
 =?utf-8?B?KzZjZ1l6QWVLL09pcHk3N2Z2T2dyYkJwOEp5dnVIenRmWWhjR0pDdFZYd1hh?=
 =?utf-8?B?U3Q2ZUJ3bUJWVjNoRGRBMUJYTjZEakxaMVFFakV3OHp0OWs2SUV6cWtNTzd2?=
 =?utf-8?B?ZS80bDAwRStuNnZJY0ZzSUpoMUVvbXpZNjZJTTJ1TjVsMmNNQXE0eWJMMlBE?=
 =?utf-8?B?Q2lFcHUxRCtUeWxBWXAwSFZ4cjVlMkR3RktWZFZYNGh6d3RwUjczRGdlSUVQ?=
 =?utf-8?B?TkZNVktqcmRqZjdOUWFKcUgyczAyVjNmTEhLaUFUcUdPMHozTmFEWC9qcnhR?=
 =?utf-8?B?N1hwdHM0YUpJQ2IxRm0xRXA0SHcyMU50RWhnVGJrSHd3Ym8rVEhHaG1RNWt6?=
 =?utf-8?B?RGkxL3ZzN3V6NVdYVEErVXJWWjBGWlJkQ1hac3kxcEtMTWJzUzVpWnlvMEpo?=
 =?utf-8?B?aGNFMWl5RXBjOGJSQTBGT3Y1dUhpS0ZBb3FtOU04SVdjTUhmSk5kVzN6dXY2?=
 =?utf-8?B?aE9tQ1VPclNIYXFGbnlEeDd0OVM1bHVRazZOcm50cDFybEpJTVJsQjg0czQ2?=
 =?utf-8?B?eFZYRTFjTURhMU9rSlFiK096eklxS3NuY0FlUVROaldVbkpIa2ZpVWJ4RVk1?=
 =?utf-8?B?dXprWVBXeUpMQjBaZGplZmhRUlRvQkZMODVEZTdVcUNzWVMxM25mS2hMSzZN?=
 =?utf-8?B?NFlLY2FWYWsrbjNuREZ5U1VaRkZtYVFMNWhVV2tGQmRtcG5kZEhLMGhmOXlz?=
 =?utf-8?B?Sm9MZjVvZW5IbHpDWU1FVG5OZTBSckdpR0I3alpBSDdIYUVxM1k3am03RTUy?=
 =?utf-8?B?Q1F6NVdBdzVJUUF1SmdBa0pCd1o2Ull3cm11YmNlM2RIYkN1dDVQYTF2YVdm?=
 =?utf-8?B?NGc4TXpKZkhnaEVhRzNLOVhobVkzSGFOTkpHQjdkWXdpV0djSjF5QTZXbzZt?=
 =?utf-8?B?WTR4RmRpQzQ4YUdiaC9zclhnaW1RQnREUzdpd1dxTHMxS293bGVWbGxBUng2?=
 =?utf-8?B?U3cweWI0a2I1RXBPelNOTDY1WktmbVA2Q1NDQ2J3UHN6VUF2TS9idzVTeStG?=
 =?utf-8?B?SGYvTXMwRnBzNlBUMUdoL1pPU1ZhTDlRVjRZOWtKYWJGeTlvb0pUZkljWmR1?=
 =?utf-8?B?QkgvNGZDVEcwNUZla21rZ21GU3A5aGZJRUF2M2k4aXZJK2dDbVdReTQzWXBE?=
 =?utf-8?B?RVhraXR1eXIyN2RmQ1JZeFAyVEtnZnNzOFJWRDF3VFhDb0hrNVlaNUg1YU5L?=
 =?utf-8?B?YXFXT2ZBamRCVnp6ZThiTVhKcWZnRTJ3RHBqOHorUkxXcnd1cG95ZTFGeVpE?=
 =?utf-8?Q?eCWIURqQuaRmSButuo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8102.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhsaklmR2VsUVpjRUxzL3VkWUdEVGVWSzBNQ0FVZ3l1SkdNdkkyMUxNcU1X?=
 =?utf-8?B?dmZXTVJXaVRnRFIzLzg5UTJFOXV1TWhsZW1hVHFmSFlvdGpYc3U0V0E1eEdN?=
 =?utf-8?B?cUQ5MFNLNHBXbS93dkRta3FjNHoyNzk4Rm9XZ3hEbUtkNldFVXBrYzFPU0lk?=
 =?utf-8?B?NzU4aS9tMEJSZWFkQ1NVc1V2WnN5ZmJSb2o5c0FjYk0vc1p2SnZsTFJPWjNH?=
 =?utf-8?B?NFlqdEVJNURadHJXMHBkY3lreUlXYUhScEhsdjVmMzZQYXZqZjg1SkZXLzln?=
 =?utf-8?B?SGkxemQzSysrTFlFSkJlN1UyL3JsNEQwSUl6aXdEZThDNnhkVTNZamdHSzN5?=
 =?utf-8?B?cU82aTBySU43NU51djhaaGdMZ3gySWcrWUZRTDNad0tIWnhiQWN2TXU3UTRi?=
 =?utf-8?B?amQxQU5MRG1XKysra2ZWeFNtUlJQYmpEVmxOYkp6TDhXR2tPc01STS9OZk5W?=
 =?utf-8?B?TFI5ZHdPMjF6NUZ6ZEpOYlRlZG12WlJjM3RIUWdLamFFUGVaNmJNY3haNkJq?=
 =?utf-8?B?M0IyYXhOWnMrMHAwQ1JkcnNZUW9sNFpYamRSOGlZamZmSzQ2b0hOSlprUk9x?=
 =?utf-8?B?ek84LzRWUUszVmVIcklYd3hLUExNenlKaGJtUlduQ1FFWFBnOU94RmRjMkJQ?=
 =?utf-8?B?cTFSZ0M3UjliQ1Q2aVZodlEzUGdzaGFIUXQ4c3VXOGF5a3ZkTFhrUmFua0F1?=
 =?utf-8?B?cnJXOHdUOVc2MDA3MUdja0xFTExWN1g2aGVCNlgyaEdlM3NrSDdsdC9qTzJY?=
 =?utf-8?B?dHdTVHVoRFZIVitNREJmaXdwbGFOZ1A2V09CZFF1NWlacXB0aHoyOVJFVE03?=
 =?utf-8?B?OW5vN0xmeUgxek00cDQwZzc5Y1E4L282YnIySlgyeGNoUFh2S0JXR0E5TTdY?=
 =?utf-8?B?OUxabWNnbFFieDhlRnZoemcrclZUOXQySlVMTHFRbnpVbFBzREZHbW4zTnNX?=
 =?utf-8?B?UExOejRzN3U1MnArQm5YNmU2YW1UajhPdXNIcklFWmxQNW5pdzA4b2E1dWo2?=
 =?utf-8?B?TEdBeWVjQlpqaStoMXh4RjU2WGVnS1phWG9iUUIyK1F6czBzNExiNTVwZFYx?=
 =?utf-8?B?elJBTlpMaWQ2enJVM1R3NGQ1UFVtMSsrcFgzUTB1Sm9sRXdCd1dUODNnc2FN?=
 =?utf-8?B?d1pzNlFtUG5tQWZab2RxT0lHZGQ0SXBJOEJJaTZJUDE1OHJIcHFyTUpQTEFY?=
 =?utf-8?B?S2xOdnlZNkJueDBPczVHdVpyOE5ucVZDMTBtY2lOUW5KOFNaSWxvQ1V4WnJh?=
 =?utf-8?B?bjhrZzZHci9mbGxHdlREcXZQdFVKWmxaT0t4WFpNUXlCQWNmQ3NhbmRYRkY5?=
 =?utf-8?B?c1ZvWlp2TlFEYVJscGVqMmRPMDdWVFAzcmNxRHhNbG9lQnB1WmFROW44My9X?=
 =?utf-8?B?TnV4ZEpSeE1UdFdDdG9tRG5WVjhGYUhqNEFLT0RySk1xM2NBQ09uNktzdTlq?=
 =?utf-8?B?NWROSXdCTnE5TFhwRCtubCsxV1QxS2t1OWFFcXd4TlRMTDFsTUUwVGVLQWYy?=
 =?utf-8?B?K3luTS93WFFsWktUQngrOXlTQ3FpYkV2TmhVZWhycXdwRmlvckQzTnE4a2U5?=
 =?utf-8?B?Z1hnRnRBWjNxN2l5dmcwQlNjZEF1NWRrb2Y1YWtqbDNPWDJITEcxQmN3Qk41?=
 =?utf-8?B?Vy93OVZJRnArTjdvczJtQkJHWEFjT0JKbUs5Tld1Y3NnY1FxZi90MlNRSlp5?=
 =?utf-8?B?RmZuaHUzTDBRZ090Y3FvWFpDdFB3ZWQ2SzB6T2krdmNmNFZkdk5BN1NkQ2o1?=
 =?utf-8?B?NWo0NHl3eHk5RHRFck9JVThQT0EwRS9sMS9oVGtBa0x4VDVKSHp5ZVI2SzRt?=
 =?utf-8?B?TWR5QStKckg0dWR1d2Q1RTBSV0N3ajg0V00rTllqTGM2UTRTTUtoeGJYRTlX?=
 =?utf-8?B?QTZGNFY1bVYxazNtVjYrNXdMLzhZSkFYclB2N3BmS2NvR2VDVGRteDJDSVB6?=
 =?utf-8?B?WnJHVTJ6SnBBR3V5b2RRckRvaHRlbVZ1aDE5MGV3eWFOVHg0U2YxMGxIMVo1?=
 =?utf-8?B?QzhlcDNNWHRZL3BsWG5WY0tISnp4aXBwdDJhMzdxcjVvWG9qbjVRRTdUQnp2?=
 =?utf-8?B?dzJEdmxjTzgrb1Y4SzNBWU5YZXA3K1UyeVJmNmhYV3dPNHk2aW0zNkN5YVlD?=
 =?utf-8?B?RS9LelliYS9pS1hFK0pybjdqdElabW1Mck82MkJUTGgwMWcyaWRNV0MrRUJs?=
 =?utf-8?Q?RhQGum5aXCr0yOxqFzkNfbk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5c26db-8323-4f20-d97a-08dc8bb37036
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 14:16:37.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adjyWooys1iX+xwUoOdoGKRvx05n8OYdsI00qXdFRE4RGbDyvvcpci7dFBMXNPApT4TwwIUJh1HAjDYNh9ryZQEUiwBVh53EsduONt7PgUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
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

On 6/13/24 15:01, Przemek Kitszel wrote:
> On 6/13/24 10:21, Omer Shpigelman wrote:

[...]

>> +
>> +int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 
>> out_data[], u32 *num_out_data)
>> +{
>> +    struct hbl_cn_device *hdev = cn_port->hdev;
>> +    struct hbl_cn_asic_port_funcs *port_funcs;
>> +    struct hbl_cn_stat *ignore;
>> +    int rc;
>> +
>> +    port_funcs = hdev->asic_funcs->port_funcs;
>> +
>> +    port_funcs->spmu_get_stats_info(cn_port, &ignore, num_out_data);
> 
> hard to ignore that you deref uninitialized pointer...

oh, sorry, I was in hurry, please disregard this particular comment

> 
> please consider going one step back and start with our internal mailing
> lists, thank you
> Przemek

but this option very much still holds

> 
> [...]
> 

