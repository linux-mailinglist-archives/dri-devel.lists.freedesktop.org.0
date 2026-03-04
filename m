Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEXFKE0EqGkRnQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:07:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284B1FE181
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA1710E999;
	Wed,  4 Mar 2026 10:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IpnQ9OsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6722210E999;
 Wed,  4 Mar 2026 10:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncNtR1Ppk2whavyF7jpOAglbaBY9bhdQUejVK7bnOjCWny7mrJ2/6F/lwTlNse8T4ps3B75DoZR+qVDvcHuNozYANCdWOfhZ1+sTCWyHZH59uDjDuIuqtbZx4kAtfsS+rzPlO7htpH1vz4PCxMJVABhEjWNsoVN272BXssItPf9crFzLGS0phbFtAa4UZhaH3JbsfY+nIxkLgdMUYJUO34zaoNDAIN44DuYD30XjTMWzDI9DVtU/WfxDPiZOxPemeIskCe75S2X8Ie9Z80XZ6+ESmvJaTOj+o8mxeqij1T5IrZ4r0mhdlvkBnygbh3gaemLcC9Ojs5KOq4ep9CU+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAilE3kvEb8tJpybv+zLICWfzXVK35uwb4mPGq8mu7w=;
 b=yvCkMVLhxvNbHL3G++jTf7H7egEiIitD8bBeZ9GVcXTfJ262Uwb53L1wiqD51hrNMTxUsswFJKsmZ6KQNSsX4OtY2FIrB6wFdTq3b/jbjGEmdeo1KQpHackrSxDnZHVCDJBUw3hCAGXjuwwfI2frL0lO2uofrp3lBJJmXIe7hmOMYQ8V62WcYADkF4SK02KA2IZq8pNAdq6PFAc+ccS4VwjgEQrSZRuJ0sZgo6P2bEhHGUch8R3YDiduzr0exoDcd/hil2yQyxxyIqo0eWjGy0TknLr617R5zl7gnnWNgvozj2S2ZkN5jEhL17bCs03rxW2c9HcvIglszzIUX9ffnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAilE3kvEb8tJpybv+zLICWfzXVK35uwb4mPGq8mu7w=;
 b=IpnQ9OsB3yio0RMTj9SkKi4eC/bxaZGXopuUcQp9iNNYgjk6JGWn8sbIzmEkO0uXAq21Nb4AiXF2gi4w0u4kVsyR9ntfCTyF9aythuNtKu+monOravQW0cVgkCuVc89P0EKDvRZTXegxpOg2GnH6PVxm51jQSdf+n6mE2Xh4bm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 10:07:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:07:00 +0000
Message-ID: <4d00945c-f439-4460-9f8b-12e7e498fb20@amd.com>
Date: Wed, 4 Mar 2026 11:06:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Rosen Penev <rosenp@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260228045356.3561-1-rosenp@gmail.com>
 <CAKxU2N_FbB_d6ntXEOFzE2u-sfu9sRRFwaDnb3P=RfTwE5yuDA@mail.gmail.com>
 <7d3a4090-06bf-40b0-8c80-ca08625608d7@amd.com>
 <2596902.XAFRqVoOGU@timur-hyperion>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2596902.XAFRqVoOGU@timur-hyperion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e8c166-1c40-4a04-99d4-08de79d5c6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: kcq9CvOIC/S7c04Ru1KVmibJVr/OrYopKCF2CEbPB5RU0El03k86oqRKwz6iBobHD+RrMKiTW+5cX5l+WzNo6Q+S1CzT+luExW9IP0KlyO8oL0qoypd+gv+PEznqEfcWKM+sLjFOt0lA4jtXEB6ZC1YGIxvYh4DHJuTA1BY76ylDxUhgYi79M2lrbeQBXsV9uv50besjZn2LAYej+oyberdny6pjVxNzZ3gBhp4oGmhfUqhAo0onDkg9vqd1jV6PuGqwghWdNunoruW8WhnsjbHgsKFGT1tiXJV+Attk3cGMd82o1CC8OXtVTJLjBAQvcNifT/5mKjE9P3Kkdx/fW3Wop5uLcAppaMpgQG6oe6hjStFNkjSzbgcOCqlLeGRNScd8evzh1zDXELaPiBIEqzrEhcgGifUI4Jz2/mvdHlMYUxeyLxb3QdhFY+gcmbftO8iZE2zx4+4pQkTX8N962uCAwB6Mb6OhEgho6g2Mo9zJEpttLi4t4Ou2ZBuXwTFHRgWOwWGMu+dKp+mifIQ8yYoNxS25EgF5F7KTH31Epv6GCwsbVvP1Kph62tWsoYym6MtXT+q0WXXe67Fb9AiAd4BRhTWk9VtFOkV8ch5DAcyyuaaCjXKh+wm5LHx9j+aJclqNjGcyvMqP2XT4+zCFLpcVhgS3dPXsR3ZUHYRkjB3CvBtZHirTMlNkjKmKYoDO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFlZdUdUVFJDSnUrVGRqSk9aTks0WEtBb01ibi9OSGxQQVMwZ1V2a0FMY0Jl?=
 =?utf-8?B?anBpVlI5U2E0aHhPSnhqejNUZHRrcUkvRVpENzRhK2dQek9BekJGaW4xbWNk?=
 =?utf-8?B?R284M3UreWUwT1FLSjhCL1c3alRjdDVJMnVHSk4yYURIa1NOSUUyMmNwRGp2?=
 =?utf-8?B?RUw2ejBqQWlMU1V2eFcxSU5iZFFOZG9UWHUrRWg1V3VKUDB5b1g2NzdRSUJk?=
 =?utf-8?B?TUNwYlNlU3ljN3plWGNFYVdnY1o1WFl4VHd2d28vQUdwMzZsVTNLWE1abkM2?=
 =?utf-8?B?N3drRUEyMDJQZFpmTUNreFVYY2xvekFqc1B1Y2RxRUxDNXdyanhtSnp2WHJt?=
 =?utf-8?B?dTdzRkpJYWNoMTQydU9jV3RrdThHQzVBc0UwQmpVeGYzTVZIVXpnZExUczha?=
 =?utf-8?B?ZHQrd204cHVzaldwUzc2ZVNtVnM5V2pkemhlMGNKSVcvelFvb0xqT1dMNjd5?=
 =?utf-8?B?N3BTMXV0dlVKcU00K05qTjlxUGtnbXIwd1VMT0lJUHVGMWVjNEY4alFRZ0lO?=
 =?utf-8?B?TzFyY0lLQUxzUkM1SFdUcDZ1TmdsbWxtOTh4dzRaaktrbHZHNXRwUFhncWZS?=
 =?utf-8?B?TXAzUVFvYTR3ZEFjaG9ZVFRYdmJWLzZ5RlJPMmpZcTZWdy9TWkxsS0VENlls?=
 =?utf-8?B?Q3JRdzE1Rng0OHExaUpQMDJ2THRxV3h5S0JVQU1OTlRoQWovWGtRRmY3MXhK?=
 =?utf-8?B?dUhJQnZlOS9vNUh4b1ZKeS9EN2s0WDhTamlBdEhpWUNJMXpsN1RVbGlEQ21S?=
 =?utf-8?B?akF4SDR2R3kydUc4WmVlSWcwVUtkR2dCWjl4Z1Z1dy9GZ1NER0M1aGphRVZL?=
 =?utf-8?B?b2dUT1BQbnlUZnFBZ0hMYWNnSkVEc2ljUlNEV3U3QlhoOWNqbXNpTlZ2ajBs?=
 =?utf-8?B?N2x5VkVHeTViK2l6MW8vaEZ0TTZKcTRkUmE1KzdKUzJLL3hjdElVRVpiZWRm?=
 =?utf-8?B?R3ptTCtvUXNsVmJHa2VVTmppOWJaVThDMExzcndFV3haYTNBdHBPTUpKTXBX?=
 =?utf-8?B?R3N2a1RLcnNzc2xHVlBUYjJiUGJoak1HcWxjVk12cENadEFtaFkrbXFBaHJp?=
 =?utf-8?B?a0NBdTVFenYyQk9OQVJmZitJS0xsa2ZnbzJMZXVpaTZWVmtEa1V0UDF3Sitw?=
 =?utf-8?B?SDMwODRoNTlkYjZQMmZQemNiSms0ZkJxMU5YL0N4cTBHb0N4UVFDOW9xM0tm?=
 =?utf-8?B?bEhoMk0zVkNJZmFFN1RMWUE1WStqd1pXRXgvaHBPamdlS1JVK1psT0I3Tzc1?=
 =?utf-8?B?Q0QyQWMvYXFCMjEvWGc5NTRXbnFWaTArMkZDVXV6MHFsUVBmcFhweWVoZHEv?=
 =?utf-8?B?MkxiNmFCSTZ0YXRrNDdNTG9SVnhxOU5ZN3JEaTYxS0tOVjN4T0p1L1d2Mkl2?=
 =?utf-8?B?YTkxWXc1QUlKT2NFVWtkL0VHZmtYWnUweDErcW5pOGF2Y2RORjg3NlFyUmpM?=
 =?utf-8?B?bHF3MWVSb1VnYjlESlR5NnJQMWxWQTQvdzVBT1FCRmdncDRZTGNuNnRicG9C?=
 =?utf-8?B?cHZpTDgycGJmM1lDOGV4TGUwdkNZWXlUTnVLMmV3QWwyb3dlRFlsT3NYK05q?=
 =?utf-8?B?anlKTTFYcUk5b0o0akUyY243OUxXeDNaYzdyeFV3Mk5uVHZkOFBJd2YyMVdK?=
 =?utf-8?B?Z0JyeHQvOGJWdXJ0SSs4ZStaMlZvN0g2U0FqME9HNjVoZXBJU3dOaCtuRzF4?=
 =?utf-8?B?VnM3RW5uVDBPVWpJZDlUODlxSEV4Ky9Zc2hNUGRUV3M3RGZqRUZZV1V4ZitU?=
 =?utf-8?B?WFJMaFhYZWxReEZNSGhLeGtUSElpTTdzUHRsR2tlSEtMeGdOZlkxaGVqMjBh?=
 =?utf-8?B?dERzdERMelo1N1VhbkpUaHhRVVZqdFhpeU05YWptVDZKK3R6bHVBNi9xYVFv?=
 =?utf-8?B?enB1Y3AvMUw0K2x3Sjd5RnN4d2YyMnN2M0FXVFc5cW85L0ZLVGZIdHY2M1pF?=
 =?utf-8?B?NlBjMXE4YThOWG5kdStsOWp0azkzTGkrMVFYQVVUUUNWemEzY3NjS05qcXJw?=
 =?utf-8?B?aDNrakpncDFleU9nczRlK1lqZ1p0MDZyRVdEZ3NZWXNWanc2NUZYdTMxUHBF?=
 =?utf-8?B?WkhJUFFwaCtCYWFKSEJGREJ6ejloYTh1dW5vdmFmM0NlTm5Qd0dCdGxrU0cw?=
 =?utf-8?B?cTJEUktiRjZHWlNGV0lzaFlLOG1oeE51d08xcUs1N0RzVmFRd2l4dWlBVk5V?=
 =?utf-8?B?bGxjWVcxNVp0UGRGY0o1T2doZFU4Vld4anFaYmVxenlnbVpMVytDUm8yOGZN?=
 =?utf-8?B?ejNXQVhXUGIxREwwOWJTZ1FSWnBqRXpHblRYTjhiaHpqOGlCWC9HUVdueGxU?=
 =?utf-8?Q?SqbxWZtWfrPNjS7E+M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e8c166-1c40-4a04-99d4-08de79d5c6b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:07:00.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxu3j7+t7BENbmWb9tKwQFroXeKzZYwsD8s2en3JAVmz6BHkRbv6mqRf3R1xc1YE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558
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
X-Rspamd-Queue-Id: 0284B1FE181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 10:09, Timur Kristóf wrote:
> On Wednesday, March 4, 2026 9:10:02 AM Central European Standard Time 
> Christian König wrote:
>> -stable +Greg
>>
>> On 3/4/26 05:03, Rosen Penev wrote:
>>> On Fri, Feb 27, 2026 at 8:54 PM Rosen Penev <rosenp@gmail.com> wrote:
>>>> Because of incomplete backports to stable kernels, DC ended up breaking
>>>> on older GCN 1 GPUs. This patchset adds the missing upstream commits to
>>>> at least fix the panic/black screen on boot.
>>>>
>>>> They are applicable to 6.12, 6.6, and 6.1 as those are the currently
>>>> supported kernels that 7009e3af0474aca5f64262b3c72fb6e23b232f9b got
>>>> backported to.
>>>>
>>>> 6.1 needs two extra backports for these two commits to be cherry-picked
>>>> cleanly. Those are
>>>>
>>>> 96ce96f8773da4814622fd97e5226915a2c30706
>>>> d09ef243035b75a6d403ebfeb7e87fa20d7e25c6
>>>>
>>>> v2: Add Signed-off-by.
>>>
>>> Do I need to resend?
>>
>> Well first of all please stop sending those patches at all.
>>
>> When you want something backported then add the CC: stable tag to the
>> original patch.
>>
>> If you find that some patch is already upstream which isn't correctly tagged
>> then ping the relevant maintainers if that patch can be backported.
>>
>> But don't send stuff to the stable list all by yourself.
>>
>> Regards,
>> Christian.
> 
> Hi Everyone,
> 
> The patches actually come from a branch of mine:
> https://gitlab.freedesktop.org/Venemo/linux/-/commits/v6.12.74_si_dc_fixes
> 
> For context:
> 
> The crash comes from a patch that I wrote for 6.18 that fixes some issues on 
> the default, non-DC code path, that was backported to stable kernels. DC was 
> not the default code path before Linux 6.19, so I didn't mark the patches that 
> also fix DC for backporting, because I had assumed nobody uses the DC code path 
> on these kernel versions.
> 
> After a user reported to me that this causes issues for him with DC on 6.17 
> and older kernels, I sent a backported series to Greg and Sasha, in an email 
> thread with the subject line "Fixing an amdgpu crash caused by a backported 
> patch". The fixes were backported to 6.17 then.
> 
> I assumed that the stable maintainers would backport the fixes to all older 
> kernels that were also affected, but Rosen brought it to my attention that it 
> didn't happen. So I made the backports in the above branch. Rosen then decided 
> to send them to the mailing list.
> > Hope that helps clear up the situation.

Yeah that indeed helped me to understand the situation, thanks.

In theory Harry an Leo should take care of stuff like this, but pretty much everybody is overworked.

In that case guys feel free to go ahead and ping the stable maintainers that something is missing.

Just make sure that when a patch passes through your hands that you add a Signed-off-by tag.

Regards,
Christian.

> 
> Thanks & best regards,
> Timur
> 
> 
> 

