Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EwLJ1RCgGmK5QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:21:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C652EC899F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9BA10E1DA;
	Mon,  2 Feb 2026 06:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmH6hiWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5147310E111;
 Mon,  2 Feb 2026 06:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013263; x=1801549263;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R8xBxR5wxu0t0UQbwm54WWu72vh6qR0gc59hyVOwTa8=;
 b=SmH6hiWFIZAebscmIKE9ehujJjyOAB8P0KDqU4d0Ui5smRSQ3gfuhjBr
 r9phGAnTChjtLCUnLtPoKFlfi8SxYIAvUqfF+k39ASddKdHy3lr8vWXln
 aKAJyz9qBmwSokLkVxzf0FO0h0tGM4NUFeYhSqYqg3u8XY7a8o/m0T2Z2
 WLQG7PWkOJSFUI+mpEyhz42PoKObOgpk0JGYlkgw56r8U6YcT3daLRXv7
 RMIzftobo4fOJgoxbwlNYR4jR44sxtBArUAk243BMT8QR2zKndu/dan8J
 TCiVEq8waafxt5xcPUEKMLqfcKPt7EyW3E1b/noYbdOfXForC8mcBrind A==;
X-CSE-ConnectionGUID: 1/U8W/7BR46jIZIxpSfOdw==
X-CSE-MsgGUID: +5RHCK3tTIORbIJmM3EBtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70184876"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70184876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:21:02 -0800
X-CSE-ConnectionGUID: A7sYeuU1Sj2IYQVETatJtQ==
X-CSE-MsgGUID: z4Mcy55yTciO/ngEOSeR0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209610786"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:21:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:21:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 22:21:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvIcTev9Rgc9t4cwiz+cKl4UZxPYrOjdJSPhzIomdeiNoM/eGD05DRtCxxgz812usX70wCWDIfeQueYGXLyJfiwdw3r+qJ5jFe81YTwEuKgxOIBL1ojKKTCvGsRzeGef/pgIDzxv7+xwEjapEdbYoPUKaLS1s9wWYVS3p9+p0zL0b0zqnHG7EorpqJVYFRvtou0EKPoU7A5/W1G3CI8/J50QPda8LN5J4P921MprXr6p8XJeJdEYRbz4ZEEKpQ1KvQp9URleV1RNjV08GmzaJNcjraDtx3FkbSdyKgkbSyE6qYhCvcpOK8AMKYdJ9eJw+kJdV5t3pnXBajWkeoGltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa+DMCixJuJPnkRHWOSTzJmaaO1PQYDB1dZRHysHW78=;
 b=juJz9+EKaN/hgOOKMvYVVih+Opk3pin7yWTXfoQweWaD03QCE74vkj97n7zqkVQiSfB6353kwK2/yx1Tm8ihDzpvDHVpG3cn3HwpTi2/OHm+BnTylRlTtqidIHfSIbRW35kuBkrOt4ByFJlxENX0+ZvHKtN0YbQYQTGpS6m/szgsR8Z9Q5Nqkj3R3YYmVdtJSNk8pbxGO9NL6PgUrhdSIySfIlqpaQ7Fhda2JPl4gBv7AX7OoMKn9suMU99yOtBMvxk62UJd6v16OToWh9EubkSm1IpiRYToP/p7DeJPxcxoyJmHW9qCfdRvCFbKcWJW2SCk0lzoCjHJlz+9xCrhYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 06:20:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:20:53 +0000
Message-ID: <4436ae18-a66e-4943-ae8d-3037f48f3790@intel.com>
Date: Mon, 2 Feb 2026 11:50:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-7-riana.tauro@intel.com>
 <c69aefb3-9aca-46ae-a213-dfbbafc13aa2@oss.qualcomm.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <c69aefb3-9aca-46ae-a213-dfbbafc13aa2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ccbb9ec-6299-479c-2951-08de6223376b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UldDaVhleWxZaXVWU2JxQkZyU0ZieHJrRWJLeWZjWGpsRm9jcFFvbVF2dmRM?=
 =?utf-8?B?d2JiNkRLdjNUc3BCalpZZ3Znd0M4S1lqcExaWjIrdjZISENTUFI0cjgweWp6?=
 =?utf-8?B?QzU1L3J2eDNLK2JpckNLdmh0Z3FjRTNTVUxrUVRMakR6Z1hSWTByVmpHNXlN?=
 =?utf-8?B?dUh2RmJVVEtPcDZ4K1V3aUQ4UE9YOEF3UVNteC9LcWhwVGh4NnBUUUpRejJJ?=
 =?utf-8?B?emNVNVhJQkJpRFd6K0tPdDlEN3JnOUJjbEtueENPNURwNlZSK3M3QkZQQU5B?=
 =?utf-8?B?Tjh1VWhxcXp0UW50YTZHTHpuRG5wTzk1NWFxb09jSlFLUnJRZGI5ZHEwQXEw?=
 =?utf-8?B?LzRqdjVzalJxaFpQQU0xS2Qvdjh0TTVpWDQ1ejZWMXJkRVRnZVRWYnFkZmc3?=
 =?utf-8?B?a3VLQjMvWkE0YWdCTkJjb3I0bVpPWG5ENkJ6Y2ozMXZUVTNVK2FWaUlFckZu?=
 =?utf-8?B?QWNqNHZBQnA0Nm5qN2N1NEFFNlI2SVNCSTBpdVAwQlJUQVpSNXJ2K2JvRDdq?=
 =?utf-8?B?cWIzN3FhWjY5TDBsOUtyVUc1WXJEQ1M4cWNwdHRueCtTM20xYnNXU21rRVQv?=
 =?utf-8?B?MWh2dGMvdmh5MmpCdUVySlR6aUg0TXd6N1dla1ZMNjFEWklRRU44UUNwQzBv?=
 =?utf-8?B?aGhBdFJSTUo0dStzQ1o0ODliQXg3TmtFZHZOeEVseWRRTDRLRkFaODA1VGkr?=
 =?utf-8?B?ZU9HUjV4cnljWUV2MU9udUFYZDB0UXVwWWJpOFlEakFwOFJEMlFlUW9tR2wz?=
 =?utf-8?B?TkJtS2E4aDBwa1RPdDY0cDcvL3JDUW13b2JIc2d2ajNUZzgyOEZsdG9NSHB6?=
 =?utf-8?B?c0VLaXQvbUF2YUQyNGF0VFIrdUtFaVZWZUloaGRBaWNVTDRCc2dNQ245MU50?=
 =?utf-8?B?ejNnU3d3ZnJUeGI4bzh3eUhQaXJYN0pRRjJYRjlUN1cvb01sc0N6NWVqZ3Q3?=
 =?utf-8?B?RTdMTnA3WjNSMFNxdDhMUWp3UmMxbGFoalczUmhlZ3BTVnU4bUlHRW5NY2J5?=
 =?utf-8?B?dENXZnEreHdKdnJzU1liSFhSSWdHSEFHeGV1cWluTmxqNGMrdFV2ZGI1ckJq?=
 =?utf-8?B?T1NQc0tvWVBRTVFQSW00d012WXBCWUJTNzNUWnJSdkh6ZnU2L3pkRWN6ZUdk?=
 =?utf-8?B?cStsemJhd0pRL2ttNGpoUjk1QkM3WEVuakZXY1FkUGdSd01aUUgwN0xyWnNM?=
 =?utf-8?B?OW5yeWVkQzVwTHIyTWxlZi9YbXVJSU80UUFtdzBlRk5HVWp0ekY4cGhkcUk0?=
 =?utf-8?B?K1lXeXhHY2Mzai9TMXdzd0lXNnVNTW16KzlRZHpLNUJDMzlUTnZrRkh1cDNS?=
 =?utf-8?B?aXp4NGNxbWFYcHoxWlcrMXI1NDlpS2M5VmNqVzNWSmdTUC9sVVIzM093UlVj?=
 =?utf-8?B?TkZ1TFlXLzlYeCsxamQ1TEtGUTJkR25KM1BXdFRLYlFvNnk1OXZONkJLRUxT?=
 =?utf-8?B?eUt4bzRWdXk3SzNXNlZrNGgvM1pLUXFxVDVQNXZnWk11SXg4TWJnQ0VtdEVU?=
 =?utf-8?B?bThzcjh6UWhOU0diNFBQTUNvWHpPU3BkR3A5VFQvZndEMGk5bnFVSkhTc3lZ?=
 =?utf-8?B?WDBPTTNUc1JFUlVoVFlMSVBDb21KL0h4UE92Tks4Y096QmxsUkZzOGlsVk01?=
 =?utf-8?B?NlFMTlhOOW1YUG1kelJMTCs2TkRaWkluRjJpRUcyUkFpa1NWME9jNGozRndU?=
 =?utf-8?B?ZURFTzRGQ1gzYUxKWTdia0sybHR0cmtVZkt5cnErZXFNL2dnNGxmb0o4KzJI?=
 =?utf-8?B?eVF6cnJ6TGEwYUxxVGx0bnBPb2ppbWZ0dmIzZFZvbnFxZzVSenJiaHpOWkFW?=
 =?utf-8?B?ekxZY3g5WmZqejNNNnRBa3pVU0xLT014YWpqbi9lbG54NUYvZUYvSlVVdlRR?=
 =?utf-8?B?Tzc2OWl5Qm1Qb1FNU3IrWjdObFlwQkVsQVVncHJqcnF1NGtUbnBiVkdJajRa?=
 =?utf-8?B?WVEzRC9GTGxKRi82SDMzWmIxRjk0cWpMK3V3UHBwQmN0L0x3T25PQlp4WVYx?=
 =?utf-8?B?RFVLWmVOdFlGT1JUV0ZWMkNSQkUxbU5QbTVDQ3B5djBLaTk3bWtJVEZtRDFv?=
 =?utf-8?B?aVk5ZHZZdGlicGs0cjBuS1c2QThuSlVUY2lMV09IVlVZUnRKL0hvRlhYVW9y?=
 =?utf-8?Q?rtWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHMrbFVIbnJqbEVDVmFmRmdCalV6LzFFakkwT0wreW95TkVYY2xBU09uT0pC?=
 =?utf-8?B?bUJUWWFFV3hjNlpVUEh2KzJpWkJUUHhlQjk1RXFNYlBpUVU5azZyM01YWEZ1?=
 =?utf-8?B?c3o0NFBnZ095d0pIaHV6RUsxNG0vK0tXQ2xJMHM0Tm9zUjRqbFpVODBwc2xP?=
 =?utf-8?B?UTRtVEp4VGJER3pUTGhtM1VCT0xqK0doWG0yVnNmK1BNREZ5VUJCVWhZcHhO?=
 =?utf-8?B?Q2tZa0h5QXZic1owNTBBaFhLT3VGSVQvOFlhTE82MkJQUlNtQzcyckFCZ2VC?=
 =?utf-8?B?T3RMdzNkQk1OdEZqMFJKSkdPdGRHZzBZRGVESlQwbWR0c3h4cHhLUFBOTDNx?=
 =?utf-8?B?ajVwQXBkWkNFTkRvR05ORExweEkwNDh0cktiODlabkhZZ3luamVGOXJRa3g3?=
 =?utf-8?B?YXNVRnJUZHR0bFNtRy9raVBLaVFlcEVnSG1ZS1lYbk1maGgzUXkyc2xYN1dk?=
 =?utf-8?B?cmxRek9YY3U1RG05bmdFQmI0S0JpVkhHMVJVL3R6SlowbEZ2RjNWdmd1MEta?=
 =?utf-8?B?dnlZYytYR2oyM0huSlovMVJTWU1zLzFTR3hKR3NVczFwbU55djZJblJFVkJ5?=
 =?utf-8?B?VVdMYXY0amZwWC9uemNuTGFsTk9oR25zbXE0WnRWV3Ivd3Q1aUFpaTdtN0s1?=
 =?utf-8?B?TEZtZGVuOWdLNjJQWVF3NDhRTElwekVxZUVkc21jdUt0STR6bHNWTVB3S2pG?=
 =?utf-8?B?TmdERGg0b1NrbDdHb1Vvbjl1SGRrRDBCWFVraE1zZS9VVmt4Q2JWWmdrUlBs?=
 =?utf-8?B?YTBrdUNmZ1hNOGRyNENZSWtCdDVYdTBuQWs3MG5hOTBzWWw2L0dKRGpCdkI3?=
 =?utf-8?B?Ym1JRlgrc2NQZDYwdkRlLzhZemg1R3lpYi9TQUJsZmh5aXlRdmsySEx0VGdJ?=
 =?utf-8?B?SGJZRHFyTUpKaDVPbDhTaktQQVcvUm91MlFRTk5oVFI0VXBHVEUwaXF0SE9k?=
 =?utf-8?B?d29jblpaUkZzaTU1RXRpa1NSdWc3TzJHTW1FUk1nNUpCdWRnckEycVNmK2E5?=
 =?utf-8?B?Mmc1NUtpdjk3MG5PTXZyemp3MC9aZmNydTRGWjZQZFpvbXUwaGtuRk1aRGMz?=
 =?utf-8?B?SGNEQlpiRmJRNlVlZ3dZa0RoYWxWbUFHQjVFL0tWZFVGRlRJS1NESWNEZWZv?=
 =?utf-8?B?REV5KzNwVGdtZHJYN3ZrOEh2clBCaW1lZVVpeUplT0Q2eWZ5TmhCeVVRbExa?=
 =?utf-8?B?WEdOT1FnREtacUJTSHRkVW1lQmd3RzhqRW04am1LQktpZnBYRmwycllhNWdo?=
 =?utf-8?B?QmgrbHdNUzk4WHdqS0sramNhVnJ2QmdlcjMxRmN4eTU1S2I3N2JsS3ZPdlZ4?=
 =?utf-8?B?VElDVUpDUVBiRXZHY2ZmOC9GOGdwcXc2TzIwcnBIN21DZFM0aktwbWVkbWtE?=
 =?utf-8?B?dXJTNVJUa1hpUVNVdktoWTZXQ0NnM24zUTJVeHBvb3k3QnNvSjcyYXdWbjV2?=
 =?utf-8?B?ZlQyTW1TRDgxcEJCcEpkeEl4TVhlLythT0FkZzU1aG8xZzJzRG5TVXFUeCt3?=
 =?utf-8?B?ak9qaktLeVJJeVBWUmViK1h6WVVGZ3pIOUNYYVViTmZtV2Z2dGYyVGhNa1di?=
 =?utf-8?B?T0U4TWFyZTNjdlpTTmhFZUJKOHF2TEdRZmxSZmpBWi91L25pVDdrNUxLVElS?=
 =?utf-8?B?UzZqY2JWR1Y2b2lxWkVmaXoyb3lvVE5iQjVwVEo0Mk9uUURjaGJqNG94cUNT?=
 =?utf-8?B?TFBXQUhOakdjREROU3VzT0g0Qm9BVFdTY0FsMDBiTTRoQ0FnRG1nYVp2TEJZ?=
 =?utf-8?B?WlBKTkRxb0pKLzJxdnhJd2Y3WUhTejRUU2p0b0JBZDhFTG9SQzRodnRTc1kz?=
 =?utf-8?B?RlU3VDlWaWJySmJna1NuVkVSc1Ard2FQdWpsWUh0dFZiOHhsK1Y3YWd0ZE5T?=
 =?utf-8?B?M2d0S0djUnNjWFVReFFUUzFzRzFLSFNYVGxma0YzTlRrTUcvNlcrdFdEb1BJ?=
 =?utf-8?B?RXVacHJOMmhsd1JkMXNCUXkxdFV6MWxYK3hGNzBYbGJYQ3pEZkhrRjNtMzBt?=
 =?utf-8?B?TzgrSitERUdFMng5bU1TWkVqTm1EaThKWUJkUXNQSWhhVEE4ZndwK3g0eXhx?=
 =?utf-8?B?djNsRzNmTHJqQXQyR0NPck04NTdRWlBlU3pEWldLRnpsL2RzbXhOd1V1VlNZ?=
 =?utf-8?B?eis1NlNlQVJEYXQwNFRsREpmcmpPVVM3a0o1dWdqOXYrdGN4UmJsdFozRlNj?=
 =?utf-8?B?R0ZyL1dabFZ2NzJvMld1MkZSSG5jK0MwbmVjYlZ2NUUweE1UQlA2elF3VnpH?=
 =?utf-8?B?aWtJNmdkNHJJSmVBTkEzSE1idDIyUjVHT2F4cjdlbDc1VEZZdStGNnA1QU9U?=
 =?utf-8?B?dUZPdktBZTRoSm4waU1vZ0RmeGx6c2tCd3JudVQzL2NWNEpUL1l1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccbb9ec-6299-479c-2951-08de6223376b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 06:20:52.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1QSGopKvgw+nDZnhk5phibK3qgoJNpRDD9lKipjLcUbT9ubZYIDb0uDfegWKllv7ZgLFvnWGxGh1Hpc0UmeYg==
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com,amd.com,kernel.org,davemloft.net,redhat.com,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,intel.com:dkim,intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C652EC899F
X-Rspamd-Action: no action



On 1/23/2026 3:21 AM, Zack McKevitt wrote:
> Hi Riana and Rodrigo,
> 
> Thanks for incorporating the various pieces of feedback. I think this 
> looks good from our end.
> 

Hi Zack

Thank you for the RB.

Riana

> Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> 
> Zack
> 
> On 1/18/2026 9:00 PM, Riana Tauro wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Introduces the DRM RAS infrastructure over generic netlink.
>>
>> The new interface allows drivers to expose RAS nodes and their
>> associated error counters to userspace in a structured and extensible
>> way. Each drm_ras node can register its own set of error counters, which
>> are then discoverable and queryable through netlink operations. This
>> lays the groundwork for reporting and managing hardware error states
>> in a unified manner across different DRM drivers.
>>
>> Currently is only supports error-counter nodes. But it can be
>> extended later.
>>
>> The registration is also no tied to any drm node, so it can be
>> used by accel devices as well.
>>
>> It uses the new and mandatory YAML description format stored in
>> Documentation/netlink/specs/. This forces a single generic netlink
>> family namespace for the entire drm: "drm-ras".
>> But multiple-endpoints are supported within the single family.
>>
>> Any modification to this API needs to be applied to
>> Documentation/netlink/specs/drm_ras.yaml before regenerating the
>> code:
>>
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>   Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>>   > include/uapi/drm/drm_ras.h
>>
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>   Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>>   > include/drm/drm_ras_nl.h
>>
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>   Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>>   > drivers/gpu/drm/drm_ras_nl.c
>>
>> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: David S. Miller <davem@davemloft.net>
>> Cc: Paolo Abeni <pabeni@redhat.com>
>> Cc: Eric Dumazet <edumazet@google.com>
>> Cc: netdev@vger.kernel.org
>> Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: fix doc and memory leak
>>      use xe_for_each_start
>>      use standard genlmsg_iput (Jakub Kicinski)
>>
>> v3: add documentation to index
>>      modify documentation to mention uAPI requirements (Rodrigo)
>>
>> v4: fix typo (Zack)
>> ---
>>   Documentation/gpu/drm-ras.rst            | 109 +++++++
>>   Documentation/gpu/index.rst              |   1 +
>>   Documentation/netlink/specs/drm_ras.yaml | 130 +++++++++
>>   drivers/gpu/drm/Kconfig                  |   9 +
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/drm_drv.c                |   6 +
>>   drivers/gpu/drm/drm_ras.c                | 351 +++++++++++++++++++++++
>>   drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>>   drivers/gpu/drm/drm_ras_nl.c             |  54 ++++
>>   include/drm/drm_ras.h                    |  76 +++++
>>   include/drm/drm_ras_genl_family.h        |  17 ++
>>   include/drm/drm_ras_nl.h                 |  24 ++
>>   include/uapi/drm/drm_ras.h               |  49 ++++
>>   13 files changed, 869 insertions(+)
>>   create mode 100644 Documentation/gpu/drm-ras.rst
>>   create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>>   create mode 100644 drivers/gpu/drm/drm_ras.c
>>   create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>>   create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>>   create mode 100644 include/drm/drm_ras.h
>>   create mode 100644 include/drm/drm_ras_genl_family.h
>>   create mode 100644 include/drm/drm_ras_nl.h
>>   create mode 100644 include/uapi/drm/drm_ras.h
>>
>> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm- 
>> ras.rst
>> new file mode 100644
>> index 000000000000..cec60cf5d17d
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-ras.rst
>> @@ -0,0 +1,109 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +
>> +============================
>> +DRM RAS over Generic Netlink
>> +============================
>> +
>> +The DRM RAS (Reliability, Availability, Serviceability) interface 
>> provides a
>> +standardized way for GPU/accelerator drivers to expose error counters 
>> and
>> +other reliability nodes to user space via Generic Netlink. This allows
>> +diagnostic tools, monitoring daemons, or test infrastructure to query 
>> hardware
>> +health in a uniform way across different DRM drivers.
>> +
>> +Key Goals:
>> +
>> +* Provide a standardized RAS solution for GPU and accelerator 
>> drivers, enabling
>> +  data center monitoring and reliability operations.
>> +* Implement a single drm-ras Generic Netlink family to meet modern 
>> Netlink YAML
>> +  specifications and centralize all RAS-related communication in one 
>> namespace.
>> +* Support a basic error counter interface, addressing the immediate, 
>> essential
>> +  monitoring needs.
>> +* Offer a flexible, future-proof interface that can be extended to 
>> support
>> +  additional types of RAS data in the future.
>> +* Allow multiple nodes per driver, enabling drivers to register separate
>> +  nodes for different IP blocks, sub-blocks, or other logical 
>> subdivisions
>> +  as applicable.
>> +
>> +Nodes
>> +=====
>> +
>> +Nodes are logical abstractions representing an error source or block 
>> within
>> +the device. Currently, only error counter nodes is supported.
>> +
>> +Drivers are responsible for registering and unregistering nodes via the
>> +`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
>> +
>> +Node Management
>> +-------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
>> +   :doc: DRM RAS Node Management
>> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
>> +   :internal:
>> +
>> +Generic Netlink Usage
>> +=====================
>> +
>> +The interface is implemented as a Generic Netlink family named ``drm- 
>> ras``.
>> +User space tools can:
>> +
>> +* List registered nodes with the ``get-nodes`` command.
>> +* List all error counters in an node with the ``get-error-counters`` 
>> command.
>> +* Query error counters using the ``query-error-counter`` command.
>> +
>> +YAML-based Interface
>> +--------------------
>> +
>> +The interface is described in a YAML specification:
>> +
>> +:ref:`Documentation/netlink/specs/drm_ras.yaml`
>> +
>> +This YAML is used to auto-generate user space bindings via
>> +``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of 
>> netlink
>> +attributes and operations.
>> +
>> +Usage Notes
>> +-----------
>> +
>> +* User space must first enumerate nodes to obtain their IDs.
>> +* Node IDs or Node names can be used for all further queries, such as 
>> error counters.
>> +* Error counters can be queried by either the Error ID or Error name.
>> +* Query Parameters should be defined as part of the uAPI to ensure 
>> user interface stability.
>> +* The interface supports future extension by adding new node types and
>> +  additional attributes.
>> +
>> +Example: List nodes using ynl
>> +
>> +.. code-block:: bash
>> +
>> +    sudo ynl --family drm_ras  --dump list-nodes
>> +    [{'device-name': '0000:03:00.0',
>> +    'node-id': 0,
>> +    'node-name': 'correctable-errors',
>> +    'node-type': 'error-counter'},
>> +    {'device-name': '0000:03:00.0',
>> +     'node-id': 1,
>> +    'node-name': 'nonfatal-errors',
>> +    'node-type': 'error-counter'},
>> +    {'device-name': '0000:03:00.0',
>> +    'node-id': 2,
>> +    'node-name': 'fatal-errors',
>> +    'node-type': 'error-counter'}]
>> +
>> +Example: List all error counters using ynl
>> +
>> +.. code-block:: bash
>> +
>> +
>> +   sudo ynl --family drm_ras  --dump get-error-counters --json 
>> '{"node-id":1}'
>> +   [{'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0},
>> +   {'error-id': 2, 'error-name': 'error_name_2', 'error-value': 0}]
>> +
>> +
>> +Example: Query an error counter for a given node
>> +
>> +.. code-block:: bash
>> +
>> +   sudo ynl --family drm_ras --do query-error-counter  --json 
>> '{"node-id":2, "error-id":1}'
>> +   {'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0}
>> +
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index 7dcb15850afd..60c73fdcfeed 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -9,6 +9,7 @@ GPU Driver Developer's Guide
>>      drm-mm
>>      drm-kms
>>      drm-kms-helpers
>> +   drm-ras
>>      drm-uapi
>>      drm-usage-stats
>>      driver-uapi
>> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/ 
>> netlink/specs/drm_ras.yaml
>> new file mode 100644
>> index 000000000000..be0e379c5bc9
>> --- /dev/null
>> +++ b/Documentation/netlink/specs/drm_ras.yaml
>> @@ -0,0 +1,130 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>> BSD-3-Clause)
>> +---
>> +name: drm-ras
>> +protocol: genetlink
>> +uapi-header: drm/drm_ras.h
>> +
>> +doc: >-
>> +  DRM RAS (Reliability, Availability, Serviceability) over Generic 
>> Netlink.
>> +  Provides a standardized mechanism for DRM drivers to register "nodes"
>> +  representing hardware/software components capable of reporting 
>> error counters.
>> +  Userspace tools can query the list of nodes or individual error 
>> counters
>> +  via the Generic Netlink interface.
>> +
>> +definitions:
>> +  -
>> +    type: enum
>> +    name: node-type
>> +    value-start: 1
>> +    entries: [error-counter]
>> +    doc: >-
>> +         Type of the node. Currently, only error-counter nodes are
>> +         supported, which expose reliability counters for a hardware/ 
>> software
>> +         component.
>> +
>> +attribute-sets:
>> +  -
>> +    name: node-attrs
>> +    attributes:
>> +      -
>> +        name: node-id
>> +        type: u32
>> +        doc: >-
>> +             Unique identifier for the node.
>> +             Assigned dynamically by the DRM RAS core upon registration.
>> +      -
>> +        name: device-name
>> +        type: string
>> +        doc: >-
>> +             Device name chosen by the driver at registration.
>> +             Can be a PCI BDF, UUID, or module name if unique.
>> +      -
>> +        name: node-name
>> +        type: string
>> +        doc: >-
>> +             Node name chosen by the driver at registration.
>> +             Can be an IP block name, or any name that identifies the
>> +             RAS node inside the device.
>> +      -
>> +        name: node-type
>> +        type: u32
>> +        doc: Type of this node, identifying its function.
>> +        enum: node-type
>> +  -
>> +    name: error-counter-attrs
>> +    attributes:
>> +      -
>> +        name: node-id
>> +        type: u32
>> +        doc:  Node ID targeted by this error counter operation.
>> +      -
>> +        name: error-id
>> +        type: u32
>> +        doc: Unique identifier for a specific error counter within an 
>> node.
>> +      -
>> +        name: error-name
>> +        type: string
>> +        doc: Name of the error.
>> +      -
>> +        name: error-value
>> +        type: u32
>> +        doc: Current value of the requested error counter.
>> +
>> +operations:
>> +  list:
>> +    -
>> +      name: list-nodes
>> +      doc: >-
>> +           Retrieve the full list of currently registered DRM RAS nodes.
>> +           Each node includes its dynamically assigned ID, name, and 
>> type.
>> +           **Important:** User space must call this operation first 
>> to obtain
>> +           the node IDs. These IDs are required for all subsequent
>> +           operations on nodes, such as querying error counters.
>> +      attribute-set: node-attrs
>> +      flags: [admin-perm]
>> +      dump:
>> +        reply:
>> +          attributes:
>> +            - node-id
>> +            - device-name
>> +            - node-name
>> +            - node-type
>> +    -
>> +      name: get-error-counters
>> +      doc: >-
>> +           Retrieve the full list of error counters for a given node.
>> +           The response include the id, the name, and even the current
>> +           value of each counter.
>> +      attribute-set: error-counter-attrs
>> +      flags: [admin-perm]
>> +      dump:
>> +        request:
>> +          attributes:
>> +            - node-id
>> +        reply:
>> +          attributes:
>> +            - error-id
>> +            - error-name
>> +            - error-value
>> +    -
>> +      name: query-error-counter
>> +      doc: >-
>> +           Query the information of a specific error counter for a 
>> given node.
>> +           Users must provide the node ID and the error counter ID.
>> +           The response contains the id, the name, and the current value
>> +           of the counter.
>> +      attribute-set: error-counter-attrs
>> +      flags: [admin-perm]
>> +      do:
>> +        request:
>> +          attributes:
>> +            - node-id
>> +            - error-id
>> +        reply:
>> +          attributes:
>> +            - error-id
>> +            - error-name
>> +            - error-value
>> +
>> +kernel-family:
>> +  headers: ["drm/drm_ras_nl.h"]
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index a33b90251530..f378e77048c8 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -130,6 +130,15 @@ config DRM_PANIC_SCREEN_QR_VERSION
>>         Smaller QR code are easier to read, but will contain less 
>> debugging
>>         data. Default is 40.
>> +config DRM_RAS
>> +    bool "DRM RAS support"
>> +    depends on DRM
>> +    help
>> +      Enables the DRM RAS (Reliability, Availability and Serviceability)
>> +      support for DRM drivers. This provides a Generic Netlink interface
>> +      for error reporting and queries.
>> +      If in doubt, say "N".
>> +
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"
>>       depends on STACKTRACE_SUPPORT
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 0deee72ef935..2eea3f54db53 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -95,6 +95,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>>   drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>>   drm-$(CONFIG_DRM_DRAW) += drm_draw.o
>>   drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
>> +drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
>>   obj-$(CONFIG_DRM)    += drm.o
>>   obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += 
>> drm_panel_orientation_quirks.o
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 2915118436ce..6b965c3d3307 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -53,6 +53,7 @@
>>   #include <drm/drm_panic.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_privacy_screen_machine.h>
>> +#include <drm/drm_ras_genl_family.h>
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>> @@ -1223,6 +1224,7 @@ static const struct file_operations 
>> drm_stub_fops = {
>>   static void drm_core_exit(void)
>>   {
>> +    drm_ras_genl_family_unregister();
>>       drm_privacy_screen_lookup_exit();
>>       drm_panic_exit();
>>       accel_core_exit();
>> @@ -1261,6 +1263,10 @@ static int __init drm_core_init(void)
>>       drm_privacy_screen_lookup_init();
>> +    ret = drm_ras_genl_family_register();
>> +    if (ret < 0)
>> +        goto error;
>> +
>>       drm_core_init_complete = true;
>>       DRM_DEBUG("Initialized\n");
>> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
>> new file mode 100644
>> index 000000000000..7bc77ea24fe2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_ras.c
>> @@ -0,0 +1,351 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/netdevice.h>
>> +#include <linux/xarray.h>
>> +#include <net/genetlink.h>
>> +
>> +#include <drm/drm_ras.h>
>> +
>> +/**
>> + * DOC: DRM RAS Node Management
>> + *
>> + * This module provides the infrastructure to manage RAS (Reliability,
>> + * Availability, and Serviceability) nodes for DRM drivers. Each
>> + * DRM driver may register one or more RAS nodes, which represent
>> + * logical components capable of reporting error counters and other
>> + * reliability metrics.
>> + *
>> + * The nodes are stored in a global xarray `drm_ras_xa` to allow
>> + * efficient lookup by ID. Nodes can be registered or unregistered
>> + * dynamically at runtime.
>> + *
>> + * A Generic Netlink family `drm_ras` exposes three main operations to
>> + * userspace:
>> + *
>> + * 1. LIST_NODES: Dump all currently registered RAS nodes.
>> + *    The user receives an array of node IDs, names, and types.
>> + *
>> + * 2. GET_ERROR_COUNTERS: Dump all error counters of a given node.
>> + *    The user receives an array of error IDs, names, and current value.
>> + *
>> + * 3. QUERY_ERROR_COUNTER: Query a specific error counter for a given 
>> node.
>> + *    Userspace must provide the node ID and the counter ID, and
>> + *    receives the ID, the error name, and its current value.
>> + *
>> + * Node registration:
>> + * - drm_ras_node_register(): Registers a new node and assigns
>> + *   it a unique ID in the xarray.
>> + * - drm_ras_node_unregister(): Removes a previously registered
>> + *   node from the xarray.
>> + *
>> + * Node type:
>> + * - ERROR_COUNTER:
>> + *     + Currently, only error counters are supported.
>> + *     + The driver must implement the query_error_counter() callback 
>> to provide
>> + *       the name and the value of the error counter.
>> + *     + The driver must provide a error_counter_range.last value 
>> informing the
>> + *       last valid error ID.
>> + *     + The driver can provide a error_counter_range.first value 
>> informing the
>> + *       frst valid error ID.
>> + *     + The error counters in the driver doesn't need to be 
>> contiguous, but the
>> + *       driver must return -ENOENT to the query_error_counter as an 
>> indication
>> + *       that the ID should be skipped and not listed in the netlink 
>> API.
>> + *
>> + * Netlink handlers:
>> + * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
>> + *   operation, iterating over the xarray.
>> + * - drm_ras_nl_get_error_counters_dumpit(): Implements the 
>> GET_ERROR_COUNTERS
>> + *   operation, iterating over the know valid error_counter_range.
>> + * - drm_ras_nl_query_error_counter_doit(): Implements the 
>> QUERY_ERROR_COUNTER
>> + *   operation, fetching a counter value from a specific node.
>> + */
>> +
>> +static DEFINE_XARRAY_ALLOC(drm_ras_xa);
>> +
>> +/*
>> + * The netlink callback context carries dump state across multiple 
>> dumpit calls
>> + */
>> +struct drm_ras_ctx {
>> +    /* Which xarray id to restart the dump from */
>> +    unsigned long restart;
>> +};
>> +
>> +/**
>> + * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
>> + * @skb: Netlink message buffer
>> + * @cb: Callback context for multi-part dumps
>> + *
>> + * Iterates over all registered RAS nodes in the global xarray and 
>> appends
>> + * their attributes (ID, name, type) to the given netlink message 
>> buffer.
>> + * Uses @cb->ctx to track progress in case the message buffer fills 
>> up, allowing
>> + * multi-part dump support. On buffer overflow, updates the context 
>> to resume
>> + * from the last node on the next invocation.
>> + *
>> + * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
>> + *          the buffer filled up (requires multi-part continuation), or
>> + *          a negative error code on failure.
>> + */
>> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
>> +                 struct netlink_callback *cb)
>> +{
>> +    const struct genl_info *info = genl_info_dump(cb);
>> +    struct drm_ras_ctx *ctx = (void *)cb->ctx;
>> +    struct drm_ras_node *node;
>> +    struct nlattr *hdr;
>> +    unsigned long id;
>> +    int ret;
>> +
>> +    xa_for_each_start(&drm_ras_xa, id, node, ctx->restart) {
>> +        hdr = genlmsg_iput(skb, info);
>> +        if (!hdr) {
>> +            ret = -EMSGSIZE;
>> +            break;
>> +        }
>> +
>> +        ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
>> +        if (ret) {
>> +            genlmsg_cancel(skb, hdr);
>> +            break;
>> +        }
>> +
>> +        ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>> +                     node->device_name);
>> +        if (ret) {
>> +            genlmsg_cancel(skb, hdr);
>> +            break;
>> +        }
>> +
>> +        ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>> +                     node->node_name);
>> +        if (ret) {
>> +            genlmsg_cancel(skb, hdr);
>> +            break;
>> +        }
>> +
>> +        ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>> +                  node->type);
>> +        if (ret) {
>> +            genlmsg_cancel(skb, hdr);
>> +            break;
>> +        }
>> +
>> +        genlmsg_end(skb, hdr);
>> +    }
>> +
>> +    if (ret == -EMSGSIZE)
>> +        ctx->restart = id;
>> +
>> +    return ret;
>> +}
>> +
>> +static int get_node_error_counter(u32 node_id, u32 error_id,
>> +                  const char **name, u32 *value)
>> +{
>> +    struct drm_ras_node *node;
>> +
>> +    node = xa_load(&drm_ras_xa, node_id);
>> +    if (!node || !node->query_error_counter)
>> +        return -ENOENT;
>> +
>> +    if (error_id < node->error_counter_range.first ||
>> +        error_id > node->error_counter_range.last)
>> +        return -EINVAL;
>> +
>> +    return node->query_error_counter(node, error_id, name, value);
>> +}
>> +
>> +static int msg_reply_value(struct sk_buff *msg, u32 error_id,
>> +               const char *error_name, u32 value)
>> +{
>> +    int ret;
>> +
>> +    ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, 
>> error_id);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>> +                 error_name);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>> +               value);
>> +}
>> +
>> +static int doit_reply_value(struct genl_info *info, u32 node_id,
>> +                u32 error_id)
>> +{
>> +    struct sk_buff *msg;
>> +    struct nlattr *hdr;
>> +    const char *error_name;
>> +    u32 value;
>> +    int ret;
>> +
>> +    msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    hdr = genlmsg_iput(msg, info);
>> +    if (!hdr) {
>> +        nlmsg_free(msg);
>> +        return -EMSGSIZE;
>> +    }
>> +
>> +    ret = get_node_error_counter(node_id, error_id,
>> +                     &error_name, &value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = msg_reply_value(msg, error_id, error_name, value);
>> +    if (ret) {
>> +        genlmsg_cancel(msg, hdr);
>> +        nlmsg_free(msg);
>> +        return ret;
>> +    }
>> +
>> +    genlmsg_end(msg, hdr);
>> +
>> +    return genlmsg_reply(msg, info);
>> +}
>> +
>> +/**
>> + * drm_ras_nl_get_error_counters_dumpit() - Dump all Error Counters
>> + * @skb: Netlink message buffer
>> + * @cb: Callback context for multi-part dumps
>> + *
>> + * Iterates over all error counters in a given Node and appends
>> + * their attributes (ID, name, value) to the given netlink message 
>> buffer.
>> + * Uses @cb->ctx to track progress in case the message buffer fills 
>> up, allowing
>> + * multi-part dump support. On buffer overflow, updates the context 
>> to resume
>> + * from the last node on the next invocation.
>> + *
>> + * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
>> + *          the buffer filled up (requires multi-part continuation), or
>> + *          a negative error code on failure.
>> + */
>> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
>> +                     struct netlink_callback *cb)
>> +{
>> +    const struct genl_info *info = genl_info_dump(cb);
>> +    struct drm_ras_ctx *ctx = (void *)cb->ctx;
>> +    struct drm_ras_node *node;
>> +    struct nlattr *hdr;
>> +    const char *error_name;
>> +    u32 node_id, error_id, value;
>> +    int ret;
>> +
>> +    if (!info->attrs || !info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
>> +        return -EINVAL;
>> +
>> +    node_id = nla_get_u32(info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
>> +
>> +    node = xa_load(&drm_ras_xa, node_id);
>> +    if (!node)
>> +        return -ENOENT;
>> +
>> +    for (error_id = max(node->error_counter_range.first, ctx->restart);
>> +         error_id <= node->error_counter_range.last;
>> +         error_id++) {
>> +        ret = get_node_error_counter(node_id, error_id,
>> +                         &error_name, &value);
>> +        /*
>> +         * For non-contiguous range, driver return -ENOENT as indication
>> +         * to skip this ID when listing all errors.
>> +         */
>> +        if (ret == -ENOENT)
>> +            continue;
>> +        if (ret)
>> +            return ret;
>> +
>> +        hdr = genlmsg_iput(skb, info);
>> +
>> +        if (!hdr) {
>> +            ret = -EMSGSIZE;
>> +            break;
>> +        }
>> +
>> +        ret = msg_reply_value(skb, error_id, error_name, value);
>> +        if (ret) {
>> +            genlmsg_cancel(skb, hdr);
>> +            break;
>> +        }
>> +
>> +        genlmsg_end(skb, hdr);
>> +    }
>> +
>> +    if (ret == -EMSGSIZE)
>> +        ctx->restart = error_id;
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * drm_ras_nl_query_error_counter_doit() - Query an error counter of 
>> an node
>> + * @skb: Netlink message buffer
>> + * @info: Generic Netlink info containing attributes of the request
>> + *
>> + * Extracts the node ID and error ID from the netlink attributes and
>> + * retrieves the current value of the corresponding error counter. 
>> Sends the
>> + * result back to the requesting user via the standard Genl reply.
>> + *
>> + * Return: 0 on success, or negative errno on failure.
>> + */
>> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
>> +                    struct genl_info *info)
>> +{
>> +    u32 node_id, error_id;
>> +
>> +    if (!info->attrs ||
>> +        !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
>> +        !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
>> +        return -EINVAL;
>> +
>> +    node_id = nla_get_u32(info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
>> +    error_id = nla_get_u32(info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
>> +
>> +    return doit_reply_value(info, node_id, error_id);
>> +}
>> +
>> +/**
>> + * drm_ras_node_register() - Register a new RAS node
>> + * @node: Node structure to register
>> + *
>> + * Adds the given RAS node to the global node xarray and assigns it
>> + * a unique ID. Both @node->name and @node->type must be valid.
>> + *
>> + * Return: 0 on success, or negative errno on failure:
>> + */
>> +int drm_ras_node_register(struct drm_ras_node *node)
>> +{
>> +    if (!node->device_name || !node->node_name)
>> +        return -EINVAL;
>> +
>> +    /* Currently, only Error Counter Endpoinnts are supported */
>> +    if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
>> +        return -EINVAL;
>> +
>> +    /* Mandatorty entries for Error Counter Node */
>> +    if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
>> +        (!node->error_counter_range.last || !node->query_error_counter))
>> +        return -EINVAL;
>> +
>> +    return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, 
>> GFP_KERNEL);
>> +}
>> +EXPORT_SYMBOL(drm_ras_node_register);
>> +
>> +/**
>> + * drm_ras_node_unregister() - Unregister a previously registered node
>> + * @node: Node structure to unregister
>> + *
>> + * Removes the given node from the global node xarray using its ID.
>> + */
>> +void drm_ras_node_unregister(struct drm_ras_node *node)
>> +{
>> +    xa_erase(&drm_ras_xa, node->id);
>> +}
>> +EXPORT_SYMBOL(drm_ras_node_unregister);
>> diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/ 
>> drm_ras_genl_family.c
>> new file mode 100644
>> index 000000000000..2d818b8c3808
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_ras_genl_family.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_ras_genl_family.h>
>> +#include <drm/drm_ras_nl.h>
>> +
>> +/* Track family registration so the drm_exit can be called at any 
>> time */
>> +static bool registered;
>> +
>> +/**
>> + * drm_ras_genl_family_register() - Register drm-ras genl family
>> + *
>> + * Only to be called one at drm_drv_init()
>> + */
>> +int drm_ras_genl_family_register(void)
>> +{
>> +    int ret;
>> +
>> +    registered = false;
>> +
>> +    ret = genl_register_family(&drm_ras_nl_family);
>> +    if (ret)
>> +        return ret;
>> +
>> +    registered = true;
>> +    return 0;
>> +}
>> +
>> +/**
>> + * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
>> + *
>> + * To be called one at drm_drv_exit() at any moment, but only once.
>> + */
>> +void drm_ras_genl_family_unregister(void)
>> +{
>> +    if (registered) {
>> +        genl_unregister_family(&drm_ras_nl_family);
>> +        registered = false;
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
>> new file mode 100644
>> index 000000000000..fcd1392410e4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_ras_nl.c
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>> BSD-3-Clause)
>> +/* Do not edit directly, auto-generated from: */
>> +/*    Documentation/netlink/specs/drm_ras.yaml */
>> +/* YNL-GEN kernel source */
>> +
>> +#include <net/netlink.h>
>> +#include <net/genetlink.h>
>> +
>> +#include <uapi/drm/drm_ras.h>
>> +#include <drm/drm_ras_nl.h>
>> +
>> +/* DRM_RAS_CMD_GET_ERROR_COUNTERS - dump */
>> +static const struct nla_policy 
>> drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
>> +    [DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>> +};
>> +
>> +/* DRM_RAS_CMD_QUERY_ERROR_COUNTER - do */
>> +static const struct nla_policy 
>> drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
>> +    [DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>> +    [DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
>> +};
>> +
>> +/* Ops table for drm_ras */
>> +static const struct genl_split_ops drm_ras_nl_ops[] = {
>> +    {
>> +        .cmd    = DRM_RAS_CMD_LIST_NODES,
>> +        .dumpit    = drm_ras_nl_list_nodes_dumpit,
>> +        .flags    = GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
>> +    },
>> +    {
>> +        .cmd        = DRM_RAS_CMD_GET_ERROR_COUNTERS,
>> +        .dumpit        = drm_ras_nl_get_error_counters_dumpit,
>> +        .policy        = drm_ras_get_error_counters_nl_policy,
>> +        .maxattr    = DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +        .flags        = GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
>> +    },
>> +    {
>> +        .cmd        = DRM_RAS_CMD_QUERY_ERROR_COUNTER,
>> +        .doit        = drm_ras_nl_query_error_counter_doit,
>> +        .policy        = drm_ras_query_error_counter_nl_policy,
>> +        .maxattr    = DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +        .flags        = GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
>> +    },
>> +};
>> +
>> +struct genl_family drm_ras_nl_family __ro_after_init = {
>> +    .name        = DRM_RAS_FAMILY_NAME,
>> +    .version    = DRM_RAS_FAMILY_VERSION,
>> +    .netnsok    = true,
>> +    .parallel_ops    = true,
>> +    .module        = THIS_MODULE,
>> +    .split_ops    = drm_ras_nl_ops,
>> +    .n_split_ops    = ARRAY_SIZE(drm_ras_nl_ops),
>> +};
>> diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
>> new file mode 100644
>> index 000000000000..bba47a282ef8
>> --- /dev/null
>> +++ b/include/drm/drm_ras.h
>> @@ -0,0 +1,76 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_RAS_H__
>> +#define __DRM_RAS_H__
>> +
>> +#include "drm_ras_nl.h"
>> +
>> +/**
>> + * struct drm_ras_node - A DRM RAS Node
>> + */
>> +struct drm_ras_node {
>> +    /** @id: Unique identifier for the node. Dynamically assigned. */
>> +    u32 id;
>> +    /**
>> +     * @device_name: Human-readable name of the device. Given by the 
>> driver.
>> +     */
>> +    const char *device_name;
>> +    /** @node_name: Human-readable name of the node. Given by the 
>> driver. */
>> +    const char *node_name;
>> +    /** @type: Type of the node (enum drm_ras_node_type). */
>> +    enum drm_ras_node_type type;
>> +
>> +    /* Error-Counter Related Callback and Variables */
>> +
>> +    /** @error_counter_range: Range of valid Error IDs for this node. */
>> +    struct {
>> +        /** @first: First valid Error ID. */
>> +        u32 first;
>> +        /** @last: Last valid Error ID. Mandatory entry. */
>> +        u32 last;
>> +    } error_counter_range;
>> +
>> +    /**
>> +     * @query_error_counter:
>> +     *
>> +     * This callback is used by drm-ras to query a specific error 
>> counter.
>> +     * counters supported by this node. Used for input check and to
>> +     * iterate in all counters.
>> +     *
>> +     * Driver should expect query_error_counters() to be called with
>> +     * error_id from `error_counter_range.first` to
>> +     * `error_counter_range.last`.
>> +     *
>> +     * The @query_error_counter is a mandatory callback for
>> +     * error_counter_node.
>> +     *
>> +     * Returns: 0 on success,
>> +     *          -ENOENT when error_id is not supported as an 
>> indication that
>> +     *                  drm_ras should silently skip this entry. Used 
>> for
>> +     *                  supporting non-contiguous error ranges.
>> +     *                  Driver is responsible for maintaining the 
>> list of
>> +     *                  supported error IDs in the range of first to 
>> last.
>> +     *          Other negative values on errors that should terminate 
>> the
>> +     *          netlink query.
>> +     */
>> +    int (*query_error_counter)(struct drm_ras_node *ep, u32 error_id,
>> +                   const char **name, u32 *val);
>> +
>> +    /** @priv: Driver private data */
>> +    void *priv;
>> +};
>> +
>> +struct drm_device;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_RAS)
>> +int drm_ras_node_register(struct drm_ras_node *ep);
>> +void drm_ras_node_unregister(struct drm_ras_node *ep);
>> +#else
>> +static inline int drm_ras_node_register(struct drm_ras_node *ep) 
>> { return 0; }
>> +static inline void drm_ras_node_unregister(struct drm_ras_node *ep) { }
>> +#endif
>> +
>> +#endif
>> diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/ 
>> drm_ras_genl_family.h
>> new file mode 100644
>> index 000000000000..5931b53429f1
>> --- /dev/null
>> +++ b/include/drm/drm_ras_genl_family.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_RAS_GENL_FAMILY_H__
>> +#define __DRM_RAS_GENL_FAMILY_H__
>> +
>> +#if IS_ENABLED(CONFIG_DRM_RAS)
>> +int drm_ras_genl_family_register(void);
>> +void drm_ras_genl_family_unregister(void);
>> +#else
>> +static inline int drm_ras_genl_family_register(void) { return 0; }
>> +static inline void drm_ras_genl_family_unregister(void) { }
>> +#endif
>> +
>> +#endif
>> diff --git a/include/drm/drm_ras_nl.h b/include/drm/drm_ras_nl.h
>> new file mode 100644
>> index 000000000000..9613b7d9ffdb
>> --- /dev/null
>> +++ b/include/drm/drm_ras_nl.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>> BSD-3-Clause) */
>> +/* Do not edit directly, auto-generated from: */
>> +/*    Documentation/netlink/specs/drm_ras.yaml */
>> +/* YNL-GEN kernel header */
>> +
>> +#ifndef _LINUX_DRM_RAS_GEN_H
>> +#define _LINUX_DRM_RAS_GEN_H
>> +
>> +#include <net/netlink.h>
>> +#include <net/genetlink.h>
>> +
>> +#include <uapi/drm/drm_ras.h>
>> +#include <drm/drm_ras_nl.h>
>> +
>> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
>> +                 struct netlink_callback *cb);
>> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
>> +                     struct netlink_callback *cb);
>> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
>> +                    struct genl_info *info);
>> +
>> +extern struct genl_family drm_ras_nl_family;
>> +
>> +#endif /* _LINUX_DRM_RAS_GEN_H */
>> diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
>> new file mode 100644
>> index 000000000000..3415ba345ac8
>> --- /dev/null
>> +++ b/include/uapi/drm/drm_ras.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>> BSD-3-Clause) */
>> +/* Do not edit directly, auto-generated from: */
>> +/*    Documentation/netlink/specs/drm_ras.yaml */
>> +/* YNL-GEN uapi header */
>> +
>> +#ifndef _UAPI_LINUX_DRM_RAS_H
>> +#define _UAPI_LINUX_DRM_RAS_H
>> +
>> +#define DRM_RAS_FAMILY_NAME    "drm-ras"
>> +#define DRM_RAS_FAMILY_VERSION    1
>> +
>> +/*
>> + * Type of the node. Currently, only error-counter nodes are 
>> supported, which
>> + * expose reliability counters for a hardware/software component.
>> + */
>> +enum drm_ras_node_type {
>> +    DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
>> +};
>> +
>> +enum {
>> +    DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
>> +    DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>> +    DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>> +    DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>> +
>> +    __DRM_RAS_A_NODE_ATTRS_MAX,
>> +    DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
>> +};
>> +
>> +enum {
>> +    DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
>> +    DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +    DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>> +    DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>> +
>> +    __DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>> +    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = 
>> (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>> +};
>> +
>> +enum {
>> +    DRM_RAS_CMD_LIST_NODES = 1,
>> +    DRM_RAS_CMD_GET_ERROR_COUNTERS,
>> +    DRM_RAS_CMD_QUERY_ERROR_COUNTER,
>> +
>> +    __DRM_RAS_CMD_MAX,
>> +    DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>> +};
>> +
>> +#endif /* _UAPI_LINUX_DRM_RAS_H */
> 

