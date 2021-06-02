Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119C399672
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 01:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158046EB11;
	Wed,  2 Jun 2021 23:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDEC6E04E;
 Wed,  2 Jun 2021 23:42:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2QiNkCt2cbZe/zJth6mJoY1AyvQtjUubsxSmIySwdWFTkDIyEt0DUhNQ7AnTqXxj2xWtmAGpzGoW2sO02m9RnWQVYzK9mEKIA5NP2Xfx//zLH4B10He0JRH7ZAG8WF41Iiv2CWMTIS8BB6gYTLYX4fmsR3rx5R4uxHJobtTG7/asrSPqcc+zP19gtXV+2aMqqtymnrRkpboQA+3LHscvF2s8G5fVC0tUN78Al/B9SMTmkShjimI2Fp257NZPcs5ntWMD6Avo6eMtKDEjKLo6wwO71Fyi/CKF3FRQcbEkYJkpVwDr4fEIJf6JojPNYkNKulqa9qgl2TqAOQbkeQ+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yp1phFX2/hzUe7vxhgKk59cZLeDFuhjXBQLLMdLduc=;
 b=GvghCiJD8NvPOor/beL9daEfb+F3JoqCBE/1wwtPrWUnne80Kiit+XQPhJnvmaJce55EQRAs3U0IQPsMOrQprhEaLEu7xBsNvBEGj9ea3l2uJlk9M76bRIKMBVAlWSexyDfqX0BQjLYICuKi+uaxIzRgCO8bZrakRSoRdzDVBc17mmE3NMPLajB5vs+UycgXopfDUAQ+6ePQwMN5Bjm38ALqNSnoMnHxEpH1QmAwQVGP/d7V36l21zF14SPBzVPDK70Z9TJ4PymbKeJm8kP79pQ8/EfDg7tEyYDqoxhBI7SxnARaHGpg/Q0lH7zZufilgrlXddxHSjHnKIYX64/ofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yp1phFX2/hzUe7vxhgKk59cZLeDFuhjXBQLLMdLduc=;
 b=Jdtu9z9n1McMxoSncL8s1tNFXTLiFyO2kgZy8qJJQKEUXOxqXWLSqDh62ZwC82FihRyDZeee/SiAbl0igL4+GAYvhEhOrKPQ55cN+1mQdPQkw4jtmrkZSlmdqZaZkRj4GnrwPIqArN7ql2i2kmORBmMqUUfsbZxbhMCtMUyZ5CE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 23:42:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 23:42:24 +0000
Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210602122850.29412a29@eldfell>
 <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <95e6a3e9-70d2-42d3-1289-a7de33f266c4@amd.com>
Date: Wed, 2 Jun 2021 19:42:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26 via Frontend
 Transport; Wed, 2 Jun 2021 23:42:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8767cf-1722-49d8-5cb7-08d926201277
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54750E22DBE5673B15AA1CE58C3D9@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dn20pd6JqZbXiJisu36U0LD7I5dC4erSrB1XBvbM1hCBfgmB6FXJ0I/y0x+UlfKvbaBYcHlkdMWm/cJF7o4ri9A3OCQYttn0ejBevGYypOiov4Jvg60CFKJkDHTtQM65pnz0C+NLwmXxkcMSmoW/7ka3QGeKDNIGLz78tEPzCyCcFiXNYRj5zcklKn5hY9CEE60RxtL5HedIACtpt1hyacTlZ7ETVLf6xg4AFTh8Vc1Eo1e2b9QXyT1GDnx6keOj9TKJsR3LFxGNFbIdqd+ddUB6sNLDi2LvJ5iH1kkEPOlTFQqNSlpC/dZ3u44wK991joim9pj1VjiggIfWXtT+aPjlgljsODnIkfEEii78IA0nemCbHV/nJ5RH7uYn/S69aJzvpawKtbicHkfwPriL8A2KrB51MIzAwcWg1EVYUIMJ9pYncl3Sj54TwAnNoBLtKCoV/zFEUvWtX8qNfUlhooJEnoluJb9mVo7QrGGyO/yKLjhJ6uDnmrzh7+EBlFny+tfr7qoLuwO/Z2WFR3Kpf2ux0ANwMM9GsPgw1hVxQPsEIu5iP80IZoMkb/DlooT4LMDM6nGJlnqZbsPrvgWm2YRQGwom1KP1i7Rk9MzdviiVBWqf2crQUmir8z76rjyfiKC1Fy1FC7MnXu4xVPyH5Nd2F9s01spRSn+LBuWbzxWxYLB0i+K/VwooNfA6RbyJDiYQNYuJmlXkqgbzlbow+hOcNR3ETrT2CrUJV+QJfcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(2906002)(36756003)(316002)(110136005)(54906003)(16576012)(83380400001)(5660300002)(66556008)(31686004)(66476007)(66946007)(53546011)(16526019)(8676002)(186003)(6486002)(8936002)(38100700002)(966005)(31696002)(478600001)(4326008)(2616005)(86362001)(6666004)(44832011)(26005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aP9D/3BSS7btNG1nubqK2WU72oArGMvQRosSJpcjY0Bu3nEp5KUeELR1Mjclu0gcbsfyXBdIf8CItmUtXUJzYxgZmGKadoqxhKAA8TsGK6rf79f/SiEWeUwbcy9/8s5T/g3LYYjA3zPouJksPHnnQq9/zDv/GxJFveRuQVYp8p/C1wpil7ee84AbDAMD7oZKd9LoUgGNP/As2idQ8cY/IFyiQK08iVbUR8YLe89AbA+pc4wskzpNVQ/MJFcQI8tLniWZe2MWQZzUrQiTDQRbYT+ft73iD7v1qWTaqUqRZV3JUri2OYulPPGjFU6bQmayC6LpbcvLVeUg0Iod33ZNS3mOVj1cDw9i2voVkFyDE2cS8BsooKYeRJ0ivHeMNAeiGERzgsTJ9odT7vjYyOlvD1fdK7HBrCvpbsZXnVuLfUOHGHsSotyPSh4RYrOVP7/hr5I/Mg+Elh//EFTAJC50s9+x+uBg1QdBNXwoOh4DnXaptTXEYW3e72hq1/FQWiqrrFU7P8yU6ku5YAV1gOPryiEGpzeECb8dqkslzxt69I0Oy42UA7a/IStIQNYQR6iPxnsTaVCnNkVfa0dK3YqgeV8l/3U9YJXsUPU42D60l0biszR0jX8EPmLIPcFVKBV5tRpXz3WN92/B5JLpLO29VIGemuQ5yrv64v1+uaF953XzkYw+egDEXCETl6AgCfmAZjoSu0iN70jNCwjQXJ0YhLzIBzhlTYi2jKYoDJfFuj4clDYTN9yWVD90E/l93SGW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8767cf-1722-49d8-5cb7-08d926201277
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 23:42:24.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL5Bb1v+OQpnMK0dEEyRRUPsmmI5s8pUOaQfYZtDJoJnDR/I6Igz1gcGZTikWiUBTgBeONRl5o+X6peJ4tiR/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-06-02 4:22 p.m., Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Pekka Paalanen <ppaalanen@gmail.com>
>> Sent: Wednesday, June 2, 2021 2:59 PM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Modem,
>> Bhanuprakash <bhanuprakash.modem@intel.com>; Harry Wentland
>> <harry.wentland@amd.com>
>> Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
>>
>> On Tue,  1 Jun 2021 16:21:57 +0530
>> Uma Shankar <uma.shankar@intel.com> wrote:
>>
>>> This is how a typical display color hardware pipeline looks like:
>>>  +-------------------------------------------+
>>>  |                RAM                        |
>>>  |  +------+    +---------+    +---------+   |
>>>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
>>>  |  +------+    +---------+    +---------+   |
>>>  +-------------------------------------------+
>>>        |  Plane Color Hardware Block |
>>> +--------------------------------------------+
>>>  | +---v-----+   +---v-------+   +---v------+ |
>>>  | | Plane A |   | Plane B   |   | Plane N  | |
>>>  | | DeGamma |   | Degamma   |   | Degamma  | |
>>>  | +---+-----+   +---+-------+   +---+------+ |
>>>  |     |             |               |        |
>>>  | +---v-----+   +---v-------+   +---v------+ |
>>>  | |Plane A  |   | Plane B   |   | Plane N  | |
>>>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
>>>  | +---+-----+   +----+------+   +----+-----+ |
>>>  |     |              |               |       |
>>>  | +---v-----+   +----v------+   +----v-----+ |
>>>  | | Plane A |   | Plane B   |   | Plane N  | |
>>>  | | Gamma   |   | Gamma     |   | Gamma    | |
>>>  | +---+-----+   +----+------+   +----+-----+ |
>>>  |     |              |               |       |
>>>  +--------------------------------------------+
>>> +------v--------------v---------------v-------|
>>> ||                                           ||
>>> ||           Pipe Blender                    ||
>>> +--------------------+------------------------+
>>> |                    |                        |
>>> |        +-----------v----------+             |
>>> |        |  Pipe DeGamma        |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |            Pipe Color  |
>>> |        +-----------v----------+ Hardware    |
>>> |        |  Pipe CSC/CTM        |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |                        |
>>> |        +-----------v----------+             |
>>> |        |  Pipe Gamma          |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |                        |
>>> +---------------------------------------------+
>>>                      |
>>>                      v
>>>                Pipe Output
>>
>> Hi,
>>
>> this is an excellent picture. I have long been wanting schematics like that in the DRM
>> UAPI documentation. Another note on that:
>> https://lists.freedesktop.org/archives/dri-devel/2021-May/307310.html>>>
>> But the schematic for DRM UAPI documentation needs to be written in terms of the
>> abstract KMS pipeline with property names spelled out, like in what Ville sketched in
>> that email.
> 
> Sure Pekka, I can add that.
> 
>>> This patch series adds properties for plane color features. It adds
>>> properties for degamma used to linearize data and CSC used for gamut
>>> conversion. It also includes Gamma support used to again non-linearize
>>> data as per panel supported color space. These can be utilize by user
>>> space to convert planes from one format to another, one color space to
>>> another etc.
>>
>> This is very much welcome!
>>
>> There is also the thread:
>> https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.html>>>
>> Everything mentioned will interact with each other by changing what the abstract
>> KMS pixel pipeline does. I think you and Harry should probably look at each others'
>> suggestions and see how to fit them all into a single abstract KMS pipeline.
>>
>> People are adding new pieces into KMS left and right, and I fear we lose sight of how
>> everything will actually work together when all KMS properties are supposed to be
>> generic and potentially present simultaneously. This is why I would very much like to
>> have that *whole* abstract KMS pipeline documented with *everything*. Otherwise
>> it is coming really hard fast to figure out how generic userspace should use all these
>> KMS properties together.
>>
>> Or if there cannot be a single abstract KMS pipeline, then sure, have multiple, as long
>> as they are documented and how userspace will know which pipeline it is dealing
>> with, and what things are mutually exclusive so we can avoid writing userspace code
>> for combinations that will never exist.
> 
> This is a good suggestion to have the whole pipeline and properties documented along with
> the exact usages. We may end with 2 properties almost doing similar work but needed due to
> underlying hardware, but we can get that properly documented and defined. 
> 
> I will discuss with Harry and Ville as well to define this.
> 

Just wanted to let you know that I've seen and read through both of Shankar's patchsets
and had some thoughts but haven't found the time to respond. I will respond soon.

I very much agree with Pekka. We need to make sure this all plays well together and is
well documented. Maybe a library to deal with DRM KMS color management/HDR would even
be helpful. Not sure yet how I feel about that.

Harry

> Regards,
> Uma Shankar
>>
>> Thanks,
>> pq
>>
>>> Userspace can take smart blending decisions and utilize these hardware
>>> supported plane color features to get accurate color profile. The same
>>> can help in consistent color quality from source to panel taking
>>> advantage of advanced color features in hardware.
>>>
>>> These patches add the property interfaces and enable helper functions.
>>> This series adds Intel's XE_LPD hw specific plane gamma feature. We
>>> can build up and add other platform/hardware specific implementation
>>> on top of this series.
>>>
>>> Credits: Special mention and credits to Ville Syrjala for coming up
>>> with a design for this feature and inputs. This series is based on his
>>> original design and idea.
>>>
>>> Note: Userspace support for this new UAPI will be done on Chrome. We
>>> will notify the list once we have that ready for review.
>>>
>>> ToDo: State readout for this feature will be added next.
>>>
>>> Uma Shankar (21):
>>>   drm: Add Enhanced Gamma and color lut range attributes
>>>   drm: Add Plane Degamma Mode property
>>>   drm: Add Plane Degamma Lut property
>>>   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
>>>   drm/i915/xelpd: Add register definitions for Plane Degamma
>>>   drm/i915/xelpd: Enable plane color features
>>>   drm/i915/xelpd: Add color capabilities of SDR planes
>>>   drm/i915/xelpd: Program Plane Degamma Registers
>>>   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>>>   drm/i915/xelpd: Initialize plane color features
>>>   drm/i915/xelpd: Load plane color luts from atomic flip
>>>   drm: Add Plane CTM property
>>>   drm: Add helper to attach Plane ctm property
>>>   drm/i915/xelpd: Define Plane CSC Registers
>>>   drm/i915/xelpd: Enable Plane CSC
>>>   drm: Add Plane Gamma Mode property
>>>   drm: Add Plane Gamma Lut property
>>>   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
>>>   drm/i915/xelpd: Add register definitions for Plane Gamma
>>>   drm/i915/xelpd: Program Plane Gamma Registers
>>>   drm/i915/xelpd: Enable plane gamma
>>>
>>>  Documentation/gpu/drm-kms.rst                 |  90 +++
>>>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>>>  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
>>>  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
>>>  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
>>>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
>>>  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
>>>  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
>>>  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
>>>  .../drm/i915/display/skl_universal_plane.c    |  15 +-
>>>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>>>  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
>>>  include/drm/drm_mode_object.h                 |   2 +-
>>>  include/drm/drm_plane.h                       |  81 +++
>>>  include/uapi/drm/drm_mode.h                   |  58 ++
>>>  15 files changed, 1170 insertions(+), 6 deletions(-)
>>>
> 

