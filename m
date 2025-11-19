Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE0C7073B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 18:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FE589DD8;
	Wed, 19 Nov 2025 17:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmi1YiPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CD489DD8;
 Wed, 19 Nov 2025 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763573214; x=1795109214;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W75RwDtJtLNd+d9jAF6V2/5QsbHEa94h0PLCuW88PVY=;
 b=nmi1YiPvA56BmEq7+FKGReqcR1k1r6o5NTDKtNUmeQqQ38ft9XiARetv
 5HrNB7b2fjJEcxyegA5SzwSn+ZFzNKzM120U7gYbVZTbS9qlEZQOgp1zZ
 ofO+OrH81L9NR9fzlGyUdifjjmxnFIk40em3JQ1m3/dGSyKrOPZ8jAbTx
 +q3BJSopzZGqijL0XOy/dDsPtzBLmsmYZeEViRB0uJLoa+u6nOAlW3A7i
 XG42SCsACjF9Ud+4e6qse0uqOvW8cU/tYN8r5n48AOBtjc3hifxTiJ1eN
 eSU5CqZWlSEGSVMPGRxFD/ZN/Q7rs8XGhsWY7WiO2cuK+H1Cu8DT+k/p2 A==;
X-CSE-ConnectionGUID: E2SxY+h9S/SZ+GANZUVCcA==
X-CSE-MsgGUID: r92gNSfZSmqc/JZ8T2cNEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76981557"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76981557"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:26:41 -0800
X-CSE-ConnectionGUID: wQC3WFRzSuyv9Npquy71Ww==
X-CSE-MsgGUID: DPKBckYIRdWs/dHbXFis+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191148802"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:26:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:26:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 09:26:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:26:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqZHc0GvwQFshE65FJ5+a0lyb1/z3lUz9wJx5yPiF8TYShhXseuP2hAnzKw6aNMWgmVnA+dSTKWpQck3uEOQ8VOVxJWF0N1YQVJtO5lnQKezRR7KdtMgl6yrHm2mvwqPfkEpEhrp9tnP022CQq9fv8Qiy3CUjIpijbYzh5xh2ke1bbAq5/Zdwt1YGPydAKM9KY8+SfP8RPiruAr6HY11nPHQJuiH9o0SsE94Zba8dtMNunngtcyHmqaDzaJpU3ouazV1hF3K053UUAdWbgLrWLzKXuQw3h5kAEo83MNDqk2dMmRl1ea6ReXsdyNVzaSaEkaaBS3YaL1AaYfNyvZzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU7H1rwTS48U/nQLcTKsvT2mhHxFxw5JdjpWvWcRSIE=;
 b=QDpAGzzzd9DAB7chedRag3ceUjn3xcIAa2m9KYSGSBHWeyRqcMHjpzsN/Hcutjban8V+TJrEX+XddRN+BGMWkMgZccFl7TunmOUCHCxhhKp1mLB+S8TvunQ0MGhRrQm9AS10ey84wCF6zw7hn3wUpeWofFIg0nScCPe3z1JtlPSplyv4NyBJm+3XuKhZNTjsEsX0bAFzIlFp4/YdLm9u2fbBt8MXODzqT76720TEVStMdY+1XZZKf/G2SnQuluWCg2tp2ms1C8FIIqpg9Fli23YF5C6D9a7Z3mFgWYm7GZKb6vW8mNyG4UkQooXg4eMgXR3BPJ2IzeZ0VNI2jgCKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:26:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 17:26:38 +0000
Date: Wed, 19 Nov 2025 11:26:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [REGRESSION][RFC] memleak on xe load & unload on PTL
Message-ID: <qalol3lam5khiijztfdysgl7qj3fhgwizyclkld6hae6bqazz5@6xqir2p45nkt>
References: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
X-ClientProxiedBy: BYAPR06CA0032.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 6312f0f5-a3ed-4b5f-b03e-08de2790cbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZJU0hNNDdPbk5xdnRlL0h1ekZXNCtkSFU3U1dHL0xPN20yT1F0SXM4Mmx1?=
 =?utf-8?B?VE4zVmx1U2FySTNCaHZmalJONmlzQ25yZ2dMSVhwZzVwRWh6MDdIdHBveDB5?=
 =?utf-8?B?M1BCZnpSMXpTU1MwM0JialZmK05Hd0pOSWcyZW85TWpocjJUWDNBSmZoUkd1?=
 =?utf-8?B?L1pxY1NHV3ExSU9XbjRnaDk2dm5xZURmcFE0b0I0Nk5kRlh1RnVCQ1dtemJW?=
 =?utf-8?B?akx6bXdFa1VlaGRDZnJINmxJVEZFZC9SM2RlNDN0M3Bscm5RbWg5dE8raW8r?=
 =?utf-8?B?T005dmE4Tk1WNEFtVHhOYlVUTFNvdjdVME9zYkFWUHV5LzhxTjhWaFlsUGJ1?=
 =?utf-8?B?Q1M0UWx5S3QwZ3ZveGJzNThGMG03bEplYTk2eHQ3L1Y0MzZpbVdVTmtCMFY2?=
 =?utf-8?B?SkhKc25VRUxkbmw4T2x3Y1BLdlUwWGRaTFZteDVOWWhHRnNJZzNObGRwRFNT?=
 =?utf-8?B?YVhRZGhvclIvc1R0NUlCcEZRM09lT2NwSUZPN3VqZlR0Z2N3MHRCQ2pmSWpm?=
 =?utf-8?B?YmQvUzkyMDQxTlNPd0QrUzBINzBsUjNIZERmTUFqclpVTjVQL1RkaVIyS0Fx?=
 =?utf-8?B?ODVYM3h0bGtjTUk2aWVLODhUUmZERmQ4N0gwMktRQXY0T0pPSURhaWlUbGdx?=
 =?utf-8?B?K2QydTZTWEdRb3V5dURVcXZYTTBSaTJ2dmRaSUYyemp2SDFFUHlUZEl6Yy9K?=
 =?utf-8?B?djNjVWhNb1c3S21iTHNueDNobEY4WlZKbzNnb3ZQMzQ1amJmSFVTOWFkbEhU?=
 =?utf-8?B?STFsVENQQnlVOXVuK0FyQld6M0c0SmtrY3ZqS3pGZTJWZ0pQMHJWZXpUbjZm?=
 =?utf-8?B?akNpZXdZVm4rYjJHMis1Q1FIVlhWNFVFYm1DOVhzbFQyS09wRHNyRGE3MnpV?=
 =?utf-8?B?bGpxdlZSUlE5Q29yREJlNk1tWURPNXhYU1dWdjJyUmk1NWJLdmwzUWlwdGhx?=
 =?utf-8?B?Y0Y5VkkzQ1pOc0orbjA0ZmJrQWJXcGxtWGRLa3NwNG14NjNWajZNMXpxMlFZ?=
 =?utf-8?B?VUtQcS9ab2M5ZVpWRk02M0R0ZXozRXNUcVFNdnFhU3dFNHZSYlZQVkNUS3NP?=
 =?utf-8?B?aWlXdk5sR0pzc3lDclFrQjlxZ3lqb20rcE14STV3UGVNOVJvUkJBYm8wTlRZ?=
 =?utf-8?B?V0V5S3YxWCsrdHVTMDY5SDNzcmlmamZOQ21wVjFkZVBieitwaHpZdHFZWHJx?=
 =?utf-8?B?dW1VeHJwT0hwUW4zZ3krS3FVaDNlTlhLdUtJcit3YU0xaXUySzU1ODFGb3BW?=
 =?utf-8?B?L0o1QS9OZTJtc2pmSUVoRStYQ0lIL3JQS0VGTUNub1liWXM1SXNlYzJHdUhL?=
 =?utf-8?B?SkdkVDBrQXhPUEwxK04yNWw4elA4dDhiL0trNDl3dG1KN3NSaEZOaXF1eWU3?=
 =?utf-8?B?SHBqK2svOXY5eWlzdzByaXdtTVkvQk96MmJxL28rYXVzRVNFWUNEK2F0a1BD?=
 =?utf-8?B?SVJwQ0xaNHRLRHVXQkEzNEo0ejBVQ1kvWDBVNTdjZTl4NkM2UHZ1d2kzQm44?=
 =?utf-8?B?aFhNSndFdWtCWG5sS3dMOE5uVnNON2FINHlFWElaWEo3dnRqTGpOckRqQkg4?=
 =?utf-8?B?bzl6QVBCRmhuTWFKeThqTVFGcitheDVhVUtreXNyWWpYTkJXNDlrTGpnTzhW?=
 =?utf-8?B?SWkydFNyRWlCZ3haVkJ1aG9WQnlXaFp1cjZsYjhSSndSQWNJZXNjbXVyWGx3?=
 =?utf-8?B?bkJGRnAzZjlPSmRNQzVGZGlzLzJuUWx2SDJ1QjZURXRJdjlTQ08rQkg5MHJQ?=
 =?utf-8?B?cUJWdVFGZytSTkxGbnpraFp6Nk9Hankza3Y2MFp3MXFlcFB5YVB1QUF3dVlT?=
 =?utf-8?B?VWhrRWNlNDNlbitDV3Yza1hLck0vOWk0akprcnNpSlJLMmFSQTJGR0YxajFW?=
 =?utf-8?B?WHFNNldOZ0dwNEtwZk40T01ZVUFZQU1jWExaK2ZrRVpqaXVCRjkzeFpUZGhJ?=
 =?utf-8?Q?aCPCD5t33MsFlP9tEOX/K/JVoNysZZD6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZKYTFzSm5JbEdPd0JrVzBYdzlCWmFzVEFZNXFzZSsxYkZhbWl1bERVQ3hj?=
 =?utf-8?B?RHduMGdJZlE3dzNpdWpGeVZwY2huQm1VeXpNZFVMSTVmcEMzcU1tckZjblBQ?=
 =?utf-8?B?b1BuL2s4TzUzY0RDdnNYeTgwdmpLdjdOZnRpWHV5VHFSODJtaE12QmFXQ1Y0?=
 =?utf-8?B?Zis4ODNHSzBTRUxzNGRqSURtbXp1aDI5RFgvdDNHbjVTVFNlYzFNV1ZWWEk2?=
 =?utf-8?B?ampZRkpKNHBWRTIvaW9MenNDK3BmY1JhL3pwMHRIL1ZxR0RUbkg5NGQ2NjdD?=
 =?utf-8?B?YXhvdGJYRmhjMkIzbHFVaUVOeEIyOEhOd3V4RXR2RDFKQ1F6eVBwRm1YTzdk?=
 =?utf-8?B?dzlYY3lvMlIvQ2o5ZVdqazhIemdYekJLWUpHbVR3RWRhOHZDRUV4eUlyNzJn?=
 =?utf-8?B?eHlDNlB5MUh1RzFvLzBRZGhyNkIvZHFzTVJ0V3BIVGRaM25KR3JtRlNvbGI2?=
 =?utf-8?B?bGd4eHp1YWJFTXQ4THVJT3BPSENrRENvcjNTUW5qYmttZUIyV2tZTFRMeHZX?=
 =?utf-8?B?dm5OUTJ1cGxwRnZtVmo4eXdHTDRBNnVMMytMbk1LZERZcGRRRjB3dmd5QXBM?=
 =?utf-8?B?WDM3YnlPcWNNbFZ6T3U3RlMwYTFpeWhIbFBuTjBxSDRrbWdNZWRKOU1LSTBJ?=
 =?utf-8?B?ck9XWVJNZmh4cnVSb2diRG1XVWFCTjVaUGE2MURXQW04OElPamg4QWlMaTht?=
 =?utf-8?B?TnBxNDNpN3NKUEZRT3FYTTFjcjFEWGtKcjc0elcwV0lrR2xJOGtHRE5tK3pM?=
 =?utf-8?B?azMwbkRKS1VVSyt0WkxqMmFMckIvckppdGNGOHlwaGUvWE9LSEZNOEMzMGMy?=
 =?utf-8?B?cGpKWmZLVUs1Ly83ZnVTazhiR1VBeStyNFlRdmIrbVgxR0JUUkV0L21DY2tx?=
 =?utf-8?B?clJKVTRmVkNwZk5TVWZUNUxRS1FqbFVlMzBvejV3Z0RaeWx6dlF3RVFvWlhU?=
 =?utf-8?B?VzhwR3puMTFEdFkwRzZCdHhwTlJGTWZwMi9DWmgwNE1tdENBMFhGcXYxNkx1?=
 =?utf-8?B?dVB2aHR4SG9LUUM1L1k2Y3EycjFEWmxMemFIamtFQWtGYUVtL3Z1T1BwRFVx?=
 =?utf-8?B?WkUvVGNjT2Rra1ZtRStSejlZTmFENjFONDFVT2lHZmFWNUozOG9UOFpRL3lW?=
 =?utf-8?B?OEoyQThPN0l3SVBteGZWYWQ3R1FpOURPT0J5Rks3SVVZVDdIT1Y5V2lJRGdJ?=
 =?utf-8?B?OXo4dWwxN0VkQXRHK0MxcTN2RnpEWmlSVHVwNUltMlFDUnlsM1RjOHY2UnU4?=
 =?utf-8?B?ME8weVRISmVRL1BkVzNabCtrdzNvRk4vanNtbUh4eVhKWUpXMGM2RlVPRnh0?=
 =?utf-8?B?MFl2UUV2ZTFmTmNIdk00NEZrM2xNckNNYWxTbEVlTDdxQWpIcHNiVGpyOGU0?=
 =?utf-8?B?YUo3Vkw3WlY0ZTRXdkxyZ0wzZzBDS1IwYUZ4YVE5VDBFeHptSW5meEVYb3cr?=
 =?utf-8?B?M1pGMHIvWm1HTnJ3SnFEZUEwVlNiRTRaRy9nOHZBUnY0a1pDMk1jaEZwNk1G?=
 =?utf-8?B?N0xWWlpUaFdmd3V3QmRvVVBIRlhSVy9vc1dhTHlrcGFQRXQyOUtZdzdmc2Zh?=
 =?utf-8?B?dGNvNkJJNXNTOU82OFFhTHB5eTlMdXJXckdNL04wZ0R4Mmx0UEs0czBLZHRn?=
 =?utf-8?B?c3N4ZE9KM3p6NXZBVi9pMjlJYjl3cjhCYlcvdCtRRldKejd3Vy96WjBQbHlL?=
 =?utf-8?B?NGh3MUlCRDhKVGk0SHM1b0ZicEpMbGh0MUVscUk0REE2YzN1TTRHaTBLcnd0?=
 =?utf-8?B?VStCTkFQVDl6UXlRNHZhU2dsVE9UeU12RXlJRUNpNlViNzZLd2NMcndkLzNh?=
 =?utf-8?B?dmcrcnhISlRHWHRjMUFhTWhUZWNHTVpVeTQwYUZFY2lnMEtEeGpybXBWVTRa?=
 =?utf-8?B?Y0gvVnVTUUxOL1VZTlpFVUc4a1RNZ0tFR0tHSk1JVU5tcUFETlg2Mjc1dzI3?=
 =?utf-8?B?L1RwQ0FGZTAzbVkyTU1QOGdPeVowTWtsQitMUFVsUzZ2M1U2OG9hcjJiYUZp?=
 =?utf-8?B?cGdWQVNUYTZyd0RNSk5iVzVER25wSFMydloybDNocnhsVjZZQzNIVi9CNlZX?=
 =?utf-8?B?UjhMOGNCRlJjMjJHdXQwcUplMk93OC8rK1duYXlqcUpER21ncTh5YkY1MVl5?=
 =?utf-8?B?dElicUJvK1NuZXlCZXNPcjMzUzBSTkVmbUtpREZOZUFzVWdyZlNoQWhGOWth?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6312f0f5-a3ed-4b5f-b03e-08de2790cbba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:26:38.2009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBmrEdOvD6UsRX75sSVuTyZQJDsSuHzF+iGAWhcgLsg0L2yTgwJjY4ajfOQqjlK1LrnjBCTmJPDpHGjRq8eMbm1k3wAoe46WDZcfh0nB/5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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

On Tue, Nov 18, 2025 at 01:35:53PM +0100, Michał Grzelak wrote:
>Hi,
>
>just hit memory leak on xe module load & unload:
>
>unreferenced object 0xffff88811b047d10 (size 16):
>  comm "modprobe", pid 1058, jiffies 4297578480
>  hex dump (first 16 bytes):
>    00 6b 4b 2d 81 88 ff ff 80 7e 4b 2d 81 88 ff ff  .kK-.....~K-....
>  backtrace (crc 4f169eaf):
>    kmemleak_alloc+0x4a/0x90
>    __kmalloc_cache_noprof+0x488/0x800
>    drm_buddy_init+0xc2/0x330 [drm_buddy]
>    __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>    xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>    xe_device_probe+0x326/0x9e0 [xe]
>    xe_pci_probe+0x39a/0x610 [xe]
>    local_pci_probe+0x47/0xb0
>    pci_device_probe+0xf3/0x260
>    really_probe+0xf1/0x3c0
>    __driver_probe_device+0x8c/0x180
>    driver_probe_device+0x24/0xd0
>    __driver_attach+0x10f/0x220
>    bus_for_each_dev+0x7f/0xe0
>    driver_attach+0x1e/0x30
>    bus_add_driver+0x151/0x290
>
>Issue was reproduced on PTL & BMG, booted with latest kernel from
>drm-tip. Looks like fault was introduced in commit d4cd665c9
>("drm/buddy: Separate clear and dirty free block trees"), since reverting it
>makes the leak disappear. Also attached RFC patch, which at first
>glance could fix the issue.
>
>Added xe maintainers and the author to Cc.

the backtrace above and the commit message below could be merged
together

>
>BR,
>Michał

>From 914aa53c18a88834310b8560323b63bae98fb29d Mon Sep 17 00:00:00 2001
>From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
>Date: Tue, 18 Nov 2025 11:34:11 +0100
>Subject: [PATCH] drm/buddy: release free_trees array on buddy mm teardown
>MIME-Version: 1.0
>Content-Type: text/plain; charset=UTF-8
>Content-Transfer-Encoding: 8bit
>Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
>
>During initialization of DRM buddy memory manager at drm_buddy_init,
>mm->free_trees array is allocated for both clear and dirty RB trees.
>During cleanup happening at drm_buddy_fini it is never freed, leading to
>memory leaks observed on xe module load & unload cycles.
>
>Deallocate array for free trees when cleaning up buddy memory manager.
>
>Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
>Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>---
> drivers/gpu/drm/drm_buddy.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>index 2f279b46bd2c..8308116058cc 100644
>--- a/drivers/gpu/drm/drm_buddy.c
>+++ b/drivers/gpu/drm/drm_buddy.c
>@@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
> 
> 	for_each_free_tree(i)
> 		kfree(mm->free_trees[i]);
>+	kfree(mm->free_trees);

looks correct to me and also matches the out_free_tree label in
drm_buddy_init()

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi

> 	kfree(mm->roots);
> }
> EXPORT_SYMBOL(drm_buddy_fini);
>-- 
>2.45.2
>

