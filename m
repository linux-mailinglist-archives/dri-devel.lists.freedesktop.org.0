Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A540DAFEDD7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 17:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0F110E21E;
	Wed,  9 Jul 2025 15:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTj8ozut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FBC10E21E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752075325; x=1783611325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CWRr0iRp/zeikXrPUBKAuUXvRF9U9z1Je1NluYzQ2j4=;
 b=aTj8ozutbHa891FzNZ2EQKB7g6TTbXYVgcpq2HJjplrmg6tbkl4XD3Jo
 lnoZWlHy0hmnPed5BKn/lxuI/s/W66U/0ixyEIYub5+0utMLqeFgQnEyd
 FAZshicXEX+D0jy9BAPUMlfXZ+ZHlxWv4XBue4ocUriAzjHVhL3YKz0Ae
 cb1AnelEBi7fqQDxDqe74CXmRb8Z5oA1dbypPEpzrq1FaeaO7zvr7V5kw
 NutwpN/uqUMST55qMOf7E8vuzDRi3ieSEUc39HieswZdvYh8Ps6FztzzC
 We5vdNU8c5VU6K+sKs3y7ht3pgJJQvuVamHHpL42jP6Pd8bKIAyHSB8Lv A==;
X-CSE-ConnectionGUID: LatEe2roRPi0HPDwd0F4FA==
X-CSE-MsgGUID: 8XmoAnjDSCePKnE3lp2cBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71927241"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="71927241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:35:25 -0700
X-CSE-ConnectionGUID: S3opNmNzQM2mDDuXsa2+xQ==
X-CSE-MsgGUID: NhnbknFaQxirUNrPIX1vLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161363743"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:35:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 08:35:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 08:35:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 08:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQXuW2C+bM9gXLQca0T4I/CmxWUxwnV1YNLERfd81JKBQGs+Zd2UWYQpoCN7MwEdmJDlxBPmtZMmOnQ+JHVeikZ+hS47p13evSm0LT+CTaUvgPNrUfzq58QYKg9RwgZTpoui1o1XTvefvmSYZJvB8qQNpVBeWvhxT3J07PI3bd1mygaoqAW7baonoLoY0KFW2Dd5R07qcO6klS9R/1N7Z3O6bomcdy3Jqbl1Ycpfk4TWLjRjY9f7FH6zVkDioKI2x3bPU1Q35UI8moLJavpXiOE/j/rQ8qfaJw+/Y+Y4sk3gdFoMXvZyNVo40aRVpAfC/iyeNUdZTppqhC1BN1s+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWRr0iRp/zeikXrPUBKAuUXvRF9U9z1Je1NluYzQ2j4=;
 b=YsPkM4ircUrXpvu8cXV37uKUaxVs0pzEcdZSOjzycAT7ACJynbKuTMc9w3wj3lIotaNDHsz08Gy1VYcNDcl+GQHqL+hxhh2RjrbCwcPBgH+QphM8zVWQdMhNDT1UIvVutoVdAHTl6wSawsJEY1P33HtVA+6BWuGGl8P6upnrQQoX7o31v0FCaPK1IgVTDYc/4Qe6NAKpjNNzn7s4sZQZ+mI4X/lHKKbJDTfVyww1E5DVwpIDqWfC2a2Fg4pLHXkGqWSOi/aLeNcbr/BJQEHt7mazqIimBbz4N+/SBRBzoUQPl9cihYMdiUsn+o2mcJZomEVABYio6+gSAA9xmh7f0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 15:34:39 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 15:34:39 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: RE: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
Thread-Topic: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
Thread-Index: AQHb8NUDVypKU+n2/0WheNGV4r6NTrQp63GQ
Date: Wed, 9 Jul 2025 15:34:38 +0000
Message-ID: <PH8PR11MB6879AE6EDD72B112AADC0BF6FA49A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
 <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
In-Reply-To: <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|DM4PR11MB6094:EE_
x-ms-office365-filtering-correlation-id: 43358186-bb05-4b4d-cbea-08ddbefe1df0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YTVVTUtPa3JqSzBGQXVHbVZJd2JaV3dUNWw3NExFRXpRQWFwWUNKcEJKZ0dI?=
 =?utf-8?B?aGxwOFpZaE13aTdVSVoybCsvMUVoemFsYVNrSW5hN0dOK1lrSVVMUlhsSjNZ?=
 =?utf-8?B?OHZMNmJ6dksycDJQck5FRFZoa0VLK0VmSjk3T3JDb0RVR29QM2VvZkNLWWJY?=
 =?utf-8?B?MnBFNUl4dmZ1V0hHUXhkZDhNQlpoMWY2WUZvYW1UYkxoendXVVp2QkYrR2s3?=
 =?utf-8?B?V0RNV29lNkZVbWZxTXgyT2sxb0Z6MWdZR3FEUnNUSUZOZE5rN05CZXQxaEI5?=
 =?utf-8?B?NTVocHNNWnRhY1p5NDRKNFRVdmQwbVZ2VnU0eEtFeWtjV09hZFdBNUN5K1N4?=
 =?utf-8?B?R0R0WDNYWW1hQ3A0K29zZFFyY1l2MkFwQzFSVHAzRjVSNkhGUm0zSnBrUHhP?=
 =?utf-8?B?K2VmOHdTeEVKWDZDWml0VTZYRFRnTGtXUTE4SnhpUngrQUFDNGVmZU55aW9t?=
 =?utf-8?B?a1NWV3BZRWpIbUFGRzkwRTl5dlFUTUdtbk5YQ090djN6cC9GbU5VMFc1OHhl?=
 =?utf-8?B?dSsvVGhtNTVUSFdrZkpBcHdNNHduR0NCT1BsV1h1S0V3SE04bEh1K0RSYXJa?=
 =?utf-8?B?NjFGVGlVQUNUak1PZkpmSlZjWThDRGw5MzR2RExtamRpbERvWDRLQkZqWko4?=
 =?utf-8?B?bjFpbXRoYzhiRVNsVzF0aU1sNVV0NVN0QjhkSVNtL09mTTRGUTIxRmdKL01Z?=
 =?utf-8?B?dDFLYnVBK2FtOERNeDBySytyOCtzbXlXZyt4OC8wUHkyczU3RzB0SjROd1Ax?=
 =?utf-8?B?TkJwK0prVW1nZlFxdXhnRzJFdFdXaHRZcVdNU1RPeHBrYXQ3Z3ZxNDAvZTd0?=
 =?utf-8?B?bGJGRzB3aHNteUdtUjcxc1V0SDBxY3F4eDdUOVZJVjl6a3oxTHhDc3hraldU?=
 =?utf-8?B?L2U5U081V09uTVRHSWJGWkZBNVgvR1VQMTlCODhJWGZ6R29uOEp0NTJDcXla?=
 =?utf-8?B?eGFqcGJJak52UmtPbmJoTzBhWWtHeVE3a1grUVBKa1c2eVlXTVh2ai93VWgz?=
 =?utf-8?B?SUVWNDM3dmsybjdFVXducWRxRlNFZFAyZzBLNUVYS1dZTmpiZHl3elB4N2lD?=
 =?utf-8?B?R3V6NXVBVWRRQllvK0p3N01XV0ZDSktDaTJkSGtteTQyVnB6RkFqOXVXRURH?=
 =?utf-8?B?UWtPS0hQaU13elc4dWIyZytqaGd3QnR0TXZ0ZldUd3l1cGYxSWM4WEpFZnAv?=
 =?utf-8?B?RFFHM2VjZGdVOHlPeGNLRC9GWFFVMmlsOGppOXNUdGV2dVlidmJzVXFkUDBL?=
 =?utf-8?B?ams3WEFmd21hOS8xZmMwRXRXNG5rck54ME5tL0lhZUh1ajAzTjlhRXVjQ3Ra?=
 =?utf-8?B?dFNLQzRiejA3TjhTRnZGMnYwNnJWbGlQanF0SDUrNUd5ci9vTlZkdFJYK1d0?=
 =?utf-8?B?U0E0YjNEK0NmVGFMSDhjSy8rckh6ZDRLNmU2UFFOS0hVaTgrRHRwOWNYL29W?=
 =?utf-8?B?bmc4NjZXZURLQkZQVEhoMWZ1T1VlS0RMd25xbVVWOG1kcnRuYVltS3lqV2tQ?=
 =?utf-8?B?blg5SU01eTdWRWtEMEpUV0xuUlFRUlVxYUJ2NW94M1dCQ3N0YTBoLzV6YzVL?=
 =?utf-8?B?bUF5Rjl5MUZ1VExTNUsxbjBnUy96UnNsME9LTTdXdWxaNC9WWXFPcTZNOHJB?=
 =?utf-8?B?elhXVStiZkZMY2hieFhBdDA5TFlnNkJCSEkzMlZsUFJKRTc0WTJYTzhTVEcy?=
 =?utf-8?B?T2pDdWtvUUF1L0Q4cnhEUERjYWxObmdMSE5Wai8vNldHQ2VYSHVxNTVCUW9P?=
 =?utf-8?B?TXlPOWJsRkVYaWNXZFJXQUF1YndKa2I3Z1F4S1ZUYmlyZG1jalJtV1hocEg3?=
 =?utf-8?B?ZUdzcC9vcXJWcUF5ZmRVVjZnai8vdTEyLytkeHFOZWpnZUJUMkRRU3lhZCtR?=
 =?utf-8?B?aGI2THQ4a25zMytFaElVMFl6MzN5RTFaMStGMzdMUnlJUEsyNlRNLzZyamI5?=
 =?utf-8?B?MGdNQmlZdzZrZXo3K3VrNUd6bGMzb09NdkU5cHRHcGo4S2lLQm1tZFJxeTJj?=
 =?utf-8?B?amtMOXlhY3VnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEJPVWF3RGR2ckNkQkRPYVZqV1FUMGUzcTM0WnQrZzYvbmFaTEh0d1B6YzUw?=
 =?utf-8?B?TE9abkJCZXBXUjUyMVFnVFdaUDgvZUR0VVdST2VsVEdLWVg0b0x3Sk9NUE9i?=
 =?utf-8?B?aXZ5d2NiRVJCVWRTSkVFbFIyRW1uaWhZVW12MEFMVjlkUERZVHEySWJoUUNu?=
 =?utf-8?B?VjhVNzl2YVhrOGlLbWVxazdISU1jTVpOOWk3Q2pQcHpGSWI2ZzMvVUFqL0di?=
 =?utf-8?B?UEE5a0t0WHhJek45ZWhaWVE1ZjN3cU12azFKY0JBVE53SDNHUzlYcWc1TkpD?=
 =?utf-8?B?RmZYQWtzT095RzluckdLOGxNK1dCQjhscnBqaGFhaHJDcWJWeHZySWtRSURs?=
 =?utf-8?B?OWg5OXpEMmc3T2QyNzVtVm5wc2FnZnRGWlZoM0VTc1pJNGViNGlTUmZjandB?=
 =?utf-8?B?TVpEd1ZjY09jQzFqRlBTZzhCY3JKbWVsNVlmSlp5Y21qMGJERFZFZUlpcXNK?=
 =?utf-8?B?aU5xK3J0dzhwV3VydDl5bTl2VHNRNm4zSlBVQ1crV1lJcXpOZFZxbDd2UWw4?=
 =?utf-8?B?SkhOM0U5ejA1b1VuU3JNZGVacFdPTlBETVVLak5GWWhaZFh3Qi9tLzJ3a0lp?=
 =?utf-8?B?dlJXT1lraHRaNzlMVk9tVS9CcEN4dGRYaVdQTk5HZUhVYXM2c0QzY0ZqNkRL?=
 =?utf-8?B?ZWtFYi9yMnQ1WHR5bVprb3d1dVpBY1JRN3krZlNtY0xQWFhDSldFTzhQM0JE?=
 =?utf-8?B?Zk9jZzM4azFUb3pmb3l2QjRjcjV5SEVhMXBEL1JkOVF0cHp5R0ErN3BjN1F4?=
 =?utf-8?B?WjB3dk0ydm93NDAwOW05cFFNNm5UdktsSFhtN2hEUHVqMVFqZVJjT2tQd3c5?=
 =?utf-8?B?LzRzZkFObmJSbkd1RzFTbFdYTlhmVVcrL2xLaXp3MjJtWnJGZ0xlbWRPays3?=
 =?utf-8?B?WXl1NUN4bEtXUVlQdytBaDVuVHNkOTFXNjlvSCtobHhETTk2M2pOY0VCVU9p?=
 =?utf-8?B?cTM5SXNFNDhOUVp2c0pTSjQrYllhaFJjVTJDN2hhKzJaZ1c2UjZEN1BTVS8z?=
 =?utf-8?B?eFhyMUZERlFWR0VYTllaYWkzTHFXNU1POW9ocU1lWnNRWFdOa2RUYmtDSEF1?=
 =?utf-8?B?VEU1NlFidjZTVDlRdC9iUHJUdzBnWVBSQWQrSkV1M0ZXUnZSdC91YmZNd01j?=
 =?utf-8?B?Q1l5SW9WSmczd2hLdUJwRnlaTjNOL2JJakQwOTY5UFZaUW9LRFcxWmFkQlEy?=
 =?utf-8?B?R0x6R1N1bUV5b0VFK25GdlBjN05sUTVvcG10UG1JbEpFWk1sZFlURVI0akxr?=
 =?utf-8?B?TXpYWFl2M21WK3RVLzkwYzJuQmhPTmNsbkQ4NXlEMStZV3dtYmRGNUNPOGJQ?=
 =?utf-8?B?b0hzVnRxRHlsTzZqajhLR29aaUFsYTR3dHplbkw1OXhVaG9FamFwVDZ6UEhj?=
 =?utf-8?B?cFdkM2RWVEhJaytEYjVISU9KcnErYks4MXE2UnZWUC9UTGEwdDZ1T1cydnpN?=
 =?utf-8?B?RVhqdHZwcHFsWnZMbnVKZlZMM09RbU0vOTRZUjdDVlk5VXJhZ1pqN2EyNE5G?=
 =?utf-8?B?YkJPQnQ1MlEyeCtvZElCcFl0OE94NVdkTnRQeXJzbTB3R3hvUGl4ZERoalBD?=
 =?utf-8?B?RWtxUnYwZ1ZEYUo4MEpFM3IrLzBKaVU4dXBianh0RjNYUGJRdVdRU1ZkN2Mz?=
 =?utf-8?B?MDdEbEphaDdUS3FmSFIzSVo4MXRjZVJNdDdkU1lNWEhnLytjTTM1WDhmQSs1?=
 =?utf-8?B?WUlQZDBFU09tRzA1Q2R5bHVHUlQyREJ2QkdQTWEyRlFJemVqMWM0QnB4aklY?=
 =?utf-8?B?UkRSc0JORklaeHNnaUk0amNKYU1kSmdvMFY0dGt5MHlNRVpHMyt1bGZvSUEx?=
 =?utf-8?B?bnpRQWJhYk02SHcwVHljTTJ4cUdjV01xMWJQS0JaaGxXQmp3aWlzN0FRL2Fj?=
 =?utf-8?B?ajhwWXE3WDMxVnpIWnE3TG42Tk1XSEJONktGSW16anNtSUpUUlFSbmxiSnFB?=
 =?utf-8?B?MWFrREhPbWIwUnd5OHNyZ2ZwalNKdUU3YnlXSXh0RkUwQzlFMGxKM0s0RnJN?=
 =?utf-8?B?K1JQVlJQQmdmRFFkNHhKeGJGMW1wb3Y5SlRldk1pRXVGTmdqS1BBSlBCSGFx?=
 =?utf-8?B?SjdZckdReVYwWERpZjlHZjQ2bGlBVlBEQVFSVjlvYjM4REpGUWl3VFpFRlRy?=
 =?utf-8?Q?9gYeGm1tcO6bGlZzvwVVKRik0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43358186-bb05-4b4d-cbea-08ddbefe1df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 15:34:38.9423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjht3JUbUFzSx0BvkvVr+pxHojyeyyp5oxGkAaVCWlMQN9lkz5H6JcdYBx3Oj5QmnrQx4vZX9kPHUfFOChv8cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

SGkgRG1pdHJ5LA0KDQpJIHRob3VnaHQgYWJvdXQgd2hhdCB5b3UgYXJlIHNheWluZyAtIGF2b2lk
aW5nIEdQVSByZXNldCBhbmQgaXQgd291bGQgd29yayB3aXRoIG5vcm1hbA0Kc2xlZXAgYW5kIHJl
c3RvcmUgKHMzKSBidXQgdGhlIHByb2JsZW0gSSBzYXcgd2FzIGhpYmVybmF0aW9uIHNjZW5hcmlv
IChzNCkuIEluIHRoaXMgY2FzZSwgUUVNVQ0KcHJvY2VzcyB3aWxsIGJlIHRlcm1pbmF0ZWQgYWZ0
ZXIgZ3Vlc3QgaGliZXJuYXRpb24gYW5kIHRoaXMgYWN0dWFsbHkgZGVzdHJveXMgYWxsIHRoZSBy
ZXNvdXJjZXMNCmFueXdheS4gU28gc29tZSBzb3J0IG9mIHJlY3JlYXRpb24gc2VlbWVkIHRvIGJl
IHJlcXVpcmVkIGZyb20gbXkgcG9pbnQgb2Ygdmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJv
cmEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgOSwgMjAyNSA2OjI2IEFNDQo+IFRvOiBL
aW0sIERvbmd3b24gPGRvbmd3b24ua2ltQGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYXNpcmVkZHksIFZpdmVrIDx2aXZlay5rYXNpcmVkZHlA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gZHJtL3ZpcnRpbzogSW1w
bGVtZW50IHNhdmUgYW5kIHJlc3RvcmUgZm9yDQo+IHZpcnRpb19ncHVfb2JqZWN0cw0KPiANCj4g
T24gNy8zLzI1IDAxOjI0LCBkb25nd29uLmtpbUBpbnRlbC5jb20gd3JvdGU6DQo+ID4gK2ludCB2
aXJ0aW9fZ3B1X29iamVjdF9yZXN0b3JlX2FsbChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZn
ZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfcmVzdG9yZSAqY3VyciwgKnRt
cDsNCj4gPiArCXN0cnVjdCB2aXJ0aW9fZ3B1X21lbV9lbnRyeSAqZW50czsNCj4gPiArCXVuc2ln
bmVkIGludCBuZW50czsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKGN1cnIsIHRtcCwgJnZnZGV2LT5vYmpfcmVzdG9yZSwgbm9kZSkgew0KPiA+
ICsJCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3NobWVtX2luaXQodmdkZXYsIGN1cnItPmJvLCAm
ZW50cywNCj4gJm5lbnRzKTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlicmVhazsNCj4gPiAr
DQo+ID4gKwkJaWYgKGN1cnItPnBhcmFtcy5ibG9iKSB7DQo+ID4gKwkJCXZpcnRpb19ncHVfY21k
X3Jlc291cmNlX2NyZWF0ZV9ibG9iKHZnZGV2LCBjdXJyLQ0KPiA+Ym8sICZjdXJyLT5wYXJhbXMs
DQo+ID4gKwkJCQkJCQkgICAgZW50cywgbmVudHMpOw0KPiA+ICsJCX0gZWxzZSBpZiAoY3Vyci0+
cGFyYW1zLnZpcmdsKSB7DQo+ID4gKwkJCXZpcnRpb19ncHVfY21kX3Jlc291cmNlX2NyZWF0ZV8z
ZCh2Z2RldiwgY3Vyci0+Ym8sDQo+ICZjdXJyLT5wYXJhbXMsDQo+ID4gKwkJCQkJCQkgIE5VTEws
IE5VTEwpOw0KPiA+ICsNCj4gPiArCQkJaWYgKGN1cnItPmJvLT5hdHRhY2hlZCkgew0KPiA+ICsJ
CQkJY3Vyci0+Ym8tPmF0dGFjaGVkID0gZmFsc2U7DQo+ID4gKwkJCQl2aXJ0aW9fZ3B1X29iamVj
dF9hdHRhY2godmdkZXYsIGN1cnItPmJvLA0KPiBlbnRzLCBuZW50cyk7DQo+ID4gKwkJCX0NCj4g
PiArCQl9IGVsc2Ugew0KPiA+ICsJCQl2aXJ0aW9fZ3B1X2NtZF9jcmVhdGVfcmVzb3VyY2Uodmdk
ZXYsIGN1cnItPmJvLA0KPiAmY3Vyci0+cGFyYW1zLA0KPiA+ICsJCQkJCQkgICAgICAgTlVMTCwg
TlVMTCk7DQo+ID4gKwkJCWlmIChjdXJyLT5iby0+YXR0YWNoZWQpIHsNCj4gPiArCQkJCWN1cnIt
PmJvLT5hdHRhY2hlZCA9IGZhbHNlOw0KPiA+ICsJCQkJdmlydGlvX2dwdV9vYmplY3RfYXR0YWNo
KHZnZGV2LCBjdXJyLT5ibywNCj4gZW50cywgbmVudHMpOw0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0K
PiA+ICsJfQ0KPiANCj4gU28sIGJhY2sgdG8gdGhlIG9sZCBxdWVzdGlvbiBJIHBvc3RlZCBvbiB2
MSBhYm91dCBHUFUgcmVzZXQuLi4gd2UgbmVlZCB0byByZS0NCj4gY3JlYXRlIEJPcyBhZnRlciBy
ZXN1bWUgYmVjYXVzZSBRRU1VIGRlc3Ryb3llZCB0aGVzZSBCT3Mgb24gVmlydElPLUdQVQ0KPiBy
ZXNldCB0aGF0IGhhcHBlbnMgb24gc3VzcGVuZC4gVGhpcyBzaG91bGQgYmUgYSB3cm9uZyBiZWhh
aXZpb3VyIHRvIGJlZ2luDQo+IHdpdGguIFdlJ3JlIHN1c3BlbmRpbmcgbWFjaGluZSwgaGVuY2Ug
dGhlIGhvc3QgcmVzb3VyY2VzIHNob3VsZG4ndA0KPiBkaXNhcHBlYXIgb24gcmVzdW1lLiBDYW4g
d2UgYXZvaWQgR1BVIHJlc2V0dGluZyBvbiBzdXNwZW5kPw0KPiANCj4gVGhlIFZRIGZyZWV6aW5n
IHBhcnQgaXMgZ29vZCB0byBtZSwgaXQgcGF1c2VzIFZpcnRJTy1HUFUgZ3JhY2VmdWxseSBvbg0K
PiBzdXNwZW5kLiBCdXQgcmVzZXR0aW5nIEdQVSBzaG91bGRuJ3QgaGFwcGVuIGFuZCBuZWVkcyB0
byBiZSBmaXhlZCwgSU1PLg0KPiBOb3QgZG9pbmcgcmVzZXQgc2hvdWxkIGFsc28gbWFrZSBRRU1V
IHN1c3BlbmQvcmVzdW1lIHdvcmsgZm9yIDNkDQo+IGNvbnRleHRzLg0KPiANCj4gLS0NCj4gQmVz
dCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
