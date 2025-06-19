Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56DEAE01BC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 11:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED9710E034;
	Thu, 19 Jun 2025 09:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gm5u2Egf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E645910E034;
 Thu, 19 Jun 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750325663; x=1781861663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3MtO5bFz4n+Ac1crdNQXy/TJ1PUJgPvW7EJa12L57Nk=;
 b=gm5u2Egf+IfizvV2Q0zBQqprlG8fe2SOp0ntk7+gdsOj3sYRMT/k6uVd
 7xkozppEy5FZUhXlHtua8wTSU7QP4KKwPLkXGIPkquwM7QdmLqJVUnMll
 EY0ugfwTyiX11lTT96+ARRVNhM3sQTVQoF26e4+c+Kbb2BT2dC2LXxSA7
 e1+xdhdIT23RDjPy1Kd+knaXoFocOFBFjKQPo2tvehz3BbbzmGQbUnvBg
 uAw3uhDgfCZMndiz7i4Jf9T1DtP1jZhPPuNuj00mE34myrZOm7iyCOcrj
 rf2vJNQt1TUtf9J4R3HIxTkwbZ+j12SU52Xxu1n+U8goJkRrsVgAOlMVl Q==;
X-CSE-ConnectionGUID: issHI+8DT2m27sZ3iRAtvg==
X-CSE-MsgGUID: fhIEdf+PT1ixvHB0bnk+fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52453861"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52453861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:34:23 -0700
X-CSE-ConnectionGUID: wDa/qgypTNetbhDUL2Ye6A==
X-CSE-MsgGUID: fJswQknARWuJetzF2ozOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="151133559"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:34:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 02:34:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 02:34:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 02:33:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gkp99soGUvwj9wcZ81U+JkvK/B50Pu9JlCPzxoSnI/AyuLq1BqFkkWDJMHpKN9TSLWDCfUWLsUh/7yO4G8Hezwx8bzaxeS5ouQLsXoFt9QpBhIIYXLu16tn2C7vmS4NuKR2cmZ1QeaGwOypBmYrReDavV2vaEfzqVz/1Yd7UHiA/zq0UFXupwr7eC1xAIjkPF+wb1oS5CvCfcDNPHcyw8lpW0uxk8GoMHsrdmPpnN803czi9MUxJLM5uTtcB3Ed+rfoGYDKDmvhU3c6GdlskOnVQLxbOvV9jThiYQqWWUkyXtBL90Mq9aVJrIzgZxX3Aj9xRYvUiASt7WB67VJFKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp49sEywnknba4p8c3Jc3AIlmVk232uluobCQtZxnLI=;
 b=dpdoLHDUWzT85vMThwZxaUMso7Qijv+opGzRHvPvd1++PPKEt+p1xWvXF26j9VuDKRpOueFgYIg4CSFwjDJZqxR6T69PqPITRdVY3Ct4HKg2FcH7IJSVof55TikhlajRzQEO2szmymWI2pLTX0jV8Iv+hkGj66zAO4Z1fSlj9UtFZfqMFnOsinea43SmFHJlxKcz68cVE2cUaC7dPe6o7caE3h8j9Mkd5pFGrKI5EkE+1ciGoD4GfvcL1P3E/BEiyDyCbraQOogHMZ+Jt+jaTkrVgYjSXL4pvZRk2uLn39kS8iyB9Hr+aXlSX7CDaIuIOarormDUe2d48Qvcw+NHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 09:33:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.022; Thu, 19 Jun 2025
 09:33:04 +0000
Message-ID: <af6e1d5b-84e2-4ad7-b7a4-9c3ba3bf00f5@intel.com>
Date: Thu, 19 Jun 2025 15:02:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-10-badal.nilawar@intel.com>
 <994ba1b4-281a-46bd-9431-7bdef5970ed3@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <994ba1b4-281a-46bd-9431-7bdef5970ed3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3dce10-0ca1-453a-ee1b-08ddaf144ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1E5aWtTcG5RblFYdnNycnRmVGVidkNTZnZnSnJaZXpNSlA0Z1RPRnJwUTBG?=
 =?utf-8?B?VFh6QnhzOXpKMXYwNy9kdVZRTjhBaHBBempuVnB6eEZZRFZkZ1hlVnBCM2Jj?=
 =?utf-8?B?dHloaVNpME1kRC9FRUV0cms1S2hIZ083SW9iZFVSSnEyVmRQZXdZbjRlYVBv?=
 =?utf-8?B?aWQvRCtXRGdhek9RUlNTNnBjMVlQMmI3aFg5VGJqWnNyYkEyUEJuVlNKZnVN?=
 =?utf-8?B?Wnl4TUh5WndIS1U1ZThjVHcvL1oveU9JVlFub2cxSmN2NTQ5N3pueitxMGRY?=
 =?utf-8?B?S0N6MEdlRWl0WVFLK3VVU2Q3RUh2YzEwS20xREp3YStaZlgvckxSdStMWGxX?=
 =?utf-8?B?V3l6M054bGhtcStvMG1Zb0lad1k4N1RBNEtjcEhQV0hFZFJQMFhoeDlyYkZr?=
 =?utf-8?B?MGpHLzNNa05kdERlelR2TXRQUmFFVVRLOG83MUNJb056SnJlSXVzVTEvQ0VT?=
 =?utf-8?B?T0taWXdNcWpTWlNna0p6dGp6ckU2NzBPRis1T0JHRC95Y1NIOHlhRFd6R0VF?=
 =?utf-8?B?Tml1YnFEbmU4UFdveStDRWoyT0wvNklSVHJ0MDhqS2x2K1dpMEczZDNiUW9w?=
 =?utf-8?B?eVArd3BZZVpVODBKeUJGcXhmeE9MT0tDazVod2N1SktxM1JZTEJRaWZBSHpN?=
 =?utf-8?B?dHVzZzIrZCtDR21tcWlOMnRDUEZmT3hWUXFCUmZBSTlZY0hmRzlqeldaSHV1?=
 =?utf-8?B?TExKYUdOdWNrUVRsemhYbW9ndGxDaSszaFh2U3VmQWZxR3BQSWlGNXRMRFR1?=
 =?utf-8?B?T0k5QUZFZ0ZMUjc1SFlmMlE1Zi9GZlYxLzB0UC9pNW4yTk1nUUJZK2tTc2F4?=
 =?utf-8?B?V3AzNjRpcXdzUHQvaEhRbWEyUkQxdE1SUlNOVVBBVjQ3TTJUdjNOSVRmcUtv?=
 =?utf-8?B?RVMxelBCN09MZE0zVFM4OFdHczJmZEJzMUhQbnk0R1hwTXd2VllWWUNDRy9W?=
 =?utf-8?B?YnNrb2FqWGFuNVB1Vm03R25VTDNHTGFSZ1hoRGwwVERSYjM1TmdKTUtvdEN5?=
 =?utf-8?B?T1Y0SjNUc04renVxMkc1d2Y3WjFuN3lNT3FtVkJyeEFBa3pXSVhvVkdHR0hK?=
 =?utf-8?B?TmRIQ1N5bS9NOHV3S2NtUjZtTnpTZFUvUHlZTlJYTndaUjlmSEg1aGluR2dl?=
 =?utf-8?B?N2xSbitZWHhtSEFIdmVLRUpWVnVmcnFsaVhWeUFNNmZPNzZoN0NnUStnMkhw?=
 =?utf-8?B?bVR3cm5JWnVrUjRHV1BYR25jM3hwVTExNHlZN2tXdVArUERiVU04cFFNa0V0?=
 =?utf-8?B?T0E2NnhZZWxROHREbzRnOXhSOFVxUXhrMTdHLzVFSE1Sa3lYS0U5UU9xQVNX?=
 =?utf-8?B?OEQ1cHcrSURQYXEvTEgxR3QvTzFkM01HWlNDdk96bmxNOE5ZMlpkQWVacUpE?=
 =?utf-8?B?WVB1OEhTMDk2WS9iUlVtVEpaVUpydzYyMUxvdGl0ZHM1ZENMSStIU2xoTUh5?=
 =?utf-8?B?UFc5UEw4d0ZQWEVQZ3JZRnVWWndqT0MyZ3h1VzFHYUlZbHRMbGQxMHhtNTBh?=
 =?utf-8?B?MGR0V2NuQ0d1QVF1ZzJEUHpvd2dKSy9NSmptZ3BITXg0dzdwcVdKOXV5YlNO?=
 =?utf-8?B?dWNqbFoxQnFXRkdFV0lDZytwM1pVTkV1L2pDbDVYNUcrVWErcnY3L3BXbFRG?=
 =?utf-8?B?VmZyMkFpa1RyNy9mVDZYM1RCUm8rRFZNd2FRZ0ZaWFFiYXZvVmZrQlVDQ2VR?=
 =?utf-8?B?dndnQXRzd2FaUWZWZEhRVGl2M1ZEeEZ1TUhEOWJSS1M0ZEVKOVNBM0s5Q3Uy?=
 =?utf-8?B?a2g3S0VJaFowalhueEgvTTVSNWlQRlBsbVJLYWh3dXN5T2JrcVNwSy9QcWFk?=
 =?utf-8?B?cnJpeUFnVWkwU1B0ZVU5ck9zdmR1N0VTUVlSSkllR3A1ajErVXJKZ3lNNzJs?=
 =?utf-8?B?eGJtZXRqK3pSM09FVXpaaGtKOXY4czdOZUdsVmZodnl6Q0krdWdNZ1YwU2Rl?=
 =?utf-8?Q?OnzsQq2iLUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjI4UVJndkdWRm1zMkJBUGtKYVFrVWpXbVJ2Zlc0ajMxaU50ekNHZ2xQc3dX?=
 =?utf-8?B?ZmY2b0lBT0J5MWw1dnA1Z2lSUlJTVCtTWldvV2lTcFhPM3haVDZLUzZnT2h5?=
 =?utf-8?B?SnkrL2h5VnRqVDBMNksySC9kbXpJdmJLU1ZtMGtMaUNtM0QrbTJHNENlMUQy?=
 =?utf-8?B?a0F5ZnVpTkpIbmVxS1FPbldhWm1wUHVMMTk1cUZRYVpFSy9iRVVtKy8wR1Q5?=
 =?utf-8?B?bEN6YXhmRHUvQVh6ZDhTTG5UWXlFUldQcjZOL2JYSGpoQW1FUWErUVVtTGxz?=
 =?utf-8?B?QW1qNm44ZjN4M2JYbFF5L3ljdE55QkROTGNaMHJZTmkwaFZEWExINnJKVVpB?=
 =?utf-8?B?RHVKWXpjUjlHVzNYdUZkMkpMRC82dHhESzlIWFcxNVBoelFjN1dURll3a3Vr?=
 =?utf-8?B?OEc3UzBraFBwZitOcHRCbnNVMDB4K3hkRGptR2Fxc05FaEEzK0J5RzhneVZK?=
 =?utf-8?B?aFhZcmZrYVppeFlBR0dHZStWMi9pc0VtR2FwbUxoWXhvZStab0I3OGh6ZUpD?=
 =?utf-8?B?RHBqTEMyTXpzTW9BNkVVcm14a0JXNzF2KzBobks4QUxwZXFYOWRQSFE2ckda?=
 =?utf-8?B?VEpCRTFGZzVDdTJYcCtoSmZXVThkTkxsN2lmanNNNGNjYWpEMTN4bWdMdUh4?=
 =?utf-8?B?Z0R5Y3ZNRkxGNjBscW9OVG5Fd3dqRFJhZGRqUEpnR3BnUURxb0FHR0w4aSth?=
 =?utf-8?B?STl4UktTOUZSTHRPd09KakQwSkVYL2ZIRVE2NytmWVhlanVaM3BZOWYzbFUz?=
 =?utf-8?B?VUJQd1prOVM2TEdacGdYc2V2MEZNbnlFa3d1TGlTNEIwYjZhS1NiS1JrenRr?=
 =?utf-8?B?Z1NCV1orWnphS1pDZytCU0hlZWNWajNzY0xqSkJmdVZzajBsQnZhUUNQSlph?=
 =?utf-8?B?REVoTXBZL0hGT2tDZHd1aC9OUjNZNjVHQ3VncUsvcDkzMEpCSFB0TDRoREpl?=
 =?utf-8?B?Ukh6VmVKaE1tc01LQXJxM0VOU1Z0SWw5QTNFdEJoL3hZSTRSUXdTQm5UUkd0?=
 =?utf-8?B?aWpvbWQ3eWFNWWhrait4bHQwRVFIbi9HMHRZUCszaHdCdGxsM283akdQbkZ6?=
 =?utf-8?B?T3VnV2s3YTZxQjVNb24vNlJxaFd5ZEp2azRoY3R0S1ZLbVpDWStXWnJrUjgr?=
 =?utf-8?B?YVpVai9scWhaS1NZVlZ2aTJwK3h6bXRjdmdmRm9LaGw3cmVYVEJpcUR2dWY4?=
 =?utf-8?B?R0xkVnBPT2lpYWxrTzU5WU9WNkdNV1p1QVlhc2xnMUdwcjRURTIrTkQ1NDZr?=
 =?utf-8?B?L0lsY3g3ZmNqVXRic0wxMzc0RzRIc1hQQldDTDhpbzJIZmJjbUl2Wk5ab2Rt?=
 =?utf-8?B?Z3dERlJCdmNiQ2xRSTRYNmI5K1g1MWFESUhhYmxCUnRmU3l2cVp4QTZSeERL?=
 =?utf-8?B?SjJHeEVPUmtEcHJqcmZNL1pycTU5OHd5Rm5qeU9QbnV2cEcvakN6bTJNdzl1?=
 =?utf-8?B?SStyMnhCY05DTU5pdlRwc0drMktrT3ZmdkRWU1NKZm1kSy9aUzZ5Y0hBRnVO?=
 =?utf-8?B?NS90L25IcjFwV1kxM1F1ZlA0ZXZGMkxGZ3BKM2ZoZ01uR0hqYW54RnVEcHMz?=
 =?utf-8?B?bmg2OS9DRTdMT3RYOWF5WEM4SGtOc2hNN1dlaDQ1UkY3RXpxeEdFMGFpM0Fu?=
 =?utf-8?B?Umlid1hhZnlLWlBtK3FtZVlOY2FUc3hEZ25jQ2hERld6VUxud25jVU5DVFZq?=
 =?utf-8?B?Tmt3eFZaclV4d0pFYUJiMHAxR3BhSGh4TFc1NlVybDdXd24waHdUL0N2cFJ4?=
 =?utf-8?B?QTNCcVYyeXUweTZXVjZzSUlObHJkVkJGMEpaUDBIVVR2a0FOWGsyMXRyMFhG?=
 =?utf-8?B?bEpFN2VXclFZR0FqUU8zVjFLNFlDZTljcTVDc1lLREw5S3EzTFdCaWc0SjEx?=
 =?utf-8?B?cE5Qc2hYU3pITG5oZ09kNmMzQ05MK0l0OTMwWVYxVlBJOGYwUk5TRVV5aXd5?=
 =?utf-8?B?aHRad09zeFh3WVlZeVZIWFVMQVFxU3A4UVBDOFdvTlJvRzNkQWo5Tnd0dUlO?=
 =?utf-8?B?dzlrY2hHYXpsRjBBMExmWTlWUkJVa2EySHNwVjYxYVRtS2EvcjFib0ZZZmRq?=
 =?utf-8?B?OGtQYmthTHdKK1E3TlJBMzNqVmZab2x2TlRUQkt5cVFNOWpkWmY0UEJnbkZy?=
 =?utf-8?B?bVhXUjIvK2tyZ3UzcmVNa0RTZ2lnME1yTTJaRDZrcUhzcUVpTDRyZUpveVN6?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3dce10-0ca1-453a-ee1b-08ddaf144ac5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 09:33:04.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwQg6tVJYIHn/MP3eMqMXDFuGPZ3L8K+sneLgd2inFGuxmdvDeD/wEh1pKj7klgo4twY4DtlIGs4LZIrJiE3jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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


On 19-06-2025 03:26, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>> Extract and print version info of the late binding binary.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 132 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  69 +++++++++++
>>   3 files changed, 203 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 001e526e569a..f71d5825ac5b 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -45,6 +45,129 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +/* Refer to the "Late Bind based Firmware Layout" documentation 
>> entry for details */
>> +static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
>> +                const void *data, size_t size, const char 
>> *manifest_entry)
>
> We'll need to try and make this common between the uc_fw code and this 
> code to reduce duplication, but we can do that as a follow up.

I agree, we should do this as follow up.

>
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    const struct gsc_cpd_header_v2 *header = data;
>> +    const struct gsc_manifest_header *manifest;
>> +    const struct gsc_cpd_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    u32 offset;
>> +    int i;
>> +
>> +    if (fw_id >= MAX_FW_ID)
>> +        return -EINVAL;
>> +    lb_fw = &late_bind->late_bind_fw[fw_id];
>> +
>> +    /* manifest_entry is mandatory */
>> +    xe_assert(xe, manifest_entry);
>> +
>> +    if (size < min_size || header->header_marker != 
>> GSC_CPD_HEADER_MARKER)
>> +        return -ENOENT;
>> +
>> +    if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>> +        drm_err(&xe->drm, "%s late binding fw: Invalid CPD header 
>> length %u!\n",
>> +            fw_id_to_name[lb_fw->id], header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(struct gsc_cpd_entry) 
>> * header->num_of_entries;
>> +    if (size < min_size) {
>> +        drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
>> +            fw_id_to_name[lb_fw->id], size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    /* Look for the manifest first */
>> +    entry = (void *)header + header->header_length;
>> +    for (i = 0; i < header->num_of_entries; i++, entry++)
>> +        if (strcmp(entry->name, manifest_entry) == 0)
>> +            offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>> +
>> +    if (!offset) {
>> +        drm_err(&xe->drm, "%s late binding fw: Failed to find 
>> manifest_entry\n",
>> +            fw_id_to_name[lb_fw->id]);
>> +        return -ENODATA;
>> +    }
>> +
>> +    min_size = offset + sizeof(struct gsc_manifest_header);
>> +    if (size < min_size) {
>> +        drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
>> +            fw_id_to_name[lb_fw->id], size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    manifest = data + offset;
>> +
>> +    lb_fw->version.major = manifest->fw_version.major;
>> +    lb_fw->version.minor = manifest->fw_version.minor;
>> +    lb_fw->version.hotfix = manifest->fw_version.hotfix;
>> +    lb_fw->version.build = manifest->fw_version.build;
>
> not: here you can just do:
>
>     lb_fw->version = manifest->fw_version;
>
> since both variables are of type struct gsc_version.
Ok
>
>> +
>> +    return 0;
>> +}
>> +
>> +/* Refer to the "Late Bind based Firmware Layout" documentation 
>> entry for details */
>> +static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
>
> IMO it'd be cleaner to just pass xe and xe_late_bind_fw, instead of 
> xe_late_bind and fw_id.
> You should also be able to do a lb_fw_to_xe() call if you want with 
> something like:
>
> container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id])
Sure.
>
>> +               const void *data, size_t size, const char *fpt_entry)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    const struct csc_fpt_header *header = data;
>> +    const struct csc_fpt_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    u32 offset;
>> +    int i;
>> +
>> +    if (fw_id >= MAX_FW_ID)
>> +        return -EINVAL;
>> +
>> +    lb_fw = &late_bind->late_bind_fw[fw_id];
>> +
>> +    /* fpt_entry is mandatory */
>> +    xe_assert(xe, fpt_entry);
>> +
>> +    if (size < min_size || header->header_marker != 
>> CSC_FPT_HEADER_MARKER)
>> +        return -ENOENT;
>> +
>> +    if (header->header_length < sizeof(struct csc_fpt_header)) {
>> +        drm_err(&xe->drm, "%s late binding fw: Invalid FPT header 
>> length %u!\n",
>> +            fw_id_to_name[lb_fw->id], header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(struct csc_fpt_entry) 
>> * header->num_of_entries;
>> +    if (size < min_size) {
>> +        drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
>> +            fw_id_to_name[lb_fw->id], size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    /* Look for the manifest first */
>
> Here you're looking for the cpd header, not the manifest.
Ok.
>
>> +    entry = (void *)header + header->header_length;
>> +    for (i = 0; i < header->num_of_entries; i++, entry++)
>> +        if (strcmp(entry->name, fpt_entry) == 0)
>> +            offset = entry->offset;
>> +
>> +    if (!offset) {
>> +        drm_err(&xe->drm, "%s late binding fw: Failed to find 
>> fpt_entry\n",
>> +            fw_id_to_name[lb_fw->id]);
>> +        return -ENODATA;
>> +    }
>> +
>> +    min_size = offset + sizeof(struct gsc_cpd_header_v2);
>> +    if (size < min_size) {
>> +        drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
>> +            fw_id_to_name[lb_fw->id], size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    return parse_cpd_header(late_bind, fw_id, data + offset, size - 
>> offset, "LTES.man");
>> +}
>> +
>>   static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -185,8 +308,15 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>           return -ENODATA;
>>       }
>>   -    lb_fw->payload_size = fw->size;
>> +    ret = parse_lb_layout(late_bind, fw_id, fw->data, fw->size, 
>> "LTES");
>> +    if (ret)
>> +        return ret;
>> +
>> +    drm_info(&xe->drm, "Using %s firmware from %s version %d.%d.%d\n",
>> +         fw_id_to_name[lb_fw->id], lb_fw->blob_path,
>> +         lb_fw->version.major, lb_fw->version.minor, 
>> lb_fw->version.hotfix);
>
> You need to log the build number as well, as that needs to be relevant 
> for this type of headers (we do log it for GSC for example).
I will log build number too.
>
>>   +    lb_fw->payload_size = fw->size;
>>       memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>       release_firmware(fw);
>>       INIT_WORK(&lb_fw->work, late_bind_work);
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index f79f0c0b2c4a..3fc4f350c81f 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>> +#include "xe_uc_fw_abi.h"
>>     #define MAX_PAYLOAD_SIZE (1024 * 4)
>>   @@ -41,6 +42,8 @@ struct xe_late_bind_fw {
>>       size_t payload_size;
>>       /** @late_bind_fw.work: worker to upload latebind blob */
>>       struct work_struct work;
>> +    /** @late_bind_fw.version: late binding blob manifest version */
>> +    struct gsc_version version;
>>   };
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> index 87ade41209d0..13da2ca96817 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> @@ -318,4 +318,73 @@ struct gsc_manifest_header {
>>       u32 exponent_size; /* in dwords */
>>   } __packed;
>>   +/**
>> + * DOC: Late binding Firmware Layout
>> + *
>> + * The Late binding binary starts with FPT header, which contains 
>> locations
>> + * of various partitions of the binary. Here we're interested in 
>> finding out
>> + * manifest version. To the manifest version, we need to locate CPD 
>> header
>> + * one of the entry in CPD header points to manifest header. 
>> Manifest header
>> + * contains the version.
>> + *
>> + *      +================================================+
>> + *      |  FPT Header                                    |
>> + *      +================================================+
>> + *      |  FPT entries[]                                 |
>> + *      |      entry1                                    |
>> + *      |      ...                                       |
>> + *      |      entryX                                    |
>> + *      |          "LTES"                                |
>> + *      |          ...                                   |
>> + *      |          offset >-----------------------------|------o
>> + *      +================================================+ |
>> + * |
>> + *      +================================================+ |
>> + *      |  CPD Header |<-----o
>> + *      +================================================+
>> + *      |  CPD entries[]                                 |
>> + *      |      entry1                                    |
>> + *      |      ...                                       |
>> + *      |      entryX                                    |
>> + *      |          "LTES.man"                            |
>> + *      |           ...                                  |
>> + *      |           offset >----------------------------|------o
>> + *      +================================================+ |
>> + * |
>> + *      +================================================+ |
>> + *      |  Manifest Header |<-----o
>> + *      |      ...                                       |
>> + *      |      FW version                                |
>> + *      |      ...                                       |
>> + *      +================================================+
>> + */
>> +
>> +/* FPT Headers */
>> +struct csc_fpt_header {
>> +    u32 header_marker;
>> +#define CSC_FPT_HEADER_MARKER 0x54504624
>> +    u32 num_of_entries;
>> +    u8 header_version;
>> +    u8 entry_version;
>> +    u8 header_length; /* in bytes */
>> +    u8 flags;
>> +    u16 ticks_to_add;
>> +    u16 tokens_to_add;
>> +    u32 uma_size;
>> +    u32 crc32;
>> +    u16 fitc_major;
>> +    u16 fitc_minor;
>> +    u16 fitc_hotfix;
>> +    u16 fitc_build;
>
> For other headers we grouped the version values in a gsc_version 
> struct. So here instead of the 4 separate versions you could have:
>
> struct gsc_version fitc_version;
>
> Which makes it easier to read as all headers have the same type for 
> the version. We don't read this one though, so not a blocker.

Fine, I will take care of this.

Badal

>
> Daniele
>
>> +} __packed;
>> +
>> +struct csc_fpt_entry {
>> +    u8 name[4]; /* partition name */
>> +    u32 reserved1;
>> +    u32 offset; /* offset from beginning of CSE region */
>> +    u32 length; /* partition length in bytes */
>> +    u32 reserved2[3];
>> +    u32 partition_flags;
>> +} __packed;
>> +
>>   #endif
>
