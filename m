Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9A907310
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 15:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE710E053;
	Thu, 13 Jun 2024 13:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HK3YrS6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA810E053
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718283752; x=1749819752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZktHZxOta7Bpf+b2NwH3nhUMJdj++FxDrN8p2mtA0dU=;
 b=HK3YrS6zg8sldPAe8WH2qd1McSfwyDmTpzIC6BugChIqQm4O9/cQkjbb
 xSi/y/FjjgSNebmYDdoVMvM7LJRdxtIK9nqQTHB6r52cXvBHcCICjkdev
 7JaGjo/OdQBjQ+3ojfsYO4pf0W8b1S8csOKOP5ot3ax6TyhEzQL96+fZB
 V02hUNmfExeHn22iO1YGIqgK5siNehfVHeBotCtDIxryhO4AO3yPbkv+L
 rECECfaI+1vtC4pR3fyFJpz0zS648hcxY2sAmsskY4hD3AcoRPqxFS7Gc
 OgOvLVdxUm2ptmp8riP5RcquocL7gArHHkTfNgEHCAZeOpfquRoKEhmzZ A==;
X-CSE-ConnectionGUID: 8kmV+u6LR12XhQeRXORUUQ==
X-CSE-MsgGUID: 48DtwvfMR+Cejp4XyTEgpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40508651"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40508651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:02:31 -0700
X-CSE-ConnectionGUID: Xuw8rGukRe6Fk57bYWPXeQ==
X-CSE-MsgGUID: fSKKhuVJSiSTm/MTsSrnEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40246837"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 06:01:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:01:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:01:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 06:01:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 06:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APMUEsJKXeKQXgh8Ld5FpgXU36PvEMK3t+CdOGmQ0+h5qIlVrh5rrbFy99NxMyRuO5iLzNPTPLcfj0uWy4b+B1TapGCeca1QFeNWxIQcR9ZKN9g5mbDNlXBSd/M2yCS3EzzpS3vj9zhT9jQuuF69qhUbOvX6tQzoTclGfV7oIrzFElVZm8zmBZ/CTOeEIE5JQSuhRH194LzFXsDK2gvdTKGd6ucJxjDPGvZYD2l1e3/h5bV3KtByzaF1BrNYDRmo8MQ9DrwZPk82x40c39IyoFcA87AyM6WTe6QE3fCnTS+eNwbF+5NYBmBrROJVRguKP1rISVJRpSHuUNjW1IkgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3m+xqT0Qi8VFq3zvXp+W7pSONbBXG4kwPU/vhus/Bs=;
 b=WJDd0doc1IXViW4DPATnkUUvcGflUpxQowOLhHm5XgjjYMbAS2dbfFuwyznHUnlqgPviYHWvtpX5Z6/vaOazMsoCR5qEa6bs83tm6g9aYjmKyoPCMpdxPc+D96lAnp+5JlYXf8RJTCTBFTBe56CSRMONjOeC/zobnWeDH+DTAeRvyCaJVvUS21qxTo2pF8jP4BGManzKir1B7zedHSb2ECzNh57+N+bxSVXb6Ybnb7tPl/gpUzZudp4pRdUf8Nfm+TrPEqOJJKYuJQQRPQ0EGyJmpM2YcP+slR8kAkDxFnBUjQQ+VIpBwhgTxpZtyguQM9Mr8ECZjfYqnnn7/XJBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 13:01:15 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 13:01:15 +0000
Message-ID: <a0e8f31e-fa12-4f48-853d-16c78bce1d76@intel.com>
Date: Thu, 13 Jun 2024 15:01:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
To: Omer Shpigelman <oshpigelman@habana.ai>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <ogabbay@kernel.org>, <zyehudai@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20240613082208.1439968-2-oshpigelman@habana.ai>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:803:118::17) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ac1b82-2fcb-4be3-f790-08dc8ba8e8a2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FuV1c0YnZ2NkhHNFNzQ3RaM244R2YyS1hrL3F0MUhqcllPaE42UDE3amV6?=
 =?utf-8?B?NytWVExVZnBYVGlCQ2tZL1QzT2I0NXhLNEZZeGlEc2lwNW5peGZQMGFLNXhB?=
 =?utf-8?B?RFBiM3RPWGgyc3N2WGI3eUlzcUJINnRGdmJYbmt4Ry9SMXhEZTlCYkhFSzA4?=
 =?utf-8?B?U01YT2tBeTZ4Q2krT0RTekV1Z2tONWIxSjFJVitPQXdpZ2puL1NhSHpsajNP?=
 =?utf-8?B?L255NTFyUVVhNDdjQ3h4a3JHdHZZS2hnOWw2MFJqamJqS0tlVUdIdDh0aUNZ?=
 =?utf-8?B?bmJrMVZsMUoraGUxYjZqZ2xaYjV1MVJDNlArT0t5VGNCd01uY0h3TVZSanJm?=
 =?utf-8?B?Qi92YmlNdmN2WVVKcWZxR0FiNVhTV3U2MmVJMFpGcURxNTBLVzFPRnlXRk9N?=
 =?utf-8?B?OVBNd2xvRGdORHBvVElXOGFvZHlZS3dwVjJIYlRkRi9xVG5RUXJHSHZ2dWRi?=
 =?utf-8?B?cUxtUWFiUlRncUtkcUoyS25OeklIelNBS2Exb2Y0eXZCT1VNTWpqcUhGR3FJ?=
 =?utf-8?B?Zm9MbkFjYWxINnJMYXdtaVdna0FaWmpXbFFJV3BNb282Sjgybnc5ZW5wTkxt?=
 =?utf-8?B?WnF1eGlJS01NV2U0TzdBVndKa25yWDdsUE1DYnBzREN6L3Rwbm15ME01TW53?=
 =?utf-8?B?bkdPVThtSlJuNzE3aTE1R2oybTl0SFgxWnQ0S0docVplVzRSNWFzT2MwK3Zj?=
 =?utf-8?B?dWNOWjQxemhsSFhFbm9HeTJqdUFDYVRDTTBuZGthMENObnlWaTNqV0lTQkpr?=
 =?utf-8?B?MzZxS092bkszY0RtdjZvelBVK1ZGOW5pVXJacCtkbzVGMkwxQ2xvd2ZIb21i?=
 =?utf-8?B?UWpsOHJVZk5GRUsrMnhNOWswTFFoSUJzNEx0b3lCdTNmV2xJcEd0c2drTUUw?=
 =?utf-8?B?WEFyeEZaZ2l4dnk2RmhCWExyaDVBNFN0emtJMmJBNEd1dDFCNXRTTGI3MFNj?=
 =?utf-8?B?ZENHSHlpVGxrcjVsNTAyMWlScVhLUFNPUitmUU1UREo0eFE2MUNiSTlJbUlQ?=
 =?utf-8?B?aHRDcXdub21RUmVnV2N5VU1qbnFzT1BHMlRTVmJUZG1UdEZiUkJzSXhsdHli?=
 =?utf-8?B?WW5MY0lVK2RxWHFDZnJOMjBBSmhhT2V0bitpZWxocGFFbDEwRDdtSGRuSUdQ?=
 =?utf-8?B?dTlRVi9ZaTlSRE1lZWtUSHJ6SGVia0x5OS82UDNGMkU4L3RHUmtVMWEyQjBx?=
 =?utf-8?B?NTdqa2U5ZmNwTEJsMDExSktDaGtxUzF6NWdhZFRUd042RTRhOEJMMDZhWHNL?=
 =?utf-8?B?UWtLTlRuMXhTODIzR0ZQTXBJczlZdVRnblpTNjJ4bStFb3YyUnFCWVFtS3c5?=
 =?utf-8?B?ZkxYb2xaNTNTd2RNZURjekducHRWek4vdTJNc3N1NU5PQU01QzZIdzVoWi9I?=
 =?utf-8?B?OTJFTFBHNDAvdFROYkN4Si9lSGZWaXRCUGtQVDM2VXZXZ1FnckEzVTJqKzRt?=
 =?utf-8?B?ZUMvTzA2bzcySkFZVHN4aHhXZTN3dUZkbG10cnZwTnA3QUxHcW5OYnYzTVJM?=
 =?utf-8?B?QW5qZFVxbXF0SnRST2oyUUQyTXZ0UkFCR2pxZEJtbmZ6SmEvYW9vU3VWWGtS?=
 =?utf-8?B?Uk5QM2V3MkMrSzBQeE9KTWRsb3RaVFRCTTNyd0o3U0xNYlJRaVZBSzMzaU0r?=
 =?utf-8?B?RjBmNFFGZ1ZDY09jTzNBUEp1dkdvcm9xLzlRU0VsbzZRS2pSZ0VVRGlzbHVK?=
 =?utf-8?B?RGZqMXZUR0RYMDVwL3FLWHM2eE5MODFHbTBkM2tTU1NVRWRIWHdEVS9memdK?=
 =?utf-8?Q?ZihtcFtllazcHwJE0YQMGni3kdoOo/8euE33CEN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8102.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhXeDNmTzN0RUY0QUtZcjZXYkI1M3JucVRPTU5xc0drOCtoSFRGN2hzY2tq?=
 =?utf-8?B?eE8rK1hyWkJxYVg0T0VDc0RYemtNTjloK05ldHE5eEFkcnk2S2o3eXA3dEor?=
 =?utf-8?B?RmRmVTJ4aTY0OHB6SGp2QzBmVmY2NXRHM2xtNGRUMWg4RXBkcmFqdGNyUmxv?=
 =?utf-8?B?bEJ5R0JxQkRNOUgrTXdOem90SXpMYVJ4MUkzUTFYSkxpWHpmNWJwK2VUV1lt?=
 =?utf-8?B?VVE4T2hhMXU5bEhLKzRYNlhnQWh5SVZFaWY4VkJVWktWTFVSMzU3TTNiaXR5?=
 =?utf-8?B?R29hd1laeGFONU9kRCsyaW0xTEo2Vjl2bHVRcEJYTDFHcjdjaTMrbFh3cW1P?=
 =?utf-8?B?ZmJHNGhpTjdaajVHd1FxQlR0ZG8rSnNRQU9BU3JMOFBtYkVqRWNMT1JtZzR3?=
 =?utf-8?B?bGFZRGNMaGZMNm0zOUdKbGg2cVd3V1BBYjhMMFo5YWJKTFdBbGhrR2xQMGox?=
 =?utf-8?B?Zk82QmhsRlZ1S3RtVnhjMVFQWU94c0F4MkpxMGkrTnVLc2ZvMGtFV2JrY1FN?=
 =?utf-8?B?MDBMamNwLzcyZVhaNDB5SDJsbGxlL3krbFpUODhSeFhmRHNxQXBaYlBjUURo?=
 =?utf-8?B?U1g5RnJ0Z2pMdGlBNUhsYzhNeWhPMUl2MHFnNzZXckdxQU1zQ202dE9UbGNH?=
 =?utf-8?B?YmhrNWZweVVEWjd6MTYrRXgyK2JodEx4empmZStNUFN0cGNBbmFXSEdlT1ZM?=
 =?utf-8?B?a053S043WEEvSFdqWjd0VWluVk5YTjhBTFpDckY0M0FwT2ZXUVBKZ2wwOWt2?=
 =?utf-8?B?MVROMTBkWUo5SWRiZGtWNkZVWStmQzRmNWNtNFFvaGJCdWphNzAxaFNHTzJ5?=
 =?utf-8?B?a2tqL2x3ZjJaa0hOMERzYVdrNmtMTWpFSzRXVFVGcnlWS0ZDamlXSmZyVUFi?=
 =?utf-8?B?bERKZDhEbGxHalJpMTJ3SDVkcFBDa3hPTVkwVWo4SGh5TU80YjdNekxoL1p0?=
 =?utf-8?B?K1crVUJFSTFyOCtnSmZWcmFJVDNQc2x6YlhvOG1iNWpXN1AzQW02OWp6ejdn?=
 =?utf-8?B?VTgwYXBBVnZsSkRPQmpObUdFVzl1Zys2NW5kVGtacjJDV0dTYVpKWW5OM0FJ?=
 =?utf-8?B?cW1GMkVCV2tWa3BjWndvQklHRUJhaTF6dGVCZEV0bVJ5b3lWRFlFVDJhRCtu?=
 =?utf-8?B?b2tjZDNxbktsUmVvTTY0VjZhUmJnZlpNZUpZWHRTbEZqVDZ2YWRiQWZtQVZ6?=
 =?utf-8?B?NmNNaFdKSmhiZWYzUDI3NzVtWHFVSDN3ZlNza3BNS0tQTmJNM0JUM09yWk1T?=
 =?utf-8?B?NG1qL2UwY25aN3REQ3lTMDlsVWZQSTBUSThRcDkrc3BiL3F5MUtQc2tSQ1Vl?=
 =?utf-8?B?Rk5qVHR4UmlhUndlN1RXMnpqVnJGSmdUY1N4dFYwaXNKTllKS1JrbXQzNUR5?=
 =?utf-8?B?MjVTNU1wQlRPbThYRFBNRElua3FrSFg3REZPb1c4clMxdWtDaXhWaUQ3V2ts?=
 =?utf-8?B?WWd1UTd6UDB6SWFnUEVPVVpRUys0VUI4Q2prVDVMRWdqS1NlZ0JkemtSV0xv?=
 =?utf-8?B?anRmbU5McE95WTgzZWsxVVpLdjYzMjJjWDQrSlVISHdyQkRpMFNCNitpSnBx?=
 =?utf-8?B?ZXhjZGd4Q1lYWXNKcGNvWi9vUGZ1R3N6VWRBWEF0V0Rrb3lTY0hrRUViQzFs?=
 =?utf-8?B?TG5kbkVrMXdidWs5cE5IUmppVE5oT0QrYldEemlvSksvWFd5V3h5cWNaMDhQ?=
 =?utf-8?B?MHJqODVmK1phOThqanYxdFJiYjQ4WTBpWHY0eTNaM3hoWW1Ma2V6RGltT3NR?=
 =?utf-8?B?NVFWZHJaTHkwajFoRy90OTlZa3ZCLzhhU1JQemtsdlZHcENHVytBUDV3cW5U?=
 =?utf-8?B?dVM2bVZDM0Y2THM5K20yaEkxdTdSU0Zic2dEcmdRNXJIWndxK0VOcjc3Ulo3?=
 =?utf-8?B?WjNEUDhJNWlSSnpDYVhMdU5odnBZTzd3YUV0YXI1L0dFT3pROEJQZCtCSTll?=
 =?utf-8?B?NkVwVnFsTWErT0d3ekdhdDdwVkRTdXlCM0xiMnNlTGNSWVovQkhzeU95b0p4?=
 =?utf-8?B?bDVCbm9MZ1ZFelBVQWU3RyswYkphNzh2b3dDT3UwVDFvS2c0Q3U2bXFnZFVv?=
 =?utf-8?B?RHV1NnhyWjhLRVVRMGUxMUVha1RCbUdXZXNKS2JCUDlkNHREVzNqL1IzWHRN?=
 =?utf-8?B?TWVlUVdNenAvR3FxOFBTU3lTc1FQd2Y5dTdBNWxNbXBvdnBBZEI4VWh4S3NV?=
 =?utf-8?Q?sVUdviciwN/xY9FkAYWbDic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ac1b82-2fcb-4be3-f790-08dc8ba8e8a2
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 13:01:15.5569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YpqJRlTo3JYFvaEikmm5FcNcnAiR8SiXfk8pC5nUvXs5q4yYlj94XlB2bYMrVOsrDKTSBwq36OtlGW20ESCaEgYhNUw1t2f1c2cHNCduec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

On 6/13/24 10:21, Omer Shpigelman wrote:
> Add the hbl_cn driver which will serve both Ethernet and InfiniBand
> drivers.
> hbl_cn is the layer which is used by the satellite drivers for many shared
> operations that are needed by both EN and IB subsystems like QPs, CQs etc.
> The CN driver is initialized via auxiliary bus by the habanalabs driver.
> 
> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> Co-developed-by: David Meriin <dmeriin@habana.ai>
> Signed-off-by: David Meriin <dmeriin@habana.ai>
> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> ---
>   .../device_drivers/ethernet/index.rst         |    1 +
>   .../device_drivers/ethernet/intel/hbl.rst     |   82 +
>   MAINTAINERS                                   |   11 +
>   drivers/net/ethernet/intel/Kconfig            |   20 +
>   drivers/net/ethernet/intel/Makefile           |    1 +
>   drivers/net/ethernet/intel/hbl_cn/Makefile    |    9 +
>   .../net/ethernet/intel/hbl_cn/common/Makefile |    3 +
>   .../net/ethernet/intel/hbl_cn/common/hbl_cn.c | 5954 +++++++++++++++++
>   .../net/ethernet/intel/hbl_cn/common/hbl_cn.h | 1627 +++++
>   .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |  220 +
>   .../intel/hbl_cn/common/hbl_cn_memory.c       |   40 +
>   .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c |   33 +
>   .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  |   13 +
>   include/linux/habanalabs/cpucp_if.h           |  125 +-
>   include/linux/habanalabs/hl_boot_if.h         |    9 +-
>   include/linux/net/intel/cn.h                  |  474 ++
>   include/linux/net/intel/cn_aux.h              |  298 +
>   include/linux/net/intel/cni.h                 |  636 ++
>   18 files changed, 9545 insertions(+), 11 deletions(-)

this is a very big patch, it asks for a split; what's worse, it's
proportional to the size of this series:
  146 files changed, 148514 insertions(+), 70 deletions(-)
which is just too big

[...]

> +Support
> +=======
> +For general information, go to the Intel support website at:
> +https://www.intel.com/support/
> +
> +If an issue is identified with the released source code on a supported kernel
> +with a supported adapter, email the specific information related to the issue
> +to intel-wired-lan@lists.osuosl.org.

I'm welcoming you to post next version of the driver to the IWL mailing
list, and before that, to go through our Intel path for ethernet
subsystem (rdma and a few smaller ones also go through that)
(that starts internally, I will PM you the details)

[...]

> +++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
> @@ -0,0 +1,5954 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#include "hbl_cn.h"
> +
> +#include <linux/file.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/pci.h>
> +#include <linux/slab.h>
> +
> +#define NIC_MIN_WQS_PER_PORT		2
> +
> +#define NIC_SEQ_RESETS_TIMEOUT_MS	15000 /* 15 seconds */
> +#define NIC_MAX_SEQ_RESETS		3
> +
> +#define HBL_CN_IPV4_PROTOCOL_UDP	17
> +
> +/* SOB mask is not expected to change across ASIC. Hence common defines. */
> +#define NIC_SOB_INC_MASK		0x80000000
> +#define NIC_SOB_VAL_MASK		0x7fff
> +
> +#define NIC_DUMP_QP_SZ			SZ_4K
> +
> +#define HBL_AUX2NIC(aux_dev)	\
> +	({ \
> +		struct hbl_aux_dev *__aux_dev = (aux_dev); \
> +		((__aux_dev)->type == HBL_AUX_DEV_ETH) ? \
> +		container_of(__aux_dev, struct hbl_cn_device, en_aux_dev) : \
> +		container_of(__aux_dev, struct hbl_cn_device, ib_aux_dev); \
> +	})

this should be a function

> +
> +#define RAND_STAT_CNT(cnt) \
> +	do { \
> +		u32 __cnt = get_random_u32(); \
> +		(cnt) = __cnt; \
> +		dev_info(hdev->dev, "port %d, %s: %u\n", port, #cnt, __cnt); \

no way for such message, ditto for the function

> +	} while (0)
> +
> +struct hbl_cn_stat hbl_cn_mac_fec_stats[] = {
> +	{"correctable_errors", 0x2, 0x3},
> +	{"uncorrectable_errors", 0x4, 0x5}
> +};
> +
> +struct hbl_cn_stat hbl_cn_mac_stats_rx[] = {
> +	{"Octets", 0x0},
> +	{"OctetsReceivedOK", 0x4},
> +	{"aAlignmentErrors", 0x8},
> +	{"aPAUSEMACCtrlFramesReceived", 0xC},
> +	{"aFrameTooLongErrors", 0x10},
> +	{"aInRangeLengthErrors", 0x14},
> +	{"aFramesReceivedOK", 0x18},
> +	{"aFrameCheckSequenceErrors", 0x1C},
> +	{"VLANReceivedOK", 0x20},
> +	{"ifInErrors", 0x24},
> +	{"ifInUcastPkts", 0x28},
> +	{"ifInMulticastPkts", 0x2C},
> +	{"ifInBroadcastPkts", 0x30},
> +	{"DropEvents", 0x34},
> +	{"Pkts", 0x38},
> +	{"UndersizePkts", 0x3C},
> +	{"Pkts64Octets", 0x40},
> +	{"Pkts65to127Octets", 0x44},
> +	{"Pkts128to255Octets", 0x48},
> +	{"Pkts256to511Octets", 0x4C},
> +	{"Pkts512to1023Octets", 0x50},
> +	{"Pkts1024to1518Octets", 0x54},
> +	{"Pkts1519toMaxOctets", 0x58},
> +	{"OversizePkts", 0x5C},
> +	{"Jabbers", 0x60},
> +	{"Fragments", 0x64},
> +	{"aCBFCPAUSERx0", 0x68},
> +	{"aCBFCPAUSERx1", 0x6C},
> +	{"aCBFCPAUSERx2", 0x70},
> +	{"aCBFCPAUSERx3", 0x74},
> +	{"aCBFCPAUSERx4", 0x78},
> +	{"aCBFCPAUSERx5", 0x7C},
> +	{"aCBFCPAUSERx6", 0x80},
> +	{"aCBFCPAUSERx7", 0x84},
> +	{"aMACControlFramesReceived", 0x88}
> +};
> +
> +struct hbl_cn_stat hbl_cn_mac_stats_tx[] = {
> +	{"Octets", 0x0},
> +	{"OctetsTransmittedOK", 0x4},
> +	{"aPAUSEMACCtrlFramesTransmitted", 0x8},
> +	{"aFramesTransmittedOK", 0xC},
> +	{"VLANTransmittedOK", 0x10},
> +	{"ifOutErrors", 0x14},
> +	{"ifOutUcastPkts", 0x18},
> +	{"ifOutMulticastPkts", 0x1C},
> +	{"ifOutBroadcastPkts", 0x20},
> +	{"Pkts64Octets", 0x24},
> +	{"Pkts65to127Octets", 0x28},
> +	{"Pkts128to255Octets", 0x2C},
> +	{"Pkts256to511Octets", 0x30},
> +	{"Pkts512to1023Octets", 0x34},
> +	{"Pkts1024to1518Octets", 0x38},
> +	{"Pkts1519toMaxOctets", 0x3C},
> +	{"aCBFCPAUSETx0", 0x40},
> +	{"aCBFCPAUSETx1", 0x44},
> +	{"aCBFCPAUSETx2", 0x48},
> +	{"aCBFCPAUSETx3", 0x4C},
> +	{"aCBFCPAUSETx4", 0x50},
> +	{"aCBFCPAUSETx5", 0x54},
> +	{"aCBFCPAUSETx6", 0x58},
> +	{"aCBFCPAUSETx7", 0x5C},
> +	{"aMACControlFramesTx", 0x60},
> +	{"Pkts", 0x64}
> +};
> +
> +static const char pcs_counters_str[][ETH_GSTRING_LEN] = {
> +	{"pcs_local_faults"},
> +	{"pcs_remote_faults"},
> +	{"pcs_remote_fault_reconfig"},
> +	{"pcs_link_restores"},
> +	{"pcs_link_toggles"},
> +};
> +
> +static size_t pcs_counters_str_len = ARRAY_SIZE(pcs_counters_str);
> +size_t hbl_cn_mac_fec_stats_len = ARRAY_SIZE(hbl_cn_mac_fec_stats);
> +size_t hbl_cn_mac_stats_rx_len = ARRAY_SIZE(hbl_cn_mac_stats_rx);
> +size_t hbl_cn_mac_stats_tx_len = ARRAY_SIZE(hbl_cn_mac_stats_tx);

why those are not const?

> +
> +static void qps_stop(struct hbl_cn_device *hdev);
> +static void qp_destroy_work(struct work_struct *work);
> +static int __user_wq_arr_unset(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type);
> +static void user_cq_destroy(struct kref *kref);
> +static void set_app_params_clear(struct hbl_cn_device *hdev);
> +static int hbl_cn_ib_cmd_ctrl(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx, u32 op, void *input,
> +			      void *output);
> +static int hbl_cn_ib_query_mem_handle(struct hbl_aux_dev *ib_aux_dev, u64 mem_handle,
> +				      struct hbl_ib_mem_info *info);
> +
> +static void hbl_cn_reset_stats_counters_port(struct hbl_cn_device *hdev, u32 port);
> +static void hbl_cn_late_init(struct hbl_cn_device *hdev);
> +static void hbl_cn_late_fini(struct hbl_cn_device *hdev);
> +static int hbl_cn_sw_init(struct hbl_cn_device *hdev);
> +static void hbl_cn_sw_fini(struct hbl_cn_device *hdev);
> +static void hbl_cn_spmu_init(struct hbl_cn_port *cn_port, bool full);
> +static int hbl_cn_cmd_port_check(struct hbl_cn_device *hdev, u32 port, u32 flags);
> +static void hbl_cn_qps_stop(struct hbl_cn_port *cn_port);
> +
> +static int hbl_cn_request_irqs(struct hbl_cn_device *hdev)
> +{
> +	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
> +
> +	return asic_funcs->request_irqs(hdev);
> +}
> +
> +static void hbl_cn_free_irqs(struct hbl_cn_device *hdev)
> +{
> +	struct hbl_cn_asic_funcs *asic_funcs =  hdev->asic_funcs;
> +
> +	asic_funcs->free_irqs(hdev);
> +}
> +
> +static void hbl_cn_synchronize_irqs(struct hbl_aux_dev *cn_aux_dev)
> +{
> +	struct hbl_cn_device *hdev = cn_aux_dev->priv;
> +	struct hbl_cn_asic_funcs *asic_funcs;
> +
> +	asic_funcs = hdev->asic_funcs;
> +
> +	asic_funcs->synchronize_irqs(hdev);
> +}
> +
> +void hbl_cn_get_frac_info(u64 numerator, u64 denominator, u64 *integer, u64 *exp)
> +{
> +	u64 high_digit_n, high_digit_d, integer_tmp, exp_tmp;
> +	u8 num_digits_n, num_digits_d;
> +	int i;
> +
> +	num_digits_d = hbl_cn_get_num_of_digits(denominator);
> +	high_digit_d = denominator;
> +	for (i = 0; i < num_digits_d - 1; i++)
> +		high_digit_d /= 10;
> +
> +	integer_tmp = 0;
> +	exp_tmp = 0;
> +
> +	if (numerator) {
> +		num_digits_n = hbl_cn_get_num_of_digits(numerator);
> +		high_digit_n = numerator;
> +		for (i = 0; i < num_digits_n - 1; i++)
> +			high_digit_n /= 10;
> +
> +		exp_tmp = num_digits_d - num_digits_n;
> +
> +		if (high_digit_n < high_digit_d) {
> +			high_digit_n *= 10;
> +			exp_tmp++;
> +		}
> +
> +		integer_tmp = div_u64(high_digit_n, high_digit_d);
> +	}
> +
> +	*integer = integer_tmp;
> +	*exp = exp_tmp;
> +}

this function sounds suspicious for a network driver, what do you need
it for?

> +
> +int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data[], u32 *num_out_data)
> +{
> +	struct hbl_cn_device *hdev = cn_port->hdev;
> +	struct hbl_cn_asic_port_funcs *port_funcs;
> +	struct hbl_cn_stat *ignore;
> +	int rc;
> +
> +	port_funcs = hdev->asic_funcs->port_funcs;
> +
> +	port_funcs->spmu_get_stats_info(cn_port, &ignore, num_out_data);

hard to ignore that you deref uninitialized pointer...

please consider going one step back and start with our internal mailing
lists, thank you
Przemek

[...]
