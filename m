Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC93M3DDnWmsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:27:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F84188FFB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69A10E5A7;
	Tue, 24 Feb 2026 15:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zen0uFkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C40310E32D;
 Tue, 24 Feb 2026 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771946859; x=1803482859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zViJ7XcpDYuAa92Xy//eQsmKAdjGNnw7pydnvMOD2gw=;
 b=Zen0uFkUR4GFCwDLg5WggzkS2mT4epQ+ie6FaaDsxbj9dyKY5ddjBlNZ
 m1UbHR4CyVAHKf56poscfERF8pyKgaNsuKaK6iFSWErm/DbNqNoA61EK0
 +kBVIEHbrwrrAtNbEBg2mhYEu7nxse3i44X2A3AF8NbT/P9zmrbIvLENi
 cMUEZho8W8SRNgo4w/rjKmFnCWlkhTQQeFsXuOaerwuGPPtFYM1wsqOr3
 +vOniLZ2SC4KEpnWQF50MKGVVZw3sLDvODTod81j74IimpdMN6Q2DQ72p
 lWbQ7FnHKLXEb+NztNugIwWACVUeLxk//y9rPV29k7zvdNy22SQWfeSeP Q==;
X-CSE-ConnectionGUID: HXSAVgTlSeusHDmFT7JX2g==
X-CSE-MsgGUID: 3CGfuDTRSxCOetrA5zuNrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72839797"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72839797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:27:39 -0800
X-CSE-ConnectionGUID: 8uuuu2KJSFCK4qiLON3QYA==
X-CSE-MsgGUID: lZPuWaQ1S0meiwclzMYubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220049084"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:27:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:27:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:27:38 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:27:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVKROE8jhZSjzVjGZmR7vuPa7EmdvLDwrSNIoqGIxB6JxmYj0z6F8fm0X5n24K2RKdT1xvuDqi0XaluSZ32TTgmS+599wvSD3Joao6hrHOd2ankQH9Fp2UST0UYdJAjWdMytAblTtH0OCNtgmN2Mpu4CiQtnbHp7w+2pT6tRxjIe8RdL9j+ED42H1QX/inU1skEetvuxJtDxvUSswDNlkQJHYa6wVPkC8w7eAvFBZqdri1Wwo+F/ElM1TrAT/eoKLf9JfpnOQZzn/N2XovJt/aQXpa3y3dDfxXQ/fxpjWiDxn5BuZ4AJz/BN6Dl3rgcuMsWpqRtpBUH3HbQq9QfuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSBIiuVKFuVxwHb2RgOUpAmD5kE7Jqq1raGRHwLsSOs=;
 b=o8bS8ne4yOigXjGyYacfVujLfz1l+pUwf1RYv5mbCZ1eAP5zelCuolfU+k9nRLmbXp+4uNL9eOID1E8A1aL96W1DKKwPRUafVy/huzwzAOrcDCA6MGerAJO5sf5s/pT86lE8NKYoc1X6PDc1pvVM5K7kJk+N+17ypJ78eWL6cSSnv33UjwN49lGIGNrzcDoOTH7YLaTOjFal1EJB8tfLQW2wE6qjgUaTCAF+/bZlefkBUj8vFq9PVZoDUmEVjx+5/7LnWELSdsP/T5w4yoxhVH91JT1vVX8Azi49vrsRRRrW3EXwhmFugh+mDEBokkoX1eF8xYFCtUI/jls4eUNeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:27:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:27:35 +0000
Date: Tue, 24 Feb 2026 07:27:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: revert "use inline lock for the dma-fence-chain"
Message-ID: <aZ3DZU2wFD0b4Ecf@lstrano-desk.jf.intel.com>
References: <20260223195705.206226-1-christian.koenig@amd.com>
 <aZy2Hhu3SGQQPQbN@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZy2Hhu3SGQQPQbN@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: CY5PR18CA0053.namprd18.prod.outlook.com
 (2603:10b6:930:13::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4121e4a6-a52b-4f2e-f872-08de73b93c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1gxUjIxcU1PaWJqdXJSWFoxVFBzTWxYT3J0NEQ0ZjFuZWRXVCtGVUVDc1ZP?=
 =?utf-8?B?S2dCMk5QTENtZkhscGlVaU9iU2o4eWtuSFI2anA5V2Zrc2RaUTNYMkV4eGNy?=
 =?utf-8?B?YjFLVXJOVlJEVWVUUjNPYlE3azNNdW5maTUwOFRuUkREcTVSTFd1MExhYXZS?=
 =?utf-8?B?cWlISHdteHppMHRLanpqOEJHR3NpcjhvdUl0L1RHWXpKemRySUZWNmlDVEdH?=
 =?utf-8?B?a2RaWlhrWWN1cVRxRkhZd3djclRtYWNuZVZjN1hTOUFPeWd3aFhhTlNsR0Fs?=
 =?utf-8?B?VzNGc2NtYTIrdTgzcHZET0lOZkpKOFZYdnJHNW14NU83SDQwMFgycWkrY3Nm?=
 =?utf-8?B?YWd4TlRmSk1qRnJZMFFKYnhpbEI3UUQxRzZMVEJhbGpCKzZXYWJyY0ZkVG1W?=
 =?utf-8?B?UjBBcStkN0lPcVB4R3BxQ3ArZE11clVGUFRJdEhJSUFmZFA2WWpHOEFwVE9T?=
 =?utf-8?B?VjFNYlZ2aGduUjVudTZUN25YSTc3NFJtRGg3cC9yUU4yQ0R5Q3NkNHdobWFj?=
 =?utf-8?B?K2tHVk9tdTJjRW5YbWxrL2hQTk9raFNhb3VXNVVyNWZNQmFLV3ViVkV6aTJ2?=
 =?utf-8?B?RHpFcndvNkJVMVd6REQvS1R5MzBWWTlnQkprS3VVWEZGdXcyZ1lxdndMdlZW?=
 =?utf-8?B?TkU5UE8rME4xVWlMYXhwdkVXbTd3MGIrT09nb0hXSUwvVUpwbUhUWVE0UzE2?=
 =?utf-8?B?THlDNHhSUWl4Zmk4M3JsdmNlaEpHcC9NZ2Q1UnZNV2E3QjJTZWNMc043c1JW?=
 =?utf-8?B?dTZZNVkvSVB0aVQ1RFhSY3FIWDlFZUJEVnFpc3BRNHFqOWpWYm5RVmlqL2R6?=
 =?utf-8?B?YU96TEhPUGFKT0x0c3lLVGY0RXM5cWZpQmRxK1hJb1VJam15TkJsZC8vSks3?=
 =?utf-8?B?djhFUW84RUhiRzVQS3dkWFRSSkZBUU9qQ2JtOG5UUmdIMjRSbG5mRE4yKzNU?=
 =?utf-8?B?cTExMUIrbFdjVHlQNjQyTG54TXRjMGlGV0NOb2xrWVhTM2F4djlBdnpPaXR5?=
 =?utf-8?B?bVFuSFBqN2RMYVB4aGpYdi90VnFFWDFwTFZoQUMwTzl3SUNQcVhLL1kxNHdT?=
 =?utf-8?B?SUpGTkNESkozWEozWmxxRFZaRE1uT2psa1JMTzJkTXJsVjlrK21UelV0NGV3?=
 =?utf-8?B?OXloOXFKU3FQTVBqUWFHd01zNlF5ZzIvc0FGYzk5bFVTenhHUWFOZVo3WW5u?=
 =?utf-8?B?NUhPUXlVeEh3QVFHODFhOTJSeFI1cG84WXAyMitRUmNUSnJPVDVTVFp2OTdq?=
 =?utf-8?B?cExZdndLMW80TEdUQW9GRlh5UVR4SzlBWmdHMXFNTXhmZjQwYnhPWE5rVFVk?=
 =?utf-8?B?QUxBeTBGWmE0eVpURTIzVzEzck1wMFJGTFdEdzRreDRJTU5RYmxlYkFvVGNq?=
 =?utf-8?B?UkIrMkFRQmowc3BvcFd0MlVKQWhNMklka01MSzMxZGhnUFRPcUhCUWlLcmUw?=
 =?utf-8?B?NkV5T1BIbXREQS9vTjJ4TGFTYks1clRTU3o2QWt4NDZvQXk3RTFOL0d1UDNX?=
 =?utf-8?B?NVNwUXZwN21oOVlqMC9WUStXUHlLK3N4RjM0L3NzTGV1ZTZJcTZjUVc2bE1O?=
 =?utf-8?B?cUhIV0Y2b3ZYT1hqQVlaRzdiMnVRMzhQRFB6L0U5U3gvZUdMTEQ2VEc0bGNT?=
 =?utf-8?B?ZTBlbEFocnplZTFTcnV3dXdOd29sV0lSQWl6aDNSenoxQklEeDdFK3gzVUZx?=
 =?utf-8?B?UDBnTEMvMlZ3QWpRT3NrcG1DYjlZNENlYXVpOGV5MzJjZHVKL2RDUDRrSTZ2?=
 =?utf-8?B?NU43Q3dBTUhWS1ZIRlg4TTFmNFMvUXJudDY3dThpZHJBZmVIOG1lWEdqUFV3?=
 =?utf-8?B?UG5iNlliNkVhY2hGTVZPY1cxY1lOZXIwUnJyTlZlZmVWcnJIc3RLWlIyMmNl?=
 =?utf-8?B?c3p6N2ZXYit6cko4WEVGNmFYSFFWcWEyYkhlK2hrSGJmdUZYNlEyUFhucTZN?=
 =?utf-8?B?YnliL0lNQW50NTJaRDN6R1UxanVvRDRrdWJoY2pOeU8yZFNSOHM3OHVGSm9N?=
 =?utf-8?B?alJkaTNZcDVISTVjZTVPNlFDN2dPZW1VZDNSZm9OeWVQQXFpN2IwbnJ5REdV?=
 =?utf-8?B?a0p0dkU1aitFNjBITmVFWnA0dTBibVByM3Nrc2tFZWtNMWFIeXQ1cmRZWUNk?=
 =?utf-8?Q?jvjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RJcDdaeTlvc2kyM0Fqck9GVk1uK0VBc0xQZS9YUFJDdVZVQVVKdThvQ29F?=
 =?utf-8?B?aWlYZ3dmelgzaWFpeGxyUW5HVmRGOFZTOGp0Q21haEMyRjdHTEpRN28yazhk?=
 =?utf-8?B?bzBySUQrOFkyMGYrUjZRZjhoRzNaZDF1b0hOdzBqU3FVZnRkdGFGMlp6amlX?=
 =?utf-8?B?L2cxVC9FK01Va25zZnkzVDlkd1JVMEhrZXl0TGdzeVJBS2Y5L3A5V29PQ3Vr?=
 =?utf-8?B?dU03cHF0aUhmQThkcktTay9UREdQYWdweURDT2g0cWNvT3ZCb1Vzb2ZETHJ4?=
 =?utf-8?B?UEc3L29ZSFpHbTh6S1ZKbzFaWGhPSzV3dXVySUJDK2hZelN5cXVWdXVtN0FZ?=
 =?utf-8?B?Yi9OSHlwb21PWkpRSmdqcHY4L2JWVHYyVEgrcm9FZG9vSE5adFYvSEdud0RJ?=
 =?utf-8?B?K1lQY2JUQWlleld6Q1VUZ1VZOCswZm9FeDNoZk9YeDBMY0NrYmNFTTA5S3pt?=
 =?utf-8?B?M25FeEFaYWN3ZmRFbUo1L2xjb2t3V0RLMFB2RE1YSDNjcGNLZ1pUSFFpV1pv?=
 =?utf-8?B?YkpuRkd1elRMZlVJN0VVVU1ZU1dOZ2hrbXBtTVNRcmluSGJrN3JMOUdENFJu?=
 =?utf-8?B?dnpKR01uYzhGYlpYaHdscVRqOThVbFlRT1Q1RWlJRGRXV3pZZzJiT1VybWZV?=
 =?utf-8?B?bk1kc3R1WUdGVklwbHUzQTFBUUswT3hYT3V5Vkh4MjdLaTRIWThXNFh6ZjQy?=
 =?utf-8?B?K2VKT3VPd3E5aHVtQTlod2E1QWFQdFhSL0t6ejk5cGpwemw1QWhwVzJEZlJv?=
 =?utf-8?B?WDZJUFIveU1HblE2UkMrK2lha2xnMFQ1ZWMwWFVWRm5GWmJTb1ZrRDFZVGhz?=
 =?utf-8?B?Y21sakhyZ0VxMGtxaXRPMXBOcWZIQUtNRFpVcE1BT25HMTBkcDVEMkxZS1Uz?=
 =?utf-8?B?c1RCb01pNjZrTzlYZE43NmxYRzdRT1ZMRkR6Y2lDeHhKR3BXaC9MeGEvYUlP?=
 =?utf-8?B?MDlIbTNRS0I2M3pOSUVOdm80azh2K2ZhcmJSMVNqS3hGL2JpVVFNb2xvNWhh?=
 =?utf-8?B?R0YrT3VZdytjR2NCZWtqem5EenRqWEFscXlPbXA4SzNWQUw2ZUZLVXhmSzVh?=
 =?utf-8?B?SituT1hIbFlNdSs5RHhaMVBOQndrN2FCVWtvY2E1bWNHbk10bTl6UTBFSGZs?=
 =?utf-8?B?Yk1nYXdyU3BvcEpFcW0xNXdkSjdCRWp3anBUdW12YzA2ZXcvZXZQVUIwRStT?=
 =?utf-8?B?U2wxT2tRZm9rRmJFNU43U1ZhUWVwR2h6dzAwZVhBMGIxaWJuKzl0V2I0Qklr?=
 =?utf-8?B?S1hLS29iYzFldXVIN2tlQkl3akJqVlBIWFpPTDBsZkhOb2M5UjErcmw3bVdF?=
 =?utf-8?B?UkpwUTdXcURvMlFsUnd6WmFSd2IzaHNIYWozRnRxUTRBL29uUy9ZZ0FPVEcz?=
 =?utf-8?B?ejExRGwzQ0ZmYUNHTVhWTHNzY01XVjhlRnE1cHBUVTFjR2wrK1Zkbys0b2FY?=
 =?utf-8?B?WStGZ2dXUUtYNXE2N1ZxMkhFMnoxemRETWlHUE9NYVZ1VFBzWUw4OHU3OXF0?=
 =?utf-8?B?L0dOLzNLdEJPM0E0S3ZUc05qSVVrd0w2MTE4dXBmcGhYVnNCeGxGRU12OWpq?=
 =?utf-8?B?enN0aGg4cXoyQ0FQcVNYOGM3Vjc3RnZ4TzY4R2pCQjlQTnhTZm94UEVtNnFL?=
 =?utf-8?B?VGdRM0xibGo5Qnhlb2h3OEZRZC9YZ3YyQnBZaERlTlE5Q3Y2cGpQRFROUUFs?=
 =?utf-8?B?NWlFV2M2OUJaMjlBZVptVHRXM284Q1Eza1phcWRnNDBldWhNYk5kYS9zbThv?=
 =?utf-8?B?NTNUMzZEZU9mc040d2ZXbmhPK2M0VDBQWmt4T21UOFpwZC9GU3dISTBtMStZ?=
 =?utf-8?B?M205cERKSnN4V3JNL2lobDc3ZVRISDc2S1hReEY4NkhYNVo4UzhZem1nd0dG?=
 =?utf-8?B?SnlYalFGY3FRREVkSWVmWXlNOHVvbFo2dVdoSGpLUGkrQ3F4MUxIZE55aGl5?=
 =?utf-8?B?MmcwS2RqcFdCczl3TGU1ZWtYREFPN3k5NFp5SFM5TWc2aStrNkJYVHlXMW9j?=
 =?utf-8?B?ak1FTjAzb2lGVkRCcExiQ05zb3g1blIwSzFva0VVR2lMMHVTZVBONTdMNk0v?=
 =?utf-8?B?alQ1Vi9HTFRWd1U1VGc5TGpNRkNYQm1WbUJRT2ZIL0lSaXllVy8xSTdlUVA5?=
 =?utf-8?B?TDJOMjJxQTgyS0NMb2pxSmI5bnIvSHN2SUx3Tk1pVmVGY2krMUY5N2h4N1k3?=
 =?utf-8?B?cTFhUHpDWmhZRGYvSEYzSVhVMzIvTjVnRVhvNnFhSU1tdDdOSU5LSXFFL3Fm?=
 =?utf-8?B?TVl2bHlkREtReXRGR2pYOVNKbUoxNHNPb25oaWRCUDAvcFhzSG9PWkxnRFEy?=
 =?utf-8?B?K0RDSGlLQnNLMTVMcUlWbXBMYWZmWHltTXU2UGtmSXlBbGIwd2Uzc2FaZ1hR?=
 =?utf-8?Q?kOU1Zx9ClfdhlwOc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4121e4a6-a52b-4f2e-f872-08de73b93c81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:27:35.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i7xJHRWG1L5WuRgC2d8anRymBW9+Gvit0aLqtivJ+0cVDjmSEFxqw/XwxvSLLf7RX6aEo2rWmoY9RBauzQi2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lstrano-desk.jf.intel.com:mid,amd.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 75F84188FFB
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:18:38PM -0800, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 08:57:05PM +0100, Christian König wrote:
> > This reverts commit a408c0ca0c411ca1ead995bdae3112a806c87556.
> > 
> > This causes a lockdep splat. Not really the right fix, but changing this
> > is more work than expected.
> > 

Ping - this is blocking our CI so if we can figure out the best way to
move forward soon, it is would be helpful.

Mstt 

> 
> I think dma-fence-arrays will have the same issue.
> 
> Can’t we just assign a lockdep key for chains and arrays?
> 
> Typing as fast as I could, I came up with this, and it seems to work:
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index cd970eceaefb..d5cce24dca5b 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -200,6 +200,10 @@ void dma_fence_array_init(struct dma_fence_array *array,
>                           u64 context, unsigned seqno,
>                           bool signal_on_any)
>  {
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +       static struct lock_class_key dma_fence_array_lock_key;
> +#endif
> +
>         WARN_ON(!num_fences || !fences);
> 
>         array->num_fences = num_fences;
> @@ -208,6 +212,10 @@ void dma_fence_array_init(struct dma_fence_array *array,
>                        seqno);
>         init_irq_work(&array->work, irq_dma_fence_array_work);
> 
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +       lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
> +#endif
> +
>         atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>         array->fences = fences;
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a707792b6025..aa144b8c3534 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>                           struct dma_fence *fence,
>                           uint64_t seqno)
>  {
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +       static struct lock_class_key dma_fence_chain_lock_key;
> +#endif
>         struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
>         uint64_t context;
> 
> @@ -263,6 +266,10 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>         dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
>                          context, seqno);
> 
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +       lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
> +#endif
> +
>         /*
>          * Chaining dma_fence_chain container together is only allowed through
>          * the prev fence and not through the contained fence.
> 
> Matt
> 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/dma-buf/dma-fence-chain.c | 3 ++-
> >  include/linux/dma-fence-chain.h   | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> > index a707792b6025..a8a90acf4f34 100644
> > --- a/drivers/dma-buf/dma-fence-chain.c
> > +++ b/drivers/dma-buf/dma-fence-chain.c
> > @@ -245,6 +245,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
> >  	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
> >  	uint64_t context;
> >  
> > +	spin_lock_init(&chain->lock);
> >  	rcu_assign_pointer(chain->prev, prev);
> >  	chain->fence = fence;
> >  	chain->prev_seqno = 0;
> > @@ -260,7 +261,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
> >  			seqno = max(prev->seqno, seqno);
> >  	}
> >  
> > -	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
> > +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> >  			 context, seqno);
> >  
> >  	/*
> > diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> > index df3beadf1515..5cd3ba53b4a1 100644
> > --- a/include/linux/dma-fence-chain.h
> > +++ b/include/linux/dma-fence-chain.h
> > @@ -46,6 +46,7 @@ struct dma_fence_chain {
> >  		 */
> >  		struct irq_work work;
> >  	};
> > +	spinlock_t lock;
> >  };
> >  
> >  
> > -- 
> > 2.43.0
> > 
