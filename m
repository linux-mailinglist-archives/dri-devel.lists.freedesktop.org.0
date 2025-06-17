Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16009ADC58F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 11:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A77E10E541;
	Tue, 17 Jun 2025 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htpZMRLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9210E541;
 Tue, 17 Jun 2025 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750150871; x=1781686871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bGUX4tKGbxVlB6lyUaDUuAYgT4oi5DWy7KPxmg01NOw=;
 b=htpZMRLi1vqdd/AyRIYByAhv2xG2fhCzno9fV7CfwIYDa/h/ya42g6nd
 L7+ZW4XGe/xdiNnC2BLaJ1NTYwOIthHX7Ml3JAO11kaor/HzOh3YA7Qpq
 UA8wyNyMZ6UebpC+1kVK/gUQBNwS6lqSE5FSGmoYw4VBaM6gl6/uvjyGf
 5pFprjpKSEgS7epqLA3/N5OKv9ZFc9VNBwnNnuynXsvZJ8p1FE3MjI5F+
 wxyXowhszV3DxE83N+scUNqNLk2Ek2D+PmeRRA/S+EJYg5SG8jfzpldUZ
 7trxgNw1cvWb6A/Xtd2XPqRys2RrWqh6Xg+xmBVUuFueVRw7BSwsNyJUX Q==;
X-CSE-ConnectionGUID: YVFhxs1eSs2ZweVjs51+tg==
X-CSE-MsgGUID: w18oX1gKRzOZsXp+ZQK+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54931288"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="54931288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 02:01:10 -0700
X-CSE-ConnectionGUID: OaJwZjQzQ0eP/0llpJATeQ==
X-CSE-MsgGUID: sWFICXHtRhCZbV/jZopN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="148709858"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 02:01:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 02:01:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 02:01:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 02:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oa9lzRo229VnyWwWA4OrhU0QR2Ih00ulyzBgonfz+1fGLtVEWHdna1AvwVzF7IoVaadUl/aGm3dWZBGIzttvgaxM3ZIT1EKlfLeRR36vMX0eiczJV8STW6K86Kkctr8NNW/BpDhTl+HIGp6kWVJ/fE/Rxh6Sjcc5XUTDRpP/KYrIOaS5vZ673wh0pH7xF7yjrv9GPMnuTBwaB7IADYwyayHJHHLokP2Y3hn9oRL6Hcvn7PZQ4hQK0eboSNoQEVn+nk0u2fKVvXEkCBhhMNohPhKmcpGRaqTRG5v+LplNuDmQ1AVXiV2nCiGaaH0405CLGvS2qYtfDb195TOVIPSrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua6jKRGEFrQRdic6xL85LQKH14n/53jdIPy6lGPkGyM=;
 b=bRPMSp2G0b0uPVNulUKvlY4D9AHIh/GzmRCmYkjvnwLU0ziFndPno0+QPCD5rUVPu7IYr37MQQcT2pRjB9EtP4rJFvvbnOXQcKLu/x4MCaWoV/hlGsp9ePHgRe9Z4Vmm4dDMHUyCpRVSV06uP9ekSXPzeJRFczCDzk/dVVz0HgZDkn/1syEF9eOSwBXYKVj5mEDLtT6keOEO0kR0he0f0vu0Q3sToUBxfNXaFUwZKAsUtIR3KPyzZm2hHRthLPYbaueKQ8YHQbIYpi5UqFkQvIlMMjK3l4RFO+cuAX3kjII1zkSDHp38g3+xk7UjbbD6PhEseVjE8LSrHgtre6V+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:01:06 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:01:06 +0000
Message-ID: <417a31c8-44ea-4a6e-a2fb-46ffba746189@intel.com>
Date: Tue, 17 Jun 2025 14:30:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
 <aE8QakHX22IM4L3x@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aE8QakHX22IM4L3x@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 49727bdd-b019-4705-a570-08ddad7d7e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2dNa1dPalZtamJ1NGlqNmFNYUpBRE43RmhiMjAwZUVmaExjUnpSaE9FU3hw?=
 =?utf-8?B?TUI1bTZQRmVFT1d0RnNWNFczdmFSQVFMd1JyM3JOSlpaaDNLbzBGU29KUHhi?=
 =?utf-8?B?V0x4eEtJTnRndXRTZEV3TXNHK3VzaTRkUTcrZGtxcWhCMXdNcUtKUnV2TUhl?=
 =?utf-8?B?Vk1rbkNpbExqRllwaU9BSWZObHNEczVTWWt0MFdlMzdvVlFtMDdqTzhHUVJz?=
 =?utf-8?B?UnZEME1ReTA0YmtiK21ZUDhNcUpaVVJwQ0hRV1FHdnVvREJSRnU2d3NqK2Fm?=
 =?utf-8?B?ZWNLaloxc2VhY3JTNS85SDAvakgzYWZpbFVJbU1yeGsyeGtyZk4wWmxhU2Mw?=
 =?utf-8?B?S0NaMzl4cjRJcVp3SW45WjdyY1k5TnBTV0l1Rit1cndmejlObXZLUkRnQVJt?=
 =?utf-8?B?K1pnM2g0VVkrdmYyQlcrNVJCVy9BRXNwWVZ6UmNnVlJzMmxBem1Xb3IxTHFu?=
 =?utf-8?B?ZC9KbUlTYWlsTEQ5SzJMN3VTQmhLRUhCbnV3RklwWlduN3QzVU1ValZqY2dP?=
 =?utf-8?B?TXhwVG9tNG5MdlBucXl0M1NlMk9zZTFrYTdRRUZRRXpQVGJ4TGtyL0lBSkht?=
 =?utf-8?B?YlVjaE1iclVHOEpCK2pRZ3k1U1c2dzdXcFJpVnN6VlpDSURmWExVT2J1U3JV?=
 =?utf-8?B?cldBYXRZd0FDRUcxTVFyTXQ4Vm5rR3l2WnhKcklmNGFLcE02N3lLaXptN29S?=
 =?utf-8?B?dFVIaGdZc0ZXTVIrMVNLQ29PQnowaU11YTNnMmI3S3dLUXlwYzVkcFhxVkFJ?=
 =?utf-8?B?SnV4Q3pCQTNleHRzOUltTkkzQmhBWklJRzNIQnZ4dlpHMk9aZ1dMR0JVcXJU?=
 =?utf-8?B?RVhrc1VCbmJKMnlITDF4VHkzcGdzMU5CUWFGU3RYMTlQWDZnOFlqVUxUYlRV?=
 =?utf-8?B?Z296ZnRkU2JlTnkzcjYvSmkvbjVuZStYczhWRDJ5REoyQS9BbkJhM0VPWTMx?=
 =?utf-8?B?VkZjY2dMd3ZBVXg3YXdFcXRjb3VLK2ZKZ1pRcXkvMGMwR0x3NjNuTzN1OUZF?=
 =?utf-8?B?VWlHZ0NzQkdiZXJKSnlFV2phNEc1NFM5MkR0U25rRy9nYmtkbDdiMkFLampL?=
 =?utf-8?B?cUI4bWMrL0xsc1VQY1BUZXUzVnRXbzltem1DTnVvV2FFb2RpaEMvWlNlNTh3?=
 =?utf-8?B?TUtxTVovTGF1anhsOUpqNmo5NTZURUZKQ0ZjSXZzbjlVOXVFVHJoNDhLQy85?=
 =?utf-8?B?d2NTVSs5K3RXdWNxT2VRbTZiVUs2d1ZkT2U5WFBmbTBicWJ3OTZiMElpQ2hT?=
 =?utf-8?B?K21KaUtoQks2MEMzeVZvNTVKeUtXYWZmeDBNVHg1dEpNSUQrYThmQTkvclJQ?=
 =?utf-8?B?RTUxWlRmMHJZS0dGdE5UQ2dtb1VISmh0RGtuVittR0R4bnc0TklackxoVVBM?=
 =?utf-8?B?cEErekkvQkRtVmd0NjVUYVFYMVNEaU1lNUdVcEFMaTU0a3pralNmOWcvaGth?=
 =?utf-8?B?aXlrNmorNTV5UU9peXIrdW5jOG5UMHAzUnlOZmpSVXVvd25TQlpLVHBKOXNG?=
 =?utf-8?B?K1c0RHBQZ3o5bnVMR0RJT1h4K0E0U2xwWEV2VGQwU2MxSEVWd0J4VEFHRklI?=
 =?utf-8?B?Nkh4SEdnRlVNRHcwaGpYS0twajJpb1Y0dkV0bzk4R1NKM0ZXWGxMWWlVaCtz?=
 =?utf-8?B?QTIzc25uYTR2amY5bmgxMFpNQWlRWmwrMTJBZG5KVUFEVnpMN0lxTjRBSWZm?=
 =?utf-8?B?UlN4ZGFTVlNsY1VwMTlHSWh5SzhzeEdxK0ZpcmFOUTVENHpWazlZZ2Q1TDQw?=
 =?utf-8?B?MmhSWHpTRGtWemplM0NDVjZKZnpoRS9HQXlPR1RYMkl2bU1jWlhVUnZnY09C?=
 =?utf-8?B?aXF3WHhFVkYxd3d4cDl6NGc1Sm13Vk1RajZGM2NrT05ieFlRcnE0Y0MrV29K?=
 =?utf-8?B?eWJTTTFGbkZKMlVnNStLYlc1NExmdGFYUHprV2FJT3dscWE0UTJmRE4ybzFU?=
 =?utf-8?Q?7pSBMbEDHIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTR2Zkhza0xlamZvcHZOL1NLaFVLZ2UzcnpBZmlKQTQ4T29jekhwSmFSM0Mz?=
 =?utf-8?B?UWhhQURnMzNoSHU1ek9PTDdGSW9XQWNtbCt5TG5Ld1FlQnFlbFMxamJ0d1B2?=
 =?utf-8?B?czFSTUpFNW90dmhPWWZ1aWdyUWZUaFVsOVpyQ3JiNlVqekVQT3Mxb3dFRU1D?=
 =?utf-8?B?MzFZRndld3QvK1lOenk5cFFkSmFKcjdKaXNybk5JTHRtUGl6MjB4YVoxSTUv?=
 =?utf-8?B?ZlowL2l5cTU1a2lsYlpQYU9lVU54QWtwcTNWZnhOQ013eFJBSGtJT3FLT2Jq?=
 =?utf-8?B?R3l2bnh4Yjl5bldNelo5c2FsaXIweHA2RHROV1g2ZG5LaEcycHBsS3BtV080?=
 =?utf-8?B?SmowMSt6YU9ybW9kTWhNWXYxRDRUOFdnZ0ZtZVRvZlN1V3RYRDRpU2RUeHEx?=
 =?utf-8?B?b2RZMXdXR09OQVpGejJqL1NyRUdob2hDc0R0YVBrcXk1Q2tOQWtHYUp0YUQv?=
 =?utf-8?B?QWpZRXViS2pya0s0dmNaUGRlSHlIYlJxSlhhckwwT3ZQUXlrQU83a21FbjhZ?=
 =?utf-8?B?U1R0UGx4NVNIaEZhWUlmbnZRUloxUVkwZjNsQS9TdWtOZHh4UkpNK01zUGp3?=
 =?utf-8?B?UnhuRHFhNzNNRmxrS2dRQzV4WmY5a3dUaGliek1ZZ0swUFVHSHBBd0NZQ2t1?=
 =?utf-8?B?NExKY0o2ZlZUV0FLSDNWNjlwMWpqL2kxMUt3RzMwZ2U4OFZDTElleXhnTFpQ?=
 =?utf-8?B?c2lVVWNBbzdNVW9hTEdlOVBkNnc5MzJnWG1pREJhWVl0Q0JFM1d3aC9veU5D?=
 =?utf-8?B?emloZ0gvL3c4c212UU5uSTU3YU9BcE5SY1ZvUWRuS294d2pQZTJEVVBkVlRo?=
 =?utf-8?B?Z012M1ZLcFhrcWtNWGxBbDZPWjU3dlFTR1JJemU4YjN6QjNONXlqUzZGSVhU?=
 =?utf-8?B?eklrNkx0NkJYTmprVUhRdFc0YXo4bnkxY21pc2pLVXpueFlpOWVHMEhvdGti?=
 =?utf-8?B?NndOc0hsakVuRjlXRllKcVVoTklNRVNTZDJUZlNxWGVKZXhVOCtKbytSOVpq?=
 =?utf-8?B?d0V2cUZqQkhrNDhvYTcwTnZyd09adTkwVDUyamRTY0M2MUtiZFR2Qkd4cXhF?=
 =?utf-8?B?VE9TWEMrYTYxVThOMzNuUWErQXlUUk1UeUxyYkU3dHBwTFNuSTIvNnVUV08v?=
 =?utf-8?B?K0c1aFIyMktYY04yanRsOVNaeUp0YitKUU5VOWd3bjdXaWZoSjZZdmt4djYr?=
 =?utf-8?B?K21TSW5jWmc5L2p2TWh3RHBhVHRzcHpDTjNaTEgranZSejFTZkR6Zy9zTnJN?=
 =?utf-8?B?V1h1NFR3c1V4TmNKY0JKdXNDK2VkL0VZV1ZFRExVdVNudFI2SU14bU90Q0Fv?=
 =?utf-8?B?eVdsRXZuRU1RTDV4ZVpnZHhJK1VVbzM1WHo0OE04MUJpdW9ibEFCZks3STYz?=
 =?utf-8?B?TmlXbWtHY1VmaWpWYUJ2VGw4WkJ5bnVsaFVFUkJlNEwyYzhzMGo1Rnd2UkYr?=
 =?utf-8?B?WCtEWDJZK0VxYmxDdEs1NHFVNnhlVzhzZTgveFRCRzdFak1pUFI0dWt2UWV5?=
 =?utf-8?B?aVprMWNLMkZuNEN1QllvVVBJZjhYdE16YmZuaHdMb1hiYSt3V2puUUowaHY4?=
 =?utf-8?B?VlErdDNMUldTWTE5elp6Qi8vZDNkSm90alVKaEdjNEI5VE1XR0pIWDBWVTls?=
 =?utf-8?B?eHk3a011b0NiV0dEMXo4bWFtRVh1RTNjeGliZm9lc0lHaTNMUjdlWUdYbHh0?=
 =?utf-8?B?NnNGbmR3M3FndE85Q0lQVzRlNSs0T1BMaHdwVm8rZE42T3F1R2R2MFMwVndp?=
 =?utf-8?B?bExOR2I4R1Z0MTQ0Z2F0UEsyVlRaSjgrcktGMFNVQWpOS0lDRCtkbUlDWEts?=
 =?utf-8?B?Zng5VXVDMk1jdjgrZHROT3NnQ0pqbDZTWGNwa1lZeFJraUF6eDZ3NGk5dzVU?=
 =?utf-8?B?NmIvVFB6NkczdjI3NmlhelBEa1JyZDVUckVwYTZOMUd4SEdjaUF3N0R0Q3lN?=
 =?utf-8?B?T1JIMGs1M1djSlhqWHBFelcvOXl3TTQxUTNocXpXa2EwQnJ6dUJ1QnhxcGtZ?=
 =?utf-8?B?QkMrczVsc1hCTFpYMFpKK1dpb0xPNC9LUTk5RDJ2NlBNbjdMWGJ6eUtQQVJl?=
 =?utf-8?B?ZUZCZnNxaGFhTlBiQThQbE5TL1VpdU5CQUJhaDFYelUwWU9pOHhCQkFNSmFE?=
 =?utf-8?B?UmtBbFZWdWJ1Y3dXNmZBbGNZNUhaUUR2KzQ5NmlkNlpyWjV3T05jTTFreFRL?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49727bdd-b019-4705-a570-08ddad7d7e4a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:01:06.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CC4k0isgq6Al88I2MwOufW+gWep26sS7cwyiTIXQGftkwgO+rlzatWwaJNjhz7Iwj826VOGdBsOhtO2TQPUOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

Hi Umesh,

On 15-06-2025 23:56, Umesh Nerlige Ramappa wrote:
> Hi Badal,
>
> Just a small query below..
>
> On Fri, Jun 06, 2025 at 11:27:02PM +0530, Badal Nilawar wrote:
>> Load late binding firmware
>>
>> v2:
>> - s/EAGAIN/EBUSY/
>> - Flush worker in suspend and driver unload (Daniele)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121 ++++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>> drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
>> 3 files changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 0231f3dcfc18..7fe304c54374 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -16,6 +16,16 @@
>> #include "xe_late_bind_fw.h"
>> #include "xe_pcode.h"
>> #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it 
>> could take
>> + * a bit. Using a very big timeout just to cover the worst case 
>> scenario
>> + */
>> +#define LB_INIT_TIMEOUT_MS 20000
>> +
>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>>
>> static const char * const fw_type_to_name[] = {
>>         [CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
>> @@ -39,6 +49,95 @@ static int late_bind_fw_num_fans(struct 
>> xe_late_bind *late_bind)
>>         return 0;
>> }
>>
>> +static void xe_late_bind_wait_for_worker_completion(struct 
>> xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +
>> +    lbfw = &late_bind->late_bind_fw;
>> +    if (lbfw->valid && late_bind->wq) {
>> +        drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>> +            fw_type_to_name[lbfw->type]);
>> +            flush_work(&lbfw->work);
>> +    }
>> +}
>> +
>> +static void late_bind_work(struct work_struct *work)
>
> Why is this a worker? Do we let the kmd probe go ahead while this 
> worker is trying to do a push_config? Wondering why this logic is not 
> directly called from the bind here. 

Component load may take time and doesn't happen in sequence, so 
push_config should be done through worker. Also push_config may take 
time to connect with mei, which is handled with retry on busy.

[   38.014850] xe 0000:03:00.0: [drm:skl_compute_wm [xe]] [CRTC:88:pipe 
A] dbuf slices 0x1 -> 0xf, ddb (0 - 682) -> (0 - 4096), active pipes 0x1 
-> 0x1
[   38.014934] xe 0000:03:00.0: [drm:skl_compute_wm [xe]] 
[PLANE:33:plane 1A] ddb (   0 -  682) -> (   0 - 4037), size 682 -> 4037
[   38.014941] mei_late_bind 
xe.mei-gscfi.768-e2c2afa2-3817-4d19-9d95-06b16b588a5d: bound 
0000:03:00.0 (ops xe_late_bind_component_ops [xe])
[   38.015012] xe 0000:03:00.0: [drm:skl_compute_wm [xe]] 
[PLANE:83:cursor A] ddb (   0 -    0) -> (4037 - 4096), size 0 ->   59
[   38.015088] xe 0000:03:00.0: [drm:skl_compute_wm [xe]] 
[PLANE:33:plane 1A]   level *wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, 
twm,*swm, stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5, wm6, wm7, twm,*swm, stwm

Worker can be scheduled from bind call, but in s2idle resume flow 
interface rebounds. Which will eventually schedule the worker to reload 
the lb binary. Which we don't want.

Regards,
Badal

>
> Thanks,
> Umesh
>
>> +{
>> +    struct xe_late_bind_fw *lbfw = container_of(work, struct 
>> xe_late_bind_fw, work);
>> +    struct xe_late_bind *late_bind = container_of(lbfw, struct 
>> xe_late_bind,
>> +                              late_bind_fw);
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>> +    int ret;
>> +    int slept;
>> +
>> +    if (!late_bind->component_added)
>> +        return;
>> +
>> +    if (!lbfw->valid)
>> +        return;
>> +
>> +    /* we can queue this before the component is bound */
>> +    for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>> +        if (late_bind->component.ops)
>> +            break;
>> +        msleep(100);
>> +    }
>> +
>> +    xe_pm_runtime_get(xe);
>> +    mutex_lock(&late_bind->mutex);
>> +
>> +    if (!late_bind->component.ops) {
>> +        drm_err(&xe->drm, "Late bind component not bound\n");
>> +        goto out;
>> +    }
>> +
>> +    drm_dbg(&xe->drm, "Load %s firmware\n", 
>> fw_type_to_name[lbfw->type]);
>> +
>> +    do {
>> +        ret = 
>> late_bind->component.ops->push_config(late_bind->component.mei_dev,
>> +                                lbfw->type, lbfw->flags,
>> +                                lbfw->payload, lbfw->payload_size);
>> +        if (!ret)
>> +            break;
>> +        msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>> +    } while (--retry && ret == -EBUSY);
>> +
>> +    if (ret)
>> +        drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
>> +            fw_type_to_name[lbfw->type], ret);
>> +    else
>> +        drm_dbg(&xe->drm, "Load %s firmware successful\n",
>> +            fw_type_to_name[lbfw->type]);
>> +out:
>> +    mutex_unlock(&late_bind->mutex);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +
>> +    if (!late_bind->component_added)
>> +        return -EINVAL;
>> +
>> +    lbfw = &late_bind->late_bind_fw;
>> +    if (lbfw->valid) {
>> +        drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
>> +            fw_type_to_name[lbfw->type]);
>> +            queue_work(late_bind->wq, &lbfw->work);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * late_bind_fw_init() - initialize late bind firmware
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>> static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>> {
>>     struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -87,6 +186,7 @@ static int late_bind_fw_init(struct xe_late_bind 
>> *late_bind, u32 type)
>>
>>     memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>     release_firmware(fw);
>> +    INIT_WORK(&lb_fw->work, late_bind_work);
>>     lb_fw->valid = true;
>>
>>     return 0;
>> @@ -99,7 +199,17 @@ static int late_bind_fw_init(struct xe_late_bind 
>> *late_bind, u32 type)
>>  */
>> int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>> {
>> -    return late_bind_fw_init(late_bind, 
>> CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>> +    int ret;
>> +
>> +    late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>> +    if (!late_bind->wq)
>> +        return -ENOMEM;
>> +
>> +    ret = late_bind_fw_init(late_bind, 
>> CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return xe_late_bind_fw_load(late_bind);
>> }
>>
>> static int xe_late_bind_component_bind(struct device *xe_kdev,
>> @@ -122,6 +232,8 @@ static void xe_late_bind_component_unbind(struct 
>> device *xe_kdev,
>>     struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>>     struct xe_late_bind *late_bind = &xe->late_bind;
>>
>> +    xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>     mutex_lock(&late_bind->mutex);
>>     late_bind->component.ops = NULL;
>>     mutex_unlock(&late_bind->mutex);
>> @@ -140,9 +252,16 @@ static void xe_late_bind_remove(void *arg)
>>     if (!late_bind->component_added)
>>         return;
>>
>> +    xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>     component_del(xe->drm.dev, &xe_late_bind_component_ops);
>>     late_bind->component_added = false;
>> +    if (late_bind->wq) {
>> +        destroy_workqueue(late_bind->wq);
>> +        late_bind->wq = NULL;
>> +    }
>>     mutex_destroy(&late_bind->mutex);
>> +
>> }
>>
>> /**
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index a8b47523b203..166957e84c2f 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>
>> int xe_late_bind_init(struct xe_late_bind *late_bind);
>> int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index c427e141c685..690680e8ff22 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -9,6 +9,7 @@
>> #include <linux/iosys-map.h>
>> #include <linux/mutex.h>
>> #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>
>> #define MAX_PAYLOAD_SIZE (1024 * 4)
>>
>> @@ -43,6 +44,8 @@ struct xe_late_bind_fw {
>>     u8  payload[MAX_PAYLOAD_SIZE];
>>     /** @late_bind_fw.payload_size: late binding blob payload_size */
>>     size_t payload_size;
>> +    /** @late_bind_fw.work: worker to upload latebind blob */
>> +    struct work_struct work;
>> };
>>
>> /**
>> @@ -71,6 +74,8 @@ struct xe_late_bind {
>>     struct mutex mutex;
>>     /** @late_bind.late_bind_fw: late binding firmware */
>>     struct xe_late_bind_fw late_bind_fw;
>> +    /** @late_bind.wq: workqueue to submit request to download late 
>> bind blob */
>> +    struct workqueue_struct *wq;
>> };
>>
>> #endif
>> -- 
>> 2.34.1
>>
