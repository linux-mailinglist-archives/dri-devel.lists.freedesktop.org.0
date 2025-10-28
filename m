Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759E1C13D40
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240B10E36E;
	Tue, 28 Oct 2025 09:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vSnPD8Cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DA710E36E;
 Tue, 28 Oct 2025 09:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efEMXX0aPK34wBJgEt3KHfziuXiI4nORRo9bt2jq81QlGRSGcAcrHFbOQzZccgYCgZUeQoCIxZNpfLLn0+X1CJvX2qxVG+DC3gO5fxTpEYB3vHGXbyc+4Kn32Lz7LMIXYQ06tiHYkeKea5YUq+Cx17v/A+9bWmRTZ9r/ICmLx1m8cX9I7WIBlpAQmcFf1U3TM5hlvPSudCfJEcTGKEaa0QBidbCEw7pvHLJvBRz7Q22ymxzkAdBWzJ59D/qNBz83iPvypILq7BJbtgcIA48VHy1py8oSCIiZOrY8bL0/nXkmWJaPsYdQJLECc01mUIQJU+n3qgAZ0oOaAU1j/dXtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNkwMhfaiVwp1dq1bhw6UY9sfUewylIJj7R5H1ey2jo=;
 b=n2q/BuAlWNEN3EmAnB30KXQ+wu9Vo2VxHcSn5RGhu4CZSGwBKFSg6/togufDeXz9cV4k9ceaRW9HmrdcGTo6bdT8H7BWk3yUitcW0NLoOFaobn9keDtUxsVqugGTTGtfg5+Ku9btoMcHZjiBlH7QocxaPttVQAethKB7cFNN6+QvuG9eI5CqezGSv/FB2bAM+W8OLNz9w9sVja+JM9QojEX3Hx1d3b+UbO7NxYp0JPxgj/aAM4olMcNva+2hRQP1s4Sg386t3A0tSXPJV9y7RpyZt0RE6XwVwauKKjHAwAqtRQdnPNRabYOsLYSurprAUsFX/0IEIlt8njtJua7yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNkwMhfaiVwp1dq1bhw6UY9sfUewylIJj7R5H1ey2jo=;
 b=vSnPD8Cu6OETEKxXB5tRZc7bNRfeKZXZCw9aeFypTFU/ypkNCD9uVU0Km721ZaYWYELa3Kol3JbgCEQ3RxFKKqSLScOtHingsIamFCRz0Mb+xfRxK3FfoBRkL2QybNhIqeSx7jqAabn18s3gyFPga3YJdCOZd59KR0ffV5F73M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:33:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 09:32:59 +0000
Message-ID: <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
Date: Tue, 28 Oct 2025 10:32:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch,
 pstanner@redhat.com, dakr@kernel.org
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251021213952.746900-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: b378b86c-eca1-43e7-77d5-08de1604fbd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUsyTnVjYWcxMGF2RGlINU11QThpWDc1ell0UTZhL1BjeUNsQU1EUHJkL3lX?=
 =?utf-8?B?cGdNOWtka1VoRzloczh3MGVJb3lVT04xQ0ZOaGdHVU1kbmxtUFE0TW9uZ1Rq?=
 =?utf-8?B?S3NkZjFZaURPYUN2OHVjWWxaUDFzeHRJb1lSejJOSWdmUnhHMmVqYWN6a1BV?=
 =?utf-8?B?aE5Pd2VkQTZSQVlxTkF6emNUNUpyUFJQMUZiMnFIS3cralZmeDE5YUVUUnZn?=
 =?utf-8?B?d3hGdnM0dnRKUUszcmlzbGdscjhFdmNtaTUrMFVxb2ltdS9FQStMU1JnTWN4?=
 =?utf-8?B?ZSt1K25DczU2VVMrb3gvNytWUVNKZllPMlVUcW9RNVNzYnVTNlJXSkRHWXZY?=
 =?utf-8?B?Mjd3ZU53SSt4V2V0MUVaSW9NUnJmck9UK1p0U0Jqa1pvSVdadGorRStCeG1N?=
 =?utf-8?B?N3BzVUdwWXk3a1hxRENia29XWFdwMHg3U2RHQThuUW41eTVZSHU2ZmowQnFW?=
 =?utf-8?B?ank3T3BLMlA1SHJMaGpLWWVSMjlkVHJpbFEwaUs2QmVMZzN3UXJPQlpsY0Zv?=
 =?utf-8?B?VVBJZ09qZHlFZHdTa0ZnRGJOUXRrRTl3MGZ2VnZRclpXbzZBZnEvQW9LQjNQ?=
 =?utf-8?B?bEhwL3hvUXBic2l4bCthSjRYSXM1TkNZODczZDNOdFJUUlVlcVd5aEl6dmk3?=
 =?utf-8?B?ZTg1L283YTZacU5EQi9Jc3BvK3BzQWs2ZFAxYnUrMlVCOWxtNGpWSXlsaHNI?=
 =?utf-8?B?NndSQkZYOXdDbVRNREhmTWpRVGRVV0VOY2pNdlFWVU90ZVBsbklJRnphNnRN?=
 =?utf-8?B?RXZjSWVIdTZpdURZMnMwNXY3WnAvd0g5bFhYeWVwM284WWI3M1Y5Q0l5eHdj?=
 =?utf-8?B?STQzMEI4Z0FJamY3eTl2VjNDRWNJQ2Z0RC9nWS9MVkYrQzNXTlRldEFqNW83?=
 =?utf-8?B?djdmVzd5dlpxckRJRTVZcGdNQzFDT1M5cDRpa1Q1akd3cXVGTzEvOUw3MC9j?=
 =?utf-8?B?aitvc1VzaVYrYlkvblE5Y2t6UGpBS1VPN3h1WGtZb0tTWi9iU0hrYm9saFMv?=
 =?utf-8?B?eTQyM0hWS0tyUmI0clk0RnY2L1NlRFVhQkJXcU4wVHcrMzc4WEJIREk5c3l6?=
 =?utf-8?B?R1NMWkFWdHpvRXJMV3lvNWwvT2NrZzJ5bEVGczdyeDFuTDVtcHF3WkpiVkJ1?=
 =?utf-8?B?RkpKMzdZc3F4RzdKWndieENLSi90VUVXTTJhUWo3aVJhQ1pLdGt2aHlkN0xG?=
 =?utf-8?B?WjFBMEZQYXVnc0FwVWhGOWJaYjgrb21ENkQ0UEJVUkg5Y1B5cmhhbG8ySW9u?=
 =?utf-8?B?ZnRyTFgrNmsyUmFYVnJHU1VBcjRvTjZDem1PZ2hwMTNTMlh6MHpKVEdqVCtT?=
 =?utf-8?B?eFZEREgrUFFQZDFvVVgwbGVJWlZwTTcvS1FWQ2xQM0kyMHI1TWF5U2pUNWho?=
 =?utf-8?B?UmlnWU5Wb2RZQ3FnM2Y5TVhxWFFkeVRTd2czZW5jbExjVHlmVndCUWRWN0N1?=
 =?utf-8?B?c044a1RFOTVpcUt4a1Y2V1orNHowclpSWGlSQmlyYTdiM2FHc1FkSEFOZXdv?=
 =?utf-8?B?cWpkQ0dsU2dmTi9KTHNydXR0YStZa21HVU1aNlRySXRmWk9aaFBYU2F2cGdQ?=
 =?utf-8?B?VFdqaXN3Z3R5Y1I5MkErNVo4TXo5NjBYUmNpRnBjYUc2MTBsWmxCSHNiVFFl?=
 =?utf-8?B?RUt0eDBUOTRoSEVsSnRCM0FjZDE5ekJlMi9Cc1dPV1JIM2hwOWxjdk1DQkxm?=
 =?utf-8?B?dWtrV2pDckdpWTRMcHBURzJDbFF6UytZTHByajhxMXVWMGwydkg3aXNrYWZa?=
 =?utf-8?B?bVhjdW11Q0xtcXd1REozdytlQjF1R0JaWk5zclZlb1pVcW1MRndSdUJKRWp5?=
 =?utf-8?B?U0dWNmNGdkY4eWNVd0ZUVW8raElaQkFsUXN6OWpDSnFWbFlNRkVqeit6VDRx?=
 =?utf-8?B?QTdvZ0t4cFdkV3pmWnpEM0hMVS9vbG5QL0tBdXJybTdDQ3VkbktGZUZuelJS?=
 =?utf-8?Q?BPH8mZA8amhG84XxlaSy3fnYXpZ/lUW1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVgwRHh5VWNrSXM0c1pYa3NhRGVYV2cxdlo2MnZMeXZPcE1vN2lzd0JYNHRL?=
 =?utf-8?B?VWVSUjlYSUVIb3pBWFl3RGgwcnZuSkRDcTBZa0g4N0NsTGJLZit6aGlZUW80?=
 =?utf-8?B?dDVPaTZFaTUydm5Sc09JSnN5ZGdHczZzekgxZVhQTktSQmxhOFFxS1hRTVJQ?=
 =?utf-8?B?NFlZVDkxZTJGTmxyZ0RSSVpoa0ZIS2lacU9hUWpGUHozUmdXcHZ5RUJGZWpt?=
 =?utf-8?B?ZU9PUnZkNWtoRGhpdG1wWjVGQkF0Tzk2d0xvRkhOS0ZNSkhOcGhpMzcycW0y?=
 =?utf-8?B?VTFLZ3I2KzNreG56NS9xbHBPYXFqL0h1N1l0YWM5eURuelZVKzF0NjdLYm5q?=
 =?utf-8?B?NW9wMTArVzhmellVWVRkMmt5ajYvbndxYnh1OWo3WjRCMzJaTjhPZWIwbmtZ?=
 =?utf-8?B?eFVFZ0NaaFZ1YlA5UnN5TzMwMlVFNmlKV2RET2xpTSs5VUgwZHdPc1dJRkhO?=
 =?utf-8?B?bXRycTZ1Wnl5Ykp3d3lxSmpBbnJ5ZVJjR1RiNzlmakViVDlaZ29RbWFkKzgr?=
 =?utf-8?B?R0FvTnpaajlSaWxmaEFtVWZ0YVMzcjdqM21xOXU1ZUZxMHdGbVhXUTlOd2E3?=
 =?utf-8?B?Qitrck0yWkRxcEdvR2lod2t2a3p2bFY0Uk4vd28vcmVJait3Z0F0VDBJQXpR?=
 =?utf-8?B?UXdIT0pPeHhkNEhyRmhWYktDVVVOeXpnZEVVRkJUZ3ErRG9uR0hWSEdWd2Nu?=
 =?utf-8?B?V003bHJJdHd1emRqUUg4UUg3WjUzQ0ZFc0FiS2hCSzUwMkNRM0xTd3lYYUYv?=
 =?utf-8?B?ZUxPZjZ1RDFVWjMwZXVvZjBUL2x2ZVFNblRxckt2WFJJWmw2TVdyc290RFJr?=
 =?utf-8?B?NEVKaXR6OTFYaHU0V3F4THVielFxUUdJakhvRGsrd1VCc1B5aC96Zlh2QmFU?=
 =?utf-8?B?S2JYb0wvKzVEWXZoN0lCUkYrZ2xiczRyd1E4NC9PbDQyd3dvNGRLR3JoMzBF?=
 =?utf-8?B?bDdtNmJ6ZjJqblVaMyt3Vmp6NHFxcjV2L0FBVm9Nd0FwT0JsUzdDcVZEVkJr?=
 =?utf-8?B?Zzl2bzh5UkNjS09LclQyU0hLZHNCV2poL24vWXNYVGRhNWk4UU5jdXJLTkh4?=
 =?utf-8?B?aC9yZ3czd0lhYTJlb1g4OVQ0dFNiRlQzVW4xVmpPeHNoR1hsWS9OdHM0bmR1?=
 =?utf-8?B?ZnhLWmlvcnZiQlJZSmc1YU5xNWNJTlVFTWxqbXZ6UnY4WjducnZmWmF4aElX?=
 =?utf-8?B?SzVnbE9Vb0lzdVlwVzlaZ1pPZm12MEFEc1NpaDNVQ3Y4VEF3SmFLRWp6WndV?=
 =?utf-8?B?WXNJYkdKZDVuL0YvbHVyTFl5VVZCTXBRZ0VRcnpJUFlXbU80QVc1NnQ4ZTVV?=
 =?utf-8?B?dDMyNGJTajB5QzhTVVRvUlJsWUpaVGIwbUJZVVRKc3Jiejg1dkZibTJxMEJi?=
 =?utf-8?B?ZTVBcU1CRnBHeXRRckMxV0Y0bWFTY2dqOHF6amJPVjlTT2Z0cGhFY0NHR2dm?=
 =?utf-8?B?Q2xqQzBoSElzblQrMUg2ZTFVY042a3A3NjN0aXF4bld1Q2JnSW1QN1pKWGVY?=
 =?utf-8?B?RC80OEFkeGorYjVaZ2dHbEZSZXR1VVJmeVVrelE3ZFNOa1kyTkR2b08rbFQv?=
 =?utf-8?B?VVVuSnRyanFublN3WlBVVytmNDVTalZpa0FHcndvTng2NmZuYWxBclR0Qko2?=
 =?utf-8?B?MWJqMWU1cWM3UjZyQnRUUVkxdWJGcGdoVXBwMzhhd2ZrYlBHR2N6RlJ1ZFBG?=
 =?utf-8?B?TFp4TVdsWjFmVzRYZnBzbzdoY1dxWnR2VDFTbDNzeExEL3dQL3V5YmhzMlg2?=
 =?utf-8?B?NmtjRURXOVBraEREZDVvaHdsMXl6U05BNUxDSzZNMFJHNGRmZzRlRzhHbnpI?=
 =?utf-8?B?VERFQmg3SzBVbHg1dGt4K081WjJrMEV3VTJtNElxaTg2TlBONUpFN1dkYjRS?=
 =?utf-8?B?SE93aDJqNFp4S1dKUGVVUVBFV2lTWE5iY1l6WkJBNjhqQzIreEVKOFdIT3hw?=
 =?utf-8?B?MTVTa3J3YlZLN1RrRGhyeFN1blpJcnpxOG5ld2JDUExtbDh0TGZEVXNNTFZl?=
 =?utf-8?B?OXJ5aXpVSFpKN3ZFTUNCME1mbVRYaHppWXhhczZ3eEdqWnJ2RHA2bFZpdlBL?=
 =?utf-8?B?RDkxQnBTTEROUTkxV0owN0Z5UWNsQmRwcjhGc1dRZGJtNXArWEhQZG1kd0pT?=
 =?utf-8?Q?ECcroecaACjXVd+eq8l7fYKx8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b378b86c-eca1-43e7-77d5-08de1604fbd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:32:59.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEvR0wagYH86I/MN1nlyAjSCh7RwmwgmfP2zSBa7kTOQ33X63C2MsoFtEPhmj8X4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868
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

On 10/21/25 23:39, Matthew Brost wrote:
> Drivers often use workqueues that are in the reclaim path (e.g., DRM
> scheduler workqueues). It is useful to teach lockdep that memory cannot
> be allocated on these workqueues. Add an interface to taint workqueue
> lockdep with reclaim.

Oh that is so wonderfully evil. I'm absolutely in favor of doing this.

But can't we check for the existing WQ_MEM_RECLAIM flag in the workqueue handling instead?

Additional to that we should also make sure that the same wq is used for timeout and free and that this wq is single threaded *and* has the WQ_MEM_RECLAIM flag set.

Otherwise we run into the same lifetime issue with the job and memory reclaim during device reset as well.

Regards,
Christian.

> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/linux/workqueue.h | 19 +++++++++++++++++++
>  kernel/workqueue.c        |  9 +++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index dabc351cc127..954c7eb7e225 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>  						1, lockdep_map, ##args))
>  #endif
>  
> +
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
> + * @wq: workqueue to taint with reclaim
> + * gfp: gfp taint
> + *
> + * Drivers often use workqueues that are in the reclaim path (e.g., DRM
> + * scheduler workqueues). It is useful to teach lockdep that memory cannot be
> + * allocated on these workqueues.
> + */
> +extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
> +#else
> +static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
> +					   gfp_t gfp)
> +{
> +}
> +#endif
> +
>  /**
>   * alloc_ordered_workqueue - allocate an ordered workqueue
>   * @fmt: printf format for the name of the workqueue
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 45320e27a16c..fea410c20b71 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -5846,6 +5846,15 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
>  	return wq;
>  }
>  EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
> +
> +void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp)
> +{
> +	fs_reclaim_acquire(gfp);
> +	lock_map_acquire(wq->lockdep_map);
> +	lock_map_release(wq->lockdep_map);
> +	fs_reclaim_release(gfp);
> +}
> +EXPORT_SYMBOL_GPL(taint_reclaim_workqueue);
>  #endif
>  
>  static bool pwq_busy(struct pool_workqueue *pwq)

