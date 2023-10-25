Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725907D7550
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 22:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2310E6FE;
	Wed, 25 Oct 2023 20:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0910E6FA;
 Wed, 25 Oct 2023 20:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKCglkbkNP98ddYQK5FQJkRKspg04liY6+829zArfLbWdkU1mPbH5H55R+Bp98HfvKsh3DIECLrnyWkLiAkSoYHhOEKYv1A0ZBEwJS/6YFZjNWYd4eS/6o5O+BnHbSqiOEkHbO6qvugJYoirxh5JnrjaOvVsKOWHNRqovVVq0H3o0HwjC+WRRZYuWD5i0t0WtA2wPV+V0oeZRCEcJoi2+bqUq1VpU6xZX06ZmEjUR6f2pyIZcGBWW7QV+Yuc2+k+qdQbh06AHSi2jlhKw0QVu7IiLFhICOfhH4SEINfL2uizIegm92dxjKr630JkCDxaD1ryKG8RxyasoyYWQO8TDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmiMprkGn64o/oY8e6s9NJyTCynpMVqkc0sc/JCFHh4=;
 b=idd8YFSblS8XfqOwEPNW3KZue5ae1IxOJvSvNnGRwUqPdWqMU8v9mKf+tTXh4FeCpO+qX95isV3U188HVx3MbHzsXFPdF+XNpobNRPxyi58FlryWGWlm4fAlFJETucZ/ys2W4Y7kWqh84qutFcy+WhAyuPmkGP7DPfy1lgIi8N9FZE4FVhZ+wPyr7vMI/5lpgCx44YQwKnvR/IUSucVzS/j0zHUGdo6HfHg2gODnRZZwTL1gwkpF+/9h9tzC9aP+Ud+tTrkA187h5LeBxE7U6To1PwpUX7V18E7NfqU5WDJ2TTRGflIb8ocxiHpWL4/09GL3CwqGBi/+FNRzXTrSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmiMprkGn64o/oY8e6s9NJyTCynpMVqkc0sc/JCFHh4=;
 b=p5OGbosYuxz2qIta1Js503D6TzUiu7Kis6VW7BfNq1fJZtgpA3npMOnS3xtf/0rQpdXtgMgGgmzOw4mGBkqPOz5lnbaVkdqiSkEn4YmnudjqwMo27rxRXV0u1MP9VRqsrTgzJt9Uqd49INhoNPMtAIbvR9obnrsblZdcRKkil8cDmBXHpY2xOD+ioAmzQaLRJ0Mn4obZDVUwrr5l/z9qiI4QmydzPZUoxfYSFgX3YK0rMo002yE/sN9C8fIjboPp4eN0UjCc76zsP32gzEHrINlyQBUwOZDnZfnu/CFPXgYbihww5lYJbNzvRDUPHhVXNm8zMxDdaapwKXHl2285gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 20:16:10 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::18d0:410:2e41:b03b]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::18d0:410:2e41:b03b%4]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 20:16:09 +0000
Date: Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
From: Alex Goins <agoins@nvidia.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
In-Reply-To: <20231023111219.6e287958@eldfell>
Message-ID: <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
X-NVConfidentiality: public
Content-Type: multipart/mixed;
 boundary="1372433909-489094121-1698264969=:77487"
X-ClientProxiedBy: SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::10) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4720:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ec90f8-52aa-422d-4611-08dbd5973a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IG5khU1jMvzSVBSXTkSJw+b46cbagPszOb6xHMcQhEYUNDbne+WB6CYjmgaiTcz9uYd/wqlzkj/cQz5HBSRPRsjSnWV/I+OMSzYU7QIMgNv0yDydYGp/VZQNMj58ToU949O9gAec5wZCapMYWeVNfP+t1KV2ylihhQxTP+wAR+6qNEPXV+DsLK+cwZW9SvrrK4WVtx+K1e/S/MemMSvxddkvxXJjTCnd92F+7Yev/mp8+/rNQxEbkVYG89EGdEB62v3tl8g3WAqwSN6BpV0fhVHW8HYCjmWjFrmX+l+IhdK6hyuc/KWGKspIBUtr2X1ka8ouNz36ReufHNoYzd7pXRDEihVJHXLY4AKcUiES2FbTPMq+AAEgjBfPkn8zfjY1PnyHxGw64ZvhZ+RxTVmcmdaoMVRNd7xgBIpHdyarKEXzUiLVd0h0oYZ/tSIfXuzInG9WgHCQOoIO4TEidjGNpV7/gtJa7qv8f7BHesP/u5UoOlTnDDQfAdI+hRNHswJehoTUFbrCQ4PdiU0y74u3C7nXpnv/d88OejKM03CJbOAv4SOsBhkXl5klFFAJ0HBKfR+Rtn76ea8OUGqcdaPoZuM70GBCJI3lIZn/OJRMR5Rwh4AuQrIwRTujDWZDJtm5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4720.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66899024)(53546011)(33964004)(478600001)(6506007)(6512007)(66476007)(2616005)(66556008)(66946007)(36756003)(54906003)(6916009)(316002)(31696002)(86362001)(6486002)(26005)(83380400001)(38100700002)(41300700001)(8936002)(8676002)(4326008)(7416002)(5660300002)(31686004)(2906002)(4001150100001)(30864003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGJSQXQvYW1PQnZqUmdZUWMvVnM0RmJBMjdScS9Wa2lKUGRFSHR5SHVFWVRI?=
 =?utf-8?B?alBORlVNaDFzYkw4TXliczRkeUJXMGlSSDl3MUg3Y1k5bXlMM0I2Y25NWlNL?=
 =?utf-8?B?bmFzZUhUa1daZ3V1dllJWG84SWlVbVgyV3RqWkpUdTNxOHJQTHFRSGYvRW5P?=
 =?utf-8?B?cG1WdEhhOENDQm56K3J1OFBlT2Ztc3gvWGFJVTd1d3hNK1c0enlqT1JjNmUx?=
 =?utf-8?B?YXVlQzlWbHlJRnhyUWN3SHJnYzJEdU0zL1VBQ3hKK2dLMWFSNFNaeU01b1g1?=
 =?utf-8?B?Sk1xL2VLQUNITXBSRmJQei9USVJXYS9ZcUwzTjU4OWxOZWx6NENFTDhTeTIx?=
 =?utf-8?B?NEVqd3NkY1JsR3FGRDM5NG1rTFVGdHdwTXI5eVlxSHFxemk1QllJMjVoNzRJ?=
 =?utf-8?B?Rk5mRkxPQUxlYWtsbkNxZWEyOXE3T1h6TlN2c0ppTTNhMkJPby9tbG1ZMTY2?=
 =?utf-8?B?UWoyTENGLzFXc0czRGg4YXVRT2Z0TkkzbmpuT2xHSzdLaUtwMlNhWWlOK1Nw?=
 =?utf-8?B?YXpQR3VIeFFoS05TSWxhVE9ORjM2cEp0amd6RWZWdGJsYmkxTEhDQzRjQlo4?=
 =?utf-8?B?SXlYSjdseXF3OGlYclUycEJOd0RQQ1F5TDN2QURTZDloTGtDcG1OMndwQWEw?=
 =?utf-8?B?S0xsbFJ1Y3ErYUxmdng2TFBJcW9nM3VLT1ZSdnl1S3hpRUIyQjRQQmloeG90?=
 =?utf-8?B?T2VBeWtmRTMwalJPb21ocXcyV3RETXlMcG8xVnJPd0VlSmYrbWo4c0Y5c0k5?=
 =?utf-8?B?VG5TMEpCL0VrYXhKOUM1WmdDekN0RjB1R1VjOE5uN3lOWTNUQS9qbE94ek1C?=
 =?utf-8?B?YnBaNWtkN2JYbm1TaFp0R2orSHNEaWdZMU5KSU9hOUg2WW9acUpXMXF5VEZz?=
 =?utf-8?B?ZVpIZE4rRW5VTkNZMHlXdXE2UUZYY3pjS0FZQlNEZ0lCUmsvaktMWVZvNHhl?=
 =?utf-8?B?dVhhOXVkRkZVUllSeGF3TlpYODJIeGNuRjI1MUJDWU9oOVM3NW5QejV3SGdx?=
 =?utf-8?B?SnhTNUh5dThKeFpUeURVZFBZbGxybmNYLzdSZ0h1UnBBb29tT0pQa2NIOCtr?=
 =?utf-8?B?eDhCOUw4di9MMHdtVzkwUk9PRDZVV2ZVY0ZtOHNicTZQckhvLzJNNWlndUhR?=
 =?utf-8?B?c0NUSFBGVHVZVWh2WlhxaGV5MWpKcU80L1BydzJENkZUT1VEbjhqNG9GdnJr?=
 =?utf-8?B?amhRbXJ5VUJZMzJYQnAraldpeUhWOW82M0hQRFc3L0NwSnhmTVpRdDJ3RlJ6?=
 =?utf-8?B?bDBSU2doeEM3ZkliTmlkNVg5SXhIVmRweWtHK1V5YW9DMFA2QjNsZ0VtSXFk?=
 =?utf-8?B?d1dWRHlaYSt4b25IQjlrY2RvRzJSeGZvaHhEdVpJaGJJdVZvQldPWXI3U2tI?=
 =?utf-8?B?YTNPL0t4SFd2cGQzejZuQUlja3E3VUYxUkRuTURUUkEvWHRlb0Iyem1XR1RM?=
 =?utf-8?B?SHNGbkNFaENvOGp6VWN5d1k0V3VReHRhTWNHOFRFNkVxaW9UWGprejJDeGo3?=
 =?utf-8?B?RUxQQWFZRy9HT3RZZ1FyRDM0NW9KRENaMzJBeVdqZkJnbFNxRi83WEx1aFNa?=
 =?utf-8?B?RzBTNlBuVFhCaEpOYzZnTE5PQWIrRTVWVmliYUdHcjdqZGpaSHhpWTlLV09n?=
 =?utf-8?B?bGIxNXdia1BxeGpXcTY4bS9NcjZUU3FweGp4dS9NdGFXYlQ4c2Z1emFwQ0cr?=
 =?utf-8?B?MTc1VDM3WDZLeEszQ0Z2YzhyZ3lqRURtU3NoYllaSnlyYSsycUxHK0VOenVR?=
 =?utf-8?B?bm0vODJISjBxcmJ0VnczOTJza1U5ei9xUUZ4V3hHd3VjUUVwM0tlbmpHTHBQ?=
 =?utf-8?B?YTFEU1BCQ1pwMHhRQmR1V2hyWjRtS2ZnclpJUUZpUE40eWtxMk40MzE3K1Y3?=
 =?utf-8?B?WVFRYVRPL2psMFJNZEppK1BRWi9CdTl4L3M5L2ZxWmI0VXZOb2NPdkorbFJE?=
 =?utf-8?B?SDdyOWtNK3A0ODRpbE9aTUkyU0x5c1phcmNmYkcrd202VHZpTkZFNU9KL09V?=
 =?utf-8?B?dVY1MUVRcWxGTlJob2syeFVDdEZ6THFsZ2Q4TCtteFNXWDMyK3ZlR28ybHdu?=
 =?utf-8?B?NnVKSlhVYjF6alp0Ti82TzJ0TGp0NDZnczRqdFQ4Z1hCSWYvRytyc3hVRzBH?=
 =?utf-8?Q?xR9ibr4Wtz4cvDPPVjPfS1rkV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ec90f8-52aa-422d-4611-08dbd5973a24
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 20:16:09.7037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M6YSywXYPY3gDkkjEQNU3M6AtB1Zafmng6P0ncp15mqPqeTA3T3u6WLx6gLJU22q4wuY/QZmSeCaGXThuP2FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 =?ISO-8859-15?Q?Michel_D=E4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?ISO-8859-15?Q?Jonas_=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--1372433909-489094121-1698264969=:77487
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Thank you Harry and all other contributors for your work on this. Responses
inline -

On Mon, 23 Oct 2023, Pekka Paalanen wrote:

> On Fri, 20 Oct 2023 11:23:28 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
> > On 2023-10-20 10:57, Pekka Paalanen wrote:
> > > On Fri, 20 Oct 2023 16:22:56 +0200
> > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > >   
> > >> Thanks for continuing to work on this!
> > >>
> > >> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:  
> > >>> v2:
> > >>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
> > >>>  - Updated wording (Pekka)
> > >>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
> > >>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
> > >>>    section (Pekka)
> > >>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
> > >>>  - Add "Driver Implementer's Guide" section (Pekka)
> > >>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
> > >
> > > ...
> > >
> > >>> +An example of a drm_colorop object might look like one of these::
> > >>> +
> > >>> +    /* 1D enumerated curve */
> > >>> +    Color operation 42
> > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
> > >>> +    ├─ "BYPASS": bool {true, false}
> > >>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
> > >>> +    └─ "NEXT": immutable color operation ID = 43

I know these are just examples, but I would also like to suggest the possibility
of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
compared to setting an identity in some cases depending on the hardware. See
below for more on this, RE: implicit format conversions.

Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
offline discussions that it would nonetheless be helpful to expose enumerated
curves in order to hide the vendor-specific complexities of programming
segmented LUTs from clients. In that case, we would simply refer to the
enumerated curve when calculating/choosing segmented LUT entries.

Another thing that came up in offline discussions is that we could use multiple
color operations to program a single operation in hardware. As I understand it,
AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
"HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
we could combine them into a singular LUT in software, such that you can combine
e.g. segmented PQ EOTF with night light. One caveat is that you will lose
precision from the custom LUT where it overlaps with the linear section of the
enumerated curve, but that is unavoidable and shouldn't be an issue in most
use-cases.

Actually, the current examples in the proposal don't include a multiplier color
op, which might be useful. For AMD as above, but also for NVIDIA as the
following issue arises:

As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
to in floating point varies depending on the source content. If it's SDR
content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
is that this is also what AMD's "HDR Multiplier" stage is used for, is that
correct?

From the given enumerated curves, it's not clear how they would map to the
above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
value of 125.0? That may work, but it tends towards the "descriptive" notion of
assuming the source content, which may not be accurate in all cases. This is
also an issue for the custom 1D LUT, as the blob will need to be converted to
FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
value be, given that we no longer have any hint as to the source content?

I think a multiplier color op solves all of these issues. Named curves and
custom 1D LUTs would by default assume a max FP16 value of 1.0, which would then
be adjusted by the multiplier. For 80 nit SDR content, set it to 1, for 400
nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc. 

> > >>> +
> > >>> +    /* custom 4k entry 1D LUT */
> > >>> +    Color operation 52
> > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
> > >>> +    ├─ "BYPASS": bool {true, false}
> > >>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> > >>> +    ├─ "LUT_1D": blob
> > >>> +    └─ "NEXT": immutable color operation ID = 0
> > > 
> > > ...
> > >   
> > >>> +Driver Forward/Backward Compatibility
> > >>> +=====================================
> > >>> +
> > >>> +As this is uAPI drivers can't regress color pipelines that have been
> > >>> +introduced for a given HW generation. New HW generations are free to
> > >>> +abandon color pipelines advertised for previous generations.
> > >>> +Nevertheless, it can be beneficial to carry support for existing color
> > >>> +pipelines forward as those will likely already have support in DRM
> > >>> +clients.
> > >>> +
> > >>> +Introducing new colorops to a pipeline is fine, as long as they can be
> > >>> +disabled or are purely informational. DRM clients implementing support
> > >>> +for the pipeline can always skip unknown properties as long as they can
> > >>> +be confident that doing so will not cause unexpected results.
> > >>> +
> > >>> +If a new colorop doesn't fall into one of the above categories
> > >>> +(bypassable or informational) the modified pipeline would be unusable
> > >>> +for user space. In this case a new pipeline should be defined.    
> > >>
> > >> How can user space detect an informational element? Should we just add a
> > >> BYPASS property to informational elements, make it read only and set to
> > >> true maybe? Or something more descriptive?  
> > > 
> > > Read-only BYPASS set to true would be fine by me, I guess.
> > >   
> > 
> > Don't you mean set to false? An informational element will always do
> > something, so it can't be bypassed.
> 
> Yeah, this is why we need a definition. I understand "informational" to
> not change pixel values in any way. Previously I had some weird idea
> that scaling doesn't alter color, but of course it may.

On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
implicit fixed-point to FP16 conversions, and vice versa.

For example, the "degamma" LUT towards the beginning of the pipeline implicitly
converts from fixed point to FP16, and some of the following operations expect
to operate in FP16. As such, if you have a fixed point input and don't bypass
those following operations, you *must not* bypass the LUT, even if you are
otherwise just programming it with the identity. Conversely, if you have a
floating point input, you *must* bypass the LUT.

Could informational elements and allowing the exclusion of the BYPASS property
be used to convey this information to the client?  For example, we could expose
one pipeline with the LUT exposed with read-only BYPASS set to false, and
sandwich it with informational "Fixed Point" and "FP16" elements to accommodate
fixed point input. Then, expose another pipeline with the LUT missing, and an
informational "FP16" element in its place to accommodate floating point input.

That's just an example; we also have other operations in the pipeline that do
similar implicit conversions. In these cases we don't want the operations to be
bypassed individually, so instead we would expose them as mandatory in some
pipelines and missing in others, with informational elements to help inform the
client of which to choose. Is that acceptable under the current proposal?

Note that in this case, the information just has to do with what format the
pixels should be in, it doesn't correspond to any specific operation. So, I'm
not sure that BYPASS has any meaning for informational elements in this context.

> > > I think we also need a definition of "informational".
> > > 
> > > Counter-example 1: a colorop that represents a non-configurable  
> > 
> > Not sure what's "counter" for these examples?
> > 
> > > YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> > > format. It cannot be set to bypass, it cannot be configured, and it
> > > will alter color values.

Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
based on the principle that read-only blobs could be used to express some static
pipeline elements without the need to define a new type, but got mixed opinions.
I think this demonstrates the principle further, as clients could detect this
programmatically instead of having to special-case the informational element.

> > > 
> > > Counter-example 2: image size scaling colorop. It might not be
> > > configurable, it is controlled by the plane CRTC_* and SRC_*
> > > properties. You still need to understand what it does, so you can
> > > arrange the scaling to work correctly. (Do not want to scale an image
> > > with PQ-encoded values as Josh demonstrated in XDC.)
> > >   
> > 
> > IMO the position of the scaling operation is the thing that's important
> > here as the color pipeline won't define scaling properties.

I agree that blending should ideally be done in linear space, and I remember
that from Josh's presentation at XDC, but I don't recall the same being said for
scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
pipeline that is meant to be in PQ space (more on this below), and that was
found to achieve better results at HDR/SDR boundaries. Of course, this only
bolsters the argument that it would be helpful to have an informational "scaler"
element to understand at which stage scaling takes place.

> > > Counter-example 3: image sampling colorop. Averages FB originated color
> > > values to produce a color sample. Again do not want to do this with
> > > PQ-encoded values.
> > >   
> > 
> > Wouldn't this only happen during a scaling op?
> 
> There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
> coordinates can be fractional, which makes nearest vs. bilinear
> sampling have a difference even if there is no scaling.
> 
> There is also the question of chroma siting with sub-sampled YUV. I
> don't know how that actually works, or how it theoretically should work.

We have some operations in our pipeline that are intended to be static, i.e. a
static matrix that converts from RGB to LMS, and later another that converts
from LMS to ICtCp. There are even LUTs that are intended to be static,
converting from linear to PQ and vice versa. All of this is because the
pre-blending scaler and tone mapping operator are intended to operate in ICtCp
PQ space. Although the stated LUTs and matrices are intended to be static, they
are actually programmable. In offline discussions, it was indicated that it
would be helpful to actually expose the programmability, as opposed to exposing
them as non-bypassable blocks, as some compositors may have novel uses for them.

Despite being programmable, the LUTs are updated in a manner that is less
efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
if there was some way to tag operations according to their performance,
for example so that clients can prefer a high performance one when they
intend to do an animated transition? I recall from the XDC HDR workshop
that this is also an issue with AMD's 3DLUT, where updates can be too
slow to animate.

Thanks,
Alex Goins
NVIDIA Linux Driver Team

> Thanks,
> pq
> 
--1372433909-489094121-1698264969=:77487--
