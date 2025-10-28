Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A930CC12877
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 02:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD0310E1C7;
	Tue, 28 Oct 2025 01:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9gNRFsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55510E15A;
 Tue, 28 Oct 2025 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761614632; x=1793150632;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B8c2CYXYAZe8WnbtMiBT9w328A7XFWNG4WKJkJP2g/o=;
 b=n9gNRFsU5BMPyIPhi+M5WpqoyuOGJpdxvwMCSOyTy/0Hrp0kItSPsGey
 EotW9fkCHV2J5ImEKJ4Di84kQNzI/OV9ykfZ7DMbjKKgIKdiEiBbegfaY
 JLhy+FBeLsV0Uj7TaHGUEZPtOHoMrMwV4dfjDbV72kVnapYYL5BWRrR1z
 Uc38v4xzcg2NvN0CuzFiTXXCRTMjm3G7+y1Igkoe6q3Wy2iM/5pSXk3u2
 25z53bnv5Fx5dYvj0j/66F/wkW4tn74dJ6hGpTo8NXIxmmS03vAkGSI8r
 vg7E/DTIkElfsAC68xb7lsrCJANZeOH+lKrHUB+eMvp/jmUD6yFjV7BF4 A==;
X-CSE-ConnectionGUID: TRNz1bYlRz6UEId+2ZbPPg==
X-CSE-MsgGUID: 4Bhs7Le4T8K7zkqyssSfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63743010"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63743010"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 18:23:52 -0700
X-CSE-ConnectionGUID: CyFkvhxoTEeQM5/4Hepz7A==
X-CSE-MsgGUID: dQWT1p9TQFyCNJ3umR8Pwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189566723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 18:23:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:23:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:23:44 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKusArfudKjQgOeaylE3o8mpSrEbkcSBGGqDpJ5QhxLuewb3eOwifE4nyHN1FyRObXkwxy8oS14wBU7HB9mQCDYdiwkN/Ux9G1hooveuo1V1lRvy29d9liP8RSXqsAnl+G+EaFw2CYjSp+wqjTlpSh9kcW2YnXv9nf0OAuqWkJ8SvtD2pLdufRQA50wUFPpXYBVbDLSE8G9lgdPuRUsIH5+PKD9sh+xmM7IflILQv9syfMB/sBfr/M+G+hXXc0GgKaveig7KhqTdNm3IbXyE0XODVYkL8kXeXOat600AevqG06MrX3fDsY5sAEcqun7KoPMrf/YDvNd2qh5xj+nzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufxGsqGN1NKUCrLncrPyRtNLbXsBN2YeaWoKtTYmfL0=;
 b=o18JlsNx/3DKy+IQpinwWX2gfZNsoQK6bLyLEnvvAjLno+z9A7YMqUeKg7m77P1ZTa1njlcur1yYXldvUoTHJOW+ufBHUpJTvNIbl/ou4i/x0mFexYDM62SbqhFqyC1wrKvC6Y0ndCcZvOAllCPlUUiZYsaIMj2lkWCstHka4iBMAmMx1+rVYre0NfvNHcDDOk+4RJ3YAVAVGKaceEyC/rCaGTNORIRs+Fv91PSJsREi2bDT6LO7pUa3YRL8zcHWbtUw/0YJUH6poHTo1gMFarNRVvn+yIwkxUHeDHzwEonMZs+QHOPLauWRSDymIO/GM9708ldiNA1ryFlxmGvgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 01:23:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 01:23:41 +0000
Date: Mon, 27 Oct 2025 18:23:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/pagemap: Add a drm_pagemap cache and shrinker
Message-ID: <aQAbGiYv/u/0wnto@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 8efaff4b-7e28-4e5d-06c7-08de15c0a11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUVvL1p4bC9QZVZZZ3dUSmVWNGsySmlFeVVFbjNma1k3aFFFQU94TWhDS0lN?=
 =?utf-8?B?OGpCcjRDZHA1a1djVlpGUFZXVTZtTXBld1Brb2NXYkJnNHhnQTBKRGpoQUhG?=
 =?utf-8?B?MFY5a0dSVHEwdmpDM0I2UzlOVlNwRFVuUGVoV0ZZamJsYWR3OHgxVFIwcWNM?=
 =?utf-8?B?Z2pCTUdpWnlqbzJidnJycGI1bldVMGUzQWtWWnNWcTdGK2UrYjNLVW1XbGc3?=
 =?utf-8?B?SnlhSStHbXd1enhjbnF6MjN2ZnUyZXk0Z3JreGFaUllpaFdCTlpOeWZBYnBp?=
 =?utf-8?B?U0JDWWorSURiKzM4Szhjckt3WUNhUkRJSGUyVCsvUkxQTGY3ZWV3am4rZDBy?=
 =?utf-8?B?eVE3YVcyM2ZuQWNuY3NLT1ZreTVzLy9KcGh3T1RkN2daNDJNeXZCaHBIbE1I?=
 =?utf-8?B?K3JaWTRaamRZK2ZOT1d5R245YTRMZU5uc2t6Skh5aWMzUUFNYnkyNE13eU8w?=
 =?utf-8?B?b0V0WHQ0T1hMU3hCdnlORzRMSUp3N0UyNHNhZ3MxcnpKK0Zvd0FvaE1UWDJu?=
 =?utf-8?B?NVZwZUxPR2ZyRjVQTlpBOFp0TzdZdFd3dXhHdWU2ZTR0M1JPN090TkM2cm45?=
 =?utf-8?B?azk4bUp5aEVtOHRYVzRzRWM0NWlkSnlvbDQwMnRHbklBaG1KOHRBRUlNOHpN?=
 =?utf-8?B?cW91NTg1VDVSWUw2SXJsVmpMN0lPMjIxTWVrbngzKzRUV3hoMWZ3eGUvdmRz?=
 =?utf-8?B?M1MrRkZSWlFuV1NsQnRYSWhWZXQ2UjNWdDU3TXZKTXBkR08xS2ZWNW4zb2pl?=
 =?utf-8?B?d1VNaTZUT215ZHdleGx1SnNJRWhrMC9XdkVQVW50ejVQZi91L2xaR0lyWXpY?=
 =?utf-8?B?MzlkMUU5YXVBbGFKK1ZPaDNtUzM5NGt0SjI5TFVVVE5ZeVF6bTlZOExKdEgy?=
 =?utf-8?B?ZWpOazd1OUJpUlZuTGUvd0RSZWk1RUMzWEJWSk52TFIwdXJZc0FRc2hXYTFN?=
 =?utf-8?B?T05Xdkpuc2FoOWdwRktMYXFZMW5SLzVUUm5Jc2hVQ3JrQ2lBTzAzNlRZOWRk?=
 =?utf-8?B?bWtkcnZxRzhYdTgvUVJDNW5QV0hocGhtMmlwOGVPdHkzZlM3a05wb2Jhc2dh?=
 =?utf-8?B?TTFGb005ZW9GYUZNN1BIMUJUcWxFdTBNZldxbDdMamJqTEN3M3ptbkUxdHhV?=
 =?utf-8?B?dTVxZW9JZXE0RXg2WG5GSnQ2NnNDVGxtNjNTbFBCVDU1MlJLZnd6SjhCUXlX?=
 =?utf-8?B?TmUzcUxaMW5ncVJFNzV5aFJWWm5YSkpaaU01cmxudDM1cittL280UDZIMHNs?=
 =?utf-8?B?MzFTRSttRzRqN3d0b0ZEeVB4NHZ2Sk9PZk9uS1VaQzB6anVKNmQ4K2FRQkdp?=
 =?utf-8?B?amt4TGZMdkhRYWFIaW1sS1BrR250bnB3U1hlMnUwSzFhN3NJRUNRbnNlMVgy?=
 =?utf-8?B?aG8xZ0Y4NTFLekQwTzRZd3lEWUZPSThsbDEvTktlTTlWcCtRT053STY5QnRu?=
 =?utf-8?B?cS9TdVlRT0ZBY1A5b1RnaXQ4dno1anpLbVdybzFUTTJzb0oyTkprZit2V2ZU?=
 =?utf-8?B?eHVraWN4enRRbkJQaXpHeVNnbmxiemxFTnpNem4xSVQrWWZIc05QQWFvRzZo?=
 =?utf-8?B?cXVJbHNHSW1HQlZMQ3RJWU9tcTQyTnVXbHIzQnpUc05xdk9mYmJGUm9lK0FG?=
 =?utf-8?B?MysyeGRySmFjVmpGRkFBY1hMUWNsVlg4RXNuaXNHU2JaQlh4VmhyaEpHdVBF?=
 =?utf-8?B?WFc4TGQ3VVl4d0tLTDlOSHlWNXJjTGEzelpkZjQ1S2F4RDA5dDMxTWtnQjE1?=
 =?utf-8?B?MWUzNndGb0ZmZHlEdFdyb3ZwV0dMd1JDVXZRUTM0eFIzaEEyeTJGT1ZGd3Vt?=
 =?utf-8?B?VWlCcmJmckNFZlFJWEtRWmhZdUdORXNWTU92MjBhcTE1Y0lwTEpTcm01NWF1?=
 =?utf-8?B?K0hxNi9ucXk0eE5CcjNQKzQ2bmtOekhaNVVaRGg2ZmZ1alFPSDFwL3BtVndw?=
 =?utf-8?Q?RQSOgt68mBtOrtw4FKt8i3vquBBWmj/J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVlwRDU4bXdLSkYzTldRU2M3OTFuOXloeG1ScmFpUHZ2TWQrdG1GakdkYkFR?=
 =?utf-8?B?STMzZWhuVElocitPbFVHRk5jWmFQV1NaNFBwY003RXJ4RGNML0RneVV2UE9V?=
 =?utf-8?B?T1ZHRnlaSS9WeThzSlp2b0xsMnBsZkV1SVhEMVdFVG9xak40b0VrT1V1ZTJK?=
 =?utf-8?B?WFJTbEVFbGNvYUt3MFgraXVGZnJ4VHZXN05yTGhTNHJoZllaNDRQWWovSWxh?=
 =?utf-8?B?V21tamdzbS9FU3ZmNzBwVml2QlNkYmtMOCtuZXFhNlNRR2Q5RWFIN1BTbXhF?=
 =?utf-8?B?MkpEZFVFWWxpU2JlM055OXhHcWtFb2lEWmRnVm9HVlhSWW9lbTZUcWxmejBx?=
 =?utf-8?B?SUllcXNGQzRyblFlTjFuRlZwbWQwWmlpWmhYRWQzU1JmV2FXRVdnNk5rYTg3?=
 =?utf-8?B?MWRWWVd1STFxN0lDaUJTY0xCRHlaQ0M0cHowMGdwdzVCWVd1Z1NWVEJUNlJ0?=
 =?utf-8?B?M1BWWElZcTAyeFZNeGsrdXJaN2ZJdjU4N3RNcTFQbGk2K2h4cnpVK1MyTkZ1?=
 =?utf-8?B?ZDQvc1JVRlBvWUpwRHh4UFZ5MkFLTTREUWFtaWhPekphZVRBaGtRaXJJbHNO?=
 =?utf-8?B?M3JHZk9wZitMTGZESmI1Nnc0aFhKWStxZE1rYWFnOTd2dTRvREFoVjdWaEVH?=
 =?utf-8?B?MWVhZENsL0lxaXhzU2gzNTBzZXNJZmJUNHdLNHc1QzBKcCtLWFdCSEN0c3RO?=
 =?utf-8?B?dHY4UFNnSGNIUDk5c3JFKzBPNUlydXZjdjdkbkIvVEpmbi9CMFRLZWR0L0hj?=
 =?utf-8?B?b3B0dGxCeFlNZ25odU82aTlHMTU0Mk5Hc0dIdEhaNVFFb2FrcGc0ZjB3RW45?=
 =?utf-8?B?dmxWTFFjcURJQklBMVVyd2wxcDVLbG9vbWo3MTkreVA0Sy9nUk1SdlBWSVFw?=
 =?utf-8?B?K21XWEFNYVpMc3Y4UUpBQ083dXZpQnc1Mlpra29Ed3JlQkVrcGtjL0JDSGpG?=
 =?utf-8?B?aFk5YW9nSVp5MmVWZHJEZE1FV2R0QmlkZEM1cVh0T1pUOUpja0FxYnBDZmZW?=
 =?utf-8?B?OUE0MGtWWE9HQkxYVnQwTy9yZlhocWJXamdiUHJQZlFmYXlZclBBdVZmbzJr?=
 =?utf-8?B?VzdWbzB4cXdYVWMrS0lxdFZ4bEludUtlN2R1TXZjeW5yY1B5eS9HQ3c5YlhQ?=
 =?utf-8?B?UHUrV3ZYT0swaE9RWXJlUkQvZ0Z3blVqbHkzMmh6YjFmYzhTRnJuK3RjKzFZ?=
 =?utf-8?B?N2RrSEFsS0YzeXRQaHRELzZYMjYrOUJuVWViU2lxd25hRFlaK3lpRUUrNUNy?=
 =?utf-8?B?Qm9pRVlrNXo5VlMwSnVjb0NtbERDa1hWSlpjT3V5d2ZBbVcyV1ZJZGpNNTRz?=
 =?utf-8?B?aTFCWDdxOU1ISUhPdHcxY3ppT0p3NkdQQzlJMlhFK3Bqbk9ocTFKQytWSExx?=
 =?utf-8?B?ZEl6NVVpRnE4WjdWS3VuV3dSbjczZ3ByQ1d2TXJ5QnNSanVKUDhPVjRRZ3V3?=
 =?utf-8?B?c3BXMk9JU09FQk4vWHRjWGRxS2JYQzVSTU40NndKVW94SkRTYVY1K004anNJ?=
 =?utf-8?B?WDVzUUNTc3BoRmNwc1lLRS9TRXhMWTROYWE2ZURBK21UZXlQWWRkSGZyV1h5?=
 =?utf-8?B?Vzg2WXh5RlVGYTl2SVJvT0JFSlc1SHpaSnpQRWlWMXJOTlpqdGdhOEMvSFNh?=
 =?utf-8?B?OENkMmJpei9TU21WdHJ4YmJWdlNQbGM5VWRQNjBuWjVKdmlpTVB0VnN6QXpz?=
 =?utf-8?B?SDJiUExvNDRHanp4M0RmTjVWQmFzWmlMMTJnUEdzTFF5ZGhmTExPY2NuZGFC?=
 =?utf-8?B?R1I5bU9xRE5ueHZoc25TaHJXeEpJZkp6dGlyZ0szWXRWNEZ3L05MeXpvZnpW?=
 =?utf-8?B?L1dSUGlHU3d5dG9UQUdPenlHaU9PN1ZJTThQblV2a1J3d3VkcEhXUXBHeW5M?=
 =?utf-8?B?YmFWSENYVXRPcmx6bHBlUUVpZVZycllYWmpsZC9qNnpOR0hxRE9Ga0RSZmlD?=
 =?utf-8?B?a3N3TFRHRk1WcG80WHNWVitXbVNZMEwyZVg4RTRyL29majBCQXBPdWM5Zytr?=
 =?utf-8?B?bFZGcWgrWmlRQ3ZKR1VKTHk2VGlwbVJPS3I4MmRqaHhpVEtVN1RGN2ZkbG1w?=
 =?utf-8?B?QUo1SDFkL0tjVmYrWkVOY3hlWmxxNWg5L292ekExTlEwZ0x1Z3paZU1WcDVG?=
 =?utf-8?B?MitKTllCemxLcGVnUVVLWXR5TE41Vyt2cytUSzkyVHlDNW8wbEVzMkltaEhM?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efaff4b-7e28-4e5d-06c7-08de15c0a11a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:23:41.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI12F4rbWSHyH63Kr0YP1Kx4xgKxnmzB3zea1M1OQuiJUkg8e5F4d86/cKW4nku/+TGPi/AKlxiAXXcMJedkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

On Sat, Oct 25, 2025 at 02:04:01PM +0200, Thomas Hellström wrote:
> Pagemaps are costly to set up and tear down, and they consume a lot
> of system memory for the struct pages. Ideally they should be
> created only when needed.
> 
> Add a caching mechanism to allow doing just that: Create the drm_pagemaps
> when needed for migration. Keep them around to avoid destruction and
> re-creation latencies and destroy inactive/unused drm_pagemaps on memory
> pressure using a shrinker.
> 
> Only add the helper functions. They will be hooked up to the xe driver
> in the upcoming patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Makefile           |   3 +-
>  drivers/gpu/drm/drm_pagemap.c      |  79 +++++-
>  drivers/gpu/drm/drm_pagemap_util.c | 426 +++++++++++++++++++++++++++++
>  include/drm/drm_pagemap.h          |  53 +++-
>  include/drm/drm_pagemap_util.h     |  25 ++
>  5 files changed, 569 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c2672f369aed..cdca68fd9f23 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>  
>  drm_gpusvm_helper-y := \
>  	drm_gpusvm.o\
> -	drm_pagemap.o
> +	drm_pagemap.o\
> +	drm_pagemap_util.o
>  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index fb18a80d6a1c..5ca5b2b53bc1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
>  
>  /**
> @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref *ref)
>  	 * pagemap provider drm_device and its module.
>  	 */
>  	dpagemap->dev_hold = NULL;
> -	kfree(dpagemap);
> +	drm_pagemap_shrinker_add(dpagemap);
>  	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
>  	schedule_work(&drm_pagemap_work);
>  	/*
> @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
>  	return dev_hold;
>  }
>  
> +/**
> + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> + * @dpagemap: The drm_pagemap to reinitialize
> + *
> + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> + * has already been called. This interface is intended for the
> + * situation where the driver caches a destroyed drm_pagemap.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> +{
> +	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dpagemap->dev_hold))
> +		return PTR_ERR(dpagemap->dev_hold);
> +
> +	kref_init(&dpagemap->ref);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_reinit);
> +
> +/**
> + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> + * @dpagemap: The drm_pagemap to initialize.
> + * @pagemap: The associated dev_pagemap providing the device
> + * private pages.
> + * @drm: The drm device. The drm_pagemap holds a reference on the
> + * drm_device and the module owning the drm_device until
> + * drm_pagemap_release(). This facilitates drm_pagemap exporting.
> + * @ops: The drm_pagemap ops.
> + *
> + * Initialize and take an initial reference on a drm_pagemap.
> + * After successful return, use drm_pagemap_put() to destroy.
> + *
> + ** Return: 0 on success, negative error code on error.
> + */
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops)
> +{
> +	kref_init(&dpagemap->ref);
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +	dpagemap->drm = drm;
> +	dpagemap->cache = NULL;
> +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> +
> +	return drm_pagemap_reinit(dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_init);
> +
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
>   * @drm: Pointer to a struct drm_device providing the device-private memory.
> @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> -	struct drm_pagemap_dev_hold *dev_hold;
> +	int err;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
> -	kref_init(&dpagemap->ref);
> -	dpagemap->drm = drm;
> -	dpagemap->ops = ops;
> -	dpagemap->pagemap = pagemap;
> -
> -	dev_hold = drm_pagemap_dev_hold(dpagemap);
> -	if (IS_ERR(dev_hold)) {
> -		kfree(dpagemap);
> -		return ERR_CAST(dev_hold);
> -	}
> -	dpagemap->dev_hold = dev_hold;
> +	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	return dpagemap;
>  }
> @@ -1023,6 +1068,14 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
>  
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
> +{
> +	if (dpagemap->ops->destroy)
> +		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
> +	else
> +		kfree(dpagemap);
> +}
> +
>  static void drm_pagemap_exit(void)
>  {
>  	flush_work(&drm_pagemap_work);
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> new file mode 100644
> index 000000000000..e1a1d6bf25f4
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * struct drm_pagemap_cache - Lookup structure for pagemaps
> + *
> + * Structure to keep track of active (refcount > 1) and inactive
> + * (refcount == 0) pagemaps. Inactive pagemaps can be made active
> + * again by waiting for the @queued completion (indicating that the
> + * pagemap has been put on the @shrinker's list of shrinkable
> + * pagemaps, and then successfully removing it from @shrinker's
> + * list. The latter may fail if the shrinker is already in the
> + * process of freeing the pagemap. A struct drm_pagemap_cache can
> + * hold a single struct drm_pagemap.
> + */
> +struct drm_pagemap_cache {
> +	/** @lookup_mutex: Mutex making the lookup process atomic */
> +	struct mutex lookup_mutex;
> +	/** @lock: Lock protecting the @dpagemap pointer */
> +	spinlock_t lock;
> +	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
> +	struct drm_pagemap_shrinker *shrinker;
> +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
> +	struct drm_pagemap *dpagemap;
> +	/**
> +	 * @queued: Signals when an inactive drm_pagemap has been put on
> +	 * @shrinker's list.
> +	 */
> +	struct completion queued;
> +};
> +
> +/**
> + * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
> + */
> +struct drm_pagemap_shrinker {
> +	/** @drm: Pointer to the drm device. */
> +	struct drm_device *drm;
> +	/** @lock: Spinlock to protect the @dpagemaps list. */
> +	spinlock_t lock;
> +	/** @dpagemaps: List of unused dpagemaps. */
> +	struct list_head dpagemaps;
> +	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
> +	atomic_t num_dpagemaps;
> +	/** @shrink: Pointer to the struct shrinker. */
> +	struct shrinker *shrink;
> +};
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
> +
> +static void drm_pagemap_cache_fini(void *arg)
> +{
> +	struct drm_pagemap_cache *cache = arg;
> +	struct drm_pagemap *dpagemap;
> +
> +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		goto out;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		drm_pagemap_destroy(dpagemap, false);
> +	}
> +
> +out:
> +	mutex_destroy(&cache->lookup_mutex);
> +	kfree(cache);
> +}
> +
> +/**
> + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> + *
> + * Create a device-managed drm_pagemap cache. The cache is automatically
> + * destroyed on struct device removal, at which point any *inactive*
> + * drm_pagemap's are destroyed.
> + *
> + * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
> + * on failure.
> + */
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
> +{
> +	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
> +	int err;
> +
> +	if (!cache)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&cache->lookup_mutex);
> +	spin_lock_init(&cache->lock);
> +	cache->shrinker = shrinker;
> +	init_completion(&cache->queued);
> +	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return cache;
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> +
> +/**
> + * DOC: Cache lookup
> + *
> + * Cache lookup should be done under a locked mutex, so that a
> + * failed drm_pagemap_get_from_cache() and a following
> + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> + * operation WRT other lookups. Otherwise, racing lookups may
> + * unnecessarily concurrently create pagemaps to fulfill a
> + * failed lookup. The API provides two functions to perform this lock,
> + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
> + * should be used in the following way:
> + *
> + * .. code-block:: c
> + *
> + *		drm_pagemap_lock_lookup(cache);
> + *		dpagemap = drm_pagemap_get_from_cache(cache);
> + *		if (dpagemap)
> + *			goto out_unlock;
> + *
> + *		dpagemap = driver_create_new_dpagemap();
> + *		if (!IS_ERR(dpagemap))
> + *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
> + *
> + *     out_unlock:
> + *		drm_pagemap_unlock_lookup(cache);
> + */
> +
> +/**
> + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
> + * @cache: The drm_pagemap_cache to lock.
> + *
> + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> + */
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	return mutex_lock_interruptible(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> +
> +/**
> + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
> + * @cache: The drm_pagemap_cache to unlock.
> + */
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	mutex_unlock(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> +
> +/**
> + * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
> + * @cache: The cache used for lookup.
> + *
> + * If an active pagemap is present in the cache, it is immediately returned.
> + * If an inactive pagemap is present, it's removed from the shrinker list and
> + * an attempt is made to make it active.
> + * If no pagemap present or the attempt to make it active failed, %NULL is returned
> + * to indicate to the caller to create a new drm_pagemap and insert it into
> + * the cache.
> + *
> + * Return: A reference-counted pointer to a drm_pagemap if successful. An error
> + * pointer if an error occurred, or %NULL if no drm_pagemap was found and
> + * the caller should insert a new one.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +retry:
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> +		spin_unlock(&cache->lock);
> +		return dpagemap;
> +	}
> +
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		return NULL;
> +	}
> +
> +	if (!try_wait_for_completion(&cache->queued)) {
> +		spin_unlock(&cache->lock);
> +		err = wait_for_completion_interruptible(&cache->queued);
> +		if (err)
> +			return ERR_PTR(err);
> +		goto retry;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		err = drm_pagemap_reinit(dpagemap);
> +		if (err) {
> +			drm_pagemap_destroy(dpagemap, false);
> +			return ERR_PTR(err);
> +		}
> +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> +	} else {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		dpagemap = NULL;
> +	}
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> +
> +/**
> + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
> + * @cache: The cache to assign the drm_pagemap to.
> + * @dpagemap: The drm_pagemap to assign.
> + *
> + * The function must be called to populate a drm_pagemap_cache only
> + * after a call to drm_pagemap_get_from_cache() returns NULL.
> + */
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
> +{
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +	spin_lock(&cache->lock);
> +	dpagemap->cache = cache;
> +	swap(cache->dpagemap, dpagemap);
> +	reinit_completion(&cache->queued);
> +	spin_unlock(&cache->lock);
> +	drm_WARN_ON(drm, !!dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> +
> +/**
> + * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
> + * @cache: The cache to lookup from.
> + *
> + * Function that should be used to lookup a drm_pagemap that is already active.
> + * (refcount > 0).
> + *
> + * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	spin_lock(&cache->lock);
> +	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
> +	spin_unlock(&cache->lock);
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache = dpagemap->cache;
> +	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
> +
> +	spin_lock(&shrinker->lock);
> +	if (list_empty(&dpagemap->shrink_link)) {
> +		spin_unlock(&shrinker->lock);
> +		return false;
> +	}
> +
> +	list_del_init(&dpagemap->shrink_link);
> +	atomic_dec(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	return true;
> +}
> +
> +/**
> + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
> + * @dpagemap: The drm_pagemap.
> + *
> + * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
> + * struct device backing the drm device is still alive, add @dpagemap to
> + * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
> + *
> + * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
> + *
> + * This is an internal function which is not intended to be exposed to drivers.
> + */
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)

Not a full review - slowly wrapping my head around the first 6 patches
but one quick question.

This is called from drm_pagemap_put. How do we know what type of context
we're in? It seems like this could be called from either process context
or atomic context (e.g., via drm_pagemap_zdd_destroy through
drm_pagemap_page_free). This code doesn’t appear to work in atomic
contexts—if I recall correctly, drm_dev_enter can’t be called from
atomic context. Also, we're missing irqsave on the spinlock.

We had a worker for ZDD destroy at one point—should we revive that? If
we did, I think we could safely enforce a rule that drm_pagemap
operations must only be called from process context.

Matt

> +{
> +	struct drm_pagemap_cache *cache;
> +	struct drm_pagemap_shrinker *shrinker;
> +	int idx;
> +
> +	/*
> +	 * The pagemap cache and shrinker are disabled at
> +	 * pci device remove time. After that, dpagemaps
> +	 * are freed directly.
> +	 */
> +	if (!drm_dev_enter(dpagemap->drm, &idx))
> +		goto out_no_cache;
> +
> +	cache = dpagemap->cache;
> +	if (!cache) {
> +		drm_dev_exit(idx);
> +		goto out_no_cache;
> +	}
> +
> +	shrinker = cache->shrinker;
> +	spin_lock(&shrinker->lock);
> +	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
> +	atomic_inc(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	complete_all(&cache->queued);
> +	drm_dev_exit(idx);
> +	return;
> +
> +out_no_cache:
> +	drm_pagemap_destroy(dpagemap, true);
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
> +
> +	return count ? : SHRINK_EMPTY;
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	struct drm_pagemap *dpagemap;
> +	struct drm_pagemap_cache *cache;
> +	unsigned long nr_freed = 0;
> +
> +	sc->nr_scanned = 0;
> +	spin_lock(&shrinker->lock);
> +	do {
> +		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
> +						    shrink_link);
> +		if (!dpagemap)
> +			break;
> +
> +		atomic_dec(&shrinker->num_dpagemaps);
> +		list_del_init(&dpagemap->shrink_link);
> +		spin_unlock(&shrinker->lock);
> +
> +		sc->nr_scanned++;
> +		nr_freed++;
> +
> +		cache = dpagemap->cache;
> +		spin_lock(&cache->lock);
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +
> +		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
> +		drm_pagemap_destroy(dpagemap, true);
> +		spin_lock(&shrinker->lock);
> +	} while (sc->nr_scanned < sc->nr_to_scan);
> +	spin_unlock(&shrinker->lock);
> +
> +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> +}
> +
> +static void drm_pagemap_shrinker_fini(void *arg)
> +{
> +	struct drm_pagemap_shrinker *shrinker = arg;
> +
> +	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
> +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
> +	shrinker_free(shrinker->shrink);
> +	kfree(shrinker);
> +}
> +
> +/**
> + * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
> + * @drm: The drm device
> + *
> + * Create and register a pagemap shrinker that shrinks unused pagemaps
> + * and thereby reduces memory footprint.
> + * The shrinker is drm_device managed and unregisters itself when
> + * the drm device is removed.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> +{
> +	struct drm_pagemap_shrinker *shrinker;
> +	struct shrinker *shrink;
> +	int err;
> +
> +	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> +	if (!shrinker)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
> +	if (!shrink) {
> +		kfree(shrinker);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	spin_lock_init(&shrinker->lock);
> +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> +	shrinker->drm = drm;
> +	shrinker->shrink = shrink;
> +	shrink->count_objects = drm_pagemap_shrinker_count;
> +	shrink->scan_objects = drm_pagemap_shrinker_scan;
> +	shrink->private_data = shrinker;
> +	shrinker_register(shrink);
> +
> +	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return shrinker;
> +}
> +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 5cfe54331ba7..4b9af5e785c6 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_cache;
>  struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
>  			   unsigned long start, unsigned long end,
>  			   struct mm_struct *mm,
>  			   unsigned long timeslice_ms);
> +	/**
> +	 * @destroy: Destroy the drm_pagemap and associated resources.
> +	 * @dpagemap: The drm_pagemap to destroy.
> +	 * @is_atomic_or_reclaim: The function may be called from
> +	 * atomic- or reclaim context.
> +	 *
> +	 * The implementation should take care not to attempt to
> +	 * destroy resources that may already have been destroyed
> +	 * using devm_ callbacks, since this function may be called
> +	 * after the underlying struct device has been unbound.
> +	 * If the implementation defers the execution to a work item
> +	 * to avoid locking issues, then it must make sure the work
> +	 * items are flushed before module exit. If the destroy call
> +	 * happens after the provider's pci_remove() callback has
> +	 * been executed, a module reference and drm device reference is
> +	 * held across the destroy callback.
> +	 */
> +	void (*destroy)(struct drm_pagemap *dpagemap,
> +			bool is_atomic_or_reclaim);
>  };
>  
>  /**
> @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
>   * @pagemap: Pointer to the underlying dev_pagemap.
>   * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
>   * device referencing.
> + * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
> + * &struct drm_pagemap. May be NULL if no cache is used.
> + * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
> + * used if also using a pagemap cache.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> @@ -142,6 +166,8 @@ struct drm_pagemap {
>  	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_pagemap_cache *cache;
> +	struct list_head shrink_link;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops);
> +
>  struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
> @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  
>  /**
>   * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> - * @dpagemap: Pointer to the struct drm_pagemap.
> + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
>   *
> - * Return: Pointer to the struct drm_pagemap.
> + * Return: Pointer to the struct drm_pagemap, or NULL.
>   */
>  static inline struct drm_pagemap *
>  drm_pagemap_get(struct drm_pagemap *dpagemap)
> @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap *dpagemap)
>  	return dpagemap;
>  }
>  
> +/**
> + * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
> + * unless the current reference count is zero.
> + * @dpagemap: Pointer to the drm_pagemap or NULL.
> + *
> + * Return: A pointer to @dpagemap if the reference count was successfully
> + * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
> + */
> +static inline struct drm_pagemap * __must_check
> +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> +{
> +	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> -#endif
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +#endif
> diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
> new file mode 100644
> index 000000000000..292244d429ee
> --- /dev/null
> +++ b/include/drm/drm_pagemap_util.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _DRM_PAGEMAP_UTIL_H_
> +#define _DRM_PAGEMAP_UTIL_H_
> +
> +struct drm_device;
> +struct drm_pagemap;
> +struct drm_pagemap_cache;
> +struct drm_pagemap_shrinker;
> +
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> +
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
> +
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> +
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
> +#endif
> -- 
> 2.51.0
> 
