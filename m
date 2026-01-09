Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F8D08269
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1583810E853;
	Fri,  9 Jan 2026 09:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvwcTg7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304410E08F;
 Fri,  9 Jan 2026 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767950409; x=1799486409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GarbElc1ZhR2LBqDk2ZxHeauvaIoyPu2o1h1I0lTm+A=;
 b=JvwcTg7+ijFW4IXQWwgn1eTFuxn6/OPc9HIbYVUUAYQCJMOVuPPg4j3X
 Fz3Geiv9oPgI4xoNh2wleMemV2Dpf8qnjn+9z/VGXrJ7ckbZp6oZEK5v9
 TrdtO4BkzKZn15IKywCfe/7Oyp57C43yTrs5FJNBi2gp5ZK/0nOh2NXm6
 qkHKA1kpI76uNwABoUQdxuCir/sbFdkHeVTLXMCyvInQDVKqCGWfzmejX
 Q3MYPhXAfpUQx7GpHp5ynQu7WW79uyd06nyGYy1KUY9mAtUoC60nmOrAI
 C250DuEzqBfaZdGWk8DtKVhI6AOlsljXZE4oNiDbxqXkUluWLi/bU3tmj w==;
X-CSE-ConnectionGUID: yX7Ko4QKREKKoTRXxR/2TQ==
X-CSE-MsgGUID: 21D66viIT4qQeTOrbkT1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86919299"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="86919299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:20:09 -0800
X-CSE-ConnectionGUID: 2xqJM5RKSW6r0crwPx+19w==
X-CSE-MsgGUID: +IjPfO+0T9Ku+V/fHGpW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="204250144"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:20:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 01:20:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 01:20:08 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 01:20:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKEQH6OwpiiK+OzIJGp9S9qE0PpgLDKDPfdwdFzr1Lk5QBec4z50sBZHZYMA7vQBkMLPekvp8oE1NPw7fXSPrCL4MMcKDmKWYMTEI1aVDmS04gAijYOm1tMmNTRvRLUbH57GY0kkld8f8OAI22kpnHNyTkf42tJTn0sKxGkcpT1ywUniybodOL2gMZG8BME23/A9rzsV03JHyUF6g0SFqFp/JPDI9Or1P4nZpoqGem1V9gIitXnEmBW3hGZqX3BuX+HF03qC5qUSyq0DxZT0P/7Ky4vMREftsT5vGno3EoONP5ZHCktGKwT1N09Vo/vscXeLiOm6UkKM3z11uV6/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GarbElc1ZhR2LBqDk2ZxHeauvaIoyPu2o1h1I0lTm+A=;
 b=hu7wnaOoqpd3YI//EPqI/KjzOwZOcgw32AOTok0i+NXo99XtS6xjF6Hm3Vq5qkLtUdtPzvSVzMYbO6kPlXIv2GgPU3D91JBXPH4rMGYSZh+G+txqE2ApJL9IC2K0LwrZsgfgFd2lYkJHljRFd2KiauuaqViGtySEuPES3NN7wMMQy9f0dH0yGxiryhb4SO7DMo5EvmjUKCIxO/f7loJUjxQjNpQKIOj3WTMX1c+MpFtP1WsfwSFbb4caPZZzljEEeGzGTgP54ln5O5SR6zokk1UnnsZOTQ7+8H/XKY6zZ0r9ohXgKUGq8tW46l1kJyd9MayczYXhDHXpkPSJqsZ7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW3PR11MB4569.namprd11.prod.outlook.com
 (2603:10b6:303:54::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 09:20:01 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 09:20:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
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
Subject: RE: [PATCH v2 13/13] drm/i915/color: Add failure handling in plane
 color pipeline init
Thread-Topic: [PATCH v2 13/13] drm/i915/color: Add failure handling in plane
 color pipeline init
Thread-Index: AQHcgUQdr4UprhUBJ0ye0NqiJ2jz2rVJjtkQ
Date: Fri, 9 Jan 2026 09:20:01 +0000
Message-ID: <DM3PPF208195D8D184005A329F2C1DCE753E382A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
 <20260109081728.478844-14-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260109081728.478844-14-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW3PR11MB4569:EE_
x-ms-office365-filtering-correlation-id: 99fcf92d-c576-4336-74a3-08de4f604418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?U3V4UTIycnZzK1dIdUVudFFZQm1aWmlTcGlaYUMwY1lNeHVJRVZreXBRZE92?=
 =?utf-8?B?TjBDK2FJRDg2RnNSeDc0cE9vRTA0VFE3MXJoYng5Z3g5eHRFalY1MVY1a0xn?=
 =?utf-8?B?cmo1ZHZuQlhpblVCUTBlTEJxRzlybTliRVd3dCtXWkpWWDlMdCs5REpGcUhm?=
 =?utf-8?B?dXJsckY3Y05VcXg1TWROVjVwTjJhVVBVMHlQRHc1ZUM3WmI2cXB4U3o3bXVJ?=
 =?utf-8?B?Z0d3T01jL1BhY2FUWUt4eWVieHVpV2hrcGN1cmpFUUNyNEI0cUFMeXd0SGVl?=
 =?utf-8?B?RmxiTXl6TkJaZ1RtV0JObFdVYVE1ZDNTQ05FNW9vWmI0dy94VnlHN3FqT0Rp?=
 =?utf-8?B?azJEZmJ6SDBlNTBvMTQyVzA4UWlPTXhBSURXb1p4cFk4UWNjQ1NhQjBKNXpu?=
 =?utf-8?B?NXZoeVdvWTlZTUdqYXdEMmVjYmNxYm8zTmtaeWpJVElhMHh1aktlNXI2Y3J2?=
 =?utf-8?B?UVhaNmNQMkpuQjMvRUJ2RGFOVTlEenNBK1FnZkRDQmNWb0FNY2t4NkNNdzVh?=
 =?utf-8?B?c0laTHhaV0UrK05XS2Ntd05yUXk0U1EwU0krcGZLNjkyTlFzN2JWT1lmd05E?=
 =?utf-8?B?MktJWWUxQlNlNUpvSHBGSWRKT0hLS1dLNHNYOGpOaGdueGd1K01jdkthMldv?=
 =?utf-8?B?STBvdUNNeEVIMU9zQ3ZzWkw5ckVQZ3ZnMmxVTTV3OWR1Y1k2eUdUN0pCeGxn?=
 =?utf-8?B?d0ovRUJtS285Z2xUdFUrSG56VXl1OUlqZzhveUY4QVRmYlBtaEF1ZzJsdDFt?=
 =?utf-8?B?THdtL3JPMXMyRFBFTDBsY0NqclBlVS9wNWVROTROTUhEZ3FPMmIwQXkyY3JJ?=
 =?utf-8?B?cVhzMGV2K1luQVpVVkJjY0pFQnBVYWRVek5kZFlnaDREeUp1ZjhGdnhKZVZr?=
 =?utf-8?B?eEk5WURKMWJpRHpkcmkxY3lGdXVxUnBGWFRNOUt2dFpwMHgyUXBaY1hZbW9W?=
 =?utf-8?B?OWFidHRKZlpwdFUzMVhtalFqZ0FBRjNDVTVSNGQ1Mmd6TFRuZG4xclhzeGJG?=
 =?utf-8?B?Y2U5MlpERTFnYWk4c09kc2Vjd2s1NkdqVDFXK2pqODI0bENRMnJQYVdrc0pF?=
 =?utf-8?B?aG9KL0x3K2lHN3NYOC9pS2Q4OWNOKzJzL0dBZG1haTY2cjBoQXRGYlF6aUVJ?=
 =?utf-8?B?K3UwRzFHU3RMakk1ZzEva2ZTWjAzNC9EWmJHNUdVZzFHcEVlWmxQS1gzQXFS?=
 =?utf-8?B?K0J6NzVuOE1Vb21IbGNuVmhNeEhsQlRuZ3pSSjRtbEVpczM0alpmc2dYK05I?=
 =?utf-8?B?d0FFbGF3OWs1VjI5Z1BTaEN2TDdYbDM5SWpaT2c3d1kvVEdTOWlva0NQZmhB?=
 =?utf-8?B?YU9OQXNQaVRPVzkrSHAzNkVZRmtnak5FV1VnVm45cnYxZCtRV0hHQ1poNk5U?=
 =?utf-8?B?aFA3eERPZjNzZ2JOK0VMRjVpT3cydWpaZnZQb1RUOEZSVit6di9INmZaS0Vk?=
 =?utf-8?B?cUdpdlMyNXBFVUt3UGd6N29oTFQ0VldTbUN5K090UW9XWGdNK0tHeWQrS1hU?=
 =?utf-8?B?UkMzUks1Sm5vT25aZUVNZno1VXBVK1M2eTFiNWFSMzhHNjJEVWlDQWhMMk0x?=
 =?utf-8?B?bVM2VDl0R29aVTNDcktvTEFxSm5WTFFNb2MzN3ZGVjBobkxqd0pqNlNnTE9N?=
 =?utf-8?B?aDkxVWxGY0lPWm9WSzljQ2JsbnVoOEZvdGhvUFNybjNYTGMwZWJ1Z2I2Zi9B?=
 =?utf-8?B?RG9yVUI0OEVCWElvb0hrdlJmK0xsVnJvSTk2Z2VyaXNxbnBVUU5DM3BEazlL?=
 =?utf-8?B?elBDTnhzcHkxZFJSOXArbVRDQjhJejZZSmtnUW8ydFhraU51RkVjSWpzaWww?=
 =?utf-8?B?WHlKcE55N1J0Z0Q5V1BuTU1VSVVTU0UrTjBXL0xwcmU0UldLajZnNFdYZmti?=
 =?utf-8?B?T2ZGbmVSYnFqVk0vYjc4SUxPTUZ4WTBHWWpYa2JJRlBXMmRyWTM4QVZGOG5N?=
 =?utf-8?B?RFAyM0FBcTdMdHp5dGFOOGw4Z0JuTFNWY043SDVxdkoxOXovQUNzUTJUZDJz?=
 =?utf-8?B?VzJ6eDdnanlqckJPWDdzRDBoVzJ5bmdqZGJ2TXFhOGl3NGY4cjJmRFNFTG5T?=
 =?utf-8?Q?33rXBw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBOMXAxUGJUSWFvK0ZxZ05MWXZ3eWRhOEcvaVRoMmM0RjAvNlhnSlh3Y1lq?=
 =?utf-8?B?eVRFUUx2ZGtLbVFlZHMzVDQvLzNTMkRuL0UyNERKYytvOHQ2YmJ5OTdzNE5C?=
 =?utf-8?B?ZEZYSUpKQjJXRXBrOW9FWnh5R1FnRmw5Z0FQejgxRlVHU2ZkSC9rdTdYa3lI?=
 =?utf-8?B?SlhjUmI0TDdLN0JRaW4vYys3MGlVc1lMMk91UUhuR3pNMlNHeEVlc1V4VlU0?=
 =?utf-8?B?RE8xb215NXc0cFlqbXdQaVpoQnFJazNkWnJwUEY5UDdSTXlDd2xkQnI2TDFY?=
 =?utf-8?B?M2xzNE1tRkk3TmpTeEZYTWR1a2NOaE5QSExvOVN6eW9UZWs3bmNkRXJkVUhy?=
 =?utf-8?B?RGgxRjRyNllrWFdXMjlCR085YUh2aVF5QjZ2STUxRGgyTk8xVmVYOUZsdHd1?=
 =?utf-8?B?REYxWHZjb09BdVNHZTBOZk8zbHdhQjlQNGdBR3NCZ2ZoV01rcTI5VExOU3ht?=
 =?utf-8?B?bnYxV3JDQWp3K085T2RiY2d2QXBpM0FGUlBZL2NWR2FwMSt2NVRpMm0xbHJi?=
 =?utf-8?B?dzJicVVlVWRmOEE1L04zYnQzc0tOR2t5TG1wb2ZLbHl2UmlaMURicjA0TTFI?=
 =?utf-8?B?NS9sTlAyVDIvdDFYUHlTaFFZbWluc2xIYzJXU2xSQnZYY1JZM2VUL0VnVXVX?=
 =?utf-8?B?dS84ZndDR09VMjV1ejVjSHBNTCs3TmVhN3lSeHlScFA2eHU2L2hMU0FZOEg1?=
 =?utf-8?B?M29tWkpWWmVDRFkxakZ5MU0rNEpXWWVpUUhBYllvTTJONUMrcndtNStFWFhX?=
 =?utf-8?B?eXNTc1pDNWt3eGFaeU16T2crak9mcEFvNTcrbkZBYzFJOHBHSnB3NFNjNFJ1?=
 =?utf-8?B?S1F6cTY5ZnNQL1pwejFQVlpSWGZqWWY2RnVhMktObFlmQ21uaUkzdTBybDdo?=
 =?utf-8?B?dTE1M2tlV0YvdjNCZU8zV1dzRVNaMDZxbnJtYjU3SWlWZ1E5bXJ4enRrd3Ez?=
 =?utf-8?B?OEF0bTVmWW5kTlJ3bHNZcjdnRmZHMTVVeG5xTW1vNW0wWWp3MGFvS1dadjNo?=
 =?utf-8?B?d1gwcVVIanFpY21LUlNJemU0QXdlWGhkOExhbW5vT3hpbFVXdjVZNlNvcWU0?=
 =?utf-8?B?N3E4RldsSXZ0L1pCRWxCQktCSW5rUk1uSTdTb1A1MDRBNk9iVlI3UFMxS2Jz?=
 =?utf-8?B?dFZuSUt2MGdlQzBieHVnME90RWRuaGFOc2VCaWR0VTB1eHVVaUJheFl0NlRq?=
 =?utf-8?B?aXp0QVcxQitjMjVNTFFyYzI3NWdhRHVXa25veFFtYngwcXk5bXFVRzhkMXNa?=
 =?utf-8?B?cnduaDZxTmd3WFpXWktOSnBZQ2ppeEgrRmI4WHpIM0JZZmtLNENPMXhMaldq?=
 =?utf-8?B?amUvUEZUK214MnVqS2txS3FNLzd6cjVyTXRBcTJRd0tQMzRaQ3Nxb1AyRzhE?=
 =?utf-8?B?RGhlbTVxQWJRRUFOeG55M25kblFTdHQxYTZtWGZaUFR1MFNZMXpxQ1Z6amh1?=
 =?utf-8?B?MU0wVFZSVk02bmluQWx0VUpLMmh0Y0JYV1RUVkJiUTU0ZERMbUgyMXp6OHpU?=
 =?utf-8?B?L0NwQmFUcUJvcS9iMlpkdjdyejA0MDhPMFRzclBpcDBLbzRLV0g4eFpEdjBR?=
 =?utf-8?B?aTQrRHNpa09NMVVORjlSY1cwTnNhTVVIOG1oVS96MWUzZHhHa0pXU0VrckpE?=
 =?utf-8?B?ZTIrMS9zYk5lQXlONERkM3pPMmxKSnJWekM2TEtUSHhtWWRTd1oyWEdTVGFp?=
 =?utf-8?B?QzIyZHBpQzFqWko5N1VJbjExWjJ6ZG5uV09nVHVQWmJvMmhXK0daOTI4V1NX?=
 =?utf-8?B?NlA4cHlyRnowTDJmU3Jmd2l3OXFiZUw3UTZWSVlzZzRaQjMva1pWOVZlSlNa?=
 =?utf-8?B?ZEhOeFlQTDVpTFRIeUk0WlZlTVUzTHBSNyt6N0laZ1ZQRnF0NHZUVFpiYm4x?=
 =?utf-8?B?VzdtdUpJM0xPbnVNZkEyamVnTlV5L3VuaWFzd2hlcWNibDRRTnZEMFpDbUpV?=
 =?utf-8?B?RERXY0trb0VaMi80M25UdVFPM3QvS1VhYlJCVXg0Z0lBdkdyOUFoYkpiVVNr?=
 =?utf-8?B?VEVrL0Zta0ljK2FtTTBuNm9GbTJSNnRWeGJTbzRvbzB4UUNIMHpWOERUaU9T?=
 =?utf-8?B?N0VSd294SHFtUjlIUlh4UmtVb3NIRW56SHVOR3B4Rkp2UHB3SUJWY2Rac3ND?=
 =?utf-8?B?U3pTaWt0eXBHK0tqcGladFZlWDJPQ29NdDMxZWQ4WUxuWnhHR3pudFJtREkr?=
 =?utf-8?B?YjFoSnl1aC9lMFYyY0lLNzhOYzZwTitqTWpDd3YzUVhwU29lRE13Y0tza1p3?=
 =?utf-8?B?QlFnU21scHlteWtzbmlrcDJRV2lzZU5RZFBWcHVubUJ0cXgrcWVCekU2Qjli?=
 =?utf-8?B?SHY1Um43TGdrYmd2RDgxa3JnVHZSSUpVUDNtRitnNENKU0lwcjA1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fcf92d-c576-4336-74a3-08de4f604418
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 09:20:01.0819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6+48Tc3yoGVPJSRtqD2fekb4wIYW7ApDPyJXX0phKotEyjhvHpxbGR9zSmCOXDwT0dJ9vD/Y1l/poft1SLi+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTMvMTNdIGRybS9pOTE1L2NvbG9yOiBBZGQgZmFpbHVyZSBo
YW5kbGluZyBpbiBwbGFuZSBjb2xvcg0KPiBwaXBlbGluZSBpbml0DQo+IA0KPiBUaGUgcGxhbmUg
Y29sb3IgcGlwZWxpbmUgaW5pdGlhbGl6YXRpb24gYnVpbHQgdXAgbXVsdGlwbGUgY29sb3JvcCBi
bG9ja3MgaW5saW5lLA0KPiBidXQgZGlkIG5vdCByZWxpYWJseSBjbGVhbiB1cCBwYXJ0aWFsbHkg
Y29uc3RydWN0ZWQgcGlwZWxpbmVzIHdoZW4gYW4NCj4gaW50ZXJtZWRpYXRlIHN0ZXAgZmFpbGVk
LiBUaGlzIGNvdWxkIGxlYWQgdG8gbGVha2VkIGNvbG9yb3Agb2JqZWN0cyBhbmQgZnJhZ2lsZQ0K
PiBlcnJvciBoYW5kbGluZyBhcyB0aGUgcGlwZWxpbmUgZ3Jvd3MuDQo+IA0KPiBSZWZhY3RvciB0
aGUgcGlwZWxpbmUgY29uc3RydWN0aW9uIHRvIHVzZSBhIGNvbW1vbiBoZWxwZXIgZm9yIGFkZGlu
ZyBjb2xvcm9wDQo+IGJsb2Nrcy4gVGhpcyBjZW50cmFsaXplcyBhbGxvY2F0aW9uLCBpbml0aWFs
aXphdGlvbiwgYW5kIHRlYXJkb3duIGxvZ2ljLCBhbGxvd2luZw0KPiB0aGUgY2FsbGVyIHRvIHJl
bGlhYmx5IHVud2luZCBhbGwgcHJldmlvdXNseSBjcmVhdGVkIGNvbG9yb3BzIG9uIGZhaWx1cmUu
DQo+IA0KPiB2MjoNCj4gIC0gUmVmYWN0b3IgY29kZSB0byBhdm9pZCByZXBldGl0aW9uIChTdXJh
aikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlh
Lmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jb2xvcl9waXBlbGluZS5jICAgfCAxNjQgKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxp
bmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxp
bmUuYw0KPiBpbmRleCA4ZmVjYzUzNTQwYmEuLjFiOGQ1MDRmYTlmMiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvcl9waXBlbGluZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0K
PiBAQCAtMiw2ICsyLDggQEANCj4gIC8qDQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBD
b3Jwb3JhdGlvbg0KPiAgICovDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiArDQo+
ICAjaW5jbHVkZSAiaW50ZWxfY29sb3IuaCINCj4gICNpbmNsdWRlICJpbnRlbF9jb2xvcm9wLmgi
DQo+ICAjaW5jbHVkZSAiaW50ZWxfY29sb3JfcGlwZWxpbmUuaCINCj4gQEAgLTEwLDYgKzEyLDcg
QEANCj4gICNpbmNsdWRlICJza2xfdW5pdmVyc2FsX3BsYW5lLmgiDQo+IA0KPiAgI2RlZmluZSBN
QVhfQ09MT1JfUElQRUxJTkVTIDENCj4gKyNkZWZpbmUgTUFYX0NPTE9ST1AgNA0KPiAgI2RlZmlu
ZSBQTEFORV9ERUdBTU1BX1NJWkUgMTI4DQo+ICAjZGVmaW5lIFBMQU5FX0dBTU1BX1NJWkUgMzIN
Cj4gDQo+IEBAIC0xNyw3MCArMjAsMTM3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NvbG9y
b3BfZnVuY3MNCj4gaW50ZWxfY29sb3JvcF9mdW5jcyA9IHsNCj4gIAkuZGVzdHJveSA9IGludGVs
X2NvbG9yb3BfZGVzdHJveSwNCj4gIH07DQo+IA0KPiArLyoNCj4gKyAqIDNETFVUIGNhbiBiZSBi
b3VuZCB0byBhbGwgdGhyZWUgSERSIHBsYW5lcy4gSG93ZXZlciwgZXZlbiB3aXRoIHRoZQ0KPiAr
bGF0ZXN0DQo+ICsgKiBjb2xvciBwaXBlbGluZSBVQVBJLCB0aGVyZSBpcyBubyBnb29kIHdheSB0
byByZXByZXNlbnQgYSBIVyBibG9jaw0KPiArd2hpY2gNCj4gKyAqIGNhbiBiZSBzaGFyZWQvYXR0
YWNoZWQgYXQgZGlmZmVyZW50IHN0YWdlcyBvZiB0aGUgcGlwZWxpbmUuIFNvIHJpZ2h0DQo+ICtu
b3csDQo+ICsgKiB3ZSBleHBvc2UgM0RMVVQgb25seSBhdHRhY2hlZCB3aXRoIHRoZSBwcmltYXJ5
IHBsYW5lLg0KPiArICoNCj4gKyAqIFRoYXQgd2F5IHdlIGRvbid0IGNvbmZ1c2UgdGhlIHVzZXJz
cGFjZSB3aXRoIG9wYXF1ZSBjb21taXQgZmFpbHVyZXMNCj4gKyAqIG9uIHRyeWluZyB0byBlbmFi
bGUgaXQgb24gbXVsdGlwbGUgcGxhbmVzIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBtYWtlDQo+ICsg
KiB0aGUgcGlwZWxpbmUgdG90YWxseSB1bnVzYWJsZS4NCj4gKyAqLw0KPiArc3RhdGljIGNvbnN0
IGVudW0gaW50ZWxfY29sb3JfYmxvY2sgbnZsX3ByaW1hcnlfcGxhbmVfcGlwZWxpbmVbXSA9IHsN
Cg0KVXNlIHRoZSBvZmZpY2lhbCBjb2RlIG5hbWUgdGhhdCB3b3VsZCBiZSB4ZTNwbHBkIA0KDQpP
dGhlcndpc2UgTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFs
QGludGVsLmNvbT4NCg0KPiArCUlOVEVMX1BMQU5FX0NCX1BSRV9DU0NfTFVULA0KPiArCUlOVEVM
X1BMQU5FX0NCX0NTQywNCj4gKwlJTlRFTF9QTEFORV9DQl8zRExVVCwNCj4gKwlJTlRFTF9QTEFO
RV9DQl9QT1NUX0NTQ19MVVQsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3QgZW51bSBpbnRl
bF9jb2xvcl9ibG9jayBoZHJfcGxhbmVfcGlwZWxpbmVbXSA9IHsNCj4gKwlJTlRFTF9QTEFORV9D
Ql9QUkVfQ1NDX0xVVCwNCj4gKwlJTlRFTF9QTEFORV9DQl9DU0MsDQo+ICsJSU5URUxfUExBTkVf
Q0JfUE9TVF9DU0NfTFVULA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGJvb2wgcGxhbmVfaGFzXzNk
bHV0KHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LCBlbnVtIHBpcGUgcGlwZSwNCj4gKwkJ
CSAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkNCj4gK3sNCj4gKwlyZXR1cm4gKERJU1BMQVlf
VkVSKGRpc3BsYXkpID49IDM1ICYmDQo+ICsJCWludGVsX2NvbG9yX2NydGNfaGFzXzNkbHV0KGRp
c3BsYXksIHBpcGUpICYmDQo+ICsJCXBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1B
UlkpOyB9DQo+ICsNCj4gIHN0YXRpYw0KPiAtaW50IF9pbnRlbF9jb2xvcl9waXBlbGluZV9wbGFu
ZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QNCj4gZHJtX3Byb3BfZW51bV9s
aXN0ICpsaXN0LA0KPiAtCQkJCSAgICAgZW51bSBwaXBlIHBpcGUpDQo+ICtzdHJ1Y3QgaW50ZWxf
Y29sb3JvcCAqaW50ZWxfY29sb3JfcGlwZWxpbmVfcGxhbmVfYWRkX2NvbG9yb3Aoc3RydWN0DQo+
IGRybV9wbGFuZSAqcGxhbmUsDQo+ICsJCQkJCQkJICAgICBzdHJ1Y3QNCj4gaW50ZWxfY29sb3Jv
cCAqcHJldiwNCj4gKwkJCQkJCQkgICAgIGVudW0NCj4gaW50ZWxfY29sb3JfYmxvY2sgaWQpDQo+
ICB7DQo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBsYW5lLT5kZXY7DQo+IC0Jc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGRldik7DQo+IC0Jc3Ry
dWN0IGRybV9jb2xvcm9wICpwcmV2X29wOw0KPiAgCXN0cnVjdCBpbnRlbF9jb2xvcm9wICpjb2xv
cm9wOw0KPiAgCWludCByZXQ7DQo+IA0KPiAtCWNvbG9yb3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0
ZShJTlRFTF9QTEFORV9DQl9QUkVfQ1NDX0xVVCk7DQo+IC0NCj4gLQlyZXQgPSBkcm1fcGxhbmVf
Y29sb3JvcF9jdXJ2ZV8xZF9sdXRfaW5pdChkZXYsICZjb2xvcm9wLT5iYXNlLA0KPiBwbGFuZSwg
JmludGVsX2NvbG9yb3BfZnVuY3MsDQo+IC0JCQkJCQkgIFBMQU5FX0RFR0FNTUFfU0laRSwNCj4g
LQ0KPiBEUk1fQ09MT1JPUF9MVVQxRF9JTlRFUlBPTEFUSU9OX0xJTkVBUiwNCj4gLQ0KPiBEUk1f
Q09MT1JPUF9GTEFHX0FMTE9XX0JZUEFTUyk7DQo+IC0NCj4gLQlpZiAocmV0KQ0KPiAtCQlyZXR1
cm4gcmV0Ow0KPiAtDQo+IC0JbGlzdC0+dHlwZSA9IGNvbG9yb3AtPmJhc2UuYmFzZS5pZDsNCj4g
LQ0KPiAtCS8qIFRPRE86IGhhbmRsZSBmYWlsdXJlcyBhbmQgY2xlYW4gdXAgKi8NCj4gLQlwcmV2
X29wID0gJmNvbG9yb3AtPmJhc2U7DQo+IC0NCj4gLQljb2xvcm9wID0gaW50ZWxfY29sb3JvcF9j
cmVhdGUoSU5URUxfUExBTkVfQ0JfQ1NDKTsNCj4gLQlyZXQgPSBkcm1fcGxhbmVfY29sb3JvcF9j
dG1fM3g0X2luaXQoZGV2LCAmY29sb3JvcC0+YmFzZSwgcGxhbmUsDQo+ICZpbnRlbF9jb2xvcm9w
X2Z1bmNzLA0KPiAtDQo+IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCj4gLQlpZiAo
cmV0KQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtDQo+IC0JZHJtX2NvbG9yb3Bfc2V0X25leHRfcHJv
cGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiAtCXByZXZfb3AgPSAmY29sb3JvcC0+
YmFzZTsNCj4gLQ0KPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAzNSAmJg0KPiAtCSAg
ICBpbnRlbF9jb2xvcl9jcnRjX2hhc18zZGx1dChkaXNwbGF5LCBwaXBlKSAmJg0KPiAtCSAgICBw
bGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZKSB7DQo+IC0JCWNvbG9yb3AgPSBp
bnRlbF9jb2xvcm9wX2NyZWF0ZShJTlRFTF9QTEFORV9DQl8zRExVVCk7DQo+IC0NCj4gKwljb2xv
cm9wID0gaW50ZWxfY29sb3JvcF9jcmVhdGUoaWQpOw0KPiArDQo+ICsJaWYgKElTX0VSUihjb2xv
cm9wKSkNCj4gKwkJcmV0dXJuIGNvbG9yb3A7DQo+ICsNCj4gKwlzd2l0Y2ggKGlkKSB7DQo+ICsJ
Y2FzZSBJTlRFTF9QTEFORV9DQl9QUkVfQ1NDX0xVVDoNCj4gKwkJcmV0ID0gZHJtX3BsYW5lX2Nv
bG9yb3BfY3VydmVfMWRfbHV0X2luaXQoZGV2LA0KPiArCQkJCQkJCSAgJmNvbG9yb3AtPmJhc2Us
DQo+IHBsYW5lLA0KPiArDQo+ICZpbnRlbF9jb2xvcm9wX2Z1bmNzLA0KPiArDQo+IFBMQU5FX0RF
R0FNTUFfU0laRSwNCj4gKw0KPiBEUk1fQ09MT1JPUF9MVVQxRF9JTlRFUlBPTEFUSU9OX0xJTkVB
UiwNCj4gKw0KPiBEUk1fQ09MT1JPUF9GTEFHX0FMTE9XX0JZUEFTUyk7DQo+ICsJCWJyZWFrOw0K
PiArCWNhc2UgSU5URUxfUExBTkVfQ0JfQ1NDOg0KPiArCQlyZXQgPSBkcm1fcGxhbmVfY29sb3Jv
cF9jdG1fM3g0X2luaXQoZGV2LCAmY29sb3JvcC0+YmFzZSwNCj4gcGxhbmUsDQo+ICsJCQkJCQkg
ICAgICZpbnRlbF9jb2xvcm9wX2Z1bmNzLA0KPiArDQo+IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1df
QllQQVNTKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBJTlRFTF9QTEFORV9DQl8zRExVVDoNCj4g
IAkJcmV0ID0gZHJtX3BsYW5lX2NvbG9yb3BfM2RsdXRfaW5pdChkZXYsICZjb2xvcm9wLT5iYXNl
LA0KPiBwbGFuZSwNCj4gIAkJCQkJCSAgICZpbnRlbF9jb2xvcm9wX2Z1bmNzLCAxNywNCj4gDQo+
IERSTV9DT0xPUk9QX0xVVDNEX0lOVEVSUE9MQVRJT05fVEVUUkFIRURSQUwsDQo+ICAJCQkJCQkg
ICB0cnVlKTsNCj4gLQkJaWYgKHJldCkNCj4gLQkJCXJldHVybiByZXQ7DQo+IC0NCj4gLQkJZHJt
X2NvbG9yb3Bfc2V0X25leHRfcHJvcGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiAt
DQo+IC0JCXByZXZfb3AgPSAmY29sb3JvcC0+YmFzZTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBJ
TlRFTF9QTEFORV9DQl9QT1NUX0NTQ19MVVQ6DQo+ICsJCXJldCA9IGRybV9wbGFuZV9jb2xvcm9w
X2N1cnZlXzFkX2x1dF9pbml0KGRldiwgJmNvbG9yb3AtDQo+ID5iYXNlLCBwbGFuZSwNCj4gKw0K
PiAmaW50ZWxfY29sb3JvcF9mdW5jcywNCj4gKw0KPiBQTEFORV9HQU1NQV9TSVpFLA0KPiArDQo+
IERSTV9DT0xPUk9QX0xVVDFEX0lOVEVSUE9MQVRJT05fTElORUFSLA0KPiArDQo+IERSTV9DT0xP
Uk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJ
ZHJtX2VycihwbGFuZS0+ZGV2LCAiSW52YWxpZCBjb2xvcm9wIGlkIFslZF0iLCBpZCk7DQo+ICsJ
CXJldCA9IC1FSU5WQUw7DQo+ICAJfQ0KPiANCj4gLQljb2xvcm9wID0gaW50ZWxfY29sb3JvcF9j
cmVhdGUoSU5URUxfUExBTkVfQ0JfUE9TVF9DU0NfTFVUKTsNCj4gLQlyZXQgPSBkcm1fcGxhbmVf
Y29sb3JvcF9jdXJ2ZV8xZF9sdXRfaW5pdChkZXYsICZjb2xvcm9wLT5iYXNlLA0KPiBwbGFuZSwg
JmludGVsX2NvbG9yb3BfZnVuY3MsDQo+IC0JCQkJCQkgIFBMQU5FX0dBTU1BX1NJWkUsDQo+IC0N
Cj4gRFJNX0NPTE9ST1BfTFVUMURfSU5URVJQT0xBVElPTl9MSU5FQVIsDQo+IC0NCj4gRFJNX0NP
TE9ST1BfRkxBR19BTExPV19CWVBBU1MpOw0KPiAgCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7
DQo+ICsJCWdvdG8gY2xlYW51cDsNCj4gDQo+IC0JZHJtX2NvbG9yb3Bfc2V0X25leHRfcHJvcGVy
dHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiArCWlmIChwcmV2KQ0KPiArCQlkcm1fY29s
b3JvcF9zZXRfbmV4dF9wcm9wZXJ0eSgmcHJldi0+YmFzZSwgJmNvbG9yb3AtDQo+ID5iYXNlKTsN
Cj4gDQo+IC0JbGlzdC0+bmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiQ29sb3IgUGlwZWxp
bmUgJWQiLCBsaXN0LT50eXBlKTsNCj4gKwlyZXR1cm4gY29sb3JvcDsNCj4gKw0KPiArY2xlYW51
cDoNCj4gKwlpbnRlbF9jb2xvcm9wX2Rlc3Ryb3koJmNvbG9yb3AtPmJhc2UpOw0KPiArCXJldHVy
biBFUlJfUFRSKHJldCk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYw0KPiAraW50IF9pbnRlbF9jb2xv
cl9waXBlbGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QNCj4g
ZHJtX3Byb3BfZW51bV9saXN0ICpsaXN0LA0KPiArCQkJCSAgICAgZW51bSBwaXBlIHBpcGUpDQo+
ICt7DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBsYW5lLT5kZXY7DQo+ICsJc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGRldik7DQo+ICsJc3Ry
dWN0IGludGVsX2NvbG9yb3AgKmNvbG9yb3BbTUFYX0NPTE9ST1BdOw0KPiArCXN0cnVjdCBpbnRl
bF9jb2xvcm9wICpwcmV2ID0gTlVMTDsNCj4gKwljb25zdCBlbnVtIGludGVsX2NvbG9yX2Jsb2Nr
ICpwaXBlbGluZTsNCj4gKwlpbnQgcGlwZWxpbmVfbGVuOw0KPiArCWludCByZXQgPSAwOw0KPiAr
CWludCBpOw0KPiArDQo+ICsJaWYgKHBsYW5lX2hhc18zZGx1dChkaXNwbGF5LCBwaXBlLCBwbGFu
ZSkpIHsNCj4gKwkJcGlwZWxpbmUgPSBudmxfcHJpbWFyeV9wbGFuZV9waXBlbGluZTsNCj4gKwkJ
cGlwZWxpbmVfbGVuID0gQVJSQVlfU0laRShudmxfcHJpbWFyeV9wbGFuZV9waXBlbGluZSk7DQo+
ICsJfSBlbHNlIHsNCj4gKwkJcGlwZWxpbmUgPSBoZHJfcGxhbmVfcGlwZWxpbmU7DQo+ICsJCXBp
cGVsaW5lX2xlbiA9IEFSUkFZX1NJWkUoaGRyX3BsYW5lX3BpcGVsaW5lKTsNCj4gKwl9DQo+ICsN
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgcGlwZWxpbmVfbGVuOyBpKyspIHsNCj4gKwkJY29sb3JvcFtp
XSA9IGludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2FkZF9jb2xvcm9wKHBsYW5lLA0KPiBwcmV2
LA0KPiArCQkJCQkJCQkgICAgcGlwZWxpbmVbaV0pOw0KPiArCQlpZiAoSVNfRVJSKGNvbG9yb3Bb
aV0pKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKGNvbG9yb3BbaV0pOw0KPiArCQkJZ290byBjbGVh
bnVwOw0KPiArCQl9DQo+ICsNCj4gKwkJcHJldiA9IGNvbG9yb3BbaV07DQo+ICsJfQ0KPiArDQo+
ICsJbGlzdC0+dHlwZSA9IGNvbG9yb3BbMF0tPmJhc2UuYmFzZS5pZDsNCj4gKwlsaXN0LT5uYW1l
ID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICJDb2xvciBQaXBlbGluZSAlZCIsDQo+ICtjb2xvcm9w
WzBdLT5iYXNlLmJhc2UuaWQpOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gKw0KPiArY2xlYW51cDoN
Cj4gKwl3aGlsZSAoLS1pID49IDApDQo+ICsJCWludGVsX2NvbG9yb3BfZGVzdHJveSgmY29sb3Jv
cFtpXS0+YmFzZSk7DQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBpbnQgaW50ZWxfY29s
b3JfcGlwZWxpbmVfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgZW51bSBwaXBl
IHBpcGUpDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
