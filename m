Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71F38128A
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DCA6E419;
	Fri, 14 May 2021 21:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39D6E419;
 Fri, 14 May 2021 21:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwneKkh1FqDQmBvQ+L7GT56sub/yqIYxHhufLYyqaoGs2X1j4PY2bvCK+nqKWfKLYSBOpzqWPu7rv+8BR+d7dxzhsUAHn7ds7RIRpZ1IC7XN2rbiZfwTTMZ2nzw/ojwxh9284jHV4172cfbMqvDBiwQEsm2ak1mOoK2UjrQve2UB1716p/l3QrND801BFNw6jliluAmXrc2IZwwLP0Zku1aXUz78AS5d9tTEzjYwiV5molhkHtb7heofU7GjbxMk6BSBTOJHBBH7IQ/A3gLKcrwyEMS95uIfwwKpyshwPXWXJnkThchkQa+5IMXIsZUxsZTVZxR7XSsO8dwxlMHuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TU8X6ojNXX+UqirK9LI89vizQNN+U5bFzIo9x1Qrpk=;
 b=igtvTnUCsuzY4KdRabEkcE/lkLLJxQcFJ2Augfmx1OzUz8kHePK7aZAK+KpOwzsz3qsT8IYgaKObhK9JAKcITyKgWZ4WquYSiQfGQF6zNtYD15nrQmrEsWKt9ef1LDA5l6QmizUP4nyYsmb9ieAZsRAVwSriGR/VNolhj8opEURXaMKA7MhBbVICb4TXM3uZ/leX5K8q4/1CF5hIurTs9Wf5DtrHUwhe67zWo6pETBdJMP1fSry4hBj0YIw7P7Qh0AcIzlT0QO6SDFym0V3AyYslStk70f+B/hkO4LxuZyNS9sQxE2twY4RiNJmFG168VntfMbcVIuB8GgluADYYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TU8X6ojNXX+UqirK9LI89vizQNN+U5bFzIo9x1Qrpk=;
 b=JAebOi6jVyln5RkwMbOl88eKlOKxvV1JaxDferiuto/2wkAy7iFJyhhgTtObYNaw6kvcfB1rlwCMortcFapUCtLXeFzNLpu+JBSM9l41B9d9iMKl4r7ID64lhna23gm6l9TXaJXyX86/n7rsXokGXIClV47UVD+prEfUG76EJPg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0254.namprd12.prod.outlook.com (2603:10b6:301:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 21:05:17 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%4]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 21:05:17 +0000
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
Date: Fri, 14 May 2021 17:05:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210427175005.5b92badc@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YQBPR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::17) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YQBPR01CA0081.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Fri, 14 May 2021 21:05:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ae81b82-7bb5-4a67-6b0f-08d9171bf9c8
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0254507870C406430151AE078C509@MWHPR1201MB0254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqwPO26s6EB4Of8qctML84m6iW2k1WXkZszpVfv2i/ZpjhN29enzfxw4MjswfvVxhTEoznsiYApjZkEOlvsWropqO7xFrBzFShZkxWrj/0U7Ok/kr4MwzXhngDEnaYcGsoCaktyRMiFskfxJ3P+Ku4V0YHJJdoKrfft/bL/lvM4IGNVaSGRoL7KGac1UBh6a6uipb1bMVyIubYeJDVbaleNQ8Bx7Vp2sOxH7IpqQ9QnTNBX1z+FXSsUNER9DNCsZgc1uLhJ5oukBnqnr3ZfpcUEP/Ja+GxbbOzpVg7dky+1///MS8Iky2PWCDLESYCxi6ztQi8C2DRL1b4QUivvQHlxgVeYCfyqrUmn/21T//CgnKzolyQZbjMIOWQGZROx5hSqCGBsscIe4d6AB8vSFNFLGj+wVOUwAE6uc4D+hBfu/u1TYHKIBG98e0zc0cutK2fRwaejPovGfp+8L2Cd6LusqyAEeXXa1h7Fy+zgiYNcLlUsObTTaOGMBT3I4oHbWffJF/ksZB4IZzTC/IAtBCn8Mnhl0XKyrThGVaj+kfEH7rGF4o6OjX4GZAwM2Fl/ZXVXIgW9XfFjoKX3IiqCbhiGwbYcMLcPOMblLeHIOVaia+koN+aWPGQTDI7FoeCEikdFcIvgFMB2edI0lnmK8HeLPqnoW2J09oud6XQqTyEw5BND1NDL/wwdWVUTx5yFrg2jEEWU9eib7FBeZ5m/0r2uFi/DBrqnv4KOmX37dR4W6UPZalLhiO60iZoP52ICToEbwfk4cVOcq0/Cb7Ejyy1ed0dCcyt0TH3EZ8ZxsnTXJP6alwrxvWLKFQryJ/mlrvD2JkZriHx/aBjQ7EDS2JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(6666004)(44832011)(186003)(66946007)(16526019)(66476007)(6486002)(66556008)(2906002)(5660300002)(31696002)(8936002)(31686004)(26005)(316002)(8676002)(966005)(478600001)(956004)(2616005)(83380400001)(30864003)(86362001)(53546011)(16576012)(36756003)(4326008)(38100700002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?0Zsp3PQjCyLtLudReZgn9jDh1d6lBpqFRliIqUsmGwTQJMr7tp7n+u1z?=
 =?Windows-1252?Q?RWalG99EKXLwbbHUEQcCb4T2J0wAMVPrIikh76BpQlo2gyHEGrWOM5vr?=
 =?Windows-1252?Q?tgEjV+mAu8jS6EI/dZIgKMtSeb1hPMI9lSLHgqsB+t9ZanM+UJirB8QP?=
 =?Windows-1252?Q?CJ/EzZ1fyRHtt9XTJWQz5sX8Aiwp+2JfBiGSpVUwHpfc4z6YVpeOpotn?=
 =?Windows-1252?Q?APPkqu7NrZzAxrIDYzTebbnL64uKA+esPQLfb3sLCm0jWzBMNqWhvo6j?=
 =?Windows-1252?Q?dRIt8+IqhuNcHhbkLKbrm9/euow2aYx/B4nnKXAl+ekObcwDSX99w1yo?=
 =?Windows-1252?Q?PGn16j6OuuPZyxyCT5JiEbfOyfmJtM/mJQZCSe5+kgyS6Jwh9V9tvCop?=
 =?Windows-1252?Q?XW3jAoBanYgGGjxDnpzGWZMr649ge7UWXfj4l3w/zmt/jb4zMKvfUy9K?=
 =?Windows-1252?Q?skfHPSP2NNSsoy9MWJM/phhtXV/LNkhTeOmXWedvB2nILrMEdZlLew/b?=
 =?Windows-1252?Q?0gG5L86IsAWfxv4wyYDz7Uc4R4qjfeju+9DffseuH3fsf5kBZ/m5Dpxd?=
 =?Windows-1252?Q?Xgq7P7RspjjL9llmnIcwHUKSsBsusfXzsqoaIFPg9LLPkPGHUieBqIYU?=
 =?Windows-1252?Q?gdj7xAjLf7J5EwbiJZFCYxoiqkjy1mVcEZTKP04VgQ/O9pwNrBBbsrzJ?=
 =?Windows-1252?Q?DdsV9o9CgF1Rbe/ffxGjdGfjVFXzwqLwr9aiiXF9fMjV9WhtbBv2Ownf?=
 =?Windows-1252?Q?kKJysg49zwblpxOxnGIYqGgPEzBepPyuhB0R7EbeWLi+tsZA1NvxbJBL?=
 =?Windows-1252?Q?75TbTbkLOGXn7vq5dk08F4EiBjMIt8oqSXEINmcV9FC92c71Uq6sN+Ct?=
 =?Windows-1252?Q?7M3ByxQFf9K69k/WKm5CrX+i4lT7aUjSrcShSDfNXudEGA/vLrSsUU15?=
 =?Windows-1252?Q?s1rbnUkz3vf+Q/5XcEmGj6tl3spfrryPg2AsluqJFL9LApIqO9FAMJEd?=
 =?Windows-1252?Q?XEmHK8dpuAA80HgpZd2PI0W70XreXhTYQGM8M2bKRSDIDsH/RUh4rCR0?=
 =?Windows-1252?Q?aa+xR/mY9XB868tremdnlIaRd4fdILR0Xi0fmkYQff3c7MxYoiyoKkmb?=
 =?Windows-1252?Q?kN1kYuKZ/Z0MCENzs/gZleUNAS1TTV2voUdtag5x4sDLpB2gIfP4T9Bq?=
 =?Windows-1252?Q?PC8kavQxiJDKaqv9v/8jxEGbQGkgf6gkGCO47+P1RDSC/HBn74VdcTBW?=
 =?Windows-1252?Q?YU117NnURDO+/vYAaoGQzi2aKFZOb5GQbmU1opNDkwGCwbzRbSDcW6GT?=
 =?Windows-1252?Q?8CjA1tdObdw/IDuT0Q+RQZ/nmQubdtz41k1Kd2bYvRMBz3cLty5g6kK0?=
 =?Windows-1252?Q?qjoCk5OfHo2M4Wbj4gsdxs4MLIXSey3VZIaE4BGdhNhjbNlNfr1kxwVJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae81b82-7bb5-4a67-6b0f-08d9171bf9c8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:05:17.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwj+Ec1LBbpzhU3J4kjHRrFPhkmVzG+sxw8XQLZeRFzbqb3o15JKrU/X4u2/4aaPrZ8Zp5J6qcuYmjv3kuRusQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0254
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-27 10:50 a.m., Pekka Paalanen wrote:
> On Mon, 26 Apr 2021 13:38:49 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> ## Introduction
>>
>> We are looking to enable HDR support for a couple of single-plane and
>> multi-plane scenarios. To do this effectively we recommend new
>> interfaces to drm_plane. Below I'll give a bit of background on HDR
>> and why we propose these interfaces.
>>
>>
>> ## Defining a pixel's luminance
>>
>> Currently the luminance space of pixels in a framebuffer/plane
>> presented to the display is not well defined. It's usually assumed to
>> be in a 2.2 or 2.4 gamma space and has no mapping to an absolute
>> luminance value but is interpreted in relative terms.
>>
>> Luminance can be measured and described in absolute terms as candela
>> per meter squared, or cd/m2, or nits. Even though a pixel value can
>> be mapped to luminance in a linear fashion to do so without losing a
>> lot of detail requires 16-bpc color depth. The reason for this is
>> that human perception can distinguish roughly between a 0.5-1%
>> luminance delta. A linear representation is suboptimal, wasting
>> precision in the highlights and losing precision in the shadows.
>>
>> A gamma curve is a decent approximation to a human's perception of
>> luminance, but the PQ (perceptual quantizer) function [1] improves on
>> it. It also defines the luminance values in absolute terms, with the
>> highest value being 10,000 nits and the lowest 0.0005 nits.
>>
>> Using a content that's defined in PQ space we can approximate the
>> real world in a much better way.
>>
>> Here are some examples of real-life objects and their approximate
>> luminance values:
>>
>> | Object            | Luminance in nits |
>> | ----------------- | ----------------- |
>> | Sun               | 1.6 million       |
>> | Fluorescent light | 10,000            |
>> | Highlights        | 1,000 - sunlight  |
>> | White Objects     | 250 - 1,000       |
>> | Typical objects   | 1 - 250           |
>> | Shadows           | 0.01 - 1          |
>> | Ultra Blacks      | 0 - 0.0005        |
>>
>>
>> ## Describing the luminance space
>>
>> **We propose a new drm_plane property to describe the Eletro-Optical
>> Transfer Function (EOTF) with which its framebuffer was composed.**
>> Examples of EOTF are:
>>
>> | EOTF      | Description                                                               |
>> | --------- |:------------------------------------------------------------------------- |
>> | Gamma 2.2 | a simple 2.2 gamma                                                        |
>> | sRGB      | 2.4 gamma with small initial linear section                               |
>> | PQ 2084   | SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support |
>> | Linear    | Linear relationship between pixel value and luminance value               |
>>
> 
> The definitions agree with what I have learnt so far. However, with
> these EOTF definitions, only PQ defines absolute luminance values
> while the others do not. So this is not enough information to blend
> planes together if they do not all use the same EOTF with the same
> dynamic range. More below.
> 

Good point.

> 
>>
>> ## Mastering Luminances
>>
>> Now we are able to use the PQ 2084 EOTF to define the luminance of
>> pixels in absolute terms. Unfortunately we're again presented with
>> physical limitations of the display technologies on the market today.
>> Here are a few examples of luminance ranges of displays.
>>
>> | Display                  | Luminance range in nits |
>> | ------------------------ | ----------------------- |
>> | Typical PC display       | 0.3 - 200               |
>> | Excellent LCD HDTV       | 0.3 - 400               |
>> | HDR LCD w/ local dimming | 0.05 - 1,500            |
>>
>> Since no display can currently show the full 0.0005 to 10,000 nits
>> luminance range the display will need to tonemap the HDR content, i.e
>> to fit the content within a display's capabilities. To assist with
>> tonemapping HDR content is usually accompanied with a metadata that
>> describes (among other things) the minimum and maximum mastering
>> luminance, i.e. the maximum and minimum luminance of the display that
>> was used to master the HDR content.
>>
>> The HDR metadata is currently defined on the drm_connector via the
>> hdr_output_metadata blob property.
>>
>> It might be useful to define per-plane hdr metadata, as different
>> planes might have been mastered differently.
> 
> I don't think this would directly help with the dynamic range blending
> problem. You still need to establish the mapping between the optical
> values from two different EOTFs and dynamic ranges. Or can you know
> which optical values match the mastering display maximum and minimum
> luminances for not-PQ?
> 

My understanding of this is probably best illustrated by this example:

Assume HDR was mastered on a display with a maximum white level of 500
nits and played back on a display that supports a max white level of 400
nits. If you know the mastering white level of 500 you know that this is
the maximum value you need to compress down to 400 nits, allowing you to
use the full extent of the 400 nits panel.

If you do not know the mastering luminance is 500 nits you would
have to compress 10,000 nits down to 400 (assuming PQ), losing quite
a bit of the full 400 nits available as you'll need room to map the 500
to 10,000 nits range which in reality is completely unused. You might end
up with mapping 500 nits to 350 nits, instead of mapping it to 400.

> 
>> ## SDR Luminance
>>
>> Since SDR covers a smaller luminance range than HDR, an SDR plane
>> might look dark when blended with HDR content. Since the max HDR
>> luminance can be quite variable (200-1,500 nits on actual displays)
>> it is best to make the SDR maximum luminance value configurable.
>>
>> **We propose a drm_plane property to specfy the desired maximum
>> luminance of the SDR plane in nits.** This allows us to map the SDR
>> content predictably into HDR's absolute luminance space.
> 
> What would be the mapping? Simple linear scaling? A more complicated
> tone mapping?
> 
> Rather than "SDR luminance", do you perhaps intend this to configure
> the dynamic range of the non-absolute-luminance EOTFs?
> In that case maybe you'd need a black luminance level too?
> 

SDR luminance is essentially how AMD HW lets us deal with this, but
conceptually you're right, this could extend beyond SDR to any
non-absolute-luminance (NAL?) EOTF.

I don't think AMD HW currently has a way to program a black luminance
level unless we turn the white/black luminance into a LUT.

> 
>> ## Let There Be Color
>>
>> So far we've only talked about luminance, ignoring colors altogether.
>> Just like in the luminance space, traditionally the color space of
>> display outputs has not been well defined. Similar to how an EOTF
>> defines a mapping of pixel data to an absolute luminance value, the
>> color space maps color information for each pixel onto the CIE 1931
>> chromaticity space. This can be thought of as a mapping to an
>> absolute, real-life, color value.
>>
>> A color space is defined by its primaries and white point. The
>> primaries and white point are expressed as coordinates in the CIE
>> 1931 color space. Think of the red primary as the reddest red that
>> can be displayed within the color space. Same for green and blue.
>>
>> Examples of color spaces are:
>>
>> | Color Space | Description                                |
>> | ----------- | ------------------------------------------ |
>> | BT 601      | similar to BT 709                          |
>> | BT 709      | used by sRGB content; ~53% of BT 2020      |
>> | DCI-P3      | used by most HDR displays; ~72% of BT 2020 |
>> | BT 2020     | standard for most HDR content              |
>>
>> The color space is defined in DRM for YCbCr planes via the
>> color_encoding property of the drm_plane. 
> 
> I don't think that is quite right.
> 
> As far I understand, COLOR_ENCODING property controls which matrix is
> used to convert from YCbCr to RGB, but that is all it does. It is not
> used for the actual color space. So while these BT standards do
> specify the chromaticities, they also specify the YCbCr encoding which
> is the part used in this property.
> 
> YCbCr and RGB are color models. They are not color spaces. RGB is an
> additive color model while YCbCr is not, AFAIU. Blending requires an
> additive color model and linear luminance encoding.
> 
> You need two color space definitions to create one color space
> transformation: source color space and destination color space. You
> also need an idea *how* the two color spaces should be mapped, which is
> called "rendering intent". You can't do anything with just one color
> space definition, except to pass it on along with the pixels.
> 
> To be able to blend planes together, all planes need to be converted to
> the same color space first: the blending color space, whatever you
> choose it to be. I do not see where KMS would do this color space
> conversion, or where it would get the definition of the blending color
> space.
> 
>> **We propose to add definitions for the RGB variants of the BT color
>> spaces.**
> 
> Therefore I'm not sure this makes sense.
> 

You and Ville are absolutely correct and a reading of
https://en.wikipedia.org/wiki/YCbCr set me straight. :)

> 
>> ## Color Primaries and White Point
>>
>> Just like displays can currently not represent the entire 0.0005 -
>> 10,000 nits HDR range of the PQ 2084 EOTF, they are currently not
>> capable of representing the entire BT.2020 color Gamut. For this
>> reason video content will often specify the color primaries and white
>> point used to master the video, in order to allow displays to be able
>> to map the image as best as possible onto the display's gamut.
>>
>>
>> ## Displays and Tonemapping
>>
>> External displays are able to do their own tone and color mapping,
>> based on the mastering luminance, color primaries, and white space
>> defined in the HDR metadata.
>>
>> Internal panels (which are currently few and far between) usually
>> don't include the complex HW to do tone and color mapping on their
>> own and will require the display driver to perform appropriate
>> mapping.
> 
> FWIW, when designing Weston's color management, we are aiming for
> the latter "simple" panels foremost, because that gives us full control
> of all color conversions and tone mappings.
> 
> OTOH, if Weston has to present to a display which only accepts e.g.
> BT.2020/PQ signal, the display might always mangle the image in
> unexpected ways. Therefore I expect that by default Weston will do
> everything it can to try to make the display not apply anything magic
> image enhancement: trust that EDID description of the display gamut and
> dynamic range are correct, and use HDR metadata to tell the display
> that those values are exactly what we are using. And we use them.
> 
> IMO, a display doing its tone mapping magically is only useful when you
> want to be able to use "simple" playback devices that cannot adapt to
> the display they are driving. Magic tone mapping is also a way for
> hardware vendors to differentiate, which from the color management
> perspective is harmful as it makes it more difficult or impossible to
> predict the display behaviour or to keep it consistent.
> 
> So there are two opposing goals:
> 
> - Traditional color management wants absolute control of the display,
>   leaving nothing unpredictable and preferably also nothing undefined.
>   Undefined behaviour can always be measured (profiled) which makes it
>   predictable and known. The viewing environment is controlled and
>   constant.
> 
> - Entertainment wants the most visually impressive image quality by
>   dynamically adapting to both displayed content and to the viewing
>   environment conditions.
> 

I feel much of the mess around HDR and CM is all the magic that everyone
tries to do to differentiate themselves. I'm not a fan of that.

One thing to watch out for is that the definitions for some of these
things (I'm thinking PWL LUTs, 3D LUT, SDR boots) might differ a fair
bit between HW vendors and we'd want to find a way to hide these
complexities to KMS clients.

>> ## Pixel Formats
>>
>> The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
>> unrelated to color space and EOTF definitions. HDR pixels can be
>> formatted in different ways but in order to not lose precision HDR
>> content requires at least 10 bpc precision. For this reason
>> ARGB2101010, P010, and FP16 are the obvious candidates for HDR.
>> ARGB2101010 and P010 have the advantage of requiring only half the
>> bandwidth as FP16, while FP16 has the advantage of enough precision
>> to operate in a linear space, i.e. without EOTF.
> 
> Right.
> 
>> ## Proposed use-cases
>>
>> Although the userspace side of this work is still in the early stages
>> it is clear that we will want to support the following two use-cases:
>>
>> **One XRGB2101010 HDR Plane:** A single, composited plane of HDR
>> content. The use-case is a video player on a desktop with the
>> compositor owning the composition of SDR and HDR content. The content
>> shall be PQ BT.2020 formatted. The drm_connector's
>> hdr_output_metadata shall be set.
> 
> This use case is already possible, right?
> 

Yes, not sure how well tested it is but the AMD driver at least is programming
the LUTs into bypass if we don't have a degamma or regamma LUT.

>> **One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc
>> desktop plane, with a P010 HDR video plane underlayed. The HDR plane
>> shall be PQ BT.2020 formatted. The desktop plane shall specify an SDR
>> boost value. The drm_connector's hdr_output_metadata shall be set.
> 
> This use case requires blending in KMS, so is the primary goal I
> suppose.
> 

Correct, my understanding is that the key here is to ensure blending in KMS
is done in same blending space (linear RGB) as blending using GPU shaders and
SDR boost is applied in the same fashion.

>> **One XRGB8888 SDR Plane - HDR output:** In order to support a smooth
>> transition we recommend an OS that supports HDR output to provide the
>> hdr_output_metadata on the drm_connector to configure the output for
>> HDR, even when the content is only SDR. This will allow for a smooth
>> transition between SDR-only and HDR content. In this use-case the SDR
>> max luminance value should be provided on the drm_plane.
> 
> I think this might be already possible by crafting a CRTC GAMMA LUT? Not
> sure about precision.
> 
>> In DCN we will de-PQ or de-Gamma all input in order to blend in
>> linear space. For SDR content we will also apply any desired boost
>> before blending. After blending we will then re-apply the PQ EOTF and
>> do RGB to YCbCr conversion if needed.
> 
> This assumes the same color space over everything.
> 
>>
>> ## Summary of proposed interface changes
>>
>> per drm_plane:
>> - new RGB color space definitions, mirroring the existing YUV color
>> space definitions
>> - new transfer function property
>> - new SDR maximum white level property
> 
> How will these new KMS properties interact with per-plane DEGAMMA, CTM
> and/or GAMMA properties?
> 
> Why go with your proposal instead of per-plane CTM and LUT?
> 
> I think the ideal KMS pipeline for me, assuming I cannot have 3D LUTs
> both per-plane and on CRTC, would be:
> 
> plane:
> 	FB -> M1 -> LUT1 -> M2 -> blending input
> 
> CRTC:
> 	blending output -> LUT2 -> M3 -> connector
> 
> FB: framebuffer
> M1: matrix transform, capable of converting e.g. YCbCr to RGB
> LUT1: 1D LUT for content EOTF, to produce light-linear RGB
> M2: matrix transform for color space transformation
> 
> LUT2: 1D LUT for applying monitor EOTF^-1
> M3: matrix transform, e.g. if you need to push YCbCr on the connector
> 
> We also need to know where and how clipping happens.
> 
> I think this scheme would allow implementing everything you want, and
> it would not be tied to rigid enumerations, and it won't have any
> magical conversions done under the hood as you would need to do to
> convert from one enum space to another. It leaves the render intent to
> be defined by the userspace compositor, rather than building a fixed
> policy in the kernel.
> 
> Userspace would be setting transformation operators, not color spaces,
> to the kernel, allowing the blending space to be chosen by userspace.
> In Weston we aim to choose then blending color space to be the same as
> the output color space, except in optical (linear) encoding. The output
> color space can be non-standard, e.g. measured with a display profiler
> equipment.
> 
> I would expect gamut mapping, dynamic range mapping and tone mapping to
> be places where most experimentation and innovation happens, so
> implementing them in the kernel with just few or no controllable
> parameters at this time seems like it could become useless fast.
> 

How important from a Wayland compositor perspective would it be to have fully
configurable LUTs per plane, as opposed to providing KMS with a named transfer
function, such as PQ or BT709, for LUT1 and LUT2?

M1 on AMD's driver is currently hidden in our driver and essentially always
set to BT709 at the moment, though we should look at color_encoding to pick
the right M1. Are the color_encoding and color_range properties enough for
what you'd like to achieve for M1?

M3, currently the only matrix exposed by KMS (on drm_crtc) currently seems to be
applied at M2 by AMD's driver. I need to dig into this a bit more. It would
make sense to expose M2 and M3 as part of KMS (on drm_crtc and drm_plane).

I did a bunch of reading and thinking since your comments and created a v2 of
the patchset. I don't think it's where we need it to be but I hope it's a
step in the right direction. I will send it shortly.

Harry


> 
> Thanks,
> pq
> 
>> ## References
>>
>> [1]
>> https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer
>>
>>
>> ## Further Reading
>>
>> https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
>> http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
>> https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
>>
>>
>> Bhawanpreet Lakha (3):
>>   drm/color: Add RGB Color encodings
>>   drm/color: Add Color transfer functions for HDR/SDR
>>   drm/color: Add sdr boost property
>>
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>>  .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
>>  drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
>>  drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
>>  drivers/gpu/drm/drm_atomic_uapi.c             |  8 ++
>>  drivers/gpu/drm/drm_color_mgmt.c              | 84
>> +++++++++++++++++-- drivers/gpu/drm/i915/display/intel_sprite.c   |
>> 4 +- .../drm/i915/display/skl_universal_plane.c    |  4 +-
>>  drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
>>  drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
>>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
>>  drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
>>  include/drm/drm_color_mgmt.h                  | 25 +++++-
>>  include/drm/drm_plane.h                       | 30 +++++++
>>  14 files changed, 173 insertions(+), 16 deletions(-)
>>
> 

