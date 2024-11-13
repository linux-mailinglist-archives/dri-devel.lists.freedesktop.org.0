Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703BE9C7746
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB0C10E725;
	Wed, 13 Nov 2024 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdKLh761";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9010E724;
 Wed, 13 Nov 2024 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731512068; x=1763048068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8Mq5rF8r6nEAS0bWzqRG3JDIM+xv2qwuxQCBaLSdcpQ=;
 b=OdKLh761GVNei8ZYw6tGYl7512qW6xAnR6VfmHLGCBNAGeKg7nL0V3S3
 iYSfr7wt+WAz5Gh1AeCTYgiuzVDRI0Dxd1X11bfvcI62f7fk9DMNNcDuU
 ks0LuE2uA6a+nBRVsPsG8eWG1VwIlfo9KOwjqaq4zO5BlEf91JIB+YAQx
 BMOeP8i7qXZF9BF2wmfptjNDSZyZSdJx/nBnKNP8tSAAANKVQzz29IE4O
 tGMMjOJLyA5paEpP4nlFd+1yfUyX+IIDF0vssdMJ/rzw7m3yxLzUdpXss
 GVdS4mxKLWyWOmWdBZ4T1dVr3zvX4ruPxVSb4n1zYO2bu04oGR3BKcvjo A==;
X-CSE-ConnectionGUID: nYi6AwPITPOxvnQdCeT7vg==
X-CSE-MsgGUID: 0LmrutY3SM6unnpuB6QEXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34279363"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="34279363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:34:05 -0800
X-CSE-ConnectionGUID: cbazuR39TE+xkpWkJNbtPg==
X-CSE-MsgGUID: yZveTXniSlqYi7HzVXN4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92378660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 07:34:04 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 07:34:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 07:34:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 07:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK/hNV1gZHTYuBh3TKwdQvCNggbQzFPX5wx5kVTeR7wSdF1fk/Y6fLzJIso8xHn5EHQ6KO4HBGTlUcJOeOi4r4Yy2vW4Z1wJpQdq4RoHOlZDr2BXR3vGUX8GaQrz0WLS5rYst4H+Re3LJQ10DmQI2Q1p5v0YWX6cG/ZwcWVNUbxrzaiZd28RE9vROvQcNE/gaU426v14Yt+dOkV5Q/yIFvBR+52cMNve1P15sKlwMRoHvfveQe82JMWNF9DZ0X2blVvu9N8Sf0S/M794fnnunqskUfuWp0EGIlrNQ6Bc2SPZH0EeuhgFdjf+rWjb/dhPhh9a8rFtvVQptqstSvbHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2WyZ4qs7fBJhuxVvm3XZ5dRclU7lw4IX9rN33+QE3U=;
 b=X/56jpjzdEB/jhjaSr5izI36QErXJjzu2heAqlNOeooz5gmFaG6hSCyJkv1vjjdWJ7v3XIu10gu1hWf4xyejG7/2PGgP6HTO2sTIcloHLgdynOPDRnnFuzemuS+9mTBy1JUDghejbxJR7ZL/b0bRRc0Z8e8IiQIndLlkiRRb8DlvezoeK/EcaxJa/4+ft+8lH/yzpoRs9JgSHh1JnwKxdHl53jydZIm8RnUTwqWQiKt4I5t/wSfW0jF6um+1Q/hGsqNI71DLvd7kgp2Wd8mGF/59nazzL+atfi2a0owGLag7rCiEVGhRCB2Xnr1dX+NqM8jx7XuIjmamVIpuwFcc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Wed, 13 Nov
 2024 15:34:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 15:34:00 +0000
Date: Wed, 13 Nov 2024 07:34:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <pstanner@redhat.com>, <boris.brezillon@collabora.com>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>, <dakr@kernel.org>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
Message-ID: <ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
 <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
 <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
 <ac5b9c6e-027a-40e2-bdab-2cc5e10067d6@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac5b9c6e-027a-40e2-bdab-2cc5e10067d6@amd.com>
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ff955e-4415-4bb4-12d7-08dd03f8984e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEEzeURQcCt3NGJEUzBlQ1lVZ2dKeEJybGdNS0lXWWl4bXpDSk5ZQ0VOUmZJ?=
 =?utf-8?B?WDBzVmxLV2hwaDBpSWZmOU4wU2FEeFl6a1JhbmJ3N0dMeFVKNkpjdUZpQk1B?=
 =?utf-8?B?L1NGYnRNTkdUcmZ6WjdDVUg4YlhnWGpYNEgxSTFSbVRlRGVpRjJDSUltaDVt?=
 =?utf-8?B?V0NSQUNoNHd5cmliT0lkdXMzSG5XUlZRS3F0Z1R5ckZYSWhNQTZzOGZwVG1N?=
 =?utf-8?B?NXJ2VTk0cFZyaUJXWkQvTFpnN0NJUGJXUy9qUS9hZ0Q1UnFld0h1aGEzNTZH?=
 =?utf-8?B?L3ZQMlp4aEFNc0s0RjIyS1NydElUVVdlZUZtK3BmbVUyNi9VRUtYVExyL0Zm?=
 =?utf-8?B?anoySDRhS01waEQrTlJvQkpMQ3lKTXF5anQ0MUV2RVFYL3NUbUEwWjB6K2Nt?=
 =?utf-8?B?WWRsRXZOZEJDVnNBMUkwRjdwTXRUUGJ2c2FueUxFUkE0Rm9OZCtHWlpHMExq?=
 =?utf-8?B?Zk5UYlMxYW1vRnY1YzFZaTN0a1R0YmRwckVKRUFPSmZFVUpVOWwySk1hNTB4?=
 =?utf-8?B?OGoxVFJITEE0SWNWODA5bUJvWDByVlFad1RoUSs3clFtaUF0Q1RIRVpRSC9E?=
 =?utf-8?B?anh4Q0NBbXc3alVYdGNmNHM2TWpwc2UvV3JwUWZLL2kzNHBoTWJmQnU2NlZt?=
 =?utf-8?B?TVBFOGFUVGY5UFhnR3ZTQ2Q1bDl2QmR0OUx5MysyN3prbWVPbTlKTDh2WTVH?=
 =?utf-8?B?UzJUUHQrWWNnZTJKRmNYbjBWQXo4ZlZJeWp4RCs3UjBBbVFOdktDNTVJRjAx?=
 =?utf-8?B?cDZxTjNCZmtDVlNIS3l5czZNdmphSUlkTGM2YkJBQ25PUTBEeWZLQTVsMytv?=
 =?utf-8?B?VXBDZHJlQjZHdmxMTW8yMVJSbDdnSlg5QmhtV2VEL3dPQ0dFY1dKRmM5aDYw?=
 =?utf-8?B?QzdLNEJPOXBGMFBIVmRrdlJRS05KeS9TY2RqQjgwWml1eWdCQngyTWFtcURO?=
 =?utf-8?B?a1VJdW9SYTRIOXZIc3RZaWpVd0srN1VjTFF3Rzl5d2FuZWgwVjA3Y0hKckRr?=
 =?utf-8?B?WHdIUTZzT1hYSHFxNXpCSDNuUldVVHBzMEF3Q1IzOFBqNXROaGZXMlJtTzlG?=
 =?utf-8?B?c29HUDRBd0VYb0ZjWTNmQ3R5WS80TSt6TitaU0hkVWd6eVVuTVlJUDZJM0Qz?=
 =?utf-8?B?M0ZiRWhBeXMxM3V2MUtlK1lSU1hxaGxVTnJLd0cxdGhnWk5kWDh4WGtsQy8w?=
 =?utf-8?B?UE8yZ3REN0dUVU1pNSt3RzRRUTNGM1p3d09zYjBTZGpYL0tpdEVYRzRJK0FI?=
 =?utf-8?B?SHE5allaK3BVRXpQWDRTeUU1SWMzaVhOUDJOd2ZFVGtkL3Iwc3Y1RVZDSFA0?=
 =?utf-8?B?L0pwKzhqRG1PTzFIUmQyc2ZDWDRPK3MyTjVBZSs0VmxFYnN3ZkI5eFlxdWd0?=
 =?utf-8?B?VHRzZUFXR24yQXRvZHdlQ0xpSTVJUTBjcG1DbXZBSzV6Ykt1cE05YzVzVEJm?=
 =?utf-8?B?RWE2ZVJRS2duWUtYTnlqZUloc2QzSzJzdjhYcVdWbEFHbXBUR1gzTTZQWnc2?=
 =?utf-8?B?L2kvb3JNVlA3Mm1nanA2TFlWM25XdmU3VWRQZnFjYW92ZU9oN1FGTVl5b0xH?=
 =?utf-8?B?b0hhbkpGMUdNZjlVdXB6Q3MrREhwMTczeVJnaFpac3JHdW50NGUrM0tPOVZv?=
 =?utf-8?B?emNsT3VBUTZOTFFGSHQ4VnQrNHlwWXB3ZjRjYVJqNmpCc1NTU25LVzhDT2cw?=
 =?utf-8?B?VmhLRUgvbzBpN1ZrSHdJZHEwNC96SGgxMTRLUEpjK3l2c291VFRQTkVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1TUVlWSGFRUGhjOTNHbnMxc1hHdGVuc2ZUVm9ZcUo4b2JRZXZ3YmZPV2Q2?=
 =?utf-8?B?SzVidUJ6WDlnaGtHOW1MOGlEM1hXeDJ0V25pcTI4MUZJZkdQOUI3aE1LMUU5?=
 =?utf-8?B?WEtlNFRqbHZ6d0RkZnpqU1Y2QmRyaUVYYXFxY2dYTlkzeGY1QUt5VVFobmx0?=
 =?utf-8?B?Z3Y1R3ZmOExvQzIwUEE1M2xBTzhaamsya0piOXZ4bGdITEtHMjRmV2JqZUNW?=
 =?utf-8?B?NFdVRWNCem5nWFNqTWUra2ZzTDhINEYzeUtlNFhPYVNCN0xCVk5nSld6YlZS?=
 =?utf-8?B?eitRdmpJOVJzd1c2MlZHTkdlSUpkUlRSWnFDVmNUekdKMGFkVFM1Ym81MjM1?=
 =?utf-8?B?QTNPWnlka01sSGxPVXhmSG1KOVFQNFg2MVhHL1YxVHJINWRIdE14SmxOam9T?=
 =?utf-8?B?QmtjYmpRU2dqTkYwN25HZ001bjFSNWRWdG0xNWZXKyt6Wk5JNUJRZ3NwelBY?=
 =?utf-8?B?dlBHVW1zMnBPeWxTdmpmY0l5QVdLSHIyelpMYUdsMERzeVd4Mi90WnkrUTlU?=
 =?utf-8?B?c0xmZHlqbEpiZXZ0WkxDdFBubG51S2Qyd2NPZXBiNU5oTzN5Y05IbUtDS2Fp?=
 =?utf-8?B?VU9teVlNa2dkSkdQRkpLVVR6VndLbGhNcW5PbDFQRm1WMkNPNGltQjhYTXJy?=
 =?utf-8?B?NTZNT2daZjQ3TjlyMUtEbWxudmp1cnAvRFNMZHcwV2ZBaENUc0hoWnFYVFJs?=
 =?utf-8?B?bmh6YjEwNjdneHFNaVU0aHp4OHdacDRPcXhnZyt0UWsxSEVCWktmTjhFZkRL?=
 =?utf-8?B?dTZNZndoQ1cyTGl2NGxsRmlrTUNkRVgyNUoraStHd3NUb3Zad0h3ZG5TZHls?=
 =?utf-8?B?Snhqc0tNVzBPT0lFb3k2aGt4UjAydnArWTFjZE5KVU9NN3JFVnRsMnRPL0JK?=
 =?utf-8?B?U0NQNWVBVk9Vc1lSbkdMd3pCQ3UzSzc4MWlmMnpvUE1ON0labGNWRk9FWGtI?=
 =?utf-8?B?RUFRMVZGdVVGYjVpT2Q2eUNnQU9Kb0NIYkhkdGVJUzNXS1I5UkFGbU56Yk1W?=
 =?utf-8?B?K3R3dXk0YU1JTDkxTlhqd0s0bUhiZElOSVdTYWZIdnBnMW1DeGVyY0pjVzds?=
 =?utf-8?B?SGtiaGRnZU5CSlJTSGhlemN4UGkzK0hZU05Tc2RNdVRKQk5oL3B1VnJ1S2xM?=
 =?utf-8?B?V09QQXJzaWVpREY0a3lldTZCZGxwUUhTdjNZeXJKUWhDYWlJc1VKdGdlR090?=
 =?utf-8?B?NUY2R2FPKzFYaWpaQm5ub2VuQUpDYzdqc0pTMWlnTGR4dHAvOWlUOGw4WUJE?=
 =?utf-8?B?YXc5MHFzK20xM25mWXM3TVIvZ201NWIyaUZKN2ZocXR2UW90NENQdE1sVXp6?=
 =?utf-8?B?T0pKc1ZTRGpDVHpMNHlFQlNXWVdKK2hhc1h0TjRaVFBRS3Z2eDdpMWdnVDB0?=
 =?utf-8?B?Y1phY2VIckt5TVBFWS9sSFV1N0Z0OU5ZWFR5YW1aWFhDNmlYbzFRbmJROUYx?=
 =?utf-8?B?aVlzZUMxREo4NHNpM1FadCtnS3JFVFVjK250L1hIYko1SDBOSFBXQmZObys1?=
 =?utf-8?B?WitnekN5S2R2anNpemV5NjRXaFQzdDQxQ3VsamJreEZTOWFJb2luUHZuejln?=
 =?utf-8?B?dVBxNmFZZXFwVktFK1FMd3NpWFF5Tll0TFI0WFVBakF4R0tsYTJ4TVRsVzVC?=
 =?utf-8?B?dDFsRk9HRk9IVHVxeFczQUlJc0k3Y0M4N1dyY1ZIOENVRUJJUUlXQ3ZMUzBm?=
 =?utf-8?B?d0NlR2RrN0JaVU9kTzNyWjI2ZHMvMDNHb3pkUVlNRU9ZN05YQm93NzhWQSty?=
 =?utf-8?B?bVovQU05QTZrTWVZNnpLazZ5cU51OWhMT1R4UW5YVm9tVk9kM3BNODk1U013?=
 =?utf-8?B?ZU9sK1I4ZTZ1MlF2L01ZYkVkbDBtYTJJbXZUVyt6ZXpPcnBOMnJiQ2VwUVJv?=
 =?utf-8?B?ZFZNM09Ec3hxL0NKa25WZy9iRUNwQWlNY0xGUGw4WmUxWUZtTTRneEFZSVQw?=
 =?utf-8?B?S0FlSTFtVThLaU9tTmoyL1Q0WlVYUVliVlV6dEh6ZGVKNDRlWHZJWElwVG1V?=
 =?utf-8?B?Y1l6ZHJsRTRiZ28raEJzZUhhbStNOU1FM20rV3JqRTZ1OFd6Z05WMmlOODF3?=
 =?utf-8?B?ZGlnV2l4RjR3SnVvN2grOHJQM0wveDJvbU8rKy9BdjBEZjhkeWxuYkxuUEVP?=
 =?utf-8?B?Q2RBTFNkSnB3SlJ2ZnJnK3VoMm1aWEdGTE9ITDB0YkZnRy9NRGhkM0xNQmFz?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ff955e-4415-4bb4-12d7-08dd03f8984e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 15:34:00.0646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDP1vE5b6mpgaAbtKqKjElX/IlBi8nrcn9GROPNKGhF/nZ2Za7gYhaS+SW56mmn9fU4kv1UeGJA2lbYK2JCXCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

On Wed, Nov 13, 2024 at 10:02:12AM +0100, Christian König wrote:
> Am 13.11.24 um 03:30 schrieb Matthew Brost:
> > [SNIP]
> > > > > If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
> > > > > similarly simple call.
> > > > Nope, we try to avoid locking all BOs in the VM as hard as we can.
> > > > 
> > > Why? Calling in to perform fence conversion shouldn't be all that
> > > frequent and simplifies things.
> > > 
> > > Also, it's likely that only a few locks are involved, as not too many
> > > external BOs are mapped within a VM (i.e., most BOs share the VM's
> > > dma-resv lock).
> 
> The most common use case are multi GPU systems which share a lot of data in
> a NUMA cluster.
> 
> This configuration has almost all BOs shared between GPUs making locking the
> whole VM a task with massive overhead which should be avoided as much as
> possible.
> 

Let look into use cases on our end.

> > > > > Now the ordering works inherently in dma-resv and the scheduler. e.g. No
> > > > > need to track the last completion fences explictly in preempt fences.
> > > > I really don't think that this is a good approach. Explicitly keeping the
> > > > last completion fence in the pre-emption fence is basically a must have as
> > > > far as I can see.
> > > > 
> > > > The approach you take here looks like a really ugly hack to me.
> > > > 
> > > Well, I have to disagree; it seems like a pretty solid, common design.
> 
> What you basically do is to move the responsibility to signal fences in the
> right order from the provider of the fences to the consumer of it.
> 

Are there not ordering rules already built into dma-resv? This is just
extending those preempt fences.

I can maybe buy some of this argument, as if a random yahoo enables
signaling a preempt fence without properly going through dma-resv or the
scheduler, then yes, that could break things. But don't do that. In Xe,
we have exactly two places where these can be triggered: in the TTM BO
move vfunc (which the scheduler handles) and in the MMU invalidation
path (dma-resv).

I would expect all drivers and users of dma-resv and the scheduler with
preempt fences to use the proper interfaces to signal preempt fences,
rather than bypassing this thus ensuring the common rules for preempt
fences are adhered to.

> Since we have tons of consumers of that stuff this is not even remotely a
> defensive design.
>

I can consider other designs, but I do think larger community input may
be required, as you mentioned there are several consumers of this code.
 
> > > 
> > > Anyway, I think I have this more or less working. I want to run this by
> > > the Mesa team a bit to ensure I haven't missed anything, and will likely
> > > post something shortly after.
> > > 
> > > We can discuss this more after I post and perhaps solicit other
> > > opinions, weighing the pros and cons of the approaches here. I do think
> > > they function roughly the same, so something commonly agreed upon would
> > > be good. Sharing a bit of code, if possible, is always a plus too.
> 
> Well to make it clear that will never ever get a green light from my side as
> DMA-buf maintainer. What you suggest here is extremely fragile.
> 

It is unfortunate that this is your position, and I do feel it is a bit
premature to suggest as much. I didn’t know being a maintainer was akin
to being a dictator. As I’ve said multiple times, I feel this warrants a
bit more discussion with more stakeholders. If this is unacceptable,
sure, I can change it.

> Why not simply wait for the pending completion fences as dependency for
> signaling preemption fences?
>
> That should work for all drivers and is trivial to implement as far as I can
> see.

Again, this is hard to understand without a clear picture of what AMD is
doing. I pointed out a dma-fencing problem in the code on the list, and
the response was, "Well, we have some magic ordering rules that make it
safe." That might be true, but if you annotated your code, lockdep would
complain. Anything that cannot be annotated is a non-starter for me.
This makes me nervous that, in fact, it is not as trivial as you
suggest, nor is the design as sound as you believe.

Anyways, I'll still likely post a common solution with annotations. If
it is rejected, so be it, and I will rework it.

In spirit of open development here is my code in a public branch:

Kernel: https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission/-/tree/v2-11-13-24?ref_type=heads
IGT: https://gitlab.freedesktop.org/mbrost/igt-gpu-tools-umd-submission/-/tree/umd_submission.v2?ref_type=heads

Matt

> 
> Regards,
> Christian.
> 
> > > 
> > > Matt
> > > 
> > > > Regards,
> > > > Christian.
> > > > 
