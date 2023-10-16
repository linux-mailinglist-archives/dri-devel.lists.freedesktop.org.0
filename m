Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15C7CAD87
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1675F10E223;
	Mon, 16 Oct 2023 15:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDF410E222;
 Mon, 16 Oct 2023 15:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icbsazk35GgWElwiwLbfoTF5GRW1f4IFbX/i6K8P5a11v9UEltiOg+jyKQHNVbyconzAlvjq0pKA1dGl3+wx9kSuHl3GNuOfdEOjy5XZeTJkJCkWUIPv62NFdEKmCmmzd7I7oVYkapidtTN9H8aF1FMtUyuEahtY+8L+02GA/9gQYgpKbsUQy2ezx9nacwl3uHRJnc5rPK4+bL9ko4GhSnXSfx8pR3if3sa6klcmwOT/IzEivBsIfyAzWvp4/pD6k/YWgMEQMX10vuK9mx6FOrBd4g1IiFUdeaVCz7JAWY/mxdclK4jR2H8IDxqzN5GkRWVPwzXM/RKurQfrAFKvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaTk6oUfO+8H/gUOWevyjoGov2JHL99oS14dsu1WTd8=;
 b=knLe9aBqzaxhjfffHW63j6BEa1eGOl1eup7JNcbLFjIAxdMJBQttt/B3j9xOV6myV72p475Pj9mmtkQgFjywCZoKltLBfzgOLM9sp4i7uW84Rrk/h5q0RhDQduVH3Y9S5arEJaZT73SmWenWYlKcha4vk+S2S+3DmY2WIQK9T96muxSt/vN4bKodVSkJNLQNA1CaoOGugwlGwyqY9gyJojDyuOh2aB/YPTMCCWvj98cW4r08x3134iNmpnL/sJ496Jt2UqKikxGRYoIP5ganYekXprb8souSocDsjDhZcCbyzpW13mVnnygeFvfSmKGzgKWkQ4wpUvDtA+DndEqRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaTk6oUfO+8H/gUOWevyjoGov2JHL99oS14dsu1WTd8=;
 b=atE5Ah3J0qMeh0QkNaKpqAKrmn7KzHx9SxmHEb3cO5ejrmXIZ4gL+I0nD109Hy1pUjpZJSXUyLGix2tQjZyAcwmmT6Uj88zMyn9bUcScPCtQBoqRWq70vFim8ozrsoUt8dy306xUzfyvpTkZfuHpiHtMabz6zbSVULHYzJgVz9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.34; Mon, 16 Oct 2023 15:29:14 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:29:14 +0000
Message-ID: <4e88b776-8003-49eb-8d9c-36abd340f129@amd.com>
Date: Mon, 16 Oct 2023 11:29:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-6-matthew.brost@intel.com>
 <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
 <c91d3a47-df4a-4be8-8f27-c850289df281@amd.com>
 <ZS1SyZUvMLJFEEbB@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZS1SyZUvMLJFEEbB@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::44) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CO6PR12MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fe28a0-26c5-48dd-1021-08dbce5ca71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2Y78xkz9J19D3u3QqbmdNYOPGatyP7rHL3VLR9rvB1fQ+zUyl4S/TEAeA3rx/o+HZyfpZ2KSSzB8DuITY+MFkCtuE0DhOem5MvraaAPM3uJS/Y6Aa9VMnteJfZ3PfqdLl+IBUg9OkYdNQKiLkLmzf6FtGhChztjKGWJVE9Z1eB5XCqVX4m1hk+mSnDlVCXNKdnvly1jZxgu9qNKhGyxRSwZXwQY0zxsCmuO0MYOIzxtEfV4ARIiFdaQ1eRitetmtyHFITfHfT7A2zh5wHwt9IMgTYoGTdZZbf0biReVSXl7vVysy2KktIOzdQ+bnzZIIuDnDQCNOUHxEmFx5HgpQmsoPxwztAVKvunDng8U8adg7mt0pSDVBFQFe6jSfv0gkNt+Qawl1rgjRAT8EF2WP/Wjm44XLMo3iiRvKxwYPfEMxg99Qjqrp92i/Pk0QmCwscN0RJCqALAJVt/JxAlZSc73ZcQz3wY4bSYIZskeodlMRmw+/Nks62w7FOUjyajjrHrgfEfXw7SE3UCRNfj8DmIFV0VtT6WPzMkcX1AkNTL025fYbh72K+GF27x39+ecwRxqLF4vC9HWXSl63uefIloEkV640AcwPbYabUu/cxjlsyx1lagHkIBfFDBFHCVD/EmsjxYVISEzUrW89bhPhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(86362001)(31686004)(66476007)(66946007)(316002)(6916009)(31696002)(38100700002)(66556008)(83380400001)(53546011)(6506007)(26005)(2616005)(6512007)(6666004)(4001150100001)(6486002)(2906002)(8936002)(478600001)(41300700001)(44832011)(4326008)(8676002)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWNMaVdtdEloRzZMT3VsRk8rd0JBaWlLa1BMd2wrOEpoL2Z2UkVpOUNQNTFT?=
 =?utf-8?B?Z3FZN3ZwWHVaenlvMnhCL29WeTZYREJodFhOZjZDNiszNjNjYnluWVJndU5Z?=
 =?utf-8?B?Q05SSElCN0lVZDZQODFmQnN6NDg3N2psMm83dnFSeEJ0b0t0ZGtCSlM0WUlE?=
 =?utf-8?B?ejdEdUN1anZnQS9DOWhlRXpsVmZjUTFkZEIzR1JyRHJwOFBjZ1czcDFCUlQ4?=
 =?utf-8?B?RkRtUXJ0QjltdjkxNkFpL011UUtTR1I1eTBaT09nVzRvY3FrWUZBbGdtZWQy?=
 =?utf-8?B?R2M3NVUyakZNbi82UjR4Y05yMnUrWWtFWFFGcHljMzBEQUNuVXhSalN0Z09Z?=
 =?utf-8?B?ckFWWVU2NXIwQitQWWZCU3A0MkpGU3AwU1BtR1NxaUV3ZUMvTkZSQzlCKy9o?=
 =?utf-8?B?S2ZjRXNyaDJDeXU2Z0xsbXAvbFZtUzgyWnBNc1RaZWZZU1VCYjNSdmsvV3Uv?=
 =?utf-8?B?Y2xUNGVGQW5NdlNmTzAvSVdrUlU1eXVvS2pGdXRzZkdTZEo4cGRlQXFNZmNO?=
 =?utf-8?B?OFUwZXVUZndiOEVwSi9wR0dMdlJwdUEzZmo1YlBoL3ArR3lGM0FtZ3lTU0VW?=
 =?utf-8?B?SnRCMjBOcVNRNkIwSjY1V3YzRVpkejUzaTk5c21LQ1daODV2L3NJMlowcjBP?=
 =?utf-8?B?LzdUREZRdW9TNG1DY1ZLYTE5SW1xcFZXbTNyckdOV2k0aExZZkxHeTlvVXZS?=
 =?utf-8?B?WTJPSjJWMFFlajE5S0pHY0h6NzVSWXRmeVVoUTZ0RkxkRmwwVEtJTVEvbnNl?=
 =?utf-8?B?NlFnVVJSMDNLS2s0TUZuY00vRVFPcVBCVU9haXVDRWxWTjY0aUxieW1mSVVB?=
 =?utf-8?B?OHFoLzVwa1FTM0tNRForODcxU0V0Ykc2V0RyN2tXbWkxKzFmeFU2REdxN3Ri?=
 =?utf-8?B?NmVuc1RMRXZFR0tsZnhodm93QkxlWHM2Y0FOVnY0cEpvVEdSOW5CZldaN3Ix?=
 =?utf-8?B?bGRYWGgybllUbHp4alNKSG9sZG5xakxuM3NEQXRMaEQrc04vekJrRmhvRmZ6?=
 =?utf-8?B?NkppczRyZzlVNmR3bkhKSlZWTUlxYldZai8rc2gyNnU2WURrWjk5c0phdFR6?=
 =?utf-8?B?Zy92UFZRV3NSYlkxM2hSelZvVkU2S2MwVFVGMEhhY2JQam1UMTQrMnZiNmRQ?=
 =?utf-8?B?Y2V2eEYzSThiWFUwVXRNQWgwbVNDK2tGT1VIUnl5NjJpN0MzaEorVUZIWGpn?=
 =?utf-8?B?S1diLzFENm84eFBYeGx5cFZETU1GdnUzT2RkMGIxZmdha1c2NVQrb3poeVBs?=
 =?utf-8?B?RHpWZk4wTHM3UG9acHB5ZGx0YTVZL2lOb29qZ3gzZWFIUWhwUjJzRmt1bWx6?=
 =?utf-8?B?YkNkOGJkV01YMzRWMWdQVlEzUitOcGl0QWNyRHhacWhUeUlFS1hHalNIRHQ1?=
 =?utf-8?B?VmwzLzJJSUVUK0pZdWFuaTVJcXFWcUl4alhpWW44S3FyK1BwUFZadkZEellK?=
 =?utf-8?B?UXBESnNENyt0Z1dEeXh5RFlyTmdMMU9rUEZqY3JlUjVvclNyYithK25mSnRn?=
 =?utf-8?B?bGtjVjdUVEdOcDFDRWRvM0FVbG5qdGFuWVZQckhrZ0VvQjRqVGxhdnY2bll0?=
 =?utf-8?B?NzlPVFhrQUFRbWV5Y1oxWFZpdDZyVERnZEFZK2JxbnA2dkxKVVdUakh1cHpP?=
 =?utf-8?B?dEdseUNDT2ExWDlpbkM4eFBCcng0YXlxdFhkUnFkUnZGUER1anFuY2tjbG5r?=
 =?utf-8?B?M0lnQ0pvQlBmOGZiUkh2MDhXVEZ6QkcwVnRYVXpFN3gyanZtV3pIRlRENDY2?=
 =?utf-8?B?TWRnSmNSVGtPWCt4NnZQV3F3bE9OaVN1ZTEzeStaVzUrQjFFV1RDYVhPUGhG?=
 =?utf-8?B?MEZLRlJvWGNkaXhWRDg4amRBbTBzR3NWZVRQMmNmM2EvQmNRbVMvOWJ1ZWY4?=
 =?utf-8?B?YzhZb25GVEk2V0t4NWc5d1FGdlEzTXRQSlZlRk5MZkZrc0hGbCtnUFJiUHNh?=
 =?utf-8?B?WUtkdWJVaWNqZGFnQjBIMTZwVzU2L2IxdXI3MW5MN2J5QVRqZ0VPaXFVZnRs?=
 =?utf-8?B?N1Zyb1lGVzRTeUhhQWNRdmxsQVNCM2FMYXppOWNaYnU3SkFpMit6R2xSRmRW?=
 =?utf-8?B?Z2lNV1h1NGZ1aDR2NW5CMWFHWE5JZDFxL1pOQ2dBTlFWYnFSY28wWTVhS0dF?=
 =?utf-8?Q?+3Mk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fe28a0-26c5-48dd-1021-08dbce5ca71f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:29:14.0685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hb/oJbIk/21qQBmoKcj+p3trQwEj4tsLGKWi7LE9i9gTR+knW947TtzC734/T4MB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-16 11:12, Matthew Brost wrote:
> On Sat, Oct 14, 2023 at 08:09:31PM -0400, Luben Tuikov wrote:
>> On 2023-10-13 22:49, Luben Tuikov wrote:
>>> On 2023-10-11 19:58, Matthew Brost wrote:
>>>> Rather than call free_job and run_job in same work item have a dedicated
>>>> work item for each. This aligns with the design and intended use of work
>>>> queues.
>>>>
>>>> v2:
>>>>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>>>      timestamp in free_job() work item (Danilo)
>>>> v3:
>>>>   - Drop forward dec of drm_sched_select_entity (Boris)
>>>>   - Return in drm_sched_run_job_work if entity NULL (Boris)
>>>> v4:
>>>>   - Replace dequeue with peek and invert logic (Luben)
>>>>   - Wrap to 100 lines (Luben)
>>>>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>> I wasn't able to apply this patch on top of drm-misc-next at a48e2cc92835fa.
>>>
>>> Create a branch off of a *clean* drm-misc-next and rebase/reapply/cherry-pick all
>>> 7 patches on top of that clean drm-misc-next branch. You should also run
>>> scripts/checkpatch.pl --strict on all your patches, or integrate it into the precommit
>>> hook, see githooks(5), so you don't have to run it manually.
>>>
>>> Set format.useAutobase to whenAble somewhere in your Git configs (global/local),
>>> or use --base=auto to git-format-patch when you format your patches before
>>> git-send-email-ing them.
>>>
>>> Repost your patches.
>>>
>>> The base commit will be added to the bottom of the cover letter. It should
>>> be an ancestor (or tip) of drm-misc-next (git branch --contains <base> --list etc.).
>>> If it is not, your base tree wasn't clean, and you should redo this process.
>>
>> Poking around I found out that this patch set is based off of drm-misc-fixes.
>> Had the base been included, it would've made this easier.
> 
> I believe I based this off of drm-tip. Will follow the flow mentioned above in next rev.

Sure. You can use drm-tip, drm-misc-next, drm-misc-fixes, just make sure --base=auto
is set as outlined above, and if you're including a cover letter (a free format text),
you can mention the base branch in there too, even though useAutobase has included the SHA,
it makes it easier.
-- 
Regards,
Luben

