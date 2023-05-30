Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B4716825
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A1510E177;
	Tue, 30 May 2023 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E7210E177;
 Tue, 30 May 2023 15:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfGF0Ya0vqHmXYgE/sf0DA6yGKLTjgHNQnN7IJGn4OI6aM008idHngUrpz2FARQ/IwkE+G2HP03Z/ASgNbe3XPSweNO3YYk3INEhXLj2i2gO+efqPGsIQCrx31oj15pcwP5Cscu+QTVB3T1vQu1hf5YXp9ESgDsN0e+p65XpJAdX9r+fx0udYzL3X2enc3Cmrj6IMOlpnT22oEz+tg7ePO+q7yDLu4J4CJWq4Fhdo9l/lVGtFbSfMfXZQ6uL0MHctBNpo03+HsGguwX9nVLEz/55H9e3MMkYU72Yxfmvh+yIxnhFgr6AFBlymonGWY0sHhTcjuyv1Q7UmIMyw6bVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMUXLd5R3eA4412p2LfuC9GusbWfiRolxMSQNfMK8c4=;
 b=F9YbfhU48W74yGnB0eAXlQaI0DP3EXF5pt1qaYoA91aV9mS0sNo660Zw/1d8pOcNILQQgXMh3q/iR5xssQJXR+WJ1DyIyAWynDPdV86DADC6FESJky6WWd9naHToGe0VmmR+kZ6JCiLg2yWU3gBx5OuECE/91reWHL8dW1rDRK9Tqe6s5FYBrowZ96IwKI6iE2JwoCpUxiP1RnVtOTeJpUOxA3B5eNOnXwPfAVEl44xJpxbbuJwKLEjV1l3ZK+Oq/hfq/bzjP0mzNBSIkhZsR+gcJTvvpiIqIUj5811ir2kgqBGwuG1N8v3Pwf2v5efgGjXCoCBGFgV13CGq4DSpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMUXLd5R3eA4412p2LfuC9GusbWfiRolxMSQNfMK8c4=;
 b=NKCRIQ8js1agTVhV5Be/5FdSU832HiwbmXwpUZlh2QAaEl/fxrlwi9PP4WZ5h9vsmbRWwCvdYgOqT1bi+clCUtHKGVdSNZ92P9mMBDAMiWhHEB8AOpqdU25yMwrT+zfdSv/+9ytzYjlNubvJndbQEK8h5OlzThv3ezS2/Zc0siU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:55:25 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.018; Tue, 30 May 2023
 15:55:24 +0000
Message-ID: <0f2021ba-fab9-3438-950d-7b60882ae77a@amd.com>
Date: Tue, 30 May 2023 11:55:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
Content-Language: en-US
To: "Ho, Kenny" <Kenny.Ho@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20230525163827.548058-1-hamza.mahfooz@amd.com>
 <85f47623-5ef1-b817-195b-c4ae39564247@amd.com>
 <DM6PR12MB3996064F09E1C2FD782CC944834B9@DM6PR12MB3996.namprd12.prod.outlook.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <DM6PR12MB3996064F09E1C2FD782CC944834B9@DM6PR12MB3996.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 25af7d35-7a9a-4063-d7d3-08db612647e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FM1zAANEEoO5XIiacV4g+7A1efk9gOGb4blrOo5WaqaauIlgsMAGWKqYuhmdrZasyCseKzlEJeVZiBmnKMoY/XnfOW6AJHO4Cva4U445DAnsuNKG7PmZmAFmfgoWipTAZe6gT+/OMarwTdeNsqet+gX/rr9NOn+f1wj3yIvS+tlGxXSZP4v//0wX51O8PpTKpZm8pamj3gZIMw70XgpGubk8pqnXzFP+boP8IU7AALo0mFRsGjaTdmCR/tZdaFH2WuXCMyVogxDFtBqdkdQmXoPe44BC+b0LsXtI+1g3wZXV+kR4Mlj+UL/Q+pimDkwUMwDj22UhRl+HJ89b7IxIQmBxTQftMuztNKE8qx1e5NI4Ll9qPxuZs9xZbc0MJoAkb1JXdPmeIrLVt5miIf97b8DSRVIncA1fc5iqBiUHhBJugqMnDk+6bETkFb0OzQgPMdJbDU5WfELXSGHvBiJqiWMz5ZkBgn+391Zt1y/PA/zQqX53Xof20zkTp1u706UhXXk7SfkN36SVV4savd07ZPLOv2iCeSz+C08AIPF0okSwge+ze89jTRdxVdgYh7d0tDV6D9NmjnMGW/dgEhzKPotU9PjekuIH3CTf2cUq/nQl36lizbU6iXvszTEvFeX5n6eJyKe5J0lKH/YGICV67g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(2616005)(31686004)(31696002)(53546011)(83380400001)(186003)(2906002)(5660300002)(4326008)(54906003)(110136005)(6506007)(6512007)(26005)(4744005)(36756003)(86362001)(44832011)(478600001)(8676002)(8936002)(66946007)(66476007)(66556008)(6666004)(316002)(38100700002)(6486002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRsM2hBNnBFbG9TTW43N1Q5VnFzSHNiLy93UFFPcEdBWmgzUk5MYXJHcUtX?=
 =?utf-8?B?dStLWjBkMExXS2tLa0RkbGhSaXJ2ajk5NjNaQTVLbTRXQXQ5RVRjQW1pTDNo?=
 =?utf-8?B?bEpLeXk1RlFHR1NTWTgxNlduZENhaFFiVStGeHp3YlVwd21yV2o5OVYwbzVN?=
 =?utf-8?B?QnhaNHJMVTdmdWZVSWxXWGphend1ZW9rZjFLUktFQlA5TXpuWmNTaDhESExE?=
 =?utf-8?B?bmtpVVptZVVGVHJNYXJlMjJBSVZDdXFwSXpzelVNL08xeHZzZnYyOTBYMFNj?=
 =?utf-8?B?ZkExTXJnZm42a3ZzTlQ0di9JaWdCMm94TVd2dVVrZTViallwNmd3Nmg0eGlh?=
 =?utf-8?B?TVFZa3ZzVWdwZkFORStaNEFnRWZDS0YxY3F0ZVRlaGdMQkpsN2hLcXlPRnlk?=
 =?utf-8?B?dnpQOEJHVTJQNm16ZUFGWlNteU1zeHpIMlR6NWQzY3hFRTV1bkhTbU9sRjlR?=
 =?utf-8?B?Yzc3Myt1b0pneWlWUVRYRk51WVJVZTNXbC8wbTJXMEpqWmU5aERaenBLc1lN?=
 =?utf-8?B?eGMwZFFiWVFxWlVvbDV1WWs2UlI2OHJuajhRbURpUVFqTmx1VTIyRis0ajFQ?=
 =?utf-8?B?Ykl6TnJrSjdSQjRaWi9VeWZKRlBkQUNncWl5RXp5c1JXR0QyY3h4VkRka0ZI?=
 =?utf-8?B?UEo1bFUrN01KS3Q4MytzRW4zbG5Kb2hxQ1hlQk5rclF0STZLZmNQWlExWXpC?=
 =?utf-8?B?N3JHcEdGRmhmbVFYZ21ENkE5ZExsK0ZTL3lVSkZnc0MvUnY5ZzlzRHZROXlY?=
 =?utf-8?B?eVBRemNHSGJTYkdxc0VRb2hTT0JZdUszeDZFYnpLOFFDTDdpeWwrbGJwREpL?=
 =?utf-8?B?Y3dNL2lCQ2llRnB4bEhkNEtZQ3dxM29HRUNuaEYxZzYvd1ZNeXRwRlNVQzZk?=
 =?utf-8?B?V05IREQxVEV5RjBWbmtNU2lNVVdPeklmKzRvT1ZPREhPWTN1ZHUvUlVsVlht?=
 =?utf-8?B?aTdjNkYzajd5SUlQSXpnN20xSUxhdExPc2NxTTZNQjN2Wkc5a0UxOFhwUGRv?=
 =?utf-8?B?b05XQUF0ZXA0SDNXbENHVk1IVUJrSXVtSEtiSkdOZTlLQkx4czB4WjMzTU9B?=
 =?utf-8?B?NlVyRENyV3dIeW5IejNLanRIZ3g0M1c3bzlGby9uWkk0aTQ0SE8vRGlNREhw?=
 =?utf-8?B?dU1XOUdLWFZsaWlBTXBIZXRuU056UG1QUlVtOC8zcmpWQ0hGWk95LzVDSEhJ?=
 =?utf-8?B?T1JtWWxORkYrYThZR0lCTEhQelN0REtQaU5kcjZrTHlxMVkvSzZUeTlBMFpT?=
 =?utf-8?B?VDhqK1VHMGpHNU12SkR0TzNkV3JXaFdPa0lOb0FrWGx6N3ZnbGZPd3ZJZCt0?=
 =?utf-8?B?MDJuTFdnZzZjTjdZZFFhNHVPWUN0enVkUFc5U3JhMkRDU2JqTkthTjNaTkds?=
 =?utf-8?B?S1FwQ2V0bTlMTFpuakg2OG1wN21Jb2dRdTUwd1BwZEI2Q2tQZ01XRG1pMzhi?=
 =?utf-8?B?ektSZUl1c2lwTHVRMEZTWmFzeUhuQ1hyYzRoYWliVWthNnYveWRucUVKSGph?=
 =?utf-8?B?NzZVc3hTT3o1UlpWeHBtODBYZ0hIYnBPd0dxaXNNcGFxSnd4ZnU3UlBGSjFU?=
 =?utf-8?B?U3ZabHM3eUF6SGt4Rm1MYU9rMk83cU40dTBOL1RmanBEdjk0blhoWlJZL0l2?=
 =?utf-8?B?Z0t0OXN3U0tnckZ0YXhxSFNyMHNiWkVQa2FZM3VIQm83b0F1MVJWZ1FVTVRB?=
 =?utf-8?B?cjhVekxtdHAyUkgrYTNzTkQyQlNrclAybVRmb2JJYk1SVDJhajFtcVJSTFd6?=
 =?utf-8?B?eTJBMHpRcU0yaGhtaW5uWm13THVxbG16U2VkdlRueTNIWC9kLzFWL0tEM3R0?=
 =?utf-8?B?SDE3eGtybkc2UDc1WnBMTnFaYkhNb01FK1BMWXRrTnUzVnFNV25qL1ZmeUJ6?=
 =?utf-8?B?aHVKNXJHT0tSVENhcDRNTldiSzRIMElLN1hEMzBrdnovdUdNaWd0Q0RSTUpv?=
 =?utf-8?B?VzhLaWQwUzY3OUFYK0tqMlBCNlF1Q1JKVDlYOHJ0YVAyOWZOeXZPMlA5Y1Mr?=
 =?utf-8?B?RmE3QVpOSGtGZnhRU2ZqUGZ6Uy9aQldldnNFSmNRQnFiUmx5MTN4OXRwV2x0?=
 =?utf-8?B?a1g0bkwveklwWTRReWNFdm45ZCtTSnkzRSt2SFo1SlJnakZSblpjWXdGL3M3?=
 =?utf-8?Q?UJyws10hZnuzrDkIjHWaR+Kkp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25af7d35-7a9a-4063-d7d3-08db612647e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:55:24.8145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGtmyaVIUkfbbWdvG8HZuoPP4AWO8HVNA+lx+CJ/9Ku+tiYBKOwlQ9to/FGgfCR1IGkVR5oQh9nlsH3O1nK6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>, "Wang,
 Yang\(Kevin\)" <KevinYang.Wang@amd.com>, Peter Foley <pefoley2@pefoley.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Davis <afd@ti.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Ma,
 Le" <Le.Ma@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Li,
 Candice" <Candice.Li@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/23 11:50, Ho, Kenny wrote:
> [Public]
> 
> On 5/30/23 11:24, Hamza Mahfooz wrote:
>> I am able to get clean builds with this enabled on GCC 11-13 and Clang
>> 15, at least as of commit e786aef0869c ("drm/amd/display: remove unused
>> definition") on amd-staging-drm-next.
> 
> Did you try intentionally introducing a warning to see if the build indeed fail?

Yes, I tried a couple of different ones.

-- 
Hamza

