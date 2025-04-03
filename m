Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF2A79A24
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 04:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DB810E1E3;
	Thu,  3 Apr 2025 02:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+i8StvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E108910E1E3;
 Thu,  3 Apr 2025 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743648557; x=1775184557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4munLyGYPUvpQhRulZJ/Eph31nhR280SrBFZe/FtwUM=;
 b=l+i8StvHukPnzFWNXFy3y00mxjGpsZ358lKvkgapJRb/F4sP+wIs9d7O
 +7EfMLWo3znUuZsKmuNRJJcCcS6WAE0nKDlry8iXhZhsSlSVu87AbKkT6
 +wJxlvqfSpuTwNTCpxRuGaIt60MOos4WftaUTAd1sHGm1CMP9BdbIfv7U
 LFDz2ds0LWV6PQZjgpIE4Tr4ebw171mamhK/+HqDWFtjpchpnsFy7fccc
 qT72l2MvE4wrdeoEFrXSgFsiIbxFPaMqZj7tOgKd7LOAQUwZciBNepO1I
 NyLM3pOocM8pd5qirZxL6YN/dBn8YX1d2JdQRg8/jrZMSVBazf9g0ilFo A==;
X-CSE-ConnectionGUID: cJTCjJQVQmyhSuw5LdZg9Q==
X-CSE-MsgGUID: JI2J4X2ARemOlYZEq4MR6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70405388"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="70405388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 19:48:10 -0700
X-CSE-ConnectionGUID: Qr3Aow1PRky97R0T0fm7Mw==
X-CSE-MsgGUID: 4xd4iQvMSl+88Lgw44iCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131002634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 19:46:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 19:46:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 19:46:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 19:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh8C0fWMw9R9+EQoNSPjq5HsYEhfyEWPZFXdYkKqpW1RaIrWuhEkQhcHwb9UN8ApRri3d+SVJv3iHZ+4TN9zNM/OQohiBrbmNzJvcwV6f+laKZ5I/DWC++xJa3uT40ZLTwn6DqDTI8pEEVzKIHwrZJ9al4iEwEbcCbcjlHzjLKdBVJOVAT28/kkXJN8QPucPeUJDap0bwue4RS7DFu5pdxcO7Ki8i9no/FUpR6yH/NiIckq9Fp0TAQVz3+KDMxoMC3W8iqIWVTd5m7Kq6v1MRoVz4H4hgX1NSnLHpqq64nFPys6cpSMG5wL35vxYcr/1v1XYgGQcqCCYskygsID44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m52E4QCHZVt1bltOnZc2WUVupGeB+qeqbsh2E5xzGXM=;
 b=bCGDTtMSpQ07dCeA4A7XmqgoHhzD2SOOOt8D3TbQoe8uu2ViROc9ooBOgaHEP7KyGZgVr9lmUSPrKu+Ks3w2U5+7vCN4aDia4NsXvvWco1zy+SVIqZiFOQXdQ6s8dC185SKcUNrcoga25G1kEfpHjxftnLOqYWLEBKUV35atHWJa1ELDM3DqyFEa+BXBBP/my6txB/3vozE4cps+5FKRRCveaJs/ozQTJJmyYOPcYLr4I1rFIWv8FxiwDbnLiTFe2qRy8vzOC7gxxOumHPFIuAObdShMUcLgqY00fVQy6KzJq7ZogiKgZfbYBp4ychlpfxIdSCepPDB//dZ+r6G19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 01:19:45 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 01:19:45 +0000
Message-ID: <9070c25f-3640-4bf1-94fb-d333cccf1f26@intel.com>
Date: Wed, 2 Apr 2025 18:19:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>, <ivan.briano@intel.com>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250401222657.78545-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|CY5PR11MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6f4c33-b7c4-4f33-43e9-08dd724d9e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1dQN2ZBYS9hTU5RQ3A0K3NZdFBnVk5LR082aGtFcHA0RWg2cGdpSkwzbW14?=
 =?utf-8?B?elpoQ1pXUmlucFh1OFJNZ25ib0tjdXRXS2VXTEc3SkNBSFJGRUc0TzJ1eUhC?=
 =?utf-8?B?ZVJXRllxeHA0TzNvMmpjNXhkQTQ5UlhRL1QvSjhzYTg5Tm1sL041ZDRKalY0?=
 =?utf-8?B?WWhNNE51bzY2bEJHT1pvc2c3NmFWdEVnaCtSM3poSVRoU0p6QkRxUGl3M0Ux?=
 =?utf-8?B?NjBSdXRJQTZOOCtpMHpCcmlBcjZtd1JyMVlLVXBHNWJlZmlaZGN2RU5YV05W?=
 =?utf-8?B?SXAzVWUyUUFxOGVNRk5Lc0VVVDB3MVhiMUoyMGZDeTZacDZBWkdwYVlBcHQ3?=
 =?utf-8?B?VmszbmRLbHpxbjBtalZWS2p5ck41N2pGNDBhL1NjcFF5L21EY09lSmgwd2Iz?=
 =?utf-8?B?UzdqZDdlZTdZSHBLNmVrWlU1UzVZRkVGRXQ5ajB0cWdqVjFSQjYzbU1SK0J0?=
 =?utf-8?B?Lysvc1A4dklpaEZpeGNvVzVOTXlLendXMVhhekEvZFdMUGRNQXJ1Q3BIRGxy?=
 =?utf-8?B?QnlSRmlEL0ZiK3YwcFA3Y2RiMnpFQVJvYUZFYVFPNElKaWJpVE1TZjh6a285?=
 =?utf-8?B?YTNDZ1ZhRmljbGQ1R3lCTW1lRkNDL1YrNmh5SkFocUF5dmhQL3lUUWZMV29G?=
 =?utf-8?B?b3h3MkE1TzVpak9wQVpweklFbzZJbXZnNHBDZ2JGTERmS1ROL1crVTRXbVVj?=
 =?utf-8?B?b1JETnB6M1JPVGF4UFU4VHNXZVhZOXVmRGdVNWxuNnJRZmhuQVN3U0xnZXE2?=
 =?utf-8?B?MU0yUHlWVm5xT3hlcDE3NTNxenpFOG9jK1hQY2dFemYyTGZKRUVnYmVnSC9H?=
 =?utf-8?B?SktxN2dKL1VaY3VwYmRqa21mbmNhZlJTbzk2UCt6Y0dPRmFUbDEvbWxRQUM4?=
 =?utf-8?B?UzZHNVdzTk5oKys5ZDBzaXV6aEZRSGtXNTdhK0J0d1FMQ3lPVTRjMkJlVmxU?=
 =?utf-8?B?cDBia2tOSyt1dmVKSDFiZWdrRHhaU0NKVzNZNEpUWUppTUMrd2liNmVhS01o?=
 =?utf-8?B?eFg5U1I1c3dUbHAvMnZrUjF4ZzQxMXFPd0lpU1JGRzBtbWxoN1JKQzd6cEFI?=
 =?utf-8?B?b2Y0YW81ektRWE9NTk1TRFI3bUk1Ym00cjhaN2t1dkorcGwwc1dzVmJMYnVL?=
 =?utf-8?B?MHBuZCtUOGJuMjE5ZEZxVjVvWjUrL3N0M2ZwSXFwSnN6WkpYSlpRVktQV2Nz?=
 =?utf-8?B?ZVFvdmJFY3ZZdGVpUUpGTE5UYmd2WEV4ZHpHaHNvWjdNRzFNRmNzUXRDNDc5?=
 =?utf-8?B?blV1MFI1ZVVSR2RSTVorNTN2QjAxWnBDWUVQYUpGeC80OG9pWWUzZkpkbi9l?=
 =?utf-8?B?V3YrSTBnWG05Z1VEN2oyZnEyVDlCUmt2SktOQTM5aGgzeUFBbThmQ2lEOTRZ?=
 =?utf-8?B?YVR1a0k3Q1VHVHMwdUp5NUgxTi9IRElYNWw3QzMzdkc2VWpIZXlvVUhHbHNT?=
 =?utf-8?B?cVVJcmtUR29kMjFuUkNQYi8zQWUxZ2p1RmJDNjE3aTZtSWNreWsrMXJIa1JJ?=
 =?utf-8?B?SW9TZ2laQ1MxQVorSXR6REZHcEl5cjV2QTBJNjJVRWV3Y2ZEY2d6WUVDeUpQ?=
 =?utf-8?B?VXMwZ1VpQjJvWDV4cUplekh1YWxIanFhUlZGaDhjb0dUY0dtVndXUWt2RzdU?=
 =?utf-8?B?T3FENlgxOFpDN1ZUaTZTS3hDUkhhMjNXS3hrc0UzNXdiOHQ4T29vOHVOOXUw?=
 =?utf-8?B?RGpjUk0weGxJNjBPeStmaTJyMFFWVG5kc1lId016ak9maTNDNjZqekVCWDZr?=
 =?utf-8?B?WTlhN3hWbC93T0lIdFZHeWs0OFB4Z2RnMXlWY3djdzJqaWY5bXpoL2xnZHZK?=
 =?utf-8?B?d3d6VmhheEVuS2tuZFZ2RmRPOVBrcytKNXEyeWlxNUNxUVF2alFQUEhKWUl3?=
 =?utf-8?Q?1qC39gmfQyney?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVljNmlnaXhNR3F3WGdsMHFwMGdLZXQ0L3hLQXg0Z2tMdUpPTVJXSjRqck5M?=
 =?utf-8?B?LytqTEJQZzRaK3g2OXJQdHJHUXM3YURBSTQ5RFJKWlJTZWhDcHhiL0hpNnNB?=
 =?utf-8?B?SzloVHJaWUwvMTNNNEdlcHZjSjNCaXhZYVVSWEVkeFF5RldlSHFlM1JOK3BE?=
 =?utf-8?B?cCtmUXlSbSt4elBFbjRuZWVIS0lOSWphL3BwTFZwMkk2ZnZlaVVCbnQ0OG1J?=
 =?utf-8?B?UzluRFFwRlVZSjMvQllvWlJLSnpMNzFTUlpMZ2tuVEFBQzFCSkxCOVNjNnRW?=
 =?utf-8?B?QTJHZHBOMys4U0JPcmc2NzFxWVFlbGU3QzJwRG9FTTNzRlE0K3l1Sklhc3dN?=
 =?utf-8?B?K1dwZnplOTI3SDI5UjhFOENua2RhOUs1QXhKTEdqRTBWMDl4UzUwQXFlMCtT?=
 =?utf-8?B?cXhQajhueWxnTUZWSEtsUjBVQ3JuaWwvdTVRVEk0dkdDWFhZM0M5WDdPNTRk?=
 =?utf-8?B?WW1GZjdaa2pEUTVOeW90M2lQUFdnbmF2cVRYR1hQQUp5dUllVGgwQVhtRHQv?=
 =?utf-8?B?UDlSbDJuVUg4MDl3OVlvVmtINktBOHdYNlllcmJjeVBDV0J2S1lrMmx2a04x?=
 =?utf-8?B?V1BzL3laeDF2MGVYT2gyWXhzczNBVlpoQUxvTXFuaWV2Nzg0YUlheE9id3dG?=
 =?utf-8?B?WE1Ga0lWdU5IQytzbTVpVVhodm5uMUhmU01mTHQxTVR0VGVqZkQvRUdFeEx6?=
 =?utf-8?B?ZkZvaUxwWm9KNWxlOVFVbklzM1g3WFdtVFZqUURIVU1LdXBEbmxsN013bnVF?=
 =?utf-8?B?c3RoaFZTM0hPeVZxUDZZaDJ3MG4wMjJJelpFNktaQjNuYUVqU2ZPaEYxWUVh?=
 =?utf-8?B?VVNCa0VVd3ZmK0RUVDRXdU96Zjg4dTJXczlvZXZNaWYzcW5jaWljMW1WeUZ0?=
 =?utf-8?B?Q01YNXZvNkpIblpSZXM3Q3U0Y21vYkFJN0lMZ0d3Nkt0SGVpcFRqSmpxMndl?=
 =?utf-8?B?MVVTSjRZSzhPMytidUk1OXVXc25lNHNwNGMzWm53RjZKSzJWT0pSeGMvY1Zh?=
 =?utf-8?B?QWpZakMxOS9XL3pUUFZSY1BoTDZTY3VyaDd6SC9DSE1hMEQ5WExqN0NuMmZL?=
 =?utf-8?B?QXdnVktzdGp3K1Z5a1VTbWMweUxWL1h5Mm1hTjNSYTB1dUlvNkRicU9DOWRS?=
 =?utf-8?B?Znp6MVpOL2ErZ1N6aUd6Yy9CS1c1dHVCU2REeWpCRTJYcVBIcWtONkhwWlBa?=
 =?utf-8?B?alVJN0hpSjZ1cVRUSGkxT01ib3RtRVB6R1pTczhOTzVIVXVJcXgyVVFpdllT?=
 =?utf-8?B?aFRZdnA0aWlNUW9YcTJSRWhUWmczZnQwRWUwZEkxR2RsSG9CbU9XdW53WUdG?=
 =?utf-8?B?VlkwcG5pWWhhajdJOGZ0cjNWOC9qSGxYd2VNWldWME1Sb2ZnQ0huV3lPdWov?=
 =?utf-8?B?d0RpWFpvdUI3VkhjbzhaaEI2dE1iN3RuRWMyYVJuL0xMMXpWbytsM3VGOWhO?=
 =?utf-8?B?M1JkaTdpK1phSCtLRFVibGJJdkNtVDF4NlhWemRVajlVbXJSNXdlSzBMK29V?=
 =?utf-8?B?dmRBQ2FJa0FjVGpCU01rVlYyVm1uN0E4MkNYWXluQnpkV3NGeUZvZzhCRlBZ?=
 =?utf-8?B?UE1uU1kvWlYwYWtRMTl3cVhZK1VCZTFNQit1d25UUXRiUkxpcGtFcjN5a2Uz?=
 =?utf-8?B?SjBvTW9acDYwVzRlQ3JXcjV0WnM1NFJJWG1mVU5GSXB2V1hDaWt2dzRGNGtC?=
 =?utf-8?B?U2JCOE9TU24raVBJR1VQMmNuMzZ6aVgzSFoyRDRPd2loWEtvelM5Y1ZFekZy?=
 =?utf-8?B?QXZwdGtJckVVMkFzT1JLSHNHbGg0cUI5VnFjb0piVWw5UWJDSW5LM0RkK3I0?=
 =?utf-8?B?V2hORnVXUVkyMmgxSGQ4K01mQlhETlJWeURWUEdnRlhwNWh4V2NDbjVVYnZm?=
 =?utf-8?B?K3ljS2V5TmtONWk4bC9LVVNIbVl0bWs2ZW1wb29ud2ZnVFZDOFROQnFob1pN?=
 =?utf-8?B?K2J6T1BOREluZUlpNTcrNnFBSmJZbnJ4RDcyeHdnd2hKd3YwN1NwRm5nZ3o0?=
 =?utf-8?B?NE9IUWlnOWJaM1luRWk4cXVTOGVVamJRTjB2dUJITnBDVVArQWZ1bVk5V0Vv?=
 =?utf-8?B?QXk4RXMrcVNGRG9mNjJ1cFk1K3hTbmVWcTljdmZ0eW5uWUZLYVVOaU9PaTQr?=
 =?utf-8?B?NVRSbklsa1ZZUUkvc0xxZTV1dGc0Mm8zOUZEOXhaeVZZYmxtMG9VU3F5L1Rk?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6f4c33-b7c4-4f33-43e9-08dd724d9e27
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 01:19:44.9518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyLOqAKmvQCxnnSfJymQMONKA4iFp3mcSiYJta/CELrZVejwS1/QFnB4aVSr4yTe8mVZLIHsDRemPJpvsNRqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
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



On 4/1/25 15:26, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> 
> v3:
> - Remove address type external definitions (Jianxun)
> - Add fault type to xe_drm_fault struct (Jianxun)
> 
> v4:
> - Remove engine class and instance (Ivan)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 75 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 616916985e3f..45f7560879cb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_EXEC
>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>    *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
>   /*
> @@ -102,6 +103,7 @@ extern "C" {
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>   #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>   
>   /* Must be kept compact -- no holes */
>   
> @@ -117,6 +119,7 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1189,6 +1192,78 @@ struct drm_xe_vm_bind {
>   	__u64 reserved[2];
>   };
>   
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
Why are engine class and instance gone? I think we got agreement on not 
reporting class 0x4, but the rest should be kept. If KMD can have these 
in dmesg, why can't we report these in VK report?
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.  This
> + * determines both the VM to get the property of, as well as the property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for the
> + * requested property.  The user is expected here to allocate memory for the
> + * property structure and to provide a pointer to the allocated memory using the
> + * data member.  For some properties, this may be zero, in which case, the
> + * value of the property will be saved to the value member and size will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
> + * providing an invalid size for the given property or if the property data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *

