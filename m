Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17517CB893B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 11:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC810E5C5;
	Fri, 12 Dec 2025 10:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAz7jrO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834910E14F;
 Fri, 12 Dec 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765534180; x=1797070180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i1UAwEzgiHeT4HYlIVCrigs8D9VVSccUfRwcmyrWVLs=;
 b=TAz7jrO7joVQTkY3SGXk/Qt5RW1cNT2VSpJ82/oewnQvD16bXAKufTXj
 ZBQ2onVQ+eYiHCFsg9072GfPYEIcXVZKZk55TUzbyVzS8lFAuZiFV9Siz
 VLjYurXHkOxfYZoSt4vVYHBdZjaz+VTxCPs3BXtktYJtrc12Ht2gJmDx5
 UuyhbB3w+n1eY7gOFo8yFOCZZn/BACUFsv5NfzKbvfW+M6JIaezI8F53u
 YcBtx/tVQvbsT9VbMxIKfP63mZ9skYBtzFmVouM5y/R2zh0k/W42GNLEg
 LFQRpzzfBdFMSsFBdOgXNmy5zyq/AGzR6/8yDcAt4A/UTRrxEF3eNIs4f Q==;
X-CSE-ConnectionGUID: 0X8IN6mtQv2/k58+Zuaw7g==
X-CSE-MsgGUID: tQKFMkukSe6H9CcCX53SzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67406389"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67406389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:09:40 -0800
X-CSE-ConnectionGUID: 1PQUVXh/TLanGoVvdFdm2A==
X-CSE-MsgGUID: Xkc8/uZuSBm5Y5CPAo03hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="220426263"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:09:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 02:09:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 02:09:39 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 02:09:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFQg7UxIYyzpcYqGLbdvQ7fhY+FDVpWqCO+Hh610vrf9y5QWQ8C7b6juEzow9ZA7p7rgHDdjhxmkFed615/SM1EPhQ9Pkk3U199Apq13xUSVZONMVg71/Cckr4o1yNJpaEJ2j8ZnqR+TdiJq3V1dSAiefSFqgsMc72w56UKnkj8TWjTIj1kfrddMonod1jrV0e68wTDcqk7FQSW9hZqQOBxsJ2lXns6C0z7svvJgpw3LtyWfY16ttaJXAUnBOfu30+OCGF0RHHcWwNctYxST4ylI3JY39XE1dGpr2vh8g9Jrnsy05Wiq6RbTCy4+vgY8pwe0Qo+K522mdcaLAM0FwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/h3sqC5CW1Ze9mKjQgl4D3ZDvSllS8ONjLs+esKtnQ=;
 b=sTS2TawyrkKpfktd85c0yT+Jgou5U8x30IAw8gNIZHMejvXcjUTjzZKItVPzhWO17K/D5DOytXMKHlUYIvMmq8jHadKItsMmMJfEASNykR+BYeHhM1iIY+alP8BZXvjxN8maYgVp3TtSF76Amy50Ol/8S0MG19M21fpPluf2pFVw7+oYQtKoP90URvvsLt+GaBs/UOvKz6haMIBre42jVtq6FzyVt8dZBbn0hLcnsz2uyR2UylEpG2vtkhwiMVXZcjtrLX801Goq0byd6ztY0etU3u4iwEBNa7iK6OerwRoezkohgz6qakIl5q50gfdEzhH5aPPNjiFCVTqYPIKbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB6987.namprd11.prod.outlook.com
 (2603:10b6:930:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 10:09:31 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:09:31 +0000
Message-ID: <3da06082-69fa-4fd1-8692-592e4091af24@intel.com>
Date: Fri, 12 Dec 2025 15:39:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/22] drm/pagemap, drm/xe: Clean up the use of the
 device-private page owner
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>,
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-19-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-19-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: ae474eab-0417-4928-5065-08de39668a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UElrRGF0N01rZkpmbHM4Z1BrVjU3d2RhS0pkTUdrSko4V0IxenQrR3BPQmFB?=
 =?utf-8?B?NzFTM0MwQ09HbUlRVWZXUStNRGlvemhGcm1nTEdWVDU3cDRPODViUDNJL2NT?=
 =?utf-8?B?QWg4VVFDaWtBNk5KSVZQRkxZU0hRMzhmQmlxZndkWnYvRmxZV3RhZHcyMW5O?=
 =?utf-8?B?VjE2QXV5Zy9TMXZMSjZFWHZTWTdrSXpUQ1c3d2R4eWJjYlpZeUNyTjU5bnBn?=
 =?utf-8?B?cmRscVJPMFprK1ZDaG1LN3hrVzNqVEg0YXBjbzZGWmxqbitsNHJSNnl6TVhW?=
 =?utf-8?B?aTRNTmtkVkZ3Rm5aNnF0WmhCaHJxb05wWVhiWVAwOWpyUXFCeFUwdUV0Y1Z1?=
 =?utf-8?B?NStWdTJkZTdiZHFHMHBaOHliMXdPbUdVWlZhUm9DZFpYTnZhSlBVNVNqc3Vl?=
 =?utf-8?B?NjU2OHlFOTZ2akU2dVlUTFFmYnRwVXhPcm5DZXNzc1I0OENXMUxmOE4zQ1FM?=
 =?utf-8?B?WC9QNUU1Qnl6RUwzNEVlOFBzcVJEQmszckplRUVjdkVVYTZQaGNhVHlHcjVP?=
 =?utf-8?B?WkZCald5Q1hzV0xybmM2V0dUeVZvSWRrb0tUVUpQUVZkYy9PQ2k2YXUxM29J?=
 =?utf-8?B?SllINVV6RHV0cnFNcWFKNVpkV1hGUU9NdnUwNStvZ3BPSXVVYm9aREZuNCtk?=
 =?utf-8?B?TE4zWlVUbzRmaFRQQjNLaElBd053a0JaZ3hHd09EcExzTzJsQUhZK2ROaFRB?=
 =?utf-8?B?UWJyVjlKODdocWg0SjR4OE5NV1pWNUhQRVdyODJEN0U2SkoxdHJkRGptaENH?=
 =?utf-8?B?VFMzdUc0djJmcVV4aUN1V3h5U3lyYzdvU0MzZHQvZ29JVUJLYlpRbDk2L3dk?=
 =?utf-8?B?RDBGRXFEelNkTFVPdWxzZDkwZ2pqT1JFODhpK0hwYUlEaVJrVVdJdkFkZmRk?=
 =?utf-8?B?SzF1SUpqZHE3NStLeG1iNStUQTl4Ukp1NXZ5SStsOWIzV1FGL0tXakd0eVNu?=
 =?utf-8?B?V2hGczVOYXdkWVpUWEtDbHJVS0o3MG5zU0x0US9KMXVhMUw3UjExUUR6Q1V2?=
 =?utf-8?B?M3ZDd2tNS1NCUHpqRXkxVFhPdE5KRDk2aHlVQk5JWjdUUnRhU1pRdGhJSG9r?=
 =?utf-8?B?bUxyN29BTXJldXp2UUFKUVRtRW55bC81ZVpVYTRBSHUwTUhVSjR6NTd2TE5w?=
 =?utf-8?B?WFNKeEdyYlpqajJFSktGeXlqWFVtR3BaNElsUGlMSWNyOVVBSTJROXN3cWpS?=
 =?utf-8?B?RUZzQk8zMmo1WUoybkszMVhqU1VKYXBXbzJuT3orK2RiMDRBVW8xVWpodTBF?=
 =?utf-8?B?bGNFZ1JqMWMxd3QrNDhlMm9sRmR0Zzd0eldpZVJ5MkF0TW9Tb2dVdlkwc0ZB?=
 =?utf-8?B?UmxHeXVYb0lpaFBOUWVGVStIZnhjU0hDZmtXOFA1Y2J6UEs1QmhSU2IyUGlp?=
 =?utf-8?B?bk9RYjZNWEJ3OFc2UnM2RnV0VUQ3dGFZOTlMYm56VXFXTTEzMW5RTmcweUNi?=
 =?utf-8?B?ZFpaNXBMV2MzTnVLb05tRHRLaEwxMUl4YmM5UmZiR2F5cWt4VldzWk92VGUr?=
 =?utf-8?B?QW80ck5HcFV5NVl6ZFd2OUtVMzBSVnBpQlVPZThqUWlqc0FLciswMGFCc1RB?=
 =?utf-8?B?WDZ1WEh5N3lKZzB3OEVNQXZPT0NlSTE4VG9TSklFSlZGNlcxTzdaUHdWZElk?=
 =?utf-8?B?Mk9rNS9ick1xNUhkQ0ZISG14S3E1M1dwSXFjamQxUUVwU2NVMThCUXZEUFJh?=
 =?utf-8?B?V0NNNTBkVy9XMzEyTjE2c0pmK08xSFFEWEtoeHpYWXhVQmpDUGhRMmlLNHNt?=
 =?utf-8?B?TUVZa3laeExGdnVFSUdzZHZvd0pGOFZkQ25jSjZXdlZnNXVvWmI0c2dLallq?=
 =?utf-8?B?KzJhUFVvcE1zdFduK0UyY1ZFZnN1bDlpTkpRRWlsVEtOaFk2S213WjN2TWgy?=
 =?utf-8?B?SVp1Umo5VnNJQ2tOTUFFQXBVRDR6TUM2V3dPZ0ROVVZndjdPRk84NUw4VnJ4?=
 =?utf-8?Q?PIXt0AHsUCycWVvcrfY+5HWrpdB5DS9+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RkRHBsQzhreVh1VEI5REhqVWlnazZjTkowbWtzZ2wwaHBod3VRKzFCcy9Y?=
 =?utf-8?B?d1RIVWRHSUJBeU1yNTNYcDF5NitXaEJzRDVBazJuakhXS2JDZy9TZWREdHAx?=
 =?utf-8?B?WU5Ha3pyOU13ZHd1MzJ1ZHRQUzNYZVBSckZpbmlQV0xBdlk4K0VxMzBlL3Bk?=
 =?utf-8?B?QloyOEFUK0RlRGRtK3FJcUN0bGQwenB1V29VSUdyS0hPMUtudWRjMlNMTnpm?=
 =?utf-8?B?NGplWCtpMWRmZ0xZZ2lSdE45NjFnVmE5V0k4L3hVbkVxeFVuMzdzK3JYZnpM?=
 =?utf-8?B?UXIxa2JUN04vYXhnbmNXK0VOM2hZTm8zM2VTVXlVdittOCtsOTUwQmFDYiti?=
 =?utf-8?B?aEVpZkV0MllWOThYTWJxcDFIN2ZOM0QwVWNpaTBPVlJzRlNQMkdiTkJyV1k3?=
 =?utf-8?B?b3EyRW16TWgrSGxhNUpmSzM2ZDlKZnJ3b2h5dURxRkR3M3VrTlVMclNEN1hr?=
 =?utf-8?B?VkY4R1E3c241a1JRTEtqKyt1cHdwYTdGZGZPTkN2UFdNbzdLcXZ0dkVtUjVs?=
 =?utf-8?B?VUlxZS85cGlDdHBjb1pQWVMwWXpJRUlIY2pmODdGUDN6TzJBcFNDN3QxcGtC?=
 =?utf-8?B?RlErOU9xQmsxT2JydjlYencxdTdrbzArMlRMMUNDNWtlRlpTM05XTG9aNDd0?=
 =?utf-8?B?Q2F6REFEamZoVjlaOVQ0RGw0QjFtQW9TNWtOUUdDeDdMS09VWXJJTGQvd1Vk?=
 =?utf-8?B?eUpMWGRjeEUxQ1dXSTdpTHJPSHJqaWtPVkxVbHV3RFd6S2JmcklMbEloSDlV?=
 =?utf-8?B?NldWV28weE81MGtXY0laQWxDTUh2V0plZ0xLU2w2TVRkVEdUQXo1SVRldVVy?=
 =?utf-8?B?cGxDMTJTMjVKb2p1WkFvT2xZL0R6b1o2M0dDY3BZeWNMSXdQaXFNZ0RSZXN5?=
 =?utf-8?B?aldodDVFa25yVjczZHFYUFVDUDJBUnRQOWREVk84TUZGWEpHclhjeitaSDJE?=
 =?utf-8?B?VlUwbkVMaGQxT1k4aVdPbnR4SHE3USt6UU5xUWdkWmN2MUpEdjV6VU9NWVVC?=
 =?utf-8?B?em4wWDdtdXV0OHpFczRaSGtnRmNoSEpnRHcvNVZMb0I1TnNPMDRpQktKanBM?=
 =?utf-8?B?QXp5K0VZUGE1OU9mYTFrVjNzK0pVYTVxUzZhT2YxTzBsM2tObUUybGlXWHFy?=
 =?utf-8?B?cmtDQ3FLRC94SFh1aHJTUTBWT01CS05jSm1kUjYyVlo3TC84cmxCWlFqNy9h?=
 =?utf-8?B?aDZ3VVN0VGU1czdHZWZlNGZQMXJFczcwTVdEVHBjcnRoYmNKT1AvK2dtN0xm?=
 =?utf-8?B?bjgxWFJVU1BQaGREVzhYZXFSRFlWaDNhb29ubU1yUlBiejkwaGVFQjlYVEZH?=
 =?utf-8?B?dEVNT1M1Y3BoS3NjM1g3U0loUFZadnI5d1Z0WURQMkNsQ2pna3VHMnV6Smpt?=
 =?utf-8?B?Sk5iQ3NFWVNFcHMrSjVyYnBGS3hacHVDei9TQmtMcVpQYXJNMDlCVnNCc0gx?=
 =?utf-8?B?K002OTVOYWllUm9Idmh5T25jbzd5bDh0VmhQcGlXTDY1amlXMkZNdzNBVDZl?=
 =?utf-8?B?WmRlOG9iOEVoQkZLcW9KK1l4SUhZZ1kvWm9ITFVvV0syR2dLVnhtOU5wVENF?=
 =?utf-8?B?bitjd2ttbm8wcnhwREFQQlgxOUljakV2T3hIeUFPZzh0UzErTUh4QzRwd3Rz?=
 =?utf-8?B?dUxRTlA4SU5HKy9ralBDTjlreFJSVkIyeUFJR2M2OC9wZkxwY01Zcnh0Yi9V?=
 =?utf-8?B?M0Y4TnlOTEY5dDJ4eVdmcHJkdnN5N3NkR0RHM0JjUTJmSGg0MEhHTTlhTHpI?=
 =?utf-8?B?NVFRR0RHdEVvbWl3OFR6Kzh0alFDK3AxSEFGSGt4N085TjlNOW9WM3B6aXJL?=
 =?utf-8?B?OUhRa1dOUk9IS0FUY29FOEg3czRBRHJNZ25qK2lUN3Rzd1NhNnY4UGthYXlU?=
 =?utf-8?B?L0NXK0xOZ0JQWkoxVXhZdC9KVm9Qa3U3cjYwV0dUOXpjbHZTN21udVI2S3NI?=
 =?utf-8?B?UFhTaTNZait6RTlFSE9WUWNLSVQvUGhkTFZsL0JzV05qa2hnUHR6bnNocXZD?=
 =?utf-8?B?YUxsOTErcTJPNE9GeXB0dzIyNXI1NVc2bmFaaDFraFExK3lhUGIwODRJc2lZ?=
 =?utf-8?B?YWNhNDE1Si9MYlBvN1JUdllBR3Q2SE5YSGxRMWRNZ2JTZGtRS21aTkQxcm92?=
 =?utf-8?B?VmpLcXBjVUIwaWthcVd5N3dJQTVGaWhDVXZrTEVOaXIvTmhFQVFCTldjN3Nr?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae474eab-0417-4928-5065-08de39668a75
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:09:30.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TevUFKOaxYRVNCY1T6JOJD4Ta7mhRE1Bs380dYl6Z15Vqja1D0s301H+ywgqUWy9v25abw/kwcEv2QnbCeqzUI72Ku25LZV26M3pyALAT9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6987
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



On 11-12-2025 22:29, Thomas Hellström wrote:
> Use the dev_pagemap->owner field wherever possible, simplifying
> the code slightly.
> 
> v3: New patch

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++---------------------
>   drivers/gpu/drm/xe/xe_svm.c   |  3 +--
>   include/drm/drm_pagemap.h     |  3 +--
>   3 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 5b4337011924..77f8ea5ed802 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -65,7 +65,6 @@
>    * @refcount: Reference count for the zdd
>    * @devmem_allocation: device memory allocation
>    * @dpagemap: Refcounted pointer to the underlying struct drm_pagemap.
> - * @device_private_page_owner: Device private pages owner
>    *
>    * This structure serves as a generic wrapper installed in
>    * page->zone_device_data. It provides infrastructure for looking up a device
> @@ -78,13 +77,11 @@ struct drm_pagemap_zdd {
>   	struct kref refcount;
>   	struct drm_pagemap_devmem *devmem_allocation;
>   	struct drm_pagemap *dpagemap;
> -	void *device_private_page_owner;
>   };
>   
>   /**
>    * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
>    * @dpagemap: Pointer to the underlying struct drm_pagemap.
> - * @device_private_page_owner: Device private pages owner
>    *
>    * This function allocates and initializes a new zdd structure. It sets up the
>    * reference count and initializes the destroy work.
> @@ -92,7 +89,7 @@ struct drm_pagemap_zdd {
>    * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
>    */
>   static struct drm_pagemap_zdd *
> -drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
> +drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap)
>   {
>   	struct drm_pagemap_zdd *zdd;
>   
> @@ -102,7 +99,6 @@ drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_ow
>   
>   	kref_init(&zdd->refcount);
>   	zdd->devmem_allocation = NULL;
> -	zdd->device_private_page_owner = device_private_page_owner;
>   	zdd->dpagemap = drm_pagemap_get(dpagemap);
>   
>   	return zdd;
> @@ -307,7 +303,6 @@ npages_in_range(unsigned long start, unsigned long end)
>    * @end: End of the virtual address range to migrate.
>    * @timeslice_ms: The time requested for the migrated pagemap pages to
>    * be present in @mm before being allowed to be migrated back.
> - * @pgmap_owner: Not used currently, since only system memory is considered.
>    *
>    * This function migrates the specified virtual address range to device memory.
>    * It performs the necessary setup and invokes the driver-specific operations for
> @@ -325,14 +320,15 @@ npages_in_range(unsigned long start, unsigned long end)
>   int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>   				  struct mm_struct *mm,
>   				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms,
> -				  void *pgmap_owner)
> +				  unsigned long timeslice_ms)
>   {
>   	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
> +	struct dev_pagemap *pagemap = dpagemap->pagemap;
>   	struct migrate_vma migrate = {
>   		.start		= start,
>   		.end		= end,
> -		.pgmap_owner	= pgmap_owner,
> +		.pgmap_owner	= pagemap->owner,
>   		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
>   	};
>   	unsigned long i, npages = npages_in_range(start, end);
> @@ -374,7 +370,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>   	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
>   	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
>   
> -	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
> +	zdd = drm_pagemap_zdd_alloc(dpagemap);
>   	if (!zdd) {
>   		err = -ENOMEM;
>   		goto err_free;
> @@ -787,8 +783,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
>   /**
>    * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
>    * @vas: Pointer to the VM area structure
> - * @device_private_page_owner: Device private pages owner
> - * @page: Pointer to the page for fault handling (can be NULL)
> + * @page: Pointer to the page for fault handling.
>    * @fault_addr: Fault address
>    * @size: Size of migration
>    *
> @@ -799,14 +794,13 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
>    * Return: 0 on success, negative error code on failure.
>    */
>   static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> -					void *device_private_page_owner,
>   					struct page *page,
>   					unsigned long fault_addr,
>   					unsigned long size)
>   {
>   	struct migrate_vma migrate = {
>   		.vma		= vas,
> -		.pgmap_owner	= device_private_page_owner,
> +		.pgmap_owner	= page_pgmap(page)->owner,
>   		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
>   		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>   		.fault_page	= page,
> @@ -821,12 +815,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>   	void *buf;
>   	int i, err = 0;
>   
> -	if (page) {
> -		zdd = page->zone_device_data;
> -		if (time_before64(get_jiffies_64(),
> -				  zdd->devmem_allocation->timeslice_expiration))
> -			return 0;
> -	}
> +	zdd = page->zone_device_data;
> +	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
> +		return 0;
>   
>   	start = ALIGN_DOWN(fault_addr, size);
>   	end = ALIGN(fault_addr + 1, size);
> @@ -940,7 +931,6 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>   	int err;
>   
>   	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> -					   zdd->device_private_page_owner,
>   					   vmf->page, vmf->address,
>   					   zdd->devmem_allocation->size);
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 489b3e3e38dc..2fa73143fcd5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1110,8 +1110,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   		/* Ensure the device has a pm ref while there are device pages active. */
>   		xe_pm_runtime_get_noresume(xe);
>   		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> -						    start, end, timeslice_ms,
> -						    xpagemap->pagemap.owner);
> +						    start, end, timeslice_ms);
>   		if (err)
>   			xe_svm_devmem_release(&bo->devmem_allocation);
>   		xe_bo_unlock(bo);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 78cc9011829f..f73afece42ba 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -320,8 +320,7 @@ struct drm_pagemap_devmem {
>   int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>   				  struct mm_struct *mm,
>   				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms,
> -				  void *pgmap_owner);
> +				  unsigned long timeslice_ms);
>   
>   int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
>   

