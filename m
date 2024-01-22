Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F583648D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 14:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6419B10EED6;
	Mon, 22 Jan 2024 13:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B7910EED6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 13:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyJurin/nm60kD6kOf9GBDpmEHH1VFbtltGOB+Hgf/repmX5QFFejdNsJoNky/KjzSAWJx9JBhznvyysgUHkYyT8xGiaCxwjPigiU7Qgkgew/9x2kHtiMhY9Dv6V4gWXopMVHdXlSJfNfEAJlLWCQ9/GhHEy3EhzFWZsWQ2Rgq8fGJSELWkN2NQaDXyhB1dz9fRh9dtgRyIFQgFMCjvBvN0l6Qiqx+R+fUeHzCWoDqlLhFRnmC/HunpS6rrhgzjjjfpXSD+X0uzFKfFgWPs/QWQ2woQpe1NtPvI9FOPjdVv9EzEU/3veeGrGEBTSQbubw01veMpx0Xs861h1Y86Lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2/uND+PylRqEr8qzmxLFKHDrUvlITQ5CkViw7tP1Q0=;
 b=WLuXjFqUymwtYFA2vuXQJ9cF98jZAlsmENPfjeor4JZJNCZHkroGcTsPnl9V9esx0/037UAouiY1OCK6ue0LvAIOSTu6QqozCJzf2Z47yYTSgh3BcVuXHg16yHIOxgTCdYPzFhgEfaqywfzRfwAdR3n3Yn11PMR5huXJX7ydnBUyPC6u1zKn6ogi6kyE8jbZp5o0nWW2MqkxHzYJMSHAjF7LeQlv2XYLnGDNz6pQ4E3OXlW05TwCzHjdEGfmo7akthNHYTTY26wCuCcRkkE/+aJgHyCfUPC12g4lljik6XYejUIxF84yQKr/efwPV5+7N3UDff3YyBemunqWvzTNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2/uND+PylRqEr8qzmxLFKHDrUvlITQ5CkViw7tP1Q0=;
 b=Z6nyTA1CcFTlk8lGvi0oRYWNh273RCO6YsguN43OtCH0zv4abzOGfh3645H9P/nSwE+1pktsO6Cny0noX4CPzxsUn0qfS7Ouug4bAZV9sQ7h+HLDADk6JKKa7OXwyRH7d/SOwRKPuGRYylBZcOuV36KSq9C8+WKe+Rr24AQnyMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 13:41:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 13:41:23 +0000
Message-ID: <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
Date: Mon, 22 Jan 2024 14:41:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 1332b9b8-ed1a-47a8-79fe-08dc1b4fd298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/DFazMuZlCZO8kkNh5i26b8cm/YMhDofn1fwhnj3gml8L+xPxNk+oDwnH2DP7DlnfYvdvBRflj0z+2fYaBHfJxupybv5rZ71wAgiXVVfiFBU8ys4Opx89e1UPx178p1XH3rhvmgy8NntLaFRsYOY8OzSaWQxQT0BZXmZp4knmbbdcMJ7BmzMx6v8n8gDCOLisQKHbrXo0hNq4/J2tqyte2NlU1bkHEZ6PgEge+Yr1rGsz2wwlL08z701RpyomhdVy975uQub4fptSut/y4rfO0UUtmBuKq8tQuYMxQKhxK5vtBKTV4KY9v53GxuZoH6xPMVWcFKQuz1AsZgLRUS+brZxxaqR5Y/ch4TTdru25mFD5zIutWw7pZ/+B3wbDRAMP8CPoBrtuboqnVCMW4Bl3HeEY2fvW1Lo7X/PcbRkq5EPW9xOwWw6PBOEasDNvRzYrZKpyX0NlwmOhvb9US6a+xDYpgHT4ZQE2hLTExHbW/OEWPDp06w68vBmfVy05S8TfKQMJSvOl4OOKAlgC4TIjKg5ZMP4FuK4fOO6nSrQx/2/HWCv2vWAZaHqmuJSfie+KQ4m13USzTkASSWCzos2zBWgdgmz4uvJZiayOaSiOiEvV2sx8vdBjDlvqxlEVZR4Xj2N4zXpFgdeUM+HY8JAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(2906002)(66946007)(54906003)(66556008)(66476007)(26005)(66574015)(110136005)(6666004)(8676002)(6486002)(6506007)(478600001)(4326008)(316002)(8936002)(6512007)(5660300002)(7416002)(2616005)(38100700002)(83380400001)(86362001)(31696002)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3AwMXcva1BUaThCNC9GTVF1Z3RhQUdOc0pUdm1qMlBNRDZ4cWFmQlFFcTA2?=
 =?utf-8?B?aEZtY0NYazFNWHJpNSswelI3TDVEcGN2aUl3TWRBL1JIYlAzUHlGbXBFa2FU?=
 =?utf-8?B?SVFVcngvUHNYNzVXUXV3ejZOSjNSaDBvWWRGREtqRGdrQUVacXowT2lzdUdG?=
 =?utf-8?B?dzVjZlQvaTd4aFVSVnBZSlpkZGRkTlVtTzNDTmNSTEl6dW5DcjR5cXNBM0Rk?=
 =?utf-8?B?ZnlwWTNkTjVzZHpjZU9jSUtuclJscXlCN0M0Y0ZwMWxwZW5EMnVQUWF6dTRK?=
 =?utf-8?B?dnROZ1M2QkxOMzF5emV3TkRBcElMM3d5NzlmQWlYYjFaOWxZMWFrQ2hmUmxj?=
 =?utf-8?B?YW9Pc1ViZFY3V1pJMWZrWUtJbmJob0FvNWwrVDJXaUhGbHNaUGlmZGhreVpx?=
 =?utf-8?B?bGk5WERnejNhUTAyenlDcjh2YnRGMW5WaW1OMWN2Qzc0S0s0N3ZOSTVFQzA2?=
 =?utf-8?B?bUxKUFdqR25vT1NJNEg0VVhFSVliU3lJdHVmbFBBQnJQcndtemN1c3hKb1RQ?=
 =?utf-8?B?TEdTMnd0WkRWZk9RMlNack1NczdPM3Z5TlYrQzVISCtmOE1wb2RscTFGWEZ2?=
 =?utf-8?B?TFQvWEd1VHdzVld2d3UrMWxqVHlTaEZxcng3eW9ILzAvWnJGMHY4dEtzd205?=
 =?utf-8?B?Q2hGcyt6WVhWNDNLSWljbW5VMHlPN2ZnUXFKY3F3Sm5kbStVSnJaZnRNREUz?=
 =?utf-8?B?ejBYQTRwYWFyYld5RTFkNWVsMDZ3TytqMHRoQmc5cjhiaTJORGM2cmpaazFF?=
 =?utf-8?B?QkRMbTNBWkZ2ZzBHYVM1dE9sVEduK0xHKzdZUUJMNm1kMlYvODFweWRpQ1BQ?=
 =?utf-8?B?eVJ2MGJPSCtUTEhnVHlwbXhaeVMvUlF0MnU2YTBNMlJ4bDdwWXFJR0JkbUEx?=
 =?utf-8?B?VjB1QjlDM1dCUHhXd1lsN0pjdGwzbDlyTlI5dFFuM2V6NU9Wc0NNRmtTNnpO?=
 =?utf-8?B?NHBDcUVOUVAycXlXZko1OVlPVThXSDRmL3pCM2w4d0lIdGJsdTlOS2NEUHBV?=
 =?utf-8?B?TTJ3V0lGTFdVODJ5OUxFbUU4aEFXdUJmbUdBdjdXTURtaWtZMnN5TzV2UWpZ?=
 =?utf-8?B?ek5ZeUxySkxKM255Mk5hdjlwdy9jM1doWnk4UUYyS3kxdzhTbG9yVFE3ZzRI?=
 =?utf-8?B?ZWVTS0ZndXgwQ3dRbFZSWmdGTTRZNDMxQmQzcFpHVGl4a0xkNXp4RlZKd3M4?=
 =?utf-8?B?ZG1zWVRBK05NUWtsY09NTVFxaHZwMFE1OEl4V2tuM1FNcGU2ZzhaR2tPbEph?=
 =?utf-8?B?eHpEa0xQTi9SNmtDVnVVOTVXNlNLelh2SWpxeHRqZWUvamF6Z2RBYjlyTWpu?=
 =?utf-8?B?aG5KSURhRVY2OFJtQUdNLzdqZXkybWYzUERmSFc5T09aYk1DZUNLTHNMRzJ2?=
 =?utf-8?B?bDBwQTZ5dDQxeVZRTFhNZWI3RTUzckcza3lhekZ1RjIrTWUwZzgxQ05HZHUx?=
 =?utf-8?B?akNoVTIvYmNkUGlNZm8vQ1gyQUpuTFgyWXUyY3M3ellDWVZobzhyd0x0TEFV?=
 =?utf-8?B?ZjdmSnhHOTg2RnNMNGpLeHAzemRCWW42eFdmOUptdE51RTRHWVRBekFpZHlH?=
 =?utf-8?B?ZFpHSUxOWlIxM096NWtvSXRQNkJLbTdBR3hnZlhVNTdvZGhPNzdBUVA0ZEI4?=
 =?utf-8?B?dnByTmRwVlJ1dmtOOWR0MjdZRUJMWWtLdVFDUjI3Tk10ME5uMnphSXhvcG9D?=
 =?utf-8?B?TnZKL09zMmhVZHJacE1VY3ZuNVJFWmxSMjJKSGhUZjN5SDdiUmJqeFhHQTdB?=
 =?utf-8?B?Y2RORVFQVFl3djZlbGxBaDhJM21CRnBxbnZhYW9jajNFcWNTT0doTVdKcGo2?=
 =?utf-8?B?QSsvSmRUYmg4Rm0zVVRNL3o5ekNwR1hyZHFGNHNBUXgvNUhKdWt5T1dTaEo2?=
 =?utf-8?B?TUwycDgwRENqdElIS3lyRFJ4Yi9Wajh2TWJwZ05weU14b0d0bkR4OC8xOE9O?=
 =?utf-8?B?MFBSYjdvcHdDQi9LQXBiMlFlMkhtVkNLc1pKb0g2Lzd1MVB0bEFFTGluN0l0?=
 =?utf-8?B?M3VVaXFsZ2h4dGkzczJFZ0hsQ0JybklJU0dlTjh6N0hqVzZFa09xcVhYMi9q?=
 =?utf-8?B?OURtNnNSN3lVOVpIZEUvbDBDU3p4RUJxWHpJSzJtMEVNMTRHY3hZRFFNZkVz?=
 =?utf-8?Q?B7WpbRgmWui8exUbubgi4eRoI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1332b9b8-ed1a-47a8-79fe-08dc1b4fd298
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 13:41:23.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alu2sZLKakqmTHNNQh2RKjwubVmZ0W57sxMifsEKGJFkYTt2iux4BUKgvZinutSw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.01.24 um 12:01 schrieb Paul Cercueil:
> Hi Christian,
>
> Le lundi 22 janvier 2024 à 11:35 +0100, Christian König a écrit :
>> Am 19.01.24 um 15:13 schrieb Paul Cercueil:
>>> These functions should be used by device drivers when they start
>>> and
>>> stop accessing the data of DMABUF. It allows DMABUF importers to
>>> cache
>>> the dma_buf_attachment while ensuring that the data they want to
>>> access
>>> is available for their device when the DMA transfers take place.
>> As Daniel already noted as well this is a complete no-go from the
>> DMA-buf design point of view.
> What do you mean "as Daniel already noted"? It was him who suggested
> this.

Sorry, I haven't fully catched up to the discussion then.

In general DMA-buf is build around the idea that the data can be 
accessed coherently by the involved devices.

Having a begin/end of access for devices was brought up multiple times 
but so far rejected for good reasons.

That an exporter has to call extra functions to access his own buffers 
is a complete no-go for the design since this forces exporters into 
doing extra steps for allowing importers to access their data.

That in turn is pretty much un-testable unless you have every possible 
importer around while testing the exporter.

Regards,
Christian.

>
>> Regards,
>> Christian.
> Cheers,
> -Paul
>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>
>>> ---
>>> v5: New patch
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 66
>>> +++++++++++++++++++++++++++++++++++++++
>>>    include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>>>    2 files changed, 103 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 8fe5aa67b167..a8bab6c18fcd 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -830,6 +830,8 @@ static struct sg_table * __map_dma_buf(struct
>>> dma_buf_attachment *attach,
>>>     *     - dma_buf_mmap()
>>>     *     - dma_buf_begin_cpu_access()
>>>     *     - dma_buf_end_cpu_access()
>>> + *     - dma_buf_begin_access()
>>> + *     - dma_buf_end_access()
>>>     *     - dma_buf_map_attachment_unlocked()
>>>     *     - dma_buf_unmap_attachment_unlocked()
>>>     *     - dma_buf_vmap_unlocked()
>>> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct dma_buf
>>> *dmabuf, struct iosys_map *map)
>>>    }
>>>    EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>>>    
>>> +/**
>>> + * @dma_buf_begin_access - Call before any hardware access from/to
>>> the DMABUF
>>> + * @attach:	[in]	attachment used for hardware access
>>> + * @sg_table:	[in]	scatterlist used for the DMA transfer
>>> + * @direction:  [in]    direction of DMA transfer
>>> + */
>>> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
>>> +			 struct sg_table *sgt, enum
>>> dma_data_direction dir)
>>> +{
>>> +	struct dma_buf *dmabuf;
>>> +	bool cookie;
>>> +	int ret;
>>> +
>>> +	if (WARN_ON(!attach))
>>> +		return -EINVAL;
>>> +
>>> +	dmabuf = attach->dmabuf;
>>> +
>>> +	if (!dmabuf->ops->begin_access)
>>> +		return 0;
>>> +
>>> +	cookie = dma_fence_begin_signalling();
>>> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
>>> +	dma_fence_end_signalling(cookie);
>>> +
>>> +	if (WARN_ON_ONCE(ret))
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
>>> +
>>> +/**
>>> + * @dma_buf_end_access - Call after any hardware access from/to
>>> the DMABUF
>>> + * @attach:	[in]	attachment used for hardware access
>>> + * @sg_table:	[in]	scatterlist used for the DMA transfer
>>> + * @direction:  [in]    direction of DMA transfer
>>> + */
>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>> +		       struct sg_table *sgt, enum
>>> dma_data_direction dir)
>>> +{
>>> +	struct dma_buf *dmabuf;
>>> +	bool cookie;
>>> +	int ret;
>>> +
>>> +	if (WARN_ON(!attach))
>>> +		return -EINVAL;
>>> +
>>> +	dmabuf = attach->dmabuf;
>>> +
>>> +	if (!dmabuf->ops->end_access)
>>> +		return 0;
>>> +
>>> +	cookie = dma_fence_begin_signalling();
>>> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
>>> +	dma_fence_end_signalling(cookie);
>>> +
>>> +	if (WARN_ON_ONCE(ret))
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
>>> +
>>>    #ifdef CONFIG_DEBUG_FS
>>>    static int dma_buf_debug_show(struct seq_file *s, void *unused)
>>>    {
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 8ff4add71f88..8ba612c7cc16 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>>>    	 */
>>>    	int (*end_cpu_access)(struct dma_buf *, enum
>>> dma_data_direction);
>>>    
>>> +	/**
>>> +	 * @begin_access:
>>> +	 *
>>> +	 * This is called from dma_buf_begin_access() when a
>>> device driver
>>> +	 * wants to access the data of the DMABUF. The exporter
>>> can use this
>>> +	 * to flush/sync the caches if needed.
>>> +	 *
>>> +	 * This callback is optional.
>>> +	 *
>>> +	 * Returns:
>>> +	 *
>>> +	 * 0 on success or a negative error code on failure.
>>> +	 */
>>> +	int (*begin_access)(struct dma_buf_attachment *, struct
>>> sg_table *,
>>> +			    enum dma_data_direction);
>>> +
>>> +	/**
>>> +	 * @end_access:
>>> +	 *
>>> +	 * This is called from dma_buf_end_access() when a device
>>> driver is
>>> +	 * done accessing the data of the DMABUF. The exporter can
>>> use this
>>> +	 * to flush/sync the caches if needed.
>>> +	 *
>>> +	 * This callback is optional.
>>> +	 *
>>> +	 * Returns:
>>> +	 *
>>> +	 * 0 on success or a negative error code on failure.
>>> +	 */
>>> +	int (*end_access)(struct dma_buf_attachment *, struct
>>> sg_table *,
>>> +			  enum dma_data_direction);
>>> +
>>>    	/**
>>>    	 * @mmap:
>>>    	 *
>>> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf *dmabuf,
>>>    int dma_buf_pin(struct dma_buf_attachment *attach);
>>>    void dma_buf_unpin(struct dma_buf_attachment *attach);
>>>    
>>> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
>>> +			 struct sg_table *sgt, enum
>>> dma_data_direction dir);
>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>> +		       struct sg_table *sgt, enum
>>> dma_data_direction dir);
>>> +
>>>    struct dma_buf *dma_buf_export(const struct dma_buf_export_info
>>> *exp_info);
>>>    
>>>    int dma_buf_fd(struct dma_buf *dmabuf, int flags);

