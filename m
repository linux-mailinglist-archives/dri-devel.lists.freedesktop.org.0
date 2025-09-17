Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4EB8225F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 00:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FA210E025;
	Wed, 17 Sep 2025 22:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvClpzrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F0110E025
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758147751; x=1789683751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a1OwNNodgLQueUgBtFVpzM10PzX9Y80KcMF4ccr9rXs=;
 b=bvClpzrdeljoqIBHf2bOQ1pEo1BP6moj8N+kT+sa+N8Y4kHaR5Zvrueh
 p6ENp4GSEQsU0Rb7kdXEzzJtKI2AJEHphTSEbx8Xqd0kcM3Py3vvh+Pxb
 I/3aP0GhcOtrd7t0IJyVn3sAygK0Rxm9amk5H74YGm/6AwSKxgIidzMQk
 KwW8CkXRv1m5AYDIeFFTqk76Wx0X1lBz5pInVwYCmTECB5OZr1B7hXeYS
 WljBNU+Q5NXqQYO6owDEnNgxtGPMYIBIf0/JrVSQ/qQ5lqa4JLGBHRw+D
 p5tdcbYgPMTgq910JDY+1b4wqkOfb6/wc9t72EaeuACC48pGFbD9MKoPb Q==;
X-CSE-ConnectionGUID: L/QMM1C7Tji1EloUsbCvEw==
X-CSE-MsgGUID: U2HAWCtMR2+a/1KBUH0SUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="78071841"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="78071841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 15:22:31 -0700
X-CSE-ConnectionGUID: YLVVLFhnQp+B55Z1sc4vTw==
X-CSE-MsgGUID: GVypKewKRqqGhouGZu08kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="174482104"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 15:22:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 15:22:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 15:22:30 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 15:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muJKAWkmZf4GuP2jyic0Yo11c7F6PGfFtsHApbSpXnyfICdOyllLpnGxD5TJdZTOJHV5X39P87HYwxadg8eyU0lKazcheg/TfQcDVG2lOgikMCNxWDQ5VSi6mOspgtDaZOuuHI4uO+Hlrl8Ge9kGUe3Tr2LkqOClGynl8y09i3mULuG+n54AY3PJxwTkUCvcygt0bqknDnt7dJnTkb1AUXh68TfnUJnMqKmPtDQVT35iUdALImYAxV64pDxtjDrQYjBDc+vXsRnJAjDXs4OgAMEGrwRukRAvOJolyFbNfIRTm7ljUn4ss9ttB6RGfas5CuS1WgCoJwRYsYW3e/Epuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g50fQTthZAkVi11z5aVnP+rB7KWPf50cafjub6mn2qs=;
 b=sspyVPw2xCkENZPUC3CJj1JZKvPz1s5lWWUAscM6CSX0I1v/A7aJAW+B7pid7LszzFxbB9h3Pj13dTTObks4Tx5VxidurRsFsMJiWdkw0MDEhgWH9IIxrsCTgViXReUK+F+4HxqkdSvCKnx70+Z9q9UyBakoZHrKhNik2WQYdM3ci9Hk0ena/ph+YO7yb9tUC/Zv1o/D3wdl0tc3GqobaMHZ0rpE7v7W0teqsqg/sUrAD0pEJBX78D66grCabxGaRwIvE0QJJZc+uQIVdoTnnZQMQbBX7ybw5vvMiydIGOxZQALZ14dCVfg7b+GLPibHV77j7xWBUMsy3H9/QTPf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 22:22:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 22:22:26 +0000
Message-ID: <715252a7-3c33-4131-9619-c5e9b259d35f@intel.com>
Date: Thu, 18 Sep 2025 00:22:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Move rebar to its own file
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
 <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: d631b0ac-f4c4-4aeb-791f-08ddf638ae78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW9Ka0dRamswVkloSitqaWhDMmprMGt1RnF2TGdyYlVRWGdyVzRKeHF5RzZa?=
 =?utf-8?B?VU1qUmVJSUQwa2d5WjlTa2NjSFNJNjZjdUE3aHRQVUVHQkNMNFBDK3k2b3Uy?=
 =?utf-8?B?VnIwMmJMM0pKTzg2OHlRM1lLWm1zRFdjTTJDYzl1KytVbS90aU9VN2pqRWdX?=
 =?utf-8?B?TzVxQmxtTDFoSURkZHlUQ0pyZVJxdVZkYlFNZVI3ejFwSS91V3UxWHhsd2Fq?=
 =?utf-8?B?UXZVZ292dW14dUdLTzBjbWg2SWZEazRmQVhiV2tDQ3FVZzJEUmZmQXZlNmVo?=
 =?utf-8?B?UUJZSXJ6M0toVVlnTkFaWC9tWG9KVUd2dkNXZmxTV0xsclE5ek5ZSUYwT3Ew?=
 =?utf-8?B?VHY3WW9Pa1ZtZnhkSW1jZkVORitRdk9vbTFJMjV6a2xnVnlhZ2Vtbm1ONHZ0?=
 =?utf-8?B?em1ieFJFTlNNamJUZkZtUlR3d1RWVnVpcGNhSjl0VWx1L01maCtWNHdvY2pt?=
 =?utf-8?B?eVJQS0lCaThZUU9uRWNZV0c0UUxTTm1RdTVQTHJzYnZDT2NWNDQrYkpmSklS?=
 =?utf-8?B?emFtVnJiWEtuSXN5by9GV05GVk84U2VzN1MvbTU5VXYzemVHSmpmak1TTFVn?=
 =?utf-8?B?NGhrdWNYaXdMN243SmV4am1iMnUwU1FHcHI5cG80dGlpK0JCc2FhN0h3cW9k?=
 =?utf-8?B?bm9GL1lNUVVHQzUyV0ppWVhNdXZKVzB5bXlQV0JBd2V4V0ZFRzFjMi8xWFBk?=
 =?utf-8?B?Y2Y2anRLVEdhNXBQR2Y4eWRWd01Ja3RqcHA4eS9hckdpbnJja09FSTRQTkM1?=
 =?utf-8?B?Vk9LTjFaZmpIOUNJaXNDcGhLcXhQSGl5ZHhHRTFOVi9nWEVMTDI2eXlOeEtR?=
 =?utf-8?B?M1IzbDlEMGU3NHI4aThib1hQUUN0K1A5a2owNDFxem5jSnlQK3hqbDh5Z0Jl?=
 =?utf-8?B?eVZmcWlJa1YwY09GSnBEemFkN2ZPOGJrV045Wkg5TUtLQUxpNWZMR3FYZFpE?=
 =?utf-8?B?bVZVeE9GMGhIUjJNSXZ4U001UGR6TDA2TkltQ3ZmdmZnaEV5VHB2R3l2U3RG?=
 =?utf-8?B?UVdpcWgwUktBdUVKOFFVSUttazJ2NDYrT3BBVTZjbS9FN3VUbG5sR0hGckdj?=
 =?utf-8?B?WVNUa2xLMkp6eUhaUmh2NEpISzBxUkY3QnMwV3hLS2M3RVUydEZQdmpJbzA0?=
 =?utf-8?B?eDJoVFJJN2UwT3p1SWc2UlhCUFFTTGdnNVdRcit5RFVUSldJOHNCS3h3dG90?=
 =?utf-8?B?SVNZSnkvd3NoZ3ZNdkp4YndzY2hWYWlEWXV1dUpDQW96MldDUW1kMlloNWZz?=
 =?utf-8?B?S1JveFdROGgzdjVrd0E1bVQrQkY0MmZsOS9JK3J6emhOdjVDVjFRRk9IK1I4?=
 =?utf-8?B?VDV6a0FheWZnRk4zOUdJMHFRWnV0Y3krSHFReGFieHdrV2p6RVc2VU5xbG1L?=
 =?utf-8?B?bkdpUmRET3lSVWpoZXVzUTBGaHVka1JSeVJhZWVPMW5ZREV0UjdQNkpjZ1I4?=
 =?utf-8?B?N3JJcnR3OVJFL3Q3d2NTZXlZNmpncURjaXlGZTM3YURWa3oxUW5CaFAzRWJ1?=
 =?utf-8?B?cWlzMTFFNVJEZldTaFFzdWZzemQ4RGhZOEt4RnRWRWIzRG04K0V6SGtUbXU2?=
 =?utf-8?B?TXVMbi9FVStGNUVDU3c5WTRWR2k1dzdYc0hGd1c5MHo2MXladWExWVptdG00?=
 =?utf-8?B?eldlcVY5b1NVR2hmc2twRVNCQTBFMTM2WVJaVFBTWUF6b1Z6ZkxSZG95amdx?=
 =?utf-8?B?T2xWTWtYL0dsOUw1S2JINnpmUmJjc05lbUVXLzN0TC8vN3lBYUZvTTIyMUFD?=
 =?utf-8?B?ODdYRDNXKzVsV25CdEc2TnVHYjd1WkNRUkJtOUtHNXg0Uy9NNmJLRHZ3VUtJ?=
 =?utf-8?B?Y3Q4bGZaSkFHQlA3WXRST0ZmcjM5bnlHSGc3aC9icEx1a2VjTXRBTFl5c2Yw?=
 =?utf-8?B?d3ZqYXIwd2pQcEdMU2c2MUhiMUVLc0YvNmUwUytjWVlLbjg0WklSM0pzNmZQ?=
 =?utf-8?Q?u/G9Hv7TezA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJDZTZmZGhveUMyYkY4eUp5RXhXcytmSHM0ZHVtOFJPSFhGdFdZcGRPSGJz?=
 =?utf-8?B?N1BpY1hkK3BUbEc4Q0pONjh2YW5xUmxuNUFndzNoWm1QOE56V1AwLzI5SStU?=
 =?utf-8?B?bExXQUJwdUVzcXBmaTh5MWlwVXlmUVVaNXFsanc0TVlrT29kYTZacUVld29M?=
 =?utf-8?B?ZUovRXg2WnVRRTloY0hGY1ZSQU84a0JJZjRucmhmSStTbWFzSFVCVWNEdjYx?=
 =?utf-8?B?WEhmUm4wY3VOSC9oR1hhd21PQnl4WHFkTVpTclREaXMwUGp6T0NGanFqbUt4?=
 =?utf-8?B?anhEdWFMYk5ueVFOMnlqWllzNUJlNytDbGJiMG82L1lYN21lN2h2TTIvVnI0?=
 =?utf-8?B?UE80NDNMY05uSXgrNkY1NGRrN1lFSWhRbURvQmhVbGxZUmx1TGJCTWFNVWdB?=
 =?utf-8?B?Zm1wVTVZY0lsOFdaWU84MHZtZlJIS2pLNWR5YmJobUcya0l3VWxYdkVhSy9k?=
 =?utf-8?B?bG96OVF6MEgvVEc1dGZkVDhGYnpHZmN4dkFFalMrMndYUnFRanVucWxUcHBV?=
 =?utf-8?B?WG9McTgwV2lZMFFmZG5rSjNBRUFwUDNzNXYvQ3Zlb3BUOHVmQzhMUVYvaExM?=
 =?utf-8?B?ODNaU0xmOVd0TWQxek55MHNjQmhrY2dyeDRJTjBxdzJlTVhmbHJTREFSR0wz?=
 =?utf-8?B?M2ZUNXFQQzQ0bWtkTmQ2RVo2b2RwMkNLdW9RWkRKaVRtUG15M2dtZ0JnTHF5?=
 =?utf-8?B?ZGN5dkFQMnM1ejRwa0lHYVFUMHcrSEc3WlFHdmZoN1M5VzBUUFJteHFlWFFl?=
 =?utf-8?B?NjRMUU5pZndnZFhodDdVbGlHWEIwU2FMQWxicHZNaFZDMEJWd3drd0ErdVM0?=
 =?utf-8?B?cTUwK0QyRGFHTDRWUzR5STh1dG9OQStzZXdHbHd3OGU2ZTFFOGlhcFljaWFo?=
 =?utf-8?B?Z25PZmg2K0lZQWorWm9OVHJUd24yc2pHNEFDRmFOMW03bEhaeEFheDFqUi81?=
 =?utf-8?B?L1hzdUp6anJWcUlCazFaeFlFY3RteXNPaVdGZGVJb2hlaTQzU3B2T3JoUVRC?=
 =?utf-8?B?d3piVVAwUktoZ3NyYUhDV1VXdktJYlZPMFpRQVUrdGJxR043VS9FKzF5OW1Q?=
 =?utf-8?B?emI2dk4xeTdqblQrZWpzay8ydXlVUFpLdVVtUHFRTmRTOUxQL3pZWS80eVFX?=
 =?utf-8?B?cngvWDkray90STJGNHRlK3ZuMmlkd1kvT0l1czJ0RytVQVlIUmlFSFBUN3Fr?=
 =?utf-8?B?TmxPSXlNQjlSWGs0QktpZHRLQWNIdmU2SEM1N3FXZ3VoQ0U1UVNlUHd0NmJD?=
 =?utf-8?B?S1MvUmtSVkhBRG03ZUdOQUwzNTZJK1FoMnZ3cmY5cTRxM242Z2x6WXFuMkJT?=
 =?utf-8?B?QzNrZlZaUGZvKzdwNDAvUU9SWnZiK0JQOXNPR0p4dGVseGFjd1Z6WVBlbk43?=
 =?utf-8?B?ZGpQMnFNYUxiUEJLOW9hdnpTSUtBczBmV1hlZVcrNVlISVNTOWZuTG5XVW9i?=
 =?utf-8?B?WEFXbXh5VXdmVXZJdmxlQmJCTlE4RzBnUkM4N0FjRDZGdUtldC9iOEtSblFR?=
 =?utf-8?B?alpMbTJFR2ZuZzRUNlJMZnQ2Z2pxYU9ORXIrc2dBQTdpcGZFMk5FQllCUnhh?=
 =?utf-8?B?R1M0UmFxOUlSZnR6dXhRRUhaUXJhdStWeUpjT1VmYVREaFF0aVNLeXR5N1dD?=
 =?utf-8?B?cVRIdEswUEIvNmpYZ2dlNGw0VGVuUjF1czBEV0dTakduMm1NZVdxZHFlK1Jq?=
 =?utf-8?B?NmdBalJRWjhsTzlEU0xid24yMVl1QjJLVmttcWdhK1JJR1ZIVFZnM05GRFkr?=
 =?utf-8?B?SExPUVlhTEZiOWM2bWFTM09wYjNaelBzTmk2ZDRCdW85ZWdwVUNqVmZFb2dD?=
 =?utf-8?B?UlkxblVSbEdRcEhKcTlMRVhvRmNncEU1TlZEOFpaYVAyc01ralVQOTBuZUln?=
 =?utf-8?B?T3llaDA5UHd6ZG9Vblc2UUszc1BNdUE1QU85RUdlYTM0SWl1MjNFdmFCaXQ4?=
 =?utf-8?B?c09WcHY0aStjRTgwMVNlKzk1Q0ZyZTN1QXEyWC94bmZ5OE5DYUNnMjFtMEI0?=
 =?utf-8?B?ME1rSUZoR3VGUTIveXlUbUs0MTdVeEd6bSswdTNma2pSay8zdGNXemsyamE1?=
 =?utf-8?B?SEFoRHZndDkwSGNPanJ5cTBZVUpYYUJMS1ZkK3BuYmpuVFVBUmZIRFNqRHdm?=
 =?utf-8?B?OWxjY0QyR2xtaVAyOTRCQzVTWFdLTlgrazQyelhQWkFvT2VGb1hFR1I2bFov?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d631b0ac-f4c4-4aeb-791f-08ddf638ae78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 22:22:26.4278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoEX+dihgQMl7Gu2/e8mO/0jMJuppQJIBY0C0WogYdew5r9hPSbYThhquXJLsHWk7NM5rkap1wov2sgMzTmsVi0MFvPMCTqVKg6JIeFfTv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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



On 9/17/2025 11:37 PM, Lucas De Marchi wrote:
> Now that xe_pci.c calls the rebar directly, it doens't make sense to

typo: doesn't

> keep it in xe_vram.c since it's closer to the PCI initialization than to
> the vram. Move it to its own file.

s/vram/VRAM

> 
> While at it, add a better comment to document the possible values for
> the vram_bar_size module parameter.

if better comment is needed, shouldn't it be done in MODULE_PARM_DESC ?

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   3 +-
>  drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
>  drivers/gpu/drm/xe/xe_vram.c      | 109 ---------------------------------
>  drivers/gpu/drm/xe/xe_vram.h      |   1 -
>  6 files changed, 141 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7a065c98a3b85..5a66d7a53d0db 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_observation.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1f4120b535137..6cc5e7b6901a8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -27,6 +27,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_rebar.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> @@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	xe_vram_resize_bar(xe);
> +	xe_pci_rebar(xe);
>  
>  	err = xe_device_probe_early(xe);
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
> new file mode 100644
> index 0000000000000..e04416630b573
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_pci_rebar.h"

as we have HDRTEST enabled, does it still make sense to have
this header outside of normal xe headers listed below ?

> +
> +#include <linux/pci.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_bars.h"
> +#include "xe_device_types.h"
> +#include "xe_module.h"
> +
> +#define BAR_SIZE_SHIFT 20
> +
> +static void release_bars(struct pci_dev *pdev)
> +{
> +	int resno;
> +
> +	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
> +		if (pci_resource_len(pdev, resno))
> +			pci_release_resource(pdev, resno);
> +	}
> +}
> +
> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int bar_size = pci_rebar_bytes_to_size(size);
> +	int ret;
> +
> +	release_bars(pdev);
> +
> +	ret = pci_resize_resource(pdev, resno, bar_size);
> +	if (ret) {
> +		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",

maybe "%dMiB" as used below?

> +			 resno, 1 << bar_size, ERR_PTR(ret));
> +		return;
> +	}
> +
> +	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);

we can use

	xe_info(xe, ...

> +}
> +

please add kernel-doc

> +void xe_pci_rebar(struct xe_device *xe)
> +{
> +	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_bus *root = pdev->bus;
> +	resource_size_t current_size;
> +	resource_size_t rebar_size;
> +	struct resource *root_res;
> +	u32 bar_size_mask;
> +	u32 pci_cmd;
> +	int i;
> +
> +	/* gather some relevant info */
> +	current_size = pci_resource_len(pdev, LMEM_BAR);
> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> +
> +	if (!bar_size_mask)
> +		return;
> +
> +	/*
> +	 * Handle force_vram_bar_size:
> +	 * - negative: resize is disabled
> +	 * - 0: try to resize to maximum possible
> +	 * - positive: resize to specific value
> +	 */

do we really need to duplicate modparam description from xe_module.c ?

> +	if (force_vram_bar_size < 0)
> +		return;
> +
> +	if (force_vram_bar_size) {
> +		u32 bar_size_bit;
> +
> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> +
> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> +
> +		if (!bar_size_bit) {
> +			drm_info(&xe->drm,
> +				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> +				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> +			return;
> +		}
> +
> +		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> +
> +		if (rebar_size == current_size)
> +			return;
> +	} else {
> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> +
> +		/* only resize if larger than current */
> +		if (rebar_size <= current_size)
> +			return;
> +	}
> +
> +	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> +		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> +
> +	while (root->parent)
> +		root = root->parent;
> +
> +	pci_bus_for_each_resource(root, root_res, i) {
> +		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> +		    (u64)root_res->start > 0x100000000ul)
> +			break;
> +	}
> +
> +	if (!root_res) {
> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> +		return;
> +	}
> +
> +	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> +
> +	resize_bar(xe, LMEM_BAR, rebar_size);
> +
> +	pci_assign_unassigned_bus_resources(pdev->bus);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
> new file mode 100644
> index 0000000000000..c87aa58aee718
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_REBAR_H_
> +#define _XE_PCI_REBAR_H_
> +
> +struct xe_device;
> +
> +void xe_pci_rebar(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 4fb5a8426531a..caab5c1ff7ba9 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -24,115 +24,6 @@
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>  
> -#define BAR_SIZE_SHIFT 20
> -
> -static void release_bars(struct pci_dev *pdev)
> -{
> -	int resno;
> -
> -	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
> -		if (pci_resource_len(pdev, resno))
> -			pci_release_resource(pdev, resno);
> -	}
> -}
> -
> -static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int bar_size = pci_rebar_bytes_to_size(size);
> -	int ret;
> -
> -	release_bars(pdev);
> -
> -	ret = pci_resize_resource(pdev, resno, bar_size);
> -	if (ret) {
> -		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> -			 resno, 1 << bar_size, ERR_PTR(ret));
> -		return;
> -	}
> -
> -	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> -}
> -
> -/*
> - * if force_vram_bar_size is set, attempt to set to the requested size
> - * else set to maximum possible size
> - */
> -void xe_vram_resize_bar(struct xe_device *xe)
> -{
> -	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct pci_bus *root = pdev->bus;
> -	resource_size_t current_size;
> -	resource_size_t rebar_size;
> -	struct resource *root_res;
> -	u32 bar_size_mask;
> -	u32 pci_cmd;
> -	int i;
> -
> -	/* gather some relevant info */
> -	current_size = pci_resource_len(pdev, LMEM_BAR);
> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> -
> -	if (!bar_size_mask)
> -		return;
> -
> -	if (force_vram_bar_size < 0)
> -		return;
> -
> -	/* set to a specific size? */
> -	if (force_vram_bar_size) {
> -		u32 bar_size_bit;
> -
> -		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> -
> -		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> -
> -		if (!bar_size_bit) {
> -			drm_info(&xe->drm,
> -				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> -			return;
> -		}
> -
> -		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> -
> -		if (rebar_size == current_size)
> -			return;
> -	} else {
> -		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> -
> -		/* only resize if larger than current */
> -		if (rebar_size <= current_size)
> -			return;
> -	}
> -
> -	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> -		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> -
> -	while (root->parent)
> -		root = root->parent;
> -
> -	pci_bus_for_each_resource(root, root_res, i) {
> -		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> -		    (u64)root_res->start > 0x100000000ul)
> -			break;
> -	}
> -
> -	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> -		return;
> -	}
> -
> -	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> -
> -	resize_bar(xe, LMEM_BAR, rebar_size);
> -
> -	pci_assign_unassigned_bus_resources(pdev->bus);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> -}
> -
>  static bool resource_is_valid(struct pci_dev *pdev, int bar)
>  {
>  	if (!pci_resource_flags(pdev, bar))
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index 13505cfb184dc..72860f714fc66 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -11,7 +11,6 @@
>  struct xe_device;
>  struct xe_vram_region;
>  
> -void xe_vram_resize_bar(struct xe_device *xe);
>  int xe_vram_probe(struct xe_device *xe);
>  
>  struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
> 

