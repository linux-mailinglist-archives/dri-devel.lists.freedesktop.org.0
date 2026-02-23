Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHc+Hfj6m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:00:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D31727AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE5D10E24E;
	Mon, 23 Feb 2026 07:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyvDqCqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08610E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771830004; x=1803366004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e5ANrONfCWl6enqsd3JC5S+HXx4rDk0ZQ0q/8aMncwc=;
 b=NyvDqCqC0XV1DvgeO1Dz/S7/Vt4/p8d2zUCX+vWPfnwFXh6R1gzcz+pt
 tBex8+LshsNTcvECsleJ9J829DeNucc9+pp1JmMXgpTRhFfjleEGLMq/P
 pH8ZuMxZ+Bpq+hj0Yz+eGWxX3YgB9nZCHJK+KBBDu64b8AODYVBkzqkLK
 N8onQoyKdTUoDCL2l3QUzHpJLDCUB2FLr9RsGGiCbTu79inP7yyMiE+mZ
 zL/jRU4nLm3Q96xhSnH1fNaHTI/VeQvq1/TKOkjIYCMJUzr6JZ4czsbrk
 N+38JvPuAiblZl9tQlffsgUtNazj60UqxsDnWrVEdn7S4KujqiKQBIDbG A==;
X-CSE-ConnectionGUID: C1ftCjzqRfWkLwdsdZXBHQ==
X-CSE-MsgGUID: Xonmeiv0SPyy95H32PmkKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72918942"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72918942"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:59:59 -0800
X-CSE-ConnectionGUID: xkpX0jsiRqO9FxnC19Z4zQ==
X-CSE-MsgGUID: 6prPB0ldQH+9MggcqUM20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213448151"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:59:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:59:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 22:59:59 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:59:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU7+nzmauQ/yCrWaRL+vzPBe9JgckMGxmgyVQ7AghG2PMJyKIqPfslq20fPfEL+V4tuzRgnAWJpmT7NaWoHitbzoH2a0svZA4Nhs9N0Zp3nSUZ72O57nqQXxVuQDfrNqHXZketw2RB98ubi0QHrHJ+1pCU2tymEQJJJjiPp7orLp9mUwD6OL6M/jhHOG5fyu/ma+fpYzJRXQxHSVUiUD1Zocd6ZxmXxT3YCyFJg+sL+AcPAOk9DfuXm6xfRmcQ5kXS0PBNtcSRK0+yp2ledDtTSzJc+UPICL/S7WAM42HwBGuW1fhI4Asn9UTA8AqtPQUMg1IUhu+Oe1K0uQLmYMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eAEP8hvW5BZ7Q6463NbPhAipzGEPYjSWYFbI3AxHHc=;
 b=pFF9zT/c5QtAyxHWPB6/8Vjj9wo3ic67yZ+s3jV+ScBWb41vv5zSb5qG/aOCi8lkXxCSS3FGBG2smKusd/TnemnIab6VRubGF8AfECx5NXmDRVjGySSoDsDwvh9s7IRdoWPrLqdyJJR1cKxABJSlUsY3cri1+S+Y64jvPwMa9tuNok0flp9kp27Glvk6vygYywX6n4gw0gE6VCA5snOOx4eqnr8yPzC15CbMiXNkJkb84OrVLURyR+b7RPdqzQPRdW5UPaDkXc15qYutvf0XiqtZ8EADlIK3YeHU8T52D/wjMaAokxBCCvI4wiMATS5Qv3F1W2oaD+m/HW4iPUgmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 06:59:55 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 06:59:55 +0000
Message-ID: <798946e1-18e6-451b-95ba-605db22ac901@intel.com>
Date: Mon, 23 Feb 2026 12:29:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
 <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
 <e9df7116-e33e-4571-966e-c5e8b4528165@intel.com>
 <c17088ee-70b0-4ff4-b5ac-b8f9612230ef@intel.com>
 <80b7da8d-3826-4573-ab2f-a4cf6848468b@amd.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <80b7da8d-3826-4573-ab2f-a4cf6848468b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c394fa4-cce5-454c-ab67-08de72a92639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3prMEtpVEFaSUs0ODNzUEdlbWMrc2R5Tld4ODVhTnZJanFtY1poZEhyclNr?=
 =?utf-8?B?Z0NES1BRN09qVlhySkVMQVZkWFg3eUtoZndjbU9oRmZUajZEWlZCeXE0cVQy?=
 =?utf-8?B?aTNTWWgvMzkrR0FFNDdXajRFS2JtSk1pUEpwYTE2Z1d2OUVJVVJGa3BjRi92?=
 =?utf-8?B?OHZ5OXBhTDJPb1YzZlF4TmtpcGFMcFRYanNlOUtGcVhsYWtBWlNRVGlLWFRr?=
 =?utf-8?B?dy9McUZOdzVuSjZWZllxYUhUeU1zZGkvdXliVG1mS2lKckJ3WnlQSVhCT3dj?=
 =?utf-8?B?TlRqMmxXUkhWQlJkYUZJWVNqSWFmQnJJM05BcTcyK3RXUWMwdWtacG15QlVv?=
 =?utf-8?B?cjJKMm5rSk4vVlJLeG4rZTN6endzVWhVMkxISGFWSUlQZ1pZTEJ5UjRqRmpa?=
 =?utf-8?B?bHhBRWsySnNuRFhQWXRkSmJVVWpqQW51R1FCZmhDREdiWDdXemEycWJJWjBL?=
 =?utf-8?B?RllLRWoweGxrRkNVeGNoMGJIdW1oRG1USFJqNnAvVVBIbTNXRlRrb2kxR2Vl?=
 =?utf-8?B?TGppaGlvVmxObm03V05GQlNIRUNsSDBSLzVoOTNwaWI2bUlxeFl3TWpuSVZz?=
 =?utf-8?B?UDlBM2ZwWHJnUlBiNWNtU0RNTkRPdHZreFovZ1duLzZRVnRmSGVjUlhOT1gz?=
 =?utf-8?B?SS9KY2NlSkhQTVpIU2JkeUtwRkEvbER6L2MyUzh2L2F0RFNiNkVXU3haeEUx?=
 =?utf-8?B?YjU4OGhQcTZIQm55MDhzMHBQbkpUU1hFcERKVVU4MUM1eEthTmpGc1B4MmRm?=
 =?utf-8?B?OW9IRzNKZUE3M1RRTTdLNjluTERvYStKKzBmY2l2NWRrWjhjbGRHb3JFUThz?=
 =?utf-8?B?bUEwQkdmcFgrYXVBNDVjMmZiUzltZ243b3BUdVVybE5JVlRVd0JJTFJIdWNt?=
 =?utf-8?B?NWFkMUw2czhTdTcrek1mSUc2RkxlVFI4eUFaVUJkY3hlZHY5T2N1MEVnOTdx?=
 =?utf-8?B?NVk5OXBJa0pZYStlMlVkR2dsakx4Ym1KSk1VWGxiREhsVGVyeGpDNy9PY2ps?=
 =?utf-8?B?dmhwMHhnWVhUZkpBSVVaMEFDSHhoSnVFVWV1T05kZUcvKzJPamdydkFLaFZs?=
 =?utf-8?B?MnRMZlk0N2tNdHdOdWdYOWt1WG5BSjZ4bXRrWWk4WWxDZGhKV2ozZ1hWd0NM?=
 =?utf-8?B?aDBmTkVPR0o2RmxBY2V5TytwV1h5SUppYlpUVUhZQVlPZllJVGdYRWsyOEd1?=
 =?utf-8?B?RWg3Nk9xVm1lOU03SjgvblcxdDU5SGxsUXJNRlBsdjVaTnZsc2RvR2RqR3ZO?=
 =?utf-8?B?UytseUN3N053V1RnTUd5MTI5QVpsbzFVUnlJVTJoUXRPNHJyeDRRTEdUdW4z?=
 =?utf-8?B?MU5jNGJ1SFVaZ3VXeE5YK0N2ZUNZeVNKSlBaY0FISUVNRFJzcSt3R3dRRjl5?=
 =?utf-8?B?bTBNR2tpRVdheENFS3l6M0pSSnV2L3FGRUk3TGwzTXM5aE91Sk51V3BLSDg3?=
 =?utf-8?B?VnpjeHdVUklIQlNwRVcweGZhcG9hK20xdS82empXQTI3aEc1NmtkNWt5c2xl?=
 =?utf-8?B?N3NVUm4wb0s0RjRBY2NEZmVoQ01RTGNnYjBrZGdCNXJtNmZKNE1tZnhxeHBP?=
 =?utf-8?B?d1hqZ0JMNFQvSSs0NS9TdWYyVDhCcWNCSjMvd1J2UnVPWktjTXNLZEphZHB6?=
 =?utf-8?B?OWlwM2VMOWVDYmdDZUV6NVFYTkFLdG1obi9tSEF5TlpUUy9jRk01a0I3WVUr?=
 =?utf-8?B?ZWNsaklBYXhTWmlZbE1XSFhsclVpN1JxbzUyOU1nY2tOV2VBTEEzdzVEckdM?=
 =?utf-8?B?Zk5NVnp5SlNCMEYxUVpOVWlRL1BzdUdsODhEY1lGcXV1NlgxVEVPYlJYWWJV?=
 =?utf-8?B?djFUYWJYWVZ4V2ZMUlorWTZib2NERFF4eEl2Vm1obUpDOFI3clRmQmtBYVJv?=
 =?utf-8?B?Mm8vNlFlbTZrSFBxYUV6TWxaSDlYVkhBWm1GTDE2dkYra2MzS3o1V2hPV1pI?=
 =?utf-8?B?ZFhRWnZuVEF4eHNPUmU5bFdmOHBxSGhKek5DQjd4U2pHbitPOUZuUFhkRkJk?=
 =?utf-8?B?endqNmNkRm43alZtazVvYjRLSEEyL1A3VHY1dGpFM2dPa0pOMXRCZHkvUUIy?=
 =?utf-8?B?YWdYMVFEQWtXZXVwazZYTE9POVh6Y3pPQUdRaStMMm1xSHhpbVIrU1lXNFVi?=
 =?utf-8?Q?P8Jc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJJVGZFZ1ZyQ2E0S0MxMDFtNWpVd05oMDd0QlV3ZXRHc2VaZ2pTejlxZEp4?=
 =?utf-8?B?MXR5TGJ5VVZITVR2RWlZWEtXWHQvd2sxZ2pkd1g3ZFVYTDZZN0dtbkZ1THpG?=
 =?utf-8?B?eXYwdXVtNnZRaklpMWZYSzJZazdhNTJ6a0dVc0wzN2RnOXM5RTZYODJ5cS9u?=
 =?utf-8?B?ckszMXVKaWFUVTZvM1lZQTVqZE1ZdGZ1UWNkekpoRVlISldMaytXU0JTbHZU?=
 =?utf-8?B?c0RteFFkb3ZrcTdMc0s1Vmw2bmR1dWUvVWxYSDZxaS9yQXhqU3lpVW56SnBG?=
 =?utf-8?B?QXl1Qy9GNGZnTEUxeExweHVFOG02MFNGUE9aaFljY1pmd1lLR0VOVU82U241?=
 =?utf-8?B?WDNxUnBxS0pRbFRUcmMwZ3lLdHgrcXJBYjlZZnNGTU5DRUNQS3JOYW43UjMz?=
 =?utf-8?B?ZFpKUXNQN292QkZxUlozZFZwZHc3WWRTRUpuSXZ3SU90WnZhWFNyZlk2STZv?=
 =?utf-8?B?TU9aa0dYK3hRSXZWWVpPUDNmaHNCakxvYVl6ZVlTV0xTLzA3NEUvVHBHU3ho?=
 =?utf-8?B?WUtBVG15Z2kyQlVPQ3p3M3czcys3Z2l0cE4vRFJ6Zzd0a3hsRWRYRHk5Vm9N?=
 =?utf-8?B?cHozc0RsYlVMMUpzYzZOMm51UlNFR2w1TlcyT1VCL09CTkJ3M0xxVW5mSUFM?=
 =?utf-8?B?OUJldEFiRGJvOE1ZRnJySkVvdmJuUWN5RkwydzhwUlR0bmZTNWlnWEgwSHMy?=
 =?utf-8?B?eWpPSUpXUzB5WCtEcXpQOU9xdnlPYzRpREprRlRFMmtNbHZ1OHZzekNiUXRs?=
 =?utf-8?B?SnFGZHRVeWk3NGNwc0U3YWJHZ3A0UVpJaUZCdHd1RC9wNXd4Rjd6bUNsSUxw?=
 =?utf-8?B?RVpMZVNJNkQ3Tks0bmppUTFMMXVycS92Z1hscGtwZ1pmV1dHa0xvYVJrTzBS?=
 =?utf-8?B?Nm9TY1FIeEkyZWVxRHRvS3BYSlc0OUNhZ1BKV00vVkF5SFNKRXhqRzUzVTV1?=
 =?utf-8?B?NDJBNWJoS3pCejhmZ29zTkhPcGw1SGJCTWFTY213V3FYSkhxUDJEUFRlOVBa?=
 =?utf-8?B?VFFTUnJxRTJlb2FYbVpBejZJcXVUbDV6UHpHcld2bGN5Z1Bld3FZUFU1aEdH?=
 =?utf-8?B?S3pDckhoV2pUK3liMjlTWUFKbC95NEVGdDJBT2tjUld3Sjl4L2NrSTc2aVNp?=
 =?utf-8?B?ekhnY0Q1OWIvZVhqamxnd1diandHRkFhOUlnV3RocjBYUEdCdzRERnNYWUxL?=
 =?utf-8?B?ZlpjaUFuVnljM0F1Sm1BZDVFNVkzMXZJcUxTMGFUMFlDcWxwVkNwdUFrYVJ3?=
 =?utf-8?B?WE52UGR1MFhZK01BRWMwY2F4ZG00NFJpUkJFUHZJNExLZENZOU9jN1pmWURh?=
 =?utf-8?B?RlFXZW1RWGc2SWd2ZGxzb2pTM3Z4RzIxUUJZRkVSQktHZ0NBb24yRHZGMnBD?=
 =?utf-8?B?VmRlYlViMjM0Zk1uaEsvWTZ1dmY1N042dkE1aitJQVZhSFRNZWhxUEx6UXNv?=
 =?utf-8?B?UVFlY2dTZHVSZkRwZzgxTlJ2aTZ1L2tnbldUZUxRVW9XSERQMEhBVnY2cjFz?=
 =?utf-8?B?bTFkL1g3S0lVT0JnRnBwSUF5Q3piZ2VuR3MrWHp6aGl6NytNbnJHNy9Qb05o?=
 =?utf-8?B?dTBKLzlmYXFjd2JBQzR6T2MxT0cyVXlUNEJYU01ibVpnZVd1VFdqdmFtZ0Ja?=
 =?utf-8?B?eDdWSWsxZXRqOEtCZGRMN3hnSUxlck5idHMwQWJJSzYxU3ZiRUFuM1Vkd3Zh?=
 =?utf-8?B?ZnZOM2xsNjV5aGRFTml0THBWcURKakt5VjQ2aUdVcDRJNHF2N3RkZVJ2cWdv?=
 =?utf-8?B?Z0hzdUE1NnFETzQwNi9FaU94VG1sT2Q5elJFcEhkRUxNZEMwTCt3RUpsSmtE?=
 =?utf-8?B?UGQ5NjA5bWIrQWRuOGRlODlIRHloNWgwYjZvY20rckFMb01IUm1iQ1FSREhr?=
 =?utf-8?B?K3NVRVVYTnpNRmE0NytTeGl5dXYzdnZZakRzWk1kQWRHSkNydFBsT3FHTFBj?=
 =?utf-8?B?SE9nbXErRzVRUTduK1kxOXIrN1R3Wm15STJKSisxZ0FkSFFUTmo2YWNCYk5U?=
 =?utf-8?B?UFJaRi9mNUVSQmxlbWV3ejdWa20zS3FCWTlqNTN4MG9XOXJFS2lvUk5Xd0ZS?=
 =?utf-8?B?YXVJU1NsVFYrUWVGZ3FQOExTUm90enZXZTUvR2JmV1hla0Y3L0kzQzllZnJ3?=
 =?utf-8?B?dWE1MngxNXFvOGphTlNodUprRVUwcFUvQTJNbUpNQVlVbXlmVkZVKy9uQTlJ?=
 =?utf-8?B?cEVUcDNJOUxiRlNIVDJTZ3ZuRGtZcmw2TkZoRzI2RFExRmdpR2IxV1M2emVN?=
 =?utf-8?B?T2xOYmhLN3NaV0I2VkM2Z3kyR0orQ2VwR3VRVU5zb3Z0ZThGMTNTZHY2MDln?=
 =?utf-8?B?WHkzMjZBT3N2clpSdjdWa0lUbEk0TElxcnZUZ1U0VFFGWFhmQ1MxaWVjYXg1?=
 =?utf-8?Q?Mz+rslOLAqworSA4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c394fa4-cce5-454c-ab67-08de72a92639
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 06:59:55.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDzCgrGZXT3dkQjiP7FGKa1ChL4oJ3gXOdlUyRum8xGuNFJhB4K3pbXO95DjZ84N9DHFqc2ZNKEHzDexsaNnsVltW2VBcxYTuhiDOkYSDM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS(0.00)[m:arunpravin.paneerselvam@amd.com,m:matthew.auld@intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D48D31727AA
X-Rspamd-Action: no action


On 23-02-2026 12:28, Arunpravin Paneer Selvam wrote:
>
>
> On 2/23/2026 11:53 AM, Yadav, Sanjay Kumar wrote:
>>
>> On 19-02-2026 16:15, Yadav, Sanjay Kumar wrote:
>>>
>>> On 12-02-2026 14:55, Sanjay Yadav wrote:
>>>> Add missing kernel-doc for GPU buddy allocator flags,
>>>> gpu_buddy_block, and gpu_buddy. The documentation covers block
>>>> header fields, allocator roots, free trees, and allocation flags
>>>> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
>>>> Private members are marked with kernel-doc private markers
>>>> and documented with regular comments.
>>>>
>>>> No functional changes.
>>>>
>>>> v2:
>>>> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
>>>>    values (Arun)
>>>> - Rebased after DRM buddy allocator moved to drivers/gpu/
>>>> - Updated commit message
>>>>
>>>> v3:
>>>> - Document reserved bits 8:6 in header layout (Arun)
>>>> - Fix checkpatch warning
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>>> Reviewed-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>
>>> Hi Arun,
>>>
>>> Could you please merge this series if its looks fine? Thanks.
>> Gentle Reminder! Thanks
> Done!
Thanks a lot!
>>>
>>>> ---
>>>>   include/linux/gpu_buddy.h | 123 
>>>> +++++++++++++++++++++++++++++++-------
>>>>   1 file changed, 103 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>>>> index 07ac65db6d2e..bf2a42256536 100644
>>>> --- a/include/linux/gpu_buddy.h
>>>> +++ b/include/linux/gpu_buddy.h
>>>> @@ -12,11 +12,58 @@
>>>>   #include <linux/sched.h>
>>>>   #include <linux/rbtree.h>
>>>>   +/**
>>>> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address 
>>>> range
>>>> + *
>>>> + * When set, allocation is restricted to the range [start, end) 
>>>> specified
>>>> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are 
>>>> ignored
>>>> + * and allocation can use any free space.
>>>> + */
>>>>   #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>> +
>>>> +/**
>>>> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
>>>> + *
>>>> + * Allocate starting from high addresses and working down. Useful for
>>>> + * separating different allocation types (e.g., kernel vs userspace)
>>>> + * to reduce fragmentation.
>>>> + */
>>>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>>> +
>>>> +/**
>>>> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous 
>>>> blocks
>>>> + *
>>>> + * The allocation must be satisfied with a single contiguous block.
>>>> + * If the requested size cannot be allocated contiguously, the
>>>> + * allocation fails with -ENOSPC.
>>>> + */
>>>>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>>> +
>>>> +/**
>>>> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
>>>> + *
>>>> + * Attempt to allocate from the clear tree first. If insufficient 
>>>> clear
>>>> + * memory is available, falls back to dirty memory. Useful when the
>>>> + * caller needs zeroed memory and wants to avoid GPU clear 
>>>> operations.
>>>> + */
>>>>   #define GPU_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>>> +
>>>> +/**
>>>> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
>>>> + *
>>>> + * Used with gpu_buddy_free_list() to indicate that the memory being
>>>> + * freed has been cleared (zeroed). The blocks will be placed in the
>>>> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
>>>> + */
>>>>   #define GPU_BUDDY_CLEARED            BIT(4)
>>>> +
>>>> +/**
>>>> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
>>>> + *
>>>> + * By default, if an allocation is smaller than the allocated block,
>>>> + * excess memory is trimmed and returned to the free pool. This flag
>>>> + * disables trimming, keeping the full power-of-two block size.
>>>> + */
>>>>   #define GPU_BUDDY_TRIM_DISABLE            BIT(5)
>>>>     enum gpu_buddy_free_tree {
>>>> @@ -28,7 +75,28 @@ enum gpu_buddy_free_tree {
>>>>   #define for_each_free_tree(tree) \
>>>>       for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>>>>   +/**
>>>> + * struct gpu_buddy_block - Block within a buddy allocator
>>>> + *
>>>> + * Each block in the buddy allocator is represented by this 
>>>> structure.
>>>> + * Blocks are organized in a binary tree where each parent block 
>>>> can be
>>>> + * split into two children (left and right buddies). The allocator 
>>>> manages
>>>> + * blocks at various orders (power-of-2 sizes) from chunk_size up 
>>>> to the
>>>> + * largest contiguous region.
>>>> + *
>>>> + * @private: Private data owned by the allocator user (e.g., 
>>>> driver-specific data)
>>>> + * @link: List node for user ownership while block is allocated
>>>> + */
>>>>   struct gpu_buddy_block {
>>>> +/* private: */
>>>> +    /*
>>>> +     * Header bit layout:
>>>> +     * - Bits 63:12: block offset within the address space
>>>> +     * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
>>>> +     * - Bit 9: clear bit (1 if memory is zeroed)
>>>> +     * - Bits 8:6: reserved
>>>> +     * - Bits 5:0: order (log2 of size relative to chunk_size)
>>>> +     */
>>>>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>>>   #define   GPU_BUDDY_ALLOCATED       (1 << 10)
>>>> @@ -43,7 +111,7 @@ struct gpu_buddy_block {
>>>>       struct gpu_buddy_block *left;
>>>>       struct gpu_buddy_block *right;
>>>>       struct gpu_buddy_block *parent;
>>>> -
>>>> +/* public: */
>>>>       void *private; /* owned by creator */
>>>>         /*
>>>> @@ -53,43 +121,58 @@ struct gpu_buddy_block {
>>>>        * gpu_buddy_free* ownership is given back to the mm.
>>>>        */
>>>>       union {
>>>> +/* private: */
>>>>           struct rb_node rb;
>>>> +/* public: */
>>>>           struct list_head link;
>>>>       };
>>>> -
>>>> +/* private: */
>>>>       struct list_head tmp_link;
>>>>   };
>>>>     /* Order-zero must be at least SZ_4K */
>>>>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>>>>   -/*
>>>> - * Binary Buddy System.
>>>> +/**
>>>> + * struct gpu_buddy - GPU binary buddy allocator
>>>> + *
>>>> + * The buddy allocator provides efficient power-of-two memory 
>>>> allocation
>>>> + * with fast allocation and free operations. It is commonly used 
>>>> for GPU
>>>> + * memory management where allocations can be split into power-of-two
>>>> + * block sizes.
>>>>    *
>>>> - * Locking should be handled by the user, a simple mutex around
>>>> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
>>>> + * Locking should be handled by the user; a simple mutex around
>>>> + * gpu_buddy_alloc_blocks() and 
>>>> gpu_buddy_free_block()/gpu_buddy_free_list()
>>>> + * should suffice.
>>>> + *
>>>> + * @n_roots: Number of root blocks in the roots array.
>>>> + * @max_order: Maximum block order (log2 of largest block size / 
>>>> chunk_size).
>>>> + * @chunk_size: Minimum allocation granularity in bytes. Must be 
>>>> at least SZ_4K.
>>>> + * @size: Total size of the address space managed by this 
>>>> allocator in bytes.
>>>> + * @avail: Total free space currently available for allocation in 
>>>> bytes.
>>>> + * @clear_avail: Free space available in the clear tree (zeroed 
>>>> memory) in bytes.
>>>> + *               This is a subset of @avail.
>>>>    */
>>>>   struct gpu_buddy {
>>>> -    /* Maintain a free list for each order. */
>>>> -    struct rb_root **free_trees;
>>>> -
>>>> +/* private: */
>>>>       /*
>>>> -     * Maintain explicit binary tree(s) to track the allocation of 
>>>> the
>>>> -     * address space. This gives us a simple way of finding a 
>>>> buddy block
>>>> -     * and performing the potentially recursive merge step when 
>>>> freeing a
>>>> -     * block.  Nodes are either allocated or free, in which case 
>>>> they will
>>>> -     * also exist on the respective free list.
>>>> +     * Array of red-black trees for free block management.
>>>> +     * Indexed as free_trees[clear/dirty][order] where:
>>>> +     * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
>>>> +     * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
>>>> +     * Each tree holds free blocks of the corresponding order.
>>>>        */
>>>> -    struct gpu_buddy_block **roots;
>>>> -
>>>> +    struct rb_root **free_trees;
>>>>       /*
>>>> -     * Anything from here is public, and remains static for the 
>>>> lifetime of
>>>> -     * the mm. Everything above is considered do-not-touch.
>>>> +     * Array of root blocks representing the top-level blocks of the
>>>> +     * binary tree(s). Multiple roots exist when the total size is 
>>>> not
>>>> +     * a power of two, with each root being the largest power-of-two
>>>> +     * that fits in the remaining space.
>>>>        */
>>>> +    struct gpu_buddy_block **roots;
>>>> +/* public: */
>>>>       unsigned int n_roots;
>>>>       unsigned int max_order;
>>>> -
>>>> -    /* Must be at least SZ_4K */
>>>>       u64 chunk_size;
>>>>       u64 size;
>>>>       u64 avail;
>
