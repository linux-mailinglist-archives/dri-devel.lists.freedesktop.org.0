Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AAB24B6B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 16:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D276E10E0D9;
	Wed, 13 Aug 2025 14:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NtldXXNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735FF10E0D9;
 Wed, 13 Aug 2025 14:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aghXB3TlYY4eZLQlLKJ2RPLYuHUNY0zsvCpkt9J/9dpZNgk32OyO+JWlSt2CxYoyKxfpSfTC+ZxbC9JClajawsYtgZH8zFyYzQDiHKle+FtFE8zfhHKO6g3wK6brYYHBj2P001yWdu86jtd1axwGhqoScqWl8DTiKSIwrMzeVGXS6vqzWKQ06uagNcx7i299FkpfOWzN6Utd9Gr1sksY+bjlnXhTCD9Dn+wZECJVVh/wy1Yu4WMRXDfDIUFFOx4vwZTOMRq316yGSVDNqlgG0RJF1r8aVsM0C5yv17CJ69tPphq8t8ogyFNCZyx4tZ8nbQ+c8e9w0xRvi8xSKPNaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/061sOLMmQRb0O1F4VkYyFh3PzawJAuxZvA5z8d11LI=;
 b=zL3ZZp9vIvD1tDoY1h8iCYekK4e6WT0TU/3hg7U2TG6gMhZpIpwv9NQhNDO0aaRTchK9qwTJ6BUaKMQ/aahVsyUZmL981KRFlkup6uuEtq2MjtzQWWoMBLZMuQtmxwEnP8xyfXzFnqOdGpyrybXYLYHzl1XraqweAa6HRIuRcp3VI0VvKyo/wAsO8pAn3r8tzPJ72xyT0LvPBr1rOIX+vYO3dnqRcjuIX0xNfutgAwDXI2xhcjNymSiDO5N9NHxVlYuQiqHhuJWdt9n2nUFDwL/F5bwkUnCdxaEmVkkR28M+Tw+KTMQr+odb7nvwuvd++U/QDe5DY31EwfXQx+2zFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/061sOLMmQRb0O1F4VkYyFh3PzawJAuxZvA5z8d11LI=;
 b=NtldXXNWhWFCjoGpd8DIcg/0cO3+O97gXSSLEoTrDXyG0LRDDBbe7eDwjizSoJ5qy62gCny3IwmznCfSKHZ0AEnLYr5pdVlZgBEAwumXYfm/f3qLrOc6pnkRN0TLR4xBoOBaNpU2mu3xWUJsWQBb5SFt7t1T2yBO88soYASMxosNmZHQ4pKXfp0lzxwGlvbrbe6FeFWpNcbBO+utfY+aMSiiIe8YqBwr9cx3pRs9CErPk++NOoUZ4OoCWoD+Z4PgdkgMjuV/mU6z4B83e0WqBk9L6+vMH836AcPYeArSi5hSBoijmHAIEfv9FyntG8+LpHY6BeKVvKLWvVhyjNb0xQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS4PR12MB9633.namprd12.prod.outlook.com (2603:10b6:8:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 14:02:07 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 14:02:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com"
 <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Zhi Wang <zhiw@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Topic: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Index: AQHcCqELx/TD/+F6+0iCA7EUtlzm0rRfojCAgADLeoCAADLIAA==
Date: Wed, 13 Aug 2025 14:02:06 +0000
Message-ID: <462612a11d7e6f8909fd14e549d143be017fc14e.camel@nvidia.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
 <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
 <DC18XPLOI092.3BTLNFSDWJU8G@kernel.org>
In-Reply-To: <DC18XPLOI092.3BTLNFSDWJU8G@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS4PR12MB9633:EE_
x-ms-office365-filtering-correlation-id: d284b08b-1bd3-4243-3005-08ddda71fd17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODd4Z2VIdE9vbXhYenA0TkRrVVo2K0FOM2U5MzhYMGVOaE4yUnVMMGlBSm9o?=
 =?utf-8?B?eVlaRXg0Z3M1WDgyQkVxbVhZdy82ZXdYZXp3WjBhc2lMcndTR3dKazFKNlVT?=
 =?utf-8?B?UHdSWG9Sejh4b1l5cEZPTWQzb0QwYmZDTXVzWGY1R2RBTDJ2Z0pzd0xJWTZh?=
 =?utf-8?B?SzJmSGFFM1dJSlFuM1VONXk1SmpzL3FlcHgvZm1JRWZhR1JxemZpKzZleCtJ?=
 =?utf-8?B?aHJwdHRKM1ZYcnB4SEhsZ0NsWlpUTFRxRXdVdGI3dGNVc1k2aFA4VEptbk9h?=
 =?utf-8?B?b2tkTTBoVzhTKzFINllPakpNemNkOFFnK3RmTzVESFJPMkF2eCs5NEdjTVpS?=
 =?utf-8?B?aUlCNWVXRG5KY2d6aDhpUlpVSlFwOXF1dkRGdGFaU0wwcFVFUnN0Zkw5Y2Jq?=
 =?utf-8?B?MnVYODZaMmJhMmt1V0VvdXNJN1NJK0djeFMyMHJCcCs3VXFuQ3lBZEYrblNv?=
 =?utf-8?B?VWF0bHdHbEZRUGVmUHhpWW9Hc1QxNDlKck9NOWVUN0hyNTZ6MDRndVYycjVQ?=
 =?utf-8?B?T0ZLYlpVYk42Zm54OXUrNlM5aVJVSEVSNkxaWWFuUC96bnZmL3VxbFFBdExo?=
 =?utf-8?B?eTMrbmVLenBjR05JS1pFbHVSYll5SkZTWXYwbXVtNnBrSm5QS01KVStFOG8r?=
 =?utf-8?B?MFRUeWd1U3QwcExaMG1UN2hGVG5mN2xPSGdhd0dhQ01oTlFxdzcxOXJtaDUw?=
 =?utf-8?B?N1NtQkw4bTl5cWU5S0R0SWV2ZkRaUFNWeThQbm5wQ3dySHlBcW9xbUpBamJG?=
 =?utf-8?B?c0pXK1ZpcUViZ1N0RHRrditrdmFrRHFWTVZqamRiVXJYZE91b3pCd2xUL0hr?=
 =?utf-8?B?Ym5xakYwREJkY1podGpkL0NEc0x0TlhhYUFWb2ZpZnhzbzI0MDJZb0U2U0g0?=
 =?utf-8?B?T3Bhd0dUUGovOWhVQTVRWW1Ec29XbktyQXhCZm5XYkxWa0dnOGM0WW5oWEN4?=
 =?utf-8?B?Y1hGN3VzbDVHanRBb1VyZkN2d29vUkpLcTVkNFBRM2Z6eUpKNFpCc09tMWZt?=
 =?utf-8?B?eS9MSmRlSFNyV3NxaWRjbWdCN0VCUWx5OElWbXk0aEJJQ3dLaUFvT1hpcSt6?=
 =?utf-8?B?M3BnNFZrVUdyNlZFZFFjWWJValcyYzNMZUpJUVB3bFYxY09YcS9WSXRZbEdN?=
 =?utf-8?B?bFdOUUxYL3MrQWMwSDYzc1hrLzVkdE1kYWJwbUY2RFE4eWNPVDBhdnZtcDRn?=
 =?utf-8?B?dG1sbGNMZFRxQkt4NTdxb1pxVUJrcU1XOURpL0RTNzU0a05rNm81bXZrMnFE?=
 =?utf-8?B?ckFTOGZyRGp3aXY3QVZWckxJaG5YOWsxdVNmaXNQRlIwWjhOQ2RCYzZqUDF0?=
 =?utf-8?B?UHlqUlNKc3UrSEJFUFo5MkdDUWhTa3hnSXhOdWFaK2V6d3FLaTNaejd0Ukxn?=
 =?utf-8?B?WWN4NVFUYUY0WGxSQ0FHTzZLT2NFNVBJaVBaTHZOUkNSd2l1eTNuNVJzcmhQ?=
 =?utf-8?B?dlRIcDJWaUh2RGloWGVxRGRReUJRa0hoVSt5QUxhWUhsYWp5eWpuR3AyTld6?=
 =?utf-8?B?a1dYT1VjUjd5Y2t3VHEzNTh2a3lZazBubnBWOFhLdTJ0ZWR1NXdCSnVNckNr?=
 =?utf-8?B?dHBldGpFc2FxRkQ5UkJ2OXNVcHJOY0ExcXNGV2lzWkYxSFovSzRZbFdSTGtQ?=
 =?utf-8?B?ZUpuYjROZkRaVTdOc2oraE9IcXMybTI3aDRLM1ZSYkRFeW4zalpjZFdZNXVa?=
 =?utf-8?B?TUlEeXpHR21LYnVLbDMvUjBZeGJDRXdtczlja0xFcmcyUkQrVHlpSmNkd1lG?=
 =?utf-8?B?YzhCRUlqYzh6QzBwTER0OGlNN0lLMlAwUWV3bElJNTV5MVVoR25oV3RNbmhX?=
 =?utf-8?B?V0E2RDFQaUhKQ1IzQkVSbHlDZnlsSnJIM241bkVJQjF1cGg3clhMNXdFSGFu?=
 =?utf-8?B?bUEwUWZ2QW5WazJGUnFjUFREY2xGdHJ1d2pOdDhIQTc3dFZJTzBONHpUUnFr?=
 =?utf-8?B?MVRrdEt6T0lPcTlqK3crN2swVjVPUnZvR3BUa294T1NKbXpUSVRQWGdQQVFa?=
 =?utf-8?B?SmVrdnFKQUVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmxPMVgwdXh1Wjd0T3pJQnJaZ3NCeG1ydHRJUitqUHgyMVhjcHZ5RUVPampH?=
 =?utf-8?B?VFFoVndPSVYxZ0lYb3ZOeEJ2ajBVZlF4RTJNbWFGYVJlQVZDWXRpTWFmUjV5?=
 =?utf-8?B?bS81MnhWMEFYVXFDWTE1U3RRblNPVWI0L0Y5WnkyOVA0aVlCZkFXNU9sR0dt?=
 =?utf-8?B?cHdkSVB6RjE0a2o0Mys3YkF5VDVhWStCQ0VMN1ZoTnRIZHhjeEw1cVk5cUxL?=
 =?utf-8?B?dWF2RnNKUTNoT2JkS3NEbkRJVWtOVFZsNURUb0lsbXJISE9pM2d3NE16U3or?=
 =?utf-8?B?RytRL0F2VkJmQjRUcUJOOXI1RFFvOXhid0hkWXZqT1pyb20relJaSUdKK3BQ?=
 =?utf-8?B?NzB3ZGVaMElVRmZCZHZsaWN5UTFkc21yMkx2OEVvN1hBeExmMVJkN3dkQk4w?=
 =?utf-8?B?MVNQZXdtUldibjk3ZDBNL1M1eFRrOVZPVDJDMlQ5V1dyc3YrNi9YaXNWbUsy?=
 =?utf-8?B?cGtGbWVWUFd3M1VvZ0JSLzVaNUpROUc0Q0x0d1lMRmEwL2dWek9aWG5HSDJ0?=
 =?utf-8?B?NFR5cHg1b2M4cFRUdjBNM2IrOEp3Y0ErQ0tyYXh2bEVRYU1HZzB1cU5WRlBo?=
 =?utf-8?B?YTF5ZFNWczJOOWFSbjk0Mk0ydTFzK3NrSkhVNUNqZnpyUnJ2UHJYU256TzRp?=
 =?utf-8?B?c1J0TW5FSFc4ODRyTnBSYldnU1BBbjFqSTNJb2J3TFROYkJEV21XMmk4UUg1?=
 =?utf-8?B?NlIxVzMvYnFZUi91aEdjcysrbEtva09vYWN3UUIzS0dxcmVqcWJsekZrVzlV?=
 =?utf-8?B?MEZqNnNhV3dTbTR1Rng2QlFMeXJ6OW1sUUpaZm5oVUVGNGE5YUwyRmFrWHN5?=
 =?utf-8?B?QUwzeGcrSDkreGxYbFpNNHBBWlE4c3ZCWE9MRlNqTlNEYTVTRjZibm9VVElw?=
 =?utf-8?B?TUEzTHFhZ0RqWE9KcmZBRUsrTUZoQzdLcWM1LzhuTzNkYWpYVmZBa2VtTXJM?=
 =?utf-8?B?WkVkMWdsVGRoRm90RDNaWC9LZDlNSHpWaUtyKzJ6WHQ1Smd4QW5qM1Eyc24v?=
 =?utf-8?B?Ri90NFdwQkkvR0FrZDZnOGphNmx2T1Y5VlNKTFc3a3AxcWhVMmQ4bllTVHpv?=
 =?utf-8?B?RHBlOFhTQmt4RUJVU0FQUDA5bUx3Ky91VkFNdlE0TUtPWjVDU1dnTVR5V05B?=
 =?utf-8?B?MHluMHd5dURLQlJzVWk5VWN6RVlHYlUxbTlSLzVEajJyQUFMVlJldmZkWEpL?=
 =?utf-8?B?a3NuNmM2WDZxa3FuU055OWhkUWlVTDJsYmdvZTdHNVcra3NrSC95TWNGVDFt?=
 =?utf-8?B?UzFVcEMrSDJjWGRKZFFYWERiNG1wbDFhd0R5SDF3UnMwZDBMYkFMS001eEdL?=
 =?utf-8?B?cjR4YzJlRnRjVXJuRTR0Q1k4dHlabXhkNG4wOUpISzNINVBYMzdOMks3dVFm?=
 =?utf-8?B?dytwRmN5eEVSRXBJYjdkanNUaXE1dzBza25MWjR2ZWUyWlFsQkZiSTdFNFNU?=
 =?utf-8?B?cVlpS3VHNDlrdzNBd3hUUk5CSFVPYUpYUkxCam9UblI4eTg5V3E3THd6VS9w?=
 =?utf-8?B?Ni9ESGdqYkE5UUw0RUVQNDk4N05wMTJFVC9zVUo0bGREanFYMy9qTThET1RU?=
 =?utf-8?B?a0Y5elZrUjYvNzZITVlGdXk4VzhkbHRUUFpqOTJ2VmV5eEh4ZUhCMlRFVjhC?=
 =?utf-8?B?aWZxMnY1N2xKZEZ1S2lJeGFTa3Y2Q2p6WUE3d0pmazI0WHU2Q0RCOTdWMXIz?=
 =?utf-8?B?RlEvN3ovYk94Ry93WW5xMExpMFVIOUVsYnZSdExZSVYyeVExUnNmaGx6NE4y?=
 =?utf-8?B?cXIxakNJSGxoWk9jaU5QU1BmWFpianRuUUFnRVlVdzJrRzhxSFU2OURtTkpZ?=
 =?utf-8?B?bng0bGFEaEd6YVF6cXNFTXd0OWduTCtwOGZnakdxMHluRzFaTVpzenVPMmla?=
 =?utf-8?B?aDFFMWRZQjV2aHd0L0RHQ0pqODl6NjhjVVpleTJnYnZOdUxzNkhnL0tmUFlM?=
 =?utf-8?B?d24yVjc4dHNhdWR0M0tPVit3Mk5DWmZibzkxSE5QYVlsbEUzQlFXZmJGT0RM?=
 =?utf-8?B?UFpuOEk3RC9HSlQvbG42T2t4OVg1Zm5TK1JZQlFxYWZXWm1PbDdUL004Wldw?=
 =?utf-8?B?cUhWNlo4THZINERFUlhmZ3ZnQmthUTJwSHNHU042eHB5TnZ4dmRNenl1WjFR?=
 =?utf-8?Q?d6jMiW4HTVauswyypTgDL+SLX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7380AE44603D1B468526CD56F88E4D0D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d284b08b-1bd3-4243-3005-08ddda71fd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 14:02:06.8520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLWVdjvSajb5o30/xok5bIb1jVGCtqIh1M2MtA/bnKb2IUXRRq6uPTLyTceg1sqLAygD9lR56X5yyzL047lUGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9633
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

T24gV2VkLCAyMDI1LTA4LTEzIGF0IDEzOjAwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IEl0IHdvdWxkIGJlIGEgbG90IGNsZWFyZXIgaWYgd2UgY291bGQga3ZmcmVlKGJ1Zikg
aGVyZSwgYnV0IHdlIGNhbid0IGJlY2F1c2UgJ2J1Zicgbm8gbG9uZ2VyDQo+ID4gcG9pbnRzDQo+
ID4gdG8gdGhlIGJ1ZmZlciwgZXZlbiB0aG91Z2ggdGhlIGJ1ZmZlciBzdGlsbCBleGlzdHMuDQo+
IA0KPiBBZ3JlZWQuDQo+IA0KPiBaaGksIFRpbXVyIGRvIHlvdSB3YW50IHRvIHNlbmQgYSBmb2xs
b3ctdXAgcGF0Y2ggZm9yIHRoaXM/DQoNClllcywgSSdsbCBzZW5kIGEgcGF0Y2ggdGhpcyB3ZWVr
IHRoYXQgc2l0cyBvbiB0b3Agb2YgUWlhbmZlbmcncyBwYXRjaC4NCg==
