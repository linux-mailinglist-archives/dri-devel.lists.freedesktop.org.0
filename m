Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B8A77408
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3410E4F4;
	Tue,  1 Apr 2025 05:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvi8rPE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3C610E4F2;
 Tue,  1 Apr 2025 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743486042; x=1775022042;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u5n8EfXDz4qR0yuxLQT30560G7li1/BgrqnLM1llMgE=;
 b=bvi8rPE14qL/bcCOjnT+jgWudzK5G3fMkK7H8mgxLzBjEfuv3tOxzv0m
 tTVAUlJM4iSUGPJjBwxroRGdqE+zoyK15Rqvl405/nZUzuS/SS1/ZxjZr
 2W8avHGCNED6RLI20Bl4KzyRpU5DjD6p//lQeSxX3nWCzEQhVaCcdwjnR
 qYqLDJ14aG1rLHWAgKv4tyrJ6FoCeJGAkYazvJW8CCFr2SL3G9xFTMLOi
 kY+yjCcNQxuklTW9E5ZzabZ3NeHGKfiPcnZ7aZfICzR/z9rPyv2A4FgC5
 bPr3aEKC5YJ6aM/NjtTxfAGHXy2nbu0YEa8IbOv5YCmHtwle86kIn1GwY g==;
X-CSE-ConnectionGUID: bVkH7r3MR1OgoZw6/Zcdig==
X-CSE-MsgGUID: didr/M/7R1a5IXWi8AIxlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48582957"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="48582957"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:40:42 -0700
X-CSE-ConnectionGUID: 8a5EkrS+QCyyWiKhPY/tFA==
X-CSE-MsgGUID: NS5Hse/wSAK+QT4VhrDNaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126259509"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 22:40:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 22:40:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:40:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJdBnSBAVHynMw3H0iwFe3Oscjy0ScYztPvrHBg692W1DCxtx8YU5BE5dBjXDS9zHchhlz1ET97AYWGrxov4A27SbI7pTeMtXgpBBsZH7NrvkX+W6s4tnOGNNr4EE4LWs5xmiFTOfdT4+/JtHE2RNFwG/4eFSu9FwGl2nR3Sw/EeUMuHrB1Kt8Moer7C3RftqQ66ErIvbKX1e0UqxOn2iOBOZSQrly66V8/g3ThEiPRQn0rVg8XQPEKUZZRFaKFrh0ITBKQlbxI6DhjulIw9kmqgkJCa+FloarcDZIOslSvoIMN2I4kG5C2dI+4AgY+lEeKMM8olU7HXoVTJE6afeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+sP8F5I2+OwIMi/W9HrO2EyaPRQCtOLaSTwxKjNqYI=;
 b=HG/LmSRR8844Q3tR2qOllzSWtBYoRtCoVe/1nzoV66JNA6UF8cHDAXrWo0vzZrnC97SWYIWnuIptoBU8GruxK98l7iSzGmPo/OKigSpfXLrlRNTS0KiXW5k6eBL+xJ++/K5JUWdy9W6EcAs0HVEXFECn+w/7LFAG5Tb/X8KiqcRyowzrUFIY2oJKgqbWIPB8ZSFAhiPT3ozlt+CCghPDd5aaeZcpc9LdLlMD+hHIBw6HDF9OmP0Xf48ORLrwtaQPDwupfudPQ8iy1cy7gmasHJ4zTQNHf+4leGqLHYWeQtb+dd4pL7DRDPDfIpt/lN/BVjHc1ZnTao+F2N6KMwU4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:40:38 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:40:38 +0000
Message-ID: <863c59d9-7f35-48e3-9959-bc1cf13c38cb@intel.com>
Date: Tue, 1 Apr 2025 11:10:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/i915/display: Write and read back the casf
 registers
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-11-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-11-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f56ae7-cf33-4b5b-0275-08dd70dfbbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkQ5VXl3NXFGU0ZzWktZd3hNTWRHYUNKQ2lyWVEvRGFsbjcvYmdHUHV4aS9V?=
 =?utf-8?B?MVZBc1hsWHlJMW1LbG5sTkRnZ1EveGp1SHVJK3g2cXY0QmFBOERrM2xaNnVj?=
 =?utf-8?B?TWZlQ3BETWpVcDN6TENlNER1b29xZjBKN29INjhldDNzUjdKNG9vNDB3eVph?=
 =?utf-8?B?RlRScWtUVWpiemdINlc3UHpQTjFzaUpwaFB0ejI1SzB6N2tKRHRGa0p6MW00?=
 =?utf-8?B?d0p3dHBkQi9JcmtPeTJ5czhWZW5hZEFvd010MDAyTFdGYWZUdU0zaGNmdjN3?=
 =?utf-8?B?cUtsRHR4NDBpRzZiV1U5RG95SHRQK2xLM2VCT0h4WnEvKzIxKytCQ0IvQ3B5?=
 =?utf-8?B?dkRuZEp0YVZseCtNak5ISnpHeEMzK2hGaVdYYTZKb1p3eG80dktEaHhzcFVo?=
 =?utf-8?B?dEJZeTNZOGlyZ1RGK3FSakNITXpseFNPLzVFSTdibnl4WEpNeUh4aUNacjBz?=
 =?utf-8?B?OTVWbmRBaTZXaGpTM0FhdGNZTU5ZQlp3MzZVMHZhOUFOVmRFdEF4SXB0UVRP?=
 =?utf-8?B?aXQzMjhqY05RN0EwdzE4cDNQN3RCYzEzd2NldjhCaVBwcll3WG9rbmpnVmsw?=
 =?utf-8?B?ek0wUWRQVkl2T0RFV1drMWNxV2tRZkx1SHlyZGttWjZ3eUFEVXRyMjRUdkUw?=
 =?utf-8?B?K1ZGMHk1cmpEZlcyK2UreVRrMWYxcXFDV3RjUlRDOENZSnF0K1JocHB2UjRv?=
 =?utf-8?B?M011blFCVTJzL2lkQUlYbFJaMFI0KzF6dmFDa2pDMHhMRUJJME1PSmU4d3ll?=
 =?utf-8?B?N2k0ZDdrb3ZhbVFUNGg4MmFxUEprK1VmeEN4M2dyVi9CT2tUL3J0SUtmcmZN?=
 =?utf-8?B?QkZpSVF1UFl2czA0eENkUG9oV3NQaWt4T25hdTBUbXB3WWdvVWMvQ0VqcTZh?=
 =?utf-8?B?WnlPZUdYWW94VHlZcy9YZGYyamVKZi9PQUNIOE9hVUluUEEyUm1lY1lJNXNv?=
 =?utf-8?B?ZWhYN2dWMDRMb0hJc0JwRDQ5WS91a0wvajN1SlY4T2dxMHpHU1E1MnRydVFz?=
 =?utf-8?B?VFQvbUhKbjB2WHlOcmNWUnFxMFNEZmtFQWlhbVNpais0d1d6OUNpcjRGaFhZ?=
 =?utf-8?B?ZUhGODJ4OG10M0ZHaXBWWHkybEJ2K1FmUzhCdy85VUFvQXFYQnJVekVZbUJK?=
 =?utf-8?B?NWwrbHBBbkJqalRaRExwTzh1WFhSckxpaFZiWlJYY0NISDNLTzJBVy9kcGhr?=
 =?utf-8?B?UWNKaHFmcTNXdXRPQVNPM21LaUY4cFArYUc4ZmRMUmp1T0pjMGV3b3AxM0lY?=
 =?utf-8?B?OWphUU1XL1F4bFRxdzdxQlJhM2dGOVpHdUE1QzV5dFRoeEdqUTMydkYwMWpx?=
 =?utf-8?B?Qnk2UCtuZ0doaThLNEZUMlJ1S0xMUWNGWVJpdmpYekxSbHFaNkVMRG5sdm93?=
 =?utf-8?B?d0pSV2RuVzdQV0VjN3FRQmxWMDkvVTg2VmV6UEZRaVBJWFVZTzRiYW1UT3BN?=
 =?utf-8?B?UlBUbS82L1dvaW5KSDJHR2pXVGwrdFFzRVpnQWRrd1JBRXI3b2VmV2wrazhT?=
 =?utf-8?B?WUVrekhONXVSSXl0UkVkK3RJWFhiTHVZa2pqRFhUNlh1YUh6clhHVTJaQUNh?=
 =?utf-8?B?R0JkdGVaQWYyKzZOdDRpMHc3UG9HUkhTT0pTOURDYXhnY1dqTkFsSGp2b0Ru?=
 =?utf-8?B?QVA4cERXcVBEU1lUUVpEQ3RsdS96SnZoZTEraVViZnRqNlc2RFZDNHB4aWhk?=
 =?utf-8?B?blRSTzB2aFIyY3lhMm1zcEJHbFgwd1F3VVFxK3hmT0d0R2NHQ2k2bEpWNmdr?=
 =?utf-8?B?RHNlZkFpc0lSMHRtQlRyVFZpUnFwQmMxVUtSRzNDRVFpYitiNnMySGZ3aGQ0?=
 =?utf-8?B?eU1YUW1XYzNEU1l1VDlqVU16K050OEJRZi9ITWNXckR5NlZUU1htMFkyV01x?=
 =?utf-8?Q?TwkGfS5tUZpwQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHNuU1RPbGdKQXlwNWxTTkVzSVVpRFVpZ2dEUjhsMTdETVpNVFYwUHFaOFVp?=
 =?utf-8?B?YXluKysrYjVjbFIwaUpWVW1wODhPcWp6V0tRV0ZtZmVLMml3ZTFTTzkwSEo1?=
 =?utf-8?B?VUhpdW9pNGg3dGswcSt2UnFJQ2dhc3hYZXA2aUlxb2tibzVXOFJhTnVVQkNI?=
 =?utf-8?B?UGpPVk5tNUdwRHUzejBXSFBjdXhJcU9QT2pFRDQvUFU5eXdHZnpqYmVBTzdn?=
 =?utf-8?B?K21DL21VUzhIWjBhQklBd2V0M0YrSjRzVGpPV1VYc1J3TG13enZOTUtYajBz?=
 =?utf-8?B?SWFFMEVONkFKTlFnR3RaOFJOWkg4dmhubFJBZWkrdnJ0OXlOVzBwbGh1UFh0?=
 =?utf-8?B?ZytnWGNvMk11ZDEyZndGNW9VUEI4ZzBMaVhpNHdUQSt1aC9sZVFwTXJmSmJY?=
 =?utf-8?B?b0pYdkZvVjd3M3NkeW9CS3RUWVY4WkZaOE5sa1lLNzJ6MUJtU0ozaTJCbEpj?=
 =?utf-8?B?SmozczFZalI0Y25DMzNJUXMvNGJlSWk5MW5zTGF1eit0SHNLTExSbUo0MVF3?=
 =?utf-8?B?ektaRExDWDIwM2RPTXhPK0VuYkdQS3RmODllVEZoditFRTFsTFBiakcrRTl6?=
 =?utf-8?B?M0gyQ3dkVFhXUjVZRythY3UvM2tuNk5KUm96ckZrOGtVc0FSa0VsbFlZOE5Q?=
 =?utf-8?B?UDJpZmdyYjN1K0gzSXUxdmUzMm9JTmdJTmlRbHIyU3NxUWllSVFXZjZJMit0?=
 =?utf-8?B?a0NLTGIzWkx4THF0anFtYlQvcWsreUNzOVF4N1hxNEFBZnM0VnYyOW5Obitl?=
 =?utf-8?B?a292MEEwNCt1bXRrNnNIenRxb0R6eWMyQkEyZzVuMi9SMGl0SzduZE5HdnV2?=
 =?utf-8?B?N3hJVmRyYlJPWW45VTRrMGRRNGVNVjdydGtVZzVFaWZoR1AwcHdvcXpnb3NX?=
 =?utf-8?B?WmNDd2ZKblNkLzZ5OElLYlMxSXhEaEozY3NuK2dPekVwanI4MmhxUWhkYjZt?=
 =?utf-8?B?T2diQW14RE01ZjQ0UmtPT1A4Y0F1TFhpbzkzL3BvZ1JDeUpoQzRlUXdXaUVL?=
 =?utf-8?B?R3FtVm9BTDF5M2o2UlgveFVkUUVhVmZjY0RlL1YxS04wY1hqVnJLOEpCeUJL?=
 =?utf-8?B?TVAxTEVROXBTMmF3elhEQlVSZGlxVGVvOGo2aVBzTXc0cll0SFprVnV6S0dy?=
 =?utf-8?B?MjBhZm5tMnlOeDFhbUxmeFA2L1lIVFh1aFFJSmxzUGozN3MvR2pKdGc4TVo3?=
 =?utf-8?B?Q1JGVTBZejRrVTJ6aW1WVndkeE1EdWlPT1RUcUJxalNqUjRibXZWemRRd0JD?=
 =?utf-8?B?RzV0SER3a05mdDd2eW9hR2RjNUR5aFlIOWRCZG4rbDd3V2orYzE2RTRSTHh2?=
 =?utf-8?B?bmR6R2JuekFINS9HYmhqM1FSanA2NXAyLzU5Q3MyMnIxdThvVSs1U29TYzB4?=
 =?utf-8?B?TFQ3RXVZVi9uKzJodzYyNURCeFdGd29GbmJmR1loamNMVXplTzI4QTd3K0Q5?=
 =?utf-8?B?TnIwZVp4MnVpcXlqcDFDbzFqdktEenh4WVVUR3VPamdtdGRKWmVXMTUvS0tD?=
 =?utf-8?B?Y2FxQ0JEUVVpZkI4NUxXZHdicmpvQkFFRjdiUzdHNCtBcXNqKy95RGdUaXYz?=
 =?utf-8?B?Z21jc1Q5WjY2Rjg0c0l6N25VNUI0eXNGUVFuaHZwTFdaM1RwVVZnZHVOQXht?=
 =?utf-8?B?bGFWUGhqQmhSSno3U0JiTDlwNkhwSnV4T3RWNzROaGxicTdiNXVhSk1vQlVN?=
 =?utf-8?B?aXJBZi9kcHE4Vlc5KzRjS1lBbkZLVHkxdXZwSTlnVGlsTGRBOHdYT2VZOEtk?=
 =?utf-8?B?SnhURlo2aEFMVVVSM3FwaXJFaXVuVVo4MDg0VHBjMmx4bVNVRkg3OVJPODUw?=
 =?utf-8?B?R3Z2OERVVm5WNjBGK1ZKNm9LelZEU05uck5FdzZWczkwVVlEaWEwRG9hcmdj?=
 =?utf-8?B?VWRQazNjOEl2S0lmS1FMWWFOemRNdUpQSjgxVEFNRXRNMzR3NHhxQzhhenVZ?=
 =?utf-8?B?U3plMTVVdzQ5cVlZM2NmRmFHa21xMFJpNWxyM0w5UWw1b2JndDVNbEpNZ2c3?=
 =?utf-8?B?RTJ3UjJBVTNNRHg4cTYyazY0WUFhRlN3bDdZN2tyeEUzREp0SzNkZm8yRFRO?=
 =?utf-8?B?TVoxbXJBT0JwNDUwM0FZUFkrQVhhakgzMm1nVC9hSkg2MEF6ak82NnhyVDZK?=
 =?utf-8?B?OFRPODI1Mnc3R0NSVjRiR0pmNy9GMmNSbkpzTXR0RHZ1L09mTVcveDE3Yzhv?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f56ae7-cf33-4b5b-0275-08dd70dfbbcc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:40:38.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7z4ZxU2Xsl+NGwIwyTcvLbdekDz7d+20aWvyhB4EC+pIkIuN6R6HlmG9E7l4ntzL654KV5UyeemOrRbtwOeVoWHlIQbHlaMLN0c5Hn9AOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> Write the casf registers bits to enable the sharpness

Hmm, there is no write here. We are setting the configuration for CASF 
and capturing it in crtc_state, and we are getting the configuration 
after a read back.

Also, as mentioned, in previous patch, the compare part can be clubbed here.

So we will have setting the config, getting the config and comparison in 
this patch.


Regards,

Ankit

> and to compute the strength of casf using casf_compute_config.
> Also verify whether the enable bit is set or not and strength
> value is correctly updated.
>
> v2: Update subject[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c |  4 ++++
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 18 ++++++++++++------
>   2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index f807915e0fee..d6691cb07173 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4224,6 +4224,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   		return ret;
>   	}
>   
> +	ret = intel_casf_compute_config(crtc_state);
> +	if (ret)
> +		return ret;
> +
>   	if (DISPLAY_VER(display) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
>   		    intel_crtc_needs_fastset(crtc_state) ||
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 93a847c05535..6ddc111d5c29 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -964,16 +964,22 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   			continue;
>   
>   		id = i;
> -		crtc_state->pch_pfit.enabled = true;
> +
> +		if (HAS_CASF(display) && id == 1)
> +			intel_casf_sharpness_get_config(crtc_state);
> +
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			crtc_state->pch_pfit.enabled = true;
>   
>   		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
>   		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
>   
> -		drm_rect_init(&crtc_state->pch_pfit.dst,
> -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			drm_rect_init(&crtc_state->pch_pfit.dst,
> +				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
>   
>   		scaler_state->scalers[i].in_use = true;
>   		break;
