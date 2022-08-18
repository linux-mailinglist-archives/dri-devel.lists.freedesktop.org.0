Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8D597EAB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1510BC1DE;
	Thu, 18 Aug 2022 06:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DADABC167
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ6Y+Ih/Qnnxi3cEWI7aAtAD7OOJbQkUzMNjTFJZ8gxOCw61rODa+tKfHX+OhShxXKHZRoq4udjhHoP9nLvMEfMEnXdafa9YroRtaJ2w5nUsqbFYP5xlIIIBuF/3GWxwx/cznMYzS/elyJPuao0ibyAqVrd2Y8nbHNq5ocDgaAssILI/Npt1pHLnJQ9q/31o5Vuv7yi0zKorzrbLvpRgENsndyXmAoN+sJLkMrM/NRTomjgPAAtjd9B39SyGc78BbVwv4DXKQ1tWN3tyCyfr+I1PlnrkyTjtC6JV+SRKku5V8NhRg9ETDwSdvTihtIPXPsJntYB21opsBIkK70XrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd0UM/qDfihcQW1ursKw7YgVHGlU2yPl2HHqEIL1xag=;
 b=ChuR2UY6Zhcf/snkXU4BA5EIkk8GbJH532uwr88oWLfjwivLJ57GUTktYcKC+w7m6yr1Ow4+OjfPovjyNIQf6O0t5PBvzmBZWPECdW81IUNL2MAtsIMvt7m47kQX9lM5EsJK6gRJ41aGjUb775/8qchk/AjRlqEauWuFa0wJk5hJeHaTUJpRz+tdUkduZwl5polai3i8sDW58QeFrUydUccRa39YE3567hg4ue9sZMCefIv0NR+vWUwDkvnbDPdW6K6NHawbed7Ufj/pXIv22PWW4rsLhNlt+cVHib0WaeL30b/xo6OSwEoya2DrA4Y0Wbe+1gs1ESY/NMFZdC1JPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd0UM/qDfihcQW1ursKw7YgVHGlU2yPl2HHqEIL1xag=;
 b=jPluMpwR3W3wm5YfuzEMvdSWLAYhFVkaHBAXCG9qkXybSaH+oY5/vtge1zLszyZlwxoNz6x5s6IViTX4ciGhd5Pz5AnwZeXWpTg20avKN56jiJfefFqE8mLjIQxYk4uI/JfqWNaGu42sYwf1xpIX2C/H8eRXdRo5rgrthxyNKGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BL1PR03MB6071.namprd03.prod.outlook.com (2603:10b6:208:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 06:33:53 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 06:33:53 +0000
Message-ID: <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
Date: Thu, 18 Aug 2022 14:33:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7969dcdb-52e1-43c0-eda2-08da80e39ecc
X-MS-TrafficTypeDiagnostic: BL1PR03MB6071:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDiKgpBvpXITnkkn9wNJxjV0JnS5sfsd94Uf+YCGkbsMm4I7RoSkOJbS66r4cf0j1TqNCfHyfWyQ/oB0+HlYkNiBz3bVyH76xOXKDr8uf2IGfrmFo08ja03ecAQuJHzPpDHHIScwBmmsLRJPrmRi0RS9kJHq5oe53upikkBtXfJTa+M1QKSx/pRd/0FzWdBrw9jtTtEBXIwX3OGTQSPRd/mxWhoc22kmboF6mE3LFHWOXiPZYSE1WEAQyTxgngCWKVeGpgZh5yFBf1W0HlPI/NdSK4D6w3qv4DocjMxucvr3ke31IUKZVs2e721DyLocHx0ve03DvRxT4edakb8dDwhkdfSWu8WDxUv/Q5xqwDPhr9gPxvg+cbXmz3FN9S76aQqxvbTLn7L90aKQu7NibyUZAHGQ5tKFmyfOfWuUBE5kthLeq6sYLg99iNSsOYNpPlSAOHCDb0kLTPz/scDssMUhDBgVjIK3OGXT92rTNT+v4uudTqW9MM6vNazGZDdPNeJ3XWPzbmsZNtC1rC2axGow9icq3QGSCN3BmT3FxFHUfzlV46DS611fL5UBKSdBVllCGn1p++ON+GisnEKRbObb0dGUO1vZXS6z5+BcwrJwJ2GevtJe+KYM16i4ZmPYtvwgS3rOzMkrQimDbpOiGqvcnGjVpcs9Uj5+Th9/CAeJIHJAtKbml+tlx5Ua6WibT2/2WsikeNRsVz6wLr6dJ4BeR12aXORLJ5PvsB97vLByJGbyxLb8/HRZjeuvl+UJ9zrT8qlrOfxrP7Vs/3H3nM3CPd79NgqaR7V9dC07lFJ+Rv8XNZOCtVaTZRoA8najgKcOCutXAx320MXM3fMmzXCHFUymkZywdGNrQDXMLlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(346002)(376002)(396003)(38350700002)(66556008)(316002)(6916009)(38100700002)(8676002)(478600001)(36756003)(966005)(66946007)(31686004)(4326008)(6486002)(7416002)(86362001)(31696002)(6666004)(26005)(2906002)(83380400001)(8936002)(6506007)(6512007)(2616005)(41300700001)(186003)(52116002)(66476007)(53546011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnpkVy9RQ0RSYUZYY2k0d3Y1SUhadllTUWRjSVpJNkhXU2JyT1hYMjR6VVN2?=
 =?utf-8?B?aXV5QXJ1SnE4aFk0SUhldmxuaXFSL3haOHY3SFZYT1BNS2pyVy81aFNGdzZH?=
 =?utf-8?B?UXEyK0lZNEc0OGFvcmZrdmR4UGpGTHZtMkJXQ3lacjBVSG9YMVlwTFZUOVUz?=
 =?utf-8?B?dDZZSmlWTVcyVU03YVEzQjhROTRSV2lILzNxaVdpMFFkMitHQTlzNDgyMW5r?=
 =?utf-8?B?N2tZQ1ZOcy9CSlMvU1VYMFhMT3RHckF5WlhITG1TbjdzZEwxUUhvVjZNMzdY?=
 =?utf-8?B?a21uNkNBN3d0WlVKb0pvd3U5bnVSRmNFaGR6VW1seDZOY1Z3ZmlNV2dmRHcv?=
 =?utf-8?B?bDdMMnhUbkx4WUpWU2RsU1FFM0czYk1GR28yZDRWUnRBS1c0R2YyRzFSK2gr?=
 =?utf-8?B?MEdJKy9nMXM2ckpkYUw1ZVhvVHRBSTJFdXVqUWVSWXdDOEhNZkRzNUNoblVF?=
 =?utf-8?B?M0gza204c29Tc3hwODMvN0duMVNiWGlRUFFpL1FoK21RTzdXdmFzdjFyZmxN?=
 =?utf-8?B?NzNla3I3clNXMWVtTkdCNGpacTFkMVZDUlJUT0hzYmdkME1Ta3hRYTVOTFhI?=
 =?utf-8?B?TER4Z0lQcy9ldDRwbjFIVSsvMGNWcVJOcXdtdFhBbnppSDJ1aW1VNXhrUVNp?=
 =?utf-8?B?Q2oyQ0wzU2k1c0w3UmM3ZkRkUHhvUjBaMWxtcHhMd1hPUjliM0szK1E4U2lp?=
 =?utf-8?B?VFlyYTlyTEwwcGFSZk9lNnNRamUvbWdMb25DUFBVbDIvRFVmUGhsdENYTzRS?=
 =?utf-8?B?VGxZcXA3eHV4VFBac3N6RVlxQjBqbHNaV3lsUklPaEtJMVpMU2RHazdNTkFm?=
 =?utf-8?B?bGpZMURHMkVWWGNjZzRvbVVQaEQ0bG9uVzd4bDRvUTZFbUM2WWFKcEFiT2Rr?=
 =?utf-8?B?YUdLMEE4Zy8xQ3ViU2pUODB3OW1kYVp0dVE3RndhT0tTYURlREQ5R3g0Y0Ev?=
 =?utf-8?B?NDdGNkQwMHZYM2pHNTZJV29HOUQ2S0tqL0VxVzJDVE9uTVRtTnFud1dnVUM5?=
 =?utf-8?B?cVdTTDdYOXUxMHVLNUpkSGpLbThNWkhWTXZodmZ4a3JvMVl3cXNJZzNkUnk2?=
 =?utf-8?B?SjFydFhxWG54TlRScWxybkhocUhCMWJjNEhabU5ScWVPZ0ZZb0pwdlVrOW1x?=
 =?utf-8?B?NHVOYU5iZUtwb3dLb3kyWmh2UnZMN3NDU0pUQkhySlZrdEVHc3dMN2ZkWThl?=
 =?utf-8?B?VStUa0pKYWQwMnpZQXc1b1ROeWxQMUphL0JiL1ZXb1d1MTBZYU92cTJKRHh0?=
 =?utf-8?B?eFZubEp6Q0hLZndBMXptU1JoaGlZQ2RBZVRRTitIQnBqZWN4N2hRZFBzN3c5?=
 =?utf-8?B?cHZPSG5pSEhuWmw4R01FQXVIdkhTQUdpYzlRaGdzZElqd29KQ2lOUkdwNXlx?=
 =?utf-8?B?NllHZCtLSk9sZVJEME1UUHZFNTQ4eHZGYjMzU0d2dVI4S29EZTVWUDRmVGl0?=
 =?utf-8?B?Y2Z6TlQzU0UrY3JTdWN3SytCcStNbFdXdlJBand4ckZNNkxuSzZkd3NUcS9P?=
 =?utf-8?B?Y0pySHVPVVozMjRnd3g2aTJpUVJOOFIxcWJoY2dRU05TSUpuWDZwdzRlK2M4?=
 =?utf-8?B?K2dVeW5pcHVmNDY1ZUJjTU51SDlMT2haSGZhdkQwSEY1QlU2bURpNm9NZFJx?=
 =?utf-8?B?YU9hRTVESVZPcHVOWHN6c2ZnUTFLTzE4UmF1bFhveEtaZVkxU0NuS3RiV1py?=
 =?utf-8?B?eGNYK2sxUW9qT2FlaVlvQXllNHdlSkJpcUtoTmFubkhWWDgrZUhpcllOWTMv?=
 =?utf-8?B?ZElya3pHek5yQkRMVkt1WkFHTlErdHdMQXVNVjVUZDkrUTVZQWlQRVRSZ2Uw?=
 =?utf-8?B?aUU1VWVFSUsyd0s3SlBjTW54dmRXVkYraDhybTF3RzBxN1Q5Mzg0RjhzZUZD?=
 =?utf-8?B?bzFyYms0TjBRelpDMkQrL3BpVGUvL01pZU14RVN0blRRU1dwREhJR1hsZzd6?=
 =?utf-8?B?ekJDSUdOTUNHdEc0N1VDbWltY01DUk9SK2xXOWJKSGpMZEFZL0NrWEhLd2or?=
 =?utf-8?B?OUJQa05kN2dmZHkwVmpBSUo3clVEaE45NUJiRk1PUHhRVUJyYklqRnJ0S0pG?=
 =?utf-8?B?TmQxMVlzSFUwTDc3UDlmUW5GaDc2UEtSemc2bnJzd2J0Zis1QnRLYzhoMFA1?=
 =?utf-8?Q?QyBH/cA6gqxwIY1kZqYuN+eer?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7969dcdb-52e1-43c0-eda2-08da80e39ecc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:33:53.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxNZ/hESN89q+3bmFKOJKzmoAUNfu8Ri8Pjn3klf1iXwHxba4Z0QQN8wfiueKEZOAK2ov+Y3qEF/UcoxDpUl/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6071
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
Cc: linux-arm-kernel@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/18/22 14:06, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Randy,
> 
> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> The most of detail has been written in the drm.
>> Please notice that the tiled formats here request
>> one more plane for storing the motion vector metadata.
>> This buffer won't be compressed, so you can't append
>> it to luma or chroma plane.
> 
> Does the motion vector buffer need to be exposed to userspace? Is the
> decoder stateless (requires userspace to specify the reference frames)
> or stateful (manages the entire decoding process internally)?
> 
No, users don't need to access them at all. Just they need a different 
dma-heap.

You would only get the stateful version of both encoder and decoder.
> Best regards,
> Tomasz
> 
>>
>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>>   include/uapi/linux/videodev2.h        | 2 ++
>>   3 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index e0fbe6ba4b6c..f645278b3055 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>                  { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>                  { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>                  { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>>          };
>>          unsigned int i;
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index e6fd355a2e92..8f65964aff08 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>                  case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>                  case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>>                  case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>>                  default:
>>                          if (fmt->description[0])
>>                                  return;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 01e630f2ec78..7e928cb69e7c 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>>   #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>   #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>>
>>   /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=http-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=DwIBaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=vmpysqneiHK3UXcq6UOewdMwobFa70zKB3RuOgYT02aFw9fCs6qd7j-U1sYSey79&s=yblzF1GwanMEJFC3yt9nBAQjaaAEJKKlNgj4k64v5eE&e=   */
>>   #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>> --
>> 2.17.1
>>

-- 
Hsia-Jun(Randy) Li
