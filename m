Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF097A70DDB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 01:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA82610E63A;
	Wed, 26 Mar 2025 00:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FIiY3CQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC9010E62A;
 Wed, 26 Mar 2025 00:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uK7rYMxUQ+JU7QRelM4c28QlLN3hhwL6tsz5gWKXZ5Rd5OiujcU17jMwVwesYx1QukZdTXSRQg3axu7b4/ixJswzlp2Ezk0Q8OPz2kKP8zc+scWpGPaL4mllvKg3aSWUphEzDKqF23LzXelLUst4PigqHRw3tzhMmyCWhkJVDcGtwzbWZFLZoyi23tGmPXyAE65cXSlaJTWTHv91oDHEmQ+esWT8+F+KBVQRjhrnXWvLNSxZUZeOyplssh+N/Giz60fA6S7B2hte7Gty6x9FzxJsvPo3Ssz53RDS6VmhWPhU7QbkSWWfm74uOK1S/X7SfG45ACpEXZSe33naOgGOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys/GCYmCwNZEZiKDOQ1IxK/LOsdUQDGCtbl0c9lSqPE=;
 b=dsKYleLaoMAAQ8D8dkk/fY2QHkRnFgUoUKgxmQaW8UE9yyKzuehKMc7SNVCYfQqUDpnkQJNet2N3rIWDh3bPoG8evqVXmMEpfzfgG+aCJHVuO7/cF5vDD/2yZP2+Fdw3QGkC6NqQDouEE3udpFuliXxSE7oABTCBrnJosOin9sL/uD1fG2Q4tpL8mrTYGcrJ/lkJEoDW44ejYdPAaClyT6rtPlbqa0t6ns/QmM578/qbKQti0Mb0L6/5WnH9rYU2u4RRpERnf7t4o1dAHgePdQblf+gZoWqP7lc5g0SmDGogdfC5gg38MSCERJNq6xCg40hxBZPukyYSLuBt4VY0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys/GCYmCwNZEZiKDOQ1IxK/LOsdUQDGCtbl0c9lSqPE=;
 b=FIiY3CQ6co0g9UtwZ6/+KM6YRrw4E2a5l0gAXaKQh8RNN8Q0iIx3+vABT2gFFxwVOgeLmaE26h1EupzKKqHVjjEHwiuRI3t3NJ2TGL0wgm7lk5V0SpqnnfipR9sk5+MFsVTCJ6Ut/ButNnVvlSRV7/vblhBUm7roRvuNe29C9RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 00:02:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 00:02:03 +0000
Message-ID: <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
Date: Tue, 25 Mar 2025 18:02:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Austin.Zheng@amd.com
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
 <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS5PPF6BCF148B6:EE_
X-MS-Office365-Filtering-Correlation-Id: f239150d-89c7-4acf-a508-08dd6bf9702a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzZ2b1JNT3pVUmlNRXlmVGxkcFFJQzBYYTkrdm85bmJjNkduTDY3aENiNEpZ?=
 =?utf-8?B?TUVEcXlaNzVPNklnUjlyRnZrNEZRcllIcHBjZVNDd2FLL2hGUG14TkxNekRZ?=
 =?utf-8?B?b216ejh1WnV0bjlwT0M4Qy9YN0tkUHBhKzdkaE1WMW9haHpsVitDYVppck1W?=
 =?utf-8?B?T04zck9VS0dDcUdiUVYyMnlqSEFFSHBDSjJoWFdrSDRIQU8ySnAzWXBGSlRn?=
 =?utf-8?B?Szh5eGVLSldvUlRQQktKVGNPRHAvdkQ3K0tmMTU0TGhTcENqUGluQzEyaUdw?=
 =?utf-8?B?SXdZeDcvNEEvYzBxZHN2VlUxcHp1TmdkM1N3VGdJeG5GYlFOMUtkVC9VcnFC?=
 =?utf-8?B?ekxkN04wMkFTV1lHaC95MmxKaklnQk1SUEU0VElMbDZvNWtkbmRqUDUvL1lo?=
 =?utf-8?B?NEZ2Zy9CTnVFbHVnY2tGaG56YVZYdWxrVXpwcCtCd3U2WUxVTXZCcWQ2QVBE?=
 =?utf-8?B?QjV4bmMxbDlrSkhMRjVKaVF4eEJURzh0azZHdGZpR3lFUDBGeXA5aTExMHpH?=
 =?utf-8?B?VmIxZGVPWEZzc0tINmQ0K1JvWDFRMmI2QkRybXVnTHViK2pZYTRqZGZzN2Jm?=
 =?utf-8?B?dTRTRDBkOSs4QlVPUnVFamtzRGl6UVNYK3FUZnN2Qjc4MDVCR3piU3N3TTdx?=
 =?utf-8?B?MTEyUnZjTGVlc2ZXQjVtWElpR0txSnJjeEVvMFphcm9wQWNxenZCTHY0by9u?=
 =?utf-8?B?QjJ5RjUwbGhKdURMQWRXNFNiZVVlZEpmMnBTTjE4allxWEVVOWk3VTQvT2Ev?=
 =?utf-8?B?TW1wbkI0YkhZVGJuVVRjQ2g5TE9WaHB6UkdTVUZWcGY2SHpSdnNWRlhmUHpF?=
 =?utf-8?B?Z3FDMHZqSXIySW85VGZ2a1ovbmQ2UkZkMEszMHcwYXgzRWxwbjVnTW5wbEVk?=
 =?utf-8?B?WTl3blRaR2ZvbzkvRXJNaTJJVWdKam5WbFRsVnVzd1pIb25DWHJMNStwQkNG?=
 =?utf-8?B?bmNXbmdJQm9zZDQ0aVVBVEs0c3Fsbkg4T2hDY3RycU04N3BRYjZLVGVnMW1s?=
 =?utf-8?B?QWZPUXA1bWcwVmxibXM4QzZ3eTlSUnM0OFZtczFpcWFObHVreWNqQ24rcmp2?=
 =?utf-8?B?ck9sZGVRaGIrdklaSjVsaHdxUDdUajJQRE5ZVHBza0Q5YzBmQ2lIbzVKbldL?=
 =?utf-8?B?VllpSHNaM09PMkYycVVxYXBFNi8vc3c0OXFRQUtPNk93eWxYOGJkeDNoNkFm?=
 =?utf-8?B?KzgzVnBma3NXTjhkUHArYXNERnNiS21PeGFmR0NYN0syLzdqYWpLM21YUVZq?=
 =?utf-8?B?d2IwQzc2QVZSY01md3duOFFwVk15TnpkY1FKdmE4NUM1VHQ0MzgrckNnc2Y1?=
 =?utf-8?B?VWZnSndpVzBFNlhUNUNXYzJMVkdaNVpXcnlPT01BSXIwcFBkcEgrN0pJTHFi?=
 =?utf-8?B?UHRWM28wS09pYkJTR0k2eng4c1NLV3dKWnRZeFB2c09rZStxdUZNNk41WHR3?=
 =?utf-8?B?alhqb3RwTlNSQXBrMnNNSlJmRWQwcjJLSjNTeU5Db3BoOTJ0c09hWWhvZkNL?=
 =?utf-8?B?V01hcitmODVVVkNaRklmZ3RKODFJeFk1WnhtU3dJSU9jMmxJQlpMNExvMkdH?=
 =?utf-8?B?dlAwZ0lJenN5dFdwTTBhaTAvR2hYNXZlQzI5UjIrdHZhb21mZEJJb0cwR0Rl?=
 =?utf-8?B?a0gveVhxWWZiL3NtNWFGdWpha1hOcnY2amQvYis5Q2xmUStBaXgwbkFiUjls?=
 =?utf-8?B?RUd2WDh5T3lSRmZnTG9ETnlsT1RvNk1FbEpnM3A5djFkelNMSjFXQXpVc09L?=
 =?utf-8?B?dXVYQzBieFhFQWhGOUZXQnh6Q2ZZS0RoZEkyWktxS2RaSTZnMHdvc0NjVnl5?=
 =?utf-8?B?ajdPWkdSSlFtQVd6S3pVdTVyOG9WZUpXTGVNdHVCQTVSUWZBelRVL0dGeDI5?=
 =?utf-8?B?cGI4Smo0SHNIdjdRVEx3dHUybXdGVWlEVkRRTTJNNkhZOWVweU10UHdoYXNa?=
 =?utf-8?Q?32xUgV3Uihs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlqQnh4cW1ob011a09VWDd2cDZKUmUwSjR1bDJQb1FYWGFyaXBOMmNKYjEw?=
 =?utf-8?B?bXpHN2UxQnBnY0VjdTMzWkFTYnhqbEpEano2clFvTTVZdksxMCttTDZnVDV6?=
 =?utf-8?B?THdDa3g5Qjl1QmowT3ZwWmRpeHd6SWQwaUd6d3JwTnNxMXdZM0x6Z2tiNldz?=
 =?utf-8?B?cVY5WlArTVhTOE9LYlpxblpHUGZMQzhYaC9RYURwN09Sd1Z6TTdQM1hudWVy?=
 =?utf-8?B?cVFWSGtJVHNlbTB1Rnc0bVB4eWpXUnU0Sys5RjJNTTVKZzhvcTlDWWtNdU5p?=
 =?utf-8?B?Ymd0WjdHNngyZms4T3E5dkxTTnNDSG5COG9PVDVKZHlqemliMUlkdHhPbDBw?=
 =?utf-8?B?ZkpJYjdvalF0UU1mODVNZXk1cS9LRUdTWk9ZaVhuaXdZV3prQUM5VmdkWTFh?=
 =?utf-8?B?YWl4T0dXTk5UekYzSkZ6N1l2Y3hJblIzWFRNNmlOZnlHc3VvTlYwOFowV1Uv?=
 =?utf-8?B?UGZ0SVhGZUUvRlltOFZHUUg3eTBodWY4emVhZGkvTk9zWXgwQlk1RlRvRjZs?=
 =?utf-8?B?QVA0bUF3TjUvMUo3RmRVYWFZM0ZXZ2dta245elcxQmMxVXlPY2RHMHZ6TEhi?=
 =?utf-8?B?K2xzVjlKU1lEdTVGaW5MMnFDNS9BaytIQ0xWQmNTRkkvU21QdmxMVzR4M25W?=
 =?utf-8?B?QlFqT2UzTnVaaVB2SkVTUEJoOUF5TWpaZnBlRlNQSlZtTDR2TzBtUmtlNGVY?=
 =?utf-8?B?U3VxRlJaS08xTU1uYm90dUlGaXhrUGxmTVdkaG5LeXhtd2dxYXgrSHFZcW1V?=
 =?utf-8?B?WVlzWjBKYkNkMXdEL2EvTGtrM3ppNlpUcGw4aGc3dktlTnRmN20vYTI0Vzlx?=
 =?utf-8?B?WjA1Q2RIaGt4NEJ0eFN2T0FndDlpUXNpVmlUN3BPb1U1T2MrckgyNHdTRHFw?=
 =?utf-8?B?MjlET216c094T0FFUjV1bDQ3ZEVzc0kzY0dVRVRSTWRaNGpiUFNCTnkxa0s4?=
 =?utf-8?B?bHhRR0lFb2tmTFVNeFRzOGtkSFNRSVJaUjNFd0dJQlJ2cTJDNXdNRmZjMTQy?=
 =?utf-8?B?bUpOSU0xWkE0Qnk4UWhWd2ozUUFMZnVjVUxrck56VEpIbzV1U3lYdDhwMy81?=
 =?utf-8?B?d0hrdlVGUm1sWHJrQ21lSmo2a1VXQUxpY1YrbU5FUGk0VXNoZnRzMXBUQ3Ur?=
 =?utf-8?B?ZURlN1NVOUNVaDl2UTdGaWhkUHdjcVBYb1JacGRLWXhseWNlS3BsV0s3MnZs?=
 =?utf-8?B?MVE1eXNSeTZkcFcvOVVkYVNidm5FVmhjaUtnUjlNMjY1elAvQTF4Rys4cWpU?=
 =?utf-8?B?WmhveW5KQTBQMkZaOTJrUEhBVkt4VlR2Mkh1clkzek5RWGVJQU9wem5VSWtJ?=
 =?utf-8?B?b2FBUG9MOHBzQnQ3aW51YlFmMHBSaWQvNXJsbzhIOXNaYThEN2RQeWdxN0hV?=
 =?utf-8?B?akFXMUJydisrVlkvZmVRVWRiQlhhanZ4QTJMVFNSakVjdldNRnJCcTNDeUJN?=
 =?utf-8?B?bXpxUnorZGJQR2U4anN3eVMrUEg2Y1ZSZW0xUmJmK1BlVjlPRW1qNFh5bmM5?=
 =?utf-8?B?UkMybW5RdmNxcGZZMGtFYlJrdFVXZWNkTnI1ckZncTB4eDByeUhiSzFwY1Ra?=
 =?utf-8?B?ei9mRFY3OHh5VDhXVmtxME9BNTZJdjY4c05wSng5c1h0ai84QTZ5L1pkODlJ?=
 =?utf-8?B?ZW50dWNqMkxkeEh1cnNxdExxZUxnTHhFWFFCWDQ0V1RPUmlnUjJUOVVoNUs1?=
 =?utf-8?B?NUZ5a2tMQTFxM0cybnl0bTRRVUs3NEU3M3JnclJWU0ZqNVpEM1BtMStmdTVx?=
 =?utf-8?B?N1J3dTlsTWtBdEdLeGJKYU9QbTFobTVyL05rY3hnYlBnbVFycXJkNWJUelV5?=
 =?utf-8?B?cFphS2l0N0l5T1FQWksxaVZWNU5mWkkxMmJreGJ4N0s5aEZzdzNGU0syeWN3?=
 =?utf-8?B?cFBxVHNOZ2dyM1JrSUw2MTNJcmVKSFJmUHB4STNkTm5RQ2k4WGtZYnl2aVRF?=
 =?utf-8?B?MDZsdHBhU09DRUo5dG5MZUw4Mmk4eTFXLzBZeUdhRmN6QXM2YU1VM3M3VU9j?=
 =?utf-8?B?a3YvQ0pKSUVSZEEvTXdUM2lzaTVybGhDYk1EclpGUWUrTUhSV0ZPVjJnSTlw?=
 =?utf-8?B?dWloSFREbjVHOTZHeWNxZy9HMmlWMW53dkQrZkdNL1ZrTXN3aGl2bnBuMzVM?=
 =?utf-8?Q?64SjynctKLd5ZJry6ae4pgbwt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f239150d-89c7-4acf-a508-08dd6bf9702a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 00:02:03.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKAjtcY5SVycr8e0IdFW2Sfzk8ojy6LpKP22kHq54xJf7LxEdGmtvUmoFqxeWnH3Ezg+0KgFYOBD36WAFuZMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6
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



On 3/19/25 22:23, Huacai Chen wrote:
> Hi, Alex,
> 
> On Thu, Mar 20, 2025 at 10:16 AM Alex Hung <alex.hung@amd.com> wrote:
>>
>>
>>
>> On 3/18/25 05:17, Huacai Chen wrote:
>>> Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
>>> start") removes the FP context protection of dml2_create(), and it said
>>> "All the DC_FP_START/END should be used before call anything from DML2".
>>>
>>> However, dml2_create()/dml2_copy()/dml2_create_copy() are not protected
>>> from their callers, causing such errors:
>>>
>>>    do_fpu invoked from kernel context![#1]:
>>>    CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
>>>    Workqueue: events work_for_cpu_fn
>>>    pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp 900000010575f840
>>>    a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3 ffff80000357e268
>>>    a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7 0000012c00001388
>>>    t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3 0000006400000014
>>>    t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7 0000000f00000064
>>>    t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0 900000012ea51fd8
>>>    s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4 0000000000001fd8
>>>    s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8 ffff800003211f80
>>>       ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960 [amdgpu]
>>>      ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
>>>     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>>>     PRMD: 00000004 (PPLV0 +PIE -PWE)
>>>     EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>>>     ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>>>    ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
>>>     PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>>>    Process kworker/0:5 (pid: 239, threadinfo=00000000927eadc6, task=000000008fd31682)
>>>    Stack : 00040dc000003164 0000000000000001 900000012f210130 900000012eabeeb8
>>>            900000012f000000 ffff80000319fe48 900000012f210000 900000012f210130
>>>            900000012f000000 900000012eabeeb8 0000000000000001 ffff8000031a0064
>>>            900000010575f9f0 900000012f210130 900000012eac0000 900000012ea80000
>>>            900000012f000000 ffff8000031cefc4 900000010575f9f0 ffff8000035859c0
>>>            ffff800003414000 900000010575fa78 900000012f000000 ffff8000031b4c50
>>>            0000000000000000 9000000101c9d700 9000000109c40000 5f5e9200f8901912
>>>            900000012d3c4bd0 900000012d3c5000 ffff8000034aed18 900000012d380010
>>>            900000012d3c4bd0 ffff800003414000 900000012d380000 ffff800002ea49dc
>>>            0000000000000001 900000012d3c6000 00000000ffffe423 0000000000010000
>>>            ...
>>>    Call Trace:
>>>    [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
>>>    [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
>>>    [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
>>>    [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
>>>    [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
>>>    [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
>>>    [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
>>>    [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
>>>    [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
>>>    [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
>>>    [<900000000448eae4>] local_pci_probe+0x44/0xc0
>>>    [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
>>>    [<9000000003b05da0>] process_one_work+0x160/0x300
>>>    [<9000000003b06718>] worker_thread+0x318/0x440
>>>    [<9000000003b11b8c>] kthread+0x12c/0x220
>>>    [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4
>>>
>>> So protect dml2_create()/dml2_copy()/dml2_create_copy() with DC_FP_START
>>> and DC_FP_END.
>>
>> Hi Huacai,
>>
>> Can you try to put DC_FP_START DC_FP_END in the
>> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate() instead?
>> The code will be cleaner and less error-prone to future changes.
> At first I want to add them in
> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate(), but
> commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
> start")  said
> that "All the DC_FP_START/END should be used before call anything from DML2".
> 
> Huacai

Thanks. I sent them to testing, and will share results later.

> 
>>
>> Thanks.
>>
>>
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>    drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>> index 1b2cce127981..6e2cac08002d 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>> @@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *p
>>>
>>>    #ifdef CONFIG_DRM_AMD_DC_FP
>>>        if (dc->debug.using_dml2) {
>>> +             DC_FP_START();
>>> +
>>>                dml2_opt->use_clock_dc_limits = false;
>>>                if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
>>> +                     DC_FP_END();
>>>                        dc_state_release(state);
>>>                        return NULL;
>>>                }
>>>
>>>                dml2_opt->use_clock_dc_limits = true;
>>>                if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source)) {
>>> +                     DC_FP_END();
>>>                        dc_state_release(state);
>>>                        return NULL;
>>>                }
>>> +
>>> +             DC_FP_END();
>>>        }
>>>    #endif
>>>
>>> @@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
>>>        dc_state_copy_internal(dst_state, src_state);
>>>
>>>    #ifdef CONFIG_DRM_AMD_DC_FP
>>> +     DC_FP_START();
>>> +
>>>        dst_state->bw_ctx.dml2 = dst_dml2;
>>>        if (src_state->bw_ctx.dml2)
>>>                dml2_copy(dst_state->bw_ctx.dml2, src_state->bw_ctx.dml2);
>>> @@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
>>>        dst_state->bw_ctx.dml2_dc_power_source = dst_dml2_dc_power_source;
>>>        if (src_state->bw_ctx.dml2_dc_power_source)
>>>                dml2_copy(dst_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source);
>>> +
>>> +     DC_FP_END();
>>>    #endif
>>>
>>>        /* context refcount should not be overridden */
>>> @@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct dc_state *src_state)
>>>        new_state->bw_ctx.dml2 = NULL;
>>>        new_state->bw_ctx.dml2_dc_power_source = NULL;
>>>
>>> +     DC_FP_START();
>>> +
>>>        if (src_state->bw_ctx.dml2 &&
>>>                        !dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
>>> +             DC_FP_END();
>>>                dc_state_release(new_state);
>>>                return NULL;
>>>        }
>>>
>>>        if (src_state->bw_ctx.dml2_dc_power_source &&
>>>                        !dml2_create_copy(&new_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source)) {
>>> +             DC_FP_END();
>>>                dc_state_release(new_state);
>>>                return NULL;
>>>        }
>>> +
>>> +     DC_FP_END();
>>>    #endif
>>>
>>>        kref_init(&new_state->refcount);
>>

