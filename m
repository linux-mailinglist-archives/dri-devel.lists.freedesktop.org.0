Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C20B1E1A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D67310E4B2;
	Fri,  8 Aug 2025 05:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/oFUCWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FAA10E1BD;
 Fri,  8 Aug 2025 05:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754630473; x=1786166473;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FBjAZS1EqH8CzslFZHxIavinDpAE+tr0rSJOA9eupu4=;
 b=Z/oFUCWRwrXmUe+BjVQY7UzRflqMLkEMhyfDtdUk1KmS4F9jC9T+o8/e
 7UHFYocFYQi+OJsZ4Lf74rRZyEf6KFisXwZFR3VNCurmNP0R4U9tDZSCs
 di/gYIWD9azXyL9XB4cPz/PYdv/Nu5iAOI+T6f0DilFrFTZp3RSRDkIxr
 6EldYfEHsn9bg+/PqHhyhtUACysyL6WDxrfzeqIt/UTurmzZQK19vRF0a
 MYfeNkcZqjHKuLjvyPlLkx+rpRiL6s59zF9OKKRj4huKOKh5OYir3ydUp
 GtP3OpxrU8xgd9vfDaSUeyn/w3ElrVyin0bL5ra3Ssl8l01ombOW5gdW6 g==;
X-CSE-ConnectionGUID: JvUMkgUpQx6N6DULxUDGRw==
X-CSE-MsgGUID: 7lWu7roUQfazyVFd2gmP6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79531707"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="79531707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:21:12 -0700
X-CSE-ConnectionGUID: CvckRD1lS7eLK7zUoSylFw==
X-CSE-MsgGUID: sT79/kXqTi2P8Qpd4zwIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169365048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:21:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:21:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:21:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 22:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKo7Qs0+PcI0WY3jzLqVHskfnfyy6a6sYafneaPkVabbbx1XRimKLlLNE7f9jwJpAjfgjKDS+XQpaOc0eGYVBFsidFH/c8yvxZoZAgGHT9FX7OVa/Okt/5O6sY0wmzRCOdPhGHKxMF7iIw0dn9wJbutihMzZ8ZP6BlZpV7Nf2B1Oollu6O3LGpcIxkRn3tjlcjSFRXof5GKElTYsOuc9RkPXIRT/dZHCICQ5GT+EPqc3gwDnMV4wjPaD5cztjMspHKUfc5+CyPwAI4wk8yvBZn+yWimt9ai2i+YgJrfRXDnjUoyad+mEi12MWCrdrgutGa1jDmWxAx2TW+WFMWLjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6xbpPa4OQm2yRj2NH1gwRut4bkZeSD9JkfK4ol/mMU=;
 b=lOYRXiw6CTZbHsNbAzCMxrLxZdEFwdOl9KlY7jfTidmeT7SPLsWPm85SiL+Wg9HOALe68D3cxblxQ86bZnz/KfSj6T41hc8r6a4vOOTAgwZv2CLzn0T2YVM5XYoYW1IGCFzzdjFcGcEpBt6zDoUeuK0qDAHxphLYGNw4bXI6h18cQzxHIUHloNApBi5iOk4lE6I7NoTebPPjghU2dpE/gdzoge4deUUi3apTZNPVfB9A0sU1lwNuskcayYsjgd+a8V692eFeCs7FWzVPufflToaiX2mmptQe6sd3UuttqgW3VY+VIiXVa1xNVKa6D1P8NQ6dvwX3lcMKdsIsVsBY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 05:21:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:20:59 +0000
Date: Thu, 7 Aug 2025 22:20:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@kernel.org>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Message-ID: <aJWJOFq7a1VVinxv@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c50283-9eed-4bbc-7815-08ddd63b5bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1pPRXRvWms2NHhnK3lRS2dhZDViaHBNaGZZUTFISVlIYXlCdmNDWE9WQjg5?=
 =?utf-8?B?aHNpVjRiNW16KzVhTlpDa1NLa3NCTDFEZFlxM0YxN1dkdGFHRWQrM3hpYmZs?=
 =?utf-8?B?ZDRTTk1XMlFuYlVlclRHZUswK0ZjTm1zc3Q2SEgrZlNVeHFaNldUaEUvVEs5?=
 =?utf-8?B?Y1VGazJEWlFPVlVqd2NQS21xb0JCbnZKbXRhdnloMm1VV0ljbm5EYWlScENB?=
 =?utf-8?B?K2RJMGxmKzlaN3pyemdYQVRCN0psbzB1N1l3VmRmK1RkcDZIZXh0NEFzazQr?=
 =?utf-8?B?TWFlZ0hud3lDM0U4K1J3aGxwMER6MzdkUEc3bytjM2x3VnV0ZVRML2hOZzR6?=
 =?utf-8?B?TzVQM2VoWDE4ZHU2TzFCcVVNZ1hSaVFKRzFHRUlOOFB1RVpSSUNGWTBQN3Bz?=
 =?utf-8?B?MkVxRSsvd25zWmFMK3dJTU16U2I1ZlBZYm1EWEw1VFJOb0QzYlVYeWJjSDdS?=
 =?utf-8?B?eXNYZm9pSUl1aERoRm1zOUxYWG56R3c5SWhRQTRZRW9rN2RYYVlLdWY3TjhY?=
 =?utf-8?B?L1VpOUNFTzFlRi9ER3lHY2dxQWxnWFlMd2JSWGxuK0d5TDRWVVBFakp0Qmhp?=
 =?utf-8?B?bDdHRjhVVmVQcmxUbDVYRXdvOUdmbktuUG93cHlZU1JkSVNOMllhZVdSYVd3?=
 =?utf-8?B?UlVCaWM0Y000T0RCQjV2MGUrZW9UcVVuVTZpZUxYUzc3YzcrVnBBZkovNDJ3?=
 =?utf-8?B?TjlEYy8yNmhnMlM3RmtyeFV6VXhUYWVXTXZJVjJQMm5Wa2FoNWJBcUIrdlcw?=
 =?utf-8?B?Y1ZSU3NoNVVCOTM2Z2dDS3pLSVNaTCtmeENPMldjZjRrS0tSemhGclNwaitw?=
 =?utf-8?B?QUhqU0RuT2ZoOXltMlBYVTlNSDVYRys0dkJYWFdoSjJ2YVdjWVduajNhR3Bx?=
 =?utf-8?B?NklHb2grWjF6VytUaVZtcGR4ZnlBRTZPb1drZVdXRlM2STQwcE1IWjVHNXRF?=
 =?utf-8?B?eGFQcGt6dlMvczJKK2Myam50cmorakwxNWZjM2RmcjVpOHZsQXU4Sy9uYTBw?=
 =?utf-8?B?TS92dTMzemtiWWkwQ2xIektqd252UERReENIWW9vd0N4S0l3eVNXTHhXMDB3?=
 =?utf-8?B?elc4Zm90ZjNsNmtSQkpDbGhmUHhvcFk1Z014blFQK0owQklOa3hjZWJBekhj?=
 =?utf-8?B?SmhQMDhsTXNWZFhkT0JRbEtCOXhHVjhDQWV5ZVdnMnlFaXMzTXNqNm4xcXdG?=
 =?utf-8?B?ejZPdnlUQ2EvKzI2K0NxcmZKczIyWGUycC9McGhlS0daenpXcFlNaFMxY0pL?=
 =?utf-8?B?MnFaVXBtMkdodlRrS0dzSkVXYm9OK2tsaGFkdzNxRndnZ0g5UzAzcDl0UzhP?=
 =?utf-8?B?SzlsaXZvZGllWG9yQzRia2NSNk1nSUEwNlQva3M0UmdNMDBHajM0K1VyZjB3?=
 =?utf-8?B?Y3ZCaHpWY2VrRSt6NEFJZnMxbG9ONnZsb211UHNCR0gycGFHZVlOZFlQYUxy?=
 =?utf-8?B?VGdTYmlTcjNkZEF4UVdEQkpYSnJzTkN1RVRuY1dFR21OYkRGNDc5UXRVRCtV?=
 =?utf-8?B?MXV6RzZ5YzlQRDZmeXJEaE9HY01qemlXM2x5VDJZczBjZHBrZ1dpblUvcG10?=
 =?utf-8?B?Y1NJbWxaVTFoV3ZOdVRteWFuOUFVSXhjUDB1WVVodlQyZHN1a0Rqc2tDMHZG?=
 =?utf-8?B?WE9MdjRmMTlCM0tDa3NRV0JXM1pPN3Z0ZUJOaDlHbmR4cjJEMGZRSEhCOWZ2?=
 =?utf-8?B?RUoxTmNSbVdqV05DSXExbzFEa0Ivd0xPYnFIVEFKNjdVZUpuNTZ0azFwcjZ5?=
 =?utf-8?B?cFZqWEZ1M1ExNDVSYndaY2xCMDR6ODU1L3V4cVFhZ2RoVDcra0c3c3Vld21U?=
 =?utf-8?B?QmRIckdZVGhVMy9uRVo4WjQ5ampQOHhYcFFiVVBsNGFTSjExeHhvVjErUVc1?=
 =?utf-8?B?cjYvYkxFdEZaekU2OXpMS0M4N1ZmQTl5VXFDbDdMTXNoMzZVLzJnb2hhVTlP?=
 =?utf-8?Q?tprV1Um9TgE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3d0TGcwQ1B5bkZQNEdmTUZTanduSnB4MDhHQmRTRHhiemt1c0NyeERzUTNy?=
 =?utf-8?B?SktvemY5aWUyRkROMWJRY3V4MUh3ZnczQjJGUjg2SlFoWjZFUUtPR2w2Wk5V?=
 =?utf-8?B?WE1ubWtnTFhBSFQ1Z2ZpS1dQN2FjeEpMWWE5U3EvTFJ3dHZhUUdZQ3hXTEhD?=
 =?utf-8?B?S21mM0xkSnBhVGdaTEpwYkZibDFJN3ZYTGdHUGp2NmNnL0NGdmcxY2ovRTE2?=
 =?utf-8?B?bHlybG5vQlY5a3R1ajFoNDFsV3hXdDZsZFRMSkRYTjloY1FCekNxQ0p6WVlz?=
 =?utf-8?B?UXdTUDlFZGNPL1dYVzZ2TGtFeEdaYzhYeVJ6dldpYmhQRXA1Wk5xUHNNckti?=
 =?utf-8?B?VnMyQXhUa3dxVlFRclVZcER0T0l1UDAvOXNyMGQ1MHFKWndTUDhQVlhkSnZt?=
 =?utf-8?B?cVR2elc4TnpVRHM0OEFDQnFKOU1MWmNqQ01vSkNtN2ZqR3R5ZzByZDgyTGpv?=
 =?utf-8?B?RzFlOEE5KzVISmNsbXJnUFdScGZFUWVjRFFIRVUyMHYrd0U2djVqNGRpMVZL?=
 =?utf-8?B?QUZGaHgzRDQzN09oTHdmZ3FxVUYrK2M4dzlPdUxhemxMZlJoR29JNnFkMmpY?=
 =?utf-8?B?OXVEVy9YRDNialZ3MDFSOUNORDdrTmp2OTMzVWRMZnIzKzQxYXFuWWNBOHlr?=
 =?utf-8?B?TG9UeVlXcHNFTXRjcnB2YU1ZNEh5dWZqNFhMT1dOUENLa05CZjNCckhjbnBj?=
 =?utf-8?B?Y2ZTRTFiZXNiWGRja3RBRVB5bzh6MFo0ZlVIYWh2d3JubUxKakVQcUJiNFlT?=
 =?utf-8?B?cWxVRzhUOSs3c3RWMjI0ZFNJdXFOa3B0WDh4YnNKaGZDSWNSTkpYeUZVcU9H?=
 =?utf-8?B?RnZmUjRIMFl2Y0ZQZmdTYjQ4alQ0dVBFdWx0Nzc2eGw4dVEvSi84ejhqQ2ZE?=
 =?utf-8?B?bGZQUHdtMTRUemVLdmRwZ3B6WllHbmpma09RVEpXaG4ydGNCbENoU0NWNzd1?=
 =?utf-8?B?NkErc0JaRkRyQlJGTHNYeGhIQjNxNFd6TjNsT24xUEQ3MmozczBJNEptU1pm?=
 =?utf-8?B?ZitDNFc5UXRvdGgyUHJKU0FwNmszYXdtWVhrYUIvOGd4bGI0TDdWV21KUWFL?=
 =?utf-8?B?dTA5NldmZzEvY1lxdldBYXhyWTVTSHRHZmhwZlJYYWd3RHBpV3YrYTROOWQ2?=
 =?utf-8?B?VzVvVzd1bXgxaU1UTjhXakFLS20ySG1pR2MwdVptOFBwQ041eFlYUUZyK1lz?=
 =?utf-8?B?aTNXSDc3QVNHbWRoRE9Vc3c4N2pBbktlK2d3dnFiSmdnOFh2YWtObUtBWkdp?=
 =?utf-8?B?Vy9TZU1hTGtkVG9qTnM0WVBLdVMzamdOZHBLeWx0ZkJoR0I5QW80MkpVSElF?=
 =?utf-8?B?dEp5MGtyNDdnazFjczNZc2ZZYXFFdzRKcG9hMzNWTU5pMG51Tk9DdlprTEtX?=
 =?utf-8?B?UVh0eTlLa1ROZE84SEVQSWhwVTgxUkZDV214TmoxSHkxbGZLWk5lUW41dTAz?=
 =?utf-8?B?ZFNHWjlhS0RrZEd6elptSUN5L3QvQUVFNGczenp0QVZqS21ER2t1a0xUQkpE?=
 =?utf-8?B?R2xkak9EUFBVQXpGK3lGRmVyZG9lQjFydU9iQ2drTDh3NnNyTzZ0cmRCVTJK?=
 =?utf-8?B?RFhhb3Q5ZmNUT2Y2VXkvTVdiazlsMkJWOVdPRzJDSHgzZVdsckJQMFFoZm0x?=
 =?utf-8?B?U0twbG10TjBtNHE2REJqTy9GVU8zUXJYUUZUNzZKZHh4MFAzVnNuK2tHNlYv?=
 =?utf-8?B?ZG9Ja2I5KzNaWjdwaWd4SW9GV0ZrT1djeGY1OWpXNjl0SUFjOHRNN0t3Y2xC?=
 =?utf-8?B?d0hKTWxuUEtCaGljTC95aXFVM3g5RURGZVdJMEEzcVV1cGNpdWFJOEpJdmJU?=
 =?utf-8?B?ZGt5d01GbEFSMzgrbm90WWZ3bXdNYzE3Y1J1QnYyRUQzQ09sLytESkpuamxs?=
 =?utf-8?B?cC9IRmZqbjJjcjNYQXJKQzJJVW16amtURXU1Q0pJQ3ZjNmUwR0F4WEd2aWt6?=
 =?utf-8?B?aTdmQTNaTy9YMWZZZXhlOXc5S1pxcTJsN2hYU3hPdTRVUGV6MGkvaXVTY0ZE?=
 =?utf-8?B?OFRHMkltNnJ4enZpaVk2UndLVHVISlF3ZC9hZDdFTjh1TmlKZlE0K1dpT3JV?=
 =?utf-8?B?SGZEUnNIMy9DbFpwdUpqOCtTY0RPRXhQV0FlYUNoOFovTy9YT1U1T0xkYXZo?=
 =?utf-8?B?NTM2YnFvK2dObDl6cHpWUTFMMjBkeVBwbUFvV0Mxb0NDUVl3ZERhN0pSTmh3?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c50283-9eed-4bbc-7815-08ddd63b5bcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:20:58.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYcY8/RMtSdy4yBOR7MqiMDPvjsVByqEn01L61sAwfWjFBKVz6epDi0rHdfR9MynnF/0yKjGZFNh5RFWtI1ytw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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

On Thu, Aug 07, 2025 at 10:13:16PM +0530, Himal Prasad Ghimiray wrote:
> - DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
>   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> user-provided range and split the existing non-GEM object VMA if the
> start or end of the input range lies within it. The operations can
> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
> used by the Xe driver to assign attributes to GPUVMA's within the
> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> the operation with this flag will never have UNMAPs and
> merges, and can be without any final operations.
> 
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)
> - Add doc (Danilo)
> 
> v3
> - Fix doc
> - Fix unmapping check
> 
> v4
> - Fix mapping for non madvise ops
> 
> v5
> - Fix mapping (Matthew Brost)
> - Rebase on top of struct changes
> 
> v6
> - flag moved to map_req
> 

I’ll give this an RB—it looks right to me, though it’s a bit hard to be
certain. Before merge, I’d like to see xe_exec_system_allocator add a
section(s) that calls madvise() on each newly allocated memory; that should
creatd enough random fragmentation—particularly with threaded
sections—in the VMA state to be confident this is correct.

With that:
Reviewed-by: Matthew Brost matthew.brost@intel.com

> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++------
>  include/drm/drm_gpuvm.h     | 11 +++++
>  2 files changed, 84 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index b3a01c40001b..d8f5f594a415 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  {
>  	struct drm_gpuva *va, *next;
>  	u64 req_end = req->op_map.va.addr + req->op_map.va.range;
> +	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
> +	bool needs_map = !is_madvise_ops;
>  	int ret;
>  
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->op_map.va.addr, req->op_map.va.range)))
> @@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 range = va->va.range;
>  		u64 end = addr + range;
>  		bool merge = !!va->gem.obj;
> +		bool skip_madvise_ops = is_madvise_ops && merge;
>  
> +		needs_map = !is_madvise_ops;
>  		if (addr == req->op_map.va.addr) {
>  			merge &= obj == req->op_map.gem.obj &&
>  				 offset == req->op_map.gem.offset;
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = range - req->op_map.va.range,
> @@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr < req->op_map.va.addr) {
> @@ -2173,20 +2187,45 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			u.keep = merge;
>  
>  			if (end == req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> +				if (skip_madvise_ops)
> +					continue;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops) {
> +					struct drm_gpuvm_map_req map_req = {
> +						.op_map.va.addr =  req->op_map.va.addr,
> +						.op_map.va.range = end - req->op_map.va.addr,
> +					};
> +
> +					ret = op_map_cb(ops, priv, &map_req);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2198,6 +2237,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr > req->op_map.va.addr) {
> @@ -2206,20 +2248,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					   (addr - req->op_map.va.addr);
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2234,12 +2285,20 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops) {
> +					struct drm_gpuvm_map_req map_req = {
> +						.op_map.va.addr =  addr,
> +						.op_map.va.range = req_end - addr,
> +					};
> +
> +					return op_map_cb(ops, priv, &map_req);
> +				}
>  				break;
>  			}
>  		}
>  	}
> -
> -	return op_map_cb(ops, priv, req);
> +	return needs_map ? op_map_cb(ops, priv, req) : 0;
>  }
>  
>  static int
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 116f77abd570..fa2b74a54534 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1054,6 +1054,17 @@ enum drm_gpuvm_sm_map_ops_flags {
>  	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops
>  	  */
>  	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE = 0,
> +
> +	/**
> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> +	 * user-provided range and split the existing non-GEM object VMA if the
> +	 * start or end of the input range lies within it. The operations can
> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
> +	 * in default mode, the operation with this flag will never have UNMAPs
> +	 * and merges, and can be without any final operations.
> +	 */
> +	DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE = BIT(0),
>  };
>  
>  /**
> -- 
> 2.34.1
> 
