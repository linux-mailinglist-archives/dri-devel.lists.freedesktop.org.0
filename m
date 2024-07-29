Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896BE93F6AD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6119210E3D2;
	Mon, 29 Jul 2024 13:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="azqUlaKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909CD10E3D2;
 Mon, 29 Jul 2024 13:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q23iEnKiTnic7LBThCTo/TX7OPinZR8Ni1e3i+CgARrwS2/Hu4lS9pR6SsXEiqDIdt7UVPCSjvm2KrbNyATWWRrqJV1qBJdvxCqJnuXrvpRHD4qK9qai1ceu7cttfnDkLPB5+o4TzTD3D8XqiTOtKh6Phcj4B6AM1v/TavzF94TUTNxtrrIfeSsg5wtmg8q6cY7JQhNe1nG7s0Qm0vI0g9Cqgn6ssmio0+WUtNZ+wkjrJZUMIGb/Hl1kKqSZxrpCl08vvdusA9d1v3uAwuf4AyHkuiQp3/AO+MVcEmoAjTTupdL2p26O2MP7RfmSVKvCmSWcpgVZdV9eNIWyHOi0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UQw1DuVR4K1/8S/j4jOy+pg/OpkGhrMq009T7uVv9s=;
 b=aRmc5rya1CBT4ukNsRZVK7HLeU7leZdz0ektjAslo8c3tMo5flQh6gy8+e82c45FcBnzNdafLCY7oGQJCB/SG1AVwuEHvaw/um54AtQl8d1z3n0IerGb9WS9urd+aGtGJgQKRuzW+u+RO8XTs5HzAp9aCCCs3Q+IUbumxvsnnQ0zOaSew4UDy3CtV4JBDl4wKySjloJ+XisGLZB3LDHRZrYTm3YeVbTzYXEX3Vtjj8mMtDUs7aZ+erfS8k+gPwEDsjrLa3w0J1NQPHJ3ONgGVCYjGhrEvs5DtfbFXNjQyF35B0yvIEPRssqJm3XJlFHoSGzDALfc7raDqxay7W2NvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UQw1DuVR4K1/8S/j4jOy+pg/OpkGhrMq009T7uVv9s=;
 b=azqUlaKJgya90qjDFUQ5ohXlWx6axN0KYXie1qjvgUCBS68uswZedyixseuLguSRdzlZEtIcL8LMjBYBYnjoZkB26klKTq+2DixM00h/EMxaNQZZwgqoPaJ9hurjPLtAZtKI7Nh2RE9Hsj/7iLJG98F2NarsW4WY/rDNMah5m78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 13:28:03 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:28:02 +0000
Message-ID: <b9bfc03f-c236-4d3b-8ebe-f9cf3cc736a3@amd.com>
Date: Mon, 29 Jul 2024 07:27:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
To: Melissa Wen <mwen@igalia.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-10-mwen@igalia.com>
 <5ba61e74-6435-4cfe-b21f-8690f47ea44f@amd.com>
 <llooutpnqk72a7zwsyghobali6ibhre2bbghwrius3nlw4eeon@6v7gjcyquja7>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <llooutpnqk72a7zwsyghobali6ibhre2bbghwrius3nlw4eeon@6v7gjcyquja7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::33) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cd9698-4e82-411f-65b8-08dcafd24553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1pFTGEwVGFOc2J1WFI2SjJKV2VnS1JvVTBqV1AvSHZ4cUw2eHlDUXRTQ0Jz?=
 =?utf-8?B?clVWMEdSWHI0K1RId3RNT3Z5QUFNaHFESElhRUdrdDE3VlE3ZXEzUmhSTExS?=
 =?utf-8?B?UnNnRk1pTmhWa05XdTMvTmowQVFaU0NaT092MDEzSWRkdG1PVEpZa05wNEJK?=
 =?utf-8?B?UmVzZ2c0NUxaclF5elRTOVRBRGw5UldKQUhsVEJSUXdjeW9lZGJVVXd5dHhj?=
 =?utf-8?B?QXhrNDY5bFEzSHY3VDA3N3pEV25INC91ZkgwSWE0V2ttNGNQQkZwdGlTZkoy?=
 =?utf-8?B?cHptL1NsRGo0YUtMRjNHVkdsSlVmZ0J1T3VENkRGeFZranVIN1J2NlVsSnp2?=
 =?utf-8?B?YVJCUlpiSXlOV1B0V05ZQnFpQitvaUhoWFd2WkxqQVJjN3pXek1RSzlCb2wr?=
 =?utf-8?B?K2w1N0lwYTB6c3FzT215T3N5dWZhdEtBQUxDcFNmaWhsVEIvU3AvVW5Gd056?=
 =?utf-8?B?ZTZFalgyU0psWE5pQ3NwcG9GdDV1UmhMRVRzbEx3RC9SOWZvM05URENVMTli?=
 =?utf-8?B?SjU0Vkx4SnV2ZFJLZnZZSHBkRXNRK2tPWG1yRmFQOStHYmMzNDV6cit0VHY0?=
 =?utf-8?B?a1VJTjE1bmUxdGRpVnpZcmY2VTlPTkdsSVFBRUdPaFpDV0lEMU5nVkNHUGMv?=
 =?utf-8?B?eDcxTE1XODVkbjZCa0taaVNNWC9vN2RRd2pwQWloS2QvUEpYQkkxdGJNVG9v?=
 =?utf-8?B?UmVoZzlCTWR6ZkdCcTRrOGRPTFNjVTVGSklpaU8yNElYbE1LNDVDLzhyQW9j?=
 =?utf-8?B?QStUOUh3aGtKdXJ6MkxZaXBoQ2I1VHpkM0NnaVhnQ3JNVkRHSmlCNjBWRUQ0?=
 =?utf-8?B?RGt0bzFYVTljd2NlQ1FTSVdzNVljY2NETzYxazMvaUo5bVV2SzNaQ01hdk1r?=
 =?utf-8?B?d09WY3RuTWhpRHVzVmttUk52TUZZY3k4T3FpZWdmSHA0SHZiMnJscElWeGhF?=
 =?utf-8?B?bng1NFRBRnErbUp4dGVxcnp4dzJRbWZ4L00wcTA1dk1lWEFiYnFwWkE2ejQ0?=
 =?utf-8?B?dm93Vnc4THU5LzQ1SVNSbnJvRzFoMkpGc0xJMFRPOXZGZ2NJRzN1VkZ2RnBV?=
 =?utf-8?B?TTVIMzVmbG1LOEVSUnBLblNXdE9xbWVPNmlXWGpHWS9pNDJHb1ZhK2tyZFdN?=
 =?utf-8?B?dnFvVWJaNTBiN2xsdURWR2FEdU55YnZEN1U1WWV0RG5RYW1nU3N5bERoeGhS?=
 =?utf-8?B?K3hMTDdUVXkrR3NaamljVm1BNGdURGtlU2ptTzB1MmI1VDAxNENrUUxQZDBi?=
 =?utf-8?B?REp3c2xUS0tpMjRGSi9WQkNUbUVaMEJZQWVqbjFpbDFiMmd6K2ZSMC8wUEFC?=
 =?utf-8?B?QzhTRWRlb0NZdFowMnZTYjExajZzN3QyZ09KYXZUUk1xYjNsUzJJemY5Zy9s?=
 =?utf-8?B?dmpTRUt4dGFCWjRVemtCaE51bEcySnFTT1E1VUdKdUlWZVFtM0VyQmNRcE9m?=
 =?utf-8?B?YUNaYUlEc1BoUU95SytpN0xCTGFJRlFsb3lQNnlWTlRzc090bitKMzBRUUlw?=
 =?utf-8?B?R3orQXNWYW9YWS9jWUpINnFDa2RHUW93L2dadVZLSEZxRi9QTnE2R0IwS3c2?=
 =?utf-8?B?Qk9sNnhkWHNqS2RzV0REYlB5VHZtK2sycGN4V2s4d0FVaXhqbkZlSDVoRTFW?=
 =?utf-8?B?amlzb3YyRk45MjE5YWlLUExpVXh0dDNWZzdhVmljNWRhSnNaRE9ra1pFTmZL?=
 =?utf-8?B?S2ExaDN6VEczb3ZjSm1KSTFweWJQSFJRUmVrU0dCbWZobEhUTlFsbGluQkVL?=
 =?utf-8?B?dXgyWkZzVm9BdlBXRDAwTTZlKzFVb2lLZGhFRjNyZVBxWkxldjFNeEFMcmhZ?=
 =?utf-8?B?WUZMWnV2bExiU2lsMzlZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTZ0M0NXYkdWR0NiWExYWVlVeG9Qd3UrZnVyUHRjdEd1NXhHT2I1Njk1YUNW?=
 =?utf-8?B?VGNhUm04VU5ZU1NpU25FN3ZYdk45eTU3VUNkYk5zSVlXUGIxd2pVelJ5cDg2?=
 =?utf-8?B?S0h2NVVGa2NYTVNnOStySkNyN1o3eFpwSEhFNnNUd1ArY1RMdzVDdk8yZ2JE?=
 =?utf-8?B?YktnYmlhWTFuT1lCd2JsemF6NG04WU9LbEk1K0FJaEpOZHZhdzN0TUYxS21V?=
 =?utf-8?B?ZmVGWEpWSk9CczYvQXRNS3pIMWhTUVFydExDRWVrRk5NWnE1Y01CWm1rbWUw?=
 =?utf-8?B?bWdtdHRDb1ViR1greHdJVk56VU1Qem1NdmlzQ0ZDT0tiaVRjREtITXpFakd1?=
 =?utf-8?B?NTZ1SjdSZnc4a25aTnM5UHhlaVBrdHZVbGI0Z0IvUktMUFN6c3ZnOVo4QndD?=
 =?utf-8?B?QzFpcmJTT2lMWG9GSWVYU2x6Uk93a3JYRGlBWkNYQUlrQ2RQRFdPdmdoUTkv?=
 =?utf-8?B?SmREVHBNeWFjZXhmN292b1dlbzV2WXVDalRaRVFINHVnT1F3dW82RXo3MFF2?=
 =?utf-8?B?RFNQRlZlSnM2djBDcysyTWo0VE0xYTJybjdqcHo1ZzYzbktiMFdlZHdmay9S?=
 =?utf-8?B?WEJ4dlpUNVc4bitlWTR6cTdpYVRPRU9waFJxSmJBTng5emY2bHh6d0lVSE8z?=
 =?utf-8?B?c2FQaXNnbUR5cVVsRFp0cC9BVmtHUU5ZZEdhZEN5cjYzQ0xlTlM3S3BXSi9x?=
 =?utf-8?B?U1ExRm12TXAyWDZ3TXI3REw2V21uZXpIaHlIMFdGTXhMSFY4OWdpNjVxWUx6?=
 =?utf-8?B?ZmVlYklSRTltMFl3WVNtYW0rMEd3OEp1TnNPYlovbE1YZGFHb2dHRVhVSzBr?=
 =?utf-8?B?eHJPT28xNElBOTNNRTFibEJzckY4dkZ5N0FwdGtOc21HRjBHVlVON1JJYlly?=
 =?utf-8?B?cW5WeWZTdVZSNThmcGFRSCtnODZJNHJtSVVwUFBsT1J0UVRRMWloMG9FSGpK?=
 =?utf-8?B?R2RMYXJycWIySWJqMS9GTUNCRHQzenNWcWJKMUpjOG1OMGcrbnArS3I3SXlT?=
 =?utf-8?B?WXR3NXpyOG5DZ0toVkNIcmJqbitwMG1IMFNScEJGV0hKN3hmYjNMc3UzTkE2?=
 =?utf-8?B?S012TktSQ09TUlJiN010QTcvQi9nTmRJeXBLcmVaVDFkY3ppa2FTNFllWm5r?=
 =?utf-8?B?bkVvRGJvNU9UR0RlczNMaWh2d0Y3Tk1qMzE5RkxtUzl1bndleTNvc2dHL2pJ?=
 =?utf-8?B?RzVFUUxNaTk0Z2ZNL2cyTUZ3N252Q3dXNEtsanpqNG4zUjBwbFoyZ0s4bVlx?=
 =?utf-8?B?UjRwd3ZRaU9QNnc5MFByQVY2SFN0RG9kTWs4M2RzUWtKMmNWTEowbXd6cmZY?=
 =?utf-8?B?T29iUm1ZcjVQaU1XdTJ3d0N6VXg4YVl1NFI0a2t0bFB6NnF2MXdWWmx4T09r?=
 =?utf-8?B?WWxONUpyZEYrWjBXU3A0RnZqdmJ1b0oxdDB5K215enpsR2U1ZUxDUWJEdUVW?=
 =?utf-8?B?ckx3UjZiTWZpZWY4enVkS2Rrc2hEL1VYUXNuOEhSeFBGY3dhMnlZL255cVI1?=
 =?utf-8?B?NXN1cy9pMVZrQ1o2Sys4bHlQQ3J0eXd3c1NnRkkvWFAxQzFkbDNKeFdOYmJJ?=
 =?utf-8?B?MU5YVFVsYW94MHE2aEZMNnYvaXpOMXZDM25uVnJZMGNVOUgvMWtxcllwYjky?=
 =?utf-8?B?TVJyNi9pS3dMTG05N3ZxSEthaTBwKzQvNDhjamtBYk5jSVZCYVBFKzFRclE1?=
 =?utf-8?B?dFdIQUFXQ3cwQmo5T3U0SUVhRDgzVjBEUjlkYm95ZFl2R3NkU0p1bURCS0Vu?=
 =?utf-8?B?SlNZMzRsdGJPSGVCc3dONDhlV2FKcUhqUmprVHJJOGh4L21RTUFmcjl5VmZH?=
 =?utf-8?B?QnlPMUJCMEI2MURlV1VoRkQ2R0p1eHB1NElZVkptTERmR2pxYVRYL0pyMTd3?=
 =?utf-8?B?bWdmbFFvM21YR1hwOCtLSnA3YU5hOFlOYTkyenlaMCtDNGRrc0hxdi9sZEJR?=
 =?utf-8?B?VFIyUmczdFduREJJSmlONG1wUkNnTDVVSExVY05yUUtadTZqTnl5YzBZNXd2?=
 =?utf-8?B?R0FQcDNVdVFnZXhzRWk5NytoSzV3QmlscXZhcEtMb1NuelFtKzRNZ3BzMHZE?=
 =?utf-8?B?SEdTZ1UvREtsM3RHcW9vM3doRmtPSDcrQWlVQWhiZkIxaXYrVFhaaDU0ZXZM?=
 =?utf-8?Q?1KIKcPOjUF9l+Rd60x6CnNsUe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd9698-4e82-411f-65b8-08dcafd24553
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:28:02.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9wk1ny17WRq1/baAQARkZMAjBikw1zkA4smT4u2kB8H60sWgOlZpPgxqZC7ibkB1NyywKsF0sdbbf7xgfVGLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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



On 2024-07-28 20:02, Melissa Wen wrote:
> On 07/25, Alex Hung wrote:
>>
>>
>> On 2024-07-05 21:35, Melissa Wen wrote:
>>> instead of parsing struct edid.
>>
>> A more informative commit message will be helpful.
> 
> sure. I'll improve it in the next version.

A soft reminder - a few other patches need improved commit messages too.

>>
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 17 +++++++++--------
>>>    1 file changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index 7657b1051c54..45c04de08c65 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -97,7 +97,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>>    	const struct drm_edid *drm_edid = aconnector->drm_edid;
>>>    	struct drm_edid_product_id product_id;
>>>    	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>>> -	struct cea_sad *sads;
>>>    	int sad_count, sadb_count;
>>>    	int i = 0;
>>>    	uint8_t *sadb = NULL;
>>> @@ -127,18 +126,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>>    	apply_edid_quirks(&product_id, edid_caps);
>>> -	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
>>> +	sad_count = drm_eld_sad_count(connector->eld);
>>>    	if (sad_count <= 0)
>>>    		return result;
>>>    	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>>>    	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
>>> -		struct cea_sad *sad = &sads[i];
>>> +		struct cea_sad sad;
>>> -		edid_caps->audio_modes[i].format_code = sad->format;
>>> -		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
>>> -		edid_caps->audio_modes[i].sample_rate = sad->freq;
>>> -		edid_caps->audio_modes[i].sample_size = sad->byte2;
>>> +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
>>> +			continue;
>>> +
>>> +		edid_caps->audio_modes[i].format_code = sad.format;
>>> +		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
>>> +		edid_caps->audio_modes[i].sample_rate = sad.freq;
>>> +		edid_caps->audio_modes[i].sample_size = sad.byte2;
>>>    	}
>>>    	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
>>> @@ -153,7 +155,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>>    	else
>>>    		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>>> -	kfree(sads);
>>>    	kfree(sadb);
>>>    	return result;
