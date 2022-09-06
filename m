Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8ED5AEF08
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763810E6E2;
	Tue,  6 Sep 2022 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F510E6E3;
 Tue,  6 Sep 2022 15:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9DeaJEZFDtgMcq8UkENArXn/AvYauI8I4YGqj+9kDkGJp6NdnUiUWAFNgOWWPQSlXZcxqTPp0xtAqdGzkOYRZXatpcmbyalb4aIRZXq7Fn6EJzCdQQ7NxrXKkMZSNsMGI+ODIn8pLKuFKCag7MeX6jLL7VUsq1fyQFcgbvGb2TUykcPKD81+B9mOggv0GW8DDOBMU0xYAdA12QNu4sEF7zdwDN9rdC85H31BHowVMPwS5aG8X9vS7lRh88uPOs6EfeD19rhWF5gwvGIbuMKPyYRK/zndTHuou2MqtiKWDE7dd8b++Ty8bbjcVMKvwb3ez3rLhhxUNx99DpHJg3yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h9fSxFO+es9ZHuonW/z+2N72ez1slrzKN+ClQiiKR8=;
 b=IQSGUE465RnM5YcPbVFRZp3AjkGN+eJLOI9A94EaCZy6CWZV+5cM9chKxc+bjCFCPdRSXOc4gn+YTiU7NMR3DdzJz2rF3GrmBvI2j/lx5m7GiD4fbCK3dnYSGVuER12LP8SbZh6dmbp5kyEPxsmc9V6ReksuzeDKw1+Un/lq4SZJMKPxKhAXjOfKHR3geE825kmOHiXHYSBmY1KAp+E1XiQ70EQEpSdRi8RrBgqoC25RwWo6Q2qRXQl1EAEZ1heHeAEPEvM0MPDePbOFW5IoPWnu6600cGcanmchdte18aeuYsJac27+uDx4Ec/bUDvgDtBM03g9ZC+orz+iU4T5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h9fSxFO+es9ZHuonW/z+2N72ez1slrzKN+ClQiiKR8=;
 b=jn0cItXkgH6iSPkcmhZtYAyribNVsvMong16zcu5S0Dkv57zJs2x2UHHOsZsYEYcdA61QQQNuH/7FlIG9gZlpBAYK8COuJCTqYoK5ffwKULZMH+3tUr3QVkNsvKs8metm6bXQprqYUZbdiEVDMy3lExY//Okl/v+nQbztjn9d2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 6 Sep
 2022 15:39:46 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5588.015; Tue, 6 Sep 2022
 15:39:46 +0000
Message-ID: <67fe15fc-bd6a-5eee-4359-5d6244db54ef@amd.com>
Date: Tue, 6 Sep 2022 11:39:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/amd/display: fix memory leak when using
 debugfs_lookup()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220902130105.139138-1-gregkh@linuxfoundation.org>
 <YxIAvHOK7uNum9VI@kroah.com> <5f29a2e1-4ecb-9f94-1e57-f7d8d3c7afb2@amd.com>
 <YxdiBRCmhlrRxAz5@kroah.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <YxdiBRCmhlrRxAz5@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0395.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::10) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ce9ed9-16b3-4a2a-92d4-08da901e065a
X-MS-TrafficTypeDiagnostic: CY5PR12MB6456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+zt0ex+RDUSfcoVkQ+EyDwB5np/m08Ftq1SFc+Cn4eQvXkccNYh6bFFovlPqPt8ITq2meucrCX2k2cvNncurmQ33paHxmIj1NiNdbudukXmV32+Ek/gD36Xx8pBq5RzLppqn7yCciowWt4CdcHoba/ba3t8ywJei/BPy8OC0NRJI+ciqUTjM7hX8Jg8ksXT9ZQfoMaC3eJBtv57o9H/uR9mJnurxdXAd7lkK5Rj2y0qmRwXARWI2M1vrYV6fRG3jBweQc1Dy02l5Bt6k6vxQXkvsdDm9XJsZv9h+4oBRPArPJU/HvuATVR3LbWgMCMnyoSwtN8yxDqf7OZiMl/7ZcuUnbI3bKoqTr+Fm59HXqGs9rYtlNWpTmF0BnvzGv36ZAD2a1wNsRdCQC7iwm7tx82ocdeVOtjOO0XWRqwtm3Tv1YdWvRA/Wf3j/u18RafMKO51IgWYPJyeMBScAs3KWsCASO/Xn9kmKK69chBZf7CEsl6FJbuQhAbUykg+bQCOqfXHqG67vwmUnsTyELztmxyliK70e1IvQjCLMUKUvkKNX6lKNTKCWzJM8jzv8NQALSJdAFRouJRGl0JnZNLsWZxODYP1DDwX2RuaC46HkphbFKneVwn95LTbTv1BjlGlrg6DN+ZjEtxEEaIYMMjxKbBtuOwbvlNXwaVOtlokD2Z6+EakvUcGN4B+uMil8vPV2p2LZ1HH6ZFeH52w0JyAIZigvodQ+dPHGZz94uynwqLwuBZrDyF2Rl3lpCcuezncEXxOdA0uc5rVM6/r4EquobsZvLgfN9/w2mSSwK5m3Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(478600001)(41300700001)(6916009)(36756003)(6486002)(54906003)(31686004)(31696002)(316002)(86362001)(38100700002)(53546011)(2616005)(2906002)(6506007)(66946007)(26005)(6512007)(186003)(66556008)(4326008)(5660300002)(7416002)(8936002)(66476007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGRpbVh2ZG1uQXZ5YmZzZ3U1cjNnTFZiWjFWbzJQaW1VWVdVVFFROUJtQzgx?=
 =?utf-8?B?TFR0a3ZXdllGaytWUUVpZExlMEluVExXNUJRY0JheHlFN3hYNTZVVERhN0d6?=
 =?utf-8?B?TVVPOEhKKy8wYVBGZzVhTmprR3Axa1JsT0xPR3Aramtza0FwTlZoNDJEQnR0?=
 =?utf-8?B?UEtFMExYQUR5bzRaa3h3dWx2NXdsRUdxRE5pcU9LZElzYk1UWjQrWUQ2eVhr?=
 =?utf-8?B?NTNDUDZ6TWJBUVRCWXdUVk5UbzEyamV2WGwva3FpVlRuR1BlOFdhaitQVDVT?=
 =?utf-8?B?bGU0ZXZYV1pOT3VsV08zTm44aWp0OGFCR1hFOVUzdmU3dWFMUTROWkF4ejVW?=
 =?utf-8?B?N3dHRnA5TXJ0TVRHcUF3eTkzTTA1TWJJTTRwNjZ1U25MQVN1YWtIS0ErUjlF?=
 =?utf-8?B?ZUNyZ1NSMHhCcDc5dklvencvWmhQd0EvQ2ZCYjQwbStvQUYrTSt0UHAyL29q?=
 =?utf-8?B?K29LS09yZ29tOE9hRUdyb0RtYngzTzQ1eVBSQlpzcUkxaW9zakpKNFJCTFpW?=
 =?utf-8?B?SHZTbkxxT245QlNrUFZoaDcyelFBZzVDOGlPb1gyV3lXeGJLYzNsZkx1cVBy?=
 =?utf-8?B?MHRZU1NacVVqajdrc1VxZm1mNDRIUGlTMTZ1S2U0Vm0ycDJOcXlhanl0dTJY?=
 =?utf-8?B?cTk0bWJtNGhyakRKcHBab2pwdk9Fa0Z3c00ySCswRUFuSVhEZFFHYUV5QzB3?=
 =?utf-8?B?OXpXRVg3bFZVTHRPODh1QVRQNVBzM09OMHpMNHpwbEYxUENIV3lPbDRRc3E5?=
 =?utf-8?B?dFJFTEpmRG9zUFJIN2FBc0JObDE2QVVpY2FWc09pald5Wmx6bi96UStKZ0lL?=
 =?utf-8?B?U3RjUUl2Y1o5T2dBTElOT1hPY1JoZEE2Y0txenEyTlJmQWg4emZNVUU5ZDd4?=
 =?utf-8?B?QXg1YUhFSk1BZmlGSUpmRWQ5eHpFMnhyeWdOTFJYY1BLUDdyckhwQnhEbnVj?=
 =?utf-8?B?M0tTeGY2N2o1UG94cmpONGRDSml4UXYzYWFrLzlETzhaZHd1ZlQwcGE1a05I?=
 =?utf-8?B?eWN2TVFPV2QwL1U5M3ZMNW5hVndYR2VjZXRRVkxocm5QamNTUmhvb2pPMXhz?=
 =?utf-8?B?VHB3ZFlhZUt5UGpmejVBRE9sQXMvZEJVWXlVd05iVFlMNDlCeTg2MFc4a0N3?=
 =?utf-8?B?d0dDUEh2aVR2dzBuQWJHZmF1Y1ExYUliY05vT3g2K2pGTUgvVktYN3ovNTF0?=
 =?utf-8?B?Z0NQUUh4eGYxU1J3RWVyZjJQZ2w3a1dPdUpJb2VwUGdVVGdBVktSQjZpTytq?=
 =?utf-8?B?czBLajdFRmIxT3lLTndROWZuQUtjaEV0a1ZwcmxLYWo3VGhhN3A0VFMxZVB2?=
 =?utf-8?B?RjdCUVorQWdzU3dkdGFVMGg1cUNHT0I0VmRlRVZGaFFLVFI5dHFZNUpBdkNK?=
 =?utf-8?B?N2FuVDlmTTVZTVI0SFBhVlZROUJvbHp4UEFsV2JxdWRXMWU2QSt3Y3U3c2Vx?=
 =?utf-8?B?OGh0SlAvR2JQaERkRjcxODBqeTZFR1NYSkJGVm5NQ2tIMUxMZWZQTU9zSW0z?=
 =?utf-8?B?SmFTeEVBdUliNnZ3RnhjVTA3Z2FpZXMwNDM3RWltZFk1SXZYR2FEeFQrWUt6?=
 =?utf-8?B?eXZlVUpXWkJGckhsV01ER2VqVzRKWjZ2VTEvWXBSTE1IcTRjWEZPSjgzRlhn?=
 =?utf-8?B?Z3NtS0k0SHBkdmlFeDBLSHByYkF3OEt2TWRKa3RyK1d2MXYxTkpoSFYwa3Zl?=
 =?utf-8?B?bmZMZy8zK2pIaVNidFhZc21FMzdQMmdVL1Z1UHgvcDBkN2duMlZqV0F1Ymp6?=
 =?utf-8?B?bmhGVjRveUllMDkzbG1RTjdDV1NpdEtQVDQ2QzJaR25wOHhKa3FOV0VaZHZ4?=
 =?utf-8?B?Y0hURmo3cjRjRFovM2pyS0pwSWVzQlc4L2RRZnZoYW55MW55SW81NG9KbzdD?=
 =?utf-8?B?RWJ2M0Rjam9uQ3hWaCtGKzQvZ3FzYmJRd3l3U08wSjlPSVQxV09tOVhjZHJt?=
 =?utf-8?B?SEd0bGJrakQwYmN5TjRqN0ovTmpvY0dyMjYvaDFFbTg1OU1Nemlzb3Q1alUz?=
 =?utf-8?B?OHVhQlBVK1k3Wks1V3Zua0QxOVlyUk9aSWtoTE5mYy9KVU8wVDQ4RHZ5TERz?=
 =?utf-8?B?R2JsTjNTZEhmZmVCdHYwRnA0OGJmUE43d0xwQ2M4d01QQ0RrTVorKzZLYTdE?=
 =?utf-8?Q?v7cREukpHY7bnMUk9zAuWT8tT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce9ed9-16b3-4a2a-92d4-08da901e065a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:39:45.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTlLVzSABoh5YzFvpAZLEO59qyN8XjMvvpU1CL7qFzV3JwlF4PUvuj9wmw/7TVYx0XLwdEeus3dR3k0s5ajyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deuc her <alexander.deucher@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-06 11:06, Greg Kroah-Hartman wrote:
> On Tue, Sep 06, 2022 at 10:52:28AM -0400, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2022-09-02 09:10, Greg Kroah-Hartman wrote:
>>> On Fri, Sep 02, 2022 at 03:01:05PM +0200, Greg Kroah-Hartman wrote:
>>>> When calling debugfs_lookup() the result must have dput() called on it,
>>>> otherwise the memory will leak over time.  Fix this up by properly
>>>> calling dput().
>>>>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Leo Li <sunpeng.li@amd.com>
>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>>> Cc: David Airlie <airlied@linux.ie>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Wayne Lin <Wayne.Lin@amd.com>
>>>> Cc: hersen wu <hersenxs.wu@amd.com>
>>>> Cc: Wenjing Liu <wenjing.liu@amd.com>
>>>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>>> Cc: Thelford Williams <tdwilliamsiv@gmail.com>
>>>> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
>>>> Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
>>>> Cc: Mikita Lipski <mikita.lipski@amd.com>
>>>> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> Cc: Sean Paul <seanpaul@chromium.org>
>>>> Cc: amd-gfx@lists.freedesktop.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> ---
>>>
>>> Despite a zillion cc: items, I forgot to cc: stable on this.  Can the
>>> maintainer add that here, or do you all want me to resend it with that
>>> item added?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Greg,
>>
>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>
>> Is 'Cc: stable@vger.kernel.org' enough here? I can make this change before I
>> merge it into amd-staging-drm-next.
> 
> Yes, please add the cc: stable@ line to the body of the patch, sorry I
> forgot that.
> 

Change applied to amd-staging-drm-next, with the Cc to the stable branch.

Thanks
Siqueira

> thanks,
> 
> greg k-h



