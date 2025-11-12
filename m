Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1CC526FE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E25A10E71D;
	Wed, 12 Nov 2025 13:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLAguqCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803D10E71D;
 Wed, 12 Nov 2025 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953780; x=1794489780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iLI8JrHHVQ2cYjhscbGAx5Lh+VTaODeQh/bwkTRrP8o=;
 b=bLAguqCFDXajHD/f3oetpObbJgCriGm+3zjCjHQV3NYMMYKIJspSZDQb
 H3nwL64D0lJH9QZs2Sv3n6w2ixpJvd98i9lx8ttWl0a9DyW+CS9PPzy06
 WM5mbiUBg5Vh5NzTDSTE2WiRXDpJ/7eKkOqXQvFyiX7RVRSYOPkRd/XNX
 h9nG8gTV3E5D6vsQMDja7QCzCcu4FYyCCI+DUXJXyymkXFXuoCV6rz4xr
 QAW6iRsdtrZkINVdQIf1ke8v55pkmhc9ypSNfhEFvopzYINrJBulalhgr
 iUpT4a6EFcwAroQHA43ZsYlvDSdoMvX6cw0EKny7j4rEtcj3OuvL82t3d g==;
X-CSE-ConnectionGUID: EsnQs9yyRVSQaDNtAh2ZNQ==
X-CSE-MsgGUID: AQVBKk4+RuyH+IdMhKUluw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64897890"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64897890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:59 -0800
X-CSE-ConnectionGUID: L8WFlTylTy6LWZq8iRG6gg==
X-CSE-MsgGUID: jjUZ3L+lRdSl3ydeKJj6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189195057"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:22:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVSz+THTVe6JFCxZSwWC9gyb5vA/azpZxk0CduWEbY08cxKth5sIYdV53npmp+rUyLd4b/XVux04Bd0D9QIMnP4sb4juRg+JJE/LiTkHiUu0Gr3jmFxP7hYt7NSCbPGpdWRzAaUEteq3LDU/fK4T0IDXVMHLyLM+c0reAEY77FEJuAPMMgGMRY8aaGLjg5LzImxSKdeDSsnZ99oqBHJSvmmNT/ozTRmlOPFg6dqbFtE1KNNfEM+qY5MJmYI4lwZ1yLYe0zOUw712RUz5yA3BSKK3tP/lIfk1Wvin3ZxdXy3vQI8ASkMbjERCfYPjnb1I7BVC+4hQvJs5r4PSjG6Epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uqQJQhkv31wXmqP5UoOVV2fWguWHzqPsmRB5Q2ru+w=;
 b=fVF16vkZXSnUcMxs7zcYqeW6k5qX7U9W/8i5UvCVKAAqFdDqXAOGNPqZgbqwFLC2J1ewGMuMhwZq8k2LIIECsY6ow+PGXYFXEvlvVyc8dToQ8mEDGnMSO/DXaSRgzbjLN33/XPrIBskoTi3DkJX7nOk3UG3OyS7Vi8YcyKTVGsxhyYENPf78+aGu0iKaKy3r2edMh28osVpGCo9IGUa1PH5u9KsRryn4CrzIf2FzKZx+Qpde4fK19QwNROwnEp1yxqCIABPEnqmGgsK9XJguL7suPJzWv1JDAtbACJ7kKLAjtbrHw47qj1mapbAnqZUOXOsBL+lDrI8YFgF4/Hba+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:22:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:22:55 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 02/24] drm/xe: Move migration support to device-level struct
Date: Wed, 12 Nov 2025 14:21:58 +0100
Message-ID: <20251112132220.516975-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf9d083-9fe1-4f77-09ee-08de21ee96cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTJUeEt5eG5YeG1HSURidDFteEo4Q1ZiR0VFZUdtNDJOWWdZVEtIM29zQVZx?=
 =?utf-8?B?MHk2WDdZQ1MwT2ZMM1JiSzBlMVVtVGtVL3pXQmc5S1ljd3lDVWtCSVZmMVRE?=
 =?utf-8?B?a1pOUmJGdm1jS0ZFU3RSbG1lS3hMZTVTK0c2Kzl5RzBHOElnV1pON3pLN3VF?=
 =?utf-8?B?WU9yVC9jWUZ5OTZRVGUrUUQ3WEtaU0lEVnhJMHkwUldYbkRpOG9wT0VaZUVU?=
 =?utf-8?B?ZGVaUjFJbEZRekJIWHRNMHpQdjVxRi9DaXFaZURZMmZLZGhQTjZTY1BkMVdC?=
 =?utf-8?B?alpkRmEvcUQ4b3JZc0JpMkRIL014S0xVVG9kM3JHRmpWSm1HU0g5OTRXazcy?=
 =?utf-8?B?WUZ1L2JhNWdld3BtWklYNEc1R2lCRnMxekFTZTUvdE9SenZEOEJ4Ti9ISmVQ?=
 =?utf-8?B?dDFnYnNEL3R2bVFoRDhaZkJDWWtmdWpiS1U5WFV4LzNNcmhLYlNzMFdwalRr?=
 =?utf-8?B?ajJEd0E5QnQxOUVQZDlQYUR2K0pmRmREeDJkV3dUWmpNazNsaGFIdGNJU1p2?=
 =?utf-8?B?WGh4TW43bitKSnFQS0paQlc4TzJmSEFYWlRTc3pCbm13ZE9rQ3ZmUm9wUHRW?=
 =?utf-8?B?TStIblpkQjV3YUwxU2t3Rmx0U1RnZVVOWGF2QkJzZmxIMjdQb3dVNTk1Tzlq?=
 =?utf-8?B?NU5UaWNLRjNQV0hkRDRMS0ZxK2hYcDJKTk9JWWdxYUh1N2s1RCtkUG5FQ29q?=
 =?utf-8?B?V3A0WERPZjNwRmJPVXovZmRXekRBQ1g4YkFsNlBrY002M09vRXc2Zm52V01w?=
 =?utf-8?B?bEozNG56L2tZcGpXUDEwOE4rOE1udTNVcmZXSS9hN3R2Yll1UWhxaGtMNi9w?=
 =?utf-8?B?SUVocmZUdEVDNjYvNVo3VHlmcTlaMVVoS3dkd0prS1NrTUx5UnVJbkdWd0Yy?=
 =?utf-8?B?Qk9pekwvdU1ZbzRwSmlvRXU3ZURVa3Y0Q21ZdjV1MzhXQ0JwRVAxK2QyUEJ2?=
 =?utf-8?B?MTR0WUNzTlh0VVZhSGx0RzRVbmYvWjFQZExsbHJaUGN6TGU2dGJHYWFPQ1NO?=
 =?utf-8?B?U1dpQ3BjeVlzSFd4bDE0bFNyRXFYR2d0aTFDN0FSbWg0czIybDg2Wmk4VFdO?=
 =?utf-8?B?aThWbU5MN0V0YzdXbHdiWC9tT0x5NFVsVUpPL0VlSnNwWHpybWY4UFpvL1FY?=
 =?utf-8?B?UzUwRFg4cWpvN3NBdDdWR2Z4eklDeHJORUZWdC9hOGpINFkwd0h6WFhIczBx?=
 =?utf-8?B?ZnpPaXZETHlWOHI1NzVlbCtzaXVqemF1K3o3dHFkdzl2bk4waEY0U3FaVlg3?=
 =?utf-8?B?akJYZWJySi9xRTA4Y000MEFmc2o1SFVLVjVpY0dsWnpncW1NYWtNKzB6Z0Ur?=
 =?utf-8?B?cllsT0s5WVlRSmxEeVZ6Y2RWR2ZIdnk1NG0wV1A2TzNtWEsvQXNhT3l4dFJ4?=
 =?utf-8?B?MlRXcnFlR2lWdVJ4V2U4ZjFxSTM0czJ4NWxPckNJWFcvV2tFK2p1eGN2QlRn?=
 =?utf-8?B?bXBuRDZOV0xQL1ZIdWZmNHhPQU9kdzFmazJKWU1zN1pPYm5qWVkwUVlvVi84?=
 =?utf-8?B?S2h3dTlhYmVQcytEZEtTcG5WcUc0bldVV3llUU1Xa0pKT0pOKzNwVDhhcFl2?=
 =?utf-8?B?UExQY1ZmR2lxd2s1Z2lJcDlyQ2VUdVkyZFAwU25PaVpET2lGS0FlSTNkdXAv?=
 =?utf-8?B?Sk5vYkMvV1VKQ2JHdHovOHcvc1ZHdkQvRldDZlVuVkE2andiOEZpMnFFR3FJ?=
 =?utf-8?B?L0J1ajFPU3N4RWtWOUhmNzQ2d3BKbTI0RVpabmQ3MWx4QnBqUmQ0TUFhQ2Vo?=
 =?utf-8?B?N2gyNGpMbVdoL1RWdFlxUFRJamZBVUswRUtWd2ZMODJCeW95OW54REJrbFA3?=
 =?utf-8?B?eTJGV3BvREdGWXdjN0hXY3NHQzJFb3gwMk9zQWVRSWF5R3poZmgza0JRdk1l?=
 =?utf-8?B?anpoOS96STYxR25MN2gzL2dFK1JYWU1RL0ZoT0JhRCtPMUhVa1YzdHl1UFRM?=
 =?utf-8?Q?kWmygbkP2K/fdf4wifr93ZApdT+1AFlG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmROUWl3RFl4RXNXMkJLSUJ2WmdQNDBCeHBITktKeWRGVXNXejR0VkIvN0dk?=
 =?utf-8?B?TTRSZUQvVEw5UHhSd1YwM2s2em85aXpsYlY0cFdkUlJwbFZ1ckZDYVI5Kytv?=
 =?utf-8?B?YSswRkREbnJPRlljclBoSFQwTERBMTNnNmNoTUNaVUVPdE04QXRqT3pHOVNt?=
 =?utf-8?B?UG1RUkhEcGI2NnZiR3ZyK2FNYXRMd1p5S04zSk5GVTY4OHBmbEdwRDdmSURK?=
 =?utf-8?B?dkZScGZ2TkpJQWE0T2Y5OUlGNFlpTTEzSktjbGJCTXNnZWluL0JzKzhFNnZ2?=
 =?utf-8?B?VkJwR2RnVGNkQ0luT2hOMFR2N2xMNkxQaGg5QzlLbzlubWxLemFMR0tIT3JJ?=
 =?utf-8?B?eVZEZWo2di9ldlVFcHhMYXdTMzFzU0ZZVEcrVUlNZy9XbkJLc3Y1UENlOWdr?=
 =?utf-8?B?ZmZoTDJxSmtUL2VnclBaMlNjR05SWkNIUFFKY0U3Z0tEMnVlZVBJajdLNVlk?=
 =?utf-8?B?VjYrbTh3ZWw0RGF6cC8vczBpcTRYUnNDZmRWckVEald4RUEyMHB1ZEZIWVdp?=
 =?utf-8?B?Wm9aREdiREsrckFPaE1ORnU5ZXdkNU5VYVhnMG15TmczYTZ4a2ttQm40K1Yr?=
 =?utf-8?B?MzFmWXhNSW1OdldJandMZ1Q0Y2ppMWhTNWNMQXVTYzlXbFVPVDZsem5SQW9s?=
 =?utf-8?B?NGRUdGUrazljUXQzWEJLWlpDcVdiWm1nbm5zMVBTMjIyeS91bktPeUpmaTQ2?=
 =?utf-8?B?YWp5QjY2TXV2NCtpMHlKQTFsak9KM3RkRXkxSmhmUUovY05GQis1YjRacmVG?=
 =?utf-8?B?eVJEZ3FZMFlsa1gxK054amZ6VmlOMUVMVTROV2VRMGNpcGlGa0MxMzFoUE1H?=
 =?utf-8?B?QWRBR2EvYjBMWWdxdXRNSm1OQVhxTHNndzVvQ1VEZnRWQWk1cXJWbUZadk53?=
 =?utf-8?B?Nnl4dUF0OTZRaHZTc0NLb1BYUzJ4dGkxSUFTZnc0Wm9IeTNLa3NENUwvazZI?=
 =?utf-8?B?OFNHNlIrOGZTLzNrZkRWVXI0bzFGNm5wMFRNWWUvdW1LVjZmbGJmamx2alJY?=
 =?utf-8?B?UkVTUmYxdDJ5T0hZS0FqV3U4WEVadzFUYVkxTE4wYWs5c3gycHV1cVROZTVT?=
 =?utf-8?B?anpkWHhoc1RRUStacWFtQndLaGNYU0V3dDhROG1zUDMyK3ZabWk5SEw1YWtw?=
 =?utf-8?B?YktGUEpDUWpVVEU2RUM2cjA2WUZ1cGJ4SjEwSzRqdVZXQWJQVXpUZk9yd2hw?=
 =?utf-8?B?M1FMclhOSlF1d0dNTE1ENytWaWtTOW5Ed041UVM5azk0cDFuRVk0R1cybGhG?=
 =?utf-8?B?eXBtV21qYTJVYjdEemF1RVE5TVV6WVhPOExERTBQODBRMkZiRzhOeDVJdFBu?=
 =?utf-8?B?YmZ0MWphRG1VcWNFQnAyS3NJcUpITlFOWnluYVBOanl2cTRSRm95UUNSSk56?=
 =?utf-8?B?RStCNHBKZnBIZXdRUmMzTFRhTU02VmVwT2cxY0tZTE5QLzY1K2hNUFk0cDNu?=
 =?utf-8?B?SlQwd3ExRHRuMjhLcE5HaUh2YWdNWTNsWUtjSnU3T0NDU1VYdXhwUVhGYlRs?=
 =?utf-8?B?bmM5YVg0cmQvWHFoVDNXaEpJV2ZCeVh3SWJDWFlSUVkzNmNBeGkrTkpHSFVr?=
 =?utf-8?B?cGtuZUFSMmZkYVpWUnQ1cCtrZkJtVGIvd1FTRVo5S0doUHFqNW5za3NqOW9w?=
 =?utf-8?B?NlFhbVZSL3ROeUNFSStNUkZtMmZCbXBPZlZwTlBWZ1BITUQwMzV4Wi80S0Qy?=
 =?utf-8?B?Umd2d3dDS1E2aWZTZ05wTGtpUEZJSHYwR3U3NVNqb3pwblJML0YxeTZYeDc4?=
 =?utf-8?B?ek1ydS93TUZ0YjhGTDNlTmE4bGt6Njd5RFozWFd3MnptYlRleGcyNXkwTVdt?=
 =?utf-8?B?ZHVQQ3NtWjhlWG5tZkdFdzg4STZlUWJXUTZVb3lHMzlMbEEwNllqZnE3aGlG?=
 =?utf-8?B?MVRRYWpsK3d4ZVJEK3JNNDVYanRDcTBESGdUK1QweXhRYlhyeXhrNHJQQjFJ?=
 =?utf-8?B?eTlSZlhrWjNNWjZIOFNwekszdWhHL1JlbmRwZzZVOUdYN3paUmY2eHl4V3pS?=
 =?utf-8?B?MUtGQkJJbVFKVnMrVzVLb2NURm51MlV4bzlSdE5qL1RhOTIyTVNacnExNHNM?=
 =?utf-8?B?K1UxQ2VIc1JmcXNHYXhON0FPbjFzWGZpVFJKeHgrSU02U3IxKytxNjVHb3hU?=
 =?utf-8?B?V2tZVmtpM3ZmSm1qVUFIbTBDL3lqK2RZQ084VHcwWStUajRBemxXSStWSkxi?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf9d083-9fe1-4f77-09ee-08de21ee96cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:22:55.0577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u+5AJEA8TKThA+kZzefjidcdS6tytwJxFaq1F+mDzLz7HF5uWO3QjhAQhZqd97NRU4WIsmsoLqanQqS1ilZsO4Wxwj2CRKmUrdiFL5OHig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Upcoming changes will allow users to control VF state and obtain its
migration data with a device-level granularity (not tile/gt).
Change the data structures to reflect that and move the GT-level
migration init to happen after device-level init.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 16 ++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  | 19 +++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  4 ++
 8 files changed, 88 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7b4ca591a4ae3..cb6b30fd8c2d8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_migration.o \
 	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
 	xe_sriov_pf_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a5bf327ef8889..ca28f45aaf481 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
@@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 
 static bool pf_migration_supported(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return gt->sriov.pf.migration.supported;
+	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
@@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool pf_check_migration_support(struct xe_gt *gt)
-{
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
-
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
-
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 1f3110b6d44fa..9d672feac5f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @supported: indicates whether the feature is supported */
-	bool supported;
-
 	/** @snapshot_lock: protects all VFs snapshots */
 	struct mutex snapshot_lock;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index b8af93eb5b5f5..a6023c2e4b12d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
@@ -102,6 +103,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_sriov_pf_migration_init(xe);
+	if (err)
+		return err;
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
new file mode 100644
index 0000000000000..8c523c392f98b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
+ * @xe: the &xe_device
+ *
+ * Return: true if migration is supported, false otherwise
+ */
+bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.migration.supported;
+}
+
+static bool pf_check_migration_support(struct xe_device *xe)
+{
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
new file mode 100644
index 0000000000000..d2b4a24165438
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_H_
+#define _XE_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+int xe_sriov_pf_migration_init(struct xe_device *xe);
+bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
new file mode 100644
index 0000000000000..43ca60b8982c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/types.h>
+
+/**
+ * struct xe_sriov_pf_migration - Xe device level VF migration data
+ */
+struct xe_sriov_pf_migration {
+	/** @supported: indicates whether VF migration feature is supported */
+	bool supported;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b3cd9797194b0..b15d8ca2894c2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_migration_types.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -44,6 +45,9 @@ struct xe_device_pf {
 	/** @provision: device level provisioning data. */
 	struct xe_sriov_pf_provision provision;
 
+	/** @migration: device level migration data. */
+	struct xe_sriov_pf_migration migration;
+
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
-- 
2.51.2

