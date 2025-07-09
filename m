Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D828AAFEC98
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7955D10E817;
	Wed,  9 Jul 2025 14:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJG/ArRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619510E813;
 Wed,  9 Jul 2025 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752072727; x=1783608727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EoeFhn/XKzlCX1K0rlG2M7fZkTYoxKQpK7jTP6FG41M=;
 b=hJG/ArRCWfgkUerekLG/KU65Gzff89Wdux6WdP6UYXBN14Yt3dOskYxz
 3qdbYcKCsle+5v4XvSPLQa5Zk/9Dg8Ksyw1Lxel7BJAagYrWKvVdixm7h
 OkDmz8x06kuSibYT7V6tiwDvkjpLrp5MMl5muxWKS/oP4tUQzPRTvBMNC
 H12ts64/duFiwIkiiLhOJKPxSjzjxO6H1HEe/gi+D9VF6ex0h7JOolLW+
 DJbxyRgw85/VCNOCco9MfVUx6uHxZxGG+TQrxbTh4YYIENH8V4/03PEpe
 rtXeTS+LqYPIkZLZZi16Tb/JoG7CMSPUD7x3pX7DcVRSN3YhKZt3VbFkZ g==;
X-CSE-ConnectionGUID: BXmeKKvvTqWQvJHxBKiw3g==
X-CSE-MsgGUID: BUcansyxQG+tb/9fUfm8Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65684704"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65684704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:52:07 -0700
X-CSE-ConnectionGUID: tXQTbVHfQLmDdCaL87+qow==
X-CSE-MsgGUID: oBIlpBx/SLifTXQ6P6n+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155204226"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:52:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 07:52:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 07:52:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 07:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKbrJEpo0hs66aUpgLgB/o1QvyqsF/Y8QTPNVI+J1C8l6vXq3oJz6e5vtQ1n/0e6PcUw/scCfBE8awU3gMH9KSmuAnQEEDn7UbotcsjFdF8v7H+yommNKvqo6pXGgSSnOe37omXyfnVQRtzfxQmnNHLk+EIE0Wx6+zc7C84ZIIfHB9LLcpJOUCxF5g3P34DT3dn/7o6azGJqDPrNFMF6vmZw8zVA9JjjoCi+VjPvL8l+T8HoRI8ijYh4rT9Qeqm58ngdUJb0HXiIV1ZDocWeiFuzj0S1kjCW0XGEoAT1xAAQa1vQI+K0I/ctW135BeN1y5xm04C5LL/jsyFIWpBpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoeFhn/XKzlCX1K0rlG2M7fZkTYoxKQpK7jTP6FG41M=;
 b=Z8mvKMNx/2JuKuauAynt1ycYezt82SWqWaVoDbSN/DCK7J8gPVMy0OfZISDc4Sof53k6R65JJ6d9Llj0hkg07V8bAhgdPOu0CwmoGUKNb8Myiiic/NYK5p8Yz57qeeCL8R8AkA+jAPmGs53vd5WuJNvaylJvCtUw6+dRQnuTNyChMRfQ94L7HdPZdVVIplmqzu9TW1GM63yCqTIp0TgYWfKSXL7SYXpmj+KJVYIMlrNnT34cCaxHyrPguPdHe/AJ/27Ij7h6SsxiH8+DhCoJXogRDRvbkCYLwKoGaQOLfm/eiATEDFrYgdKMNKYD/vbeThDXMr8GyjPvcYACWudBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 9 Jul
 2025 14:51:50 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 14:51:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v7 2/9] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v7 2/9] mei: late_bind: add late binding component driver
Thread-Index: AQHb73KHbQ6Oxt2NeUGbwN2BTHpAf7Qnya8AgAIW+IA=
Date: Wed, 9 Jul 2025 14:51:50 +0000
Message-ID: <CY5PR11MB6366CC678AE34737CDF9D625ED49A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
 <20250707191237.1782824-3-badal.nilawar@intel.com>
 <2025070810-clinic-decode-57e6@gregkh>
In-Reply-To: <2025070810-clinic-decode-57e6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 315323f5-18a4-441e-d440-08ddbef822fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enU5cXZXMTFyeHp2Z0RuRHZqc0hIYXZ3Lyt3QjFwb0J2Uk94Q0RGeGRzUkFS?=
 =?utf-8?B?SlVWYzhrUU5MMFdCM0NYaWZ6Z1ZmWHlOak1hVStBdFZpR2xGVEFvYWViYlRS?=
 =?utf-8?B?OWs3RFBEYU1sVmhFWmh5T2k2eHc2blptSXNna01xNnZyeTJhVTRKbm1ITHlR?=
 =?utf-8?B?eW43c0RJbzBQRURnZDBGOTEyVll0NkFQSXpweTJYTkowMFBtdUNCT2phOXA1?=
 =?utf-8?B?dzViclE2ZDQ4R2dVeE5ESFJTOEdsb2lNZmpEcjhTZlA2WEx4VGY3NkJSS2Jl?=
 =?utf-8?B?Q2tZUFhEbGRDdWU4aGZzQW1hQndvZkJpYlhBWjdqTE1rR1dnYmQ4ZE5ydjVO?=
 =?utf-8?B?NWQydEpoRzl5Z0NqSjdhOE1QTnd1Y0psOXh5T1Z6VzZ6TmNKZktUTWRPZTZs?=
 =?utf-8?B?UkQzVHFpZmR6WmxWUkdTTHo1SDByUCtBQ3pVK2VpNGRaaXI5RnhoWUU5bjVa?=
 =?utf-8?B?bHhrbk11Y0xzclg2aENvWVVWbzBSM1o0c0EzTk9acEx4bVZnSVR1bGg5OWdM?=
 =?utf-8?B?NlNhb2Jwa3NnaTlkbDlranZxRDZIcnI2Ymhabkd3NGFCaGJLWTF1ZWtGcUR0?=
 =?utf-8?B?a1JBKytzU2xPcloxZmR0YUIzdEVNRVpTaHVORlVMRzNCZGhMQ3hubVlLNk9y?=
 =?utf-8?B?SHV5VW90VjFwbXpVQVI4VkVRUjFDczd2Q25TOFVMdW5ualhocmtqeE9IUmlJ?=
 =?utf-8?B?MVJ6TXF5S2VYVWpvanZFSDhpM0psVFFpNWdpUlUwMFhGd0UrUFJiZVlCcG1J?=
 =?utf-8?B?TjVmVkZOa2ZmczlDbHUwYmZjQmY0TEQ3Z1V0TE5ldXpyVmlPdVVSWXg3a0d6?=
 =?utf-8?B?RENuV1JlM3ZQQmJzMlp3dEVnaGJ5R3hFNVRTeDZOa3hjWWlRcEZqd3E1TUt3?=
 =?utf-8?B?NWQ2UGw0SjEyMzdKdWEweTFGQlVWS1dmVlVicU1JMGIrWjFqRzJ4am02U28r?=
 =?utf-8?B?bG55TzdrMzdneUhzbkhpMkNZaXdTVE5VdFlTalpCd1kxMmlwT2d2ZVJJUWZ0?=
 =?utf-8?B?S1ZFdml6ZUlBZDFWN3cvQ3ZlcEFUR3F0ekZReURpTXprY2UwNC9TV0VNUTh2?=
 =?utf-8?B?OVptMzF2Y2ViNG1TaG12K2RicWZxK0JsdjAwcnprV1JpeTE3SWgxOFJCSUdo?=
 =?utf-8?B?YWxxM1lQNDdUZGJYYkdaVFQ4YXFRSzl6VEcycmtEMGZsRzhVNFNPNXJYam9J?=
 =?utf-8?B?ekswc2xDaEl1MFJtUVJvMUF4bmZGcVZGUGw5ckQ0WjRBeUdjYmpKb0EwZ3pZ?=
 =?utf-8?B?NlEzcElhZTMrZytwcDhhQUNXZU9vcFhWakJpLzk4aE1iSE5WbisyL1gxTkZo?=
 =?utf-8?B?OCswWlJVMEtjNkVrNkFwU2ZCWWtZalkwbFkyUWQ4SmFiZlpKelJZU0RVeW5O?=
 =?utf-8?B?NytJM0x2d1lYcHBRVlh4REVRMGRXU2ZGVFZJcTNuUzNsTXZtc0I0OTBpUkxy?=
 =?utf-8?B?MkM2SERINDFJT0tKN0JCTzErd0FXTkJMUG5lSG5VOW93bHM2cW5hdFpiVlVC?=
 =?utf-8?B?c3pidXBucDNaSGIxcDZEMGFTZ3BWVXVZb1pJOW5zZmZJU1ZONG44WWNFeVRM?=
 =?utf-8?B?T0pyZmZOb1BQNkhkWk8xY0xBK1FzRlRkZmczUndHTkJ0aGdvaVloZTJrUjRa?=
 =?utf-8?B?ck1OVlBHclkwdkRJRlhTdzlaKzhjNUw3NFY5Mmd2a0gvbVlCdlVaVDdXUUVD?=
 =?utf-8?B?VVVNcnZQNGZDYldCR2piVTdkbjJ3L0pEalk0UHZhcmMzekFBYUhUZVRzT0hr?=
 =?utf-8?B?RzBYbHZ2TGRFbm5OR1RzTW1hbGpUZzNlcndXVmpqbWdXOVdrQkhVeTNOV1Nq?=
 =?utf-8?B?K2VFcUxWdlV6dnJJb0tJanlhR1NiVmZ0RjhDaXg1bjhBZ25tbmRWbzE5ZGRT?=
 =?utf-8?B?UVE1NGZHa1lOcFVqblpJR3B4Mk1ITDE0RjNLc28xRW9UY1QxRmp6bGhIdXdG?=
 =?utf-8?B?QUxmTzY5eGlJVWdhNE5jbURwcERWeW5ETEQ2TzhidEFSUENOTlVpUDg1RVM0?=
 =?utf-8?Q?1lGxN/g9F32dxWc5ZMpPkLNgFAyFnU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEcwMmdJa3pGdTYvUGE0OU5FaDhVWnhMaUQzVHN2Y2VzbzliaitiTExXTkZo?=
 =?utf-8?B?V0xUMjVQQmFHU3d0S0Yxallod0crQlVnTmhHcEVZZXRDb0hFTnFNNHo2dXVl?=
 =?utf-8?B?TllqWFAvLzJJWUlGaC9FSjR1QVJRblJSR2pqUHRzL0NNbkFBUm5nVHhSRytm?=
 =?utf-8?B?UWtURE5lSVloRjRtb1dad01yNDR6YVZ1TG0xK3dYT09kSk1COEZ4aWFOamh3?=
 =?utf-8?B?WHFhSjlqem00V0FEVm53S2tmWUE1WG5XRDBUek5nb3dTaFJvUWhYU0RnNFZk?=
 =?utf-8?B?TVdQQVJRVk40UnB6Z1RlVTZwNHR0OEkrOTU5WW5Zb05lQVp5c3lQUnFyRFhT?=
 =?utf-8?B?Sjg0aEdPSS9nL2xYeENDbmpWR2hSY0dxbDhDSVE0SGt5WlZXdWRKQktoSHlS?=
 =?utf-8?B?ZjNIY3ZQSXZqUk9lRXk1Q3NITngwVTFNUEQ4WnZ1eHcwWTY5QXdXcyt4eWIy?=
 =?utf-8?B?OGNtTW92ckRrZ3RWeEpYdWpSL09RYVZWalpUQnFzVW10Y3lrcEpJaDBaUjhV?=
 =?utf-8?B?bkMrVVZHSGtxWXN1Y21wWSt6bDlEdW5HQktwVjFnemhvZXJ4NUl6aGpNQ3o0?=
 =?utf-8?B?bG1NQVh6YThldTFmcVBtWG9udVQvUDZtSEtVMzZEbGY5OUpRN09LQ0Y1b0FB?=
 =?utf-8?B?ek5IamFxcFJheWtoUllseTFLVk0rQXNYcE9ZeXVYN0IzV3UxSTRXcW50WTZ5?=
 =?utf-8?B?RWU5OCtscjI5ci9zdnJtRlFlcjh5WWg2OHR3SGFFMm8vK2kyVEZjZisvRzJz?=
 =?utf-8?B?Q3BLRFExRzh0a0ZaVUxBOGFudG5HYnZyWE43QjFuaDNpdHNaT2pmekU3MHEy?=
 =?utf-8?B?a3RUbVpPamtLeFViRm4zcnhHdG5yMnRSV29mdldvbWI4TjNhZThJcTlvbG41?=
 =?utf-8?B?VURmaC9MM21PTkJPN1MwTGp6ZUNqc2diemNWQlpLdG9GK0lSTUVodzUraXB3?=
 =?utf-8?B?RERSV3hacWhlRTRoeWQ4dlQ2eDE3dTdrczZub2pjdy9LT1UxbzZZcytYcDhP?=
 =?utf-8?B?TVFoNnF3b1YxdDRONjVNQTY3eFZRMllSc01rSCtxZXNCbTR2dXNVVU5RMFdV?=
 =?utf-8?B?Z3pReldiMld1SjltV0hwYTFCYitLL1hCZm5EVUdBeUdpZjg5Tit5cEc4aVZt?=
 =?utf-8?B?RHdmVk83MUYwbStIcUxNSWg3ajFiK0tVWmZFYUliK0xiY2RYZDAvZnFTRUxa?=
 =?utf-8?B?ekl6MVZZVVBHZFdmNFpHbzlMVVNoSDNVSVJmM1BrRTJwUGtjUVZSTWp5YWtj?=
 =?utf-8?B?cVA2cWcrR2lHbiszeW1IRE5wQUR6eEtDTWhGRC9ZV0l3bk1kRmk0TXdsaVlE?=
 =?utf-8?B?Yk5iZ2cvay9pTXZZUGZmdXY2U1o2WjAvZWM5UFczcGZvVkljNE5WcW9qUUcr?=
 =?utf-8?B?Z2tVSjNYMGxvUzV6NEJObWlnSHVLWTVFVTFpemJUdXdYNGZENmlSN3k4V04w?=
 =?utf-8?B?cnhKQ2tsb21raG9CQnhwMndiK1NyL3pPTFlJZFZBejgwZC8vcmZsUk5TdXdp?=
 =?utf-8?B?NmVEbVlnZml6eUNqWW11UDQvZDJkbG9ENm0vRjN2aEQzK3VjVllPdVVzckc1?=
 =?utf-8?B?QWlrNCtzaUFucURwTlIrT3F6RmtyT3ZTQS8rVmd3SUVwanArd0FLZk8vdGRX?=
 =?utf-8?B?QmtuQ2NEZXBkc1g1VEl2NGJGeFpWdmlpVmJtVkpTTnp2L1ptVEdpRDB1cGpq?=
 =?utf-8?B?c1Rnci95aVhJaXlRYk9zZ3BUYjNKN3A3Y1dSY2xjQ2dJY1VOcFMycFBlck5G?=
 =?utf-8?B?Qlo2U3RHdUdPVjVEUTVsdnN6M3Izcm5NMXRZNU9TNVZKYy9GS08yWldkTjNa?=
 =?utf-8?B?Um9PNUIwSzFLZGJ0b1d2REtFTXZCY0VmejMyL2YzcE9XSEY3LzFyM3djK1Yv?=
 =?utf-8?B?b3hXMXBLWUdubmorTWJ5K0FSSklka2o3M1R1U05nN3hCR1VhYm03QVFUc3d1?=
 =?utf-8?B?MkJ4OER5QkJ2dVc0cVJsb29KczdMdHNhdjd4SWtXaDJFS0JOQ2cwRlQxdU5E?=
 =?utf-8?B?WjhLaUIrWGFsZG03cmh5NFZKbCtwR2VNbVcxeVFUUFhBWElGT1dxNHhzRzJO?=
 =?utf-8?B?TXJoZnNTT1gybks0amZNV29kM3JlN09qN0V4Tk5Xdk9xdDNVWVZRMFgvU1Zs?=
 =?utf-8?Q?yJAqS2aD5JuIeCJYKJfzD9Ti/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315323f5-18a4-441e-d440-08ddbef822fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 14:51:50.4161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qKZGgUgpFqNktJZH9CsoN3PwHdOiFhUJ7wlgd+D7IGES29TSK6cp59I0/CIo1sFXfoaLNf50Jh2tcPrOUHGqvysecosdAMovp/zV+3DnTKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDIvOV0gbWVpOiBsYXRlX2JpbmQ6IGFkZCBsYXRlIGJp
bmRpbmcgY29tcG9uZW50IGRyaXZlcg0KPiANCj4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMTI6
NDI6MzBBTSArMDUzMCwgQmFkYWwgTmlsYXdhciB3cm90ZToNCj4gPiBGcm9tOiBBbGV4YW5kZXIg
VXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiA+DQo+ID4gQWRkIGxhdGUg
YmluZGluZyBjb21wb25lbnQgZHJpdmVyLg0KPiANCj4gVGhhdCBzYXlzIHdoYXQgdGhpcyBkb2Vz
LCBidXQgbm90IHdoeSwgb3IgZXZlbiB3aGF0ICJsYXRlIGJpbmRpbmciDQo+IG1lYW5zLg0KPiAN
CldpbGwgcmVwaHJhc2UgYW5kIGFkZCBleHBsYW5hdGlvbnMuDQoNCj4gPiBJdCBhbGxvd3MgcHVz
aGluZyB0aGUgbGF0ZSBiaW5kaW5nIGNvbmZpZ3VyYXRpb24gZnJvbSwgZm9yIGV4YW1wbGUsDQo+
ID4gdGhlIFhlIGdyYXBoaWNzIGRyaXZlciB0byB0aGUgSW50ZWwgZGlzY3JldGUgZ3JhcGhpY3Mg
Y2FyZCdzIENTRSBkZXZpY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5
c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJh
ZGFsIE5pbGF3YXIgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBB
bnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL21pc2MvbWVpL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDExICsNCj4gPiAg
ZHJpdmVycy9taXNjL21laS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4g
IGRyaXZlcnMvbWlzYy9tZWkvbWVpX2xhdGVfYmluZC5jICAgICAgICAgICAgfCAyNzEgKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9kcm0vaW50ZWwvaTkxNV9jb21wb25lbnQuaCAg
ICAgICAgICB8ICAgMSArDQo+ID4gIGluY2x1ZGUvZHJtL2ludGVsL2xhdGVfYmluZF9tZWlfaW50
ZXJmYWNlLmggfCAgNjIgKysrKysNCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAzNDYgaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21laS9tZWlfbGF0ZV9i
aW5kLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2ludGVsL2xhdGVfYmlu
ZF9tZWlfaW50ZXJmYWNlLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWVp
L0tjb25maWcgYi9kcml2ZXJzL21pc2MvbWVpL0tjb25maWcNCj4gPiBpbmRleCA3NTc1ZmVlOTZj
YzYuLjM2NTY5NjA0MDM4YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL0tjb25m
aWcNCj4gPiArKysgYi9kcml2ZXJzL21pc2MvbWVpL0tjb25maWcNCj4gPiBAQCAtODEsNiArODEs
MTcgQEAgY29uZmlnIElOVEVMX01FSV9WU0MNCj4gPiAgCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28g
YmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlDQo+ID4gIAkgIHdpbGwgYmUg
Y2FsbGVkIG1laS12c2MuDQo+ID4NCj4gPiArY29uZmlnIElOVEVMX01FSV9MQVRFX0JJTkQNCj4g
PiArCXRyaXN0YXRlICJJbnRlbCBsYXRlIGJpbmRpbmcgc3VwcG9ydCBvbiBNRSBJbnRlcmZhY2Ui
DQo+ID4gKwlkZXBlbmRzIG9uIElOVEVMX01FSV9NRQ0KPiA+ICsJZGVwZW5kcyBvbiBEUk1fWEUN
Cj4gPiArCWhlbHANCj4gPiArCSAgTUVJIFN1cHBvcnQgZm9yIExhdGUgQmluZGluZyBmb3IgSW50
ZWwgZ3JhcGhpY3MgY2FyZC4NCj4gPiArDQo+ID4gKwkgIEVuYWJsZXMgdGhlIE1FIEZXIGludGVy
ZmFjZXMgZm9yIExhdGUgQmluZGluZyBmZWF0dXJlLA0KPiA+ICsJICBhbGxvd2luZyBsb2FkaW5n
IG9mIGZpcm13YXJlIGZvciB0aGUgZGV2aWNlcyBsaWtlIEZhbg0KPiA+ICsJICBDb250cm9sbGVy
IGJ5IEludGVsIFhlIGRyaXZlci4NCj4gDQo+IFdoZXJlIGlzICJMYXRlIEJpbmRpbmcgZmVhdHVy
ZSIgZG9jdW1lbnRlZCBzbyB3ZSBrbm93IHdoYXQgdGhhdCBpcz8gIFdoeQ0KV2lsbCBwdXNoIHBh
cnQgb2YgY292ZXIgbGV0dGVyIGhlcmUgZm9yIGJldHRlciBleHBsYW5hdGlvbnMNCg0KPiB3b3Vs
ZG4ndCBpdCBqdXN0IGFsd2F5cyBiZSBlbmFibGVkIGFuZCB3aHkgbXVzdCBpdCBiZSBhIGNvbmZp
ZyBvcHRpb24/DQpUaGlzIHdpbGwgYWRkIHRoZSBtb2R1bGUgd2l0aCBhIGRyaXZlciBvbiBNU0kg
YnVzIHRvIHRoZSBzeXN0ZW0uDQpJIHN1cHBvc2Ugc29tZSBwZW9wbGUgd2FudCB0byBoYXZlIG1p
bmltYWwgY29uZmlnLg0KDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRl
L2RybS9pbnRlbC9sYXRlX2JpbmRfbWVpX2ludGVyZmFjZS5oDQo+ID4gQEAgLTAsMCArMSw2MiBA
QA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8qDQo+ID4g
KyAqIENvcHlyaWdodCAoYykgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICsgKi8NCj4gPiAr
DQo+ID4gKyNpZm5kZWYgX0xBVEVfQklORF9NRUlfSU5URVJGQUNFX0hfDQo+ID4gKyNkZWZpbmUg
X0xBVEVfQklORF9NRUlfSU5URVJGQUNFX0hfDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4NCj4gPiArDQo+ID4gK3N0cnVjdCBkZXZpY2U7DQo+ID4gK3N0cnVjdCBtb2R1bGU7
DQo+IA0KPiBOb3QgbmVlZGVkLg0KV2lsbCBkcm9wLCB0aHgNCg0KPiANCj4gPiArDQo+ID4gKy8q
Kg0KPiA+ICsgKiBMYXRlIEJpbmRpbmcgZmxhZ3MNCj4gPiArICogUGVyc2lzdGVudCBhY3Jvc3Mg
d2FybSByZXNldA0KPiANCj4gcGVyc2lzdGVudCB3aGVyZT8NClBlcnNpc3RlbnQgaW4gZmlybXdh
cmUgc3RvcmFnZSwgd2lsbCByZXBocmFzZQ0KDQo+IA0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBD
U0NfTEFURV9CSU5ESU5HX0ZMQUdTX0lTX1BFUlNJU1RFTlQJQklUKDApDQo+ID4gKw0KPiA+ICsv
KioNCj4gPiArICogeGVfbGF0ZV9iaW5kX2Z3X3R5cGUgLSBlbnVtIHRvIGRldGVybWluZSBsYXRl
IGJpbmRpbmcgZncgdHlwZQ0KPiA+ICsgKi8NCj4gPiArZW51bSBsYXRlX2JpbmRfdHlwZSB7DQo+
ID4gKwlDU0NfTEFURV9CSU5ESU5HX1RZUEVfRkFOX0NPTlRST0wgPSAxLA0KPiA+ICt9Ow0KPiAN
Cj4gc2hvdWxkbid0IHlvdSBoYXZlIG1laV8gYXMgYSBwcmVmaXggZm9yIHRoZSBlbnVtIHR5cGUg
YW5kIHRoZSB2YWx1ZXM/DQo+IA0KVGhpcyBpcyBhIGJyaWRnZSBiZXR3ZWVuIG1laSBhbmQgZ3Jh
cGhpY3MgZHJpdmVycywgc28gbWVpIGlzIG5vdCBhIHJpZ2h0IHByZWZpeC4NCkknbGwgbG9vayBm
b3IgYmV0dGVyIHByZWZpeCBoZXJlLg0KDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogTGF0ZSBC
aW5kaW5nIHBheWxvYWQgc3RhdHVzDQo+ID4gKyAqLw0KPiA+ICtlbnVtIGNzY19sYXRlX2JpbmRp
bmdfc3RhdHVzIHsNCj4gDQo+IFNhbWUgaGVyZSwgd2hhdCBpcyAiQ1NDIj8NCj4gDQo+ID4gKwlD
U0NfTEFURV9CSU5ESU5HX1NUQVRVU19TVUNDRVNTICAgICAgICAgICA9IDAsDQo+ID4gKwlDU0Nf
TEFURV9CSU5ESU5HX1NUQVRVU180SURfTUlTTUFUQ0ggICAgICA9IDEsDQo+ID4gKwlDU0NfTEFU
RV9CSU5ESU5HX1NUQVRVU19BUkJfRkFJTFVSRSAgICAgICA9IDIsDQo+ID4gKwlDU0NfTEFURV9C
SU5ESU5HX1NUQVRVU19HRU5FUkFMX0VSUk9SICAgICA9IDMsDQo+ID4gKwlDU0NfTEFURV9CSU5E
SU5HX1NUQVRVU19JTlZBTElEX1BBUkFNUyAgICA9IDQsDQo+ID4gKwlDU0NfTEFURV9CSU5ESU5H
X1NUQVRVU19JTlZBTElEX1NJR05BVFVSRSA9IDUsDQo+ID4gKwlDU0NfTEFURV9CSU5ESU5HX1NU
QVRVU19JTlZBTElEX1BBWUxPQUQgICA9IDYsDQo+ID4gKwlDU0NfTEFURV9CSU5ESU5HX1NUQVRV
U19USU1FT1VUICAgICAgICAgICA9IDcsDQo+ID4gK307DQo+IA0KPiBUaGlzIGVudW0gdHlwZSBp
cyBuZXZlciB1c2VkLg0KPiANCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgbGF0ZV9i
aW5kX2NvbXBvbmVudF9vcHMgLSBvcHMgZm9yIExhdGUgQmluZGluZyBzZXJ2aWNlcy4NCj4gPiAr
ICogQG93bmVyOiBNb2R1bGUgcHJvdmlkaW5nIHRoZSBvcHMNCj4gPiArICogQHB1c2hfY29uZmln
OiBTZW5kcyBhIGNvbmZpZyB0byBGVy4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBsYXRlX2JpbmRf
Y29tcG9uZW50X29wcyB7DQo+ID4gKwkvKioNCj4gPiArCSAqIEBwdXNoX2NvbmZpZzogU2VuZHMg
YSBjb25maWcgdG8gRlcuDQo+IA0KPiBXaGF0IGlzICJGVyI/DQo+IA0KPiA+ICsJICogQGRldjog
ZGV2aWNlIHN0cnVjdCBjb3JyZXNwb25kaW5nIHRvIHRoZSBtZWkgZGV2aWNlDQo+IA0KPiBXaHkg
bm90IHBhc3MgaW4gdGhlIG1laSBkZXZpY2Ugc3RydWN0dXJlLCBub3QgYSAnc3RydWN0IGRldmlj
ZScgc28gdGhhdA0KPiB3ZSBrbm93IHRoaXMgaXMgY29ycmVjdD8NCkNvbXBvbmVudCBjb25zdW1l
ciBvbmx5IGtub3dzIHRoaXMgZGV2aWNlLg0KSXQgaGFzIG5vIGtub3dsZWRnZSBhYm91dCBtZWkg
aW50ZXJuYWwgZGV2aWNlLg0KDQo+IA0KPiA+ICsJICogQHR5cGU6IHBheWxvYWQgdHlwZQ0KPiA+
ICsJICogQGZsYWdzOiBwYXlsb2FkIGZsYWdzDQo+ID4gKwkgKiBAcGF5bG9hZDogcGF5bG9hZCBi
dWZmZXINCj4gDQo+IFdoZXJlIGFyZSB0aGVzZSBkZWZpbmVkPyAgV2h5IGFyZSB0aGV5IG5vdCBl
bnVtcz8NCkl0IGlzIGJpdG1hcCwgd2lsbCBhZGQgdGhpcyBpbmZvcm1hdGlvbi4NClRoZSBsb25l
IGF2YWlsYWJsZSBiaXQgaXMgZGVmaW5lZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoaXMgZmlsZQ0K
PiANCj4gPiArCSAqIEBwYXlsb2FkX3NpemU6IHBheWxvYWQgYnVmZmVyIHNpemUNCj4gDQo+IFNp
emUgaW4gd2hhdD8NCkluIGJ5dGVzLCB3aWxsIHNwZWNpZnkNCg0KPiANCj4gPiArCSAqDQo+ID4g
KwkgKiBSZXR1cm46IDAgc3VjY2VzcywgbmVnYXRpdmUgZXJybm8gdmFsdWUgb24gdHJhbnNwb3J0
IGZhaWx1cmUsDQo+ID4gKwkgKiAgICAgICAgIHBvc2l0aXZlIHN0YXR1cyByZXR1cm5lZCBieSBG
Vw0KPiA+ICsJICovDQo+ID4gKwlpbnQgKCpwdXNoX2NvbmZpZykoc3RydWN0IGRldmljZSAqZGV2
LCB1MzIgdHlwZSwgdTMyIGZsYWdzLA0KPiA+ICsJCQkgICBjb25zdCB2b2lkICpwYXlsb2FkLCBz
aXplX3QgcGF5bG9hZF9zaXplKTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNlbmRpZiAvKiBfTEFU
RV9CSU5EX01FSV9JTlRFUkZBQ0VfSF8gKi8NCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
