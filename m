Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B5B52BC8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FD510EA4F;
	Thu, 11 Sep 2025 08:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F9420ZIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369E10EA49;
 Thu, 11 Sep 2025 08:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idAH5r2ncur/imyvFg8WIUldB7Q7GZ3UGr5VH8ENlAXkdTtAlfb3LDuHDoNXOcduEukcfflkxMNLAQpfWJJ5wg4zdbKq0akJQvEY5PZv4uw8gp5BOczXXmn2UKZJ0sxt7GGB+6eS7ffXjw6c1VtSfnq/GBHbtZ5Upnzp4jaGhc/m2cqrc2bGzj1x/dHfznRdKkgf3b1X8m98aOi9/LiciFDmn0lUniJytdg7K012QuAAFkFvTTARBFArkYFg83zwsOFC4yUXqzwXfko8Ra29LGGnlUDN5j6WHyG5fZ6KFE/JeDnr8b+acKWPw71PkYVWlCtIXAk+dza/IGV9FJZkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fojcH+uKEoLHDUIULC1YA2lmB5KvWcNxG2TQTVkkUDY=;
 b=q75JWxTZQnABDxGu6yFZq/SzRw0/Ccv8tD7FJ5qq9gUhwK1m2PdadqRChJGLiK1Y1uKzR+xg+lW7b/PtaPKraw6RPJ+sNRYX7kFJ94sRxEEJEVdJ6R1zN3GO8iUspoXR4ro6V7f8XjQszXmp8tXCBmdy2J+WgaN5OORMSiAXovgLil5+Hhqtf0TSQAINMcRVkyCQAcMX13lt+CuuC/1hY9ZsxnQryNVaUkl3+QsL0ABvHUOv1wQA41BAbpv/g6W6jyMuFuutVbZJsFwBrRvfEiHDc7ya6rc3Cjdy96vwL4UuRiGYpdOWEC94Sp8QLC2oRtjZW/6+S0m2JML9lMwgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fojcH+uKEoLHDUIULC1YA2lmB5KvWcNxG2TQTVkkUDY=;
 b=F9420ZIqSEP5dB2Krr8ACO7j6VdXJ8MLRjMY3rO7CC0dueYqPYoEIqyT6qr47LeW1gdf1miVxxB2p67C1wONti/4t2qIAU51LertGJLfnJ9qp1+zJ9cxhjG9AkETP+rXHtP/G98UfJovhlyBcckVaEykkd3DbYJEpQpGsn9TQBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:35:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:35:24 +0000
Message-ID: <bfb8fa6f-1217-411f-88c0-24788a0c15c9@amd.com>
Date: Thu, 11 Sep 2025 10:35:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] PCI: Resizable BAR improvements
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 89634bd1-2af4-4301-54bc-08ddf10e2721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZJangrbGJhQmRGdjZJdVU3eklua25vajVCdFNLNlNYWmZLbEppa1gxVnlV?=
 =?utf-8?B?UElkR1pmQ2NaYVV1dHozZy9CQy9RbXFlVlFVbTJNdGU5YnVqT1hPTjZMTURm?=
 =?utf-8?B?bnd4SFdYR21CUk1sa3YvaE5GNHFyMHpxWll1dkV4WXkrdmdKYjhibWVjeFNZ?=
 =?utf-8?B?SFZtb0liaEJyRWZuM2hLWWJxclJIK2U2K1VTak90OWpQaDNVVjhDRm81c1FY?=
 =?utf-8?B?R2IyalJEWTZvYnhEU0xNekNzYmNQY0hRTWgxV3FXMEhVQW9OVkR4R2ZZcWdh?=
 =?utf-8?B?bzJYa1FTWDR3MU0yRkNHb3F4QWdMOXZ1YXh3WGpIMmlvV2pBc0VndWx5SkRr?=
 =?utf-8?B?Wmo5aWZYbk9TMEw2elpsTS9MNGxRY0JmQW1KZCs1c2p0UUdZWWVMUWxEM3NH?=
 =?utf-8?B?REVVRmd5d1poSHpqTFEvcWJpODJieHlxRzAvNlYyOWVkaHc0UDZpdDAxeTFE?=
 =?utf-8?B?U2JyaWVRb3FhTmRIR3RvR3hjMVBxUlg1L1dvSExkTEw0NFNuR29sS1VtdzlC?=
 =?utf-8?B?ZlRObWlvaUVLQi95R0VhMU9nc3F4Smx3ZzFVeitzWnV5UEZuTytCeFNSbDJE?=
 =?utf-8?B?bW9uWlB3anNuSmVEUWhNR0VTeE1rNWtOc1dWMVk1dkpQdUR6YWVUdUdWcU1T?=
 =?utf-8?B?dzZBZ2ZiTjB3Z1VKZEtqb0IyOE13Qmdqc0dENUlPbDYxeGFmc2ZNVlRFQi9m?=
 =?utf-8?B?S1BLR0xhY2dyRk9ENDdOa3RVYWlrZXdESVJLM1hXWCs5ZTFZVGtZUGFoOFJG?=
 =?utf-8?B?bHFVMmpYQmk3aDNlVXE2RTFMa0NjN1lIR25WaThLS1hkb2ovb3hka25Peklr?=
 =?utf-8?B?Ui9NYWVzZmJQWWhXQ3ZhU1kyQy9ndjJsZ0xKNXhuNjFKVGV4czEzeXlKWjVp?=
 =?utf-8?B?bHEyWjZJR3RRbWFBU3hqK3ZkemN6Z3c1NjVuR2xrNmdFZjhHTnpMVmdld1JM?=
 =?utf-8?B?b1c4dVFpc3R5SU82MVF0M1BoSWF0SDlOcTBScmQ1N05TTWZNRzdQQ2szS09j?=
 =?utf-8?B?c0hKeWFyYTRQZmdVcU42NFNFV0E2QXZUb3BjaTVydVh0R0RkM1ovTXdraDBM?=
 =?utf-8?B?bjhZL05vaWYxWnJWempHcVNwck9LcEhQTnFMSUxqUWxCOTNURmcwYWRyVnh6?=
 =?utf-8?B?MFRISFdjNjR3aDA3L2M0cXFaMExGZTR5MDc3VDVoTU41c3l1TWNtQjdjdEFV?=
 =?utf-8?B?NGdJWGl4NmQwV0twdE15TWNaKzNrZmpOM09pMEEycW9RU2FpK0o4cklYa3Mx?=
 =?utf-8?B?bnBsVUVrUWdLNityY21EeElOZFRFbmgyTHJiY0U1MHJQQ0xIYk5xQkx5anJu?=
 =?utf-8?B?SFVpTEYzMHhEcjBSZmtOV3E4NjNrbGNlVnNJNThpeE5aWVNEZitSdEhSbks3?=
 =?utf-8?B?TGpJYnpJaWp3Ry81UHlTQ2xXaFJKZzhKMGtjU2NTQWUrNmp1ZkROZGFDSzdW?=
 =?utf-8?B?ajdFUGp3T0Z3ajc0YkdSNlYvd1dXNGlSTUM2TGtKL0dGeTE0eWpyVVl6Z3U1?=
 =?utf-8?B?TEExR0daOEtIdUJiL0V4Zm1lWW1VUCtObitaZy84b2Vna0xPWHVqOGVJZmcx?=
 =?utf-8?B?d09xejhaUGFsNkRrYkk0UTh4RzJZczlvK29vdGJmMXRVS3hUZzRFYnR1a04x?=
 =?utf-8?B?NGhQUTJ4a0JDUjBJbFZBOU5LN05HbDAvUjhzQ3cvckJNMnJJdU83VjJWNzBU?=
 =?utf-8?B?eWxrWG1rMis3NEtlUHRqSFBNRzh6dTNPTFo0eGJIRUdJVjlXYjArd2lPMnZK?=
 =?utf-8?B?dWg5c0ZsREpBdHNKWDBKWm5uclBaTFBlN0pONjBsRE1lNDRaTDhZSVFzeEM1?=
 =?utf-8?B?VUJEY2RJOWoyRnB4SGxQeFQ4UzdsOGFYbW1BZFdLcVRHT1lXd1lDYVArSG1m?=
 =?utf-8?B?bFdLa2RvcGxJUnZjaEhoTFFZc3cvUDBjdHMycHptcmRZRFd2N2UvdEhlaEN5?=
 =?utf-8?B?OForaExKV1JmRklFRWhjQ2VmdWhISVQveTU2M241QVJGVkZmZ1BsaTIwTzFm?=
 =?utf-8?B?akZqRzJSQ1ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW9CbEdPOEdDWFFaYUFLcUNabThuZEwrS1NGOHNsOXlZWk8zbTFSbWFRcml2?=
 =?utf-8?B?eDJVVUtpQ0dpOGQzT2FhbnhhVWVqd2M0amloQ1B2aHQ1L0s5QTFVczEwUzBS?=
 =?utf-8?B?UzdDc1pDTGNFaWRibWhaVDJCaFg0QTNtRjY5dDRYdEtZYzlwc1JzeHBtYmxl?=
 =?utf-8?B?NTlVZy9hWTNPbFZyVXRRRDQ2Z1VITFdjOC9YcjkxdHVBOHNSQ3dxcnRNMENI?=
 =?utf-8?B?cytPVlJLRnRQOTBmVUVFUG9lc0lsd0l0bXlsZ2RxeTZ4bjdXdzhYMUNwUlFr?=
 =?utf-8?B?ME9pbjBWUjRVd3BNNmM4RHBadmhUa0JnbzNBUXphNXEwNFZvZWZibGNkMU1L?=
 =?utf-8?B?amloWWhZZ2Y5ZFloMTBkVERqc2hEMU5IbGpxUGFBaWtkOWhVb3FaTkpqQlR1?=
 =?utf-8?B?MHRHamdjNXp4aFNka0lMSlNRTnZ0NmxlcGhPRmRFbkdzek9IS0p5K3N2UjdN?=
 =?utf-8?B?bkZNbkNmYVQrYmsyT28ya0xBUmdaR20weHJ5dEV2RUxtSWlEczRyeFZtSU1N?=
 =?utf-8?B?djVnQUp2bHgzRnNRWXAxNExzeFBnSDgvUXpoYWFaQmlOeTQyRXE4Y05Xa2N0?=
 =?utf-8?B?a1JVbENjQU1QVkNveUl6SjhQcEJPekZuSlJUTWl5SVBCZXlKOGI2eHdFeFEy?=
 =?utf-8?B?Y2ZyZnBlaXM4SmcrM3NCQWYrUlNCaU1xeUs4UHpkYU9PYlJFeFdlT0N2M0lR?=
 =?utf-8?B?UUhvbjFPK0MxZEwzRkxzbkJlamZZazcvZk9rdmFCT1p2ZU5wQUxZemw5V3Jl?=
 =?utf-8?B?L01td1ZhdlFFOWROdTd0eTA3bC9sN055NVhzQTkvcjBGb2tuTFNrRGc1RHBU?=
 =?utf-8?B?UXVlQURPQ3p4dzlkckpFMmNwT1paaXlyVUQzb3RkSlNJeDlHanVoZGNLUVoz?=
 =?utf-8?B?VjNCYnBFK2NNOXlmclRZa1ZDZVJERGY5L1N4M2pwMXM1cEpUSVdudEl5L3JG?=
 =?utf-8?B?SnN4cm5nMXhSQy9Wckh4aDFrU2V5ejJkY2hqUEF6ZjNtTTcvdkJ2Ri9xekRH?=
 =?utf-8?B?YUdMc3lhMWZiZnJ2Y3RlL3gybXB6TzZUQzF0bHlxM3VCeVV2QkxzYkt0RWJ4?=
 =?utf-8?B?NEVTNnVuYzVzSEloTC82b2hBQ2U0cUhuVkpHbVlFSlpIdUxOckZiNG1GT2xp?=
 =?utf-8?B?RVBwNVZxbXJyNG9PMi9vY2g5WUFsRC9QRW5ESXZ3b3NOQkh3Ync4TElaOGho?=
 =?utf-8?B?L1lERHpiK1VSdGwvZzNuaDRQZTZmVVgvRnBvMm14dTlVeFhMd1BCRjJ4QStY?=
 =?utf-8?B?ajFjVzZBZ1REbERybTVwNllhaVhrT1pXUlVFV016a2xtcVJUR0w5aGYwbHV1?=
 =?utf-8?B?RFF1UDFtcHYrb3JPbVByd3FDVWZITFpaYW1qeGI2anMxVmVTcnlwMG5na2ov?=
 =?utf-8?B?bFU0ZXR4bTRxT0pPSzRsVTMySWJKZGZnaTVpeWVoVUllMy9FTVltdFdzU081?=
 =?utf-8?B?ejByMElOWTg3YzRWTnQxMDVxZ1MzaXZpOTdYZUEyOS9HMGRGVEIwOXpDa3Yv?=
 =?utf-8?B?ZFNrdSszRW5xL0tEblRHY3dZdjdUa3hTL2RzQVdsQUZ6MFYyWHM5Tzg3OStP?=
 =?utf-8?B?UWV4SlFsR0FxK0hOajhEU1Zvc3RsYitqR2NJZ1puRzVZOCtXWlpla3kvTDQ0?=
 =?utf-8?B?RHJhL1k3a3pySG9uVmJZVU5SNUxIZFdKMHAyU3FNY3RVVkEzUW1kWFA1K0dw?=
 =?utf-8?B?LzJEck5wSE5mdWcxRzNZQXhERlVWeXBsVkRLSEpNaStRNjl4ZkhtNS9GeDBZ?=
 =?utf-8?B?QWZTd2hRYVp6cFoxUHlLRnZObmRMdGp3N29XUGd0dGU4MDNUUnhDNURwVkNT?=
 =?utf-8?B?MzJkakJlWURWNkZvczdQOFRwb3NrbTdxYkUvTmhZVStBNjYvL0c5azJUaFFQ?=
 =?utf-8?B?MkRMUG9ob0FUcjh3WjBYeFR6VitsSThZbWpNRGdTaHBZM0RrdFJPL2hVVmNK?=
 =?utf-8?B?Q0JoNkhkSE1nZWd4K1dCOTFOdXNDYlovdXdRVGtsQmhpRThPUEJLQkNrZnZt?=
 =?utf-8?B?K0Y3NGIxdDBCd2o1WU9Ka3l0Si9GZHdpL1B0bHd2UllXSktCbUprVVBVR1lC?=
 =?utf-8?B?eXhrU0JPOXBSY3JHWjhJS0hzekUzWnErU042YkFBajZadWRFSEhpb3E2N1Nj?=
 =?utf-8?Q?f9/zrMmRQCb9hW2g87kWAtIad?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89634bd1-2af4-4301-54bc-08ddf10e2721
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:35:24.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcxpDCnZgLWRdEIsq35PiuvAyWtFSfhqokfCvzz8MyDDlqVk5Jaxb+juKZpxbQ0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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

On 11.09.25 09:55, Ilpo Järvinen wrote:
> pci.c has been used as catch everything that doesn't fits elsewhere
> within PCI core and thus resizable BAR code has been placed there as
> well. Move Resizable BAR related code to a newly introduced rebar.c to
> reduce size of pci.c. After move, there are no pci_rebar_*() calls from
> pci.c indicating this is indeed well-defined subset of PCI core.
> 
> Endpoint drivers perform Resizable BAR related operations which could
> well be performed by PCI core to simplify driver-side code. This
> series adds a few new API functions to that effect and converts the
> drivers to use the new APIs (in separate patches).
> 
> While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
> specifies more sizes than what will fit u32 to make the API typing more
> future-proof. The extra sizes beyond 128TB are not added at this point.
> 
> These are based on pci/main, there are two minor conflicts with the
> work in pci/resource but I'm hesitant to base this on top of it as this
> is otherwise entirely independent. If we end up having to pull the
> bridge window select changes, there should be no reason why this does
> have to become collateral damage (so my suggestion, if this is good to
> go in this cycle, to take this into a separate branch than pci/resource
> and deal with those small conflicts while merging into pci/next).
> 
> I've tested sysfs resize, i915, and xe BAR resizing functionality. In
> the case of xe, I did small hack patch as its resize is anyway broken
> as is because BAR0 pins the bridge window so resizing BAR2 fails. My
> hack caused other problems further down the road (likely because BAR0
> is in use by the driver so releasing it messed assumptions xe driver
> has) but the BAR resize itself was working which was all I was
> interested to know. I'm not planning to pursue fixing the pinning
> problem within xe driver because the core changes to consider maximum
> size of the resizable BARs should take care of the main problem by
> different means.
> 
> Some parts of this are to be used by the resizable BAR changes into the
> resource fitting/assingment logic but these seem to stand on their own
> so sending these out now to reduce the size of the other patch series.

Yeah, sounds like a good idea to me.

Before I answer each mail individually:

Patches #1-#3, #8, #10 and #11 are Reviewed-by: Christian König <christian.koenig@amd.com>.

Patches #6, #7 and #9 are Acked-by: Christian König <christian.koenig@amd.com>.

Nit pick comments on patches #4 and #5, feel free to add my rb to them as well when those are fixed.

Regards,
Christian.

> 
> 
> Ilpo Järvinen (11):
>   PCI: Move Resizable BAR code into rebar.c
>   PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
>   PCI: Move pci_rebar_size_to_bytes() and export it
>   PCI: Improve Resizable BAR functions kernel doc
>   PCI: Add pci_rebar_size_supported() helper
>   drm/i915/gt: Use pci_rebar_size_supported()
>   drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
>   PCI: Add pci_rebar_get_max_size()
>   drm/xe/vram: Use pci_rebar_get_max_size()
>   drm/amdgpu: Use pci_rebar_get_max_size()
>   PCI: Convert BAR sizes bitmasks to u64
> 
>  Documentation/driver-api/pci/pci.rst        |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
>  drivers/gpu/drm/xe/xe_vram.c                |  32 +-
>  drivers/pci/Makefile                        |   2 +-
>  drivers/pci/iov.c                           |   9 +-
>  drivers/pci/pci-sysfs.c                     |   2 +-
>  drivers/pci/pci.c                           | 145 ---------
>  drivers/pci/pci.h                           |   5 +-
>  drivers/pci/rebar.c                         | 318 ++++++++++++++++++++
>  drivers/pci/setup-res.c                     |  78 -----
>  include/linux/pci.h                         |  15 +-
>  12 files changed, 354 insertions(+), 273 deletions(-)
>  create mode 100644 drivers/pci/rebar.c
> 
> 
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585

