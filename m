Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347D4B108E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056A810E88C;
	Thu, 10 Feb 2022 14:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24D010E880;
 Thu, 10 Feb 2022 14:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXxmFhgI1zRXeDQiQXaQCJClyZHmPXNNgYjCrXyR0iTAUDArkMgo/tOqjKq8nYv2Rx/hrtEONfJTufi81VyDvRwK1bEMMe0P6a+Nxll3T7ZeaYL3Xax4U+IJ76h4C8mixerrSlev8t7iFAIS7V1YJtjMO5HXyP4n2Nw26jx6q6fUJy7ibeEkbeITYHd/WmZcHrTDBWgdso9S5P28lzoSQeN0nNy6jpnlNN6OA+0z3zQ2bwaAjL7cKb7rV/mkfTDGCT5TQgyJoqM0CYvFW5Mzg3p6pHeUSBUEiR4hSqK16Abj3WFJW71IMeW4+9IebQrahLFWf0vz4sfcRSJiTMgB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+tafHppbJyn9zYoHPkAcKgFXpieZ2SBmR/Wgq1H0z4=;
 b=hfQI3+YqX+9AFRYkd9EZXrKQuOB7pqtU+nKFF1DK3pp4MNDy+K7jxvIR44X01Ai8RXPgkM6zBpDCYSYoFBybutQewBcllCxzUp1U9HYS8wUNt6RUwm/JKM6CttNvqL3wDctDgVFYak8KRloh0zEGFZB7O8CKCRMNoMwLftL632XBhIv/O5dajGZmRf2l325HsacmgYW5RpVDfQWMJcOpyvWN2dz/4pYq/bhRd76pGlFgK0+b8wQ8aA4BjofsIejJ/9a/RKKYRDt+Igg6wWqayqBaNh4WrUtjk9w7/5oqvLbPfFMJZu5kZbHXomszUnyd2Ot+4w0iPXeFLFUUJVEgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+tafHppbJyn9zYoHPkAcKgFXpieZ2SBmR/Wgq1H0z4=;
 b=J7gR3uJFers/YvPqYpY7m5266BdQrlkt411Lc2/HcmSjeYoZaH8t9HYZxVwcfFOlwsrDQN2UHRaC3PeS9I+KieV44sfuUh0hZlD1c+0UUi1loAoXS3g+qHaWxmZYl0c4JO1GBuME7XC+1p/j9icXfIagd6BrSgzwK7hPMzV/+iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN6PR12MB1635.namprd12.prod.outlook.com (2603:10b6:405:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 14:38:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4975.013; Thu, 10 Feb 2022
 14:38:29 +0000
Message-ID: <fc0054aa-77aa-6d0b-b9d7-7a0163e3eb22@amd.com>
Date: Thu, 10 Feb 2022 09:38:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-6-maxime@cerno.tech>
 <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
 <3a9f5ff6-52fd-25f5-2714-8801eba13dab@amd.com>
 <20220210084243.grmjum55qc6sei52@houat>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220210084243.grmjum55qc6sei52@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 629852fd-04e5-471b-aebd-08d9eca300e3
X-MS-TrafficTypeDiagnostic: BN6PR12MB1635:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1635D4CFAD73922AECCB09428C2F9@BN6PR12MB1635.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylhefNuJDpSI1yV3ICS/OTF0WZBLuWqr2hvd5piiIu2yjyq3uo2dts6FPb7QNoBZ+U6CnqM6wkEYcjzYyj9svDiS2RFChqu97f9XiJMUCI8+TmXKAHPPAM37xMrz9Q6gOySuAzXbso9G0MTJw/qwzu+tXnMv/rzDtE8+Y3zDQR3WCokf0qLuYp4lEG4apaCQ1du342QSEZYLqtsNb99oZB+bzm8RQJri/LpHe23YCtVQc+oXEJ3efvCcHs5rSlyUImDSW+InGSS+fr4nY1X2PnQuW0zahMRp83loFAqnwX9Ksi21vbJJWBFSjwvkb+X+UqFMwmp5l6C9Bpr8aPRWMQCUyxjthCJRQZvJdWt8LfoNEQLkL0daIxrHw1qMuRzlqBHu+6lKPjrvB9oW0Pb7m0tUffRyEv+22G3s3Cz9MuxF/zvvFomhZh3DuWdFBHG1o8sFBQuQzOypsoQlz9topdeBTx0IIPrp7LRbCm30//G9nohbRdqL5mmvAZ8sYh6yDVL493v4NPfxmF3M9DaXnslFZE7hBVdNzeqWnSwwFVLrpP26b3DqrjZxwpB1hlXAmKryYTZcDsFMKu/2rvbr17plB2elwmC1hBFW+hSu4y3+7OeOnsD23qxUWkqMr0cDWy34trHkkZ25Lr4rWZ0MkXjhajqse5wF2BIYNtv9d34Je3gEjwM5Ic88qlvAoFGlIN8qCKynriuL4c7pM/Wh4/XDUcbFjADAY6qVa28yKTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(508600001)(6486002)(44832011)(6666004)(7416002)(5660300002)(2906002)(36756003)(6916009)(31696002)(186003)(26005)(66946007)(66476007)(86362001)(66556008)(8676002)(4326008)(316002)(8936002)(54906003)(6512007)(2616005)(38100700002)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJSUlZaZUVUd2ZoMkVxYjg5Yk9rR2pGT1ZSdHNIYXdYQlV2ejQrR3k2ZDlm?=
 =?utf-8?B?NG1sZnJKc0MrV043WDBKNDZMT3ZsSXQwdTBsekhZRXQzL2ZYSEtrRm11Zm1X?=
 =?utf-8?B?cldtQjRCck1VUWxQU0UvUVE5Q0p6cUhobmJWNWcxc2grN0ltZ28xK3M3d2ll?=
 =?utf-8?B?YkJEM1FDR0dMdEZMNTU3K3U4ZmlSQ1pkL1k4d2JuaWVjUjljREhnYTRaRkhC?=
 =?utf-8?B?ZGt4d2tCb3dTU2JlUUtGQzNybDBVdkdVaElpaG9MOFVOQ1Rnck00ajVoNUcx?=
 =?utf-8?B?ZWNlSmpmY2dBS3o4U2haSnBxZk81S3dBWmtzQnBNbWJzc0hqQXVxdFNUdTNj?=
 =?utf-8?B?VGEwb0tPL0F5U0ZtcDM0L0h3MkNEUVNvV1Z5NDV2TXBtU0ticEpZaEQ5OVhE?=
 =?utf-8?B?SHFXZkRqWGFGS040Y1dyS3prbGpwdXFIcVlkckdzK3hvREg4T05Eb2dGM3hG?=
 =?utf-8?B?VEFkMTdpcWp2SEFWMUxZMzdkMmg1RFYvSHdYaEpzSXp4VUxZaWxJemJUTkVQ?=
 =?utf-8?B?VVdOTFBTaXB3aE1vc1RtK1NzWkV4c0hEUm1UKzNac3d6N3pSOUlXNGI4djlG?=
 =?utf-8?B?SDFHcHRUV3kyQXhHWVRBSnRLdlg0RGFoaGRrZVhoTFVpei9adVBkd2ZzZzhx?=
 =?utf-8?B?OVB0TE5nT0NPRUpIWXRhRlFVdDhUSWtnb0lhbzNzejJVaTJ5Q0twRGcwdU9M?=
 =?utf-8?B?QVk3UHo1WnlReTdHZHJMKzUwS3l1ckJxMWV0VHJHNU9WNFZVWWlDNzVYZ3Fr?=
 =?utf-8?B?UStRNkhBdmtZQW4xVytaaWZsSVRHZ0FENk41OXI2Y2NZVnJqeThzOXh3OXQy?=
 =?utf-8?B?QlppSmdzbXg3c3JMaERTVDJEVHg4VWJ2SWh0TGVTclhjblVESDh6UmZRVnVS?=
 =?utf-8?B?RHpMaUJINGNSb2VQMjVKdjV4VndCd25MVCsxU3V3akN0QlVhd01XdUVXSGQ2?=
 =?utf-8?B?T3lvOUlQVlorY0JhbFk3cVFPaHpnSVZoWHdGeW8zN3dZUGlXbEhiOW4yaE1j?=
 =?utf-8?B?cDFjUjZjczhlbUdDNDczUmhGTFA1RVROa2hBSVBkZVN2WkVpWDBpcmExQ240?=
 =?utf-8?B?ekI4OU00bzJEMDlqN29Ta2JFM3pGTkk3ZVJ5VVMxcUh5VHhrZGtBVVVFSDRK?=
 =?utf-8?B?MWRJSmxsWExXOXZ1YVlzVTExUXJuaUoyQ0RxMEJpY1FrUldReDJJSlFmRnM0?=
 =?utf-8?B?R05mdHZtMEJleHlvM3VPVUprWEpveFZHQVl3UXNyY1RQWEVrVXdlOUpUQllw?=
 =?utf-8?B?eXowa0JBYXhXbm5oU01qMis0aXU0Z2RXYUNDckJZUHpmQ0FmbEpFOTBRYnZP?=
 =?utf-8?B?cUVjRVI3cW9EajN5dFZEMXlVWXNVS2thODVSOC9qdUxuRnc1N3hSaEo2YURE?=
 =?utf-8?B?cEEzeG8vcDBNR1lVODlqMnVMQ3VmUi9ZQXNDcExidXd5bzdFdWNIMjc5NXB5?=
 =?utf-8?B?dXQ3QVBCdVU2S29FSnE2OGZOUUVaMVRUY3V4d2ZGZExvYlBGQmVoT0FYU0da?=
 =?utf-8?B?RExGa2licFhQeDc1SGE4SHluU2JNVHZ3VkxYcm90K3FLNDRYVTFXZCtzMU0z?=
 =?utf-8?B?WUNSVEdvTytRUnk0SzlOU3dTcWR5cmxURWNYbGI2bGkvbkw5U2ZmOGN6Tk4z?=
 =?utf-8?B?N050dU8vUTlJYmVyWm9YVGt1YUtieWtMQTl3UmE4b3FHM012UXQ0emUwTEl5?=
 =?utf-8?B?N2RHOVE0YkJ6TVFqcVZpc1pqRm9YOHlwNUtxRHV0Qy9KalpRc3FMdTFmeG5U?=
 =?utf-8?B?NTNLWXJPMXNxVnlwZWptaitCMUl5Z1NTZDdlVlE1cElaR2JNR3Fwb1B4bzhl?=
 =?utf-8?B?cTV5TFNrT3R1ZFE1MHRvK1Y5SVdyQUhVVERqbkcwa3FINW10ajhpVlFVdVNy?=
 =?utf-8?B?b0MrOGRqb3JFZS9SekFGOWhycUpYZndwT1lrazNtL2Y1ZjFNWUJVYzB4MVlM?=
 =?utf-8?B?cGU5Ui9kbjJ0cWN4MWxNQWExdktLZW0zTVQ0U3BsTFRZMHlzenNiQTdYUDdN?=
 =?utf-8?B?a2Rqd2pad0ptSlEvNkV0Q3QzSUxTUm5uazhaQ3gxY1NOYU9sd2hHdGd6c3hx?=
 =?utf-8?B?bENzTVhwR1R3Tm9nY1hNdEpsT0VXR1laMW5QcFBTVnFKaXo3bG1EVjV1Y285?=
 =?utf-8?B?UitKUG82SG5sNml2bmZLVGNUQkFGend0cWFFZFNIL3c1UXNkYkl6SC9lWnQz?=
 =?utf-8?Q?xJLsrRKPEMllFNA4l5H7XDs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629852fd-04e5-471b-aebd-08d9eca300e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:38:29.1505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfMIDU3i0OI9WNKN+2lKQ0yCw7ctr7ChiNhooDsRw2D/SZz7qJIuPXC9K7qr/8YXeQlSMdlpTqt1r6HGnCo/Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1635
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-10 03:42, Maxime Ripard wrote:
> Hi Harry,
> 
> On Mon, Feb 07, 2022 at 01:59:38PM -0500, Harry Wentland wrote:
>> On 2022-02-07 13:57, Harry Wentland wrote:
>>> On 2022-02-07 11:34, Maxime Ripard wrote:
>>>> The amdgpu KMS driver calls drm_plane_create_color_properties() with a
>>>> default encoding set to BT709.
>>>>
>>>> However, the core will ignore it and the driver doesn't force it in its
>>>> plane state reset hook, so the initial value will be 0, which represents
>>>> BT601.
>>>>
>>>
>>> Isn't this a core issue? Should __drm_atomic_helper_plane_state_reset
>>> reset all plane_state members to their properties' default values?
>>>
>>
>> Ah, looks like that's exactly what you do in the later patches, which is
>> perfect. With that, I don't think you'll need this patch anymore.
> 
> Ok, I'll squash it into the patch that removes the reset code.
> 

I don't think that's right. I think we can just drop this patch.
The amdgpu display driver is not doing BT601 by default.

Harry

> Thanks!
> Maxime

