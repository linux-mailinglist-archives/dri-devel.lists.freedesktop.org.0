Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FCC2240E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6D210EA38;
	Thu, 30 Oct 2025 20:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQSE2hij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865310EA32;
 Thu, 30 Oct 2025 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856345; x=1793392345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2z+T9h9qzbK5eN1HW3RPDTqRR6HTV4H7TQ3XjhWLuXM=;
 b=hQSE2hijdLIaHrZv21sYpJixxqGCGtRUFypa7EwreUnofIZ5V943DkfZ
 kcWMIyVdBy9OlfF6xrH23EEM4oYWuh2AISWOGBHibNEBnxYxnzrdY6HoN
 T1xljdUrEdLOiZ9w5ixzGyOvcPz/PWM6cy7uULPz51weDP4TdEgg8b+Mq
 ctqKcdzU37qSPmUmwV8gqzUNDODynolTGY5xpv04EzHAeR72iqXJJ8d4O
 G0DmZauEI3rJJiRxvXoYOjuqfs72cn/s0MJ4ybds10ocBQZf2oTKWquIk
 SIg2g83YkS4OgPdCxbIhL3ve5sBJm2kCQPDHrXiADIUg6vjfOfVux7d6y g==;
X-CSE-ConnectionGUID: Ogs9nOtpTLWZVOhiFbHMvg==
X-CSE-MsgGUID: uS4RF3XGTnaJTnf3VeWq1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64108635"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64108635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:25 -0700
X-CSE-ConnectionGUID: 9LMCbft0RAiNvzgEJnjhcQ==
X-CSE-MsgGUID: SqWz0C++RmG4U0WkOwX8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQenK0/W71Pqt6nvGzLlJUPYIjoz48bi4gnOGmuv5TtMQOBi7hf8s59RoRLNJj56lbGRd+afGk/qZ8YgKvPiJcmS1uwaGWrLCi4A0FifCYnxFNB8aVCr2as+MN6SBthwzJD+zv+oENMOT9gsxgGUM2neHbhYepH1KvCc4y4OotVJ5ybZeg+z12CX4JB35mhAvnFwqdPm3CxJiDj9dcVxsmYeONyAnRVnf+BqWLe7+Xe/bVq4MX9sy7fJVaTAy2mRlxwTzS3B4dyzdS99neXyTID7X+1R8i6jvr0de+fvY93LdanbkpBRvhPf8lzA4ChocL8wAkVHVIdjIjHfYuC7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsUm/nmVw145cb1tXr9B1mbFtJ67+LH/1yfepsF4Pbw=;
 b=q3St1VjL4nucXsA4I8fADFuia0CpXMPvJ5JNq2VhiLah095OTsj7hLrxj0GU406XL9ggsnx8545yr5fgE3yy5ch8UFaGqPcmB5ocOUZLJmpVpsrILriJ7uW5Xoy3CBgams1PPe5+BECjDjkmRemhhpspmHPPog3XjPX2nXisyRHE3XegAKX8goiOtLoIl7gfmtythra8gr5SSiIbLqHxU2KJ634YTZ2uFz67ZTPeuCaIwZ0xB5/C0mg+SP7o+hd+dJyKZXI0fpef0iKUXqXUOk4Vrip/wwtQ6v+XruJA2uH+JClON9GUn70Nxp1cNsUbi7Zd5eDvpYF85cfmVP4RIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 04/28] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Thu, 30 Oct 2025 21:31:11 +0100
Message-ID: <20251030203135.337696-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4f4659-b45a-479b-26e5-08de17f36d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGpueVVQQnpUMEViRDBHbzVpMW12cnQyN3JqMzZCRnJhVUd1cGc1dU9iN3RY?=
 =?utf-8?B?b1NXblRIaHR1Rkd6K0cvQ1c0eENQejl2QkhrLzNYYURxTEk0Yk9tU1FHMC9v?=
 =?utf-8?B?bHV2VjM0SlZzckcyL2NjTWFoYzRXUWsvVFpVdDVVa1VYeE9yNUlvWnhvbWxk?=
 =?utf-8?B?TkhlYlNJaTZLY09pR1p6TVk3UWtNdmEzamRabERla01KcTJUUWpUcndpTGR4?=
 =?utf-8?B?dWlXcXBiWXlYYUYycnA4ZjAvSmZ3cms1ZHVhNWQ4Yy9HR1VveVZ1L2pxaUJX?=
 =?utf-8?B?WUhlTkxQRDVvSFZlMHJHbHZPdGcrTDhhRzhuZk5taDVUS3psdG5KZUgvdWIv?=
 =?utf-8?B?di9VR3NYbURNUDFaL0dnaVZkL0l4NWRKaHk0YnArNGloT2laRTlrTDk5bHJ5?=
 =?utf-8?B?RERDTU1NdVRPd3lHdzZiK1VNQkJIYTVsUE9taTJoS0JwbnJiQTE1OG1vQ2Zi?=
 =?utf-8?B?MllxSVZIL1BKZllyWEZ3SW44ZE9aaFc3c29YaUROck5XOFJtK09icWdENjBM?=
 =?utf-8?B?K29aZUR0anZOL0xHZ3ZOVnFJYkhTSGlrc1F2alcwRWcvc1VGL1JQcGRmU2ti?=
 =?utf-8?B?WmpiVjhFdjcrc0Zrd2l6S2IydWQyckJPbEFFMnVPdHhiU0twRTdVb1NMbThX?=
 =?utf-8?B?dHYzL0JhM3ZKZXhQcXpsYS95R2UzcndSUW5mNDBuZzRySGZCKzQ0V3dWS0FX?=
 =?utf-8?B?R1hDQTdDM1E4ZjkxMVcwbHpmcGtuUW9zZmIzais2VjZYNW9rL2tFZ3NONDhM?=
 =?utf-8?B?WW9KeVZ0bUI5bFgrSC9pSlNXaGZxR3pVYkxRUEQ3bWhib1FDaGNhY1BzL21y?=
 =?utf-8?B?eDk5Q0xPQUlGMkRXeEJkVDEzVGdTRDNXNzhLZmdqQjRMekV4dk40SlY5WXcw?=
 =?utf-8?B?YkUyWjhmMlVtRXM1K04vM205REtCYm80aGRONmU4RlY3bDNBZmpNS3YzVWg2?=
 =?utf-8?B?aUJiZm1DK2VzMWxRaUNzMWN5b0hmSDM0STN3OTlUSGFkNTB2RnFyZXN2TW5I?=
 =?utf-8?B?OW82S1pGMzR2VE5FWVExeU9mMkRlY1JsL296cUk4YWRnNmphRWp2RmpmSEpF?=
 =?utf-8?B?ek5NWWx5ZFBkL3V6TUQwWGZHR0Jaa1JEdWVzM2Jma3JPSmRFb0FyUEkwTzB4?=
 =?utf-8?B?d0YzblgvVUs2bE5rTWN4cXBCdkt1dUw2bG1FMWZwY3lLV3ROZlNiZnZUbEFB?=
 =?utf-8?B?VWd2eHRIeTFtYWZmcE8zVWVJNWpVZi9jdS9pSG9Lb1g2YWtieGpOM2JoclJp?=
 =?utf-8?B?SEVDbnMxaW5GanR0eEU1K0FrSTkzRVVQUE4wNG5neTRCRjhPcklSL1cvQVpt?=
 =?utf-8?B?eldPSzhsRXJtSUdLaExlWUtsYk1sckg1OXlzTzZGRFBDODErOHU2QjErZ2Nq?=
 =?utf-8?B?YVkxTGVROTh2NnkzQWk0NW1FWTlzRC85eXBuR2V4MUFFZ2JJenhReGF1dWZL?=
 =?utf-8?B?ZWxRcjF3dENYMnl5ZklWVmVUNXJZcGc2dzBvMUgwcHh0MFFYRmhnYWtMZDZj?=
 =?utf-8?B?UlBuMzlkdWlyQUlrc2EvLys0MHNWMzdhQVYvTjA5aDVUdStwSkY1VzlMTll2?=
 =?utf-8?B?NW4vMGZxQk9NcUhCOWVIWEp3WmU1ZlZsWjdmankyUGZlM3NkaUZ3RnlCR0xJ?=
 =?utf-8?B?SC96T1hNYjQ2TzhmM3h1Z0VZRFowSThxQk10Tk1JRVQwNGk1cEplZlhUUitH?=
 =?utf-8?B?SjFUck1iMko3QjUzVUVZeGM5WVRpa1NBSS9xKy96TXJ6Zk5kNUVrTGN3OUxp?=
 =?utf-8?B?dUdqcGlqZ1Zsb3V4Lzd0eU9FMFp0V0xUMWZWV2VqTVpXNmoxOVh5dDlLOVgx?=
 =?utf-8?B?c3pzNmMwR1JDeFMrU3dsdXlKbWgwTTMwcUVjaGRreVRWZ2kwOE5rbU1TM1hv?=
 =?utf-8?B?OEUwQm5XZ0tiTnZQNGhGa25Ea0JtQlBxNmhVaHFyNTNlS1poQXZwQmJpcWN2?=
 =?utf-8?B?K3V5b1J1OGo3QTdGdkpiQTF2ZTV4M1lXVi9RcDgvUWNsR0Y5a3VyaWhvcDNu?=
 =?utf-8?Q?AvR15mbqBgSiwXfZ2G9zI0TkLml0hM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFYS1IvSGVOaDlndjh2N1RQSWtwWTNmV0c1MEpYekVDU1E1MXlZTjRrNXE3?=
 =?utf-8?B?RC9IUGs1K3h3MG1JY0d0ZDlFbXovcDQyb3hjSnpvb2pxRGtmQ0NWZ1ZqUnJN?=
 =?utf-8?B?NjlyYzhKbHd2dHBxUFpVZU5kU0lrSVVUS0ZjZnI5NVpjclhRQUV0R09SNUtD?=
 =?utf-8?B?ZDdTMS9Cbk8rWmY5YWZKZmx4ZkRZSC9pVDEyWUp4ck55bVdXTWZXVlZSenlm?=
 =?utf-8?B?eXdOL0V2cndRQVZKRU42UDRNQVFBcWcrbTgyYnI2QlZXZTRUQlcwT2VBYkVC?=
 =?utf-8?B?UEt2WG4xa0w4NDYvdHpjR0JpVmJmbC9rQnNDL2dnc2dNTG9SeUY3WDl3SDZZ?=
 =?utf-8?B?M0M4c1RoN0VmSERjb1c5QkFiR3dGVjRsVCtFV2ZtY1l4YW0raFNWVEZnSDcr?=
 =?utf-8?B?LytMVW5EOEljcURJVWUzOS9waEl2dHMvbSswRUlEN3g4dzhUYzhmUlFUSnlO?=
 =?utf-8?B?dFVKSWN0N2wxQWJDSXpCVE5zeCtuNjVsVTF4TVpXREpzU0xuQzVOOWxXS0lH?=
 =?utf-8?B?bXBvWFJuME9zVHNzMzlBSGdoKzBDYUlQekFlNFRTOGRCVVhWVXZzSUdXVkh5?=
 =?utf-8?B?K1UwZy9yWlFpMGlVY1JoL0tPM3gvaWl0MnE3M1NUdUZ5TDBsckJ3ZXpIemNG?=
 =?utf-8?B?WXUzSVBZbHNhYzRhaEtFbnN4VWMxQVZZbE9Ub01aU29OaHJwNGhZcTA0OUFD?=
 =?utf-8?B?TG4vTjhxbjlOWFc2WFZkREZ1c0NiczM3UWJFTmxpMkVyRXQzUk9xN0Z1aU1a?=
 =?utf-8?B?blhPNUZBYXdiRDFad0huL0pacDlDQ1hFa0xtUy82TE0rK2VUNWNUR2lwNFpN?=
 =?utf-8?B?SjRNZzd1QXAvUE40SGE1L2hobWZyc1NIVzhYdms2Y0s3dksvWXcxWE1HMnJa?=
 =?utf-8?B?ZTlUK2dSN0FjcWo1NTJEZVd0NUlEV2hVeTZjdzNoUjZjcythd0NxVkVsRHlF?=
 =?utf-8?B?R0dOaFJQbHk1am9kWk9YT2VNSXh6TEFFVFpRdHY2bUYwUERIbkdGLzJYczl3?=
 =?utf-8?B?a3hHUkgyR0lsVVZYdVd3cG5FZ2VRODhHTm44WHNpQytyOWdDRUR1N3RyRWM0?=
 =?utf-8?B?NXM1aUNqQ2xFUW1kWTRUVEZDQmZYR0lrMG93Ylh0VDVmUmpKY1N1YTBXeGVL?=
 =?utf-8?B?YjlXcXpTQ1NUVkY5elcyeTE1SUZ0ZE9qcXcvZHNmWisxVTRaWlg1RVE2T2lo?=
 =?utf-8?B?ZlFBTHEvWkpoeVNjV21aTnlVelMreUtUOFlGTm93eTkvaThLbnc0Nng5d0Vt?=
 =?utf-8?B?aUtiTVBUY0M2eXF6QWtlOEN4dC9mRzRVdHlZWTcrdDFualc5djNaa0J6UEhH?=
 =?utf-8?B?bWhXbjQwRGlmUkJSY21zSmFvSFdrQ2RFbHlBSUpVOTBYL3BnZTYxclZEMTlI?=
 =?utf-8?B?UWZJYm9kaFJCK2xGTXg2RTluRzVOTHAwSVk0cEk5VDFFNHBxNTNaUEEwdmV3?=
 =?utf-8?B?VzhxcStmZ2pOSmtwdG5neHJsS3pJcXpiUzE2SXZZQmRGOXR5dU5aRU0ybDJt?=
 =?utf-8?B?RzUwd1F4WXVEeXRrZUovWTJXMDhJclFXWmFrUkl1eWc5N1BtdExFVlNaY2Js?=
 =?utf-8?B?SHdCY0w5bzRZdFl6b3RFVG5KdXY1cmRFVXBTcGttVmpUaEFBZFQvbG5GQjla?=
 =?utf-8?B?RmRQcTRIc2JSYXQ2RWx0Wmw4b3BvVHR4QlRmd3A5YUhUZStodGRyTFRmN0lI?=
 =?utf-8?B?cW1aVVdBMERhQ3QvalVVb2MvN3M4TERwZWFNc2dFdFpTYXZvZURMVkdBc3dv?=
 =?utf-8?B?TVdWL2xrVzlLTmExQjdJWE5GUFN3RHhNUnI5dHBhOXgwV2RjMGpLckVGbGFN?=
 =?utf-8?B?MVg4bWc5ZnBydTNCOG91S0tOK1lrQUg4WGVBWWJzTFhWcW1tSkw5dVlvblBS?=
 =?utf-8?B?REg4UmNxOXhRYS9DVUlOaG92bFFlUEdMajcweGl1TVJMUEFMamZyUU1OSDV0?=
 =?utf-8?B?UVhGN2JPYW1vbUEzQlpRditUNzgzcUx5T3Jxc2xrbXI0SElpWnZScVptN05F?=
 =?utf-8?B?NGJzenptenBNMVRKaDFBK3c4dWl4TmVZTGY5Z25JTHZiQ3pwQjBZZGlRQlhk?=
 =?utf-8?B?dVkwQzY2Rk1KUVlRT0VpeVoydUpPL0wwMGpzVnlCQ2tKek1TUnI2NktoR25k?=
 =?utf-8?B?U2hXQVFHSlNMOW9vbUJYeXM4WEhBa0t2Ky8yZnp2NzlLeGoyeXlIOXdxeVg0?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f4659-b45a-479b-26e5-08de17f36d90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:21.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXxI1TXXdG4sixx/9mCuGk/vFOWRp4gr77f7T6kbZsapyeqOy6WOCfEJZlouSFuT0xv4Xunb37E6vYG1YkQZq+fulPgS8Ej01XX1qzcWBck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 406 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 8a2577fda4198..a571e1c02a3b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
 		return 5 * HZ;
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
+		return 20 * HZ;
 	default:
 		return HZ;
 	}
@@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
 }
 
 #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
@@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return -EPERM;
 	}
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
 	if (!pf_enter_vf_resume_wip(gt, vfid)) {
 		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
 		return -EALREADY;
@@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		ret = pf_wait_vf_restore_done(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1463,6 +1705,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..abc233f6302ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -14,8 +14,14 @@ struct xe_gt;
 int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
+bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
+
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 3ba6ad886c939..ea16ceb39dabb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,12 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..8d8a01faf5291 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_trigger_save_vf - Start a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_finish_save_vf - Complete a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_trigger_restore_vf - Start a VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_wait_restore_vf - Complete a VF migration data RESTORE sequence in all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..30318c1fba34e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c55326..e0e6340c49106 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_finish_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_trigger_##OP);	\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.50.1

