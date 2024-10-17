Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E099A1822
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E58D10E088;
	Thu, 17 Oct 2024 01:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qCOcFZ7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2C110E088;
 Thu, 17 Oct 2024 01:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFQKSZOApiRY/df2NV1o71nZJRq3qIPQi3l2w/W3W8h7z03/kvdno1TFIAm9bCS4HJQMZmRsLlTveGPdQyzdTaBkhO+E6S/qs75ftx4CwSpWVfrAmOrhp4yNcSAUBWVQj/sm7SialQCQshKhgUOf+Nii3jdof49FyRz6d4ZFfJYisgffR2rhw0bIMDw26oBZGt9ollylekaRPQ4n5Td/RY+P8v45ZfCQ3RwNC9pSCYLP1kJVoAAw/NDkaUZmCC0dq2WU20ErW5uW8nJdm4ONWh60oWrXMY/QRGeYLcfFguLo9ru0HKqLJ98qfwVFHfCEi39koOyShMMvqEkPiJchtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TP25E8jKKZbYvidOe9cBOygtZMBfYuFL2vZ/rN2Va4=;
 b=LNHNnVNuaL0gtmdX9DZVwt+Lrza2tb6t7hXfEnjsR9rtz/Nv9UfpNFcLnOkVsXkUClDlURlcMYUuJ5PJuCvsHGY2LAPIFfZM9yqenxR23DdGZ4azEwHQV6C4YdqlEOz/jzKmdMpaiblP336un2p+A4EncOo4ahRvWXiresrnjUpgtpABv/TAG+/zBqp0gi2WH3FFq+eneo5KR0oqTWxQYvS8j5U5AqUNe7HqEOPJCUVYkluq1dNuE8QTpK4k5qGhgV8yoSzlzymsAjFtaTsIGAnubVAf5pzm1XYM3sVQ8mn4P+uARlZQvdFn+qcGqHkyWsRa9XpCwTGsAy0fijadQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TP25E8jKKZbYvidOe9cBOygtZMBfYuFL2vZ/rN2Va4=;
 b=qCOcFZ7Je+AO3IUpbTbcM5/YRJcgwUC0fUWXKwKc3tROq2f92zAxN6wyShvTIv2JUqx85evMid8Bxc8RRArMVr/a1VimqTIFa10r0lJeD3Z1GLNtZ3gpC2nXGFRn150Dgt5AqI3IpJPVA7CcaS0ysKQOtLHC0UR0mNn2+J+8hOtpW16iJWOdg84nWOd/hm1yJWKWpWKqCxtc1tHC8VtDvXN9XjMvd4dLkGpx5X7vJ4PV5r9kMKOvvsxWBLbiFMEBohJKl0oAFfWNuD2infAPZMlImtfGOC9L0/xddeF01PASqmm6qw6MxP0zHo2wMTqCj4XQlg5ToPJyOMR9WK/15Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 01:53:22 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 01:53:22 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <87sesw8ziu.fsf@nvdebian.thelocal>
 <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Date: Thu, 17 Oct 2024 12:51:08 +1100
In-reply-to: <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
Message-ID: <87cyjzo5pt.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY8PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::32) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: f23db1cb-3d90-43c3-5e7c-08dcee4e7b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDIreDNDRVBTZ0g2ckorZnhsZWNuZmJKbnN0SjFNSU54RVgwbExuay9nbm9Q?=
 =?utf-8?B?ZDMzR3lLaDV4TnZhT3RtZmRMYXdFUEJMWGlsMUZzVmxyNTZoM1F1Vjd0dFhY?=
 =?utf-8?B?L1ZUclhmallLcXRZeHVkVGdsZXorRks2Z2t5UVBjWFpmZzZHTGZ0RGdJNTJO?=
 =?utf-8?B?L3RIamNhcGtPaXdVdzZwV0ZuT29sL3dSMk96QjB1ZmJhQnJUUUNlbHA0OG83?=
 =?utf-8?B?SGoxUDM5dTJRM0gxckRRT0szRTd4Z0ovTkF0OVpFNVVIQ0s5N2JpQXdHUnUx?=
 =?utf-8?B?ekNHMDJhSGlnTzNXWWMvTS93OHI0UFZvWjMxdUU5M0hJaGtZb1hDN01jaWJo?=
 =?utf-8?B?YTRKbWtiZXlZK3V2REhwOHRzYzVlWUtNeGRkWlJEVmhhSjlvZ0dxUUFpN0NJ?=
 =?utf-8?B?RndodENWWG1BVTYrVXNmTDZ3OHFrSnZWNk13OWtoQW55RjBYcmN2akoreWpL?=
 =?utf-8?B?Q3ZrL1ZOSm5aaHhxVVl6UjVMMGdUNUFzbDFVZnEvZ3BySThod3hxb2F3U0tN?=
 =?utf-8?B?QklnUG9KMWh1eGppUlBRa1piRkVMSjVjZzNWWko0UERvYVZ1NUZRa2lvRW5I?=
 =?utf-8?B?ZWNsV1poSlNIVFBFaTFKWE1Xazl4Y0NaOFZyU1laK3Bqa2VHRW9TeGxUdmtQ?=
 =?utf-8?B?RE5LV242M2NhdEVFYkRydkRpQmNXUHQrWm1DRzRpcm5tT3BtazZwUSthcW9x?=
 =?utf-8?B?c25hRWs2ekttanNWR3VFVDR2aTdEbmxFTTM5YzRhTzhUdkZFamxhblVMeWtC?=
 =?utf-8?B?YUpyZ3ZSOHdBYUFpSll3K3hWelhHaUtaTVBzTVcwYjdZdllYTjNzTUtNc2g5?=
 =?utf-8?B?UUpIU0Q3a2djbnlGZFk1SFpGOGtVQVVscEIrclk2Y1gySmxteWYyY0g1VmxH?=
 =?utf-8?B?cHNnUVZ0MFhoSjNQUVBmbnBUcGNaNGJBbEFUOXZGcHF6cmJwS3NNalNrZS9z?=
 =?utf-8?B?VnVGZkxtcWlZYmJnbDA3bzZQN3NrK3FVS1FtbzRCQ011K0hsRFhvbUpKYXNF?=
 =?utf-8?B?bStCOEU3VE9CRFpCL1FoaENEcVVuWkx1UmdjNHRkSVhlNi91cUFpdFE2OXdC?=
 =?utf-8?B?N0liMHd6WE92UDR2ZnZaSC9sdXUySFZBdVZ6Qm5mazNzQWtiU0M3ZmhIZGsx?=
 =?utf-8?B?NnRWdTVJYWgyV1VVamI5cTJKVUs4QmNDeURDWWNoK0FxQTBPTk1tYWNmaFkr?=
 =?utf-8?B?ajlOazJ4TENUUWdsU3pTR01LemJWemFmMFNZMG1Bc3NsazRHUndacWxVcWI3?=
 =?utf-8?B?U3VQQ1MvQjErc0cya1hsNTNMRTBoR1o1U3ozOWZBdUQ0ckQrMjF1UEhoRFZF?=
 =?utf-8?B?WkZQWU5sMGxOajdRblRsMVM4M3NWaTcwdmVCWlh1TFQ4WG5rMXNjTEpCQVhI?=
 =?utf-8?B?MkhjNytBWG1kMnloaXE5cllFWVRmVUJtMFd0cER6WG85VUNnOWQrZ0J6Zmht?=
 =?utf-8?B?aTdicTdVQjM4MGtFSWp2KytrOXQyc3hZVXFjcjdBS3hyWFZQd2c0WHpucmZY?=
 =?utf-8?B?UHA2dUFXV1dIWGVlRGk2b0R0MU9ZbUgrZEw1WHZrT2MrQlhhYi9jRHBTRXJm?=
 =?utf-8?B?QjNBcWEyYmVieVhqN3Fnei8raUdLalV5UXQxREFnTVNPY2ZwSlh2dTREam1R?=
 =?utf-8?B?OUg4MFJhenNUWC8wRkdjRUFLUzFXR1BIR0pKMU15dGsvaG1ZL0J4Vmxyc1c0?=
 =?utf-8?B?NDBmODJReWhGc25ubW9XNWN3S3huZkVkUGdaN0ZGMHRBTVAzUlZtUGpQeUFl?=
 =?utf-8?Q?3wnJxK0GjJE7/dqcNSGM1ISWXdS00N853lxCgTs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtLTHptS2dHZDhTR0h1M0Y2aVFLSWUzdjFNUlRZaDVlbEJud0xvUXZvVkYv?=
 =?utf-8?B?eDRIUFhVN2ZDRm56dUp0cVhrR1VXbUZEZVZZdzh2WTA5QTZ3enU2bkpRcFhx?=
 =?utf-8?B?ajIyVXpCcFNJODd4Ulplenl5VHlDRnJHcnl0akJCWnpYTUFQS1g1Z2hYZ3My?=
 =?utf-8?B?YjZUbUNtYnMrQzFPejhmYW03ZzhLVlJsWTQzMittTG42NDU1bkpaTUpRejlr?=
 =?utf-8?B?QXVQdlBKMG1CYzFodEdqMDdiUVRNcE1qSXRLTERtMkl1UE41N0t3Z0ptaHJE?=
 =?utf-8?B?ajl3Z21QMTFsOWt0WlNsYThQZjRCSXhSVXhGcDdXRHdEaVpYSXNaTTMwZk1v?=
 =?utf-8?B?VTdMdWJqTWQ4Q1BCU3J0NEhicElOd1NEZXFUS3B1aVRKZFh5amE2YXNhVGJs?=
 =?utf-8?B?ajB6YXV1TzVnK0U1M3dSbE1XRTdJSmtQQVNieDZDaXZQL2pGVmZnV29nN3U0?=
 =?utf-8?B?blVzeE9NYllhY3krVEluODFCT05EejJ4NkhwekFDdTRqZHk1VFpac1FHbk1q?=
 =?utf-8?B?UmZBVUFjWVVTVkwxQml2QnJiOFJrc1YvWmFEWnZOVWNwNFVjZTRIR1gyajRI?=
 =?utf-8?B?cWpJbzdNbWUwRDJBTjVLMnA2N05XUldzdzVmZjdWK0R4ejZBcnZ5ek5uVnRG?=
 =?utf-8?B?V3NLMG9OcnduSmFZZGNJZi9PL24xdGpJQ2lmK2VwZjJkUHp6RldUWURYNE0z?=
 =?utf-8?B?Qm92Nk9ld2tQY04yK1IzdTdITlZxSDBkOFhsSjN0TGdmSVJIclZmS0xRZzJu?=
 =?utf-8?B?dWdSbFIwcWxUa2V1SHNWbDlQdGZYaHVwQkVXQmJjMTc0NmEvTVQ4czBadXdT?=
 =?utf-8?B?aGhTbDJtMFZYV2JWY1I4ZERMSnVPL1FyWmo5UGljUHVKYWlWNE1BZU1LeXZK?=
 =?utf-8?B?WklNN1U3WFVscS9GUXdCSjJvMUQwSFVZRjZHVVM3VXJGUTQ4Z1JwY3BhUlh5?=
 =?utf-8?B?TFlSOFExaEEzRHAzUVlPeEJOWkxYVmpDYnh3UElMR1MySXVEa2ZnZEVjTzhT?=
 =?utf-8?B?U3JJREx0dmdsa05VdHZucFBqODhsa2VVNW5BSGFwcGRSSEwrbi80WEdsRUph?=
 =?utf-8?B?enFSUVNzUDVoM1hSMi9TYzdNaEtjWU10WGJiQStZTERUbnNCODhUZy9yMktY?=
 =?utf-8?B?TnloKzlyVUJ0WXhLbERPcysvWFRLQ3JuN0lNdG4wUCtCbDhMTVNoS1YvTHF4?=
 =?utf-8?B?dGxWeE1hdXhaMDVSLzNQc2tybGhDdTBWQzBMOUNMV0tTOEhrWE5TNE9jcmdr?=
 =?utf-8?B?RWlUVEF6MkhXUlcwdy9zYlEzUC9xeWtlbk5aZjZZMTVGWUZwN2QxRXNNYy9M?=
 =?utf-8?B?MmdBTWNxRXBGWkF2NmVDNVlNU3pCNHpWWGtVSXYzSTRaL0VKYUU5cHBXaXVR?=
 =?utf-8?B?bDVLL1N0YW5jTEoxMkVuS2NqMFREWFVPT3dqTGx3SkxqcnpTQkxrOEZocytY?=
 =?utf-8?B?ekN1UWloUlpKS1JpQ0Q1ZUFILy9yQVhWajZVN1dPQUY1SHplZlV1Zk5TTEFa?=
 =?utf-8?B?U1d5S21yYTBBUmNkQ0xhcjR3ck5RN1BTUzBybFlnVlZjZHNJK1N0RERPVmcy?=
 =?utf-8?B?VkpHcFZrbmtoNUgrdy9nV21BNldhYnJacjRGSkNnaUkxVXpoNk1lVTQvNDlR?=
 =?utf-8?B?enV3V1FKQ3JEVmdCT296ZWVBclBrSkh6WG1Wcm5uTEVNSlBjck9PcStDaXRX?=
 =?utf-8?B?RC9kMmFUTFpESGU2U1d6TkN4dnQ0OElldFl6QjhhTjl0SWZoME11YUpiMi8w?=
 =?utf-8?B?RjdSSGR6R1Flai9vQ2o1WERrdm94NVpzU1FTaHJYY0Z4WWkvNytXNUU0TlR5?=
 =?utf-8?B?YU5aMW5qUW1vS3JIYkpXd1dqVzZpQUh1dGJuTWpOQitRQzN4ajR3aWRXZmtN?=
 =?utf-8?B?NzV1NWloVHpuaHJka2kwTlZzWVJuOEtWbTBIY3FUZTIvVzhzWEFnTXA2VytY?=
 =?utf-8?B?dk83VkV0OEFGOVpjMkNsNTZNRTVPeHhWWFhGZVBSMWdGUmxKK2ZSazg4RHk1?=
 =?utf-8?B?V3JOU0NGRFRVd1V0VnE2Nzc0R25GNGU5dVMwYkFjTDhOUzRFd0FUcndyNFor?=
 =?utf-8?B?NkNJT2RwODJZaUZZdHhCak5mb3Azd3hENTR0TGpLSVBrcHNuaDNnZXpiRTdD?=
 =?utf-8?Q?YnipBdhVa75Re0fW1NdEnqrPc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23db1cb-3d90-43c3-5e7c-08dcee4e7b54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 01:53:22.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbDF/Ut1N+dktTJ9xzQyqzp3zEKXvQil6m/47kz4Hu/LGt3ilv5b0n1mk7gEiDSharoP93jFmKLKd9NgcKymZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
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


Matthew Brost <matthew.brost@intel.com> writes:

> On Wed, Oct 16, 2024 at 03:00:08PM +1100, Alistair Popple wrote:
>>=20
>> Matthew Brost <matthew.brost@intel.com> writes:
>>=20
>> > Avoid multiple CPU page faults to the same device page racing by tryin=
g
>> > to lock the page in do_swap_page before taking an extra reference to t=
he
>> > page. This prevents scenarios where multiple CPU page faults each take
>> > an extra reference to a device page, which could abort migration in
>> > folio_migrate_mapping. With the device page being locked in
>> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
>> > locking the fault_page argument.
>> >
>> > Prior to this change, a livelock scenario could occur in Xe's (Intel G=
PU
>> > DRM driver) SVM implementation if enough threads faulted the same devi=
ce
>> > page.
>> >
>> > Cc: Philip Yang <Philip.Yang@amd.com>
>> > Cc: Felix Kuehling <felix.kuehling@amd.com>
>> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> > Cc: Andrew Morton <akpm@linux-foundation.org>
>> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> >  mm/memory.c         | 13 ++++++---
>> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++--------------=
-
>> >  2 files changed, 56 insertions(+), 26 deletions(-)
>> >
>> > diff --git a/mm/memory.c b/mm/memory.c
>> > index 2366578015ad..b72bde782611 100644
>> > --- a/mm/memory.c
>> > +++ b/mm/memory.c
>> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>> >  			 * Get a page reference while we know the page can't be
>> >  			 * freed.
>> >  			 */
>> > -			get_page(vmf->page);
>> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> > -			put_page(vmf->page);
>> > +			if (trylock_page(vmf->page)) {
>> > +				get_page(vmf->page);
>> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> > +				put_page(vmf->page);
>> > +				unlock_page(vmf->page);
>>=20
>> I don't think my previous review of this change has really been
>> addressed. Why don't we just install the migration entry here? Seems
>> like it would be a much simpler way of solving this.
>>=20
>
> I should have mentioned this in the cover-letter, I haven't got around
> to trying that out yet. Included this existing version for correctness
> but I also think this is not strickly required to merge this series as
> our locking in migrate_to_ram only relies on the core MM locks so
> some thread would eventually win the race and make forward progress.
>
> So I guess just ignore this patch and will send an updated version
> individually with installing a migration entry in do_swap_page. If for
> some reason that doesn't work, I'll respond here explaining why.

That would be great. I have a fairly strong preference for doing that
instead of adding more special cases for the fault page in the migration
code. And if we can't do that it would be good to understand
why. Thanks.

 - Alistair

> Matt
>
>> > +			} else {
>> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > +			}
>> >  		} else if (is_hwpoison_entry(entry)) {
>> >  			ret =3D VM_FAULT_HWPOISON;
>> >  		} else if (is_pte_marker_entry(entry)) {
>> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> > index f163c2131022..2477d39f57be 100644
>> > --- a/mm/migrate_device.c
>> > +++ b/mm/migrate_device.c
>> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >  				   struct mm_walk *walk)
>> >  {
>> >  	struct migrate_vma *migrate =3D walk->private;
>> > +	struct folio *fault_folio =3D migrate->fault_page ?
>> > +		page_folio(migrate->fault_page) : NULL;
>> >  	struct vm_area_struct *vma =3D walk->vma;
>> >  	struct mm_struct *mm =3D vma->vm_mm;
>> >  	unsigned long addr =3D start, unmapped =3D 0;
>> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> > =20
>> >  			folio_get(folio);
>> >  			spin_unlock(ptl);
>> > -			if (unlikely(!folio_trylock(folio)))
>> > +			if (unlikely(fault_folio !=3D folio &&
>> > +				     !folio_trylock(folio)))
>> >  				return migrate_vma_collect_skip(start, end,
>> >  								walk);
>> >  			ret =3D split_folio(folio);
>> > -			folio_unlock(folio);
>> > +			if (fault_folio !=3D folio)
>> > +				folio_unlock(folio);
>> >  			folio_put(folio);
>> >  			if (ret)
>> >  				return migrate_vma_collect_skip(start, end,
>> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >  		 * optimisation to avoid walking the rmap later with
>> >  		 * try_to_migrate().
>> >  		 */
>> > -		if (folio_trylock(folio)) {
>> > +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
>> >  			bool anon_exclusive;
>> >  			pte_t swp_pte;
>> > =20
>> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> > =20
>> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>> >  					set_pte_at(mm, addr, ptep, pte);
>> > -					folio_unlock(folio);
>> > +					if (fault_folio !=3D folio)
>> > +						folio_unlock(folio);
>> >  					folio_put(folio);
>> >  					mpfn =3D 0;
>> >  					goto next;
>> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned=
 long *src_pfns,
>> >  					  unsigned long npages,
>> >  					  struct page *fault_page)
>> >  {
>> > +	struct folio *fault_folio =3D fault_page ?
>> > +		page_folio(fault_page) : NULL;
>> >  	unsigned long i, restore =3D 0;
>> >  	bool allow_drain =3D true;
>> >  	unsigned long unmapped =3D 0;
>> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned=
 long *src_pfns,
>> >  		remove_migration_ptes(folio, folio, 0);
>> > =20
>> >  		src_pfns[i] =3D 0;
>> > -		folio_unlock(folio);
>> > +		if (fault_folio !=3D folio)
>> > +			folio_unlock(folio);
>> >  		folio_put(folio);
>> >  		restore--;
>> >  	}
>> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>> >  		return -EINVAL;
>> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
>> >  		return -EINVAL;
>> > +	if (args->fault_page && !PageLocked(args->fault_page))
>> > +		return -EINVAL;
>> > =20
>> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>> >  	args->cpages =3D 0;
>> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migra=
te)
>> >  }
>> >  EXPORT_SYMBOL(migrate_vma_pages);
>> > =20
>> > -/*
>> > - * migrate_device_finalize() - complete page migration
>> > - * @src_pfns: src_pfns returned from migrate_device_range()
>> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory=
 to
>> > - * @npages: number of pages in the range
>> > - *
>> > - * Completes migration of the page by removing special migration entr=
ies.
>> > - * Drivers must ensure copying of page data is complete and visible t=
o the CPU
>> > - * before calling this.
>> > - */
>> > -void migrate_device_finalize(unsigned long *src_pfns,
>> > -			unsigned long *dst_pfns, unsigned long npages)
>> > +static void __migrate_device_finalize(unsigned long *src_pfns,
>> > +				      unsigned long *dst_pfns,
>> > +				      unsigned long npages,
>> > +				      struct page *fault_page)
>> >  {
>> > +	struct folio *fault_folio =3D fault_page ?
>> > +		page_folio(fault_page) : NULL;
>> >  	unsigned long i;
>> > =20
>> >  	for (i =3D 0; i < npages; i++) {
>> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pf=
ns,
>> > =20
>> >  		if (!page) {
>> >  			if (dst) {
>> > -				folio_unlock(dst);
>> > +				if (fault_folio !=3D dst)
>> > +					folio_unlock(dst);
>> >  				folio_put(dst);
>> >  			}
>> >  			continue;
>> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_=
pfns,
>> > =20
>> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>> >  			if (dst) {
>> > -				folio_unlock(dst);
>> > +				if (fault_folio !=3D dst)
>> > +					folio_unlock(dst);
>> >  				folio_put(dst);
>> >  			}
>> >  			dst =3D src;
>> >  		}
>> > =20
>> >  		remove_migration_ptes(src, dst, 0);
>> > -		folio_unlock(src);
>> > +		if (fault_folio !=3D src)
>> > +			folio_unlock(src);
>> > =20
>> >  		if (folio_is_zone_device(src))
>> >  			folio_put(src);
>> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pf=
ns,
>> >  			folio_putback_lru(src);
>> > =20
>> >  		if (dst !=3D src) {
>> > -			folio_unlock(dst);
>> > +			if (fault_folio !=3D dst)
>> > +				folio_unlock(dst);
>> >  			if (folio_is_zone_device(dst))
>> >  				folio_put(dst);
>> >  			else
>> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_p=
fns,
>> >  		}
>> >  	}
>> >  }
>> > +
>> > +/*
>> > + * migrate_device_finalize() - complete page migration
>> > + * @src_pfns: src_pfns returned from migrate_device_range()
>> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory=
 to
>> > + * @npages: number of pages in the range
>> > + *
>> > + * Completes migration of the page by removing special migration entr=
ies.
>> > + * Drivers must ensure copying of page data is complete and visible t=
o the CPU
>> > + * before calling this.
>> > + */
>> > +void migrate_device_finalize(unsigned long *src_pfns,
>> > +			unsigned long *dst_pfns, unsigned long npages)
>> > +{
>> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
>> > +}
>> >  EXPORT_SYMBOL(migrate_device_finalize);
>> > =20
>> >  /**
>> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>> >   */
>> >  void migrate_vma_finalize(struct migrate_vma *migrate)
>> >  {
>> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages)=
;
>> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npage=
s,
>> > +				  migrate->fault_page);
>> >  }
>> >  EXPORT_SYMBOL(migrate_vma_finalize);
>>=20

