Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99138C7E9A
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 00:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEEE10E2FE;
	Thu, 16 May 2024 22:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4pEWJ0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C4810E084;
 Thu, 16 May 2024 22:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715900205; x=1747436205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PypK7yUmTkFdyszXQZfMOLj9CrnJ3WKvoNZjtxe3PbQ=;
 b=P4pEWJ0CG52afMCRKbEOX9qjJtCIi9gS+ppznVgeEB8gdWl317o4IRe6
 fRlv4AWRLZ26p3QDTd1gBhND1fN+Cyom0U+MrWIHIGkxuCLCnaOwFRzIn
 w/EbIEbBptan9kv7cynn8F8nG4YZjmhk89nsoP3sSxn2Ceozh7gx+0dPh
 z81iF/HODS2SKkg9r84EopBBuJ0mpp4r2Yb4+pREZDz2bEaM/ePyX8CrL
 +NBY6oCaf/LFPS+FC0ejWq+mffuPy+HRnmHaRfqEX5UDleHsQ2MQYcMmA
 dob9IcetGO2MphZuj569Yxnf8odwJ/yJny/x9fI6oLXJJjSrAY4Ng+dDJ w==;
X-CSE-ConnectionGUID: WKR/dwMPQq+fxBpwcn/bwQ==
X-CSE-MsgGUID: hiaKav72R8eTPVMoyA/NTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22728887"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="22728887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 15:56:44 -0700
X-CSE-ConnectionGUID: x6fKR1baSF+FeUz1khjaCg==
X-CSE-MsgGUID: ToB/StwvT0WCGcKvcYqvWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32127750"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 15:56:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 15:56:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 15:56:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 15:56:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 15:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyRAH5Gydk+xAO9oxLB6cBH2ai96FEWGEeJ8Zs6gyZdlswEDt/y3VL1qhE1vyCFCxEiWwZ45uc4ixhkKJoDbpt//jvzsE/YtdyJTigVDSnunfcNc7ZtG3Q/7UhfnRZiU0ZCbyel/Cw6kLjjWbxeoTebkGXqIJ9TlbDIvzx3Xujao+T/LLF9/UXQ9a8IQLa9xIjUYJpauz/rFBN1DJik6x96G+KjQBxiE53klJtxJGrgPTlxanHcCD8TnpX/845FVeetWKdm4XOOUX09xxiDwgm7t1RXHl+TvZQOpkJMUD9NFeTD7znDxDZgSEezKfM5ocuqTHYKeZLXUkZGm79F0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AslLKwGx5FsvW5QCcexwbPVGPJGsZJ8pcurPMjIxC2E=;
 b=LaFHjWEJrCBbsLaGgsHyKc3s9+i4eoxOF4QbIXdeUb965fKRobqFq7FtqWqMGBLLsSPKML6vbGrIZ6g/e4KWC9zhfgNzDRMCp0yj3mmUhnqxDKNwiGFxxAeHpK8604LVc1NSwPzkkbCgUShKuuHIlCtZ5cA1W6nrSibe9r2dnsZHnydMnzFJY+9PX+3NpN6HK0Xr9eDncrKMxKKBvePjYyMQmP23m03r+XvcnlK/YQJ2yxq+qFip3fIpequOKemsLnuRdCM2aLG4Y6nHGp3PDSxAa7OKeuLHPuht+xlwSqam4HetzmIlKDls+87vtQE3/NGF1T1JdZ8GA7GBiQeMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 22:56:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 22:56:36 +0000
Date: Thu, 16 May 2024 15:56:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Message-ID: <ZkaPIrUEvTQDXcM3@orsosgc001>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-7-lucas.demarchi@intel.com>
 <ZkZRkhrAZ+0K6MZe@orsosgc001>
 <ogiixrymyf5t3tvmm52ltvm6a5erz5njgnuuwuxfzhitw3y6me@okrskpnngkoy>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ogiixrymyf5t3tvmm52ltvm6a5erz5njgnuuwuxfzhitw3y6me@okrskpnngkoy>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5cf88b-eeb4-4080-a09c-08dc75fb703b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUhrSGR4YVJ4b3poRDdHSnJFNDBKUGZpRFV1THRvbWg1eDJJSTlGVTFHMnNG?=
 =?utf-8?B?VHB2aVpNWU5FSGFvSmJzazIvdU4wK0lKK0xSOXhTc0hCSmtDYXB2SS9nOGJF?=
 =?utf-8?B?UW9FYUtsTFFNRzdydzRRc09oamlFQTZxeUN0aUl5TGFMVGFia1RHSENHOUx6?=
 =?utf-8?B?RCtYLzZGUVBkd0loTGNaS01LUlduMjJPcUR0ZzdZUHBjZUp2SDNxTW9XMHhS?=
 =?utf-8?B?MkxsUnUyRHR5Q08wUWxFWm5CcDZwVDBXd0I2ZWgxbitjQ29VenJraGVpRzBD?=
 =?utf-8?B?K0lHSWwvR0lnejNhZzR6K1NIOFdnb1M2YUp6Ti9vNkh3SFJ4NDhpSVkyTVBz?=
 =?utf-8?B?RGlnY3J1aTNLc1dCZ1oyT0YwaEU3N3ozdTlMMXBNOVZ4Tm1NSDB0QWNaaXdY?=
 =?utf-8?B?U2EwYWhkUXo0UHM2dTI5dk9iQkJyOVhXZjVoSFp2eGtVVEVBV2tIbzlnMkhN?=
 =?utf-8?B?WnZlWUZvcHMxZEVTWTF5djFqM284WU92K2VXempLNGdBa09BMk9xSXpscUtw?=
 =?utf-8?B?S1pHVk5LWnRvUjBuZWNuVzJNWUhSVjZ4TWN2TDVkNGhDVHRlcmpkdkZIanZ3?=
 =?utf-8?B?L2xsa0hZVStjTnZxOWFFMG1Mb3Nad2o4cnZLU1BGdThiZzVxRjlZR3lQNk5v?=
 =?utf-8?B?UzY4ajRCV3NSREJmbEV5ZUtKWWJuK3ZJSkoxWUJIcytOa01RdmN3VDlGWThw?=
 =?utf-8?B?UC9xd29HMENRaTRFZTN0eDNMNmg1cWEyT3VJQjVScklvN0dTeVdidGxBODlM?=
 =?utf-8?B?SGVod3AvMUVOVXM0a1JVUGI2ZGE4bXRYMmtzaHByNWFMSTVna3g0UzRrUHZH?=
 =?utf-8?B?bGhrbFltSU4vRTloT1ljQTMrSEFzdWxxbWlETVBhMUtlK294U3c0T09KQ09R?=
 =?utf-8?B?eTVUcUdranFjaEJpNHlwcmZUVXA5cS94eUJRdlNwbXFrVzRWUE5zbGFnWDc3?=
 =?utf-8?B?QWNGNFhzRWN5L1pzUW82OVhHY2lZNlJTY3lxdjNzNG5KV1ZrTlEvU1dNSkZW?=
 =?utf-8?B?RHZhSWlQT1hFTmRhem4vTG40L2FrOTVycjBUUXB4SUdIODYzWFNGakkrNEc4?=
 =?utf-8?B?QUNrbXlGdElBYjV2N0p0WDc0UXBVUXQ2WDFWMmdxalJWdTdGWXU3akliNFZP?=
 =?utf-8?B?SlNZQklWenpqWEcvaVBRWGExd2RUWmZBbVgrdlZqUjFpT1dSY05LZjlaVFIx?=
 =?utf-8?B?Y0Fib0N6SDBOSVp5R1RNZ08vTC9hbVpxTnpNYkp2U2dwTU5UaWhuOFd4QmFO?=
 =?utf-8?B?Snd4OTVZUkYzWmRNK3B6aWQ4RmEycjIvajk3R2xDOUQ3UXBLL2Fudkt3ZEln?=
 =?utf-8?B?SmpRdVAwd2xNT20wOEV2NU81UkhKMFhLeTh0QUR1MXJQaHFUbVRUZitLY0k4?=
 =?utf-8?B?VzVydGZ0eWd1TnVSN24ycm9iMks2Tk5HVlNqT1RSMnB6REdDQ0dCOC9hV216?=
 =?utf-8?B?ZG5ob2o0Y2NwYlI5cU56NGt2bm00ZC8xZlh4WEM0RU1sQkpSbEFzR2MxOFEz?=
 =?utf-8?B?TW9UNERPUWZKTVBpT0IyUGV6cVJkbHgyU2lRcy8xYUpXRHlPblBHeUdLVlk1?=
 =?utf-8?B?alNtTUY3YTMyU1VSTzdMc0E5OUdjaGRGb295b24yancwTjFIUTA4ZnFqQkxC?=
 =?utf-8?B?VXBnaXJMSGlOWXZjeU8ya2xnZWJ4NGxSSjNOSnlyUEo3aWxETDkxNjBuVlJh?=
 =?utf-8?B?WEU3bUI0M2tCZFJJRGpGUC9FWEhwWmp6N0JrK0dQNVFFK3M4YWx1L0F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0psT0Z3TXdGTGU0ZVhlSUhxejVVYnlUdE16eFp6WWRqcHd2T2xpTEMyT3Rk?=
 =?utf-8?B?Y0FKYXlSSmV1Y0x3eSsvQXBOQWdwSUFyekhKcGJmUGtSNGRtUlFmL1RIWmZU?=
 =?utf-8?B?TmJ6SDIxeE5TbGNBSG5UNlpGMkc5RDIrZFBZcFNBZ0xUUDZaMGFLQXFsZ1oz?=
 =?utf-8?B?QktLVjlKVWc0cldMeUY3Sitjc0MvdHJZMHhJZm9TRHdMMmE4UC9uZkY3eHNv?=
 =?utf-8?B?TXMxTlhkbzhTMlA3UHErdWhIQzZ6MDZCSGR0TlB6M29wSVgvRUoveWtpYmtV?=
 =?utf-8?B?emE4NmVBK05QcllLWDhsbnJjaWkyamZSWHQ4TVh5ckpVQndOSXpNaEl6OG13?=
 =?utf-8?B?Z09WMkQrVHlCLzFQY29ISUxxMU9IR2FnTGtjYUs1RWdWcnozODROdC84MzBq?=
 =?utf-8?B?My9OVCt4QXBRSUdiVFNIK0Y3Rk9McTIwQVJBR05BZFJzTVVTWFpnZlhPcUhZ?=
 =?utf-8?B?cmVoQzJGTFUwS2hOOFVzaXQ4bnd5dDE3VEx3TWtuYXJMZ2RVR2RtWEFWT0xP?=
 =?utf-8?B?SXlwZ2lXaTVvUVpyckNHZmF6bnNqckk3U2JxRzdiRDVYTG9qYW40QnV5blhq?=
 =?utf-8?B?VWJ0ZER5QmhQdWxmUzFPS2I3b1MvWFh3SnROSjloeXRXOVFtM2tva0M1ejlj?=
 =?utf-8?B?TXd3dW5UMWJBRmRtZE43MmJ3UXdjNkJhUUtzeUhYQW96RlhuRXczL056by9R?=
 =?utf-8?B?NnNOL3NDR3UrdGFQSHRESXhxREM5SVQxKzVkRHowaGZ5VnlJR29za21vendG?=
 =?utf-8?B?TDR3RWN4OE52eFFrR2M2MWdjQ2tTVXI1bENFaGN3N0pNNUYwekx6OVdGKzFr?=
 =?utf-8?B?S3J6L3BEL2xmcGwwajZscTAwTzlDeEVhbXhwMEVVVkFmVkx4RVFrVUZ1L3FU?=
 =?utf-8?B?bW5rN1EvNk5aakFtRjliYmszRlVhejAwUGk5eEdMcUw4UUpnU1BmNWxtcnYz?=
 =?utf-8?B?SlRUekhHSkZOWGc4NFVxWnYrZlk1UlZpY2IyOHlNM2tVNUIvclpsdG1lZFZL?=
 =?utf-8?B?ZE9nZXJXbW5NaE9DdThGcUwwc3FRTmhIa0JFY3hNYnBiM1cxaE56WllFVzVh?=
 =?utf-8?B?T2loelpCREM1bjdSNmFkWlVzWi9wVWZyM1NsTkRCQmFTMnFZYVdZWEplekl2?=
 =?utf-8?B?N3lob3lEbGhwKzdVNmptOUpLZlN1RG5CRDBkQUY5aTZmaXNQcGg5eVNnT3di?=
 =?utf-8?B?d1hjM3NrLy91Q2hNd3lGa2pRblozTzVGMlN5MXI2eGx5aloxd1lxSk1OVFFa?=
 =?utf-8?B?WEgxRTc3RVB5L1o0bDlBdC92NTQ4Yi9WN2NXUUdGbGNUZFI0SVRlOW5BWk81?=
 =?utf-8?B?SW50MVFaN01rNUo3TndGenhBcUllSFQ3WTR3emowZExCM0hTNlAwT2thU0li?=
 =?utf-8?B?T3lyL0tySWZ5UE1hbG11V3Y3UDlqTnMrNG1Xd0swVnIrVDIzZ0l6Q1ZaWUNl?=
 =?utf-8?B?RFNCUUhnTDVqMVlGZmZldDdEelFJSEFSdCtKQm85RlRtd2RZdXphT0ZkVVVF?=
 =?utf-8?B?MG1VUkd5U0o3bHZsTFVGaEJia0Mrb1NYSmpYYllSR0wxWkZpc0V0RVVIdWl0?=
 =?utf-8?B?Rmdna3REWUVWVHhZZFR3anJpQzBVNDh4YWxoM3FZSnBLbSs5OGh6MU5wVUhB?=
 =?utf-8?B?WG1Yb1BXWEo0WGg1ZTM5MkJuL3E5WTNaRlRoM0ljc3AyQXQ2WVlFT25FTDVF?=
 =?utf-8?B?bC8vNUtVYVJSUGhYTDBPZGRJcG9zUjFXbnNTK3R0UEd5dlNoczRNYVRFWkU1?=
 =?utf-8?B?UXlRaEorQmZSNExUZ0RMTVhGVnVBRXV5d2FtTVRObjVkZGVVdXBueWVHb3hW?=
 =?utf-8?B?dUI3N1I1aG5KMVNJcmlDd0Y3S1hCY2lPcXBsa0F3Y0t2ZGVXaGdRNWtLN1Jk?=
 =?utf-8?B?TE1XTnFPNGhreG1GM3NBT0lUWTdBUUlWOW9rUDlhYjdlYi9TRUtzcjZJUER0?=
 =?utf-8?B?NUkrWFZXQXRuU2FIRk1YNXY5RHQ5NGxTeUxBRmJxcjhwMU5xSXN0b3FxQkty?=
 =?utf-8?B?dklydE1SWFZRU2phTW1pM1lGd2I4T2d5WWhicW5GUllUcTMvbzJXaVljbGdr?=
 =?utf-8?B?SzlEV0txaHprU0l5VitOa2tmVERjK2lEaFVGOWxLQ2xIOWVNSjhlYjViaTBM?=
 =?utf-8?B?WGNPekQ0ZWRkcUo5NDl3S0c4WUtpdk9WaktFUWNtTFNDcXk2SmJlWXhxbkZZ?=
 =?utf-8?Q?ucnLrxC3Ixo4DavjPB8ZYdk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5cf88b-eeb4-4080-a09c-08dc75fb703b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 22:56:36.1587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1+elXQqCr1PjjXdvPVBXaLsKDRpsi4mJqqnMC2fgU03U8f0pf6Fn2Gv9jemH2aWx2TLP81YjOhdzqVROOnyChGmtdDXSh0x6g5Tr/cD/yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
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

On Thu, May 16, 2024 at 02:52:01PM -0500, Lucas De Marchi wrote:
>On Thu, May 16, 2024 at 11:33:54AM GMT, Umesh Nerlige Ramappa wrote:
>>On Wed, May 15, 2024 at 02:42:56PM -0700, Lucas De Marchi wrote:
>>>gt->info.engine_mask used to indicate the available engines, but that
>>>is not always true anymore: some engines are reserved to kernel and some
>>>may be exposed as a single engine (e.g. with ccs_mode).
>>>
>>>Runtime changes only happen when no clients exist, so it's safe to cache
>>>the list of engines in the gt and update that when it's needed. This
>>>will help implementing per client engine utilization so this (mostly
>>>constant) information doesn't need to be re-calculated on every query.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Just a few questions below, otherwise this looks good as is:
>>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>>---
>>>drivers/gpu/drm/xe/xe_gt.c          | 23 +++++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_gt.h          | 13 +++++++++++++
>>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  1 +
>>>drivers/gpu/drm/xe/xe_gt_types.h    | 21 ++++++++++++++++++++-
>>>4 files changed, 57 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>index e69a03ddd255..5194a3d38e76 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>>@@ -560,9 +560,32 @@ int xe_gt_init(struct xe_gt *gt)
>>>	if (err)
>>>		return err;
>>>
>>>+	xe_gt_record_user_engines(gt);
>>>+
>>>	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>>}
>>>
>>>+void xe_gt_record_user_engines(struct xe_gt *gt)
>>>+{
>>>+	struct xe_hw_engine *hwe;
>>>+	enum xe_hw_engine_id id;
>>>+
>>>+	gt->user_engines.mask = 0;
>>>+	memset(gt->user_engines.instances_per_class, 0,
>>>+	       sizeof(gt->user_engines.instances_per_class));
>>>+
>>>+	for_each_hw_engine(hwe, gt, id) {
>>>+		if (xe_hw_engine_is_reserved(hwe))
>>>+			continue;
>>>+
>>>+		gt->user_engines.mask |= BIT_ULL(id);
>>>+		gt->user_engines.instances_per_class[hwe->class]++;
>>>+	}
>>>+
>>>+	xe_gt_assert(gt, (gt->user_engines.mask | gt->info.engine_mask)
>>>+		     == gt->info.engine_mask);
>>
>>I am not seeing a place where user_engines.mask is not a subset of 
>>info.engine_mask in the driver, so the above check will always be 
>>true.
>
>that's why it's an assert. user_engines.mask should always be a
>subset of info.engine_mask, otherwise something went terribly wrong.
>
>>
>>Did you mean to do and & instead of | above? That might make sense 
>>since then you are making sure that the user_engines are a subset of 
>>engine_mask.
>
>no, what I'm trying to assert is that user_engines.mask never has an
>engine that is not present in info.engine_mask. Example:
>
>	engine_mask       == 0b01
>	user_engines.mask == 0b11
>
>That should never happen and it should fail the assert.

oh, my bad, the assert looks correct.
>
>I decided to add the assert because I'm not deriving the
>user_engines.mask directly from the mask, but indirectly. Early on probe
>we setup the mask and create the hw_engine instances and we are
>calculating the user_engines.mask from there. I just wanted to make sure
>we don't screw up something in the middle that causes issues.
>
>>
>>>+}
>>>+
>>>static int do_gt_reset(struct xe_gt *gt)
>>>{
>>>	int err;
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>index 8474c50b1b30..ad3fd31e0a41 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>>@@ -38,6 +38,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt);
>>>int xe_gt_init_early(struct xe_gt *gt);
>>>int xe_gt_init(struct xe_gt *gt);
>>>int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>>+
>>>+/**
>>>+ * @xe_gt_record_user_engines - save data related to engines available to
>>>+ * usersapce
>>>+ * @gt: GT structure
>>>+ *
>>>+ * Walk the available HW engines from gt->info.engine_mask and calculate data
>>>+ * related to those engines that may be used by userspace. To be used whenever
>>>+ * available engines change in runtime (e.g. with ccs_mode) or during
>>
>>After the driver loads, do we expect ccs_mode to change dynamically 
>>based on some criteria OR is it a one time configuration at driver 
>>load?
>>
>>If former, can you provide an example where ccs_mode would change 
>>dynamically, just curious.
>
>it can be set via sysfs, but it blocks changing it if there are clients.
>For with display, it's easier to check by loading the driver with
>enable_display=0. Trying that on a DG2:
>
>	# modprobe xe enable_display=0
>	# exec 3<> /dev/dri/card1
>	# tail -n4 /proc/self/fdinfo/3
>	drm-cycles-bcs: 0
>	drm-total-cycles-bcs:   37728138157
>	drm-cycles-ccs: 0
>	drm-total-cycles-ccs:   37728138157
>	#
>	# exec 3<&-
>	# echo 2 > /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/ccs_mode
>	# exec 3<> /dev/dri/card1
>	# tail -n4 /proc/self/fdinfo/3
>	drm-total-cycles-bcs:   38260910526
>	drm-cycles-ccs: 0
>	drm-total-cycles-ccs:   38260910526
>	drm-engine-capacity-ccs:        2

makes sense, thanks,

Umesh
>
>thanks
>Lucas De Marchi
>
>>
>>Regards,
>>Umesh
>>
>>>+ * initialization
>>>+ */
>>>+void xe_gt_record_user_engines(struct xe_gt *gt);
>>>+
>>>void xe_gt_suspend_prepare(struct xe_gt *gt);
>>>int xe_gt_suspend(struct xe_gt *gt);
>>>int xe_gt_resume(struct xe_gt *gt);
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>index a34c9a24dafc..c36218f4f6c8 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>@@ -134,6 +134,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>>	if (gt->ccs_mode != num_engines) {
>>>		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>>>		gt->ccs_mode = num_engines;
>>>+		xe_gt_record_user_engines(gt);
>>>		xe_gt_reset_async(gt);
>>>	}
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>index 5a114fc9dde7..aaf2951749a6 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>@@ -112,7 +112,11 @@ struct xe_gt {
>>>		enum xe_gt_type type;
>>>		/** @info.reference_clock: clock frequency */
>>>		u32 reference_clock;
>>>-		/** @info.engine_mask: mask of engines present on GT */
>>>+		/**
>>>+		 * @info.engine_mask: mask of engines present on GT. Some of
>>>+		 * them may be reserved in runtime and not available for user.
>>>+		 * See @user_engines.mask
>>>+		 */
>>>		u64 engine_mask;
>>>		/** @info.gmdid: raw GMD_ID value from hardware */
>>>		u32 gmdid;
>>>@@ -365,6 +369,21 @@ struct xe_gt {
>>>		/** @wa_active.oob: bitmap with active OOB workaroudns */
>>>		unsigned long *oob;
>>>	} wa_active;
>>>+
>>>+	/** @user_engines: engines present in GT and available to userspace */
>>>+	struct {
>>>+		/**
>>>+		 * @mask: like @info->engine_mask, but take in consideration
>>>+		 * only engines available to userspace
>>>+		 */
>>>+		u64 mask;
>>>+
>>>+		/**
>>>+		 * @instances_per_class: aggregate per class the number of
>>>+		 * engines available to userspace
>>>+		 */
>>>+		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>>>+	} user_engines;
>>>};
>>>
>>>#endif
>>>-- 
>>>2.43.0
>>>
