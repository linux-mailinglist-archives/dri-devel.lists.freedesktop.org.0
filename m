Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB00C31196
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F6A10E275;
	Tue,  4 Nov 2025 13:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3ssE+yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEAD10E275;
 Tue,  4 Nov 2025 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762261201; x=1793797201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ScN6QYpL7sMVWSkZUSamJhnNZ8w4JDBQjwwsYAl/VPo=;
 b=g3ssE+yN/WstHUpJv2Nb+L2p/2qdkXgJ5Tz50UefkS+c58f8GjEa3/Rg
 Dmbkc7I9DK5Qhwn+IpcGakeoFfFkMPD5d2BtS/mp/dsnMDoHfFElHyTjG
 ZE5dYLN1COo5vHXL30Q4d1uRns1MxVe4vBncvyg/sdE3/BcuRoxwKt1lq
 o4vgitMKG/YYj6PgvMj3BgH6P8LITjxwOfNFbS4Kc5j1sGlQX8TFbmjj6
 T3yq1oiijoR4lmlQMU5h5/W1GZF54L2zu39UaRvOoBmK3UssmgyAhTghC
 UZWOGWEbOZY2iinxhvjmxrKZojdAeInGRoEKV5I3hvwJ4dYZqN5YreCjg w==;
X-CSE-ConnectionGUID: SsZayCUhR3ulSDFNNdeYlg==
X-CSE-MsgGUID: xJYFClErQuy7rukoP9ruQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63557927"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63557927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:59:58 -0800
X-CSE-ConnectionGUID: D27LyaoxROWq6m+QLZpqMQ==
X-CSE-MsgGUID: bf4zCqCTTOyd0BuKGZCahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187102434"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:59:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:59:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 04:59:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:59:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2yI00gJYhdzP7uEv92o0ua0u/M6/iYL0UP54zkFUdmd5U8GMgwX8VIzoZQNV1fKGZ2wIdw+U2hV0mLiYF29ZbXy4VOupkTmhTohotdiUnYqVho91Iuai5i6ne0yB6/5MxCzpO/3qNXN9n1o1ItIDzl6PFQgopOq/u+HMlRMjgkRI48gugcpftJPVfDXrc/ss+53eK02nLqpTGVi41MsfSz7juN7BnN1wF4krHGOj6TAuHGyMRO2zI/DFn3ee8mXB3IzV0oOGDF6OnCEG0myM/Hs/bXgZaXQfa54HFSxOTi9QD11kH+QCGU0PU8ubV3ffOWQFrrXsm4gH0H7zWBQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEk2N3CzJYIK95Cyl2o40SWQuMxvTvQNYz61mRp0EzI=;
 b=LgGSLotDQ1VT73db6DCGenkDqt5JUqo9PniFOINGadorjmWjGPY67PbBU7jOMeHMMP0vpyIGzZRNT1akeeCT6XedEa9yycvI73MiG1xXVQRVHj5lS7qxBbUkitvEbHKks/oO2JM4jxYF8GdnYObYBtix5HSNg9LIAlyj9cKbl+UPSzHtu3514D5QVXuZVysJJoDEwXFsYEkmUXsX0buHBoo/3tTX4YSueE/7o1Po675kAXRtYbCVx5RuM4T9kHlWCP2bd9KmqNq7vkgm80hVGyGiNuxiSAQS9ycQinQWf4QxndUuDrwl+3OuU8sODUG3p9ACikcEwKk/q+h7HaFi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 12:59:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 12:59:50 +0000
Date: Tue, 4 Nov 2025 13:59:45 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
X-ClientProxiedBy: BE1P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7d8e73-84d2-4db8-afa5-08de1ba20960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkg3endLdklaUFVsRU93cnNyUlhKdEVWYVZsdVMxVnNnS09iWlE5Q3RTTEtq?=
 =?utf-8?B?Um1ZWCtoeUJWaEhKR08yV0JWSFl0Y0w2aktuOWNnRXRhM0xkeGl0SFd4aklM?=
 =?utf-8?B?anJlWWVsUUdZSllhWEd3RXVFYmZsbnc4MmlBbkV0dlpuSnF4WjhRd1N4NzBw?=
 =?utf-8?B?SFdTMGRyMHFtMzBxQ05abVk0UkkrTEZucFh6eFEwV2ljM3htbUFiL0lmTVhE?=
 =?utf-8?B?N05LaEorZGtHWENJS0R5UE90S2w3QmJiNkxBdTNmOVF1b1l0WVZ5U3g5NmxM?=
 =?utf-8?B?RXROTVNsYnkwVFVTbWNOcWo3RDlIN1ppQkN4MXFuVGRwMTQyRzRtam13SHUr?=
 =?utf-8?B?eEZrYS92eUtlZDFNRGxURUw0NzJTQUNuM21rcWZnRXE0TFd4SHB3S1N3eXVK?=
 =?utf-8?B?QXJBQzB0WG1xYWxMZ1JsVjY0bW82R1Y1SkVyMTU1VzJwd1RHUnFZd3UzM2Q2?=
 =?utf-8?B?ZGNaMFpFVUFHOXowbE1XZlltelFhMEZFV1JITGZER0xGZWVLQWUvelhpbm9D?=
 =?utf-8?B?RTN1Z2NXNUlPckZxNU5hNVFpNDVJSk5PMnJ5NHNzWUk1Zk1pb2pnUFVFYS9K?=
 =?utf-8?B?b0RpYlEwamQxSFBHbXpTaWpqa0dmUjRHMjVJU3JNNi9yM2RaZkRKcFIrRURK?=
 =?utf-8?B?eXRTZDBlSkxZcnlPY3RLYStoUlZjMTdmTlNzeWFuYmVIRE9COG1aaGpGcGtW?=
 =?utf-8?B?ZVl4cHl5TVduWlVCSmlmcUNvS1JJMHBYdndTQUlUREpwWjJYWjMxV3IyMG9S?=
 =?utf-8?B?T3BtS1lWdC92OFIwK0hJN2VrbW1iU21rUkFPbTE2K24rY3FPRkF5dUMwVHAx?=
 =?utf-8?B?cXVYNXpxUGxkQ3hnYWdkYXVueERzQm43ejdTTU1WUklwbVhSak9EK1luS2lK?=
 =?utf-8?B?N2g1WDhPSFIvT0VvQU5TSWVrT25QM3p0TWJHZnNZMWNFNkxXU2ZFZWVvY0Nu?=
 =?utf-8?B?V00rQzRCUWVuVGpkbjYzVGo4VURsU2Zta2ZIck54NDM1dlpRZHJucTFIYlYz?=
 =?utf-8?B?Nk1FVlRHcDMvWUJEaXluNnBTMnZOODBaUjJmdEJpSmo3eWFmNjNRNVJpU2pG?=
 =?utf-8?B?WGtoZno5UzhpWGRXTmprMnF0NGtsMUlmNWwxMTE1TTUyb3Q1b2xJbTRlQURT?=
 =?utf-8?B?Rk4wOUJlNVFKenh0YlpjV2hiQlF5SEdjNW4wdzgrSjJqQW5MOEhma1o4Q291?=
 =?utf-8?B?b1k2ZlNCb1dDODFYU21FYzNncEtvd3pCa3RmQ3htUW5UQUVuYXlWMjFMRHdI?=
 =?utf-8?B?ZTZYK0pOeHpobW5MRHZzUm1Nb1NQNXRpajNEUWFjSUZVUlA3aVJHSVlSZjVo?=
 =?utf-8?B?UVpybjNwblJZb3c3K01EL3o0OGIvZ1R2R1dvcW4wL1g2UE9zK2lDZ1psUDVZ?=
 =?utf-8?B?cWY1Q0I5KzBKYWFMWEpJS2NWZjNOVGZyM0dwV3A5MmpoeXBHTFVnM1JpNzgv?=
 =?utf-8?B?amw3RGh4Y2crdENHN2NoZTkyaTJZT1IxM3BUQ3BYTFZ4RzIvbVgvOTZOQUhx?=
 =?utf-8?B?c0gwK2QvT2cwM0UzbjYwSW52eUc5NXFqWUExeko2bVpyN0JNTytEcmJ1SW9M?=
 =?utf-8?B?TjlrcHRPclE3c1pqWkhLbFRQNG53ZVBjNUVGNUlhYjQrOEFnb1hGYWxkK3ds?=
 =?utf-8?B?WmtMYkhKZStlRHh1WWQzbXA3aHVuWHAxUkxmOVoyWWUycjM2bGpJWEdvQ1Uw?=
 =?utf-8?B?c2JUOVZCZk1GWTdLOWlWVlhpM3prS0JNM1VTSlh5SFUyZkRmMkxyRWRWUFZT?=
 =?utf-8?B?b3VteEo2U09qMVFmVUpPYWN3RkcyOWI0SjJ4Yk96a3BKWFh3b2VnK0JZZFF5?=
 =?utf-8?B?LzBrbCt2eEVHaEEvbmNUU01EVGNsWTd1bnIyTC9lMjNaWm5jbytEQVh2QUhW?=
 =?utf-8?B?dGg1K3IybnJUUXd2a1NDSEZYUldCYWd0RS9VZnJIcEVYZUErYXRwa2ZrQ3hn?=
 =?utf-8?Q?1DOdwr5K0khlS/z920dnF+Jg5N7/pPdO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRyQ0hZaUJwRjlvYTRDdHFZS3RzM3NWRFpYb0x0M0dEcHBieVh6YytXS2ND?=
 =?utf-8?B?ZE03UmE1UkZxTGRmNVhxNFI3ckkya1RWMDdUMGVTcVF2NHM5OGpweTFaeTdK?=
 =?utf-8?B?NWRFdGFPQnAySXd0cGErZm40SlpmbGVybFQ3ZldkOE5mOU55VzhSZkRSRUQ0?=
 =?utf-8?B?VENvMERBM1FnWE5uNkJMSldSYXZzM3NmZmE0N2RxOFhWNWRVbXBRS1AwbVpl?=
 =?utf-8?B?MnhETWptWFZiZnpMb0pRQm5rNUJra2NBZzdHelVNbm9xZWcrNHJPZXRSZndD?=
 =?utf-8?B?VFJoNEl5aE8vcEkzNDdWcm1EVW5HOTU3L1ZhaHdjZW9tRk1wTDBWWkNlWFp3?=
 =?utf-8?B?MlRTY1FHN1BPaVZTSlNiaHg0a2JGNDRzWS8yYmk0YlQ4ZzZrbS9ycGNTU09Y?=
 =?utf-8?B?V1RDbU03MlNxYzQ5QWk1VGYybzQzZnZSMlBzV0hmbzc5cVZaVmtUeDN4QkFk?=
 =?utf-8?B?eEFpeXpMUUwzQ1ZmeUYyeWkzemttVU9oMXNyZzNUcXRyY0tpSTNFQVA5Wm9Y?=
 =?utf-8?B?UVJZcjBSM2xoRkYwZGJ3NVlsZ3pFcGdTSWprVDU1T2RRcUNLalF1OGwvekRJ?=
 =?utf-8?B?Rm83TE81ekUrQU1pUVduMFA1dHlFU0ZrN1lRZWZPWllGVmZlRjYxcGdQVlhL?=
 =?utf-8?B?Wm9Fb2Y1UEpjSGErWitVcWhiZmxRVC8rVlZaRUgrUTdSaWJmSk9FZ3c0dW1u?=
 =?utf-8?B?OVhQVTA1dVM2cVN1NGdnd01PQUVpSVYvQ1VxQno1aitOLzNGNXkrSERPczJF?=
 =?utf-8?B?NER5NUhaaXN0QzNUNzgvZFlpT1ExeDBNMG8raWpxdlRNbzZ3cHBSMlNRb2xX?=
 =?utf-8?B?Q1lYZHR5QktEWjdLUE11TVIyS3hvWlc0NjVpTkE5Y2hreC9ETW5ucDQ1M2cw?=
 =?utf-8?B?TFMySUNwam1IUGxOenhwVHZEWXJCZTZvd3FsTG9mNjN3aGJxVWc4NUMxSDZE?=
 =?utf-8?B?WURiTWhjQnBLOWtBcDhiL3pJeEo5dEpMaFg3ZkpLWTJzZWV4UlQ5b3VGU2dl?=
 =?utf-8?B?alZoNjZlZVNGVXBIMXEvSTFUMkFqeGRFRTFZYmFtdHZDS2VQYmFwRlVRdklG?=
 =?utf-8?B?QklaM0k1QVNRR3liZTNrTGlLODFrYm55cHJMQ1YzUEFDL0lKOUErS1lrV2J1?=
 =?utf-8?B?N0pDTVNMMGd4TUlSNlhBOFAvY0FSR0gwRFFCOVMzaE9iRi95Tm1oTVh1dk5X?=
 =?utf-8?B?UVZEek1pci90SXYxQ3pmMzU5U3BDUG91S0huTGwxNTZDOUdUTzZSUVVCb1U0?=
 =?utf-8?B?WUw3U2pncmR3ZitndHhJUC82QkY1ZG12a3d0SmdkZWRCRzhTaUFnY0plUlUx?=
 =?utf-8?B?azN5RlYxVTh3REtXVWY4bXVBR1JhVDVZSmRaNWY4WGRsbkJKWUZENFhJTWJi?=
 =?utf-8?B?dEJ0Rm5pWGFUdm02WHVjbW1EQWgwN05ydy95cDZvQ09RUis0ZStpYlZzS3VY?=
 =?utf-8?B?Ly93QnRJVEIxYnFSYUxoNjRybFoxWnorZ2Y4VkVzejd1d0dKaDFZdVBRb2JJ?=
 =?utf-8?B?QUlFRlJsRUk5N2ZaWUJYODlCdjg4YzFmdnJMcC9XYXBXV3RNbVAzN3FpaEJV?=
 =?utf-8?B?RTZBWnE2RGJSUUphWGoyZjZwZjQ0STJ0cENKajdmSzVRZTR2Tk91Y1NSNk5Y?=
 =?utf-8?B?UTczQ1VMRVFQRDBzNmkwb3JQUFpZbHR2TG5PRElVbGtCMDg0QUJjWXJhL0RK?=
 =?utf-8?B?TmZKUVNPNXFFN2FqMWJadzYza3RtYS80eXpsQU1JRWlkaVhzQ2dNZzZTMDBJ?=
 =?utf-8?B?VmxPTnEvalNmSU5vL05xSnZoaXlnSzhNaEx6N1d6YXV4K2VKcFU2ZDNTSWZ4?=
 =?utf-8?B?dUNkZkcxeUxacGlqVVJqbjNDTTBwZXdnU2lBZGNadldqMXZtRHN4NitxRGpz?=
 =?utf-8?B?L2d6UENhWUdLWmpvZC9tMHBZWWNsU0ozVkdjZW5MMVI4djBOemllN0xCUGlO?=
 =?utf-8?B?TUlQK2ZkRmdrTGlMWnVjSXl2MitEVThvV0RLWWcvVjMwNTBYUEJNemFxYUg3?=
 =?utf-8?B?a3B2UWh3bjFkZ0RURFhDbGR3RVRpM3ZETVNHdENIdnZ2OVJHbGxmY2xrelJj?=
 =?utf-8?B?MFpoL21UYklWRURHTWlHUHhVT1VzMHpDZ1N0WU13LzU4U2FlSWswQm1jY05M?=
 =?utf-8?B?VTM4SkpSN240T0xGNlNKV0ROVlIrdHN1VmtKOWhrTktoTzJOdGVvMkwwaHda?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7d8e73-84d2-4db8-afa5-08de1ba20960
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 12:59:50.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxE3Cy4xRETLbaOok4tGVepgcb0aogjJlG4ejpb1Tu8tZ6E/bNW9N9h/cWW2sJQp9NpN7NM9CwNzrDcrCMIRZtmk23saZHckHZ0VxhJKR2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
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

On Mon, Nov 03, 2025 at 03:30:49PM -0600, Lucas De Marchi wrote:
> On Thu, Oct 30, 2025 at 09:31:34PM +0100, Michał Winiarski wrote:
> > In order to allow VFIO users to choose the right driver override, VFIO
> > driver variant used for VF migration needs to use Intel Graphics PCI
> > IDs.
> > Add INTEL_VGA_VFIO_DEVICE match that sets VFIO override_only.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > include/drm/intel/pciids.h | 7 +++++++
> > 1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index b258e79b437ac..d14ce43139a28 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -43,6 +43,13 @@
> > 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > 	.driver_data = (kernel_ulong_t)(_info), \
> > }
> > +
> > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
> > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > +	.driver_data = (kernel_ulong_t)(_info), \
> > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
> 
> why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
> directly? Note that there are GPUs that wouldn't match the display class
> above.
> 
> 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> 
> Lucas De Marchi
> 

I'll define it on xe-vfio-pci side and use
PCI_DRIVER_OVERRIDE_DEVICE_VFIO() internally.

Thanks,
-Michał

> > +}
> > #endif
> > 
> > #define INTEL_I810_IDS(MACRO__, ...) \
> > -- 
> > 2.50.1
> > 
