Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23837AD8BCF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1587710E141;
	Fri, 13 Jun 2025 12:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXK+uDE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EF810E141
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749816705; x=1781352705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Np+rVUpTItgWcVRvmszsMwK1WG8WbJMyIH3K/3rTly8=;
 b=TXK+uDE39hgIwmJeT9Qq85DhI/BWwjzXTD0t3fjP4xO5bL+/NgoNgrPg
 PiY0CmtAszKlhCpmFYj9Agiy0OF9bjZY7tEPb+0P11cVt9vCcb2k43yZf
 mqPVMNeZbvlA0SG2mRxx1MjMwmFI/Q/VI8RcwSq8XGyN4STuAn3+tFuhU
 JA8KiJbxrL/PiyejGCKtOjFAVpvtiaenDnczwQ61uVjbw0abxdlKuc3fT
 /josYeeFlF4Uupnkye82Nxj16HA1ifDPhfHFxFCYbGBE8G3Kc9oR2A0xb
 FpUMC8Fz8MjMvNEP3yy3cJN/6fZglzsPavQh6T16RZZuYJUKp72gdE5Fv w==;
X-CSE-ConnectionGUID: UeebwQH5Q2iFYxx07BHcmg==
X-CSE-MsgGUID: 2IoztqrQQBCGb5fWLIYW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77423828"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="77423828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:11:42 -0700
X-CSE-ConnectionGUID: 1L89ofmIRcSP5/JZ3ziTDQ==
X-CSE-MsgGUID: KyI4bQotTv+0aunbQFoT8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148708016"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:11:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 05:11:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 05:11:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 05:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haWFDlnQiz8gtYgoy5v3jZKRRXD1YGcc5wx4P4SI70Etxw9a542wSmcVVCD4u4sPcOudp39N33S/M8Qz+CiE9vM5hsvzGgszfIhvrXFIle7SvZmLZEZiZMdv1uXCGWGor7NvfvexfwqQJZT2dEudhuKL5A8Z+wKfJt7DGme/RMVQKPG3j3XEsP984itOJlVDRs9FCB+x+W7k7TLFOJ97M7BrUe2mcCbRw9Lq+fqlpMsPudpkxZeJ9CObhlb+uPtD07oflhBshwEtrqtYJ4Yug0c/tY9FZAoZvWIn5HmKVL2qiBveN+oEFWTePxonl3yFeb+jRrPTnXtx49pYUKq4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np+rVUpTItgWcVRvmszsMwK1WG8WbJMyIH3K/3rTly8=;
 b=qPRkpy5Y2ywwyAaBgF47TN7zyD3+uULEjS3i1zD4JKakdPnYZpwwFP2kaVp4VNj64uBrMIZ9oTeTmBYYE+NpH9NAXNmmjynLR813IJzR9/eaRmwuFvIIK7aI9J8vMbCwvX2uB89pFtNzb8ypkf94Y8PGFw5W7jOYprtxigfv242JQCPwBJqlVJT0GDWerF5WW8/qWVq2NmFgRCKxp3SJ7bs7H4vbnoajfY6AtMLsKqjm1xUEzbTO0zPs/F8HNhssAfj3uC3vrjj2HRQ+pQlfPSVUo8eVOHaRzm3HB5whPIaC7V2z+tyXVdKhHtYEUJ/HGmE56y2HSJTCt26EZ7dCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.29; Fri, 13 Jun 2025 12:11:39 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 12:11:39 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Thread-Topic: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Thread-Index: AQHb1URt9YcjR/JbCkmWiHihoVQoQrPzIk8AgAAMhoCADb0vAIAAAncAgAAMHYCAABMdcA==
Date: Fri, 13 Jun 2025 12:11:39 +0000
Message-ID: <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local> <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
In-Reply-To: <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|MW5PR11MB5763:EE_
x-ms-office365-filtering-correlation-id: 58c0724a-c0ec-4c52-38d7-08ddaa737378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1JFVmU4dkFKNGtCWTVUamxhd2dxQU1hZ3N6ako2dlFRN21nZmMra1MrdXh5?=
 =?utf-8?B?Z3UzdFhYZlhLdFM0ZFFlTFMzc1pDVmFhNHNYakprUzJCaHJnR0wrM0toZkNv?=
 =?utf-8?B?ZHVYREhKMXFEbjBUTE51OEtCNjlpTEM0b2tpdCs0UXJBdGtFRWs5SkwwY0xJ?=
 =?utf-8?B?anRWNWkvaGh1ZHUzOEVQQnVkZ2FVNFJscW5QZncwWldwT3A2UW1LNm9RN3FP?=
 =?utf-8?B?Tmg5Z0FmRWpGM2xZc3h3LzBtcWN1OWZLSjVNNm5FTlZwU24xSVp1aTJMTGw5?=
 =?utf-8?B?RHJQTkIrNlFJUTBSZklDaWpJN0cvL2lic0tsVEk3U0VzbWlsbzMvM2N0Wi93?=
 =?utf-8?B?RjBWN2RoZklsVVpaSVpzdlBpS3ZHYVFCSTBBcTdQQ3Q2SDBkM1d6cXdhUzh2?=
 =?utf-8?B?M1M1Ti9YMFMycHJ2T1dVa2dtWGpHV1liRVRWS0c3RnpMYjRHdXhoWWk3ZnNB?=
 =?utf-8?B?dThHQm5wRkp5djh5WXVvd2ZYajV4dlZ0b25FQVV1Zml0RjlzOUIrM2hZcjJZ?=
 =?utf-8?B?OEorZENSVG53WWk0NnBTR01RR2JmSFdvckl1SHU2cXNtMzF2VWtydHgxaTRW?=
 =?utf-8?B?cmNSb3VsTEhOSjlHNDViTHYwdzZXdUlvam5SVTRNdjBlQ21ESVRsWVhmSGFa?=
 =?utf-8?B?bDVyTVJscXpWd25QQyt5OVo4R2NtMHMyTzc0Mm5vZUJHZlhIYW80VXVRSytu?=
 =?utf-8?B?NUNtK2todmhtbFlVNlN4YWd5cTF1WG5qQUY0U3ArTHNmM09KcElnZXVNbU5R?=
 =?utf-8?B?Y3IwNjVuNmlKNlF1aERNcC8xc2dtN3NvaU8wOGIyaVl4RU1aNGRUK2lJQzc5?=
 =?utf-8?B?UVoybllaZmlGYnVhdjNET0tsK1JkYVpIbU1ZVktiTWQwaHBxODNKMnJXazA1?=
 =?utf-8?B?bnVqNWU4UDlSNHp4Y3ZTaVF4amhaangwQlY0OFJGMUZQZDhuYVd2UUtwS0JX?=
 =?utf-8?B?TFdWczZxeld1MURHaHkzcXFMdW9XblhNMmg3eTUwcXVLbkpsUUlYcEM3czlo?=
 =?utf-8?B?Ym1HUEhvdW1mWnd4aXYwQWFFWlRabjBYbUorZFYxaWFMMC81YUxjbmw4andY?=
 =?utf-8?B?dXhCbXhEZEJFUEdVaGhkNThTZ3NWZ2doT3pINExOTHZVTkxWQnhsQk9veTll?=
 =?utf-8?B?SHJ1MWd6enN3Mno0cittUTlrYWM5ZnpoeHZYLzlCdkFLWWpxRzdGTHBLWWhG?=
 =?utf-8?B?dVpUbUgwSjA2eEFLQkM5eUtIeHg1Z3FpNkdnZXd5WGN6UkRlTzY1YWxrMCtH?=
 =?utf-8?B?SSs1K1FmSUQrQnh0SVN1OUpQYnUvenN2aUNnY0FiRTloeHhjWmJ1OWxvL1RM?=
 =?utf-8?B?QWRjdFJVOXhpVWxIVHB2VnZEa0dvbm5aLzRPVDZnYmgzV2Z6SjIzdWlkekxQ?=
 =?utf-8?B?NGFxM01pdGJTOG9CUGdzTFJ4aWsyUG1CQjJmTjlvb1liRCtPMDVWT0RnbGd6?=
 =?utf-8?B?MHRoSnJxeCtRekVCdmc5c0ticVdQdlpTd0MrNTNUMXhVSFpDWFRyMzRlRWM0?=
 =?utf-8?B?MmhSalcwcXZpbmxRNXh1QmZ5aXVmY0tHV0lmTndBcHhmdUNMeGhYdzdFK2hx?=
 =?utf-8?B?c3F6Szc3WE1ubkR1T0o5MnI4UFJHaTBSamZtRFJhN2hRMnRITXUrZ0hxZGZ0?=
 =?utf-8?B?aytiYmV0ME9UY1NnSlZyc2I4MWxxbjdWZmRTdnJjVmVrUkFLV0lOZVhEbjVu?=
 =?utf-8?B?dU15bXlkVjZrdndPcDFlWnd4VGNFTGFnS3RZWVNyVm1DZTQ5K2FrTHpyNXBX?=
 =?utf-8?B?dTJYVndtRHY4VWZQc0d3am5xS1NHRG1XWVNXYkh1U3VxR2x0Zm1iSzFVd3ZP?=
 =?utf-8?B?OWIvVll5Q0MzMVBVaVR6WFBMK2V1MTBHbFA1RDJabnVlemFseEhJcXhRbEk0?=
 =?utf-8?B?amxkZWN4ejFMYU93U0dwWGRvdm5iYmNzRXBKT1VEd0lSU1hwNnQxWkVBT3Ni?=
 =?utf-8?Q?AAYjszqnQ4w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzFlUy9Bb043aHB4ZnkwRE8wSnJham0rOXpaTVBpbXhsSTlBdk91QmRMeDkx?=
 =?utf-8?B?NVpPRjZxU045L0UvVnhrNHByaHRmTHhvbHByNlhsaGV0WXN0em5tS3RFSS83?=
 =?utf-8?B?MHRFY2dYRjExZ2s3MVFhRmkrdXZwZkwwZHVOdTJ2WjdDV3hvek96N1VTQnVL?=
 =?utf-8?B?azk0bERqN2RzalU1cVJ4SFpxTC81SUlQcGh3Z2tDWGFZUnc1cTJ4cmFZRW5Z?=
 =?utf-8?B?bDZWYlNFbnpVeDV5K1ZscjdDUHZOM1k1d2lQRkpBTnRBaVVnRTFhUVk3LzlK?=
 =?utf-8?B?cEhJRGE5RFVUaGFCWUhTdWhuOHRsSG1GZEhrRGFtUGNqQUZuK001RmxjOG9O?=
 =?utf-8?B?dkVRd3k5aXVMVWhwWXhRUGdiaTdnOHBNZllqVzlaRWZrSzEwOEVrM29TTFJp?=
 =?utf-8?B?amkyeWhZN08zNFA3cHBWK2thaXcxMytXWGtNWUxmekhTV0pWUlZWQUUvVlB2?=
 =?utf-8?B?bVRZU2c5VjlERWJETkVBL1NYYUtTR2NFMVNoVXZiWWVFN043R1BNL0lqR0Fx?=
 =?utf-8?B?NFg5RExCTnNVcjBaKzF5Q0djZ0xYNWhNWml5VTRKOThRdFZuQm92VGYwczJS?=
 =?utf-8?B?b25rNVNjR2prSkg1RzNJWnQ3aDR6RzBLN0hqTnk1L0s0TWRLTFdoclNRUG43?=
 =?utf-8?B?bnBJY2pRVHNpOHlYTFh3T2NTKzlpdEdVUWJtaUw0QVAzaW1pNkZ0bkNmemR2?=
 =?utf-8?B?OWpBTzFHeHFITU5tMUhhTXhaN0hibkxQMnBqMi8xK2hWdTU3bURjYW5WVUE3?=
 =?utf-8?B?WFh5ZktKcDlHdmdXUFcrSVNKcnBuZFVwQ1RZS3R0RldtbVFTZVZVeWpLR0dv?=
 =?utf-8?B?SHJnWkpzcUEzSVV6dnhIdW1ObVFHOFBTNk9FWVdId3AveXF2NHE4L3dLS2Zr?=
 =?utf-8?B?ZWZnS0FFODhlaEpwL2hPbnlhbEgwcHdGRWV5a3FBcGo1Vi9Kc2l1NEkwWld1?=
 =?utf-8?B?WTFDTXRyU1Z3NDZ1NFRoQWpEVVZkdThSaTlnRkp6dlRMN3k1VVBkTUN0ckZz?=
 =?utf-8?B?VUFBcGUvQ1BMRzZCMlBOaUZMTFlHdWxhdHdRbzlNWW5OS3NaanNOUk9idkhU?=
 =?utf-8?B?S1dZWTdLNU1lWk5JZFJvTUFJRkhRNzQwRS9SZjN4cGsvQUphM2ZJVlkvV3RZ?=
 =?utf-8?B?ZUZnR2gvbmFSOThXUHgxUGUyd1ZEUlBCY0hDUHUvYWpSOVRCalA4Z0RpWjlu?=
 =?utf-8?B?emJQajltSmliejFJZVh2WHlUeXF5RGxXakxtejF0VnRBODhqL1k3Zy9IaUFM?=
 =?utf-8?B?OUpNdy9pYTU0cDBuaHlMUjMvYnpON2h1VjdIU20wYmEwKzBLZ3NuMDlDSXFU?=
 =?utf-8?B?NXJVcDJ2Z0JWNEVKL0NzeHZuOGxIVFJjT2xERDUxSFVTdDJVU3VLWHhhWXY1?=
 =?utf-8?B?dlk3SW9jUUtZbi8rT28rZzhZQTdobVE4SVhPSTYxS29sNlVTb01CTE1EVTEz?=
 =?utf-8?B?WjVqamNvd3JSWVhNYnBBc1JSdmZPNkFPNWtiQ2didVU4a2E4dS9HalRubWU1?=
 =?utf-8?B?dk1JR0xTeEMvUjdCWGxTY1V5UHhZcExMUGRmaUkwYXB1V01DRG9EdU9WUE4w?=
 =?utf-8?B?Z2FrOWFYa0FjZE1CZXU0eGcwZ3RhS1lreXpvQ3BPVlgyemkyM0IrT1p1MlRw?=
 =?utf-8?B?b3ozRC93MzA2a0RiWDRPRXZRbm1zekNaVGp4OTNwSkp2RzdDOHd5WDM4WUFY?=
 =?utf-8?B?aWhpaHFJTGp3TU5Mem9tSVhLeGFQbk9nWWcvazYxeHRYVm44SjFTUUttYTNr?=
 =?utf-8?B?NTRaVXl3YkR5enlxbnppMDQ4cGY0SnFNUEt0MU9jVllPVjBtTWdhOGNyK3Va?=
 =?utf-8?B?cUtLdFEyc1ZUQ2NqcGR2WWpqREdTNTlEMkpoeHhycGY0dDhMdTNjeEd3aUQr?=
 =?utf-8?B?V2Juak9RZEp2OU1wMVNZMW9WOXo2blV0SmFIWmpicGtvRTZBUWJtOFlsMGJv?=
 =?utf-8?B?MDNaOXErQ1VsRHFkRCtMdVBxeHdLZzdpYk45OVZzTmJpN0Q5WkpRV0RhVFMz?=
 =?utf-8?B?YWdPcTdIY3JYbStta1BPME1GbmdVTTUxZlpOeEpzRjBCNGpiZk1DZVBoLzdC?=
 =?utf-8?B?TkhHeGhkTUUxb1A5c0cyeFk0RkpQSlk4UmxQVEJXZCtFZERZeHloWGJVNzBh?=
 =?utf-8?Q?mP3azFMXNpIdVkFUPTJCmRsbc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c0724a-c0ec-4c52-38d7-08ddaa737378
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 12:11:39.1605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EnXAOCbfNcfDCxyqRTks63P53NrS2D/tlB6yOM7uGCDCZErGUMUBJXk115WAPQnKmks2+4KZtOdlBIYYN0Dfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8
ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFu
aQ0KPiBOaWt1bGENCj4gU2VudDogRnJpZGF5LCAxMyBKdW5lIDIwMjUgMTQuMDINCj4gVG86IFR2
cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD47IFNpbW9uYSBWZXR0ZXINCj4gPHNp
bW9uYS52ZXR0ZXJAZmZ3bGwuY2g+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gQ2M6IHR6aW1tZXJtYW5uQHN1c2UuZGU7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3ByaW1l
OiByZW1vdmUgZHJtX3ByaW1lX2xvb2t1cF9idWZfYnlfaGFuZGxlDQo+IA0KPiBPbiBGcmksIDEz
IEp1biAyMDI1LCBUdnJ0a28gVXJzdWxpbiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+IHdyb3RlOg0K
PiA+IE9uIDEzLzA2LzIwMjUgMTE6MDksIEphbmkgTmlrdWxhIHdyb3RlOg0KPiA+PiBPbiBXZWQs
IDA0IEp1biAyMDI1LCBTaW1vbmEgVmV0dGVyIDxzaW1vbmEudmV0dGVyQGZmd2xsLmNoPiB3cm90
ZToNCj4gPj4+IE9uIFdlZCwgSnVuIDA0LCAyMDI1IGF0IDA1OjM2OjIyUE0gKzAyMDAsIFNpbW9u
YSBWZXR0ZXIgd3JvdGU6DQo+ID4+IFRoaXMgcmVncmVzc2VkIG9uZSBvZiBvdXIgQ0kgSUdUIHRl
c3RzIFsxXS4NCj4gPj4NCj4gPj4gQlIsDQo+ID4+IEphbmkuDQo+ID4+DQo+ID4+DQo+ID4+IFsx
XSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVz
LzE0NDYzDQo+ID4NCj4gPiBJdCBhbHNvIGV4cGxvZGVzIGV2ZW4gbW9yZSB0cml2aWFsbHkgd2hl
biBsb2dnaW5nIGludG8gYSBLREUgV2F5bGFuZA0KPiA+IHNlc3Npb246DQo+IA0KPiBTbWVsbHMg
bGlrZSBhIHJldmVydCwgYW5kIGJhY2sgdG8gdGhlIGRyYXdpbmcgYm9hcmQsIHBlcmhhcHM/DQpJ
IHdvdWxkIHNheSBzby4gTG9va3MgbGlrZSB0aGlzIG9uIG91ciBDSSBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL2lndEBwcmltZV9zZWxmX2ltcG9ydEBiYXNpYy13aXRo
X29uZV9iby5odG1sIA0KQW5kIHN5c3RlbXMgc3RvcCB0ZXN0aW5nIGFueXRoaW5nIGFmdGVyIChz
ZWUgZWcgaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTY2
OTIvYmF0LXR3bC0xL2lndF9ydW5uZXIwLnR4dCApIHdoZW4gYWJvcnRzIGhhcHBlbnMuIA0KDQo+
IA0KPiANCj4gQlIsDQo+IEphbmkuDQoNCkJyDQpPdGhlciBKYW5pDQo+IA0KPiANCj4gLS0NCj4g
SmFuaSBOaWt1bGEsIEludGVsDQo=
