Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF090A7A88C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED7A10E2CC;
	Thu,  3 Apr 2025 17:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyiACf26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5951710E256
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743701242; x=1775237242;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WtmFW6L0qt+FKfblSrX4Oaeu570A7iBlVTsnAI+dkA4=;
 b=LyiACf26qgUnpBhBWV8DctNHxQsRZGKj0UkR+5IhArBAwaKPFo0XDGrx
 aMRw6g2IcDhOajiQiVrgQ/hmtvKsdzgqJH7tjdhwG9rad59GPt5NprR2Y
 fN/bNG7fx0VtdbzVFD/P3GSCg4CzN8mv+EUWwTU/PGk2QIEcApdu2vvyg
 /KzZi+nyo1cJ23JIyUydJ5p6ChMWZsknWOH0ScUWFnBBhYRvpQeHtcEvM
 yMA/yagc8AXPDLsa61iyB4nsRwc+q+mKWnFAZ4jLX112yAbWrbeeLdwJa
 REFL3aY6fR3O75NIrCIVS+hPQBSfcWNrfRshbH1eS7V/FVHSgD7O3/+0y Q==;
X-CSE-ConnectionGUID: 7mBHUT/+Qs6OrtZlX8RI4Q==
X-CSE-MsgGUID: IdTLcTopQ8mwSEBTX7x4rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45038113"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45038113"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:21 -0700
X-CSE-ConnectionGUID: V+4BSEOVQry8uTy8iBGeiw==
X-CSE-MsgGUID: gU7EjWJcRe2Dh5gnBqXXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127597395"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 10:27:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 10:27:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 10:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPTWwjv4XpIW4Qx1Kk5aCSH0rkPIvP2rrBlXbrGWoJnIFzxkml7srjBshX9lzx6C8ztW0pYa0oNA+/vl6yTe8htppGWMfR7Prdr+GdcLbJfYdqn3e6c6lV9BdN2o8FOdhYYNu9mB3nUTkU5NtxgREjzxmdY8TMpVZIpaSfxCiuMdsck9RUp47BJcbXLvgKUD0d4MQoohTvsOxGdFtdaT1EnaS/hU5rzDbI6hzL+WaEvqzCQ5bCeoRJGp9ELLooJmfQl3M5BEV/NnPPSPVIywzeyV0bXlFdkmB5ZFxeZfevgHvrvBRCTYjyVbpxQYyPn/DmsBn9HRr6gMroiLQb0P3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN376qrk9H9QxQmbs0cDGCwFNIdPnmz4gutcl8D4Tm8=;
 b=mStUdMopHLGYUSu/dh2jcrAUkvpLFVgXMObRM/2uSI3cVk7dUZZ5q4nT+DAUH3LOiB2irpdU5JiUwDObE3osE8HRWszKy1Ca48l55SUUDy4Tb0LKMuwSHbuXq2LlMbP1xWarzAxs+V58zz3gRuJh0iR+OJigxDFquDGlcH0ox1dst4DlEkO/G3A06ysL3xWdyZRhQkwp3PU2TxaLb1ROwp0LT5GS/rrq++p1qZODc/5u4G31En5ppIsya/LDkrJDP6gMk7mwhzEhNPoBoDdEIxVPbqcHP0nVMr8vGLdfsWmgtrjoEU94nkCV0xtps5j3OtjoQ5jzX2jyRMbfPPF8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:27:12 +0000
Received: from PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd]) by PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd%6]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 17:27:12 +0000
Message-ID: <53845b60-32ad-4916-a63e-9c01d6e8b5fb@intel.com>
Date: Thu, 3 Apr 2025 19:26:48 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v6 3/4] drm/xe/guc: Introduce enum with offsets for
 multi-LRC register H2G
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-4-tomasz.lis@intel.com>
 <02a35563-9699-4f9a-abe0-12a0e2347167@intel.com>
Content-Language: en-US
In-Reply-To: <02a35563-9699-4f9a-abe0-12a0e2347167@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6707:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a036554-6a16-4bb0-72ea-08dd72d4bb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFZxcXhibUhNSmovZG15RjZjTHQ5bkFud2NTS1ZJUWhod2xjaVdKa1lnNVFu?=
 =?utf-8?B?QlJjUW5GZVRoWXd0bG5PYzRvYnVXOG5jK05FYzloNHdrRVRwRzlLbjB1b2pC?=
 =?utf-8?B?YWttWG5rbW5VK3ZybDNzb2tnN0ZjL0JmQlhqcW5PeE1MODhrbDhtU0tMWEtG?=
 =?utf-8?B?TUlRazZDOVJ2T1hYbmZUNnJZajVRTDh5VVlrY3NzTXVSRVVQekp2UW1TRTM2?=
 =?utf-8?B?QUs1dm44VFZXZGMzOFRudWF4SHRGNTR5cXhuWWlwYWxJYTZiUDlCUmFmVmxK?=
 =?utf-8?B?ZkFxY1pHUEdOTURCR3dwR2hySTNoZ3NYRmM4aVd0MUdvNkZHeXhuWVd2Sy9H?=
 =?utf-8?B?ZnVJWjdXZitxQndxclZSdCt6SGpaeVdhL01EQVdTNFdtTGd0b2xOVVlJZUNm?=
 =?utf-8?B?MjMzTm1rMGx2NHQxUGZmY1FkTUxNcXF0WWppME44d0FXVGFKdzJ2L2lkSnVN?=
 =?utf-8?B?NHoxYWRRcm9FMkFrSWJNWG53RDBzNm5VeTZYYVphWFYrUzVuNy9pQmVxanJj?=
 =?utf-8?B?djFCTGxKTVBVSE01bS9lZGtEcFJUV3JrZnpnWm5rQjBBWUpWRWJpTjhIcUw2?=
 =?utf-8?B?K2pieXZtcmpRTWZFNEdEcElMc3I0RjJHYUhxNTh0TTd4WkkxQWNVZWtPNi81?=
 =?utf-8?B?VmQvUXM2YUk3OVo5a09rTndLc2EzRlVOTzkyTjhVcnlPTjUzd2xOK2FsME03?=
 =?utf-8?B?RHNKeXJ2UWx4Z3d4SGFWZFpTYVVQaEV5RFpyYWR3dTRudFkzUldXdzFBSzlh?=
 =?utf-8?B?V08wWjczTXVuT29SZ0F2RjUzMk5wd29Da2NKOFh6QXUvenB5c3RGNGx4Qzdw?=
 =?utf-8?B?SVRpZWRtNGpseTRHR0JOZ2VKR21LaTQreUVpZ3hSY0RpL2RzZ09RRjNaZ1Y5?=
 =?utf-8?B?Nk9yWWRrZ25tWkxmNUZXWGZXRmNZZ3REbmtxbW03TUhFNDZlOFF1MGIxK2di?=
 =?utf-8?B?cFpYSFJ6S055cnl2TUQvNlFJUnJjSUtkVy9OYlkzTjhSTGVkM2Z6RUZLN1BU?=
 =?utf-8?B?ejNheUlFSHVZNUdYNStSSytsdG4vZkJxalMzRHNtNURvb1VvWDhEYUNhaWdC?=
 =?utf-8?B?bDVHNzROMFpHNGdWcG82WVBTWVRVKzdrQUM5bS9wL0pqUDB2N3k1QkhOendr?=
 =?utf-8?B?aS95Ukh0MVV2VmU0VVV0eTZSdkxxL1hjYjJZTStaSXQzVGtWOEJKSHJNQlZL?=
 =?utf-8?B?eWZNSk1Pd3k3andDejVVNkxoeTdXUzV1VGVQOTdtSzNlWU5MY2JDajE3ZmFU?=
 =?utf-8?B?ZDBQQkRSaW04WjMxTlA2dEYwNVJyNDhIclRHdENQMlNtV2IwS0R6bmUzdTVm?=
 =?utf-8?B?UFhVWnpiZ1IrUGpjcFhCTkkzKzBSV0JISHVFNEJYMXFReGlTbERvNUZTV05O?=
 =?utf-8?B?bVVoT2F5NCt4a0dzMCtKNFQrVFAva3JGYy8vMjdSaUg5ZTY2NGNyVWxnM2w3?=
 =?utf-8?B?aE56a2ZscG14ZEVaWXVHN1NzdUF2YmZaSFQ2RWdqUGR1Nk83U1FvaHJ3ZUoz?=
 =?utf-8?B?dGRuOVZQZ3J3cmVhbjFwNVJrUGJiOVUwMVZRNEpqZkYrcWFGNUNiUjdLcU03?=
 =?utf-8?B?azF0NnVTbmQyN2t5QUdwcVl6YmYvK2xtRkU1MmFLV3NpV3ZJOWR3OXpRek1V?=
 =?utf-8?B?WHQ3TVA2N0RaYjJzcTlHLzROZFByYThiQ01WTWdVcjV4ZkhQZ1Z4QlhYRFd4?=
 =?utf-8?B?V0dRU2NYL3F2TTdFeWNsWDZObTIxbDkremtnbjdJKzduSjBORHVuUzNOWWth?=
 =?utf-8?B?a3I5UWVWUE4xNTl1WXhwMDQyb2htTE5Mdi9TaE9RcHp5eVpudEhlVUI4MFZZ?=
 =?utf-8?B?S0Z0QTZPTnQ3R0Z4WnpYM1FETnZ5MnBJaWMxVG1iUmRSQ1pMNHozdmJPczUw?=
 =?utf-8?Q?jfyi4KOhhrjNc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnp0VGE1RURSOHl1dEF3Vk1pdFZZYWhoK0dyV0p6R1ZyVnFCRW90VXJOQjRp?=
 =?utf-8?B?cm1RL3pBUVpJaW9USWpRblByV0V2dHFmM2xJc3ZoSkNqc2tHNmN2bVRWaTNQ?=
 =?utf-8?B?SEQvVFpKVEdGMWVpenRLVnZIT0J0QmpkZnhidWZZdnRoRm85VXdPaXE1cTky?=
 =?utf-8?B?bGNuYmF3ZmlIaXAvUUh1VEpkTXBaSEFCTkpkZHhTSG1BNFZjOXdpazZ3WHlh?=
 =?utf-8?B?S2NxQWY0WWJZeGRXWnlCTUg0MkN3Mnc2M1FuZUx6aVludWRiKzJ1VTVJdnVM?=
 =?utf-8?B?SmFBTDkvbHYwT1Y4K2RkbVowTUUrRFp0YzU3VVptOGFySk1aRldBb0xnWGM4?=
 =?utf-8?B?STN2cXl4N01WUHRxOXdCZFZNaEN3QnNnZ1B4bDByVlExMVFoK1pJZFV0Z2Rl?=
 =?utf-8?B?T0xWMDM0UEMxTUxOY21sWW5Id3pxU0NJa29mOEVra3cyZndqM2lranBnSjJX?=
 =?utf-8?B?VG9rbC9HN3ZSRTdtRENRb2kwbkxGREFPdFZyRitMRlJkVlJPUkpiWmhSOWNS?=
 =?utf-8?B?d2pGY3I0eUh4MVNoOUVvblFOTlJPZHJSZCtzTmNxTklPZWtYREVnZHVUZWJ4?=
 =?utf-8?B?VVEyRFJWRVZpcklUNnBoeUNqODN2VW9HV3ZPa1pUa0tvSHhkNUV1am4yMWlo?=
 =?utf-8?B?dTIvZldJQmMvV05ydXRKLzJKbkc5UFduejMrbXJjUkpsN0tqRTIrZ1pVSTNj?=
 =?utf-8?B?ZHIvL1lESWZKWW4yWHhSNm1RVVpZVWd1QytjVHU0cjZjcFVmdUNDck9pQVZQ?=
 =?utf-8?B?THUxTnVUMUQvdHJDWE56MUwxcFVadW9ySHJhNndiZVIyUlVsM2UvL0lDcVlV?=
 =?utf-8?B?N1NSNGdSeXg2cTNWdXNDcVhERmJmbGZQZU10b3NLWmtuQ1pvK1pvNmZheTNY?=
 =?utf-8?B?ZlZLVUhmSTZqaGVIV1RpMWIyVkZxU0VLazNKRldWd3MwclRzTVBCMlZTM0hE?=
 =?utf-8?B?bzhwblJiN1BRYjBGWUNnZVBvbVFJQ1hOa2xvTHM3aTVaa1Z3MXVPaUFBSmph?=
 =?utf-8?B?QTNnUkxVN1Fad0pXZjR1eGNDWEhDZ2RlQ05QL1ZWVmw3Z2pramVPMXhPSDRC?=
 =?utf-8?B?MVErWHB5OVJiTWo3ZXlURUhxQmNxL3JFK1BHeEplVFVVUnZRbzJjeDJwRGxx?=
 =?utf-8?B?bFVORXZRMW1mK2lFMWtYRXpKVDR3dnp3dm5aQllFY29CZjYzeDJzTDdkVXFV?=
 =?utf-8?B?eWc3NnVGdlh5WHMzYlRFcFRrcnNNN3pNb2xmalNjVTRaOCtxU2tHNEdKOHdZ?=
 =?utf-8?B?ZnUwWnRqbEdWekNmOE1PcTdXbkV1UHl5T0diWVNkZWQ2YU1SVFl0TStsOUZZ?=
 =?utf-8?B?RE1ZdHdTVCthRHpjOU1kSldMWHI4R2FJclZRZWVEZU42Z0lYbFJzYnNia1h5?=
 =?utf-8?B?V3JCTFltcXJ4eEIxc0h0emZTbFhTZmoxbW5kQnV5ciswbGxNbDlnSkJRblZp?=
 =?utf-8?B?YXVoNjViMGlVVk40VVRZMjNsdUphVk9PT2NHRG5JcldiSXgySlJJSHpTeUhU?=
 =?utf-8?B?OU1KVENuVlFFR0xkajRoTzRtc3ZUOEROS2IxOXFPK0tSRkpmZ1RyVmh5bEcx?=
 =?utf-8?B?UTFBRHhrVVVndDMzcmtvUCs4ek8rKzF1Nk1oWThOS3dIbmladmcrN0o0bTBt?=
 =?utf-8?B?NjZwYmYxck5GWWpLR1hkN25vZ21XdmRQZ2RpNjNvcUZHNWRGUU9SK3BpbXcw?=
 =?utf-8?B?ZnNuYTQ2VE81R21FbVVNYTBjbm5jcFlweFdwSTlxbTVhVUhXR0hnYUFDY1ph?=
 =?utf-8?B?YmNjNUlaQmJIa2hGajUvam1SdzduTEdpaFpyNy9CdVQ4cEhrMVFKYVdGNzFF?=
 =?utf-8?B?bE1LOVJDWmh2Q0hPbnFkYWJpc2xQUzUwcDA3M3YzbzVCS0loRkhUc0l1SHpz?=
 =?utf-8?B?QWNPM2RPTndYOGIrNm8xWnRIQktKOVpOcE1EVmk4VG5hclFvMEFrWWpENDV2?=
 =?utf-8?B?Z3J3Zml3M1RsRHAzeTNDYm1kRTJodFdNT3dFeXMzOUlFQWw1T1M4M0RINWJX?=
 =?utf-8?B?YVpOQi91a2xWR3pROUpSR1ZGREtJUDlmSHVnUU9qVzRyZVVDUlJhMmRmc1ls?=
 =?utf-8?B?ZGc5WlZFeUluOTY0SXNuSHZMaWVUSThRcW1YcHlpdHo2eXF0dlJPbVorb3Rx?=
 =?utf-8?Q?g6BXSECmitrbQLWh1dYSk1JnU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a036554-6a16-4bb0-72ea-08dd72d4bb9b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:27:12.0468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/Ew9S1QfCLjNOLZJ9/PFqaCMkkEej9aYm0dkY6XoKhVZdoM26Q9gDyHJ5JUnOC/eDg7orYZYSDvEcfC2kK5Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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


On 01.04.2025 19:24, Michal Wajdeczko wrote:
> On 31.03.2025 15:21, Tomasz Lis wrote:
>> Some GuC messages are constructed with incrementing dword counter
>> rather than referencing specific DWORDs, as described in GuC interface
>> specification.
>>
>> This change introduces the definitions of DWORD numbers for parameters
>> which will need to be referenced in a CTB parser to be added in a
>> following patch. To ensure correctness of these DWORDs, verification
>> in form of asserts was added to the message construction code.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h | 7 +++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 4 ++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 448afb86e05c..86bd4b092c7c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -161,6 +161,13 @@ enum xe_guc_preempt_options {
>>   	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>   };
>>   
>> +enum xe_guc_register_context_multi_lrc_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
> while likely we only need those 4 indices, IMO it would cleaner to
> define all of them in ABI to reflect the whole message layout:
>
> enum xe_guc_register_context_multi_lrc_message {
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
> 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
> 	...

Will agree to all the propositions here as this whole patch isn't my idea.

-Tomasz

>> +};
>> +
>>   enum xe_guc_report_status {
>>   	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>   	XE_GUC_REPORT_STATUS_ACKED = 0x1,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 31bc2022bfc2..3c8574e2c1f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>   	action[len++] = info->context_idx;
>>   	action[len++] = info->engine_class;
>>   	action[len++] = info->engine_submit_mask;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
>>   	action[len++] = info->wq_desc_lo;
>>   	action[len++] = info->wq_desc_hi;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
>>   	action[len++] = info->wq_base_lo;
>>   	action[len++] = info->wq_base_hi;
>>   	action[len++] = info->wq_size;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>   	action[len++] = q->width;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
>>   	action[len++] = info->hwlrca_lo;
>>   	action[len++] = info->hwlrca_hi;
>>   
> hmm, it looks little paranoid, and pollute otherwise clean code,
> so maybe either convert completely to index based message encoding:
>
> 	action[.._FLAGS] = info->flags;
> 	action[.._WQ_DESC_LO] = info->wq_desc_lo;
> 	action[.._WQ_DESC_HI] = info->wq_desc_hi;
> 	...
> 	for (i = 0; i < q->width; ++i)
> 		action[.._HWLRCA_LO + 1 + i] = ..;
> 		action[.._HWLRCA_HI + 1 + i] = ..;
>
> or assert those important entries at the end:
>
> 	xe_gt_assert(gt, action[..WQ_DESC_LO] == info->wq_desc_lo);
> 	xe_gt_assert(gt, action[..HWLRCA_LO] == info->hwlrca_lo);
>
> @Matt, any other ideas or you don't care?
>
>
