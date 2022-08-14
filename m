Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F735925DB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 19:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45595235;
	Sun, 14 Aug 2022 17:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48195503
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 17:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=er7bqzVp/47WxZJNuEwT0Z2raD++ffMOKgCqFjjH7pgmTTkWmvvYMdrw+ETkWNQRq//NZMJptCRiwv25Is97bH4ofFO7DStSEClN9b4YaTE1sUQpIDEDYxBdcuyZU3m1zaeGdDJipYR/wBi+INbUHQNTG2oEI0MkCdI3+wKR7O86pttVVjdLZdblc1T+WQh2/hdTEx/V+1FTfbDJ/aBzyorduxmu5ELBIxBjsqkXoEfWZGebWMnU3DeK8yA1W6lJWB5D7G7vaqaoGPI5z56KyaB0MKAsopusq2lVq0ctd1FGJz6YcrEwKpqUxI7jq2/jmWASVu+YP7K5W1+WQAiDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ma4/cSdpbfznyXkz1F5vPQ8LXKhDbdD+FAUlryxk9V0=;
 b=Hf76ELkSMoooVl25fyYoYC0M/suhczur5kxJU3iB8SllFtSaz9/p6EWHqGflBkMU9f04hV547sMhi/D6ITpT9SGKGddSD62DK1hfNYWaSIVQK7I28A6hgQeg4NzTjZZokpLwEnV8vqzqdPahNBecfBY0G3OTe3mBPPtLR78rvTuyoS853SkhCkvtBRWVGLjT0U3M5os/5gZ9KXMjJ+v4oxf506qCjiGaPq1NmtVjmGTdhvqHe24KcGYGU8MrpiCR25AEkujTLdpU/ha8fgDmdlKGD9FpXYiRA/bnsd5hSkTCN6OAUbpXhRuISq0dqHrTgOMm+V5rO3wfvlLn/g8DJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma4/cSdpbfznyXkz1F5vPQ8LXKhDbdD+FAUlryxk9V0=;
 b=ZhVUoUW4GGFDFF6pgNWalqGp/TBPPEfNe6Nx/df1TLtLmisBc8rquCvsdF/ihT9JD3ZMunA2BlMVmsuOxmlGmlRFb8CqCKTWHHtnJP8w9OS8abDr9ceJO+AxfSkCCR1N+ZhQ5m1oZpsmK4XOX3e0o+fQSFAIjZFoytE8k+pfPFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB2817.namprd12.prod.outlook.com (2603:10b6:208:36::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Sun, 14 Aug
 2022 17:50:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Sun, 14 Aug 2022
 17:50:32 +0000
Message-ID: <35ff4c21-c305-6fda-f54e-1f9a141c5879@amd.com>
Date: Sun, 14 Aug 2022 19:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] drm/ttm: Fix dummy res NULL ptr deref bug
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <YvTSD44z0csJ8YsP@kili>
 <28f5d71e-34ca-214a-f8a8-14e227bb42cf@amd.com> <20220811115636.GV3460@kadam>
 <9433a0ee-ef19-86d4-e4fd-8ccff53ff5a7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9433a0ee-ef19-86d4-e4fd-8ccff53ff5a7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092bc50f-3e27-47db-108a-08da7e1d7b68
X-MS-TrafficTypeDiagnostic: BL0PR12MB2817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HnwLQDBycAkIW3dsOwoia29qy73AZIQqgrj60n9/jFTS8V0pMnbaFyB3Lz93L0PabAnD7WO+h+dOES5NU3nbgYowpUAXH47/C2w5O7wiW5J8yj2aC1/MYtNRsmnmEZUpuT9rTLaGiGs/u+P8wG05K4gIGO3Y0srNNQ8o7AVLRMRf4AiaHZY/lMt7slL3EwQsUY/bglZhVQqB8+W57AmkElBswK6H4fJch3x7nhQRES9I6vWip/Z+Ry8lJGDuX3uJSHGSRe9Uow8jHzBpDzbwAM+L+jjjlZ1zO+omvGrGaahfin6OePwraVuV7NsWmDuHWlMwCYTa327WlEZioypvaok5R8wyyls4gTlOMUO4fxsgfh//gEoSbeneO18LU1cKMjGoLrLwg4vsrHd3veyGMMrtLpFFGar5WvxHy2393CyCeihyaEQo45zCZ6iWHw5fuZ74UZyxTZS5YeW0Y49AtAmnaoz33Y7K/kTLEzh9QjRb0q8JSgLiig+a6KMjyWwPnAWoDgwK0uRcLcB3LClOBGmTw0dpD/k4DDZEA1ti1XtLQD7/rPPoS/vQbzN0fmLATKMR5wkFS1uuMij98rUYMyj9d0W1duAiC/5mCHJS0/lVYUKLW9doh+hw2XIABDpSdCoFb4sMNYEcyV0puHkWxr/TB1H2+uJoXpRYSoCqLFwex5ddGJS9Vtj1P26BJ4TbAO+WiZqq5Z9bmMRdP7+kWOrSpDko0EuZA7EkJG2oGHq2wG5Kbr6iJFJXJ1Grc9X9G/OFkZsvjOb6yKjrKSgiiDVXvESp6CbFMqzQ5ZUrDj98FYBVDo7mamAAtRa1N1IJMt+SRUthfeHhPDa513eUnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(5660300002)(6486002)(53546011)(83380400001)(8936002)(6666004)(6512007)(478600001)(41300700001)(6506007)(31686004)(4326008)(2906002)(66476007)(66556008)(66946007)(186003)(2616005)(36756003)(38100700002)(8676002)(86362001)(316002)(110136005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS9KeVduTkFzMSt1cXJpRjNxSGN6TURkdWwvOStPVUpMYVpIWU9oR29tRndX?=
 =?utf-8?B?TFIyQ1RYdUpuclp5ejFJVWJYVG5zcmFyRkdJZXAzaVdoZVJQU09mNk5xenlL?=
 =?utf-8?B?MVgxbXBOQzYranBhUEFaaU10V0dhNDhXT1IvUWVGbWdNVjZ4Si9oOWMvWkho?=
 =?utf-8?B?NFZYTHlsOGZqSng1cmg3Mnd6ZFRGUGRlclo4RTBQL2hrK0FVMlBrZXBBZGpx?=
 =?utf-8?B?TXNZaDZVZk9LM3htL2RrRzVYRUNmM1laV3hiMEE4Tmw4ZTZXZVZma1lVeGFJ?=
 =?utf-8?B?ZTdmanQrOTloKzBybXgrc21uNDRnVVlTSGUybEJESWg0eU50QzlQTElDdDRP?=
 =?utf-8?B?cUJ2MmNNa0hMU2lTc3VVb09OL3VtUlZGaGVpVzVMRjJVMmFuQkJ5cHZ0QnJp?=
 =?utf-8?B?a2NMVjN6eXlSM3kxWVJOVk5FdnZadGtvZVZQNnQ4WktxNHZaZlMwb0ptTzRn?=
 =?utf-8?B?UjJQcDFaenkwWlVkWUNWNm5IZHZIaFhoMDQ0SVRzbjJ2VmlHR0xZMkwweW5Z?=
 =?utf-8?B?VDNPanJXR2NzS0J2SDVSK3Ixb0FkVkNNMnpJNWhVL1QxVXJYUHdjUDJPWlJ1?=
 =?utf-8?B?SS9zZGRKUVdINUZOYzIxaG9sK1VsaUI1L3NhaHZDR0thRVRHdzNnRmFFU0sw?=
 =?utf-8?B?K2grblk2Z29Gblg2d29jU1Nwb3NRQjZoS2ZCdlNSSVA0aldnd3J4Q0V2TTNK?=
 =?utf-8?B?MWswL2dRVFlaZUJGK3luem5VZHRJcGs2SVljYkJoNnR6ank4QVRzb1hkYlc0?=
 =?utf-8?B?M0RCSkd4akpVOWNUZldsZkF0Q1QvdTN6YlFKdzJ1amV1WWVLakdhckhBT2ZW?=
 =?utf-8?B?dHlITXJyRGIrTGI3dHpRcGovTGtQZXVzUXNoRGlrRmVpVmZsMTFtVTFCVFJz?=
 =?utf-8?B?bllOVm5Ucys2OU4rUFpWTkR6Vy94cDZyZFUxNE1LMWlsNFBVRS9FeDFFZy95?=
 =?utf-8?B?SmxIa0Njc2RhNUxQcGRXdlhCcXd1Z3FMMGM5SnU4VDUyekwzbmZFVXgrbHp3?=
 =?utf-8?B?bmpKM2tMWUx2bnB4TkFQRjhodXZZWEk5c2x5S0RIVGdOZWhZdDJsYk9YRW9j?=
 =?utf-8?B?TUgweHM3bWVIVzdWbGxXY2NCczN3aXMvN1lLeEVGZUVKZWxqbGpMUWZCTkNV?=
 =?utf-8?B?ZVlxVC8vV2dXTWhkMlBMKzN2ZEpJelFZZGd1bFNsQ1RVWEdPSVppVTRIc2hs?=
 =?utf-8?B?ZUg1VWtoTW8zQ3cyV1gyRXZHdU12REwrUWZRVE9PWTdNY3R1SGJhMCtya1dw?=
 =?utf-8?B?TWpwRWpVRnZNQzV3d1dDWm1NV1VRWmQzVHpNQjQrcGQvOXp1R21KVTFjcTJ3?=
 =?utf-8?B?NHlKdTZlYVVvNE9ab0NCRWxlT2llR2w2eUtaNTNQZGpWclRNeElrNVhsbVQ1?=
 =?utf-8?B?bmxISjlIWjFlL2VnZnpueTd6ckJHajg0bTRjWm8wcEwySlJjU2grbGRtbXdG?=
 =?utf-8?B?TVpnNjFjS3RHalhTb0Y4MlJpMWdpMjBGendQckNTTkR1eWJEYkhodXpMTEs2?=
 =?utf-8?B?UTg5aUJYTURlaFM1R3B5M0ZWRmkvcWR1c21PT2t2UFlDb2xaWk9Xbno3elBO?=
 =?utf-8?B?ZjlXMEFzL1JTUUkrMXhJTERVWHhPOVhuQVRuME1jZm5EQzJ3YmNZTjBvSncv?=
 =?utf-8?B?QkQ1RzFKRitESkpjeFJRNTZMNTUxbFlMVnA0Ulc0TDAxRklma001WjhSTmta?=
 =?utf-8?B?T2pDd240OU9IT3lhYXluR0ZuUmt5bHduTnp2aDJ5eWZTY1B0RGZwOGVmL0FI?=
 =?utf-8?B?aEdCRjM3QnBmcDh3VndXK3EzbGpwWEY3MGVtR0E5cnFmSEJHcmZneUtWV3Jn?=
 =?utf-8?B?d1h4SVByK0dVUWJJZ3NIVWtKU292ODdPNkRlYVNaYUNsaGxPd2dOVWtGVTlH?=
 =?utf-8?B?aGRqdkpTQktxTnR6TVFNZzRNZHFDTmlzK0RrWGNPeEx6SFo3NWFaRHI4R3Ux?=
 =?utf-8?B?QmoxUlpYNDV1RkRtbXdUNzUzVUNZNkhLSFN5K21JUGlGZzZLV3JwWWFlb2N2?=
 =?utf-8?B?bVBlaE9iWVErK2I1clFlYkhxdk9XdVN2cTFuODJid29obzBKL3ZkQ0ZGRzIv?=
 =?utf-8?B?ejl6QW5CQlQvaE4wNjRFRlhHSGFRY2krRmRDbE1jNlQzSUxmU3NuaGRNUTF6?=
 =?utf-8?B?UXQxUkxkTzc1UVNmdFErenl3Q280WGQrV24zanJlZnFjZzRYdTV3UTlWa292?=
 =?utf-8?Q?uCavY3KjEVDY+xpVYqvtWeFssiSbF49wdQ9MvBHYrfzY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092bc50f-3e27-47db-108a-08da7e1d7b68
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2022 17:50:31.8102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH1P1T8zpazClTGEtdTHj9tVaxMBPrCQb1CwlmpmBMLdYwCuhdFxiaJ9yK8iTH7A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2817
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.08.22 um 08:00 schrieb Arunpravin Paneer Selvam:
> Hi Dan,
>
> On 8/11/2022 5:26 PM, Dan Carpenter wrote:
>> On Thu, Aug 11, 2022 at 04:36:33PM +0530, Arunpravin Paneer Selvam 
>> wrote:
>>> Hi Dan,
>>>
>>> drm-misc-fixes doesn't have the updated ttm_bo.c file, we have the 
>>> updated
>>> ttm_bo.c version in
>>> drm-misc-next branch. Please find below for the line number 907.
>>>
>>> On 8/11/2022 3:25 PM, Dan Carpenter wrote:
>>>> Hello Arunpravin Paneer Selvam,
>>>>
>>>> This is a semi-automatic email about new static checker warnings.
>>>>
>>>> The patch cf4b7387c0a8: "drm/ttm: Fix dummy res NULL ptr deref bug"
>>>> from Aug 9, 2022, leads to the following Smatch complaint:
>>>>
>>>>       drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
>>>>       warn: variable dereferenced before check 'bo->resource' (see 
>>>> line 907)
>>>>
>>>> drivers/gpu/drm/ttm/ttm_bo.c
>>>>      906         */
>>>>      907        if (!ttm_resource_compat(bo->resource, placement)) {
>>>>                                            ^^^^^^^^^^^^
>>>> Unchecked dereference here inside the function.
>>> |if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) 
>>> { we
>>> have this version in drm-misc-next Regards, Arun |
>>>
>> Huh...  That's very interesting.  It appears there was a bug in
>> drm-misc-next, we applied the fix to the wrong tree, and now both trees
>> are wrong.  The drm-misc-next tree still has the bug and the other tree
>> has a static checker warning about nonsensical NULL checks.
>>
>> Eventually drm-misc-next will get merged and everything will work.  Is
>> it too late to remove the bogus "CC: stable@vger.kernel.org"?
> I will look into this problem.

Mhm, if I'm not completely mistaken the "CC: stable@vger.kernel.org" is 
actually correct, we just need to limit to which version it applies.

>> This could have been avoided if the NULL dereference fix had a Fixes 
>> tag.
> I should have added the below tag
> Fixes: 347987a2cf0d ("drm/ttm: rename and cleanup ttm_bo_init")

WAIT! That's not the correct one. This patch just made the problem more 
obvious.

The real one is bfa3357ef9ab drm/ttm: allocate resource object instead 
of embedding it v2

Regards,
Christian.

>
> I will check on this.
>
> Thanks,
> Arun
>>
>> regards,
>> dan carpenter
>>
>

