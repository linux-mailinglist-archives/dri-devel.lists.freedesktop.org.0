Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E17D88E2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729510E872;
	Thu, 26 Oct 2023 19:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB510E86F;
 Thu, 26 Oct 2023 19:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUxvPJG/BkgL0o6OY1SeFXQ6rlL73dfl/wDLS3wJGeswwD1CucOgJOyJJPfO8M++IQa10ySQzTfrFXrBVGcYgUyTQAHjwHRs4fFtr3cGBx111qy126tuJltlJCmtit6/xtagXrcRe3Bpw34Exzoq72eDmoRNbYchQ9/xSopFUcwfnSm7QPd9CyYD6NDOcQxjGrCJFgJ90bZ9W/s/s8pC8IL9koy0ejccxK6J84Gs1oWC8TUIbqy6Pmt4EihckNsrT9SkqGq+pUm71NPMHMwlv8ubhahYCsbP/Ml8L08YdP3yH6AtHm/2etRq/hTZYlBQQpvrmWVFxY41QSGYKDVXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8xkkgrL3wfovWU5OGXLSmC8gHTHfTK52E4H9XRsxdk=;
 b=JNXZ882hTQqxNT5z0m4xSnXjVdqxweP3TZm1yBaba9rIFImOJ5nC+fUKXMsVOO2di8JEpVMMw5iYqq+xpj/NnDdPMHs9QvaalhQmIDFnj34hT2JL2x5Gi98yhFD5iN/b1sgp6m1k0REd45o+Wy1zYSy3cMALpK6CBGsugoNteIvDuZ8ghzys7ndzuidWjEPPmOsIJN/fKV4sZZkU1MsJuWi+yKUbqsCRwHLX3Lu79MNAewBIL0ly5innWXm0U9Fx12rHSGYTnZBghjhUB2ThDPrVD/8MI2iBJ0fal4RK6KdvD/1gROS3DYiTEh8h4WEwzPSPd/GCuGV4x2533KvRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8xkkgrL3wfovWU5OGXLSmC8gHTHfTK52E4H9XRsxdk=;
 b=N5o9oXbOHq9XmILluX33cFbqvYqO6DKIVUK9kPcuXEHWpllzpaSkdPpkyzIefUlAoaL4ujFL0YwvkpT037px+0Aqeo40OGNfQLCQgKc8fHme3XKImaqYVYdCVfoOa8895/cpHO9IReLKB0eb6/WL80U9s3phCD7DIYpaIDZVs8pwmyLupgL+qMN5YUAQUO224K+IQJc1fLs5OLvHDo41+f0l5H4BoFtk0ykiDVGjbYppL1/WY97SBM8JsfkzwVUtkerQkadTmX+Cpb0iGuR0B7mC7bqnVcVklNSiuosSLozc/Eks/9TcT1TTUSDcAkEwayf+BXg7kPa+gc+eev2ljg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 19:25:52 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::18d0:410:2e41:b03b]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::18d0:410:2e41:b03b%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 19:25:51 +0000
Date: Thu, 26 Oct 2023 14:25:50 -0500 (CDT)
From: Alex Goins <agoins@nvidia.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
In-Reply-To: <20231026173003.GA319477@toolbox>
Message-ID: <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
X-NVConfidentiality: public
Content-Type: multipart/mixed;
 boundary="1372433909-1794530197-1698348351=:882772"
X-ClientProxiedBy: SA0PR11CA0195.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::20) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4720:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5c84b2-e4cb-4fdd-537f-08dbd6595dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHUEfEHo1spJgiFw9LOijJngmQU7dsvuKQegDlMR2MREx30a5zDirokeDvkKKXuyvU35CaSvUalk4Os0eRFL3yISAZG0vmfeXEC1w5l0Fgyd6Moeh59WoY/rFUj6b6t7YWJVvSEFyXjiDXPH33bMTvp3XD+8l+yzX25CfifsvXGG9ycVWUAkjPGgM4EF9ZW9xeqGkTBgEklIE/4VLMuJTu7foan/lFjIt92lQdwTSbfJ8zmziZkEQSLwtB9sZll+r3ausOkaF0kAlgMuStrO2Pe2NzZGgo7fDGicXitnmLmC4HqfQtpGBctOdwSRkwNMFNnUb4Lq7J/M43qA0BivOb72e2zNYOd1oeT3hn3gSlAJHH3eTlACgzmln1hEiRacqtL/2iAUJQ2DCQNhRoOYLTIeJMzT78E7hRr6tYRl9O6eArcrhtREWQmhOccmBAGobZ/erGZInRzLTfyuWPWznkN/2Zw6hgUfFHOI3U4aGQlgrP4r8dG++CKdKDiCT+Z/l5H9kGwfHjfxQ+7wNCpRpGKysO4evsvAfOzTRQFLhyI8EIRfM9q/UZquMF9Us8TY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4720.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(4001150100001)(66899024)(38100700002)(2906002)(30864003)(5660300002)(7416002)(36756003)(33964004)(66946007)(4326008)(8676002)(66556008)(8936002)(478600001)(41300700001)(2616005)(6506007)(316002)(6916009)(54906003)(66476007)(83380400001)(86362001)(6486002)(53546011)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJzT2ROWkJyNzNxbVIyQUdnNDBQR1hwTTBtL2tCdlVHYjRiNTd1a2dWbHlM?=
 =?utf-8?B?U2NtV0hrK0lBT2pXcUplczVBWnVTZnltMFVCRHlhQkMyckVUd3d5My9wMzAx?=
 =?utf-8?B?L0ppUTBRVVJPNlhFRlAvZTJFVld5NXpDRzg1MXJBRWdwSmpyekxKeEJvS2lK?=
 =?utf-8?B?MFU5OFdsTldadnlqOWxtc21vYW5YZjB3akdLZjY4ZjFYeHpSWG1lWjEzeGtr?=
 =?utf-8?B?OC9tS3JmcTd6YmtsRVZXTVlySFZ0RjlCaWM2dzYzaERST0JRcDZwYmc5Y1My?=
 =?utf-8?B?VUJWbHFyQU5WN3BneHliQWU2dm1qNjZiNGl1WHdFTWtEY0RVVUQrYTlJMEdx?=
 =?utf-8?B?bUswcUJsZUtZR0lFdDJzRWR1bE8vSTJhckMzUTl4eUpaVTJ0NnczVVRHMnY5?=
 =?utf-8?B?cFJheHVzNnM4d2R4S3VLL1pZb3Zoa0MzaG50OS9uUlRGZ3g5NXQyRmZ0MDBH?=
 =?utf-8?B?cWZZQSszZU1VdlN1RUlPMFVrYXBNbFFkT3FRWUF0T3o3cStXTUZiN21JMTZ5?=
 =?utf-8?B?enBUdVNUMUxoeS9wN1czYStadUkvc2laZngxUHg0UXA3aExtTEx3RUJ3b2wr?=
 =?utf-8?B?WC91YVRTai9ZZThVaVYralQybzlOM0hyeisreFpGZWFPQnJCaEtoSVBMLzBo?=
 =?utf-8?B?bFFORFZlOFFDSXFKbjErcU1FMzFyWnlidVVrTnNoZjZNbE1xZXN3VGdYd3hq?=
 =?utf-8?B?Ulh4Y1pKaWJpRXZrZzZkd0Z2Ymx4YkF5Mk5BdTVJTHR2MDlYcndNSTltS2Q0?=
 =?utf-8?B?QzF4QnB0bXRUV0E4bVUzam1QOUMxTTErR0FNekZDM3NpVzYvU1J6TWVuL0sy?=
 =?utf-8?B?M1NBRFNNeGVnSm1HQmhGS2VxdlFvSmpFcmVxOUQybGk4YWc2bXYvR2F5SlRl?=
 =?utf-8?B?L3ZrNjJ6TlBnSlA3emlaUkFUb2grbTJlYWJNdUtHcnNscWRvcDU2Qm5DSGlI?=
 =?utf-8?B?UUNnQVhjUDhYekszRmlqcGhZTWM2bVFQMGlCVjdpZzVOZFJkT0xBOEQrT2pE?=
 =?utf-8?B?V3ZzcmlTTVREQnRrOHZVSS9yK0VMM2dhNE1Pd0dKTnVDTXF4dGljQ3pLdkk2?=
 =?utf-8?B?OXhjUFd6dUtKZjI0enFhS010amtEWHF3UHlpejdGN3JobDdOM1BZUmVHMmJs?=
 =?utf-8?B?Z0VXSUpINTFLWlhBWlQ1a0xTSE5CVThKRlQ5RGdVc1l1YnhMTnJBQVE3Ynhi?=
 =?utf-8?B?NVBVd1RkVi9rdTZqZzkrcEZVR2dhVlNBdGlWU1ErQUVpTUZkWDdSL2ZRUTlF?=
 =?utf-8?B?QzFOeFBybkw1WHFPcWdseWl5bWJvNlAzSHlaaGxsNE9GTGg3QThveUxyWkxk?=
 =?utf-8?B?VE56czBWSjlFTytCQVNjY1lYY29IRHIrdS9KdDNzNmhMSUdpWEFSR0dQUzhO?=
 =?utf-8?B?amM4SnV1bmgwQlZLakYrRlJUbDI3dnFVUGcrdW9MeU0zaVhVRE9ac1hiUW9l?=
 =?utf-8?B?RHpxLzVnYklEYVFlUGRTQlpFVGNCSnp5TlowdFVTMXA4SGVTTGhHSkxCY0lP?=
 =?utf-8?B?R01iSHppaDNuN2M3OVdpeGJ6V2VmRWs1WkFjTWJ1R2dHbnZtMWxUanpoRklZ?=
 =?utf-8?B?ZHdKVE5UbktpWFpKd2dOUFU2eklYQk84QkdIMkpVV1hYRGNvNUczUllIT21B?=
 =?utf-8?B?dDdHRUVHZ3NFTG9vY2M0M3p5aHlPM0Q3cnljUDdmNGhZU1dhZ1N1SnZvbWJr?=
 =?utf-8?B?Q3dBa01GTVB1TXNtaUp3NmtPVzdhc0JEQmNYdnpURmlQNlJqTnBxSkZSN3d6?=
 =?utf-8?B?SlJzTTJVTEZDWmJ2NmNhRUZZanZtMTRpRkNyLzhCS1VaUVo1OVdlcmU4aFZH?=
 =?utf-8?B?S2lKV1ZRK09wTkg0ZWJrRzZIWFRhd2ptZER5NXNSdnR5UDk1ekt6Nng4dE9W?=
 =?utf-8?B?Z3ZJS01qUlZTeTZJMG5pbjlaRnBqdVMxYktjOFpiYzMzRlMyTWJsbk5mUGVr?=
 =?utf-8?B?R0pSTktlMys2Tjk2N29JbEdmenNJMFF5dHliZ0U4eW1FbDZtN3VDbFZPTGhi?=
 =?utf-8?B?QWRZZHIxdVgxc1NXYkJRQjVDNDF3MkZyaVBUcWd6NG03Uy9DQ1M5bWhLQkwy?=
 =?utf-8?B?dHFCUys0VW5YUVdsQW1uRUN3MTdQUzE5eUhBSE4zcjJrSzBJWDk2WkVXb2hM?=
 =?utf-8?Q?3W8k4A0agzsSNlSse55pPmPi3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5c84b2-e4cb-4fdd-537f-08dbd6595dc1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 19:25:51.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nnlsEiDXu8iSGIK6/KqaXLGVdLTQ90YU+IRKFuaU1oAPfhShiRxDORgPWstHJQqauhGpxiB+MvWvLJ/JeyIMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035
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
 Christopher Braga <quic_cbraga@quicinc.com>, Aleix Pol <aleixpol@kde.org>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?ISO-8859-15?Q?Jonas_=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--1372433909-1794530197-1698348351=:882772
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 26 Oct 2023, Sebastian Wick wrote:

> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> > On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> > Alex Goins <agoins@nvidia.com> wrote:
> >
> > > Thank you Harry and all other contributors for your work on this. Responses
> > > inline -
> > >
> > > On Mon, 23 Oct 2023, Pekka Paalanen wrote:
> > >
> > > > On Fri, 20 Oct 2023 11:23:28 -0400
> > > > Harry Wentland <harry.wentland@amd.com> wrote:
> > > >
> > > > > On 2023-10-20 10:57, Pekka Paalanen wrote:
> > > > > > On Fri, 20 Oct 2023 16:22:56 +0200
> > > > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > > > >
> > > > > >> Thanks for continuing to work on this!
> > > > > >>
> > > > > >> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:
> > > > > >>> v2:
> > > > > >>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
> > > > > >>>  - Updated wording (Pekka)
> > > > > >>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
> > > > > >>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
> > > > > >>>    section (Pekka)
> > > > > >>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
> > > > > >>>  - Add "Driver Implementer's Guide" section (Pekka)
> > > > > >>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
> > > > > >
> > > > > > ...
> > > > > >
> > > > > >>> +An example of a drm_colorop object might look like one of these::
> > > > > >>> +
> > > > > >>> +    /* 1D enumerated curve */
> > > > > >>> +    Color operation 42
> > > > > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
> > > > > >>> +    ├─ "BYPASS": bool {true, false}
> > > > > >>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
> > > > > >>> +    └─ "NEXT": immutable color operation ID = 43
> > >
> > > I know these are just examples, but I would also like to suggest the possibility
> > > of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
> > > compared to setting an identity in some cases depending on the hardware. See
> > > below for more on this, RE: implicit format conversions.
> > >
> > > Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
> > > offline discussions that it would nonetheless be helpful to expose enumerated
> > > curves in order to hide the vendor-specific complexities of programming
> > > segmented LUTs from clients. In that case, we would simply refer to the
> > > enumerated curve when calculating/choosing segmented LUT entries.
> >
> > That's a good idea.
> >
> > > Another thing that came up in offline discussions is that we could use multiple
> > > color operations to program a single operation in hardware. As I understand it,
> > > AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
> > > "HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
> > > we could combine them into a singular LUT in software, such that you can combine
> > > e.g. segmented PQ EOTF with night light. One caveat is that you will lose
> > > precision from the custom LUT where it overlaps with the linear section of the
> > > enumerated curve, but that is unavoidable and shouldn't be an issue in most
> > > use-cases.
> >
> > Indeed.
> >
> > > Actually, the current examples in the proposal don't include a multiplier color
> > > op, which might be useful. For AMD as above, but also for NVIDIA as the
> > > following issue arises:
> > >
> > > As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
> > > point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
> > > to in floating point varies depending on the source content. If it's SDR
> > > content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
> > > potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
> > > content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
> > > is that this is also what AMD's "HDR Multiplier" stage is used for, is that
> > > correct?
> >
> > It would be against the UAPI design principles to tag content as HDR or
> > SDR. What you can do instead is to expose a colorop with a multiplier of
> > 1.0 or 125.0 to match your hardware behaviour, then tell your hardware
> > that the input is SDR or HDR to get the expected multiplier. You will
> > never know what the content actually is, anyway.

Right, I didn't mean to suggest that we should tag content as HDR or SDR in the
UAPI, just relating to the end result in the pipe, ultimately it would be
determined by the multiplier color op. 

> >
> > Of course, if we want to have a arbitrary multiplier colorop that is
> > somewhat standard, as in, exposed by many drivers to ease userspace
> > development, you can certainly use any combination of your hardware
> > features you need to realize the UAPI prescribed mathematical operation.
> >
> > Since we are talking about floating-point in hardware, a multiplier
> > does not significantly affect precision.
> >
> > In order to mathematically define all colorops, I believe it is
> > necessary to define all colorops in terms of floating-point values (as
> > in math), even if they operate on fixed-point or integer. By this I
> > mean that if the input is 8 bpc unsigned integer pixel format for
> > instance, 0 raw pixel channel value is mapped to 0.0 and 255 is mapped
> > to 1.0, and the color pipeline starts with [0.0, 1.0], not [0, 255]
> > domain. We have to agree on this mapping for all channels on all pixel
> > formats. However, there is a "but" further below.

I think this makes sense insofar as how we interact with the UAPI, and that's
basically how fixed point works for us anyway. However, relating to your "but",
it doesn't avoid the issue with hardware expectations about pixel formats since
it doesn't change the underlying pixel format.

> >
> > I also propose that quantization range is NOT considered in the raw
> > value mapping, so that we can handle quantization range in colorops
> > explicitly, allowing us to e.g. handle sub-blacks and super-whites when
> > necessary. (These are currently impossible to represent in the legacy
> > color properties, because everything is converted to full range and
> > clipped before any color operations.)
> >
> > > From the given enumerated curves, it's not clear how they would map to the
> > > above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
> > > value of 125.0? That may work, but it tends towards the "descriptive" notion of
> > > assuming the source content, which may not be accurate in all cases. This is
> > > also an issue for the custom 1D LUT, as the blob will need to be converted to
> > > FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
> > > value be, given that we no longer have any hint as to the source content?
> >
> > In my opinion, all finite non-negative transfer functions should
> > operate with [0.0, 1.0] domain and [0.0, 1.0] range, and that includes
> > all sRGB, power 2.2, and PQ curves.

Right, I think so too, otherwise you are making assumptions about the source
content. For example, it's possible to do HDR with a basic gamma curve, so you
can't really assume that gamma should always go up to 1.0, but PQ up to 125.0.
If you did that, it would necessitate adding an "HDR Gamma" curve, which is
converging back on a "descriptive" UAPI. By leaving the final range up to the
subsequent multiplier, the client gets to choose independently from the TF,
which seems more in line with the goals of this proposal.

> >
> > If we look at BT.2100, there is no such encoding even mentioned where
> > 125.0 would correspond to 10k cd/m². That 125.0 convention already has
> > a built-in assumption what the color spaces are and what the conversion
> > is aiming to do. IOW, I would say that choice is opinionated from the
> > start. The multiplier in BT.2100 is always 10000.

Be that as it may, the convention of FP16 125.0 corresponding to 10k nits is
baked in our hardware, so it's unavoidable at least for NVIDIA pipelines.

> >
> > Given that elements like various kinds of look-up tables inherently
> > assume that the domain is [0.0, 1.0] (because the it is a table that
> > has a beginning and an end, and the usual convention is that the
> > beginning is zero and the end is one), I think it is best to stick to
> > the [0.0, 1.0] range where possible. If we go out of that range, then
> > we have to define how a LUT would apply in a sensible way.

In my last reply I mentioned a static (but actually programmable) LUT that is
typically used to convert FP16 linear pixels to fixed point PQ before handing
them to the scaler and tone mapping operator. You're actually right that it
indexes in the fixed point [0.0, 1.0] range for the reasons you describe, but
because the input pixels are expected to be FP16 in the [0.0, 125.0] range, it
applies a non-programmable 1/125.0 normalization factor first.

In this case, you could think of the LUT as indexing on [0.0, 125.0], but as you
point out there would need to be some way to describe that. Maybe we actually
need a fractional multiplier / divider color op. NVIDIA pipes that include this
LUT would need to include a mandatory 1/125.0 factor immediately prior to the
LUT, then LUT can continue assuming a range of [0.0, 1.0].

Assuming you are using the hardware in a conventional way, specifying a
multiplier of 1.0 after the "degamma" LUT would then map to the 80-nit PQ range
after the static (but actually programmable) PQ LUT, whereas specifying a
multiplier of 125.0 would map to the 10,000-nit PQ range, which is what we want.
I guess it's kind of messy, but the effect would be that color ops other than
multipliers/dividers would still be in the [0.0, 1.0] domain, and any multiplier
that exceeds that range would have to be normalized by a divider before any
other color op.

> >
> > Many TFs are intended to be defined only on [0.0, 1.0] -> [0.0, 1.0].
> > Some curves, like power 2.2, have a mathematical form that naturally
> > extends outside of that range. Power 2.2 generalizes to >1.0 input
> > values as is, but not for negative input values. If needed for negative
> > input values, it is common to use y = -TF(-x) for x < 0 mirroring.
> >
> > scRGB is the prime example that intentionally uses negative channel
> > values. We can also have negative channel values with limited
> > quantization range, sometimes even intentionally (xvYCC chroma, or
> > PLUGE test sub-blacks). Out-of-unit-range values can also appear as a
> > side-effect of signal processing, and they should not get clipped
> > prematurely. This is a challenge for colorops that fundamentally cannot
> > handle out-of-unit-range values.
> >
> > There are various workarounds. scRGB colorimetry can be converted into
> > BT.2020 primaries for example, to avoid saturation induced negative
> > values. Limited quantization range signal could be processed as-is,
> > meaning that the limited range is mapped to [16.0/255, 235.0/255]
> > instead of [0.0, 1.0] or so. But then, we have a complication with
> > transfer functions.
> >
> > > I think a multiplier color op solves all of these issues. Named curves and
> > > custom 1D LUTs would by default assume a max FP16 value of 1.0, which would then
> > > be adjusted by the multiplier.
> >
> > Pretty much.
> >
> > > For 80 nit SDR content, set it to 1, for 400
> > > nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc.
> >
> > That I think is a another story.
> >
> > > > > >>> +
> > > > > >>> +    /* custom 4k entry 1D LUT */
> > > > > >>> +    Color operation 52
> > > > > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
> > > > > >>> +    ├─ "BYPASS": bool {true, false}
> > > > > >>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> > > > > >>> +    ├─ "LUT_1D": blob
> > > > > >>> +    └─ "NEXT": immutable color operation ID = 0
> > > > > >
> > > > > > ...
> > > > > >
> > > > > >>> +Driver Forward/Backward Compatibility
> > > > > >>> +=====================================
> > > > > >>> +
> > > > > >>> +As this is uAPI drivers can't regress color pipelines that have been
> > > > > >>> +introduced for a given HW generation. New HW generations are free to
> > > > > >>> +abandon color pipelines advertised for previous generations.
> > > > > >>> +Nevertheless, it can be beneficial to carry support for existing color
> > > > > >>> +pipelines forward as those will likely already have support in DRM
> > > > > >>> +clients.
> > > > > >>> +
> > > > > >>> +Introducing new colorops to a pipeline is fine, as long as they can be
> > > > > >>> +disabled or are purely informational. DRM clients implementing support
> > > > > >>> +for the pipeline can always skip unknown properties as long as they can
> > > > > >>> +be confident that doing so will not cause unexpected results.
> > > > > >>> +
> > > > > >>> +If a new colorop doesn't fall into one of the above categories
> > > > > >>> +(bypassable or informational) the modified pipeline would be unusable
> > > > > >>> +for user space. In this case a new pipeline should be defined.
> > > > > >>
> > > > > >> How can user space detect an informational element? Should we just add a
> > > > > >> BYPASS property to informational elements, make it read only and set to
> > > > > >> true maybe? Or something more descriptive?
> > > > > >
> > > > > > Read-only BYPASS set to true would be fine by me, I guess.
> > > > > >
> > > > >
> > > > > Don't you mean set to false? An informational element will always do
> > > > > something, so it can't be bypassed.
> > > >
> > > > Yeah, this is why we need a definition. I understand "informational" to
> > > > not change pixel values in any way. Previously I had some weird idea
> > > > that scaling doesn't alter color, but of course it may.
> > >
> > > On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
> > > implicit fixed-point to FP16 conversions, and vice versa.
> >
> > Above, I claimed that the UAPI should be defined in nominal
> > floating-point values, but I wonder, would that work? Would we need to
> > have explicit colorops for converting from raw pixel data values into
> > nominal floating-point in the UAPI?

Yeah, I think something like that is needed, or another solution as discussed
below. Even if we define the UAPI in terms of floating point, the actual
underlying pixel format needs to match the expectations of each stage as it
flows through the pipe.

> >
> > > For example, the "degamma" LUT towards the beginning of the pipeline implicitly
> > > converts from fixed point to FP16, and some of the following operations expect
> > > to operate in FP16. As such, if you have a fixed point input and don't bypass
> > > those following operations, you *must not* bypass the LUT, even if you are
> > > otherwise just programming it with the identity. Conversely, if you have a
> > > floating point input, you *must* bypass the LUT.
> >
> > Interesting. Since the color pipeline is not(?) meant to replace pixel
> > format definitions which already make the difference between fixed and
> > floating point, wouldn't this little detail need to be taken care of by
> > the driver under the hood?

We could take care of it under the hood in the case where the pixel format is
fixed point but the "degamma" LUT is bypassed, simply by programming it with the
identity to allow for the conversion to take place. But when the pixel format is
FP16 and the "degamma" LUT is *not* bypassed, we would need to either ignore the
LUT (bad) or fail the atomic commit. That's why we need some way to communicate
the restriction to the client, otherwise they are left guessing why the atomic
commit failed.

> >
> > What if I want to use degamma colorop with a floating-point
> > framebuffer? Simply not possible on this hardware?

Right, it's not possible. The "degamma" LUT always does an implicit conversion
from fixed point to FP16, so if the pixel format is already FP16 it isn't
usable. However, the aforementioned static (actually programmable) LUT that
follows the "degamma" LUT expects FP16 pixels, so you could still use that to do
some kind of transformation. That's actually a good example of a novel use that
justifies compositors being able to program it.

> >
> > > Could informational elements and allowing the exclusion of the BYPASS property
> > > be used to convey this information to the client?  For example, we could expose
> > > one pipeline with the LUT exposed with read-only BYPASS set to false, and
> > > sandwich it with informational "Fixed Point" and "FP16" elements to accommodate
> > > fixed point input. Then, expose another pipeline with the LUT missing, and an
> > > informational "FP16" element in its place to accommodate floating point input.
> > >
> > > That's just an example; we also have other operations in the pipeline that do
> > > similar implicit conversions. In these cases we don't want the operations to be
> > > bypassed individually, so instead we would expose them as mandatory in some
> > > pipelines and missing in others, with informational elements to help inform the
> > > client of which to choose. Is that acceptable under the current proposal?
> > >
> > > Note that in this case, the information just has to do with what format the
> > > pixels should be in, it doesn't correspond to any specific operation. So, I'm
> > > not sure that BYPASS has any meaning for informational elements in this context.
> >
> > Very good questions. Do we have to expose those conversions in the UAPI
> > to make things work for this hardware? Meaning that we cannot assume all
> > colorops work in nominal floating-point from userspace perspective
> > (perhaps with varying degrees of precision).
> 
> I had this in my original proposal I think (maybe I only thought about
> it, not sure).
> 
> We really should figure this one out. Can we get away with normalized
> [0,1] fp as a user space abstraction or not?

I think the conversion needs to be exposed at least just the one time at the
beginning alongside the "degamma" LUT, since the choice is influenced an outside
factor (the input pixel format). There are subsequent intermediate conversions
as well, but that's only an issue if we allow the relevant color ops to be
bypassed individually. If we expose a multitude of pipes where the relevant ops
are either missing or mandatory in unison, we can avoid mismatched pixel formats
while maintaining the illusion of a pipe that operates entirely in floating
point.

Or, pipes could just have explicit associated input pixel format(s). The above
technique of exposing multiple pipes instead of bypassing color ops individually
would still work, and clients would just have to choose a pipe that matches the
input pixel format. That way, the actual color ops themselves could still be
defined in terms of normalized [0.0, 1.0] floating point (multipliers/dividers
excepted), and clients can continue thinking in terms of that after making the
initial selection.

> 
> >
> > > > > > I think we also need a definition of "informational".
> > > > > >
> > > > > > Counter-example 1: a colorop that represents a non-configurable
> > > > >
> > > > > Not sure what's "counter" for these examples?
> > > > >
> > > > > > YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> > > > > > format. It cannot be set to bypass, it cannot be configured, and it
> > > > > > will alter color values.
> > >
> > > Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
> > > no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
> > > based on the principle that read-only blobs could be used to express some static
> > > pipeline elements without the need to define a new type, but got mixed opinions.
> > > I think this demonstrates the principle further, as clients could detect this
> > > programmatically instead of having to special-case the informational element.
> >
> 
> I'm all for exposing fixed color ops but I suspect that most of those
> follow some standard and in those cases instead of exposing the matrix
> values one should prefer to expose a named matrix (e.g. BT.601, BT.709,
> BT.2020).
> 
> As a general rule: always expose the highest level description. Going
> from a name to exact values is trivial, going from values to a name is
> much harder.

Good point. It would need to be a conversion between any two defined color
spaces e.g. BT.709-to-BT.2020, hence why it's much harder to go backwards.

> > If the blob depends on the pixel format (i.e. the driver automatically
> > chooses a different blob per pixel format), then I think we would need
> > to expose all the blobs and how they correspond to pixel formats.
> > Otherwise ok, I guess.
> >
> > However, do we want or need to make a color pipeline or colorop
> > conditional on pixel formats? For example, if you use a YUV 4:2:0 type
> > of pixel format, then you must use this pipeline and not any other. Or
> > floating-point type of pixel format. I did not anticipate this before,
> > I assumed that all color pipelines and colorops are independent of the
> > framebuffer pixel format. A specific colorop might have a property that
> > needs to agree with the framebuffer pixel format, but I didn't expect
> > further limitations.
> 
> We could simply fail commits when the pipeline and pixel format don't
> work together. We'll probably need some kind of ingress no-op node
> anyway and maybe could list pixel formats there if required to make it
> easier to find a working configuration.

Yeah, we could, but having to figure that out through trial and error would be
unfortunate. Per above, it might be easiest to just tag pipelines with a pixel
format instead of trying to include the pixel format conversion as a color op.

> > "Without the need to define a new type" is something I think we need to
> > consider case by case. I have a hard time giving a general opinion.
> >
> > > > > >
> > > > > > Counter-example 2: image size scaling colorop. It might not be
> > > > > > configurable, it is controlled by the plane CRTC_* and SRC_*
> > > > > > properties. You still need to understand what it does, so you can
> > > > > > arrange the scaling to work correctly. (Do not want to scale an image
> > > > > > with PQ-encoded values as Josh demonstrated in XDC.)
> > > > > >
> > > > >
> > > > > IMO the position of the scaling operation is the thing that's important
> > > > > here as the color pipeline won't define scaling properties.
> > >
> > > I agree that blending should ideally be done in linear space, and I remember
> > > that from Josh's presentation at XDC, but I don't recall the same being said for
> > > scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
> > > pipeline that is meant to be in PQ space (more on this below), and that was
> > > found to achieve better results at HDR/SDR boundaries. Of course, this only
> > > bolsters the argument that it would be helpful to have an informational "scaler"
> > > element to understand at which stage scaling takes place.
> >
> > Both blending and scaling are fundamentally the same operation: you
> > have two or more source colors (pixels), and you want to compute a
> > weighted average of them following what happens in nature, that is,
> > physics, as that is what humans are used to.
> >
> > Both blending and scaling will suffer from the same problems if the
> > operation is performed on not light-linear values. The result of the
> > weighted average does not correspond to physics.
> >
> > The problem may be hard to observe with natural imagery, but Josh's
> > example shows it very clearly. Maybe that effect is sometimes useful
> > for some imagery in some use cases, but it is still an accidental
> > side-effect. You might get even better results if you don't rely on
> > accidental side-effects but design a separate operation for the exact
> > goal you have.
> >
> > Mind, by scaling we mean changing image size. Not scaling color values.
> >

Fair enough, but it might not always be a choice given the hardware.

> > > > > > Counter-example 3: image sampling colorop. Averages FB originated color
> > > > > > values to produce a color sample. Again do not want to do this with
> > > > > > PQ-encoded values.
> > > > > >
> > > > >
> > > > > Wouldn't this only happen during a scaling op?
> > > >
> > > > There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
> > > > coordinates can be fractional, which makes nearest vs. bilinear
> > > > sampling have a difference even if there is no scaling.
> > > >
> > > > There is also the question of chroma siting with sub-sampled YUV. I
> > > > don't know how that actually works, or how it theoretically should work.
> > >
> > > We have some operations in our pipeline that are intended to be static, i.e. a
> > > static matrix that converts from RGB to LMS, and later another that converts
> > > from LMS to ICtCp. There are even LUTs that are intended to be static,
> > > converting from linear to PQ and vice versa. All of this is because the
> > > pre-blending scaler and tone mapping operator are intended to operate in ICtCp
> > > PQ space. Although the stated LUTs and matrices are intended to be static, they
> > > are actually programmable. In offline discussions, it was indicated that it
> > > would be helpful to actually expose the programmability, as opposed to exposing
> > > them as non-bypassable blocks, as some compositors may have novel uses for them.
> >
> > Correct. Doing tone-mapping in ICtCp etc. are already policy that
> > userspace might or might not agree with.
> >
> > Exposing static colorops will help usages that adhere to current
> > prevalent standards around very specific use cases. There may be
> > millions of devices needing exactly that processing in their usage, but
> > it is also quite limiting in what one can do with the hardware.
> >
> > > Despite being programmable, the LUTs are updated in a manner that is less
> > > efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
> > > if there was some way to tag operations according to their performance,
> > > for example so that clients can prefer a high performance one when they
> > > intend to do an animated transition? I recall from the XDC HDR workshop
> > > that this is also an issue with AMD's 3DLUT, where updates can be too
> > > slow to animate.
> >
> > I can certainly see such information being useful, but then we need to
> > somehow quantize the performance.

Right, which wouldn't even necessarily be universal, could depend on the given
host, GPU, etc. It could just be a relative performance indication, to give an
order of preference. That wouldn't tell you if it can or can't be animated, but
when choosing between two LUTs to animate you could prefer the higher
performance one.

> >
> > What I was left puzzled about after the XDC workshop is that is it
> > possible to pre-load configurations in the background (slow), and then
> > quickly switch between them? Hardware-wise I mean.

This works fine for our "fast" LUTs, you just point them to a surface in video
memory and they flip to it. You could keep multiple surfaces around and flip
between them without having to reprogram them in software. We can easily do that
with enumerated curves, populating them when the driver initializes instead of
waiting for the client to request them. You can even point multiple hardware
LUTs to the same video memory surface, if they need the same curve.

> 
> We could define that pipelines with a lower ID are to be preferred over
> higher IDs.

Sure, but this isn't just an issue with a pipeline as a whole, but the
individual elements within it and how to use them in a given context.

> 
> The issue is that if programming a pipeline becomes too slow to be
> useful it probably should just not be made available to user space.

It's not that programming the pipeline is overall too slow. The LUTs we have
that are relatively slow to program are meant to be set infrequently, or even
just once, to allow the scaler and tone mapping operator to operate in fixed
point PQ space. You might still want the tone mapper, so you would choose a
pipeline that includes them, but when it comes to e.g. animating a night light,
you would want to choose a different LUT for that purpose.

> 
> The prepare-commit idea for blob properties would help to make the
> pipelines usable again, but until then it's probably a good idea to just
> not expose those pipelines.

The prepare-commit idea actually wouldn't work for these LUTs, because they are
programmed using methods instead of pointing them to a surface. I'm actually not
sure how slow it actually is, would need to benchmark it. I think not exposing
them at all would be overkill, since it would mean you can't use the preblending
scaler or tonemapper, and animation isn't necessary for that.

The AMD 3DLUT is another example of a LUT that is slow to update, and it would
obviously be a major loss if that wasn't exposed. There just needs to be some
way for clients to know if they are going to kill performance by trying to
change it every frame.

Thanks,
Alex

> 
> >
> >
> > Thanks,
> > pq
> 
> 
> 
--1372433909-1794530197-1698348351=:882772--
