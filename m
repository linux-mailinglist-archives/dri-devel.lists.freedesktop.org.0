Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D49F92A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8610EFB0;
	Fri, 20 Dec 2024 12:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zQO1HSKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680B10EFAC;
 Fri, 20 Dec 2024 12:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC4E4wrHtwhS4WH/SmPxqbMg6d66tk9HgVUAKn7NwBxnmrFmVUeLTqnrrkXVc5A7K4THFCYqjdrIjqMtlJGRpp/3FXcGXTKyVP6PEqPKUQ3KXDEm341tVjuGQQcz6C4cpayk2c9SePZdr5x3u6BHRbLAgD3jjxC7NZms/b6dQxzrFIZ0hvfiGEfltQqqhBVhBJLXI8ld/Kis4PyUDApGeN5Xy3gPmg4noUxKRA8x1c9d3jmzdaZWWdi8UeKNunsZRgFHl08jYUVdryRplSy8sp9U6UdIeCOHYDm9ns8XKz+VwxX2XeixjAaFIlLsIvbZH1YN8TmTSyV78BJQMkA6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qBNObXalKglEC19lU61/AE/P0vwFP/X+iQHxMlDHW8=;
 b=LL4hC/TNWTSnOM6H2YtD/SmzrZCPb0E+YZFfiiOuQaHtm8oSP2cBjGxdmxbhrTqwq6jhTI0KFYHFQXE+1NI5PcdZRO4bmStB2C8QWtTeKu+zeIAMLGigNNnNm+8zsBkDdjHxb0css6wd/XSh653KUad1yoXjeGqkvQAH2NCyKU89xqDdlFproLKt4yPyHQAPHJIaw8i5+cKAmtPRXKo62naYBx+WpaxZ1A4TsHbyYOchHoGgT3s+eNYlZ48rBDh7uwnLtHZlX/FeBeVmdYGrarGx7K2LlTCpjGRf4Gf2J+aNzS2tbkj6fyx3lqHYux/nWY9dcNbc5aKczvAn+GEMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qBNObXalKglEC19lU61/AE/P0vwFP/X+iQHxMlDHW8=;
 b=zQO1HSKTX9fuTRJdYUlDSvbBM5n4NRDElkyL1uAIw9dhPo3qN51UI1u/209FDifI/+R+p1eO5m9bXgFjrWz5twh57wb8lzBhLIRfcP0UlODpRYu5Kb2VIRhwaqlshZh7DFkmtXwI0+b4IC1L7ezQkqAgKbhon9BTN4KBOEYzGng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:56:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:56:21 +0000
Message-ID: <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
Date: Fri, 20 Dec 2024 13:56:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: c36434d2-01d3-4703-1371-08dd20f5b3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjJ1ZGpHS0Y3STRvejlVMFRMenFaeE5XSW5aMlo5UVNuRDJHcjhRV3phdkFa?=
 =?utf-8?B?cUhtVnZmMWxUZmcyR0dRT2RDT0laSEN4TDFWczVCUlVnaWZnY1gzTlVrczdi?=
 =?utf-8?B?eWJ2eTZDRE5wVk5EZWNQK3dHYW4ralVHdFhzV1EzU0MwMnVXclArYlBBQWgx?=
 =?utf-8?B?VHBUbkhTY2crS0FTMWZoMkcrMmc5bjJ1SnBkcXdyNGJWYTB3NTMyMVUybEhG?=
 =?utf-8?B?R2ZDNzMyOWI2TEtNLy92ay9UQ0hGZXhhY1EydmNxcTdacVh5TFRLQ21uanBr?=
 =?utf-8?B?S0hMeDJYUWVGdWRDRlpGc2swaEkxNzB0dWQvOTVCaWc4NkRNZUh0a2hWM1l1?=
 =?utf-8?B?Qk80OFhKT1hHKzBjS1BZNFNRRjluMHUxUE1zU1VyTEJGcnE0bXNNOFl5amUx?=
 =?utf-8?B?SUJLQ0k5eGMrNWpYK0dob0oweTVTT2k1b2lESTA3cUpNS0FYZFZWTDB0NlYr?=
 =?utf-8?B?dHhWYWVmNlo3MDBFcDhMTWNxakt3TzJJZ0k5QlU1QWl2UDczc1FJTkk2VXQ0?=
 =?utf-8?B?VWRBdjJtTlJKSG1yTTBiMGM4V3JGeXcwR00vSG5lNDdHVzk3eThFMnJnNHUx?=
 =?utf-8?B?bFhBNCtiTFpPai9JOC9VZjkxa0g0ZEZCclQ2UVYxa1BtYkk3NENsNnp0VEkv?=
 =?utf-8?B?UE5QUERaeWNJaW9qdEVaZEcvZVpUZUFTS2tBT2gxVlhhdFpqMW0zaE9oNVBC?=
 =?utf-8?B?ajFSaHlaUjVTN09HZXF2cG9GUEpJaG1TU2lodXdkRlI5UDN3TW54SXAwTUNY?=
 =?utf-8?B?b1E3YW5oZkc4eWt5cWUrRDdTc2Jxczc1YzVsYmpOZy9HZEU0cWlieThEcTh2?=
 =?utf-8?B?OVFVVHVyb3AyOVFzVXlSV2JVZ21pOXZseDhqNy9UZlJrbGRLaGNNN3g0bVZT?=
 =?utf-8?B?VjJwV1ZicEdiK0lzYzNnaXBXSU41WVFkMS9vL3NXelhVUUFUNUhjRnBUcGJN?=
 =?utf-8?B?QkhQd2dGY2s0L2lOU0lvUStRY1lLUUF3Znk5Y2daRWhIRFluRTZwUHk2ajJT?=
 =?utf-8?B?TEpLSys4b0RlYW9kWXNrbjJreFpYYXlWZHdQdGJMdXZ2bHNlWHNudUtqbnAv?=
 =?utf-8?B?Q2svamtrRjhNRWRTS0ZtL2JWaW1sUm13M3IvTnZvVy9zUi9RRzdsNEp3Q0ht?=
 =?utf-8?B?TUo4RnRldHQwY205Szkvck5tc2F4dmJYSjF3bFowNy8vQVpTV2VHTjFjVUlu?=
 =?utf-8?B?MDg3Z2NKY25uTFd1SVBVK255ZExNdTU3ZENQQ1BOVmR4NXVGM0ZTditRSUdQ?=
 =?utf-8?B?bmw1MU1rb1ZabDFjZVRuZDB2UVVxc0dwVURyZkhUWFBwdXQ1azVqRmVxTDlv?=
 =?utf-8?B?NHRXeW9scXdvZTE4MG5vZ0prdUU1RytwWmFFcjZUdWIyQ2FqQVExK3RXbDNN?=
 =?utf-8?B?MWh0bnpyS3JGeklRL2JPa3NXWW8yVzhPcTZNL1dYZStuTy9kK2FTUnE1UzBX?=
 =?utf-8?B?eGpwd00wNnpMWUZQNmZ5RnJVTWhmVkJpN2lLY2FXaEx5S2hvTS9ZVTlTWDcr?=
 =?utf-8?B?bkpGMnAzQnVON3crTkswUzFXRVZHeDNRWFBnbllBUldBSG1HZGhidGR0K0lT?=
 =?utf-8?B?cVZLY3N6ZWRvUFRpSWl3ZTN5dDRlQlc1VmE2TWJuZHQzekkzUmlxMDlCU0t4?=
 =?utf-8?B?YWlJa2syZUxJcllWM3RPc2g5THVzNlBZMlVSa2RQWlhadXIrQkF5V1hiRXR4?=
 =?utf-8?B?UXNqV1o0ajhRTzY1KzB3THB5ekl5di9BRVg5T1BrWmZFUU1abzJpemk4VU5K?=
 =?utf-8?B?bERHZy81QVh6dlF5L2pxdXNXMGFGMFZONDhObFIrV0pldnZ6eVhEQ1pSK0J0?=
 =?utf-8?B?Z1RPbnBya3c0MUQ4aWI0U09WcDVtVmZhb3JEdXZPTHVlSDF0Tjc5SHBhbktz?=
 =?utf-8?Q?1hab901H3372h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRxNU91M2JhUG1aUjNLUE05Wlg3WXVYdFI0MmpRYWpjMWxFT0FlNzR1V2o4?=
 =?utf-8?B?YktkdFBQL0NHUFRkcTh6SGFkUXJEMStGdVRCQU4ya3NvVkp2UFc3MmV4NFBM?=
 =?utf-8?B?RnFYWmdTd0lBTmVBQTBEajNqbG1tV1RHZFpaYU9GQnk2SzhPYnEwd0xJdzlD?=
 =?utf-8?B?ZXljVzRQbDdQdEtzMzg4UzA0ZE9FU0IxMVlqUTk4WkgxNUpwek9Lc2RkTHRl?=
 =?utf-8?B?cUZEL25lQjFreFpCZGJySnQyWnRYQTV5MkJRKzVjQitucEFmTG1GRGFzby9P?=
 =?utf-8?B?Ulh2My9CUEN2MFYyRVE4b05OQUpCaWQ1VlZlT0RrTmNxRHNzdlcwT0duSTdq?=
 =?utf-8?B?TGxGc0VGNWxsQTg0ZGxQOUVTTlhiMGVhVVAxZUpwSDZiNVo4eHc3WkR4NE1U?=
 =?utf-8?B?S1V0V05PVkVHbjQxcUhaYnM2QWRuc1dGWTYxUjZiZVk3Zmd5TGFLQzUxVXdl?=
 =?utf-8?B?N29xc2pmVWM4UisvaGFSV1czWGpPSEZ6eEtHaDdMMzhwajNnODdjYmdjM01I?=
 =?utf-8?B?ak04NUJFVXRtaUtFNHVOSWdrejM0QkR1WEw2dEhVRUpWNmZsbGwvenZpSVEz?=
 =?utf-8?B?QlJUdllKdUNNSVp5US8wTDBFeFZvTTljaEovbksrVWdkTzBBdklwVkl0M0dm?=
 =?utf-8?B?cjdVRXBLTEthdnd2cThqZUdHaFREZmg0UVRLbVlSZktnbjdYVGVuOWNjeUxN?=
 =?utf-8?B?ZFp5bUVFQmRweDRBNk0zQVJNYkppUGRXU2xYZ0tzMTNrVGVnV0FzQnBMNzJy?=
 =?utf-8?B?eFppcWtDOTM1WjFVNTNuQTEyNEllUHF5eno5N0YyclBYUGw2dFduazlheHZ2?=
 =?utf-8?B?V0tZMENWYnpIZVV5MFRaOVNHSGxrTlY0OGVjOWU4ampqMjVzL1ZoLy9CdGZ1?=
 =?utf-8?B?V3RqL0VSaVh0UzJaUzc1VzU2ZUJEeEN2cWpqT0tPcFYwM2RpMDVSQVl1QUJ3?=
 =?utf-8?B?c1ZCVFQ5OVlWZENiS0Nib3N2Q24vZkh4bUxQc0VxN0I3UytlaWtXSjZsVndY?=
 =?utf-8?B?MVJteVNzSSt3QTI2NWNXUUhBbUtoVGZDc2duOWNpbkI4c1NKcDFxcHdPSG5N?=
 =?utf-8?B?NjEvRit3R0UwMmFpVDh5ZHhTUWlhcURFekZjb1Y2MVE5eXh0bFBYR3ArKzZP?=
 =?utf-8?B?NklFSWorekh1cU5hN0RLUE5RMmRkeVNmRWFPMDFrbDRPV1QrVXVueFNuVnVQ?=
 =?utf-8?B?aWJtUzk1V3JTUElsVmQ0ZHY1NWVPSWZUVlZRaGlEbUJWN01XR0VjYVQ0QStt?=
 =?utf-8?B?MFVLaUozaE5PdHBYaTJtQTZVWmVzRkhxZi9lbXpNSUgxSzRLb3VWM3l1WG02?=
 =?utf-8?B?aDNqK0o0NHl3QTRHV3cvdk8zc2NxUEpOM1AyREVUQlBHa3ZjdHZrWWxNU3BS?=
 =?utf-8?B?MmZkTXRBL1NVcFJPYUlEYzFiUVgvVld1VkVabW1Bd3B6cVdBWTI3WkVpV3I0?=
 =?utf-8?B?aDJ0M3QxcGowNTdjNzBMUnBkM3o2b2FpenpINzgrSWFPdWJ6aUZ0WGhFR0cx?=
 =?utf-8?B?U1lDVEp3bWVPUWt4VERQSlF4UGxpMlMvTGFMNHVaZmhrYitUU3VJalRqbE9t?=
 =?utf-8?B?dSsrK1o1Z3dEZXgrMjhVZUNsVzVxcjJWR0dPdUR4RHAyRHJPSmtxWGdTNkNu?=
 =?utf-8?B?NktLZHlYWVRwUnczVjFuWWc3djVSSHhwZlRsWWxaNHRpWDRGeWFyYmR1bml6?=
 =?utf-8?B?cUhUc1RsZkd6UGlkay9oV3hVelA5QnRXdlRVSlZrSS92ZTBxaDg4K0h3YTJ2?=
 =?utf-8?B?UEVCYjlrSy95a01oSmNaZ1ZWRmJ5WERSYnFzSldnWURnQXJXM3MzMUFkbDg1?=
 =?utf-8?B?Z2w3bGpCYWJwVHNaa3dGdFNYOFkrVGVNaUlEbGYvVjZURi8vTThGMVlEeUtP?=
 =?utf-8?B?aUhGTnYzaG5qVW5rT1hGZ3pHU2d5bG43Zkh3YUd6WW5IcWdzTnBPVHBpdnIz?=
 =?utf-8?B?dmVCbENQU2J1eUEwUUEwR3h0NU1MZ1llb0tXb1lXOVI3QnBOVzF2Nk5zU3A5?=
 =?utf-8?B?bTNKOHJmY2ZxRG0vbWxoeDZrTURSMFQ0Rzk2cmROUlRxdXJNSFJ4eEFYR2FM?=
 =?utf-8?B?LzZOUStHMFNXUHhjb2MzRlJ5NUM4SDZNMFVqTGdRU0RyckVBekVuK3RPQm1y?=
 =?utf-8?Q?nNgbt3eHNS57l+svpm/rMs+sy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36434d2-01d3-4703-1371-08dd20f5b3ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:56:21.1011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4QfEzCHUTxFdI7+aXC2trk5kbqsabquX3i5593Yd3zPIY9sYcc9d+vf4rf7aW6U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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

Am 20.12.24 um 12:31 schrieb Mika Kuoppala:
> Implement debugger vm access for userptrs.
>
> When bind is done, take ref to current task so that
> we know from which vm the address was bound. Then during
> debugger pread/pwrite we use this target task as
> parameter to access the debuggee vm with access_process_vm().
>
> This is based on suggestions from Thomas, Joonas and Simona.

Yeah that looks much saner to me. I still have a couple of comments on 
the general approach, but I'm going to write that up after my vacation.

Regards,
Christian.

>
> v2: need to add offset into vma (Dominik)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_eudebug.c  | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
>   drivers/gpu/drm/xe/xe_vm.h       | 28 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
>   4 files changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 9d87df75348b..8b29192ab110 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3074,6 +3074,19 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
>   		xe_bo_put(bo);
>   
>   		return ret;
> +	} else if (xe_vma_is_userptr(vma)) {
> +		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
> +
> +		/*
> +		 * XXX: access_remote_vm() would fit as userptr notifier has
> +		 * mm ref so we would not need to carry task ref at all.
> +		 * But access_remote_vm is not exported. access_process_vm()
> +		 * is exported so use it instead.
> +		 */
> +		return access_process_vm(userptr->eudebug.task,
> +					 xe_vma_userptr(vma) + offset_in_vma,
> +					 buf, bytes,
> +					 write ? FOLL_WRITE : 0);
>   	}
>   
>   	return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1cb21325d8dd..235ae2db5188 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -999,6 +999,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   			}
>   
>   			userptr->notifier_seq = LONG_MAX;
> +
> +			xe_eudebug_track_userptr_task(userptr);
>   		}
>   
>   		xe_vm_get(vm);
> @@ -1023,6 +1025,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>   		if (userptr->sg)
>   			xe_hmm_userptr_free_sg(uvma);
>   
> +		xe_eudebug_untrack_userptr_task(userptr);
> +
>   		/*
>   		 * Since userptr pages are not pinned, we can't remove
>   		 * the notifer until we're sure the GPU is not accessing
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..4334cf2b0d9d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -274,9 +274,35 @@ static inline void vm_dbg(const struct drm_device *dev,
>   			  const char *format, ...)
>   { /* noop */ }
>   #endif
> -#endif
>   
>   struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
> +{
> +	/*
> +	 * We could use the mm which is on notifier. But
> +	 * the access_remote_vm() is not exported. Thus
> +	 * we get reference to task for access_process_vm()
> +	 */
> +	userptr->eudebug.task = get_task_struct(current);
> +}
> +
> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
> +{
> +	put_task_struct(userptr->eudebug.task);
> +}
> +#else
> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
> +{
> +}
> +
> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
> +{
> +}
> +#endif /* CONFIG_DRM_XE_EUDEBUG */
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 557b047ebdd7..26176ccbcbbc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -68,6 +68,12 @@ struct xe_userptr {
>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>   	u32 divisor;
>   #endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +	struct {
> +		struct task_struct *task;
> +	} eudebug;
> +#endif
>   };
>   
>   struct xe_vma {

