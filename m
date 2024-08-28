Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C657962327
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E073610E4E1;
	Wed, 28 Aug 2024 09:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbpfqSdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB2710E4E1;
 Wed, 28 Aug 2024 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724836461; x=1756372461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lm6sWgUS8k/Oab6oiTZIOQr/L/AvHTmLBpQd1NqaS1w=;
 b=XbpfqSdXDv+Nb7wZuiI9qSeT4Yxg5Fjls+Ixu1F9u2LnKeYMVLPSm8Ko
 xXtsDZ8K/WrAT03zNJZ58AlAZPTmPbszM+UePwgHsZAPXtmbARblSx0vE
 mgTpqWGvEmA88S4mMBY4kUIr+8EwPjDlD25tyY6RARAkCqdJnwj+tgddA
 Ly1D0wAE5AJ+Cj3JnHe3XF4RTW3PSf+NI7HW7mEWUgvYpRhZl8Fxfaz5z
 1SXqnq83OgAizntp53Oh98YBGNx07aRc57muvFqvDx56qNoj4FmxZOJZS
 tdiEWjEICMa4SVZK3ebyafBEzCDG6y12EmR95lYb6y5XMvRObhQGBKLim g==;
X-CSE-ConnectionGUID: xF0M5fbZTdulVD1nf6ZHCA==
X-CSE-MsgGUID: zIIIvHtESFSfo3E6p7X0LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40857497"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="40857497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:14:20 -0700
X-CSE-ConnectionGUID: xOiy8VVDRM+MBiaugI5E+w==
X-CSE-MsgGUID: Jlb+U8AQSbiHcP1ATphbXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63495845"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 02:14:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 02:14:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 02:14:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 02:14:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 02:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ7WbqvxREY3c6IL21jKXge0og1+tp+qInMoKgPbWEbXsEgMlvVZabpvMUwF1sC4tryFlOC0X84fx0zVKdH/4x4L4Y8exL6joK6Q24gRP6ICPq6qtK5axXOVK3BS+HMh9/+ajAp9YoO8u41DD3XFy90LpPV/GeZqmFT/4kpOVNuAjvKmvYkufFeEX/8pZA+LfPIIynWjmUFKlS2QgQN0kYMYr694sSzvPwFc3thT+jkm6AwI+VjsJ6efAY7s+gMUUfX+/I4osq9kTY0re95/D4CZQmbT3f94RMGJMGUdfDVcU3qK3PhsOYSa3xBkXdL+VBow9FjD+tH9eF7Z6hsOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlQQMBRWnn8J4a9/JSFGI/j6BJmka4TUHgN7qTy0Pro=;
 b=BbqfWK26uehf7rACP3sJORmH4kuu6tc3C5jTn2ElzwAlRkjwzO/V7jWonOmTHb+LkaU5mFQQ10WXX8SaAikIIJzIHYCy/lwVXJ6gwy+OnqfLRF66ytXZwn1f4TzqzO1EeyfqdA2fg8AdcJiqeSqdxjuAwZuVyM7HqxqYwtiOXGhpPmWMvTq2JysbqV0jaNAPwfVluMsvJV3g2YB3SqWbxdfY5IeJoj6O9Q7h/+0OJhVby88r8cr4fnTgrxbBhp8qWHtnASpT64DAK0ryk4J9JubesArlS1V1U9mapAftpDzUMpbC+QTCuRvi8gR4910S4x75K/GKG88R1BXqXpK64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Wed, 28 Aug 2024 09:14:15 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 09:14:15 +0000
Message-ID: <82edb878-c3c1-4dd3-bd02-84c52a90ed9a@intel.com>
Date: Wed, 28 Aug 2024 11:14:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm/xe/lnl: Offload system clear page
 activity to GPU"
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
References: <20240828083635.23601-1-nirmoy.das@intel.com>
 <ddb6aea9022b21b92e35deb8647697d4ea05159c.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ddb6aea9022b21b92e35deb8647697d4ea05159c.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 756bafed-e4fe-447e-ef21-08dcc741c9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3ZLam9lbzBZa1UvM2ZyZnhxZkc5ZFF4UXdFNS9LVWhJY3JqcjZod25rWmsr?=
 =?utf-8?B?RS9oUW1RczFuUUFVdm50WEFVSHJadGdOY3M2akQ4NjVBWm9ubHZBZ29rNzVF?=
 =?utf-8?B?Vll0NkJIMFB0RVl3UUlTNUx0T2FmV2xpcCtFcXB2OE9YanVvVzE3NitQUnY0?=
 =?utf-8?B?a2k2SzN0eW1McitRcTlBSmtHT2JvdTFFNnp1Rlh6bFJhbEptZXRHOXVWSkZZ?=
 =?utf-8?B?UlBvUDYveWdqMUh5MElPOG9TcGJ1NWM2NGdqVndrOXNqK3dPOW45RFB4MDlO?=
 =?utf-8?B?THA3VG1UM1NheTBESkl4SmNnUHJYU0xYTnEwdnJhdDYvN09rUXgveFJ4bEdV?=
 =?utf-8?B?ZVlFZDFBOVJhRFVselFuU0w1cTNUZzdUMDJLL2FITWNTUlBPL2NxaGNuWk1v?=
 =?utf-8?B?SHV2UnpTc0RDSnhWcEpwM2Vpd0RMTExNU1JHYzFJdkhFODNvRXE1alZNN3h4?=
 =?utf-8?B?SlFQNk00bjBlSmlBYVZxZDc3MGFYWWtjQjI0cGh2Vm4yYkxyVGdHZmJIRTNB?=
 =?utf-8?B?Snl6ekZKdDltWmlsMUxjRXB2MitWS0tTUlFVYUJXOWI1NFVLK29OZEVpcWZ0?=
 =?utf-8?B?OUg3cGRWKysyUE01RzBOclpCdVZqUnpQblJJUlRnelBZdHJWbjZleGFERGdD?=
 =?utf-8?B?K0d2c2tGRmc3aVN1a2l3OVYrZ2NjblNOOU9KeE5BK21uMVJjOG5GQXpmaW5m?=
 =?utf-8?B?MnU5M1JKbHB3TmNaWjFoQzNtY2JvMldHRUJFS0xNWkJRV2ZpZElQM1lTME9h?=
 =?utf-8?B?WnZ2ZVU4R1VNZ0J6TTF4RVJVY1RqZkxkL2FFUld1ZU9LeXRRbWxxMFhGRjVv?=
 =?utf-8?B?OG9LMHlaY282dUd2dnZtZHcwa21tYjE2MTVUaGsyOHE0SVprM2tmcStwNE1i?=
 =?utf-8?B?MER3R2l1TW1ycWtkMjUyRHJMNElHTEJxQUdhVVRTU2xqcVZOQ3V5RWxtaWNQ?=
 =?utf-8?B?cHNVTjFBVkoyZDlQNnpveVRKandKeHJLcmR6VXZxNjV0cUpCUWxHWWVlRkdP?=
 =?utf-8?B?eG9ubmg5M3JvdU1kOXcxOVdKeldyY1g4UWZnclBqMkI3NHc0NmNwcldVVTJC?=
 =?utf-8?B?SHNsMm41ZWFSLzd3Y2hTbTJleFdYVm1EUmhNODBac3FVMU8xQTk0WjJ1UDBs?=
 =?utf-8?B?bFJVQytIMGNqTmRwRjd2R09LanZXWG9QelFYY2FheTlyZzlmSkZiK2hCd1VR?=
 =?utf-8?B?RjduSlBUa2hMNTByTHUzS2ZFRWpuYS9DQVliTFNCallNWllBRnQxY0NtMklW?=
 =?utf-8?B?M3hyMUN3TDVLUFVaZHRQTTVrQ1lsclFxTWJiazQ1YU8vVU04cCtCUzJUWVJr?=
 =?utf-8?B?Q0trLythMEIzeVlVdVdhblp0cXlxM05sMitQOVg0cHgrY2NsU211VmpoblZv?=
 =?utf-8?B?eFVwZW1zaU1tdGEvZ3lNWi9qMmlkaUtOaEovZml4MDAyK2JoVW9GY1NoS3NE?=
 =?utf-8?B?UzhQRFpCWGFxL2owdERxV1c1ZVltNEJWYTlKalRWTWNCVTQ4alF6S1FneHQ3?=
 =?utf-8?B?RW5reERGcmRVL0IrNFFLN2dTNzB1d0p6VlZoRzFGaDNwUTg4TGtsUHkyS1Rp?=
 =?utf-8?B?YTBFb2h4QnRqUnA4ODhDL1VRb2RuWmFDd3g0bXNRVWdWYlUwVnh2WDNMUnRF?=
 =?utf-8?B?enJRY1hRK0FTOXRVcStSVy8vSXBCajJwSTBidGp3OW5qMW55alRkQ3VCYjZp?=
 =?utf-8?B?U2RUS29oU05jVE1OZFZKTTVNMzNHOVBDcXg3Y1JQNGhETmRhbnlrbXZOUk15?=
 =?utf-8?B?N0RJYmplNTJ3clVOZG5lMFVnbmdlY1JBdFdxNjRwaUkzK3RBK2JqVmFBU0lV?=
 =?utf-8?B?Nm1mdWwwQWRIZ25mamdGUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHU3bzUyUVlTalRHQUw5SkxWNXNGK2d1MHM0N0JTSjBYaWd3Y05PYXVLeHlQ?=
 =?utf-8?B?MHluSlhiTWh2Smg2Y1pybHljclRUeE1YejQxaW14c0ZkNnR0YkR4WXZkbHJ2?=
 =?utf-8?B?T1FwVjM4aWwyWDkwSDA5RkhmaEhSbStHa3lvR0t3YUZPb3A0UEZGcTNWNzh4?=
 =?utf-8?B?eVpjaUFYL3dIUGJ2N2dacWdBc1RXamJjTTJWWTRaMnNMdlBmWnV6dlJmbWN4?=
 =?utf-8?B?NnJzSmV5MGg0MGE3Skc5SGNiSFcrVjBhdXkzZWlOSlZoeEZkNFV6RkdKWE9N?=
 =?utf-8?B?U0I0SmNSbitRVktXY2U4bG02S0V5dHZxVnJ6aU8zUHFJazI4OXBxQUNIZVFM?=
 =?utf-8?B?bTRMUDJsTm5UN2RuejZpSXRvUStYTGx3djBGRWpTYW0reGt1OFg3VHlhLzJL?=
 =?utf-8?B?RWRnemhGZ08wQ1VjRDd2VVJyaTVRalYzSHpOcEtTSVBDTGdmRlNZR2Jlcnp1?=
 =?utf-8?B?Y2x6OHhYRFFJcE9Zb1RRS2ZwUk0wa3ZYaHE2eUZhcXE5VVRHWkc5ZkM0NXZq?=
 =?utf-8?B?Qmk5VU1YcTF0cWxURVA1QVdqcFpOa0QwQmdIb0RSMTZOL2FQQ29lSkJScjJw?=
 =?utf-8?B?Ry85Qm5Bc0NIWjhSS1RvZEM2NVMrUzRGdEU0dEpGZUJ1TFM4eitIOU9Kb2ow?=
 =?utf-8?B?WVIzQlFiSTdjRVhCV0U4V3FCMjBKQUpzNzhsT3V1SG5WU2lwTkJMMWhFUE9O?=
 =?utf-8?B?L1dNNCt2ZE1pVW80d1BhU3RycmdyYkR2OGdTblhUVVBud2R3ZktOY2ZOb09a?=
 =?utf-8?B?K3JjR1BEeG5wM25FN0w1ZmhRdElsdUxUa045d2ZiYWFiek4yZCt6SWZpSXho?=
 =?utf-8?B?VVVZYU5pb1lZNmxoNktybEtFNlZySmozTXl1d05IUHFJN3dqNU9TUGNvbXgy?=
 =?utf-8?B?cWdkb01Ldm1ZZk5GZ1JubFRZend2T2hadFR6eExpaDAxSXhCSUtpRHdrN3cz?=
 =?utf-8?B?emNUYWhtb0tHcTdtTW9kRG1ydEFsR215Y25lSXlGRHFQLytoMnRmNkRiL3ZU?=
 =?utf-8?B?am9TdEwvY21lazVVSzIxSUIxcUJEWG1yeTBmK2JDWEpoWG1OdWQ1MFlIRTRN?=
 =?utf-8?B?NkpYak1va2lyUXNmaE1UbFpQS09vbFRMYVdiM2h0Qm1WekhJRjY2S3dMN2VN?=
 =?utf-8?B?WDdtM2tKQjgvMXpOanRnU2dURHdXQXE5dnE0SmpRSVA0VVdtemh6MWl6dWpU?=
 =?utf-8?B?MnRLYXBnVGNoS29mTUpKWVFVVHNQajM0MHNzR1hNZkhBbmNrcWJ3TGtXZHd4?=
 =?utf-8?B?SzB4eHplMGhnWTNPNS9hSlYrQU9oMlNISWtPSWlxNGpIc2ZseFdRdDhRK2pF?=
 =?utf-8?B?a21yUFhMUWRSYTBTQzVMTVAvRUlVb0VVZ25DK2pPZDZIRFJRRjdkRTAvWkNi?=
 =?utf-8?B?NFBSUmd6ZFJQQlNIb3FEQmpVL25HZXFsVG1mVlQ5dlNLZlZMVzlFWTkybC9M?=
 =?utf-8?B?Q1pJb3Z6YmRncmdQN2JhTGwwU3hYOVFhRnBmOU9YUFQweDNSSnhqTnhHU0Vh?=
 =?utf-8?B?NjQ1azhvRmdyK01CaDR0OUdHYXJQK05XVlFOeHM5eGxGN2w2VjFnWWxrejVU?=
 =?utf-8?B?bStBWFRtdVhZaHV3UVh2Sko2ZTR3SDBWV0tWYytvei9NK09jdVFwZVBOcU5p?=
 =?utf-8?B?QVp1S3Q0WFFlbVhtb3U5elpKMVVSLytWK2d6bGlBQ2Z2bll1bEZBVXFIdzZo?=
 =?utf-8?B?bWNnRXdpZVJnSHB1SVQ5aFllaXJrVWhPb3BuMDBnMG93ZzhyNnRjSDJWMGN6?=
 =?utf-8?B?TnpVL1d3VUJoSzdSY0w3bURMeUZpMUxuUnBuRjVQUDhsUE9lZDlEdk5uVjl4?=
 =?utf-8?B?UGQyaE0ySmUrL2pTWkF3bGhGcTNIQUJJQzZSdWJWU1hrb052bCtyeUx2SmVm?=
 =?utf-8?B?OHZwaVZ1UGNUampEUUc3d016SXdMMWNIMEVnZzhLZHAwQVlnQ2M3STI4Qk84?=
 =?utf-8?B?SnVLUlQ5WjRJR1JvQnFkMGhtUFAyVkxNOGdibzMxZjZJS1dlakVDTWp2YzND?=
 =?utf-8?B?enNBNExNUGJobFRYM29OVWVDeXp1SktLWUtjTiszVTRudUpaall1YlZCRWVk?=
 =?utf-8?B?VnBCRFlSN09kdmtQL1poZlF4UnNFbnpCWkRjalJjWjR5WE5COXVpTW1rcitx?=
 =?utf-8?Q?Ft3Hk599SWbufvHsIaRehiZ+P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 756bafed-e4fe-447e-ef21-08dcc741c9b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 09:14:15.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw3bhwsD/G9gByvv3MvhCejl6jpN5TkgYSz27PYtc2olnFgtivb8cdc2POjnsT1hLW0nVFeC7a400W7zpDyckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
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


On 8/28/2024 11:11 AM, Thomas Hellström wrote:
> Hi,
>
> On Wed, 2024-08-28 at 10:36 +0200, Nirmoy Das wrote:
>> This optimization relied on having to clear CCS on allocations.
>> If there is no need to clear CCS on allocations then this would
>> mostly
>> help in reducing CPU utilization.
>>
>> Revert this patch at this moment because of:
>> 1 Currently Xe can't do clear on free and using a invalid ttm flag,
>> TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
>> multi-device setup.
>>
>> 2 Also for LNL CPU:WB doesn't require clearing CCS as such BO will
>> not be allowed to bind with compression PTE. Subsequent patch will
>> disable clearing CCS for CPU:WB BOs for LNL.
>>
>> This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> You'd need an Signed-off-by:
Sorry, missed "-s" while committing
>
> With that,
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thanks,

Nirmoy

>
>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 26 ++------------------------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 --
>>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 12 ------------
>>   3 files changed, 2 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 9d6632f92fa9..25d0c939ba31 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -396,14 +396,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   		caching = ttm_uncached;
>>   	}
>>   
>> -	/*
>> -	 * If the device can support gpu clear system pages then set
>> proper ttm
>> -	 * flag. Zeroed pages are only required for
>> ttm_bo_type_device so
>> -	 * unwanted data is not leaked to userspace.
>> -	 */
>> -	if (ttm_bo->type == ttm_bo_type_device && xe-
>>> mem.gpu_page_clear_sys)
>> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> -
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
>> extra_pages);
>>   	if (err) {
>>   		kfree(tt);
>> @@ -425,10 +417,6 @@ static int xe_ttm_tt_populate(struct ttm_device
>> *ttm_dev, struct ttm_tt *tt,
>>   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>   		return 0;
>>   
>> -	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
>> system pages */
>> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>> -		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>> -
>>   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>   	if (err)
>>   		return err;
>> @@ -671,16 +659,8 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) &&
>> xe_bo_needs_ccs_pages(bo) &&
>>   				  ttm && ttm_tt_is_populated(ttm)) ?
>> true : false;
>> -	bool clear_system_pages;
>>   	int ret = 0;
>>   
>> -	/*
>> -	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
>> when
>> -	 * moving to system as the bo doesn't have dma_mapping.
>> -	 */
>> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>> -
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -703,10 +683,8 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)
>> :
>>   						(!mem_type_is_vram(o
>> ld_mem_type) && !tt_has_data);
>>   
>> -	clear_system_pages = ttm && (ttm->page_flags &
>> TTM_TT_FLAG_CLEARED_ON_FREE);
>>   	needs_clear = (ttm && ttm->page_flags &
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> -		clear_system_pages;
>> +		(!ttm && ttm_bo->type == ttm_bo_type_device);
>>   
>>   	if (new_mem->mem_type == XE_PL_TT) {
>>   		ret = xe_tt_map_sg(ttm);
>> @@ -818,7 +796,7 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   		if (move_lacks_source) {
>>   			u32 flags = 0;
>>   
>> -			if (mem_type_is_vram(new_mem->mem_type) ||
>> clear_system_pages)
>> +			if (mem_type_is_vram(new_mem->mem_type))
>>   				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>>   			else if (handle_system_ccs)
>>   				flags |=
>> XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4ecd620921a3..e73fb0c23932 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -333,8 +333,6 @@ struct xe_device {
>>   		struct xe_mem_region vram;
>>   		/** @mem.sys_mgr: system TTM manager */
>>   		struct ttm_resource_manager sys_mgr;
>> -		/** @mem.gpu_page_clear_sys: clear system pages
>> offloaded to GPU */
>> -		bool gpu_page_clear_sys;
>>   	} mem;
>>   
>>   	/** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> index e0ac20f20758..9844a8edbfe1 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> @@ -117,17 +117,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>>   	ttm_resource_manager_init(man, &xe->ttm, gtt_size >>
>> PAGE_SHIFT);
>>   	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>>   	ttm_resource_manager_set_used(man, true);
>> -
>> -	/*
>> -	 * On iGFX device with flat CCS, we clear CCS metadata,
>> let's extend that
>> -	 * and use GPU to clear pages as well.
>> -	 *
>> -	 * Disable this when init_on_free and/or init_on_alloc is on
>> to avoid double
>> -	 * zeroing pages with CPU and GPU.
>> -	 */
>> -	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
>> -	    !want_init_on_alloc(GFP_USER) && !want_init_on_free())
>> -		xe->mem.gpu_page_clear_sys = true;
>> -
>>   	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini,
>> xe);
>>   }
