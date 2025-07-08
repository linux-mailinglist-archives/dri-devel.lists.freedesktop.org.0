Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC881AFCDCB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69610E670;
	Tue,  8 Jul 2025 14:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ieHwsqn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96710E666;
 Tue,  8 Jul 2025 14:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbJWm5xLDHB96JCrhUd69RcVNPRxAv9WRN6yMpFdi02u6yIgMkUvOyo//phSQkFz7uChfj1w8Nfy9FlSEbRCqex52fJhqgBH+25sBp+s1DZjfj8do8leLNP2n6iHMPi6dkfdaJjIfqaqAdie0r989/0tdSmhp5+Gkmi0kIx4pUGW2OpSB1DWswWhnYB7SBCUn6Xln54gU2W+OIpU2k0uH+k3PWN/OUEc+gQb8k8nZnX3Ga4IV1RoVCJLyg/N8uG6pRvfaO9BBL5nM3Rr+og+S7ADo9M/DSmhraHEqCA5QjTxa3wt+paO+QwaiEGops8zQVBq6XpNHJRHCDgnMTqjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5R7bmzYOWyXYp2HkVXC8enq1dVBFVVqWx0C5E3Jx58=;
 b=S8SMT3hc+WLzbe4dVb5LC0ZoOTxSF7zftYsvwx3HSv8ZfiOt8VCmD2PRclxVGk45JFlvcl3oz3cdSSi9HoK8kWlTeBvPMK4J6Pq+DADfOnEJTKsZ873mjk8t3ekjXITS+5R/G9wW0HjKrI2jJl0Cl03YSpJi2fMUGcU/NytWLmWR//FsIstXzFWae/y9xbN46tuDJynq2A/ib4L3ZmAmOSK07V4Ol5NYQyCDxBCRhKaJhp/30wzbmenlx7wmk3WH5zwcH9ejXx5cTsCwSm139P0WSRtfHxi46mJCFF1y8w/Z6MKskXxDhqsR6kgtrZSBt+7jWVqcsLxiLrZ/ptpCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5R7bmzYOWyXYp2HkVXC8enq1dVBFVVqWx0C5E3Jx58=;
 b=ieHwsqn/DeZaYfG6upT+2xg5ir7UVBzrK5sqkTJayAnyw5n0O4UNq6DlO9L5ovTuvulilRnASiS9CIFJTizXJzTAFdPNu6jzrgPD91g1hgbCDaxADudiY2itpf1npUBV0foqetXpKE1qCw18GAkxSkf+X8+qcr2JNkBkWaaqG5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 14:37:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:37:01 +0000
Message-ID: <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
Date: Tue, 8 Jul 2025 10:36:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] PM: hibernate: add new api pm_transition_event()
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-5-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250708074248.1674924-5-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d2bd05-6660-4a09-19da-08ddbe2ce6a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlFQdWt4NUZmUXFIRjhPcWQ2Ryt2RGlUNXpyWGNnWitzWkVlUGNYUVVTQ2Fz?=
 =?utf-8?B?MHNHcGx4L0I1YndSeGdsS1c0OTFOc3RQQW1BQlZoVGZ5WmxkT0ZDZnFtZXlG?=
 =?utf-8?B?RVhscGtvMy91MlVlY0I3ZTI2WDIxd2k5OXZvVERadGhwTCtSSzZrUnNsdkdw?=
 =?utf-8?B?dWl2UHZPQ05SNGlKd0RJenRRY3E2RTVGTjdPRTZaSlpoWmcxZzhVTitMN3ZQ?=
 =?utf-8?B?MkgwVDkrb1R6ZzdjUEdZbTgyVEZxMUhUcm9yeW0rWkl6ZUlkZUJ6aTE3OHpn?=
 =?utf-8?B?dU9SZmduT1l2NzJrTGh6eW9YRExkZTloM3ZxZzNkeHdNVTJhaklWVWJBL1Vl?=
 =?utf-8?B?TkhtdTYrbVAxRUhWWWh4VVN6aHA2VU1TVDZKblNHSDhWczdvdUhYV3k2V2h3?=
 =?utf-8?B?MmVKVVpsbjQvZExVVzJOOU05NnczU1Q0NHprY3o0MGRPOHk3aDBONEladngv?=
 =?utf-8?B?WjNzblk4dC9WZjh1TDRMNWpkSWZrY3F6R2w5QjN6c3dRbVFZMEZkUkNCUllG?=
 =?utf-8?B?MHNVeGtHZnZpT2g3TlNmY3E3YTNrMENHdWovbnRVWHJsNm5tMU9aajNrd2J4?=
 =?utf-8?B?NFRTZWprdmN5Sm9jcFBwYXJUa3FHV3A1SGk0S05sY01QRGFFRmt1VGtTdmpj?=
 =?utf-8?B?eTVKQ3hXNUNCNk9zM1pPK2tyN2p4N0FwaHNoKyt0OGJ0bGxFTXJ2ZyszT2px?=
 =?utf-8?B?UUxUU0lUSzlwVjRIRk5WU3FmeVI4RkhnN2dsNStvMTBtTEc3eXJjbSthSk4w?=
 =?utf-8?B?Y1NEdndMQW0yN3dUV3FPWXE0NDE5U254Y1pqN0cvWjBsQjVHbmxVTVp4YUFi?=
 =?utf-8?B?NEJzR0xaKzM2bHd3b2xBRTAwcVVvM2VEdklqUkhWQUR4VXVhdDR5TWxFdzJl?=
 =?utf-8?B?b2Ivam5oTjFNNmFubVoxK1UwaFNTMTg3MU0vRXo1MG5kMURkNWVBK2JiL0xD?=
 =?utf-8?B?cGVHckRNT2h0aVBQWkpVNmlFWTBoejl1Zk84azhUUFI3RkRidzRMZ2NNNkM0?=
 =?utf-8?B?UTdOUEtjelVSem80WkZacDVwQ0FMV2RMaHEzaWpsTlVaRlBuNXVGNDFZbGg3?=
 =?utf-8?B?dHp3bEwxS3QxUG4rWHFjeDhoV1FBaU45d0N1SU9ndFJmSklad0gwa2RVek43?=
 =?utf-8?B?cnhOc3JueGl0aDQ5ZmVsWUtMN05SSVp2Z01obTFiUVVDNDA3SXhvTHdDOTFN?=
 =?utf-8?B?bnR1NHpBVllLWE04R0RRTEtIbXdFdmZiYzFxS3AxK3JOUHQzU3ljcEpERGZV?=
 =?utf-8?B?ODNQYnNzbUo1cXU4bDFRanYxQWFrR2hNbktDcWlwYTNQb2dVcG81RlcweEg2?=
 =?utf-8?B?SzQyb0xWWjNTaVZYaFE4VU9VazJJTHoxT0RGRSttNVFFNi95U3BuNTZoSW9w?=
 =?utf-8?B?M3IrSTY1TWc1blRIOVovQnBJYTgyZFMxRzBXaWdSM2tLekJFb0VoTjdQTWZJ?=
 =?utf-8?B?OGQ0L1JxVDVvKzB4TVg4bXNqNS9pd3ZXYXhCVzZnVmZvclVFTzZzNW93cmVG?=
 =?utf-8?B?VE5JUkxsamUxT3JWbm53bHVWY2NBY3pnVGtnMDRjM0xKdHkwMzl5cHYzTWJo?=
 =?utf-8?B?cGQzekt3YXN5WHMvWTY3SWFCNy9BVGp4dnVkdU9oOFNMMkNqYzZTVTJWYldx?=
 =?utf-8?B?RXg3UitPTDJKOXB3c3krY0Z2QXNHcGhKWWVFc3BzanNqS2xiV2wzbThMREUy?=
 =?utf-8?B?OVZTYXpnaDBwZS9mNHJuNjIwL0hRTXFyemlyak1oVVQ0SkVmbmtZc0pxOEUx?=
 =?utf-8?B?cnVWSWxzSWtJeFJJd1JWYWpZUFlGbHhJMENOSGxncVlJekZwU0RaUWp0WGZw?=
 =?utf-8?B?SUdIZi96ejZzTEEvVG92SFlIb1lSTGpBV3haVnAwcFR6ZUM2Z0tkMWVtSGpY?=
 =?utf-8?B?b3JsV3UwSHR2cDdIVERrM2lpYWp4aDhkS09odS9sOG50MFFrMUIwZTQ2Q2Ja?=
 =?utf-8?B?bUp0VGZQZDNrUzFTdGNMSGZYSVl5ZXF0bStNVHRMZnFpaG0xMVV3QzVnNTJ6?=
 =?utf-8?B?VStjTlhDS25nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U29LZHZEZ1dnSjJIdHRXTEJUd3JkVkt1R3oyL3JDWk4vdEErUWFmeFlFakdG?=
 =?utf-8?B?eVFKZFE3RDZCcE1rZDhOTWNLZiswL29LMkQyU3lVQTBwRUlRWSttZjZQYzMv?=
 =?utf-8?B?UW9lemhSVlIrbStXL1RqMGZxM211K2YwMDJvMmZLWm5KSERLYzFLRVA2RUZR?=
 =?utf-8?B?ZGwwUnhGUEpqdTk5R0VhK0p1T0FYdjFoSUtyVDZsWlpJZTNveGtWUzlQVUNY?=
 =?utf-8?B?NlR2akNGSXN1U1IxcXNZdldjSy9GTCtDRXlObTNqenR6YUZIam1idy9IdEQy?=
 =?utf-8?B?dG5BQXpBaGN6M2J3dE1kZDIyU3AzdGUvUldUYVczZHBwSS9TaEJhaWw4elF4?=
 =?utf-8?B?bEhIVGUrWTFxSE9Fd3JSY3F2bDJlRUVjZzJnNWZEMzE2WlFnY2w5MFc1eFEz?=
 =?utf-8?B?SldsT2NEaXY2Yi9tZVRsemxKOWdBOVJlMGhuK21pemhNRFllbk1wUVUzTm5a?=
 =?utf-8?B?UEZlYXVNY2RKK0srL1JGMWpHUzNQU3ZIdVJLUHZiZU5vTEhCUzR2M1A2U3hC?=
 =?utf-8?B?SlBHZW5yeUFaVG9UNXY4R2I2NDYyYUFLSG4rZEdXUk1aTnA3WDRCNEpFaVIx?=
 =?utf-8?B?bDJTcHVaVS9Vb3hFVkNrYVFHOFF5RHlRM2NpcG45emZVMWRFOUNSTk9aNHRL?=
 =?utf-8?B?WXZrVERNR3RVSnN5M2VLbld6Q21pRndtdlMxbHZiTmJqSTlzaU5zQnhCSTh6?=
 =?utf-8?B?MTNOTDVpbG80RmdlalpIUmEzSjlDcUQzRjRuNmhsdWxrYWNON2J6MnJoZEpZ?=
 =?utf-8?B?aDIydXpCVXg4bURRRVBnNlc3SGtZMjdSaG00a0dJWmZzZ20zVExTZHpjemZ0?=
 =?utf-8?B?bUROWWhwWG1rZjdhUmRTM2JFZzk4ajVpb3pvS09sZlRUT2xEbGhaa3A5djFZ?=
 =?utf-8?B?SkJ3MExpcUQ3RXhMckZDd1pvVERnWDNjTllSZ1dxNERJUHJVbFY4bEI5TWlp?=
 =?utf-8?B?SVV3WUhQM1FhRHRleUZ3Rml4d2s5VmFOSkNSV0xFSDE5SWlKZVB4YmtHNzZS?=
 =?utf-8?B?SUFiT3YxaWtyVkNDVGdJSmVOY0s3WmlYajA1TlhKREptZllsOUNET1B4UTBF?=
 =?utf-8?B?a2RFaTdnMlhEeDNiellrVTA4VzRhMmpYUFgyelRhaTRHc3gyYnllWXlUTDZF?=
 =?utf-8?B?L2tlTFJ2RDBROGJDcytBMWJ0MXR4S2FnZnZoSHBnaDB5VzRXYXcxNkw1T0xs?=
 =?utf-8?B?U095Y3lQT2RqdTFFbnp6d1ZZMEdaTUIwekZybUFkU3dlYUxJeTVVeVFKOVRy?=
 =?utf-8?B?bm5wTjMxT3NlM1NleXZiT0tKSzJTWnloTUtLMVRSaFRsbmRwR3RKdmJ5NTVl?=
 =?utf-8?B?c2Ziby9MalBvRlprbm9DTzRzNzcwblJDd1hUTlkwWUJ4UG5BM3BXWkhPYkox?=
 =?utf-8?B?TjU4V3N0dll6djh4U0pjR3daVFpaVkRuTnYwSVdZenFNNC83WjR3d2lTS283?=
 =?utf-8?B?NlF2dXJMTEQ5N0N3dzQxTDlYNFhiOHU1MkNiR3l1WVE3MTl6SXlKaFNsaHd2?=
 =?utf-8?B?bVN6NHF5SWNBcnhhUW5GSlpRQU9Qczd1cWpYMmp1VkszNUlYV2RZYVBqMWpy?=
 =?utf-8?B?d204U2EyRTJ1NmNxUHhmam1KZHJ4clBkWUY5aWJjR29OMjBRWkNId2tDN0hp?=
 =?utf-8?B?djVDREdWeitPZ3pMQldJYXhoMU9pWmVqei9USjNBTDdLZEtDTVJMdDZTL21t?=
 =?utf-8?B?SWwzMGJ6MWxJSTdtTzZZM2RxbzNoYVNiSDJCTEZvZkY3eVVhTXJ3akdaL2g2?=
 =?utf-8?B?d1k1K1RhemZvZGNxQ1c2ZEpaVGFDQTBpNXZoczY1MHo0MDVrME90UGlIaGRC?=
 =?utf-8?B?cjRlWEx0U2VWN0UrUTNJOFNkNk8vOVc3bmVnVU1XL3NNeXZJcXRqSFdaQVVM?=
 =?utf-8?B?dzBJYkRYaWNkQW5qR09CeVRDMVQ0K0xxck1iS0FiT2IwZS9YSWRMTlpNVytY?=
 =?utf-8?B?Q1NacStzSlpYMVQzaVFPT09NVmx4Wk56TUplWklwb0wxK0tPeXhnMWFOVDZi?=
 =?utf-8?B?Zzk1VmtKNEpWalNTdmhEa282WkpMTkFnbW1ubVdyWkR5ZVhZSFV4WU1talFj?=
 =?utf-8?B?cnFmQXJManRkMU5JbVN0Z1MzanR6VGZhVVYvcjlIMFV0R2dLTG53dmJXamE0?=
 =?utf-8?Q?39vxtLIKwwkoqCfOqSgDH85E4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d2bd05-6660-4a09-19da-08ddbe2ce6a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:37:01.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5MbMUY9UKAtufcUb2BVVsPl46geMdjOwz3LpHxR2PRAOZ7DK2bue1tzdPIxVX8Q7xIkvsqO5bgkio/Hg4HJ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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

On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> dev_pm_ops.thaw() is called in following cases:
> * normal case: after hibernation image has been created.
> * error case 1: creation of a hibernation image has failed.
> * error case 2: restoration from a hibernation image has failed.
> 
> For normal case, it is called mainly for resume storage devices for
> saving the hibernation image. Other devices that are not involved
> in the image saving do not need to resume the device. But since there's
> no api to know which case thaw() is called, device drivers can't
> conditionally resume device in thaw().
> 
> The new pm_transition_event() is such a api to query if thaw() is called
> in normal case. The returned value in thaw() is:
> * PM_EVENT_THAW: normal case, no need to resume non-storage devices.
> * PM_EVENT_RECOVER: error case, need to resume devices.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/base/power/main.c |  5 +++++
>   include/linux/pm.h        | 16 ++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 40e1d8d8a589..7e0982caa4d4 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
>   
>   static DEFINE_MUTEX(dpm_list_mtx);
>   static pm_message_t pm_transition;
> +int pm_transition_event(void)
> +{
> +	return pm_transition.event;
> +}
> +EXPORT_SYMBOL_GPL(pm_transition_event);
>   
>   static int async_error;
>   
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 78855d794342..d1cb77ede1a2 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -657,6 +657,22 @@ struct pm_subsys_data {
>   #define DPM_FLAG_SMART_SUSPEND		BIT(2)
>   #define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
>   
> +/**
> + * pm_transition_event() - Query the current pm transition event value.
> + *
> + * Used to query the reason why thaw() is called. It will be one of 2 values:
> + *
> + * PM_EVENT_THAW: normal case.
> + *		hibernation image has been created.
> + *
> + * PM_EVENT_RECOVER: error case.
> + *		creation of a hibernation image or restoration of the main memory
> + *		contents from a hibernation image has failed.

I don't believe this documentation is complete.  In the use in this 
series those are two events used, but as this is now exported this might 
be used by other callers later which could use it for other PM_EVENT_*.

So because of this I think it's best to convert the comment in 
include/linux/pm.h to kdoc and then reference that from this kdoc.

> + *
> + * Return: PM_EVENT_ messages
> + */
> +int pm_transition_event(void);
> +
>   struct dev_pm_info {
>   	pm_message_t		power_state;
>   	bool			can_wakeup:1;

