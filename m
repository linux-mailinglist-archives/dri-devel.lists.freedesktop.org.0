Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566955B734B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2410E75B;
	Tue, 13 Sep 2022 15:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9E10E75B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKk15WZm4khirAzxN8qmSG4kIbMrQuqQpFb8qUcFD47z9pnw7tv0FFd1eGSv21vIALhJV0wpagnyReCrjNJey3dVQptzWqvtIzecm7F66rzRgzbl6ZCBG+4w3IMIvB8Ej5LSlD81nUZNCBiDKuk79Rzz+XMPVxxgZ35jedtz3uYRa3/ppNKMLVnITgdIdzR3bFqXiqw6ruDo3bWP5wk1kbAUND17RitvLAOvbZ8SQF1icqlrEVPfnCQSiZwrUKGppP1aLkt1X4jR17w2If/Jxae+rxHttRHzGVBMDeQeW2ayddJweNg7+LGdckX5NLHEGKZb+1sov+HM9fnhKd72tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVBNr466ByekHLR36yryjbA7Qqk+cSc+htCWYOH6O7I=;
 b=TDi1rrnh0r05l6DrHbMG1oZp0L3gcuZxkjUt4y35VVZzPwNrbdpti+dhfmWTh3Fm4nsnPk/xt/imj/xza1pDRDaFFmd4yMTucBJ7PptsW6F4FWLRDX2YHGo6JIUaKz4Ylk/JD5KqlFMn0gb8MAPvfi9Qt3sou4KbR8sbjr42S6nbXrTK06knvKly2gQ/UpOI9j39QE0aMgeYzbdAcVc/G1htsBlGf2b48nswKePQa4GkvAEYntmrwl6PPtJ7YFS2BGvBVja6FyLdyLzsAf/x2aI76wJNU2fD3f1ZkGnwRykrm4Hse3pyU/7bGSUq0wTtxyavMNUywSVssfXPXS2F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVBNr466ByekHLR36yryjbA7Qqk+cSc+htCWYOH6O7I=;
 b=fRX4NDfD3baINBpIulv4/SqNk9IzPV6KCiJdBtgHHH2nnTSNe73TPAXeshgPM7GlrFpS18Uv7fOH3jf4Ewa8T5+7sQD1eiR3IVj594/YW/2CCVOUfbWh04X7IOq/lkSRmx3+PmVzVCsdGPpoauj2+dLHcmJHUWcQIpqwO82uVdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5247.namprd12.prod.outlook.com (2603:10b6:5:39b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Tue, 13 Sep
 2022 15:08:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 15:08:09 +0000
Message-ID: <4d4e7550-4d70-1f0b-0d84-4d700a99d74b@amd.com>
Date: Tue, 13 Sep 2022 11:08:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/plane-helper: Add a
 drm_plane_helper_atomic_check() helper
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220913093339.106625-1-javierm@redhat.com>
 <b81591c4-934c-4b70-fbf0-b0f4663a6d1c@amd.com>
 <2b67dfcc-9027-6bb5-d42b-7465f2236747@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <2b67dfcc-9027-6bb5-d42b-7465f2236747@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 737b7617-676e-4795-4853-08da9599c46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4gG/HDnzaVihxULv/N7tPMM2U+UzZ1TuDTEw1Huhu2fgruKnmwd/W6bRkGc+2aZV0WkGML4c9CFa1t8GDtyaHXgqb6AKxC4L3HVLxZQxXlfKm3lTRsS5H8BJ0W/rjhnMRw6ykJphhUvCdVXdvt6gpZc1AZk9eXvbXjtjQovvIyF9nYLEejaArUSS8GHe9u6VN1YerHHajQur8IW0LV1LBnaMy1j1s4Pb4CAgXrSMFep5F6lUUKxLoEqYXrVAIr1A4+nwuoO225VFvB4bSGJL2yBm5OqAVdTdnkcyPpXi115PoXQd5IdleP7QQEIl5/KmRIuZz0H41nHq29mJFm5qKVQWqVl1efuggJbbYIk+ZKtwfhYKisI+XjUsPvstC4bf7NnyzAyFJn7qChdSs2FtkbmHk4x58gvdmHzeITdQIaHvo/OgrI55lUKRXwjWSfOjNSFzv5ms5r0U06EzkGZAsBgAoRgTJlHZSJhXLpdnZor6fIpoFBFOoWg+ak/4QcvM7FTQqvpMNpXaVbuwEq76fcHIjXhIelKAtPCBasUxZhkKP4VSwRdeKn5LlHJryIfyPIugsSyGOOBuhKDgbfxoe2nWnqhfT0eKCdhD4yIBUu79B5V4WG8BGEYEjjCsFGgGhxm/BKdjPltmDxBoswOTEt4x2VOSDprMEaqW/+rP3IQwvkj0Mok14JY0yGSauLAtlFLR/1ndEbBlrFHHvQdWoprjcHz/Oo+2cG8qvQS5oJh+qgIpJUoVczBecpYwvXUU2kqhGTQBZQkMljKH0evKIIIgjxWAqDwTvpPKywR9u0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199015)(2616005)(66476007)(6506007)(6666004)(31686004)(8676002)(6486002)(2906002)(86362001)(53546011)(36756003)(6512007)(186003)(54906003)(8936002)(31696002)(5660300002)(38100700002)(66556008)(44832011)(316002)(66946007)(41300700001)(26005)(478600001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blJyV3QxU0g0YlJuQUpxSHh2TGwrY2s3YzdMS3E2clRCNmdxek1yekJ0Zzlq?=
 =?utf-8?B?ak9DMGFLSUxPenRsWUFFaHJuN1dOU25YQTZkUllZcEJrampEcktCQWJZTmpp?=
 =?utf-8?B?NmhjS2xNSkpQYVUrTXo1cVUxNmxLR1NPVE03bytObWp5ZUtESW1iWG9lUElF?=
 =?utf-8?B?TDIyK2xLU1FEVUhLcStYNjRTV1RKb2VkcmZ3Tk9KcXQ1S1hBN0ZueUJXMkpn?=
 =?utf-8?B?T3R5RU40Q0hidm5sckxid081aEZvODkwZnRxclpRaTQ4TzI4RkRhTFdnV2xT?=
 =?utf-8?B?TkNaK2JjZG8vT3BpZzh5U1lzWW11aHhzUnNaMkpoT1hheEZ3MmZxTk4zcTRp?=
 =?utf-8?B?OE5WZ0hJazFtZEJBSjR5MGVkbXdwUmtTK0RlZVkvMVBOd1lIUFIrMWhKWXhx?=
 =?utf-8?B?cGF0OE1scnRvMjV2WnRBM3VwUllUUDREeGtXaTZ1QTJoVitHYlZGODQ3WkJR?=
 =?utf-8?B?NTA0NkR0czhvRHJkOSswVEU0VnRUaStjamhoTFhrRWN4cTRXK1RCVzlIaHRu?=
 =?utf-8?B?SVUxbmN0N3ZpMU9GZUpnWHZldFRTR0p2K2lpOVQ3SnlhczQyVGVvWCtwcmI0?=
 =?utf-8?B?b01pTFhsTEh5WUlIMUtxaHNBeGQ4MTFVQ3lpcVhrdG9IaGdQOUZDaUU0bHRI?=
 =?utf-8?B?LzBQT1NkVDI3MkQ5dkgwT3hzZUhneXdtMUVrQ0YwWHJmWWRkQ0o3Nys2d013?=
 =?utf-8?B?VjE0UUM1M0JjOUlBRWE1NDdza0xxNUlyOTZTanR1NE5tUUsvODNVLzh2UXE4?=
 =?utf-8?B?anpzZG9iVXBvL1VqR0lIZk15QzJ1azk0S2p2MEdiNUxTV2paa3RRNUVtM0FG?=
 =?utf-8?B?MWZCWHR2UGQxd293ZmlvMXp4YVk5ZTdoODkxOEk4eTZ5aFNkcklxQzI1aW5C?=
 =?utf-8?B?cXVlbFg2VUdCcXB4K1EvL1llelZHT0lVU00yTGpOeGgzOVBzL2doOHNrZTN3?=
 =?utf-8?B?YjVYTXdOSXhLdFR1VnZjamVZVEpVL1VRQ1REMzh4U3ZQL0VoREh2TUtVa0s3?=
 =?utf-8?B?Q2N3cFVWY2dxM2paZzFVUjB4TWdra1p5QU9ZcjdWZGl6N2tMa0pTcFdlMGV2?=
 =?utf-8?B?STNITG5uOVc1QjJlL2FlcHRYZ0FHMWxtZXdpeG95ZjBrSktKSiswRHh6K1ND?=
 =?utf-8?B?ajBEekNCOUwrNEJBNWs2bE5wd2lMUmhaSUVtR0tyMUs2UWpMLzRYSXJucCtl?=
 =?utf-8?B?eW1LTFI4ei8zRU5nT1lYcUVUNi9qb2Q4VXFQUC9TdWU4c0hxUUNNK2JoQTB1?=
 =?utf-8?B?MDFxQWo1SXpFdEtMU0dUL2I0YUhQUnJGTm9UZElhM1B4S3ZVbElzSlJEM2Fw?=
 =?utf-8?B?MEFQbE1SZDl6WnZFTXdVWEVUeDFNVjh1OVYzdnBwUEFCVTA4bUVVYjZjSWha?=
 =?utf-8?B?ZCt6SURZK05hb0poeFN3OE1kQ05FVFNFZSs4ZzBjSGFqVkNlVXFCZXdyc2FE?=
 =?utf-8?B?MmQ0NHFCSFBYYkNBdEZQSzBvbjJjUlB6OTFLUVlRR1cyVDZqZ3M3bjN1c3Zz?=
 =?utf-8?B?bGZBelE2dnA1TGdXOWlCZTN5NG5JclhmSnA2R1hKVGJZL2hMUEdpQzZmYURu?=
 =?utf-8?B?dmd4V3pLcU5lbE9nZWo0MnJPbVcxc1ovOTRwcG8ydGl0WWFNRjZocmZ3Sm9Y?=
 =?utf-8?B?blVDdU5BOFRuODVyMUhyeFhmd0pXcmlvUzJLcE84RXkzc0NnMmFpVFZUZzRl?=
 =?utf-8?B?V2puS2tNYmhjTUtZQXJJMHprakFYdlVIeFE2SmYyNnZYZWFxYWp4Y2w0bzgr?=
 =?utf-8?B?aThKdFNVWWtJL2VFdnZGT0tlN3l2ZTVsS1A3d0FLRDBHSEkzemxJb3BJb0Vt?=
 =?utf-8?B?dnhVeDV3YTR2MW1VOVNGb2xkUFE0WmIwd2MrT1lHdVdhLzRaWmlBWWtUUERP?=
 =?utf-8?B?L3JKWnhEWExQQkV1YStTT3NKTUdtUkxlQUxKZUt4eHl0UCtyZlY3bjRsQ3hK?=
 =?utf-8?B?ZjBzbEcwREp5L0p3Wm8zUWdaK3ZNWElTRzU2cXdxbFE3c3VoK242YkF3MGdU?=
 =?utf-8?B?dHlvSHd5MXZDNzYyWTZNUDcvdE9yaktydEJpRXdDdlJtamhKa01ibzB1MFNU?=
 =?utf-8?B?YUdtajB3OXhBeWJ6VWExMDd1a0RtUThKL2pWY2R4clVxRExUclg1eDhBVWlP?=
 =?utf-8?Q?WZToMM6QVaBhqwGX/w/+8QPDS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737b7617-676e-4795-4853-08da9599c46a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 15:08:09.0117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4N+xLSsykYKA8SZDFCgFVFnxtbmCinjCCFXfdHw2wdrw1l3DWHWBfIA//hqTQfLAMjm0cnq+rzgg3vNu+QXVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5247
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-13 10:46, Javier Martinez Canillas wrote:
> On 9/13/22 15:49, Harry Wentland wrote:
>>
>>
>> On 2022-09-13 05:33, Javier Martinez Canillas wrote:
>>> Provides a default plane state check handler for primary planes that are a
>>> fullscreen scanout buffer and whose state scale and position can't change.
>>>
>>
>> Even though this might be how some drivers are handling the primary
>> plane this assumption is not universal. For example, on ChromeOS when
>> the (default) underlay strategy is selected the compositor will
>> position the video plane as the bottom-most plane and mark it
>> as primary, while the desktop plane is marked as overlay and
>> will contain an alpha cutout to show the underlying video.
>>
>> In this case the video plane (primary) won't span the screen
>> and is regularly panned and resized.
>>
> 
> I see. Interesting.
> 
>> No objections to this change as it helps share code between drivers,
>> but maybe specify that this behavior is a unique requirement of
>> these drivers.
>>
> 
> I tried to make it clear in the comment by mentioning that this helper
> is applicable for drivers whose primary plane is always fullscreen and
> can't scale or change position.
> 
> Any suggestions of what's missing in the helper kernel-doc comment to be
> more clear ?
> 

After re-reading I see what you mean.

A sentence to the effect of "Some drivers require the primary plane
to be a fullscreen scanout buffer..." or similar might help clarify
that this isn't universal but helpful for drivers who require this
constraint.

Harry

>> Harry
>>
> 

