Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAB597EC8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1CBD0F9;
	Thu, 18 Aug 2022 06:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94396BD097
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSP61beXfglQUJ4+eM3lgDLOE2jqRze+5H07lAOf2HsJkk22ADkusN9eCW3th5/jTM54uKWe0z13JpK8/Qx1lpvkJx4pxnqvLCnVsUPC9vQpOmmgVulXAkdbPbPxh+PkQgbfydKvBbrKcbsyWn9+BbZWn7RE6UjSWPI/kuPzpsk8mjop/nb1o/oOBGxsElB2cp8WX/D3DzjzjW5Xl2Zx8ZJ9CeFHVyQXhpj7kXZ5wCQlqIJEHALid8ukNk+o+mymVEv5TfCYIoYKf8fPZXb/e/E1Td34rjVOVUVc8htw89JKUTKcVRN8IUPmzaS78jlLqw/JJbQQSA6pRVie7Nin+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRZ5xPWDe4EnGW2UtR56LWZXa6n+nydAWsl6Yp+iokw=;
 b=JKqSMvmG46wMH3epZ16SvYd8EoYu6lfpDizbbgE7I0LGdPKBkc31C30l/MHcTL5Db5ydN6dWU7txbgHiPqB7Hfnupsr5aksIP4KHs/JCj4fZ71+U1cIx6ziNHH6I3keXks00IW2au/DUJNSQSKYIxYULiad/CfXJIHNKmdA5Xq2zmv2NeMpZ+sN7g13dnfKXxY2ngZ77KSb+9IoyRds+42+1QbImaTvrReeOGA/PA5ZrSLnP37olnoDxUtr+Qov/hU3LUksMB+fOrDUy8zKNXWXK+NdzUHbMAOO5f24Xkc0eZfwlXx2JXltmH+MDw6vwBYrT0mkcff77TGKtBfQJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRZ5xPWDe4EnGW2UtR56LWZXa6n+nydAWsl6Yp+iokw=;
 b=kNB/dX2+2xpj2IWzFTEcuO7dH0ko7wigs72Qb61utjfIprFfTcOagvuTjMyAcFKfa1a5rx6Kzh4ZrPR+wYLD5AtWzj8TXPc47seej1uj0Uz7LB/sl/QXUYUZP8fI0sK4hSnCD/LjarbZ1XyLT8pvIsOYtH7xSHkvr8c2dRURt6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6538.namprd03.prod.outlook.com (2603:10b6:303:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 06:49:46 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 06:49:46 +0000
Message-ID: <3a665809-9795-ed13-73af-90b1ed608ad4@synaptics.com>
Date: Thu, 18 Aug 2022 14:49:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-2-randy.li@synaptics.com>
 <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696ef8ca-33a8-4e1c-f3bb-08da80e5d6bb
X-MS-TrafficTypeDiagnostic: MW4PR03MB6538:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qh8O/3vburSo4Zw6CNaouOXUws/QMvcCcRi8g0xmHc+M74P8D02NcTguX03V5S4AKUNDB+mlNzEWlK0L9Fm5AdiWpBKtjbfxAANFenKbY5aG56aGRCzkp5HvoP9NzheM3o6KZWK0DlAqxn4HAOcuaU8avyKVz0BOiZAaCCpjUAlB7wRuQ23pS8jlv8CfMQvvr4ed2A8FFXXqRSsTAtPoEa5Z/E92BHUvXly8OsO12fu66r2rLZIuXS4UYAfnDWODSTo/YA4rRFz7ijHAIXBY1rOqWfNpf1QWk7OvLe7ACAcinAPeZZ0EV+f7ffSqL56XFXUUA6HO/nh5VwPuDp0djl5MgswuIsHQET/oZ0j2BCvDWnwnEKFcGw6WeTLxjEqDyas1MqMSqJdfJhXyZ8C8Zf0bOtizr8XrxE0GgzjLjznNmQ47IDEX5nUFbeZqvv6gKlhfisUgNDOpRVBb742IMMAlVC2Wg76HyEtoSRiFWq1MEPVdYH4nocKLOGNTcRmwu4kEM5M4ady7kdaZPBRRFIEikaziPfuOeTFfg1VMn/vzp4dxjgSCeCoaFnxnfX8dQleIGEtBekYqiCFm+qLOVPemzeEpZ8rzqBNT1+jVgejMU7jLdO5lVM1BUD8SrmNuXwyuEXdZLSwP5Eb5Pe5X8DVXDFGlzcsM21f2wAGTId2s0kInSQ6wdUs4XpX2mpchrg/8uxalEu/dyrfvzfm+6vdv3mKHnvSJVnutp7RjPrzd1b1HsqGjToA+wuafjl0/YtZqy8dUCIWN6vRhmPY3Gv/evfHXMpVR1uQi3lI+nZUBlb5Zg1BVZK0b2hPOGiZ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(366004)(39860400002)(41300700001)(5660300002)(36756003)(478600001)(7416002)(316002)(6916009)(6666004)(66946007)(6486002)(66556008)(8936002)(66476007)(8676002)(31686004)(2906002)(4326008)(26005)(31696002)(53546011)(52116002)(186003)(2616005)(6506007)(86362001)(6512007)(83380400001)(38100700002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSt6eVlVbEJYMTFwVk5yY0lqQ2NtSndMa1FQT0RCbnF0QkdweEV6cWdlZkxG?=
 =?utf-8?B?Q21hQ1Z6V24wbFpTajJQUW9kaGN5RzlTZ05MZGpiYzNBZXFrM0dBQVBjdmtH?=
 =?utf-8?B?eEl3TmR5bEpONVRrZVVSTFVQUEV4VWpCNnNIM2sxZWF4Q1pxVXFZOW11c2Yv?=
 =?utf-8?B?Y0N1SUt2U2lKU1NNdUhESFhDSG41aGRtTTViQXJ3ekFlNys5aFhMRitIQjFG?=
 =?utf-8?B?czBrNktMczdWN2F6aGlWK3pBMVFwSWpYc2FObFFyMEdMeE9JMU1VTGdlRnlF?=
 =?utf-8?B?UnUrbHdGQWZrVHpPT0plc2pLMnhXQmdoVGRoWGVGallwamY2L29LU2hldmEy?=
 =?utf-8?B?RkVGRitwdFFjLzl4UVFmZUlHdEY3OWFMNUtUY3hLK1Bkb0xDWXhxdjdhOEVZ?=
 =?utf-8?B?ZmJQaElrZlVFUjJtZXZDenhUaTZtU0FsUG1wWVhzalVxTG51S0EwUXlkbWhD?=
 =?utf-8?B?STFrMjRsb3RCZDVQZXlySmNneVF6RE8zZ1ZnVFB1SjNMSDVrT2hDYkZlNUY1?=
 =?utf-8?B?VW1HUkF0RVp5ME9XRnZZRUZCdFlKNFB5YUdYdi8wVHRWdFJINnl3ZzdVOVA4?=
 =?utf-8?B?NDFSWlIySmVUdXdkSWEwcG40YlF0ZkJXaWN4WGhBOEFqTFJKNDFrVkMvQ3RZ?=
 =?utf-8?B?bFdTYjdWVW92NVk1WjFIeW1XanFEak10RGgyV3VDS1ZtSU1aU0E3dWRYYUZn?=
 =?utf-8?B?aE4zVUxOZ1IvZE0veGwyMXlMWDhsVk0wZEVNSlVVZlIxSGJKMWhrS0VvdzNZ?=
 =?utf-8?B?SUNqWVZ1RElKUnZVSGFiQ0xCTHJIYzRDNmxIU3BMN3lzb1FtV05ZenNubVlL?=
 =?utf-8?B?R3dmVHpnNnFUVTZYWGJ5dVRwZDB6YWo5YnFSVW9ITm9OTDd5M0R2MVFpTWpv?=
 =?utf-8?B?NUJieU1STkNkajJSTG1ScW5Yb3Q3N3BaYTJlbFB4Nkp1MmYzNW1nTjVRN0dZ?=
 =?utf-8?B?UnBrTXhEQk1WdlR3RTV4Ny8xQVdKVDMwbzkwSjRkUHNHalJNcU9JUTVMdE4v?=
 =?utf-8?B?OTRlcmlCWnNyQ2g0WWRMVDN6Y1lWWFRNVDNJN09xRTBnbktTRHJCcnpWVk1w?=
 =?utf-8?B?VDVtR1BMRkwxTVlJQ2F0UUZza3ZMdTBJaitnYi8rdUY4UWx2dkZ0NzJtTS92?=
 =?utf-8?B?ME05UjRrVUJHeUM4RjUxME94T2VQS2p5alpjNGRneHQvVWdBcm81cVVPa3Jw?=
 =?utf-8?B?Tng2cU9vT2tESis0VkRGUHdlaHFSQVh1Y3VIdktoYTQ4QkJua2l3RTZZUjBX?=
 =?utf-8?B?bFhjM05SOVRpLy9CRms3ZUdqTklSdmFEWkxDRDFPZ1NJYXd1eXQxV3BVRHBu?=
 =?utf-8?B?MTZHQkJaRDNDR1FNOTNsYVV5VXV1ckt6RUloeGl3NHV6ZzZDa1BjUWtDWXRJ?=
 =?utf-8?B?OW81YmZjMUROTkozVThHc1lCazdwV0lsMlZSb0hRNjJyaUwxeTIyU01aZ2xp?=
 =?utf-8?B?UStZMXZtYXFLM0ZwbG5OQTRrTFJqVWFhUTc5OFl6YkYxKzJUOWtuVEFZcWZK?=
 =?utf-8?B?eGJSOGVDS0FLVFM3bWxwOFlSUEpicS9VZ28zeFN4RU5paThIY1FsK0V6bnNY?=
 =?utf-8?B?UlN1Z0U3a3NTSU1PUG1jckJueDVUMnRWc1Q2Rnp4QW8xanlTcFl0eW9uZXU2?=
 =?utf-8?B?Wk15MFYvZ2FDQmh5c1NzRk01bXp5K1czZzZZdFcvV1pHMDlNcDBHaCtzVDM5?=
 =?utf-8?B?aTM1anZhOUhtYmNHSDFRVXdKUFc2cFVjYWZuL0JjMTV3cDE4eHEwajRzZXBx?=
 =?utf-8?B?RWw5Y1RtQVJubzNySmhyTGpIMlhMSkZWZVYvdHFsQWlHN0NtMHRvM2FnT0t4?=
 =?utf-8?B?Rkh6UWwwd3BRTzFGMkJoYnRnUGtGSjZMRExSQ0xGKzhGb0ZaalB1aDJrNy9D?=
 =?utf-8?B?VnFYdHowL3RkMVpQeDlRQmtzS0NUNTRmWjVDOVNKVHdUTmtPcjF3djY5R3hS?=
 =?utf-8?B?b3Z4M0dHWWVsbUsybVNRNCtXemR6RlNEL1kyR3ZvYVJWZVZMS2pMU28vUlRU?=
 =?utf-8?B?RXVSL3NtWlM1TlQxZ1ZDbzRIM1dpRTlMTDVjMkUvRXdiL0hPei9OWmFCUUlk?=
 =?utf-8?B?cVhONHczN1Yydm9WNnZwQ01MK3Y5aDhtcnN3WnZUS2RYcVBNdnNuN0VTSUt6?=
 =?utf-8?Q?pFJG0rayJPT/B6FqOkdAmrhmN?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696ef8ca-33a8-4e1c-f3bb-08da80e5d6bb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:49:46.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8CMg/pjf+mbg2JgN6G0/bxtyCadUthc6e/+rm792za0sZkMRYvcMf1ehNmL04W9eU7ZslxONUbf+aezUJfFDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6538
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



On 8/18/22 14:07, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Randy,
> 
> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> Memory Traffic Reduction(MTR) is a module in Synaptics
>> VideoSmart platform could process lossless compression image
>> and cache the tile memory line.
>>
>> Those modifiers only record the parameters would effort pixel
>> layout or memory layout. Whether physical memory page mapping
>> is used is not a part of format.
>>
>> We would allocate the same size of memory for uncompressed
>> and compressed luma and chroma data, while the compressed buffer
>> would request two extra planes holding the metadata for
>> the decompression.
>>
>> The reason why we need to allocate the same size of memory for
>> the compressed frame:
>> 1. The compression ratio is not fixed and differnt platforms could
>> use a different compression protocol. These protocols are complete
>> vendor proprietaries, the other device won't be able to use them.
>> It is not necessary to define the version of them here.
>>
>> 2. Video codec could discard the compression attribute when the
>> intra block copy applied to this frame. It would waste lots of
>> time on re-allocation.
>>
>> I am wondering if it is better to add an addtional plane property to
>> describe whether the current framebuffer is compressed?
>> While the compression flag is still a part of format modifier,
>> because it would have two extra meta data planes in the compression
>> version.
>>
>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>> ---
>>   include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 0206f812c569..b67884e8bc69 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -381,6 +381,7 @@ extern "C" {
>>   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>>   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>>
>>   /* add more to the end as needed */
>>
>> @@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>>   #define AMD_FMT_MOD_CLEAR(field) \
>>          (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>>
>> +/*
>> + * Synaptics VideoSmart modifiers
>> + *
>> + *       Macro
>> + * Bits  Param Description
>> + * ----  ----- -----------------------------------------------------------------
>> + *
>> + *  7:0  f     Scan direction description.
>> + *
>> + *               0 = Invalid
>> + *               1 = V4, the scan would always start from vertical for 4 pixel
>> + *                   then move back to the start pixel of the next horizontal
>> + *                   direction.
>> + *               2 = Reserved for future use.
> 
> I guess 2..255 are all reserved for future use?
Likes the Intel has y-tile and x-tile.
> 
>> + *
>> + * 15:8  m     The times of pattern repeat in the right angle direction from
>> + *             the first scan direction.
>> + *
>> + * 19:16 p     The padding bits after the whole scan, could be zero.
> 
> What is the meaning of "scan" and "whole scan" here?
For example a NV15 tiled format,
(0, 0) (0, 1) (0, 2)
(1, 0) (1, 1)
(2, 0) (2, 1)
(3, 0)

(0, 0) (1, 0) (2, 0) (3, 0) (0, 1) (1, 1) (2, 1) ... (3, 2) are 120bits, 
then fill it with an extra 8 bits, (0, 3) would be placed that the first 
128bits in the memory.

Besides, I found even with four 64bits modifiers, it is not possible to 
store all the compression options we need there. I need to borrow what 
Intel did, hiding the tile flags somewhere(I would not use the userspace 
gmmlib way, our codecs is based on v4l2, even drm framework may not be a 
good place).

Although the compression options could affect the memory layout but 
userspace really don't need to know that.
> 
> Best regards,
> Tomasz
> 
>> + *
>> + * 35:20 -     Reserved for future use.  Must be zero.
>> + *
>> + * 36:36 c     Compression flag.
>> + *
>> + * 55:37 -     Reserved for future use.  Must be zero.
>> + *
>> + */
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED           fourcc_mod_code(SYNAPTICS, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
>> +       fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
>> +                                (((m) & 0xff) << 8) | \
>> +                                (((p) & 0xf) << 16) | \
>> +                                (((c) & 0x1) << 36)))
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
>> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
>> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> --
>> 2.17.1
>>

-- 
Hsia-Jun(Randy) Li
