Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC943E018
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 13:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9F46E7EF;
	Thu, 28 Oct 2021 11:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BBD6E0BE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 11:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlM1aGxNnCjThUgyMO87rFGmxbJIhp+JxhFgguPYnkjkEzBBl9a/ndK+7KqWTZ3nCfBaBYbg4EABfV1jeoIP2jFjGeJ3ELj3IaOxyYE0br8VjotIYb0JPAZNvY03jpYW7QZl04wCCArcmzUpJu/8+aDdD3WqIklnvnMgFLkT6CBmW0sM/rcTh8j4Pb3HcLPDg67NqBsTSwyPg3ZmqCdTS9ljMRUFGFlGABVlopvBN8uK0LxNxzKLB2PEz0RGLRaoMeW8UYWZY+RS/fWydGwxYBww1oWtLxVtTC5YItU2JVXOaFchnJtJQH0tp9sCSn8Z75EUffYCnIfT27pd+VTbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGfEfY3l7XoIzMKcpwCj60wmJJGCk/4S7EoSb4NMz80=;
 b=T3BZmVnFj+aTnxacSUfBx1L3ffJqWt50tajygHboAeGN0U4irWK/1SsJBRqgHe6dl2B1ItbLRib/TG5UiAzSs9hyfHKYES/QeVb7tzyF2222ocpLqCNw9n76K6de1xyts4eW2ya5YjbHTQFCBQI9OreX+SUpte233sBVhIOnkeWETyATlPQYGE8JuNa0sWek9gaQD5Vuxal0DXoudE2OG3y0zSryqJXJyR9goSF5YjBoeePkqF7YQaK0BMPwtEo2aq6Zp2F2B2d8GmQt9U3JDQRug1+XOrGBCvXqFLsXC1JUJiOwSwL/8aMPOvQ+u3SD7zr6yxYTrbsjUFBh2Qwf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGfEfY3l7XoIzMKcpwCj60wmJJGCk/4S7EoSb4NMz80=;
 b=NU5X1fkopkjqPbm1tX0AsVp01iExf3K45/b/Gn4S8fhffx+QzzlCKGzw4v1dN02mVH9Xz2zCWDGY7jxddRDTqU4F1adyx3vBN61+0ghx552yyJp1QUOFvE1RKVlmdX4RplEWv9IOUacWunDp0EWxK4/f3SDiJdR5vzjU6n64VG8=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4476.namprd12.prod.outlook.com
 (2603:10b6:303:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 11:35:30 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Thu, 28 Oct
 2021 11:35:30 +0000
Subject: Re: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: guangming.cao@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, rdunlap@infradead.org, sumit.semwal@linaro.org,
 wsd_upstream@mediatek.com
References: <0e062f12-7e79-5a05-1e7b-10dda8e353b7@amd.com>
 <20211026115248.9564-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1d681a88-5c3e-f2b1-2865-c380599a4f71@amd.com>
Date: Thu, 28 Oct 2021 13:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211026115248.9564-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:200:42::48) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM4PR0701CA0038.eurprd07.prod.outlook.com (2603:10a6:200:42::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Thu, 28 Oct 2021 11:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bd37a8a-834f-4621-5a27-08d99a070b50
X-MS-TrafficTypeDiagnostic: MW3PR12MB4476:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4476DB038EC8789D4735BFF983869@MW3PR12MB4476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUfzIa9UVYKYejles+AoaZ3ogrzczXDJkZJrdPt0fml8dqJrYnrMFvf2Gt/9oBmZwIsxbcTF/M1D2RBOW5JPl4zuVFPUimrjYZ+aBHWKUdC8kSkWAgpUum9wiPP1eyFaQyj8SgEDSkIgvGSqx0fD/rCUlYoLxeEVzo7671n5DPCjJKnL+WSSp8rzvYIFWT6/oDJgkjWjjzPaXALBugAPcNknPzsO6vHkgy1ocQM/gnm085PJNUvcGxyCGwY1WAei3Mu4aLUszt4cqnh4pjh+KbigzLD708KaWCbvSSdxLxn8n2ZIeNzTk389x9bki7Zz/uuPMvTVvVdr/Ej+k/HU732amaVvB2q5Oij8KyijzHuKDa7S40XYPTheVuQJZkOZMRn0QT6Znn3LLmvOk9jpkmfhjw9+trnzojnk7QG89MUpM1pHTg63BsZZCfRq/wwie7/L8Gxx0/3bxjumL5OmfPFCzjoxnpxr72zyu6s64ttblcFm+uM0P9sI8qrlZinIgMUmdL9TSnicgINQefImOhojPCx0N+f6EDwO4h32ELM2EJ+yt19VsbHAdkdFqA4OltCwEASw1G5bMiAlRT8f/8rRyVQHUS3jayKCAqSo7zXHNnDaTg1BBA+NB8siZBQc3JNhvluOAiiiixx70W1rCQvaiwqRR5UkQbrhfh39758p13jEh3t6vGG0zIAsP1RtTQUdQL+8lq6y1Aui6Qc5Vtj8eVkSCGBFnd/Y5lEQ0cI+iJ6n91sv6c0f2OF0hthb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(31696002)(4326008)(6486002)(2616005)(6666004)(508600001)(316002)(86362001)(2906002)(7416002)(5660300002)(16576012)(66556008)(6916009)(83380400001)(8676002)(66946007)(36756003)(66574015)(66476007)(4001150100001)(186003)(26005)(956004)(38100700002)(31686004)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVTWmxqUU1oM1dtZ3E0UFNHL0UwSjRtcnlzS01xb2tsZGE5V0h1bGMzaHVL?=
 =?utf-8?B?L0h5eDdUWVpqYVZ4ZmdDOXdkQkVublFzbEVSdjNqQm9LdWgyZTNhSVg4VVhL?=
 =?utf-8?B?elVlQ2RFQnNQTTArNnJMT2dXRjV1Y0hyTHRlZDFDdGdMeU1DTU5XS3h4NnBq?=
 =?utf-8?B?SlkwU0lnK2VoY204MURDQTgzY2tEL0RVU1JRZXE0aGptNCswcFlDRC8vNHBU?=
 =?utf-8?B?bTRmY2JwakJCY2MybDJDKzFtSzcyZHQxTGU1T0F5SGdlcEx6TndsRG1wd2F0?=
 =?utf-8?B?TjFtT3Z4WjJXMFY3YTNMTlRNTkF1ZG9SRHgxZzdzd05DNkVIcURhWlVYbzNi?=
 =?utf-8?B?cXBLcE8vemVCM1ZNbDBUd1RxcVpBL2o5a1JneWg2QWw4NnRBRStEQkNsd1Ja?=
 =?utf-8?B?T01abERXbkFNSHVFNzl6WGZQV2h2bUdFK3hWeENSKzZKQ0NBSyt4UDBoUUdU?=
 =?utf-8?B?WDlaaXg4cEFEWDc2cmxpb2FiMHF0N2RnMkVoK2pMUzhzdWh0MHhaMVRqYXRl?=
 =?utf-8?B?akY3ZGNnZzBjWFpLOHppTEVobWdNeTVKaUNKVUt3c0U1cGJpaDdBUFlLWkgw?=
 =?utf-8?B?WEg0elI5TmFwZG4xL0k3dGRsa1dIY2hwSHBpUDdyYzdYU1cxVU8vOC93RC9w?=
 =?utf-8?B?VEJjR1VLUHcrYjUzaHREcVM4aThqSkhHY3ZxUkpaR1hudXREa0tYQ2loeFUx?=
 =?utf-8?B?WTJjUGdqUlV3bnFweTExYjdBWFlkUmZqbWdQSmRxNm1LVUEzaStoZ3dCeWJI?=
 =?utf-8?B?YVBUYnJMUVhyYUFGRjl5TTM1V3VVZVFyVjA1WmtJTWpweVN1OW16QjVCbzZW?=
 =?utf-8?B?Z3pEYlg4SjczUU95WW5MWHZobjQzeTBTckpMditZTEsrTTVhRUVJU2l6UWtj?=
 =?utf-8?B?US9ZM29XbnEwRThLMXFwTnU2UjhncEpZRmgybndWazZpTlN5cUNyTWQxWjd3?=
 =?utf-8?B?bGNsYjV2aitKZ3Q0d1g0NlBBQURNUDhBSkRCZy95Z1JZVFF5OHhzU3BETFlr?=
 =?utf-8?B?c2FIMy84dStCUEErbFREems5VGQzcW9HeGlFQjVMa3VSdDNiOFFhWURMdDN1?=
 =?utf-8?B?TUJOK0V3TmZLaG91bXM2SmpLck9jTU5sa0h2aWNJMlQwUWp4eE1rTGJNS3BY?=
 =?utf-8?B?T3NkZElabzZXa2dyMWkyTVhURjBXTHpFMnUvOGNDblpiNWhrUlY0aUs0SnFh?=
 =?utf-8?B?S0VWVURZYWV6ZWFtTVprdTZYdDJTVCtoNUNGeHFPRWk4TVA2STlZNFVsVkxB?=
 =?utf-8?B?bE16Y2grL29WSDNjSmNVYVIvblpKMEFkRWVHOStBVjJrYWJBbHNCSU52STFw?=
 =?utf-8?B?RG02bTJMNlpFNVhOOGFSMFZ3S0xtN2JYWVZLcnJSWk54U3huTlFWRTVrT040?=
 =?utf-8?B?YVRlSTRHSHJoSEJuWEI3NFdka0ZuTng0akFEcDlyd1NheERrd09KV1pJMlZ5?=
 =?utf-8?B?aDAwSGZXWXo3TzJiQkRYY0t5M1lRTmEvMnl0VVJsSmlSbzJUOGprS253ak5o?=
 =?utf-8?B?QUovSXlQQ3ptckQ2WFV0cStvbm5WOGxFdXBUUG4rMWtsWWhWZEVMMXd1dS9E?=
 =?utf-8?B?dFlpZzVWV0l5b2VmQXVJeTl4Zk5HUEQ4Y0FZdHYrOUNoVW0zUk9WaUc5SHpz?=
 =?utf-8?B?YkxaeDgrcmFWRXNxTUc0bW5EdmNQUW9BSWNmblRqRkwvYUJuNnZaTjl0WHFC?=
 =?utf-8?B?Ykw3SE1CeDM5WlZIbzhWbGlFVk1XaW9tQkV5UVE0T0FtTmJtMnFYL0o2UDRw?=
 =?utf-8?B?ZkEzdWtGV2JlQkx1Rk84YlBEcVNmL2dHdVB3QjNEQmphWlp0bkFDVGtKcENr?=
 =?utf-8?B?U1lQdS9EcGJwdlA3SUVnbk1tNmJmQWJsVzdkbG1jZzR6azF4N1BpaDFlRHF6?=
 =?utf-8?B?aHFYRHp3b1REVlFueldVcDBkbm1WeHIzSWI4MUUvYWtRclJJQVFCSG54N0pL?=
 =?utf-8?B?ZFNGNk95T3B3VTZpU1pNWWVlcVpySHIrb1BIS0paU2FmUjE4dEZkcm5YTFRs?=
 =?utf-8?B?cGRaSU15TTB0TXNvNnlPV2JXVFlBTjNweFJMWFVXQjJYaElDeitrV3U4bE1s?=
 =?utf-8?B?bEx3RWkwYWZIQm1yMmdOby93MkV3MFNmb1RRa2lRM1IzOXBzUDBaVXFGb0dp?=
 =?utf-8?Q?SbKE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd37a8a-834f-4621-5a27-08d99a070b50
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 11:35:29.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLAwBj65H0Ulsg4e1wRKS3MI8p7zL1KU/NgVoXVH014q5rPkBVvQZ2IAEXV+eRoZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

Am 26.10.21 um 13:52 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> On Tue, 2021-10-26 at 13:18 +0200, Christian König wrote:
>> Am 14.10.21 um 12:25 schrieb guangming.cao@mediatek.com:
>>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>>
>>> In this patch(https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F310349&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6652f423b96547b8321308d998772121%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708459727236977%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=4EFg60sCxQzNuMKB0VjhbpvoeGlcAbofErMtcjPtIfw%3D&amp;reserved=0),
>>> it add a new IOCTL to support dma-buf user to set debug name.
>>>
>>> But it also added a limitation of this IOCTL, it needs the
>>> attachments of dmabuf should be empty, otherwise it will fail.
>>>
>>> For the original series, the idea was that allowing name change
>>> mid-use could confuse the users about the dma-buf.
>>> However, the rest of the series also makes sure each dma-buf have a
>>> unique
>>> inode(https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F310387%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6652f423b96547b8321308d998772121%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708459727236977%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=c%2Bbso%2BSxiPjwlv%2B9tAzA4x0gf5UktREhSiAsODFkihk%3D&amp;reserved=0), and any
>>> accounting
>>> should probably use that, without relying on the name as much.
>>>
>>> So, removing this restriction will let dma-buf userspace users to
>>> use it
>>> more comfortably and without any side effect.
>>>
>>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
>> We could now cleanup the return value from dma_buf_set_name() into a
>> void since that function can't fail any more as far as I can see.
>>
>> But that isn't mandatory I think, patch is Reviewed-by: Christian
>> König
>> <christian.koenig@amd.com>
>>
> So, here is no need to check return value of 'strndup_user',
> just return without error code if the almost impossible error occurs?

Good point, totally missed that one.

In that case I'm going to push the patch to drm-misc-next as is.

Regards,
Christian.

>
> Guangming.
>
>> Regards,
>> Christian.
>>
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 17 +++--------------
>>>    1 file changed, 3 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 511fe0d217a0..5fbb3a2068a3 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file
>>> *file, poll_table *poll)
>>>    
>>>    /**
>>>     * dma_buf_set_name - Set a name to a specific dma_buf to track
>>> the usage.
>>> - * The name of the dma-buf buffer can only be set when the dma-buf
>>> is not
>>> - * attached to any devices. It could theoritically support
>>> changing the
>>> - * name of the dma-buf if the same piece of memory is used for
>>> multiple
>>> - * purpose between different devices.
>>> + * It could support changing the name of the dma-buf if the same
>>> + * piece of memory is used for multiple purpose between different
>>> devices.
>>>     *
>>>     * @dmabuf: [in]     dmabuf buffer that will be renamed.
>>>     * @buf:    [in]     A piece of userspace memory that contains
>>> the name of
>>> @@ -341,25 +339,16 @@ static __poll_t dma_buf_poll(struct file
>>> *file, poll_table *poll)
>>>    static long dma_buf_set_name(struct dma_buf *dmabuf, const char
>>> __user *buf)
>>>    {
>>>    	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
>>> -	long ret = 0;
>>>    
>>>    	if (IS_ERR(name))
>>>    		return PTR_ERR(name);
>>>    
>>> -	dma_resv_lock(dmabuf->resv, NULL);
>>> -	if (!list_empty(&dmabuf->attachments)) {
>>> -		ret = -EBUSY;
>>> -		kfree(name);
>>> -		goto out_unlock;
>>> -	}
>>>    	spin_lock(&dmabuf->name_lock);
>>>    	kfree(dmabuf->name);
>>>    	dmabuf->name = name;
>>>    	spin_unlock(&dmabuf->name_lock);
>>>    
>>> -out_unlock:
>>> -	dma_resv_unlock(dmabuf->resv);
>>> -	return ret;
>>> +	return 0;
>>>    }
>>>    
>>>    static long dma_buf_ioctl(struct file *file,
>>

