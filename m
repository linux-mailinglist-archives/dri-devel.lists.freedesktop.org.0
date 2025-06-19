Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86296AE0128
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 11:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8210E9F5;
	Thu, 19 Jun 2025 09:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvgJ/DcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2321E10E9EE;
 Thu, 19 Jun 2025 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750324022; x=1781860022;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=BmF4uUn72/o6/hUR3ezg3xxMk+F8ZGv/xFggzTFr2jE=;
 b=MvgJ/DcIOx8YIhsLGvZlBw30E3I24FEwKA+hKTIivK+aw1P9bJfRIlKk
 jroOIJHlRPUFwJJX8tE7cXioSN6zUKqCjtl4wVunXCJIvkBIuBJxYjhm7
 BZvKFFATrWj3FevIAPvDZgPhgXMeEAY306XicaNgcYGqvq4LIQn0U7H2d
 fKj2VUdYKS8R3WoYFoAfX3BXLzpSJtuUIzMCt9a+nnWROtwz8nzAFA4k0
 7VzdfE9CyjoB/xB+z/Hs0pJladYsIT5iTbHSYvMvIZv8FQeY+2mVUomZN
 kVVqREglP9Fu9lJ/FGaiu0MhXhKdl6+JgM1evfMpIgRMGlVCFMdHeKShB w==;
X-CSE-ConnectionGUID: as1l1Re7TviMnuLqQmb/pg==
X-CSE-MsgGUID: 9NzTLhbBQfK+sUUcwf4hFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52722338"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208,217";a="52722338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:07:02 -0700
X-CSE-ConnectionGUID: Q42mDV/NSj6S55CsEoemtg==
X-CSE-MsgGUID: ESOOonnlQZGKbRmlWxd2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
 d="scan'208,217";a="150895918"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:07:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 02:07:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 02:07:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 02:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGh0xoeFWBg5KAQPIgLUHGgfJogjIxyRqOrNG7T6HvaODn36ewEoE8r9PTRS3EyGRMbEJLHmVh4WUQlTL8pD7ZF5zNRyvNjKsUDCI9rOQ394V5zhAlM7tr/1qRx5Y+F1hIXKLGq4saPJa5gH92IATyGmG+VSFKiOzEiNDJ33Gnvz9MvMyJLX+7pUJ4LON0me5PZquUefc8SdDXhHXDeElgz7iBRWbdHJy+wzhH+18sGc6xCAR0PEM5jx2Xa5He0IbNAfq7I2AohsIn9AHLehUfdp5IK8rTjmJgoZUiKPeAibv2R2N4esp3Cd0n1mX7mWEbBdFB6U8ZV7GakSa8I8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd79RdQ3XlguuWV5UosBYXv+gZk5NojFfw7GJ5mNjiw=;
 b=pBquZ4nI+I8/ObumIAkgj22D5bawrfWpMHMtfjyb16hgJNpCtBSgPSikt8JMnGolo7wihytmXBloL2b9p+io+9xA2fxfgXLZK10fdP0t6IlLQqKgWmyodDdf3PA6bOcPIRlnpwo6SN1D3Wvm/J2kZcFgM1QSL3gOKkv2EE3EF8EY/8gT4oHJnQWh5Z6Vk61cN/auiAowvBNF2CbLJOIs9yeMcQi+kwqapnF8iJ7tbdXVhkJ4Pv3p4miBoL/zfdcYaz+6i+sfE3Fr3zNFmOAfWHfJ0O6BsI2a4Rd1qwgmuGOiLRA0WHRuqa8WGkw4TQpJmBAQ5f3LRaieqqfpppW09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPF4B1ECA5EA.namprd11.prod.outlook.com (2603:10b6:f:fc02::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 09:06:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.022; Thu, 19 Jun 2025
 09:06:28 +0000
Content-Type: multipart/alternative;
 boundary="------------WXkGpym6lvvplNfdIXPOh90P"
Message-ID: <e1fb4550-b53d-4288-b70d-2320e64056ee@intel.com>
Date: Thu, 19 Jun 2025 14:36:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] mei: late_bind: add late binding component driver
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-3-badal.nilawar@intel.com>
 <CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPF4B1ECA5EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a05e81-cea3-4a3f-1c70-08ddaf109378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzdlUEdHZmxYWlJiNDFiMTlqNk5SRkI2Rnl0Si96UThSa1hJTzVCbFlLa1Er?=
 =?utf-8?B?UTQwL1lyZkZ0TnIwWnA0UGRBVHZlTWhtL1pTQ2xPSjNaMlJEcFlXSjY5RHI3?=
 =?utf-8?B?RS9TdmdkYWxJU1NEOGFVZWxiR25FNWhTZU1qTTNyWW5jNWJSZmRVYjJZc3FC?=
 =?utf-8?B?N1dUbklCM2RENS9UU0tSR3ZBVFJPa2ZSWnYrK2twN0gzcGN1TFYrdjM3V1Zr?=
 =?utf-8?B?S2RpVlltcU1ZRGVlbURSalJXMFBjVVljMlNMRUdsMVdrd2FXL2l5T2doQXVy?=
 =?utf-8?B?RDZTR2VvbHlEYzJRdWZoZVZ5cnVFcDVzL0d6SXRZYTJueDZmZnhEK1VZOHU0?=
 =?utf-8?B?M1BTNFlHdVh3UTVPNlhyZ0g0ZzdiMm9OdGZ4a3VselJ5eDczVmh5ckYzZmN0?=
 =?utf-8?B?Q2luazdMaldqMjcwRXR5NmpQKzVKRlZNTE5oS0t5aVI4aGppci9mOTRtWTM0?=
 =?utf-8?B?bEFucy9vNWpZbVAvemtLVXpETnFGRklvOU1tUGJ3amlWbEp1TGVkeUJNVTl2?=
 =?utf-8?B?bnlhMERMRFg3TVM5SFhyMXh2djdlNGJOQ1kvclErQm1jeTZ1OFczbzkxUFNr?=
 =?utf-8?B?YXpVYmgzb1FQRG9XQ3ZsV1dIYzJ5UDFpNVhmNjZ1Wm1Da3FxaVJxWXhJZlBy?=
 =?utf-8?B?WmJOSUdGQzErNllkWlE1RFJDYzV4YVVVaWZ6NGtOcFRyK1o1eWwraVhEb0hJ?=
 =?utf-8?B?SmNZOTE4eG9PQm9CelJGUnA1UEJ0aTkzUUZFT0s2S0E0NlhVZFRxejdna2Vl?=
 =?utf-8?B?QnZwcWsxWk5TZnArUkpiV1JPME9IVUJmcDNSUUdsRktoa3VPKzdnQld6SkM5?=
 =?utf-8?B?dUczSDlUcEJJYTY5cEJheGxlMEhubmRHUlhHMTArK2xjSzI3NFkySVpVMmJy?=
 =?utf-8?B?YW4rcjEvcFduUHFjNkYwdHFod3pLalFCM3ptSkp5d0pVcERNR0FSR1JEYnUx?=
 =?utf-8?B?OUpxYkhPSEpMNnVrV1ZlSDFacHZVclhFQ3I2YTNRUjd4Y040NU1kSnYvQjdB?=
 =?utf-8?B?UnVxZyt6aVBlZ3I5SlQrUzFjMUYzOXhLQXU4QVZSK0lXMTk5RDdWay9DeXN1?=
 =?utf-8?B?UEtsRUxSYnNhNlB3ZUgreWhnNXhMdnFyT0M3Z0hQMmFzN3NSYk5CK09QMmY2?=
 =?utf-8?B?NkgwVzRCV0hRSE93Ujg1STN3cFl2ZlA0dTJTOG5HN2FEc2o2OUV3KzMyOGM4?=
 =?utf-8?B?T3RFNFBlMG4xZ2krVVVkL3kwY1RoVE5ZdWV1VGxGNGR5bVhXMG9RUkFhaEo2?=
 =?utf-8?B?L25SMDNDMm9WcGIwenF3aGJBSVJWRVltc2NYdjlEVjFjd3RveGNzYVlOTTVs?=
 =?utf-8?B?dTBHcllYaUgxWGd0TmdzREo3elowdnlvZDgrRjhCeGs5UTNhaTRILzFHMGFz?=
 =?utf-8?B?OWhHZk5uYndCYnYzYmJBSEZ3L0dwQ1JUbW13cXZLeXBOZlBHWkNCK2tUUC9W?=
 =?utf-8?B?ckFvclprWmpkRmxMc1NIdkFhZTc5a2FTQkU3clhGTWV0SHRrM3dIVkFjUFB2?=
 =?utf-8?B?WGRFazdKK2psQjFtODkybVI1eDlLKzY2cGppL0MvMGw3Z1lYUnBKbzZ0S1hi?=
 =?utf-8?B?QkhURjNLMkJldms0U0JjTDZ1UVNOM3VsbENhckY1QkdhbnpnaWxJZU1DK3hy?=
 =?utf-8?B?Rjd1c2FjbmZWOS8zendtdGNmSEFoaEJuUnZZbUtyTENiak9VVzI5TFV3cy9S?=
 =?utf-8?B?K3phMjdOVEN3R3F5SUptYlFHNzlpZ0YxbENKNmI3Q2wyNCsvMmFzcElpVWdn?=
 =?utf-8?B?MVcrYTNXalRNaHZPYVBVWGdUWGVOcDFocEh1KzdCeHdwUTFPSzI4UlRnNEp3?=
 =?utf-8?B?Rnh3MjZLY0J5Nnc3ekMvRHhwaUhwc21iQlpzS2ZNeWtZZjVqWDI4cjNVV0tT?=
 =?utf-8?B?OHJmM25JdCtTcldWelZHOUt0SUIvOS9SNk5HQXUvbzZhcHJkb2U2SUtvVWVn?=
 =?utf-8?B?NkpqQkJ2VmZLUjgvZWhIUWc3V1NlUDFmaFBRQ0xXeUp5czVHdW53b3FwVnUy?=
 =?utf-8?B?RXBGYWZVZzNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um41VjN6Q2N4b1gzYzlUb2grVzFmckU2L01ybVhRUGl3TnJSM0FROEE1YmY1?=
 =?utf-8?B?QmlHOStKUk5GcTk3TWtQUTdQbkI1VlJVYm9MV004R0s1dDNiQTR4NGw5QmVY?=
 =?utf-8?B?VXoxcTVJRytvdzA2UWJsL2dBR1l1ejQyQXFRUXNGaTduRFBVK1FZcGU1bnNt?=
 =?utf-8?B?aHJtRnc0eEZaNFB2Z0tSMk5SSjBtT3RMTk5kTDNXdzZkRkJEK1A4cXorblhm?=
 =?utf-8?B?ei95blBrV2twaDk4bDBZRm00and4cUFST0lRaG9HY2pQOVQ2bVF3K0Jjek1i?=
 =?utf-8?B?dWFQZ2dZTnliV2E1ZGhjNzgvTTBQZ1V5Z0xVQ2pMSDhIaWpuZzJLd0ZLTThU?=
 =?utf-8?B?MkIwc3ZQNk5jOEcyUUw4SndIa21kQmhITjNNSEYydm9Wb2s3QndoY21aOUR2?=
 =?utf-8?B?OG9TYzErVVJKSkxDaDI5R2RqN3pXSTJIRGg4TlB5MlRWNWFzR0pTQXNWbUt5?=
 =?utf-8?B?SDFibWV5MytPMGRYUGpzbGswWUJJd3hGRmdCRHNwdVdvWGFYOFlPMHhNMDFo?=
 =?utf-8?B?UEcvTUVLejBNekJIdFAva3ppOHhpMWxTRzVBRXBYajhLbXNONzUwV3RybTlP?=
 =?utf-8?B?Rnp2c0ZDT0ZKMzY4TGM5ZHhrQjRvYmV1Ukh3ams2ZlJFck0xek81S1g2YlE4?=
 =?utf-8?B?THYwSGZtNzNRbG5qNDd6a2lXSm43SEprd0hOayszSlNhSmxOVzdKa2JvVmEx?=
 =?utf-8?B?eVV1eWdGZDFqOFovREFqTGlNKzNUTklBY1hneURDRmVHeStKS2x1eVg2dkhp?=
 =?utf-8?B?cWQ3SkNEMS9VVEVkK0VMWE5SS1YvSnFIMkZCQnpLWkNWRUN3YitvZS9Xd3N5?=
 =?utf-8?B?N3I2V0xhM3cyZUc4STNvUHlmdHpLRTlVL3Z3K3RNUFRhL2dZUnFDbUxpSzNS?=
 =?utf-8?B?eEQ5eHN4cE11L3ZadlROMm5IYzhENTczUlVOYmZtTjdtd3ZnOVFGd3NlU0k0?=
 =?utf-8?B?Zk4vQjZ1U1N6b3QzWjZOWXRmMTUrNjJWYmNlYWwyOG9ESDFjRW1wNEptbkhT?=
 =?utf-8?B?ckpTckJ5Qy9PTkZNOEJnUjFpdkh3Y1VGTzBvWjZtQ2d0Ti96d2JaS2tKaTRy?=
 =?utf-8?B?YkorcGpoOFRVN1lwdmlXbm1EbmszbzZEdDM5ZGJuN2d5RGJQT3ZuM0trUG85?=
 =?utf-8?B?b1dFaFJVam93RGUxNjJrWlVnbXJDQ0xkOWVpd1RZaENYeDN4cHIxNmtCM0Qz?=
 =?utf-8?B?YUJhWGJCZFh4SDVWMUNtSU1jQzlGNHVlS0pJeHE3T0VLTWZOOG11bytOSGNm?=
 =?utf-8?B?ai9jS25XV1pVNWNIY0VkNWtxRjRteFVhOXFZRXMyQ2EwS04zb0ovd3Y0bDVW?=
 =?utf-8?B?ZjhnM0VDUUtocGRoVzcxZ0JNWm9oWHEwSkRxeXJIVStscVpZcGo4T201R284?=
 =?utf-8?B?RWJDVnJyenhwSE9rdk1HQkN0S0pjWjNQbE1taXdYVW1neGhveVZ0TW1Bbmo2?=
 =?utf-8?B?UkNWUGk1UVBxK2NwdDhTL0F6aGxpK0t3NzZoOFkyVEJpVmxkQ2tXZkJVRG1U?=
 =?utf-8?B?YStjS1NUVnMvaTVLL2pDNm9JalBzazkxMWcyOUJudTJneXlTci9pS0RyTk5z?=
 =?utf-8?B?U21rQ3kyQUdRUE1vajFGMG1CQVZkTGF0Qm45WnkwcXhLY0svdytuTWVTbTMx?=
 =?utf-8?B?bFdNOEkzazVxSkpwUHJ0dEJuOVppUmlEcEhqVDJtYzBiRWhkeEh5ckZYRmJl?=
 =?utf-8?B?d0c4VXlna0k3R1AreDdHcUY4TCsxT3FLcTh0ZjRTaDBaV1RhR1luVktxdkpR?=
 =?utf-8?B?Zmd5YU4weGM4Y2lLY3B6RDdkZ2k2bUN5UUlVaG9qajZtbU95TGFuZzAxbXdu?=
 =?utf-8?B?VHBNdG0xVm05c2V6dUdRK1ZYWFNwaXdTeDBCbmFMa2Vtb29wcitoQWxyUkRr?=
 =?utf-8?B?bnZmbXlXSEVTdXJldVNVb0pnamhSMG4xa1lNeTFwWStaU1FVeGJ0ekFsNis0?=
 =?utf-8?B?S3g0d3FQclFKNVVoRmpmdThYbFgrSEFuRHg2aGhYc2pJaGZ1K3MvbUMyN3pB?=
 =?utf-8?B?ZW8rTmpDQWNGY0ZQNkRMTmV4Ylc3b01lUEVBUlR0QVNNRU40elVFRmZhMU9Q?=
 =?utf-8?B?QXFDbkxVZG9XZEd2YnVwNGx2dllSelVYcEpiTVZhZlR2M3FOTjZnMlFzemlX?=
 =?utf-8?B?YjdSaG0veGdmaEVtcjFySzBRLzZRTXh6Um9uZ1lhT0c4TkpYUXRZcWVJSVpn?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a05e81-cea3-4a3f-1c70-08ddaf109378
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 09:06:28.8794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IefJJ4saSGyVavo2LkR1n/p8fYDT/PW1Q3R/5i9LXzNqmWKDjIooY5FitQIduFWfcs+J5o9YlUMM4r1sFyRSfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4B1ECA5EA
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

--------------WXkGpym6lvvplNfdIXPOh90P
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 19-06-2025 13:02, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Nilawar, Badal<badal.nilawar@intel.com>
>> Sent: Thursday, June 19, 2025 12:30 AM
>> To:intel-xe@lists.freedesktop.org;dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org
>> Cc: Gupta, Anshuman<anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Usyskin, Alexander<alexander.usyskin@intel.com>;
>> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
>> <daniele.ceraolospurio@intel.com>;jgg@nvidia.com
>> Subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver
>>
>> From: Alexander Usyskin<alexander.usyskin@intel.com>
>>
>> Add late binding component driver.
>> It allows pushing the late binding configuration from, for example, the Xe graphics
>> driver to the Intel discrete graphics card's CSE device.
>>
>> Signed-off-by: Alexander Usyskin<alexander.usyskin@intel.com>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>> v2:
>>   - Use generic naming (Jani)
> This patch still wrong naming I915_COMPONENT_LATE_BIND.
> LATE_BIND will never be supported by i915, it is a wrong prefix.
> @Nikula, Jani @Vivi, Rodrigo is it ok use the i915 naming prefix here ?
> We can use INTEL_COMPONENT_LATE_BIND here ?

Agree, if we use INTEL_ prefix here is it correct to add this file?

>
> This header include/drm/intel/i915_component.h is used by both XE and i915.
> May be a separate series later requires refactoring this header.

Agree, better handle naming of all the components while refactoring.

>
>
>>   - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
>> v3:
>>   - Updated kconfig description
>>   - Move CSC late binding specific flags/defines to late_bind_mei_interface.h
>> (Daniele)
>> v4:
>>   - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards
>> (Anshuman)
>> ---
>>   drivers/misc/mei/Kconfig                    |   1 +
>>   drivers/misc/mei/Makefile                   |   1 +
>>   drivers/misc/mei/late_bind/Kconfig          |  13 +
>>   drivers/misc/mei/late_bind/Makefile         |   9 +
>>   drivers/misc/mei/late_bind/mei_late_bind.c  | 264 ++++++++++++++++++++
>>   include/drm/intel/i915_component.h          |   1 +
>>   include/drm/intel/late_bind_mei_interface.h |  50 ++++
>>   7 files changed, 339 insertions(+)
>>   create mode 100644 drivers/misc/mei/late_bind/Kconfig
>>   create mode 100644 drivers/misc/mei/late_bind/Makefile
>>   create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>>   create mode 100644 include/drm/intel/late_bind_mei_interface.h
>>
>> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
>> 7575fee96cc6..771becc68095 100644
>> --- a/drivers/misc/mei/Kconfig
>> +++ b/drivers/misc/mei/Kconfig
>> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>>   source "drivers/misc/mei/hdcp/Kconfig"
>>   source "drivers/misc/mei/pxp/Kconfig"
>>   source "drivers/misc/mei/gsc_proxy/Kconfig"
>> +source "drivers/misc/mei/late_bind/Kconfig"
>>
>>   endif
>> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
>> 6f9fdbf1a495..84bfde888d81 100644
>> --- a/drivers/misc/mei/Makefile
>> +++ b/drivers/misc/mei/Makefile
>> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
>>   obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
>>   obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
>>   obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/
>>
>>   obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o  mei-vsc-hw-y := vsc-tp.o
>> diff --git a/drivers/misc/mei/late_bind/Kconfig
>> b/drivers/misc/mei/late_bind/Kconfig
>> new file mode 100644
>> index 000000000000..65c7180c5678
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +config INTEL_MEI_LATE_BIND
>> +	tristate "Intel late binding support on ME Interface"
>> +	select INTEL_MEI_ME
>> +	depends on DRM_XE
>> +	help
>> +	  MEI Support for Late Binding for Intel graphics card.
>> +
>> +	  Enables the ME FW interfaces for Late Binding feature,
>> +	  allowing loading of firmware for the devices like Fan
>> +	  Controller during by Intel Xe driver.
>> diff --git a/drivers/misc/mei/late_bind/Makefile
>> b/drivers/misc/mei/late_bind/Makefile
>> new file mode 100644
>> index 000000000000..a0aeda5853f0
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
>> +
>> +subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
>> +
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
>> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
>> b/drivers/misc/mei/late_bind/mei_late_bind.c
>> new file mode 100644
>> index 000000000000..cb985f32309e
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
>> @@ -0,0 +1,264 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 Intel Corporation  */ #include
>> +<drm/drm_connector.h> #include <drm/intel/i915_component.h> #include
>> +<drm/intel/late_bind_mei_interface.h>
>> +#include <linux/component.h>
>> +#include <linux/pci.h>
>> +#include <linux/mei_cl_bus.h>
>> +#include <linux/module.h>
>> +#include <linux/overflow.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +
>> +#include "mkhi.h"
>> +
>> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
>> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD |
>> 0x80)
>> +
>> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
>> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
> I commented earlier in V2 series as well, is this timeout specific only to LATE BINDING ?
> If this is generic timeout for mei_cldev_{send,recv}_timeout(),
> then this marco should be part of standard MEI headers not late binding.
> Other consumers of mei_cldev_{send,recv}_timeout() send the timeout input by component-ops callback .
>
> @Shahsa could you please explained that.

As per Sasha:

This  is not generic timeout, only for specific client - mkhi as it is 
general purpose client and many user-space  connects there.
Timeouts are derived from real word experience, spec say "close 
connection as fast as you can and retry if busy", no specific timeout as 
it flow-specific thing.

>> +
>> +/**
>> + * struct csc_heci_late_bind_req - late binding request
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @flags: flags to be passed to the firmware
>> + * @reserved: reserved field
>> + * @payload_size: size of the payload data in bytes
>> + * @payload: data to be sent to the firmware  */ struct
>> +csc_heci_late_bind_req {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 flags;
>> +	u32 reserved[2];
>> +	u32 payload_size;
>> +	u8  payload[] __counted_by(payload_size); } __packed;
>> +
>> +/**
>> + * struct csc_heci_late_bind_rsp - late binding response
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @reserved: reserved field
>> + * @status: status of the late binding command execution by firmware
>> +*/ struct csc_heci_late_bind_rsp {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 reserved[2];
>> +	u32 status;
>> +} __packed;
>> +
>> +static int mei_late_bind_check_response(const struct device *dev, const
>> +struct mkhi_msg_hdr *hdr) {
>> +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
>> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
>> +			hdr->group_id, MKHI_GROUP_ID_GFX);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
>> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
>> +			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
>> +		return -EINVAL;
>> +	}
> Why are we not checking mkhi_msg_hdr hdr->result here ?
Sasha has some suggestions around this, will incorporate in next rev.
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mei_late_bind_push_config - Sends a config to the firmware.
>> + * @dev: device struct corresponding to the mei device
>> + * @type: payload type
>> + * @flags: payload flags
>> + * @payload: payload buffer
>> + * @payload_size: payload buffer size
>> + *
>> + * Return: 0 success, negative errno value on transport failure,
>> + *         positive status returned by FW
>> + */
>> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
>> +				     const void *payload, size_t payload_size) {
>> +	struct mei_cl_device *cldev;
>> +	struct csc_heci_late_bind_req *req = NULL;
>> +	struct csc_heci_late_bind_rsp rsp;
>> +	size_t req_size;
>> +	int ret;
>> +
>> +	if (!dev || !payload || !payload_size)
>> +		return -EINVAL;
>> +
>> +	cldev = to_mei_cl_device(dev);
>> +
>> +	ret = mei_cldev_enable(cldev);
>> +	if (ret < 0) {
>> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	req_size = struct_size(req, payload, payload_size);
>> +	if (req_size > mei_cldev_mtu(cldev)) {
>> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
>> +		ret = -EMSGSIZE;
>> +		goto end;
>> +	}
>> +
>> +	req = kmalloc(req_size, GFP_KERNEL);
>> +	if (!req) {
>> +		ret = -ENOMEM;
>> +		goto end;
>> +	}
> Use Kzalloc here, to make sure reserved filed of header is zeroed.
Sure.
>> +
>> +	req->header.group_id = MKHI_GROUP_ID_GFX;
>> +	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
>> +	req->type = type;
>> +	req->flags = flags;
>> +	req->reserved[0] = 0;
>> +	req->reserved[1] = 0;
>> +	req->payload_size = payload_size;
>> +	memcpy(req->payload, payload, payload_size);
>> +
>> +	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size,
>> LATE_BIND_SEND_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
>> +		goto end;
>> +	}
>> +	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
>> LATE_BIND_RECV_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
>> +		goto end;
>> +	}
>> +	ret = mei_late_bind_check_response(dev, &rsp.header);
>> +	if (ret) {
>> +		dev_err(dev, "bad result response from the firmware: 0x%x\n",
>> +			*(uint32_t *)&rsp.header);
>> +		goto end;
>> +	}
>> +	ret = (int)rsp.status;
>> +	dev_dbg(dev, "%s status = %d\n", __func__, ret);
> AFAIU It would be useful to add the status enum in late_bind_mei_interface.h.
Will discuss with Sasha and add if he agree.

>> +
>> +end:
>> +	mei_cldev_disable(cldev);
>> +	kfree(req);
>> +	return ret;
>> +}
>> +
>> +static const struct late_bind_component_ops mei_late_bind_ops = {
>> +	.owner = THIS_MODULE,
>> +	.push_config = mei_late_bind_push_config, };
>> +
>> +static int mei_component_master_bind(struct device *dev) {
>> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static void mei_component_master_unbind(struct device *dev) {
>> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static const struct component_master_ops mei_component_master_ops = {
>> +	.bind = mei_component_master_bind,
>> +	.unbind = mei_component_master_unbind, };
>> +
>> +/**
>> + * mei_late_bind_component_match - compare function for matching mei late
>> bind.
>> + *
>> + *    The function checks if requested is Intel VGA device
> Please modify the Kenel Doc comment here, as per the function.
>> + *    and the parent of requester and the grand parent of mei_if are the same
> We are matching against the requester not parent of requester.
> Modify the Kernel Doc comment properly.
>> + *    device.
>> + *
>> + * @dev: master device
>> + * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
>> + * @data: compare data (mei late-bind bus device)
> AFAIK It is mei client device not mei bus device.

It is late-bind device on mei bus.

xe_device -> mei client aux device -> [mei bus]-> mei late bind device

>> + *
>> + * Return:
>> + * * 1 - if components match
>> + * * 0 - otherwise
>> + */
>> +static int mei_late_bind_component_match(struct device *dev, int
>> subcomponent,
>> +					 void *data)
>> +{
>> +	struct device *base = data;
>> +	struct pci_dev *pdev;
>> +
>> +	if (!dev)
>> +		return 0;
>> +
>> +	if (!dev_is_pci(dev))
>> +		return 0;
>> +
>> +	pdev = to_pci_dev(dev);
>> +
>> +	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
>> +		return 0;
>> +
>> +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
>> +	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
>> +		return 0;
> This condition should be like below,  if I am not missing anything.
> if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
>   pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))

Correct, will fix this.

Thanks,
Badal

>
> Thanks,
> Anshuman.
>> +
>> +	if (subcomponent != I915_COMPONENT_LATE_BIND)
>> +		return 0;
>> +
>> +	base = base->parent;
>> +	if (!base) /* mei device */
>> +		return 0;
>> +
>> +	base = base->parent; /* pci device */
>> +
>> +	return !!base && dev == base;
>> +}
>> +
>> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
>> +			       const struct mei_cl_device_id *id) {
>> +	struct component_match *master_match = NULL;
>> +	int ret;
>> +
>> +	component_match_add_typed(&cldev->dev, &master_match,
>> +				  mei_late_bind_component_match, &cldev-
>>> dev);
>> +	if (IS_ERR_OR_NULL(master_match))
>> +		return -ENOMEM;
>> +
>> +	ret = component_master_add_with_match(&cldev->dev,
>> +					      &mei_component_master_ops,
>> +					      master_match);
>> +	if (ret < 0)
>> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
>> +	component_master_del(&cldev->dev, &mei_component_master_ops); }
>> +
>> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
>> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
>> +
>> +static struct mei_cl_device_id mei_late_bind_tbl[] = {
>> +	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
>> +
>> +static struct mei_cl_driver mei_late_bind_driver = {
>> +	.id_table = mei_late_bind_tbl,
>> +	.name = KBUILD_MODNAME,
>> +	.probe = mei_late_bind_probe,
>> +	.remove	= mei_late_bind_remove,
>> +};
>> +
>> +module_mei_cl_driver(mei_late_bind_driver);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("MEI Late Binding");
>> diff --git a/include/drm/intel/i915_component.h
>> b/include/drm/intel/i915_component.h
>> index 4ea3b17aa143..4945044d41e6 100644
>> --- a/include/drm/intel/i915_component.h
>> +++ b/include/drm/intel/i915_component.h
>> @@ -31,6 +31,7 @@ enum i915_component_type {
>>   	I915_COMPONENT_HDCP,
>>   	I915_COMPONENT_PXP,
>>   	I915_COMPONENT_GSC_PROXY,
>> +	I915_COMPONENT_LATE_BIND,
>>   };
>>
>>   /* MAX_PORT is the number of port
>> diff --git a/include/drm/intel/late_bind_mei_interface.h
>> b/include/drm/intel/late_bind_mei_interface.h
>> new file mode 100644
>> index 000000000000..2c53657ce91b
>> --- /dev/null
>> +++ b/include/drm/intel/late_bind_mei_interface.h
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2025 Intel Corporation  */
>> +
>> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
>> +#define _LATE_BIND_MEI_INTERFACE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +struct module;
>> +
>> +/**
>> + * Late Binding flags
>> + * Persistent across warm reset
>> + */
>> +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
>> +
>> +/**
>> + * xe_late_bind_fw_type - enum to determine late binding fw type  */
>> +enum late_bind_type {
>> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1, };
>> +
>> +/**
>> + * struct late_bind_component_ops - ops for Late Binding services.
>> + * @owner: Module providing the ops
>> + * @push_config: Sends a config to FW.
>> + */
>> +struct late_bind_component_ops {
>> +	struct module *owner;
>> +
>> +	/**
>> +	 * @push_config: Sends a config to FW.
>> +	 * @dev: device struct corresponding to the mei device
>> +	 * @type: payload type
>> +	 * @flags: payload flags
>> +	 * @payload: payload buffer
>> +	 * @payload_size: payload buffer size
>> +	 *
>> +	 * Return: 0 success, negative errno value on transport failure,
>> +	 *         positive status returned by FW
>> +	 */
>> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
>> +			   const void *payload, size_t payload_size); };
>> +
>> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
>> --
>> 2.34.1
--------------WXkGpym6lvvplNfdIXPOh90P
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-06-2025 13:02, Gupta, Anshuman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Nilawar, Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Sent: Thursday, June 19, 2025 12:30 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; linux-
<a class="moz-txt-link-abbreviated" href="mailto:kernel@vger.kernel.org">kernel@vger.kernel.org</a>
Cc: Gupta, Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>; Vivi, Rodrigo
<a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>; Usyskin, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>; Ceraolo Spurio, Daniele
<a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:jgg@nvidia.com">jgg@nvidia.com</a>
Subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver

From: Alexander Usyskin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>

Add late binding component driver.
It allows pushing the late binding configuration from, for example, the Xe graphics
driver to the Intel discrete graphics card's CSE device.

Signed-off-by: Alexander Usyskin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
v2:
 - Use generic naming (Jani)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This patch still wrong naming I915_COMPONENT_LATE_BIND.
LATE_BIND will never be supported by i915, it is a wrong prefix.
@Nikula, Jani @Vivi, Rodrigo is it ok use the i915 naming prefix here ?
We can use INTEL_COMPONENT_LATE_BIND here ?</pre>
    </blockquote>
    <p>Agree, if we use INTEL_ prefix here is it correct to add this
      file?&nbsp;</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

This header include/drm/intel/i915_component.h is used by both XE and i915.
May be a separate series later requires refactoring this header.</pre>
    </blockquote>
    <p>Agree, better handle naming of all the components while
      refactoring.</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
v3:
 - Updated kconfig description
 - Move CSC late binding specific flags/defines to late_bind_mei_interface.h
(Daniele)
v4:
 - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards
(Anshuman)
---
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 264 ++++++++++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  50 ++++
 7 files changed, 339 insertions(+)
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
7575fee96cc6..771becc68095 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -84,5 +84,6 @@ config INTEL_MEI_VSC
 source &quot;drivers/misc/mei/hdcp/Kconfig&quot;
 source &quot;drivers/misc/mei/pxp/Kconfig&quot;
 source &quot;drivers/misc/mei/gsc_proxy/Kconfig&quot;
+source &quot;drivers/misc/mei/late_bind/Kconfig&quot;

 endif
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
6f9fdbf1a495..84bfde888d81 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
 obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/

 obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o  mei-vsc-hw-y := vsc-tp.o
diff --git a/drivers/misc/mei/late_bind/Kconfig
b/drivers/misc/mei/late_bind/Kconfig
new file mode 100644
index 000000000000..65c7180c5678
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_LATE_BIND
+	tristate &quot;Intel late binding support on ME Interface&quot;
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding feature,
+	  allowing loading of firmware for the devices like Fan
+	  Controller during by Intel Xe driver.
diff --git a/drivers/misc/mei/late_bind/Makefile
b/drivers/misc/mei/late_bind/Makefile
new file mode 100644
index 000000000000..a0aeda5853f0
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+# Makefile - Late Binding client driver for Intel MEI Bus Driver.
+
+subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
+
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
b/drivers/misc/mei/late_bind/mei_late_bind.c
new file mode 100644
index 000000000000..cb985f32309e
--- /dev/null
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation  */ #include
+&lt;drm/drm_connector.h&gt; #include &lt;drm/intel/i915_component.h&gt; #include
+&lt;drm/intel/late_bind_mei_interface.h&gt;
+#include &lt;linux/component.h&gt;
+#include &lt;linux/pci.h&gt;
+#include &lt;linux/mei_cl_bus.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/overflow.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/uuid.h&gt;
+
+#include &quot;mkhi.h&quot;
+
+#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
+GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD |
0x80)
+
+#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
+LATE_BIND_RECV_TIMEOUT_MSEC 3000
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I commented earlier in V2 series as well, is this timeout specific only to LATE BINDING ?
If this is generic timeout for mei_cldev_{send,recv}_timeout(), 
then this marco should be part of standard MEI headers not late binding.
Other consumers of mei_cldev_{send,recv}_timeout() send the timeout input by component-ops callback .

@Shahsa could you please explained that.</pre>
    </blockquote>
    <p>As per Sasha:</p>
    <p><span data-teams="true">This&nbsp; is not generic timeout, only for
        specific client - mkhi as it is general purpose client and many
        user-space &nbsp;connects there.<br>
        Timeouts are derived from&nbsp;</span><span data-teams="true">real
        word experience, spec say &quot;close connection as fast as you can
        and retry if busy&quot;, no specific timeout as it flow-specific
        thing.</span></p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+/**
+ * struct csc_heci_late_bind_req - late binding request
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @flags: flags to be passed to the firmware
+ * @reserved: reserved field
+ * @payload_size: size of the payload data in bytes
+ * @payload: data to be sent to the firmware  */ struct
+csc_heci_late_bind_req {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 flags;
+	u32 reserved[2];
+	u32 payload_size;
+	u8  payload[] __counted_by(payload_size); } __packed;
+
+/**
+ * struct csc_heci_late_bind_rsp - late binding response
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @reserved: reserved field
+ * @status: status of the late binding command execution by firmware
+*/ struct csc_heci_late_bind_rsp {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 reserved[2];
+	u32 status;
+} __packed;
+
+static int mei_late_bind_check_response(const struct device *dev, const
+struct mkhi_msg_hdr *hdr) {
+	if (hdr-&gt;group_id != MKHI_GROUP_ID_GFX) {
+		dev_err(dev, &quot;Mismatch group id: 0x%x instead of 0x%x\n&quot;,
+			hdr-&gt;group_id, MKHI_GROUP_ID_GFX);
+		return -EINVAL;
+	}
+
+	if (hdr-&gt;command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
+		dev_err(dev, &quot;Mismatch command: 0x%x instead of 0x%x\n&quot;,
+			hdr-&gt;command, GFX_SRV_MKHI_LATE_BINDING_RSP);
+		return -EINVAL;
+	}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why are we not checking mkhi_msg_hdr hdr-&gt;result here ?</pre>
    </blockquote>
    Sasha has some suggestions around this, will incorporate in next
    rev.
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return 0;
+}
+
+/**
+ * mei_late_bind_push_config - Sends a config to the firmware.
+ * @dev: device struct corresponding to the mei device
+ * @type: payload type
+ * @flags: payload flags
+ * @payload: payload buffer
+ * @payload_size: payload buffer size
+ *
+ * Return: 0 success, negative errno value on transport failure,
+ *         positive status returned by FW
+ */
+static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
+				     const void *payload, size_t payload_size) {
+	struct mei_cl_device *cldev;
+	struct csc_heci_late_bind_req *req = NULL;
+	struct csc_heci_late_bind_rsp rsp;
+	size_t req_size;
+	int ret;
+
+	if (!dev || !payload || !payload_size)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret &lt; 0) {
+		dev_dbg(dev, &quot;mei_cldev_enable failed. %d\n&quot;, ret);
+		return ret;
+	}
+
+	req_size = struct_size(req, payload, payload_size);
+	if (req_size &gt; mei_cldev_mtu(cldev)) {
+		dev_err(dev, &quot;Payload is too big %zu\n&quot;, payload_size);
+		ret = -EMSGSIZE;
+		goto end;
+	}
+
+	req = kmalloc(req_size, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto end;
+	}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Use Kzalloc here, to make sure reserved filed of header is zeroed.</pre>
    </blockquote>
    Sure.
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	req-&gt;header.group_id = MKHI_GROUP_ID_GFX;
+	req-&gt;header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
+	req-&gt;type = type;
+	req-&gt;flags = flags;
+	req-&gt;reserved[0] = 0;
+	req-&gt;reserved[1] = 0;
+	req-&gt;payload_size = payload_size;
+	memcpy(req-&gt;payload, payload, payload_size);
+
+	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size,
LATE_BIND_SEND_TIMEOUT_MSEC);
+	if (ret &lt; 0) {
+		dev_err(dev, &quot;mei_cldev_send failed. %d\n&quot;, ret);
+		goto end;
+	}
+	ret = mei_cldev_recv_timeout(cldev, (void *)&amp;rsp, sizeof(rsp),
LATE_BIND_RECV_TIMEOUT_MSEC);
+	if (ret &lt; 0) {
+		dev_err(dev, &quot;mei_cldev_recv failed. %d\n&quot;, ret);
+		goto end;
+	}
+	ret = mei_late_bind_check_response(dev, &amp;rsp.header);
+	if (ret) {
+		dev_err(dev, &quot;bad result response from the firmware: 0x%x\n&quot;,
+			*(uint32_t *)&amp;rsp.header);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		goto end;
+	}
+	ret = (int)rsp.status;
+	dev_dbg(dev, &quot;%s status = %d\n&quot;, __func__, ret);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">AFAIU It would be useful to add the status enum in late_bind_mei_interface.h.</pre>
    </blockquote>
    Will discuss with Sasha and add if he agree.&nbsp;<br>
    <br>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+end:
+	mei_cldev_disable(cldev);
+	kfree(req);
+	return ret;
+}
+
+static const struct late_bind_component_ops mei_late_bind_ops = {
+	.owner = THIS_MODULE,
+	.push_config = mei_late_bind_push_config, };
+
+static int mei_component_master_bind(struct device *dev) {
+	return component_bind_all(dev, (void *)&amp;mei_late_bind_ops); }
+
+static void mei_component_master_unbind(struct device *dev) {
+	component_unbind_all(dev, (void *)&amp;mei_late_bind_ops); }
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind, };
+
+/**
+ * mei_late_bind_component_match - compare function for matching mei late
bind.
+ *
+ *    The function checks if requested is Intel VGA device
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Please modify the Kenel Doc comment here, as per the function.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *    and the parent of requester and the grand parent of mei_if are the same
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">We are matching against the requester not parent of requester.
Modify the Kernel Doc comment properly.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *    device.
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
+ * @data: compare data (mei late-bind bus device)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">AFAIK It is mei client device not mei bus device.</pre>
    </blockquote>
    <p>It is late-bind device on mei bus.&nbsp;&nbsp;<br>
      <span data-teams="true"><span><span style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;"><p>xe_device -&gt; mei client aux device -&gt; [mei bus]-&gt; mei late bind device 
</p></span></span></span></p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_late_bind_component_match(struct device *dev, int
subcomponent,
+					 void *data)
+{
+	struct device *base = data;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return 0;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev-&gt;vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (pdev-&gt;class != (PCI_CLASS_DISPLAY_VGA &lt;&lt; 8) ||
+	    pdev-&gt;class != (PCI_CLASS_DISPLAY_OTHER &lt;&lt; 8))
+		return 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This condition should be like below,  if I am not missing anything. 
if (pdev-&gt;class != (PCI_CLASS_DISPLAY_VGA &lt;&lt; 8) &amp;&amp;
 pdev-&gt;class != (PCI_CLASS_DISPLAY_OTHER &lt;&lt; 8))</pre>
    </blockquote>
    <p>Correct, will fix this.&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Anshuman.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	if (subcomponent != I915_COMPONENT_LATE_BIND)
+		return 0;
+
+	base = base-&gt;parent;
+	if (!base) /* mei device */
+		return 0;
+
+	base = base-&gt;parent; /* pci device */
+
+	return !!base &amp;&amp; dev == base;
+}
+
+static int mei_late_bind_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id) {
+	struct component_match *master_match = NULL;
+	int ret;
+
+	component_match_add_typed(&amp;cldev-&gt;dev, &amp;master_match,
+				  mei_late_bind_component_match, &amp;cldev-
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">dev);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+	if (IS_ERR_OR_NULL(master_match))
+		return -ENOMEM;
+
+	ret = component_master_add_with_match(&amp;cldev-&gt;dev,
+					      &amp;mei_component_master_ops,
+					      master_match);
+	if (ret &lt; 0)
+		dev_err(&amp;cldev-&gt;dev, &quot;Master comp add failed %d\n&quot;, ret);
+
+	return ret;
+}
+
+static void mei_late_bind_remove(struct mei_cl_device *cldev) {
+	component_master_del(&amp;cldev-&gt;dev, &amp;mei_component_master_ops); }
+
+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
+
+static struct mei_cl_device_id mei_late_bind_tbl[] = {
+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
+
+static struct mei_cl_driver mei_late_bind_driver = {
+	.id_table = mei_late_bind_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_late_bind_probe,
+	.remove	= mei_late_bind_remove,
+};
+
+module_mei_cl_driver(mei_late_bind_driver);
+
+MODULE_AUTHOR(&quot;Intel Corporation&quot;);
+MODULE_LICENSE(&quot;GPL&quot;);
+MODULE_DESCRIPTION(&quot;MEI Late Binding&quot;);
diff --git a/include/drm/intel/i915_component.h
b/include/drm/intel/i915_component.h
index 4ea3b17aa143..4945044d41e6 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	I915_COMPONENT_LATE_BIND,
 };

 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/late_bind_mei_interface.h
b/include/drm/intel/late_bind_mei_interface.h
new file mode 100644
index 000000000000..2c53657ce91b
--- /dev/null
+++ b/include/drm/intel/late_bind_mei_interface.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2025 Intel Corporation  */
+
+#ifndef _LATE_BIND_MEI_INTERFACE_H_
+#define _LATE_BIND_MEI_INTERFACE_H_
+
+#include &lt;linux/types.h&gt;
+
+struct device;
+struct module;
+
+/**
+ * Late Binding flags
+ * Persistent across warm reset
+ */
+#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type  */
+enum late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1, };
+
+/**
+ * struct late_bind_component_ops - ops for Late Binding services.
+ * @owner: Module providing the ops
+ * @push_config: Sends a config to FW.
+ */
+struct late_bind_component_ops {
+	struct module *owner;
+
+	/**
+	 * @push_config: Sends a config to FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @type: payload type
+	 * @flags: payload flags
+	 * @payload: payload buffer
+	 * @payload_size: payload buffer size
+	 *
+	 * Return: 0 success, negative errno value on transport failure,
+	 *         positive status returned by FW
+	 */
+	int (*push_config)(struct device *dev, u32 type, u32 flags,
+			   const void *payload, size_t payload_size); };
+
+#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
--
2.34.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------WXkGpym6lvvplNfdIXPOh90P--
