Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55BAD7D94
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31510E28F;
	Thu, 12 Jun 2025 21:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/fuirsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0710E28F;
 Thu, 12 Jun 2025 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749763754; x=1781299754;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jsGMvHfHqc7tvpInd9iym+EsjC/XHRu69XGZwQ9Eg/A=;
 b=D/fuirsTbe271jBROUmnlrOa1vTzSGCoOaoGrjxu3Zh5l3GqnQ9+ofms
 P+53NO6MM2t0sVHcTSKH8UlaTdffVu08aq07IHgaZAZcbeM2YvFeAcQ3b
 AUVfO8r+Vo0KwpSV7Q2nfbhfSJvfQWF/vavzsVa75Kn2ssPkqz8U2nVQe
 MqOfROiwjqQeJ6LwAt0RAiKVvgs3ZNv61J6lHFRl/bYCNnwPnY/c+Y9jd
 hcPcDUrB3/DzdjY7QpyCwjS9obb4+FZ+Ddu4yeinoRK3ElnRTLJEd7/4u
 3OvWth0zHo1myms8ieu5nWWweuFLhWW4tUcMDl5rC+oFvb9qrdCjKEibp w==;
X-CSE-ConnectionGUID: RCi8AX5hQrWW8rSojfQ8Lg==
X-CSE-MsgGUID: wfrOfz1bRa+MALCoK3NDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51075525"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51075525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:28:53 -0700
X-CSE-ConnectionGUID: h0gDvp8gTrCCBRqWNk4X6Q==
X-CSE-MsgGUID: 2wbVWUcvQXWZOgTX5MDxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="151456433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:28:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 14:28:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 14:28:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 14:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWYLlcgsXa4ffbVDsZA9eKqOkAmmNMnl8Dnr+OpGGKzRxkPtUS5ZFdvaOfeFeNbMnCG5cAeKbewtfA5XL5vRhVqzyEDV1GxHvyZIUrhe0yTZHRAaT/onOsmxmgHqrWHxgG/3u25IFeFoOIyfCFFIO9vUT8dY01GGItpcB0bRX4oDDyWekrY8LO2t5VyC6/b8XLccSGRRR7Scp3e1FxRj9pvbbYao4IgH1LENGg7QLi4TSw6cm73AMKQK7YGFAjrnuKTCJaviZLJg9LahXZV0FRHVnmXhEriO1o1xFgT5q5vorVDWKKQFLTdUYRu8VXfbSDYoXcvQNLU71EcHwBjAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCuz/j2a8MZviwyVnXv6wO0Qq3c0qiQvwDzeaBVRv2k=;
 b=LoPPN9Fzt/zGPI8ibCoJfVq7vjKJKk5Eg1VCPO4s716tIZ5xLIx1/IE33XYsADMVW6Agr+Tf9QLHpHCuLIAOjZcKZuO7oFK8sXMWcM+6R8GioyXgK+rHOw+/DKxWMnQX5n0icDwe7m5BKB2kv//ow+kRhV2T6Aw70+kBNiGcpa9uSs3X4wvM4QeSIyvZV5xil5RLdVdhXgRax/zp0A2dVC3az2cibROvkaqJidBGzsp5o4lofHpEIZ0dSMG48+9mzSDjS0MDSVfLFpJ09aQ1Vh8gpXCzXe8hsWr917bDm6nNfQeqHGwM2S30YDkG2WM9n4vUWqiITYQHGymtrW/cmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 21:28:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 21:28:50 +0000
Message-ID: <011d4c94-0ffe-40d9-b089-98e5519b27b7@intel.com>
Date: Thu, 12 Jun 2025 14:28:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-9-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250606175707.1403384-9-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a66e0b-0b80-410f-e6e1-08dda9f81f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WSsyaTYzb0tjalZwNkRmUHRzQUNadlMrSjV1aWlIVDlib1VmR0w2dE9kdHZ5?=
 =?utf-8?B?M3N2Mng0aGdBcENYY04wUE5tS200VlpQQnQ0cFRVMG9qcTR0Sko3T1ZXMnd2?=
 =?utf-8?B?UnZ6Y0N4M242VFp1a21US0twcmVwRGNvN1hKVnViRHE5VWlRelJDbEdaWXhu?=
 =?utf-8?B?N3JsUnhWbVJnenZLQitManQ4ZVJaTVB0UHJzVXdwVU80c0hVMXRpbW5uQ2RQ?=
 =?utf-8?B?OS85VmZDbStPajFIOTVJazd1WkpxbzRPWm1HUi9Jd2dpbkhMbE9oL0JuYlIw?=
 =?utf-8?B?bXZZZysybjd1alRoQWM2bFQ1S0hxYlRuMGRqdTVuYWZKSFhTbVdmRkR1RUpI?=
 =?utf-8?B?WDhMMDJFNE00S1FQaHI4S3JRSFNybjYydXZPQUk5bnBQYjZHVTN2dVFLQ2Jx?=
 =?utf-8?B?emVoQ0ZaZjFVZ0Y0ZmluRm9ITUhhV2crTER4UGpzQjRBeDVYdFVlRkJmOWpj?=
 =?utf-8?B?SzBkS3Fpb051UkdNZmNETVlydlYvbDZ6YmJKYmY3MThkdHhjbElwTytDeEpl?=
 =?utf-8?B?MGtVYytvRm56djhXdjFudWl6Q1VpUGtMdVFHTEhRYzQwdEZwWTRlZmFJV1Yy?=
 =?utf-8?B?NTJIdkY5WENGaDhZTjlnbDZ1L09ZZHRBTzRwTnBHK0lHdjNiYmlVZTFZclFn?=
 =?utf-8?B?cHlkZnN5Q0c4M1dlWERKWTJ5c09VOUtmb0lScG96UThJSVkzQjNNZ0pFRURr?=
 =?utf-8?B?Y2NkQ09hTWw1SkZRN2ZKMG9Od3NRbmhtVDVNUHlxczcvOHRXMEJzTGlNT3dH?=
 =?utf-8?B?VG1pVml4bm5ONUNBWWlOUmZNYWEvRWI5SU1qWDMvdWFNSStCMXJ6VU5FTjJv?=
 =?utf-8?B?VHhhdlpxTFk5dVFnZFBXY3R0MmF5T0d3dVZVWFlYMHRONUpFR2lwM0l5ckFH?=
 =?utf-8?B?elltdUtYQURNZU9uRklyM1NNenQ5VXdrWUNVZEJ3MWtwTW81Sng3ZDFIbVgy?=
 =?utf-8?B?bUh1QmRuMHFtSm5vc1E4b29UUFgyc0pkN1pDT1FQd3dTZzJoSlNVay9tcjVH?=
 =?utf-8?B?eERVblVjYzV0MXdOWElkSVpYL1dSakFLWGQyc1cxL2NSZ3VRbUNGeDhtMmJj?=
 =?utf-8?B?Vm5oeVBZR3QvY2g0SS93ZHRrVkVxL1pINWEzUkVmcVBid1ppeGRUaCtHUGg3?=
 =?utf-8?B?RXp6N2dtQUZJbzBsbCtKSWpWQW1hWjNyQWJOV04rcHErbUU3TkVSeGJLWnhk?=
 =?utf-8?B?R0hEUzl0Q2l2RGpuREE2b0tvdEhvOW96Y252QXFkaDZVZndLaG8xajF6UDMy?=
 =?utf-8?B?andhV2QxeUsyVmlkSnorYk5iUm5kMEtBSkRPTDFuNEVNY2J4emQrS1Ivc05R?=
 =?utf-8?B?a1Bja2lDRU53UG01VHlnbmdLS1N6Mkw3NHY1YS9YYTVWV2d2NHZrS2Q5QmFz?=
 =?utf-8?B?TVArUXJlNGgvdHBBVlUxMXJhYmNyUFRLVHN4a3d2N1lrekpnL0pRS09NQmM5?=
 =?utf-8?B?VDdoVFFHTHVCZkxuN0RWM0hIcjU1SDc0NTJJTWp0aUl1dGlZajByL3NZaVZh?=
 =?utf-8?B?cjUvUHNOL25EYlU3aGtHYjc1aFE5b1ZuekVJbWNrRFh1aEdiSEdiZXJ1Q21k?=
 =?utf-8?B?eldaYkVFblM3TVk0enFQUHZDY2I1OEFjTm1ISEVMbFNrZ0NENHZQWmljNS8z?=
 =?utf-8?B?aW1VNlZQM2dkOTkrL0dmTFlLSWh3VmtEWVUxaDNtaG5Dc2ZWM3prRlMzUVFs?=
 =?utf-8?B?WFpDOWR3Vm8rWVJnMlpXOXBKR0hUMWdtZWk3enEyekdFenRRd3pPVzR2Zk94?=
 =?utf-8?B?YndGZ1hJTUJvMGxNelNFYUdzVEZ6TlNHeHgrcWFDMjQ5bU5Ub0k5b2RqWTVG?=
 =?utf-8?B?MVk4QmtMQ2k3MEFMSVVhdE5XQUFrRGJRNVlWNVozU0ZxdTRoMzFiakI4UGpC?=
 =?utf-8?B?QkVmM1VieWRjbDlzbGpjZzFYK2JVWUYyT2pydFF4dFZZTGRQTi9SM3VGVmRX?=
 =?utf-8?Q?1q+YxY58400=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFtdFAvWXp2djkrdUhoN2V4WVpoNjAvRnNuNFFDb1NGLzhiMEZ1OFg3RWpm?=
 =?utf-8?B?c3NDdWVTVVBtMFJFVVlpM2RvaU1VQ1pHRHR0K0lWRWliRWtreFRoSEtlMU1R?=
 =?utf-8?B?bDdLYytVY1pGN01nd2Q4a013ODhZQW5DMGh3WUFOT3p0VGlIOFpVUGlJV0Rj?=
 =?utf-8?B?aWNkd0VQVmhPQXFBdCsrOTVvRUIyTjA1Ukh6M2ZSRlY0cmtaWG5lNHRwZ3ps?=
 =?utf-8?B?QUpwd3kyZlFPL21RaW0rMDJUVTFpVzY5TDFVN0twUXhGejVTODZwNFRrelBp?=
 =?utf-8?B?ckU3OFB2NnRZaWsvWjRJd0NuQXhUSFY3UkgrTDhUVTlyeUVudGhRZk9kOHU2?=
 =?utf-8?B?RUF5YXZaVmZZbHBvalp5V3Z2RlZva2VnaU1xMFZQaDNaTVRJMVpVLzVGWEI2?=
 =?utf-8?B?aGVaelU3R3dwSURac0YzYi9XTStZWDVJa3FHdWljSUNJelpUbUxrYlNGVFM2?=
 =?utf-8?B?ZFM1R2tjL0ZQTGRGYlN0WkduVmRKQzFtajZkYzFabG5vUVRSeE1QL3U0Zm1q?=
 =?utf-8?B?ZmIzUlhZTnJSWVY1VzJwL3M0SmptZXpaYkIwYXdMcmFqa0NUZXprdUJiNjNj?=
 =?utf-8?B?a3hwaGEwMWp1UE45SGFpSG5tN2Q1Yy94RThqNzhQclg5ODNPSWNBakxmM0Rx?=
 =?utf-8?B?eDJHTiszelJYV1RYVDVVOHhvUXkrNFdaZy8zSjRwV2hEN1ZIcHpUZTNLRXk2?=
 =?utf-8?B?QmZmWHpNamRYQllEM3Y0ODVyNlZhdFFPK1BqRkNOdVc4UFJpdFRITHl2MnBW?=
 =?utf-8?B?ZWdBYUhHNDk0TlExeDR0QUFzeGtmVHpRM21LRlRqcVlIMW1CVUxROWZ2aFpU?=
 =?utf-8?B?QjBFZFA3ZWVBdEdCclVFMUhYd09SV2tUazhVY2Vlb0NLTEc1M2tqclBLbVdL?=
 =?utf-8?B?dHR6VkJxT0JseGxRazVLK2FyZXhWSTRCSnl6QWdJQnhWUDRUb1pNdnFzbW9J?=
 =?utf-8?B?VEVkMU1BU0gwdW5jOUVldm5VOWdzNXZKUlhjaUdNN2lFZ2x3T01RVVJ5Rkkx?=
 =?utf-8?B?RTFWT3RHRTJuWXJETng3SHNoTGdyQzNSdjB6TG9BeEt1dFN0b1FwanllaUtU?=
 =?utf-8?B?S2JFRStMTEpFZTFEcDRVMzhuWlZXdWxpeURkTXRhUkZDa2NXMU1BU1NNN09Q?=
 =?utf-8?B?TXgzZHZnS3NwRHJlUUhHK0c1V3FkODMrOTVKdGgrSXhKZHhIZW5sTFFVL2RG?=
 =?utf-8?B?Q05QVkNoRUdxSzBXT2x6WVcxZkZ5bDg1cjFTSnkvMXNLaDBjdTdQSDZLUkkx?=
 =?utf-8?B?SU9paWdkSTZtWC8rZmhSWUFJRnQ1RDB3WWVneWIxNHNUWkJpVS9Ed25hVjJM?=
 =?utf-8?B?UkNwdHQyWjF6VkhoY3BCSG1XVy9CK1Z6ZjBTaHRPYU80STg0eXZkQ1dGR1lL?=
 =?utf-8?B?QUNlZzNFOWxyQ2I0TVRaV0pxYmY3SG1senFSWWYzT0tGZHdWd0doVThrTHJj?=
 =?utf-8?B?N3c1STVJbTRuUHV3enQxZHdqV2FEOGF4Uy9mZVBOSXVhelE1S29WUEhsc1dp?=
 =?utf-8?B?T2JqV3BpZnZic3ZIblhlNEVxaGt6MXp6MGdxZVF1Uy8wN0p3ZUVETXJMQ2hU?=
 =?utf-8?B?UnBoeXVUYkdoeVdCN24wWXdlVHE2MldHcWI4ZnFZTnBYUnZCK0RKaHhoVmpt?=
 =?utf-8?B?ZGVUTXpqbWhleDE5QTd4T0NlU0NBT0dFRFdPd1RNR1NiL3V1YXQydWZVdVlB?=
 =?utf-8?B?T3FqaUN1b0N1KzdYb0VEbzVHOU1va3N5U1pWd2JsczdSQ2NMd0QraTMrYTVr?=
 =?utf-8?B?R3ZXK0VpUjI0R09FUi81QmlwYU41K0ViVUdOZENhbERRWStORGt3WXZwYjJO?=
 =?utf-8?B?T0RUTGUvSTh2d3BQU250MmpBRGNEdU13VkVKZklpa1Z5VTVLcmZlZW5ablBT?=
 =?utf-8?B?eUIxTFRlWWNKQ243aXk3T09OVzVrREgrNXN1TldCOVFKS3VXNUdGbjFtMnFv?=
 =?utf-8?B?N0R6akpGQlRZbytzcDZuWUpieHJCVTBnZFFQejZQQkJJYlkrUUpRQi9NeTJG?=
 =?utf-8?B?R1JVc2JobDFJbEkydVZiNDl5dlJ2ZlUwN2NLM1BCaVBLVVNWTHprWXBNZ2pq?=
 =?utf-8?B?YXo4TmZMR2cyempyNjQyU1BTREhWYUtWdmVKUUJWQmpVWkpXNTh0c2Z3NnVQ?=
 =?utf-8?B?ZWpDM3pweHRLbExlb3FySGpja3I0SEN4KzlIMkR1YlM3VzlhUjc5WXZZOWNG?=
 =?utf-8?Q?5hsLt5XR4S/MGHP2pFimJHk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a66e0b-0b80-410f-e6e1-08dda9f81f5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 21:28:50.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdkz0yx21DHD7qHpvyZROLo3NrLo55kYfD3Pqw9zhkspsU3NPWLGEMgiOYDrwiO6D6WBk44CrOjKNi70uNaCrjAVwqv5tpUr0Nth5fUVwKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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



On 6/6/2025 10:57 AM, Badal Nilawar wrote:
> Introduce a debug filesystem node to disable late binding fw reload
> during the system or runtime resume. This is intended for situations
> where the late binding fw needs to be loaded from user mode.

Can you clarify a bit what the use-case here is? Because this 
description makes it sound like this is something a user might want to 
do, but the debugfs interface is for testing only. If we only need this 
for testing, please specify so.

>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c            | 42 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  5 ++-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
>   3 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..1c145089d177 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -226,6 +226,45 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	char buf[32];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	u32 uval;
> +	ssize_t ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> +	if (ret)
> +		return ret;
> +
> +	if (uval > 1)
> +		return -EINVAL;
> +
> +	late_bind->disable = (uval == 1) ? true : false;

nit: could do

late_bind->disable = !!uval;

> +
> +	return size;
> +}
> +
> +static const struct file_operations disable_late_binding_fops = {
> +	.owner = THIS_MODULE,
> +	.read = disable_late_binding_show,
> +	.write = disable_late_binding_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +288,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("disable_late_binding", 0600, root, xe,
> +			    &disable_late_binding_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index d69f950bddd2..f9d3d0f341f2 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -123,11 +123,14 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>   	if (!late_bind->component_added)
>   		return -EINVAL;
>   
> +	if (late_bind->disable)
> +		return 0;
> +
>   	lbfw = &late_bind->late_bind_fw;
>   	if (lbfw->valid) {
>   		drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
>   			fw_type_to_name[lbfw->type]);
> -			queue_work(late_bind->wq, &lbfw->work);
> +		queue_work(late_bind->wq, &lbfw->work);

This seems to be a fix for a broken indent in a previous patch in the 
series, so it should be moved to that patch.

Daniele

>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 690680e8ff22..6f4a945ca236 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -76,6 +76,9 @@ struct xe_late_bind {
>   	struct xe_late_bind_fw late_bind_fw;
>   	/** @late_bind.wq: workqueue to submit request to download late bind blob */
>   	struct workqueue_struct *wq;
> +
> +	/** @late_bind.disable to block late binding reload during pm resume flow*/
> +	bool disable;
>   };
>   
>   #endif

