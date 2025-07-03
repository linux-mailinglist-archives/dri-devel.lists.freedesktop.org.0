Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43508AF6AC6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 08:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CABD10E7CA;
	Thu,  3 Jul 2025 06:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE7lWKfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32C410E7C7;
 Thu,  3 Jul 2025 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751525450; x=1783061450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UCPMNh1U63zHHSQ1vcKYN0JV2w0PlzIDo7P8hlL1TsE=;
 b=bE7lWKfMqoqtlRzEUNyPLs8aFDfSBVu4WL3FBpXdF0df4ZphycqM0ira
 c9ij88504awRy+BCVIkVvVszP597aMU78l+C/ZEncZ3gx/et/x4dSXPXw
 C6eZyv0HzdBZhaimtL/EVy5zlO3YvN9kUmxFKTfNPsBTsjtnvR8+BcvVa
 WcO4MejKLZ1JN6jdiKIbf0D18fzgpRcdhRTTqCHbyYpMez3hLo18SMFnH
 zpTx2x96r/mikpyfHJQlDhOGymRK0J4dWXhEmm+W1n7G3BbywRSorUm5o
 sWvTAwSvffLtNY6FKMz/X9x6eSZlzEKSCw1sfysbzocGCdcLbBZFB+NNq g==;
X-CSE-ConnectionGUID: DJHl++bBQOWPPj4Z4tQ0hw==
X-CSE-MsgGUID: E/NUOXOgQU6w5Gydq2K9Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76385701"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="76385701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:50:50 -0700
X-CSE-ConnectionGUID: G/4mHZOSQJaQ26bGHjcnnQ==
X-CSE-MsgGUID: /j+v+s+bSf2wJerIo/nG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="185307940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:50:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:50:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 23:50:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bki6S1255Vsasa7PLNPfPxye7M6WRaczXDgNwh15p7muM6yiGzjqWvq0o1u3SWq+3pyrwapn3EeYcX28xkDltHbPRFgnWNDzjvbtxvl7pAakbbwoYHhoj+iMAj6/WXytiRZf4LVowhzjaktDSqjtvh0/n099Sw7TKGeXkBaOUv6Dapl1oPXeX8RmE11MxbrPxXvDpBGJQTHrQ+YGcjvBIod7khB3K3Wx9RMBJ8DWENSBdXUqbHXJ4I2CbsyxS9oJDnkDT2I1HUPqePXtqCS2aWukz63d+nfpMA9NLWgnWG0G64Wg7qdN3D4eW8Y6rpuSi8efQhOhh0p4tmYfqDI2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqTC4+J4QB7tGEQ1a9BkxBjfDpHixD+87T/9bwBKqII=;
 b=rbTkQmrW9xhWKPgJxG9npt8sCHwXflMjg141++eiWxcCXpCN6UtoOGjN4foRTvlTCfEr2Sda6lmqN85RTmDfI+jVqgNmmWOX4HVHjfA6W3VaCDanAJU/ZIZiTL0jhTk3PrQ0lfoWJSbaTiIN0rn7uVZm514GVKfLbtN3G9h1uR2ttlM23s3N2NeXI+09HPPfJpuVt8nT4bXtTV7f1QbnguM4GBYNeS5/5POiYVOhuQq0222ejiK/T4OQ5HYdQBSNkYHYf227qPw83bVsjTcPlePucUzw70lcAKGrGb3RH9pXWWSQlA3iz4Uq+xSkJyxlIWr25Mq8ArAPYlnCszPSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8830.namprd11.prod.outlook.com (2603:10b6:208:599::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.34; Thu, 3 Jul 2025 06:50:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 06:50:32 +0000
Message-ID: <8b38b102-52ad-4aec-8ca6-0028d731454b@intel.com>
Date: Thu, 3 Jul 2025 12:20:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-2-riana.tauro@intel.com>
 <aGYBu-6bAEc1il4O@black.fi.intel.com>
 <170d80ad-a12d-4a31-bb6c-abb8a132a689@intel.com>
 <aGYl7IVj5T92VbXh@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGYl7IVj5T92VbXh@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0c4740-92e2-4e61-41cd-08ddb9fde7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZlOGdBN2NSeGc0VHJ1UUFTK1M1Ly9wd2oyVWhXd1FldHdyWHp1YUNwV0hi?=
 =?utf-8?B?djNBTENKemNScWkrR0xYUGptQ2J3YUxrbEtDRDZZQVFlRERyTUhlNkN6cG1W?=
 =?utf-8?B?MjhzTVVGVEI3Vlc0Ky9OWDZYYXhnMjdPeHg4bTRpNnBSK2h5bi9qNXc3S1gv?=
 =?utf-8?B?M3p1bVVDSzZjcFNGM25id2RwclJ5R09vMVFnT1FwVFR0eXhjRmxFVWFtTFN4?=
 =?utf-8?B?SVBUS3M3Y1F0UDJlSnIvdWZzdG14RzFTSUlwRlRmTXo4MG5kTXdTYU92d0Vz?=
 =?utf-8?B?ODFnaFBiOVVReEhQajE5cHZIVlJNZk83T0l5UTM2KzNFODVvb01ZL2I2MFg2?=
 =?utf-8?B?cGl2R1p4Vi9zdmxlNTc2YjJDdXlUQ1RkVGxvWVk4bktkTVZiTkpiVXM4TnRQ?=
 =?utf-8?B?Q3JZL2x2TjBpZXVtVzJSV0x0R3lUekQxbjlkUU40TFdtVlVMY3pYdmU3MTJw?=
 =?utf-8?B?cU5yT0J0OFZIY3Q3STZKVlVLbDRpZitaZm5VNlI0cWp4aTlQeGhqNEgySlVL?=
 =?utf-8?B?RGdIOFlJR2Q1TUpTU3N6em85Q1RUQVlLK2lMbFB4NEJwMjBmRXk4V3NpdmNH?=
 =?utf-8?B?VkNxRlV1TnpBWVMwS2dGQWlQaXVHNDNCaXVTbmVNYU80WjBrQUJqU3J3bVdm?=
 =?utf-8?B?V3REcE5GTkdjdUxoUGVHdys3WnVZTE9RK01kREhyckgvc2czd0g2bDlvYUY3?=
 =?utf-8?B?bWRmSS9jOHY3VXBuMDJ1NTBPdkFwOXZGcUFEVERDc3RNVG4rcGtKOEFZTXU3?=
 =?utf-8?B?ZWlBak43cW02UnZCZVliTXZkRjlCOG5aa29QQnE0T1k0c1N2SG50NlFjL0h5?=
 =?utf-8?B?R2dmQzd0V3hZckhKTnpxRWl0dGgvRXJWNUVwWWRHT2NJV3NObS9Pei8rY3Zz?=
 =?utf-8?B?bFhPTFBUMXB0OEh3RkNlTTRWcVZQYmphVjd1VFlwZ2pMSTQvUi9JdEJIQVZ3?=
 =?utf-8?B?cWF2RjFkUmp0Ykp2STFoV2t2SzE3clhrMnNna21tZlZKamwwVDAySnhDeThT?=
 =?utf-8?B?aFE5cjhORmJxdFlvaVYzZzB2bmpxbGNpeVMxcnFpNFVRMGRqQkowWmkvRlo2?=
 =?utf-8?B?Wm1zZ2laUktQTUI0czNEY2xST3dBOHZ4eVh3WHpoZ1hRL080ZEx1T2MzMnFS?=
 =?utf-8?B?aWRnMjVLTXBnLzdWVkROQjR5UnJMRW9wMmFyZlUwZXppTjFvNm03TGFRUTNY?=
 =?utf-8?B?UlpOeWVMZy9TMUx5dHdlQzM3VmgvZnk0T1hrL1ArV082SEg4SUkxYVRIeHRE?=
 =?utf-8?B?OTJzbDNvWGRKZjkvSlFxRU45ZGFWVExOTk1JWHFNcndBSEVVM0RwdDdUQ05J?=
 =?utf-8?B?U3c4VFl5WE9KdThraElWT0UrOFhQVXJGN0psTEllblYzQ044emV2WklhY1px?=
 =?utf-8?B?aXZ4VHNFZWJzMUxjRUFOajF4MkdHSFdtaUhqdWw3K0Z0Y3V0eTJpSFJveTBq?=
 =?utf-8?B?VkxCNUtzTUZQVmV6cFhqZ3FGVlE4bmVYak50S1hoTEIxMlpyeVpKZHI2enpI?=
 =?utf-8?B?am1pa0RBcllqeTdUTVBXaHlBZ05CTkNIVytmaUdKNDdBdk9hNndEYzBROWhY?=
 =?utf-8?B?WGM3NEVWMitBOXVobUdEMkhVLy8zZTRxWWJMaDJIK1VrNVQxUWJxd1cxemUr?=
 =?utf-8?B?c0tnQ1Y0Q0crYkRqcGQrT0pHN3VENGZSZkhiVVdzZTh5MGZWTmZFUzAxSkhk?=
 =?utf-8?B?YWtNZWtZRmJZMXhMbkJXdXh0VTUrMFVKeEVXb0FuK2wwMlFwZDZtaXd2Q3l3?=
 =?utf-8?B?Nk1FOTBpTjNYSFQxQjRBWGRkc0tkSVRHdDh6YVFqUkhUdE5Rdm1rbUxINGRr?=
 =?utf-8?B?bTNMLzkxakFtOGxqMnlKcStuT09ZUEdjU1gwdnhHQWkwMnpLWGpFV2ZyUkpM?=
 =?utf-8?B?dkxGQk16UHZZRWZQMEowOEN1anJuT0w4YW1ORnp1dUFYdXZyQy9YU1gvZmRX?=
 =?utf-8?Q?B0aiLiuRAmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHNzTU5CZUZzTlNkeTdYWUtaNHU4azQ0MU1YQW5tVytlVzRKc21jdDhXNXRn?=
 =?utf-8?B?SG54NnlxUlliQTlPTVRNZllnUzhqd3FOMmZ6SHNMbmRmaitaYUszYng3S1pv?=
 =?utf-8?B?V3dZbGVtWGU2VFYzakVOdlBpc0gybm5CNE9ReHN2L2J2ZnlnWDZLOFZ1OFZq?=
 =?utf-8?B?RTBRZTMrWVc2bmJKbllFNnRFYkNhaGdpWE1CYlJtUHE0SHNuQ1BxdjhMTHpK?=
 =?utf-8?B?QklwV1ZEQlNHRGFPRUdyM0NieHU4eFJUZHBmbjlPSEVQTzl4cWVhMGxQWmhY?=
 =?utf-8?B?QnBJTTQyTHJjT094WDFSU25LWERsMEN4N1k5bmZmWFJ5ajFCdVRLVXcrQVZC?=
 =?utf-8?B?N1IySXkyYUsrb0g1NmNQNGRQeXpabE9LYjVVMUpDSS96cWZmUC9VQmlXdlFG?=
 =?utf-8?B?Z3RERmF1WlNIZ3g2dW5wMXVXcU51alpYQ3dQS1l6QVBtTnlhcy81UTZMNXFY?=
 =?utf-8?B?bSs1WUdaWGl4TWdvRHI4azVmKzlML2FrVzRYUmxQaFdXN3hVK2E1ZngzVWtp?=
 =?utf-8?B?bllvTUIydzVxeHlLZC81VXBTQkNoK2pUc1dJSzRiRUZhK1U0c3h3ZHhjVFQ5?=
 =?utf-8?B?cmJZdFlldHZJSVlxU2hDM2F5ZXMxbFVSeHRnbDBUeEFMTTFKd29ZeCtIc0tP?=
 =?utf-8?B?UmZTZldpMzBnbWdiRnZYU2tLbGd4cTBCQmJMSjZHR3RvTkRuL0VENVRxVlJY?=
 =?utf-8?B?SC94b1VBanZIT0JsSzJ1Z01Qd2tRTHVBVHFRekluaVg5a2xUb3ZtQ1pEUjZH?=
 =?utf-8?B?d0lxc1dVQmYyd0JPS2NTQnFMQ0hERWd1SkhRVVlDUU5SUG9aR0hDdEhxempT?=
 =?utf-8?B?MlNPTFZLU1YxdkxqWi92YTdlQjNoeDJkeldTOEhHVGVwOWF2bTNEMFJZVGFL?=
 =?utf-8?B?N1FZMk9GcE0rMk1KbG1IQ0hzYkdlUWJOWFN6OXc5Z3ZVUkJUZnlQUkNWQVhN?=
 =?utf-8?B?T2RXYWtQYkRmYmZTd0RMQVpPTmROMlRIMmxwTWthZHdNSGhWSFdUNXRFUU4y?=
 =?utf-8?B?bmFaNTZEMnBKQlEwUVQ5c1NWWFY3VTZHQjViZ1B6T0ZCSjRVWCtmQnB1bzcv?=
 =?utf-8?B?MmNmUHhEbDJrWG54d1VMM0hHUWdNMkFTWjRvbytYUStXV3dYUVhKWXpaV0da?=
 =?utf-8?B?WSt0LzIzdTFqWWtnZ1M3bzlnTGRSVTFYV2tSWGdKeXp4U1owZ3EyTzZSUFdi?=
 =?utf-8?B?WXhUUS8yNHpwcWY5MUJsUm1xUWJERGRuZ2ZGV0IveGNTczZhOFlvTitSenNE?=
 =?utf-8?B?WGlhdGo5cDFCZ1hBc1R1b3JESzFQQmRlZTRDUUVESmgwMVYvQUVWWFBYMlps?=
 =?utf-8?B?Nm5ZUzBoNktwcnlnMm13S0ZNY0ZPOVQrSXNzdzNpRGdBdjlzYitHV3dMV3J3?=
 =?utf-8?B?Y3ZTU2V5M0h1RGw0STk0LytWVGRWci9xMkkySzM0ekk4Vy9NM1BMVkZHQytv?=
 =?utf-8?B?a1hYU0VoemtkbFJacFJjUnlZWmErYkM0SWs3YjlqSU5SNVQ1b21GdkZjbzVn?=
 =?utf-8?B?Y3I2bFBXemd4MlJjVEhDNEpwVkFtSFlGMTk1ZGpmQVNCSDVWQ05ERmt0a3Jn?=
 =?utf-8?B?ZktxdVh5LzZvY05FUkFUZUlCb0g1cmFlbHpSc0tNcmxSaG8xa1A0QWJxUXlx?=
 =?utf-8?B?SGRJcmNPbjlYNE9pQW53dWlMbWx3a0ljMWtlaXZFSlczbFZGb1dLVWdWa0JT?=
 =?utf-8?B?WGs0cURMZ2ZwTG9oSnZRQmswYUNBbFBJSHpYZVhlNys4a0RqR0NOaiswU2wr?=
 =?utf-8?B?VGhxekVnb3M4Y0h4U1VTOW1sRjVrbzBZc1MxMGlxeFdTeDJQakdDendCeHNP?=
 =?utf-8?B?N1QyYjU4Z3pFMWF4UGZ1NzJEemdkN05TVllEK2xXbTArRDJIWWpzN1JLUXN6?=
 =?utf-8?B?Ly9Gb0VmaVl0dFA5UGl1ZGZMZ2ZEc0dRUTFXNkJpVVpvVlpiZHVzQ2NGRklL?=
 =?utf-8?B?OHl0dzJpL244ZVl3VGx1eEg5NmpOblUyM1F0bjJTRDFyNE1vRXdYVmpFUXJw?=
 =?utf-8?B?RDFDbTlxcXZyVTFrTVF5UkNyaGQ0V1g2Z1A1ajkycklzMkxXSzk4bmZ4MUpr?=
 =?utf-8?B?R3ZnemFzQ3p2U1FVTXFkL0s0RVRieUl4Z0hEN1BqdklUbENmbU9NU2dOemw4?=
 =?utf-8?Q?Hus9ZPhQcgI+RhGnU7Aar2blQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0c4740-92e2-4e61-41cd-08ddb9fde7d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:50:32.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoCMX2z/Y3ES2xG4gAqmMA9zXNKeeI9bQXDoabjfOK3hVUR5gZFX9hdm627CNd0BVmi7+3XmzUsBPFGMxSKBBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8830
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



On 7/3/2025 12:10 PM, Raag Jadav wrote:
> On Thu, Jul 03, 2025 at 10:50:53AM +0530, Riana Tauro wrote:
>> On 7/3/2025 9:36 AM, Raag Jadav wrote:
>>> On Wed, Jul 02, 2025 at 07:41:11PM +0530, Riana Tauro wrote:
>>>> Certain errors can cause the device to be wedged and may
>>>> require a vendor specific recovery method to restore normal
>>>> operation.
>>>>
>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>>>> must provide additional recovery documentation if this method
>>>> is used.
> 
> ...
> 
>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>> index 08b3b2467c4c..40a4caaa6313 100644
>>>> --- a/include/drm/drm_device.h
>>>> +++ b/include/drm/drm_device.h
>>>> @@ -26,10 +26,14 @@ struct pci_controller;
>>>>     * Recovery methods for wedged device in order of less to more side-effects.
>>>>     * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>>>     * use any one, multiple (or'd) or none depending on their needs.
>>>> + *
>>>> + * If DRM_WEDGE_RECOVERY_VENDOR method is used, vendors must provide additional
>>>> + * documentation outlining further recovery steps.
>>>
>>> The original documentation is sufficient so let's not duplicate specific
>>> cases here.
>>
>> Added it here so anyone checking the code directly is aware.
> 
> Then a reference to uapi doc would be more useful.

That should be okay. Will do that

Thanks
Riana

> 
> Raag

