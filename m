Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B4958885
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9441E10E3F7;
	Tue, 20 Aug 2024 14:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQCo4Aqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177410E3F7;
 Tue, 20 Aug 2024 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724162815; x=1755698815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3SC/2tt7PH4mNgnAJz3LGwWParmTzZcWklKhgbQ/Egw=;
 b=gQCo4AqkGj5agB0fOafhubll61rwrFq5hYOL9HNv4FMFhUBk96Q9zvgh
 Nk9dSuygMRG2bkvsxVa3HrB2odtgtjMhrrTfP11LL3/W9u9+cRvJteGzw
 CwjCdZI/PqeRyiEv0C/7+vkDcSoGLN2hnhtH3UnjMwvOPUfpSEnk0eli3
 EepnwUpwElE+lNz0RcNoXNnBrHXO8HAP/8f8ufko7u9LASEclmNVdGyNM
 nSKtB/gQIJLQE8AoO2ii2MC4KEZFXuUeGCmg3ZEUqieqBLfOE9vBUkN4h
 6ulCwE1okJvWFQFlV7y4EW+L34LcWrtyWhWGrJkMaWtfyPqC4oPDsog+K g==;
X-CSE-ConnectionGUID: J7WJSRcVQd6VbTq9107yHw==
X-CSE-MsgGUID: cp8sSy77TJyqPciCODjiPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33618148"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33618148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:06:55 -0700
X-CSE-ConnectionGUID: lULAQqxSRsqbToFsPrpdow==
X-CSE-MsgGUID: 1Jd6qFb9R6aA4L5htCBDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60426666"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 07:06:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 07:06:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 07:06:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 07:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9/3MBNkZxacfbuSIg4aUcM4TxW+7ibxYoCrW+3siYihvaCFkhAENPxJvwbbVs6WPLM43T+moo2nOv4ViW0lJLWOOKwJhMofhic5pzylkx5isgsi69TBWlNgpvShzJ2R1AuVWcvbuwKRGHaosrjaQetjphYWPSOk2m+aW6C9JxK8AYErMO31UxkAx1Xd3dFwfhOKzY6Ch/aP6p6fO5h6+e6kmVPHF1PMq3LJe+hIWRmWo2/VrkoYbUck8vha3Qt1/As1OeEo/Xcp3dDdck+WBdD8t6yNK+PbeJen/sBQsT3CLqwF23FNiMDGRaErdFCR9A5JjOnvBRocdgtAomXztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzO6qCQw4xOprQuM+FJr4SFMffG0+9baS031FUP1hSM=;
 b=lk+NhoauB4CxRBRZ5eWgFGmpTuUAZPANEw9stxGVWk5jKbewrpRzXFn1J7fISoaKjL8a8Jc3Rv6CaM9TuP0/Qus/DqUybxxPTw5dtUQGPI9XBecvCDx1yzIoY7J4mbwlAj5snG8v2oJWPtaxRtcLiLzHrBNc9Neb2Hmd+lTSib0BVNfEhMcdlu9N3U/q6pF6eslNiUkmAvRpP58REL1/hCDrGBojDag330E1hbvLitPlo+ceGYRbYOwDzRYX484haxAoj1bdJVPD9cCHIlz2yxBFX4THW9j8DdTTYMVypKMvPoTlm81z0gqokcZyiK2xSwIbQcobyp2YkDVgP4Bx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 14:06:50 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 14:06:49 +0000
Message-ID: <cfd96f29-c8b3-4619-ad96-631be75591fc@intel.com>
Date: Tue, 20 Aug 2024 16:06:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f868034-ea4f-44d7-802e-08dcc12155b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTZ3L3I4T0N5Y3UzbzFUV3pwOEt3SDlIWEtwckdZc3dmTGM4a1Y1NVhMS3Bi?=
 =?utf-8?B?c2RMblMreVFpR285V0VDby9weS9SZlhzMVd4NllDSW5IWEJ2Ti9zUjlXZlAw?=
 =?utf-8?B?K21ERTBBaW04dHZvQXMvUzY4d3QxMWJkZTg5NXIzVzJXQTNwTWhQcGNheE5I?=
 =?utf-8?B?b2JWUkdSQ1pFSnpMd01tNHMrYkY4ekI3bW15aE85ZTZlTUxBdmhjYWxwdmdn?=
 =?utf-8?B?Wm13UlUybmZpbkNTaFIvZkNPVU5KZjhqWmwzUUI4OEpNQlRvQXZvT3U5VzRq?=
 =?utf-8?B?QkdhOXBtYlJNZ1lReVZXUmVQS3ZCOVA0b3Qzdnc2Q0hpeG53ZzBYazNZVG44?=
 =?utf-8?B?U3VwelpUc1YzY2ZhTHlNaXdHZ1dkRTJwQ3BPdEZRK1JhaTRGRlF5YVVIMTV3?=
 =?utf-8?B?NFlhZlE3djhGcnBKNnh2WGRWUUdUSGNQbzNOa1A3S0FpOExXaEswMkR6STZP?=
 =?utf-8?B?VUl3RVFkZEVVdXhVb2hNN09hMHR2TWxobDlwVHFtRTBVTW1YZm50RmpsMStT?=
 =?utf-8?B?em9DQzE5bk5ES3RoQnlsNE54UktITCswWXhXSmRkNXV3aUJ3UkZDdVphWlpl?=
 =?utf-8?B?ZFZxVWNiR2IzRndDTXFreGI5R0ZCUTl2OUFqWUN3NUcwMDE3RSswTXRDYW0r?=
 =?utf-8?B?bThOUGhXT3dnclBzUGhkb3pMVGh5M1JGczRoOWY1OG5nWTF5eUNBM2ZxTDc3?=
 =?utf-8?B?L3psa2lab1dIZnJ0c2JMZktqWkg5d1VmQ2t4QXBBa00rbE5xK05NZ0psUHpQ?=
 =?utf-8?B?SkwxTGVKSHQ3dVlSRjk3UkpPOGtvbzdya2o1TlFnNGhYNHAxV3lEeXUrdEx2?=
 =?utf-8?B?a05LdzF3QWlhV0NpRFV6OW5sdk5wTXM3R2lwSE5TUFJhbnpKYklab1FiRy9i?=
 =?utf-8?B?ejNBVGV1bEZMNHBwK3AxSHJHdW93eTI3VExBTzhVN3EyTUNsZEFheTBQMGdz?=
 =?utf-8?B?MWJLbXRtdlNpeW8wc09pRFdzYkswL29MODNHc2Ezb2F5ZHJnQ1F1SzNVeG5F?=
 =?utf-8?B?ZG1UZUN2TWlNdkdvWGN0aDlSdHZmVFdXK1JEU0ZlZEZtUVdSM2R2WEVQZC80?=
 =?utf-8?B?T0RHS0JhU1JaWWlFMVlCZndwOGllZThXcmsrcWxleUZTR096TEtOUTZhVVdH?=
 =?utf-8?B?eDJxUmEwVktFRzBmcTdpWHhsL0pLYzRZQ2VvKzYxSGsvSVorRkYxVm5EemZS?=
 =?utf-8?B?MWdDaDlxSDE5YWFhVjJpNzFwc1UzdnNHVzIzd1A5SWJJWUFIaDl6UEVkYXp0?=
 =?utf-8?B?aHFGcFFIR09PM2p5bkVtY0FqV055R0ZMVVBkL1Y1OCtMKzVBTytuUnpFd21l?=
 =?utf-8?B?S0c5bGc5QlpQS1hTc2F3WTYzV0FGcnVMcUNJMk9mV2VwQ2FkMVNwV3dCQjhi?=
 =?utf-8?B?bEU4a0R4Rkd1WEtZU0dJcmY3N0ltcmtlY3lXZXNXSXBxeGdWNGl4UnBPMFZ2?=
 =?utf-8?B?KzNqSUFoNmM4LzZWWWFoejJXc3NtNEhSNDdPejA2M1JaOC9ENEFFUTJTU3BV?=
 =?utf-8?B?a0d5bUd6a0p2SnZBSG1iOHVidE1POGtZNkh4K1MyMnI4ZFUzL0lKUjZIcVEr?=
 =?utf-8?B?emJ5SmIxK2pRUDBqUWZ4eW9vVmI2Sk05WU5GREdicVdWajZ2VVFQRTNuK01I?=
 =?utf-8?B?emE1c3NzREQ5S1RSNUZ2YXJUSDhrTHVIN2YvMncxTTArT2o0bDM3ajVVOGJX?=
 =?utf-8?B?WkkyTGRaK3U2VWFiemdqbFpZL1NjdXN6blVGTzZoTTIycCtNMUlQTFA5Zk9B?=
 =?utf-8?B?aFJhZXhzN2pWQlBIZUo3SmZUWVY5NjIzOXI4TXV1eVhkOUJxb2h6OE5KMzl0?=
 =?utf-8?B?bkFuWVNwR0EvbWNlTGo2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai91Uk1qNVhhU0wrZUMxZ1hIeE5XZm9OZGJUV2d1eStqSEdNSmdvUVNBU2dv?=
 =?utf-8?B?REJYQmVPbVUwVFNBeDMrR2N4dFV5VDk2Y2dxZGNFUS9qVHBtS2xuYk5BWkM4?=
 =?utf-8?B?NFA1enc4RFVQRDZLeGYzTzVjMEsvTUYvRXc5Z1RISEFJRkVZMmZhMWpJWll2?=
 =?utf-8?B?VXpGckhHc3FRVEJNM1FkOElTT2ZxMEp2QjB4Tkh6aGhxdDJVdVZnZERmUkZ1?=
 =?utf-8?B?RXFjdTlhaHpVTnN0b200cWhnTXRJL3RHUmNGTElFY3dIaVM5WmExM0RqSUpk?=
 =?utf-8?B?YU5YanpqWDBzYk5Id0hRbnk4VzhIKzRnOFhjb0N0YzRoSm1RNjA3OHVJVHQy?=
 =?utf-8?B?bWJlV25ibmgxZlpyZmxKSEhyZ3ljQ2psS3VHUEZqM0pwN1F6UEJMcDBlZXVz?=
 =?utf-8?B?eHMrZ1B0TkQyNWRsR1RvWE81dUc4SjlmeGRmTUNmamxGeFpFU3UxWHF6aUpM?=
 =?utf-8?B?TlBuN2QrNXJXbVF6NVkxdlRpMjVGVWliaGZEZzhyS0ZLV2JTWXlGMG1nZWEv?=
 =?utf-8?B?RERTOUs5WWczRVRGb1gvRnl0MEJabE4xbTM0dk1VeGVMWUVtbFkrOUhwZUdX?=
 =?utf-8?B?c3pKZ2UzMitRYlJSakRvOEFLai9ZcVlOeDg5d3cxYzB2cDZFa1RsT2FUY25X?=
 =?utf-8?B?N05Nd2tWWnR5RDYvT2J2VUhWRktPMWF0bXpsR3VCYmw4L0h0M3A4M2YxaDdp?=
 =?utf-8?B?VytNZ3RSSXp5QkF1bjFyOVR3MU5pcmdBNHg2ZzdLRm1WVHNZK1lYT2VKY3lV?=
 =?utf-8?B?ZlcvVlFUcFN1UDc2QjE3WitsdlA5NTRDdDhJTGczREI3UkZVUkhFKzdBbVdz?=
 =?utf-8?B?N0xuQjViNTNZVCtJYnVPRllDdWpYc2pqdGZjQlEvRGY5S282YTBsaU1qMGoz?=
 =?utf-8?B?UWVldUpFMlN5eGpGOGdmSDk0TEZJendiNTl2bkpUL3lZZWtlRXY4dW1UYnZZ?=
 =?utf-8?B?cFdzbXNYMzlscVhmdUcyVk01K0hoK21lZTRJTFI1UEVnWkduMXR5ZmdzdHRp?=
 =?utf-8?B?Sm1ranFyNENYSExieHVZTkZqL2xNYnZ0d3pJM1NCd2hmdUlqUWNWV29UOWk1?=
 =?utf-8?B?WTlDOTZDT3FRUmJabDNwQmgwTmI5eGh2bmhUaGozdHI1NG9rVGQrVld3OHdB?=
 =?utf-8?B?Q2VHRm56U2VGOHF3ejZjSkpOV0djR1RCRnhTUTR2aEY3ejBBVG1BNHh6YVR1?=
 =?utf-8?B?QTlxZVNuby9GcGNMbktvQ3NTVzI5alY4T1BiRHVGclJsSU1zZGNvQkgzZGN1?=
 =?utf-8?B?THlYWVVEWXN2emY1NHdSZTR4Tk1IcjVkbGpSTG5EYUszMFRNQStNS2N5bzFu?=
 =?utf-8?B?MFpnTnlqeXhwV0p2Yy9zL01hUWNKa1BqRFE5TW55aXZqZDdUb1lUem4ybTRi?=
 =?utf-8?B?TzJUSDdRcWpyL2R6VGVqYlplN0JzTnhQQjREaWlXeHBZSndMcjNjOWNPWWJr?=
 =?utf-8?B?WU0zdE9GSkRuY3pxRGJPem9QN0U2cE14YWdQMW9vYXkwNll5Vit0eGhuOFhl?=
 =?utf-8?B?elhENEtzVk1WblhNK1BuZ21QMjZaSTRGWjB6TDVnV0xra3EvUHB3TWR0TDA2?=
 =?utf-8?B?VHpFdW5VWHA1L3hQcFFManQ2dmhIMGpxandTMVBNd2Z4ZXQ1ak5iaHFVMndC?=
 =?utf-8?B?bmsrRGhMMCtWa2JpZG5ET2w5d3QyREEvcENPdlgrQzV1RnBXaXA5NEMxM2dH?=
 =?utf-8?B?bHhzaHVaZGlRN1Z0VUR6NDNHMmZOWUprNGlSTWdsbzdRSWxzcVNMQ1RtUnpE?=
 =?utf-8?B?cHVJNDVTU1l6Nm01UnM3cnBsVXNNRHhUQkRmZXkyNEpGbTlhbjdMMS9QYUNh?=
 =?utf-8?B?UUIzdk5aSjE3NE43T3A1cCtWV2lBZ1QzdmVrMXdhekcwcFhzV1VGOVljOWQ3?=
 =?utf-8?B?YnpqZkUyQVFKR2Q4SW9BakpGNTRDKzdtNVdwd2YxRU56akdpbFcvRjBGV2Qy?=
 =?utf-8?B?NXNXckU2c090M2pYQU1senNFc3JUYnE5bXBpdEZ6Z3FlWjl0S2hsSmczZzBm?=
 =?utf-8?B?UERETVdCVmlSbllnSkppeUZyclZZZHZrK2taT3dPdFlOaU41MmpOZDVsZGFC?=
 =?utf-8?B?L3VDUjBhWFVSUU9rZ2ozUWZqSWhtWU9TaGdvOWdHTkdzeG5qN2s5TmlYZVY1?=
 =?utf-8?Q?KZ/5pR2Ds6ReCQ37Pe6K6r61p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f868034-ea4f-44d7-802e-08dcc12155b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:06:49.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm0S5dyb/o4UW78XK+4hOLdJITqXV/Lpa5wGj7+rI5fJCz7Tjr+4c73xlezDFlCeTTi5jTMWaoEpY6Xdj233Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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


On 8/20/2024 3:33 PM, Thomas Hellström wrote:
> Hi, Nirmoy, Christian
>
> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>> releasing backing stores if they want to skip clear-on-free.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> What happens if two devices share the same global TTM pool
>   type and one that does its own clearing. Wouldn't there be a pretty
> high chance that the the device that doesn't clear its own pages
> allocate non-cleared memory from the pool?


You are right, mixing such devices will poison the global pool. 
Unfortunately, I fully concentrated on single device

use-case. This is problematic mainly because on XE, we are doing clear 
on alloc so from ttm prospective the flag is correct.


A quick option would be to limit this for non-pooled allocations on XE 
or even create a separate pool for XE when have this 
gpu-system-page-clear is enabled.

Thanks for catching this, I will test above options and send patches to 
fix the xe commit.


Regards,

Nirmoy


>
> /Thomas
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 8504dbe19c1a..935ab3cfd046 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
>> *pool, dma_addr_t dma_addr,
>>   }
>>   
>>   /* Give pages into a specific pool_type */
>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
>> *p)
>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
>> *p,
>> +			       bool cleared)
>>   {
>>   	unsigned int i, num_pages = 1 << pt->order;
>>   
>> -	for (i = 0; i < num_pages; ++i) {
>> -		if (PageHighMem(p))
>> -			clear_highpage(p + i);
>> -		else
>> -			clear_page(page_address(p + i));
>> +	if (!cleared) {
>> +		for (i = 0; i < num_pages; ++i) {
>> +			if (PageHighMem(p))
>> +				clear_highpage(p + i);
>> +			else
>> +				clear_page(page_address(p + i));
>> +		}
>>   	}
>>   
>>   	spin_lock(&pt->lock);
>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool
>> *pool, struct ttm_tt *tt,
>>   				pgoff_t start_page, pgoff_t
>> end_page)
>>   {
>>   	struct page **pages = &tt->pages[start_page];
>> +	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>>   	unsigned int order;
>>   	pgoff_t i, nr;
>>   
>> @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool
>> *pool, struct ttm_tt *tt,
>>   
>>   		pt = ttm_pool_select_type(pool, caching, order);
>>   		if (pt)
>> -			ttm_pool_type_give(pt, *pages);
>> +			ttm_pool_type_give(pt, *pages, cleared);
>>   		else
>>   			ttm_pool_free_page(pool, caching, order,
>> *pages);
>>   	}
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index 2b9d856ff388..cfaf49de2419 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>   	 * fault handling abuses the DMA api a bit and dma_map_attrs
>> can't be
>>   	 * used to assure pgprot always matches.
>>   	 *
>> +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
>> handles
>> +	 * clearing backing store
>> +	 *
>>   	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>> USE. This is
>>   	 * set by TTM after ttm_tt_populate() has successfully
>> returned, and is
>>   	 * then unset when TTM calls ttm_tt_unpopulate().
>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>   #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>>   #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>> +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
>>   
>> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
>> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>>   	uint32_t page_flags;
>>   	/** @num_pages: Number of pages in the page array. */
>>   	uint32_t num_pages;
