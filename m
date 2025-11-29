Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A4C94803
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08BF10E222;
	Sat, 29 Nov 2025 20:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg+S3KXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1569210E222
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448528; x=1795984528;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xrXOgkRJPnj7fys2q5hruD1VoY30upDCgu+VRQTIEYg=;
 b=Pg+S3KXXyobhze80V0D2CkIsaE+mPTmhLE8sUusWnCcnY/5TzjmdHpfY
 yYbkYfPelVAnG+FaY6mf4AhV42uMuXU3pd4mPhlBoRJpTkEbYtzuPuX1j
 gi0dur3W76DLgUpqeUBkPvnhsqfXrle3+XcObklmoxJ9CcVa3DWKchaRY
 j8qixvZVUm3+7W9tzJVgpZQRS35v0plpODC6BHv2DdqRaA/QGevNKM8kW
 dVFOevFlnLD1EFz/Q7nFXVUWBw6ojZifXcXD+iOwV7wEHmqUUEIk4FXXn
 ANkdeRxSb2n4SSX69QXvstNpddoS5aHfqagLhGsCvHIjbwKsDTLq2Jk/0 A==;
X-CSE-ConnectionGUID: plPw2yMzTHG5IZEFFzBqwg==
X-CSE-MsgGUID: BxGbWYd1Qv2GFbEEnx0eEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66597440"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="66597440"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:35:27 -0800
X-CSE-ConnectionGUID: 2om14FGDT6yhzJ3W2iEBGQ==
X-CSE-MsgGUID: dp2PMINmQMi4p3uxbbjc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="193378626"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:35:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:35:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 12:35:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8RK1VP+IwzD1lZea2DSr9M9zQP60ve1xQEFZH2X5+pXupbnUQD9Zeu3+m68zub4lbwZmtEtmeWtVaDX+5EpRfhyDSLXIYvD0/1vUElKxD/uqjYz5DYP/F+8glKWK+A+GfueJU5j5vpmYk8iQCGBpqsdnTPBTlUIy+ZFPXRBXtHVTTr0/XF8Dt03L16XX1OKClhDo68uyYvKi51Kb1pKJoL7mEEh3VNRdH/38n+XUYFvIGhDBrtmvrz8kGFzWVjxLAK4gsw5I8VBi0WdBXaFgoGDdMAwQg0bWc+iBnbTFYShCXnSOHjHhuyW1Gha3uYpUofkBCZgwxextNBFVPtzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiNGMBOMWRynGT3692tCWk1M2G9ggwy0SWb4iseUd4A=;
 b=GZPLbu4BXwTGMk2I6BWZSMC7JwhameVCkWZQ1r/G3smGMmZ6jvoPh7afr6MLZ5mDjeBBYgoyP97HchLFercyaMx1/f1u/xNCxbvEx9wptfc0H7VAv9rCyQm2R95Pi/PxMn5UnRK8jYsWyie+oxQXQ+4nkUwsQdwuymMVXopGc4XexfB/N4Pzqx58x5CubltVgVFLcPM/6wnOG7kwkZUW4iIDaL4lcaiIoNNE5PfvK5ARSuTEVN1OMKTPvXkNB/hdmlmmusfkIRKraSNKBLh5b0jmQSnt/LkPIXLmgxNM7tdXUqItkkjy5vTbOUTP+b+BzokdrxpFJf/0zQx/TJZd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 20:35:23 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 20:35:22 +0000
Message-ID: <6d67ec3a-54dc-4e26-ac5c-480b72a00399@intel.com>
Date: Sat, 29 Nov 2025 22:35:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel: goya: replace sprintf() with sysfs_emit()
To: Shi Hao <i.shihao.999@gmail.com>, <koby.elbaz@intel.com>
CC: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20251030183529.93665-1-i.shihao.999@gmail.com>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <20251030183529.93665-1-i.shihao.999@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8761ee-e79a-4485-5656-08de2f86d1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHYyVjBZT0JRU2ZpVVRKNDV1RnR6UkhJbENNV3FjUVI3VG5vSzNZdmNLdklB?=
 =?utf-8?B?Q2syK1NqYnptSW1MY2l1aEh4YnlOa2VyUytqbUhvazhJNVhCZ0lBbHlQZ25K?=
 =?utf-8?B?MzNEQWJmTWIwVFYyVDZjeUYwRmlqWUIrSEgwZHRCTjA0dlR3TDUwbVdwZktP?=
 =?utf-8?B?R0RWQ3A4VWZzYkpRck83SUxoY01Bc2pSM0pBendFNWJGcVBWekNERUl0Tmhw?=
 =?utf-8?B?NGZyVnpjdjZSUHdkZTd3NTJZWG85V3ZNZE1XeEt1dUg0MEw5dzdjcnhQOFdn?=
 =?utf-8?B?TzNzZGMydG1mckl2eDZpeS8rNzdEaWZ4ekRFUzlxaXdiMk1Sem1na3VmNUZH?=
 =?utf-8?B?ZHpzVGlMakxyOEhsMy95VEdrc2wvbXpkQzV3WTBGREZuckEyMDhEQ0s2TkV0?=
 =?utf-8?B?WC9EWjN1MTgrTjRMV0M4Zm02RGM1WGd4dXprbUc3dU5hY2hwYnJqWFJ4WlFo?=
 =?utf-8?B?Ky9QWTRDMCtaZE95VkpvcjdCVEVCWG10YzVUdW5QZHRIcGZPMUU1SVBHQWk3?=
 =?utf-8?B?TUN1aVp4ZDJsbllJZ3Bwa3hVSzdIenJhNm9BeEg3ekVnVm1oZTZmVHFmMmFQ?=
 =?utf-8?B?QlJKd1pmNEovU3ZYdmhhZWVxUllLVmFkRFV6RUlBSmJieWFGNHcvNVBWQzhr?=
 =?utf-8?B?QkNuNmNxTlFlbFA0dHhtQ2w5VS9kV3pOUnJDRFBLRERwdi80aW1pSllZWHh3?=
 =?utf-8?B?MDBVRkIxb0kzQXVBOHBYaEM4bUlUQjdnbW93QWF6Q2tyZlJqaXIzd1FkcTY5?=
 =?utf-8?B?OVJpd2ZMck1GTzZQVjd1T2IxZHZoTnArdCtuTDlLNkVVNnd5Z1dta3I2UkEw?=
 =?utf-8?B?cjRGZW0zMFdpaUxuM0tlUU9qMGZMeWhWZmZ5dVY2ekVQc25oU0wzWEx3RlA2?=
 =?utf-8?B?MXpjR2gzcGszSWk5R2dFd0EzallsMjJsWVR5Wll5K1dwclE3RG9kY0NIQXVz?=
 =?utf-8?B?S3ZpbzZ0WVA5MW5NSGtIK1k3SDlrTitLaTRSYndjMStPbU9XcGpUc1ZncHN3?=
 =?utf-8?B?UVVra0ptN1lIY3pGaWNxQk4yYmlyazc4YTRDMVI5b0FvRmwzcGRjSVI1T28v?=
 =?utf-8?B?dHU1UkFSMnk0QXN3ZWJ4a1Q0M1l1amFqZ2lwUFlzbGwyaW9SR3JVcDc1dkV3?=
 =?utf-8?B?ak03dzM3b2Q4M2pjemVZLy9PcjVOdlpwK2Rxck82VlV2d2Vld0V1Q0ZXK3Js?=
 =?utf-8?B?WFVpVUdFejl4S2ZpbE85UUl3TmxnSFJ1VnNEN3NsUXZxMWFnRE5wTDRTbWVv?=
 =?utf-8?B?dlNraUMzZ2dXY3ZhQ0xadUd2M3lTUjVKTDNDOTBkeVI3Y2lOQXcvTjhrVEVU?=
 =?utf-8?B?SW4wckxoc0hacXJwMXBuT1JYZDhab1dFTDZhT3JPR1RhOFdLc3BiY05Id0NR?=
 =?utf-8?B?NjJsbmQ2MFdaTkgwbWxtanRzQmpibGhkbGFBdGF5SkZRQUlVSzJDaWs5WUZq?=
 =?utf-8?B?OUtlYnZwczV3QU1hUkVmU0JUSXRKcTBsdVdhUmlCZ0JQZmxsUUZxajcvUzhy?=
 =?utf-8?B?UWg0UHh5dDhydEwreWNCR3d1Mmk4SVNqdVJXeVZERVdFc2xUaXh1d1JCTC9k?=
 =?utf-8?B?NG8xL3NLNGVjRERIbkJoWjk3UUM0ODVVU0NQcW1CYmlkdzNlTkhIWFpCTVVE?=
 =?utf-8?B?dFF2OHoxVTJLbFExOEhKc3VXa3J5cDdsMWRJREVrcko4NnBpeTZkdzNiUHhu?=
 =?utf-8?B?WHZjVkhTSnNodlNBQjlpTHNOTFJrMGJtYm5PQTIrL1RxUWhDVFd0aUI4NThX?=
 =?utf-8?B?Q3llU0lYanZ6L3RjM0RabjVERkhxTk01YlFkZzlmLzVaajVRd1I0SGh5M1N2?=
 =?utf-8?B?MWpCUzNSY085NzUyeWJVZ2dFM1M1THlsYXZ6S1hOOHJIU1JDeDA3cGFmbFJt?=
 =?utf-8?B?bUt0Q2JmY29XNEkzbkI5VDV5NmxnZVp5aVFMRzJneHRaVVFla1NmQzllRG8v?=
 =?utf-8?Q?OH5tyBs1a2kjQ2Yw5QsF8SJEaZttHL/g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUxGTk0yUjZoN1d4eHRRdVlBWVFDQ1NqbTNEbTdJSTNZckkwMVY1ei9vTmEx?=
 =?utf-8?B?cDZxZGF6a1FlaFVpbEJyTEE4cUxtMDN3ZitvS3pIemxvN2VsblllY2d4STND?=
 =?utf-8?B?UzMweUg3MWt6S3dqTlhVNDZBcisvaEhELzFhckYzUEpTRXhiNTBCdEZXS3A5?=
 =?utf-8?B?dkpXM0NHeFluSHd4bVY0TXpNU1A3Z3lzUm53VDQvclYvZUc5dVIvbW1kYXRt?=
 =?utf-8?B?dTAwdmhGT0x3RjZBK0NzeW40b0VieTd5dTJsbUhyVldzV08wRFpXMHdFa3dR?=
 =?utf-8?B?OFhDS0Fpcm51V2l0WHNDQndpU0VnbUxFVzBEREkxT0dvWEt4OEUxYUYrY1hV?=
 =?utf-8?B?MEhROWFXQktNVkprK3R5RVppTWxDVmVsbS9ZbnllaFFNV2lILzdoc1BSaHVT?=
 =?utf-8?B?amo2L3VSMXA5UnIxYWRzSUdyVkVYV0tjYWcyaXRLVmFXTCtrbThwbGJWSWhx?=
 =?utf-8?B?SjJRcHR6UWNvSGZHWFJaanJRQ1F4OVl0MFFRM2RjTTNEN1I3UldqZHRoRzFr?=
 =?utf-8?B?N2grcjJETms5VjNacW1WRzZvY3puVmR2SmxhTkFJK0NHUXU3QWY4SjZuZk9r?=
 =?utf-8?B?Y25Iek9nSUZKaWV3dkRXbjFYaEhLa1JGcGdaeGpvdU1ldER5SEV6T0YxRkkw?=
 =?utf-8?B?MWphZUVJT00zK0VqeC9oZFIzejZDdmVheFdra1QvNWZEaXgxVE0ra21XdUx2?=
 =?utf-8?B?cGN1WEpvbG9VTkZ4dFFsWEtkYXhEcHlsOEVpUlNkT1l5WXFHcnFub0lqVjEx?=
 =?utf-8?B?b01PdE0vK3I4cjBvdisyN0EwNC9abmlUQ3NJRUVTN0VQbkhCcEJSdnFkQmt5?=
 =?utf-8?B?eGJXNnRDc24rcFhzV2tLY0wyV2Noc01GT1ZBMGZhNnhReFRCaS9oODNSeTlI?=
 =?utf-8?B?T1IyZUc1UG9hN25mQWx0VHRlR1N5bXRIMEVBalhYR3NvNEt4Z1BXdUEzM1Nu?=
 =?utf-8?B?bEJwcjBiL0N0S1lRN3FZWWF3Q1RHdmppTnJweW1FTVRic3NGS0pnbmp1bjE3?=
 =?utf-8?B?RGVZdk1sUnBLK01iUkZjOXdSSjNqZXdjK2lDeERuMitlZ0FoTDBrTjVjSWtF?=
 =?utf-8?B?YVRiMVFYNFhVWVQxUEJmK0JwTmZiMWdNT0hXYVdodUQ0dkpNb0FjS1RkSE5a?=
 =?utf-8?B?cDYraWROdU9RSnM1SUVNQlNMbG5wRVpmV3Nla2xGOFhmU1dmRi96VVFNTWVh?=
 =?utf-8?B?dzVvYU1wc01LKzRLSGo3NkNkRUJDVmlrdmQ1b2RVZXdwbXgwOUhVVWxqc0tn?=
 =?utf-8?B?VXhsNEc5YXhGNVc0S1Y3TUNteEVQTUtqYTFiRW5LVUZiZjBwS0dZOTJHeWt1?=
 =?utf-8?B?T3ZqODZMNSs3NEF3QjZOQzJUeWxHcHU1Y241VzV4TjZ4UW1XUEtkSVdvRTJp?=
 =?utf-8?B?OTdxVVNNeitSZWVQMDM5b1RiZklZZVA0UWZsdFFpUlNhaTBxSml6V09kVXJZ?=
 =?utf-8?B?Rk9vaXkrcEYvM3pwWExoaWlHN2JkcEgybUJCYnNNT0NBOUxTUzNaZTZXdW9i?=
 =?utf-8?B?aFgvcTRZNE5ndGdMU1cra2dYQWVpVC81QjBmc0MrUGpaeHJQZ1JoTEIyM2la?=
 =?utf-8?B?ZlNDVkdOaXFjRG1nOGo2Q0dSV2c5ZzJTLzJHUzRXNzZwajdEMGpxeVBDN0Ev?=
 =?utf-8?B?TGhwVGt5VHVKZkZ1blRFRkt3V3FIOUlGVmkxNnVZZk5vcHU2dkRqZ0dFSFE4?=
 =?utf-8?B?Wm1MYVBnbm9sK1ZFbWU2Y0RLRTQ2b2pCWW4zU0hLeEZLNFAwUEpGVFo0RzFQ?=
 =?utf-8?B?TTg5RllGeWIzcC94V3JrV2dCdk0rdlNKbmtxSFA3NVFURDJFWFRpMDd6Wkpn?=
 =?utf-8?B?YlNYOUVCMWg0U0ZPUFIwaWFLZG1Nc3BSMDdYYjQ0TEZEMGtzZ0thZEkvclVT?=
 =?utf-8?B?ZjVpWHUvOUNZM2Fwa3NlVktSYzBNMUdWUnVrWlRmMk1UamE3Z0lnczNZUFJt?=
 =?utf-8?B?SVF3S1JjOWttWXNlTzRyWnVKc2NFRXpGSlN5MDU2aDNaK3djblU4MzlRaUh2?=
 =?utf-8?B?eW9CTU1jdFhrY2QyN2dub1phKzBySmcvUXE3VVhvcEQycjZvNkFzZnE4ZEtG?=
 =?utf-8?B?OFlUVCt6a1p2S0I1MDBnNng0RlMzTHQ2VktJS0ptQmN6eGgxelF2L3RlNnlD?=
 =?utf-8?B?Y2lSdVJtZENseFY1dTRjMjVPWitjZGpyR0xoUnRtZkNqeU5wRmVYK3hHSVBj?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8761ee-e79a-4485-5656-08de2f86d1ad
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 20:35:22.6840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLOxjNs32bc0Oehd2gchNrbdYuGFyOWLnL1yckeD44l415D6qWU/Nhlj3LVY2i8iLT4ULvOzCI5vf7pNx19bMOgys8XiXiio0aP3NpsC2UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
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

On 10/30/2025 8:35 PM, Shi Hao wrote:
> Replace deprecated sprintf() with sysfs_emit() in various sysfs show
> functions to avoid buffer overflows.
> 
> The sysfs_emit() function is specifically designed for sysfs show handlers
> and provides built-in bounds checking by limiting output to PAGE_SIZE,
> unlike sprintf() which has no bounds checking. This prevents buffer
> overflows that could result in kernel crashes or potential security
> vulnerabilities.
> 
> Convert sprintf() to sysfs_emit() as per kernel code practices and
> guidelines.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

Applied to accel/habanalabs-next, thanks.
