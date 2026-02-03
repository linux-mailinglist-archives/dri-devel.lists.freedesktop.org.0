Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB0aKN9tgWmwGAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:39:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338CD42E8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6110E4DD;
	Tue,  3 Feb 2026 03:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1BVE1CV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9010E197;
 Tue,  3 Feb 2026 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770089945; x=1801625945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ikocVYEJ/IRpmy60yQjl1BYjcJ55sJ94JtqDHJKspSc=;
 b=V1BVE1CVS81WWioP+v/WNzsVSzZeFz98FuHJmilRUnWYIGcPdg6ATOT1
 XomkQVB0PM10d8jBNrMMskOZT5zEY1d86bX4n28tD5ef7SjX0dMCGa529
 Rr0RZNLY1Rcgqk6Aw9rv9KZsopoBzQVtyI/niOxtbzAMMkpHNnO83mjt8
 SdXQ8WUOgJSzTmn/5HzR4pPXC4jzz0e109wDPEb079nSrSpTmV4dgQoDq
 E3bxEzEG4eiaL+P1OOB6KIhTQnmSae+Vqahui1pKcD/u8RbHN+Vd1/Y8f
 yAZUEfexRdxKwN2YKemzvxQaP2pU438oPwwdxa3fU9XzGlyv7AmO7sUcN g==;
X-CSE-ConnectionGUID: SJqhbNgJRf2fS+2cgoNQQA==
X-CSE-MsgGUID: ksVyxkCtQ0Ovt5NFvETDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70460436"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="70460436"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:39:00 -0800
X-CSE-ConnectionGUID: cZ702eAWQ6uDHy54l+oY0g==
X-CSE-MsgGUID: 16NdMJxlSK2Vm10kY3B2Ig==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:39:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:39:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 19:39:00 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:38:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frzRbeyVSSIp9Mzu6GBcoJMXpxjd7uqhv1QTn2feitrJwftcdGaPLWAh+NxF6rA1yIEtmdX80IOzojHBvvTB3G1rRY6OSAO8dysFc9FYAqz+6uFp0fKiMKYNF6pL/54kTTi7KMCdgrjKk1saEUptgzYWOs/s+WWx9FFUbrrKTE3YaOGCUGzhNc3PeJqqZfghYY8QGf3LrW9zVOzAGzASY+IbqA9wxyuaFKg0MfIobY/M0y5PPPBXhcvsu0Es3d1Mq8ljnOnEKBYsz1WYaUdztkPmO7KcO8dUHLuT0DMcyqxkfkCMVa3TLLMxPk781Kl19STpmKuzGUKcQ1BgsE9v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikocVYEJ/IRpmy60yQjl1BYjcJ55sJ94JtqDHJKspSc=;
 b=Kg0Dmpmc6SXVHSd35n/UbfGuAKlbap495UlgULczhACvPVId/RKiTPp6C1Toz7FWjhFF2c3/wKzWJBTTsC6d16aVIFqwk1+0IckbkKPJNk/DWJqGL/TCHzBhfFkMP0IkcoEGf9EJUtmtZvG7jlRNswGlBsovjTs383+BXVo6vDm87GDilPojghVIrV0aAhE7OBXoAVVCutmFYkaoZAdTBhGgdyZJPIg4Vk+hKBeRbqsh64wvPrXFln02H7SG7goLMXLOga8IeBzy+Y1l/Y0Bc3xtBlfz0XnemuDR/Vpv6euAshMVo3DAsBNGUWXISZBI5yWWKz4yqzYBVwW6R6YlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA4PR11MB9179.namprd11.prod.outlook.com
 (2603:10b6:208:560::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:38:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 03:38:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Yella, Ramya Krishna"
 <ramya.krishna.yella@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v8 7/7] drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
Thread-Topic: [PATCH v8 7/7] drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
Thread-Index: AQHckP0OFHsAdYHoqU6OKM6EmVCAOrVwWuQQ
Date: Tue, 3 Feb 2026 03:38:52 +0000
Message-ID: <DM3PPF208195D8DA690DEA0947512EE162BE39BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
 <20260129-atomic-v8-7-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-7-4cb7b0faa051@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA4PR11MB9179:EE_
x-ms-office365-filtering-correlation-id: 7dc135bd-8f76-47cc-f556-08de62d5c072
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QzRnTUhNL1VkUmVIeXd6MWNFM0JjR0ZZN2pIM1o3QXdOdUl0Mks5VVo4amZ5?=
 =?utf-8?B?ekRBbzZuUzQ3VllPLzNpK3R6T3VxSGhSZk9MQWZPaUZCZFdJMWgzdjExM20x?=
 =?utf-8?B?bzNWdjdXQVpHYWl3TFM5T2ZrVmJhczI2dS93c0xkblk1ZVNIcllXa2tibEx5?=
 =?utf-8?B?VW10TjlwbXZBWmpZSTBkWkxVSUxBVVpVN1U5VEhySWYwMmxFTDFYaXZVMUtE?=
 =?utf-8?B?YllFODU3ejdkcWlZbSt6UjkwUDRuclIyN2xIUnhOSHRJRDRZNUtUQlpxVFZx?=
 =?utf-8?B?VjQ0MTRkVmNXT3hndmk3Y2xqNGVkWFNnUGFDVjM1Zk8rdWEzRUIvNkQwdTJ2?=
 =?utf-8?B?cUFEUzRMbFJia0R5VHNMR3ozMWJrUjlFd1VyZDNScDYzMW54OFJCbWRaQTR0?=
 =?utf-8?B?SHBwQWppV29OQ2g1b0JOR2dZejNBR0F3ZjZVa054dkgvU2puMEoyQ0FiV0ZQ?=
 =?utf-8?B?VzJoUklnTmhVTjRzOUQ0M2FjUjQ0NjNhSHNOMDBVU0tiaGs1L005RDB3RlNh?=
 =?utf-8?B?Ynk4cmZGK0FabWdBMGdHUktmd2VMMTE1R1JkdDlDalpENEZUbEdZb0hUQW54?=
 =?utf-8?B?Ym5XZm9WM0N4Q3pxMkRDbEMvbkVmRlVUR0d6QkF1dEZXanVJSGtMK0V3d3Fh?=
 =?utf-8?B?anVrTmlvNXA4eWY5N2tjYkV6OENsNWZFaUg5Zm5yU1VGNVRqelNvSXZSR1c0?=
 =?utf-8?B?TEpIbHhWUUh3aXJ0UGdGU1NBYXhwWUV0TEVyWFIyYlFDenV1TUtyUStJaUFj?=
 =?utf-8?B?M2ljdC8zNTYxZ1hmNlBMQ21yL1d3di9JY2FLbmFyZVpPbjNmMkdLSGd0eGFj?=
 =?utf-8?B?ZUdmTzM0WG0ydGVEb1J3OHpnNkc3MzNHeVRFTk1EQ3UzNWxoYzIya25QQ3Nm?=
 =?utf-8?B?MUhmc3lFd3pWYVdlWUxRK2NycklFcTY3c1drc3k2ZzVVTG9ZcVBnaDBDYUtN?=
 =?utf-8?B?UXRIMEQxa05PN2VDclR6UmYraUdha3o0dnp6NTEydE92OStjNXZ3ZktJQTly?=
 =?utf-8?B?aVU0d3RrcW5lYXFoZ1gvbWFoRDFtTDUvNkpYcktGL0ZtMDQ1TzF3REFyRk9G?=
 =?utf-8?B?NVhrMmZpRm1UWldIMU0zOGRYejliL1FvK0RleFRYcmY5U3VDUUp1b2ltMGww?=
 =?utf-8?B?M3lhZ3NtOHNnTndYcnBNRDA0dTRxWkdwU0ZDSTA2R09OVmxsWXVQVmFoanZO?=
 =?utf-8?B?WWRoK1dpOUVBb0ZOejZGU2VkL05HTklDYVJNTk9nenp4T0xVWnNmS0NZN0Zt?=
 =?utf-8?B?QUpFNnBwdUd6QXhqcEhZNENDSGVUTW13N20wK1dSWVJHK2czV29NS1BDT1FQ?=
 =?utf-8?B?eEdyeFRsR3lseCt0S21zNXZoRGY0eUdEU3Y5ZzZqRjFsQ1VtcFBtek9wR0dx?=
 =?utf-8?B?ZU0zKzNLdkNSaFdsNytKVWlYZGJBaDBTVTEwNEVUZkNyWStTb3NmYS90QUkv?=
 =?utf-8?B?UFNzMVl3ZWpkM05md1hEM2JsQTRYU2NtV1E0cXVBTStnYVc3UmpsTFB6TGlF?=
 =?utf-8?B?eTc2T0hRaGtROWptQlIySERuamRSRFQ2eHFMNnhXTnplTkdaNFZqbXV3UG5N?=
 =?utf-8?B?SlY1L3ZIdXJpQzMydXFMbmN2V1pUWnIrY3BMcEg0MlNEbmVpNVJzWmhwYlF0?=
 =?utf-8?B?c1U4eDNGQU1qNWFJOTVnYkQyeHJ1VmRTZ0ZoVFFhNURlZmlKMUlKRzF3dzVO?=
 =?utf-8?B?Q0ZFaTBNMEVCdjdoeUkrQ1k2NE5FOVFTYzRRMVpsUWY3OWVoR2tRaExuKzRx?=
 =?utf-8?B?TUtKWStLTkFSMkp5T0EvUUYwTTcrZDI1ejN4MUYxa1JjZnovSENnTzJPQUxt?=
 =?utf-8?B?bmpobFg2M1hzU05YNzd0WE1VVXRUSDlBb2FLcHVXNnVaK09XcWJsSWh3dnRZ?=
 =?utf-8?B?dEY5cTZDWlh6RytyRlNmb3pEUFNPSFZkd3FYUSt1ZitvZDA1Uk9lS0x6aU12?=
 =?utf-8?B?QmFmWC9OS0ZBMnFsbm00S0Y3Z2VBRjd0OW5nWFh3cTUzUkxJbUNvVDRpVW9z?=
 =?utf-8?B?NTlsZmlienQ4Q3h2UUdaRDVLM0xGTUcxNGE3clpzREkrT01vRG95Lys3OG9o?=
 =?utf-8?B?WCtnVitFNjJZNXJGemYyTEdBTnF3MURybFU1MjVITXNwVmtKREhVSTMyUC90?=
 =?utf-8?B?dVByT3phNTMyU2RlYkZucmRvYS8vNERsekZDUDREVmU3Y25hZUNTbnUxZUJO?=
 =?utf-8?Q?knG1ArLajdsMpzgiXy4JqmDxQDp8AY491r35HcjUwFF5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDNubkgzUEw0bmF4RWhWdS8xUE85all3WFhCL1BsWW1ZNG1ZYml1RjBieHc1?=
 =?utf-8?B?dEdqL3A3NFdnUnFqOVpYUU44OHU5dEE3WmhLeFRxNVN2dVRNbGNsSmZBdVNS?=
 =?utf-8?B?RG0xdFBBajFObU4zWUM3S0lWS3VQQ2k3ZnFlSWt2WC9KR2N2eDM3SVYrZ3Qx?=
 =?utf-8?B?R3hXOXpaTEMwK3dtNk5rV0tzZTc3azZxVldUc3MxYXlVeWRZQlh5NisvbzJG?=
 =?utf-8?B?Q2wydnMwMEdKRlVYMGUwaXhidmVhSEc0dENmVVJwRWhIZ1FsNk12Z1BZZ2NU?=
 =?utf-8?B?N2FCK1FRd1dSU1NxLzRlMW1XdUUva0RSUmFoa2xqbCtMMFJWZHdIZ3A1bGRj?=
 =?utf-8?B?UG9ZbnRDVytjZ0Z3UmRPTzg4S3dZYVB6TnpJeTNHYUZ6YlBCWW5jbCsxWkhG?=
 =?utf-8?B?MFFmSUdGTmF4Sk0vVmxQczFnNXJFT1lDU21sOFI5ZjQrekdPb01Vblo1Vlhp?=
 =?utf-8?B?MkdHMWdjclJhdkhpLzZjK0V6aXI0THF2M1RMeEFuU2JxZ2pXUlpNNFNiaWdz?=
 =?utf-8?B?MU41bnVmTDFUSXFlMTlMYUkrc25RWXc2TGliRjMxTnRHb251TzNWWTRCWFg4?=
 =?utf-8?B?djlXTGpEalhRS1VUUW9pOEtZU3hkVUpKTjVBc2NZYTFLTzJZc1VoV2dHUHhj?=
 =?utf-8?B?Ly9YYU5ZcDVURWhkNHhOU0JTTFB5M24yTXZCcjdGb3c5NzVQUURlcERRbFgw?=
 =?utf-8?B?dHpTWEZ3OHJ5TCtCYkp0L2ZUSkdwVzF1Vy9COEV4STRadmhqTnl5MkFZRFd5?=
 =?utf-8?B?QnRNY1k1cXUwVkNGMXphQnJhN2lES2o4OTgzRGhYaTZ0TUEvM0N2d0hlMlg3?=
 =?utf-8?B?d3BmWHMxRDZ6cHdxSXgxUHB5ZUFaUDE1SFhTcmo5QjRUQlhQZ1NRQ2hTT3dV?=
 =?utf-8?B?MXVKaUNQZ1pJNjZMa0N3dUFzbldHdFJwMkdXZjh0a0ZQVFdxWm5zaFczUis5?=
 =?utf-8?B?bWNUZEhHOGV5blZTUDgwZFdHRUJINU5Cd09OSDdkSnhkQTdYMW9MakV6UWxV?=
 =?utf-8?B?eUxBbU1ObC9kK1ZsT2ZFMkFLTG5kQWI1cFZuWkJiTC90bUh4K3c2RGh0QWE3?=
 =?utf-8?B?S1JRb3ovZSt6L3V5cVJZU1RhdEhBL3ZHL3FBZUVqU3BtemYra05DWnUrZWVq?=
 =?utf-8?B?RGNQNUR0Mjl6aWIxWG56YUFXNDA5WlBnVlpONDhQT09GaGdyYXVJUUxqbkh6?=
 =?utf-8?B?bHFRMzkwRTZacERDTVQzT2RrZFVHa0tiKzVnVnZubUpTK014N0NWNWFUWHk2?=
 =?utf-8?B?dmhQY2VpZFlvUFY3aU9FL1RONkJta0MxVFJad3A0UE9CMUhSRGRObFNubkJK?=
 =?utf-8?B?L1pISGE4VFR0UEZHK3o0TXh1YjZvYS85NVpkUTltRjFNLzBHSkdiQm9RTmNQ?=
 =?utf-8?B?aXZMS3Z3clFSQ2pnQUxkUk5tM0xObmFNbDdlcExMY0hnZGdzK0hKdEtsbk84?=
 =?utf-8?B?aHF5QkpGV1FQQ3B0WEY1bmUzb3JsSlJodlkyUnZucDJIaW12TWRqVjkyK21J?=
 =?utf-8?B?WU85MjZXeVh6NENITG56T0tiVmMwREs5eTV2MWdibzJZNFFQVXhCRmdXRFNu?=
 =?utf-8?B?MXg1VGxzczkwdHprdERheEZWNmxGU3N0c3JqR3BxTFZVd3FCMHErbHdFb3U0?=
 =?utf-8?B?TnMzYitEQVczWnkwNWFEM2trYS9JQmE5RVVYVjBQOE5nVmFHK2xoc1pPbHBW?=
 =?utf-8?B?cEp1Y0ZRZ1N1dmZIaU9PaG1oZnloLzZIWmlpTFU2ZEpEN2xuL3lmZVgvZ3kv?=
 =?utf-8?B?Kzl6YzNVNVFUeHFBNGlGTjhNUGZCaFBiaDZQbmNOQ0ZBNE01bG1rZDh0Qzd6?=
 =?utf-8?B?U0NGWnV0K1l5aExRa3FxSFdJdXFqbXJVbVZRTW5LOFNVbnJ0UGl0aDE1VC9a?=
 =?utf-8?B?QjRLaFgzc2lyQThwWnZ6eHVRS0YrT2JKNmFBODZzaEN0Z1hiUXVPR1JJYyth?=
 =?utf-8?B?VVozOFNwTjhQL3VTbFdNWDZXUm52RWRqbThXOVdDd0tBUStCL2s4YWtHeXhG?=
 =?utf-8?B?WHVxcU5QRTY1dmlCSEQyQWVUK3hYOXRhck43aWhETTRqQ1NqWW9nWlBQM3RX?=
 =?utf-8?B?UTBlaExtT3o1T3pWcjRCOW9qbkVEL3pFdnBWTzkyRGpuYnNSaklkWnJOK1k4?=
 =?utf-8?B?ZVZFVTdXQlMzNUczS0hNT0lXNlJWa2IzVCs2M3RENFNIRUJRb1RaUzZIVldW?=
 =?utf-8?B?WDhZeVgyYjM0KzZ5VWRXa0k4RVByTkltdnY3ajhBUXpYcCtTVGhQVnpWR3FB?=
 =?utf-8?B?ZitKbWZZbjZHdWVKNnN3SGM5amZZMmNiemVRNThnYkUyNDUzRHQyN2J3VUMz?=
 =?utf-8?B?WWxJU244NXZlbjUxV3laMHlQYzJoUlFGUE15eXBRMEFYSkJZQWhvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc135bd-8f76-47cc-f556-08de62d5c072
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 03:38:52.9360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcZb8rhSpIa2ZZkjd3ITxt5is37mfJfQpEOavbbS9DxiUJgiPy/TPpzxJSG4jeskFBt8tB6PLcFR5USE/GMjxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9179
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5338CD42E8
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBbUEFUQ0ggdjggNy83XSBkcm06IEludHJvZHVjZQ0KPiBEUk1fQ0FQX0FUT01J
Q19FUlJPUl9SRVBPUlRJTkcNCj4gDQo+IFRoZSBuZXcgY2FwYWJpbGl0eSBjb252ZXlzIHRoZSB1
c2VyIHRoYXQgZmFpbHVyZSByZXBvcnRpbmcgb24gZXJyb3IgaW4NCj4gYXRvbWljX2lvY3RsKCkg
aXMgc3VwcG9ydGVkLg0KPiANCg0KRml4IHRoZSBncmFtbWFyIG1heWJlDQoiVGhlIG5ldyBjYXBh
YmlsaXR5IGluZm9ybXMgdXNlcnMgdGhhdCBhdG9taWNfaW9jdGwoKSBzdXBwb3J0cyByZXBvcnRp
bmcgZmFpbHVyZXMgd2hlbiBhbiBlcnJvciBvY2N1cnMuIg0KDQpXaXRoIHRoYXQgZml4ZWQsDQpS
ZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4g
U2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIHwgMyArKysNCj4gIGluY2x1ZGUv
dWFwaS9kcm0vZHJtLmggICAgICB8IDcgKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0
bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIGluZGV4DQo+IGZmMTkzMTU1MTI5ZTdl
ODYzODg4ZDg5NTg0NTg5Nzg1NjZiMTQ0ZjguLjU5ZjJiNWI1MzgzMGZkM2FhZGM2ZTE4DQo+IGNm
NDlmMDY2MGE5OWU5Yzk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3Rs
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jDQo+IEBAIC0zMDQsNiArMzA0
LDkgQEAgc3RhdGljIGludCBkcm1fZ2V0Y2FwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQN
Cj4gKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV8NCj4gIAkJcmVxLT52YWx1ZSA9IGRybV9j
b3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfQVRPTUlDKQ0KPiAmJg0KPiAgCQkJICAgICBk
ZXYtPm1vZGVfY29uZmlnLmFzeW5jX3BhZ2VfZmxpcDsNCj4gIAkJYnJlYWs7DQo+ICsJY2FzZSBE
Uk1fQ0FQX0FUT01JQ19FUlJPUl9SRVBPUlRJTkc6DQo+ICsJCXJlcS0+dmFsdWUgPSBkcm1fY29y
ZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0FUT01JQykNCj4gJiYgMTsNCj4gKwkJYnJlYWs7
DQo+ICAJZGVmYXVsdDoNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmggaW5kZXgN
Cj4gMjdjYzE1OWMxZDI3NWM3YTdmZTA1Nzg0MGVmNzkyZjMwYTU4MmJiNy4uNjA4MjQxMGJjYWJm
YjRhYTM3Yjg1ZTVmDQo+IDAzZDM2MTFlNWFlZDRhYTUgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
dWFwaS9kcm0vZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPiBAQCAtODEy
LDYgKzgxMiwxMyBAQCBzdHJ1Y3QgZHJtX2dlbV9jaGFuZ2VfaGFuZGxlIHsNCj4gICAqIGNvbW1p
dHMuDQo+ICAgKi8NCj4gICNkZWZpbmUgRFJNX0NBUF9BVE9NSUNfQVNZTkNfUEFHRV9GTElQCTB4
MTUNCj4gKy8qKg0KPiArICogRFJNX0NBUF9BVE9NSUNfRVJST1JfUkVQT1JUSU5HDQo+ICsgKg0K
PiArICogSWYgc2V0IHRvIDEsIHRoZSBkcml2ZXIgc3VwcG9ydHMgcmVwb3J0aW5nIG9mIGZhaWx1
cmUgY29kZXMgb24gZXJyb3INCj4gK2luDQo+ICsgKiBhdG9taWMgaW9jdGwoKS4NCj4gKyAqLw0K
PiArI2RlZmluZSBEUk1fQ0FQX0FUT01JQ19FUlJPUl9SRVBPUlRJTkcJMHgxNg0KPiANCj4gIC8q
IERSTV9JT0NUTF9HRVRfQ0FQIGlvY3RsIGFyZ3VtZW50IHR5cGUgKi8gIHN0cnVjdCBkcm1fZ2V0
X2NhcCB7DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
