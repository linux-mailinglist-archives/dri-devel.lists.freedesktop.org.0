Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAF393A2EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 16:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D1710E609;
	Tue, 23 Jul 2024 14:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B824PN+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF9910E5F2;
 Tue, 23 Jul 2024 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721745598; x=1753281598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wpBk3iINfXjge2QC87F4Wf4jTxPO0WBeoUDITkA9Mb8=;
 b=B824PN+DoHi9l1OOWnjnxio/9QPJLQN4FpNFliJtFij7JyzgvqpjA4vf
 8ZpmYUm2SU7gOliViGUhkMbG3JDpSXp5u7s6bsmzny3f4lEW255gaPztT
 qxV6IwOLsVrdGYv+/fOxbCBG2JZ+rQfOMy77j76dK0MhqDdkQmaVyBEQu
 yIDjBUi1oATcZsLm9qohk3em7NVqWDTrTVPf1GIytvDyJQFV1u9sDHqxE
 SE2nfYTcMWI9Xby+Rts/Kk3duLS/bYCHNUIL0qDbxDDDW1zvVMr83E6mL
 HGG6/QZLrqmAwOrAFANOzoN3CjGD95Lo+ZJUndoK0a4dpDUEQjxL1RlMV A==;
X-CSE-ConnectionGUID: 8jKeEWYmQ2aQUW/l8xnEOw==
X-CSE-MsgGUID: WfhMsLgATha/ONrfy7dw9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30037551"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30037551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 07:39:57 -0700
X-CSE-ConnectionGUID: iUSP7f+pRWaoIP2EeECEdg==
X-CSE-MsgGUID: ISg0VYkfS3yA22fRa4ll+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52320029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 07:39:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 07:39:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 07:39:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 07:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dzui5rjfAK9DExUsDHNs4EfYcdhnCuaySknxLgAFYRfIf/w9n0HwYqDtxUEA2CcjcKTVkm4pVn9m0i8oVDfXIUNHdUWDiI1Xt1JNAgF33pP69lgt3kBcWyoRZW5Z0UO8x9J2n79CsZ7/3fvGXzxPIkgds9YBt4ezlHYe3a03R2F/LSoQsbRRZB12aAQbQ5FHQSVUvN/ztYQCiddtabDFzbcFhXKrxvZIdy9sDiR2/ifN5qJIYpzqvDPQ0TKP3x9zhyny4x4NLCNd9WnlKh1DthKiBR6goeXmRNyGrpIhgTlelKD4GJo47bVF9ZnpK/8gkav13M/ei9Umk28jzbZjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4SzFB/laX8AQpDFOR5Qrk38iUxMBkin5p2WQcCwO1w=;
 b=h4sOyPko3UQqc5QT5ZYuRPtHRTa+H9/ZPSZ1DDqrnh9UQ8n2HdwtMnrXTr3lP9l9lC7n4SKwjJSLdEoZkZjATg+wyVKtuJbC4M+vgNMWSsJXF0ywJ6uuG3HAKnCtlijj5X0d5zA2PPvvh9U3qNc/6YrGT0BofaBF23eKOYFE0QE2vQVpEiaA7Vu8lY84pEHbx6QQhDi210ui+nbPLGrQxghysmn1xYIwlK3dpH9Mihe3FvRIZ9OhjWhmQHBRP26WFnt679vqqXYBqAVttCZqSNd+0FmyHNqpuLAZCpzHnDkwAEB/YwcE83GUZXCohkdSCVsyjAO28DjkdrRclQb47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 14:39:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 14:39:54 +0000
Message-ID: <5fa44132-10fe-4d66-a3ac-6f3b90674a2e@intel.com>
Date: Tue, 23 Jul 2024 20:09:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20240712122356.360613-1-raag.jadav@intel.com>
 <8b7a3b03-1c09-4b1c-8816-4779176e7903@intel.com>
 <Zp-EvHsiKbqmhgMy@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Zp-EvHsiKbqmhgMy@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 612b6171-d08f-4095-2ff2-08dcab2550bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NJZ3Bab1NpbVZOOEg1V1NnVEd0NGRFa3NOZ1FISEM2RkFLT1Z5eVJnWmFy?=
 =?utf-8?B?NVRyR05jZWg4RXZxTXZmVVRQMGtZVkR3T0c3OXFTZnZZVkU3bitpcXZHYTZB?=
 =?utf-8?B?VjZ5YzZtSHZmYjV6NDRKc3Izc0dYbHVVeWk1SHV6aG13djFKR0tOS0RaVnFj?=
 =?utf-8?B?Y0tmdVU3YWdTY0JvY3FxVE04UnppaXoxZVVxWVRLUnZ3VTBScElLa2FLalRE?=
 =?utf-8?B?cm83TzRBRkwxUGU2M2ZlNFdDRmFRajcvemw0UUM4Z05IWlpoYWdrQ2prcG1s?=
 =?utf-8?B?TWhTcXRmU1pNcGY4dWxEMkswRTRQY2prZUF0SkRXbjJDdlB5U0ZEb2JlWDg3?=
 =?utf-8?B?bGRmamxHNFM1TE5VbGRnOHVab05GUi9vU25TdlRWNkRTOFlUZ2pzU3pMUFFU?=
 =?utf-8?B?YWhSaU5rd2FUdEVzRFdpM0xKVHFTZFlYWEZxSWt3Y1FZVGZPQ3BLU1VJUE9F?=
 =?utf-8?B?dFBwV0dkV2NWZnpPWWRIemdDVHYzWXVCYS9SUW0zN2c3aUYwNU5Mc1lINjRP?=
 =?utf-8?B?U1Jyc1ZFMDMwaGsxQjBRNkM0N3ZtY1UrWERyTjV6eEVnSDRsZW1CZ2h5OUY0?=
 =?utf-8?B?M1FLdVlIU3RVR1ArQVNzNkp4NkZmaXBGejNaNnFWd1dVR1piSHk4K3dnOHJu?=
 =?utf-8?B?Nlo5eWdhN0dYOElHdHh4S1VzOW5iMVdnamczYXU3MDJCTGlzTVRrM1JDd2Zr?=
 =?utf-8?B?b1puT04wZXBzOW9VNVo1NHNTNW1NVVJ0SFpLcWlSc3RSVFo1YmZqeGkzOG9x?=
 =?utf-8?B?Yi9wTFdJV3l0UHMrTy9qcjVISlAveUJSN3RTVDJFYUpyN2dOZXA1bEN5K1JW?=
 =?utf-8?B?blV5THhpU0c2VDZkSGxMeStYRXA4VFRDQWdMTjdsaGFqNFIvM1JORGZDK0dy?=
 =?utf-8?B?WjdKVllXeTRPVTkyM0xDSEhuSFp0eG5EUmxDT3dzSWNwNDEvTEJCVjJoSXZs?=
 =?utf-8?B?bXYzT2h1M2R1NXRtMER6YnE4THR5aGJNdlpLZWRvdkVrQlhMNjBRSkxQZFdB?=
 =?utf-8?B?RFY4M1RHY1FYOVlVaVRualphLzJzLzd0NmlDSzR2WCtEWUZPaUJtVVhJYzh3?=
 =?utf-8?B?WXIzZ1dPVDhKTk9QaERkRkRwUHhSR0RqdktRaWFtVnNGWUVheHhXOXY0Z1Yz?=
 =?utf-8?B?eVg0OWdsRndQZkVCbEhHVFZybnhwU1JrRS94TFdKd1gvcEJCUDJlVXJ3bit0?=
 =?utf-8?B?eW1wTDlWV2hpNGwrdWJNSkt0SEkyWENiSDFpNS9pMHBXMmg3QkRRd3JkNTNs?=
 =?utf-8?B?SXlVZnAwSlNnRkoyYm1JUnZFK2l3dUlwSGh0UnhoUnhkTlp3SXk3YzJoUFc3?=
 =?utf-8?B?TFlrWHMzRjdsa2czck5GTDRIblg1RytnNFZzR0dXNDd0aElzZ0lDRkdkK2tU?=
 =?utf-8?B?UVJPNHpFWGliaS9zS0NGaTRFcEFBbERqM2c1OEJQY2gzeEovbkc4ODVheVZz?=
 =?utf-8?B?bXd4MVNBU3Q0dmtWNjk5dEZBNzlkVVhKZUNYWTAyNTEwU2lGOFRMVW5HVzFh?=
 =?utf-8?B?K3lTNlFTenM3aW1KNFFlNmZtQUdLcVBSZ0tvYnVZbEMwRTh0czJsdTJxZzhz?=
 =?utf-8?B?cnMxaU1PalJScUJCblZkZmc4UHZqNVgwWmUvY1E0U2tMQitRQ1FXekZYeWt3?=
 =?utf-8?B?T0o5Mk5ERFpkbCsxc1pMMW9oNWN5UEhEZ004bVlnOGRFTk5CYVpEbTI3aTFv?=
 =?utf-8?B?ZmN4SUtXZUVpOXorY3B4YTBtc1RZSkN3S0Z3dUlHNHh4TXp3d2tlUTcxMWtj?=
 =?utf-8?B?dk9rd1BITGZMZlNiYXBGd1VyU1hGNmlYT1JkMytPUHowQ2ZCMTgzcVhRcXR2?=
 =?utf-8?B?bURITW9WUkNWdVZRQXo2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9SdURaUUdldVVWNk1XSzVGWWNLSnd3bGVuR1RKcnExTm54VHRib2ZIM0g3?=
 =?utf-8?B?SWtxaEovT1ZSWlhCWDc1TjI4WmJyeWY4aWtPWmJ0MUdCazB2TENUM3dFbTV2?=
 =?utf-8?B?U0kyUSt5Q25TTnQrMjV1NCtPaUdoZUg5bGp0ZGc5bXY4WlMybzJYTkUvS1hK?=
 =?utf-8?B?MHZ3aE9UMThMQXFzT21WbTFZUEo4SEFLdHQ0WFVKTG9aUGlmVGl3U0ZEaHZu?=
 =?utf-8?B?b24rYkxEL0RXYTJYWGJ2b0YvRmNyZHlPWkJQc1hySUVKRmZLcHFuSFp3dUov?=
 =?utf-8?B?RUpvZDBBRXhFYlZ5bS9hdS8xbUk5NGN4YUt1VmpxTnlYbDE5WFFZMnZTU2V5?=
 =?utf-8?B?c3VvRFI0ZWhpbWxpKy91RStFYU1GZnd1b1R2N0tvLzFCQW12c2lSbFZFUGRr?=
 =?utf-8?B?Tyt2N3Q0Q2J0TFdOWVhLNEZNdmoxb1hEbVBkV0hadlYwTm5MS1RqbzZtQzY4?=
 =?utf-8?B?VjE4a0Yxbmc4alFOK1dObUVYUjEwSzVkdWJiN09HWkxUeHQ1UGFIeEt3NW8r?=
 =?utf-8?B?MnZDdDUxZDFTWnpvclRvT2hhQkExUkcra0UyWmwzdm1nYmxFWW8xUHJ4Tktk?=
 =?utf-8?B?aGJHMkNYNzE2SFJIMm9EWFNvMjR0U3RiaVVuMTRrQlQ5bVV1ZEtuNk0rT3E1?=
 =?utf-8?B?aFBOR0xRdk1GeU9HSUxsNjFLY05peEo3Rmc4c3dsWm1WQmJDQ2FoeGxVWkFX?=
 =?utf-8?B?eE5tTXEyQWVDRnY0VDhYMEliTGtQTUFScW5mOFptai9yUjRsNFRkbE81V1BR?=
 =?utf-8?B?ZStONSsvanpCZy8wM21tNDk1NDJneHgrNG00MWlVcERISjNVcUIwTmtGeVVs?=
 =?utf-8?B?SWVJTlhZb3dSQ0ZsdjhxK2xXOHF5SzFVS29HK00yMTFMVXJZMlFVdDFTMjlz?=
 =?utf-8?B?TXU5NE0xM1QzR0hhbE90Z0plL1I4RkpvOW0vQmQ5QzJTc25mT0hVK0g3eDZT?=
 =?utf-8?B?NFFBblhUWFJmMGtBdmRZWGpGQThaRmIzZkYxNVYyaFREaEtOYUlmSWphc1ZC?=
 =?utf-8?B?M2pGdEdWVzhWU1V2MjRZV2ZHZ1lrUi9YV1lWTGpsSytDSXl2UnZyQWF2Ym9Q?=
 =?utf-8?B?MnZ5djJhU3MwVUVoVmMrU0s2MmNLVU9wOTl4N0JUSGc4djJEM1FZVWp4eFEr?=
 =?utf-8?B?TGJyVnNLbzNpNWpxVmdOZnJHUXFUSnVXZUFJOCt4Zm9IQmkzbWdzOHR4elBk?=
 =?utf-8?B?aFZZeVZXQ1dIdGtnTmlUVUNlVElVV3BLcndPOVh6YXgxc292REFzVHpsMTJV?=
 =?utf-8?B?dzBPcUZ5T09Ua3EyMzkyZVdjTU84YkFvMUF6emQrTXpBRU9jOVE1NkRRVTNn?=
 =?utf-8?B?WE9WbjYwRHVmTmNab0xKMUk5THJ3d3VHTGFaUnYwUUZUVWc5MFhGc3czc1o3?=
 =?utf-8?B?VmIyalFPQXp2STF0cDZMWjQ3ZnBsWEo0MFdlR1ZJbTRKcWdWYm5XK2Z1a0Fo?=
 =?utf-8?B?RTBEQ3ZnSnNWU2ZCSVZxMkV4RGdSUTk5SEJBR2xNb2dIODdpTE1GdUxwSEtW?=
 =?utf-8?B?UUhaTmNnNGxycUZNMWkzNnB1MERzK2dMYWxza3J5enNhbkJRYW91cnhmQzFS?=
 =?utf-8?B?ZGlzQTF3Y3NJR3FxSHRpdVRjdUttOUF6a0VkZlBlVmoyZ3lhMGJBaHYrYTNU?=
 =?utf-8?B?bHVYWkZTazliZ2VkVUlta0VpWG9ITVBoUWVHVXFuOVhtSEtqbnI0RjhKY3Zv?=
 =?utf-8?B?T0kySXBCWnRpSk5kT1dhd2lCTVVIVlBxUk85RjFSL3RLeEU1SWQra2NFckx0?=
 =?utf-8?B?SFMwS2gxYm5CZ094S255MmVQcGFCWjN6Mm11eUtJdTFyZ0kxS29IcHErU1px?=
 =?utf-8?B?VGQ4em5XQkJwOWFFOUgrS0Y1TkdnSTI3eE0wSVNObFRxRGQ5bSt6Z1o5aWNk?=
 =?utf-8?B?YVZCcjNLRXBuSnNia1NvV2JHNVZEQUUrM0lHUXZTUG0vREh4clRwdXNCLzkz?=
 =?utf-8?B?VEF2ZFYxUDltM1ZPNytMcysrR3VuNlUwbEVoWjRzMHlxdkJYdGNMOWdiaXpj?=
 =?utf-8?B?akRYaWpSbkNlZS91aExDRlJZSDBXT3kzMWRJaDBFNjZJWEpUZm0xbVNSbjIy?=
 =?utf-8?B?ZXBRTlNMVWovcHdGTm9CdlpHa2dZN0NYRFB6eFNBK1RLeDMrQnM4QXRIdG9h?=
 =?utf-8?Q?EJHws5QqWdjHL1psxzZjNB0a0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 612b6171-d08f-4095-2ff2-08dcab2550bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 14:39:54.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtCt6LHL4jIZ+/w3q8BNVPSEgDtnxoIWqqYdmEtqrMb5hZZB+BF+Lcmi5N6yO6NdmD3IygfSkS3FXhDEeaq19w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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



On 7/23/2024 3:53 PM, Raag Jadav wrote:
> On Mon, Jul 22, 2024 at 04:20:51PM +0530, Riana Tauro wrote:
>> Hi Raag
>>
>> On 7/12/2024 5:53 PM, Raag Jadav wrote:
>>> Add hwmon support for fan1_input attribute, which will expose fan speed
>>> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
>>>
>>> $ sensors
>>> i915-pci-0300
>>> Adapter: PCI adapter
>>> in0:         653.00 mV
>>> fan1:        3833 RPM
>>> power1:           N/A  (max =  43.00 W)
>>> energy1:      32.02 kJ
>>>
>> Add fixes tag with the bug link
> 
> We still need temperature information to mark it as a fix.
> 
>>> @@ -771,6 +834,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>>>    		for_each_gt(gt, i915, i)
>>>    			hwm_energy(&hwmon->ddat_gt[i], &energy);
>>>    	}
>>> +
>>> +	if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
>>> +		/* Take initial readings and use it while calculating actual fan speed. */
>>> +		with_intel_runtime_pm(uncore->rpm, wakeref)
>>> +			ddat->fi.reg_val_prev = intel_uncore_read(ddat->uncore,
>>> +								  hwmon->rg.fan_speed);
>>> +		ddat->fi.time_prev = jiffies_to_msecs(jiffies);
>>> +	}
>>
>> Move this under with_intel_runtime_pm condition used above.
> 
> We don't need to fiddle with runtime_pm if it is INVALID_MMIO_REG.
> Doesn't this make more sense? Or am I missing something?

Wouldn't it be better to move under the condition where
energy prev value changes are. Just an ordering change so up to you.

Thanks,
Riana

> 
> Raag
