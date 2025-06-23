Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53BAE476D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC0F10E3CA;
	Mon, 23 Jun 2025 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLVP/iZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBBD10E3C8;
 Mon, 23 Jun 2025 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750690394; x=1782226394;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mqptHbeGpotVdppGrGO1KPlHG8EZW/LHqTnYi3l3pfo=;
 b=VLVP/iZZZiKAk3D0EY3vqKXLrbLURyOdmLtr8PxhdrnKRfMc5MIpGgG+
 SSamltBr8KaPXL1nFUBOa3vTgjfB+8DQCjqheY3/lPtwe4e8zXBPZo5jU
 2SAfbPyiIRFZMUT6LZFlj5D+Ibha+HPdsIkfjnnYt8sTH8u/V5xuek/Cz
 oZqKMuGvG7p61RRe8psCU0jy/5zQ1yOWfuxTj3Y3H5tnZF6pqqMIH/hek
 B1NDe/f+lr3/gMGIp3a+vXGjL8kC+FEeHFoz3VcU43LcTSsOhlGWr6flO
 VtrrJekZL+aTM9+VUAp1uKU0vm0ulNlrQ4QDkjdQOOSFJq3ZIoogtu0Y/ g==;
X-CSE-ConnectionGUID: s9e75xTnQT++GFZ8c/na8w==
X-CSE-MsgGUID: nY18+8RFTeKb3GVVvXwp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52838051"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52838051"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:53:13 -0700
X-CSE-ConnectionGUID: 9WHyOaQ4QCqIrfSemGiNjw==
X-CSE-MsgGUID: gOCFd8MOQ+GBEwjtZnsz8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182664848"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:53:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:53:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 07:53:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPN9VO45t+b13yb0C9xpLdg4fdDrj5zCUpUsNG/TXTYc6DGZERUNoJsHf/tJiDZe1OAHABJm0u4wZcYS0RmrmZKoXsSTMnJjegkcW4H5vfQzJT/Ok6DSHExPP3T8nzYGlEZM+YzdN1av/0x+gsyaKS7EbXKSb2HjeUxPG5DXGE24jIUGiEuCIu1dZMiblfIb/aLtAJalQ238cVxKDeWQm4c8oknqU+YjqKohm9XJzJtLrXOgyWJibrhbnjRT7OiqCB1O5YXR5QSgJh60jVX/0zo7MrH8etIbG4w9wpD5uGXUEIkSeZTWT2eASFsuSVEfV0ZNgxtux6jyJU3nzi/9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZcserQE0EST0FXOo1hmcm3F2NycnLpo1VfsPoZpfVY=;
 b=Zi81A+G2PBCgeeufqyrmzz0R/Hy0m7XEY5ah4Pu1BMn1XUdHw1g4B8EalE6/xJEH0UsM/z6yLwe8W98MBwBrAa9EuJGbcx0IJDoEB+ayyGZA9dtZbX7nHaR7pHX29Bki2TLXVZ/VXAFLr8oQJE49gw1ZLwl/EtSw12BcLoR6DZAoz8LmqqheOoIlvhMBlLi8Mi8qbUccJk1lz0qLkwwsQ10x7VzTrGmAH0wBHqmBHv9spLap7vyHaS3MLiPIEg76bzR4nZtvYphsR/JlHe7Owy6liLziXnaPttkLxK9/eAd6wVSp6aQ/pq3083vZbH/DGwqPxtjN/EVZW9gUgJ/1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 14:53:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 14:53:10 +0000
Date: Mon, 23 Jun 2025 07:54:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: stop asserting on the TTM refcount
Message-ID: <aFlquOqUQTteQDVu@lstrano-desk.jf.intel.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
 <20250616130726.22863-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616130726.22863-2-christian.koenig@amd.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ce8733-4b73-4670-26ed-08ddb265abb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXd5RFhwOEdMS29kVVFRVHBtSnRlbHFvNHVtVk1TZTZpWnVmTXF5d2d4MGRW?=
 =?utf-8?B?L0EveUpFQlZNZ3pyV1pITEJkQlFhbG94QjVJeWprRW5EQVZPd0ZyQW1YZlZt?=
 =?utf-8?B?c2tvUFJFZDdLZ2pkaWhnWjlXeXVNVGcyR0d5ZS92ekhXR3c1QTVnQk9GN1NL?=
 =?utf-8?B?d3V6akloUm1RYk8rQzdRUDM2WldqajhoRXo1S1lOTlMrRC9PMGlVc2hVNDFN?=
 =?utf-8?B?Z1NxMU1YcVM4dVovV3BVaFo2R1lqRnU2MEg2dTBLZXFLWmJSTUk2MGVNSnY1?=
 =?utf-8?B?VG51VlF4VCt6NGhQdGhwN3FmZTgvU0JUTDJTUW13L1dYUUY1ZHN4M0ErejZq?=
 =?utf-8?B?aVNIdHl3SnZDZHFVT0MxU1dIY1BnQW9hUTVHek40akdVMjRyUm1mYS9TNnRR?=
 =?utf-8?B?OTZMYTB1MWJqakphdGpEUHVsTlIyUkp6MmFudXRIQ3ZpL3MxR0JjWkkrdk1B?=
 =?utf-8?B?NFMweDIxWWRZanpPNUJVVlB4bGVacWovQ0lSbDRka0Q0ZVJoR2FpQVFCeEY3?=
 =?utf-8?B?OUFveDF5dE1Ga1RTRjQrQnZuZnRCZFFIMlFtOE8zc0FkVkd3aHBlekpwUEJG?=
 =?utf-8?B?WGw4N1pLM0NZaGJRSjBHV21QMjFUcmJBNjI5b0dFUVgwZ3lPQXNUS0JzVlVF?=
 =?utf-8?B?TUVQb00yZzV2aUJQVXBROHF2M2R4cys2WGEwWERuU2FhdVRWb0p5NitmcE50?=
 =?utf-8?B?VVUxNXM0WDhYWGVQMnlva2ZaYnkxNU9UUFliUWxpc0VBcHR1SC96dTkvdVhR?=
 =?utf-8?B?NnV1UVNNRk5iWDJiQkFocHcvYlRVZ3BETmJkOFF5UGRpR3RxVVNZTXlCcG1z?=
 =?utf-8?B?SmNlK292VVNuZTA4VXhHZDhub3YxRDJpUHBqY2JyYWszOTcvaHh0V1hsTzFU?=
 =?utf-8?B?NHVuajkreFdrNlVidm9EOG04cldkVlZmVGp3TFVPYXkwdlBkYnU1VkdXeTRl?=
 =?utf-8?B?R2dkVlJIN2VPMHhrRWJxdU1FS0NQZWNrZHJSZFZkRkN4d2tra3hMS0hURVFC?=
 =?utf-8?B?cG5PNFRreWlGcjI2WnF2SVd5eVdnaThRVnRRQ0M2RUh1NG9aMnFZeXUydXpv?=
 =?utf-8?B?ZnMyV0I5RmdhRitzdWJ5cVcvQlM5MzZyY1hkbmptU2ZBM1d2S3ZiQ3NvVTRr?=
 =?utf-8?B?T2tKY3MrSGNrSnY1ZHp5TmVoWVpEanljMFJIWVltL2xtQWlWVlpTYmtLSXVs?=
 =?utf-8?B?RnZyNU9UUXR5akNweE05Z3JmQTFqZ0NnV3hNeVhaYWFoOHF5Vk1YWFpmZjVT?=
 =?utf-8?B?elFrSHNsRUVKYWFoQkd3QXNLdmtGRWNLMFJDQlFDaVBjbTF4UFZ0RUw5dmFN?=
 =?utf-8?B?TU9BK2RHejEwRkN2ZUVhUXVQZHBBNE94VXlnKzV5UndwZmx3SStzekVyUkwv?=
 =?utf-8?B?V0Y3VGN5d2VvQ3VweUxOUk12OEMyd05HRktOSFBKdWd6cytXMjhYaUNJQ1FB?=
 =?utf-8?B?VGcyY3ZhWGZkVmh4UnJiY0RKZlk5N29lZmtuWldNNXAxaVhWL3J3RTZEMDN2?=
 =?utf-8?B?amZuZWpYdmgrZTdMc2c2YXBwbml1bGo1MEVpN2x1WVRaMFFad1JHbHRVQTQ5?=
 =?utf-8?B?Z0FaaVQ4WkFWUDFaMVA5TTlRQXZ3YjB5L3VGMXNrdk5PaHJtWml4SWMyc0Rl?=
 =?utf-8?B?cWtxWXJ1SWxLaHFOSXFrdUJPdytHdWFDWnBKSnFjZGRKMmJKTzUrdUlyMzVX?=
 =?utf-8?B?SlRNNy85NHgveVAwRzlUY3AxSm1tOEF6Rm95VzRLYWtmNGtxb2VMZTlOejhz?=
 =?utf-8?B?bDI2aGtITGxnVjZTUkZ6bXYyTTdHRmNUQXRhdTdxa2FkNkxVazVhcVNaZE9X?=
 =?utf-8?B?Qm11anR4TURrYko0Qlp3RXlnZisyaytXMUdGL21KZmYzdWRrSGcvcjgvRm9L?=
 =?utf-8?B?Y3VWb3BTK3ZVZlpjVGtPcmVPcUx3VjdhUm8rMmxnSU9Ecldtb25SMmliMW9G?=
 =?utf-8?Q?Uz82qrUMaE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUthQnk2ZitjcGNUaDNiMmUxOEVKSXYxS3o2a2FLbURxWGdVQkRZRHpoalV4?=
 =?utf-8?B?VkkwSHdXb3h3MFJyTjZJelRVUjc3eDFuemVHaHdxZ0Y2MVg2Sk5BeHB3OVpS?=
 =?utf-8?B?MmxGa2VaOEhEcmpzVDd2ejdOMjM2eHNhaVpCNU03eXAvMm13dXpLcDdsdHlF?=
 =?utf-8?B?cHdZRnZId3FQc1Q1d0ZJWi9iMGMwVTRlZ1NXWkpnbktySTlNbEdoVE5DcFp3?=
 =?utf-8?B?ZUpEZzZkdGlyY3d1QUFIbWZSdjFnNXVwNmZXMFRtSC80Qkh2UkR2QTQzMW9n?=
 =?utf-8?B?bXRPUmc0TDA5cmQ5VjVhZnBod2pSb1V5VnBrU3FpYThTMnE0TFJPMzJMSjBl?=
 =?utf-8?B?Zmo4SDViMytucXFNbDBsL0E3MTJYRFdJaEl1bll4NURRRmdRRXd3YWxuS3kx?=
 =?utf-8?B?cDFsYThzU0hNejlrdHU1MDlGaUZSWXRNMGZ4VjEvdWUxckxJVi9hcGpnYk1T?=
 =?utf-8?B?UyswRk9CRlg5RGx6SmlKZHIyazNsRTh6VlNKZHBQM1gwckllYThQd0FvaVRq?=
 =?utf-8?B?aHhPWURmZTNtVDVBOXJaUGNqRTdPNWlZbllMbU93TURQdWN6anFraEx2TXhT?=
 =?utf-8?B?UXd6ZVlmM25jemNidHlqKzNXOTk0VWJya1psUUxQT0VyYklqc0lVdXlQV1FD?=
 =?utf-8?B?aUkyb2c1NXlJOVJpVEphV1RxMTJnUnF3WFJKNFJRQ25RQVpDc2Y1VHZHT0Jk?=
 =?utf-8?B?b0tONFNaYXNYTlArR2lGU3VrMXB5VHVtd0JPME9xeUtzOWxtc0NwUU8xcDJV?=
 =?utf-8?B?eDg3MmwrZWkyR3J3T1d1UkkyTTBFMzc4cFVBdlppczlMcC8wN1Y4KytLSkZ6?=
 =?utf-8?B?dFl3cFZMUUk1bm5SZVk3QWNyQmJKb09ZRk9abmw5R2I2ZlJjbVZqeEhPeG9M?=
 =?utf-8?B?VFNGc29UVHlQREJnWCtPczB4Y2FXaUtXT252dlJzYkhjaktkZjBGaWg5eUxL?=
 =?utf-8?B?R0VFVnRRaWdyaDlLc1FzMkI5UEpLcUYyTmZZcHBVTnZVQkpMMzBpbVY3eVdW?=
 =?utf-8?B?aVdkL2hNNUwwT3pCWUtxN1I5U1VxMml1OTVpNGtySmFTK0tOS1pJbGNkS0VP?=
 =?utf-8?B?bmU2dHpueU8ya29xREZrMW9yZ1dmWjd2cTBHYnExNnVUZE5wN0RtUVVQU09h?=
 =?utf-8?B?UFAyU28vR3liOVhJWjRDRHlHUnBwYnA3Wklob0lYaGlGV0FDSlpWbEJ4a0xK?=
 =?utf-8?B?a2NjNjJKQXU4SVlvMWg2V0ZHcS9lenpLVXRFcFFjSjFPN1NZc3VZSjYzZEx6?=
 =?utf-8?B?MXlDRjVEbk1GSE03YVRlMmlnZFJLWmtKa1FQdFVCaUdYY3MxOUJBa243NmZ6?=
 =?utf-8?B?L0pFanZzeXFYMWtpU0xsUjlQQzNnZ2pobmlTSHFLWGJpVDgxTVQxUmZNcFQz?=
 =?utf-8?B?MGFFM1RNNVFaelRSK3YwSzV2QlZuRVNUb1d0OUNSZXUvOE9DVENDaXQ2ZXZV?=
 =?utf-8?B?a3VLQThPcEFwNEdkMFNvL0cyVVJUSXBYa3ZCUnBQTlpLYU55UG1OcmVSNFdw?=
 =?utf-8?B?ZkdVZTE0TnluS1FnODBYNE9kblVhUDBEK1c5TFdtMjJMamJSaGNDV1hONDUr?=
 =?utf-8?B?YUtRZTc0aHJBZnFFcVFqbzRiU2xSeXplb1pyUDUzTCtLZ3RTdUE4a2pRMWVB?=
 =?utf-8?B?SmJ3QnY5a1RTQ3NnbzVMMllFYVFORDl2NjJMTkdjN3NIWGhDU1lwSDl5RzY3?=
 =?utf-8?B?b2VhMVlvWHZ1dlprdmpxYzN1WS9QTTJXSTV4MDRuQ3gvaEQzTTdwSnptbXRD?=
 =?utf-8?B?NmxDVlZycmIxRkZGN3BqQ2d3RUxnVnRWNCtkaklxd2JLWjJubGE4T211eWd1?=
 =?utf-8?B?UVRFYjBmalhlZS94My9LemU4VlRRcTZPOTNWZWpRMWErKzB5Q1U5STEvdVN1?=
 =?utf-8?B?MURPaXVjV2duRjNkYUM2T1o4Vm9qbHBxMEUrRllhWisyVHJQakdYcUM2YkxW?=
 =?utf-8?B?OU43VlkvZkdsVFZ0eEc1enNzL0lWK21WWlRFTFBMSjdBK3Zxb0pmRGh0eGNa?=
 =?utf-8?B?L2NSZmZ6R2MwbVcvemg2R1U5UWllQ3l5Z1QySHRiL09PNUlvcmVJdUQ3N0Vj?=
 =?utf-8?B?NXN0YkRDd3FNT1g4VjZGY1dsR2NNM2JzakZDTHgxcUlxSlVGUnIvemFDM3A5?=
 =?utf-8?B?M3BWcS9vWmd6ZzkybW1oR3ZqaHJwSEt2MkE1eDNTanoxNExGbzNDcWgxb1ZI?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ce8733-4b73-4670-26ed-08ddb265abb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:53:10.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAHMq6CAe+305XAdU4RTjr2tQikaghcEwOuCjOueDdnilWzrQU/gnfb+ps4lLeIP6EalWJwDfLpbfwC0gbMKuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
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

On Mon, Jun 16, 2025 at 03:07:22PM +0200, Christian König wrote:
> The TTM refcount is about to be removed.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7aa2c17825da..2a8e7cb8c982 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1417,8 +1417,6 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	bool locked;
>  
> -	xe_assert(xe, !kref_read(&ttm_bo->kref));
> -

Maybe drop this patch and the last one in the series and replace them
with an assert(!gem.refcount). I think that would be okay and wouldn’t
break anything while retaining the spirit of this assert.

Matt

>  	/*
>  	 * We can typically only race with TTM trylocking under the
>  	 * lru_lock, which will immediately be unlocked again since
> -- 
> 2.34.1
> 
