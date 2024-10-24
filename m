Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229CF9ADBA8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 07:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2513A10E147;
	Thu, 24 Oct 2024 05:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adAM/uKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35910E147
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729749003; x=1761285003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JoqOiGtSrBW2tuOUMvVJkc+qJMkETGefKHM5P91dCy4=;
 b=adAM/uKr3qlW5MLLpMXsfHFKYZ6RlFQGBjf04WOfsoeHbVIhaocJd9TC
 dgTgvYMtzGQi8JpbH0jKvrP2wz+FBnCsPQhxZyCnRy3OcJ2tq2rl6Hl9D
 K25Nwyw09XAmmXa1nnaRKsDpoA9KKqPIWLy/hWVmv6VNARa10T0pAzCs/
 1zQvSKdr0WTWy8yapQLU5DG8TXGce2Y1dtX1qOz/i+pEeB5mpPHr8zL9X
 Neqph6kOOrDWIcBYCdAozcZ+iQCpoOOMOwwKLc+Gc2sdPPJM3WUeg6jnC
 cQwIdSw7tTepeKGcNHi9dh3hG1EXRmqaTkMDcbAf3nnnnFV/PnXFkMCjh w==;
X-CSE-ConnectionGUID: CEiqEh50TIeWAHmH2z2r5w==
X-CSE-MsgGUID: l021oLHWQnKYlsFg9sWpmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33050402"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33050402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:50:02 -0700
X-CSE-ConnectionGUID: 1f8GK5spRY6gKlX72IqFMw==
X-CSE-MsgGUID: 5eduNkzhRlK+uhFXq+UAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="117958962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:50:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:50:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:50:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYuZchxtae1GFNym/pJ4m10FZaoWZWvWS9oD55uxCGl691jCFYSVqH/tBKxDb6d6ovl4hFvM/1DYDQfjYJ0trp8Y+ok+rbR2AZottS8d+YBqq7HqtyzQKZXsQ6y/hOaFD3/Moe8o++DiHvAmVK1SkQpI5gpyKYvuP6FdZJ4L/ujovXzrty/QB0bYt+WyYrN/TfvsQptMn4E91wC0QJte4t1bHPIiupMJM52aHIY7bJlUpcN9AdUzUnTZhAYUUMKuVtglRcYJd5ybKjUL4ArpEyz9YsQ12lYT53QxR0gA0A2UOdTLDTiWKs1ED5VUeVsBarm3GuaDHCoPZEoQty7LVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoqOiGtSrBW2tuOUMvVJkc+qJMkETGefKHM5P91dCy4=;
 b=ey9OZltz8DRZ9zOCk+BZVtdfUYOi7yVNhIaKNktVMA+q+3frlitb0C+wUxu3whwr1kN9YTyUoulUXTJNNKCESndPe6/aVj2FUgeLceg5ZTxoiYC6fg50PowZQC2H8Q1RD/OgQQVOOvZHdaEaDZhnYMW0y57zPcMoHR/8i2S5Ug4fy6bBAANo1ebpCgSFbg9vTYuwiryEvF1o+tph/dMknVl1F4rjLywoWI1jCzuy1fGQF1XKLyqQJV5INCnDC2ZiiEv9/y0N1rUnrIOXNkAZuVVvusKgkX/oxjCH3uL8QS5IM5rENgRR3a+jvkdFyUJEtT2QAoWi1yyYd6nRY3UFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 05:49:58 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 05:49:58 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUw
Date: Thu, 24 Oct 2024 05:49:58 +0000
Message-ID: <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
In-Reply-To: <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CYYPR11MB8359:EE_
x-ms-office365-filtering-correlation-id: 3e86bb13-5075-4bba-9233-08dcf3efb1c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzF3V2hvWGtyb3BtcGd6YnN4Nm9oalNOOVQ1WFd0aTJFQVU1U0dZY094VkFR?=
 =?utf-8?B?MzZGM0V6RG1zWmxhMS9MUWdkREhrREE0bkdQODVlK0NqcE44cmJpL0VHa1BR?=
 =?utf-8?B?WEw3SWh5blNEQlh4Q0tGTGsxYkRaY2RaRHBUWWxLZ3F3aFFURFRobXFrakVU?=
 =?utf-8?B?K1UyK05PSHdEb1ExUXZvZ0paSXN2WGh6b2tTZ1lGZzlybFlnUm95QjdVd2d0?=
 =?utf-8?B?M2IvSGVLc3FvWU16VUYwY0szU0JnWVRMK0UxYy8vbnp6ZkI3eWp0NVU5SHp6?=
 =?utf-8?B?bFMvbDR6VDRlN1V2QWwyS2krUlJTUDNEdGxDZ3RvQ3Z2KzlGTEJFZHcyT3JT?=
 =?utf-8?B?c2gwR3hVNWswdEpyc0FxN1REOXRRd0c4ZzkvaHRuQzVNRC9MTWtzbkE1Uk9i?=
 =?utf-8?B?M0xxNlRwdmszYkd5d2VVSS9RS3U4TUc2U0lKRitGNWRnRllvSjNMaXFsOFNl?=
 =?utf-8?B?YUxtSzE0bGxCOEVrdmdPd25uektlZitRNm5NdkF6TzdadE9kb1M3QWMxNGRD?=
 =?utf-8?B?T3UydHRVemt0bWR6NDdZeHVKOWtMWU83NC9VL2xDSHlqTHRuYjh6UStCcG9T?=
 =?utf-8?B?TFVoV1RPS2Rod096STU0WGY3NFVLelVuYTZyQjlHMzllTWVBcHRibW9ZNTVC?=
 =?utf-8?B?bVJGejJHaEFMdEpsY1ozQW1wbTVTeGE1WFJqUndaWmk4R3NLMmtQeEVGZUdv?=
 =?utf-8?B?MkFZSi83Vm96WDcxNGlIUTcvNG1vZGE2VVhlL2cyMzBCSHlURXFSUG5KU0gy?=
 =?utf-8?B?c1d4V0NHdHRLeUEvUEk3eS9udU9vY3d4ZitNRldLd1RLbXlDRi9QWFl4VmZx?=
 =?utf-8?B?RXpUMThqOUJzcVVIM3lrajcvWHdKZEVjMnkwd1RsdlJ5TDdIWlpTNjIxOG4x?=
 =?utf-8?B?cHhDMXNyZG8yM1h1ZHBIc3JZNk1zbDdXNlA0QitFWHNVSlpObVZNRjR6VWRK?=
 =?utf-8?B?ZzRCbENQZE9WN09ERm9sZEpsU1hxcG5SR05NZkNHUU5XNm9SUW9XLzJhNTV3?=
 =?utf-8?B?b0hmbXdCbjJ1UlphRVNsQkdaOXg1bTJPcVNwTzVha2U1UGNFelgrYmJiQUFr?=
 =?utf-8?B?TzZja1N1UndBVjdpSjBGTnN3c21nc1JqUVY0Wi9VeThLZ2lmczV6bkY0UmNS?=
 =?utf-8?B?V3hMREtiTXFER0t2VGFnZElEN0tqVms3b1c5bHJ6Rlh3R1dhQTR2VCtoeHJ1?=
 =?utf-8?B?TzJSK3B0ekRack80UWN4SkJJcmZDU0lqWThSZkhkbmJWZHU5a2JsUWJrOTkw?=
 =?utf-8?B?ZWRSVm12ZTZxZGVIWXpDdVVrbXhudWRVR29xWFNJR0dNS2w2NFNtWVNjTHZi?=
 =?utf-8?B?Q3RBWGNHRW5kNEVDYVBMb2VlNFYrTDJ5SmNWYzFxdGdzTGhzN1pvT2QvZ1h6?=
 =?utf-8?B?Qk4vQ0k0c1gxaTk4clhHc3NGTU92dHBsYjJoUUp3am05R3lYWU1EY0dGbGF4?=
 =?utf-8?B?bEZjM24xcmkwU09qb05PcDJCK1JDV0tJM2NDazJ2UEJvWVdzYlVvS29rRXdx?=
 =?utf-8?B?ZEExSFBwM21EVVA3dTRRWjdLbGp0Uk1TUXcvVXhTRnljTEx6d2QwUm8zMU9U?=
 =?utf-8?B?YU1udFdlQTBwaTFodndib0xFY3M2RGUzK1FRZ1pCZ3dWdGx6bkROY1A2WFp2?=
 =?utf-8?B?QUR2Ym9EOUhuMzVNM1JuOThPUmpHMXdVdTFuOUIwS2owU0JqWjFmRjJsS0Jm?=
 =?utf-8?B?NW9lR0tzRXZsbWJqWHk4T2xkSDBnbzFlZjV3NmFiVktQY1MxY3ppNjZHVFh4?=
 =?utf-8?B?ZytMZzYxVjZicVJYQVBFdzEyK1J5N09UcExTRXVnbnJrbzdxWnd3Qkp5KzJi?=
 =?utf-8?Q?tvx2VHXUfgIcf6SqmiQg51gI+qbq/r98vrffk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmxsNkk5YnpvaGkrVVFjYmNSdmE1Mm12YytuazgvK0VPT0dMaHdqcHkwdTdM?=
 =?utf-8?B?WWF0eWN1Ym85T2dabUtGTUVpUFlRekxOdVREam14TFNBTnB4YXViOW9odmtX?=
 =?utf-8?B?QUVnZDhjeWxDUFBSNjVBTzhRVlBoSHFpcEo5SXUzaFd2N1VsN2RnNXp0cFRj?=
 =?utf-8?B?eFR4NitEKzlFWG1RcVFrZWFoWVlBMnFEMjB2OVYxeUxLNW4vckxVWFRaaWJX?=
 =?utf-8?B?MEtFYzF3QzB2SktjODU3bTJhYWlDQWQwcDk1OWxmV05iUHBRMEZuRWc4blFk?=
 =?utf-8?B?cGd3TnJXWGRsdmljUmZLWkI2a0lHb2ZDK3pwQjhwOSsxSFRtTmQwTzh4VlNt?=
 =?utf-8?B?cUM3a1I3NjdCTngxVjMyNld5WUttS011QXl3dWRTMjZrVThyZFp0ZGNiWTlv?=
 =?utf-8?B?NHdHa1kzT24ySjBweTdDSzh2S0NGK0xnbVNQREgwd1ZjUVJYUjZmS3BzanBS?=
 =?utf-8?B?RGFjNDVIVjNXcnMyazFzUmpBdk9yRmZRZitOTHpNTWRCdk5nOVMzaURQT1Uz?=
 =?utf-8?B?ZEp1eXdweWh0TXpWa3Q0OFNrMUxSZ1Q2LzAxS0NNYUhKbVkyTlVjeVZlNVlr?=
 =?utf-8?B?S0xXT2Z1T0VMcFprWXBPTkIraXlHaU5leTIrSWQ4d0pzeE43Vk1DOWpsSDR1?=
 =?utf-8?B?N1JlYk5CL1RIQTdFdDFxRFZEZFl6UGFrR1dsc0lCaGw5VWFDbVA5MjhUeFNz?=
 =?utf-8?B?YUJrNEpjNEhRUTB5Qi9PSm9XUmhITDJJWDNtNTljUTJxenV5Wm1tcEt1YWw1?=
 =?utf-8?B?KzB5VUxRWXZNVWVIZmx1RDA5eDFuQ3NqZ0thcGxhZ3NGdVZsL3FUeEVLN1g2?=
 =?utf-8?B?dSs4WDBVMUE4azZSNTc3QWM5bzY1bTBJOEs1OFZtNEZDbTV1Wit4NlI4SHdT?=
 =?utf-8?B?L0lRRVZBcEFzeUNUTS90Mk5rL3Vwb25FeTUzWmVaOXVyMFFaOEFJMTdKeWJm?=
 =?utf-8?B?aEdaNU05c0ltbkNKazlKRytYWFJPK3d4OWlRYzJQNmF6MlZqdjljNnFwVXVn?=
 =?utf-8?B?QW5KZlZCTFc3ZUFVcEZYVTVXV05KOGJnK0dUanUvM2M4ODdnRjZLN2FaR3gy?=
 =?utf-8?B?eUxoeUlqNjhzNmtBWGpHSFRLNTNwTkhxRDE0cHN6NnBHemhoNGpKVUVUdzcz?=
 =?utf-8?B?WTRLQURKczZwK0dKRXFpdlZDSWtxN0Vra1dsbGtFSkIzRUFNNDUrdGR0UFRL?=
 =?utf-8?B?VVptOCtOMkg4cllzK2VxcDc1ZEdJMjU4VWE4TlBtbE5naXhoSk1IRmNNZEFh?=
 =?utf-8?B?ODh6RW1DamdVNjdKalZFYmVtM0EvMmYrclEzWDhaSW9jWk9wM2RDZmlTNXhO?=
 =?utf-8?B?Z0wvWUMvK05EQm1qMEozOVdUN0tldlBGWkdVTU9uTThaQkNCLzdUeEpTWjhG?=
 =?utf-8?B?Um9WeUxkNEl6dERNOGd6N01xdVZqTzE2b09jdjFFZmVXeFpTL2ZhZGxSbk5o?=
 =?utf-8?B?NTF1VXNrWE1kK1VxYnNMRTM3cmhzVGxCYkFzZENCa1dzeElMS3VCUUhTaWJl?=
 =?utf-8?B?V1h1bTVsRE1mOFJJdzJ5bG0wMks3SXJ5SXU1ZlFteGwxTzlZYTFqN1pabEV3?=
 =?utf-8?B?RjE0VEpPcnA5WjVDcmNGK1B1WjhJdGF4bk5CRUc2QTVxcDlBditZR2UrYmVN?=
 =?utf-8?B?QTNjZVNVd0RLa0pQVmhLTzBickMxT0FlYzViUEZFZE0zZ2w5b1JKQWpkL0Y5?=
 =?utf-8?B?Qy8vTnRRN29WNkNqWXZSOEhVRDl0R2g1NWtOQmtvTWZPbXVVU3Q1N0luVXBN?=
 =?utf-8?B?aTQzYTRwSUl5S0kwbDVtbTlWc2ZrNzNrR2lNbnVKUTMyeW0xNXpMalk1Tzdq?=
 =?utf-8?B?QVMrZXIxa0x2NktIdVpFemphbGNTUUVweGhldnhrTE9GQnNjSVJEQkNkcURM?=
 =?utf-8?B?UmRnSnBnMkVVUGFENmV5dndqTS9oQ0R3YXkxYWQxWnBiSmFGcDZmZ2xsZWFj?=
 =?utf-8?B?ajJEMUFqcmJVOWlYcUpQY1N3WTJtUzlaTEVTRFNBR2VxYWpxNm5MSFhKVy91?=
 =?utf-8?B?aExFSE1neTJPYnZGb0pJRXNmdGNnR2hLSXlhYTF2TEhBSHBWUENYWDk3Yktm?=
 =?utf-8?B?WEZqU1VxN09Pam16RGorczhPdHZhSEJKd2RTaTdZSDVRWmw4RGRHREhscVUw?=
 =?utf-8?Q?CAth9V9960Huizul0WgMhjH0U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e86bb13-5075-4bba-9233-08dcf3efb1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 05:49:58.4482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GL71jlFpLC8eYoLg6pboCNHmtG0Eiolyq1b2waZUJwHYENS4hbIUGdBMxbcg9NZHHbGr5vlYGfQu5Vn/hOh7obloWJQC5d3itD8RhXCo9HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gDQo+IE9uIDEwLzIyLzI0IDA3OjUxLCBLYXNpcmVkZHksIFZpdmVrIHdyb3RlOg0KPiA+IEhp
IERtaXRyeSwNCj4gPg0KPiA+Pg0KPiA+PiBPbiA4LzEzLzI0IDA2OjQ5LCBWaXZlayBLYXNpcmVk
ZHkgd3JvdGU6DQo+ID4+PiArbG9uZyB2aXJ0Z3B1X2RtYV9idWZfaW1wb3J0X3NndChzdHJ1Y3Qg
dmlydGlvX2dwdV9tZW1fZW50cnkNCj4gKiplbnRzLA0KPiA+Pj4gKwkJCQl1bnNpZ25lZCBpbnQg
Km5lbnRzLA0KPiA+Pj4gKwkJCQlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLA0KPiA+Pj4g
KwkJCQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpDQo+ID4+PiArew0KPiA+Pj4g
KwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNsOw0KPiA+Pj4gKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsN
Cj4gPj4+ICsJbG9uZyBpLCByZXQ7DQo+ID4+PiArDQo+ID4+PiArCWRtYV9yZXN2X2Fzc2VydF9o
ZWxkKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsNCj4gPj4+ICsNCj4gPj4+ICsJcmV0ID0gZG1hX3Jl
c3Zfd2FpdF90aW1lb3V0KGF0dGFjaC0+ZG1hYnVmLT5yZXN2LA0KPiA+Pj4gKwkJCQkgICAgRE1B
X1JFU1ZfVVNBR0VfS0VSTkVMLA0KPiA+Pj4gKwkJCQkgICAgZmFsc2UsIE1BWF9TQ0hFRFVMRV9U
SU1FT1VUKTsNCj4gPj4NCj4gPj4gV2h5IHRoaXMgd2FpdCBpcyBuZWVkZWQ/DQo+ID4gVGhlIGlu
dGVudGlvbiB3YXMgdG8gd2FpdCBmb3IgYW55IHBlbmRpbmcgb3BlcmF0aW9ucyBvbiB0aGUgYmFj
a2luZyBvYmplY3QNCj4gPiB0byBmaW5pc2ggYW5kIGxldCBpdCBiZWNvbWUgaWRsZSBiZWZvcmUg
bWFwcGluZyBhbmQgYWNjZXNzaW5nIHRoZQ0KPiB1bmRlcmx5aW5nDQo+ID4gbWVtb3J5LiBCdXQg
SSBzdXNwZWN0IHRoaXMgd2FpdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSBnaXZlbiB0aGF0IHdlIHdv
dWxkDQo+ID4gaGF2ZSBhbHJlYWR5IGNhbGxlZCBkbWFfYnVmX3BpbigpIGF0IHRoaXMgcG9pbnQs
IHdoaWNoIHdvdWxkIGhhdmUgaGFkIHRoZQ0KPiA+IGRlc2lyZWQgZWZmZWN0Pw0KPiANCj4gTG9v
a2luZyBhdCB0aGUgZG1hX2J1Zl9tYXBfYXR0YWNobWVudCgpIGNvZGUsIEkgc2VlIHRoYXQgaXQg
ZG9lcyBib3RoIG9mDQo+IHBpbm5pbmcgYW5kIHdhaXRpbmcgZm9yIHRoZSBmZW5jZSBieSBpdHNl
bGYuIEhlbmNlIHNob3VsZCBiZSBzYWZlIHRvDQo+IGRyb3AgYm90aCBkbWFfYnVmX3BpbigpIGFu
ZCBkbWFfcmVzdl93YWl0X3RpbWVvdXQoKSwgcGxlYXNlIHRlc3QuDQpTdXJlLCBJJ2xsIHJldGVz
dCBhZ2FpbiBidXQgaXQgbG9va3MgbGlrZSBkbWFfYnVmX21hcF9hdHRhY2htZW50KCkgcGlucyBh
bmQNCm9yIHdhaXRzIGZvciBmZW5jZSBvbmx5IGluIHNwZWNpZmljIHNpdHVhdGlvbnMuIFRoYXQg
aXMsIGl0IHBpbnMgb25seSBpZiB0aGUgZXhwb3J0ZXINCmlzIG5vbi1keW5hbWljIGFuZCBpZiBD
T05GSUdfRE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBlbmFibGVkLiBBbmQsDQppdCB3YWl0cyBm
b3IgdGhlIGZlbmNlIG9ubHkgaWYgdGhlIGltcG9ydGVyIGlzIG5vbi1keW5hbWljLiBTaW5jZSBJ
IGhhdmUgb25seSB0ZXN0ZWQNCndpdGggYSBkeW5hbWljIGV4cG9ydGVyIChYZSBkcml2ZXIpLCBJ
IGRpZCBub3QgZW5jb3VudGVyIGFueSBpc3N1ZXMgYnV0IGl0IG1ha2VzDQpzZW5zZSB0byBhdWdt
ZW50IHRoZSBjb2RlIHRvIGFjY291bnQgZm9yIG5vbi1keW5hbWljIGV4cG9ydGVycyBhcyB3ZWxs
Lg0KDQo+IA0KPiBCVFcsIGlzIGFueSBERzIgR1BVIHN1aXRhYmxlIGZvciB0ZXN0aW5nIG9mIHRo
aXMgcGF0Y2hzZXQ/IFdpbGwgSSBiZQ0KPiBhYmxlIHRvIHRlc3QgaXQgdXNpbmcgYSByZWd1bGFy
IGNvbnN1bWVyIEE3NTAgY2FyZD8NClllcywgeW91IGNhbiB0ZXN0IHdpdGggYW55IERHMiBkR1BV
IGFzIGxvbmcgYXMgeW91IGNhbiBwYXNzdGhyb3VnaCBpdCB0byB0aGUNCkd1ZXN0IFZNLiBBbmQs
IGlmIHRoZXJlIGlzIGFuIGlHUFUgYXZhaWxhYmxlIG9uIHRoZSBIb3N0LCB5b3UgY2FuIHVzZSBH
VEsvU0RMIFVJDQpmb3IgbG9jYWwgZGlzcGxheSBvciBTcGljZSBVSSBmb3IgcmVtb3RlIGRpc3Bs
YXkgaWYgdGhlcmUgaXMgbm8gaUdQVSBvbiB0aGUgSG9zdC4NClRoaXMgaXMgZXhhY3RseSBob3cg
SSBzdGFydGVkIHRlc3RpbmcgdGhpcyBwYXRjaCBzZXJpZXMgYnV0IEkgYW0gbm93IHByZWRvbWlu
YW50bHkNCnRlc3RpbmcgdGhpcyBzZXJpZXMgd2l0aCBTUklPViBlbmFibGVkIGlHUFVzIGFuZCBk
R1BVcy4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBE
bWl0cnkNCg==
