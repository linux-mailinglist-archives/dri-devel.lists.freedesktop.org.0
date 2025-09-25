Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E87BA1EDD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 01:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553B10E304;
	Thu, 25 Sep 2025 23:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTYPD3Ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC1910E1B5;
 Thu, 25 Sep 2025 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758841685; x=1790377685;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JvYc8f71o9NgyMH849Qsfy8/fnVVMn3LMWX2c7Zeu/k=;
 b=hTYPD3ZeH0yR1c7P5xHMUl6E7creY3ygLoIeguTmLnajCgSY9MQAP1TR
 BicZiL2MuewIncqlIztLFR3RDpPB+8ESOTH6VgOxQKBgZWNvenpe41lBx
 AKE+zEJwChG5r5ccRk8yxeIRM4nRt+ZxJNAS5rnGNgvYoFXK4EphjmO+E
 foEGh+Y8CGAZQY0zwns1u8eMBurS0x9sMD590O8r+LSWeT3R5gjvJxRfA
 iGUtqqg88QmvctHc5Daqrm6b1oRQ3Kgw5D1kX9gGI6fcHYHBgKHICQ1rD
 7HtVvBOex2QtcMn0cTFCvoOUJajPo0NpfmlMPXPI/GcCB0dW/ulbEsMXA g==;
X-CSE-ConnectionGUID: sNLaGwR6R6eAP+wX+p91vw==
X-CSE-MsgGUID: +eRKW3a/RoOmJWdl34ohRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="86617121"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="86617121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:08:04 -0700
X-CSE-ConnectionGUID: 9R1RnvG6SHmvrIq/8Amffw==
X-CSE-MsgGUID: upuVyMJnTJm110cGTrhOsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="214599234"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:08:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:08:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 16:08:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8Kqxrr3Tkanv61QdwJPIuc96mX+fktiaaLYUB4sDefnLn7oBwfJhBL4RFTTcIIUNqqdj3L8GdMEWvzLRFWBmOq6CqBaymxZSODN3rpYcSGXEY4iiox0earycM/jM5VIoEtm0f+lZFwvcL6rBUjT1a0BeSUdQOYxSwUjD9Lcw0q3kj+Sqwvekp+TxXcoYSueTyH2ZYCRXkBFxvxp+zaSKbH6JIRqO2RMXhCWi5SXeNhW+kEKnEi+lrkqjEurfOWhVq1s7BUntVAykKg40yaNYEbiHWXpOurGKDm6dN7jd5o5cn0zl023fMARbtRBOa5g7mhdKBo6fk/hoCuthWbjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ6vYGpC3svdXffwooV2UPsDFklSFHW3qrrqjC+B4hY=;
 b=MMfytG0PGDy68sgy6cFP+N3gZ06/09+RNHpiuVUMBQH0pMYKw5ruISmio1k3+4BfytolNEg68JlZZTw981kP+srZPHYSc//xvtvpd1zVPS+AGACAOmqDgibJhxYaKaSCRb6H68YXJtAaxgu1pvOMZVpxfHR2Exj7V9zKRhs6TkdlW+iTzmgg8y9SQGDM+SrsJe7JRu14wxJ3FuqVsbkIvf9s3iX4xnIv2O9A6ACaIs7kmiTs6m2mLJWpCBK9+JDhBuhYmIxY18wtcK3UKXMA1gBXXK8/+85dFdDFXFZLe2I80I09hFv4i/bO2kK5eTgyQ1bR5dFW6vH17jPxuBX/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 23:07:56 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 23:07:54 +0000
Message-ID: <39062e73-1275-4f4f-ad49-f144b2d5ddc1@intel.com>
Date: Thu, 25 Sep 2025 19:07:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/guc: Skip communication warning on reset in
 progress
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20250916001618.2138901-1-zhanjun.dong@intel.com>
 <83599443-dd90-4c89-acde-989c500e85ee@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <83599443-dd90-4c89-acde-989c500e85ee@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: f0af08b6-5779-46d1-c1b8-08ddfc885bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2NSdzlGTU93dlhNcmpoSjlXZzJUVG9KSXBGUGZvT1d6QVEzWGFITE84YlBC?=
 =?utf-8?B?TThWbzkxYUFkaFl2K1FrMzNCM3g1enZxYTZlRUw1T0ozMVlHRjBKL1NzVGhm?=
 =?utf-8?B?NWFrdHlWUkdTSDRsZGJuMTIxRWdMZDdkSGNzSjMwRGJhTFRQMGNMNGFFMy9u?=
 =?utf-8?B?eHlVeTMvSTZsUFR3QnRoVzAyZjBnT2RFRTVJK29XcThUcWo3L1lpYnp3ZDJF?=
 =?utf-8?B?dXlSTHRaeVhHbGJVTm9UMGJEa3JlY01WK1VCSFpabHVkbHRyN0lFS2tuaDEw?=
 =?utf-8?B?ZnN1TnIxbE1FelVQUGFxVGhiSStTblQ3MmN1elpZTGdmYzE4Nld0bitEQ2hN?=
 =?utf-8?B?bU5tbG1HaE1VM29JY25NNXJESWFQeHBObDg0ajJWV0ZoeTROOWthNThoem9m?=
 =?utf-8?B?SjArZCtYbkdkR0o1ZUk5b3BVMTNEcjNWKzdQNzZWTE9xVFR5bkVtS01TNko2?=
 =?utf-8?B?Ykt0WGxTY29TQnlsL0dxOTV4WVd1dUtDZHZHQkg4TDFoQW1PZHN4TUtveElo?=
 =?utf-8?B?cjN6WElxaWZDVlN5NmNhajVhalFFZVZwNGdRNEhtczIwaStCdnhRTktvRUkw?=
 =?utf-8?B?T0t2ZU90SXJtaFJJLzdKZFAyMit3OWRsMGZnU3RwNnZBM3FUcFBIRFRRM09t?=
 =?utf-8?B?bXF4T1VZTjdnWENkYVRxamp0dFl2T2xsVXFTelNZaDdRQ3pmdkRwV0NyVkx1?=
 =?utf-8?B?WExiQVoyTWlvb2dvSk5ydVZPVjBkRVdGRDd4MmltYkpZZUpYelFsWFBaN08x?=
 =?utf-8?B?UEs0UTkzeWx6UzBDUmhBVDBHcE95WG9SNGY2Zm04V2dodjZad1lrd1Z1U3RL?=
 =?utf-8?B?aHUvN1RhNkRiVC9Uekp6YTkwNFZyMXlwQ2xrMkZTeXhQVmMwdUlWZmVCVnRv?=
 =?utf-8?B?TjJBd1pFd09JZjNicEg4SjhwU3JSYjQ1WStTNDEzZnF3QnFaRjQ5dTRrSkIz?=
 =?utf-8?B?OXBpZHZUbWF5OHFJTWU3dHpmUXFJUDFIOWFKU1lDbHFzUmJvTlFhalh6Mlor?=
 =?utf-8?B?Z2ZWbVhmRi9Fd2toNklrRXhaTlhJRDBHNFNFOW41RkpMK0lEUTNQWFY4UDRK?=
 =?utf-8?B?dVFyMDFxRmR2S3FWQ0lVbWQyVW82UTh1Q2V0ejFIRXJPbEhkTUpYbndmSld3?=
 =?utf-8?B?VCswTmZOdms1VENhZlFuemd3cFpRTmY0MW01aEJwWkhFNS9Pci9yQkdma1I4?=
 =?utf-8?B?Nm4vT3lZcTBqM1hvRUhwWGlNNUs5RlVhbXJnU3FEN0Z4d0JEQm84a1JTTSts?=
 =?utf-8?B?L253OFlZRTN1d2lPcmJvSVlackVWVnBOR0daWXZkVXlmOWdpdXZrcFhJYk1l?=
 =?utf-8?B?aVY2UGZxV0ZIaEM2VEV2OTc1a2lEdWxQbDFlNkdKUjRKRmswRGxXMjBmK1NK?=
 =?utf-8?B?L3NhN05KSzB1SFVxM1VONitBbmxmeklYMEhFeEp3czMxbFV6SEZqV0NoZ0pl?=
 =?utf-8?B?UnZtSk8vV1FLT216K0poV3hIUlJkQXI1V0hvNHl4YWdrMjFJYjJpRkh2N2th?=
 =?utf-8?B?Q1FUWFUrVlQ0U3NoVytvVjFmNFNLVUZUdDdkb0JzLytyL05haHBqR1FzOXkw?=
 =?utf-8?B?cm02V2sxYndtMXFrT0xVeWJpc2tISmJUN3VlVmdsaHpvVzFkeVdRRDB0eG5Y?=
 =?utf-8?B?VDZabE5hdkt5QUhxUzVYYjUxOTl1QWVIa3V5emNKY0RpeE53OVEvQmFuZm1z?=
 =?utf-8?B?Vno4Z0g4NkZPVDd6aTl3UXQ1Snp6bXkvWGd0bmx4R3pYYkpWOUREUWtBS29y?=
 =?utf-8?B?ay9JREphZW1iTjlIYmJId3lZaGxmeGZicmVSWkdESWdBZGVQR3R0SkZpZnV2?=
 =?utf-8?B?SldhdmRlZkNQbUVnWHU2ZkRUWGxXM1lFeElzVmhRTzc4cGFpMjRiSC92SEQr?=
 =?utf-8?Q?8M4yezt2cxhvU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1IyRVFKbXB0YjRnWlllUVJmaDIvb00yVVd3OTRuSEVrODVsZzllcCtuT2hL?=
 =?utf-8?B?Mzh0eXdDVklMc2srQ3NjV2diN2VWTjlWcFFva1NoNzllRU1EWmxLbi9zbS9p?=
 =?utf-8?B?dm03ZGRhenJGNmVsWXp6UkpLaGRPM2pjeUlvcVNsNDRnU1B5blU3cS9rRDZk?=
 =?utf-8?B?QnU2QkNHdlF1cW84eWhZY01lVEtIZ2NVZlVZd01SRnJ6VXNZUW9RY2wyWUJp?=
 =?utf-8?B?emI5d1h1ZlYrMG03Nk5rTGM4VzZhZjlNRVlBMi9aTHJTWHlWdkEvZW03STZN?=
 =?utf-8?B?TnJnYkdDWWFvRW9ZeGlPUEVVZndaTVRiRklucVl4M3BEVTdlOU1mNVoxakV0?=
 =?utf-8?B?VDJoMEk2TGVIaEFwbldiU25lZkNLOUo0a2xtR2d1VDA4WEpEQTl2cExYRWhO?=
 =?utf-8?B?N0NVTEQybkRyaURIbmtnbFZ1STZrbGUyYTVIYjl2TVBERWdOSGpEcTJRSytP?=
 =?utf-8?B?eFZIcVNkUXZRWFZLTHFwbWFYbDlMQTlFN2FwUUkxemVYSVhSZDcxU2xmSHJu?=
 =?utf-8?B?OHVCWHBTT0RsbGVYWUJLdHZKQjV1czVlcjc1SVovZWtIOXE0M3lmUEkvK2xN?=
 =?utf-8?B?c0JySmR2QnI3bW9zMFVNQXVxaUFUbUhUaHFvZ0dQUUtFdWVPcTBqaTRxUDlE?=
 =?utf-8?B?ci8zOGt2cHV4TUt6TTVsSVR5aUNyeFBJMkZWYUJhN0NBVytod1dJQjBvLy8v?=
 =?utf-8?B?aTU5RnpMenhaMzM1bzZha2VCbWZLWkpjWW1TVm5HTGFTSy8yM1FTZnBiYlh1?=
 =?utf-8?B?Z1ZQUmtNelhHQ0hOUUV1NUM0SjN6aEVmVEUrQjVMblBUUi91aFNiQnBTaTBs?=
 =?utf-8?B?djE1R2FwWUxJeWUxYTFWNTQ2YzRGLzRsclpRaE83eFE1MUcrdlZGWlIxOFhP?=
 =?utf-8?B?NGg3VVVYbkdaZlZ3RDhkdWpQOXdOeGl3TnFmSjE4TTNLb2VZTGlHcVpIUFVQ?=
 =?utf-8?B?VFpzZGpUTkhkREs1T1B4SEJFT21pUVJwWm9LaXlQd3BzaGpsZUkwQWhnVTR0?=
 =?utf-8?B?bFRCanlrVjkrdVp0aktwb2ZWRWs0MGNPQ3NPci93LzRYMVpyT1hmK2Rqcmhs?=
 =?utf-8?B?Y1oxbGhxMWdXSkdlbDJCZFZtN3JHUDdPT3J6SjJ5SFZyOU15b2YxeFdyamps?=
 =?utf-8?B?cENVb2labENDczdEVndieWs1TVh0TitxYk80S3FKc05EZk0wZFg5bmJia08w?=
 =?utf-8?B?MG8yUU9wSjh1Y1ZyOVlqOGFKUWtPeVJzQ25uNDAwdDN0UnR0ZTFoU0d3YjRL?=
 =?utf-8?B?WUNRWncyckdFeG9VdnBjcmVONEtxQXkxYloraGVvMHNRZ0FBN01lRkdKWjNw?=
 =?utf-8?B?eHJmdHRxYWNNSndXejZ1bmhCaElYRjg2QkR4SitPMld3MnJLNFZFdk5iYnhJ?=
 =?utf-8?B?TkRyYk9XN1o3MkpFRXMrRXN3NnJGZHBqRGI4VHZ6bHFZcjN6U1pMNEdZZytB?=
 =?utf-8?B?eEVNenpJdEM1RDg5V2h5TlN5QW5Ubzh1OWFleEFqV2xDWHFhek9oajlQMFZZ?=
 =?utf-8?B?WEdyNERIcU1tMkNET1AwZ3Y5Z2IyNUZnRENCVlBhK01maU4vWDJ0aWUvWDNR?=
 =?utf-8?B?Y1VRWGtUeG82MWNFSkxSTjRyYTBOZmwvbVJ2NmxqaVdpbXlldm5QeWV1bUVF?=
 =?utf-8?B?ODRzUTJ1eVM5YnRFOXphSnRxTUJseEF2RjhZeE5HWW15UzRMSnNKNWp6d1Fr?=
 =?utf-8?B?d3ZxZTZTY0VZTTVjY0FBSTBNTmRRVFpEam1hMFcyOStJV1ZuNnRJa2ZOc1pB?=
 =?utf-8?B?N21zQ0ZUYTBQblc5T3BodEVoaUc4TjFaWVZZMC9vOGNOMGptdlBxZ1d3Y0s4?=
 =?utf-8?B?NDBYQS9uU0FGbHFmd3d3VGdZSjREejFTWjlIK09tNFR6WlVOek9kV0hBQVoz?=
 =?utf-8?B?M1AxMTRDS0pwU1pHTG9mUTBNVVRlYWN6R2VnTWVpVmRDQWQwMkoxd2FBREQy?=
 =?utf-8?B?d0NiSkd6ejBqSk9oejl0YzBKcFRUS1Vhc1ZoMU8zRlVPcEh5bzdjeElDSGty?=
 =?utf-8?B?b1huTXlwalBQOWdycW5ZUDdLajV6dDU1dVFyT29DTzhzVnNtUktBWmFQUkhE?=
 =?utf-8?B?eHZ4RE44SnZTUFVDOGNrMCtIRDVLVkRwNE4vdjRheitIaThhSXE1dER6L0VC?=
 =?utf-8?B?MTF0T2t5OE03Y29uRHdsUWJXRzdWdno4YkpHRGpuNmV3TXR5NVRHZjBrSVBQ?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0af08b6-5779-46d1-c1b8-08ddfc885bd1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 23:07:54.5285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVTBnqw2gb0W3Zv888SrapOcW2yuM4hBz3T1uuhFKCaJaerOPa3xcPFJqJnkg4UjC2dUGZ0laZUOqiPq/qhxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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



On 2025-09-25 11:55 a.m., Belgaumkar, Vinay wrote:
> 
> On 9/15/2025 5:16 PM, Zhanjun Dong wrote:
>> GuC IRQ and tasklet handler receive just single G2H message, and let 
>> other
>> messages to be received from next tasklet. During this chained tasklet
>> process, if reset process started, communication will be disabled.
>> Skip warning for this condition.
>>
>> Fixes: 65dd4ed0f4e1 ("drm/i915/guc: Don't receive all G2H messages in 
>> irq handler")
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> History:
>> v3: Add skip on interrupt disabled case
>> v2: Update subject text, removed fixup
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/ 
>> drm/i915/gt/uc/intel_guc_ct.c
>> index 3e7e5badcc2b..78308ff00d68 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -1325,9 +1325,15 @@ static int ct_receive(struct intel_guc_ct *ct)
>>   static void ct_try_receive_message(struct intel_guc_ct *ct)
>>   {
>> +    struct intel_guc *guc = ct_to_guc(ct);
>>       int ret;
>> -    if (GEM_WARN_ON(!ct->enabled))
>> +    if (!ct->enabled) {
>> +        GEM_WARN_ON(!guc_to_gt(guc)->uc.reset_in_progress);
>> +        return;
>> +    }
>> +
>> +    if (!guc->interrupts.enabled)
> 
> Is it possible there are some messages in the CT buffer even though 
> interrupts are disabled?
> 
> Thanks,
> 
> Vinay.

Yes, that is exactly the issue condition, more than 1 messages in CTB, 
tasklet process single message a time and trigger next tasklet to 
continue, during this chained process, it is possible that interrupt 
becomes disabled, like gt reset process started after a timeout event.

Regards,
Zhanjun Dong
> 
>>           return;
>>       ret = ct_receive(ct);

