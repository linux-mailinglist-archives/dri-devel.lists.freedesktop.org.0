Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4381CB978D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 18:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85910E33B;
	Fri, 12 Dec 2025 17:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZIaJiam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D82510E33B;
 Fri, 12 Dec 2025 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765561632; x=1797097632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GqI9qM0VcnkQ58+gnL5/AMykCCILifpPxELlaYZzVDc=;
 b=eZIaJiam5SNxl4P+dp3QT1MQpG5RNLsLjBfdqrmk7ZR1yB2cwerdbeNq
 qS3vYe+ISAbrHg/Px6SuGBgVjYhb6FJ0rWu39d7i0NcfaebwyHT/KOoPA
 RA3tA/4Y/vtZJC9iBjwtU6P3bJlAxlQAitepmZ1JbvBQVLfWb24BZHwGE
 YCwi7bE+O+FeOi3clEWTTg61dEUvhF0vos7fUDuxjqESSQGADRn6y/Iyl
 xod4fAGxUp528qUPomJ6VuIGjGqXrBxZjhbractZoQACDhjYFzg8zK1IG
 K/d5+ZUe//IdLduJQ9cTT9PgQxNutY09rq0EnPdlUL7f5Qi2r0r8IlKRF w==;
X-CSE-ConnectionGUID: K7vSZWsLTjGSf4iOxCLSXA==
X-CSE-MsgGUID: 2PWd2QbRSI2xf2+Ok/gkYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67452468"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67452468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:47:11 -0800
X-CSE-ConnectionGUID: 4qI+vCDTRC62lhm75tdg+w==
X-CSE-MsgGUID: 5XU4n+sjRnGjofSGbyYLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197966600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:47:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 09:47:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 09:47:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 09:47:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZT063KYwqUw2sWPcvuPyXnFUDCdhsB+WFJi2v3N0tN2Idw4ZbeSei5rpHl95Lwzuzt9SaDxJZPcNJsP15nTeZkHf/OX5DmsfYIJLBSfxB7SClGe3Taw+j7/llSO3+Uf/zDcE6y3xQ2nqzXz79AN0XH8HrRaMu/XSNfzvExsT9nWqaGDLM0qtXexiD33OlXvncWNP32Zd037Gvg1eH9MgpfL9umYAQbkoy1pKiOy3+CT2eICfCPhRSzhxU/2obMli6H8dyMRdnkiG8UPuTHAHKN9HlRBJkJdDmfioZHJOrs5+tnZ7lbPuwj/Rx73QR+R7jcs0tzU61uIjr6ehZZE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aVgiHvww/62jpVZtQRAcL4Ir44ZLyXPI1WipUJJlP0=;
 b=swlM9Z4i4JNIxCrZsKH5a46iIPLL6v0GZrvSn6gKhnpnIgmMJXqnwcGrfMZ6RaVJuPrTNA4xYmUbrTGDpD+Go4OSKjdpxXbzlqMr3SWiPNMpZoTCStCv2gnQHAwnrTdRkiMKhzvqCe+ZxZkmoUKAen7GgmcnHcesvAZ+LPPgYfzwbbHvg0z8er0fK+T6x+bsz8DXLNjinLDOaKyces4sVWsS7GSLnpAUcqDpJEs5rIC5G5fFNjGWpsBnThpTddp25UzYK/4rtdPjWfyTqmfEARVh09GuI1tw8rHwP6RA+evNC+M6BKbsCY8MVq/L8ij2H7qEqZ78dDWhrh20VoebyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA3PR11MB9064.namprd11.prod.outlook.com (2603:10b6:208:57f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 17:47:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 17:47:07 +0000
Message-ID: <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
Date: Fri, 12 Dec 2025 23:16:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Uma
 Shankar" <uma.shankar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <aTwwBMKUp5AYmFTN@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA3PR11MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 176488c7-7992-4df3-81ca-08de39a677a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVNJc2Z2K3ptRWpVKy9rcjdESGNwR0FnQUgrNDBqWXM2MnlQTVZUZG9xNCtM?=
 =?utf-8?B?aVpPTmh0SEY0ZzdjUlNCNEFVU0tjcE9kanJwMkpKNk5EM1VTTkZhRDhZd1JI?=
 =?utf-8?B?R2pmSDJJN1ZZLytqTmo3eEZwQ1BEVXdBR1BwN0F6OGJSc0QycnB4c29vZWZm?=
 =?utf-8?B?SVdtbmxjSU1qeUV6QWZNaTQ4N2x0UmJlK2JhQUZqczZWUmhFNG9DaHMvbkdQ?=
 =?utf-8?B?KzlKang2VjQxTHJLM2syZDFiaGdXb0V1M3o3d3hvZkJDYlJERSs1UmFSNEVK?=
 =?utf-8?B?ajdZam1sK25Bc0xwUE5XNCszWVVNMm9CbjNlQWhzc3E0czBERGZicjZlRThI?=
 =?utf-8?B?OXhQUVUvdUVVR2N5UmQyYVJrbUl5MEY2cTJtQnVsVTdTQjBXaUNXaDMyc2kz?=
 =?utf-8?B?TDl2eXBjaGZ4MjZWemNhbUo0VWVsTmVPYTVKNCtSalM4ZExhRTdtbUI0TlFr?=
 =?utf-8?B?YWF4dzFPcDBacGxYeXk4NlVXMGVhUGRVM1dNL0pXd2Y4TndNT0xORkYwNHEr?=
 =?utf-8?B?aW9leFF6RXZ6L200alVXdmJRdC9mWEFHSEdtZGl5SVRVQjhVbDVYdWlyQisz?=
 =?utf-8?B?V2k0NHRUTVNQNjdkSFhleHRhUktQclU1K3h5dDZTWDgzUXRYa3o5bk5vdkxC?=
 =?utf-8?B?RWg0TTFtRERwY3dQSHZydUJRZ2JDUmh6UVBvS2lFcERkZTcxSkE2WERDQzFQ?=
 =?utf-8?B?cE0xNkZDazhWOGpweUJKUkdmNWxzaDJ6YkhFWHNUeGYxQzhlM0NBUXAxZkov?=
 =?utf-8?B?V2FydFkzSmpmWFJCSU5sbHVweXpxTTdwMjlPNXFmdmJmVTJZVWRaLzltTk5Q?=
 =?utf-8?B?MmdqSmNCM1o0R0cwVkdHSSt3bCtOUDkwN0U3SWJsSnNCVTYvOXJhME9zd3VO?=
 =?utf-8?B?RnoyRzlQMkhLazZ4SEVvYk03Z0Fld0l2SE5RZ0NGRG8zdTMxMlFxQjNDa2RC?=
 =?utf-8?B?cVpFU3BUeE1HdkJxQzhyd0xJWEowT3NSTHRBdGNBQ0lhWVRxYTZ0UjFLQzhw?=
 =?utf-8?B?VE1QQUNObzhsMEErSm04VmpZUlZ1TGlOWUJHNlA1ZTdKSnR3WkJmZUk5YjZ4?=
 =?utf-8?B?cDZGZGVsWDN6a3NERGhRNURQT0VHaTN2bGZrNWRqVHBHbEJGTkk2OWxubzcx?=
 =?utf-8?B?VWVpVUl2M21FdXNxUlQyVlNQMDNWV1hzWnFvNFRkWkF5ZHpnNFJpVDBFS1JI?=
 =?utf-8?B?Vlc5R2dwUy9XbTgwa3VCd3d4bFRFMlFhak04c0Z1bi9MQjVVNXo4UjVOV0xZ?=
 =?utf-8?B?M2dnMmxoMmRWZ3llVmpjczNvTzczTDIvcGFLaVpWKzYzVzBBNGxQOHpsV05l?=
 =?utf-8?B?NjhUSWhuK1pTYSticXhlVThvSWY3cWNrU0QwcXJYNk01WUMvbk1QZDFwYlV2?=
 =?utf-8?B?cXZoN0E1ZExFUTFLakZ6V05zQmZ6NERQK2dSUldlNG9jUVMzQURXbnVLRSt3?=
 =?utf-8?B?M3BoVW1ldS9EQitDSjFXeWxCQXFsRXZJaFNtNFg2M3JjalZWNEdPb3UxNkVV?=
 =?utf-8?B?N2FYdktTQzkyOU8xaitIOUdEVS9pd09qd1QrOVMzTXZGT2NRNHlmdEN6b2t3?=
 =?utf-8?B?alZ2NzJodms3NXVQTjlXVlpQOFVJVnd5anFDT1Z3clc5THRVdy83SE9ORWNN?=
 =?utf-8?B?QzdUZnVmdGowbjdlMCtiMitOKy9xdWw5eFhLQ0ZKYUxIQkJCUnRsTGRUeG9F?=
 =?utf-8?B?TU1lc0lMOE94ZHJCNU8rOUYwVkpmYmRJVGJqVGVDWFloZUtpTno2ckVEb3Er?=
 =?utf-8?B?U1hMNmdLNVVXbDRIRzRWTDE1dDUwQVhXakFyZDliQnRzbk8xeTQ4L1RGdGlQ?=
 =?utf-8?B?UDFlVDU4bWh6RFJ6VzNWVTA5N29ock52d3hzOFE4MlNFcThsZVRnUUFEY1BO?=
 =?utf-8?B?VVdZRXhiS1dvcll5RzYwSmo0aVgrMzU3bFNQRmYrazhhejE1NjFTQmZXcFNB?=
 =?utf-8?B?ckhZdFE1M0Z6ZkVFaW0ra29pMURxRHY1cENWcFVHdGNGelg0cXY0UXVTRkFl?=
 =?utf-8?B?dVZqQkplbkdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFKZTNVZzhZektUNXZFYWJEeGhjQTJmZUpjeGdPMGJTSWV4R04vczdVM3FV?=
 =?utf-8?B?cmhrS1ZsQ1o4SXBCb0JUeHNwUk9LeHY3ODE0MjNOTmU0NDhIaFE2MGtmeHZm?=
 =?utf-8?B?bkpCY3JRdmhLMlRMUkxQMG5ueGR5OEwweEpzWkxGNUMvdVVKcS9yT1dtS2ZN?=
 =?utf-8?B?djNqMTN1M0JHbnNrc2VxcmRVNmx3NExwdDg3SUlBNVJUOVVNWi81UllWNVdO?=
 =?utf-8?B?QzRQMWJhcmE0ck9nT0pVN2pBUm9ZalRZMjdBSXVEbUFQbU9BZktPcjc1d2hR?=
 =?utf-8?B?cnZybVY4ZzJwOUp0dVN1cm9YY2p6d1BwWmlOS21mMi91TStmNnRTajB4WjR0?=
 =?utf-8?B?UlhjYmJyVkoyRWllbjUzcHVxazBkUlhGQ1FSNXZtNmhiM2I4NUE0dEMxSUNs?=
 =?utf-8?B?QXZSdUZsS2VwK0FtME53SHVwZlpyRThSZWR2eFpickVuVTVzTFg3cW1GSzB5?=
 =?utf-8?B?MXpCU3pUbzlla3Zma0doUDJDcDl6bkg4ZTRqR0tOdSt1a2xIOGlPeUFzU1JF?=
 =?utf-8?B?MnZ6ckVPYi9IRU55SDhrNjdRcVE3QnhFQlh6Q2NuajRraXlyTDhWemtXL2sv?=
 =?utf-8?B?cHdDU3ViVG9VeklPUXJYUE5NVTV1bnozSitxL0dCMnJPOFlNZlBPRkNaYnl4?=
 =?utf-8?B?ZkFRN2l3OFJaYXRKcFVXNzZGMW5lL1pTZE4wZFRGNUdmbFFtd3k2aU1leGd3?=
 =?utf-8?B?SWxzazJSUWJWZnk2dExNTitvbVZwNGs1MDRCQTJ6UWFQZUZEeWNzRUtkd3JI?=
 =?utf-8?B?MUZqVE5hbkFIMS96clZ6THdjN1JobHBrSHVIeldJSSszZ05wYndPdjdHSk95?=
 =?utf-8?B?YkExZU05a2dZV05rWEI5NVBjK3hUUXhWam9OeFRUaldGNE1nZnc2VFlRNG9S?=
 =?utf-8?B?SDI2VWQ0MkFEYWtlL2U0dHEwV1BNMUJKV0hpVGxTRUtiVEtZUHdOQjd1M1Js?=
 =?utf-8?B?dE9Xd0ZPRy9HenRSZURDMEw4ZWEvRzdKTVlwcnEzd0JjRlJYSW1jUXMvUFBF?=
 =?utf-8?B?UE8yQ1llTnRUTmdRa25pb3kyei92K3RIYXN2bGlsZUFmV1dLbU01eDdJTTk1?=
 =?utf-8?B?R3VEaFlFZk9OL1NDR01HSW5YZGV2WTc4bmhFKzAyTXVhd0FoQ0Y5RXU3V1ZC?=
 =?utf-8?B?ZFcvZnBwbmI3UDFkSUJFTEJ5SlpMa21TVUg4aGdjaGVYMU8vbnhOWmpZREx4?=
 =?utf-8?B?dklsNW42eGV2cnVVUmI1MER0eUtyVzBMeXZqcVZwWmU0NHp5eTBkZXNmWUFH?=
 =?utf-8?B?dldTZkl5YlJwT2VNUmpBOExNSDRXUmF5alRFWDFVWXFRMWFPNDlKNklKcnli?=
 =?utf-8?B?WTFTVVBWZ0M2bGhJS0UrNi9rZFptN0FqcVhJb3B4S1VlM001Zm5RNERuaFU5?=
 =?utf-8?B?YnRla3pXLzJFSGQ5MEpMYURiazFteEJFd05HNmdyOFlWWTRZdlBnZWVNU0Z3?=
 =?utf-8?B?NmdTUDlnMHBGU0lDVGVDYk16MUFwYnh1ZDVaa3duVUFYRmRpeG1LODVsKzJK?=
 =?utf-8?B?U0NhN3BnTk1EQWpZOVpzaWZHMDhibEdJNDdPSlJBdEJ2N2oxWEsrTnQ4dXVG?=
 =?utf-8?B?MnNkMm1qUFN2emMyaTFkdmxWRDhnSVEwMnVMczAzU0pOczdrWFRmZ2NHcWM2?=
 =?utf-8?B?V3NaU3VxNnRMWVBUcVI2MkErcTB1WmdGeGI5dFdtYnBMUFlZUDh2cTVyUmVJ?=
 =?utf-8?B?SmgzMWdNTm1HcDhHQ2h5U1N3azg4R1hwSll4Ni9yZitWeUVIQVF2T2ZYQ2tH?=
 =?utf-8?B?RHpsNE5taTdBRExXZUx6UXhSNDJlY3V4QStWK1RmWUczVUlzb3Vtb2UyVUJq?=
 =?utf-8?B?azh1NWhSbDRmaWtPcTJLSVhrM0N1bVdGTTUwWEJXbWdob09QR1JxQlhUY29O?=
 =?utf-8?B?M3BUTDhsTTh4MlR2MzZDZTBBZFhPN0pvZlBZdzVGOXQrM2VUMzg4eFArblBp?=
 =?utf-8?B?MDZkZEdPZnkyRUdsdTBYdy9XWDVSbnQ5dHFEM2swWDBIQ2M0OCs3OFhKY3Iy?=
 =?utf-8?B?RE9uMEd5UUNrVnhPNFpHdjN6bUI1bjV3RnMyeFdXTE9BZW83RGE1MjF6aXpr?=
 =?utf-8?B?VDBseFlBVVVES1JwUTdzTU5zM0VwZVlXdTZLYmV0QStKdlg1c05nRTU1UVV6?=
 =?utf-8?B?aHd6eERScHpxRjNwd05ub2pEWFd3QW5JUVBrY1JKU2ZLMFRjOFRtQW1CWDZO?=
 =?utf-8?Q?3qcvNTQavxAVMT0JBSboHOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 176488c7-7992-4df3-81ca-08de39a677a5
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:47:07.4181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVOpu1ueoK4aSyBSOiqlUcI/+ur+0JFl/NS4kzoBzXjakH0nI8ZLJH3LNH3t0dJsY3pgMsN4f8pDqbXfBMCrTS7wjLvUG6FygfOI9vLuBqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9064
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



On 12/12/2025 8:38 PM, Ville Syrjälä wrote:
> On Wed, Dec 03, 2025 at 02:22:10PM +0530, Uma Shankar wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add helpers to program the 3D LUT registers and arm them.
>>
>> LUT_3D_READY in LUT_3D_CLT is cleared off by the HW once
>> the LUT buffer is loaded into it's internal working RAM.
>> So by the time we try to load/commit new values, we expect
>> it to be cleared off. If not, log an error and return
>> without writing new values. Do it only when writing with MMIO.
>> There is no way to read register within DSB execution.
>>
>> v2:
>> - Add information regarding LUT_3D_READY to commit message (Jani)
>> - Log error instead of a drm_warn and return without committing changes
>>    if 3DLUT HW is not ready to accept new values.
>> - Refactor intel_color_crtc_has_3dlut()
>>    Also remove Gen10 check (Suraj)
>> v3:
>> - Addressed review comments (Suraj)
>>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c    | 78 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_color.h    |  4 +
>>   .../drm/i915/display/intel_color_pipeline.c   | 29 +++++--
>>   .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>>   .../drm/i915/display/intel_display_limits.h   |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  2 +-
>>   drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>>   7 files changed, 112 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>> index 08f3b5b47b8e..e7950655434b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4062,6 +4062,52 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
>>   		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>>   }
>>   
>> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
>> +{
>> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
>> +}
>> +
>> +static void glk_load_lut_3d(struct intel_dsb *dsb,
>> +			    struct intel_crtc *crtc,
>> +			    const struct drm_property_blob *blob)
>> +{
>> +	struct intel_display *display = to_intel_display(crtc->base.dev);
>> +	const struct drm_color_lut32 *lut = blob->data;
>> +	int i, lut_size = drm_color_lut32_size(blob);
>> +	enum pipe pipe = crtc->pipe;
>> +
>> +	if (!dsb && intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY) {
>> +		drm_err(display->drm, "[CRTC:%d:%s] 3D LUT not ready, not loading LUTs\n",
>> +			crtc->base.base.id, crtc->base.name);
>> +		return;
> 
> Just ran into this while perusing the code...
> 
> This check could be implemented exactly like intel_vrr_check_push_sent()
> so that it works for both the DSB and non-DSB paths.

We did discuss this briefly[1], but went on with this as a first step.

My main concern was if it is a good idea to poll for a bit in the middle 
of a commit. I understand that this is done for TRANS_PUSH_SEND but that 
is the last thing we do for a commit.

>The 'return' should
> just get nuked IMO.
> 

So just move ahead and program irrespective?

>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state)
>> +{
>> +	struct intel_display *display = to_intel_display(plane_state);
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +
>> +	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>> +		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>                                                ^^^^^^^^^^^^
> 
> And this looks like a pretty major fail. Why is the 3D LUT stored in
> the *plane* state when it's a pipe level thing?
> 

With DISPLAY_VER(display) >= 35, 3DLUT can be attached to a plane.
(Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the HW 
to the userspace right now (through the new plane color pipeline uapi). 
Therefore, it lies in the plane state.

However, there are (soonish)plans to adopt the color pipeline for crtcs 
too. Once that happens, it needs to be handled a bit more carefully. A 
potential approach is to allow userspace to program the block with a 
first come first served semantics and fail the commit if it tries to set 
3DLUT both on plane and crtc in the same commit.

[1] 
https://lore.kernel.org/intel-gfx/b01cade8-ba63-472a-a95f-bba9af57afbb@intel.com/

==
Chaitanya
