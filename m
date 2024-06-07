Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5A8FFA32
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 05:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1139910E230;
	Fri,  7 Jun 2024 03:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX/WugTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBEE10E137;
 Fri,  7 Jun 2024 03:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717730967; x=1749266967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cnKXowZ9DSohM4gDo+CzGN2pES3k9l2XCv2qbe2EPE4=;
 b=IX/WugTRcQg4hvE0DyM3IbmeF2TI92GBpFFwK8r7SE0UqBSLG45XP6Ho
 5Dcrw2LmSb//KZTo7K3gjWx9kP4ZodNSw45D7Upf4FyeaPwl9FuZpFUch
 3JFMNOW1ysX/Tn2s2tm0nK4QCzt17X9dIPilhd7NezUiwSu8daSqSejL/
 OmtFrtp79DkgmrAQGzHZDfY8egnu245B1wCOHy8cGdF9BSbZJdf23YA4Y
 Pl1tWKceLB6dVjP1+8nveJcyvG+DABIf7/yi5zSKT2FpIwljD/Rss6UvH
 7MAB1ZAAPnb3Wbfe4lBdiQSY6HRSEYS4+kYpf/KbHvWGiS59id748xdsJ Q==;
X-CSE-ConnectionGUID: u5id/h3WS+Oh2alZbS1y4w==
X-CSE-MsgGUID: dCEyoNp+QqakCcTTqprPDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14553674"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14553674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 20:29:26 -0700
X-CSE-ConnectionGUID: p3JIEj4pSGexPssg13EJ/g==
X-CSE-MsgGUID: GjvVzdRWTPS0xRFUY38WEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38624220"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 20:29:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 20:29:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 20:29:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 20:29:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 20:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELplGwrGIdrB64UCfHPiNfYgiDCOd/PoaeHkRc8DqGN/oZlemcXeQs4wNSt5bA2U3y7gpikY1h4D7+6cktqfjR7G1pYKdMDcVb8+ac/F6eFgT0ekqlG3p+QBQ0kTsBX2QHS4yyDy/5jzB7avd2n9EbnNmHS2uCEhAenxDFeVhnhRig6CSJUeM/LPAAtE8UskGuJky41IQgPbKCm7cMVhU4P83M9gwahbiIpHe4VlNJKLg4GkFhd5sckIghxVwpxrHujbXWj639NjDEEcDdT94NEy3wRq/OYjeUCkLd2lvl+Kov71UNsdfaAwsSwo78heWT5M0mtYLGAkzVE+8QA0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CjEZWJ6dvzj5F1iPFNymYYuLeORtCuNJLiOt2+CYAM=;
 b=QZfom1WzPibmHvaWkJR1QTGVjFxrW74y9z4CscaE3ssPbgKqU5WgBA872c1gVzJ4fSBpCheEo4e6VDMoOrcW78rRq1EFTmTOOW5n9N3Too7VAuS8f+zXXmOX9OL9Gc/0WwUHwr1X4J8WCmERMKWDQXJvNL5xcvflS6YxqODEYei2WNx6Z9wM+h7z1ZrNj3BSMo6bRjo6bVZQymwR5PpaMIBmebJprdjpsiFEQp5ow6pIa5zyd9wVuAZYZNbaXJq5qLSbonEJJZT7/IPFzyZKPnUbMeKao5F96EAlecRXdDVh75Ff5tOUy7gi6DVd/l3N7T9scATckQ1OFl4TjhHtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 7 Jun
 2024 03:29:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 03:29:15 +0000
Message-ID: <1f2382b2-2a55-40e9-9fed-1da5702b91cd@intel.com>
Date: Fri, 7 Jun 2024 08:59:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/9] gpu/drm/i915: Update indentation for VRR
 registers and bits
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240605170111.494784-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240605170111.494784-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 566fb8d6-c624-4b31-c566-08dc86a20182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpGeHFCMExwdXlZWnZLZ2tMSDBMWDFkZzFPeDdYdDJiQ1poMm5CWEkwelNh?=
 =?utf-8?B?M0MvKzQxc0QrMWxSQm45WEJ1Z0JaVXY4M1RrWng5eklmYmFoMkRUSXFmRUlm?=
 =?utf-8?B?dDN4b25sS0NYR2dhSWNSU214d3BmSEgvNUNKdHpwOENnOFF1a1pRTDhWS3Ew?=
 =?utf-8?B?cklHWjdRZU4vSEo1UDk3Sm81cGVXMzcxZE1tZXZocERuNTFGWCtidEtXdXp3?=
 =?utf-8?B?Q2ZiVlU4VmtoVGdnSktwdVE0WHdNT0RjeTFZMGRLWEx0dXI2QnJrT0RUak4x?=
 =?utf-8?B?VmFEL3c3dU9wbzNNSUhMTG1XMHpkNXBoZ29kT2ZzWDJjWVo5T2JMcFEwUzQ2?=
 =?utf-8?B?ZCtCUEM4S1hjaDkraFdNRHMyRkpMTVA0cUNORXJpYkJkZWE1YzdKa2ZLZEEx?=
 =?utf-8?B?aWZJd1l0aktFZ0VuakkrNVBObFpLZzc5R0NjbjdET2RiMmZYMno3SE0xdERM?=
 =?utf-8?B?UkdmUmk2YStFbWlUbUt2cU4zbGdPdXhXK3kzRVhIMm9SR0wxOGZYNDAvNys0?=
 =?utf-8?B?b1NBdFk5bFpEOTA1VzYvaUdzc0ZESm90cjRibVpBdWV6ekYwcnB3dlFUMlFU?=
 =?utf-8?B?bVkyVHo1dzhIdEliZGZNdDZQcDVBdWJZOGIrSjR5aS9sdDZMWHJ2NkRzNUtT?=
 =?utf-8?B?UWxTOXhvd2REYUR3N0pjZ3BmUlZ4MXIxM29nNyt5aWNWUTVzUE11dDQ2Rm5C?=
 =?utf-8?B?ems1TzhYZ3ltMy9HZkNSdW1mY2JYZk9TZUNtN2EweEtBOVdya1Nrc0FBTG01?=
 =?utf-8?B?anRnanF0bDdldjdtV3oxekhpbFpFa0U0VG9WZXo5LzBKVjRvSFMrS0hNV1Qy?=
 =?utf-8?B?VS9GK0NVUUR3aklrZkRiSFdDSHZnY1dMK2hnVFFRWHhrSVlpc1BESGNWdlI1?=
 =?utf-8?B?MjQ2OWVySjdydG1sZkltTGZJYWNXVmhwY2Z5eDVUdGhETGVIMFM1VzRHeHEv?=
 =?utf-8?B?NDYrbnRJdnM3dmpYWHNVV3JabGk0UXkzSHptT3Z0S3NiMVBEZ0lpdmFKUVJQ?=
 =?utf-8?B?eDB3Q3pyT0FleG13N3BtQ2Z4NkhCL0c3N2VRRGh2M0JibWJmVnFNcWRRQjIr?=
 =?utf-8?B?OEdiemFWVmpzWVdDelNCWFlrVmt0dEhBZTJwb3hPQTAvUWcwR0VTdmFhSWxt?=
 =?utf-8?B?cWx5WDMvbEtpb1E2MUVzT0NvcVRrMFh3TTdJNlYwUXRZdXVCbEVsTkFOK0JJ?=
 =?utf-8?B?QWRPaVBGWGgwNEovZjJSclBQekh4VlFlaDZLVDV3VmtDbjVGYU40YXJ2WnpJ?=
 =?utf-8?B?RWZVcGJhNFlwNWxiQmdmdlZ5YkhnRTltZG1vSWZKd2U5RXJqZjY0MVYrU2RQ?=
 =?utf-8?B?WnFJWnl3WCtYZWxndkJVLzlTZVpjU1hqOUtadzJ4Z25XbGdaazRHazBrM0Vz?=
 =?utf-8?B?Vi9UVzlMZmdlWGNxT1lPYTNJR2t1bjdmdjBlQUQ1blhNKzlSckxNMWNuaktX?=
 =?utf-8?B?Z25sNlk2N3czTWNUWWYwWHFoay9qMTQ1WXNCU29YMVF5NTcxa2dLNHo2WjlC?=
 =?utf-8?B?OURjZ3BBZ285ekxCK3dHTzA0Wm5OV3Bzd1kzTHR4TEdEQ1ZYaGhhSkltQWN1?=
 =?utf-8?B?Y1JVSVNYdU9MVnVIRllYMTJ2VzRrNHhRcnBNSzQvc1ZXbkF3L3ZodXpqWmdE?=
 =?utf-8?B?SFBsZEJsVzJ1ckl3cDhnSFZHcXA5c05MYXR0SzZETWJvaGROWkRLK0NROE9N?=
 =?utf-8?B?RU5OdTcybXFnZWZITU1uMUNtbDc4RWxmeTVNdUJZRGc5bEtwSGxDZXFvSjZW?=
 =?utf-8?Q?Z1fSvqh1hBEP0iIxf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VwbjlHMHF5bCsvWXBCWnhPK0dtOFRONnBHdHE3ckZLU3RJajFkUTlIZmJi?=
 =?utf-8?B?VE5ydU5FTjFqeXpjTVUzZjNNbCs1VWdiNXRnMkthcFFVZjN6M1JpYUJ0aE1J?=
 =?utf-8?B?TkY5RytUNy9adE1jSlBiMFZIb0FNRVNBV0pmV1FpaXRuVkU4NHEyVU5tT21O?=
 =?utf-8?B?V2duL0V4WUs1MU55Z2YvUzAzSkNpWnBPQ09maGJ2UTNRRDFWcDlhekpkclhS?=
 =?utf-8?B?ZFJISy94M3RGYVIyRVZBSE16M1RvalE4STdrZjJwdU9FRUF4b2dkTFNhOHJJ?=
 =?utf-8?B?d3c3L0NSeDdyTzRQZXVEZFBKTDBHdFFLbFM3c1lDWE5qdlBMcG1vSW5OWjBu?=
 =?utf-8?B?Y1ZNc0sycDlCb2RDdE14U2hDYnZWNkZsYTZpQmt1Y0RMeU0xRkd6M2JLOFJs?=
 =?utf-8?B?ZnloVUE4U0ZJT2MvV1NOVEkxanZFRCtQK0xlekVIYWtLTHMxTnM5MXkyUDNX?=
 =?utf-8?B?K3c4OGhSVDZlaGhwRXdLamJQTTBFbVcyaFQyOW1kQ1A1akV5SkN0WHNMMTIy?=
 =?utf-8?B?VTkyblk0Wjh4Z2hJMmF1WGY2MFdGNnVLZDA3UWlnbkFoeXVENE1WZ3BMRDNs?=
 =?utf-8?B?ZDBXWWxiMjFhQ041Vlp3SEFpRnZhaW84Sml4QnlrY1hWY0o2TWpFR2lBUHJy?=
 =?utf-8?B?QXBUUXZObmQ3VGZrM2VpL2ZUYlRkSk96RG1xc1B1QllXK3ZxNVpmVHRkcUt2?=
 =?utf-8?B?R3Y4T0ZlT3dvOHp2K0VqK3JaQ1djQ0NuWmVqa3V4MllyQ2RtSDJkU1FqdTUw?=
 =?utf-8?B?NHh4ZkZFTm9vRzFyM2Z2SUpSTjQ2dnpodURvcW9lQktRVmQybytmVFU4Y0VI?=
 =?utf-8?B?TUtSQ29hYUlUalZQNnlPaGJSYjF5WWpadlpYaVBwSVo3ZXpXcThLOTZpZlZ2?=
 =?utf-8?B?MFA0WFpKUDluL0U5SFZodHRMYXg0VFhJL01qV0VGU0tlR0ZmRS93SGxkWWlY?=
 =?utf-8?B?UlRBaUFSbThaMjducVdLa1h3VzF4UGRCMW9wc01GaWsxS29qMVRXcHp3S2Va?=
 =?utf-8?B?TFlIUlMvbk5jK1VudmRXNE41bEpNZUlwMkkxUHY1WENNT1dUM0ZTVVk0UEdk?=
 =?utf-8?B?Ym1TVVBmK3NqMlRiR25qQS94MzRkcXpBdWJIQzhXVmd1QThDNUU5dnRPa1M2?=
 =?utf-8?B?dlh6cU1VUDltaXRFSW53STFZQUdnOHQwZ0F4eU12TmJEb1ZrMG4zTENFcjJt?=
 =?utf-8?B?SHpBTnFZc0FTZ3UvcjNjZlJlMzhlTlhLODA1bXhnTE00ekJScVhNcHNva2Qv?=
 =?utf-8?B?WDJBT2lZWlRXWmozeUVQUVYzOFg0aTdRenE5cUExNSs0QkVYTzZLOWNGY29U?=
 =?utf-8?B?WDVBYmk3ZncxT3BJeWI5eDFWeGV2RmUrVENNQm5JUW0zTXA1Sk5QelRGZGZo?=
 =?utf-8?B?bGdZdU42bTJDNXdSbUZHYS9ZbDNodlQrcmZEUWVSRERmYmdwWWExTWx6S2xB?=
 =?utf-8?B?SEt1Vk5xUXZYLzdiMjZSdEtLKzY5dU1uSUFqYVJuK09YWHVXdkZtVXB0eUdV?=
 =?utf-8?B?WnlDNmtuMmRtdUpPbzZKdDhkUjJSREo2QWMyU3pMRjIvMlBNbThEdklDSXdr?=
 =?utf-8?B?Z0NwdGFHWW1FT0V5WjZxY3h1QWkvRTBUeUJiaDhIaC9VOWxhYWRKVDlsOWlR?=
 =?utf-8?B?Q0ZoczhJZmtkNVhtVnhzT01YeUFKM1ZKVmpJakhMRU1QL3AwbFVIYTlBSFlr?=
 =?utf-8?B?VmJvb2hnUU54SURQbXVpc2JDTWNlMGNCSTNoN1VxUm4wUkx5am41L2JEWC9O?=
 =?utf-8?B?aVAxL0UxNVZwbzd3R1dYc2tTVW9RRHErSHdvcmhkUXJYemJmSjRSOXhBNkNl?=
 =?utf-8?B?UzBXWXJkNXV0eEhXSjRLWTVuWVoyMCt2MSt3Zkl4QUJ3Y1ltUDFkQW02RjRT?=
 =?utf-8?B?dHdHVVRMVWVYL1VZY01FUHc2VzZwT2gzdnVEemJYdE1ZV2t4eWIvMDdETE1x?=
 =?utf-8?B?akhibDgrTDIrNVFjMU9hNllpK2ptTm16WE1heVJkdkYvYkVnL0RseWdwSTZB?=
 =?utf-8?B?QlBMb0xvb2xqTXpUdE1RdHZYNTBuTUh4K0VPZmRxOHFuaWFOOC81SVdPVUZP?=
 =?utf-8?B?ZDZGWkZNeFM5Sk9mM0VBSklSVzRNQnozdUFKdTBqb2FWQndGNy9rZUdsblJC?=
 =?utf-8?B?T0gvWlN3UDlzMWFGang5NktnVGJUekdLQncwYytJbm9CVWVoU1VIZ2R4TytB?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 566fb8d6-c624-4b31-c566-08dc86a20182
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 03:29:14.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+t/4IgHlTirW9X2xAqHm6ilp3POoV7fVuoOOm4Aax/sMzVr00bEbk95pWyF9XTyvahUefZuFCkhk6ZF8slmXFppSEy1ikLwK4Waf8PrqP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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


On 6/5/2024 10:31 PM, Mitul Golani wrote:
> Update the indentation for the VRR register definition and
> its bits, and fix checkpatch issues to ensure smooth movement
> of registers and bits.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/i915_reg.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0569a23b83b2..6b39211b5469 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1152,7 +1152,7 @@
>   #define _TRANS_VRR_CTL_B		0x61420
>   #define _TRANS_VRR_CTL_C		0x62420
>   #define _TRANS_VRR_CTL_D		0x63420
> -#define TRANS_VRR_CTL(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
> +#define TRANS_VRR_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
>   #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
>   #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
>   #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> @@ -1160,7 +1160,8 @@
>   #define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
>   #define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
>   #define	  XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
> -#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))
> +#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, \
> +								(x))
>   
>   #define _TRANS_VRR_VMAX_A		0x60424
>   #define _TRANS_VRR_VMAX_B		0x61424
> @@ -1190,7 +1191,7 @@
>   #define _TRANS_VRR_STATUS_B		0x6142C
>   #define _TRANS_VRR_STATUS_C		0x6242C
>   #define _TRANS_VRR_STATUS_D		0x6342C
> -#define TRANS_VRR_STATUS(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
> +#define TRANS_VRR_STATUS(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
>   #define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
>   #define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
>   #define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
> @@ -1241,7 +1242,7 @@
>   #define   TRANS_PUSH_SEND		REG_BIT(30)
>   
>   #define _TRANS_VRR_VSYNC_A		0x60078
> -#define TRANS_VRR_VSYNC(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
> +#define TRANS_VRR_VSYNC(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
>   #define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
>   #define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
>   #define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
