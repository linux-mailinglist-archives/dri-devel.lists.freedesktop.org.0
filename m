Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79CAE3D6B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4727410E1CF;
	Mon, 23 Jun 2025 10:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="PEifsYKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71610E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldJbxPpIHX053iBQ9IHxd4qsuKIe6vjDaigA59QZl3OJPqhtIc/AAM4LwAo7dHaxRG0hfZ51TgWNncvXQZOL5f8/XOCejOeUTu1uEuGSlSVBTpGLBuigF65zhQ8/l+koytdk+i3GkdsOcdft3XTZN/DcVlhxM2Ca94N5t5ieUiAXxRujkpqsW+s1RKyYzA1JlR6rfdcavrxkwZAXlAyj30dYQFE59j8iJvvNfzWFpiKJ9D0VidKlAFih9BOPPGTNNUSbMyouvEoAzYCyvzXIJQSB2sCYTPJI1Pkz3686MgGWcIox7pQXtmQCsFlfke05a0LBY8cO6eeXzJS7DZlWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s0X9ikEef6jM+DjpS2N/xLznyJwgRZtvZ4sfu9zRQE=;
 b=Z1xLffUmJ2MZBmb87B10wiyAxuMvZegOHlDNdMGiGzic6CtyfSZi28UPpWiblq0n63zjbPkaDAA++ka5JcZSxtp6675P8OVw9syHTDv3CY5lXwB6oCP6RV5r0DWBT74nYtFQAYgnTaQgEVU8+M78PiTM6JFuR7yXdKDMX53d4HdEUhjeILgl1ArEV/JmpNaTMghT+F8fA7NxjXc8fH9KhH+3Iy3H8kFFu6+WAg287az8BVsVqAMtSWKFTDANAaJBbqBy1LTiHxU/LDs9C7DEKION7M3b3ttal65zKnHaIOyHuRDfUJgVWyHNu60hxmG/VGAbiizLLuIy1BdBmMezAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s0X9ikEef6jM+DjpS2N/xLznyJwgRZtvZ4sfu9zRQE=;
 b=PEifsYKMs+kUpsu8Uo5HVDsqzcO/+PYdeNL24PHR3vMvxu79PMYjCmXLb3et54j4BKMx9l3IbDTsnHW2ijToxm5xrOH3qVp0rLOouq2ojkSFRWDmDofH4gr5Z8YnVsTQw8XjMowUY9ZQem53XeqbFrAeRSfEw4Nj5HGp3ZrNMQ6CRMG7iFUIhciVK5VTF+WqwMGXnhj2xl+7UfbahuDm2Kv2XNy8ByH2FalB/BuFEzRe2tFAtbtO+SWute8E4IpEUs7jopYpjS/3RBMwOJSrp8n7mBGsyYOIyFLOO4AUn+pnRgMJu8uFy0fagcN+6/lvurkxGQVwjOb+gZ2iIx6mTA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SJ5PPFD56E32CC2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::859) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 10:54:36 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8857.022; Mon, 23 Jun 2025
 10:54:36 +0000
From: <Dharma.B@microchip.com>
To: <laurent.pinchart@ideasonboard.com>
CC: <asrivats@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <Manikandan.M@microchip.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
Subject: Re: bridge/microchip_lvds panel usage
Thread-Topic: bridge/microchip_lvds panel usage
Thread-Index: AQHb353QCN/22YFqFESSzU7dvbf6gLQIAgmAgABG6gCAAFVfgIAH/NyA
Date: Mon, 23 Jun 2025 10:54:36 +0000
Message-ID: <4bebca7c-d206-42a9-a233-f68f2c4cb1f1@microchip.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
 <20250617233623.GB22102@pendragon.ideasonboard.com>
 <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>
 <20250618085545.GC28826@pendragon.ideasonboard.com>
In-Reply-To: <20250618085545.GC28826@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SJ5PPFD56E32CC2:EE_
x-ms-office365-filtering-correlation-id: ab2927c9-99eb-44ee-cac8-08ddb2445831
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VWQ4WHpMOWkrYk1ubnY1enNjbmpuTVJvL1dxdGdSTkw1Z0dCMmpMYWFQOHQ4?=
 =?utf-8?B?S1E3Mzh0bWZKQXNWZFByUWk0OGFPOTlNNFc4S2xHUUp5RlJUYUp5VmtxUWEw?=
 =?utf-8?B?VnFONXQ3ZnZudkVwaU9Tem5oMWtIVmJid1dOZDVlY3lXQk55WUJrL2xwaHZX?=
 =?utf-8?B?UEdOM0JUVWpNZjRBTVZWNnZsRGpCdDczYWhEMGJteTYxYW5tL2IvWU5QMHZN?=
 =?utf-8?B?M3U5dFRJbzkrZ1oyT2FUa2VXNHdITHorMng0WDRBUUMxZ0lCTTc4clBBbHlz?=
 =?utf-8?B?aEV6U2w3Z0hKNEQ3MFhZR2p1OFN5RkRlVHVVcThid1Jpdy9kUHE5aDNyQlR4?=
 =?utf-8?B?UWFzcEVSTzRzM1dXYm5Sc2JSQ1NCZTY2VDA4UDlYNEx1Z254d0d2Tmh2azUr?=
 =?utf-8?B?akpKUEg5ZjNXNVgvVkN4V213TmFyUitiSjd2a1p0V1UzeTRobkpLalZiUjFX?=
 =?utf-8?B?aVZaakI2M3pYanJ3aW1KVlZKWmFYeDlBbTBsMWEzNDBoQ0NtYlFpMERtdEZa?=
 =?utf-8?B?T3VSMmQycVNHQVFtamROajBTMndFRmlPbXV6M1h2R3l2TGwrUjE0Mmc2Wll3?=
 =?utf-8?B?c3RRcGtaWHlvN21DSkN6U25ZSHdLYk92UDByR2JVRmhXVTQ4NGRRMlJ1a0ZG?=
 =?utf-8?B?TFZ2VEZvN1ovemVTQWNyNG1wSnhjRmdNYXVMYlJjMFBQb1BnQXUySzJYRmxX?=
 =?utf-8?B?YU5mc2UwYU5XWWh2bGRpU3ZzY1kxeW4xYkJIcVRWMEF4cVFseDA4Mi94QUxX?=
 =?utf-8?B?VW9UbGk5c0NxL0I5RXczQ1g4d0hINVROOTNsekRJUHJaNGtCMlFuRTZYSzdq?=
 =?utf-8?B?cUM2c3Mza3VsWm1OZUlJcHE4QWZldUc2MWdCd0VEWDNYN3pCWXZlbytGMi83?=
 =?utf-8?B?ZnpNUnVWa1p4Y3RCQy9IRGJnSjAyNTBxRFh4K1E2L0UwWU16MlpzOCtFakZ5?=
 =?utf-8?B?MDdQRHJueEEybzB0bkptUVo1Qys0QVRKQmp1ZVRIalFIMUQ1NERiNnVvelZZ?=
 =?utf-8?B?ZHNQKzRXWVNib0NKcGdLWEdKSjJFbUxBclgxcVYwMXI3TFlTZmxlaE1YUlJ0?=
 =?utf-8?B?bmZWWk44a2JTQXhxdVUyWkdoZWpSbVpjb3k5aGk3VG1OU29kNlM1UjlBZzF2?=
 =?utf-8?B?dmxjS2JZT1NEWXRoN3ovaVVYYTNrRm1sRU8vNUVTRWNsdllTbml4Q2NaNTlz?=
 =?utf-8?B?dll4UWY2emZUTTNqVnMvR1Ewd01MVU11RUliVUVOZDhkdUk0Vk5LelpMcUY1?=
 =?utf-8?B?blhqdmRqaHJaVk04WnNwdlZWbmdsa3R0cjl3NXhwbkVuZ2JPZXpmbHFkREJ1?=
 =?utf-8?B?RnBrTTdYZ1pvaVNtRW9wTEsyaVhpVlRLSjRYWTNWYnZKNjBYR3kxTXBSQnNa?=
 =?utf-8?B?ZENiazdZMFdVMXVQMlpxYTZNVkh0SWpEVUYyM01Kb2JVZVZhV2Y5SXhqdnpn?=
 =?utf-8?B?NTBRQlNKOVJYK1RUTmFnM0tDcDF1cUZDRXk4b2dVTS9WSFRDNGlIQmgzVzRP?=
 =?utf-8?B?YUlTMjlSQzlkM0UzaTRMRkpZQWdJenFYeVJPeVc2d0dIYTNXMWhWQlliRVRV?=
 =?utf-8?B?MnZIbXlyOUxST0RNTEZuMGxFSjEzZHFRZXB6dUQ3SDFYeXEwMTlBY0UxbXh1?=
 =?utf-8?B?VUJkVUpMQWtTSHpvU2ZINzNObXNoeVZiSzVwcENFOFBnNmIzNUFpekY1cERr?=
 =?utf-8?B?WFpKcGNuMmlhZkJWOEx0OVVUSmltT0lUYVhZWHVZYlBGU0RqR3FHdWhGcVhL?=
 =?utf-8?B?SVo1ZnFtdkF3V0oreWRpaGFGbkZFemFaZ1c3VEsrTmZ6SDZsRG93Z0lZR3hG?=
 =?utf-8?B?dXZnWHFHYWtQUDlqWCtDbEdnZkVwbE9kR3hNUDlKV20wOElVdFo3VU05eXZm?=
 =?utf-8?B?YU1iU3BoWkR0ZFU2NllDZyt3b3lTQjArY0F1NFc3MXljbDd5NHZFelRweXBI?=
 =?utf-8?Q?5WyJ6E15dR0nKXc+zHy+KzHSM2C/pX4R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVFCS1k4NTBnZzJ0OEZmODErNnZabGU4R3EvWng5TTlSYlZ5aUJKNTFVa0FO?=
 =?utf-8?B?ZVFHWHhuMXg1cklEQzR6MURCZ0QwVXBnTzNPQWdHS0Z4UHp6UGRkZ3BvbG9I?=
 =?utf-8?B?U3ZhRUJtZDBnRU9jc2RlbXIrRDZVU3pHRWltVm9LOTlPTVNUWjYrdVBWRWtX?=
 =?utf-8?B?eStrWElYcTd5aG1QU0szeG1HdXdMd3IyaXNucEF3emxSekdxV2JvNjEvR1lx?=
 =?utf-8?B?NER3ZCs0bzNJSHNZQk1jUEVCOHQwc2lrTTZ6bzhGZVRReWZwelBMVWhrNmVr?=
 =?utf-8?B?QlJ2YkV6RTlmYXZlVnMzd1RuNEFNL3pPa1NUc1IydmtZbVJWeTVEeHJzQVRu?=
 =?utf-8?B?REZLVlJ5azFVaGxiYzQ5T1IyK1BRWlBjZHE1Si9vRHpCU0ZrVEJja2c2SU9U?=
 =?utf-8?B?SDhNQ3VSMEszNVgyVEFuOU8zSlRYUitxNFgvWklCbXc4SnpDRVdGSi9vZEtM?=
 =?utf-8?B?Ump0Z0pkZ0h0d1EzTnU1NkRLTkhwWHcxaFJMbCtZMFZJT3RtM3h3ZHp5TDZ1?=
 =?utf-8?B?VXpBR1VFaHh0T3dHMThSOTFlVWhxaDFicEZhWUVjWXUrbk11ZFc1YkJhNzFo?=
 =?utf-8?B?cm5hVk93Y0o1R0VyL3lsblpnTXlNOUp6TTZRQ25semxzTWdSOFpLRCtUSkFj?=
 =?utf-8?B?NktSNWNJSXMwa2dIYUVsRGRTWWljZVRrZ3BRUm9UTzAwMW5HeXI3amdQTmp6?=
 =?utf-8?B?c3ZvKzhPQlVvVVZHNnVMNjlya2hFWUFHL0ppN0hFanJCL3ZRWElwMEh3TDhM?=
 =?utf-8?B?d1U4QThjaHBqaHZnRkdTWGVYd1MzamVXSm1rR21tUlBiZWJEaG5QZ05qbkl0?=
 =?utf-8?B?SE9KYkpkYlI2OVdGL0FxSGNTbVFHc2lEbnczRHp6USs3UnNTNi9XdjZVZ00x?=
 =?utf-8?B?Mlg5bnN1TktoWHBZaUJyY3J6ZWd3N2ZNRGFsalpTVUtOc2NuT3ZXZ2YwRk55?=
 =?utf-8?B?WVVJaGx0TnZ0TWZVaFoyMzI0RWpRamhucHBYeVRBaitXMzU4bzVMSk9ITWhX?=
 =?utf-8?B?am9OV3hkQTdhQ2RMSXc1dEV1TG5ycWtyeHRDYUVQTWZObGNJVXJWT0c4eEp3?=
 =?utf-8?B?c200ZzdwcTBESzYvUDI0UWFZVEZtTWxGREgxWEFpQzlORFpHanRrKzNzSlRh?=
 =?utf-8?B?ZUtqOVZBTU04RlliL0pOV2RVdG1odTl5aDBhNmRyYWpwWnRWVEdMdHRBSGhD?=
 =?utf-8?B?UnR4Y0IzNGRLcUJBWDl2RUNpcjVmM1pzQ1B1V1BCWWFLam1wVnM5eElFcUwx?=
 =?utf-8?B?MCtqTzNkbXdCczAzcmVGOEJQK2IyU1pVajBWeXVtWU12SEZmQmlEOVROUGc0?=
 =?utf-8?B?WW5zZjdDVTVJOURvMHlCUVVuZW1OVmI1dURBa1JHMFlHK05ZbFhhTXk4STBa?=
 =?utf-8?B?ZWt3VDdqNzVzR0hrbHV2cU5aaldReDhkRmxoVjJwd0NsdnUzN2VFNjVyOUNr?=
 =?utf-8?B?Lzh5bmxBeDI1MVpNQ1UrYU5LMjdQQXNoaTFrUkc3V3o3YkEzbVI1SkU2OUE3?=
 =?utf-8?B?TW1FVWxPOHlEUnRmNjBSK1Fub21rT3k2WmM2Nm9FT3lzTlVIU056V1pOVkZ5?=
 =?utf-8?B?L21lZkxoN2pSalQyVUN0cmFlUml0ZThtazJ3aUpvMGtaL242dE5acmpBSDVj?=
 =?utf-8?B?NjgzVU1tRUNmRm9IV0hlaXdXaUkzRHhSWEM2M1VvNFU4Wm1sSWdhYmVjb0dG?=
 =?utf-8?B?aUdGeVYvL3BCNS9yWHNrSjQ3VVlhOXhNaGUvWExxVmF6Y1dVNkw2Y0puVk9O?=
 =?utf-8?B?RWF0d1RNaUhsK1BMRUJwMVk0NmF0blZaZlJ5QW5uT0VkNXFvSkRPN0RTanFK?=
 =?utf-8?B?MVA5WnppZVlBM3pCb3dqcmw2RjliVW8xb1VKK3pYOWpjZXlvOVpYWDdCaEx3?=
 =?utf-8?B?VEdoaDdKVTNaSnE2SngzY0RoSzFnZlJUVlNzQmpmSURkZWMzMTM1N3ZjbEp0?=
 =?utf-8?B?ZDJmZjFjVVd5bXdTQWZ2Qnk0NjZpUjY1WDZLWWw4R3Z6THlzaWZUTWY3TXdU?=
 =?utf-8?B?N000cHZsMXNDclgwK3hRTWZURWRRdXF6dUdSU1gyMnVaQnR1eVJJNXNIaDYw?=
 =?utf-8?B?d1hLVlUvTHNBcThrNmhWRWRubFYvN3YrcDA3djJQK0ttc1lSMi9mVDN3UlIx?=
 =?utf-8?Q?QL/oQq6Qgz3mnjO7HUGFVIEIg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EEB71DD013A51428F62E4BA6397BE87@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2927c9-99eb-44ee-cac8-08ddb2445831
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 10:54:36.3406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Exttwj/0JMZ3+UuFFauIEDfylHz1K3Md7n7peQwqwsKfXXfoxC6GDgjsG3Pgnyh4AEQ9ZJPH2zsuEzYsdDhzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56E32CC2
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

SGkgTGF1cmVudCwNCg0KT24gMTgvMDYvMjUgMjoyNSBwbSwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBXZWQsIEp1
biAxOCwgMjAyNSBhdCAwMzo1MDoxMUFNICswMDAwLCBEaGFybWEuQkBtaWNyb2NoaXAuY29tIHdy
b3RlOg0KPj4gT24gMTgvMDYvMjUgNTowNiBhbSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4+
PiBPbiBUdWUsIEp1biAxNywgMjAyNSBhdCAxMDozNjozNEFNIC0wNTAwLCBBbnVzaGEgU3JpdmF0
c2Egd3JvdGU6DQo+Pj4+IEhleSBmb2xrcywNCj4+Pj4NCj4+Pj4gQ2FuIHNvbWVvbmUgcGxlYXNl
IGV4cGxhaW4gd2h5IHRoZSBkcml2ZXIgbG9va3MgZm9yIGEgcGFuZWwgaGVyZToNCj4+Pj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTQuMTEvc291cmNlL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvDQo+Pj4+IG1pY3JvY2hpcC1sdmRzLmMjTDE4MiBhbmQgZG9lc250IHVzZSBp
dCBvciBzZXQgaXQgdXAgYW55d2hlcmU/DQo+Pj4+DQo+Pj4+IEkgYnVtcGVkIGludG8gdGhpcyB3
aGlsZSB3b3JraW5nIG9uIGNvbnZlcnRpbmcgb2ZfZHJtX2ZpbmRfcGFuZWwoKSBjYWxsZXJzIGFu
ZA0KPj4+PiB0aGUgbHZkcy0+cGFuZWwgdXNhZ2UgaW4gdGhpcyBkcml2ZXIgZmVsdCBvZmYuIEFt
IEkgbWlzc2luZyBzb21ldGhpbmc/DQo+Pj4NCj4+PiBUaGF0IGRvZXNuJ3Qgc2VlbSBuZWVkZWQu
DQo+Pg0KPj4gQ3VycmVudGx5IHRoZSBMVkRTIGNvbnRyb2xsZXIgZHJpdmVyIGlzIGhhcmRjb2Rl
ZCB0byBtYXAgTFZEUyBsYW5lcyB0bw0KPj4gdGhlIEpFSURBIGZvcm1hdC4NCj4+DQo+PiBJbiBv
cmRlciB0byBzdXBwb3J0IHRoZSBvdGhlciBmb3JtYXQgIlZFU0EiLCB3ZSBuZWVkIHRoaXMgdG8g
cXVlcnkgdGhlDQo+PiBwYW5lbCBkcml2ZXIgYW5kIHNldCB0aGUgYXBwcm9wcmlhdGUgZm9ybWF0
IGFjY29yZGluZ2x5Lg0KPj4NCj4+ICJkcm1fcGFuZWxfZ2V0X21vZGVzKGx2ZHMtPnBhbmVsLCBj
b25uZWN0b3IpIg0KPiANCj4gSXQgd291bGQgYmUgbmljZSBpZiB0aGlzIGNvdWxkIGJlIGRvbmUg
dXNpbmcgdGhlIGJyaWRnZSBBUEkgaW5zdGVhZC4gQW4NCj4gTFZEUyBzaW5rIGRvZXMgbm90IG5l
Y2Vzc2FyaWx5IG5lZWQgdG8gYmUgYSBwYW5lbC4NCg0KSGVyZSBpcyB0aGUgdXBkYXRlZCBwYXRj
aA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDYyMy1taWNyb2NoaXAtbHZkcy12
Mi0xLThlY2JhYmM2YWJjNEBtaWNyb2NoaXAuY29tLw0KDQpJIHdpbGwgc2VuZCBhbm90aGVyIHBh
dGNoIHRvIHJlbW92ZSAibHZkcy0+cGFuZWwiIGFzIGl0IGlzIHVudXNlZC4NCg0KVGhhbmtzLg0K
PiANCj4+IFdlJ2xsIGJlIHN1Ym1pdHRpbmcgdGhlIHBhdGNoIHVwc3RyZWFtIHNob3J0bHkuDQo+
Pg0KPj4+IEJ5IHRoZSB3YXksIHBsZWFzZSB1c2UgcGxhaW4gdGV4dCB3aGVuIHBvc3RpbmcgdG8g
a2VybmVsIG1haWxpbmcgbGlzdHMuDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVu
dCBQaW5jaGFydA0KDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg==
