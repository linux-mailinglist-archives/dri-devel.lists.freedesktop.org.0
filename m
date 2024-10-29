Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F579B4293
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0410E5B7;
	Tue, 29 Oct 2024 06:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XyrdeX+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7DA10E5B2;
 Tue, 29 Oct 2024 06:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHRoErFylF/e+r1H6yjLsTcQiHvdXG2m0lAC44is8TJ0kgz8A6SuN1IZmH0oYZi4UgwZuBBWb+Altk32ii2uk6v4m61TrzQBlvxVZvyZZzMrl9+kbn+Jqti6d7ULJFmfdMT7J64gAXL5HQwZSPW8xwQG1xmX0EC9pTausC014mQsc7BFFJlIuzmMkDqLQgQt/qUe7tk7vkTuCNcDLYj/vSZc78v8ljXDVdFrHVRU4UVwuzf2EIPtj0C/K7fxW2bN7VjBQyDHw3Y79kcgwf0Ac9Gaa5dkn5kXBM+WhM41DSdEWbzN7X1BFbThG/+xjko6El74+RwtklbZoVnJoR2Fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAU3RN9KDhQ943P6l9dlq8X99RD+EtF7dBD0/kyyPmg=;
 b=Nh4SzlNqpvwS7eSuGTI/XVtVZ8Y7Vc8JMcNM7wGcF2FXSTpkW8Yll+WNTuGPR1f29iFRszfhuJpEdqK+qi2kmQ1+xwcjSp/23oIeznUU4aLAa1LQUlndANa+9gWsMH71JSe35s3MDrSH9AonmGBcCnPvItdaM50tMjGgRlvpG2U8oHH9OVaW7bgT9Zr8vd5GkejYKpRBzp1Rr5lzsutOsBfr4p+5kCZpArfpgGs6x4mIRUUqphqLXvG9l810uPKzcNFVsKEtFHYgT9ZwK482aNbSZ7KKbGNcH0bA0DBxUcOoApcm09m7nWmS5OySzhG2UkzXvnSW95G5hIK5Cagqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAU3RN9KDhQ943P6l9dlq8X99RD+EtF7dBD0/kyyPmg=;
 b=XyrdeX+El8z4edBd5vL/8jmGubjoHgcqOlz+fRfnLGzbv9LyQhtKQSFfQwyTh3Js59d/BBVsacNE1JV3Xn3JHt91uGJukgeMS7BDgRPgFMtSdzKlW9fxsnSY5JhZ7dpUPPbuVrQS1zd/yaVFAqTOdqsgC9kjdUi/NknEj+7w+N7yaOGu95nUpvDQY2rx5eCGtlSYWFaKymtTh4JXGromenJdsi0YunIXKhJAfHbUjM+/pSvRV8eB2pCch//l8PC7SKQxPyV8Xq7fFapYgVQmIZuoto+OPK2Fbr7D91UISqUN6tTm5W7LtkFc5g2SYyw8AHGTqsk1g9/4ETYWcxepBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 06:51:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 06:51:07 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <87sesw8ziu.fsf@nvdebian.thelocal>
 <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
 <87cyjzo5pt.fsf@nvdebian.thelocal>
 <Zxrm8vcszpit/ZNK@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.4
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Date: Tue, 29 Oct 2024 17:37:45 +1100
In-reply-to: <Zxrm8vcszpit/ZNK@DUT025-TGLU.fm.intel.com>
Message-ID: <87iktbs8q7.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY5P282CA0026.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d136f4-8129-4af9-f282-08dcf7e61063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDNNNUVSVTAvd2Fmb3U3Q2NFWXBzdVQzVTlnQWU4RnR0Qm9RbVREZlEwT2Va?=
 =?utf-8?B?OVcvQzZPZE1wcDBwN0VCL2Y0amVKWGJmOVVFdDlBS1ZIUjdHNzZCa3FRYTVN?=
 =?utf-8?B?WXpQUHRQaFFGejlBc2x3SXpWd2pqNUx4MFJwNC9KZlR4clVDQmVNUlJWQmtI?=
 =?utf-8?B?N3FoYmdpanFIWllxbkpoU3ZLMFhsY3p2M2E5eFdPUUJwSFVkR3RZQkVBK3Jh?=
 =?utf-8?B?NzBXVDBGb0RpOERwZGlkMGxvY3JHeDJIQXhhTU5FenkzY2Zra3FxSkFmQk8w?=
 =?utf-8?B?czVJOVNTWk5lQVluemxIRzFWYU0wNld2dXFVUFFVMGRUQmdDNFE4OXdwUERO?=
 =?utf-8?B?MVhXUWdEZ0ZWNEN3NGxQRHNQTFNMQ3Bra0hveHFQdEhzWlRBTUt3UDhNVEox?=
 =?utf-8?B?WjdDQVVDUk1qTngvclZJa0ZVSVd1d2phMm9RUnA1SmZwQmZwY2FUYVBSV1V1?=
 =?utf-8?B?NHVVc1d5TzRTTGViZmUwWjgzQ2M0Y0QyWEZBMW1UZFZTVG4vOVVGQmZma3p6?=
 =?utf-8?B?SVkzS3djR0Fadnc3UStzeVdXeTVpbUJEalliODhTMkxKbjNjdzZZNlFTTkRi?=
 =?utf-8?B?NGRKUElsOGxJMFBHNnRxV3Y5ZkdkSHR3Ti9KUVpLNnBndjlaWlZnNWlKYVNt?=
 =?utf-8?B?UXYzZkFYUDRGSzAyblhWUkhWK1FCU0hUTi9rTVAzTElUeEpnZlIrWG9CWFl2?=
 =?utf-8?B?OHdoZFFCdTVid3pkSTlvV3BKQlg3N05mb0t5SHhYN3JMNU16RlNIYWdGcjEy?=
 =?utf-8?B?NEdzbFlJMVpyelEzN1pnVFc5TFpqaGl5Yjhnd0xoWndOUU5GRHNNNlNKM2NT?=
 =?utf-8?B?MEdqRDE3WkV3UEVqT096T0c2M2VJUnMzWENKVmdWTHg3SmdlbUZDYlllQ0VQ?=
 =?utf-8?B?RlpuKzRZOXVnYUdtMGJZR3hyb01iMWJIakZsaUk1QWVlUXpUSHBwTUdqdm1S?=
 =?utf-8?B?Y09EQ2NsMzhrbTZ4cjAwTE9uNENuZkplcG9aQlQ3WUk0MmsyVll3czd4TzhN?=
 =?utf-8?B?NnhUUHRIU3NseHhqTklGbjdMYjd5dURYZkMvaU5oREMxUFRQYm9BVVltR1NO?=
 =?utf-8?B?WjBmcjd4TDhsVzllVDAyYytDR1g4WXk1MWdvZGxLVU5aVTdzRmVZb1lTOFNt?=
 =?utf-8?B?dmlDVHprc3dHRUVMblZjSDZUalNGNGVHVVo4VzJqQWVVWnNSc3JuTVpzQy9y?=
 =?utf-8?B?Nzg5WWVhVFZ5YXFEVzRmVWswSjlZK3l1TVNQSzIyRmExRVhuOE1acFlTaStq?=
 =?utf-8?B?VUVqQXJWVWM5UWF6TDdaKytnNzJ2ekh3djVJcUx3d09hTDcvN3lqcXhOdmpm?=
 =?utf-8?B?M2VRekNZdXRucitFcS92NHpWemJCbExxemhlcjRnUm5pcnRBVGN2RHhXdkVQ?=
 =?utf-8?B?dG8wbVM1cjZidGt3NkN3dzhuUGp5VmxFYlZLOW4wN0FkUFNIcDlmalBxR3Jy?=
 =?utf-8?B?N290TXJiU1dFekhiZmxHMEdtcSt0dkR5bHY5VTVLaHpWNk1Xdk0rRVc2TUI0?=
 =?utf-8?B?WlM1T3k3RDRuMnVkQlppSmhaRUY4NGhoR3Rzc05QdEswQ1dHK0sxWHNtTmVa?=
 =?utf-8?B?ZzQ2cjRkL1dUaXpDcE5TWXRXYno0aFhxeEFhOWZtbE9zVGJaanZPWkY5Tnl1?=
 =?utf-8?B?bWlTVzhNWnVLYjcxM09tSEJjZmRyUXk3TEVjNmlhUW1jMXJXcDBXQUhOemlI?=
 =?utf-8?B?dkNXM3VsTmcybUhsdllickVLWjBBNXVyVVZhQVNPNk9haG5RMkFhQVZZVURz?=
 =?utf-8?Q?jMVqTMMbFShPZ5UKNpD7bz4/ycR8z/BHd4nBrYd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVkwYnh2U2xpT0E5RE5Ed0ZQa1lOUUdZOGVKQVVwSHMzcnZ6bUhDV0lpbGEy?=
 =?utf-8?B?dU11OW5BemJrZFZydkp4aUNNTU1wRUdlaEZnOU1KczdEbC9FQk0rN3RTTFJI?=
 =?utf-8?B?R25QQlBWM3ZraGQwTjBpL0Y2NmRMckJoeHVXUTRkaExYSEdoMVhhQWhKWWNO?=
 =?utf-8?B?aHVnRm1nOVZoak5jeGdzQjdFR2JvM1hPRGFiVlRVU3RaT3IzUmtxTSt6ekJ2?=
 =?utf-8?B?VU5xd3dRbDNja3NEaE0zaDNmNG9rR1gwQk84YzJ5cUhoSEI1Y3RRRzI3UnZr?=
 =?utf-8?B?cjRSbmRFTTRIOElOYlhVT1FwZ2t6cEMweHpLSzNmdHhhYWVIV1NLajJTbkV5?=
 =?utf-8?B?MkNrZFpYTTI1Q0JJUjRhSlNFU1ljM0wvY21vVTMzcno0OHFhUnRvOHhVKzl3?=
 =?utf-8?B?ZmhsVEhaYUdLYlVqSkg3NjhYdHdqMEZmekhqVjh2UTBXSisrbEwyTEg2N2ZB?=
 =?utf-8?B?SklRYjZSdytuaG8wdm5LRndJaEgyS1lSOUdiMTZFNWpxZzRsUVRvZkV5c2FG?=
 =?utf-8?B?clk4eGpZRTlXMllFTHhVcEI4ajhHa0xlOFZCZEZWdXZ3Z2tvMzR2SnJJd2pl?=
 =?utf-8?B?SXNIMEx5YktFMGdDUjY5bDdvOEg4OStTUXkwc0ZPVVNEN0hZSnNBTWliem1W?=
 =?utf-8?B?QXZrN0l6aE41ZHZobzhyR0wxb1JWc0VqTzRKNVJSSHI0MW8zd0lWeHcvOCtl?=
 =?utf-8?B?eno2d21Fb3htOXZycnBUc0FuaGx0eXlGc2lmWnE4elRxaGErZk5rRVFYTTAr?=
 =?utf-8?B?aEtWVHlrd3c2SXh0aEQ3K05rZmNub2ZUSHpxWEZFeEtzK1FjVW1nKzdLVmlj?=
 =?utf-8?B?dUhJaEtreFNhQXRjK2NWYk5KcVJ4QTloWjBGMWkvQmZnV3p3NGxMZ3d4MGpB?=
 =?utf-8?B?V2R0bXVHUTFSZjhoQnJyQkxDV2lDdjlpOXMwMEZQNzRpSlFFdmt5eStGMmh1?=
 =?utf-8?B?ZDEyUDVSQmhDYms0L0V2dExvS0sxWXB0UmNVeTlnQjlGWkd4UUwvYTVoTkxK?=
 =?utf-8?B?TTU4Z3A2WlZXdnNIQlkzWUIwa3Rwak1hcmtkdDdNNi9TRVVIS255M1NKYlBq?=
 =?utf-8?B?ZDhMbDk0NklkQ08ySDh6cTRHQUpzaGY5clVVa2lMemNpYUhpbVF4NHArNGZm?=
 =?utf-8?B?RDNNYzVlaktVL2FXNnNYRFVReW5NUkxZaW9jZE4rdzVSZXJDdTMzWitvTndj?=
 =?utf-8?B?bDlBMXl1Sm5hYjNFUzNVYVhHN2R5WFlQcVovcUdkM25ubC9seHY1T3RhZEND?=
 =?utf-8?B?amtyOGdxNVU5VU5BamNjM3I1Q0VyamVuaE5RcFYyd0xsY294QUcxMDg1azlR?=
 =?utf-8?B?MlpzMkhkNnpxTUQ3TzdTY0h2NXdneTNjYi82THlGc09wcTgyZ2hpR3g4ZWlJ?=
 =?utf-8?B?RUZtRFpyb2xDRFc5TzNJQmxIeHNyWjl5UkRBTHdSV3gvMUZHMFlKdVpUeFJZ?=
 =?utf-8?B?Nm9qRVVWekN3d01LaDFkSU5VTVVsUTREekxVR2pLZmRiZlpJMFJjam12K09o?=
 =?utf-8?B?aW14aEp1Sm5BQ1hzTm1IU1RRRmNjMXFEeTg0MTNiS00yVFprQVlMV2lzWmo1?=
 =?utf-8?B?YW45amkwOGZpQndzSnpMNTJnOW5lM1dEbGJLMEl5UVA2c1h0V0h5Q2RjNnls?=
 =?utf-8?B?YzFZQ21qc2svVExTMkZUbjNMQ3BVK2UweVBqT3d0dTBsVW9HQUU0aVYxTi9M?=
 =?utf-8?B?VUNJZm5IYnNzSmVrTUJ4Um1QZFZ1cjZFVXg1VDcrTG5IN2JDcFBzZEprYW1O?=
 =?utf-8?B?NjJmQ1pCc0hiKzI5U21KcGtBdXAwNVcxZWFVU1FuSFd6RW5QWEwrNGo3WWRF?=
 =?utf-8?B?RUpNemRJMEdsREl2RTZIOW1KREhyUU4wSXRvaitaRjFXQmJpNGcrVTZheTJm?=
 =?utf-8?B?NmtDZ2VqVHBMTkVZOTZ1TVJtZWxvQXlmWWt2ZkZlWmRUYzl1eW9OT1VHQnFG?=
 =?utf-8?B?Umh5cFNac09rT203VzB6L1R4WWpwSzlaZTlUemFibzRCc3ZBc054ay9HdkVU?=
 =?utf-8?B?ZDFrYzdpMmhOYWp3RTlXMUtwWEdsWVZaU0lUUWRpV2IxWlM1eUpRZy9EZkJ5?=
 =?utf-8?B?UTZOQ2MwNXlTS0JLWCsreWVHUkRjb2x2N2c4TXJ5d2lzRmFpS1hrWHJZeDF2?=
 =?utf-8?Q?uWGR7xMR65TPCSB2/mBpFUroo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d136f4-8129-4af9-f282-08dcf7e61063
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:51:07.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKNDsPZRxeTWpcDM9nbR7As6XlIFnTL0V1Dzn2e6fitZ1C4O+rhzE3Gseo0qw4cvsEN9s0FL+qiTD2Ae25GaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836
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

> On Thu, Oct 17, 2024 at 12:51:08PM +1100, Alistair Popple wrote:
>>=20
>> Matthew Brost <matthew.brost@intel.com> writes:
>>=20
>> > On Wed, Oct 16, 2024 at 03:00:08PM +1100, Alistair Popple wrote:
>> >>=20
>> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >>=20
>> >> > Avoid multiple CPU page faults to the same device page racing by tr=
ying
>> >> > to lock the page in do_swap_page before taking an extra reference t=
o the
>> >> > page. This prevents scenarios where multiple CPU page faults each t=
ake
>> >> > an extra reference to a device page, which could abort migration in
>> >> > folio_migrate_mapping. With the device page being locked in
>> >> > do_swap_page, the migrate_vma_* functions need to be updated to avo=
id
>> >> > locking the fault_page argument.
>> >> >
>> >> > Prior to this change, a livelock scenario could occur in Xe's (Inte=
l GPU
>> >> > DRM driver) SVM implementation if enough threads faulted the same d=
evice
>> >> > page.
>> >> >
>> >> > Cc: Philip Yang <Philip.Yang@amd.com>
>> >> > Cc: Felix Kuehling <felix.kuehling@amd.com>
>> >> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> >> > Cc: Andrew Morton <akpm@linux-foundation.org>
>> >> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>> >> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> >> > ---
>> >> >  mm/memory.c         | 13 ++++++---
>> >> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++-----------=
----
>> >> >  2 files changed, 56 insertions(+), 26 deletions(-)
>> >> >
>> >> > diff --git a/mm/memory.c b/mm/memory.c
>> >> > index 2366578015ad..b72bde782611 100644
>> >> > --- a/mm/memory.c
>> >> > +++ b/mm/memory.c
>> >> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vm=
f)
>> >> >  			 * Get a page reference while we know the page can't be
>> >> >  			 * freed.
>> >> >  			 */
>> >> > -			get_page(vmf->page);
>> >> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> >> > -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> >> > -			put_page(vmf->page);
>> >> > +			if (trylock_page(vmf->page)) {
>> >> > +				get_page(vmf->page);
>> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> >> > +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> >> > +				put_page(vmf->page);
>> >> > +				unlock_page(vmf->page);
>> >>=20
>> >> I don't think my previous review of this change has really been
>> >> addressed. Why don't we just install the migration entry here? Seems
>> >> like it would be a much simpler way of solving this.
>> >>=20
>> >
>> > I should have mentioned this in the cover-letter, I haven't got around
>> > to trying that out yet. Included this existing version for correctness
>> > but I also think this is not strickly required to merge this series as
>> > our locking in migrate_to_ram only relies on the core MM locks so
>> > some thread would eventually win the race and make forward progress.
>> >
>> > So I guess just ignore this patch and will send an updated version
>> > individually with installing a migration entry in do_swap_page. If for
>> > some reason that doesn't work, I'll respond here explaining why.
>>=20
>> That would be great. I have a fairly strong preference for doing that
>> instead of adding more special cases for the fault page in the migration
>> code. And if we can't do that it would be good to understand
>> why. Thanks.
>>=20
>
> I've looked into this and actually prefer the approach in this patch.

Thanks for looking into this.

> Consider the scenario where we install a migration entry, but
> migrate_to_ram fails. How do we handle this?
>
> We don't know where migrate_to_ram failed. Was migrate_device_finalize
> called, removing the migration PTE? Do we need to special-case failures
> in migrate_to_ram to prevent migrate_device_finalize from removing the
> faulting page's migration entry? Should we check for a migration entry
> after migrate_to_ram and remove it if it exists?

The driver should always call migrate_device_finalize(). On failure it
will remove the migration entry and remap the original device private
page. That obviously doesn't handle the fault but the process is about
to die anyway with a SIGBUS because migrate_to_ram() can't fail.

> Now, if migrate_to_ram succeeds, it seems the migration entry should be
> removed in migrate_device_finalize since the new page is only available
> there. We could return the new page in migrate_to_ram, but that feels
> messy.

Agreed - I would expect migrate_device_finalize() to always be called
and remove the migration entry.

> Additionally, the page lock needs to be held across migrate_to_ram, as
> this patch does, so we'll require some special handling in
> migrate_device_finalize to avoid unlocking the faulting page.

Or just unlock it in migrate_device_finalize(). I agree locking it one
place and unlocking it in another is a bit ugly though.

> Finally, installing a migration entry is non-trivial, while taking a
> page reference under a lock is straightforward.

I didn't think it was that hard once you have the PTL - although there
is a bit of account keeping the same as migrate_vma_collect_pmd() but
that could be abstracted into a common function. The advantage is it
saves a page table walk, but I suppose that isn't that relevant if
you're migrating a group of pages.

> Given all this, I prefer to keep this patch as it is.

Ok, I will take a closer look at it. Thanks.

 - Alistair

> Matt
>
>>  - Alistair
>>=20
>> > Matt
>> >
>> >> > +			} else {
>> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> >> > +			}
>> >> >  		} else if (is_hwpoison_entry(entry)) {
>> >> >  			ret =3D VM_FAULT_HWPOISON;
>> >> >  		} else if (is_pte_marker_entry(entry)) {
>> >> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> >> > index f163c2131022..2477d39f57be 100644
>> >> > --- a/mm/migrate_device.c
>> >> > +++ b/mm/migrate_device.c
>> >> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >> >  				   struct mm_walk *walk)
>> >> >  {
>> >> >  	struct migrate_vma *migrate =3D walk->private;
>> >> > +	struct folio *fault_folio =3D migrate->fault_page ?
>> >> > +		page_folio(migrate->fault_page) : NULL;
>> >> >  	struct vm_area_struct *vma =3D walk->vma;
>> >> >  	struct mm_struct *mm =3D vma->vm_mm;
>> >> >  	unsigned long addr =3D start, unmapped =3D 0;
>> >> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >> > =20
>> >> >  			folio_get(folio);
>> >> >  			spin_unlock(ptl);
>> >> > -			if (unlikely(!folio_trylock(folio)))
>> >> > +			if (unlikely(fault_folio !=3D folio &&
>> >> > +				     !folio_trylock(folio)))
>> >> >  				return migrate_vma_collect_skip(start, end,
>> >> >  								walk);
>> >> >  			ret =3D split_folio(folio);
>> >> > -			folio_unlock(folio);
>> >> > +			if (fault_folio !=3D folio)
>> >> > +				folio_unlock(folio);
>> >> >  			folio_put(folio);
>> >> >  			if (ret)
>> >> >  				return migrate_vma_collect_skip(start, end,
>> >> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >> >  		 * optimisation to avoid walking the rmap later with
>> >> >  		 * try_to_migrate().
>> >> >  		 */
>> >> > -		if (folio_trylock(folio)) {
>> >> > +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
>> >> >  			bool anon_exclusive;
>> >> >  			pte_t swp_pte;
>> >> > =20
>> >> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >> > =20
>> >> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>> >> >  					set_pte_at(mm, addr, ptep, pte);
>> >> > -					folio_unlock(folio);
>> >> > +					if (fault_folio !=3D folio)
>> >> > +						folio_unlock(folio);
>> >> >  					folio_put(folio);
>> >> >  					mpfn =3D 0;
>> >> >  					goto next;
>> >> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsig=
ned long *src_pfns,
>> >> >  					  unsigned long npages,
>> >> >  					  struct page *fault_page)
>> >> >  {
>> >> > +	struct folio *fault_folio =3D fault_page ?
>> >> > +		page_folio(fault_page) : NULL;
>> >> >  	unsigned long i, restore =3D 0;
>> >> >  	bool allow_drain =3D true;
>> >> >  	unsigned long unmapped =3D 0;
>> >> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsig=
ned long *src_pfns,
>> >> >  		remove_migration_ptes(folio, folio, 0);
>> >> > =20
>> >> >  		src_pfns[i] =3D 0;
>> >> > -		folio_unlock(folio);
>> >> > +		if (fault_folio !=3D folio)
>> >> > +			folio_unlock(folio);
>> >> >  		folio_put(folio);
>> >> >  		restore--;
>> >> >  	}
>> >> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>> >> >  		return -EINVAL;
>> >> >  	if (args->fault_page && !is_device_private_page(args->fault_page)=
)
>> >> >  		return -EINVAL;
>> >> > +	if (args->fault_page && !PageLocked(args->fault_page))
>> >> > +		return -EINVAL;
>> >> > =20
>> >> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>> >> >  	args->cpages =3D 0;
>> >> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *mi=
grate)
>> >> >  }
>> >> >  EXPORT_SYMBOL(migrate_vma_pages);
>> >> > =20
>> >> > -/*
>> >> > - * migrate_device_finalize() - complete page migration
>> >> > - * @src_pfns: src_pfns returned from migrate_device_range()
>> >> > - * @dst_pfns: array of pfns allocated by the driver to migrate mem=
ory to
>> >> > - * @npages: number of pages in the range
>> >> > - *
>> >> > - * Completes migration of the page by removing special migration e=
ntries.
>> >> > - * Drivers must ensure copying of page data is complete and visibl=
e to the CPU
>> >> > - * before calling this.
>> >> > - */
>> >> > -void migrate_device_finalize(unsigned long *src_pfns,
>> >> > -			unsigned long *dst_pfns, unsigned long npages)
>> >> > +static void __migrate_device_finalize(unsigned long *src_pfns,
>> >> > +				      unsigned long *dst_pfns,
>> >> > +				      unsigned long npages,
>> >> > +				      struct page *fault_page)
>> >> >  {
>> >> > +	struct folio *fault_folio =3D fault_page ?
>> >> > +		page_folio(fault_page) : NULL;
>> >> >  	unsigned long i;
>> >> > =20
>> >> >  	for (i =3D 0; i < npages; i++) {
>> >> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src=
_pfns,
>> >> > =20
>> >> >  		if (!page) {
>> >> >  			if (dst) {
>> >> > -				folio_unlock(dst);
>> >> > +				if (fault_folio !=3D dst)
>> >> > +					folio_unlock(dst);
>> >> >  				folio_put(dst);
>> >> >  			}
>> >> >  			continue;
>> >> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *s=
rc_pfns,
>> >> > =20
>> >> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>> >> >  			if (dst) {
>> >> > -				folio_unlock(dst);
>> >> > +				if (fault_folio !=3D dst)
>> >> > +					folio_unlock(dst);
>> >> >  				folio_put(dst);
>> >> >  			}
>> >> >  			dst =3D src;
>> >> >  		}
>> >> > =20
>> >> >  		remove_migration_ptes(src, dst, 0);
>> >> > -		folio_unlock(src);
>> >> > +		if (fault_folio !=3D src)
>> >> > +			folio_unlock(src);
>> >> > =20
>> >> >  		if (folio_is_zone_device(src))
>> >> >  			folio_put(src);
>> >> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src=
_pfns,
>> >> >  			folio_putback_lru(src);
>> >> > =20
>> >> >  		if (dst !=3D src) {
>> >> > -			folio_unlock(dst);
>> >> > +			if (fault_folio !=3D dst)
>> >> > +				folio_unlock(dst);
>> >> >  			if (folio_is_zone_device(dst))
>> >> >  				folio_put(dst);
>> >> >  			else
>> >> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *sr=
c_pfns,
>> >> >  		}
>> >> >  	}
>> >> >  }
>> >> > +
>> >> > +/*
>> >> > + * migrate_device_finalize() - complete page migration
>> >> > + * @src_pfns: src_pfns returned from migrate_device_range()
>> >> > + * @dst_pfns: array of pfns allocated by the driver to migrate mem=
ory to
>> >> > + * @npages: number of pages in the range
>> >> > + *
>> >> > + * Completes migration of the page by removing special migration e=
ntries.
>> >> > + * Drivers must ensure copying of page data is complete and visibl=
e to the CPU
>> >> > + * before calling this.
>> >> > + */
>> >> > +void migrate_device_finalize(unsigned long *src_pfns,
>> >> > +			unsigned long *dst_pfns, unsigned long npages)
>> >> > +{
>> >> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL=
);
>> >> > +}
>> >> >  EXPORT_SYMBOL(migrate_device_finalize);
>> >> > =20
>> >> >  /**
>> >> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>> >> >   */
>> >> >  void migrate_vma_finalize(struct migrate_vma *migrate)
>> >> >  {
>> >> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npag=
es);
>> >> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->np=
ages,
>> >> > +				  migrate->fault_page);
>> >> >  }
>> >> >  EXPORT_SYMBOL(migrate_vma_finalize);
>> >>=20
>>=20

