Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6AA91F7A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9DC10EB20;
	Thu, 17 Apr 2025 14:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bnQWCht8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0610E0F3;
 Thu, 17 Apr 2025 14:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVpiUqRis+qMW4rGRKxrzUCMVjGfJL/4yV8oBC6p0CWA3vCVQMf8g10/+6MciQTJkuxPcLBqtSZcb4gRNfFgw+4fXwTzZPcPiMo+zRfmi9Re14dxGXQgjjkD6Cz852ChSK3DIDa8FQVcK40tg2OSEN6PEsgnOctz0r8MJgQIZB0sp+YuqcJL01Y8MPWI+UOPGJSLT6HvZCyvEtfqi2mpti6EdutzxRTVPbhREstxaz2RvhhhgmaSpNDM3MvDn2Eh9YvIp4jH2OTVWPFckOqLI59uMyBAtgcyOrcj6wvEF3Yk7CxkudXYKQZfSXAzQMZf2J0AEhT/m4V0eCprSBstaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUpZRzHlH2ftRNIVbCgfeTKAQGXnmTVs6Z8gR4qtX8I=;
 b=SE1yUIVN2Psg//gXKe5YZwY6BgrK+swC72I/vq1VOoqHTQ7ntJA0HfuCmskaMlSfvPxTkczWlgqq9wNn0zf+jvp5tBCK+g7atYBXwl0PChqfGomG80zyhQ/XLNhHzNGRAwi6TI8z80D0Ix7G913BG/pTA1S1Q/bLc3tesP3fpt+Z6sT/+4olIChHDHm2s/eT7RQP8YX2K4qJmJYQpVazF5qxzqgBayckrTWvMtPLRl/GPmWQ+S0NdUkqZGsbtIspHcatVDi7vIJmGSAh0Yr9urPtrP1bxmYMDJ0/l+/+3/1QEgOwgKHwubszqHKZ3miZ8jEj9MmnVh7qJHKCQwVwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUpZRzHlH2ftRNIVbCgfeTKAQGXnmTVs6Z8gR4qtX8I=;
 b=bnQWCht8ye3GaQie4w/wPefBmH6shQfpcFEBXHm6DUgLiIgb9gNOb3Lcue3lAz6fq7eYFxml6EOeUhsQQUUxZmub9ldIgTdHmNGJO/AlxAyBCTF/toVORdU7OV5YJTf4xS85un5KTIc+IlqZs2A7sbx6nKk+e/3ZCh5oL8yfH6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CH3PR12MB8535.namprd12.prod.outlook.com (2603:10b6:610:160::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 14:23:30 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 14:23:30 +0000
Message-ID: <80f1afa3-231d-4185-84f3-20417e08d821@amd.com>
Date: Thu, 17 Apr 2025 19:53:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/5] drm: add drm_file_err function to add process info
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
 <ea409b34-6bb8-421c-b768-cfc71f40ff43@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <ea409b34-6bb8-421c-b768-cfc71f40ff43@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CH3PR12MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: e3835b4a-82dd-4500-983a-08dd7dbb6d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUVSN3NkL3hrT3ZCMFVmbk5mS1Z0aFdlK0RQbW0vZ25RdGM1ZjEycFpTb0tz?=
 =?utf-8?B?QXpLSmlGZVhzcUJVNzJCT2FzUVJabDMyWWJjSGd0ZFJGSzByWndsczlsRFRi?=
 =?utf-8?B?VDVrRDg3a1ppTjQrN1JBWFRZaXpyNzRCSTFtZmZwOTR5cG9heXNDeWF0Wms4?=
 =?utf-8?B?aW9TMHpDV3dEazFWMGhLTHMzMlMrTm1BbVBId2IvQjcvVFlpL0lycDNQWWhm?=
 =?utf-8?B?bkJzbi9Xb01CYmpVZlovYkJDdk9ISzBhbmRPeFdEM0gxOE1mZ1IzeHFWQUNw?=
 =?utf-8?B?UjZSS1NQdDRGbnQ0US9MYmFucWJjTkxnMUlJNldTWVV5bW9CZHFuMmxPSWJR?=
 =?utf-8?B?MFQ3UDRkeTJGZURPVGpuY3FWNDNpUDQ0b0lFV21rRVBHTTFlV3VXeGFvZGFO?=
 =?utf-8?B?alYrYmd6VTI4ZjN1V0MyZG1rbXU0b3lZVGJjZS8rWDhKMms2K2tOWEE1eVlL?=
 =?utf-8?B?REFycTd2NkFrOVkwc0dlR29scWZjTnVvbGZ5MGppamtYOUdEQlJtS1QyNHBu?=
 =?utf-8?B?RlE4TjBrVnc5cXJGMUlxemdRTFpDUzV6ampTak91ZDlBK2ljdWp2Sm5LSTZF?=
 =?utf-8?B?WnJwTjRXVDBLc1Z4djlYK2lMeEo4UnBFSDc3UldSc3VZZXFEZi92aHROaW05?=
 =?utf-8?B?YW1CVTYvQTBZeklkVTBJN2pnZC9wK1lqVjVmbkxJYWZGamNhTTc2QmFVVHcv?=
 =?utf-8?B?T1N6cEZxSVJSeFJzVUZ4QjIyamErdHpsZ2hsbjBqczYxc2NLWU1MQ3JENlBZ?=
 =?utf-8?B?bmNueVZxc1BGcWlWT1ZpYW9pUnhjU1JwMVB6Y3FzQ2lxQTkybFBMSG1EeHIy?=
 =?utf-8?B?SXdSdUhJak5WZVhHNXBaVTIyVEZLQU80WTV1SHRCbzVsMDlKNGpyMGlRckor?=
 =?utf-8?B?QlBBaWpWN3FCeFlXYzRaZVdRaUhEQ21WRzBuUm5DNm9vWmRaREtmdWZERVhT?=
 =?utf-8?B?TEVhK1c5b3VZNXlqNjl2NDRUYTZBbkdaampSdTQwSVJTeHdUTElIRGJHbE1H?=
 =?utf-8?B?eHpIc0VyQUNwUnhmVmorZzd6Q1lNOWp0M3dnZHE5cWppU2RiVkZLRFFGanRt?=
 =?utf-8?B?bTcxVzZxM1lBZWpGSHB5WE1rYUxZWjVQYzArN1BPOXJqcE5aWUJsQUVFZjRD?=
 =?utf-8?B?aUdHOWlBZklmYlQ1ZnUrbURmRzUwKzBtRE9MckZYL1YxckRxa29VbXJGNUo1?=
 =?utf-8?B?T01jUzNyY0JLaGNrdW96MmlBekl0UU04MW5RM0Z6RW9lQTB4amE1azFxWXpy?=
 =?utf-8?B?MW1vQTFlWEFqTWFGa1VJUE9jUVlGQUxUWkFJai9aWjZXT0gvZ1ZwbXZJOTRh?=
 =?utf-8?B?dmlNMm1xSzRWLzhDWnhYVFZBdTBZaW1wTkxJVVd3QUdlN1AxVFFoZVIzRHY5?=
 =?utf-8?B?d2ZPLzYzUDIyekRLOUUrTk5JUHhiZWtjT212a21pNUY2QmFaaGVaQzRaOFlS?=
 =?utf-8?B?QW1LOEdOVmQ2Yjd4M1lzNnRJcFcvN2RiaW9MSHZMbU9TaTFUc21WTzhvVUgv?=
 =?utf-8?B?V1YxYWV0TytXaXpjWWtPRGZzNzRhbkpWT296ZitZbGNwNkxGQmd2ZUhpZ3ZS?=
 =?utf-8?B?bWZyeVZBMWtRZEh5Z3I0L3NQa2JiU3hkYlZUcXBuOFFjTmp4dlVNUGpqMVlG?=
 =?utf-8?B?UWZzSzJ4NGRDRUF2Vi8xTGg4TUhHUWxJZ2xKUW5OUVlGV2dXdWpQL2lOWkJF?=
 =?utf-8?B?SUZRS3ZDVUlyNW40VjB2a3IyR05oYUlJUzdodmIxTk45WXZBQ0RnNW1uSUVl?=
 =?utf-8?B?UVVXWjZnYks3eE4xYytBWmhkQU95c24wM1lZSXVNakV6cmpMcG1nb2o2SFd1?=
 =?utf-8?B?VXQxQlVjWVVQSWh4UEx5ank3OVUrOFpWUWNSSFVHbHBNalVIUU9rVUFnTGRB?=
 =?utf-8?B?cVlVTlZTWlVjejQyak1ZV01TMGgzcmZZMGtQaVVaR0RWQWR1V2hzcmxnWXlZ?=
 =?utf-8?Q?1ViEWWSMuG4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnJhbHBsTGRpVS9lUzRVeTRSQzExS1phMEZURVdmd2FLN1Z2MkozY0htb1Mx?=
 =?utf-8?B?cmFFeXorWkVMOThYb2hZK2RHajhMM2prelZOMCtFVFg5MjBoT0paVkp2ZzI0?=
 =?utf-8?B?SG9IeTZnNkZvbFZDblF0N01Nb1JTd1I5S2lFVjRuaEM1TEQ3VWJ4V1ZLU0F6?=
 =?utf-8?B?cmFmb3pubzhBRGowN3BtWm5xWmJFaWw1ZGtzdEZXMWpCakNoajVxcXhlZS9l?=
 =?utf-8?B?K1NVVWxGbzJFcVZoOThVUzc4RkxzVlJMMHRzcWlyelp4ek1NdjJNUVZkUW1p?=
 =?utf-8?B?dm9sNnRVbVZaay9JZTNYRW5SdTA0R1dDcDV2NTMxU2VYZVlPQm5CVVZNcHJD?=
 =?utf-8?B?TVhMMmFKSytkYjM5cy9Ub0VJMm9rYlNrUDR5bGhlZTNWWXNSWlcySmVvOGt1?=
 =?utf-8?B?clp5a3pNazRGdXNaQ3RIbXJNYVM4Q0ZwYnhKZmZoVmFJeDJuY2lVNHJXTTlw?=
 =?utf-8?B?U2JBc2V1WDJJSXZDSGtPMHpKUmZieXA0dW5OeGtuRG9IdU5nR3p4WmZFQ3BK?=
 =?utf-8?B?Tml4NFlHQ3VzSXhDbFdNOC93WmNZL3hXZ1RWY3F6emtTemtXZ1hBUFVFc1U5?=
 =?utf-8?B?eCtRR24yS1UwOUNoSXQ4bWtwQzhCeTc2TEFFVUt1YlpPZTRRUFhlUWlBVmJ3?=
 =?utf-8?B?bzE0Qk1WVVNxckFKZWNrYlR4NmNMMEFoMWdQRnV4eWlBRE5tYVNFajZqSGs3?=
 =?utf-8?B?R3ZveFFGSEN0Tk9LdFdYdFdGMHo1T21ackdWa3EyRTlKdUk3UHhobXN5SFFa?=
 =?utf-8?B?ZjRBUEt2WGE3WmlhVzFHL0h5VlVlYktkUVlFcDRHMmFyN3N6T05jK0l1TmpS?=
 =?utf-8?B?NURxSVdtVXRmNFJPQTcvMzFCL3ZpcXdFTEJMR04wZ2ozM08wNE00elpLcTlF?=
 =?utf-8?B?RzMwand6QUh1THFhRTRiRDgwYzNyOVhsTDc4bVpBNTdYMTFGYThIWHpreklD?=
 =?utf-8?B?S1NGODJRendvU0FISFkzVXE5VFhyQU9zSHJRK3ZjZnQydFE3ZmZBWmtpWnlM?=
 =?utf-8?B?bVVvQVZpMGFHZDk4NUdYeEdDZURHNnZXVHB5Z3lwaVdjY0JxVEpFalJoNkRS?=
 =?utf-8?B?VlkzK09WeXVPVVQ3VXpSK0RzRHJEa2Y2V1d3cGt4Ty9aOXhZcGFKQXgvOTNv?=
 =?utf-8?B?d3VRZTNPOC80NFBXUGhjWDdpc0F4WVJDVjRPRlUyVGZ2SGNBRnI3WmZxaWpT?=
 =?utf-8?B?YTkvVWkzTDREelhaL3ZZK05nMGhvbG90TEp6anIxbWlwVmpyTmQrc0pNLzZ5?=
 =?utf-8?B?a1FaWDZKWVZuRWp4ZWVMUTZ4V2VJT2gwZGllcTVlVzQ4ZnB3VGNxdmVmS0E0?=
 =?utf-8?B?SjlLS1hRR1QyT0hEQ3BlMDVXYmNXYnduN0dhMlE2SmtsMzlQM2NoMkpvclRG?=
 =?utf-8?B?dFFvUzY3bXZkb21TU3ZJd2VmbTd4ZjZBVWlpK0RPRXVYUllEZXUvVW1TT2xx?=
 =?utf-8?B?YzZ0ZVhNY1QvZThjZUxTa1NkbmdaTVgxdU1qcUhvK2pvd1VUa1JHTUk3Qnpj?=
 =?utf-8?B?cTg3cTZGaTc2RkU3NXJqLy9JZWd4bkdrdWV3S3dCQS9PeXQyNGRoNWFEUWhC?=
 =?utf-8?B?bm56K1VaY04xQ2g3ZW82aHBCK0ptUzltVmJ2MDBwTVJOUXdSeHgwb1F1YXVp?=
 =?utf-8?B?N0NVTTFCcVVOeWFiUWdzTlgreHZUMUVvSHdudG5wMnpyTjYyR1lrS2JraFQx?=
 =?utf-8?B?Visxc281dGYrdUR4RFhhdnM1c011MlU4eTdKM2ZHbkJobTVjSXNaWlkxNU1N?=
 =?utf-8?B?d29oZ1pad29iYlNPbGxHK3IwUW96QlZselVJMTZyY3RFTnFMSDdwRTV3RzEx?=
 =?utf-8?B?eHZNdFc4R0FQZk5KbE41NGhCVGVQS28vMmdoUzRwbVgzT0pmUkNRbzdndnB6?=
 =?utf-8?B?QlNjUnlPOHhHaEdHbkV5MGVZYzJEa2t1RU5VZWI2L3Jpd0hjamFjWm5QRCtJ?=
 =?utf-8?B?OHpBTWtmTE1Pb0R2dVlrZGhLK041bE5rU09qWk01TVRrNzZQck1Hc0VDNmFC?=
 =?utf-8?B?dCtqRkkzY2RwT0JGSUtld1VJQ0p6aG5idGtrb1h6T0xOaGR3RnZZVmp0VjJR?=
 =?utf-8?B?Z281TEpRZkZBdk0zaTMzNVlOWFpkcjFGSU1OSFYrQWRvNmpQN1VReFR4UWNS?=
 =?utf-8?Q?+AY7hu7EivcGPZViLJaEqZbeu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3835b4a-82dd-4500-983a-08dd7dbb6d30
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:23:30.3871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uw7HGFlbDW7cqV8kbCocYlc31HIMGipoHzXzfjUiS5LO24wEws4/X7hpj6uzfLSHHoZgvzebauPUvIiejGgqCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8535
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


On 4/17/2025 7:04 PM, Tvrtko Ursulin wrote:
>
> On 17/04/2025 13:31, Sunil Khatri wrote:
>> Add a drm helper function which append the process information for
>
> appends
Noted
>
>> the drm_file over drm_err formated output.
>
> formatted
'Noted
>
>> v5: change to macro from function (Christian Koenig)
>>      add helper functions for lock/unlock (Christian Koenig)
>>
>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>      remove drm_print.h
>>
>> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  3 +++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c299cd94d3f7..7e64d84d4e2d 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct 
>> file *f)
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>   +/**
>> + * drm_file_err - Fill info string with process name and pid
>
> Update to something like:
>
> drm_file_err - Log error message associated with a drm_file client
>
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: prinf() like format string
>
> printf
>
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>
> Also stale but it may be okay to drop altogether since short 
> description feels enough for a logging helper.
>
>> + */
>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>> +{
>> +    struct task_struct *task;
>> +    struct pid *pid;
>> +    struct drm_device *dev = file_priv->minor->dev;
>> +    va_list args;
>> +    struct va_format vaf;
>
> You could tidy the declaration block a bit, usually ordering from 
> longer to narrower lines for readability but up to you.
Sure
>> +
>> +    va_start(args, fmt);
>> +    vaf.fmt = fmt;
>> +    vaf.va = &args;
>> +
>> +    mutex_lock(&file_priv->client_name_lock);
>> +    rcu_read_lock();
>> +    pid = rcu_dereference(file_priv->pid);
>> +    task = pid_task(pid, PIDTYPE_TGID);
>> +
>> +    drm_err(dev, "comm: %s pid: %d client: %s %pV", task ? 
>> task->comm : "",
>> +        task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
>> +
>
> Hm is task->pid the tid or tgid? Could be the same thing due getting 
> PIDTYPE_GID.. PID namespaces are always endlessly confusing to me 
> since I don't work in that area often enough.
>
There are two parameters in task_struct one is pid and tgid and both are 
different if i am not wrong. In case of multi thread pid and tgid is 
different if its one thread i guess in that case pid and tgid are same 
but even i am not 100% sure.
> And I have some bikeshedding ideas for the format, like maybe 
> consolidating with naming used in drm_clients_info() and adding some 
> separator between the client data and the log message that follows. Like:
>
> "Client %s[%d] (%s): %pV",
> task ? task->comm : "<unknown>",
> pid_nr(pid),
> file_priv->client_name ?: "<unset>",
> ...
Sure
>
> And even if I am a bit unsure about the "<unknown>", I think it 
> doesn't harm to be consistent. It is fine as is though, so you decide 
> if you want to change anything or not.
>
> If you could please double check task->pid is indeed definitely TGID:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Regards,
>
> Tvrtko
>
>> +    va_end(args);
>> +    rcu_read_unlock();
>> +    mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +EXPORT_SYMBOL(drm_file_err);
>> +
>>   /**
>>    * mock_drm_getfile - Create a new struct file for the drm device
>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..5c3b2aa3e69d 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const 
>> struct drm_file *file_priv)
>>       return file_priv->minor->type == DRM_MINOR_ACCEL;
>>   }
>>   +__printf(2, 3)
>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
>> +
>>   void drm_file_update_pid(struct drm_file *);
>>     struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, 
>> unsigned int minor_id);
>
