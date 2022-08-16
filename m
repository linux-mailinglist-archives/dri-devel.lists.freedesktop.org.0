Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46119596093
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 18:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C0B11A355;
	Tue, 16 Aug 2022 16:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB2AEFDF;
 Tue, 16 Aug 2022 16:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRqabzE7CN+nAPO7HdM3aIuxdLLqYusmFBQ1+eFeSodT8HCzP+iE6j5DecTVwu/5H9AqaqNJ3swGP3G/zEsXmgC22DVravwwYzuVb/9P3B5DrE2D+MIaW1w8uNbzfuNclW0QNPAh+EbsPdvKnMX7o9gn6m1d7hSsdfNGCekXmZo2wupqLmR7RCJjYcXaG/9iAMQSCbqqdLw+dwwYZpvXi2ZG6tCObSPW6G0SonNAyu1cxgUxiwWjMCE5cKqWMg3A/ZAMaC98v1SxufhUB9e4eqVRpBP8yTPm0gcpBhyWohpP0ymqn35rC86bEo5pxbMSPe2oR3hY/qYvbv7Qh0JB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9gANgFdQVGk51hiUtj4X5yHe/rDB7AmKtcrhAJJSnw=;
 b=DxZ/+7HMsZuiS+DGx7wa5OeVaGhwrSt9GnLxMy7DPVYMfu/4pULR/WUvTRBsLuAbcG5gz+gDpBm/9n7m21673feMgPVKPK1B6XwxsHLZzk50h95WlG+SZANK7+T3K1C891Y0IzfnwOi1bLVPy1EYQGVaGl1eWLTFex0KE5wiQDIEzV+XiCv2eaDPkTCxQExj1AasYOQJYvA8YIW8rV7BIRgWskT60httdaXxVXGjd4fxtNS1kGQeZ2lZX2sYj3LQBpy72UjqwCCSdw/l0u0K3DjmCZabCmo0d++TYc8AWhaYmxr91YVTjCTpS2Xq3f+WMsZmokjLWptm9ApC/VYAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9gANgFdQVGk51hiUtj4X5yHe/rDB7AmKtcrhAJJSnw=;
 b=KvSiXOgPIq6bUsywBg+VLbRXE0L8OE9AAMEkL37H9cjoBHGVGKExbWXQJF6O688Eke/Xqc6vQPjtRB7IhjYtoVXa8xC7XkJzx55LI8QHLFUnXkk9Fgk5TtyeOEJ/E82FKjPqh6cZhN/HvBPQ9n6RSo5zTerVVYz5fkdis2k2z9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 16:51:01 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::78a4:a1dc:b951:15cd]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::78a4:a1dc:b951:15cd%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 16:51:01 +0000
Message-ID: <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
Date: Tue, 16 Aug 2022 18:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0537.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::34) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52dcbb50-08b7-4202-1b9b-08da7fa77fe0
X-MS-TrafficTypeDiagnostic: BYAPR12MB3094:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+vCDKnrcbgpjbHrsDxGhVVuk+9hrk3GO9hDIaBYX36q1BCbZj90zu7jcxQkHXRw/ReEWw8drfymPZ+4aBZjhBcSQm2KPwLvObtdPAE1HisEiBiTW4ivQqkyw48nbnZo6fM0FT38iv3mTJ1g9YYgDxxeGHoXDhdGLbeKJG8ixCrpjhmWjFQiwGZa7f2nSrV1ejLJcfOCIiF6FFQPDZXLDem+KvCbdXhzlE97895bA0HUH2kXUulUFGRbwKufnHIq1Z5UjTJyBfX7mHYdRER9+66Y3cOoUP60L0/U/rdWburkCexc0oeIBgcKQGqmyidPXVVB0zXm79TpjGJcj6z2ix33yyWuR0jntf98ZdRq1ST5pDyuCCAWPUYHuTpjyOty38Peg4/flAiE1lUxbOchiXHDghrMhrGLcsIHH2lXMTfVyiz2DoJ2IabiasqtqSvjZlHnmvvCnsZzl/cZPM0F1ImuX5wctRQtYrDo4EXYmvxgT9zsyLce1cU/mHt68r2aqoBDbDl3Xh+swpAPDZEERWrvebK6tFUA0XQSnd6Bl1Ul+wmhqOqJVicSBX77dPtTRN4VUtKZlxL20uHTQLWbHBW1+0PGtuyef/LGLCla5x6wkWZkpVG5bmOANb6oCWXNvTDgB0BqqQsP9w8vwHGyxlHurc36yq6l2bvVukuFfKW1C2+W1Gn5JnThHFflyiG4a3YHLq4Dani/9Euna1/GM8qoYgQQhUPBypSxYFPIWLEds9NONWaU6pFPrG86Cpb9rhSI1NiNXUADrx59botFVxqE97FpdNg11VjclHorDSJCURpxS53LDB5h5j8dT/PPIVLw8xk+pH5kYuPVLtEbpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(41300700001)(478600001)(54906003)(316002)(38100700002)(4326008)(6486002)(7416002)(66946007)(8676002)(30864003)(8936002)(66476007)(66556008)(5660300002)(2906002)(6916009)(31696002)(53546011)(31686004)(36756003)(186003)(86362001)(6506007)(66574015)(6666004)(2616005)(83380400001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkJ0NFdqMTJ3OWMzZWxwZUp3eURuTFRBb1NyaVhoZkE0NXBmajk4SEFwdDg1?=
 =?utf-8?B?UEFWNjEzb1M5QUMvbzRuaEV2S2FpakZPWGtvVDRubTgvRVZ3L3BIc1MrZklo?=
 =?utf-8?B?V29jd2ZSVHllaVRwUnV0a2FDSUF4TWhLWU1WdGkrc2JNWkF1S2REYm9uUzh4?=
 =?utf-8?B?YTBvWlByWjhHQmdKZ3VEZ2ZmZkdyM29QYlRYMG53U0ZnZHVwYVFZcGlFMXpV?=
 =?utf-8?B?b3VHL2lDWjgzcW8yQ3BKM296dGMrdEFpSVhaejRxRkJhcElmTFlrckUvNU1E?=
 =?utf-8?B?MG9DMnREME0wNVNWK3BRTll4RldWektiWThuVzV5OEJtU0hqdmJDTHBXb2Nk?=
 =?utf-8?B?VzQ0NHFUdXdEVkVKYXhBallBQkQxeWdySmpwWkFFTkl2dDRvKzVJeHpML25z?=
 =?utf-8?B?UUJOck1HOWVqSTlVMEV3YkhENEV6RUZwOUNHWklxS2hQNVpXcURNZ2I5dFho?=
 =?utf-8?B?ZDJ6aGYxbGEwQW5FbUNPY2h3Rlh0ZGEya2VuemZaczc1ZUU1Qi9KWk1CL0pi?=
 =?utf-8?B?WmIydEpSVlZSRlh4a3Q2cTJHN01JZ1VoZUFLcWg3OEJUVXhVN0hGYzRJazdi?=
 =?utf-8?B?T2prb0lpOG1JcVd3MUFON25yRTZFejZjVC91TjZQc0ptaW1oZU9iSUtNRXU4?=
 =?utf-8?B?djNLWS9Vb0JVZFYzNHF0WFZMQ1Uxa1duTW45SzBpdldQcmhDZGZZQ1I4S1RV?=
 =?utf-8?B?QWRqbGNqcXEyVzhNM0JZU1dIaDVCemk4QU9FSnVTMzJpZVN5NEN0VGI3Qi93?=
 =?utf-8?B?UjNGTVRMR0VJbDdKUE1rT3JPRFZBSFVOZFkzTFlvY1hEWGs3UjdJeVNrbnl3?=
 =?utf-8?B?TitsZ0JsaWhTWGxVVEd2eGFMUG5yR0NBa3NjRzkxWGhnSjBpd2ZBcUx1R3hs?=
 =?utf-8?B?blAyWWVEZzVWS3JpTmZtYXV0ZnZyRWs0U2ZnSDJEVVBZK25OVks0QmlHNHNK?=
 =?utf-8?B?VFZvek5xN3h3aWlNTGJrSDl4YVkyQTBuZ3dQQzNtTWQ3QVc1VmMrakJwcXhO?=
 =?utf-8?B?cnExVGlUWVo4QWJ1UlBieWFaVUdrZk1DVDFnYUJKcG5ENUhXNmRtZU9QMDhq?=
 =?utf-8?B?bnNpeW8vMVlUOG5Vb25Hb1JEdjJhK29Mb2JiZEFDNXRvQWh6eW1ndXlDUzMz?=
 =?utf-8?B?bEc1Ui83dmFTd2xSQjhTR0V1eE1VWC9zQUVxRjJ6NUU0Y2Y4MFBLNVBiVFVq?=
 =?utf-8?B?MDkyVkJSeXQ1aFlubjlQcklXKyt0dFAyYXdnblFRNy9YM3NIWjlMdTZ6anlm?=
 =?utf-8?B?UlgrWEk2Q2QxZWtJT1dscUJDc2o3VjZhWlp5NHNVYWJwZDdCYXc1YnVFdGpM?=
 =?utf-8?B?S1h1R1VDcldPQW5wczVZYmlVY3lGNS9nQjU0ZXQySXNOUFBIY2EzcnFWcmsy?=
 =?utf-8?B?QW9JVjBSVmxTUDAvdWx2cVJaUDQ5TDRwTlRQeDBDV1BicnIzNkcrc2wzWjRM?=
 =?utf-8?B?d2lXbnJSbHptUFVKUk9kVTNHbmlUNFN1THcrTHhpaGxycXk3bC9hQkk3SGV0?=
 =?utf-8?B?dmk1R3dWL25HVmlpV2NramtyNmdnb29rcHNyUkNNdVJKWmcvSjNKRVJWZmt6?=
 =?utf-8?B?K0twN1R5djRTc1JVa0xTU0RwelBSYjJEVDh2UkNCc2ZLSm91UWd2TTd5cDVN?=
 =?utf-8?B?VmZMZnc0S1NJaWZaelpZeHYvY04vMlB4My9IWk91VFhQdTdnamM4SXIrZDFq?=
 =?utf-8?B?QmZMV2hhdmZaMnZYRGl3eHE3enVvU3d1U0pienBhRnQybzFWY04xVkxNRkY2?=
 =?utf-8?B?MnlEWkJzTityWllhaHF1Z1JrZ0M1cXJrbUgzY1Y1SkZVc1dGVDNzRjRyM0NE?=
 =?utf-8?B?R2k2S0FZR0VWbzFSZ1NaSzZxa2dsUVAzOE5RYzB4U2h3aW1FbXJhcTdjMjRj?=
 =?utf-8?B?MTQ3K1pFTFhzVWc0SGVGTVlRYTY2Z05Kdm42TFRIUFpack93MjZsNDM4Y1l0?=
 =?utf-8?B?SVFZKzU4SkRIWW1pbXlOVkpOejFnbzlJa1FmaUdjeVJ0ZDNrQ3BQVGdHYjJ3?=
 =?utf-8?B?cVRsUWFtNzB0dDR4TWtUMkFqNjRQYW1TSlczZzBlSzIwS012WGlkVXJTNXFo?=
 =?utf-8?B?aVFSNzRwUUZtVml2MGxCNk5lQzJKYXV4VklpV2dITzNRQjFLWUI1MEtOV21J?=
 =?utf-8?B?R1JiazhzTHI2SU5Hb3VNQWYraXZPSC9ldXA4N3F4NEx6YWV0djQzUG1vdUts?=
 =?utf-8?Q?KJuQjbV9C3utU99fUTllwj21HHou7Mpe4AHvjTwGueA7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dcbb50-08b7-4202-1b9b-08da7fa77fe0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 16:51:01.0974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgYxUzPKC1UmRZXSnLA9qCa2gjHJ7RUe07ejLqHPVhTjw8GU+0eJUD9Yz0uNU7hb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3094
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.22 um 16:26 schrieb Rob Clark:
> On Tue, Aug 16, 2022 at 1:27 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 15.08.22 um 23:15 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> This is a fairly narrowly focused interface, providing a way for a VMM
>>> in userspace to tell the guest kernel what pgprot settings to use when
>>> mapping a buffer to guest userspace.
>>>
>>> For buffers that get mapped into guest userspace, virglrenderer returns
>>> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
>>> pages into the guest VM, it needs to report to drm/virtio in the guest
>>> the cache settings to use for guest userspace.  In particular, on some
>>> architectures, creating aliased mappings with different cache attributes
>>> is frowned upon, so it is important that the guest mappings have the
>>> same cache attributes as any potential host mappings.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> v2: Combine with coherency, as that is a related concept.. and it is
>>>       relevant to the VMM whether coherent access without the SYNC ioctl
>>>       is possible; set map_info at export time to make it more clear
>>>       that it applies for the lifetime of the dma-buf (for any mmap
>>>       created via the dma-buf)
>> Well, exactly that's a conceptual NAK from my side.
>>
>> The caching information can change at any time. For CPU mappings even
>> without further notice from the exporter.
> You should look before you criticize, as I left you a way out.. the
> idea was that DMA_BUF_MAP_INCOHERENT should indicate that the buffer
> cannot be mapped to the guest.  We could ofc add more DMA_BUF_MAP_*
> values if something else would suit you better.  But the goal is to
> give the VMM enough information to dtrt, or return an error if mapping
> to guest is not possible.  That seems better than assuming mapping to
> guest will work and guessing about cache attrs

Well I'm not rejecting the implementation, I'm rejecting this from the 
conceptual point of view.

We intentional gave the exporter full control over the CPU mappings. 
This approach here breaks that now.

I haven't seen the full detailed reason why we should do that and to be 
honest KVM seems to mess with things it is not supposed to touch.

For example the page reference count of mappings marked with VM_IO is a 
complete no-go. This is a very strong evidence that this was based on 
rather dangerous halve knowledge about the background of the handling here.

So as long as I don't see a full explanation why KVM is grabbing 
reference to pages while faulting them and why we manually need to 
forward the caching while the hardware documentation indicates otherwise 
I will be rejecting this whole approach.

Regards,
Christian.

>
> BR,
> -R
>
>> If the hardware can't use the caching information from the host CPU page
>> tables directly then that pretty much completely breaks the concept that
>> the exporter is responsible for setting up those page tables.
>>
>> Regards,
>> Christian.
>>
>>>    drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>>>    include/linux/dma-buf.h      | 11 ++++++
>>>    include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 132 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 32f55640890c..262c4706f721 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>>>        .kill_sb = kill_anon_super,
>>>    };
>>>
>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>> +{
>>> +     int ret;
>>> +
>>> +     /* check if buffer supports mmap */
>>> +     if (!dmabuf->ops->mmap)
>>> +             return -EINVAL;
>>> +
>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
>>> +
>>> +     /*
>>> +      * If the exporter claims to support coherent access, ensure the
>>> +      * pgprot flags match the claim.
>>> +      */
>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
>>> +             } else {
>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
>>> +             }
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>>    static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>    {
>>>        struct dma_buf *dmabuf;
>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>
>>>        dmabuf = file->private_data;
>>>
>>> -     /* check if buffer supports mmap */
>>> -     if (!dmabuf->ops->mmap)
>>> -             return -EINVAL;
>>> -
>>>        /* check for overflowing the buffer's size */
>>>        if (vma->vm_pgoff + vma_pages(vma) >
>>>            dmabuf->size >> PAGE_SHIFT)
>>>                return -EINVAL;
>>>
>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>    }
>>>
>>>    static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>        return 0;
>>>    }
>>>
>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
>>> +{
>>> +     struct dma_buf_info arg;
>>> +
>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     switch (arg.param) {
>>> +     case DMA_BUF_INFO_MAP_INFO:
>>> +             arg.value = dmabuf->map_info;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static long dma_buf_ioctl(struct file *file,
>>>                          unsigned int cmd, unsigned long arg)
>>>    {
>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>>>        case DMA_BUF_SET_NAME_B:
>>>                return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>
>>> +     case DMA_BUF_IOCTL_INFO:
>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
>>> +
>>>        default:
>>>                return -ENOTTY;
>>>        }
>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>        dmabuf->priv = exp_info->priv;
>>>        dmabuf->ops = exp_info->ops;
>>>        dmabuf->size = exp_info->size;
>>> +     dmabuf->map_info = exp_info->map_info;
>>>        dmabuf->exp_name = exp_info->exp_name;
>>>        dmabuf->owner = exp_info->owner;
>>>        spin_lock_init(&dmabuf->name_lock);
>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>        if (WARN_ON(!dmabuf || !vma))
>>>                return -EINVAL;
>>>
>>> -     /* check if buffer supports mmap */
>>> -     if (!dmabuf->ops->mmap)
>>> -             return -EINVAL;
>>> -
>>>        /* check for offset overflow */
>>>        if (pgoff + vma_pages(vma) < pgoff)
>>>                return -EOVERFLOW;
>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>        vma_set_file(vma, dmabuf->file);
>>>        vma->vm_pgoff = pgoff;
>>>
>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>    }
>>>    EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>>
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 71731796c8c3..37923c8d5c24 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -23,6 +23,8 @@
>>>    #include <linux/dma-fence.h>
>>>    #include <linux/wait.h>
>>>
>>> +#include <uapi/linux/dma-buf.h>
>>> +
>>>    struct device;
>>>    struct dma_buf;
>>>    struct dma_buf_attachment;
>>> @@ -307,6 +309,13 @@ struct dma_buf {
>>>         */
>>>        size_t size;
>>>
>>> +     /**
>>> +      * @map_info:
>>> +      *
>>> +      * CPU mapping/coherency information for the buffer.
>>> +      */
>>> +     enum dma_buf_map_info map_info;
>>> +
>>>        /**
>>>         * @file:
>>>         *
>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>>>     * @ops:    Attach allocator-defined dma buf ops to the new buffer
>>>     * @size:   Size of the buffer - invariant over the lifetime of the buffer
>>>     * @flags:  mode flags for the file
>>> + * @map_info:        CPU mapping/coherency information for the buffer
>>>     * @resv:   reservation-object, NULL to allocate default one
>>>     * @priv:   Attach private data of allocator to this buffer
>>>     *
>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>>>        const struct dma_buf_ops *ops;
>>>        size_t size;
>>>        int flags;
>>> +     enum dma_buf_map_info map_info;
>>>        struct dma_resv *resv;
>>>        void *priv;
>>>    };
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>> index b1523cb8ab30..07b403ffdb43 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>>>
>>>    #define DMA_BUF_NAME_LEN    32
>>>
>>> +/**
>>> + * enum dma_buf_map_info - CPU mapping info
>>> + *
>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
>>> + *
>>> + * Importing devices should check dma_buf::map_info flag and reject an
>>> + * import if unsupported.  For example, if the exporting device uses
>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
>>> + * CPU cache coherency, the dma-buf import should fail.
>>> + */
>>> +enum dma_buf_map_info {
>>> +     /**
>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
>>> +      *
>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
>>> +      */
>>> +     DMA_BUF_MAP_INCOHERENT,
>>> +
>>> +     /**
>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
>>> +      *
>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>> +      * However fences may be still required for synchronizing access.  Ie.
>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>> +      *
>>> +      * The cpu mapping is writecombine.
>>> +      */
>>> +     DMA_BUF_COHERENT_WC,
>>> +
>>> +     /**
>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
>>> +      *
>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>> +      * However fences may be still required for synchronizing access.  Ie.
>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>> +      *
>>> +      * The cpu mapping is cached.
>>> +      */
>>> +     DMA_BUF_COHERENT_CACHED,
>>> +};
>>> +
>>> +/**
>>> + * struct dma_buf_info - Query info about the buffer.
>>> + */
>>> +struct dma_buf_info {
>>> +
>>> +#define DMA_BUF_INFO_MAP_INFO    1
>>> +
>>> +     /**
>>> +      * @param: Which param to query
>>> +      *
>>> +      * DMA_BUF_INFO_MAP_INFO:
>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
>>> +      *     caching of a CPU mapping of the buffer.
>>> +      */
>>> +     __u32 param;
>>> +     __u32 pad;
>>> +
>>> +     /**
>>> +      * @value: Return value of the query.
>>> +      */
>>> +     __u64 value;
>>> +};
>>> +
>>>    #define DMA_BUF_BASE                'b'
>>>    #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>
>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>>>    #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>    #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>
>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>> +
>>>    #endif

