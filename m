Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A9AD7F82
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 02:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9710E073;
	Fri, 13 Jun 2025 00:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZyn528C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540810E058;
 Fri, 13 Jun 2025 00:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773617; x=1781309617;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f+x1Rf8T0i0Zo6qeXyXPMgpp7oROna3QqU0injqd8tk=;
 b=VZyn528CQm62Wy5UcnnLLOatZZwE7+Mbz0xHMpQRju3NIDRwQUXL6ABI
 JgXKAioZhyUzFns9hNLpcuqJPNrdTdkIdHWFnjLZxhpKrP03fkkK2dMB5
 +9ruxOjmM1dWmeL9jo3bvBklwvu+xjEzRC05MiDLKF/vagq7E9GtlzlK2
 51VwdtEDj8+6+iFWsmKqTegoB8vaQRLcQIMw3KHVME7aQB8vAiwKdmyfS
 VoacH07KAS8vA3yqiVR38dYH9fFhuXdQt0Seo6PhWshN0ace82eXaPCI1
 TJhIpoQcZ9aZT1iOKtyZbNOD7UvriurGAh5UIZuB0N6ah0KxwFeojm/ZQ w==;
X-CSE-ConnectionGUID: BUS78L9nTDO3infpQXCnVg==
X-CSE-MsgGUID: khlmEUdgQvqF4MxTgC1hfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51893747"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51893747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:13:34 -0700
X-CSE-ConnectionGUID: kqr8+jbwT5WJvs36JG1Qwg==
X-CSE-MsgGUID: NWW1WU3PT6+M8uDBZOzxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="148035867"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:13:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 17:13:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 17:13:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 17:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OieOENsz35KLyonJOK6G26VbtHsrA2vWeqcnnQ+LJZmpzobaKYRVZuWMJkN/l2EcoJubg/NzFmch7uxm8J32NgMdh/FzM5VNKDc5v9+0vYiBk0IX0768Q3gAnnyZg8QMlLjsuzl7KJLBH4GL+t3fGgqdl2vmI3tXdj/b5gOb2pNEt9kCPBWB+Iiu0w7iQlRXCpG9Esf3GpLxYToyOcxklM89rNMuiNzGETTiTfeOEH/3i4oWpTTQ4UBxRLnQhDt0P1tWBKZZxBX50BpF6IQ9Ccx+RRTJXfQChjHFMaI9nEDSooSfkbFzCPbwTIPWuKUor2ge8SnELXVF2ynGsW5k6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TKn5s8KhRd7w7fCpZH7k02dBmJab43m7Hpw8f0Wmt4=;
 b=it15JcDh0FveEH/huSMctcKMctuW857CU9SK4tMLF3KtLgiz4/Jq2H3MCJEaQVl0ZqK30bd0ocX0hntnwRPo3f8kFuCx3Xh8N9gdYyrqWd7/5WXiihkyMyDgomGOCx/4loqPX0FgjWZId3PRwkVl4Adn/AaCjjhagJzEcAS0WpdDhXUhpdVvIwlp7VVi8g2FV2dV+qrTwbmQYlnGfNWs5sIiiDWSawi1ur1hcaRU0nqhdJtNYY+HZQD+TFMNkDQDCyMElkDxYk4lmTQ3nAE8o25xhB6pvrjyWOWx0u1KHcXI//ME9YCVOvAcorqDWkF4Gs8j7pDH0D6LtxnXAQWmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF179F31853.namprd11.prod.outlook.com (2603:10b6:518:1::d0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 13 Jun
 2025 00:13:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 00:13:15 +0000
Date: Thu, 12 Jun 2025 19:13:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <jeffbai@aosc.io>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast <francois.dugast@intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, "Mauro Carvalho
 Chehab" <mauro.chehab@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Mateusz Naklicki
 <mateusz.naklicki@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen
 <429839446@qq.com>, Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang
 <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
Message-ID: <yyzxfqydczvfxddfsa4ebi7kyj5ezl2v4wbl5fopkdz6qwvjrg@fnhpcvfsp2dm>
References: <20250604-upstream-xe-non-4k-v2-v2-0-ce7905da7b08@aosc.io>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604-upstream-xe-non-4k-v2-v2-0-ce7905da7b08@aosc.io>
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF179F31853:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b4f680-c80f-430b-217b-08ddaa0f17c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djBSclRudXlMcFc5MUMveDNKTXdXeDFVcGUzUzR1VGJsZFNUUCtJKyt1VCtJ?=
 =?utf-8?B?aWxRYU1TN2ZHM2Q3QWpTOG1CTWM1OW1pdVJ6bWlGSUxCeGNGVVZ0VFI1K01z?=
 =?utf-8?B?eG9VUWFQWVpjRWV1NXE0eHVNVEp6a08zSm1sVlBTd3BteWRSeHVBajJWRlZz?=
 =?utf-8?B?RnIrUW90QXh6T2xST2V6aktmT2JhN0REendGMFlDNkI0Q3haLytScGdIUUl1?=
 =?utf-8?B?NWpoWHdKZTNwc1VyYlFTYnorU2x2SG5RZm5mYlUxdVVRMHIrdTJBRGVibUpn?=
 =?utf-8?B?bE1Nb3JkSkJ5M0VpRnBaekdrdXNDVldXb2F2dDBPZmJuak1KVjRRL1RaMjVl?=
 =?utf-8?B?bG5DZnkxYUVBRUZyYTlVTllPR1pTaFZOYjc4dnZwaUVoSkdpTHNhUkppT2xG?=
 =?utf-8?B?VDRZcmEwY0hjN2tpN01VY3FzZWsyQ01ETm90WVptaEFqeGJNRVhQTGI5SHR4?=
 =?utf-8?B?cTd0NDB1dEM1amNYU0wyaUtOZjNkaVEwSmdoUlc3Y3VXbk9FNTFPa25JMUEx?=
 =?utf-8?B?ekxyMzlVcWxzZjF3YnR6MnlMUGdxUlpEczJjeDlVRUR3N2RTQTlsZlZPQTF0?=
 =?utf-8?B?cVp5NFZ3Sk81QTBGSG0yYjJ2MklHWERscnY1WStQVHFRRFZ2OS9qZHd1NVVY?=
 =?utf-8?B?U1FQWi85Ukt3cS9iNUEwOGtUL1N1QXliVUFFdXlnSjVoMDd5U1VRWXlJUUh0?=
 =?utf-8?B?dVlCb0hlNmoyR2NXeEM5cUhNWGV1azUzUEVLOVpIRWJ5NGNtSkZIY29YbWFp?=
 =?utf-8?B?TG9pSDZjTW8wZWszVlg3bHMvTGtHTWZjWVIvT1BhN1pmTWdXYzc3b045Nllj?=
 =?utf-8?B?Mm1TT2R1dWFUZEVsRlF0bjRVQkszbm9zL05UREQyTjVjRVl0R3NmUnNldVZ4?=
 =?utf-8?B?SkFOcGhPbGlXaFdHbmsvNENXMEdKdTFjYzVONE9IMFVuSmMyM284QjYwcW9x?=
 =?utf-8?B?eEh6RnBUS2ZsalZybDJ1b3Y1NDN2b0k1ajRoTWljU21TMExXOXlva2UrZENv?=
 =?utf-8?B?S3kvTjdObGx3Y1FsbVcxTjIxNTJudG9jOFR2ZXZSeDhlT2c4Ylp0SSs1R2o4?=
 =?utf-8?B?UHZrUDkzREd2NEVKRmZRWGIvQlZ3S2ltZStqczlkL01tTHRlQmlydWlmTnRp?=
 =?utf-8?B?L2NXR25PMkZ3RjIwaDh5eE1SRnRQSTdDS0VuZ1orZzRRbkhGZ0Y3dmI0bHBD?=
 =?utf-8?B?cnZmVk5WUkZ3Ykc3Z0U1bWJlRFdJSUFxdEdrcEQyVzhhVkk3Y29uZlhnbzN3?=
 =?utf-8?B?TlErejlRejNaWEt6L095WWJ4TVd2RFhrMC84OVV5VDQ4RzU4SUtWeEwyUGlC?=
 =?utf-8?B?cmpKS2hlVmJWY28wSGxsakkvVGEyNXd3bjZvdHVaZmowbGY3YzVReVJEaC9v?=
 =?utf-8?B?bDN5Z3lZL2xnUjJPTFg2STR6TGl0U0NURWNUUVlPeFRUSnN4OUZISjhvQjE0?=
 =?utf-8?B?VzBjK0hkbkR5NWpQenpFQkpmcE9IdEhNd08xTGs0UksvZUp5c2hNNVg0ZjlB?=
 =?utf-8?B?RjRLVnZrajc5R2hwdFRJVUMxdFJIZG8xOFdPdWhDZlc5RmpZUmYwMnVkNG5m?=
 =?utf-8?B?NUpnNExJalkxdkZqMytneklhalpqWGFsNnJWN201M1A0Ny9SaEhnNURHemNh?=
 =?utf-8?B?NTJ1eitzYlJlbXdlU1ROOXpHZkc2VmVlSlNEQVBmV3hkd0VKZHgxOHBFbkd1?=
 =?utf-8?B?MjdtRGo3T1BiNWlvZ0dKZzg4ZHNXQWxFQndZRW1KWjBFSjJyWmRIdy9nS1JG?=
 =?utf-8?B?MGJTbUE3aytoYUI4a0VhMHoxUUhWS1hJSlBwYkVPV3dVWUdpbU5UNDQ1VE54?=
 =?utf-8?B?UDgraXBKMW1MdnJTN0xBcXlYNU5BdnphUC9HUTB0VXBOM2QySlBKNCt2eXlk?=
 =?utf-8?Q?K5LGMkijdC8Dv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JHUjJCdTRyUXNsV25CN0RYTlFLZFZ6KzlXdSswbFF6NlRmYVlzcWFlb3gz?=
 =?utf-8?B?TC9BaDBwS0lVZC8wWFVDK2luQlZIK0wvOHo1Z1pvOGhJSHpqaWZlWUtxN3hj?=
 =?utf-8?B?NjloQzRXMG1MNkU2emxROVAxeHdPc3gzUzIzSm1panZSUWl6djNGcDVsdTdw?=
 =?utf-8?B?dnR4d255REJ4TG1EN2FacGRtcm8xbVowN3VoWXJkVlFmMGo4U3NWR2Vwenpt?=
 =?utf-8?B?NUphcWxWTWtIUU1jOG4wT0U4dUlBVnFHYVcvaG1FRlRCOHlnQUNBZjJsUEp1?=
 =?utf-8?B?ZHFjVXdxLzdQbHltRTFYTEg0a2FRUmxnREtLaDUrMHEza0tVckFBa1Jia0ow?=
 =?utf-8?B?Y0VVeG5OVWcxSDF2UDJqeGlZZjlqU2FORTRIWXNIcStIOTNscXZ2Tzc3dEg4?=
 =?utf-8?B?QzErNnRlNUhiOUVaY1U0WjJVaDBSem84YktQQXlTWjZHSW4yWDdBYXhYcDJz?=
 =?utf-8?B?ZE5NOHU0dWJqOTRNYmtaYnJjT2FpMEZqQjgvWC9xVTdQb0pnM1RKbkt3MFRk?=
 =?utf-8?B?d1ByY3JrNGRYRXhtWUM2SkR4TWM5V1B1NGZRbFp5cEc3OXJnVWUva241eWFH?=
 =?utf-8?B?UFluWHNsWHZOdGowM1VLM1F0YmxCSDQrQ1ZWUG5zWllwMEdYaTQ5M3RETkd1?=
 =?utf-8?B?YVZIcXlDSlBvZUtaWlB1TDVWdS9tTVhYUlFBb0htUXhIR3NpMWhycGtub0Nw?=
 =?utf-8?B?cGpIdjhaWTNCU0lCdkFGeWV1QXp4bUhEU3BCeGhIeXkreGNtUUFIVGljbjNF?=
 =?utf-8?B?OHVScjg3NWFRZmFHdlgwSnpJUHR6U0FQeTMvSHpJeWdCN2J2UnBKRE0xOUMr?=
 =?utf-8?B?RTYvT1JSSVFTTXNtalBhQVpSbkgyYTNzbjNtWTlTcE8xTWFNUXkyTTV3K1F0?=
 =?utf-8?B?TlVTR29uMDZRRSsxNklVVHREazJTS0I1Z3gwTjMrYkgwbDFFQVFla2tmWFo1?=
 =?utf-8?B?UkpZSW01OUFMMEJMY1cvRWxTOENvckt3QTY3N0pwUVlCNGtzT2J2Q1VIaWNH?=
 =?utf-8?B?SGZuWS9DSFp6d1owWWRPazB5TUwwRFc3RjI0NkhGS2R5WCtYbkpyUzZGREIr?=
 =?utf-8?B?UW1UWkwrdDJHdVVpRlo1UHd3VnhYM0FjNDhBNXBmWG42L1NIOWE3Y1FSdVBK?=
 =?utf-8?B?S2txZi81YVdWVkJqQjhaSCtubllUZUtwdEhjTXlNNW5WOWtMemtRNVBJVHJj?=
 =?utf-8?B?dCtERkJqMUIzeFkvd0hYYnBSa0xPd3Nlall4ZEE1UWRTUTVZM0tVVFJWTWpl?=
 =?utf-8?B?cmJ1Z09PTkM2d1VTQ2Jxa0pNQnE0U1R0ZGkxZ2x6ZzlRZDFtWk1Kajh6SjBx?=
 =?utf-8?B?Y3BWK282S1FHUkMxNVo0Y1M1TVZxbHJKTWtSNnF6aStzV3FqMzZQUDBIZVBq?=
 =?utf-8?B?QkNoc2xMa2xhaDJ0Q25KZENpb3YwZGh0aHRRYUNCU29IWU9Wcm5oVXlRaTJH?=
 =?utf-8?B?bklvb29CVlo0T2pXQTBMUk8raFQrbTVCVlJQQ2YzTUUrMFdXSWgyM1JnMWpD?=
 =?utf-8?B?TlhtTDdGQXpLNE9mNnc3TWlzOFVKMU5qVlhUUy9Xa2IzWE55N3MybEJyZnUw?=
 =?utf-8?B?RmpuVFRsZFRkaFFYdXZGMVFyY2g4SERBOEFiK0YzSXNRRm1LRkx1Ry8vWnFs?=
 =?utf-8?B?THhlWjhoZ1ZQeWU4dmY2WWFlUnVXamJoSDV1cnhHREZxb2poSFU3ai9zOGli?=
 =?utf-8?B?UEVDdzQ0emttRTN3ZlNDSHNjN1B1UTBGd1V6d3diM25WZGVOcTY1cXllb3hU?=
 =?utf-8?B?YUtEZ0ZNZGdtNFE2VkdPOHAwT2o0M3UwdEFFUm5OSkpEVVNjbVIxSHRmNzky?=
 =?utf-8?B?M2RtTklRT3lMcUlNRHY1U0dPWjl5ZmtJRVhFbEVoQzk3L3FDQ2FlRUFUV2Fs?=
 =?utf-8?B?TlNOT0RYUnptc3RPbDV4c2hPWjRtQ3RkblJGVzlxczQ1SkdVYS8zNjJ6Zmla?=
 =?utf-8?B?ekI2MXRFNGZST3VJYXNoRUZhQmoyVUZwS2IyZ3FWcVYwaVc5L3lUdjZFMDFt?=
 =?utf-8?B?TVVnaTlkamV6Q0lZU1ByUzhKWGpBcmFWdkcrejhQWnREblQ3L21Jb21uSm1F?=
 =?utf-8?B?YTNNWWJhK1hNUDJwQTlxeUlYNFVma21TWGt5OEQ2cVVFMEdrdFRyRERFb1FX?=
 =?utf-8?B?Tm5YL2V2RFcwTEkwWmxmdjdlbWttSlZBakNDNm04MzZ1V2w3ZDBoNnN2MFFH?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b4f680-c80f-430b-217b-08ddaa0f17c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 00:13:15.8764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI8c3x7WMz97ukOl7u2CComtyJPLA2zYy/x7ht5v1FQ+I/FcYsx66UD23XM2g9z/m6uutiB/wS3uM1Dzc2S0nN2+efCqabkEqgrF8lfnJYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF179F31853
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

For some reason this patch series didn't make it to any mailing
list... it only shows the b4-sent and stable:
https://lore.kernel.org/intel-xe/20250604-upstream-xe-non-4k-v2-v2-0-ce7905da7b08@aosc.io/

Could you resend this series?

thanks
Lucas De Marchi

On Wed, Jun 04, 2025 at 10:57:54AM +0800, Mingcong Bai via B4 Relay wrote:
>This patch series attempts to enable the use of xe DRM driver on non-4KiB
>kernel page platforms. This involves fixing the ttm/bo interface, as well
>as parts of the userspace API to make use of kernel `PAGE_SIZE' for
>alignment instead of the assumed `SZ_4K', it also fixes incorrect usage of
>`PAGE_SIZE' in the GuC and ring buffer interface code to make sure all
>instructions/commands were aligned to 4KiB barriers (per the Programmer's
>Manual for the GPUs covered by this DRM driver).
>
>This issue was first discovered and reported by members of the LoongArch
>user communities, whose hardware commonly ran on 16KiB-page kernels. The
>patch series began on an unassuming branch of a downstream kernel tree
>maintained by Shang Yatsen.[^1]
>
>It worked well but remained sparsely documented, a lot of the work done
>here relied on Shang Yatsen's original patch.
>
>AOSC OS then picked it up[^2] to provide Intel Xe/Arc support for users of
>its LoongArch port, for which I worked extensively on. After months of
>positive user feedback and from encouragement from Kexy Biscuit, my
>colleague at the community, I decided to examine its potential for
>upstreaming, cross-reference kernel and Intel documentation to better
>document and revise this patch.
>
>Now that this series has been tested good (for boot up, OpenGL, and
>playback of a standardised set of video samples[^3] on the following
>platforms (motherboard + GPU model):
>
>- x86-64, 4KiB kernel page:
>    - MS-7D42 + Intel Arc A580
>    - COLORFIRE B760M-MEOW WIFI D5 + Intel Arc B580
>- LoongArch, 16KiB kernel page:
>    - XA61200 + GUNNIR DG1 Blue Halberd (Intel DG1)
>    - XA61200 + GUNNIR Iris Xe Index 4 (Intel DG1)
>    - XA61200 + GUNNIR Intel Iris Xe Max Index V2 (Intel DG1)
>    - XA61200 + GUNNIR Intel Arc A380 Index 6G (Intel Arc A380)
>    - XA61200 + ASRock Arc A380 Challenger ITX OC (Intel Arc A380)
>    - XA61200 + Intel Arc A580
>    - XA61200 + GUNNIR Intel Arc A750 Photon 8G OC (Intel Arc A750)
>    - XA61200 + Intel Arc B580
>    - XB612B0 + GUNNIR Intel Iris Xe Max Index V2 (Intel DG1)
>    - XB612B0 + GUNNIR Intel Arc A380 Index 6G (Intel Arc A380)
>    - ASUS XC-LS3A6M + GUNNIR Intel Arc B580 INDEX 12G (Intel Arc B580)
>
>On these platforms, basic functionalities tested good but the driver was
>unstable with occasional resets (I do suspect however, that this platform
>suffers from PCIe coherence issues, as instability only occurs under heavy
>VRAM I/O load):
>
>- AArch64, 4KiB/64KiB kernel pages:
>    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Iris Xe Max Index V2
>      (Intel DG1)
>    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Arc A380 Index 6G
>      (Intel Arc A380)
>    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Arc A750 Photon 8G OC
>      (Intel Arc A750)
>
>I think that this patch series is now ready for your comment and review.
>Please forgive me if I made any simple mistake or used wrong terminologies,
>but I have never worked on a patch for the DRM subsystem and my experience
>is still quite thin.
>
>But anyway, just letting you all know that Intel Xe/Arc works on non-4KiB
>kernel page platforms (and honestly, it's great to use, especially for
>games and media playback)!
>
>[^1]: https://github.com/FanFansfan/loongson-linux/tree/loongarch-xe
>[^2]: We maintained Shang Yatsen's patch until our v6.13.3 tree, until
>      we decided to test and send this series upstream,
>      https://github.com/AOSC-Tracking/linux/tree/aosc/v6.13.3
>[^3]: Delicious hot pot!
>      https://repo.aosc.io/ahvl/sample-videos-20250223.tar.zst
>
>---
>Matthew(s), Lucas, and Francois:
>
>Thanks again for your patience and review.
>
>I recently had a job change and it put me off this series for months, but
>I'm back (and should be a lot more responsive now) - sorry! Let's get this
>ball rolling again.
>
>I was unfortunately unable to revise 1/5 from v1 as you requested, neither
>of your suggestions to allow allocation of VRAM smaller than page size
>worked... So I kept that part as is.
>
>As for the your comment in 5/5, I'm not sure about what the right approach
>to implement a SZ_64K >= PAGE_SIZE assert was, as there are many other
>instances of similar ternary conditional operators in the xe code. Correct
>me if I'm wrong but I felt that it might be better handled in a separate
>patch series?
>
>---
>Changes in v2:
>
>- Define `GUC_ALIGN' and use them in GuC code to improve clarity.
>- Update documentation on `DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT'.
>- Rebase, and other minor changes.
>- Link to v1:
>  https://lore.kernel.org/all/20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io/
>
>To: Lucas De Marchi <lucas.demarchi@intel.com>
>To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>To: Maxime Ripard <mripard@kernel.org>
>To: Thomas Zimmermann <tzimmermann@suse.de>
>To: David Airlie <airlied@gmail.com>
>To: Simona Vetter <simona@ffwll.ch>
>To: José Roberto de Souza <jose.souza@intel.com>
>To: Francois Dugast <francois.dugast@intel.com>
>To: Matthew Brost <matthew.brost@intel.com>
>To: Alan Previn <alan.previn.teres.alexis@intel.com>
>To: Zhanjun Dong <zhanjun.dong@intel.com>
>To: Matt Roper <matthew.d.roper@intel.com>
>To: Mateusz Naklicki <mateusz.naklicki@intel.com>
>Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: intel-xe@lists.freedesktop.org
>Cc: dri-devel@lists.freedesktop.org
>Cc: linux-kernel@vger.kernel.org
>Suggested-by: Kexy Biscuit <kexybiscuit@aosc.io>
>Co-developed-by: Shang Yatsen <429839446@qq.com>
>Signed-off-by: Shang Yatsen <429839446@qq.com>
>Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
>
>---
>Mingcong Bai (5):
>      drm/xe/bo: fix alignment with non-4KiB kernel page sizes
>      drm/xe/guc: use GUC_SIZE (SZ_4K) for alignment
>      drm/xe/regs: fix RING_CTL_SIZE(size) calculation
>      drm/xe: use 4KiB alignment for cursor jumps
>      drm/xe/query: use PAGE_SIZE as the minimum page alignment
>
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
> drivers/gpu/drm/xe/xe_bo.c               |  8 ++++----
> drivers/gpu/drm/xe/xe_guc.c              |  4 ++--
> drivers/gpu/drm/xe/xe_guc.h              |  3 +++
> drivers/gpu/drm/xe/xe_guc_ads.c          | 32 ++++++++++++++++----------------
> drivers/gpu/drm/xe/xe_guc_capture.c      |  8 ++++----
> drivers/gpu/drm/xe/xe_guc_ct.c           |  2 +-
> drivers/gpu/drm/xe/xe_guc_log.c          |  5 +++--
> drivers/gpu/drm/xe/xe_guc_pc.c           |  4 ++--
> drivers/gpu/drm/xe/xe_migrate.c          |  4 ++--
> drivers/gpu/drm/xe/xe_query.c            |  2 +-
> include/uapi/drm/xe_drm.h                |  7 +++++--
> 12 files changed, 44 insertions(+), 37 deletions(-)
>---
>base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
>change-id: 20250603-upstream-xe-non-4k-v2-4acf253c9bfd
>
>Best regards,
>-- 
>Mingcong Bai <jeffbai@aosc.io>
>
>
