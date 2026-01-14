Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E888D1CF4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91B10E5D3;
	Wed, 14 Jan 2026 07:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EioH/kn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB8810E102;
 Wed, 14 Jan 2026 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768377138; x=1799913138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U4xUkMvOumtcWF9R4RXf+MX+AMNwewME9TyBP0ZJeIE=;
 b=EioH/kn5YlkgmuxX1ao6JiuWqAMEWDdiQwAHBxbfg8lTmdBLH8+y5UiQ
 KAH0xgY4PxUdZ4G0BHn+OPNml8cHbgAYtwM7UHTY1gpMwJ2U8fRMo8j7U
 tVQJ+RUGXJRDR1rYagGzq+fOQWdTt1EwRcSI0SoeVuYmPvtPBQoOGAB4T
 Y7QjPRQd0igzB2yRlF4NRGgkCXyf4O3yFq8Syq2P02pvVexhfuc52zcM2
 BuVD2Wr9FI+oZP8vRpR0girjU9YDMAWVn3ZByVpnjX8HIAH0sQKZXE2KK
 l3+xKvJYsfGF8p1oldo/r/uiu1YlLOZBbznel3s139r6vQD3tOgzA6b3y g==;
X-CSE-ConnectionGUID: 7QNGlvdiQnuspBdFv8nKKg==
X-CSE-MsgGUID: bqcuFkElSGGIiwesWzcTnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95145358"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="95145358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:52:17 -0800
X-CSE-ConnectionGUID: iLV/LVrrTAiRlWlqJZo93Q==
X-CSE-MsgGUID: zG4kukdVQX+i1WjuOPjSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209118201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:52:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:52:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:52:16 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:52:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqu678J6Rufzy9NNeWKy7HsOufGtMklrkO06YN6eIVCk7rEec/Xxr7RGxYVW6VUPf92O83C0RU8PNc58AcFIavBypDGEz96eAHkyeTiIoLe30Sgem830D3lK6AZVKuovJKKqRWggrN20nOjYKmZnFSmNaaTSMO80nWcTrVcdpxoS/BvOzuwdviJf1jCcvEYajwiYilFa+TRAnYX0BORcd1Y5ea0i8iNvoX5GHwSFCXHL5dlAgOI0zFBDfI6Ziwl0g+E54WrRsMZp8giTgdNEbvHs6QFDarREAT5nT/HxLmJriwj1M6Pd5mlsQ0qAyxC41YGadu6zMqiyXWdn2qFMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzwQT/LE8erp+ddAyzb4mg2EAWgZdId22D+mfIctT4E=;
 b=Mr3DcmgqqkjEFaRydjKtUYrJxr8Q8x11haZwWlX8WT2Z2yzaySdm0c1xWM5VLxKZw7gJVY3dxFggg/I57cViVbPCRgF21wvIL99sqyzz+rBKhPkKGw13pYYM4qyZyC1xRT1HuFE/K7uCIAs3vEhmN7UR1gY4uM7b1oEQ9tKpTh8cQZ/kN/YgC5FYYvsCKoRvnIhWVvnvYfygoCYcgqUAbsNmN/aQUngcD5bDOV+7JVS+SZ3XY9lb8BGkhZJ6kSiapSzRMJMO+VKwNxO8tOmY6vP2ipmr2+wMkO4dnsC0eeOmjoi5k1dGvs1X1R4HYAvReH9yvTYlyS9R8gcy6mbyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Wed, 14 Jan 2026 07:52:09 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:52:09 +0000
Message-ID: <1a8affb5-84fc-44f8-9e82-7383c70bdd0c@intel.com>
Date: Wed, 14 Jan 2026 13:21:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] drm: Allow driver-managed destruction of colorop
 objects
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
 <20260113102303.724205-7-chaitanya.kumar.borah@intel.com>
 <DM3PPF208195D8DEC7C0B5F2A05CE68ACB2E38FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8DEC7C0B5F2A05CE68ACB2E38FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f2710d-e507-4ea4-e132-08de5341d184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFWbXVrTjZZNWRpVEFqanJzVHBSOVVtdllVeHhXN3J1cUQzOUl5UThOaUJt?=
 =?utf-8?B?WXpDZ0sraVBXM04vR04xTnZoa0VMWEZuVk8zcGs3d3BqZDBPZ1AwUmVpOGJ0?=
 =?utf-8?B?bmt1UEgvcVFITEE0VXQ3RTF5VStzbmUybWcrVTEvTC83MGxFRVVtNGNmK0cw?=
 =?utf-8?B?aStIZHpKcGJGOTlYSUxwWWlvRC9RL0FPKytEZ3U2RzlQa1M0Qld3R0swdDZW?=
 =?utf-8?B?WUNXeWV5bEVuOXFzN1Vib2dTUFBxTzVZQXgzQmJvVm05aGlPRHNkQ3U0M1ZK?=
 =?utf-8?B?ZVM5Y05WbG56VmlQLzNZMU1sd3A1WkppUHBmOTBFaldXdFByd0JPeGVreHFz?=
 =?utf-8?B?TlB4UmVFekVmNDVxWlVLZHFjT2ZaODVCdCtWamZjUUNQbW1EUTBaVnhuRXly?=
 =?utf-8?B?OThMUU5pWlUxNyttVEZVR245QWo5S1FISSthWUZOTUFLVW1wTGNRL2YraHd3?=
 =?utf-8?B?V3RjZTZrNk5oTnR6Z3FJNnpnSTRkbGJmWTM2QzhrMGZEN2V0R05PaVZJVjVa?=
 =?utf-8?B?eEtRMEJRdEpzZFNoMTNINTF1L09KQ2Z5RDFoUEhtQTNJQ1hZbmlXdTJ2aHE1?=
 =?utf-8?B?ZTVIa0RXSzByRTJaQkRMdFpZR2w2aEJhdFJjWmVUNlVsM1V4QnFHc216eS9E?=
 =?utf-8?B?YmZZZXRjUkRrUjIxdHJJN0N1MzUyRHFKNTNJOVF2RnVJRGpWSDZzYWRGR1JM?=
 =?utf-8?B?YnQ2RFlQNU9zZy8wRFdDTlhGZkp0L3pnR2x5SGhpTk01VDNmUlJrU043a1FK?=
 =?utf-8?B?WUtGSDJwZytHM3I1eDlSMmVLVTMxZGVweVZJZnFMY1gvbmw1WTNkQlk3UGNP?=
 =?utf-8?B?K0RWMGIydzB6enlrNkFDSndsd3RRZys3Z2xYM1NZUUlCcDArU0E4Q29hVGdj?=
 =?utf-8?B?dkozMzJnU0lya3NrelRtTDBGbGNiVHBYWk1kR0hGSkRBVzVEaXNjYzdtR29D?=
 =?utf-8?B?OG55eldUQzNaRUpWQXcwdlRHbmF0Z1lkRG0wVktxSDZTWTd5Y0RmRG9KVWdT?=
 =?utf-8?B?WStUblIvZXFCT0cwbC9La1l0SE1jdmI3MENwRmd4V2xyMFd4eUZ3ejE4ZFdz?=
 =?utf-8?B?RHJKOVFyYjhqQ2ZjS1hGay84WERnZ1cxTkkzb3dCcmVwVko4Wk9vNHFmb0w2?=
 =?utf-8?B?RXhMSk5NWWpaaHNUTHFNMEJieDJKOW1MRUdkdlZwR3lzMG9RaWs1dGhNc0pQ?=
 =?utf-8?B?TjZ0VVE2c1VJelFZU3BvK3QrbTE1UE1CdXpRbGZ1WC94anZJUTZpSEhya2hu?=
 =?utf-8?B?bzdQTzEraGVwbzFVbW8yMUd0YmIvaFNucVJUSnVBdlJ3cmNVUEszUzJuL2hY?=
 =?utf-8?B?L1ZyTVdlVFNnQlJIdURYcjR5Qm5GOFlXazRIczhXZ2NDMTIwbUkwNTZreVVJ?=
 =?utf-8?B?bWtzQjJtcEdGSC9CSzM0ZXNzVUN0MG9KSmd5VGtQM2pKT0hZNGVYZjc0YUk1?=
 =?utf-8?B?YjhNc0EreGpvUVNGUXh4aXA1dHJ6M2dEak9ZVURiM2o0MzZoNmJaK3hKeGZZ?=
 =?utf-8?B?cWhhNzZtMkcvZHB6U1NZczY4b2JhMlVLQU9rZHVUUjFzYmNVUC84eTFWaXNi?=
 =?utf-8?B?WGJ1cGRZZDFnK05pSzBoV05laXVTNGRGNzRDYkRwMStYUFh4Qy9qTFJMTHlk?=
 =?utf-8?B?b2tRL243NnFsbkM3VlpLbzhJMVJkcGhHQ0pNbXo1TUtFUEtVZ2g2VWJPeUxY?=
 =?utf-8?B?UlJoN0M1cDBKM1daeW12cVEzeWdMVUkyMW5rSUtOM0E5RzFLSG5VUVdvQW0y?=
 =?utf-8?B?T3pTOGwrMXpFV2lxOTNxUGluaTlNSndRbTNGQkQrU0tTWm05ajhPWkFJQnJi?=
 =?utf-8?B?Y1BUdnR5d3dsQ0lidStXb1U3Nm9yRzZ6YnZZa2lLNGd2Uk05MXlicDdrYktm?=
 =?utf-8?B?bFJ5SVNTcGluUno2Y24vY3R2Tk5iSURGVVJCTk9UM3RHVVRTVE1MMlRIOHJY?=
 =?utf-8?Q?2fLvqczLSGP/BUVGaW5JArp5xhDcs2PZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVg0ZDdxb3lvdFliZnBjdHNNMkNMT3NxSVV4UUlsd1NRY0VWMVRsMThCZUpn?=
 =?utf-8?B?SXZHTjRoS2R4a3RXclhTc3FrTFpYUkp1dXh4a2VXR2NpdDBBdTM5RDZlcU1N?=
 =?utf-8?B?WEsvRGJuUkdrSmtQUVJnMENCRWw1aUJmeXpVUXpaaFN2OUhqamRPL0VVazJV?=
 =?utf-8?B?UzdkTUZNTDBmYkpJQW5hc2RxeG80MGZXOXluYkJSOEYyQ0EyS1podmxpZ2xw?=
 =?utf-8?B?WUx4UmZIajJUWG9rM0t5SVMvLytyejdnQllxRXg0T0FINWEycFl3S1hHdXNP?=
 =?utf-8?B?b2VNUUpVbWtDRGpsWEgva2pnekpGZ2ZnV3dXci9MSFZScWV4QkIxMG9OQ0s5?=
 =?utf-8?B?d0NTd0JtNTVTSjk1a2xxS1hKS25wMWk3L3VZRWVIMkhzM3hnN0dNc0JKRXV2?=
 =?utf-8?B?bk5IMHkvTHRCOFRtbnJQcGJnN2Z6MGEwSW8rK2Z5ZGhnSUpnS0pHSHQ1ZEFs?=
 =?utf-8?B?V09ua3JIZGFxbktERGhoVGNCUmp3cEc3WkpoQ0ZuVkl0TEV2SXUxZXhsOUhZ?=
 =?utf-8?B?UXQxUnJ6NnNNSlREbG15aFRIaFJVYkNWMmh0WThlVTVYMktXMUR4cXFtSHJv?=
 =?utf-8?B?dmUwL20zWFNXSWEycTRuQjRsUmFxc2J0VmE0OFNleFRyb3ZXcEtYUC9ia1Vp?=
 =?utf-8?B?RmpyYUF5TnRlanNyMHBYSHZwUU5VM1RxeTZZbk0vZkZnaXpxWkwvY1k0eUpQ?=
 =?utf-8?B?OEJIZ2NERzM2Z2U1dEJTSXREMHNYaGQ2L291Zk9Pa3dnT0xOVUg1M2lraTRj?=
 =?utf-8?B?RXdZZHNpWWRNMlVMWHR1ZEV3VHBNRDk0SFdIcGIyZkxFWmJLMUFjd3oxenNi?=
 =?utf-8?B?eUpNSzE5NGVlM0dOTm53dmxzSTRLZnRZbjl4S0lvdVJSUTdsRkx0Nm1SbWZJ?=
 =?utf-8?B?WWd1d1JzYXpSSUtqNi9iMlVRQytqYVRBL0hQaHEzRUtucERjVjl2UHRLQVZ0?=
 =?utf-8?B?NnlDMExadGJjZVp3UzZMRkg4dllubmxWc1UrY2NuTmRPNnlDeTV4cjhiMzdK?=
 =?utf-8?B?TE8yY2g1c3RISGdCQ2x2Z0NXR2dmMTVBY2VwV211RTRCbFh2bllzbFRCUGtR?=
 =?utf-8?B?bGJuVk1NVkpJT1d0NjI3NVhsNzZqMjFreFpyWFdUcVFMbUdHQlVwcFZBMWlV?=
 =?utf-8?B?Q2t1bUs1c3o3aHpoSnUyVUc1c0ZIc0NHSmRBaGovdlFnT0xKM09aQUw1WUlW?=
 =?utf-8?B?RHRqbFNPSENwOXU4VDR4SndnOEo2TGc3Tk50NmRubUQ1TDNmdnExS1BYZlNG?=
 =?utf-8?B?bFBvTjBlS0YvWEZGVU53V3RqVXg2dFJ0VkcvN3NVRDJpaDN0VTNlSGl0d0dt?=
 =?utf-8?B?eWV1cTg5ejNBYUhXZGU1NTlDOXJnMHhrMjhOR09QZVV1RkxzMVBKbnZpaFFj?=
 =?utf-8?B?QzIzTEtOM0Q4eXFKdy8wbi9GbGJnKzZwcmV6MnNINERWUHNMSkhXUWxSMlNS?=
 =?utf-8?B?bFhkbmlEYXpkNlMvYTZLVWh1ZXNlbHQwN0E1M0xlekdRL0tPMCs0OWQ3S2pE?=
 =?utf-8?B?SERhMlcyYklrRTNGa3I5ajB5YnJUSW9EK3NXKzdBd1l6VjlSZ3V2d1U2LzE3?=
 =?utf-8?B?TDMrMDIwL2tmdzJ3QXVxWGJkb01BMzlKWEV3ZEk1TVpCY2JYSFBvUEJoNFZD?=
 =?utf-8?B?MU1vbnpUTzF6U2RURVFJdytVMVhLNmo0SlFDREdWVk9ld1FCenFPUTJNM2do?=
 =?utf-8?B?RHJmVHRkMXJaRS9Xa1VkZ3N4NnRZU1Jpc2pRZ2lrV3F5WURnSk4xYUpKNzJk?=
 =?utf-8?B?aDhkRlBwQzVDWXp3U1o3NGZyUkJqcEVGNVUwNENIQmZhaloveGFxbUlBOGpZ?=
 =?utf-8?B?Z2gxUnJlUEp1Ty9pd1RhT296M2Naa3h0M0JpZko3OWhNcFhHNi8xSzZiUmpK?=
 =?utf-8?B?TlFBNW9sRnEwbm9RbXlOV2MvbE9ORlE4d1pWV1l0b1Z6dlFnbHRocXFIS0JE?=
 =?utf-8?B?UzNIVHFXVDUrTEZ2TjlSSkx5b0EwZWdZbFA4VzB4QkYvM3lXd3ZvSVVhY1R1?=
 =?utf-8?B?cGkvUXl5Z0xBdjVpMFg0M3B3S1lpZndXTm5MbGpqMnBTZ0dmNlBpaW5CdWlr?=
 =?utf-8?B?UitJOGpEZzVIQnFrNGlQbzB6bEthTkJIcEgrOWxFdlM1Z3Rqd2FaUnpFN29K?=
 =?utf-8?B?V2hLQmZ5ZlhkWWFpRVBvYm1Kcm15REtqaEVIUk4xMjRjai9qV3JweEswMnNR?=
 =?utf-8?B?NmJlVnBmZWEzU0hFU0NwdjVQb21IWW5OYTFhSXR6Z0JGY29vWEs3YThVOUJ1?=
 =?utf-8?B?VVVZMzhSNlhTN1BDRG5TNWd0MlN6aUhoZlFkZ0M0V3l2MjllWHk1bld4MjBZ?=
 =?utf-8?B?dzdSSG1tQjc5MjhRRGFnVk5YSEJiQk5ZRkJyZ0NaSVZPL1k4Um51ckxXWWZj?=
 =?utf-8?Q?ZPrP9ztXKrJIpr7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f2710d-e507-4ea4-e132-08de5341d184
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:52:08.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBaODGMw6tiLZmybpfN7uCQgJOE9erFtPSwg6SzUrgBTx3nb1ajrFxakTqBwMnC8LCwaGNK91fIscDtpVtf/bt5ghrXtkMs9P8/VxcgsspQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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



On 1/14/2026 11:07 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH v3 06/13] drm: Allow driver-managed destruction of colorop
>> objects
>>
>> Some drivers might want to embed struct drm_colorop inside driver-specific
>> objects, similar to planes or CRTCs. In such cases, freeing only the drm_colorop
>> is incorrect.
>>
>> Add a drm_colorop_funcs callback to allow drivers to provide a destroy hook
>> that cleans up the full enclosing object. Make changes in helper functions to
>> accept helper functions as argument. Pass NULL for now to retain current
>> behavior.
>>
> 
> Just to point out checkpatch asks us to use u32 instead of uint32_t

That thought crossed my mind as well, but the file already consistently 
uses uint32_t. If cleanup is needed, we can follow up with a separate 
cleanup patch.

==
Chaitanya

> 
> Regards,
> Suraj Kandpal
> 
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>>   drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>>   .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>>   drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>>   include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>>   5 files changed, 66 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index a2de3bba8346..dfdb4fb4219f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>
>> amdgpu_dm_supported_degam_tfs,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_mult_init(dev, ops[i], plane,
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL,
>> +DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>>
>> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>>
>> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   			goto cleanup;
>>   		}
>>
>> -		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> NULL,
>>
>> 	amdgpu_dm_supported_shaper_tfs,
>>
>> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   		if (ret)
>> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   			goto cleanup;
>>   		}
>>
>> -		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
>> MAX_COLOR_LUT_ENTRIES,
>> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
>> NULL,
>> +
>> 	MAX_COLOR_LUT_ENTRIES,
>>
>> 	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>
>> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   		if (ret)
>> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   			goto cleanup;
>>   		}
>>
>> -		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
>> LUT3D_SIZE,
>> +		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL,
>> +LUT3D_SIZE,
>>
>> 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>
>> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   		if (ret)
>> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>   					      amdgpu_dm_supported_blnd_tfs,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
>> MAX_COLOR_LUT_ENTRIES,
>> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
>> +MAX_COLOR_LUT_ENTRIES,
>>
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index c226870fde9e..2bce29176ab3 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list
>> drm_colorop_lut3d_interpolation_list[] =
>>   /* Init Helpers */
>>
>>   static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop
>> *colorop,
>> -				  struct drm_plane *plane, enum
>> drm_colorop_type type,
>> +				  struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				  enum drm_colorop_type type,
>>   				  uint32_t flags)
>>   {
>>   	struct drm_mode_config *config = &dev->mode_config; @@ -109,6
>> +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct
>> drm_colorop *co
>>   	colorop->type = type;
>>   	colorop->plane = plane;
>>   	colorop->next = NULL;
>> +	colorop->funcs = funcs;
>>
>>   	list_add_tail(&colorop->head, &config->colorop_list);
>>   	colorop->index = config->num_colorop++; @@ -218,6 +220,7 @@
>> EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for the new colorop
>>    * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init
>> enum values,
>>    *                 created using BIT(curve_type) and combined with the OR '|'
>>    *                 operator.
>> @@ -225,7 +228,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -				    struct drm_plane *plane, u64 supported_tfs,
>> uint32_t flags)
>> +				    struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				    u64 supported_tfs, uint32_t flags)
>>   {
>>   	struct drm_prop_enum_list
>> enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>>   	int i, len;
>> @@ -246,7 +250,7 @@ int drm_plane_colorop_curve_1d_init(struct
>> drm_device *dev, struct drm_colorop *
>>   		return -EINVAL;
>>   	}
>>
>> -	ret = drm_plane_colorop_init(dev, colorop, plane,
>> DRM_COLOROP_1D_CURVE, flags);
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs,
>> +DRM_COLOROP_1D_CURVE, flags);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -303,20 +307,23 @@ static int drm_colorop_create_data_prop(struct
>> drm_device *dev, struct drm_color
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for new colorop
>>    * @lut_size: LUT size supported by driver
>>    * @interpolation: 1D LUT interpolation type
>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -					struct drm_plane *plane, uint32_t
>> lut_size,
>> +					struct drm_plane *plane,
>> +					const struct drm_colorop_funcs
>> *funcs,
>> +					uint32_t lut_size,
>>   					enum
>> drm_colorop_lut1d_interpolation_type interpolation,
>>   					uint32_t flags)
>>   {
>>   	struct drm_property *prop;
>>   	int ret;
>>
>> -	ret = drm_plane_colorop_init(dev, colorop, plane,
>> DRM_COLOROP_1D_LUT, flags);
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs,
>> +DRM_COLOROP_1D_LUT, flags);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -354,11 +361,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct
>> drm_device *dev, struct drm_color
>> EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>>
>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -				   struct drm_plane *plane, uint32_t flags)
>> +				   struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				   uint32_t flags)
>>   {
>>   	int ret;
>>
>> -	ret = drm_plane_colorop_init(dev, colorop, plane,
>> DRM_COLOROP_CTM_3X4, flags);
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs,
>> +DRM_COLOROP_CTM_3X4, flags);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -378,16 +386,18 @@
>> EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for the new colorop
>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop
>> *colorop,
>> -				struct drm_plane *plane, uint32_t flags)
>> +				struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				uint32_t flags)
>>   {
>>   	struct drm_property *prop;
>>   	int ret;
>>
>> -	ret = drm_plane_colorop_init(dev, colorop, plane,
>> DRM_COLOROP_MULTIPLIER, flags);
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs,
>> +DRM_COLOROP_MULTIPLIER, flags);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -406,6 +416,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>>
>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop
>> *colorop,
>>   				 struct drm_plane *plane,
>> +				 const struct drm_colorop_funcs *funcs,
>>   				 uint32_t lut_size,
>>   				 enum drm_colorop_lut3d_interpolation_type
>> interpolation,
>>   				 uint32_t flags)
>> @@ -413,7 +424,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device
>> *dev, struct drm_colorop *col
>>   	struct drm_property *prop;
>>   	int ret;
>>
>> -	ret = drm_plane_colorop_init(dev, colorop, plane,
>> DRM_COLOROP_3D_LUT, flags);
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs,
>> +DRM_COLOROP_3D_LUT, flags);
>>   	if (ret)
>>   		return ret;
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> index 04af552b3648..d3d73d60727c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
>> *plane, struct drm_prop_en
>>
>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>>
>> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane,
>> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane,
>> +NULL,
>>   						  PLANE_DEGAMMA_SIZE,
>>
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +39,7 @@ int
>> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>>   	prev_op = &colorop->base;
>>
>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>> -	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>> +	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>> NULL,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		return ret;
>> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
>> *plane, struct drm_prop_en
>>   	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>>   		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>>
>> -		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base,
>> plane, 17,
>> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base,
>> plane, NULL,
>> +17,
>>
>> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>   						   true);
>>   		if (ret)
>> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
>> *plane, struct drm_prop_en
>>   	}
>>
>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane,
>> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane,
>> +NULL,
>>   						  PLANE_GAMMA_SIZE,
>>
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
>> a/drivers/gpu/drm/vkms/vkms_colorop.c
>> b/drivers/gpu/drm/vkms/vkms_colorop.c
>> index d03a1f2e9c41..9e9dd0494628 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane
>> *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> supported_tfs,
>> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>> +supported_tfs,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane
>> *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>>
>> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane
>> *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>>
>> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane
>> *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>
>> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> supported_tfs,
>> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>> +supported_tfs,
>>
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>   	if (ret)
>>   		goto cleanup;
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
>> 3056f3f02597..bd082854ca74 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>>   	struct drm_atomic_state *state;
>>   };
>>
>> +/**
>> + * struct drm_colorop_funcs - driver colorop control functions  */
>> +struct drm_colorop_funcs {
>> +	/**
>> +	 * @destroy:
>> +	 *
>> +	 * Clean up colorop resources. This is called at driver unload time
>> +	 * through drm_mode_config_cleanup()
>> +	 */
>> +	void (*destroy)(struct drm_colorop *colorop); };
>> +
>>   /**
>>    * struct drm_colorop - DRM color operation control structure
>>    *
>> @@ -362,6 +375,8 @@ struct drm_colorop {
>>   	 */
>>   	struct drm_property *next_property;
>>
>> +	/** @funcs: colorop control functions */
>> +	const struct drm_colorop_funcs *funcs;
>>   };
>>
>>   #define obj_to_colorop(x) container_of(x, struct drm_colorop, base) @@ -
>> 390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device
>> *dev);  void drm_colorop_cleanup(struct drm_colorop *colorop);
>>
>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -				    struct drm_plane *plane, u64 supported_tfs,
>> uint32_t flags);
>> +				    struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				    u64 supported_tfs, uint32_t flags);
>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -					struct drm_plane *plane, uint32_t
>> lut_size,
>> +					struct drm_plane *plane,
>> +					const struct drm_colorop_funcs
>> *funcs,
>> +					uint32_t lut_size,
>>   					enum
>> drm_colorop_lut1d_interpolation_type interpolation,
>>   					uint32_t flags);
>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> -				   struct drm_plane *plane, uint32_t flags);
>> +				   struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				   uint32_t flags);
>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop
>> *colorop,
>> -				struct drm_plane *plane, uint32_t flags);
>> +				struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>> +				uint32_t flags);
>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop
>> *colorop,
>> -				 struct drm_plane *plane,
>> +				 struct drm_plane *plane, const struct
>> drm_colorop_funcs *funcs,
>>   				 uint32_t lut_size,
>>   				 enum drm_colorop_lut3d_interpolation_type
>> interpolation,
>>   				 uint32_t flags);
>> --
>> 2.25.1
> 

