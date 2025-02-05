Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA37A295A4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFFD10E01F;
	Wed,  5 Feb 2025 16:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xscbp0CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7810E3A0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738771381; x=1770307381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=euMHrTMtojnLLwpKHCzZFE7SEj4Ir583O2ZtN0K4tE0=;
 b=Xscbp0CQDHxRAKyBLRzDne/i5vMNNk3cxq7QwTqAlcH+6U5WYhsqY2rC
 a3/aodLMAa0WX+cLdWj8eIYnjDlGnDOcGUAo9Nd06q0wQ1new0VLyxyCw
 85sehtKYparf5awTOiqpoUh1GTr8/ulG7up3etjlPFQ6ahaTeYTZhpEwj
 TJAW0ONDwjfCOQ9v6t2RDyXpdZxmBE5eWoWVNyl3kXtP3JaG/jxidLcpK
 M6ddKu1Xc3rhhSRpLn8cS55EVe3k7kFXQFzZKD5ABt4Sv12M5gAo0z25G
 S3p5opJdH4PVCqEs5sLbqQk9F79F47gHBRpDNU/p+l/oVQoasUT2sYLxl A==;
X-CSE-ConnectionGUID: GaHrm76kRE+OoLi/G2tqJg==
X-CSE-MsgGUID: 7ZQDoanrQYW9CtTsPeAu/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39456661"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39456661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 08:02:56 -0800
X-CSE-ConnectionGUID: 2ELaUYAeSA+uqmc+bBSuhw==
X-CSE-MsgGUID: EINo9wJIQjWZ4Qt26xJTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115561442"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 08:02:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 08:02:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 08:02:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 08:02:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8ud7RFyo8mkAFgrYG7mU0dGpZsE0SEhcA3oWpReZeffjN74k9vKl824kJ4mcDYtBYmQv961JbKbZ6SJXScoyYoD7iLXG5b+KCgPdk7IoON+kGpb7CDDdWU8+cqajSFjMlDVBtrqaldTAY8Gu6rI0dSHrEiXCEmZEcxHLOiUjVLx7eQ94ndzq/81bDki1gCkNU7dgjpCkTCchsyv5uNOqLOGXPUczvhl0FabWBh9xqbAN63CP0fKqS/XduPNiiquceVIfvQkmHxOYZ6L610XCrdEsWRcv8F5Pe8cBZAuTG7hR9ICvAdkstxnBaWtxs2OqIM4dPlL4jKAnNDIo4O60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvC3jtklj0ezMJMs3LF9MqduvUxgTeaa8LoliAnC798=;
 b=c7PREgN+R1SoyWpFVeNeOslvGA5Kh2pC5uDLYABc3kksyTTgJCc5r68l5AdgN0XV9yPAPkxdkCs8YOyeGW7K3DRDN8/6g8YuK0PdvOlit03h4GiYsb3/X0CkCuqhj9poFAAQ/l/9MbdQ2gEDH7HndcEWQPIxQzaiHnzUDEOp4Np6IbzJ59Gfk2Ir6Of4Ie4Qy3VM+CIExs29RQx5BOGCncdBmbO1Otxjd4FLqDBpoCWYhSbh782SUq/U5cVbSSAAx1vy+3DYPTaHr0w5z1kEbgbtH2myF+uChe9yzgseToGFAhWnqU4e8mOe2uzPACsDSCxyUiqS44JR8MkSh/HI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 16:02:17 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.8398.020; Wed, 5 Feb 2025
 16:02:17 +0000
Message-ID: <4493a2ec-3d88-4036-bf45-237e192cbe2d@intel.com>
Date: Wed, 5 Feb 2025 17:02:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: Nirmoy Das <nirmoy.das@amd.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
 <9db7851b-d860-47ea-8226-f5b5a1111c21@amd.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <9db7851b-d860-47ea-8226-f5b5a1111c21@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::20) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bef3ef-8476-4a8c-61d5-08dd45fe76bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0hGY1NjdEI3akpnMnZvUE4zK1N3Y3pUVnl2K2FzcXY4YkIvMjBYaWVjUE50?=
 =?utf-8?B?bmt5V2h4cGFnZHBOcWFhL0txcVdEYS9reUhhSHo4Rzdva0U4RFpvT3RTWmJD?=
 =?utf-8?B?UzBNd2k1TnRJNjl3Y3ZsV0JRbG9uc1ZtZU1JZlVTWWFNajltREVFVUl0R2Vo?=
 =?utf-8?B?TktVTE8wRDgweDJOdkNwQW5Za2c5R1dENnB6UHVhSWxVbXNtdTFiMlJOM25V?=
 =?utf-8?B?b25PWGo5RXVVakFKd05tZDhIODUvelFDZUtTZ0oralVRRHhZdjFIVjhTVmxH?=
 =?utf-8?B?U2ZyN1kxWjlHczlGYXk0SFg3M2lPMWppcXM4M2k0MDBmcFhwNDlBaEVLM252?=
 =?utf-8?B?UVdaZUtlSXlhMlQzcXV0TVo5ZmgzVmEyaFF4Z0R0L2F1YjV5YStRQVRCV1pz?=
 =?utf-8?B?SzR4bjBpR3UyUEdudUlRR2QvUnRueDBiNDh1YytQNWJEK2pmcmNFMjRrREdB?=
 =?utf-8?B?cEl4NSsvaDlwaFNGQTNUcEp1bXBvQi9TaWdrU3p4UEk0SnRseS90MmpFU1JH?=
 =?utf-8?B?czgxRXNrcWprWG44THFTQzN5bW1TQlBMVmtVc1UvbVpRNXoyNCtNZkVMYzNt?=
 =?utf-8?B?MFZTQjdHRktEQlpmeEFJQ1BSa2FURU1QQ2wzdmdrdC9qc3ptM3A0SjNnTnM3?=
 =?utf-8?B?UEJ1Ylpnbk5ibm5uM1FWTnNEZmNGT2xZbGs1eHR6QlBtRndEK0Z5YkVyYmpi?=
 =?utf-8?B?aUloS21uN2ZnYlkwTDFHdFpIeHB6MXZPbjdMek5Wd3BYNUVRdjVXNlFUREY2?=
 =?utf-8?B?WVNsTGZLRE1TUVZnSzRTbm1vSThOUUFZVmRacXVjMWV3SzZsWXBRbysxYXRK?=
 =?utf-8?B?Wks0eGRqWVhMdXZCSThGbVZ6WEFjdlRDSnM3Z2M5QXpKNW9pcHE4QzBuOWNt?=
 =?utf-8?B?eE9uQjVKejFIUERIUnRjdjdRZGkzeFB2SXlrc0VTaHNjd0JZZ0J1eFBCRk1C?=
 =?utf-8?B?bVBTVmtyT0NzbzhuaFZBUUIrMnRlLzF1bUp6dTBJTlBRdWdGKzFNRmZiNW9h?=
 =?utf-8?B?cisxNEZ3NVZEV3k4ZlRPU1FYak5oRG1Id2xmU25LZno1SG5kRkxHcFNkUDFD?=
 =?utf-8?B?SWM1OVhVMVdlQmUzeVRwck9ibUp0Wkt4bzRBdzdLekwwTlpET3NBUWswYjRZ?=
 =?utf-8?B?TGNjS1FUNWs3Wk9KL0xvbXh2ai9UekFDNmpzdklVMWtqWnhhUEU0ajdyaG1J?=
 =?utf-8?B?bC9CaFIvaVY5bm52RThvSm5BU1l5VU0ycmhld2JrMXpFM3c0b0t6N1dBYkd3?=
 =?utf-8?B?bmk1YjVKZy91ZFcwMDNaRmowbityWlNBbG91NkRwb05tQkZKYjVCcE40TDBK?=
 =?utf-8?B?YWxhWGxSTjVPUnJHOWs5MXh2OHJySWprbmlQNHR6TkVBQzczMDhuZ21PTk5Y?=
 =?utf-8?B?bS9PVkZRRW8vOGIvMUMvQUFFSGpvdjA0Ty81K3VrMFpjY3A3SzB5YllZQis1?=
 =?utf-8?B?ZkdRREEyM3psYkVNT05zbWFpSXdUV1BQV3krWmxOUjB2TG4vRCsxRmhqa0FS?=
 =?utf-8?B?WE0wUkZxWTJOeEZaNkxQemliTThwdURMZVRMOUY2UmxSelArZGRxc1R6d1Vz?=
 =?utf-8?B?SUNCZ0txby9xV3JrQnZSRWZyLzFtUllva2FqcGdTWGpDNkZOZCs1dDZsTmw5?=
 =?utf-8?B?RVdnMHE2bVh4OE9DNGdtWFdHRG84eUx5Sk0xcVhBaURXQmtwZ0xTcDZOc1BD?=
 =?utf-8?B?QjJHWTlVWVowYkN2QzFkZjd4cUtuWWRISVNzVFpoRnVVb2xuMmV2d012bXNR?=
 =?utf-8?B?TjZQMTRnU2lVbFB1dUo1cVg5Z05SaGhiTmFxQmxMUjdSSmJBT29QR3dxWW94?=
 =?utf-8?B?N08vc1ZoZlRaVllGVm40cmkxQWpwOVl1c1J5ZXFIYXpkTXJkYjNneERqVWJ6?=
 =?utf-8?Q?b5GQbtg3wqww4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtUL0x4d1RnNEhyUklWOXhOMDBVdndYOFdJVXhidE4wc2pVNFRERUZiNlds?=
 =?utf-8?B?OGdUOHFkd09Eb2txMmV1ODZDaTFWV3A0bHVuNzNHcVQ3eFFPR29qUTI1WFVC?=
 =?utf-8?B?WW0wZjFYcE13bEQ2TlpiQTUxdlcvUDJMVWhDL2NhTjlzOUhFbUpFMXhNUThF?=
 =?utf-8?B?UXBnVUViaGo3RTkrREdJZnVSam5zbWJheXY5WXp6Z0NSOGlTeHNQR2k2TTdn?=
 =?utf-8?B?NWMwam0zMi9CNFFyckJDNVQxcVlHY24rVDFmdS9rWHlVYUJTVndSSzNXcytZ?=
 =?utf-8?B?OExkekFTd2c4WXBPOG52SmIwd21kVVZLYURIMGtjTjdYajhSdWlkcUk0SjJF?=
 =?utf-8?B?eWRRbXZyNE1yTlJrYWpqVUhKOWt5MDRFOXA0Q1YzUUtydUVGY25kcW94NlJD?=
 =?utf-8?B?Rk5GNW9EU2dJWXJwSU5Nd0dDWHpSTDZXaWkxcHpzSm5pT24wN2NlUVIyaHVC?=
 =?utf-8?B?QXpQekx6YThqM2lsU1pSVjJTT25MemM4cXpxd3VmbzcvdS9YWXY1Tmt2V09L?=
 =?utf-8?B?ZGxHRTdpVWtKTmhWbFJDbHo2VmxjVUFQUERoQWkvUUVpNlpYVi9nREY4cDdu?=
 =?utf-8?B?TS94UURtUXdQWFVqQ1dDV21jT0hHRWplMXNKQ1NPckQ4OGo5Ym9QdG5Qb3k4?=
 =?utf-8?B?cGhPSVVXdVQxc2tGbkJ2a0dOdUxFQlBZNXRkclZ2djJqTXFNcFFId0JZWDNK?=
 =?utf-8?B?RkErRDJGcHFXZ3dSYzMwMUpEdUtDVHBYRnVpOW5pQzJiaGtjb0E5R05USWRP?=
 =?utf-8?B?cnJiTzhHQ0xEOVJCWEFCYjJFWjJjOVlWR3c3VzA4ZEFGYmVhdnVmeC9vTkpO?=
 =?utf-8?B?c3J0aXlSMDAyUUt5V1o3V0pkL0VqSjFWdEZ2WTVQOFpwK3ZpQldIT3Z1VHcz?=
 =?utf-8?B?a0svM085RWxwOHdjVTJweUJEQ2d6U0pYVGR5Q3FlbHlBM05yTmlkRkFHRXM3?=
 =?utf-8?B?d2Q0dUl6VGI4ckd4KzVXU0ZVSDJRWmYrNUdSc25NTUFMVnB2cXNoWWFjbzI4?=
 =?utf-8?B?Nm51RDdwNXBKWFpHOElOSE1Qd3E3QnNSSmd3Z0JHLzNtMjliUE00SjV2UHpk?=
 =?utf-8?B?NGNkWXVHaHIxbkFtbkt3ZkdpbTVyckR3Z0lwdnFoY2pIMGtXUFVlL0pYWlV6?=
 =?utf-8?B?WVFScnplazhScHI5MTR5cGlBOWZCNUJaVzl1TWppa3lMa2UzdUxadDZLKzVi?=
 =?utf-8?B?U0tES1Y3VjM5Z3NmR1pzZVF1VC9JRDhLUk05b3Q0T3RWVlYxWEg3M21wTmZw?=
 =?utf-8?B?a2lQUkxwQVlxb1pCRWtCSko1V3FnRWExeDgyb2NLaGpTcnFGdDNFNkZ4Z1pz?=
 =?utf-8?B?ZnhDRnhTVS9OMDc5N0pNUmF4MkZNUVJ5TktER3hBMXJZdEd3SlZ0YnI3T1NQ?=
 =?utf-8?B?TnpFR1FoV3lhUFpFZFZGYWY0SlVKZXdsbTJMM2xPYUl5d3RyRlBkdW5IdFZR?=
 =?utf-8?B?a3d6Wm5hWk0xLzF4eVprS2FwTnhVQndSalZHODgyV1BUQU9JNEN2cm9saXEv?=
 =?utf-8?B?RUZXazVaUm52T2NDMzFua1l2TlFrUTdKQUNrR2VYK2IrNzFYa3hNOGIzTE85?=
 =?utf-8?B?TnVLYU1Rd3N4cXRhbXd6a242Mlc3MERlZ0srWlM1YkdObVlLaXY3bUJsbVFP?=
 =?utf-8?B?c3hMRTFTblJpeEo1aVMwWnJoQkpJZVQ0empGQktWTW5Ia1ZnT3lLcEJXS0kz?=
 =?utf-8?B?QlV2OUVieWZTMnprajExb3pma0F6alFtTDErOVZaSVVFODEyWjMxVi91alJw?=
 =?utf-8?B?NWltQmNjVWxOMkZ0TE1UTU45WHZCNWZiM0xTVlFXR09taU1PRzYxY2o5d09G?=
 =?utf-8?B?aWJ3dlpnSjFyTW4xNTVVdU11VHlEZU10M3ZXKzNuNjFvRUZzbnVIT29jMTB6?=
 =?utf-8?B?Nmx1Z2FGVW9wYi9ROW1lNGFmYTN5d1VMdExheUY1M3ZLY2c5dFpYTS9yeHNG?=
 =?utf-8?B?RTc2VkZTWDlRUi9TbStoaXBYNUpOQUhYelUxMGRIOU9MV0hMYUE4RndzRkhZ?=
 =?utf-8?B?SW1XU25UR0hmTml2NXN3OGdiUE9GSTRtYm8zMWVLVGhhMGhwZTV1OStxTDly?=
 =?utf-8?B?MmdpV1hPdDMxcGJGM0pTNGVwaE5WUjhMSUVyZlR5VFNLNUlFOUo3N1JaNFR1?=
 =?utf-8?Q?9rDl3r47HSr5ZATyiFUpkKSj/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bef3ef-8476-4a8c-61d5-08dd45fe76bd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:02:17.5693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfmIkEMD4NZjHd25PbZ6vy55PnJWOZUW8XWe7rHc8M0KwBQFmk+w+CyA0WTIHLXTiYOBAIATB4wpeM55aPMNDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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


On 05.02.2025 09:32, Christian König wrote:
> Am 04.02.25 um 23:41 schrieb Tomasz Lis:
>> This RFC asks for introduction of an interface which allows to shift
>> a range managed by drm_mm instance without repeating the node list
>> creation.
>
> What do you mean with "shift" here? As far as I can see from the code 
> you just modify the start address of each node, e.g. you manipulate 
> the offset.

Yes, that's the idea - move the address space to a different base.

Should I use different terminology?


>
>> The long explanation:
>>
>> Single Root I/O Virtualization is becoming a standard GFX feature
>> in server environments. Virtual Machines provided with direct access
>> to virtualized GFX hardware, in form of VFs, need to support the
>> standard set of features expected by Virtual Machine Managers.
>> These standard features include ability to save the VM state, and
>> later restore the VM, possibly on another machine with different
>> setup. For the restore to succeed, the GFX hardware model must match;
>> but for its configuration, some differences are often allowed. Such
>> alterations may include a different range of non-virtualized
>> resources assigned to the VF, including global address spaces.
>>
>> If any non-virtualized address space is saved, as part of VM state,
>> on one machine and restored on another, it may happen that the target
>> range differs from source range. To shift the address space,
>> currently creating a new drm_mm object is required, and moving all
>> nodes to the new object while adding the shift.
>>
>> GFX hardware handled by Xe driver contains Global Graphics
>> Translation Table, which is an example of such non-virtualized
>> resource. Should this interface change be accepted, a series which
>> utilizes this interface in Xe driver will be prepared.
>
> Well that sounds exactly like what AMD is doing, but we just add the 
> VRAM base to the MM node when calculating the final address in the MC 
> address space.
>
> On the other hand AMD hardware has different address spaces, e.g. VRAM 
> in page table always starts at address 0 while in the MC address space 
> it has a certain offset which differs from device to device.

We use the drm_mm in a similar manner - some address spaces start at 0, 
other use a narrower range. But we do not add any base after creation - 
we have the nodes at final offsets.

There is one more technique we use in few places to restrict range of 
valid addresses - we create "balloon" nodes which fill up the 
inaccessible areas. When the accessible range shifts, we then remove all 
notes, and add them back with balloons resized and the rest of nodes 
just moved by an offset.

Using the function proposed in this RFC will actually force us to 
abandon the ballooning approach for VF Global Gfx Translation Table 
address space and refactor the code to give only the accessible range to 
drm_mm. That is why I'm sending the RFC without use example - we will 
have to refactor the Xe code to use it.

-Tomasz

>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>
>> Tomasz Lis (1):
>>    drm_mm: Introduce address space shifting
>>
>>   drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>>   include/drm/drm_mm.h     |  1 +
>>   2 files changed, 25 insertions(+)
>>
>
