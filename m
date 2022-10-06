Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5805F6E6B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A110E2A3;
	Thu,  6 Oct 2022 19:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86A10E499;
 Thu,  6 Oct 2022 19:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU+7f2uLG+5QLtsAI9nyhnfehp5T/jQ6rGBxgQcWuYKJr9intjrRoRX33F+cLaxE72mialCDvxxLxvnb6CaBeo/ADMTMvBNgZuKU4LFcOnh1+M66mucG3F4rUxxDX1MqOKnUkFhTkLxRpvVdXmQ6rRiLlk+7YPFzpJIuJG4vlgQLrYjgN/tNAaFFd4S/5hHDa+CgJOJtSZ9NF+09aaImF+2fyjfmpIk3rUI1aSOQuOH0MM77zhHaA2/+3WwHgwXvuPBNNBTSDKhfA7KT50Mslc2d779AM+N0wdFL61M7w70vBLw2rHEwN08IMWqhlC5Tl7YDFubOXVqz/DqVXpPdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdJJ5yN5iMVjxQQ1QR9/YqOw3ux5p1T3soLjGjd9D78=;
 b=lUFTxOYx7xGL5Qbisltj4GfUkOxgPzsXN7dJW5evdVJdEi+dPg+z6WDPva15QLpZN7XF5H2coK7oSbEIxBlxNzTQmIY0LoUl7lGCJsEF2JA5PzencB7mVlRxlmd83roMWwS6FP5+8uGz7/k4JZ0VkRvTPstTuxzoM8ABYfxz5MtSLGVzgMDYyDCtGm2gsCPMDx1ET69HRd9wogieCiw/Qi6CUVyRmy2UYzpREEkfbiBkU+45dGdu9OiDe5A6CMvn7NS/8qCZ3gtbbtdl92uye5v/ErbyqFy9y7MnMfZzMHhpeiS/czXUS9W7eH7MFSd9z2xEO/rqgvfkXxP3tjw8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdJJ5yN5iMVjxQQ1QR9/YqOw3ux5p1T3soLjGjd9D78=;
 b=C6zORDmnz3p+lbspb9RpSTtgj1QrGW1EQbG+BBjyFsmshvlqSd4vzWaR8+GoHyGNfTXYInCBc/h2zYDzRfI7dhtHcVfRUYrOvYLl+HdTRsjyBhwTTq8TICquXqXkT8vXMDvLvGJnDkqQdZiV76RYiiebfbjIfnJHE45lo8oc+mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 19:51:25 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02%4]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 19:51:25 +0000
Message-ID: <0608aa11-2165-7693-6cdc-1c7ef8228622@amd.com>
Date: Thu, 6 Oct 2022 15:51:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>
References: <Yz6W+j+l0cJbr5dX@debian>
 <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be52a60-e629-4eb9-a262-08daa7d426b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x41ZG7hqWm6c4Z/540qYIg9LRVC2j1LwjMSHyoWREdEDA3ULIEwti3gh/meT/C/FL/XgCtErU3PjZj4v/pd6bJCu+slwbngxA2UExCV2/PvH2DyRRObwg2S2Vvt9HheVUc7dAJqzC+KxlQM54o3qqjCVEfc+5bVbX6rzl+FhvkHtKKGE6nNugbWfNB0USZ3WUm3ZIMFhbm36xX0gcGoxkOij0j3RS9YHXnIbHZ40zIrrvHvQeK/VpW2ENfVGOt+XWnEWPKHJ7sQX408OR/Pqdi7cpxOkVAqvaykf0KVrSaiwBfU+ljrZwb1tGxq7PGGCaHmYKPcFOPZ0ma/x6yVae0keys2BkzjYxHO9/6T+4FCwWoV6jVy7TIjM5++x2WyPIxGQt7cTFBTcP3+qX7EsN0gnMWxeASUWSVxOE1Rt29L3w5zNqIG1ilBHG2EaNxiw07FsGXhE/KViyrn3CEZT1+Ias1bigrL1SflESVDoXweJM4hX7wLQQwHOmxgyHKtp+fpLzQM16xgyrCnYIegwqwPUCgmnYCg5QDOxAFzLCVH/IzDWtNDXkh+ct4A8+9y+TUNB7YQDWKYSTOEXnF8MZ/jY90gzfaIyrFbAvPrWvHN8ZDDOj7DyxaJh2fsQXcuxoLkiKsxCTkHm1tmNUfLVp+L4urScoY0Z3VA67mcq/yTscjB2iF/zs15Xf7AG1ZZGqI06ekgkOqFvOvua5I08wtfh54A8HARDucFdG0ZgiCiTzg7dcs6BdyHQsGTufjQDTVPuzkW/ED0RxoaqxEbPmnEjv4+6sufOzKdr3SfCS4zI7Vs2AIy3YCgCQNBj0eyF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(26005)(8676002)(6666004)(44832011)(66476007)(6506007)(36756003)(41300700001)(6512007)(4326008)(5660300002)(66946007)(66556008)(8936002)(38100700002)(316002)(31696002)(86362001)(186003)(2906002)(2616005)(966005)(53546011)(6486002)(110136005)(31686004)(83380400001)(54906003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9KZnIwcDFCL3R0WlFuWm5QWFE5RFFuR0lmOHowVEd2b1hJRW9XNFZMM1No?=
 =?utf-8?B?TTdNZkRWYjNtdVR2REQxeXE2REI2TmtCRGQwOG9Pa0Zud1l2NjJUQ3VJUnQ3?=
 =?utf-8?B?cGtSenZ6emtjU3o5Qm5LZDMrSXJPRVo5czQ5NjE2dWMydmc3bm1aS2EyNkRH?=
 =?utf-8?B?cEJkUnBkbHFvdWFjQXBQcjI4emNRc1pmc1V2TkQySldiTExWM043cUY5Wk5T?=
 =?utf-8?B?MFdWOTJ2SS9NZEdaTU1qRFZQdkZ3VVlUY0FQaklhVUwwUU5IRjgzZEM5MzAv?=
 =?utf-8?B?cmkwZ0RaUldJUm9RUHo0V2RITjM0akxwTHJRSWVMTE01anVocVhLQXBMQ1Ja?=
 =?utf-8?B?U1IyUHJDZkpHRVlJb015eUFMUC9YNmQwa04yTU9iZEVKamlMR0l5MUE0VmI4?=
 =?utf-8?B?ODVwUEpjdlZ4U1V0a2NBTGJkcU56TmlOSVBtaEVmaHRVdkZnNDlhRHpUUlVw?=
 =?utf-8?B?RjNsV3NlWGhVR2xPQmdBUSt5WU5UL1J0MGJMR2RmTUszL1h0RjdHM3ZpQ0Zl?=
 =?utf-8?B?YnZsWDBxZ3JXaXZGMUgwZlN2VHlDZUFyMVgwSDZGZHZMTzBFYnkxSzRLblMr?=
 =?utf-8?B?M1ZGdVFNYlhOaG83VktpRVlIWUE5MUxObDZScDY4L2JkWlNmbG9VWWp2M3Ns?=
 =?utf-8?B?NUZTWEVkVlZ4Yy95cWF4MWxjczcxSGNVY3l4QnJhWjY4bndFOUtObStkRDVD?=
 =?utf-8?B?OG1ZQmlGM0JvRFYyZHNPVTh3cXp1SGxmNllaTzZhR2pUbU5wUk56azNjdjlq?=
 =?utf-8?B?SWJmaVpBRFhOZHhCVVBua1dtNWlIQ2VXZlJjVk0vR3Z0bGlIb1FhUTJvQzdl?=
 =?utf-8?B?K3BKOGJvNTMxK0pFMmF3b2xPQ2JCYTcvTm5BWFpHdXdVK0VFRjdxb2JYOFJS?=
 =?utf-8?B?UnVURjY3Ti9BdDNUQytmSUUrbzYxSmlxVS9taUJoOWp2ei82Tzl5ZDlveXV6?=
 =?utf-8?B?V1NlN090dlREbmRPOGdEa1Q5OGQ1Sy9qNlY5cklUR2phTGZsWmRKR3NjTnJN?=
 =?utf-8?B?SXJDa21Hblc5MXRZOTRGeko1MWlzazAxUlFLc2FNQzBrUWs1VzZiNzVUcmdH?=
 =?utf-8?B?WjZPOFowMk0zSGIvSkRxM0xmQW4zT3IweEhyUXMyakNrVW53bzRESkgxYnhH?=
 =?utf-8?B?L0E5aWVRcXVkZ0NTUzRnbTQyR2lvTmp4cldsTDRuMlZYRDQ1KytLejkrSVB3?=
 =?utf-8?B?RGx0elZZU3VwUEtEN2U3SFhpTFlxZTB3QVR0ZERBVmhCOEJYUW9acHBnU2Fy?=
 =?utf-8?B?MVBOSmRsdlNpaE9GbHhmS08zNituZkpmSld0TGtYSldjVXVEQ1pNR0xLa1RM?=
 =?utf-8?B?OXJkanN2VnhPYi9XTGN2MUd3TVZ3amJwR0Z4Y2JDTno0OWdmWVd4dURueHJM?=
 =?utf-8?B?OFNpZTRzZS9VdzRWakdQTHhvVmEvR3NYZlM2aC9ra1dlNHFmN1hyc0JvdHF0?=
 =?utf-8?B?c1czUFMrcG94MmwwaFRzM0s1T2ZLZmw1ODB2T1JHYlhnS0E5ZXVQNXVhcU5s?=
 =?utf-8?B?VFRvSlBvaXpJQVdNcTY4eWpRc01BVWwrYjFjN1VIakphNk9lMG9GbldJMXJ3?=
 =?utf-8?B?Sk9UOXRTMVV2SHZpSlVsSm1iYTFPMzl2T2tXaFB2TC84SUx4MkYvemVEOHdM?=
 =?utf-8?B?cTN4NjliZEI2SzBub1YyaGlMbW9pWmtnV2tkcEtqNmt6a3BrZG1hOWRzYkE1?=
 =?utf-8?B?STArOGRMOGNORTEvSlg2N0pZc0pEcVF1MlI0MXhma0hsaVdxblpjdFEzb01Z?=
 =?utf-8?B?TGxsSlNRNGtleWNydkhMTUVXamh3WGNCYUFpZTJ0RXc2RWROYkludC84Y1g5?=
 =?utf-8?B?NDREYWIvT2IvMXkrdnIwMWs1VkFFYjlxUmJnNDJtR3hkTDhqbnRId3hKRXlE?=
 =?utf-8?B?V2tvSjZLb21iUEhrMlpob3lpREd6ZzdQcUFKVnl5U2JFUTJQbWtMSVNxd01I?=
 =?utf-8?B?ZFBYTWJBTW9pYUFhOHY5R1BxZ1lPZjJnYU4zWi9FdFd6ejNlcjYwbC96VEZk?=
 =?utf-8?B?c2JaVzhiTXluWU9lMjNZcCszeGhaWUdWUjhBZ0VPNkFpWkhGRTdHMGlCVTk2?=
 =?utf-8?B?K00zWmZUZVJOMy9FUEVDOGFEd2lmK0NtTWN2SzMxbnBHR2VBVmdpclZldDRu?=
 =?utf-8?Q?QXrPZg6kmx0LzIeV9M8epjoEU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be52a60-e629-4eb9-a262-08daa7d426b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 19:51:25.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTM955vpKjlGqhcc60gLt3vdo4OTPPLldmtpX9Lnh2WG1W0OoyIF8tLFCSsH6SwMtWhG3pVyzAfgpek85E5+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

On 2022-10-06 15:39, Linus Torvalds wrote:
> On Thu, Oct 6, 2022 at 1:51 AM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> This is only seen with gcc-11, gcc-12 builds are ok.
> 
> Hmm. This seems to be some odd gcc issue.
> 
> I *think* that what is going on is that the test
> 
>          j = 0 ; j < MAX_DWB_PIPES
> 
> makes gcc decide that "hey, j is in the range [0,MAX_DWB_PIPES[", and
> then since MAX_DWB_PIPES is 1, that simplifies to "j must be zero".
> Good range analysis so far.
> 
> But for 'i', we start off with that lower bound of 0, but the upper
> bound is not fixed (the test for "i" is: "i < stream->num_wb_info").
> 
> And then that "if (i != j)", so now gcc decides that it can simplify
> that to "if (i != 0)", and then simplifies *that* to "oh, the lower
> bound of 'i' in that code is actually 1.
> 
> So then it decides that "stream->writeback_info[i]" must be out of bounds.
> 
> Of course, the *reality* is that stream->num_wb_info should be <=
> MAX_DWB_PIPES, and as such (with the current MAX_DWB_PIPES value of 1)
> it's not that 'i' can be 1, it's that the code in question cannot be
> reached at all.
> 
> What confuses me is that error message ("array subscript [0, 0] is
> outside array bounds of 'struct dc_writeback_info[1]') which seems to
> be aware that the value is actually 0.
> 
> So this seems to be some gcc-11 range analysis bug, but I don't know
> what the fix is. I suspect some random code change would magically
> just make gcc realize it's ok after all, but since it all depends on
> random gcc confusion, I don't know what the random code change would
> be.
> 
> The fix *MAY* be to just add a '&& i < MAX_DWB_PIPES' to that loop
> too, and then gcc will see that both i and j are always 0, and that
> the code is unreachable and not warn about it. Hmm? Can you test that?
> 
> And the reason gcc-12 builds are ok probably isn't that gcc-12 gets
> this right, it's simply that gcc-12 gets so many *opther* things wrong
> that we already disabled -Warray-bounds with gcc-12 entirely.
> 
> If somebody cannot come up with a fix, I suspect the solution is "gcc
> array bounds analysis is terminally buggy" and we just need to disable
> it for gcc-11 too.

It seems that Stephen has a fix for this that works for multiple 
versions of GCC, see: 
https://lore.kernel.org/all/20221006191245.11bb0e2c@canb.auug.org.au/

> 
> Kees, any idea? Who else might be interested in fixing a -Warray-bounds issue?
> 
>                   Linus

-- 
Hamza

