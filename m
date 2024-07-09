Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF392BC69
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 16:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3225110E58C;
	Tue,  9 Jul 2024 14:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LxzIh885";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315E510E581;
 Tue,  9 Jul 2024 14:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrPXLPr3n29hum/wfjLcEre0J/frvaxypNgC5a20rmvCzE1+bQ/kwoMw1UZ6GMZ/67UPw5IOBJs9qilJmENiWHqBe1rLOETMrwf/5IdhC77sRu7NJ7ab83i9w9flczDcxqzY+ksnIS5IARFXsPuHhCzHPUFleyJS4kAQCCp3A/tLNULjP7CKDjcRa+DwxpUMnchXt2ORODJtvSbn1EC/r8ROrmRO0cVL+P6eeXi26PPGQ7+76rsjWF4YP9Eqcq1tBo7rAzf94IOY9DaNg1CCJd4xX2PF90OznGxfCocLZdaEgkk+yzitxf05yD4bhpl0Ziy2AbfrjEvmFzxj9xOmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccfgFk7HHV/BVFQe18L9913ARvYmyTTP3VHGFxSdHA0=;
 b=muVp/1JtfUWwYE2PLJJWd8qq7h1mIqtaASr0ewGowBpz7loV+kJZWDzONkfszrkW/QQ+YPKlJPkHdq8Q7aKNYsd6nvhojVhh3J7QLJ15r5eK5q5FgatrfJN9AKUmuZSi/9cfXGLoOhyOtXn6jOe5qI2zqpHcsyW0/mWzLWCsVFUZBtQJqBWraiGg+P2n1mEoNLUXIIVBZMM8YneNshsIC4asqW3i7C+ZLv+huju714plPz+139QMVZXNrkHZpOGtrTLKHXUX61WM9diwEhPLA1+zfXO3j8TsPcJ9vnxtUSVnJWUEnpGBF+5/wtSj0j/1J2qfAa2HQ6ONH5uF2SiBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccfgFk7HHV/BVFQe18L9913ARvYmyTTP3VHGFxSdHA0=;
 b=LxzIh885c2gen0JrHqQSje3KEWm65mI6hr+EF2VImqKq/wFeQPuMDuFDQoFr1eNkiZ76qZnVhzaz5DerhJdc6HOQ+iMw9M1UYSt+rw0oKjaaAcS5RjxU7hzrfEfFVKQCUBoS/7EOJom1n/NGlFXiSh6/mALE3YjXJgR0Pcma3HY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 14:02:39 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:02:38 +0000
Message-ID: <3214e5a3-a616-4bcd-8f1d-238e1bf346fe@amd.com>
Date: Tue, 9 Jul 2024 10:02:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
 <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local> <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::27) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: b304fe58-470f-44a0-4ae1-08dca01fca69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekhnbFQ2aDRJR0xnU1dYdDRIdDhCYWtQbUNQQnk5cWN0ckdkUVk4YnhRR21J?=
 =?utf-8?B?eTJ6WU53d05FOGlBVlVFWnUyRXJFUUZLL05xMW0vNWxxVkpkYnp0L0RjdUNy?=
 =?utf-8?B?Q2ZncGFDS0dIZEN0SDFZY1RrS3BRUGx2TGZsaVJLOTExaXFGaWFCQUhzNHJ1?=
 =?utf-8?B?azYwYnZlL2JuL2JsemxWalZha1JpRWN5dlN4TG01WGtldHNPcjBoelhCL25R?=
 =?utf-8?B?TmJnZHBrU3hXU2NRRGNqVDg3Wkl4RVpQc0RFTEJnYkRBZVBsUFFwTEtaNG05?=
 =?utf-8?B?WXVEdVlVYzZOLy9McTNlS0d5TXFKaTJTRDd1ZTFObXBtQXdKRWkwWmtCdEcv?=
 =?utf-8?B?clRYblFsWGlzb2JLa2RWNlZFOWVQUWJuekNEckZmT3gwRmRPZHZqaHZmamlR?=
 =?utf-8?B?cXZOMGgxTUI2aGp6bGdwdzlDUHd6RVI0MHdBcUxTTDBkQUhiak4yUE5RWXl0?=
 =?utf-8?B?UkY2bGZIUW1KYlRxekNXS3JYaGNXYUpkWWcrYVk0Mk1xUUNWNzBnVkM5Rk4r?=
 =?utf-8?B?b2xwdDA4cUw4VmhHYW1DQ1Yzck9SYlhhUlhZT3JRZGV5RXRZWkRlSnI4WW0z?=
 =?utf-8?B?OW9zREozaTlKT2kwcTNFdVNyODRYZlVCVFpLbU42TFFPY1hnRmY3alg5VGth?=
 =?utf-8?B?QVlMWUhDVkVBWVA2cjd0VW1XRnRuQjJkd2pITXlDYWJnL3VVREhlTzY0ZDdS?=
 =?utf-8?B?Mlk3TFRRK2hBK3RiQWtjN2laemE1ZERMSUxKYU1nYnJjalFVTmgreGhPQjEw?=
 =?utf-8?B?NGsvY1dnMVRtaldiSFF4YWRCTHVjeXVRbDBIRzhLUFNmVklmanlrMjJoK3g0?=
 =?utf-8?B?Rm5MdWxIbWx4Mk9YZjIwRm5OczBwS3ByajU1MXpocVJhd241MXNFWmpmN21E?=
 =?utf-8?B?TmQ1YTQ1VThmVHVPUlNHZjR0djI2K0ErRkUvUGZFL0JwdjJwNW5XeC94Ulov?=
 =?utf-8?B?WXc4U1hiQVFhZnVndys4NDVBenJLZkdEbWtyOVNaK3ZsUUx1NDhkbHFOdnJP?=
 =?utf-8?B?blVVejdDZGNST2lhTVlqcU4zOWo2YTROTU83UHI2Q2NyNVNUbnpkTUpzdlFE?=
 =?utf-8?B?UUh6azJPdzZNOHFxM2djOHJGYUhWZXYrNUxZZE5kTHVCRWprR3BhcUlTRkhW?=
 =?utf-8?B?bkNRcXkwd3NZMWI1VTBMZUc3WWpkUXFnQWVhZ1BSdCtoL0xKckF0Tnk3VkxT?=
 =?utf-8?B?WEVybFg4dm8yUTI5eTFJSzZSL2VmSElqSjd4RWRBQ1JRQWpnb1FpTmI1MTFj?=
 =?utf-8?B?TW9UZ3Fjb3BLTklSSUV5NmhIM01rTmI0cXQ3b0Voaldlck9UN1BsOUpBNmZm?=
 =?utf-8?B?TTdINmwyTnRlOGxIWnZWSUh6OFZRSFozRFlVM1ZXVVlxb29URTZHQUpQSjRz?=
 =?utf-8?B?TDgySHErNU11SFh0bTkzcnBMTElMTnJLaERoNS95UjlVSWxzcmE4cElEZFd5?=
 =?utf-8?B?WEVDbG1KZ1NpUW12MFk5OEFOSWtOSjc0NHZKaWtZU2ZRR1d0dVpWUlpqZ205?=
 =?utf-8?B?N2NGYnRFZnZic0dpNys1dmIvbFJ1Uk9NTGZ3Y0RHbGtmTU4xUFBQSjBtZm5O?=
 =?utf-8?B?RDB4ZGVGbU12SjBZL3ExM2FHVTNWK1VqbVBuVkFhQ3hSWDAvVlNYRjhVVWNB?=
 =?utf-8?B?V3htM3FYdEZreDNWVXk5RGpBbW45bGJSamRYa1krNGNnSmxTK0ppYzNtTUVo?=
 =?utf-8?B?UGZnSjBHVUw4TkUvbmRmMy9Ib3FlVHViUXRlZ3hLOHh1NlN6MXB6cDNrSXJZ?=
 =?utf-8?B?NVZGVU1NeWpVWkNncnJWSFMrcGVGQlIyVS9DSzY2VkpBanJsRXRTa3pnUW5X?=
 =?utf-8?B?SEVmYkR4REw5TUZ4bXZDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhzVTJyc1RTaTFNUmpqSDZjaCtDYWtoZGxzc1dKTGc4Rm9mU1JXRk9mTzd5?=
 =?utf-8?B?RG0yNlltNUdJc0RmV2dUMUpyakJobTlwVkN0SERqUXB0NU4yS0xIZVRxbllw?=
 =?utf-8?B?am1GWklkUStrNWpIZUFxeEl6M0hKN3RxSzhHR0VsVnRlc1J3eVhCZjdOK0Nu?=
 =?utf-8?B?bWdLd25wVlN0TlFYeitBQk5ZenBiZzhWb3RRV2NCS0Q2OXpEamI4Vm1jMXlJ?=
 =?utf-8?B?ZlQ2TjQxdE45RFVyVDNTV2w3Q1RaVnNNR0xvMEdzeWMzN2Fpd3o0SC9uU1ZI?=
 =?utf-8?B?K3BtbkhCdHN5TmtKbkpHUFpBL1NrRmdoRUxic29PVjRHSSt1Z3lQdzVYdTBF?=
 =?utf-8?B?ZHJIQkFJT0NuK0pvWjUwcDY1aHdoWDBvZmhzL2laQmtKTitNS3ZpOWpLMXhZ?=
 =?utf-8?B?QmhvNTRUdjhDTUtEMFB1OHJmajNxMXZ1QTRHdXU1QVNVZHQ1ZnRjaWJCNXhE?=
 =?utf-8?B?bjcybFJmamxzS1hrRUdZSkpXNzdoUnZUSk0yY3hjbkFHWFFVN3Q4RU9wREJJ?=
 =?utf-8?B?d3ZlN2xhL2x3dTdQWTYzRlIxNFRVbk1IcC9RRlQrMGhKSFhMbUovalZ4Q3Yy?=
 =?utf-8?B?aDU0Ly9tZkV1NFlqcUpNb05wNzc4eXovckd5MmFOb1lOcGdXaE5OaUFsMGJF?=
 =?utf-8?B?cjFUaEdiMEQ4dVdzTXJ2MFRDZmY3OFlFdm5wQUpQZEdQUkoyd0FZK244NG42?=
 =?utf-8?B?dVM4SXlkWUtaekZhdHFlMnJKYWNSRkVySGQ3bHhsRzdSUW1BV28xWlgvTkNU?=
 =?utf-8?B?QjhBa2dPdkpHM1o4WXZoaGdHU2xkMEVTV2o4blNvZkg4RFJBSUFoaFlpenlU?=
 =?utf-8?B?SlFFbUVXWm5qVzJYalhYYXV6S2ZQMytUbjRHSFV1L2tMNmFtMStqMHpFaHRH?=
 =?utf-8?B?TnQxL3hQSFFNWGhMUkJ4RmNSOHFGTFlmMHFuR01SbWZBWTNZNEYvYm5QK0d1?=
 =?utf-8?B?YTJZbU9tZ01NaTdNeVNMV1JVQXN0ZFlldVNrWnJ1MzZrS0FsUkZmdldtL2Fk?=
 =?utf-8?B?UVhvWVZZNVFJQ3k1Zk1yUG5nNjBTc1J4cmhPellmbTdDNEV5K3VyL3pORmc0?=
 =?utf-8?B?YWFIR3VVcXFZa0xZQjR3c3kwbzNRL2ZnUmVqWEROWFY2WEErNE41YXlkUDlH?=
 =?utf-8?B?SEpxeUR6OG0rMnF4ZStTMUwya0c1RnF2cjZUZWRHbmg4T1N6T3N2bkZXK2J0?=
 =?utf-8?B?RHpDMU85VVdCTDI0akJTTlNybDF0WVI4OUsrZVhMcU5UdzB3ZEdFMU9iTzRv?=
 =?utf-8?B?TDI2YVc4c1VEQStXM0t2cS9Pb0dsZ2pHR3k2aFVPaWZMS3lqRVBBbjhBbWdx?=
 =?utf-8?B?dk1wZmZkcCtpVXdieGJMcytFM2w2enlpWkN2emFzcEQ1WTJJQ01TRERNVDhk?=
 =?utf-8?B?QmgwUlJGSU8wUXFOR2FXL1FvT1VNb0p2M0JJN3FWNkxQRGR2TE5DbW4ybjhk?=
 =?utf-8?B?L1pVU0VtZjhzN01XK2JTWXNTNEdtMFE4Sk9yeE5EbDNXaXMxMTgzTXFzcVZW?=
 =?utf-8?B?emtBVTd6RFF2STV5MHlNZUdvazNqemk1K0MweFpGSzBIRTNWWU5oSjFTWkVu?=
 =?utf-8?B?Z09sdENzR2RqMFF3NUt4YUdwTXliNlRwdWhYRGd4Z1BCWlllcVpvM0xlWHVT?=
 =?utf-8?B?UXpvbG1POHBzczJjWnc1RTBtMlpNekwwVmNaaHNpRCtNVkYveGw0RThXbkFJ?=
 =?utf-8?B?VTBja3JzWGJkbWEzaXA5TkFwQzdjalNxTUtVL24yL3ZoM3l3eFBadFp1eVA0?=
 =?utf-8?B?L3p6NWVzckg4VTR2N0N0L3JOZ0R2dlN3UVQyZGdxT0tXOTZXUjBXOWlpR0tD?=
 =?utf-8?B?OS9UMWxrWFpUazRnNEJpcU1DaEkvL2NmNGNTZ1J0MHRGbW9ieU43T1NQcUFN?=
 =?utf-8?B?QU9ka01GSWVMVFBmNUFyUDUvUEpLVWtyakprZ1hGc0ZuSzd4VkplV3lPMytk?=
 =?utf-8?B?YWVON2EvaEtKZlRZVXM4ZDYrcjcwenpFcUxTTE5WOFU5d3JJa0hCcjZKOHNG?=
 =?utf-8?B?MjJOM3BBdUpmRGZIdnp6aEVGZWxyNy9sRU50ODdTMDBITW50dlEzdVQvMVAx?=
 =?utf-8?B?YzVvVjVvRlhtRW1jS1BuU1dDSllSRncxOWswZ0ZRaXEvcE5UVWl2eFlJQW5w?=
 =?utf-8?Q?nl7+QKEZNgDOJEpw0R6GCn3K2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b304fe58-470f-44a0-4ae1-08dca01fca69
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:02:38.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4J31gn71JefMoGtBec3VOz1oxZzfj2IzoqyGMpDD/NPNAJGih7b5o/oBJu13n9bMPyh8WwfIMhTQ5gqNcXQng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On 7/9/24 06:09, Daniel Vetter wrote:
> On Tue, Jul 09, 2024 at 11:32:11AM +0200, Daniel Vetter wrote:
>> On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
>>> Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
>>> enable PSR more quickly for displays that support it.
>>>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
>>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index fdbc9b57a23d..ee6c31e9d3c4 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
>>>   
>>>   static void manage_dm_interrupts(struct amdgpu_device *adev,
>>>   				 struct amdgpu_crtc *acrtc,
>>> -				 bool enable)
>>> +				 struct dm_crtc_state *acrtc_state)
>>>   {
>>>   	/*
>>>   	 * We have no guarantee that the frontend index maps to the same
>>> @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
>>>   	 *
>>>   	 * TODO: Use a different interrupt or check DC itself for the mapping.
>>>   	 */
>>> -	int irq_type =
>>> -		amdgpu_display_crtc_idx_to_irq_type(
>>> -			adev,
>>> -			acrtc->crtc_id);
>>> +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
>>> +							   acrtc->crtc_id);
>>> +	struct dc_crtc_timing *timing;
>>> +	int offdelay;
>>> +
>>> +	if (acrtc_state) {
>>> +		timing = &acrtc_state->stream->timing;
>>> +
>>> +		/* at least 2 frames */
>>> +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
>>> +						       (uint64_t)100),
>>> +						      timing->v_total),
>>> +					    timing->h_total) + 1;
>>
>> Yeah, _especially_ when you have a this short timeout your really have to
>> instead fix the vblank driver code properly so you can enable
>> vblank_disable_immediate. This is just cheating :-)
> 
> Michel mentioned on irc that DC had immediate vblank disabling, but this
> was reverted with f64e6e0b6afe ("Revert "drm/amdgpu/display: set
> vblank_disable_immediate for DC"").
> 
> I haven't looked at the details of the bug report, but stuttering is
> exactly what happens when the driver's vblank code has these races. Going
> for a very low timeout instead of zero just means it's a bit harder to hit
> the issue, and much, much harder to debug properly.
> 
> So yeah even more reasons to look at the underlying root-cause here I
> think.
> -Sima

The issue is that DMUB (display firmware) isn't able to keep up with all of
the requests that the driver is making. The issue is fairly difficult to
reproduce (I've only seen it once after letting the system run with a
program that would engage PSR every so often, after several hours).
It is also worth noting that we have the same 2 idle frame wait on the 
windows
driver, for the same reasons. So, in all likelihood if it is your 
opinion that
the series should be NAKed, we will probably have to move the wait into the
driver as a workaround.

-- 
Hamza
