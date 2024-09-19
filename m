Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCF97CD1F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 19:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433DB10E737;
	Thu, 19 Sep 2024 17:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="avbCOyyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F330010E736;
 Thu, 19 Sep 2024 17:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT1QO3CAXURQjLegNsKSSDF6UH3Q3tVsxm3c0Tks4H+xjM3VjQ5wAa9ea+N0LRMXwiRiNDehjmWnziO1uKu7m294sB+VYq81xGoPeLcSPYhHF2cpvlw5jjQHw909C1OuIreKP2NFmY+ifTgB50n7nvTTJd7eLVpeF9zuxo/+3LPavT4a4eoMZ62j1qhZ6hOVc5DXKPteHuLXHhvJ/HRYqkKF6i11cMZxkWJWkZl7ZxxxK6F2cxAQ5lus1zWx+xaLWA7LVPU/+dq0yt0fM7PDZ1fYFHAYSSPwQw8XZZC3M/wH62W5u7GyT6pzrGL6FnYxxVZJ5NHvm+wZAEqnvkolbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el218b2gzEKl6ztiCaLBp43sSJ4J9s921Y/en5kDcC8=;
 b=tNwMaDaae+P/Q+l48mbiXtiec1u07Bn2ZrBD5AnT8Dzjj+GMuHLCx7pnO8Slk7WgeHzsjHa2eaVEeWlcUgUo2RPcYbx6x4L3FCfeb0iGdbjgCi5T1gNOZZ6Dpy19+PD7CQtzocMb52pXBXc5upwV0JqeieoyE1jAo6vK39SsaSyJh6po/6lO6Vj4BmE+TP8+SEn9MhNbQMiIk2l0Iqjr6bd6DaooEejenH7ahJkLmg2Hs97GuTO41Cp0szpqawAjqwx5mZLklXggXm6wBat4kgDjtDjBmHDaQ5bhU+q4XuawRJ6vdB2Aom3VMv4WUToaRc+bnbkPhPW0zjY/oBIm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el218b2gzEKl6ztiCaLBp43sSJ4J9s921Y/en5kDcC8=;
 b=avbCOyyMsusI7LJNo35b+doftzAsTXcV7DNQvf8GfTfZCNLxWhAJ2h+xv/4W6p2hFhTOMrgH2hPKLh4x8VkyyJ1FaQmE9PlOOhSw1ZRBptUsvazMozvQ1h8D3o7cIZ54ZT4DS3SEQ5ghbbl3m+YQidyIvi/onIQIc2NiaaXr238=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 17:36:35 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 17:36:35 +0000
Message-ID: <c369fd86-ae54-4d72-9447-2b91a5877a5f@amd.com>
Date: Thu, 19 Sep 2024 13:36:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Alex Deucher <alexdeucher@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen
 <mwen@igalia.com>, kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-11-mario.limonciello@amd.com>
 <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
 <e879e296-9453-4a76-a879-52b33143261d@amd.com>
 <CADnq5_P78bmWA+xWt0fq6=oSFt33K2TToEFDTx2CudTEuDuAoA@mail.gmail.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_P78bmWA+xWt0fq6=oSFt33K2TToEFDTx2CudTEuDuAoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0296.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::12) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 64dd460d-0f55-4774-fc1a-08dcd8d19be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnllUjdJWVZpcWZPLzR6NWQrNVhpUTMrTk9ISS9oalllOHN5cjJOWHB4MXJi?=
 =?utf-8?B?L3Q0YXN0SWhLcnp5K1VDVzVwMTZjTjNNS2pkNS9IYTFmeWRSZC9IWmQ3aHE3?=
 =?utf-8?B?ZlpLNXo3OXpNOWJDcDh4YzVSeVYwSmJrWnpYaW5pYjBLNlUxU1pEQ1NJdXAx?=
 =?utf-8?B?SGNQSlcrTjhUaGs0RHVnUE1LV1JKRm1ha1h1bkNOb1NJbnBJb0praWtNZE53?=
 =?utf-8?B?Ty9XSlY3eWFZSjVIcHFYb2hiNDlNWHFBOXNLVUdNY2V5SEdveEZTVzhtWHFP?=
 =?utf-8?B?eG1NaXlzanhwSXB5ci9hZjlpZmRUUGp5U3lwT0ErRzVpcDE3VjRVclM5QkhX?=
 =?utf-8?B?M3JtVUNQdFJqcnI0UVdUOFZOeFIvTWtNNGxNU0pnUGJTUDhrVjArbjMzY2dB?=
 =?utf-8?B?Q0M4UEdVSXFXamxJa2ZlL05GcC9JSHRnSFZobDdEMEdHSjZkVGx3c3kvcGdi?=
 =?utf-8?B?bTlnS2tTWmJ5cGZESzdqNTNCTjFQYkE2VnMwR2Z5NW12NWJzVHRCTU9qai9M?=
 =?utf-8?B?UlUrTTJra3dXWmNnWC9wQkdzRy9Yd3M4TEJSTm9SUkdsZ29CVXlOQkVnSWlC?=
 =?utf-8?B?WDFNVE1CaC9UMm03ckloekpnZzJJZS91SXdGL2F5em9GQzVwN2xRWk5NMVM5?=
 =?utf-8?B?MFYvM0xRc2xNWTdhNEhtK0w1cUZWWkZObFlMcksxNUhHV0tWRk8wVzBrMkUy?=
 =?utf-8?B?a3U5anVFZjJFanFtT2FSVVdsaE1RNGlNNXlObUttdWtFSjZBZVhHWTIwVkQy?=
 =?utf-8?B?ZzFGOE5RbXZqY0Q5TWp2bmE1ZVhVK0I0eUN4aUcxUElad3ZDYXpSTHNPR1A2?=
 =?utf-8?B?V2UwVndIK3ltNzJDUlo5cnZMaWpSZUdMclIwOUthTnhYMDVMUmxjNjFRUUJs?=
 =?utf-8?B?c0hiYmk1NEZxUm8rb1g5QWRTTFR0SVprVHRkMDdRNDEzRWdvZkZmYzJObGhJ?=
 =?utf-8?B?YzNWSk5OQTh5OVZzeWw1RjUxa0JmcWJSMVlDd2JLc0FKNDh5L25YWStpZSsw?=
 =?utf-8?B?NDBLbTVmeDRBVlRtTWtXdXRKNWJsVWFCK3NBaElnOURlMi9JV1QvL1RMdzM2?=
 =?utf-8?B?NG01M0JTMzBmMEZXRFdHTjRGV21rZ0ZpZ2dTS3libG5CNXNQWURteTdEdkJi?=
 =?utf-8?B?d2lpaG16bXlZUWZSZytmUDRXNk9wWXJEbVlXa1dJL2tza0cyYStNWjV2TnBL?=
 =?utf-8?B?QXpFYXZBckxJSStYSGNzL0tmelZtRUVwN3RLWnpQQ0JicE1HVWxYRFF4NEYw?=
 =?utf-8?B?bHQwV2xnK2hrS3h5Z1FkakY5dkN6V2djK2hCMlI5YUtaYVhlV0pGeStXR256?=
 =?utf-8?B?SDZqZEhybHZCVENuNkoxV1plc0NSeXZFVUF2YWluZytrMVpueUgwL2N1NG9J?=
 =?utf-8?B?UThTRi82L3FXZWVjQnB5WjdpK2M3UUxuNzdMNHpaRVY5R2NMelpCMDJJNXJV?=
 =?utf-8?B?d3d4RThKVldQMllZUDNXWkZ5YkRGMmlVd3g3a2dIWGdEK0NIT0NsdjZCdm1B?=
 =?utf-8?B?MEF3L0wwRHZQMjFBTFFuNHF0ZlBRbnhTY0x0c1dkSkJSQ2VxNVB2eUdDVjJ1?=
 =?utf-8?B?bjVscldvK204QjlvRzFqbSt5OXZ5a0thQ2ZFTlBXMVc2YytvOGxSTldxZGI3?=
 =?utf-8?B?d1lYVUhNNTFCVW45UnBRVk5pb1YvZ1B6ZjRLc21GcGtLblhDMVo2MTduN0Fs?=
 =?utf-8?B?Rk1LWEd1VndtV2d6cWFNMDVLdTB6dEJoZmk5SVBMWGJhYTVuRDdpQmNINjgv?=
 =?utf-8?B?ekd3bTBJS0tXWkdrY3NTcVA1YkQ0eEdaWCtTK1UwaE9NbU5lS1Rzc05KQlVV?=
 =?utf-8?B?TThzVU90K1J5WFpZNHlkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJic3lhMGdzbnpzdEU3K05FNlZNclVhMW5mamxtS1BMdWE0LzZTZWwzM083?=
 =?utf-8?B?U1hHQnFJa1hsdE5mUiszZHlrbzVaR2ZwYWcyWitaRHl0Q1FsZ0M2eUx3NWl5?=
 =?utf-8?B?U2hDaGNzVUFZcUtISFFKNWFNejA5OCtBazFQN3FtM3NXckNUVjROb1NHcUx4?=
 =?utf-8?B?S2lLQTRFZTJhVHJBbjZNdzYxM1d0RDllc1NLbU9UWjhCdmE0TDM3NTN1NWNH?=
 =?utf-8?B?TVVSQWlJSy9NTDlPR1E0d2hYQXlXUHFVUUJmSWZVaDdhcCtSNlI4UWw1eDFi?=
 =?utf-8?B?M2JNUGFkQUFZQktMc1pmZnBiV01oM21JaTMvcmI5OHViZjNBbTNMV25OeTB1?=
 =?utf-8?B?T0ExQldaN2FTVVoxcGVwQUZBNnk2RDZZalZlWlhYVDh3WkJFNkdUVEhoMXVm?=
 =?utf-8?B?N0VKTWxISk9hWUpNSUM5K2dBOGJuL3M4RDNESjlKblh2eGpiY050Q3lGL0hY?=
 =?utf-8?B?THJScmFrL3dMbnBQMjBQTTFoRFlmdEdGZC9UOE9jOC9PaVdscTN0Ym9Velhp?=
 =?utf-8?B?MytKSS9RM0FDblJpSDRPeVFzVjdXak11WDNUS3dyMVloWi9maDRqV3NrR1hs?=
 =?utf-8?B?TWFVSXE1UWt0YjJscjFVMk5iakhZNlRLSFh2Vmh3ZTI4RFEzb2JPVlRtYjR0?=
 =?utf-8?B?MU92NjJSMHU4cDlaZlJ6NmJTTFJad3l4c2wvYmZWdnNQeEt0MlJING5SZmhr?=
 =?utf-8?B?NCtzZDNXSGE1eWZQSi8wSDB2ZThEdUUzMmc5b3NXd0liYW1TUGlkQnNCN0hC?=
 =?utf-8?B?c2ZVbkdiUDRxL09iRXR0SHl0YWtHOTFITWJOMVd5N1QwM2NXaVpTQStLQTVC?=
 =?utf-8?B?eUhJMjVvTDFwSTNtK2N3RVd4UlR5QjV1MUFuVDV4VUZuL3VvcFBvWnNaVVlT?=
 =?utf-8?B?YkVFREo4aGJnYXVOc2h5YS9IZElNQjh3ejg3VEVneHJGOGEzNXFmM0dTaHFK?=
 =?utf-8?B?WVRiVkxPemdaNlZveWRYdzR2UGlhTnREMnlmbExhYThna2dPWVVObTlLTzJS?=
 =?utf-8?B?ci94ZHFsOVdUdmhFRTVQSlM1L0laWHRQT0JtM1FBYmRGdTRhTHhlV2lqa2Q2?=
 =?utf-8?B?NnorazVPWmN3Vi9NQTVTMklGVENMN1RsNGE4L2JPM2F5ZkxkMXhNOGVJRG9O?=
 =?utf-8?B?NFlieHFYTFJ6Nkt5WTFIQVlCVTk5R0pNN3lxdWQ3T1ozK0JlWGFJVXNxdndV?=
 =?utf-8?B?d1lYbHNLRFV6Nm1aazNIUjdtbnlRdWFiTUNtZlNIcmx3bmU1RStDWmNYYndz?=
 =?utf-8?B?WTd3SU1Ia3JtcUt2cUkxOEV4TXhBN3RXaWpkdTlkSm1yd0FkbU9uMkEwenZs?=
 =?utf-8?B?SFVVeTRNOWFNWWR3bTFpTU1iVGpUdXM3YlFMNWxhRmwwVjhBTEJudi9jeFRw?=
 =?utf-8?B?Y1lsdWp5UzJVNjhxU3VQak95S1M4bGdYcGpsMms3WWtUZVRReWZDbGFYWDE2?=
 =?utf-8?B?ZTNERHhuc0RLU2pCRTNMM1V6Y0QvSjcrM3I4elRoMHI2enZTbFhpaDZGL0xY?=
 =?utf-8?B?NCsrejlBZ1ZibThWeXhWYTJ6S3h5RllLbGVHRUpneFUyaXlBOGtoaDVrUWRV?=
 =?utf-8?B?Q3lmNmRqS1BOaHdDTE5odmVsQU9MREZYVzh2SThxWi9PWmlJSEo0UE56UXJt?=
 =?utf-8?B?ZUdpamRpY010dER3VTFUWUsyWHI1UVhybnlITmRscXI4YjIybXFPWld4RHZJ?=
 =?utf-8?B?bExFMmVYcy9uL1RKc28wUi9DT2FqbmZZQ2txS25tZVk1U3R6UmtDRzk5dVFP?=
 =?utf-8?B?ejNRdTBwWUk4Z05LbVV4b0ZjOHhpS1paK1JDRHFzbCsycksyTVlqVWNRaFN1?=
 =?utf-8?B?TmltcURnYmNVSVJtM2NiUVFudnE1RkkvYXg4SFZsVVZESTkyZzZZenRPN2Np?=
 =?utf-8?B?Y1dQNkpLWVJTejFhVkxjK2Y2aTFQMWlDV3hhOWxOR0Y4YWN6VXI1LzNzcG5T?=
 =?utf-8?B?a3ppL2FEOGYvblJrU2VGeWc2NVR2bTBSUGtTZXpkbVl4S1R1UjM5blVnekRJ?=
 =?utf-8?B?R0Q4eWF0dTRjVUtOWSticXdXSUhFVVl4YzFmS2lWaWw3RVdienhONk1rOUdM?=
 =?utf-8?B?V05mUjA5SFBKV1lHQUZWS1NxdWZkcVAyYVN6aC9JcmFLTEN4alIyTWREUW96?=
 =?utf-8?Q?onYWBMQetFJGd2w3+pm+v/mTB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dd460d-0f55-4774-fc1a-08dcd8d19be7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:36:35.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgNWUCWttqxPKA8xjidJ55zNosnf2X+FzXCtHe6alva6yGe0o6ziXxXCwUEaAM3yVp2LZbPsW6Zy+22aOIM8+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

On 9/19/24 13:29, Alex Deucher wrote:
> On Thu, Sep 19, 2024 at 12:06 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 9/19/2024 11:03, Alex Hung wrote:
>>> A minor comment (see inline below).
>>>
>>> Otherwise
>>>
>>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>>>
>>> On 2024-09-18 15:38, Mario Limonciello wrote:
>>>> Some manufacturers have intentionally put an EDID that differs from
>>>> the EDID on the internal panel on laptops.
>>>>
>>>> Attempt to fetch this EDID if it exists and prefer it over the EDID
>>>> that is provided by the panel. If a user prefers to use the EDID from
>>>> the panel, offer a DC debugging parameter that would disable this.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 ++++++++++++++++++-
>>>>    drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
>>>>    2 files changed, 66 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>> index 8f4be7a1ec45..05d3e00ecce0 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>> @@ -23,6 +23,8 @@
>>>>     *
>>>>     */
>>>> +#include <acpi/video.h>
>>>> +
>>>>    #include <linux/string.h>
>>>>    #include <linux/acpi.h>
>>>>    #include <linux/i2c.h>
>>>> @@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link
>>>> *link)
>>>>        return dp_sink_present;
>>>>    }
>>>> +static int
>>>> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block,
>>>> size_t len)
>>>> +{
>>>> +    struct drm_connector *connector = data;
>>>> +    struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
>>>> +    unsigned char start = block * EDID_LENGTH;
>>>> +    void *edid;
>>>> +    int r;
>>>> +
>>>> +    if (!acpidev)
>>>> +        return -ENODEV;
>>>> +
>>>> +    /* fetch the entire edid from BIOS */
>>>> +    r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>>>> +    if (r < 0) {
>>>> +        DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>>> +        return r;
>>>> +    }
>>>> +    if (len > r || start > r || start + len > r) {
>>>> +        r = -EINVAL;
>>>> +        goto cleanup;
>>>> +    }
>>>> +
>>>> +    memcpy(buf, edid + start, len);
>>>> +    r = 0;
>>>> +
>>>> +cleanup:
>>>> +    kfree(edid);
>>>> +
>>>> +    return r;
>>>> +}
>>>> +
>>>> +static const struct drm_edid *
>>>> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
>>>> +{
>>>> +    struct drm_connector *connector = &aconnector->base;
>>>> +
>>>> +    if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
>>>> +        return NULL;
>>>> +
>>>> +    switch (connector->connector_type) {
>>>> +    case DRM_MODE_CONNECTOR_LVDS:
>>>> +    case DRM_MODE_CONNECTOR_eDP:
>>>> +        break;
>>>> +    default:
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    if (connector->force == DRM_FORCE_OFF)
>>>> +        return NULL;
>>>> +
>>>> +    return drm_edid_read_custom(connector,
>>>> dm_helpers_probe_acpi_edid, connector);
>>>> +}
>>>> +
>>>>    enum dc_edid_status dm_helpers_read_local_edid(
>>>>            struct dc_context *ctx,
>>>>            struct dc_link *link,
>>>> @@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>>>         * do check sum and retry to make sure read correct edid.
>>>>         */
>>>>        do {
>>>> -        drm_edid = drm_edid_read_ddc(connector, ddc);
>>>> +        drm_edid = dm_helpers_read_acpi_edid(aconnector);
>>>> +        if (drm_edid)
>>>> +            DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n",
>>>> connector->name);
>>>
>>> It is better to always output a message when ACPI's EDID is used without
>>> enabling any debug options. How about DRM_INFO?
>>
>> Thanks, DRM_INFO makes sense for discoverability and will adjust it.
> 
> I'd suggest using dev_info() or one of the newer DRM macros so we know
> which device we are talking about if there are multiple GPUs in the
> system.

Ya, I'd personally prefer moving amdgpu_dm over to the new(er) drm_.*
family of logging macros.

> 
> Alex
> 
>>
>>>
>>>> +        else
>>>> +            drm_edid = drm_edid_read_ddc(connector, ddc);
>>>>            drm_edid_connector_update(connector, drm_edid);
>>>>            aconnector->drm_edid = drm_edid;
>>>> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h
>>>> b/drivers/gpu/drm/amd/include/amd_shared.h
>>>> index 3f91926a50e9..1ec7c5e5249e 100644
>>>> --- a/drivers/gpu/drm/amd/include/amd_shared.h
>>>> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
>>>> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
>>>>         * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the
>>>> time.
>>>>         */
>>>>        DC_FORCE_IPS_ENABLE = 0x4000,
>>>> +    /**
>>>> +     * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
>>>> +     * eDP display from ACPI _DDC method.
>>>> +     */
>>>> +    DC_DISABLE_ACPI_EDID = 0x8000,
>>>>    };
>>>>    enum amd_dpm_forced_level;
>>
-- 
Hamza

