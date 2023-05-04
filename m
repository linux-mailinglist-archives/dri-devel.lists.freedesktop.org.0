Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E56F77D0
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 23:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C8210E1C4;
	Thu,  4 May 2023 21:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63F10E1B8;
 Thu,  4 May 2023 21:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf2oRIhAfY+dZ/32HNuieA0eIs/G6RNWh2Y8Jq92p4T5aYy7ANHuFH0UnK8XfzmrWqamU0iwwOhqr9FaVEWNge0+iYIcDySn8eMcyWRn08USRUdlXafMAlRS6tLuw/wh2sGNlMgBiEykWm75eakRkK+IT4+HhYBjsc30KWCgy8xzjr3++tSh+U65e8D/q02RSFGWaySISEdvdqvwTCMb3+KHEdjoAFcDtLHjrJsn3DkVZ0JHNizFH7RlzxwgB4nYtY7veSazY/miJGTPbHwWVtd1697U7Y+5+T/v0KHexwjjn5fyVfA7zZOREWOmJkatIE3HEShnPCO//gJ8rAiH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOUB7UC0Bp0NVck77w4toGlVll1bBDZLBQpMEZhdJck=;
 b=llSmw4+vqO07wi1Zx6VJvd22Py7+ypw6JKtqwHsK0MPUKAoD4Sx+yOPw5kUFv9XBzqJi1wkleMNakSWRTz8egCysaxfizq+eFFkOvxZawYFpLqbsgp6qnnn2tCrZ4S4wnXMzhdIcoRhf+GOKKRCnJVPAyPCReD2b88vQrVi9FDNNiJ3NgEjdzbPSiEZu+5aMgbaAoUAszDbBZhhcfNr67SNGR19Bt3eA4igv4k8LtrozreWZpyjdLwgR5kxFhSn7Z9T4JCxxIaHCN5WKtM6O5ATJsQk+l8+Za68LhvFfXQWKOUcisHYNhsTCtdBlbi4SKSjOehfOplad4prkBCU8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOUB7UC0Bp0NVck77w4toGlVll1bBDZLBQpMEZhdJck=;
 b=RPPJBzFjf7WXFx/n1I+I9cjzsMAjmz7aANOyV7T7iYLrmTatgM3LHInPYMF5Cgl8P6t77PZJgcTe3PNkTPHJNR00wrBm2hQi2LcmXzx7e8bcj55061fgO1Ryr1OdWihp/740lFRQGf1TbtG06ELeJXfMfhn/kJkhlNC/4Xi1g9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:10:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 21:10:52 +0000
Message-ID: <67191ae5-460c-53d0-24c2-06fd6d20fcb1@amd.com>
Date: Thu, 4 May 2023 17:10:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Simon Ser <contact@emersion.fr>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: f926d9ed-c699-40d0-adbf-08db4ce40b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T22AI4m6cZ4uxpRwIxuzv33gm1mHNLv9TozDH9NikRUhT8p6ZJxdvIRsfZhlcJii8vbQG6qyeSy+kaokLAl8B58UMFVqXCQqW1tf+p60rxyz6HRqPrK5ICUxjOBXtygRHo9H22FoMwy5WIKoloitGkkYaLgYoz5JtSkWofBkGhbaJmtq0/EDGXAeZmGC6vV48syCLR/9p7NQ90dvGpbXLXttTTISkHLzyFW+OvNNYFFn/e2MYhMXmWWz3XjpTO1fv9EkC2Qb3AmyphQ8n7krmDEs5QOab80nWHdqciLpplpUY9ytgM/2AVJrP3W6MDv7UEk6Afmx0ipR+uqIxLx2Zqr07IzDy4SDf2+D+dOD7+kKKdDYDzsHi5Y4+JdrItU0DzWMsWpBNmw2UZK+wdXlROShJJbHgE4zCfrxkqcBOR42PCiNAynEBRXrm5XnbYL+dV7tKL/kwrnt3RSe845vFYQ/J8Zrp+8snFQwTUBzNvKWXREA4PXoKuwOXcdBi1gKy3Qj5sLzoDnVPTarZd9TZH+cC1FqK5smnB0Q4auxzmRCs+OuV6Fo1WecI6dywvjueK+1i2jtSKXJuxwx4aJD7sFlCbMQSUzer6G7mRvpk/JTdSUpGx1k10kWuH6cHzazzp7i4a5Trh6MRTfYVh/YjfwCn2Vy13PuZao96FcOM74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(316002)(2906002)(41300700001)(30864003)(186003)(53546011)(31696002)(6666004)(110136005)(4326008)(26005)(6512007)(6506007)(6486002)(83380400001)(66476007)(66946007)(86362001)(66556008)(66899021)(36756003)(54906003)(31686004)(2616005)(44832011)(478600001)(7416002)(5660300002)(8936002)(8676002)(966005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hoNHQySkJvN3FkMjJGaWU2b2ZZOSt5UzE2bjBFZWN2N1BGSmIveVE2ck50?=
 =?utf-8?B?UldxUWFhMnZjNkY2aDVEc2JNbmRPTEEyM01JZkJaU1hvSGZCeFZyZWY0WDRU?=
 =?utf-8?B?UGd3S0wzMnY0SkwvOHJDRmZBd2ZjYUVkWExyVU1xdlVVM1hKRHpHVXRvdDZl?=
 =?utf-8?B?M0EzMHgzbDVZUnpyVjhJblhSQys5Y1l4M2Z3WEYwd2JrRTlpdExIeDdFcUJx?=
 =?utf-8?B?WkRtVlZ5L1RSUDdsNmVpczR3Y290N29QcEZyOWhISC8zb1FVbW9Ea2VBb2F2?=
 =?utf-8?B?TU5aSEpXYzhJeEx2M0lpaXRnZzIxS0gzdmdXazFpcjNQaGpwMVl0MkgxL1B6?=
 =?utf-8?B?aXptUXRmQmJlY08wQ0g0WkxibzJvNDFBcm9TcE9JVkE4RFVhVWp2cllkWTNG?=
 =?utf-8?B?MEY4aklBMWNteGtDY0FkUnAvcnhSY2FOejhITjJRcU1HcURPZ04xVmRJcE5D?=
 =?utf-8?B?RXc4czZjckNhVSsxcC9qWjNSY1Q5blRhZWFxMnY5SHo0RVovcUw0WTFsbVpG?=
 =?utf-8?B?cWJFOG5VcUl1dVFzSXRDeEFObDlWNXptTXBaaGkxbitQTXVCemtwQTVlb3hU?=
 =?utf-8?B?WUpodnRxZkc5eWJTYUpGWjhSbmpZRDFGaXRHcGZXOFBURDhQOWZnT2IvbVlK?=
 =?utf-8?B?dGZaZEI0eDNaaC9zMENjbWdnYWRrZElhU3diTkVmY1dFWTJLRjNheUpBK09K?=
 =?utf-8?B?NVVMR0JGMXZYemFXb3ZCdzNmS2lTVHVxUVllN2dsUVJNQjBtcytPRFA1ZU5T?=
 =?utf-8?B?R2tlc3RZa1hrcW56d01FWm5lWnJZRnlZekw2WmVzSkxTQi92UzNpVjQxZFJT?=
 =?utf-8?B?OHVmRnRFNzNEeXFQRS95NEFEakdXMEhPZS9ZdjZrS0kvZ1NNMjhmaisvb0px?=
 =?utf-8?B?cHRzWG5jSW5ncHM4TDdUMlp5bzJnVjBmd2xuUDFJa0tWMFZycHpOUzBWVkRC?=
 =?utf-8?B?ZmhLUi9aUUJZZS9TVTdsZW1oU3d3STJYdmlvRmU0NzI2d0tJRHdhVGsvbWtP?=
 =?utf-8?B?VFVKdndFNUxXeGVZbFdFYk1sLyt6VENlVTdyL1J2b1g4cmhyWFBhdkJhR0hp?=
 =?utf-8?B?b2dLV2RrUEp3Y2M5YmhaNDVEM3g3RFQwOU92TnFITXdTR2c5V2ZUYU5Kd1Jx?=
 =?utf-8?B?TEFxb0xxb2ZpWjl4WkVZdXhFL01RUFpBWkE5RkhLdnNHOFpiaS9OK0dpMDZx?=
 =?utf-8?B?VFYrWnkxK1BFdkQzdmZBU0F1Y2ZuUjZEZmNzY3lqQXJnOVUvSWZINk5jZUJV?=
 =?utf-8?B?TkgxTVpKZndRNXJ0dXZ1c01ZL3F0U1YxaThxUmE4eXhBaU53TWdoZnRlc3dp?=
 =?utf-8?B?M3hzYmVmMks2amlmUFFwcmZYbHZhRC96RmpLRG00ajluOXpMY2ZQeEwvN3VM?=
 =?utf-8?B?QVk0Z0szalNtaXpXUzd6ZXN2cEg5OXFvN0t2aHhta2djbjNLbW5Dc3g2Z0pS?=
 =?utf-8?B?aXM1NHBad2RNaUtWRkx2OFNzM3B3MDRkMDBtVTB1ZEhlcWdrcC8vVXhBMUI2?=
 =?utf-8?B?a0RHSW1MUVBQYWxrQ1NJMlNoeDZoZHg1YVc1ckpTTFVKOUl5VmZNSmF5TnNo?=
 =?utf-8?B?Zy9LM0dmRGIwdXJjVXJSZjViVUZVQWFJa2lUSzZwUnNjcGJrWTlrOE5nRGxu?=
 =?utf-8?B?L215VUY2TEFyQmRoOEJsVklxVUJUYjdvd2srRmYycUI0dEduUUQwcC9PU043?=
 =?utf-8?B?eWZrcWxuODBKcEhRV0pwK3F3TDNFWjVPb2s1Vm1UWU1ES09DQ293OFBqYXJs?=
 =?utf-8?B?d2tQWWxlQlpZa3BiTXNxK0NoNmpkTW1rYU9IeUFIeFRCakJPbCtkemVMVWxO?=
 =?utf-8?B?UlBaQ1dQaTk5Q3ZyUlZJOVA0V2ZuelBWeTd4UjFNOWZpTTFhVHNQN3EvUi9V?=
 =?utf-8?B?M1R0ME9iWG5DU2FQMkVuM2VJM3dSUWttRzdzSEZkaFh6Uk5sRDhIdjhjSDZX?=
 =?utf-8?B?N1U2Z2dZTjFFSnErRkc3d0hsbTRtMEdLeDFHMWtKS2hROUptS1A4QURUYUpE?=
 =?utf-8?B?SEI5QmZES294MXF3aXM2OVZjL3dNSm11NEZDcW1LRVA2SHljbzcrZHhVVUZJ?=
 =?utf-8?B?SStNaVFQSmhjYlBPT3c5Q1Y5bHpiOEM4bTBGVTNucGorRWQwdkhHenhJZnp5?=
 =?utf-8?Q?3gtJbEN6UT2gpFRQwO5VY0RHD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f926d9ed-c699-40d0-adbf-08db4ce40b23
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:10:52.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cnfV5oVCKQqIc/JkvJbE7cDVnSeXgp8HRge/J0rt4YsSZYRpIQwMAaQ3++kLrPsajqm1JQffiZ1kVmIPDn4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/23 11:22, Simon Ser wrote:
> Hi all,
> 
> The goal of this RFC is to expose a generic KMS uAPI to configure the color
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new uAPI we
> aim to reduce the battery life impact of color management and HDR on mobile
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.
> 

Thanks for typing this up. It does a great job describing the vision.

> This proposal takes a prescriptive approach instead of a descriptive approach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate exactly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color management
> policy.
> 
> We've decided against mirroring the existing CRTC properties
> DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> pipeline can significantly differ between vendors and this approach cannot
> accurately abstract all hardware. In particular, the availability, ordering and
> capabilities of hardware blocks is different on each display engine. So, we've
> decided to go for a highly detailed hardware capability discovery.
> 
> This new uAPI should not be in conflict with existing standard KMS properties,
> since there are none which control the pre-blending color pipeline at the
> moment. It does conflict with any vendor-specific properties like
> NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
> properties. Drivers will need to either reject atomic commits configuring both
> uAPIs, or alternatively we could add a DRM client cap which hides the vendor
> properties and shows the new generic properties when enabled.
> 
> To use this uAPI, first user-space needs to discover hardware capabilities via
> KMS objects and properties, then user-space can configure the hardware via an
> atomic commit. This works similarly to the existing KMS uAPI, e.g. planes.
> 
> Our proposal introduces a new "color_pipeline" plane property, and a new KMS
> object type, "COLOROP" (short for color operation). The "color_pipeline" plane
> property is an enum, each enum entry represents a color pipeline supported by
> the hardware. The special zero entry indicates that the pipeline is in
> "bypass"/"no-op" mode. For instance, the following plane properties describe a
> primary plane with 2 supported pipelines but currently configured in bypass
> mode:
> 
>      Plane 10
>      ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>      ├─ …
>      └─ "color_pipeline": enum {0, 42, 52} = 0
> 
> The non-zero entries describe color pipelines as a linked list of COLOROP KMS
> objects. The entry value is an object ID pointing to the head of the linked
> list (the first operation in the color pipeline).
> 
> The new COLOROP objects also expose a number of KMS properties. Each has a
> type, a reference to the next COLOROP object in the linked list, and other
> type-specific properties. Here is an example for a 1D LUT operation:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 43
> 
> To configure this hardware block, user-space can fill a KMS blob with 4096 u32
> entries, then set "lut_data" to the blob ID. Other color operation types might
> have different properties.
> 
> Here is another example with a 3D LUT:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>      ├─ "lut_size": immutable range = 33
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 43
> 
> And one last example with a matrix:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 43
> 
> [Simon note: having "Bypass" in the "type" enum, and making "type" mutable is
> a bit weird. Maybe we can just add an "active"/"bypass" boolean property on
> blocks which can be bypassed instead.]

I would favor a "bypass" boolean property.

> 
> [Jonas note: perhaps a single "data" property for both LUTs and matrices
> would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> 

I concur. We'll probably want to document for which types a property 
applies.

> If some hardware supports re-ordering operations in the color pipeline, the
> driver can expose multiple pipelines with different operation ordering, and
> user-space can pick the ordering it prefers by selecting the right pipeline.
> The same scheme can be used to expose hardware blocks supporting multiple
> precision levels.
> 
> That's pretty much all there is to it, but as always the devil is in the
> details.
> 

One such detail that might need some thought is whether the specific 
pipeline configuration exposed by a driver becomes uAPI. In theory I 
might be breaking use-cases userspace has if I change my color pipeline, 
but it would still discoverable and usable if userspace uses the uAPI in 
a truly vendor-neutral way.

Thoughts?

> First, we realized that we need a way to indicate where the scaling operation
> is happening. The contents of the framebuffer attached to the plane might be
> scaled up or down depending on the CRTC_W and CRTC_H properties. Depending on
> the colorspace scaling is applied in, the result will be different, so we need
> a way for the kernel to indicate which hardware blocks are pre-scaling, and
> which ones are post-scaling. We introduce a special "scaling" operation type,
> which is part of the pipeline like other operations but serves an informational
> role only (effectively, the operation cannot be configured by user-space, all
> of its properties are immutable). For example:
> 
>      Color operation 43
>      ├─ "type": immutable enum {Scaling} = Scaling
>      └─ "next": immutable color operation ID = 44
> 
> [Simon note: an alternative would be to split the color pipeline into two, by
> having two plane properties ("color_pipeline_pre_scale" and
> "color_pipeline_post_scale") instead of a single one. This would be similar to
> the way we want to split pre-blending and post-blending. This could be less
> expressive for drivers, there may be hardware where there are dependencies
> between the pre- and post-scaling pipeline?]
> 

I would prefer to avoid splitting the pipeline again. We can't easily 
avoid the pre-/post-blending split but for scaling it might be more 
straight-forward to add a read-only scaling op. This isn't a strong 
preference since I could see either way working out well.

> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
> contains some fixed-function blocks which convert from LMS to ICtCp and cannot
> be disabled/bypassed. NVIDIA hardware has been designed for descriptive APIs
> where user-space provides a high-level description of the colorspace
> conversions it needs to perform, and this is at odds with our KMS uAPI
> proposal. To address this issue, we suggest adding a special block type which
> describes a fixed conversion from one colorspace to another and cannot be
> configured by user-space. Then user-space will need to accomodate its pipeline
> for these special blocks. Such fixed hardware blocks need to be well enough
> documented so that they can be implemented via shaders.
> 
> We also noted that it should always be possible for user-space to completely
> disable the color pipeline and switch back to bypass/identity without a
> modeset. Some drivers will need to fail atomic commits for some color
> pipelines, in particular for some specific LUT payloads. For instance, AMD
> doesn't support curves which are too steep, and Intel doesn't support curves
> which decrease. This isn't something which routinely happens, but there might
> be more cases where the hardware needs to reject the pipeline. Thus, when
> user-space has a running KMS color pipeline, then hits a case where the
> pipeline cannot keep running (gets rejected by the driver), user-space needs to
> be able to immediately fall back to shaders without any glitch. This doesn't
> seem to be an issue for AMD, Intel and NVIDIA.
> 
> This uAPI is extensible: we can add more color operations, and we can add more
> properties for each color operation type. For instance, we might want to add
> support for Intel piece-wise linear (PWL) 1D curves, or might want to advertise
> the effective precision of the LUTs. The uAPI is deliberately somewhat minimal
> to keep the scope of the proposal manageable.
> 
> Later on, we plan to re-use the same machinery for post-blending color
> pipelines. There are some more details about post-blending which have been
> separately debated at the hackfest, but we believe it's a viable plan. This
> solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT properties, so
> we'd like to introduce a client cap to hide the old properties and show the new
> post-blending color pipeline properties.
> 
> We envision a future user-space library to translate a high-level descriptive
> color pipeline into low-level prescriptive KMS color pipeline ("libliftoff but
> for color pipelines"). The library could also offer a translation into shaders.
> This should help share more infrastructure between compositors and ease KMS
> offloading. This should also help dealing with the NVIDIA case.
> 
> To wrap things up, let's take a real-world example: how would gamescope [2]
> configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope color
> pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4].
> 
> AMD would expose the following objects and properties:
> 
>      Plane 10
>      ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>      └─ "color_pipeline": enum {0, 42} = 0
>      Color operation 42 (input CSC)
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 43
>      Color operation 43
>      ├─ "type": enum {Scaling} = Scaling
>      └─ "next": immutable color operation ID = 44
>      Color operation 44 (DeGamma)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>      └─ "next": immutable color operation ID = 45
>      Color operation 45 (gamut remap)
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 46
>      Color operation 46 (shaper LUT RAM)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT} = LUT
>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 47
>      Color operation 47 (3D LUT RAM)
>      ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>      ├─ "lut_size": immutable range = 17
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 48
>      Color operation 48 (blend gamma)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 0
> 
> To configure the pipeline for an HDR10 PQ plane (path at the top) and a HDR
> display, gamescope would perform an atomic commit with the following property
> values:
> 
>      Plane 10
>      └─ "color_pipeline" = 42
>      Color operation 42 (input CSC)
>      └─ "matrix_data" = PQ → scRGB (TF)
>      Color operation 44 (DeGamma)
>      └─ "type" = Bypass
>      Color operation 45 (gamut remap)
>      └─ "matrix_data" = scRGB (TF) → PQ
>      Color operation 46 (shaper LUT RAM)
>      └─ "lut_data" = PQ → Display native
>      Color operation 47 (3D LUT RAM)
>      └─ "lut_data" = Gamut mapping + tone mapping + night mode
>      Color operation 48 (blend gamma)
>      └─ "1d_curve_type" = PQ
> 
> I hope comparing these properties to the diagrams linked above can help
> understand how the uAPI would be used and give an idea of its viability.
> 
> Please feel free to provide feedback! It would be especially useful to have
> someone familiar with Arm SoCs look at this, to confirm that this proposal
> would work there.
> 

This is the major gap we have with this proposal, so I hope someone 
working on the Arm SoC drivers sees this and can comment.

Again, thanks for typing this up, Simon.

Harry

> Unless there is a show-stopper, we plan to follow up this RFC with
> implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> 
> Many thanks to everybody who contributed to the hackfest, on-site or remotely!
> Let's work together to make this happen!
> 
> Simon, on behalf of the hackfest participants
> 
> [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> [2]: https://github.com/ValveSoftware/gamescope
> [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
