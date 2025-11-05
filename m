Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA8C35A2F
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3E310E745;
	Wed,  5 Nov 2025 12:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWXbytEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67EA10E745;
 Wed,  5 Nov 2025 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345533; x=1793881533;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kacjmo5JK65/jizdXl2G4ZH8M5m7ZK0yhFvouQQGCk4=;
 b=BWXbytEqHU364uupwNxFLxN4LEIfkVM6t0EL7l4Ft58D0rLG/DppN9AS
 cZmzfTKOvwzO16gh0L7WH5JjhhFiqh65FIcaZWAfIoJl4125a6fFbMJl3
 GWp2Pk1tXlCWAoO1HtXL5UPBBcHp0Ba8S5uU/UT98mPf5pm2or+MRARJg
 53a7G7lxgjVKu1ymiZqqGBBPMgNOVQWpSKnIuFm8THUhmLFVG9cW2eeTS
 5H2YkBX98p8wPOx7RDo0isWemml1Bwop5yY8FjWEbfZnB7ORhvr+vEz5h
 2X7Odw6ZuuNKJJHKw5aKzkJR9J3y99ZML9IoWmkUFvOXJ3TnpeFiBSp46 A==;
X-CSE-ConnectionGUID: 0hWehhnuSY+JJXrpF8wzLw==
X-CSE-MsgGUID: E18FU2igR0yU3l8dp7uA8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75906429"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75906429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:33 -0800
X-CSE-ConnectionGUID: eDtTup4BRb+CJ7b2HglgmQ==
X-CSE-MsgGUID: uQ+ymS7+T92eZouSmahyWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187133185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 04:25:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhJDiIXv7sp1+3d5/+pmRUnm0IU9i3BeXGVjAGtHRdTXYPxTp/7TvXgCzQstpKOgfIBVoopY27KbHHtdZnJTXEueb0oeRPyJmlAePzSJCGuKj9ddR1QIXiiJKJPxGHwtKkAjXoer7FyO/xl7S7pzN02C5Wef7vDnKpGkEw5UhGUj7w5uWkssHvmNgk4bO0/N9ZPnvZpFiM1x1/w9Ppi79e/fNKWByf1ydeYNcMcxDJCDfNTl/96fGJXHMNpfs6t2fJ+tHI6ebRsuMeClXm8CduK4SSgGP/0j53z/tmpjf5orT1M9+YvZrvk856mGjppb71T1m7lwjar7HzWfc2Wexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bciunud81pmeQhcRfXXwq/XOUFubvjVlseZ1rsYjFhc=;
 b=WtKKXMgkRMMIjIyX/x/0ED/NVAFsLEdM7WU0MMK1/kfx17eRb8zE7sGLKdC99MjSU+AL99KwCLj0U+kTqDE2zGK4jSoBd3bTBE9Ltk9hrSgrfMM7W2h507tS3baqgyhDvM6n6UO+EeRttCWTVTZy+WgDXQTNIsjCqVxLNHqtv8N5D0l/8iI0xPgR42JK72Plunje8GRo2SW56raHibB3zXTI5PYL+DjRVj+w0w0g8uezjlqIvvxFPMrByLu4ggQ78M783jMbFu8JDbqjBfbTUkeAxX2v94Qg/W1YjQoidmi+4nFkksQ8xaJGuVDpHBXc8ijsQpI7EA8KGiV8FulkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 12:25:24 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 12:25:24 +0000
Message-ID: <87b85c18-64e9-408a-ac6c-40ebe01a0407@intel.com>
Date: Wed, 5 Nov 2025 17:55:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 12/24] drm/i915/color: Add framework to program CSC
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
 "alex.hung@amd.com" <alex.hung@amd.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-13-uma.shankar@intel.com>
 <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D2955A727287B465E3434E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D2955A727287B465E3434E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6bf5b0-a647-4d9b-c4ab-08de1c66653e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVh4Ynh5SFZmdUpnSWFENVRnUnA5cVNwYjNSeVlzZUlLUXhzaXFtZWx1djhk?=
 =?utf-8?B?dWF6RElrRUJrN3haSHRXNGdyZmRjRWZIRG1HNU1MV0JKNkZqNGxxMyt6UWNk?=
 =?utf-8?B?YzlzNHEwVDFxNUFlOWt2YlVjUElJczBqVXkxSi9kMm1yN0p2UDkvQ2IyNHRl?=
 =?utf-8?B?aUdOM2VkMTNRVnd4MmpGZjBxck1FMTdDMkZhSUtUQk01OTd6NllWZElQY0xO?=
 =?utf-8?B?cWZ4VUdXTnlMaWlKWXE0K1FPSmovT0hRTGZlMC9YTHpaTFppQXBxZ3lvNkNE?=
 =?utf-8?B?L3VqQWZHaHB1bkZHVGUyNDVCNE8rUFBVLzJqd1dab24vcnZ5UDIvZCtvOEg1?=
 =?utf-8?B?VEw3Zi9CRFZaZjhTSE44L0pHSFR1eGVyTnQxN1plSisycUlRNFUwL1ZBOHpY?=
 =?utf-8?B?T28renpTM01wWmxGR0tXZ3FQMUtMcmZtWFY5Rk5IOGFKNGFHem1lcTNrb1pl?=
 =?utf-8?B?Yk9OWTZTSU8wWndFakNVSmg0YkkwVWhiRFdsWmYvaEZCY0pFOWViRmZ6Vk9Q?=
 =?utf-8?B?VEpkbXJyaUpHOGpSQ2x2ZVZvYWhrZUx3eGxxN3VpQXYxV2N3Ujhzc3Q0bVRZ?=
 =?utf-8?B?UWxHcXMrOC80TEF0YVNVKzBTaWxBVGJiTzd0anNxcmJ4L1gwODFRbWJBWENx?=
 =?utf-8?B?TkszZ05RTU0vanlhQnVVQ2hSLzVZMzBmSkJnOTRyZ01KMWZ1a2pMcUNDb1FC?=
 =?utf-8?B?MENjbEt6YmJuckk3b2Nncy9lVllPdUZuR0E0eWo3ZkJZTlhoTnkvQlg5UCtE?=
 =?utf-8?B?dC9lTXlLdE5FVnpwaWJhUXBIZE9pUW1seGo2UnlKWmpLYXJ2VjdKb2t0aTBk?=
 =?utf-8?B?SXFiNmdrSFhiRkVocGNTMUhxVjN1bEZPZ0JBYXJleDdORE10NWlncERqNGJl?=
 =?utf-8?B?dnFEVmdhaTIwVTZtcC9kMk1LZ1pLdlZvb1A5RHd2Rnc4bFpxeWptbzNQUEJE?=
 =?utf-8?B?WHlQZ3Fqcks0bkJBSkdvRTZCT1VRS1NIbkc1TFBNVG9QYURHbDY5ci96Z3ZB?=
 =?utf-8?B?N2ErYlJQcW1xaFYweTNvcDQ1ZTNCMVFnVUpTUmcvQ0diUUtIRldtUVZzUWJS?=
 =?utf-8?B?MENrRjlkNlJUUzg1UGFLNFJySEh6YW1xRXloS0FNdkx6N3NyQ2lORktWMWJk?=
 =?utf-8?B?eVlWZjEvZ1M4YTZyNHkrRE1BVlA2eXlhUE9iUmIrVmxNbGZUYVVXT1lnVFJF?=
 =?utf-8?B?TitQNU1JQkJQK0pmc3R0WU9KclpscWJXR0NHRS8ydUl6SCtSajhtN1pDN3lI?=
 =?utf-8?B?S2V0VkNpMWRnT3UrYXJqSVNRQXIyS3FPRUNEa1JjUS9JVzh4Z0RvK0J2aG5l?=
 =?utf-8?B?Z09ZVFUwUUx3dU9FcDRaNnQrRHBMRm9pRGovL1FVZnVQQnBvc21RWUNGOXZF?=
 =?utf-8?B?cmtab3RMT1d3N2htd0Zxdkl5ekN2RHlLaElyUnQwRm82RElnekQxWTlxVmUy?=
 =?utf-8?B?R2lpRmEzTUFNazZiOVVhZ2FudDR1V0VNY3dlTlZTekhVeTVVMEd1STRYWWg3?=
 =?utf-8?B?YkZTdnNwNXBhckRuV2FycVIweDRIR0xFR3RjNzFnSUlEb0QxbmNmdERRdDVD?=
 =?utf-8?B?TWFRU0FDbTVwZU9QMzgzMEMrMHBMZWJSdVYxamhsVCtxWDZ1UmlyN2hnREht?=
 =?utf-8?B?SFpjZG50V1VoaGNVaG5lZ3ZKSjlxOFQvSzkzcjFpRHdtM3AyYkJZM3VHTTgr?=
 =?utf-8?B?TDQ2MXdUWU14TURtSTlvZzJQLzc2OFN3bit2cUtvV3NYWEJQWC9vR3Zkakhx?=
 =?utf-8?B?VDlwdFVLODEybGJIUnhseDlLUEtPZFVJVXpWTkJGRUsrSy83WDBLS0tpMVlI?=
 =?utf-8?B?SFFWa2UxYXVGSkJrc081eTJ1SUhBakdhN0R5ZzBuVjQ2SEtTdDl3U1UrUTFH?=
 =?utf-8?B?VFdPMVU4SG5nYnJZMkU5RnlxTCs2cnJhNUdiOEpMb3Z2RDFyYXJzaE15bDNV?=
 =?utf-8?Q?I5eJH4E+csGaf4My9jPKGgNj4Af6rZXP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZ4MUdCTTQrL1hsa0l2V1RnMzUyT1FQTTlmbXNuazZPL3lVMkU1V0lyQjJJ?=
 =?utf-8?B?VEZ4eGkrSytndG96ejIxOElNRUV4ZE5sTUcrTGJ6M1JvRzhyTkZDZGw5SGpF?=
 =?utf-8?B?TU1QVzlKY2xxVm1nQWExVytud2ZiajdCYVB1OGZteFo5bHNyK2lvUDBOSlNi?=
 =?utf-8?B?S2hXaUZGTEV6elJTSWlyeVg3cmNwK0ZJVTVyK0xRYVowNzNuTlJ4WG0xcWVO?=
 =?utf-8?B?aHVnMHRveGYxcTRKS2lOaUUwTk1QV2Z4MjBIUEgwOUJyeFNmaHVFbGEwbkdU?=
 =?utf-8?B?TjR1QURIa0twTDgzTEF3N2krUXZ6VGt2bFdCc0RUdVBZUTNTejhpeW9XRUZ3?=
 =?utf-8?B?dmNMV2FpUHptcnB0NUhrMmM3dXBjZnNwb2NlY0EzYWFnd0szQlpzaUJad0pm?=
 =?utf-8?B?R0lEOVVXRXArZ0w5M2tWTVYzMTU4Rm5DQ0JlUUQvNnpnTzhvQUVTc25Pck10?=
 =?utf-8?B?ZzI3N3hMTTR1eXRNR3NPRFh2WEI1by8rN3ZZamowUlV0WWR6bGZNTG02RVJ5?=
 =?utf-8?B?eFpHMmNuYmlxVkh0SDRRTWg2TUVGMmRvT3JrYytzMEk3bmhxQzJtZHBxY21L?=
 =?utf-8?B?N2xBNlFYaXUyT2JGVjFzQXBzZWRlcEpHYVpKVTJVbERQWThyYXl1SW82cmxr?=
 =?utf-8?B?cW41OFZza3JFdmQvUnhvSzZ4NVExMW1jQ2p0clBOQzQwbTYxZ1VNbnBPd0pE?=
 =?utf-8?B?VFFHWHR4Vnlqb3pqTVZDVHBoeTNSVSsveG5EdUo4VzdRRUJ5emdwMy9BVE9N?=
 =?utf-8?B?ZnF1em9KWnJUSWtETStYTUo1Y0xHWEJrNlhQalhIMkxLbFl2VkJ3b2dJQXZn?=
 =?utf-8?B?YlIrN2toVVhaR1dHckcvVlgxRmlSS0t3eWlEZm5wa01kS1NYYzIyOHpVelRa?=
 =?utf-8?B?VjNyNExFQ0Y4SUxGS1ZqRnl0c2N4ejZZVjA5TnVrWnRQNDFVKzlsZ2JnOG9o?=
 =?utf-8?B?elo0NkhGZE1pc2Y0MFpvYkxPbFlYMVd3dGdlYTBSRS9FMzlaWkIwSzFEWkV0?=
 =?utf-8?B?T01yUDZ4Z3NRd01FZlhKWVFkbzVaL2p2QzJscDVXbkRtQkZ0YXJxSFh4WW51?=
 =?utf-8?B?YUxuVWJoN1pWYnZ4U3VMZVQzYnMyRkgvVldqTHJsaitYenNRTG4xNEhPTE9N?=
 =?utf-8?B?NmozRC83elJKRmpKdS9aS29qNDZudE5laGFOWTdwUFRPck80Q2x3S09JRlVO?=
 =?utf-8?B?ZTVlVkdINC9INytHSE8zcklvZHlGZnZnMFEvQUIzZUc5akNwb096WEJGKzN0?=
 =?utf-8?B?SFpNcEFENVlBRTBFZUtFc0dCaHZzeTVvc0F3MWY0L0pKTnd0QzQzcGJYVmg2?=
 =?utf-8?B?ZGU5L1VHdjZQUXc2UFNMWXBFY3B3eFZJYzg1TUxaSkFRdDNDM3BJY2h3V0RJ?=
 =?utf-8?B?cU8xd24yUHp3YVBJSkR3US9LVm52bFlUekNwRDJheEdsM2w5OEVXeHRQVVJX?=
 =?utf-8?B?WTRFWjh2LzVUdXpPelk4R3FNc1BYa2tRbmp1VEhRY3padi9LTFBiU0VPSEQz?=
 =?utf-8?B?bWtJOW9PazVMeWViNTBpUUZqZHg5Wm9aNTQ1WnBVM0xLSE9vWVRoUmVlN25H?=
 =?utf-8?B?SkZXc2Izb0hSaGRQdVN2VlF4bnZzbzllTEo4TE92OHJpczhaY0JwbWFRSExZ?=
 =?utf-8?B?YjdXSFdtMW42UXhUemkyb1FqaXBmZlJrM09uNitBNldDUUx4U29tK3ZROW5q?=
 =?utf-8?B?bWk0U2VueWd4T1VSS2VnQ25CT3l0T01IZkhKMWEySTUrRXB2M1RhVXFtaVBQ?=
 =?utf-8?B?dTQrSFo3aE9CbGFEQndjeHg1Q3J1Q0o3SjBYZkVJdmRITW5HMkM4KzlkdUc5?=
 =?utf-8?B?bFVJRXdSUDBHSWxQUUhrY3FvdTNONG0vUXdFTlZJMXhGZVoyVGNheERScTFT?=
 =?utf-8?B?a1pjQmtIL2hyK3VTM2FwNHRTOGtJQ3JOSWdCcVJ2bGVFR0pEYkVEazFRRXVk?=
 =?utf-8?B?VGRmRXdCaTNBL3BRVEpEOUQ2N0tZUTFGdHh5YjFoeW9LMzdOcS9WbVk2UkIv?=
 =?utf-8?B?Q1NidTBpNXZhakxHVjE3US8xS3IrQmRqTFhWNk9VVko3UXF4RUlTNStHSVYr?=
 =?utf-8?B?RHQ0ZFBhRkZTY1NwZzBmVDkwSTA2dVh5U0UzMmxKazZ2ckV6ekVTKzkvY1ZD?=
 =?utf-8?B?UGxReTBZL21lRHBNNUwrNEd0c3NETW9FR2dPeGNBS0trVUlNOWxoRklLbHB0?=
 =?utf-8?Q?itggSzfK79db4a8YLSp1tSg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6bf5b0-a647-4d9b-c4ab-08de1c66653e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:25:24.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgR6WevZnzavkxlihp/oWWo5APsSoezulz8mvIbC93aBgt7LUzxNytNjSMmYPLrsiYBmzSpM66SZCQ9wezW4u4ruxlCP0fPI5yVeSQ4EAiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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



On 10/28/2025 1:42 PM, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Kandpal, Suraj
>> Sent: Tuesday, October 28, 2025 1:40 PM
>> To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org;
>> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
>> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
>> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
>> jadahl@redhat.com; sebastian.wick@redhat.com;
>> shashank.sharma@amd.com; Sharma, Swati2 <swati2.sharma@intel.com>;
>> alex.hung@amd.com; Shankar, Uma <uma.shankar@intel.com>
>> Subject: RE: [v5 12/24] drm/i915/color: Add framework to program CSC
>>
>>> Subject: [v5 12/24] drm/i915/color: Add framework to program CSC
>>>
>>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>
>>> Add framework to program CSC. It enables copying of matrix from uapi
>>> to intel plane state. Also adding helper functions which will
>>> eventually program values to hardware.
>>>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_color.c    | 14 +++++++
>>>   drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>>   drivers/gpu/drm/i915/display/intel_plane.c    | 39 +++++++++++++++++++
>>>   4 files changed, 57 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>>> b/drivers/gpu/drm/i915/display/intel_color.c
>>> index 363c9590c5c1..7c53572f729b 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>> @@ -3967,6 +3967,20 @@ static const struct intel_color_funcs
>>> ilk_color_funcs = {  };
>>>
>>>   /* TODO: Move to another file */
>>> +static void
>>> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>>> +				  const struct intel_plane_state *plane_state)
>>> {
>>> +	/* CTM programming */
>>
>> Add TODO
>>
>>> +}
>>> +
>>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>> +					const struct intel_plane_state
>>> *plane_state) {
>>> +	if (plane_state->hw.ctm)
>>> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
>>> +
> 
> Also the functions above introduced seem to be out of place introduce them later where they are used.
> 

The idea here is to get the plumbing in first and then enable the 
interface later on.

==
Chaitanya

> Regards,
> Suraj Kandpal
> 
>>>   struct intel_plane_colorop *intel_colorop_alloc(void)  {
>>>   	struct intel_plane_colorop *colorop; diff --git
>>> a/drivers/gpu/drm/i915/display/intel_color.h
>>> b/drivers/gpu/drm/i915/display/intel_color.h
>>> index c2561b86bb26..420d596dbbae 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>>> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
>>> intel_display;  struct intel_dsb;
>>> +struct intel_plane_state;
>>>   struct drm_property_blob;
>>>   struct drm_plane;
>>>   struct drm_prop_enum_list;
>>> @@ -49,5 +50,6 @@ struct intel_plane_colorop
>>> *intel_colorop_alloc(void); struct intel_plane_colorop
>>> *intel_plane_colorop_create(enum intel_color_block id);  int
>>> intel_plane_tf_pipeline_init(struct drm_plane *plane, struct
>>> drm_prop_enum_list *list);  int intel_plane_color_init(struct
>>> drm_plane *plane);
>>> -
>>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>> +					const struct intel_plane_state
>>> *plane_state);
>>>   #endif /* __INTEL_COLOR_H__ */
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> index 4b5124a08cc9..c709df0cea9e 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> @@ -634,6 +634,7 @@ struct intel_plane_state {
>>>   		enum drm_color_encoding color_encoding;
>>>   		enum drm_color_range color_range;
>>>   		enum drm_scaling_filter scaling_filter;
>>> +		struct drm_property_blob *ctm;
>>>   	} hw;
>>>
>>>   	struct i915_vma *ggtt_vma;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
>>> b/drivers/gpu/drm/i915/display/intel_plane.c
>>> index 36fb07471deb..cc8f3e15c82e 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>>> @@ -380,6 +380,43 @@ intel_plane_copy_uapi_plane_damage(struct
>>> intel_plane_state *new_plane_state,
>>>   		*damage = drm_plane_state_src(&new_uapi_plane_state-
>>>> uapi);
>>>   }
>>>
>>> +static void
>>> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>>> +				 struct intel_plane_colorop *intel_colorop,
>>> +				 struct drm_property_blob *blob)
>>> +{
>>> +	if (intel_colorop->id == CB_PLANE_CSC)
>>> +		drm_property_replace_blob(&plane_state->hw.ctm, blob); }
>>> +
>>> +static void
>>> +intel_plane_copy_uapi_to_hw_state_color(struct intel_plane_state
>>
>> This should be intel_plane_color_copy_uapi_to_hw_state
>>
>>> *plane_state,
>>> +					const struct intel_plane_state
>>> *from_plane_state,
>>> +					struct intel_crtc *crtc)
>>> +{
>>> +	struct drm_colorop *iter_colorop, *colorop;
>>> +	struct drm_colorop_state *new_colorop_state;
>>> +	struct drm_atomic_state *state = plane_state->uapi.state;
>>> +	struct intel_plane_colorop *intel_colorop;
>>> +	struct drm_property_blob *blob;
>>> +	int i = 0;
>>> +
>>> +	iter_colorop = plane_state->uapi.color_pipeline;
>>> +
>>> +	while (iter_colorop) {
>>> +		for_each_new_colorop_in_state(state, colorop,
>>> new_colorop_state, i) {
>>> +			if (new_colorop_state->colorop == iter_colorop) {
>>> +				blob = new_colorop_state->bypass ? NULL :
>>> new_colorop_state->data;
>>> +				intel_colorop =
>>> to_intel_plane_colorop(colorop);
>>> +
>>> 	intel_plane_colorop_replace_blob(plane_state,
>>> +
>>> intel_colorop,
>>> +								 blob);
>>
>> A break here why keep iterating if you have found what you are looking for I
>> think I am seeing more and more reason to have a separate file as Jani had
>> said Called intel_plane_color.c
>>
>> Regards,
>> Suraj Kandpal
>>> +			}
>>> +		}
>>> +		iter_colorop = iter_colorop->next;
>>> +	}
>>> +}
>>> +
>>>   void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
>>> *plane_state,
>>>   				       const struct intel_plane_state
>> *from_plane_state,
>>>   				       struct intel_crtc *crtc)
>>> @@ -408,6 +445,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
>>> intel_plane_state *plane_state,
>>>
>>>   	plane_state->uapi.src = drm_plane_state_src(&from_plane_state-
>>>> uapi);
>>>   	plane_state->uapi.dst = drm_plane_state_dest(&from_plane_state-
>>>> uapi);
>>> +
>>> +	intel_plane_copy_uapi_to_hw_state_color(plane_state,
>>> from_plane_state,
>>> +crtc);
>>>   }
>>>
>>>   void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
>>> --
>>> 2.42.0
> 

