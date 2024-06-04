Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90808FAA44
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 07:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1910E058;
	Tue,  4 Jun 2024 05:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViMNlz1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238E10E058;
 Tue,  4 Jun 2024 05:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717480459; x=1749016459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iZdPCy8GK7jCp3omDF3iUebMZnlwUXhbOcOan7Na7Iw=;
 b=ViMNlz1dqUD0vH0r4yCNr4n/rwtXuJrQodzesfiHA0PQ6+24laU+dJdB
 GxZZvl9eTeO1WIOL7OW5VwH59nd3r3X6pVzeDhuqudcE5O2+ufbpAc+66
 +wpFvbunWkBSmRNyGSyT9kEbK1pt84v9nR7ZcqKYh6KTOoBoi1kg8/DHs
 cxfsLQBTzngKJz8deWLcqsrZ26hYYH70i9KvWWhzcWyyOUBPazd3gVE4j
 UMgEtKLwty0u+bq5wPXWr8mIWbGMm7MlhoJck3Y6Db7XaTdV6SbPiLRL8
 viluMfZVpjNBZOWo4hxLn3WV7YiHIREJCgWjihohf75TG4mcfkg5h5L8c A==;
X-CSE-ConnectionGUID: 8oVoWI+0Q/Kbj1RHPwh4WA==
X-CSE-MsgGUID: N0YxzH7FTp+2hXYJAhgpzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11887316"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="11887316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 22:54:18 -0700
X-CSE-ConnectionGUID: vtWdnQZaT2a4G1NV9bLw0Q==
X-CSE-MsgGUID: bVQkq+VwTUSFqQVxLxBs6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="67944268"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 22:54:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 22:54:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 22:54:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 22:54:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 22:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPfl7+Qw5E920ryCkxZbi93kJTRTNosd91atLdoHfQMdRLRiQNgj8ALyusoFR3gMzz6U3ZMdlXd4TLHI/7RK4Ghy+55MqHbjxbcC8tg5c10zDuy3h4I51H1E632ocaQXwPpC62E7AFsN+TCpatKYLZhCSCYyl010XpMoMfUyNMOfeR71hO7+/nFqEdDH6vH1VQ7YCkHaNWWYXIAJTc39VLcb8/Ch29jY+GVmAgWgFDxZ6DybqOq2KdE0yDfUIkx9oIIDzQt7obnTM1EG3zumr0o9eMeXJHrqVX3WoOCyNKfrIElCIcxPjBkCp/aobp8H/EpQ5k51I1hCndkCXuXFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFwMVZccPWuNdxHeKp1yumvhlvwzwfuGREV4V/YtfJs=;
 b=jzlewl0pqnDts6S5fyzhAp3n1ZRnSoTd79uf8w8y4Atqizcwset09IvSk8f4ZNb0bQHiADoO7L4BA9EZ6WSO+ARctDGMqZ4dAteB3tb+6HdJob5SLwRyzPzlndjAIXP+PLGAFJcdeKkEuPeC11J1K0+AFw4WgfvEsggSnrsk2AXS2+yHl822dH3XqqQkI2wjRVi8qIUfJvDYpy4w+28iYL1EwOH0+GAG27+im+0ttiifd1Ynwyenx9aU1gwLlI3PP0dhyCiN+auX+o2ytPROjDeMg97SOXRC0B5JlFWe5p3NFV5sBiBcdxDzDi3uQEUOKZAJrra9o8j7+y1645Th1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 05:54:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:54:12 +0000
Message-ID: <17607dcb-dfd8-4ddb-9b37-089e597377e3@intel.com>
Date: Tue, 4 Jun 2024 11:24:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/8] drm/i915: Separate VRR related register
 definitions
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240603054904.222589-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240603054904.222589-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4c6d65-841e-447e-1a2b-08dc845ac230
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N29RODEvRXZxdldYWk9uSzh5aVQ4UmJNRnZlOTRzZGdVUXZvZ2ZTb25Hd0Fn?=
 =?utf-8?B?MlFMOTM0V21rVEt1VlB6NHpSZS95dDZhb1k3dk9BMmtKczRybDE2RDg2ZWU1?=
 =?utf-8?B?ZU1TWUI1YmNiRkNrckpwaTE2Y3RBNDhnR1VPSStISC9EbDdva0luUDJiMlIy?=
 =?utf-8?B?NkhMMGp3elJvZTRML3lyNjdFeC90N3VPbWMxa0RRYVVudXlESFhxZExWNjVo?=
 =?utf-8?B?enZLN0dGOVpJamI3Y2o1TnNmRlBiVEFHSG9GaS91UVFqZHJHeXRDWUU5Z3Nk?=
 =?utf-8?B?REp2NCs0b01lVVlUQjB6RE1kVzNXQ0x5NFQ4amNIZFFJSkRmVjRiSzhlVGJs?=
 =?utf-8?B?VWc5T2pUZ2NqQXVmYmZkNDRHS0FoQ3QwTGpoQ3lWYU55Y0dCNEIwTnBXY1kv?=
 =?utf-8?B?QU05SVBVYlplZ2s3L21vMm41UG5SN01na1BLTFdpTVB4aG55SVJsTmloMWhH?=
 =?utf-8?B?dTFsMWJLSUp2b0NrOGU5ZHF2VkNNMS9ZK3o2VXlUU2I2QXI1cjFZTVdoMEgy?=
 =?utf-8?B?UUthTmRobi9wcWEwbDFQQ0x3ZTNLREJuZk9IeGdhMmQ1cCt4K0E4TEZyQjY2?=
 =?utf-8?B?clYzNzdqL1ZSWmJGRjRwdndaN1NlSUpTYXRBLytQRERrTXFoOHpMdk1lT3pw?=
 =?utf-8?B?ZXdLVStLY28zSno2UkI4UmdZK3g5TEF1aFQzUHVmdVNOTHdiSXQ2SnlxeVV0?=
 =?utf-8?B?T2xvYjJ1WjlqRkhSV3k4RExkYWpjUDZJYjNhOTE3OENrSzlRZG9sNElCd2Rl?=
 =?utf-8?B?TjBMU1lobmtueTNTVFBENFB2THhqVXNMaURxSnc0Y3BqUythUFZnRnhDU3g4?=
 =?utf-8?B?bGVvKzkzUTlxdUkrbHEwM2Y5YUhSOEl0ZUt4OWMrQVpqazA4V0pjdEc0REFi?=
 =?utf-8?B?YmhxV0FWYktHd1JreWd1b1NDMDhiTVZXKzd4Qk40cHpFaWZuN0xmQy90Rk1T?=
 =?utf-8?B?d0p3emU0MEY2ZzJmM01YTzFYeWJmVmZIWURwUHExR2Y4c1owV2NneE5oSlcw?=
 =?utf-8?B?eTFveXkvSFptdmdnODlVZTFVWDV6YXY1RXdSejNEYXdRKzQ2bFhvb2ZjazF0?=
 =?utf-8?B?clNGcS9XMlJ6cjFwNDIxUjNmY3ZGWG1RcTFQdGhSUDJ1TjlvWk9WQU5qbEF2?=
 =?utf-8?B?dEU4ajQ5cHRMdHNOTHNUcE0wSDVOcU94eFVESkZMa0xWenJxanRHWGt4L0wx?=
 =?utf-8?B?UWF2TlE4cW9tZkNobmsrbEo1OTBSa2pJaWw5d3Z2eTIyb244K21GdzE0VGph?=
 =?utf-8?B?ai9qSkRWN3dlYVBBQkN5TUp4ekJhRkMvWnB3ODBNQ0o4MjdiMEFIazNUMGxv?=
 =?utf-8?B?V2JiZmpLNmJJVEZSWVRPelpsbk1JV200K3hLRWtHcC9aaTVYVnhrSlJwRGlQ?=
 =?utf-8?B?WnFyNS94TmxKaEJYK3lBcmJuQjlQblpzR0dKZzFIMGdFQzJ4QzU2UDdPaURW?=
 =?utf-8?B?VFBXUnFpMFNSNkhpdUhXWkwrcWVsVUhjaVFtSEVXWk5FSlJnNlRvZVhNUzBW?=
 =?utf-8?B?bGpDYnZWQ1RObnpBMUFCL1pPa05hNHgzU3NscFZSRXNHekVWK2FyQVZPRGFH?=
 =?utf-8?B?bENhRVpCQTAxSHRNVFlteHY1c200c1V3Uk1UVjFOYWUyYlNtOTVwdHpIbnZj?=
 =?utf-8?B?a0lReEltbWhTSmtPeVJVOXRabTM4NU1xcGhJVkhZWTlDUldycmZSdFhwMHBY?=
 =?utf-8?B?eC92Y1c2TlN0VHBFK3YyVGNsOXUwQjRTdXJuaEMxaHJKcXJBSE5KL3FLZTFG?=
 =?utf-8?Q?vzEhwfIVJMq/xOn7qD2i03MOa1dJEfdXkGAIWMX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhwdmJmZmNwWEhWMTVxY1ZKRFVaN3FRVkU5TnFyK3RtR1NqQ2NTOEJPcVVC?=
 =?utf-8?B?Y3hjajFvdUEwN2w1Yk05RHhySDlhd2NKbk1tZlhYeUthQ0lKOWtNSkI3Rzkr?=
 =?utf-8?B?QzArRVhGVnpEdDdhRHJoM1l4ZG5odU5HSjdyY092QmFKc2hoMm5VK2hoZHRZ?=
 =?utf-8?B?VkRDL2hwaFR5d0NuZ1owcE9WcU16dFh0bU1Md2tVejV3L1hxWTJEbFJVbSt5?=
 =?utf-8?B?RWlRak1CYUdEWU5ReWVuRnpyOUJxbmJtYndGV0gxYWV5SitobSttcDdZUDM1?=
 =?utf-8?B?M0Fxa0oyUUZ1a3ZCWm1BS1hubENjcFVLS3JtTllMOVVEZFZ1OUJMQ0FaL254?=
 =?utf-8?B?Vis2QjdsQVFRNm1lYXo1MEowM0t3czFwK2FHNkRjSGJia0RwdnNsRk52ZjZL?=
 =?utf-8?B?Ry9SZXhBNmw3bnN1NGRKNkxLZFA2ZnVIdnJQOHlINkVwQlB6bDVCYlJoT2J4?=
 =?utf-8?B?TUxheEY4RTUrQjR5M1FwNDRvRUFONkR0bko3NjRzeVZqMHNXbzRzTFVlc1hO?=
 =?utf-8?B?NkcwWk5tV0ZLdy9sN1l0OU9ocVd3T2hkM0JUbk1kdDhVN2NoVzB5Q0NFcWRu?=
 =?utf-8?B?MVo3UlhZRU93bUc0c3dVT2M2RVdxaWFPTi9TVGhJY2k5REtuQnFiMWY1MGZw?=
 =?utf-8?B?NGxqVUlleFFocmVGMmFrT0d1Q0QxUlIyeW5oQzVhb3k4ZEtZSjVJTTBZT2w4?=
 =?utf-8?B?T3RoZTBoSjZEU2JBdk0rTlFHYm9jWnZRbkttaFV3VGdSTzNNU3hHajllZm8r?=
 =?utf-8?B?cEl4czBkTGQ1blBnYWNLNEE1UlAxV1p5a2M5ZUhUMnMwQ2JrU29ETkVONHNw?=
 =?utf-8?B?RzRFaTBWTlhMVzBSajZjS0hYZThraE1kaVFTMHlBTTdxMTVvYjA0SVFuU0dh?=
 =?utf-8?B?aGg4ZDhPS1FNZVh1MnFwdktVK2Zrcy9vVEgydm04aUZCUXpUanVGRXJGZEw1?=
 =?utf-8?B?U2FFY2dOOGNwZnFXTTNGTUpOVzltSjVlNXZ6dVdEbTNPVkNENTN2V1I0Ujlv?=
 =?utf-8?B?VitBMWVxL2xUYkV6WXJMbnZQMEZXS1NKTnIrM1lSYS91NGY1czJNc3hDMnpn?=
 =?utf-8?B?VDZNTVB5bWtkZStzVnAvYUppaEdIKzhQZkpuZytJYVNKQUNqL2lHeXJTaFF2?=
 =?utf-8?B?MjdrNnhnYzA0b0QwbHY4dkxDMk0zNWhaTXhGdXJnanF1QWZhSGcxQXVUQTVn?=
 =?utf-8?B?eEl1VWtPWXlvNVRlZmdwUjY1WFVySTV3SnkyZXc3VkZwREdYQmVJTXNJd3ND?=
 =?utf-8?B?MlBWWUo0eTVzd2xvRGNHRFR0Ky9Rd3kxdzBXbDU4SVNkT2xvQ055UTdVMkVN?=
 =?utf-8?B?bjl2ZHBXZTZpUGo3bEpIdWM1YWpqZ01idGNweG1ialRkcXh3MC9RRHgvbEdq?=
 =?utf-8?B?cm9GQ2RUVjh4WVo0ZUR0LzFmblBUUUxLWjBOUWlkTkd6ZmZNeVVWb3RpczFh?=
 =?utf-8?B?UlFNZnZ4Yi9COXUweGRhV3ViMEJsaWZ0WStKNlZndG9ZZTZoK2hSV0ZBNjF5?=
 =?utf-8?B?ODVieWxVUWZFUG5ONzlKWVJxZEQvTEhsS2ZrUldQOHNjcHp1UmFPc0F5Snl2?=
 =?utf-8?B?eUdXMFBrS0lTTFJOTFN4UkNyNDViNGwyT1BSQkk4TzVJRGlkaFhTZU5LUVBX?=
 =?utf-8?B?bjYxMG5MYVFyek5iSkR1dkhrMDUzUHVsVnhFN3l3Q3E2R3pKTDh5TG03RVNQ?=
 =?utf-8?B?Vk9xMkRDL3h0Zkl3OVE4MlpiUTd5WGliZ3N0YnVsTnZJNlBpbUFHVkpaczNQ?=
 =?utf-8?B?Yzl6dkkvRXRId1NqWlVtK3ViVkJ3V1R0Q0dXY2VRcDRXOUpxU2FXNTNaMDAy?=
 =?utf-8?B?MGxoaE9tTjl2VjlaeHFhQmc5WDNzNnJ5a2dIbmYyN1dHSnoycFR1SGdTbmZw?=
 =?utf-8?B?em5TdXNIUGNMYmRvRjRZS0VZdnhmenc0VU04T0c0UEpWV0xRWGExdVlwSjZE?=
 =?utf-8?B?WUdnMlBKSjNHWU1MNHBqbk1PSi9JREtxbGtKMVpDdXFVMjJncXNHSXBzdSsy?=
 =?utf-8?B?Zmk5YTZaZG1IU05pUTFuR1ZiZFdFdjdjcUR1Q3BRZXFDRXlkQk54YjJEV09F?=
 =?utf-8?B?VDhrMmh6QjdVWjVPeXFNaVRLK3lCNXh4QkZQdW9LRnZuYWFOdEZxN3NRZmRt?=
 =?utf-8?B?RkFCRTNvOHBQaWFhUTJTeTV4YzRKVFFOcG5NOS93RGRnYWNvNStvWmk5S0RF?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4c6d65-841e-447e-1a2b-08dc845ac230
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 05:54:12.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xw4IZq/YrZnduYakr/HhxTiv6hOjTFf9ga9ejhXt3MFrGxq/yb4PT+n8c+ssc5zcOAb4uwk6eU0Y2IYz5wwESRj5Aaz5WpbMeiq/GOZ1iWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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


On 6/3/2024 11:18 AM, Mitul Golani wrote:
> Move VRR related register definitions to a separate file called
> intel_vrr_regs.h.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c      |   1 +
>   drivers/gpu/drm/i915/display/intel_vrr_regs.h | 113 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_reg.h               | 100 ----------------
>   3 files changed, 114 insertions(+), 100 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 5f3657aa8313..871e6e6a184a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -9,6 +9,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_vrr.h"
> +#include "intel_vrr_regs.h"
>   #include "intel_dp.h"
>   
>   bool intel_vrr_is_capable(struct intel_connector *connector)
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> new file mode 100644
> index 000000000000..b5695a95dd4a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_VRR_REGS_H__
> +#define __INTEL_VRR_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +/* VRR registers */
> +#define _TRANS_VRR_CTL_A		0x60420
> +#define _TRANS_VRR_CTL_B		0x61420
> +#define _TRANS_VRR_CTL_C		0x62420
> +#define _TRANS_VRR_CTL_D		0x63420
> +#define TRANS_VRR_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
> +#define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
> +#define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
> +#define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> +#define   VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
> +#define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
> +#define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
> +#define   XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
> +#define   XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK,\
> +						(x))
> +
> +#define _TRANS_VRR_VMAX_A		0x60424
> +#define _TRANS_VRR_VMAX_B		0x61424
> +#define _TRANS_VRR_VMAX_C		0x62424
> +#define _TRANS_VRR_VMAX_D		0x63424
> +#define TRANS_VRR_VMAX(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMAX_A)
> +#define   VRR_VMAX_MASK			REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_VMIN_A		0x60434
> +#define _TRANS_VRR_VMIN_B		0x61434
> +#define _TRANS_VRR_VMIN_C		0x62434
> +#define _TRANS_VRR_VMIN_D		0x63434
> +#define TRANS_VRR_VMIN(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMIN_A)
> +#define   VRR_VMIN_MASK			REG_GENMASK(15, 0)
> +
> +#define _TRANS_VRR_VMAXSHIFT_A		0x60428
> +#define _TRANS_VRR_VMAXSHIFT_B		0x61428
> +#define _TRANS_VRR_VMAXSHIFT_C		0x62428
> +#define _TRANS_VRR_VMAXSHIFT_D		0x63428
> +#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> +					_TRANS_VRR_VMAXSHIFT_A)
> +#define   VRR_VMAXSHIFT_DEC_MASK	REG_GENMASK(29, 16)
> +#define   VRR_VMAXSHIFT_DEC		REG_BIT(16)
> +#define   VRR_VMAXSHIFT_INC_MASK	REG_GENMASK(12, 0)
> +
> +#define _TRANS_VRR_STATUS_A		0x6042C
> +#define _TRANS_VRR_STATUS_B		0x6142C
> +#define _TRANS_VRR_STATUS_C		0x6242C
> +#define _TRANS_VRR_STATUS_D		0x6342C
> +#define TRANS_VRR_STATUS(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
> +#define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
> +#define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
> +#define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
> +#define   VRR_STATUS_NO_FLIP_FRAME	REG_BIT(28)
> +#define   VRR_STATUS_VRR_EN_LIVE	REG_BIT(27)
> +#define   VRR_STATUS_FLIPS_SERVICED	REG_BIT(26)
> +#define   VRR_STATUS_VBLANK_MASK	REG_GENMASK(22, 20)
> +#define   STATUS_FSM_IDLE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
> +#define   STATUS_FSM_WAIT_TILL_FDB	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 1)
> +#define   STATUS_FSM_WAIT_TILL_FS	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 2)
> +#define   STATUS_FSM_WAIT_TILL_FLIP	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 3)
> +#define   STATUS_FSM_PIPELINE_FILL	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 4)
> +#define   STATUS_FSM_ACTIVE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
> +#define   STATUS_FSM_LEGACY_VBLANK	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 6)
> +
> +#define _TRANS_VRR_VTOTAL_PREV_A	0x60480
> +#define _TRANS_VRR_VTOTAL_PREV_B	0x61480
> +#define _TRANS_VRR_VTOTAL_PREV_C	0x62480
> +#define _TRANS_VRR_VTOTAL_PREV_D	0x63480
> +#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> +					_TRANS_VRR_VTOTAL_PREV_A)
> +#define   VRR_VTOTAL_FLIP_BEFR_BNDR	REG_BIT(31)
> +#define   VRR_VTOTAL_FLIP_AFTER_BNDR	REG_BIT(30)
> +#define   VRR_VTOTAL_FLIP_AFTER_DBLBUF	REG_BIT(29)
> +#define   VRR_VTOTAL_PREV_FRAME_MASK	REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_FLIPLINE_A		0x60438
> +#define _TRANS_VRR_FLIPLINE_B		0x61438
> +#define _TRANS_VRR_FLIPLINE_C		0x62438
> +#define _TRANS_VRR_FLIPLINE_D		0x63438
> +#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> +					_TRANS_VRR_FLIPLINE_A)
> +#define   VRR_FLIPLINE_MASK		REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_STATUS2_A		0x6043C
> +#define _TRANS_VRR_STATUS2_B		0x6143C
> +#define _TRANS_VRR_STATUS2_C		0x6243C
> +#define _TRANS_VRR_STATUS2_D		0x6343C
> +#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS2_A)
> +#define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
> +
> +#define _TRANS_PUSH_A			0x60A70
> +#define _TRANS_PUSH_B			0x61A70
> +#define _TRANS_PUSH_C			0x62A70
> +#define _TRANS_PUSH_D			0x63A70
> +#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_PUSH_A)
> +#define   TRANS_PUSH_EN			REG_BIT(31)
> +#define   TRANS_PUSH_SEND		REG_BIT(30)
> +
> +#define _TRANS_VRR_VSYNC_A		0x60078
> +#define TRANS_VRR_VSYNC(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
> +#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> +#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
> +#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> +#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
> +
> +#endif /* __INTEL_VRR_REGS__ */
> +

This line seems extra.

Also with 'git show --color-moved' I still see some lines are different. 
I guess you fixed indentation and checkpatch warnings in those lines.

Perhaps you can first add a patch to fix those indexation issues in VRR 
related registers in i915.reg and then simple move those regs in the new 
file.


Regards,

Ankit


> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 6877e2f0fbc3..4ff590114c52 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1228,106 +1228,6 @@
>   #define PIPESRC(pipe)		_MMIO_TRANS2(dev_priv, (pipe), _PIPEASRC)
>   #define TRANS_MULT(trans)	_MMIO_TRANS2(dev_priv, (trans), _TRANS_MULT_A)
>   
> -/* VRR registers */
> -#define _TRANS_VRR_CTL_A		0x60420
> -#define _TRANS_VRR_CTL_B		0x61420
> -#define _TRANS_VRR_CTL_C		0x62420
> -#define _TRANS_VRR_CTL_D		0x63420
> -#define TRANS_VRR_CTL(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
> -#define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
> -#define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
> -#define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> -#define   VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
> -#define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
> -#define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
> -#define	  XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
> -#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))
> -
> -#define _TRANS_VRR_VMAX_A		0x60424
> -#define _TRANS_VRR_VMAX_B		0x61424
> -#define _TRANS_VRR_VMAX_C		0x62424
> -#define _TRANS_VRR_VMAX_D		0x63424
> -#define TRANS_VRR_VMAX(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMAX_A)
> -#define   VRR_VMAX_MASK			REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_VMIN_A		0x60434
> -#define _TRANS_VRR_VMIN_B		0x61434
> -#define _TRANS_VRR_VMIN_C		0x62434
> -#define _TRANS_VRR_VMIN_D		0x63434
> -#define TRANS_VRR_VMIN(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMIN_A)
> -#define   VRR_VMIN_MASK			REG_GENMASK(15, 0)
> -
> -#define _TRANS_VRR_VMAXSHIFT_A		0x60428
> -#define _TRANS_VRR_VMAXSHIFT_B		0x61428
> -#define _TRANS_VRR_VMAXSHIFT_C		0x62428
> -#define _TRANS_VRR_VMAXSHIFT_D		0x63428
> -#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> -					_TRANS_VRR_VMAXSHIFT_A)
> -#define   VRR_VMAXSHIFT_DEC_MASK	REG_GENMASK(29, 16)
> -#define   VRR_VMAXSHIFT_DEC		REG_BIT(16)
> -#define   VRR_VMAXSHIFT_INC_MASK	REG_GENMASK(12, 0)
> -
> -#define _TRANS_VRR_STATUS_A		0x6042C
> -#define _TRANS_VRR_STATUS_B		0x6142C
> -#define _TRANS_VRR_STATUS_C		0x6242C
> -#define _TRANS_VRR_STATUS_D		0x6342C
> -#define TRANS_VRR_STATUS(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
> -#define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
> -#define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
> -#define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
> -#define   VRR_STATUS_NO_FLIP_FRAME	REG_BIT(28)
> -#define   VRR_STATUS_VRR_EN_LIVE	REG_BIT(27)
> -#define   VRR_STATUS_FLIPS_SERVICED	REG_BIT(26)
> -#define   VRR_STATUS_VBLANK_MASK	REG_GENMASK(22, 20)
> -#define   STATUS_FSM_IDLE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
> -#define   STATUS_FSM_WAIT_TILL_FDB	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 1)
> -#define   STATUS_FSM_WAIT_TILL_FS	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 2)
> -#define   STATUS_FSM_WAIT_TILL_FLIP	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 3)
> -#define   STATUS_FSM_PIPELINE_FILL	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 4)
> -#define   STATUS_FSM_ACTIVE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
> -#define   STATUS_FSM_LEGACY_VBLANK	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 6)
> -
> -#define _TRANS_VRR_VTOTAL_PREV_A	0x60480
> -#define _TRANS_VRR_VTOTAL_PREV_B	0x61480
> -#define _TRANS_VRR_VTOTAL_PREV_C	0x62480
> -#define _TRANS_VRR_VTOTAL_PREV_D	0x63480
> -#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> -					_TRANS_VRR_VTOTAL_PREV_A)
> -#define   VRR_VTOTAL_FLIP_BEFR_BNDR	REG_BIT(31)
> -#define   VRR_VTOTAL_FLIP_AFTER_BNDR	REG_BIT(30)
> -#define   VRR_VTOTAL_FLIP_AFTER_DBLBUF	REG_BIT(29)
> -#define   VRR_VTOTAL_PREV_FRAME_MASK	REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_FLIPLINE_A		0x60438
> -#define _TRANS_VRR_FLIPLINE_B		0x61438
> -#define _TRANS_VRR_FLIPLINE_C		0x62438
> -#define _TRANS_VRR_FLIPLINE_D		0x63438
> -#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> -					_TRANS_VRR_FLIPLINE_A)
> -#define   VRR_FLIPLINE_MASK		REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_STATUS2_A		0x6043C
> -#define _TRANS_VRR_STATUS2_B		0x6143C
> -#define _TRANS_VRR_STATUS2_C		0x6243C
> -#define _TRANS_VRR_STATUS2_D		0x6343C
> -#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS2_A)
> -#define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
> -
> -#define _TRANS_PUSH_A			0x60A70
> -#define _TRANS_PUSH_B			0x61A70
> -#define _TRANS_PUSH_C			0x62A70
> -#define _TRANS_PUSH_D			0x63A70
> -#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_PUSH_A)
> -#define   TRANS_PUSH_EN			REG_BIT(31)
> -#define   TRANS_PUSH_SEND		REG_BIT(30)
> -
> -#define _TRANS_VRR_VSYNC_A		0x60078
> -#define TRANS_VRR_VSYNC(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
> -#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> -#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
> -#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> -#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
> -
>   /* VGA port control */
>   #define ADPA			_MMIO(0x61100)
>   #define PCH_ADPA                _MMIO(0xe1100)
