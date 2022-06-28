Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF3255EDE1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 21:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFED610E867;
	Tue, 28 Jun 2022 19:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F59810E84D;
 Tue, 28 Jun 2022 19:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeBpEe+28CHGACBphTUmAH/LlldN9DxHvnvjw1BSL/EbXdfOQlkN4EM/OhoFUWQTzGFcFIHNObeBHDDzryJXZbA/ivTWybcEk4518NVfn5Rfsz9enFwyhkU511q21Mk4RNe0jxUp/2EOsARPHHSeVY4XQVBOYgcdya8CdAncPCAlB4yjfUNHiSobkDd4iiJp2KVOYrIy4/EBthBOOIBmOdeMRfuPipm7uHZnO+Z7jZi8nTogn+J6efZ83bsOFzTMCBhi4hbMGLCH3ZZEK+ZpEQ2syW8gYj5KMugRLw58NZ2hsxJkfW+146Z29zlSm0YKvGRqhlp8sARCgO89e3Cu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS33b1Jd4c7hYYfGxkbaFPHTbSEJd2FTYQ3gjfn+gZM=;
 b=lZAZzIYhY59p61CggAXpsdTDSyAq8GIVfA1EGz8VQM703gpT02iYUq8FuMscxmTv7ucaqDT1XfE5dt9hIZDXTgYKMIZLZSMwKxr6Jiv5gqLXdbnpgmGhjDIQWUNSvU8SnIWMxivO37dZKNUewt3uIJpdremGNLt6Y4guXqoWw+mytFbVG2VFeG2P93U3lUT3iC2PpUa677eGXvl/YsybikAfeKXDlLnOhhnMsWfzmYNx+CcLshQ4ap+/JEmyFw8bLQMPQg9MI2wEJiMgcOn0Fvx/sjXxnOC73xOXl2lt5yqWI7QF2HhxWpGfXgUn8BDk3xdkCOhBCHZZamwbGUY7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS33b1Jd4c7hYYfGxkbaFPHTbSEJd2FTYQ3gjfn+gZM=;
 b=XGjBNnfeN/yEGeou2f3XzphFfQdFyBrMccolK7ZwXE2YaqEpoezN1HXrfeSi8k83efdAhca3ycI/IrFAgIiRhuONzw6ilvB164w1HZWeUjYJw+sHpPh+9iRtZohYetbQlG8TpPGmJAmhX5kg5/LdhzR6AisK6PY0yQVRmhLrSY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB3068.namprd12.prod.outlook.com (2603:10b6:5:3e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 19:41:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 19:41:40 +0000
Message-ID: <cea3a10e-7203-5345-bc3f-8832b5451de1@amd.com>
Date: Tue, 28 Jun 2022 15:41:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Melissa Wen <mwen@igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com> <Yrmf+mWk13qkcsfs@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Yrmf+mWk13qkcsfs@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c7d133a-9d20-493f-13d3-08da593e3896
X-MS-TrafficTypeDiagnostic: DM6PR12MB3068:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9OwxobJv/d7Uisa5036sLODXYepGt7QrfSIkDJ7W3m7Apwb5przL+bhoPr9+hK+dQW0VDt18qWZEegRKEU+EHW7SL3G5YMF4pX3gOtwBNck+/kLI+fzmFlQQkXGG72O4Mzo+v+ca7EBKhdQ2jS+zAPvSOVsNjJh21T3WOIw8ZT3QGCC5wgAYrkxvYHR6hkfEHJx1O2/PFUmORI++0ytgz8oCJfIw5xutEmx/milPX+VitiDifyn0rt3emci1a8qeVgC68FDlfUCDV5yehRhgVbajtEosMIObsDscaeJA6ymAqwBOXRSnrveM8T9cQuI4QLhWD3Xjupx43Aj550DP+5NssOMbSBe28e+YsNKsZvyPfzpKEkFwC6FS65YPvL/OzwF5fVPJPt7Deant/HZRdTUK//wnT8/OYMq9LL8nVIYSf14QytNa1m9EFXczvC8j3Wm2BxrMB/PwCwYXAINuj+tnmJJtCic/OAx7PiFytB3gBc28PFU2/YTE2SBAXqkYRRGwxzLvLyJDObhzIgvRhjyrLahkQIu7/oDakoiSULOytTlPTug/YDRXqotOLkL++NBnCCl8tIKpaOLblfbAX60/6KnkPQys6lxoQQ6xHNvEeJTEHPnB+GIFcmNma1LIaafVqFf8XHsyoC9Zf+3wOrAhH+F3HBxXT5j0oU7R6zDcBKR4psUmwxCGm1EltaZf2gZqM6zcNip1m0mp8PZ1OY9+U0KoBL2THpocQdrkJudwAfdHAQ0uiqW8L7SJLh1ojw6h/oSGIP9WSQWmxVDjXYM5Xmo0h/GRiyAJfyUMfB6MS15c3toRLjHMfZB9WcUhJMNO5ThfgqBKO7gtBNBL6OC71vC1zwj7Tf7lgqRAQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(44832011)(4326008)(8676002)(966005)(66556008)(66476007)(66946007)(8936002)(36756003)(26005)(478600001)(5660300002)(7416002)(6512007)(6486002)(86362001)(110136005)(186003)(316002)(83380400001)(31686004)(6506007)(38100700002)(41300700001)(6666004)(2616005)(31696002)(2906002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnF3amJMVUtqQzRMb1Q3UllCSXMvaUhCT2NTNVBCY3BmaVU1NlU2dFQwWW1B?=
 =?utf-8?B?VVFuOHdLWS9KeGRoUzVuQytjRlBLaXhSQ09oRjNnampRUy9WcWs5QTJ5WnpU?=
 =?utf-8?B?MDZkUEVDRU16Z0dJa1VFcWdLeU1PZVRxZVVrY3RWUFNWaG5mdFFNc04zYXR0?=
 =?utf-8?B?Q3c4Tmd2VXUxUTFNYlFDb2IyaFpTYk9WakNaVVhRVWRDcGhIWmhHM05ud3g5?=
 =?utf-8?B?b3RPUXJHdjFqOFpqL05DVklxeHExWHhhZCtzSVlBMXMxRXN2aFZmRG1XUWRS?=
 =?utf-8?B?Zm5NS1llajhrd0FJMXVWbUdEUENud1FtdTAzYUJwRjlVQVdtVGhoQVlpZWpU?=
 =?utf-8?B?bmJhb0J3S0hCdDgybE4rYXRhcldEdzN1d29sUnFkdlgrSENjTGVFem04SnpR?=
 =?utf-8?B?RHVoSlRKaDl4cSt0d3RLelNXSExpZUhmclY1ek83a2NLZDdvS0hmU0NjTUpu?=
 =?utf-8?B?aG9sRVltazRCVzQzbGxCVUdCcng0UGtBdEJmdmxWcFNySk14dUtTYkJlWHlU?=
 =?utf-8?B?RXNKUE01MVdBV2ppMURSc1lDZzgwZDZnQUNmckZ3L2hlWm1NZDdHeHlwTkNN?=
 =?utf-8?B?bnFPRTRPcWxnd25SRnd0Y2FMM2tEeW1XR20vQXdBK05pSDBFbCtDVExZV3JL?=
 =?utf-8?B?NmtJT0w5ZVRZRGhFRkZTV1pKUXZqSGlBamhkVm04akl1WEN0M2lVV3RUUEto?=
 =?utf-8?B?YStpbGdJVUtIY2lPTFRyeDNYcURYenZFbmFycjl3VkxLSVVDcHNiMHNDN2dt?=
 =?utf-8?B?cnVhNXJSckNOYXc5elJDMCtVMjlocFY2M3RtM2VzRSs1bG4wWDJWM2dDQU53?=
 =?utf-8?B?OXRqbEhna1lNUW1icmxsRXI5eldlRjl5YlZXdGFKRjNOR2xKaVVBaFJrOFVS?=
 =?utf-8?B?WVFBN1NlU0NJKzhYTVRneVd1S1IzTHVlN0dpamVjbW05alNKMGQ4ZVd6ZHZo?=
 =?utf-8?B?cUx0akZRekZuanBCdkpMbmZFamk2TjliR2FUNitrbFdoMzlNYy9tVlM4V0Ju?=
 =?utf-8?B?NDNjTnU4eGVFdlJGUHptUzV5eVVQeFBhV2plMWsxMUNUWGxDd1I4NENRSjMz?=
 =?utf-8?B?cDJJMHBhanVBNkZjR3k1L01WWC96K09mNy9peFJFVlhHaGJkQ2xYUmJNRHcw?=
 =?utf-8?B?ZnZUS2NHaGVvMTNGRTU0UnJENlV6ZEU3Z1F1YnlCWks3Wk5DeWMyZUF5Y3I2?=
 =?utf-8?B?Z3FIQThJOVI4UkNLZmRzYjhjdURPTjVOVG9jSjRCR2JMbE5pRnZlTlFxeTJD?=
 =?utf-8?B?SUNBTG94eXVkc2kySUUxSVdyQzhpMVczM21pek9ubU5mLzZYM29CQlU3VmVJ?=
 =?utf-8?B?aUJGbVFWSzl0ZkJpVFRDenk4YmU1Q1BIUFZKMGwyNUFKOHdUaW41OFRwVXlo?=
 =?utf-8?B?am1xSTJZdlhQb2IrRnIzN09BQkVaUlVLSU1neTFKbThhckJlK0tNRW4wdFow?=
 =?utf-8?B?M0tuMllpZk4rRXcrVHVFQkhWRjQ5NnBCakxLMElXR1ZSV1RoQ2NsQlNJKysv?=
 =?utf-8?B?YUJEL3AvdG5URTdJdm9TdnlsN2k1V0ZtZXFwYzdtNUhsZ2cycHZvSEpwejZw?=
 =?utf-8?B?bGUyT1ZIbmJ2akpnUlJrNjZEWFNlUjZKOG5YS2RyWHQvSzJCamsvVE5CR3Az?=
 =?utf-8?B?U1VBTThaV1RZMzErU3FvNEZuQUY4NmJkbDVjaVdSRnFFcHIvbUhiSXpuVW9Q?=
 =?utf-8?B?RTJEai9ZL09IdnZMc0ZkbWcxanY2d21qaXFGbWxSQi8wVlI3WUxnR0hReWpE?=
 =?utf-8?B?RmpBR09QME0wNFduM2FWNlp1YXQ5TkhTZi9xcW5zRzkra29PaSs5V0wvSFhk?=
 =?utf-8?B?UXJDVWlnWTEreGJISlFZWS96bTRuSzZxVFg2bFphdEwyQnhtUG5QQnRsVnNs?=
 =?utf-8?B?aWM3czJITXRnSWpmai85ZkRDaSttWnYrVE92VTN6NzVaMlZ3S2VTVUFVekFq?=
 =?utf-8?B?V1VtbXVScDJBS0lOdVdaaVhBOWYxTXR1TGk4VnpQVmYwYlRPQ29EdWMzMDA2?=
 =?utf-8?B?Ris5Z0NldHFMZXJPaklrL3lQUHJIOGpxcEtiNHlYMFdnYzJIRXhYVHo3T3dw?=
 =?utf-8?B?MUFheEFxZVlYSk1qRWljUVZKeHhHTVIrQjZRV2x4OVBQejRXZERMeVBUcmRp?=
 =?utf-8?Q?1C516WC7W89J1TTNyjefBadRe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7d133a-9d20-493f-13d3-08da593e3896
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 19:41:40.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQI6yKmFcrHt/IMBNMIBzu52rwVgOKUCwgETt2UD7Abu15Kr0TPjDTVX6KC+vYe3Jd7GGepD1hkUlg95xgLFWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3068
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, nikola.cornij@amd.com,
 sunpeng.li@amd.com, alex.hung@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, seanpaul@chromium.org, nicholas.kazlauskas@amd.com,
 bhawanpreet.lakha@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-27 08:18, Ville Syrjälä wrote:
> On Sun, Jun 19, 2022 at 09:31:03PM -0100, Melissa Wen wrote:
>> Add 3D LUT for gammar correction using a 3D lookup table.  The position
>> in the color correction pipeline where 3D LUT is applied depends on hw
>> design, being after CTM or gamma. If just after CTM, a shaper lut must
>> be set to shape the content for a non-linear space. That details should
>> be handled by the driver according to its color capabilities.
> 
> I also cooked up a WIP 3D LUT support some time ago for Intel hw:
> https://github.com/vsyrjala/linux/commits/3dlut>> But that dried up due to having no userspace for it.
> 
> I also cooked up some basic igts for it:
> https://patchwork.freedesktop.org/series/90165/>> 
> <snip>
>> + * “LUT3D”:
>> + *	Blob property to set the 3D LUT mapping pixel data after the color
>> + *	transformation matrix and before gamma 1D lut correction.
> 
> On Intel hw the 3DLUT is after the gamma LUT in the pipeline, which is
> where I placed it in my branch.
> 
> There is now some discussion happening about exposing some
> kind of color pipeline description/configuration properties:
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11>> 

After all the discussions about properties to support color management for
HDR and other features it's becoming clear to me that we'll need some color
pipeline description going forward, i.e. something like the one Sebastian
proposed. It's complex but if we're not defining this now we'll be in a pickle
when the next driver implementer goes and finds that their HW looks different
yet again and doesn't match any of the orders we've defined so far.

Harry
