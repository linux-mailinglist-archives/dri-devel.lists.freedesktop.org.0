Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AEB1D226
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 07:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5C10E32F;
	Thu,  7 Aug 2025 05:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZErBddR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1688A10E0AD;
 Thu,  7 Aug 2025 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754545895; x=1786081895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KFzUzKamSG+vzyQY0gN9QYM0rZRsjf8S/APk9wcBgHs=;
 b=QZErBddRdeL8gkXWX9nBT9fuSVr55GxmoWsia4WptZedWgfbkemE2ICo
 E9QvDiXm3qfCCx2Ff0Q87d7Ev24Fo65ElYARtPvhxS339Xz2e6XG/HCGf
 ICsT6avfAgYQ7jBXlVSxBu6e+8jKffBP93sGHLhIRZVTMDQSHZWp1OgKT
 zZq4l5wOW05makONs3oRwrcbkd4SNk0Q6fYju084XlT2FcpH9pZFIkifQ
 KYC9lAfhv5SlEOZLVtcYlA7hNKsoGO2DTZIdRaVCWwUekaxw8G9mEKJ4Q
 SH8GgX4I/33uMbrUlwVgsQ+ULVZMGwR2RkxYw9xIu4DQsZP8rXU8donZq A==;
X-CSE-ConnectionGUID: O93qHRJSTkWEe+VLcMZ5zw==
X-CSE-MsgGUID: cbaCAtFeR9St7n/OvWfm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56738521"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56738521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 22:51:34 -0700
X-CSE-ConnectionGUID: 7IdQWVQ2S6SgEtRBpGdzDg==
X-CSE-MsgGUID: jDfqYGcXRxyGOaktujntPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169425597"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 22:51:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 22:51:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 22:51:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 22:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT3/a6lF+WGX79/rKpLqtReqvW44gWiUQxfIkd9mJmVo9ji2Es7zy/pSwJ+IM45BeYh0K21Rp+KjF8cZR27rsjd7CsTwifkcN8XAc+lWlXxBUtqHzIxxddd9/lfbuxH0XXfJM6eCksVCv9rjdnr5sVB5Mrm/pcbEfyT2nng7M5Is7y+DU4PTx0dphcW4Xk+ks0WaKo1EPIfIPc5b1KO3h8NSTsnrzvmmHFgPbWj/8ShEMFx3Pqc/pdSsVba9UTwVHlNhR4WBJd0Fbv5jwGEvJfNX6u5ea2JZXilGGkfFuxTz57nrSvB598n2n1iT/HoJbmiEeB9+6s0jQR5Rvwm0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFm1jv0hyfBAVbpLjmSfWS/bbQY9xxHOf6Ib2tgXMQM=;
 b=lvUWdRbr8C575hlBtyVGdx2az0KN0BociES/ejY8mG/KEbv6urHK19sDYR/xeTFOt7FwABvOiwP/9yhBSLPbpRjsonOxP2/9jsuz0crnyzxb8arJ638O/18lrQhsY6J07QjEsB4/4DGo9KsNxaSTpmEYWoycLBaPqjUL6sQRsk0K7+e6QInSpROZMc4SiyZt5u6gCHv3zGhLEZpA+ZcC4pdPqhZSsmDGdswt75hsLE3qbE72Vqiu8f04VNkMJBh9yRCpGr4VyYVB2IyQ7J2R4XTCZwK2v1v3sFdu6DLUcNoZ60KTeXVuRRk5BLwgr/qzBQI01j+wDBT50vQM6aEr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 05:51:30 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 05:51:30 +0000
Message-ID: <ad3693fa-a8d4-4310-8522-5795d2fedc36@intel.com>
Date: Thu, 7 Aug 2025 11:21:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/drm-crtc: Introduce sharpness strength property
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
 <20250724134544.284371-2-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250724134544.284371-2-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: a25763fb-b58e-4646-ea76-08ddd5767519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajZJd1NLR0ptK2cvR3BrZHFFZndjS3VRem9JK3h5ODFLUmM5K0RGVmFjYXNH?=
 =?utf-8?B?T2tiOUhWTHREc0VlV1FvL3NNNkdLczlDejBPYjZ4cjlpRVRybTFaTTluMFZo?=
 =?utf-8?B?eVpZWHVVWFhsenN4SEZIVDhBNVVJR1pkb2JBWjNRUnB6MGtJTytYd2VZdVpW?=
 =?utf-8?B?akdnRTQ1M0hJQm16alhGMURmaFRjNUcwS1ZWb1lhbjk4dStRdFlTNEdEZjZa?=
 =?utf-8?B?TU9LZU1RVkkxaStiL1MzUGYrbDlWMm0rMU1xbmgzWFJqUkEzdVEydGZJNHhl?=
 =?utf-8?B?V29FeDNSTi9NdGhLYVErSVNLbnVqU0RkRCt6aEx5dHRnUVFEOXhKQVFuS0FY?=
 =?utf-8?B?Z2hlZ0tLd2FvdVRXK1hheG05WkVycnQwT1hXYnVpMWxkbm9WR0pCZlBOOFlU?=
 =?utf-8?B?QXB4VWxLaThuQ2xpTk9oWVVuakw2NmVCb3o2M3hnY05GdEpHbkFrZlNkUzB3?=
 =?utf-8?B?MTFIL3VOMGs1OUJNWHB0Yjhwa3JzTnFjbDJxSmpqRkMzYkZyb2M2NklPc3p3?=
 =?utf-8?B?ay9BRS9xdmtkTzVJSDRITVEyeUYyZjZ6NHJ0UllnWGd2bjIrVHAzdytJWFZU?=
 =?utf-8?B?UHdSM21FUWxxZ2htdzlXcmZtMDJZN1FIam5TQk9UUm9hak5oTVNJNXEyQU04?=
 =?utf-8?B?V2VIMXRBN25qUklqNkdXdnI3cGRiS2pmMlVDd2x1c1dsZWNoN2JiS09NWHZF?=
 =?utf-8?B?dDM0V2VhQUVGR1RXaHdkQlFQMCtkS1VWeEV0bWtYQnFyazA5OGE0bVc5citB?=
 =?utf-8?B?UnlCQ2RsZmFDYVRRdHBIeU5GWXdjNnBhSXBsMCttQ0VsR0VIK2Z6MUtVeGdk?=
 =?utf-8?B?UEhwcWR6ek1UYUdRRktCWHhFK3ZkeXh1aWJySitXRk1TNVhzRWVET1dzTlNK?=
 =?utf-8?B?ei9tMHdzK2N4MGw3Nk93OE5mOGlXVXAweFBNUDlQdGZTYzBpamJHZ1FkNnlD?=
 =?utf-8?B?ZnN6eWtjVENPWnBuVjZYUjFUaHZxa0tqYk9BbDd4NHFZMHo2Q1hLSGZsQ201?=
 =?utf-8?B?d3RSSDVramo4ZXR2TElYb2l0MkZ1UEo3bXRWbUNDSU1CUEE4TWRYSE04bUp2?=
 =?utf-8?B?clVnUFg2RmlXZ3piT3pDM1BneUdhM0o2cjRaMUo3V0tndHR4ZnRDUjJPcEZQ?=
 =?utf-8?B?aUk1ZDl0bzVTNml3Zm4zL3VhQUVOZjZmbXFla0g4UEV4Q01kbzBCY2RDRytp?=
 =?utf-8?B?R2t4cFYzZGJuQUI1YjY1U25UenNEU1NWb2hKWk05K295UlFVRnVMUlNNOXhW?=
 =?utf-8?B?Z3FxTkIrVkYxQWxqNlpMcDBPZExvSjZnOGQyV1hKQnY5aUxGQSs0ZU5iWVFI?=
 =?utf-8?B?UDZvUEpFSEtqVjZyc0VJVXp1ODFoYmpaanNnSzB6TWkzRllHMlFMRnh0Mjla?=
 =?utf-8?B?djMvS2hJMGZLMytlQ2lvVDdVR3JDRXFFVE9OQ0pMYWZ5NG1tZ2FsREJ2ZkxT?=
 =?utf-8?B?TkxSQVZEQjg0VTlwV05Mdi9QUHdMS2NubExCd3lEV2ZyWjd3b1NQYjZjckZK?=
 =?utf-8?B?Z1ZaTXNoemJhZThZUExxelBUOVlCb0VZZ2w5MUwydG1NU08rU3I4bG4zemZY?=
 =?utf-8?B?OVZpRDF3eXBhZXM5cEczckdMU2E3L1BPOEE0eDVTaVpFQ2J1N1V4cWVqMkdj?=
 =?utf-8?B?VFVXQldpS20zUlFmR1BYQkVpaE5pMU9aN3R0OExIWlVLUzVGYVhuTHdQVzZZ?=
 =?utf-8?B?WTBJcldZeVlZYXRjVlVCN2JpM0FxOTZlMFlkTXlNMGtUYWFzelVJNFVBazlC?=
 =?utf-8?B?WWZub1RkWFBGYU83YmR2bktRMGF5Q0JTNlNZa2syNmJzQVZVSno4aUxkSE9s?=
 =?utf-8?B?Q0tPYm9Fd0lMbExRazQ3NGhPTzVzNlVYdzFDaE11NkNkclJRZWdncWlzdHQx?=
 =?utf-8?B?ZG1PK2dMV283bEs0SldHcHdIbUFpSEh6ZlBubkFvdDZkR2V4QkJoNVJUZVFs?=
 =?utf-8?Q?jkRjOZiy3CA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhxaWJaN2owRG54Y0c2bGNJdkxTUWhUQnd0OHl5R3pKUXF3VjFRblRLUXAx?=
 =?utf-8?B?WlpaTTJoeUlTR25qOXZTdG5XUHhMdmhNRjBqUXZyQnpwT1lxNmlxMVljeUpC?=
 =?utf-8?B?VHlrNktSMDNKYS9sVnZ5Qzl4MU5VWmxONnVyMkpUem1JMGxxVUg1MERRNmxl?=
 =?utf-8?B?UGg4Rzg0OCtVWTV0dE11Si85ZGc1bEJFbGRQbmZLOHNaeHplczZuWDN1QUFO?=
 =?utf-8?B?MDJkNlBRdllMOW1KeWlaS0tKYk5TRy9nZStDVTZjSUZBbTdJanJFVUl2aHRP?=
 =?utf-8?B?TjM1L3Ardjhvdzg4RngvZXlwd0gyZWE0T0pKNm1QRmhiVGxKODkvK1ZJcGp0?=
 =?utf-8?B?Z2lLemgvckNra3BORjc1WEZ5MEdWbHd0eS9VSjJya2szVFAvVzFlbU81ZGFH?=
 =?utf-8?B?TjJUNVRoTUQ3NytQeWVVaDU5R1J2QU1FejVONjVDY3RCU2IwcHJ6Zi9hbDNO?=
 =?utf-8?B?VUQvT3VubE1BQXhROW1tVXhyR05RSEhlZE1GeXRYUUtiSzV0Q0FjZXNCS3Mw?=
 =?utf-8?B?TTNEd3N0YkpOUHFIa0NYRzJGeWd1M0V5SW9BYjVRMnl6NVBobUNrZzduQU0z?=
 =?utf-8?B?VG8wRFU1M0h1Nnl3ZVM1K2F5MGFmVDJjRi9hR25LTzVRTjhwelE3U3RzbkE2?=
 =?utf-8?B?ZEUya1RWcnlrVGNLdjRLOWVPTDI1ZnVnRWRJY1NsWENNZkRyNE9MenVYUFIv?=
 =?utf-8?B?NEpEUCtJdEIrYy9XYXV3RUx5dzg0RVdVd0dZeGJiL0Q3VUlZNzNvYUhQODJ6?=
 =?utf-8?B?c1dtQk1nZzNHZUxNam9rMUw1bWllSnBmZUZuRjEvc1p2U29NcjlTQjJOZ05R?=
 =?utf-8?B?TzBadzgxSFlENlhFZ3JHUTdWYlBZNEFucloxbktqQklpUTk5TnUvdUwxeHNN?=
 =?utf-8?B?SzlSNVdMdE0zY3FxcHA5Ykc5NHZXRndKSHJ5Wlh4aTkxNTE5VGpUZzIramJW?=
 =?utf-8?B?NTBhQXo5WStscUozTzAydkdxeG1PTHFsanFYU2xRdGg5bGRuZ1FQajZpRlM3?=
 =?utf-8?B?ZEpDNENFNllXZHlYRk02dDNSNDd6b29nYktFVFNCd1ZCRlNxRDF2eGVUY2Nm?=
 =?utf-8?B?UEhRWnhOcFd3RjJxdTVNTXk2Z1RvZTY4K1RGbGxIZTdwTGV5MncxbFo1c2Nl?=
 =?utf-8?B?R3RLUE90dHhFSndXeFBmaU5kdk1JUnBFNmUxc2pkWmxvYWNKV1VQRU5hcDJB?=
 =?utf-8?B?bVovSWdJdkZWeWpXTm1lRGpIY2ZNMWROTjYyWjg2SG9CekhxeTVXMkdPZ3pE?=
 =?utf-8?B?TkttSEdDdGs1MEZzMjBDVklEU1N1ZFNnUXV3Z1BFSjhjOEd2ZGVCZmdQY1FE?=
 =?utf-8?B?TlNwelIwaFVhdlh2MGxNZWNqM3k5K2laRkRsTWliTUhJWXNtdGdIVGQxTTky?=
 =?utf-8?B?Zmc3ZkNEZ1lOTCtTbFcxTjlVb3dxMmNRdW91bFVubTVjWXcvWnhia2xMT2Nh?=
 =?utf-8?B?ZUkyeGg0NWJsMHFyekRwdFVvVzV3bEtjbXUvZVU3SEF1NDR4YlErMm9rQ3Qr?=
 =?utf-8?B?TWdFYUx0d0Y4WVgwMy9NbGZkdzFHbW9PVnJDcWloZldjYXVLVWVaR2R3c0Fh?=
 =?utf-8?B?Sm9RcXhKT1ZTcFpuQUYrY3l1OGIrZllFMlQ0aGtEZzU0R3ZzRUUxeEFpUUN6?=
 =?utf-8?B?KytSRVp1eWorU29pT0JWVGpyZjEwcGk0N2ZNSTQrUzRvVmIya2QybHdmcW5p?=
 =?utf-8?B?bHlUVGZLS2g1U2E4VnhQclFpc0VJaUJ4c3R3M0l5MVBjYlFrRGhXOUZMSllD?=
 =?utf-8?B?TnJ0UWcxaUFTZEp5ZGQvWjh2QzRKMWRMTGFrYlZraTlyeTd4WHVPNTIyNE1a?=
 =?utf-8?B?ck9jLzVOUjI1YVVrTlFWdm5qdFkrOVRpbDJHWml5R2JITXN0b3BzeU9BYU5V?=
 =?utf-8?B?R0drQ1JpS3NWZFh2UUF3STJVNGtkSWo4ZnZHUkMyVkxFTE9NZm1hRTZTdFFN?=
 =?utf-8?B?M3hsZm1pVHlNTTRYOWI1Tm5lQWNHTGMycGd0RCttV1ViaVlEd29XcVVmOWZE?=
 =?utf-8?B?bmw3RUNHUGRyZmdkTllVQ0FRNmlMb05oaUVGWjFjMWhCUVFpUVRCRzVNSWJC?=
 =?utf-8?B?TE16V0k0bWNaRlNwcWJuNVZyK1U2cTB1Q1A5RFh0MTdxZkVYcVFvbkpLTERR?=
 =?utf-8?B?MEF3NGpNNjRrckIycDRSdmRXR3FpZlpXcGVycDhZbkRUdmliR2IrQmJ6WjQz?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a25763fb-b58e-4646-ea76-08ddd5767519
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 05:51:30.7290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKD4OInOurG4NCRR+DPE6DBmUyrVMhy5lDmt255cyMzZNfgh6DlIFobL/SN3EYCGqHhUyv4innhbgMMVrHo45ZCGmB8i9R57XRTlDS9aluA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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

Hi Nemesa,

Patch looks good to me. Just a couple of minor suggestions in the inline 
comments for slight improvements in documentation.

Also, IMO,  drm_crtc might be better than drm-crtc in the subject line.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


On 7/24/2025 7:15 PM, Nemesa Garg wrote:
> Introduces the new crtc property "SHARPNESS_STRENGTH" that allows
> the user to set the intensity so as to get the sharpness effect.
> The value of this property can be set from 0-255.
> It is useful in scenario when the output is blurry and user
> want to sharpen the pixels. User can increase/decrease the
> sharpness level depending on the content displayed.
>
> v2: Rename crtc property variable [Arun]
>      Add modeset detail in uapi doc[Uma]
> v3: Fix build issue
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>   drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
>   include/drm/drm_crtc.h            | 17 +++++++++++++++
>   3 files changed, 56 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ecc73d52bfae..2302c2bea28a 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>   	} else if (property == crtc->scaling_filter_property) {
>   		state->scaling_filter = val;
> +	} else if (property == crtc->sharpness_strength_property) {
> +		state->sharpness_strength = val;
>   	} else if (crtc->funcs->atomic_set_property) {
>   		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>   	} else {
> @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>   		*val = 0;
>   	else if (property == crtc->scaling_filter_property)
>   		*val = state->scaling_filter;
> +	else if (property == crtc->sharpness_strength_property)
> +		*val = state->sharpness_strength;
>   	else if (crtc->funcs->atomic_get_property)
>   		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>   	else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003d..1b7ce99cea5e 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>    * 		Driver's default scaling filter
>    * 	Nearest Neighbor:
>    * 		Nearest Neighbor scaling filter
> + * SHARPNESS_STRENGTH:
> + *	Atomic property for setting the sharpness strength/intensity by userspace.
> + *
> + *	The value of this property is set as an integer value ranging
> + *	from 0 - 255 where:
> + *
> + *	0 means feature is disabled.


Should mention here that this is the default value.

> + *
> + *	1 means minimum sharpness.
> + *
> + *	255 means maximum sharpness.

These can just be:

0: Sharpness feature is disabled (default value).

1: Minimum sharpness.

255: Maximum sharpness.


> + *
> + *	User can gradually increase or decrease the sharpness level and can
> + *	set the optimum value depending on content and

> this value will be
> + *	passed to kernel through the Uapi.

Use UAPI. Also, this  can be a separate sentence.


> + *	The setting of this property does not require modeset.
> + *	The sharpness effect takes place post blending on the final composed output.
> + *	If the feature is disabled, the content remains same without any sharpening effect
> + *	and when this feature is applied, it enhances the clarity of the content.
>    */
>   
>   __printf(6, 0)
> @@ -940,6 +959,22 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>   }
>   EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
>   
> +int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop =
> +		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0, 255);
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	crtc->sharpness_strength_property = prop;
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
> +
>   /**
>    * drm_crtc_in_clone_mode - check if the given CRTC state is in clone mode
>    *
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2..2b26b90e82e6 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -317,6 +317,16 @@ struct drm_crtc_state {
>   	 */
>   	enum drm_scaling_filter scaling_filter;
>   
> +	/**
> +	 * @sharpness_strength:
> +	 *
> +	 * Used by the user to set the sharpness intensity.
> +	 * The value ranges from 0-255.

Perhaps we can add about default value:

Default value is 0, which disables the sharpness feature.

> +	 * Any value greater than 0 means enabling the featuring

can simply be: Any value greater than 0 enables sharpening with the 
specified strength.


Regards,

Ankit

> +	 * along with setting the value for sharpness.
> +	 */
> +	u8 sharpness_strength;
> +
>   	/**
>   	 * @event:
>   	 *
> @@ -1088,6 +1098,12 @@ struct drm_crtc {
>   	 */
>   	struct drm_property *scaling_filter_property;
>   
> +	/**
> +	 * @sharpness_strength_property: property to apply
> +	 * the intensity of the sharpness requested.
> +	 */
> +	struct drm_property *sharpness_strength_property;
> +
>   	/**
>   	 * @state:
>   	 *
> @@ -1324,4 +1340,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>   					    unsigned int supported_filters);
>   bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
> +int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
>   #endif /* __DRM_CRTC_H__ */
