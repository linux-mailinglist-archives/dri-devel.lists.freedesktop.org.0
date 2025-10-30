Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79DC223FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4110EA2C;
	Thu, 30 Oct 2025 20:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6Wl9sAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A7C10EA29;
 Thu, 30 Oct 2025 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856332; x=1793392332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jxic5jFEGhJhM100pw0DlpUzTQBGQ9B6mWLoKkJ9Z84=;
 b=j6Wl9sADTNy198ux5xG5dLIpgydqTKDftDrS1Iy0IV5HANbHb6bJEq6a
 U5PhXVjJBig/Nor5IhBAwtb4B+WgGfmn4TDLJl4vIOcBF6UnjV6Zx6958
 s3OYhoKdgEe0eGqm/7Sii6JmXDhcN2Wu33D7UMWcqeNeWby4TvScgirMC
 P59J9F4c7dGL1XoUYoOpkjIeYpeXl3BsjQChgD1OjvUTP3e7IzXrqPV7l
 9BhffiT+nhIZxY0NhuZbRLSslmnaEseSObUmDtBTES0aolZgk6FEQf1eE
 9zWHbeI3PvYuOGScN+SE4sRsrpph22wUU/6Z9JenkcJq5+nfZF0lk3ha0 Q==;
X-CSE-ConnectionGUID: ypvp7P/DQWanFKMKW5mmZA==
X-CSE-MsgGUID: zQ6udFFXTSqMmlG74ZTO2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81426725"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81426725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:12 -0700
X-CSE-ConnectionGUID: uxwdLxqtRV6EhP/lgo9qMQ==
X-CSE-MsgGUID: /6TKXUi4TTeUwNjM7/w07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186492583"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkNlaSXhpc0AEv5p0Gp+ix3GZrUHL4CQdJ8DGONOVfxrPgoXP1rHW9AlfQ3s287NKaYYqLZ4ee1KmABAxCcNXjV+sw5Qrfki8Gsobe15xUy9Ywx2iBaaRyGTgMBqa7dIqsxVlFXcL3bB6hwRE4Kpxw1ABp7EZ0/pKFjWhHBPakV/mBIhhc5RfamF22T6lArG5BIGSqdbiR0BvpTAutTKMTsuP0snXStN1T+RrkoyTmftNEtgQMtTAac0f70SsJOW0BjR9Rxza851XgNB6bM9Lt9QE6gJti96EZjYeyswXkrD6z1sFWudda8U+UjMmpKfTJvalv3+/X7I06G6GF6KKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6SDXboVeZ8mdsD48xRqdq6LT6SaL/hVLr6KD1e2QIw=;
 b=RInofc5qeg52WLhHserqf918ThvSh740iJBF3DTz26+AqmZ+OsFHgnAp+RutSVIq3Q1HA3AWPZ0VTWImzd4SUhfUAiKYzoaLcyczSDEg0X7rKa9wg7xAjN+BInwzv6C9Kk6l76yV4bxUgs7B9lE9dUKkuLZ2KlX1S1LFcd6AmQMMf9kb+iZ6ExDHEc8dfuWhDIrlevVWwxakA2VFKvc2+aOP66PPcsDGvf2gUVDdGut8/uJz9mQ6EpMZG9VBTJTVC3+NDDSi2PiSL1W2gNHh4yswjgjHFmU59g+0PdT5fUeaguwHtjWWCLLXppom2P65stCy13J8jSV+Ay/kJOGELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:07 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 01/28] drm/xe/pf: Remove GuC version check for migration
 support
Date: Thu, 30 Oct 2025 21:31:08 +0100
Message-ID: <20251030203135.337696-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aebe37-c663-4a29-8bad-08de17f3654c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWVXaUN2S1U4SGQycFVGaDl0SUJmODJOZVVRdjVZSnFibko1YmNJTlVabUxQ?=
 =?utf-8?B?bTNQM3VzZUt4UWtFZmpRYkk0Mm5wYTR2dzVzVTA3eEd4SWpwMnd6ZjFJTDdU?=
 =?utf-8?B?dGs1Y21IcUw5SDZoUGRPd09XWmdoR3RYeEJ2RkxIU1hpcjRKR2dkZk5JeVp6?=
 =?utf-8?B?VHJwUXlERjQrOVZYSWpaUEh3RkFxekVVaXY0Zlg2N0sxeHhPaDFBMkxuVmxi?=
 =?utf-8?B?eVhxcVBNdkhNcTZkbjR5cWwraEJvZzYvaU5yZmVSZkRHS0tyeXI2eCtydDhB?=
 =?utf-8?B?Y0Y4QzZoOU5PN0hlZ0Y2STBrbjVUQk41dTdOcGgvcGpiQkZYRzBsR2wvTG5Y?=
 =?utf-8?B?dDNicDVxeEtGVmp6cmlTZ25wK2pIU1hhRm9EcTVMWUR1QzJmSGJaUmVRTUwy?=
 =?utf-8?B?WGVsTVJTR0JnZkNtRE8zUVB6bE9LcmpwUWRNSllKL3E5Z0V2OUkrTytvVkxj?=
 =?utf-8?B?SlU5bHJwam9sMmxBaE1rYjdYa1ovc1lsTTN2MlY2VWpuSGVIbG5tVjgzR3NR?=
 =?utf-8?B?aXFXVy9NV2NvOHAvcUdPRmR6QWNZVzRuRU5mSTFCb1pWbXhLWmQ3K3VzeEdj?=
 =?utf-8?B?WEJqYk5JYUNKdVVEN24rajFMNE9tS1drU2pZZjBOaG1NdmtIS1RQYWh5SXlK?=
 =?utf-8?B?UFZoNUVTbTBneHRoT1Y3WlRzOHVkem9aS09aMGROZGNrL1lKR0l6U1V0SDRp?=
 =?utf-8?B?U3p2bDc0WHdoSjdOT0VJMldWL3Z3aHNYL3UxRE05cXJKMERQRmMxT2pvNXBQ?=
 =?utf-8?B?TUF0NDdRbU1FbDZLQmVtMnYwYmlSTGRSck41Zi9aVWo3d0gwZXRuN1dTejF3?=
 =?utf-8?B?ZzlBTmVXWWgvOHpDS0Z5WnN2OENPSVhTTDBJVGVXNFRQWE9IRlZDa0kvTDds?=
 =?utf-8?B?NmpickZZK1NVTitYRWZEUHZjcmczYXZDaXNabm9idkRGTENrQ3NTVkpUaU9p?=
 =?utf-8?B?T3VkRHRrem1zdW9uT3FBK1pJdk5BcnhnR1d3cGt6RjBQdEJROGpkVUtlZjFJ?=
 =?utf-8?B?QlJRNC9pZDdJa2ZTL2pINmpVU3hjL0VyRjgrbEp4eWhvSkN4dU4wNmpJWCti?=
 =?utf-8?B?L01VRVh3UTZJUVRSaDNmRDhENzBxV1dqN3oyUmxBdUxMMUlzOVYwNmIxcmlU?=
 =?utf-8?B?TnpZZVBPS0xoUjQwVzFsSzVDd2ZSOEo0Y1UzMGpTQXNtTDlJWVNBK256d3ZQ?=
 =?utf-8?B?Z0RYMkY2bWlTc3czVjNIR3UwejFWMmsrakdFbmNuOThKOStXbEVJSHpzaWRj?=
 =?utf-8?B?WWFzU3FWZ0pVYk0zcDdsb2ZLeEc4REZDS3R4UU44QXpCWjI4L2ROdWhJRFJz?=
 =?utf-8?B?Und4QkcxOGdtM2lvQXltQmFwWVI1UVUvRkJqMHN3eHJVWEZuR083L3Y4NzAr?=
 =?utf-8?B?dHdDei9EVjQ3KzRqb1U5bWYxZkNiSlBFc3RvOE5RSGxYOXVuNzZMSUlzNW4z?=
 =?utf-8?B?NFMyTFFXd1VoQ3ExcEdZWjh5bEk1bkl0WjhSZ3AvcWxvM2U5L1RQbGlxU25C?=
 =?utf-8?B?RmJXMDNLZWJoVzZLajNjL0pLdVhVNkxIdDA1RWxZME1LQWhoNnhTWUtYTWsw?=
 =?utf-8?B?WjhpZWt4Vno3a1lVY2tNQWtRdUZVVkVqbnpyOU5HQ3JHeG8yV29hcFp4aXJo?=
 =?utf-8?B?c0h4OUc3aC91ZHI2cjIxSldIKzZoTTZ0QWY2SDJXTnhFQjUxenMwTXRvanZC?=
 =?utf-8?B?a0ZFTElxbzNGc1dWR3BMWjByZ2J5bGp2M044SXVzUFZIcVNqZlhMSHNENFRy?=
 =?utf-8?B?R0tCb3NUbTVJQlJNUzNhSGY2SXR5L2NRUnVGajNWWVBRT3VjMFJuUHVuOTFB?=
 =?utf-8?B?bC9Rc2QrSjZRc2RhNWlEWlFCVFlOMHRScVBFQ3RldTZUSVluU05rUnh0RGY5?=
 =?utf-8?B?aWc5VDZvajBKVUVjanVNR3hpSjBDNmVuaktkZnNORUI4cU00d2FnRGNra0FR?=
 =?utf-8?B?RUF2c2VuL3ZjZmc0bTI3T2dwaGdaR1JyMDBxbTdtb3BSZmR3TSsxeE5peVFv?=
 =?utf-8?Q?YEx8s/DhjhgnaYv2ti5dt2gD7qrMkE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2h5OVQ3R0JEOGgxME40MEd1SUF0K2VRUjE3ZDZNYWg0bmdrYkVZd3RBWFNH?=
 =?utf-8?B?N00xVXBMTVRmWlV0b2dLalMwL2NIM2czTUN2dGY0T2tlc3FJMjdqOE9tczFl?=
 =?utf-8?B?VWJ0akZITS84RG5mcmVXZ3FjUU5mWUcxczJ1MTJSVUg3Yy94bnlSSmV0S0JB?=
 =?utf-8?B?L05RZTNpeitUdUxaaTdpQlNUeGpoMVJ0cGJoNGFuOTJCd3hzRU0xclRFQ1lF?=
 =?utf-8?B?ODZwOVRXeklsZVppYlp6Tm4xS3cwb3N5dmJUcDNBUkc2a1dOZ0NYb3BxN0Ri?=
 =?utf-8?B?ZnBGU0plMXlFeE5OVWpkSjVnS1Y2eXE4b1pjczdZbWJoZXFrYnZmcUlmRnhL?=
 =?utf-8?B?cVJsajVjSmpOS0JCeEdMOGhFRlNGQ0orekFqYjN1RXNIWStlRU1rODFlcG5q?=
 =?utf-8?B?akQ3MUlyNlJPN284L1dRSHhlZFRFMG9rUVFUZnBKYlMxcUdteGpnNGxVY2xE?=
 =?utf-8?B?YTJ1anVwU3BjM1JPVVpWL04yT1B3NUxONkt0ejdYaDRKTlduaGhCb1RmYkJG?=
 =?utf-8?B?SU95RVFIWnpiZHV4RjN1ZXNpRUF4VjVta0ExTnBxZVA2UHVPV3N1NE5Ia2FU?=
 =?utf-8?B?RGNadTVTallKRTJ5TlZrTGd5YkZsVEFBdzg5UnFKR3dwYmdtQXB2TCtYaG0y?=
 =?utf-8?B?MExlUENRYlZHVW4xSElRY1hFL0lpZElpNXNkMVJVZU9DZmpDUXVsTWt5d1hL?=
 =?utf-8?B?R2EzN1gybkZ4K3dxcEhacmtQQk9vRncwSDBGNDRqeVJtRjJzUTB0clc2OU1M?=
 =?utf-8?B?WW5nRVM5a095V0xVajRSWGhOdzNnK2kweFg3eE9vMHJrdFpHS2FIaEdyaUI4?=
 =?utf-8?B?VkhJbGVEb2MxeGE1eEJqbzMvT2FlM3BZL0NwaS9Fb2FNZEdvU3FCNUVZWlpQ?=
 =?utf-8?B?RFlxd3E2dGFNS3JIV1pyMHFsUUgxSXFNdHZKdVRaMGg1ajdUNFcxbVBLVFhY?=
 =?utf-8?B?RzhiazRMQkorbFR2SGVTRlN1UFBrYlFObjdFaWFiaU5PaDVIT0doRThJaFp0?=
 =?utf-8?B?aXVHZXB4aE1XdmFjL3FpRGJqY3Y0WDlkb2lVemhra2d6NUptd3lQcDF2MVQ3?=
 =?utf-8?B?ZlpoZjNBbXJiZ2lKK1FhYnZZb0FpRDkwNUozTnZjQjl5YVZVWVV5Tkwrck4w?=
 =?utf-8?B?c1cwZ2k4RXNmZ1c5bStSVjRxb3BUcnMxei9rMC9QejZYVG5LNi9hWTJzUUlv?=
 =?utf-8?B?U3FsemdPRDY0M0dpTVk5cUpzaWQ4MlVhZWpPUXhTSy90WXJ6Wk4vUVByV0RX?=
 =?utf-8?B?bklXcGs4bnFLVkRDMlVBNkUxTXB0ZHB2SVE4SjJUTEQvQ0lkWElHTFU5Y0xE?=
 =?utf-8?B?RmptMk9ZZFZaQ1JreW9CZDZ5YTU4a2dReDdTczRwZ0s4Y2xZaXZGM2lXenpK?=
 =?utf-8?B?V1ROUWg2REtlQ1FRUGNkdVBRd2F3ckl6YjF5TkFHQ25udy9tc0pUMXFFemNC?=
 =?utf-8?B?ODU4ZUlvM3dFMDduMHNoZXdZYi80UzZzM2hvOUhBMHZETTVibUJxUURYVTBz?=
 =?utf-8?B?bHhaSjd3OTVFSnB0Z2FydmdhY0lxK0NTc1crMFFLMkNQby9OQm05WDNKdjUx?=
 =?utf-8?B?MGJ6Mmx5SU1NY2YrK3o1aUVwbThPQ1kzYmRtYXo2RThOY3RXYUozSCtELzZj?=
 =?utf-8?B?ODBDck9FNjVxdkRjMlJXdTYvOXI1UkUyV0NtVm9FOVNpZ3JkMlBKRVU2RWxU?=
 =?utf-8?B?R2JCMTlUMWRpMUdRbFVxd3ArdmkxcTRoU0tyaytBdmVjRGJFcnNmeXZvRC9E?=
 =?utf-8?B?a2NHMXc1eUhMVzlvSHRRY2M0QXExWXl4VHFlTCtGUUphN2FUaUdTNEFBRjA4?=
 =?utf-8?B?T0RYMnNnTi9SUnhZRjFGTS91WlhnMFlhWmxXVXpKZ0ljY2N6K1MvcXVGaVFs?=
 =?utf-8?B?OFF3aTdOTWNzUE5vMUVZaDBTMzllbFJiSlFHd0ZqblZXVEd3RmhNWFpmeFdD?=
 =?utf-8?B?YUNBUlptMEZld2dHdHFnNUI4UFBOaDRxcWxqc0JyUmtKQVdHRUVBeGtRRnc0?=
 =?utf-8?B?eDdHcjFJckhJL2VNd1JhejFlVUwySDlnYmtLd0FVWFZqdHNrR3VHSGVXSW5N?=
 =?utf-8?B?VUt5YXRocEt4UHZWRzlTZ1NnUjJSM2lmYkNSb0dzSzJEOUVFUVpseVZQSCsr?=
 =?utf-8?B?QXhTdXM4Z2crMldlYWI1ZHQzWmhCTkxqWUxuRDltUGxkNXhTRStYMHJiTnhw?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aebe37-c663-4a29-8bad-08de17f3654c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:07.8654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKiw9O8YMt8EbHvxyRm9TdHCEIuKXCUUE+pz7msTLfCQ3toJvQz6gAJLh6b1jWTbLEAicJzBbNMsg5UiKu1iz4r50dmlXQ+uzqipwZXTEdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
version to v70.29.2"), the minimum GuC version required by the driver
is v70.29.2, which should already include everything that we need for
migration.
Remove the version check.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 44cc612b0a752..a5bf327ef8889 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
-	/* GuC 70.25 with save/restore v2 is required */
-	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
-
 	/* XXX: for now this is for feature enabling only */
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
-- 
2.50.1

