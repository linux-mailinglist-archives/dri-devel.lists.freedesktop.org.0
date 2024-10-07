Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE7993570
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E748E10E172;
	Mon,  7 Oct 2024 17:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UA6pDsBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043B10E172
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blS3VMIMMPv1wY42+4YecnrHZvk4KBlsR4L/WiMY4rdjuzRUCwo2CgwsLumvfZiDIhzwF0OW/Y8QXoF3WysuJ2ALAwNndyY0kz9bYKjRoMj2LB+GYKbz4WbKr6OVjIoWWpISNZ2Smz0qdhlL6ebyFlSNYGJVjfOyqYEJ99RSIH5dTahXKnt/KU6XuBSd1SVU7evIW17pFrJH0qeEOqvaBsnpLxEkNCoYiA36CcHFY3k2kXENHmr6FmAfO1ASCi1+LHRnV7bHLBXNCjZpC2MiKhZgZE6t3/ftDz+S0P0RSB/4lfkjVnotZ4VYS2JR3zn0Bs5n7/4aiM0mOrJYJ4yZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji5wqCMxeSvzxcgRXdNkgH1VdHU9jf1U0QE+zFLTX/g=;
 b=FQeSGd2cLqk9q4QAE3nrHBhuWpwCpgx/XtokM7E1VZvPJOnuiu6LkpXvRwGsQzKp2s5ofoXDJ3C6hZkgd0l7YU6vQqt+zb09JZVbbAXUVxpNWG4OWW2czr4vY/xf+XkoaouQZv8ExOQMoXtTgDCWMRaFBf6zvB79WIscoi0tHlGZuh/K+izZfSA0CePd4Grp8rGOEGlQQnMLRymyPWENphrwYTyK1oOXjQ4/K4YcbZmRd7QlqPZcs/qM9hXcUSFutV3QzvlBD3KFlYx4N9PKdvp6UCECsmrbVHxU7lkjrGaZvLMO5Thhqcnq+a47pADiZwZJIdBTUWmHxmqfyGIjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji5wqCMxeSvzxcgRXdNkgH1VdHU9jf1U0QE+zFLTX/g=;
 b=UA6pDsBO+f2wCqL1cfcMQg5e9+6PY7bFXBwn40hrwWPd1BuXLZPHGI0ocwYbEHPTzzmFP9SAzJdYcUQUWxQwcUDXvGbL/h4bdnAWLjDued+8mOD+sUu49BBSkZZdgsptj1/cfVpXHSMiWBMWHIjD4RSIadSBdjmIpCs7P+YJRBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Mon, 7 Oct 2024 17:54:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 17:54:30 +0000
Message-ID: <56bce835-2f63-4bbf-8a16-44247e6314b7@amd.com>
Date: Mon, 7 Oct 2024 19:54:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: gregkh@linuxfoundation.org, airlied@gmail.com, alexander.deucher@amd.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com,
 matthew.brost@intel.com, pstanner@redhat.com, tvrtko.ursulin@igalia.com
Cc: stable-commits@vger.kernel.org
References: <2024100752-shaking-sycamore-3cc4@gregkh>
 <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
Content-Language: en-US
In-Reply-To: <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c6da8d-76a8-4b8e-409a-08dce6f917cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzgwODUybVNYRkpEa1QvZElUdHhWdm5CbkZZeU5iYXNuMU9lU0lzaGR3VlA4?=
 =?utf-8?B?Wmd3NWx4NkhuN20yNG1iMUNLM0tzY2J5TXUydGZOWk01bjBZYUhuYm43VEpI?=
 =?utf-8?B?b09zOG9CMUhHaytnMk5xa3RiSUtOOGk3cDc1ZFZzeU9NM3ZsamVaK293aGgy?=
 =?utf-8?B?b1RwaWpKMjM4RE5LT09BcktTa1dRS0krWG1tK3cvWnl3VHRWczl2OVA5Nm81?=
 =?utf-8?B?Qm5NcHdiQnp6dnR0OVViSjhWQmFXYWFyWDJNdndKRmpqMWFGZFROelZ4cmVH?=
 =?utf-8?B?a2VnMmpSNE5IZWN1VE0xOTViUU5FajBLZlRBTDRQbFgwaFovWk9McGlvR0xW?=
 =?utf-8?B?UnJ3LzFsalA5L081Y3ozY3VjM0VjVzN6QUd1RmFZd245TVE5dkYwOTk3STV3?=
 =?utf-8?B?Wkpkdlg3blVVMC82YmJWZnVuNHNFUnlFWHlML1Rhb2I4WVE2ZGt3bzFUaEI0?=
 =?utf-8?B?YlBMbHI0dUR4enRWV29NdzBwNW96S3UrUDY5QkxCeXlRZzEreDArTzcxVU1S?=
 =?utf-8?B?RUhMRTdZYXc2ekNaQ2pLa3JYS28wZEZFZGhtNnBrL2VRVUgwMGZOdHNRWTlN?=
 =?utf-8?B?elV1clBBMWJWNE9uVElXWERhSFM4S2VxMGtCQW1vY1lDNm9OMnBLTFhJSC9s?=
 =?utf-8?B?ZU55UElabGpqVVdMUktCQ1BES2ZBbllLanVjNjRTRk53VCt4eXFLZ2hoQ01h?=
 =?utf-8?B?ZGdGMGdBeHBNbXhqQXQxcmJacHI4ajlNM2IyRm1VUDNmUVZ2ZlVRVlVmc2Fy?=
 =?utf-8?B?YXNCU1V6a0tneGtUcTQ2c3hhNjZvYWEvajZyZnhleUkrUktrTE9GZHVLUUNm?=
 =?utf-8?B?dit5ZVJWcnhqMHh0ZUU2UVlsblppRWV0Y0dmOWlwNWxyU2V4QkdTcWZNQlQ1?=
 =?utf-8?B?ZnZXMVVCSDE1YTRYTFZNZVg4SFJXbzJGaHJodkxVc0lxUkJBTXpMVGVZMTRz?=
 =?utf-8?B?WmRxSHV1a2c4MFRDREdZbm9JVmdNZTJUNFo5YlEydWZqQW1KNmcwcFZPS0hS?=
 =?utf-8?B?RmtOZlZJbm1yV0hBUzROOWxTcU5uc0VaeVVDSlQyd2MrdWRUWFVsTWZ4UGt5?=
 =?utf-8?B?NWVTdVBxWHJ5VWtQVFhMNTJsQmFReWlsUkQrb2J5bFc2eXBFZERHbGhhY25U?=
 =?utf-8?B?bWZrazk4R2hIZlY4Y3pqRzlSbkRHSzkxbGU1SW9hZFV2cEdpdXJFdTJWVnpS?=
 =?utf-8?B?TjBKSDJObFpUeTVYNGJReFRRc1VtbGxIY1hIS25MblRKanZDSVBXakxnV0dh?=
 =?utf-8?B?RWsxSGNGNmFucGZtRGFaQ3loZzlscGhvak5ERnJ1RTR4aEF4dUd4UUtRb29O?=
 =?utf-8?B?bWlGQ0VNUXVyd3lqMnZxNFZQcFB6dWlQeENxYXl1T3ZIbTBiMzBnRjZhWTl1?=
 =?utf-8?B?MUUzME9HSDJzNVNvZ3RxRUNOak5FRy9QMVdlTm9sKzZIRGRpMDZRZkROVmhm?=
 =?utf-8?B?MFpNRmRoZkpjTkxNN2ZKK1NycjIxTnk0a1pDaGF5TXE2NXZLZ0JXcDVOdStr?=
 =?utf-8?B?ZGd1b1djenJtS01NUzM0c3B5VGxkQzdzb1kvMmRaTHpRdHBWU2VweGJvN3Ns?=
 =?utf-8?B?VlRrdktaaEUzM1ZNU3R0YVhmSzk5YmxFdUw0L2MrOXZXQm5XcWx0YWFXT3NN?=
 =?utf-8?Q?mKWDsM7uQCsWTBOhUsRTI1+iFFnM4D1jE3bsMRaTyrd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxIWTdEakk1d3dXZXJPdXIvYjlieVBVWS82RW1EZzVQcXN0dWlDMDRZQjE5?=
 =?utf-8?B?amh1VEdwWDVQSWV1Zmx1V2dNc3Z0R2tJR3pmd3p3SmZiOGVpVzNEWnBIaUhC?=
 =?utf-8?B?OUtDbk9DMzNiL0hpY2pIUG12cVhHbGYwSi9zbHphWEM3YU8yN2FFWm9jbDFL?=
 =?utf-8?B?eWkvd3I3Z3haNkx2b21KbndjdytjWXM1Q0duSUZjcHlBcmFneWVETnl3UGxu?=
 =?utf-8?B?RXBCTzl2UXhWVmJKdFVtS2IvQkZ3NStnNC9BbmZKNXQwNEJDYWRKR2E4OGRa?=
 =?utf-8?B?RWdsaEVYTWU1U2FYVEtyditzbjN0RDJjdkk5K2lvK0xXRmR6dC8zR0tocWNS?=
 =?utf-8?B?Z0tjNTJkNWZwNC9jbThnYnhGNkJSTU9ra3JmRFdaR2VCbFRzMXBWVndLMjQ3?=
 =?utf-8?B?bTVUWW5XekJnSnJHcnVZczgzZjg0QlRwazdtMnh2SXczTm9ROHBVdU1OcVdh?=
 =?utf-8?B?eld6TE5aVXZROVB0YkhDUmtRQmdVSHJWS2RUWTdBVXlZR20ralI3VXdTUFNh?=
 =?utf-8?B?NzNRZXZHakpMck1rY1k4U0ZsbE1hN2NXVkZ1ZHp4ZnJEUlRXSzFnVDl5d040?=
 =?utf-8?B?SGJnRnhRNzZnTHUxZG1uZEhWSDlQbUFEZnRMVGlRTXFXWWMxYVRDLzZyZW5m?=
 =?utf-8?B?aExKbzhoWWx0a2EwOEhIN3B4ajZlWEluSXI5RkIyNGpITFNIUDZwVlExNlc0?=
 =?utf-8?B?MzZidlpWZHg5ZDR2WG9lZllMaDV3Rkt6bW5LdUVmdmxJTUJpWUhoVXNZOWxq?=
 =?utf-8?B?M3Y3WkphTXdxNlh3TFB3VWUzN2t6eFNUTFl0b2xzRFBWWndxajliWmY5WHN6?=
 =?utf-8?B?WkN1OEdRczUzaUpKdXhJc3p0ckxtK2pSajNoVnhIdFRneCtvZmxTWStPZytw?=
 =?utf-8?B?NkxFZ2lMRWgvTERzWG81eUNJbElGUGJ1UTlFYjBSN2YwQXJseUNSZUhQVm1Z?=
 =?utf-8?B?eGFaTG9TRzBUNENVbjZKWmxXazRGT0lvKzRIeEE1Wk9IOVZ1dVVid0licU50?=
 =?utf-8?B?S1g3K0UyamFTNHZwSy80a0VOOWFiWFBXeGdKdGU1ZG04LzhEcHU2bmlNZS9n?=
 =?utf-8?B?amIyVzFRM3Rkd1hGY0tIWjFCOGxraHp3eG1zc1Z3TENGU0Q0MGxMYm5yUnI1?=
 =?utf-8?B?YU8yN0FHUXJMOXJvRllUek15TXB5cFhqNUc3WGFEOVprUUdKbG1jTVJXZk1X?=
 =?utf-8?B?THArQXNPdGZRYjlDU1VPTzV5K3RPY0dIVmRnc08xUVRHWGV4QUVTMFAxMTAx?=
 =?utf-8?B?aENVbjdaakJ3cmlVNlpnQXowM09Pd1o3aHBYLzkrKzU4bDVQOXJPMkIxOE5R?=
 =?utf-8?B?Qm9xWE5pdHFEdXBGczdla0dxK0lXUFU2MCtTaVY1bHRxY2pVWUJ1Y2ZVNmJB?=
 =?utf-8?B?eW1Kd0FNYWpYbHNMbHBYejdHL25FRDVhUmo4Z2RVUjhzM2tLRzFiL2RHZ2x0?=
 =?utf-8?B?VHBKd0RBbDNnZEJZV0lqdjNwbnhGQlYyRFYreUdIZ1pwbmRsNGhsaFRMT29z?=
 =?utf-8?B?UlhybVd6dUNXMnR2U3V3QXRXbERZTHFHTjJUSy95dnJOMFhyU1VNaHF4aS9F?=
 =?utf-8?B?c3o5S0hkdUJVdG95OGplWTBCWERzSHpsNUQ4VEdCOWEra3ZCeHp4RHV1MlFw?=
 =?utf-8?B?ZEpvL28yeE4rMlEwR2VFYzhHcVZmeERTTExkanJDb09Fa0RMRnlIM21IbWJ0?=
 =?utf-8?B?TUJzcnZxOW5KM0t5Z3JIWDVPejh1Uzl6cXBlTnhwMlhEbGZMRERtOUw3bDVO?=
 =?utf-8?B?QnVPeUNOalVoSURYTG5pc2RBS3Z1TndUdmgxdzMxOWtadFMvcnRCc2s0N1p2?=
 =?utf-8?B?VHZLZDF4YUs5R2xXVVNTVzBFYnZRKzh5amdWT1dyckRoeUpZR1kycHIyNEpP?=
 =?utf-8?B?NFJBcGlhVngvblkwSVdwNkc1YncrdmMvR3kyZ1JKTVBKRnFiNWNOMy83WDhI?=
 =?utf-8?B?VjQ1SXlzMXBORk9ONU9rVHE3aElmM2hiV0VURXRoMkFPL2xwcVNuNU9YVXd4?=
 =?utf-8?B?M2RKSFVHOStwN1FFWkdPaTVTRVRBME1vQW5yU0lqQlVyOEVNTzFDbHEvRVdk?=
 =?utf-8?B?YU1jcE5rUFlIUXlzdkZDcDlxZXQ0Zlp5S0NjTFZIbTV4RGtHS1M0ck00dTJs?=
 =?utf-8?Q?TfiRaHaRNmGRKOhO2eMNyTc3W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c6da8d-76a8-4b8e-409a-08dce6f917cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 17:54:30.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMsg+vxZqcmpOE2gBVetqehiMBswMEPLJbQ34rAoJmc7j+a3K2S0l7uGDVp0/2L3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837
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

Or wait a second with that.

Tvrtko which one was the patch we had to revert?

Regards,
Christian.

Am 07.10.24 um 19:53 schrieb Christian König:
> Hi Greg,
>
> please drop this patch from all backports. It turned out to be broken 
> and the old handling has been restored by a revert.
>
> Sorry for the noise. The revert should show up in Linus tree by the 
> end of the week.
>
> Regards,
> Christian.
>
> Am 07.10.24 um 19:50 schrieb gregkh@linuxfoundation.org:
>> This is a note to let you know that I've just added the patch titled
>>
>>      drm/sched: Always wake up correct scheduler in 
>> drm_sched_entity_push_job
>>
>> to the 6.10-stable tree which can be found at:
>> http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
>>
>> The filename of the patch is:
>> drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
>> and it can be found in the queue-6.10 subdirectory.
>>
>> If you, or anyone else, feels it should not be added to the stable tree,
>> please let <stable@vger.kernel.org> know about it.
>>
>>
>>  From cbc8764e29c2318229261a679b2aafd0f9072885 Mon Sep 17 00:00:00 2001
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Date: Tue, 24 Sep 2024 11:19:08 +0100
>> Subject: drm/sched: Always wake up correct scheduler in 
>> drm_sched_entity_push_job
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> commit cbc8764e29c2318229261a679b2aafd0f9072885 upstream.
>>
>> Since drm_sched_entity_modify_sched() can modify the entities run queue,
>> lets make sure to only dereference the pointer once so both adding and
>> waking up are guaranteed to be consistent.
>>
>> Alternative of moving the spin_unlock to after the wake up would for now
>> be more problematic since the same lock is taken inside
>> drm_sched_rq_update_fifo().
>>
>> v2:
>>   * Improve commit message. (Philipp)
>>   * Cache the scheduler pointer directly. (Christian)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify 
>> sched list")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.7+
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Link: 
>> https://patchwork.freedesktop.org/patch/msgid/20240924101914.2713-3-tursulin@igalia.com
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |   10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct dr
>>         /* first job wakes up scheduler */
>>       if (first) {
>> +        struct drm_gpu_scheduler *sched;
>> +        struct drm_sched_rq *rq;
>> +
>>           /* Add the entity to the run queue */
>>           spin_lock(&entity->rq_lock);
>>           if (entity->stopped) {
>> @@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct dr
>>               return;
>>           }
>>   -        drm_sched_rq_add_entity(entity->rq, entity);
>> +        rq = entity->rq;
>> +        sched = rq->sched;
>> +
>> +        drm_sched_rq_add_entity(rq, entity);
>>           spin_unlock(&entity->rq_lock);
>>             if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>               drm_sched_rq_update_fifo(entity, submit_ts);
>>   -        drm_sched_wakeup(entity->rq->sched);
>> +        drm_sched_wakeup(sched);
>>       }
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>>
>>
>> Patches currently in stable-queue which might be from 
>> tvrtko.ursulin@igalia.com are
>>
>> queue-6.10/drm-sched-always-increment-correct-scheduler-score.patch
>> queue-6.10/drm-v3d-prevent-out-of-bounds-access-in-performance-query-extensions.patch 
>>
>> queue-6.10/drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch 
>>
>> queue-6.10/drm-sched-add-locking-to-drm_sched_entity_modify_sched.patch
>

