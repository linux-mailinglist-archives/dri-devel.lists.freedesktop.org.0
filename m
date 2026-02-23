Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFVVEUysnGlnJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:36:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF917C720
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5910E441;
	Mon, 23 Feb 2026 19:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmzlnkDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FD510E2C6;
 Mon, 23 Feb 2026 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771875398; x=1803411398;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8g6NzcLK9LrAI7EtQiI4M6V+rO4IZJJylp3F9RtVh0o=;
 b=jmzlnkDabPVE+syG+L8feTXu64JBMhkODvATU5YuU0UVkGLZCrJcmaUV
 dbZDu7FmriwHXySqaUVhDxNRFNzpBrpmu/UE5D1VpMq6lTNL3qryn9lXR
 uddm20RgbpAdFSWqoPiITpb65sE4GR3icktGfWFqM6JDQRfFnIidee7dT
 jn46o/d8SKpZjP90oCaWY6XGnPFbJlkhzSOEwliUZ1fLq0e3/CAaSO+0T
 gqhxfldWe8dVMDxsTpCxtQCSeypG+4FMDLViWQxH6NAsQszkAlc/F5pLg
 fIk9fXtU8aSLwSSDo6P4oxhz4Rut+W4yFrWaDWuesz2F4wRE9rb6lur1o w==;
X-CSE-ConnectionGUID: IxCXNaDjSGe2x7rMZqNdVA==
X-CSE-MsgGUID: AtgANZelSjqh74ChOcQByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73061545"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73061545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:36:38 -0800
X-CSE-ConnectionGUID: OIEwRwuCQbKIiBrVTmkC9Q==
X-CSE-MsgGUID: G1tO8PzFTEG9P4fBWGn47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215804203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:36:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:36:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:36:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:36:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzU/QjTDYAKD8G+Myd9wI4QSRzVb7TQj5A9/rgAF2yrvFZbHRN9HJKrWdcYjUh+TcUKcMedJhSUN7S8RxAGRth6IG9i74KflNUCOt29VE/kHwjlRWjlrAUDZFEzwybZZTJWmqymFR3UjSIlLF57rnopYhhGrqx+6IGYjuwqbRrsmdNSjbJzyIdNP8AlwtGzsQ7ipjer5HV4WPpBmWsCz/DeVkUJDguuLu5C8rKOjXTte5RX4th4tOpJdWhQFFQiFoFLMmAcIMzvs7LBVPH2CR6NeOjizCiKbLTrCkW6zvoPxncJD5kGFmTj9WRs9ft9/dXJZ7/hAGht9QfoRfaFrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zow4VPKBegR3yDdjgQVpLYhcTBkoxLHrumPFuIPYBLg=;
 b=wVSU2AgzlOOqVHT4CyeAayFHIJEGwZt6w9LZ8B1YC6juGFGlf1sxeySxN4smTVUwH8e3mpQVqyUb+JW2ChD5AqB1EovBkreTJsRmtuJ77stAdcw36tIGJV/5MdZn2iAl5EHGaQjzyrWqfQRVhgKS8lXGrovZqrj62yF4kkrjWbJTosOo/VbIrWMsAv35olKvEFAfMcJo9Xy+2SSmzDduty7ydMLIXf37xThuslVqWrpbW6RyVlE/e7FbWU65VPpqwQzROCgLhs3tAh6Cz2JqeWHd9Mf1HnEvLmN1qxgpBrEXirO8r17AJMXwdUielki4SZY5XKYIcD8350fMOcqmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:36:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:36:34 +0000
Date: Mon, 23 Feb 2026 11:36:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
Message-ID: <aZysPArxnuxFU9e5@lstrano-desk.jf.intel.com>
References: <20260223172553.1663749-1-matthew.brost@intel.com>
 <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
 <aZyodmAdQgWRX95Z@lstrano-desk.jf.intel.com>
 <7b3811c5-1086-42a6-8324-b7ec927a74a5@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b3811c5-1086-42a6-8324-b7ec927a74a5@amd.com>
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1ccb6b-4de3-4970-d1b3-08de7312da54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFSQnNzL3kxeWRkcFZoWG9uSFpHZmdFamp0MGsyM0hzYzhzMWxQZkZqQmhh?=
 =?utf-8?B?Y2NIVFEyOXNHczhuYWFOa3F2b3JkUGVvbThYUFNDNkpsVHJ0MTlTRmxWdzBT?=
 =?utf-8?B?bEdjaEVLV1dRckswQ0lsTEh4eGJhaWlRVytGTjE0clJTbUtMMHUvU0VDTXEv?=
 =?utf-8?B?aTNiWlNnWnFtUFdGM2xlaFBnMDNmOCtCajAxUzZyRjVkdGpISGR6MDB5dU04?=
 =?utf-8?B?V2pWSmJpZ2Zrc3BTSkxlMk1nb09zZ0diR09TUlBtNWJwUkljNTB3cHgyc0lj?=
 =?utf-8?B?NVNDYkIvb0ttOWlpNEF2T3ZRQVBpYWFRb3gvOFN0UVJnUWh2VTF2aVVHdit6?=
 =?utf-8?B?dWhBc0hnUEhDdVFMc0hlVjJuOVBaUTA0d2IwK3pURElyV2E0Ny8vZ0VPYnZU?=
 =?utf-8?B?b3FZT3kxUnBVY2N4YzdDT05qWm5PMmhLK0RsNFI2eWtQOWt1QnpIQzdXckZ1?=
 =?utf-8?B?Mm9PSTg3QUpFeWtUSTFlVWJLVlcwbGlFdmlob1VjTGxkU1RTK3pBUU1KdlJ5?=
 =?utf-8?B?cnBUY0l5ZWY0M1RlRGpQaHF5YnVnVnZ0NG1rYVNCKzJqWWtlVGZUVDNicEFh?=
 =?utf-8?B?VVI5YVFYL1h0QklFN0xzTXA4VFRVdnBqWXBEbENjUUZmOXlOcGZicC82Qjds?=
 =?utf-8?B?NFNYL1pGcU04YlBNQlZ4UG4xbE5Fd0MrSkhHQkxRL21YWTdJUzVmRW1tamoy?=
 =?utf-8?B?V1ZrQnZ1NzRCUnAycTBOMDhnRHlFTFlFSFNKQ3MvbmttMkxqc0Q0U3I5Y0R6?=
 =?utf-8?B?SFVYTHNGaXBGSWlRdE9LSmVka2ZXNy9oOU9BVmMrYU5zci9Zbk1uNDY4TVhO?=
 =?utf-8?B?MWZXVVJyZURhMGdObTlWZXZSMFBETVpNOHpObG1VUUIycXpTYWQ2ZnMzR2ZH?=
 =?utf-8?B?SGE2ZFhkT3BqMDZDR0xTSGNCM1FDQ21kekgxR05ZV3M2Rk92bmJNV282aS9a?=
 =?utf-8?B?MFVLUVpXUmE5VTVXSDRQRllIRXlWRnNiR0JoRklMT1d4dUZHSXBhbHk2WjN2?=
 =?utf-8?B?aWUrTVVlQnhTN1EzVEU2K2RSV0tSS2VyVWdvL0VHV3hTVVdjQkJZT2cxYnRi?=
 =?utf-8?B?T1pJRFYxWDh1cWZKQVFZSXhKY29XbWZVU0VXWTY0MUxFYS9td1o3RVBERmtP?=
 =?utf-8?B?bjlMeE90MDVsSGFpWmpESldMY0dVKzd0ZEN2WE8rZ3N6SFJzVFpodHFHNzBW?=
 =?utf-8?B?cFpkK3hkVS8vaXJZUzl4QTVUT29oTzFhcXROOTFRYWFYV2ZtVlFFQ1BjOCt2?=
 =?utf-8?B?c1JIenhKT2pmL1VTVVlDQU5KZ1VvTGQ0S2w0QWR3RjU0VFdwcmtKTllpZWZQ?=
 =?utf-8?B?YTI1WnNZZmtLME5rcG5UZnZtT3lOMzg1K1JVUE04bFNWRlNodkRIRG9Ja1BU?=
 =?utf-8?B?K254SHZQTmRKaEJabEVmaERJSkdITHZUOHZTWHd3WWo1bUdjSVlITnh3LzJC?=
 =?utf-8?B?Qmx3Q2ttRWpVbG13SUEwUFRkQktJbS9PWnYyZTh2MEZLeEJlSXg0bW9rVEJX?=
 =?utf-8?B?UFVlbXd0ZlJJUk85Y3U5ZVdHdkZXNmI5aWYwVTVkamJlSkhaSkYxYU94VWZS?=
 =?utf-8?B?aVVaYk9XSjMwclJwQ1VZNW1MRVFyTjM0UFUvTzQ1d044L0JaY0RSQmZQeEdG?=
 =?utf-8?B?TSs1U0d1dTh0L1FTVkh4K0sxdHFxNzNHaUVSMTlNblNNckZqQWd4L3VsclNU?=
 =?utf-8?B?cExxMjdkMFllNis2cUJ3NzZSK3JBbjlONGxIbVh2K3BBVDQ5WDhIWkNZTHBO?=
 =?utf-8?B?UTZvYm1wOVQzdWMyQ3IwdE9PdWZUSXVocC9OQUlnMDNRS3AzOWt3ZnJGUlht?=
 =?utf-8?B?ZnRWcEh2WElMSWVwOElKSFJ1KzJ5S2V1TWhIbVFzNkJYVC9palp1eXdFVW9w?=
 =?utf-8?B?QWYwRzUzQlg2V1hLM0U1RjJWZnhDeWZvYlBlL0svUXBFdldNQ1pzeER6RHo0?=
 =?utf-8?B?SWEyVlgxOWdCVy8wRjZaZnNZaHkxZTllS1dFeS9XQUVGTExZUTZEZVF6RUE4?=
 =?utf-8?B?RzJaZ25MYXZuVGJWUWM2aGlFNWtBZWt3ZWhkM3FRSjdja0ZWNUJlOW1xWHFT?=
 =?utf-8?Q?TKKXVN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWx6RUlZSkEyRUdkOXpDMUorSmswanhNeWRsOHkyTE5ZeTN6RUxaYUdMa3dD?=
 =?utf-8?B?MFpjQk9PWXBZL0xheWluVjZjM2Y4Qk1xbHpEdTdkanY3N2JlMjNmU2hvQVA0?=
 =?utf-8?B?eG1sbld4NW42U25OMmlGTEt0cGVHckxGb1VROUc2WlBaQUozN0Q4MTJ3RDJE?=
 =?utf-8?B?RVE2R0hJVVpaVnVRL2tDcDlFdWhjYnREYmlvdUVDZzNYd2J6MUNlQ2hzYmw2?=
 =?utf-8?B?WVNWOUcwTE1mQmVUKzNzT3J1QWZ5NSsvUHUzZXlBdm9ZdnZtalpZbkllSkZh?=
 =?utf-8?B?R1pqN1JYSWVLRjBvUXVNVXhoM3FyLzdZNkY3WlBEY3RYU0RVRGt4UXF2ZG9k?=
 =?utf-8?B?dnJaWEx2d3YxeXdjNzF4ZEEybGFhejVEei9SK0xtY2l0dWovWkNJVk1Ebk9l?=
 =?utf-8?B?WTdPZmd6M3BhdnNRVi9EN1UrbUJoblBKYnRhT3ovRzB0b0lqRlJDeG1qQVlh?=
 =?utf-8?B?cTZhVitOOGRpSStsY2dWRURSOXdTbE1lUnJtcTlVZW1mSUJydXpzOWRtMHlS?=
 =?utf-8?B?S3ZlSDdEcXd3ZTVmTFZpYUR3RmRncytUd09rc1VXaHBTL0kxbHZsYy9nK1pa?=
 =?utf-8?B?RngzLzc3UHZTanRrRlZXOUFVMDVrV1pYcEd4YlAzQWdYZ1krbGhPamRSckZL?=
 =?utf-8?B?cjZBZG14c08ycjRseisyd0lMK0JkdXBEK3RIOE5kd2svV1AyL2hwbDFHOWpE?=
 =?utf-8?B?dk9FS0tGS2duUE16UWFLNGVORkZzTFRqd0VybVlpOEo4aFh1cWl5bWVsZ3hV?=
 =?utf-8?B?U2ZienNpbnZSQ3ZDdEFtaXgvQ2ZaU1lyeXArTU1VNmtZQ3dMVE5vcFJJMmt1?=
 =?utf-8?B?QVRuSWllbkNzY0FmSFlNK1laZzh4WjhBU1NCS1o0K3ZJRUh6UnBUQU1zdGwv?=
 =?utf-8?B?TnBhRVJlT3JUUHk1TElvZldLVUhlTlkyU2ZwNFFuNGJmQTRjVlZhYjNaNVVv?=
 =?utf-8?B?VjNhZHlnYmNKbmlIaG5uRk9iVzB0S2UyOHFHMFcxTTBKQUtGc3YvQ3QwbmZn?=
 =?utf-8?B?bGhzSWcvblQ3UmdJNzBZYVhMK3BhQ21YTUsxbVp3aERoRCtIQlRXN1cxQ1oy?=
 =?utf-8?B?UERha2I3OWU0NnJMeWs4TVFJNk9xK2ZRK0ZZQjdtWU5VZDZLOWNVbFF3S0xu?=
 =?utf-8?B?WFpHd2cvdUlUbllsbmM0SmhiNXZYeTI4UFdGenlMUXZVT0xjc3daakRDZjFL?=
 =?utf-8?B?UkFVMURLT0pLR0xJZjloaExOVi9VMEVGaHRSRXBYdFRGNDNrbjRlKy9NNWY2?=
 =?utf-8?B?ODF3anhPcUQ4WEVIbnprZCtqVHI5TERTQ1U0WHMxZ0laMGNrU3RsMlpZVkds?=
 =?utf-8?B?N0hBK091WndRTlNhWjI0RFRjNlA4VkgxR2RPdGVRcVJtL2UrenZXbUxhV2I5?=
 =?utf-8?B?dU41ZnBSSXNNNmg4dXA0cmltb0EwUzNkVjZPcFZTTUpoSFhsdkVBWVUxTVpm?=
 =?utf-8?B?N1VXTUJoN2k3YVYwd3A0Wk9zWklHZDZ6ZElGdU1lVlNia0ZzaDhILzJNcUh6?=
 =?utf-8?B?Tks5Nm5zUkVhYllpL2s3Uk5SdWdhalAyMFVYblBnSDJLNTZndXVuTEE0MFlX?=
 =?utf-8?B?OTcwSlFHZTdQV3MwSDMvNFpNSVJIdVk3SmljU1BKOVNaOFV6OXRaVDlsNVVT?=
 =?utf-8?B?NENoZlRwaFB5T2NNQkVSZklWNW5KZk9yT29YVzlXc3Y2b3VQRC9sSE44Sm5a?=
 =?utf-8?B?djBtdFBBOERPTEgyVUVmSmZibEVNL1JXQldOR2ZuSWNvamRaZ0tLUDRMdHdw?=
 =?utf-8?B?YTRTQjYvS29ZUy9ON2E3N2FodEo2U0JHd0FPNmNNcGJzdUUxR2VBYnpIU0RL?=
 =?utf-8?B?UjA5Mk1xTjhrV1dCT24yNWZuTDhNQlRZRDBvUE1Td2NXOFhZMEFZNVg1WHlB?=
 =?utf-8?B?azk5cXZ4YjFtTTg0aFh3b1drc0J3a1ZrbVFCR2Zvd0JzNThtWHY5SE9YUXh1?=
 =?utf-8?B?RnRSc2UxTWxsQkJMR2JsODR5VTN0OFVSMytvUUtROGVMWEh5bWR5eWlBT1Er?=
 =?utf-8?B?KzhUcXBTOUhrUHBZOUJqZjgvdlBjaXFjeDRLSTBhY1F1M0RDalJqekVMNFdP?=
 =?utf-8?B?RG1IRy9Pc1JoejJyQVJkdS9rekEzeitTMk5hcUtIREVZbFBXbkJQaWFZU3Zh?=
 =?utf-8?B?SlhpNlR4OEdPZ1BKZEl5ZW9qczFZRm9RMi9GK0djUEFSd3JhLzBjbllieWNw?=
 =?utf-8?B?aHplMVZxOGYxMDZWZ0hhcURCTGNJVFNpOWxzNFZmV3AyeHpMMnFJYnNBdDMx?=
 =?utf-8?B?MkU2ZktONjd4ZHRWSkN0WklrVkxIM3JkM28xcXVlQnRoTXEzUVorRWdpeGRQ?=
 =?utf-8?B?L21UeFNOdnVmN0s2T1pGQlJEYUYrQjJ0NGkwU0lzQnRnRy9rUm40eDdaWWR4?=
 =?utf-8?Q?RxvtYl+EYispQ+Zo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1ccb6b-4de3-4970-d1b3-08de7312da54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:36:34.4265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+fckVQx++1mo4GUvRbTV/wKr8NZTePf1EVy7kVzUru94aXZQZCWptEFjcMVRePX7/Z4W8xNL5ipskxIsxC8aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,lstrano-desk.jf.intel.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E9CF917C720
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:33:05PM +0100, Christian König wrote:
> On 2/23/26 20:20, Matthew Brost wrote:
> > On Mon, Feb 23, 2026 at 08:13:34PM +0100, Christian König wrote:
> >> On 2/23/26 18:25, Matthew Brost wrote:
> >>> The i915_active selftest no longer builds after the dma-fence locking
> >>> rework because it directly accessed the fence’s spinlock. The helper
> >>> dma_fence_spinlock() must now be used to obtain the spinlock. Update the
> >>> selftest to use dma_fence_spinlock() accordingly.
> >>>
> >>> Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
> >>> Cc: Christian König <christian.koenig@amd.com>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>
> >> Reviewed-by: Christian König <christian.koenig@amd.com>
> >>
> >> Thanks for the patch and sorry for the noise, just one more question below.
> >>
> >>> ---
> >>>  drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
> >>> index 52345073b409..9fea2fabeac4 100644
> >>> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> >>> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> >>> @@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
> >>>  	if (!fence)
> >>>  		return;
> >>>  
> >>> -	spin_lock_irq(fence->lock);
> >>> +	spin_lock_irq(dma_fence_spinlock(fence));
> >>
> >> Is it guaranteed that this is called from interrupt context? E.g. why is spin_lock_irq() instead of spin_lock_irqsafe() used here?
> >>
> > 
> > Idk, this i915 stuff I’ve long intentionally tried to forget to avoid nightmares.
> > 
> >> That's basically the reason why I missed this.
> >>
> > 
> > Also, please include the intel-xe list for CI — that will catch issues as well.
> > 
> > We’re making it a bit further now, but we’re hitting a lockdep splat [1].
> 
> ^^ that actually looks like a bug in dma_fence_chain_enable_signaling() which was there before the patch set and now just get bubbled up because lockdep can finally check on it.
> 
> Just reverting "dma-buf: use inline lock for the dma-fence-chain" should silence that again, but it is clearly not the right fix.
> 

Ah, ok. Well let's just figure this out properly.

> > I can dig into it now; hopefully it’s an easy fix. If not, I may ask for
> > a revert. Give me an hour or so to look into it and I’ll report back.
> > But again, please include the intel-xe list for CI on risky DRM common
> > or dma-buf patches — if the patches apply to drm-tip, CI will run. You
> > should have permission to trigger this; I believe all AMD emails do.
> 
> I did that on an older version of the patch set but never got a report back. My assumption was that it's working but could be that this actually never ran.
> 

Got a link? I working on recreating this now on my dev box. Any hints to
speed up verifying a fix would be helpful.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt  
> > 
> > [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html
> > 
> >> Regards,
> >> Christian.
> >>
> >>>  	__list_del_entry(&active->cb.node);
> >>> -	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
> >>> +	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
> >>>  	atomic_dec(&ref->count);
> >>>  
> >>>  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
> >>
> 
