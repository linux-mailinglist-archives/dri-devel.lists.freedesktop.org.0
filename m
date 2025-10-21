Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF6BF9127
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF9F10E648;
	Tue, 21 Oct 2025 22:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZYbT7x0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE5410E648;
 Tue, 21 Oct 2025 22:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086541; x=1792622541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jxic5jFEGhJhM100pw0DlpUzTQBGQ9B6mWLoKkJ9Z84=;
 b=gZYbT7x0dCVeK3/4O8RwOr1ZfvA9UCdl3p2Aubx4zRXaENXwRWVKfyAC
 pIjog/b9tVwSAWQvCtjz55tUDbl8vANmeGdS3sGJmMo6fZBoRlHC0//zY
 /86MgzSSUT+amfAPysc2rPICR+sBxiuk0b6I8W+95vIYvz8x8MJlZQp80
 es1+fvTUw4QZWLaZi/I0H7JoxcI0fNn9F5xnrWQIPFNEzQePhdo//CDb1
 QxMkwxmCzy19SZG+oWwRZ75D4f90xvwyQijT1ncF2O5L8vlWp1SQ2W2cr
 i6WGTAlhgcH8y2GXRFRmXb3CbMGfxHmmr81xisXXlbUycgKl4XR2Twv48 w==;
X-CSE-ConnectionGUID: eSjXexelQ+ykzcwYBXAbxg==
X-CSE-MsgGUID: mPLngebIT8CS5nQz+4noVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63373510"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63373510"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:20 -0700
X-CSE-ConnectionGUID: 8BwoBELvRqqCxmSPs6AmyA==
X-CSE-MsgGUID: Itv3rcbSRE23Fs9FRnxdww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="184110594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:19 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKKYzY2vKPmtZ3ZdzvCGhUeTF2mVu+ZIzpkApeFyrU0yqO4q4RvQ/H1dkEG+67F0PcJ8iOMTZO/eT1hePNyb4x42YXPhvQU3F0f0ZS3uWZDwmN9HKdl9imQYSxf5kAoU6PkJOtDcZKAL3KlK4Cik84sW2J8I+DDgVm0HzPkTDqmmWEzv9FlZR77XIB1SodbZMB9hKgdqY15HcB6RGmniwZsbFvvFUXAtjNtfSVYL4YtcK8KxO4bth4RaM5c2ZCQbnzBcG0QGyiqXLGNn+TOtxsYYFFB3nSf62EOi1AgrLeJmnJEOOEpXDHNIgN4sxv7UdptwSUUzgj9mbfAsZJnZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6SDXboVeZ8mdsD48xRqdq6LT6SaL/hVLr6KD1e2QIw=;
 b=trlC7uSEeHBcfvVkLVB3kBPs8APBls5LEI/1SipoHyIBzqq81pkvIFtBMP1+IlpfXvCN3VazFiEZKED3TYPCboYACLxS30vbSoVuyzhQMioZv7qtbMoTqLHJ1IBR9dza3TNJJV9Z74ClJA2e8Beiqsf3q+9+2IOSRWYprZzvDvT6cHz+WiiFTjsI2tugfebBCLMXRyd6XGFfEfbWAXnM4l0thC0C56b/qs7AbSodNUQAULKPBPzHBp2j37MT4fm/Bi7D1gnyZ/DwLe+W+TAy0lgnCBYjh+BJtZn9j0uGP49fDMn2E9MnyQBXZi6ZavW4OEgu+gTRxb0OxhjhG65DYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:15 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:15 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 01/26] drm/xe/pf: Remove GuC version check for migration
 support
Date: Wed, 22 Oct 2025 00:41:08 +0200
Message-ID: <20251021224133.577765-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0164.eurprd09.prod.outlook.com
 (2603:10a6:800:120::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d96ea410-ab86-4242-cd16-08de10f31529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0hNQnJmTXpZdmIxWkNGR0dhajMxcFVCczBmMCtQeHhleHFCNEpGNVBMbkc5?=
 =?utf-8?B?WXVSOUJlOFBlOW5UamdZL0VSTmhvdzlIaEtDdHUxSEx5RlRmUkkrOER3ZGdu?=
 =?utf-8?B?aHJvRFJHOE9vWXlYaGoxMGNoMTQ2bFJ0WnErbVdGTlc4OWtkdmtHdDJkZnRO?=
 =?utf-8?B?QzBCYjBFU2xsaE1FK0ZOTzdTY090TXg1dkcveHBpNzNRWWxKVTBiSFZBTTlM?=
 =?utf-8?B?TGNCc3dWNktzdWVmYWYyVjNXVHlYb2tlSmJNZDVoWWlNTnFQMWhPZksxd1Nj?=
 =?utf-8?B?NHg3bEFuS2NVL2NzY1B6QmJleGNjUU1RVGFJMG9QZ3M4WURUaVZWTjA0czNJ?=
 =?utf-8?B?b0lyQktQMWVROEdmdnRKR2hlYUpQS1lyK2l1RmhJZGZxVHJRQkJPNGt3ekh5?=
 =?utf-8?B?QXFBdUhSTWx1aDBJNk02OGVZelE5TUt2RUw3djdGZzd6T0RmcldQVGpuNS9F?=
 =?utf-8?B?eHg4MGUwRmdtbkUvUEJoZEpWRGZOUkdZQUtQMitlTXZES1R3WllXbkJ3S1dE?=
 =?utf-8?B?YzRnY0RTclpMZCtlYUYwVGhwZ1poNWFObXFhamtIQ3pIODRJclVCK2hnKzZ2?=
 =?utf-8?B?Q2tENWVscWpteG4rMDlWamxEcTFWUUlRamZIZGl0Y2dWNnp6YXI4QU1Yd2Rr?=
 =?utf-8?B?eUpBK0J2RXdTbGxQK082cXFIM29na3R1YVA3amRlQzlBd2hSUC8xS2RrNTBS?=
 =?utf-8?B?VkZlNmljdExnOUtHT3g2dzJ0Nm4vN0pBWXNIR2tCQkVuODY2UEhWV2lzdDQ2?=
 =?utf-8?B?SUZ3UnRRcTlIVmNXNVFsNktDeDIwK2c3elZiQU5zWVoyQnNJWi84Y1lRNVBF?=
 =?utf-8?B?MnNRNkNaU05Ed3pDVWNPZmVDeWpoZ2o4enViclpIVUJ4Sk1PTzlaUnQ3QXFn?=
 =?utf-8?B?bWhvc3FRZ1VTWFExY3JQdzlpRW1USVpzTWdqU25Fd0tkMHFQR2Z3SURoUXVK?=
 =?utf-8?B?NVdZYkg4cjVEMjREeldtemNYYjZNZWhjQnlOUUl5WTI3QS9LeHpveElqQm1a?=
 =?utf-8?B?Q2I5ZU11dk0zbUNqZVp6QVMzMEYwMzdoNGRSR1lSM0JIaFRSY0FIVXlNdmVh?=
 =?utf-8?B?Z3Y3ZHpNZUVWUVZ1M2wxc2JYcmFUbkRkVkxIWk5BVklHSHVuaFhIRHJUZVlG?=
 =?utf-8?B?akpmU1F5MmF6S05tSFAvVkJhNkh5YWI0Tm5UV3pwVnZKOFFMVTdtbnRUWnUv?=
 =?utf-8?B?TUUyV3dKeGgybm93QmU0NVp5TTdhZmRFaUNXdjMxbmVxTDBQdFVSUFhGNEFj?=
 =?utf-8?B?bmU0SG1nU0tEN0M2WTlVVkJYWngzNEFrdUtWM2RaYkZ2Z0hyZVRrYll5eWVn?=
 =?utf-8?B?TEcxQW54Y1BLWExJaEVlazdNSjNlRFlOZVIzQVFQSzE2V3ZSSTVUYm9KYm9N?=
 =?utf-8?B?S0h4aEZQbXJOQy9iSGRvOWdDWjFhWXVlYVJYMGZwNGtVQW9nV2ZadnEyK0JP?=
 =?utf-8?B?QW9ZQWU0d05oeit5V3REbHJibjJldWxDelU5MWNKbGEvcGlkcUFzUXkxSVdl?=
 =?utf-8?B?bmtETk8xajZkVjdZOGhQRzJWaTJFYTVJSFhGY3dVS1RSM1p2ZmxsQitHaDhl?=
 =?utf-8?B?R2xLdE14d0NrVFlGUjdGeXB0bDBjWjFnVGM5cGF5VFBWM2h3UW1IYTI4cWs0?=
 =?utf-8?B?R3k0WFNRTkYyTGZiSkNXVFlJeFl4dWFwcEhmeUE5Yk9jNkFNYnFrNGUvV21B?=
 =?utf-8?B?a3VOamtmdEZFVEwxUjZBK2pwZVNnRklmNUJhRWMyNUZOV2J1NzR4UGdyWmxS?=
 =?utf-8?B?M1gwTzF5Mktnc0duMlZ3ZTRKM3JXbGg3c0JYKzFrVTI5amhqZ0ZmVzdkQUh3?=
 =?utf-8?B?a09CZVdIZjl0VkJ2VDUwUzAzNStDanFJSGxzRmRzZUlIOW1QaU1xbnNVVldH?=
 =?utf-8?B?VXl5OXlIVDJXSFQxcC9reURrOU5ZMStrOXdMb3hVMk9Ka055cElxRnFmTlJK?=
 =?utf-8?B?VkQxbjk1N1ZGWS9PWU8wUEx5QlEzcGdVVlJoWkhGc2NFaTYxbFlIZGl4U0Jp?=
 =?utf-8?Q?459YldcGgBtw6JWHR1AfVg/PhOPYwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhvZEdtVktHUzF6V2Z5S1pHWUJtdFF5U1RVYm42QWZmNU5wREkvSUszVW9R?=
 =?utf-8?B?UGVjdjZBMEVDUGFyRGd5dlpudXpYSWhnUGM0c2dVcGtZbG1lN25vUHlzSG45?=
 =?utf-8?B?TThMblhLYjNoSlRlallXN0NITDRkRzhjN1h1Q2FYZitlNGUzVkRXSTZTNDV3?=
 =?utf-8?B?ZmlXR3BUT0VoVjJRWkpnbHpTMS9oU0dLUnJuaWZkYVJDUlFXSEJhTlRsbk1k?=
 =?utf-8?B?ZCsxZSttd294NUE4ekZxaTN1UUFxOVpiejRHVnROenVZQ3NOTDE1SitYVG0z?=
 =?utf-8?B?aVBUNmxFbkQxeWNXS0VsQy9hOWRPT1U1TjFYT2Y0V2hoTUtrRE1telk5eGs2?=
 =?utf-8?B?aVdETHNVZUFMMTJNWTVNZnk3TmQ5YnhhcENBWWsrWEpBSlRJTEMxMzErNFA4?=
 =?utf-8?B?M2pxdWJFK2NFVkRvb1E1Vm9tczl0V29vb3A3Ymx6MHc1WmxPRHF2SGtnOWRX?=
 =?utf-8?B?V2sweGp5TmFLYVZEdlBHTHFwOXl6NUt0YVFmeGQra01TamN6dENXdVErenJz?=
 =?utf-8?B?ekFvVlNKVU1YdmdrbWtpbEtyWmFlanl0KzlpaUdDanVXejZCeG1IRDlLWjRY?=
 =?utf-8?B?YmEweDJONkNVMldvREVCZGNlSE1lWUt4S0dwV0M5d2RNMzJsa25yMHNJVFd0?=
 =?utf-8?B?S1pENlBlTEVPUzhUWEZwZGNFSzVGbldzQk5sTklVMDlYOUJ6TjdaYnpmRXNT?=
 =?utf-8?B?NzAzeXg3RFlXZkl1WUN3dkFqL09mVVNwY1lFei9aRE1JaHQ2ejBlbFJ6anJ1?=
 =?utf-8?B?eG05VmFQM0hLeG8rSEVUa1loSDdvU21XL25HcUowMjJRZjdkTjFkUVNQM0JO?=
 =?utf-8?B?STR1WUNFZDlpUnFqcnJpa1ZPdUl0L3p4eHY5V1RmTEUvaTVFZEtrOUphQjI4?=
 =?utf-8?B?VCtCc0Q2Y0lTS2lYMkRTWEtMUldQOEVkcm4yNGxHVWdqdWdFRmxvRm1HUFlV?=
 =?utf-8?B?RXB1UkpOdS8ybzNNU3pCYjNyM0t1OEh0cURGVjAwTURaRjNlcGFLei8vN3JB?=
 =?utf-8?B?RkFWSnVzM3lpMkpadFM3QWNwR0JROWRjUmJtaWlBeHdkUWp6ZTJXWXRERktW?=
 =?utf-8?B?bEFDNUhzcXlSNk8vVTd4YnNqeXJUQ3pralFnb3J2dVFWVStKVFJRZWVXcUoy?=
 =?utf-8?B?ckNSYXBCcm1PQVB3M01IVDM4Z2F2Slh3aUlWeWxFdmtxelBsSmtNMEZEMlBT?=
 =?utf-8?B?cFF5OFN3eGZIcTRsWGNWMWY1dWF2T1dSQWZOaHN4QTRBRnFXb2dtQWRZc1ZE?=
 =?utf-8?B?NFNsMG9GVHRaQVBiclFUa2F4aVhXdGd1NldrR3lWTFUxdTV4bXQ0OHdoaWtx?=
 =?utf-8?B?YjkxSVZTaWkwT0hxeE9BbGNRdnVxSVgwaFI1Q3pNYWNjN2I0MzJZU0ZaWXF1?=
 =?utf-8?B?TGJrY0w0N0pESHJFdWJyejd2QUVLWlRnYlV1bS9EMG5UbFRlZnhUYlZ3V0gz?=
 =?utf-8?B?YWNnTTFWZWhtMlpXSG1POXl4aU1yWUpMVUNCSnkrdllwUDVoYU9jOWZDWEdo?=
 =?utf-8?B?MU1PRzJRbEQxNFdybEJhRlllZXdUWTFPR0NaV2E3UCtmRC9iZjU2dGU2TFBZ?=
 =?utf-8?B?WXcySkdZWnZnblZ1UHJGSVBYRlhaNGlsRGl2OXRzbHMvOXRIS2lVTlo4L0R4?=
 =?utf-8?B?Ni9jZkFLcUw5bHd4bDU2Q2g4WXNHZ2s1bTR0UnZ0M0s3U00xMko1R1FGbG9j?=
 =?utf-8?B?TnpRN085Wm1qMjdSU3pzejZJQjFydEIzbWhOdHpGT25iRklzYVM4K2pwSW9q?=
 =?utf-8?B?SjNvemtCa1JYZ2NYNVhxY2loMVhOdjh0MjlKbzhOUXRuV1RJeXVpM2ovV09x?=
 =?utf-8?B?VEFXNFdVQm05dkhGaWdYVUlLMzArQXUrdEtJWUREMDVGNmNzcm1LTm1UaXJ6?=
 =?utf-8?B?alpvVGp1SXRMbUJlVG5yYzBxZUg2RjBORXllaWdXb0hBaHJOa3U2L3pDRDJF?=
 =?utf-8?B?ZnpSQmtYVXNWR3Q3em9MUHM2Zks4Z2cyTFVQaEhhekIwWC9tZVN6ZXpCR3NQ?=
 =?utf-8?B?VFVkcHdnU1lNRFdEc2x2b2cxeWwrT3ZyN3EyeGZ5MmxkYUozeVBGTkdVcStY?=
 =?utf-8?B?WS84RVFTODIvVklmVWtvS2RCMUYySHp4UnZmenVYaTAyZDlFN1ZmTThRaVFn?=
 =?utf-8?B?aHUyOEJjenNLZVF6YVFNaDF0a0oxWUxUVDdxVlVqVjcyM3N3S2NKVkd1R0hU?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d96ea410-ab86-4242-cd16-08de10f31529
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:15.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fX5fHFuELnfZiPKcoWEhvLo7WU+zQU3qNYBaII+N7HKaQjdObz3N+8TQtlCdmueM6dgTejazALn/+I2MjIeNb5M/IGcKF31AT/dcMz5CyDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

