Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EBC8BAA2F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B610FAB0;
	Fri,  3 May 2024 09:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUBwspqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AD810FAB0;
 Fri,  3 May 2024 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714729939; x=1746265939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vgKjKO5eVdntuWCyL+C1sOdNEpzbp7K8tQdXJJZAR4k=;
 b=IUBwspqud8e+09AC5lt8MKFFOi6228GZP7VHnqGvyB0KMA4H1hbLwln7
 8hGaAMr8PLtSMpU2VXJKffMYmyV2pkRzkvGH/8svY02rszJ5oZ2Lye1PQ
 lbD6wHKHF7R0qcScv7goMmjKlc7HhGaV5FvblTZ01jGQB/FRKGHLHCNDC
 DySJOiueTQte+KzeUGWyjCVz+AV2If1xi7u81DaWo60K7PzqHZUrGKory
 bMOGnDUAtqcNMImWMeIiShrTqK4glLi4WLV3I3zajZd8EgkGG7e05O4Pq
 8ecCApEi6P/GXnq/tq3x/K1IDISD6iyy4Z/zxC2VWvkbsrUxa5IpE+s4d w==;
X-CSE-ConnectionGUID: 7M4n/sc/Ql20aOHrtbGIGQ==
X-CSE-MsgGUID: 2qQ1dk1PTFWse5vDFzn51A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21151813"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21151813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:52:18 -0700
X-CSE-ConnectionGUID: BBpsAbYaQKSTys44c8qhFg==
X-CSE-MsgGUID: JhhC5zdjT8ygbq91pVBY2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27382485"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:52:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:52:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:52:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:52:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MixTiyAzdJEBY6YoIxrsG7SKRH12cXzXSzrAJo2rB8sin6NOputJ3IMLpu0qhlJ7zCA+hN3aVebUVAfzyi+hUsVX5GkJehwdoSJUzl5nGA1gEriJrsHX8qoEkQuD7VfzpGEPheEujGiKDg2mgpEon4GDT6wIcpU6LKDwVCI7r43AiQRPqCtcLpLvrTpTM8q4dy4czQOisPT2fHXTt/2XNozJ+8k+ahqieQiq7BuWxJed1B+lN1MJ65BgSitsWLh9GeXyGuk6nZ9+rwLed4GXnt/PtdQxU0DfT49hAl83c4uBpwC4y0hw/aTRZX6HOsCDxVKjvuf5Kw5Tf0SciWggtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgKjKO5eVdntuWCyL+C1sOdNEpzbp7K8tQdXJJZAR4k=;
 b=FVSdzFLfIcJICSbO0ms9qwswYcwxLmmcCfxP8uKxyh6S5jcfwOMAXYGs2I8zzrPVEnlaDeBkdu5zoO31g3qEv5uzy29YcHRfha0paUMm5hIvCMf/J+QiRg+gFPFvRrHN/58NCycc6JfLVb+ysK4x9tDoAycBcNFaQHx51GvhQAdNL/tmrOJjA+gq/1YcKUvolpl3LHAd/lAM1GAp2JKoRuqLlNVV+1XtRy5hlxJQgCSWbEBsz/A46ubziAoV06ZlQGaNGfwC4xfoNzDq++b2cp7Djv2m5H9GaPadxTZ6JMatxWfSyZyRV9k498GLvvE3wIjgrxrL0cIens2NMscCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.28; Fri, 3 May 2024 09:52:10 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 09:52:10 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 0/6] Link off between frames for edp
Thread-Topic: [PATCH v3 0/6] Link off between frames for edp
Thread-Index: AQHalnjIpi94MTCaxUmOFhEjIR6H2rGFUi+A
Date: Fri, 3 May 2024 09:52:10 +0000
Message-ID: <528030f9d9874c09fb32fb72e2003d9d7dac52af.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
In-Reply-To: <20240424183820.3591593-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: 6acd6e69-c45b-4593-9310-08dc6b56b3a1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dVUyYzBUWEJva3R0bVZZeVREb2ZOYlUrelJxcmtxSDBNQUFCbDdoZlE1WXE2?=
 =?utf-8?B?V2s3aXcyTWtPR09YQXdZNnVmS2VwMDh5dkp0cTdJY255S1Bwdmt2SUZuMTIy?=
 =?utf-8?B?cDhGRVlwbmdNZW9yeUszQTFhajFLWmJRY2QyVWFhNWViaGJ1MzVndWp2MTB4?=
 =?utf-8?B?Zlk5aFJDc0VZZXRJMEFBVnozdGg0dmUrc3NPSk9HV0lBVktoVVNIeng1aWcz?=
 =?utf-8?B?dExrdURLQ090Q2JNbzhUeUZYYlRKQXU4RXkrcDA5RmhnT3NxYkRrR1YrR2Jq?=
 =?utf-8?B?ZmF2Y3dGREJkWlh6NERPR2sxbFV0VVgyTmJTWHpoNExOckY1elhWOHJRVkds?=
 =?utf-8?B?Rnh1K0JYYVBUd2JzU3hqVjR3MVlGOFJHUEJLZVd5Tm5NU1J4T1lOSEppTjJV?=
 =?utf-8?B?VkVDQ2JYRzlkMCtQWCtCTG1qdlR4bmdBSEd1VUIxTFJ4QXNsREVyaTBKaC96?=
 =?utf-8?B?VDhFTTB1LzVsMEU4Mk0xc3FubXdJaU1UUEJFcG81elVubmVtTHBFV0ZZam1X?=
 =?utf-8?B?dDRIWDkyOFg4YW16K2tDeFJlNi9JT2hhYVl2MEorT3Viczk1NGF1akxxS1g1?=
 =?utf-8?B?dkVnVWoxV0VoZ0toVnFTUENSaVB0RkNZYlVmUy9SZ1FnMTh0U055MkViemhu?=
 =?utf-8?B?OEFsMitLR1dOYks5a3VuQmJ2NzFIYS9GMmpRYytlNVZubTdQOUgzVUo5bWx5?=
 =?utf-8?B?NXZGbmRhTlU5cnNwNzJzSngyTGNuR2lSclFkQ2sxZTlYQmh4clEzYnN2ck5C?=
 =?utf-8?B?dkZ1MmRmVlZXOW9wK2JkYXkyS0hrcFNCRGRscFV1L2tpc3gzTUpUVGVRanpQ?=
 =?utf-8?B?SlU5cnQwQ2M5Sk1Udjc4YVBzYktGc3E5elNQaGg2THc4VmxFLzJueTZCd3hp?=
 =?utf-8?B?SSthdkJQdlpUMllVSHRaQ2FDYXpDNWFMQWVGRkRpa3N3NUdEL0lOYXVLbUlX?=
 =?utf-8?B?OUVXdGVqUWtGNWNUZDJkS0wwejRKRTBmKytXL25ud2hWMlJPb2haWC9JbDkr?=
 =?utf-8?B?YWxCY3plSjZIRS9RYW9Lcjh3SkhwdEg4SmNieXdiSFhCNG8rdFFudDJxUVZC?=
 =?utf-8?B?azhwNDliOGc1cHJzaHNFeTRNbmtnQ3lhNTBONFRWamxaQllxbTNQdkJDMDJW?=
 =?utf-8?B?MkJjdTRRRVdYdmV2RytkSm5MSm1XaTBVVFNqRGMya2pscFFSNUF1akl1UmNp?=
 =?utf-8?B?NWlQWUI4OCtrTU12UVByZXcwd1c4Zm83OFc5dENrVWhjYzBUVlZjQnhFQlkw?=
 =?utf-8?B?QVJISDBsUllzQ0JEdEhtcmUzWDJJSlBwb0tPeWYyOURtUzBUVytvdFRxOHRV?=
 =?utf-8?B?c1ZYNWp6VnFaNEJ4MFBiMHRqbm4zYzZRU1dwQ0tSd1Z3c01pR3J5WGJpVHN0?=
 =?utf-8?B?UFIvVUQ3UHI5WVM2aWpCcndQam9Cd2s4ZGFDdGp1RHV3T2pWUXJ1b1VNeTBL?=
 =?utf-8?B?U2FpOE5rUzREbkhzU2JSV2xEWlFYT2FLdDEweittTFZLTVBVSEJ3N09Pek1a?=
 =?utf-8?B?VVZ6c2l4cGo1MldCelEzWHRjd2VmdUo3ZnUxR3Q0eHdDbWFqOTRXa2lCTWZL?=
 =?utf-8?B?SUVZUXpmMWFXaXdEeEx3dWVNVVVvSmhHR2NpWS9DalBUUGhxVzErZHoyTkJK?=
 =?utf-8?B?WklsYnY0VnZPbG9tQkVaWGtmMFVDQWp2UTdYNlNmR3hVYTQrZHV4alRiMjJW?=
 =?utf-8?B?Q0dGYzlJV2pWZEhiSFFaSk4xSmhoOFlxVVhpUVUydG5ySWtwN0dXc3BjeU5W?=
 =?utf-8?B?dDEwWVJWOG5jWEVJTjdaeUF6MWlCcGRibHgzR1JXR1FjZWppdG53SmhOWXNN?=
 =?utf-8?B?T0JUcHZkNHV2ckdCNWYxdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTdNeFdCbkEyeE9IRXNuVkpzRHRMZGVPZjkxb1FMeFEwU21pbTF3VFprcXI0?=
 =?utf-8?B?OUMxQ0IwNlhhdzEzY2xkcE1MS0JKY1JVMys2T3FiNjJQdWlwNkRLNlY1OVk3?=
 =?utf-8?B?WlJkT2psTlkvRGl2Zi9HcnJTb0xST3pUQitFMzVuMTF1SEJqV3VHMnZQR3Zm?=
 =?utf-8?B?aGQvYTJjNUJLMExQWE1MbjJXM09tVkh5T3g3cEFneVczUU9WdTh6SkowNEgx?=
 =?utf-8?B?aXZydXRkbzhYYWhaWmhSMDJ0aHhwWStSbDMrVituMnBPS1IvNnk0MFVQVWd2?=
 =?utf-8?B?ZVpzNE9xK1J1UTlHZHhhVmhKalRBY2s3SUNaWno4TnJGSkFSQ1dqM2MrWkV6?=
 =?utf-8?B?NHZHb28zME9mTHBSUjBsYVVyWmZncjFtZ29WQXJuZmlMenhUb0ZYSmh3SGdu?=
 =?utf-8?B?VnhRdHlEemZENUc3QldyQWxNU0x2MnJjSEx4Vlo0V2daUFlCWXo3WDdHNUtE?=
 =?utf-8?B?aGZOd2daUXN5dHBrdk9iUmpUM3BuUTAzV2RGZitPeDFWa1Z3TWI5V3I3UWNn?=
 =?utf-8?B?SzFjVi80WFc3aEkwTC85TmNreFJTbGVjTVpMUi9FUmF0QVJJZUt6UnlNUGFa?=
 =?utf-8?B?RldVZy9DdkFQRTNiUmZBK1h6OUpSRkJKQlh2Smx4ZVVkQjNkTE1yNHlGOVJw?=
 =?utf-8?B?UENqdGFQSUFoMS8wRitIek90OE5iaFNiTUhDTnNBcVNnZWJCV2hxU1A0aTNm?=
 =?utf-8?B?WG5EWnNZUStxb2ttcVpLTklpRzJWYzhaM2J6V0VWZTFCMlpvdzlHcXd2aVNj?=
 =?utf-8?B?TFVjNnFTckZuaGNoM3ltSUdadXEyRmhnU2NBa01IaXRqVllvMlN1NzQydzIz?=
 =?utf-8?B?a0wwdzJ2VjIxQStrOXZ6citUV0FRbmlBUk5FckhKNlAyblY1RHpzMmI2Mm1i?=
 =?utf-8?B?MG1UaDlZcGRxUUFaTlhybGYrVk9DWk0vbDExSXMxQTlLUzZBOGdQS200d1dQ?=
 =?utf-8?B?WncxNDd0MTNZSnJ1RmNNSnhIbGNLTkRMbm9NVFljSXd6OG1rNmdpSVp4ZnVu?=
 =?utf-8?B?SGJqZ1ZwZjl6N25FQmJHMGJKS0kxRWVkVmhPR2MzNytvTTIxUnR5QU0yeEZW?=
 =?utf-8?B?MmNpdmg0QlRYWTUzcTVWUDBxRGYybWhPN1oxNG5uL1RaaXdmMTBHK0t6OU8y?=
 =?utf-8?B?NmhDbDdycjBPbWhNTzRURElOR1JmRDdKaTNhYzhZcTdMY0xkQnRsYmd4dkpH?=
 =?utf-8?B?RFBhYUgvTkt6SzFzWG91UFlRbWFOd2F2U21qaFhHbVRFQ01IZ3pCTm4zYVVx?=
 =?utf-8?B?Um02T1AxN01nQm5EV1BQUW80cXFzeTVxeC9EaVBGZkJlZUtialNmc2Z4WkNn?=
 =?utf-8?B?ZTdseWltOXJ5andvV0w5ZXBmTWQxalRwTlM4QjhYRGZPZFlldDNoc2VRa0c5?=
 =?utf-8?B?dFRIRW4zVEFHUmp1WWdpQ3AwVkhkem1PbmxkSVhSK0FTb0dJU09sVzdxNVVl?=
 =?utf-8?B?MmhmcjU1RUQwWW1SdkxvV2hlakhqSUZsamxSZ2tRcjE2VTZQQXhQQ2NGcm5S?=
 =?utf-8?B?d0RmeWIrMVB0TG11Z2VMZWVrNEJEbVZGUDVpbnlFYVF6N0pRenc4eXZMWGg5?=
 =?utf-8?B?MTg5ejlQdXVlbHNTbXBWZWNPdllJcnZHeXpVbldUY3VqMktSYy9MWjgyOGZZ?=
 =?utf-8?B?YUE2dlJ0eHZDOVpnbUNyY1hQcVorUzBuSWhRT2piZTloM25Cc3V0Vm0xODJT?=
 =?utf-8?B?R0tLaFVkUzdERHFRYUllUmg0Y2pqcFkzay9wNDZ1MEtmSnk1WWhDbWxKWXVY?=
 =?utf-8?B?SHBXL09lWkpLRG9mbldIYlRvandXVkorUmg1Qkl5UkNpT1RvVDhaNzIwQi9i?=
 =?utf-8?B?eithZEZCU1ovSXdwVjlUeUY5NDZMOVBFazFEdWZpTU1HYnhSNXpYaWR2UW5B?=
 =?utf-8?B?WFo2TzlzbDM5blFwR2Jhd0pubHI0ZDhlazlkdWtyc3F4MU83L0hyS2tNZlZY?=
 =?utf-8?B?cUNrbjFZSEJuL0FTdHpkeXRYMVptc1ZHMnFXQjVkK3BiOW1JZkhrbXdjb0pX?=
 =?utf-8?B?TkRucmJEcEdkRmR1enlMSXZXU3dqY3RUUUg0RVN6OGNDMGFCU3VpeWNzcW1X?=
 =?utf-8?B?NDVuZTdlMGRERTJHdzh2a0lIR01ETVAzOUkyaTdoZ3dOaENDblpUcGJiaE9V?=
 =?utf-8?B?eDVFazRIVXRxOXJ5N2Vzb3FWMTFGbHZXS0RTUjFQQVdsTFdtc01xSXpPQ0dE?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EA4BA3386286E4FB89F28B1540922A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd6e69-c45b-4593-9310-08dc6b56b3a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:52:10.4405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IfO1s16SbCsOSas3E3FCTFx8zJjAxys/NfEz4NZQ+ptXgwqaP/3u1tnNRwy60QSt0Fc+VUs7HgA/YJFcqvqjgqRdcINddotM7mvy5jiTQnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDAwOjA4ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBMaW5rIE9mZiBCZXR3ZWVuIEFjdGl2ZSBGcmFtZXMgKExPQkYpIGFsbG93cyBhbiBlRFAgbGlu
ayB0byBiZSB0dXJuZWQNCj4gT2ZmIGFuZCBPbg0KPiBkdXJuaW5nIGxvbmcgVkJMQU5LIGR1cmF0
aW9ucyB3aXRob3V0IGVuYWJsaW5nIGFueSBvZiB0aGUgUFNSL1BTUjIvUFINCj4gbW9kZXMgb2Yg
b3BlcmF0aW9uLg0KDQpZb3UgY291bGQgZGVzY3JpYmUgYSBiaXQgbW9yZSBhYm91dCB3aGF0IHRo
aXMgcGF0Y2ggc2V0IGlzIGltcGxlbWVudGluZw0KYW5kIHdoYXQgeW91IHNlZSBpcyBtaXNzaW5n
Lg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEJzcGVjOiA3MTQ3Nw0KPiANCj4g
Tm90ZTogVGhlc2UgcGF0Y2hlcyBhcmUgbm90IHRlc3RlZCwgc2VuZGluZyBlYXJseSBmb3IgcmV2
aWV3DQo+IGZlZWRiYWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5p
bWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IA0KPiBBbmltZXNoIE1hbm5hICg1KToNCj4gwqAgZHJt
L2k5MTUvYWxwbTogTW92ZSBhbHBtIHBhcmFtZXRlcnMgZnJvbSBpbnRlbF9wc3INCj4gwqAgZHJt
L2k5MTUvYWxwbTogTW92ZSBhbHBtIHJlbGF0ZWQgY29kZSB0byBhIG5ldyBmaWxlDQo+IMKgIGRy
bS9pOTE1L2FscG06IEFkZCBjb21wdXRlIGNvbmZpZyBmb3IgbG9iZg0KPiDCoCBkcm0vaTkxNS9h
bHBtOiBFbmFibGUgbG9iZiBmcm9tIHNvdXJjZSBpbiBBTFBNX0NUTA0KPiDCoCBkcm0vaTkxNS9h
bHBtOiBBZGQgZGVidWdmcyBmb3IgTE9CRg0KPiANCj4gSm91bmkgSMO2Z2FuZGVyICgxKToNCj4g
wqAgZHJtL2Rpc3BsYXk6IEFkZCBtaXNzaW5nIGF1eCBsZXNzIGFscG0gd2FrZSByZWxhdGVkIGJp
dHMNCj4gDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2FscG0uY8KgwqDCoMKgIHwgMzkzDQo+ICsrKysrKysrKysrKysrKysrKw0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5owqDCoMKgwqAgfMKgIDI1
ICsrDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmPCoCB8
wqDCoCAyICsNCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjC
oMKgwqAgfMKgIDI1ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jwqDCoMKgwqDCoMKgIHzCoMKgIDQgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfcHNyLmPCoMKgwqDCoMKgIHwgMjk5ICstLS0tLS0tLS0tLS0NCj4gwqBpbmNsdWRl
L2RybS9kaXNwbGF5L2RybV9kcC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA1ICstDQo+IMKgOCBmaWxlcyBjaGFuZ2VkLCA0NTUgaW5zZXJ0aW9ucygrKSwgMjk5IGRl
bGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiANCg0K
