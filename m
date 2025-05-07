Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2EAAEF66
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5724710E299;
	Wed,  7 May 2025 23:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvPmVd5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F1410E1C2;
 Wed,  7 May 2025 23:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746661462; x=1778197462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xmDOSLrrOEUfepvR0mqdg6cXOqL+HpTXosg5NYlkt6o=;
 b=hvPmVd5Hs7nPnSA4truRytJ596qKgpn28U5SHlbcJM2nFwM250R52EJ2
 7cs4YtWwpEY8MI/ASIFh9tnnGU6h7ChINUqJ8zPqaNNFs6+S4/P5aOUsp
 OEp/js/aM1XmTxquJrcTDR1v2y5xhJAjCqbY6JPU1PpFkgF9KUUmG8BDl
 N2ldf6r5VoU0+xz4qnYFm0UomorV3CRvp02lG8UDp07CKKUnj4fQoqmXo
 Bck3NhNcwZhG+tOKbB6TYyEymku3d5bJI0kSbieN4CzWyDEN0RYFLDODb
 jmtyb/CP/Kaf6dhdX4Lx/sVTO1IAuCJ/twVQ6gGELHqId9bggI8g8Bu3H Q==;
X-CSE-ConnectionGUID: y+6rDCu/Q/i1Da39J70G2A==
X-CSE-MsgGUID: AacEA1AnQj2flTt9s/T0HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48566601"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48566601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:44:21 -0700
X-CSE-ConnectionGUID: mUAFqGXHSICq7Pjq1zNlCQ==
X-CSE-MsgGUID: Cf7PuHupTp6ShyZzisJafg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136627450"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:44:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 16:44:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 16:44:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 16:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5PLTNjcmmSjF21SnOLFBQLFknk9HruKcpKzxhQGAXaOAi8bwwYcHYlBrq3Iwb5Cdws+K3a8z4FzT58ovYetyptSOVoNnZA2w1pDARaggsmsOHgUFdKVTvFSw3clxBFIAAq45CKDHBr3St/WQmgNWGiWiC23ZR8BeYK0fNm0d8H4mG0Xl/ozzhwA5/Z3eomGZQD9bxK5Vt8v5Dntt8zZ4QjN2Gd/NVvbRnwJFPCB3HyGbvwFW2viWabGah3lb2qTnbt5xkHTHIDonfpKEPoslpRKVcAHkcTF4wMUe/e7NxP1xaj3Oyv6NRailUY7QLYjh7PqzXngK6AbIO5anVpmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYRHseqgRSAwh2i/S4W4xBl1FzWlDrs7pLqC9mWLAyo=;
 b=GRaw6L8mfxBIpz9PGkNgMYNHJrWZHDHI1y3VoNHq8iXJBH4DC6cJbckUxjR5F63VlmAAP5cqNjI8gF/GkA6bbWU1HycFoWR8QRwi+lJDYtnoX2tJ/9ID6fxTByONtKeZipGAdjzWxH5Zsv+f5G8tX6Xjl3TtiFmKH/X5b4Apzr54mdSTwD9mIlh0Vyt/UFs52bQQO1+hv6W62PSTnek8PplpLNZqBB67AugyNjv3QILwuLdaQncjzW4lwuVes8cg3j/2LzpQV9KYgb7hc8LbjMHe425tlozoxqMPl+7SPVt/X20TA7b/4eUNTS5JgIiHTUSB36Jx6JB4KN8hWdMq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PPFD83941681.namprd11.prod.outlook.com (2603:10b6:f:fc00::f55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 23:44:18 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 23:44:17 +0000
Message-ID: <6e381497-cc19-4aa5-a6d0-cc4deccfbcdc@intel.com>
Date: Wed, 7 May 2025 16:44:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250429160956.1014376-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:a03:167::40) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PPFD83941681:EE_
X-MS-Office365-Filtering-Correlation-Id: a1efaf19-d8cd-46c5-4184-08dd8dc114bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUtCcW11TUEwMnY0VThuSUIybnNyZUd5S2VxUm5sd1F0c283enVGWUVDQVo3?=
 =?utf-8?B?Q21ISUFrbEhyMkpRVHV6dmd3SFFLL0ljL1hoRXA2QkxKbVoxU2J4SUJ2NFZD?=
 =?utf-8?B?WVp5TXdObDZ3b3FBMHdvKzEvOGZhYUpFTEg5K2d2dkUybm1GUjJnYkRoSWRh?=
 =?utf-8?B?R2Q4QjQ1bWdPeVo0aEwvQ2FGWVMwZ2lHTkV5UFJHMlBBbmFUMi9XUnpBTWU4?=
 =?utf-8?B?ZHpQb0tVMDJxdDVFMFU1QTVCdW5pN091ckE5dkhvQTZIWDdJNFBpcXMrN0Ny?=
 =?utf-8?B?TGlpc0VBNy95U1VJbmpuNU1QUkdHUHB6WkttZG9Malp6a2tJdE5SOUo5VCtz?=
 =?utf-8?B?OHB3ZWJiK1R4cjBnOUhMUnZua2lHTFgzTHY0U1RiSzhOamNyY2JTYVdRRkZY?=
 =?utf-8?B?dlluL0oyRkJYdkJOSWNQWVNnK29yOG5KdVZRY3BlNXpoWkdwU1FwVGVidDl5?=
 =?utf-8?B?cEtQLzFwQ3NvK0tMZ1pFQ3lleWpkSXM3dGJ5cVUwL00wb1lnaEJEVmJJajFM?=
 =?utf-8?B?MmxPQlI2TlQzRkdDREdWS2kxeGc1Szh6dEUyZThEcDNXeVBtd29HRnVJVWZQ?=
 =?utf-8?B?QWtRT3U5TzZHN2NmYlUvYU1TT3VJbzRxNTlLcE9HNWpUSlh1bGJTWndOSmRX?=
 =?utf-8?B?bjlHWWtkT2s1SzZuQWttK0VGWDZyVUMwUkNiTFNDMVc1Umo3NHhLYjRTUjhO?=
 =?utf-8?B?aWpaK0tBdXhIRW5RUEF0SlAvbkdKMlhTM3g0MmcrZXFFeS9iNzVsZ1d0WUtJ?=
 =?utf-8?B?VkdEdWRNaE02UFdIMFdPTlJaeWUxNFF5Wmc4dG11dzJxY0VRcG1VWktYZkNy?=
 =?utf-8?B?REVHMWM2M0FhUXVKQ1RsWGlkZWVGeWdISXFPYkM5SnZ0U0E3QzlmeG1BN1B6?=
 =?utf-8?B?ZERIbWdKelNYQm9VejFsWUhZSXFaY1FZS1VPamJjTitLVTdBNVV6ZE1uU2py?=
 =?utf-8?B?ZzJWRzYrLzJTYnBRQ1gxZWFVQW1wb09Hc1c2ckxVcm1GT1VNZGhKY1BIS3Ax?=
 =?utf-8?B?NXRSNk9qT0wvaTdtOE9PS1loTTF4bG5Sc1dEMDRDWHRSY3dEY3FOdk9saUdw?=
 =?utf-8?B?cW9UeCszQWdDaWpWclo0aTIzYmdQN016TERJOHlac2xtY3dJRWhwOU0rRVIr?=
 =?utf-8?B?bkNRemlNZnZYZGhuN1JXeUFhTXRUWVBOMEhXWHR5TzJHdk8wSWxjUElZQjhO?=
 =?utf-8?B?bHpQb0U4ZUJacmM3VkRLa3p2Um5BM200THo2eENaeklvUDk5UGNHbld6NXFQ?=
 =?utf-8?B?QVFVWkRFR1l4bzZ1NzNLdHhva251NUhsdEloNmRvaHIvdDhSQ1ZrMmlBUEt3?=
 =?utf-8?B?dDhVUXhiNlNHazdSTE16WkkxaXlxczZ5dGw3ejcxcXN3UGVGbTBIS3JML3BG?=
 =?utf-8?B?NE1wQ1diRllwZHgyZDhaWmwxVEZyRnM5cUZBbXNWLzZMdFVMU0V6YkZReExN?=
 =?utf-8?B?N1IxSzcvZDBCZkxqdkd1N0o2WVJuV2pCVzk2UDNTYW1hN3NyNVFzV2Q2dHVU?=
 =?utf-8?B?VlhiVVJzTG1zUWM5TXhEK0lEL2svd3hrMTNLRllQWmtQdXZvSVl2SVlwa2Fk?=
 =?utf-8?B?bW1jc0NvTmMwWmh6M0NBZm1ORzkwVFloL0JGUjlPVHJKc3N4a21zL1p0UW0z?=
 =?utf-8?B?SnJkRzRJaEp6b2xJUXg3MlZmaEpBcC9maExVdkl3aUlNOTIyQnZKbWZpc0NG?=
 =?utf-8?B?WlVVMzFuOWFMSnEwanFuRFZXZW9jNnd1Z1dxb0xhVDFnQjBIb3R5L3o0a0ly?=
 =?utf-8?B?OG00VlB6Q0VFa2EyVVlrZEYwaU1MODlacXR4OHVtd2l4R3hHbTgwV1JHSWxq?=
 =?utf-8?B?STdqSzNGREFTSFBiWnJPZERqd2p1UFJ6VzgyckUrajE1cmk5UXZSYzNBanc3?=
 =?utf-8?B?NW84bTlZalJPMkpJaCs2UHBOci8zRHd0UWdVQ3NsSVRQMTJZNUQ2dXBBcm5X?=
 =?utf-8?Q?QeLnPTYUjTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFzL3BJYzhQUUN2T0FMS3hPMmp4d2hpS3M5Z2hPeHp3Tlk5dkR3OEtDZEtt?=
 =?utf-8?B?c0pwbDlkMzZrZDZ1d0VzYkxKam1GRmE5N08yTGJPeDZFOWpsbzFMQlNjMlVQ?=
 =?utf-8?B?RlZHNEU0TkZNNTNXcmcySCs0U0pYcDhzQTk5SnlZOEt6MXF1Sjkrd091VWYz?=
 =?utf-8?B?NlFHa2M2ZWF2Y1dKWVQxMVd2VjlaU3M0dU94ZzJnai9CVXdzdk9WcFU2emxY?=
 =?utf-8?B?Q1VaM2xtT1RVbTkwWnNJYjI4UVB3T3d1Yk5SeG85OGErWVVWc0kwMTVxa2x5?=
 =?utf-8?B?OW83djlyQlpxY3IzMzA3blFENURYRHorbks4VXN3UVBkMGZwS3h4NzJjUW82?=
 =?utf-8?B?L3FYemFPUkV4OUNrOXJ1bzJhUHhRSnFEeEwzYzE4U204dFplNC9tcGRJSTdp?=
 =?utf-8?B?S0lrNUsvQTJQOUhGaCtXaHA4elhhbU9LNGQ2SWxMdzVlNjNaVVR5bFU1K1l1?=
 =?utf-8?B?cXlXVGk0L1pnTGQvdEJtaXViMkk1WEF3a2IwcWRzSUQzWHN6NEJSeGhGc2F0?=
 =?utf-8?B?Wlhua1NuUmVWRTBvTHppdXdHdzk1RDBlQWlIb0Y1dmJMSUYzajlRUEJjeDJ4?=
 =?utf-8?B?N3JmMWlFak50ZzZxblBTSDV4d0t0aDBucmRKNGJxUDdReDREa3ljNjArSWZC?=
 =?utf-8?B?M2NtcFhTSFRhNWJndEVFL05LaTZuYnRyTFQ2eW51SkUrcGxINDhQLzNzZy9R?=
 =?utf-8?B?dFUxWEVHTW5vdVJMa0JRQllYa3BOdEN2cEJsWm9rVy8zRklzR0ZXUERrR09i?=
 =?utf-8?B?QnFxcDd4MHBWOFA2aFhScVZwR2JBMXd5bzJ5QjhBTWU2SHIvdzdNM005aFQz?=
 =?utf-8?B?dWNkYmVRM0tubjhUZzM5RkJnT0x6S0I3cUFGZ3d6QWFGMUVnOG9zcUMvVWNp?=
 =?utf-8?B?K05sS3huTnN4NGw5LzhranQ0WjdxUTcvbUxGVFllYmxqQVR3RFdramM4Nlgw?=
 =?utf-8?B?QkdaYUtmL2x1NzdYNVR4NDF3c0RwV1dKdWptU2FjNnlmNWg0TmRhaFdnTURT?=
 =?utf-8?B?MGdMd0ZLY2FEbHN1NnRkU2J0OU1MVXV0UEE5ZFZXcnZMTmJMWmw1akZvSVNI?=
 =?utf-8?B?bEgyOGc2NGQwWGN1ZU9PUTNnYUVYaFdWdG85czUxdVNiN21oUFhxdjdzbmpH?=
 =?utf-8?B?TWwzKzF1TVpEaDVlSUxMUVB6QjRIcHZucm81b3cybWp6V09YN05IZE84ekVE?=
 =?utf-8?B?WkowaEh5aFZ4akxjU0c1U0VhQndpcGtGNzk5a1FmOGF0SG1GbUtkZHN2ck1M?=
 =?utf-8?B?L0xnc2lhOEhRbDVkbjVJNG9lZCtNRnkrcWxKN1Q5UFM5WS8xVGtEZ0ptdmE5?=
 =?utf-8?B?VTlBVk85S2tRMm9iL2kra3NlZGZhdDZqcmxGaG9XUEhtZC9tOUF5M0RDd1BU?=
 =?utf-8?B?WHFnVHlxOVdkQUV0cUhDdkpVbjhZcEdmTFpuNXkzVnVIQ2xncWU4NmxKcDN3?=
 =?utf-8?B?SkJ1VFowWXZDK0JhNEJGODR4WXF3bTZhYWN5OENKMG5tSVZnZno1b3VFbmxQ?=
 =?utf-8?B?TzJtSndDMmZwOURMNWZRMTZ2SHNqd0tmeUpua1JvQ2VFRzJnSjlsQVF0ZGJ2?=
 =?utf-8?B?WnIvN0I3a3hCOHgzQUI4TEFnSTlkdVdzeXBjZkFwR1hURzF2eUpaQXlTaHBx?=
 =?utf-8?B?UmtvdGg1R2x4ZlA2R0wyT1hIRGpHNHcyRDhiVmRkZG8yUWwrS3hrMWoraVl5?=
 =?utf-8?B?aFRpbVd6RGJRMHFDTDd6NStWRWVSOUYya1Jxd1JHY1VUZGU3OURPOXpTeDFK?=
 =?utf-8?B?cDJxOFN5TWJKYlBLNmRobG5tWDhjOEJjRGRvZjdCVkNNR3NnVDNXR0hVZWFU?=
 =?utf-8?B?ZC9ZM3dWVGpzSytVRGNvTnNtUW5TcFFNNHBXSmgxSEs2NHBZY3djKy9iTXpW?=
 =?utf-8?B?emRHdHhJMjlzMi83clhQZWlGcmh3VWR3bEIvVWJnYjZLYVhLSE5KUGx3VVhI?=
 =?utf-8?B?azMraWZjQk0ra2l0eXZmVjNZYVhRalJwa2F4bTNWVUhKckFFK0NndllsTlZ4?=
 =?utf-8?B?TElZVmJzM09LczV6dFhjTGpKR2h5ZXVSVG1NbUorcGk0M0tKRTZRQXQ4UlAv?=
 =?utf-8?B?T1ZxT2ZhSTNYT0hIRFk5N1FQVStNNWQ2dkNRU3BYQVpuY0ZwYXJrbTdxTXlC?=
 =?utf-8?B?RThDT21PS3FSQXlleVN6T3JsaHVldlNMRUlab3BsMm8xaFRwVFA4d0NXdWYw?=
 =?utf-8?Q?brhYpepWrAdEcLC1vh8NUEc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1efaf19-d8cd-46c5-4184-08dd8dc114bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 23:44:17.4080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwLAjtGOMPrnMS085Osn/WkZQQeR3BPJvl5JUdHLwKdMpfx4wGYdodSUbdNhrA27J0ftx6/yqP90pQBOWelzeZHn21fazVFdbmukjttS8uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD83941681
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



On 4/29/2025 9:09 AM, Badal Nilawar wrote:
> Load late binding firmware
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  2 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 91 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h |  1 +
>   3 files changed, 92 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d83864e7189c..30a416323b37 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -894,6 +894,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_late_bind_fw_init(&xe->late_bind);
>   
> +	xe_late_bind_fw_load(&xe->late_bind);
> +

Why does this need to be a separated call from xe_late_bind_fw_init?

>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 297238fd3d16..7d2bc959027d 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -16,6 +16,16 @@
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_pm.h"
> +
> +/*
> + * The component should load quite quickly in most cases, but it could take
> + * a bit. Using a very big timeout just to cover the worst case scenario
> + */
> +#define LB_INIT_TIMEOUT_MS 20000
> +
> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>   
>   static const char * const fw_id_to_name[] = {
>   		[FAN_CONTROL_ID] = "fan_control",
> @@ -45,6 +55,78 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   		return 0;
>   }
>   
> +static void late_bind_work(struct work_struct *work)
> +{
> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> +						      late_bind_fw[lbfw->id]);
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> +	int ret;
> +	int slept;
> +
> +	if (!late_bind->component_added)
> +		return;
> +
> +	if (!lbfw->valid)
> +		return;
> +
> +	/* we can queue this before the component is bound */
> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> +		if (late_bind->component)
> +			break;
> +		msleep(100);
> +	}
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&late_bind->mutex);

You're locking the mutex here but you're not checking that any of the 
protected data is valid (late_bind->component can be NULL when we exit 
from the above for loop, or it might have changed from valid to NULL in 
between).

> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
> +
> +	do {
> +		ret = late_bind->component->ops->push_config(late_bind->component->mei_dev,
> +							     lbfw->type, lbfw->flags,
> +							     lbfw->payload, lbfw->payload_size);
> +		if (!ret)
> +			break;
> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> +	} while (--retry && ret == -EAGAIN);

In which scenario can this call return -EAGAIN ? As far as I can see the 
mei driver only returns that on a non-blocking call, which is not what 
we're doing here. Am I missing a path somewhere?

> +
> +	if (ret)
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
> +			fw_id_to_name[lbfw->id], ret);
> +	else
> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> +			fw_id_to_name[lbfw->id]);
> +
> +	mutex_unlock(&late_bind->mutex);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +	int id;
> +
> +	if (!late_bind->component_added)
> +		return -EINVAL;
> +
> +	for (id = 0; id < MAX_ID; id++) {
> +		lbfw = &late_bind->late_bind_fw[id];
> +		if (lbfw->valid) {
> +			drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
> +				fw_id_to_name[lbfw->id]);
> +			queue_work(late_bind->wq, &lbfw->work);

Do we need to flush this work before suspend to make sure it has 
completed before the HW goes into D3Hot? Similarly, do we need to flush 
it on driver unload to make sure it's done before we de-allocate stuff?

> +		}
> +	}
> +	return 0;
> +}
> +
> +/**
> + * late_bind_fw_init() - initialize late bind firmware
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
>   static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -93,6 +175,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
>   
>   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
> +	INIT_WORK(&lb_fw->work, late_bind_work);
>   	lb_fw->valid = true;
>   
>   	return 0;
> @@ -108,12 +191,17 @@ int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   	int id;
>   	int ret;
>   
> +	late_bind->wq = create_singlethread_workqueue("late-bind-ordered-wq");

Where is this WQ destroyed? Also, I think that using 
alloc_ordered_workqueue would be preferred.

Daniele

> +	if (!late_bind->wq)
> +		return -ENOMEM;
> +
>   	for (id = 0; id < MAX_ID; id++) {
>   		ret = late_bind_fw_init(late_bind, id);
>   		if (ret)
>   			return ret;
>   	}
> -	return ret;
> +
> +	return 0;
>   }
>   
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
> @@ -179,7 +267,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   	}
>   
>   	late_bind->component_added = true;
> -	/* the component must be removed before unload, so can't use drmm for cleanup */
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index e88c637b15a6..edd0e4c0650e 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -13,5 +13,6 @@ struct xe_late_bind;
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>   void xe_late_bind_remove(struct xe_late_bind *late_bind);
>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>   
>   #endif

