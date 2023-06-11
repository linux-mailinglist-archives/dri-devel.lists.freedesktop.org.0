Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA072B07C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 08:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9E910E091;
	Sun, 11 Jun 2023 06:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435BB10E091
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 06:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E38QpwuHD4jyh5HilCIm/dyp57obyHT4PpcylOPXQznC0XbS0HtTvCuJ9DxpvDO7xb7XMyPp6qF4+PmNhTZggQrShbjKYRxqIreJff5JoSTuZlHk4dYAWWzRsa8GiJFM0cdAbTp9Rrud87IssOO8jCHh/whTIhV56uORKEYLxR1JpzTQRa0Jg1mEa2mRFhQqAuQ4JJKhZ9n9sjpMulZpD1819NX7V+o/R9Y3eMWmIwAVcf6ocq+/BFb5CoQqn6m4MX5G1rtg+Yw0lJjF1eS8M+cfRtcBcYln4adKGtusqIyOzhEPKzX+LJ+/h3ofmz08flmhU87wLn811MaFUL7Kyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N5vSOwC5YUhpRKS2yUqE7r9RJpRidSGSrYwZtTesnw=;
 b=dKTUCFbDNaiF27UhIhdRaWSKQVywODzTmp73P8GT/oRmJtCQFuiDyPmQaoW/x1xaGoL47Qb3WE4VHBaTZPABw8hHB1RpNLmaF4z1Rlsn0QEmrzmk4Og/dlehtlZyYpOvpF637/AMOv0amQC+aJZI3Xia++YU2z34DZ2o6o8g7XzyntOT4YlKNSFKhkjDXVbywQhVb/EILhWjdGis1z0+L0BQHE0lnT81ICjgJqIumwYJ6Htus/y87Sor8SSgIR8GzzRWwCKEyTH6u3yOZ7lhuigmpiVyem++pGGlimbI3exohM0KNGnel90fqOZpjTjzotv3D7zuL3O19Q4e6nq53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N5vSOwC5YUhpRKS2yUqE7r9RJpRidSGSrYwZtTesnw=;
 b=kd6OzZVwgn2j6JB3V5oyZjLJM+8ZeRooVTu6f3PoHweLOkFRK+OFp1WLXGQkzlSZRdXJH3tEXDjndiWvY9BX9HZ63+/QNTvNjIncoT34AgHdzp2sF2eyVHQFVvqURjrUH09y4AXgEAkuX3AkpXNqHiwfgvC4RkkGqHH1Mgre8stkfnC40Rta0H90T2vMn55YpgKA/donXolxkrwly8SOm6vFHUMMBAw3P9gRjp6pYYBS29zapUcNebOYGnOI2goGTjMd83KaxK0F2nNSXkIuLNDeIIcWEt8IQc2L+YQjUSLZB5X2/mwT5f4vkPK8N8ihcjnqkQiuuOkjpMO3pWEE4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Sun, 11 Jun
 2023 06:09:27 +0000
Received: from MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::a029:8008:ffa4:8ef6]) by MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::a029:8008:ffa4:8ef6%7]) with mapi id 15.20.6477.028; Sun, 11 Jun 2023
 06:09:26 +0000
Message-ID: <599cd007-5026-18fa-462f-fc18f9518953@nvidia.com>
Date: Sat, 10 Jun 2023 23:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/edid: Add quirk for OSVR HDK 2.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230609014207.2759720-1-rcampbell@nvidia.com>
 <87y1ktqa75.fsf@intel.com> <09cc666a-bc52-44b3-230c-26dc705c5a56@nvidia.com>
 <87r0qjpyrr.fsf@intel.com>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <87r0qjpyrr.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To MN0PR12MB6150.namprd12.prod.outlook.com
 (2603:10b6:208:3c6::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6150:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 916cc04d-6a78-4491-4da2-08db6a4268e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0aG/oU7/QUV71UlUxIrsQTIPz+krWJZFZEATrvpaMjMtoy/L+KG3qP4waf8Q946cSXTmSsDkMwRhCXRtpG7ZE4cCtUcOCUsudT1KDM4RSyLmLSEtTrCsx5zSv7SaoKUeTOBENap/aR5jPtSvpAKza76Oc2vaLapn/kzcs8RVfmUmLD72FpsMkBafEcfz80GObWd6KWE8Vls/hWsd7lK5HuzVjH3thsM+hPqofEVDgz6JedUgtBbcI/W5189JXO0efpNJJtn2yVcMwrTDCzeZ7v1uIKF+lFEuJkbSq8IYk3Cx5BiHsUD2+4iQGu0rvsxyKxBDoYiNsXasvTK3G5KFctQWIX1J3FBd8V6CYOKEckYlGSPu4DzxqpEUSfPUXPQ31ktkMt0yqiYK9G3o7Atz+jB0C+Cp8ikoBAg/tR6R4VcO8Fyy3Cq2ktVjG7JkUp8cVxFLK/jEt30pFJQ2ZEb/V5B74jxpNbdVQ31GplgA3bKT7L6mYg6Ga4KA28XQCx+HQ8/IzDT7ANCjPxUQt5yq87vtcTTtsGwU+FHaPsdYmL6qgOufueMXN7eV9yQeb+ipVj7gR3/c4pzmsC5x//R7ASsrgR92Rq6y6U8XYs+pI9FtdfvCr/bJ/eHR0DHL/h5YW7IBuxGSiDhqhc5jmdNSgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6150.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(966005)(36756003)(83380400001)(2616005)(38100700002)(31696002)(86362001)(6506007)(53546011)(6512007)(26005)(186003)(2906002)(5660300002)(54906003)(8676002)(8936002)(316002)(41300700001)(31686004)(4326008)(66946007)(66556008)(66476007)(45080400002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtFdHpRc1B0SHNST1FRcDBuV1RQNWU3QjZUczFTYjNGYlpTaDk4NlNOUExp?=
 =?utf-8?B?VVBHdGw2Ymh4ZmJIMUcwVGc2UkZmYW1BVktKTHVVVEpCbG5zanZkMmEweGs2?=
 =?utf-8?B?Wjd3a0NrQmZ1QmFVb3hRYkJOYnBrSno1WkRobElDcjJmUWF2c1RRZjJZcmUz?=
 =?utf-8?B?UExJZE1pMkNGQTllcTZHOU00ZlZYNm5YK1pXaUszdlVYUjA4TStxd3NJQzEv?=
 =?utf-8?B?OXJNbWdmSGVyN2NVTDUzZkllNTRoNVNOQUJiZ3JVS0gxVDlwQnJnMkFNaC96?=
 =?utf-8?B?TFZMcmdTeHBxS2g4RVpLUnpaRldXdXhMODJicml4K09Pek5BdGhXMnN4WFBF?=
 =?utf-8?B?bmpXcEsxU1Y5aHlMN1h2ZElDdkZVaDlQb0c0TnZ3c0JNWndPaHN1dldhaVA5?=
 =?utf-8?B?Rm1zSEJwTW9Sam94NmdObjZwdjQreWtFc3ZyNHlDd2FGSk10MUxkR3ZJc1N4?=
 =?utf-8?B?U3BLbExRZTExblIyaWFnMzMvUDAvaElEbTBMWU5TTnJ2ZEZTMzFiVlFLKzUz?=
 =?utf-8?B?SWtXWHptUncrS3FNMGo5SGtUNkJVdUROaVp1S3daMUdDNWJncm5Cd2ZoSDM4?=
 =?utf-8?B?WVB6UnhzMGtyL1MrZUV0VkZnVmZrU2U4azVLV1JxS3UxeXFpNjNJemJ6Mmdo?=
 =?utf-8?B?WC84K3Rrc0pBVmRBV0M1UnJaeUkvNjRYb3d3M2tWYzJpRVhlSXZxaVg0cEVR?=
 =?utf-8?B?WmRjeXovVndlQzlGOVQ4YzBHaUFJeG44bWMrUlVGQnNBbTBPL2hsa1FQVm1B?=
 =?utf-8?B?NUJhQVRBOCtxTWhudzNOa05CY1hPVnVWS2F6aTY2ZkpaelV6WldOcWVudGo0?=
 =?utf-8?B?MXJPNDQ1RmJ6SUFPM3lMYjBZTGMybGEvTzVHbWVzUk5IdTJadk1nTlVjZkZo?=
 =?utf-8?B?bjZiMXQzSEhuSEFJT01PY1IybG1ESTBmeUIzZmtlSGtyaDY5VmN1UzdSUllB?=
 =?utf-8?B?allaSU92SkxxRmtNQjUxTHQ1K0d2OXI3WkRJOXNxVTNyWGF3bkFUaUlNWHZT?=
 =?utf-8?B?Qk8va2FsR1dacEZOMlM2SFZVMnNpeU1sSThYUWcxZ202eDFKRU9kZXlzVzNE?=
 =?utf-8?B?VHhzQWxWWmxPK2FzS1pHcExuS0tFMUp4azBBNHM5aURlcmR5ZGpyNVgwbmI2?=
 =?utf-8?B?RFVmZjRqamluUHRJSENVVW14K2ROZktNL2tDQnZwNjAvQnQvbzc2bU9ObVM0?=
 =?utf-8?B?RlRUSE5abEozOVhndG5vbEVpdFNrSTNmeGV3ZWJoL0wvN25GV3BZMGZwUURX?=
 =?utf-8?B?cExkejFCVFluN2VFTnliemN0K1d6dU5DM0VqbThBdTlhcFVPMjVBZXFleFFy?=
 =?utf-8?B?Z0pvQU1Bd2VOM0xKcGNqcExTM2JMRUVEZDh3NHVpRmNjQW54SDBJdUFIZ1R5?=
 =?utf-8?B?bDNiUnNFQ1FlMHpNNkdGQmVMOXhZamRTcU1hSGVGbU9jd25QRys4OUlnVGtv?=
 =?utf-8?B?VkgzNUZucjh5N0ZQVU1vaXB1OVBoY0l5Szdtd3BQeFArNDdnZkJaemlFa01O?=
 =?utf-8?B?RVBNQmN4dEM2c3M4bUt3YU1zVW5VMHZMbjU5VTNnY3YzbWl4MC9NaEhUMlQ5?=
 =?utf-8?B?Q2lnbkVLUU5oZ2c5ckF0Z05QSWExa3F2MW0vanEwN0g1MzUvVnpaMkZlaWln?=
 =?utf-8?B?cDZaa0Y0Q0N6TWF5YVdFVEg1VC9RUkhHSGlJME4zVld6VENzQ1JBYnZMUGZt?=
 =?utf-8?B?cXd4TTJ3WlRDT3cvc3RCR3dOSmtsc0hhblNXa1ZsZUg4QXB5cUhvdXgza2tF?=
 =?utf-8?B?WFBMZWZzbkg4V1pyR3Frci9GbjNRSVI1OUtmMDc1cEpscFNWODVWOU5CNGMy?=
 =?utf-8?B?NVRuY1hEYlRTMzhCMGNCS0lja004cmpGdjc3QVB0dWN2NWpaZ3psSmtHOHhw?=
 =?utf-8?B?a1FqZmRZOVpETEE1aVQyT01WdXRFOWx1bE5NQ25aeTVNalVyTnBLVVR0VHlq?=
 =?utf-8?B?WXgxTXE2TTVYRUlZQjVLOU9mWm5vMmtzTXd6WWpzUTRVb1JkVWNIdTdUblJo?=
 =?utf-8?B?bDhDVGJkWmRjczFjNVVXR05iNnd6MGFEaUF4clV3THYxMlQzaHdsSVlwTU5x?=
 =?utf-8?B?WG8ybTh2NGUyaE0ycVBTd3REeXZadzNlTmV5N3lxNmFBbzF1d3VkbUhVVnR6?=
 =?utf-8?Q?swjuMkePZflTLS/0QClN/Xria?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916cc04d-6a78-4491-4da2-08db6a4268e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6150.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2023 06:09:26.4572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oufDu1xUKGEuhd0j1BGIKtpnXId9LHfEMHubMu+BKRtUnBxxfQu78t5BcCsjtArBzUsUp2qBXwRmuqJ0QB9dYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/10/23 00:22, Jani Nikula wrote:
> On Fri, 09 Jun 2023, Ralph Campbell <rcampbell@nvidia.com> wrote:
>> On 6/9/23 02:03, Jani Nikula wrote:
>>> On Thu, 08 Jun 2023, Ralph Campbell <rcampbell@nvidia.com> wrote:
>>>> The OSVR virtual reality headset HDK 2.0 uses a different EDID
>>>> vendor and device identifier than the HDK 1.1 - 1.4 headsets.
>>>> Add the HDK 2.0 vendor and device identifier to the quirks table so
>>>> that window managers do not try to display the desktop screen on the
>>>> headset display.
>>> At some point in time we requested bugs to be filed about quirks, with
>>> EDIDs attached, so we could look at them later, and maybe remove the
>>> quirks.
>>>
>>> The headset non-desktop thing started off as a quirk, but since then
>>> we've added both Microsoft VSDB and DisplayID primary use as ways to
>>> indicate this without quirks.
>>>
>>> BR,
>>> Jani.
>> If you want me to file a bug, I can do that and I have the EDID too.
>> Where would I file it?
> I suppose at https://gitlab.freedesktop.org/drm/misc/-/issues
>
> We should then reference the issue in the commit message (no need to
> resend, this can be added while applying).
>
>> I did see the DisplayID 2.0 code. This headset is no longer being
>> manufactured so updating the EDID is not practical.
> I'm not saying the EDID should be updated, just that we might drop the
> quirk if we find another generic way to identify non-desktops that
> covers the EDID in question.
>
> If the device isn't covered by the existing mechanisms, I'm not opposed
> to merging as-is, with the issue reference added.
>
>
> Thanks,
> Jani.

Thanks, I created issue #30
"OSVR virtual reality headset HDK 2.0 not recognized as a non-desktop display"

>
>>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>>> Tested-by: Ralph Campbell <rcampbell@nvidia.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_edid.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> I don't know how many of these VR headsets are still around but I have a
>>>> working one and I saw and entry for HDK 1.x so I thought it would be good
>>>> to add HDK 2.0.
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>> index 0454da505687..3b8cc1fe05e8 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -230,6 +230,7 @@ static const struct edid_quirk {
>>>>    
>>>>    	/* OSVR HDK and HDK2 VR Headsets */
>>>>    	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
>>>> +	EDID_QUIRK('A', 'O', 'U', 0x1111, EDID_QUIRK_NON_DESKTOP),
>>>>    };
>>>>    
>>>>    /*
