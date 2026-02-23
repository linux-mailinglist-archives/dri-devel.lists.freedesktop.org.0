Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKcSOja2nGkNKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:19:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483A17CCF0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF49010E30D;
	Mon, 23 Feb 2026 20:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HH/eo8Iz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AEC10E12A;
 Mon, 23 Feb 2026 20:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771877937; x=1803413937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SfMaUJpo7UxmPiWtxwys9aibwVeEoAix0atGBvwsT3w=;
 b=HH/eo8IzPxOA9uvtRWc+D5wKHfXr9tpMs+e87pg+zAjrV9f/PJuuOv6y
 mYGlNVsxC/nWrEvsDOJz3xywPnnzJw8PPawb/h4M6mIPzwxvjWWTjEP7d
 vhYZimP3AyTGr5rWw4fjzbiAeHzcHv2rR5Vd3QZlfscoln8T832C+gU+r
 3tJ59IrhCyh1uy6Y611OsdQJp8Atd+yzO1IBjjgzWCtJwFB+u6lasKaHM
 4VogVwC2AUBrzYJr7zuTwo7QDAs16iq3kKBFVqFW2W7LOAle0FN4djAEM
 OMrQxrN9jNRiMpAehlPvd17rNgN65ia2wqLBN2nvFU8own/9XKGG5mMZ+ w==;
X-CSE-ConnectionGUID: z8u6FSjQQqqSpx1HYfDbDA==
X-CSE-MsgGUID: G8kfl1VsTcOwvlQkScxY8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98346439"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="98346439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:18:45 -0800
X-CSE-ConnectionGUID: q2FgYiyVRfmEsXpCPzsQ1A==
X-CSE-MsgGUID: IxsjxBsISOmJZb4rSafEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219203723"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:18:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:18:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 12:18:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:18:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiDspxJXbj3krBLmKTRjOPXe+SafrjfuWwcppz4z2/jCkpSRHyRpGeuG/AsEiBKg8bGELxJuLdQJCCn70A72y9sWLzGA3evyGXF4yVdjf+oGuxzAiCrhEBpqwfzpi5vQ+MxyEfsJPmJzGBX1X1UN3BjZS+8X7HQmlYyQr/pjGZkYSLeUZ2bEJ37Zq97S4jLOtDMBAYLg1ZJv5RUQeX85m2Jmr2iy0Bifs7CyNwXtocThWgx7FLAfuhahBSJl1/dbU3l7/xUwnHJ0mSw4xbLZPnt5dN5DacuODaff6CBEyJEA7xCFlsf/2Xc51q1HVfWs/NSgIA4a1wOXiBSK1upedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyjNoQFfPi+IOSAFmi7lBbht4XK6ihLb0+RoDYWJFM4=;
 b=jN7O77PFDmcn6QJ1Dbso11MNWddJp9Fhj1hJiEIuEJvRraB3oNLUKkKdebhufGHRqwHmF8xMm/qXPBRgmZ4a9Ej4dDFgnfTrdH8lMIuoT8gFJnJNJOUctBccCQI3ofxHD2YiKJiV/jC3HM1DolyzmaJ1d0J8b5QBCyXbxyKOKR1V6afcxbYgyx+aqjBIJ6QkVIMXdsdGAolXEepJUb+KIJQSLWLCWJGMAtaOxz7VnMQyz5SslFyg2kDE/7T0rV4dPg4QHGfENz+A+pYbSomoohFk2UwEZI+8V4GPslYclDHXkg5QP3oGUj+bxY0n3vDTWczZjxpOoSXuJ6BsIuNlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:18:41 +0000
Date: Mon, 23 Feb 2026 12:18:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: revert "use inline lock for the dma-fence-chain"
Message-ID: <aZy2Hhu3SGQQPQbN@lstrano-desk.jf.intel.com>
References: <20260223195705.206226-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223195705.206226-1-christian.koenig@amd.com>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: dc21075e-5a6c-4fc2-c748-08de7318bc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXBaMmFHbnkyQnBPaVpBM2VvcHNaM3c3RlZRV2lWVGpuUUhxY3VWVzJZV1lV?=
 =?utf-8?B?cStNVHRXVXlEOGJPK1BBcEJNZ0x2VmtZd3dPWnIwalhodlVuMzBlTWM1bHFN?=
 =?utf-8?B?dEFaWS91K00wcTBtSHpQV2tMZVFhdlEwQ21aOVlNOFJKRkI0bHFoY2gvOVhO?=
 =?utf-8?B?cTA4YU4yN0pZWEptWElsTXY0RjhkR3M0M3hnb1dnZUZDcWxZTFp1Vy9qYW9H?=
 =?utf-8?B?Tk9IMDFITVNRUjZ0Z1NOamNBbWN2VEtlSExNV3k4bW10L2FFcjFKY3VEc3Qy?=
 =?utf-8?B?TjRtVzUwcGFLRVZkbzFRTUxyTEwwdkNTMCtoVHIyaTc5OE5xd1JORm9NRnpN?=
 =?utf-8?B?OEFjdXdQNzMrUUQrU3RjR0pSdEVweGdIemptbENzZ05ROU5YZFl1Z1RjcnFk?=
 =?utf-8?B?THliU1M4NlFnenF3YXdMSHJFbzZ0Yk1BeUplN21DUWNSOFg5eUh1SlhPY3pi?=
 =?utf-8?B?Q1cxVnpZeW5lNnAvOWFRQUg1VnpyRTJLMkpuUy8wNU1IM21QTUdBZFpRb3oz?=
 =?utf-8?B?MHpKWUN4U2MrN3Jrb1ZocFBJdC9RKzArNm1OcERRQ3J0eXdFQTV5RUxLS3F4?=
 =?utf-8?B?andqdVlNSTVFTGoxWGJFTDBVM1dPRkhNZElqWFhGcHpHR3JyVHBLd3lmMkUy?=
 =?utf-8?B?Y1ZxZWFib1cyMnIvdGRvbTk5NjhNT21lb3krYmVZMXBNTEcrRzBzQ0lhSmt5?=
 =?utf-8?B?L0JFajllYmRkT3ROcVE0WTd0K2hPTlNGNUtpbFBiRTJXdytObzd2YjVyYmRp?=
 =?utf-8?B?SnRLSGdUWHRyUlYyUmt2M095QU51aEx1RVJ5Q05SVnBrSHJPRE5WWmZrejht?=
 =?utf-8?B?ZDFwbFZ4QUNwRFVHTDVIWFp2M2UrYmJtQ04yVmpVeWw4VG9PK3VBeGV6TnZJ?=
 =?utf-8?B?UHVLRlMxSEVyNkQyZWJteCsrL2tmd3dFaGkwUGdrUmdxMGYyQVhJWCtlc2lP?=
 =?utf-8?B?dTdnKzF1YlZwTlJhTUZVN21lNlA0VDBKcjZMZmplcHBucHZuWTJYQTNBMnFQ?=
 =?utf-8?B?NHBnV1l5blhXR2V2ejlrUTJRcEZhUHFJL3IvcCtyYkkrR2Z2NUdQYzV1TVgy?=
 =?utf-8?B?bEN5YUlIY3M3dFVyTDJoam44N0tMNkM4aDhEY0RxZmhXWEhzV0wrSHBoMjhu?=
 =?utf-8?B?K3poVDFRS3QzMEZSNHhrWVNENHJMb2kyU2pCc2lGUys1c3Y1bXBVV3pJSXlK?=
 =?utf-8?B?S09iaU9RK3RlcDhxUHJFTnpRaGRMNXBLbUQ4MjBPSmZySzlhN05Pdm5Wc0xl?=
 =?utf-8?B?VW4rOEJ4WUdOMzhaNkswdmdwcTJtS0pzU2w3aWNxOGRLK1ZXZkp1cVJBeTVF?=
 =?utf-8?B?Vnh6c2FkYmFIZHBVcG1RSjhBU1RkUGsrQlcrak90U041SVUyWkFaTnBCVkFB?=
 =?utf-8?B?MFluUWN4bHhRWHFyWlhTMHV6TmZLZlZFWTVHRHpBdUVVaVRLdEFJQjJTaEEz?=
 =?utf-8?B?YkFSZHNZK1A0WEpmWW1EQWpabUVXbkUyM1FENk9oaEtiZVVSNEJtSnk4bUhN?=
 =?utf-8?B?ZWFyR0tLL3AwR1Q4SWljR3gxZjV3Rk5IVVc4b0NBQUhNMnRJR0V0MFFLOTFD?=
 =?utf-8?B?Q0Rsd1BLUXcyMURIN2RkbU03VTlTNHU4R0t5cXRiWnczZDRzbVVsTDVvcWlp?=
 =?utf-8?B?ak5RWmtvaUwvQ2g5cE1pTHh3RnJYaEhUUFVHbW8xaW9nTkdJMDZqNUcxWXBJ?=
 =?utf-8?B?RUVXczhoZW0rUEx5M3lDamFjWUkyU0luOUVqQy8rY0NTdHdoQ25HNDl2aUp6?=
 =?utf-8?B?NmhuUFUyTEtiTlJhMkJaZW91aytVZDFreEJGOWpuc2RybHlzZ01oOVpHczIr?=
 =?utf-8?B?ditnUVpSOTMvYkdKSUJVSkl1ZHJIU3QzQ3FkS1VSMzJubG0wQVZQT2l0c2c4?=
 =?utf-8?B?T2gwWTl1eWxHUUEvbThTZHlJMzlwdE1JZ05KclRUK3pxUTIvVnpUMlIwSzAv?=
 =?utf-8?B?cEVXdllDTk5XaWV5OER2LzJUYXVYVzZBbVlmK2xKL3ZpUVE5aFR3dVVJNEhh?=
 =?utf-8?B?WEl5VWpYaHFNcGRSSGxtWVN1Q2tCanNjUmNPMVhNeDc2dUhQejJQejIybks5?=
 =?utf-8?B?S3dmOUVyQXhvR2llVW81TU10L01hbFZmOUltT295UENVMllJODZ4UjdqUjFj?=
 =?utf-8?Q?IMNU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGF0NEVLK1J4NmExMHJZejRUcWZRK0VkVE1YT3pwdExJSjNDbjdvRDVGcEc4?=
 =?utf-8?B?ZUZad2RoWVVUUUg4YTBzR3o3Z0wxc3luZ2xEUWgwNEZLblFtVkxYeVdITEMy?=
 =?utf-8?B?NlYyUTVIdzQwOUl2QnhvVFNVVmhHMWN2YnFIRDI5Sy81Q0k4M1l5QkpkUG4v?=
 =?utf-8?B?TDVNa0hzM3lPcHpMTU12cGp0cERUamVmdkROMElEYlh1Y3ovVmZMWDk3b2RU?=
 =?utf-8?B?SVpsU3lmTEdYTC82ZldraHBhRUhWdVZ1ZTdhcFZCV1U4cmRsZzc2TlVCcUpa?=
 =?utf-8?B?M1BnTkk4bU11NmRRT0JCQmRCMlpDRGx4WDdXR1RETkg5Z1UwUFpSN2RFcXdJ?=
 =?utf-8?B?Ym1HWER2U3BjZ3EvM094UDdTNDlJRkFOVUVVQlFqdzgyalVSOC9OZVcvMFNw?=
 =?utf-8?B?eUEzbFlUMXNsQmtuTHY0RTc2TzBxVjRoR3AvbnQ4WC9IL3ZGYXltVjNyeHh1?=
 =?utf-8?B?dmNpc1hDS1lYcnQwVGxPbk9RM0NpQStyK09PanpDV1NnZnlhc0JtZSs5UWx1?=
 =?utf-8?B?RnhydjAxa2wwWXFkRHM2bm1sdFBJT1hMTkMyTTlOZGRhRm5HTEs1K2ZxTjdB?=
 =?utf-8?B?VXlpTVpnVjdzSlBnZ1NuV3JxNGxmaGRGajRVakJjUlVPbkU0ejV6QUlXVDJV?=
 =?utf-8?B?eWh1QlZzSnRTQklwNGkzRHQ3MTN5UmkzcWtIeDNDTytreTNramFuemFzK2la?=
 =?utf-8?B?ZktKcDVBcWg5RUw5azBBM2J4aVRDVzRyYm5sM2wyaTJ6UVFMV3hsc3RwMHo4?=
 =?utf-8?B?WXVGUVZ5UXlsL2NKZWdNejRmaXY5cVVFM0JONkdiSlkza2xDSHBzaGlYbytI?=
 =?utf-8?B?dnhCcGdaNWRYeXRpeXZOWDlYZ3pYcWdSQzRpcmRDdWZRdEVBYWVPQWpOOTJJ?=
 =?utf-8?B?U2xkZVY5d0xwakNHUjJ2VGNxRjNvNFhnVGJoclJrc0plWGdjejBRcEwrZkJ4?=
 =?utf-8?B?MThhbEZqTENIbzRKblFVNUFoMXR6T1U3UWEyUGFtWDRMaDFzY2ZDeU5OTHh2?=
 =?utf-8?B?YWhyVlhNcHUzWGNUcnBZeXlNZnJvNWFnSUlydzdTM3hBV09xdXVqeVliY0Vh?=
 =?utf-8?B?dlN5aUFsbFJjWTRjeTJBM2l3bmhVa29OZlA4eDhiTFZZSlN4SkN5Y0VqMkdk?=
 =?utf-8?B?bHovYVlFazFUQ3RmdjNzc1gxcjczSTVyV3JGS1Nnd3hqMnFqTDBZVkVwd3RN?=
 =?utf-8?B?eHdQUmVqTXIzcFpMbkVSVU5yQkFPYzR2Z2pVMW92azczK2FCN2dhcjVJUG5T?=
 =?utf-8?B?V3c4d0Jsa0dCT2VLYUhlVUp5RksyOU1aNUFHNnBxVTJUNjBXMlk0MCtQTjRz?=
 =?utf-8?B?c1lTOWd6R2NSeExOWDNDWDdHRW1LMWp3aHVVaHlqV24vSDFzQWY3K3hZVXJO?=
 =?utf-8?B?Y1JjMHBZTXdYR2pRRmFxRTFta1FMeHZNNTlSNTFoTU1EcVYyS0ZMZkJCOWZW?=
 =?utf-8?B?aDd0NSsrSHZCZzREby9mb0xjNHZVMFpjaklVSlRITzZHVUFLZ1dwZWtocXZZ?=
 =?utf-8?B?akU1a1I1K0hNb041YlRrcmdrZlpoT0hWOWNlZ2VaTldpdEVpL0VWOHB2aHRL?=
 =?utf-8?B?ZHg1ZDNQM0FjSEwyVjBoMlZpTVA4NEJkeTM2WjlNd3pWK21UcHl0Z202Mi9u?=
 =?utf-8?B?QkFqM1ltQnlOS0ZkQTRyL3M2WldMNThCK1Q5RVBLT29LVWhlS21ROFZKWnpR?=
 =?utf-8?B?TE5PQ3VhRS9MK3BXU1J2Q0xmb1JNWnJ1NXk5UjZiVjdLMnhseXh3ZjFBSFFw?=
 =?utf-8?B?N2FXb2llV0FoQTN5aFZHSmVxbklVNkhkbnJLVDcrQnUzdmVKd0VXZlRrakll?=
 =?utf-8?B?ZXJWbXhpU2JoRTJWZ3dhV0puSTlyemg5TWNJOFNhTjY0TlAwTGxHaW9xZlhM?=
 =?utf-8?B?d0I4TEZZaHAwZXQ1cVh5ZkhDSm1UZnU3RDk3Zy90SC8xOFpVOEE1S2VUK3Yr?=
 =?utf-8?B?WndFZTJTN1BsYkNOeFF6WkhHSHQwTG9vY2o3akl3bFJSaDhzbGhXVlMvMWhD?=
 =?utf-8?B?RFRFVzRGVXU2dWNGNHhaRlFwcE5QWjlJQk9yWHVxRy9VaVBOT2Rkb2gyM2Vq?=
 =?utf-8?B?dDU0ajZoZEZKSU8wbTRiWDByZlZJVTdwS1Q2MEpieGVKa1Z2YU96ZTVOcDJl?=
 =?utf-8?B?Mmp2czh5OVNIV211a1BMMDBJa0VDcFBCaDBBakNSTE1PWlFXWDFjMVlPYWlJ?=
 =?utf-8?B?aXo0K1B6T2pDckFaYjdjeFk0bXVNUG1DbDkzMGtabllkcE1USnZWOXF5a09r?=
 =?utf-8?B?VGNOZGpOb05aTnAzaUIwVHE4aHdwcW5sVWlOb1V6anBUTVZMRE1JVnlMVXpo?=
 =?utf-8?B?SG90Um1IMFZPMysydGJTTTcwVnVtYVpGTHI5U0pzU0tzeml5Um5neXRsM05H?=
 =?utf-8?Q?TSA8NrjicL8ZylXU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc21075e-5a6c-4fc2-c748-08de7318bc68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:18:41.2066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amjgAUYkKt1ss8lfAyDlT4w4M3U3nQ4tL2aMotgZa1RyLkVHlxMyWfq1VLoAsm3WzLZSMqIRO1UDwyhRUAOlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8483A17CCF0
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:57:05PM +0100, Christian König wrote:
> This reverts commit a408c0ca0c411ca1ead995bdae3112a806c87556.
> 
> This causes a lockdep splat. Not really the right fix, but changing this
> is more work than expected.
> 

I think dma-fence-arrays will have the same issue.

Can’t we just assign a lockdep key for chains and arrays?

Typing as fast as I could, I came up with this, and it seems to work:

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index cd970eceaefb..d5cce24dca5b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -200,6 +200,10 @@ void dma_fence_array_init(struct dma_fence_array *array,
                          u64 context, unsigned seqno,
                          bool signal_on_any)
 {
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+       static struct lock_class_key dma_fence_array_lock_key;
+#endif
+
        WARN_ON(!num_fences || !fences);

        array->num_fences = num_fences;
@@ -208,6 +212,10 @@ void dma_fence_array_init(struct dma_fence_array *array,
                       seqno);
        init_irq_work(&array->work, irq_dma_fence_array_work);

+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+       lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
+#endif
+
        atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
        array->fences = fences;

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a707792b6025..aa144b8c3534 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
                          struct dma_fence *fence,
                          uint64_t seqno)
 {
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+       static struct lock_class_key dma_fence_chain_lock_key;
+#endif
        struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
        uint64_t context;

@@ -263,6 +266,10 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
        dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
                         context, seqno);

+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+       lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
+#endif
+
        /*
         * Chaining dma_fence_chain container together is only allowed through
         * the prev fence and not through the contained fence.

Matt

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 3 ++-
>  include/linux/dma-fence-chain.h   | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a707792b6025..a8a90acf4f34 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -245,6 +245,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
>  	uint64_t context;
>  
> +	spin_lock_init(&chain->lock);
>  	rcu_assign_pointer(chain->prev, prev);
>  	chain->fence = fence;
>  	chain->prev_seqno = 0;
> @@ -260,7 +261,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  			seqno = max(prev->seqno, seqno);
>  	}
>  
> -	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>  			 context, seqno);
>  
>  	/*
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index df3beadf1515..5cd3ba53b4a1 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -46,6 +46,7 @@ struct dma_fence_chain {
>  		 */
>  		struct irq_work work;
>  	};
> +	spinlock_t lock;
>  };
>  
>  
> -- 
> 2.43.0
> 
