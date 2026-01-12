Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE7D15BAE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9D210E434;
	Mon, 12 Jan 2026 23:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2SYjN5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786610E107;
 Mon, 12 Jan 2026 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768259250; x=1799795250;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TY9PdHZd1pZv1622LgGxftKNJ53j+MSo1XXf/SCzxHo=;
 b=V2SYjN5/yov0rb51jg2rLf6q6vFRvLOKiYt5+x1N7KZZD4fKCqOBA+aA
 QWmdrgoKjI74S4Km+shwPiOpECZKDpoujsmY9quXALN3GJA7WwAhS6JWW
 qYwAC4S+ipWM9zKlmfPlj/Xf/pXMmBDAVsCcIWMc/FrT7KwTf7KVW3XIa
 YisfSdof1Cp9LXRgqjnmzIMWBJ2qLxYv3pVsFQLrA6+6Rue9kc5lS6JKg
 rAFw1eMG/HThCnUXaRiER8mr6pDAI4DvbsJVTfmOa7Pka2vr0WQP4Llzl
 /CdHLyUYsq4TYF4eUx7gLnSCYTIXs0yzoT83z8f6gXojSt14tqlpQEEYy Q==;
X-CSE-ConnectionGUID: zZpo1HxTQCqgwGqPp5QncA==
X-CSE-MsgGUID: 3VBXLfFvTY2s9S/XugWXaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69593383"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69593383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:07:23 -0800
X-CSE-ConnectionGUID: 3bDnGGmCSWCWmdEgDFFz0A==
X-CSE-MsgGUID: ge7jWs1HRO2LWwnmuyN5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208734757"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:07:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:07:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 15:07:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1jvUOqs8B0bWQNMgITQRga/rUSbNwn0qbrFtylM3/OHmfqZ5xdK92peUo5h2X18c7HbZtufcMPoCQj36Yc85ABFC9uJKF6G0u7XM4rVFdTBY+7RIHUuBEqin9EY4y08sCyPTdqdaNbHjbtV1MPhLpfWqV2WyutNUBe2HdTvxmyqoz9b6nkryha8aztRt21ku8/R9Hbim3jp1Vk2C0A4eEzRrO2HWN6J8zSbxykrndZbRuS2L+xx3COUs5iKUokzSliPCTFGu+UT3g8fm/mCKiT1Kcl7TBg+hTJslud+AlKQts3ooGB6cZaFulylbAQzyQ1AH0uBI916CDBHmDxt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsCEeHzixQq/jJGKBfSuALnMO45i9828Rit/pT28dck=;
 b=tm/2NgiNVbCowBs8LMxhiOIg1b+0rtkoyrvE30mnTOj7s9TmJctdoEOlM0CYyU0VQ5M1VceZVf4xdTV6n3sZQO/Np6JauEiRZ8qgMQC90sLSZqyDtMjQH25kTsOLq/QwjJzt0KwEE5/xUMjNdepLJIYow5WVJlKftdu8d2qF/BT3S/A9XJSjsjTJWa2MJB7i7DD4wyBcG/bLvM9rENjirk/LN8AWxDuaCrihQ8/XL575OANcKGhs6H3UVJuRonPooH3gmXjPWCUhgr24UygHEnlHRsYoa+YG5PtG+a5pZCoS4gGDJJQvvJK2pZFfFx8+MzDNMG5T3Or0VkcBx5Kq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 23:07:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 23:07:20 +0000
Date: Mon, 12 Jan 2026 15:07:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Zi Yan <ziy@nvidia.com>, Matthew Wilcox <willy@infradead.org>, "Balbir
 Singh" <balbirs@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Alistair Popple <apopple@nvidia.com>,
 <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWV+pIBkDlgvnPrr@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112165001.GG745888@ziepe.ca>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 400f3175-9aeb-4a22-36a1-08de522f567f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1dCNzUyZSs4ZTZtay9UVmlTNEdvbytSbS9zeTJ2cDhDWHJnd2ZBSGx2bWl3?=
 =?utf-8?B?NkVFanZJZFdEcGxEMDJ5TjJwdnlHRm9iYnhMV0JERUlqNXJDSW95TnFRK296?=
 =?utf-8?B?dlZwL1Y3ZGZNeE5PNUVJM0MwcmdHLzhPckdvRjZXZ2VuQTNlU3lrRjFUWVJy?=
 =?utf-8?B?MFUrcTBwTXAwN3VXemR5L0pUaEhZMzVMcitQUGt3TURodzU4SldCWmZWRXRJ?=
 =?utf-8?B?OGVWVFRFcW0zMFJuS3hCRTlSQVkxRytrQTJXTVFtRk9ZUmxuODY4QWZQcHRZ?=
 =?utf-8?B?eTB0eVhuY2RDUGZEaExZekZuMStjM01lRnJTSnlkV3QwTnlRZmhCOWtQNFFH?=
 =?utf-8?B?NXhaT3pXSHpaV2lFUWhFNXp4WjBHSlBiTW8wbnJURVpISWVoaGIwbUpHWWVH?=
 =?utf-8?B?dTRIam1EZnJhMTdHbnJHOE9KZ0tvOVZSQ1gwMis2eWdSRFY3T2d4RVdMRTRP?=
 =?utf-8?B?TFpKa0hLVGlqeS8wVk0vR2xuSk1tbVkyMi9GRTlMd1ZGbk1KSisvWVUvWGZP?=
 =?utf-8?B?Tlp0ZW1jeWhuNUtROFExZ0pSWE1DRmtBQnFUcm5BZ1VDUzM5RDFFcXpsZ2Ft?=
 =?utf-8?B?Smt1NjgydEdUcU9Pbkh5bmszRDJJQXZBQ0N5RnRrdEwrVFFuaUhGMTNjNG5y?=
 =?utf-8?B?eWJzcC8zUzNqY3lhSVpLbCt5ZVJnMHpZTUlUWkhHMGFwSlVMamFnY01RbjNG?=
 =?utf-8?B?bzFHNU12LytJVDl0M1ZxN1BBRXB3aXk3T0UxODhHNmtnNDlSbVUveHE2RHNy?=
 =?utf-8?B?U2JYNXMrZ0xCdUNQOTZNUVlyaU9kcFJ6NTJGam5QUGtPOWhTZVh5dUJFOC9N?=
 =?utf-8?B?OVRsRUM1ak1JUEZUTlBOdVBHY2tnYUJ0Nmc3RjU4eEkxTnAwSkVsN1ZFOUd0?=
 =?utf-8?B?KzJPaThNNmRLK3R5YUJZMi9OakpHYXV3SS9qanhYd0RtMksySjhzL202RkRw?=
 =?utf-8?B?b3kzV1lRMlhyWDhXbFNsb2xmT1g1a3YxNU9zUDYwWU9waUtaZ0MvRDZUUmJN?=
 =?utf-8?B?aWFBQ3RXdVYrZGlBSnk5bXcrK1VMT1JqYmFFS0diUG5xb05NQWlHZmZkSGIr?=
 =?utf-8?B?K1R4SlJ6OW80UlFsY3k2TlN6VTd5NVhjQ2hYeE9zaXlSVllIMGdqV3l6RlFj?=
 =?utf-8?B?V3d1cXpWdVdpKzRKMGgvVFBXQkxzclpPZ0pnWi9XcXRaWHVBeEhLM0dHWkw2?=
 =?utf-8?B?R0JPaUZPekdJS21kRmg4bTI4eU9SeEVhT3JPb1FwZjUxL0lQa2hLZks5NVdC?=
 =?utf-8?B?M1k2MjRCOGkwRUtVcDdJdWN2YTNxWXYyMmxDNHpYQ1RPUzRJMnhvQWZKeWZm?=
 =?utf-8?B?VUMyWS81aFRrT1pEMlVMNEdBL3VDUmM5S0tVclhMU0dKLzk1Uk9jSWsyOGxn?=
 =?utf-8?B?d3MzeUZjSEFxemh5RERRTWtIMUNzSitEQ3pubTVneVFTVnZLbk9JZmw1VlRU?=
 =?utf-8?B?S0RxdFlVSW1BS1JQSTFyYUY5anNFMmhia3g4eE1UaUxHMWpDMzVpWC9YQkox?=
 =?utf-8?B?SzMreVQ0UUM1VU45OHNwOXcrNHl1ZTJMclhqZThmcU0rSEZab1hkeU9JWjZn?=
 =?utf-8?B?UFM4YUVEeWJ2UUczczhNbnVhMkphMjFNdUtjeUkwaUNOSGtaWTE0S29EK0s5?=
 =?utf-8?B?SlF3S2JCUG1pK0Zsb0lVR0FRZWFjSU9DR09TcXdNL0REZitFUzJOeWJPaWdJ?=
 =?utf-8?B?dEJpeFdKMnYwVDMzQ3E3SUxqa3FKRjFVb01RM0J0VW1sQU5XVThKK1M3aGJM?=
 =?utf-8?B?N0hVclEySDk4SUwra1ErcjJTRXNBWnB0dEgzMEVFWkRVN0t2ZC8zRmhwbVgy?=
 =?utf-8?B?QVVIK0crYnB3NFg3VG5nOTNzWmx2bFIzSUZ3c3BrVGtNeVg1bW9VZ09LSU9P?=
 =?utf-8?B?cW1sSEtJZm9UUFZiK2ZYdkZ4djEzSUtzWm4vZkljc0hlYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlczMTdTR082dTVkSDBsNTNEc2hEK0RCVFo0eDN6MTFyTU1mNWlFcFppczBV?=
 =?utf-8?B?YjhPYnZ3cG44b2ZEK3JDbmxEeHJGWUxVUUduVjczc3c1VzdrYzVXVVhVcVhx?=
 =?utf-8?B?eFZZcW9kWkRxZ2g5bHJNMUhtMWdrazY2NW1VSEdZSkFvQ25sVWROU2JTaUs4?=
 =?utf-8?B?TzdpclVpU0kyMkY0WVhZNG50MXd0cjhKZ1BleldoTy8yV2ZJdU9lb1Bkd3N4?=
 =?utf-8?B?WmphWHdkaGdxckYydnpUdDljUnFvL2hSaUdldG5LMm9xNG85NVN3d2R3WENX?=
 =?utf-8?B?eWFiS3RmdGNSNkRsV0cwZjBsNkVKQ3BKWEJtcDJEdktqNkpyMG9BRms5ai9w?=
 =?utf-8?B?YW14bkFac1hCaWtkdHhPRWFzZ09jU0taTkdGK3BJcGpSZmU4MUpVNTF2ZjhM?=
 =?utf-8?B?Y05UdXR0cjRKSlRjcmhBZXVqSWtGdWtkbnU0RHFOdHExSm0zNHR2d2hoTnZT?=
 =?utf-8?B?U3FWVS8xdmt1STNhVXMwemxRTzRKb1ZvV0JSMUMyNmlrbFVxVTMzQlJSZ3Va?=
 =?utf-8?B?alZmTFk2UmdnWFFqa0xCN1c3N3MrWlhPZlpvMDc1bXcybEh2TUFUaTc1K0Ji?=
 =?utf-8?B?aWszQmpCbTF5bjNJYkl2OWNCaWlGYjB0aGQ4Vm1DRFVvTWI3UWdyaUFoNk5L?=
 =?utf-8?B?OXFUWUREbTg2TWhqSng2Zm1PMmVLbzRzRlQyaVdSa21rT3NFZ3Brak1FN2h6?=
 =?utf-8?B?d0ZGeHY0K20rN3NXd25oTVRKUHVzZ3huY01VVDRVaHNEa0hRSkhDZnRYZmY3?=
 =?utf-8?B?QzFrTTBjbm5tclhBN3FoY1k2VHR4Z2p0Q2IxeExaNUhzVGdoZlVkTkx1c0Vl?=
 =?utf-8?B?QjVacTF0akJZYm4wWW5yQ3ZBZlkrMmpxU0V6UHpObGtzNS8xNEVlK2tMZ3I1?=
 =?utf-8?B?b0R4dlVkdlVYYmxETDhtckJsK3NGc0ZZejR0Yk1KSjFGc3NTOGcrWklGWVVP?=
 =?utf-8?B?bHduWm94RFZMei9WbnhDdUFUb0ZjeFNSSVJUbGdlOFU0RjVEM1FwdTlSbHRO?=
 =?utf-8?B?alZZMWd3QzFJdUlXdzM1dnRzcEZEYm4rWXFKc0ZjcGtmTjNpUGJzRGJ3a2Yv?=
 =?utf-8?B?QzRhZ1FvK2U1WkxsZUt2Rzg2VFpRSVpzaVZSWmNNK0p4WTBUZXJqWTQ3WERx?=
 =?utf-8?B?bFNuNE1kcmpGRUZsWmZ3b2JtcUNSWFREaHRvMWRzTmw3N3ppekttUzQ1bjFV?=
 =?utf-8?B?bVI5WlpRNUU5ZFpCUU9KRjNuTkVEQmZNSnhDNFkySEU3d2xQVmphWWhQTXEw?=
 =?utf-8?B?RmtUUnhDUTJvRTE5US9XTk5zb3lSdDhmZkFna0Ywd1RYZndLK2JUSWp3RWZL?=
 =?utf-8?B?TENhN0FPM21TSkxvVjZmMHVyQVVtdXR6SHZrczc5VnYrZGI3UGNTZ082YWVz?=
 =?utf-8?B?RDhUNW1LNTQ2eVBTWWpXeGc2TWNSQVI0RGYrN3dlR01YM1Qrb1pMNHg5UFRL?=
 =?utf-8?B?TFZ5MVQ3SUo5cXlPakRyNG1zZHcrc053czRxUzBSbTA4ZHU0ejRuUFBwbmJp?=
 =?utf-8?B?eW1DcFVUOUVhKzBORUZaYjZUMm9RcC9JYlF1NjJRV2w2bGdNN1h2NlNCajlZ?=
 =?utf-8?B?WGMzSnNNRUVsSGJCYUtCTFBwN1FaRGZjdE9ab3hzYTJjUjI2NWdybVBQTzNO?=
 =?utf-8?B?L3JOSmZnTnhZRmppWmpCSWE4d3lmSXFPbzFYMk9ncFFOVE9EanVlMGV6cXdq?=
 =?utf-8?B?LzZEcTNSVmptUWpObHpsUWZ4RTZhRXZrSEpiNkw3NDNqRnVXVEdmeE8zeXRk?=
 =?utf-8?B?NWlBWVczRVBBa1NQdnE1M3dlaHNVZGo0TUUyczc1VmhnY2pEaEYzeDVjMDAw?=
 =?utf-8?B?emhlN1laTWZXRFNOOXJOd1IwekQreXBLelVnSzl2ZnNDcmZ1YVhTQXluYUwy?=
 =?utf-8?B?aUQ4QXZ6azY1UFZ3UGhnYk95Y25tL0ZpbWY0cFQrYml6enNnUG9pdGt6UXZt?=
 =?utf-8?B?dUpQdnpLanZhL3UyUVpDRGh1ZnBZbUpqbW82TjFzcnFpaUNlYWxGQ2xJSkZi?=
 =?utf-8?B?R0dSSXVqdjN1Z20zYjl5c0NKY21ldjdoSDdBb3E4WXQ0UVZEdlllbmp2RDZ6?=
 =?utf-8?B?NlJiSGFqb3M3RnVuZDk4Y2pYNmczTVVlOHpjeWlZQ2c5Yndrb3NwczdtYVlG?=
 =?utf-8?B?c2VMUk9pTms2b0xXM25vVkxZWHFLc2Y5S0ZmV1FrUmo2NTI0NzBLV1NCdW53?=
 =?utf-8?B?bGU0a2NtdlhnNEs1OVFvQ0NDY09xODFzNGZtZFBpQW5XYVdSTktTYk9RaWlm?=
 =?utf-8?B?OENTTytZcVRoRHpDOWdXSVpYc0gxbU4zN1J4QVRCTnlkK3U4aFA5RmdFTG5s?=
 =?utf-8?B?U1VWRGxqUHBZT0Yyc1IwSWY1Z0pVVk5Ddm54cFk5U25ZUlBkQUJnWHFJclJv?=
 =?utf-8?Q?qu8W5bYnhq73JDHQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f3175-9aeb-4a22-36a1-08de522f567f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:07:20.3074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rOsCvGWBmuq+axcLVOa8aAWLUomYaurPjdnpq6Cx6/X0DpQKYx+hpNcFjjGkHmFSs65XvFqsu4Q7qqSamsijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
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

On Mon, Jan 12, 2026 at 12:50:01PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> > > folio_free()
> > >
> > > 1) Allocator finds free memory
> > > 2) zone_device_page_init() allocates the memory and makes refcount=1
> > > 3) __folio_put() knows the recount 0.
> > > 4) free_zone_device_folio() calls folio_free(), but it doesn't
> > >    actually need to undo prep_compound_page() because *NOTHING* can
> > >    use the page pointer at this point.
> > > 5) Driver puts the memory back into the allocator and now #1 can
> > >    happen. It knows how much memory to put back because folio->order
> > >    is valid from #2
> > > 6) #1 happens again, then #2 happens again and the folio is in the
> > >    right state for use. The successor #2 fully undoes the work of the
> > >    predecessor #2.
> > 
> > But how can a successor #2 undo the work if the second #1 only allocates
> > half of the original folio? For example, an order-9 at PFN 0 is
> > allocated and freed, then an order-8 at PFN 0 is allocated and another
> > order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> > without corrupting each other’s data?
> 
> What do you mean? The fundamental rule is you can't read the folio or
> the order outside folio_free once it's refcount reaches 0.
> 
> So the successor #2 will write updated heads and order to the order 8
> pages at PFN 0 and the ones starting at PFN 256 will remain with
> garbage.
> 
> This is OK because nothing is allowed to read them as their refcount
> is 0.
> 
> If later PFN256 is allocated then it will get updated head and order
> at the same time it's refcount becomes 1.
> 
> There is corruption and they don't corrupt each other's data.
> 
> > > If the allocator is using the struct page memory then step #5 should
> > > also clean up the struct page with the allocator data before returning
> > > it to the allocator.
> > 
> > Do you mean ->folio_free() callback should undo prep_compound_page()
> > instead?
> 
> I wouldn't say undo, I was very careful to say it needs to get the
> struct page memory into a state that the allocator algorithm expects,
> whatever that means.
> 

Hi Jason,

A lot of back and forth with Zi — if I’m understanding correctly, your
suggestion is to just call free_zone_device_folio_prepare() [1] in
->folio_free() if required by the driver. This is the function that puts
struct page into a state my allocator expects. That works just fine for
me.

Matt

[1] https://patchwork.freedesktop.org/patch/697877/?series=159120&rev=4

> Jason
