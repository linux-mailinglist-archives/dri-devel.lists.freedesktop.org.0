Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA0C685CA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E688710E463;
	Tue, 18 Nov 2025 08:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHBAMf0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0C610E458;
 Tue, 18 Nov 2025 08:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456218; x=1794992218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v/LtFMLd8SO2NFl2bkQ5Gq5AaUtbb8IqI0jB8z2Be8c=;
 b=LHBAMf0E8nIPz+UhB++9PMh2890QAYZ47rD3bea5jKdW8XJ6KITxVgen
 qZLk4t8sv0jDdGRW57egz0Z+u3BvJR0ZXMvhqGsD2Fuxlk8BR5iXA0RpV
 opIryVEoaa954JaJq/52WepOXld+f3EU6TFqrK08mFQbbI+fsbmUnmElM
 AUwJ1K6ybSvcxpiNQqoHxOWKdFjyooMwRcALrKMJNnAIJjWuvrL7Oopdz
 gQRC4iPNv1jCgXu8RbWQ/w4MS9dDxaiEJsIodn3rVrWNpCxvxX+gqJ6kY
 mdHTXU1D61XDLVGM6VzVg042rQt27k/yNP/WNHstXKvkHxsSWmNJr/w/D w==;
X-CSE-ConnectionGUID: 7TctrIdeSTmOmnJaSV+9mA==
X-CSE-MsgGUID: DJ3v5sfJTLy3Mhx0KwOc+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65410227"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65410227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:56:57 -0800
X-CSE-ConnectionGUID: CMpnuHy5SJCch6kkHTai2w==
X-CSE-MsgGUID: 5oNj4W7qTcm6fnWwkzvm0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191141821"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:56:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:56:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:56:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:56:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifyR776CgDC9j8TPfDNGxBQq6j1bTDBDEaLfyeR+ot/Yp/J6OtHnsV4PntLZsjBX58dCJPzfUZcY//vzzHtb3YEmI1b0JukA3S3AAZyQb6FF1Bpz3nEInrcgq8GY59oZ1AUHSexqdGLcKLhPcbHoIUWo00ONGIK7jlcjA8RLDsXzGg2a+Qqcbrhqc+NDYcjuugjVVOREuD+SdNOhQb0QwEGlPjhf41UocyeqwGi7c7sjWNhYVKar4hXlnSRseUenBQoj1t5Y+jyViAyTL3BbtrXAP73/lV9Gi/Y484jJ0UOn110fLyWel+CxVbPAmcVTJO7uVACtVZQKfo/ZMw7yvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9Du/vwQEP+MpVGm5crdXcvzJzUYyhI14ujBKXhZV14=;
 b=sW6hjwgD62usbKBCV5r5E7GU3V4nMXb4IWDXuA+fWsfJTouCrKiLRTb7nNpEyzdVQnF7VvffyuWMG/aPZDCzsArz4DNXg1FGHljOqP3+Fl0lZOIyUuu9GuESuXkwcfAs2T/F+ZWEi2CQNI9g5+KJbhbLE47vS/b6y+HBmGX7tvrvBz9wCKlRmnRHaic+VViRkC+w8f+Fx78s1gEtkduCiwptkIeZOSWpEoF79xH07Kku29cj2Y/LsgQ19IXPNuCL4kHUxa0dfp2lBTXftQ2klcN/CIk49RW0bH+o1TyipduC6tqqfvFSUojiALnGqIGJ+zpKM1X+GJ/yQlXbiEDamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 CH0PR11MB8233.namprd11.prod.outlook.com (2603:10b6:610:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 08:56:49 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 08:56:48 +0000
Message-ID: <8f5cf673-3a9a-4971-b984-87d2617dab7f@intel.com>
Date: Tue, 18 Nov 2025 14:26:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-16-uma.shankar@intel.com>
 <DM3PPF208195D8D2BE977D4B97AE6528ADEE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D2BE977D4B97AE6528ADEE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|CH0PR11MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e20e75b-9bb2-4c6a-5979-08de26806896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFprMUhPQjZZUkZmMmFtK2cwcnhiS2k0U0x0VE9iQ04rak8yN0JJc3l0bFAy?=
 =?utf-8?B?SEZrNUdLcWttYitaVjJ4V1N2Z0Q2dVpKMFEva29keTRtN2RoZFl1eDNnRHA3?=
 =?utf-8?B?Q05rZjJKRnY0K0dDUDFDQldrQ0M1NWUydGlYNjlWdWhSTUJzQUZMSDBQZTcx?=
 =?utf-8?B?Q2VVVDNGbzc0SFZ0aC9qNm14TEp3Y01kWWJvNk9kWTBpNWtBdFRJQzBIWk9Y?=
 =?utf-8?B?RzR4Z0dTUS9sZGlGQjRkeXQxNVczWkpxRVNHWlh4REVuV0JCNlJVekFZNG9a?=
 =?utf-8?B?aTFyOUhpblJCRzNkUlJOaFBOaGVESG85N0kyQi95b2x1N01nZEFiUEx1WGdj?=
 =?utf-8?B?VXlpV0hRbmM2VkgzL2JvbTBYTktQK0dPcUNva2trZUpCNG8xZjg0UUxkMmhT?=
 =?utf-8?B?L2ROMkoxMCt1R1dsRW9zUTlFQlRUelFuajlDc0hkd0FPOXM2T0tNY0g0cTZn?=
 =?utf-8?B?WUN4c1FyekhvVStlOGtUWnNyQ2kxOVpaTTJOODI1aC9HV0U5cDdJL0Y2TFM5?=
 =?utf-8?B?T0VvdGJ4SnFmMDFtMS9NNmxBWVE3K04zR2ZhcW4wK3ZreUtkNlVJOFdFRzNG?=
 =?utf-8?B?U1VqdUdQUEt5dXpGdXIyOTQzVG9LM2ZHNHdWUFF6YkUxOWRuc3RSR3pVK0FS?=
 =?utf-8?B?Tkp5dWJzZk0vVTBPdnNrWmpERU95U1NjWFF6UW9yamJtZ3hrOWdudUhCY0VU?=
 =?utf-8?B?cVRjUkJRVVBrS2Y5VzhheithWWRtWjZqL2xUZi9nLzJTQkViZnlHbG9qTmVE?=
 =?utf-8?B?RThZeEJ5NEZyUHRsZEM4WmIwTG5tMm9xWUUwbTJzWkFyNDNid3hrcDVhS3BL?=
 =?utf-8?B?YmhrcXM1bGtQYVF5ZnV5Z3R6cUFlRklpRmRUQmFDSXFFaFY5QW85Y0haWFdq?=
 =?utf-8?B?YTRFV0ovMy9YU3luL2RiWkRGQXNiRGhqNHlOUmI3RGJpQXZZTklZenBOVU5E?=
 =?utf-8?B?S2pxTVRyV1NYWUJJWUxNOTI2d254UmFnMkcwa1R5SUV6cjZnbnl6bEthS0cx?=
 =?utf-8?B?MHlmcURZUTArUUJlUkIyY3VTUnZCUUdNdXVwYnllblYrTE9xdmM2dHdDZy9D?=
 =?utf-8?B?UlMzU2NjcTJvSzlMOXZoWWJ6cDhyRFJnYXpTbFE0T1ZrUzFEcFkyMXk1Q1o1?=
 =?utf-8?B?aFA1L204RnNOTmpXaUpBWmhvaUpKQnRoTThINGxKbjhQcXBXYTcxU05oOXRW?=
 =?utf-8?B?cWRVRXJOaFhWRUJsMFY1SVZKWnlQSUZNNEZESUtGUXAyTUswMGp0aEtNN0sy?=
 =?utf-8?B?MnhzdUREdDU5TTAvOTl5Si9NN013Z213U1JjdHhhRlA0dExDcURmNWJjWXpH?=
 =?utf-8?B?Q09sdTlzN1JEODZUZk83YVEzbWRvZE9lMHBNV0J6TXVCUUxoRDNoSElwcjhC?=
 =?utf-8?B?SnN1TWxIQmRUMDhYelV1MUU0U0JDVFExTzZ5Q3hNRjFrWjNtUnIwZUlsdFRl?=
 =?utf-8?B?MHVNd0F2ZjV0b0kxQjRrNlY1cDhvQmZueDBLQ2pKSTFMelczTjdnOStiTURH?=
 =?utf-8?B?N3Z0K2FCVGcyVkgxOFBKWHArYkdFYXZyb29hcFJFNnBva3kzKzAwb0t5OUls?=
 =?utf-8?B?T1A2T0ZueGZ0ZWd0VDlNNGpMYm9iZm4yV1VCbFRpVDRaOWs1YzdLTmh2WWNh?=
 =?utf-8?B?ejlpSXJqSDRnY3VvMmdMMnBBSDA2ejBoOGFtRytHQnJNVmpQdmUxOTJ6ekkx?=
 =?utf-8?B?S3BZVHI5UmErd2VzR0V4ZW4waE82bzZUZ1RTa3hHeHN4YjJ3eGVSNUVVcmFU?=
 =?utf-8?B?b3E3WThDT3JrNEFjczJMTkxtVHNmbm5HTWQ4TkVHc0FlR25xMzQ5NldMeERO?=
 =?utf-8?B?TjJ3T2ZraE0rWmZjd08wRnpXMGdqVXhoTnIyQTliVHZRSHExbC9DaHJGZkg4?=
 =?utf-8?B?b29qK3pTeHlBMlg1TllzQng5NnBuVTlLWHVodTZ1eGFINC9ETWp5SEwwNVE1?=
 =?utf-8?Q?tUVAuT9Nf7geKvJwFcNJtsL7NNK/ffYz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3Y3RlhtSGpBMktnd3JDUzhBNWo5a0dMR2JCSFFzdFZoNnBSK3ZkRlN0d05L?=
 =?utf-8?B?N29sck12WjJJM04wcFlEcUlLWHNQS3VmTXBOdGc3QTE5bUNObGFRRlBOaTg3?=
 =?utf-8?B?RmFtWG1IUkl6ejVodFlIUDNMK0swNkFBN2dMR1FRL2ZVZGtqOUtnWkVtWktZ?=
 =?utf-8?B?MGVtRytrSnBTOU8raEh4REU5elBCcGhpWFNhK01kQ1c4V200NGFYMkJKYmJs?=
 =?utf-8?B?SndZc1ZZVzd0VHJveDhSWkxTNWZFOURKc1dqVW1aMllrczBNRmttWW5wb0pD?=
 =?utf-8?B?UjVIUFN1b2V0WGJTaE5DdEZpWkdoKzAvUGxtV1k2NzNUUE16ZUZpSUUvQWpl?=
 =?utf-8?B?OEw2NEhSWDRhbVp5cTQ1SFhwdmVNaTc2ckVBQXVuazJ0OE53SEFGdEo3clRi?=
 =?utf-8?B?eGhOYXppenNYSlJtSGtZdHRBb1I4d2Z5THVXWGs4OVN4SExUMmJKOXNualc0?=
 =?utf-8?B?UkhublJmcmY1dFBRMFFUQkowYzhBaWRqTkxFcXVZK3FDNE5mU3c4TUU3WWc3?=
 =?utf-8?B?bTlKem84ZURLR1J2cUJMRmo4Z3FhcWNWZ0RBTDVDRnVxTnVXYjZ1eUJNaTlt?=
 =?utf-8?B?cnB5bXNIbE16ZDFHbHI0ZFFVOHFFYW5EL3hBYjc4a1AwdjNHQVlubXhqQi9w?=
 =?utf-8?B?MjhpVGJ4UHF5VW92WStFVUZSeWhzWFgyQVBCdXR6aXBXR0NidHlkZ3VpYlNB?=
 =?utf-8?B?cjBlK0s5YnErZTRkZVFOTTlia0xaTjAvekZkZkZrTFlHUjZjMW8rVGh5c05T?=
 =?utf-8?B?OFEwZmk4Y1BoZlNXcUtuWXUxdHdreHFyaDA2aHJXTHZmZDZzTFNIKzM3Um9o?=
 =?utf-8?B?YXlFWkFYMkNOK1o3ZnZucmliNTJSN0RQQTk1bUc4V0plZW1ITFFxeXJzQzdR?=
 =?utf-8?B?Nndjc25Wa2oyR01SYzA3c09ZcFFoWnRPYURQZjBZdzIrOTNQUmdHV2FCYWdV?=
 =?utf-8?B?NngwM25jRHcxS1hlblgyN1pTbm9CRDBJTmlBUXhYcnBrZmZ1S0FIU1J3emE4?=
 =?utf-8?B?L0tET1dyTklWL3AyOTlON2s1WGhIbmNsWmRSK3d4T2xBU0lTcStkV05vaHlO?=
 =?utf-8?B?clhWRUZpV2ZjREU1ZXYxajAzRWw4VU02Y2E1UU9UeG83Z2xXYkRPOEJqL3RS?=
 =?utf-8?B?dmkxVHdCamtvcVlvaUdYMDJFcHo1eWM5YkhISXF3Z0lJRmdRVytaT1FKc0k4?=
 =?utf-8?B?VWFjWlNWanpUSDh4TTR0R0k1ZVRYL0I1VXF0YnJXTWRuc0ZZZzM5RFYxUlM2?=
 =?utf-8?B?UVdxeEkwYkRqZUprNm10OFVaMXYwdUJPTmhCWm1WWjNxTVZrUjdyS1lPTGJy?=
 =?utf-8?B?VFVqc1pUL1F2N3VOV0dJbVZwbFV2bi9FQ1k2ZVBPMTA1bnM2ZU1qOG1SMVJa?=
 =?utf-8?B?Z3p6Vks5WXkvcUVVYnAyM2Q2SWh1ZXNQTmVkcGRMMEgzM01yY252TzJsMU9y?=
 =?utf-8?B?WS8xN0JOQUlrYzkyOTR6RjFnZ2JwNElpd0orK3RYQnBYWGgraHl0dytROWJn?=
 =?utf-8?B?Q1B3b2kyWDViSVlTU05nQTdUN3lEZGErc2V0dEFrWEFEeHlHUGVIVy9SWDVs?=
 =?utf-8?B?amt6RERRWVpndnJ6b0hrdjhUYlY1TE56MVlNenRhWkxGWTl1cW9Mcmoycmc3?=
 =?utf-8?B?VEczVXh3RmFVTDJHNzlrajdISkt4OUJ4c0hobnRST3dHK2dDYXo0Q0IzMUNP?=
 =?utf-8?B?UHIyaC9xU3I5T3dBR2RwTXZmTEYzdkZCOGRJSXlkakorNGpQYS8zeVhRRVNi?=
 =?utf-8?B?SWdkQlJlM2tTcFNMYk12ZW9LYTV1bS9leVJDaDUwNU95VHlwUU1aQjk4UmdP?=
 =?utf-8?B?bk15eDdVZ2phcTRTT1luNFB1aE5hVTNmUGxoWXMwbGVQWHBrRnh0aDVUM09u?=
 =?utf-8?B?aEJBaEgzVXRRU0xhQkVhcUR2R3l3K2pNSEZiVVhMWWpiRXVEMW16dEx1dlRK?=
 =?utf-8?B?eXRRakVZVzZ3a1AzbU5iVUZjdjJqeFUyMWpMQkZJWCtWQVFFWEVvWFlIeG9x?=
 =?utf-8?B?L1Nkb0lOQTdoTTM0L1RJL2kyd2w0UmJMQ1JBeHVyWHhySmNxSU5qeUFJMkFv?=
 =?utf-8?B?Nm9ZR3BRMndwME5ycXFmUWcyR01pSG9jL05YL0RTRVF6aFpmRFpwcmczc3RC?=
 =?utf-8?B?M3pRK2NJbUNOU3ZLMTFIUEh5WWNEN0Z1a1EvcE1FY0xadk5zajBNNkI0RmU1?=
 =?utf-8?Q?bQ4rYqtAdDy/VS2keZ8OWps=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e20e75b-9bb2-4c6a-5979-08de26806896
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:56:48.9106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCm6rGX0krzDInUTBHcJZ9pN8c0KioLzPpKxreA2NGweOBXKZbL/EygwqNqFiajqg/QRIFHrf70EtpTZzz32BOei4g7gxjle5BQtIhk0LAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8233
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



On 11/18/2025 2:20 PM, Kandpal, Suraj wrote:
>> Subject: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
>>
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add helpers to program the 3D LUT registers and arm them.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c    | 57 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_color.h    |  2 +
>>   .../drm/i915/display/intel_color_pipeline.c   | 35 +++++++++++-
>>   .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>>   .../drm/i915/display/intel_display_limits.h   |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  2 +-
>>   drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>>   7 files changed, 97 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> index f290432f3c31..ab9e889ce19f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4061,6 +4061,44 @@ xelpd_plane_load_luts(struct intel_dsb *dsb,
>> const struct intel_plane_state *pla
>>   		xelpd_program_plane_post_csc_lut(dsb, plane_state);  }
>>
>> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color) {
>> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK,
>> drm_color_lut32_extract(color->red, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK,
>> drm_color_lut32_extract(color->green, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK,
>> +drm_color_lut32_extract(color->blue, 10)); }
>> +
>> +static void glk_load_lut_3d(struct intel_dsb *dsb,
>> +			    struct intel_crtc *crtc,
>> +			    const struct drm_property_blob *blob) {
>> +	struct intel_display *display = to_intel_display(crtc->base.dev);
>> +	const struct drm_color_lut32 *lut = blob->data;
>> +	int i, lut_size = drm_color_lut32_size(blob);
>> +	enum pipe pipe = crtc->pipe;
>> +
>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) &
>> LUT_3D_READY);
>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe),
>> LUT_3D_AUTO_INCREMENT);
>> +	for (i = 0; i < lut_size; i++)
>> +		intel_de_write_dsb(display, dsb, LUT_3D_DATA(pipe),
>> glk_3dlut_10(&lut[i]));
>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0); }
>> +
>> +static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc
>> +*crtc, bool enable) {
>> +	struct intel_display *display = to_intel_display(crtc);
>> +	enum pipe pipe = crtc->pipe;
>> +	u32 val;
>> +
>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) &
>> LUT_3D_READY);
>> +
>> +	if (enable)
>> +		val = LUT_3D_ENABLE | LUT_3D_READY |
>> LUT_3D_BIND_PLANE_1;
>> +	else
>> +		val = 0;
>> +	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val); }
>> +
>>   static const struct intel_color_funcs chv_color_funcs = {
>>   	.color_check = chv_color_check,
>>   	.color_commit_arm = i9xx_color_commit_arm, @@ -4190,6 +4228,14
>> @@ static const struct intel_color_funcs ilk_color_funcs = {
>>   	.get_config = ilk_get_config,
>>   };
>>
>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state)
>> {
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +
>> +	glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d); }
>> +
>>   static void
>>   intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>>   				  const struct intel_plane_state *plane_state)
>> @@ -4210,6 +4256,15 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>>   		display->funcs.color->load_plane_luts(dsb, plane_state);  }
>>
>> +static void
>> +intel_color_load_3dlut(struct intel_dsb *dsb,
>> +		       const struct intel_plane_state *plane_state) {
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +
>> +	glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d); }
>> +
>>   void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   					const struct intel_plane_state
>> *plane_state)  { @@ -4217,6 +4272,8 @@ void
>> intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   		intel_color_load_plane_csc_matrix(dsb, plane_state);
>>   	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
>>   		intel_color_load_plane_luts(dsb, plane_state);
>> +	if (plane_state->hw.lut_3d)
>> +		intel_color_load_3dlut(dsb, plane_state);
>>   }
>>
>>   void intel_color_crtc_init(struct intel_crtc *crtc) diff --git
>> a/drivers/gpu/drm/i915/display/intel_color.h
>> b/drivers/gpu/drm/i915/display/intel_color.h
>> index 8051c827a1d8..a70df0c2bd9a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>> @@ -43,4 +43,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state
>> *crtc_state,  void intel_color_assert_luts(const struct intel_crtc_state
>> *crtc_state);  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   					const struct intel_plane_state
>> *plane_state);
>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state);
>>   #endif /* __INTEL_COLOR_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> index b6e6ebdd0dff..fd7d63ce6d9f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -12,11 +12,24 @@
>>   #define PLANE_DEGAMMA_SIZE 128
>>   #define PLANE_GAMMA_SIZE 32
>>
>> +static inline bool
>> +intel_crtc_has_lut_3d(struct intel_display *display, enum pipe pipe) {
>> +	if (DISPLAY_VER(display) >= 12)
>> +		return pipe == PIPE_A || pipe == PIPE_B;
>> +	else if (DISPLAY_VER(display) >= 10 /*|| IS_GEMINILAKE(display)*/)
>> +		return pipe == PIPE_A;
> 
> Is this required specially if this function is only used for color pipeline which
> Is only being exposed for DISPLAY_VER(display) >= 12 so maybe the else if part is not needed
> 

This will be needed once we have the *PIPE* color pipeline but for now 
we can skip.

==
Chaitanya

> Regards,
> Suraj Kandpal
> 
>> +	else
>> +		return false;
>> +}
>> +
>>   static
>> -int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
>> drm_prop_enum_list *list)
>> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
>> drm_prop_enum_list *list,
>> +				     enum pipe pipe)
>>   {
>>   	struct intel_colorop *colorop;
>>   	struct drm_device *dev = plane->dev;
>> +	struct intel_display *display = to_intel_display(dev);
>>   	int ret;
>>   	struct drm_colorop *prev_op;
>>
>> @@ -36,6 +49,22 @@ int _intel_color_pipeline_plane_init(struct drm_plane
>> *plane, struct drm_prop_en
>>   	/* TODO: handle failures and clean up */
>>   	prev_op = &colorop->base;
>>
>> +	if (DISPLAY_VER(display) >= 35 &&
>> +	    intel_crtc_has_lut_3d(display, pipe) &&
>> +	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>> +		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>> +
>> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base,
>> plane, 17,
>> +
>> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> +						   true);
>> +		if (ret)
>> +			return ret;
>> +
>> +		drm_colorop_set_next_property(prev_op, &colorop->base);
>> +
>> +		prev_op = &colorop->base;
>> +	}
>> +
>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>>   	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -58,7 +87,7 @@ int
>> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
>> drm_prop_en
>>   	return 0;
>>   }
>>
>> -int intel_color_pipeline_plane_init(struct drm_plane *plane)
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe
>> +pipe)
>>   {
>>   	struct drm_device *dev = plane->dev;
>>   	struct intel_display *display = to_intel_display(dev); @@ -77,7 +106,7
>> @@ int intel_color_pipeline_plane_init(struct drm_plane *plane)
>>   	len++;
>>
>>   	/* Add pipeline consisting of transfer functions */
>> -	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
>> +	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>>   	if (ret)
>>   		return ret;
>>   	len++;
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> index 7f1d32bc9202..a457d306da7f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> @@ -7,7 +7,8 @@
>>   #define __INTEL_COLOR_PIPELINE_H__
>>
>>   struct drm_plane;
>> +enum pipe;
>>
>> -int intel_color_pipeline_plane_init(struct drm_plane *plane);
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe
>> +pipe);
>>
>>   #endif /* __INTEL_COLOR_PIPELINE_H__ */ diff --git
>> a/drivers/gpu/drm/i915/display/intel_display_limits.h
>> b/drivers/gpu/drm/i915/display/intel_display_limits.h
>> index 55fd574ba313..cb3c9c665c44 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
>> @@ -142,6 +142,7 @@ enum intel_color_block {
>>   	INTEL_PLANE_CB_PRE_CSC_LUT,
>>   	INTEL_PLANE_CB_CSC,
>>   	INTEL_PLANE_CB_POST_CSC_LUT,
>> +	INTEL_PLANE_CB_3DLUT,
>>
>>   	INTEL_CB_MAX
>>   };
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index d8fe80a55601..50a14f75b727 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -646,7 +646,7 @@ struct intel_plane_state {
>>   		enum drm_color_encoding color_encoding;
>>   		enum drm_color_range color_range;
>>   		enum drm_scaling_filter scaling_filter;
>> -		struct drm_property_blob *ctm, *degamma_lut,
>> *gamma_lut;
>> +		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut,
>> *lut_3d;
>>   	} hw;
>>
>>   	struct i915_vma *ggtt_vma;
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
>> b/drivers/gpu/drm/i915/display/intel_plane.c
>> index 298f8e186fee..7c230a2832c2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>> @@ -348,6 +348,8 @@ intel_plane_colorop_replace_blob(struct
>> intel_plane_state *plane_state,
>>   		return	drm_property_replace_blob(&plane_state-
>>> hw.degamma_lut, blob);
>>   	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
>>   		return drm_property_replace_blob(&plane_state-
>>> hw.gamma_lut, blob);
>> +	else if (intel_colorop->id == INTEL_PLANE_CB_3DLUT)
>> +		return	drm_property_replace_blob(&plane_state-
>>> hw.lut_3d, blob);
>>
>>   	return false;
>>   }
>> --
>> 2.50.1
> 

