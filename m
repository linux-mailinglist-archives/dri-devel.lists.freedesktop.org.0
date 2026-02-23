Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOLhCzfFnGnJKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:23:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60017D899
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B9510E112;
	Mon, 23 Feb 2026 21:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIXwXE09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF3D10E112;
 Mon, 23 Feb 2026 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771881779; x=1803417779;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FcYAAu6CE5oPWua6FSh/naP4M1rkJ16uv5wLxYYkVR8=;
 b=oIXwXE09zqWyuZp08C0YbvEMcqrTNG98dUGcAeiWQy66F3kLnYfVjEhU
 BxwVRMbrEAHq+qQgttpMto3AiyaYyUcbl2kmn6pWthxP5GUJfQpYgvgiO
 JBbMF1ROoaezCpmjRiClpscg2k99sv/vUlOEY79z3L/XB4MeEzVQ/ehNm
 A/hclA1rP5//8dzeD8Z5GopPB0W05hUxujWIhMFgpXQ8d9Wh7s290ufpQ
 Pkev5MPzz5lJoVPflaT3zY3pur9w1oWlg/w1tbxhPMGR0alqDoY9lPvo1
 hclXsL6ZL5eOZtXVH2j06UBxneVErgMJisvUKiBGYApSg70sHZN39QZaK w==;
X-CSE-ConnectionGUID: 4U2hE/PGQSO2EjGNLPoPzQ==
X-CSE-MsgGUID: mhWQPkvTSRqjc+JirTO1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90294907"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90294907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:22:59 -0800
X-CSE-ConnectionGUID: 2zHIjZGETwS4tVISAVXePA==
X-CSE-MsgGUID: X8jKa+T5TgKv5R2RnVFJWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220211917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:23:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:22:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:22:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:22:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWcMvx/6XIfiYbgahPIaahD4aK+SJsdkfMe0yqSPHCw08OJkoB+vnbvwQFnWg074puqFJrXzNcPuXpH6eEQ9RxLF6J+nzq5qY8jHCsa0itEbelAFAXJQe1Q896s5ws5Y4fV+ctp3G/EC2zh3zPbmqObYdH7oaLvJan4vs4NkX4uCjIxDpKkbfmu75BNh90TOclOm0lqD3NW6xtsaGELIvlVX5sfjkVh/UadqnsBunouNxogntbfH9RlvK6yEdtwWgEW4/hQ5M2owCsqAXh7DDvd4HFHwateZpC1oWteXIe0+ThRvX9ersSCuxjFCRoEnKFN9+49Y/NJCLTXQFSw9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y00hyRSJV/UTZmkRJH6VXy69cZFJdE9Vtpc5ijZmuJ4=;
 b=C05RebQVKUeI63iCGBsbyvFcXRRnAooNBi+BDe7AVjwFrPLP6Vjx/+rJzCOmEzdYela2DE5H0poBMMCRW4xNvIYgUgjCWXjBI1T5uygz0qy427z2I40ZXLdGGvU5XUERmfNgQ+eF5yn6n5t37Fo3giYDatVECZlaBjHgGNDUvQvZaNcT5G6iCvw1BoxzJmm21iDqbOc4aANKM6THoBkfwdNSimAHX2lf2xGcQfIuFoLxsz2rvltV+KliNTcJwZb1AcoDrTBOLkwVEjt8p5YHjYWgUwqvlownTF3kp9E/K1dyGACvn4t9TmyhPSd1WpeeC22b1+wHQKR5yFPN7TDFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Mon, 23 Feb
 2026 21:22:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:22:55 +0000
Date: Mon, 23 Feb 2026 16:22:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC v2 1/1] drm/xe/pf: =?utf-8?Q?Skip?=
 =?utf-8?Q?_creating_DRM_device_entries_in_PF_admin=E2=80=91only?= mode
Message-ID: <aZzFK-wdWZpcXVz4@intel.com>
References: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
 <20260223150951.1834063-2-satyanarayana.k.v.p@intel.com>
 <5d56b0ab-ca4c-4a5d-adf6-245040b4888e@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d56b0ab-ca4c-4a5d-adf6-245040b4888e@intel.com>
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 79676a49-2b0d-462d-e377-08de7321b5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWMvOFNHUExucnlMaS9lSDc4NEtqdE56QTMreUwvcndsNlhUNFgvUEhGenlC?=
 =?utf-8?B?bk1nMlQ4UHJhSC8yTE1ycDNhL3ZhQTNrSTN1QTB3M3Q5akw3ZnRNZ3R5ck9I?=
 =?utf-8?B?NFdKbWVCdVBhbXhSSkdYQkNRenI1aURmZWNlMkdQOTgzQklkZ05rNmswYnN6?=
 =?utf-8?B?dEtTT3JNbVFhRzNKdGZZOXp0aFM4N3NPNnFxajVzcGoyd0d2Sm55eVRtTndj?=
 =?utf-8?B?Q1dLMGw0UVhOYnoyemZaRUlncUFLRDZabjlTQXFQUStoZkdpZFMyb1pxRnUz?=
 =?utf-8?B?c2pKdTNXMmhOYVVOVm9iNUI2ZUlZVDJaWmpEdlY4anRCUlBVKzh1d1I5eld5?=
 =?utf-8?B?cEdzRHhKbDN6UDVCS250ZkozY2g5ajd5UFlIL1VYTktTV2lMa2I0LzRvVFUw?=
 =?utf-8?B?VVE5alIxdTdoMkVSRk0rUGs3SWlja01KK0FUN0MvUndlalIveXVZdUNjcXdU?=
 =?utf-8?B?RTFQbDdGTUc1REVZaFFwSFZuT21WVlgwVkFXNzhsd1UrSmlEdmUwVU1zbTJN?=
 =?utf-8?B?Tldjbjg3U0xQK0IxTFpUYTdtNGpVTnh2M0R3RG9sTTM3bWI0dlNwQmNib1dx?=
 =?utf-8?B?Q1pqeHRoTUJXOW5vL2IzUWdra0pCbWxrMEE4SnpwS1lDUU1vM1AwMVpJcXM2?=
 =?utf-8?B?SGxHTEROeWZKa291ZU8ydXJiYzJwdGphZzFmMDRRWlprZ0JTa20yRExUL3NL?=
 =?utf-8?B?cndCSC85K0ZMM0xicUFwR1BjU1RmVUJGSEtSa0toTHVCc05KOTdPUjhoekZV?=
 =?utf-8?B?bGRHcmpUR3gzemRTODltSk0vK0tMVWQvM2ExMVhsZHVVNDV4aENsaWV5OVpu?=
 =?utf-8?B?ZUMyY3N3Qyt5WlBENk1kcThRWlZQU25FbmpLK3RiQWVwUUpKaU1sOXFtakth?=
 =?utf-8?B?MjZrWElsK2FqMDdmMXpOb24yT0RmT2hqWks3ZjZ3Rm5pSUM5VjJqbFByblg1?=
 =?utf-8?B?ZEwzZEtvempHTm0zeURGbXUyOGFLdEw2WkFiLytqQ2pRVEVIUmljVW9MS2pi?=
 =?utf-8?B?SVlWeUxWN2s2S2pGUGxPTVRhbVhKR0MwOUpibWpaVGZPbjJ4OUxITnpkZ0M4?=
 =?utf-8?B?TVlWUmRueGlNU0RiL0JkS2l0RmNpNW1LZzRwY3l1VHpGUlhWOGVsTXFsZHgz?=
 =?utf-8?B?TnRIdjlMYitjRkhkNkNXbU9KN1UwaFlkYlZId2xLUWRLVktUSktDakp1OWV5?=
 =?utf-8?B?OVNUYnFWTzBYQWFxNlVzc3pqa3l5aEFsS3NLbmF3dnB1dWFEMHhqYTNJc1pX?=
 =?utf-8?B?Zk1lcUgzM2VFcDFFMnBPc2w0Vno1RmVNVmwxL3dSMEZPUFNLdDRRWkl3ZjNk?=
 =?utf-8?B?N2NEbHJjaFBJbmpVcm54MkQwSGtMNDR1cWk5cWFveC9wTXI4Ui95aU5pd2pq?=
 =?utf-8?B?RFYxaUthcTZGV1hBd2dxZndGNWFCZkwxVkQ3L2dnVE9UdjU0TlZXRGJBNDBs?=
 =?utf-8?B?T0JVbWFkbkJ2MDZZZlJFcTFDYm5UTVhEZ0pLQ1k4UTU0US80MDFINzNrRzFG?=
 =?utf-8?B?QlZLZklyKzB2a2dKdXBNU2JVd2VGL3FWN3lKbk54N1dXdEdBYTlBTXY5RWdU?=
 =?utf-8?B?UUtqdkZoUSs2WXp2RmNzMGlBZ2YvV2NibTB0RnIzckZ5blZ0d2xNa2xvUUlT?=
 =?utf-8?B?SE9hblVTVzVqMGNCZGV1K0FlVi9FYUZKUjJOSFRET1pQZWlleVFIUmdGZXk5?=
 =?utf-8?B?dmdxUFR6VFUvYnMyMnF4TVkzSmp6VHE2RUU2QUNrSzhiVnBmRE9qZGVwSzRq?=
 =?utf-8?B?OUxqWnJrOUVNNGRFQTBIa1cyWEhRbUhFeExrRk9GSjZ2RU92cHl0bTRGVVE4?=
 =?utf-8?B?ZFN5bEhnMDVyMzVVaWZ6TVovSGpGcXlWN21SWEszb3pGR2tsYUIrc0xZeWpn?=
 =?utf-8?B?OWdOa2xDL2lUditjeTJBcUVUTDU5d2dQbjZyZ2tZdVFvK0Y0eWx6YTJxam12?=
 =?utf-8?B?KzZscFdBM2YvZWpIWFdDWXpDRHVGRXNnbkRScVJ6WmZqSTNSVVEvcmJRL2RC?=
 =?utf-8?B?bC9BTzU3NXhpUkltbi9EUHJQUE1kZGw3WWVaRWxYR3cyZnV3REErZDlPZnp6?=
 =?utf-8?B?QU9YaGF0THIvYjJLR2IvaTQ0aXdpK0xZWVJQRFpUMXBSS0NvMWpmODNENU10?=
 =?utf-8?Q?xVuw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BRdkFycGl4OExpUUlkSWFMUmw2LzUwQUdhdi9ET3A1RzVacWF5MENhbGsx?=
 =?utf-8?B?QW1MTHRzclM0VHdNVDZZQUg1YU1jUkUrZUJ1bHd5NWttSjhacW1Ld0oyOHYy?=
 =?utf-8?B?a2x4MXMrTm9rL1BOcWQ5MzBuciszK0F4akdJZHdzbFFLVmxhRjVyLy9tMmhv?=
 =?utf-8?B?ZGtZek4vQnNpQzI5VmhZdm8yaFhUQU81UmZlTEVLelArZzQzczNKRWprRGhh?=
 =?utf-8?B?LzYxVFlJYmx6QjZ5NXVmUUxKaExsWWE1Q1M1RGhxVU1EcDNnTW1iUVhsSE92?=
 =?utf-8?B?VmV6WkJERE1Za0Zzc3EyYWEvYlk5L0ZwdkZrS25idnJTSDZPMW1BUnRBVWpu?=
 =?utf-8?B?SG5ZMmNkc2JkMklVaTVNM1pXWkFSSEhZME9oRkpqUFkrNnh1aTkrSmp4aWRn?=
 =?utf-8?B?SVhMOUFoTXNpRmM0UitLZlQzMG4rYk4zQ2V5NVpUZWtsQnlDRCtMVHYwM2V2?=
 =?utf-8?B?UVljV0F5Y0pTbTdGMDhRdXJhZUJzTnZWeEs2WVY4QXBXNHV2ZHpDR3RhTXdv?=
 =?utf-8?B?a0xMU0wrRUV6THRjVHpZYlJnTGFJbTFJcVliNGVIWk8xNDlXdTNDSDhoVlRC?=
 =?utf-8?B?YUZyQzVTaUdnVjd6SEJWS1FUREY1MWZ5ZTNuaEYzZ0N5dk4raTJ3cFQrcUZj?=
 =?utf-8?B?TGV1dy9IbkZzUnFrclRmVjJGU0pWMGEvV3FYU2JhUHV4am92WDZucHpOUk9m?=
 =?utf-8?B?UCtTR3M3RHJvcmJULytmVERuK00xVERJVWI5VGhuZ1lFVkZXbGlZWGRTUk1s?=
 =?utf-8?B?d1c4YTFWTUhVbFFUdGJYRWgxYjJpNzQvUTNnRmF4cWFiU2VkK2Z4c0dWVjB6?=
 =?utf-8?B?U1VHUDM0d2o3M2RkeWwwa0F2ZThZZVp2SDRHWUFmRXZiZjFBamc1QllHWDgz?=
 =?utf-8?B?Y1VXaGUvOVQwalFTdXdYYW9yaUJ4M25HaVlFL1k5SWNzMmZUUm5RVTVqZktN?=
 =?utf-8?B?QzdrRnVRSXYyQnRiUzlpTE9sRmJJZlU1OXZUWkRmY2NqWm1FdEJnRnVBMS8y?=
 =?utf-8?B?cHhLeTU1eUhZVm1BUlM2QVdVdE5PTi9WTGsweWp2QjBEak01NTMrNzhHdG1B?=
 =?utf-8?B?a1NNYXZ1RWxsOHhVTWZLZGxHV0xtM3ZCdWYrcitTRklBNUMvOVhqUDRucVVX?=
 =?utf-8?B?VERrT3pVUi9yN2tTZmM0WmhPc2I4VnRCRXdMT01NeW80VGMvd3A5ME5EeE9L?=
 =?utf-8?B?bHNENlBPRFNvaEtnNG5ROWM0WWFKVldPRy81MHZHVG1VRmN4V1VJQVBaOWhp?=
 =?utf-8?B?VXZaK2IzNWpsRE16ZitjVHowU2MyaWpsck1lNms3S0JHaUdudmF6dllkWG1G?=
 =?utf-8?B?aGp4eVdua1ZIRzZYL0FVZnJEQW5Rcm9rRVdhSGxBZWplekdScHhWTnZ5dkJN?=
 =?utf-8?B?OWEveDdXU0xXSlQyaS9JMU9CNE4vdFJzRUZEZnRhY2FURExTNVVKcmxBdGN6?=
 =?utf-8?B?WFEycFh5aGF6UFlrc2VRaHFvNmpHRVhpWUk0WU1Rc1JHek9kTFZKMnhJWitX?=
 =?utf-8?B?UFliN3RjNEduUXJmdWgxQUl3UXQ3YXQrbjJhV3B0N2pTSHNWMitoeXh2VEJJ?=
 =?utf-8?B?SGVlYXBWK09GZXg2ZS9EMW00eTZFeDlEVXcxc1BmSEw5bENKbExKTE1odnZJ?=
 =?utf-8?B?Rmhod3BWWjRHOWcxR3U3d2NySUZOSkM3Mk1TclBRU0FFRXg0Q2Y2N2VpbFVO?=
 =?utf-8?B?S25FN0xadjdXaFdON0pMUGVMTUdMUTdRd0t6Titxa1BXdllqaHpqZFBGeHEz?=
 =?utf-8?B?azRGZVlOS1dac293TTlDVVVpVVovYS9lOVBJLzdLSExoZ0VKL0pRY3NuMjJ1?=
 =?utf-8?B?Q2oxdDU1M3g4VUxrem5Jb1JId3pBeEhiVGFERytSZnVJWVI2Mi8vcUwyWTR1?=
 =?utf-8?B?YWxtMCtJNzAvZUZ4cW9nM3kxUkdEWnd1ME4vNTFUdEVtZ3k1WjRTUDk2bzUv?=
 =?utf-8?B?aVBmMUt6Q0o1cWxJZTNsTTcwS0h6VGs1Vk16TVJraTRXZmwwbVFhNTZ6NWp0?=
 =?utf-8?B?dUErSkVOTE04cmlObUI1ZXE5TWFzYWVHUU1VeVdzM1k5YnNiWWRaR1RJS3Iw?=
 =?utf-8?B?T2hJRzVrSDQ3WlI1VDhjV0MwdXFkdmxLTjJHRGtCVVNuaFUyRFYvNzA3Q3lJ?=
 =?utf-8?B?aVkwK2R4eXg1cVlqNy96c0pJS0RNTFJNSytWWHZvTHZ6cFVlM1c2eG03WHZR?=
 =?utf-8?B?c1pYaEh5YWxDMjJ4SnRSK0ZScU1zZCt1VHFldXpkblhKa3pMR1pFTk9EeFBS?=
 =?utf-8?B?aGlqU2FhbVlnU1hIKzFxU2ZZUldWY2JWOGllNzlVeW1wOXlGWnFuQjQ5dDhR?=
 =?utf-8?B?NVZrd2htK0QwQjBzQVo5aE5zU2NCSXZkUS9FL0JhU3JlWWJ1TmhsQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79676a49-2b0d-462d-e377-08de7321b5d2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:22:55.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIIULqxq37POe53mVMSPeyzkTJMD1YWI1NbXBzOrheYEwdnaPQ0keSVFRHNNT4UrWfwcFZe6FbFZELkLpmECDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8D60017D899
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:31:56PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 2/23/2026 4:09 PM, Satyanarayana K V P wrote:
> > When the PF is configured for admin‑only mode, it is restricted to
> > management functions and should not expose a device node that would
> > allow users to run workloads.
> 
> maybe instead of doing such massive changes, better option would be to
> define a separate drm_driver structure with different set of ioctls?

Well, I did considered that option, but that wouldn't be backward
compatible for UMDs. They use the availability of the cardN to enumarate
the GPU, regardless the subset of IOCTL you might have available.

> 
> as maybe in pf-admin-mode we may still want to use XE_DEVICE_QUERY
> and/or XE_OBSERVATION or some other future ioctls for VFs monitoring

As of now, there's no requirement for any of these IOCTL to be present
on the PF while VF is leased. So, this option here is the most
straightforward.

Except for our usage of the drm-debugfs. Hence this patch here end up
aligning with accel on that sense.

> 
> xe_device.c:
> 
> static struct drm_driver driver = {
> ...	.driver_features =
> 	    DRIVER_GEM |
> 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
> 	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> ...
> 	.ioctls = xe_ioctls,
> 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
> };
> 
> 
> static struct drm_driver driver_admin_only_pf = {
> ...	.driver_features = 0,
> ...
> 	.ioctls = xe_ioctls_admin_only_pf,
> 	.num_ioctls = ARRAY_SIZE(xe_ioctls_admin_only_pf),
> };
> 
> the only problem seems to be that we have to make this choice sooner
> than today we detect PF/VF mode, but OTOH the admin-only-pf flag is
> only available as configfs attribute so we can just trust that flag

Yes, ideally sooner. Ideally if we could extract that from some
early SRIOV provisioning info and pass the total num VFs = 0 to avoid
this mode. But this mode being the default if in PF.

> 
> > 
> > In this mode, no DRM device entry is created; however, sysfs and debugfs
> > interfaces for the PF remain available at:
> > 
> > sysfs: /sys/devices/pci0000:00/<B:D:F>
> > debugfs: /sys/kernel/debug/dri/<B:D:F>
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > 
> > ---
> > V2 -> V3:
> > - Introduced new helper function xe_debugfs_create_files() to create
> > debugfs entries based on admin_only_pf mode or normal mode.

Although this patch is bigger around the debugfs, it is less intrusive
then the previous one.

I glanced all the patch and everything looks good to me, except that I
didn't carefully reviewed line by line for now yet.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> > 
> > V1 -> V2:
> > - Rebased to latest drm-tip.
> > - Update update_minor_dev() to debugfs_minor_dev().
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |  1 +
> >  drivers/gpu/drm/xe/xe_debugfs.c               | 18 +++--
> >  drivers/gpu/drm/xe/xe_debugfs_helpers.c       | 78 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_debugfs_helpers.h       | 27 +++++++
> >  drivers/gpu/drm/xe/xe_device.c                | 20 +++--
> >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           |  8 +-
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 20 +++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  5 +-
> >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 20 ++---
> >  drivers/gpu/drm/xe/xe_huc_debugfs.c           |  8 +-
> >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 23 ++++--
> >  drivers/gpu/drm/xe/xe_sriov.h                 |  8 ++
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  5 +-
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              |  5 +-
> >  drivers/gpu/drm/xe/xe_tile_debugfs.c          | 10 +--
> >  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 14 ++--
> >  17 files changed, 202 insertions(+), 73 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.h
> > 
