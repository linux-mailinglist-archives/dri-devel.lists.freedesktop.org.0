Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBD39E04C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 17:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7A56E0F4;
	Mon,  7 Jun 2021 15:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B10C6E0F4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 15:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJs8h2dupq0+SmgfbGWMCdRwz1n+miu2SYtnSeZQFpmg80Kf9WZY2glr05yvnNGCXxLF6M0WHvNkiASxac8RgUlRkIRwIuukZQc2cf0B83dv4Xm+iv4yEEC767lBKMN+o11zNFPevKrnFI/ijGTWHO4L4pL27AcVnY9/vApNvJfxmOzVNcasiUcRmBD/jpH14m7TNTssJQ4hlPxebvaxicLt+4ulRy+8TSLCtmG2gUppy8PEzAVIzK/VpTo+2nIHoaFh/c3yRXyG7rX56U21W6WQdQlqDlWPVnTOpIswUJP1oNnLmg+AzU+zZ/gSL5YrAmQWaTcWYfbDnR4/Eg5TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Keyt99Ep/mJtHZubkItoHvrskK50fPTPeMElTZx8d4=;
 b=m2Hp4pjx6p+tJOSIlyJGDHoFa/362Ahq09cVbrzB3/ENYqhUW0akRzmpFeKNMrTZ2/b6PuYD3R9DmGdpCNFdZT36FIbz3Mw/Q4ut3DOZLLzx3LHA7MUf0IXBA+62dx9bX8JjonxNUB2VpeyUuKdJUYQnnTMEkXQKTziAFe2wTHYH1cAiNI05+lQ55T3iPM7mLBDja/PqqYysAZeIWcN2txlgvqrySxQAEECV9qqHhui/MCbSGTTpn9ddxGFDDlQlt/9yjQd+UZb99qDE41sRhs1kXI9y+3WUmEc8ZOMlfzLF9+0T8Yd5/oCuwZTqSnVuIrQSTwnsgRUJd9v28/mBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Keyt99Ep/mJtHZubkItoHvrskK50fPTPeMElTZx8d4=;
 b=Nb8/8iHVtoBxisyzEVDK/u8GYeZ7rFFFcUkK7so1c9oQmUZeFFTH054jJ12TDeoCzCiJUL6qtT9QKljqpQ6BI7fvb38DEExfKDAyXAgdZyGJXSWfXJS0pLZNevAG7ZM16jz4HCvhBzgKQDFD5AIf+c26EoB0gcZIUKxfpVf0fQw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 15:27:16 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Mon, 7 Jun 2021
 15:27:16 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
From: "Das, Nirmoy" <nirmoy.das@amd.com>
To: "Yu, Lang" <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
 <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
 <f067ec3f-ae6c-fb9d-d87b-e31311bf3cf3@gmail.com>
 <DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com>
 <1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com>
 <73ffb605-3d7c-3493-38e3-a0dac7914ccd@amd.com>
Message-ID: <680bfa05-4773-e21e-9676-88dc55a8476a@amd.com>
Date: Mon, 7 Jun 2021 17:27:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <73ffb605-3d7c-3493-38e3-a0dac7914ccd@amd.com>
Content-Type: multipart/alternative;
 boundary="------------C8127BDAE88E3C815CCEA2B5"
Content-Language: en-US
X-Originating-IP: [2003:c5:8f23:f000:35b7:4019:acfe:19dd]
X-ClientProxiedBy: PR3P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::9) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f23:f000:35b7:4019:acfe:19dd]
 (2003:c5:8f23:f000:35b7:4019:acfe:19dd) by
 PR3P191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 15:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c94a512-17b3-4289-e678-08d929c8bb37
X-MS-TrafficTypeDiagnostic: DM8PR12MB5479:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB54795161710E9D9363A7023C8B389@DM8PR12MB5479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9kUATMMvokckRIWM44ggKTl954q7kSvqy9PwHYJO1j8wGsvYR6iAoLGbW4o76nt/YbcgJYllS2ts3tEgbbBQTDbXV1ldjP1x4irKFaRNGsxX31zpJ8BX6ktkaXxMimemnDYiVZqFaq61ZhwpDjt0SXQMRHt5slcEXJIa6SYYJR96jQBVZ+Y3PO36raC3N2uXl+yeJC8nW0e8/GCzh6o/+Ibfq08Iaonyf92/MiecczqVFm+GqfwQG4L0g/m5C1JtNyL0Ywx43KyTXytHmTlEsyz45g98tCEsEN5uQt0jqelHwkNfaUfVHSdF4qflw9HaQ4xreyxgZY2iZnkl+J9E+gZBAOu8jH4oPTg+nS0ePIOJhFDq233STdnedlRE1nnM2eoT2LZrQni+ge67ziw6M8AYEDlwDHDfWiq6FtmyvRRsTrtPpeTd0K+YHPef08/7tbq4jcnS/fv4YA4GVlx6OwL+9oNGpbKZcLc02qXf9JEP6KIRJo2xTFQtIsINLxz5fz1mJ3uHfJ2kwT58JP2NBAx9lbhPv5F/Z+mXzyTBGcdaACikyEombFqAfwPQeL4m1SVxIbKezAwstNHTYzcD9z7q7SXOpRR97ttZoGoUNZRhbIPEIj7IYOrQC+5ZrpzszhGYadgvCz2BOJnXfNHD9vQwK9NwHYZ0BYNYtce982n/HXRCLP2V3VG4pWnVO355ISg6H2jntL3guCUgi4mnp2MW4XqdzO9uLwAFQIBqy5qq6CiwbN5wSYQ+GG+P2/wlclzD2lSQLMl+iJXAJZ34c/KPp7ORehY0Ls8ul7T2RFw+OOFLP6N4szssdDCpxle
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(83380400001)(966005)(52116002)(66556008)(31686004)(66946007)(53546011)(86362001)(33964004)(2616005)(66574015)(66476007)(8676002)(38100700002)(6486002)(36756003)(166002)(8936002)(2906002)(45080400002)(316002)(4326008)(16526019)(110136005)(31696002)(186003)(5660300002)(478600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmI0L3h6WXQ3NTA0cXJzUFd2VkE3eXU0VHpnZUk5WmRZNU9XR0tiYjBmdFY3?=
 =?utf-8?B?QjBLZmpnbGFUdHNMTXd6UnhPQ1doWVBLVVBsTzhUaTVhZEt0bDVvd1VtaUNw?=
 =?utf-8?B?dGNhZExWcXpEVW1mRVhzZS9FS1lHanNQbFlTT2ZkS3ZoaW5jY3JRQmFkaFls?=
 =?utf-8?B?eFVJOFVpTFhIRERKMkNBYlpJdXVXdG9oVW14RTZJUVNwQnUvT0lQaGgvbTdv?=
 =?utf-8?B?YjQ2ZitCU1VtN0hlMVNBTE1iei9Hams5dm5STmNHeEMrY3U4NkpCREwyRTEy?=
 =?utf-8?B?K3RYSmV1V2VtMkErT0w4cWt5VnRCY3YydE9RUlBGb1ZJYVJYRUJVVjdJVGNH?=
 =?utf-8?B?M0RDZnpoalRRall4a1h6VTIyRzBvRnlZcE5OTzFWRitReUhyQVNXTGF2VXFi?=
 =?utf-8?B?byt6cDQ5c3E3TE43TWk3ZWNva00zZlFLOCt5NGw1c2hrYnZVQldoeHA3OVRv?=
 =?utf-8?B?TVFuWnVPQmhqWFZ1Z3JBNDllOU9UNndrTVRZRG04RUNaNzdZK2dqc2hoVkQr?=
 =?utf-8?B?TTNlZHRZM1lyV3dPN05yWmVRT0dmTVlKbXZwamJIVU4yc094U05nZHBTUUFq?=
 =?utf-8?B?S3lta1BFc09MTjE3TDUzVHFSSmhZUm5scVpocytQNVNCS2d0K1lQdkljUnY5?=
 =?utf-8?B?eXl4OXRwY2VmQmpER0F5cDJjU1JiMG1YUnBtNjBwc3BZck0rUnZOc0xQT00y?=
 =?utf-8?B?V25OL0N4eC9PbEw2aUhwSkdkdm5aYkFDWVdVck5kcnRiTTd5TDhoaDdPT3Zh?=
 =?utf-8?B?VVhFUDJ3eDZzM2E3eDZPVWRkT1VmNjhBYTBaQnBxYmRWL0pGV2VpQ0ZMODU0?=
 =?utf-8?B?dGVJQXU3cnh4eTByWDZFbzJzUHpJY1FqcVJJeTlrMlhIUkQzN0RjR1RvMWtP?=
 =?utf-8?B?Zmd0ODRlaHpSdXd2RmIrcHFmSm91ODl0a21jVFN5RlFGbXdEWldHbGdMWk4w?=
 =?utf-8?B?bXdkRm55MzErSFNaaE9lcU5hbFAwbk5nR0RybFNlMUtzMWs3NlV0VSsyVlBm?=
 =?utf-8?B?a2phMkt6TWlVWXZZQ2JjSkVNTlUvQk9HQVhMK2pnYUZDUFp1WWpCL1NXVklr?=
 =?utf-8?B?SXpvVVEySHlrd1JtSXY4cGRheGRacTc5b3pBdmd1c0JpUHkzTEJPdTFleUlj?=
 =?utf-8?B?ZWxOcUpWT0JjN3J3WUJySHVvNzRqOGVOQ3FYUy90V2k3Y3ZVdG5kOWp2dXpa?=
 =?utf-8?B?bTF0dlNOY3Z2bkhsWE1JTFF0Uk5jMnJBaC9jUXhMY29UOGMzZTdJczZOM1p2?=
 =?utf-8?B?YzhubEpqbWFrSmNlbzFLM2dxWXlhSnBFc3BPeU54emIrVWZjNy9WdFlYa2NS?=
 =?utf-8?B?clpXSnZkZEh3NmpkQ0M1SkhLWloxUXRVem9xT2dpQzN2L0dOUjVsV2JsdXZn?=
 =?utf-8?B?c0RQeDVTaDZ6K2lzeFVPRGJyejVnUU1xQUF6N2RPWmhITDlLYTNrSmg5dy9I?=
 =?utf-8?B?aGpEQVQ4NHUzWUVFZklOTUFWTHA3RWdjd0d4SWdIWm5qdXd2N2JUU1ZKRVJn?=
 =?utf-8?B?VW9hWVMxRVZhZ0c2dkFhdldDaEUxK04yUXpqenVCUTUvZDRDd0o3eEJiNW4v?=
 =?utf-8?B?cmhva3VWOXFJUEVEbTM2aThLaGE3bUFGaWtrVzNyTld0aXRWTHVQMkFMaG5w?=
 =?utf-8?B?NlFsWTd0bGU1L1dlVVV0clk2K2dDSXpwVzlZQXBIdEQ3NDZyS1l1RWdQZGtz?=
 =?utf-8?B?L0R0WnRKNCtaMkx0WGRzcEVuaURyTTNQMHB4RmNNYVc5VHVUSGJubUd3NHFH?=
 =?utf-8?B?cmhhWjhId2FxU0M3REUrOXBSSlBjS0dneEVjczRPZEc0N2FsYzR4SWR4RFYy?=
 =?utf-8?B?VzZVSm4zZjF5eGpOYzZ3WVg2Y3duVVpVZFgvUlIrTjluRlhDOFJvZDFvT0dI?=
 =?utf-8?Q?MhgYqhCZwN4o/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c94a512-17b3-4289-e678-08d929c8bb37
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:27:16.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOcKpHWNAIkfxd7Tj+lsrkyPsp15wKX3I4N5y8i1wFy77QwCs9ZVJUWayxWp+Qq0GgeUjuLoolh9Pa1acdZxUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------C8127BDAE88E3C815CCEA2B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian and Lang,


I can't apply it cleanly because of 
https://patchwork.freedesktop.org/patch/436305/. This series needs a rebase.


Regards,

Nirmoy

On 6/7/2021 4:42 PM, Das, Nirmoy wrote:
>
>
> On 6/7/2021 3:01 PM, Christian König wrote:
>> Hi Nirmoy,
>>
>> can you give that patch set a testing round and an review?
>
>
> Sure! I will get back asap.
>
>>
>> The memory stress test with low VRAM on APUs should be sufficient and 
>> you should have that setup still around.
>>
>> Thanks in advance,
>> Christian.
>>
>> Am 07.06.21 um 14:58 schrieb Yu, Lang:
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> Thanks，please let Nirmoy do it.
>>>
>>> Regards，
>>> Lang
>>>
>>> 获取 Outlook for iOS 
>>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2Fo0ukef&data=04%7C01%7Cnirmoy.das%40amd.com%7Cd789a01a337743638ed308d929c28fa0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637586737878220366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=TkIx1d6hvZtrP6iQihfUlrB6oBP9QZGfNa08anYm4X4%3D&reserved=0>
>>> ------------------------------------------------------------------------
>>> *发件人:* Christian König <ckoenig.leichtzumerken@gmail.com>
>>> *发送时间:* Monday, June 7, 2021 8:41:49 PM
>>> *收件人:* Thomas Hellström (Intel) <thomas_os@shipmail.org>; Yu, Lang 
>>> <Lang.Yu@amd.com>
>>> *抄送:* dri-devel@lists.freedesktop.org 
>>> <dri-devel@lists.freedesktop.org>
>>> *主题:* Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
>>> Thanks!
>>>
>>> Lang can anybody from your team give as an reviewed-by/test-by on the
>>> amdgpu patches? I just want another pair of eyes looking over it.
>>>
>>> If nobody else has time I will ask Nirmoy for a quick testing round.
>>>
>>> Thanks,
>>> Christian.
>>>
>>> Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):
>>> > Sure. LGTM,
>>> >
>>> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> >
>>> >
>>> > On 6/7/21 2:36 PM, Christian König wrote:
>>> >> Thomas any comments on this?
>>> >>
>>> >> Is the purpose of this now clear enough?
>>> >>
>>> >> Thanks,
>>> >> Christian.
>>> >>
>>> >> Am 01.06.21 um 14:25 schrieb Christian König:
>>> >>> From: Lang Yu <Lang.Yu@amd.com>
>>> >>>
>>> >>> Sometimes drivers need to use bounce buffers to evict BOs. While
>>> >>> those reside
>>> >>> in some domain they are not necessarily suitable for CS.
>>> >>>
>>> >>> Add a flag so that drivers can note that a bounce buffers needs 
>>> to be
>>> >>> reallocated during validation.
>>> >>>
>>> >>> v2: add detailed comments
>>> >>> v3 (chk): merge commits and rework commit message
>>> >>>
>>> >>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> >>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>> >>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> >>> ---
>>> >>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>>> >>>   include/drm/ttm/ttm_placement.h | 7 +++++--
>>> >>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>> >>>
>>> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> >>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> >>> index 51a94fd63bd7..6b393502198e 100644
>>> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> >>> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct
>>> >>> ttm_place *places,
>>> >>>   {
>>> >>>       unsigned i;
>>> >>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>>> >>> +        return false;
>>> >>> +
>>> >>>       for (i = 0; i < num_placement; i++) {
>>> >>>           const struct ttm_place *heap = &places[i];
>>> >>>   diff --git a/include/drm/ttm/ttm_placement.h
>>> >>> b/include/drm/ttm/ttm_placement.h
>>> >>> index aa6ba4d0cf78..8995c9e4ec1b 100644
>>> >>> --- a/include/drm/ttm/ttm_placement.h
>>> >>> +++ b/include/drm/ttm/ttm_placement.h
>>> >>> @@ -47,8 +47,11 @@
>>> >>>    * top of the memory area, instead of the bottom.
>>> >>>    */
>>> >>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>> >>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>> >>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>> >>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>> >>> +
>>> >>> +/* For multihop handling */
>>> >>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>> >>>     /**
>>> >>>    * struct ttm_place
>>>
>>

--------------C8127BDAE88E3C815CCEA2B5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Christian and Lang, <br>
    </p>
    <p><br>
    </p>
    <p>I can't apply it cleanly because of
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/436305/">https://patchwork.freedesktop.org/patch/436305/</a>. This series needs
      a rebase.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <div class="moz-cite-prefix">On 6/7/2021 4:42 PM, Das, Nirmoy wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:73ffb605-3d7c-3493-38e3-a0dac7914ccd@amd.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/7/2021 3:01 PM, Christian König
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com"> Hi
        Nirmoy,<br>
        <br>
        can you give that patch set a testing round and an review?<br>
      </blockquote>
      <p><br>
      </p>
      <p>Sure! I will get back asap.<br>
      </p>
      <blockquote type="cite" cite="mid:1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com"> <br>
        The memory stress test with low VRAM on APUs should be
        sufficient and you should have that setup still around.<br>
        <br>
        Thanks in advance,<br>
        Christian.<br>
        <br>
        <div class="moz-cite-prefix">Am 07.06.21 um 14:58 schrieb Yu,
          Lang:<br>
        </div>
        <blockquote type="cite" cite="mid:DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com">
          <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" align="Left"> [AMD Official Use Only]<br>
          </p>
          <br>
          <div>
            <div>
              <div>
                <div dir="ltr" data-ogsc="" style="">
                  <div dir="ltr" data-ogsc="" style="">Thanks，please let
                    Nirmoy do it.</div>
                  <div dir="ltr" data-ogsc="" style=""><br>
                  </div>
                  <div dir="ltr" data-ogsc="" style="">Regards，</div>
                  <div dir="ltr" data-ogsc="" style="">Lang</div>
                </div>
              </div>
              <div><br>
              </div>
              <div class="ms-outlook-ios-signature">获取 <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2Fo0ukef&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7Cd789a01a337743638ed308d929c28fa0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637586737878220366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TkIx1d6hvZtrP6iQihfUlrB6oBP9QZGfNa08anYm4X4%3D&amp;reserved=0" originalsrc="https://aka.ms/o0ukef" shash="gszyxGAXNrgArUnrhQQeivk7AuAAyNE6bTPhVIW3B2JI8UTjQe4Hi8Lk6Kr99OWLAN4GK15/4cvTc8W9JXG5kNVhxnFhCIGbj5eG+r5yOSVEosc8ou1+9NuZVFTMkZbYaYCOwHVZpbmEz58h22Tv++5lAulLk1VBhk/dFqFyNlg=" moz-do-not-send="true">Outlook for iOS</a></div>
            </div>
            <hr style="display:inline-block;width:98%" tabindex="-1">
            <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>发件人:</b> Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
                <b>发送时间:</b> Monday, June 7, 2021 8:41:49 PM<br>
                <b>收件人:</b> Thomas Hellström (Intel) <a class="moz-txt-link-rfc2396E" href="mailto:thomas_os@shipmail.org" moz-do-not-send="true">&lt;thomas_os@shipmail.org&gt;</a>;
                Yu, Lang <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
                <b>抄送:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>
                <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
                <b>主题:</b> Re: [PATCH 1/4] drm/ttm: add
                TTM_PL_FLAG_TEMPORARY flag v3</font>
              <div>&nbsp;</div>
            </div>
            <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
                  <div class="PlainText">Thanks!<br>
                    <br>
                    Lang can anybody from your team give as an
                    reviewed-by/test-by on the <br>
                    amdgpu patches? I just want another pair of eyes
                    looking over it.<br>
                    <br>
                    If nobody else has time I will ask Nirmoy for a
                    quick testing round.<br>
                    <br>
                    Thanks,<br>
                    Christian.<br>
                    <br>
                    Am 07.06.21 um 14:38 schrieb Thomas Hellström
                    (Intel):<br>
                    &gt; Sure. LGTM,<br>
                    &gt;<br>
                    &gt; Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a><br>
                    &gt;<br>
                    &gt;<br>
                    &gt; On 6/7/21 2:36 PM, Christian König wrote:<br>
                    &gt;&gt; Thomas any comments on this?<br>
                    &gt;&gt;<br>
                    &gt;&gt; Is the purpose of this now clear enough?<br>
                    &gt;&gt;<br>
                    &gt;&gt; Thanks,<br>
                    &gt;&gt; Christian.<br>
                    &gt;&gt;<br>
                    &gt;&gt; Am 01.06.21 um 14:25 schrieb Christian
                    König:<br>
                    &gt;&gt;&gt; From: Lang Yu <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
                    &gt;&gt;&gt;<br>
                    &gt;&gt;&gt; Sometimes drivers need to use bounce
                    buffers to evict BOs. While <br>
                    &gt;&gt;&gt; those reside<br>
                    &gt;&gt;&gt; in some domain they are not necessarily
                    suitable for CS.<br>
                    &gt;&gt;&gt;<br>
                    &gt;&gt;&gt; Add a flag so that drivers can note
                    that a bounce buffers needs to be<br>
                    &gt;&gt;&gt; reallocated during validation.<br>
                    &gt;&gt;&gt;<br>
                    &gt;&gt;&gt; v2: add detailed comments<br>
                    &gt;&gt;&gt; v3 (chk): merge commits and rework
                    commit message<br>
                    &gt;&gt;&gt;<br>
                    &gt;&gt;&gt; Suggested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a><br>
                    &gt;&gt;&gt; Signed-off-by: Lang Yu <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
                    &gt;&gt;&gt; Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a><br>
                    &gt;&gt;&gt; ---<br>
                    &gt;&gt;&gt; &nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp; | 3
                    +++<br>
                    &gt;&gt;&gt; &nbsp; include/drm/ttm/ttm_placement.h | 7
                    +++++--<br>
                    &gt;&gt;&gt; &nbsp; 2 files changed, 8 insertions(+), 2
                    deletions(-)<br>
                    &gt;&gt;&gt;<br>
                    &gt;&gt;&gt; diff --git
                    a/drivers/gpu/drm/ttm/ttm_bo.c <br>
                    &gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                    &gt;&gt;&gt; index 51a94fd63bd7..6b393502198e 100644<br>
                    &gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                    &gt;&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                    &gt;&gt;&gt; @@ -929,6 +929,9 @@ static bool
                    ttm_bo_places_compat(const struct <br>
                    &gt;&gt;&gt; ttm_place *places,<br>
                    &gt;&gt;&gt; &nbsp; {<br>
                    &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
                    &gt;&gt;&gt; &nbsp; +&nbsp;&nbsp;&nbsp; if (mem-&gt;placement &amp;
                    TTM_PL_FLAG_TEMPORARY)<br>
                    &gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
                    &gt;&gt;&gt; +<br>
                    &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_placement;
                    i++) {<br>
                    &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct ttm_place *heap
                    = &amp;places[i];<br>
                    &gt;&gt;&gt; &nbsp; diff --git
                    a/include/drm/ttm/ttm_placement.h <br>
                    &gt;&gt;&gt; b/include/drm/ttm/ttm_placement.h<br>
                    &gt;&gt;&gt; index aa6ba4d0cf78..8995c9e4ec1b 100644<br>
                    &gt;&gt;&gt; --- a/include/drm/ttm/ttm_placement.h<br>
                    &gt;&gt;&gt; +++ b/include/drm/ttm/ttm_placement.h<br>
                    &gt;&gt;&gt; @@ -47,8 +47,11 @@<br>
                    &gt;&gt;&gt; &nbsp;&nbsp; * top of the memory area, instead of
                    the bottom.<br>
                    &gt;&gt;&gt; &nbsp;&nbsp; */<br>
                    &gt;&gt;&gt; &nbsp; -#define TTM_PL_FLAG_CONTIGUOUS&nbsp; (1
                    &lt;&lt; 19)<br>
                    &gt;&gt;&gt; -#define TTM_PL_FLAG_TOPDOWN&nbsp;&nbsp;&nbsp;&nbsp; (1
                    &lt;&lt; 22)<br>
                    &gt;&gt;&gt; +#define TTM_PL_FLAG_CONTIGUOUS&nbsp; (1
                    &lt;&lt; 0)<br>
                    &gt;&gt;&gt; +#define TTM_PL_FLAG_TOPDOWN&nbsp;&nbsp;&nbsp;&nbsp; (1
                    &lt;&lt; 1)<br>
                    &gt;&gt;&gt; +<br>
                    &gt;&gt;&gt; +/* For multihop handling */<br>
                    &gt;&gt;&gt; +#define TTM_PL_FLAG_TEMPORARY&nbsp;&nbsp; (1
                    &lt;&lt; 2)<br>
                    &gt;&gt;&gt; &nbsp; &nbsp; /**<br>
                    &gt;&gt;&gt; &nbsp;&nbsp; * struct ttm_place<br>
                    <br>
                  </div>
                </span></font></div>
          </div>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------C8127BDAE88E3C815CCEA2B5--
