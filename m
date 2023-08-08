Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D2773AD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 17:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888210E0F3;
	Tue,  8 Aug 2023 15:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50510E0F3;
 Tue,  8 Aug 2023 15:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PImKegTH7PyAkRnI5Cwx3ob6+i/lhINwNZm3odNJTSXV/ABeMEYp2yqlv0wYs412hVT9BVSmNwDZX7UYr0YjMZwxgX9piy5/u2f+wmHRLBMsgQAIMN+mczfBsPrHblJatphpezXTlZjvM+RXgrvUlJbBCjbJCusITCOs0nsxwGAPa7v01ngA5D31DM+ITCdpbM8XJKc+ujYNs+piQ52M+LUcU88feQThw9Pgu07BszNzaEfjOWDhlo2Y3CUJBKJX1eC2wWBCldxJ1Eq1sCc+nv2LqG5IVo2B+g8YpJnbsKdPoPCb8t3+0+TVSliZbXLe4AhXbZwA334gXU2Wx+z9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StWvrXHQpMAgDYqZC/w9b3qTlb66TkWMH8hKjzxqQ6M=;
 b=cku/FNY6xO4B2Kk+H0aySbR9mxv/93y9wFSw0fiB6qWKs/ahXlKjQhrycawzpVdb8Oa9h5gcfbyZ6//m/RgYfGdoKtz45/wya5Ge3+2Y3K87rtnMnFVMV0ON2S9yRRDLpQM4yK+wmJeKGMZVu0nBimZuhOAPFxZPAyB2980jHBKR3c7ar5poF898CJBfI1WxJDgQNNqxCygGt0oVa1I9iU/KMPQXdGaGh8LbjbTbSFk6/40yShn0nrnTD9RbKAtGSjxDP0lB0bt8y872ygTXVYvdaa3U96hCwvujABWr52uyIq0NcY8j4Mm6j/e41sCLaIEnkm2SNBK1wG4ATL6W+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StWvrXHQpMAgDYqZC/w9b3qTlb66TkWMH8hKjzxqQ6M=;
 b=BnOP+4VEl4053HcDd1zvt+0eeRw1jLxACSuyoBdm/4lwRKI6eT6gVvjqmekatG0AhXv7DHcsP9xNKV7Ot6765VZg3j2aYz+pdZ8C5Y1t8KjLr06Ow9X73cNu5DICiGpY9YB6ezHbX+JbZ2lNbXzjr3m5tf6dmzXiICj+DLDohEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:04:14 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::26a3:7479:9830:da4d]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::26a3:7479:9830:da4d%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 15:04:13 +0000
Message-ID: <61efe587-9a7a-063c-a388-eed9f51958d4@amd.com>
Date: Tue, 8 Aug 2023 11:04:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
 <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
 <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
 <ad26d275-4373-429f-ecaa-3e35978f1fb0@amd.com>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <ad26d275-4373-429f-ecaa-3e35978f1fb0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::35) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: b3619547-2849-4331-2205-08db9820ba68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5/qTnLiGFGE0IiO+QkFFaiu+9+v3czyeB35ZyidgHvC0Js0dnJHeqIBdrIT8UAI5g8H0Lx0+COKOirxeAZ0vJpNvkL+LhniTTvb45CyU3M0uxYQy6yhRyxBIx6lHKadBxnr79/54dAElxCicEycy5yuE/G5sL0xPpLNrL+rq9ZvOzdjUbgtFzB8X7OZvhX/DSH5+Jn9LDE/fJe73OWZm+kRrJH68livkt5MgZmBl4ZwuHWwJelMEvTkmJcgEWwAzfdyDF8e46dpzmSPRtP3UU7FkxRTRfntG8PzNmYOxV+nTkFxdIi78Xbh9H7oDmguScrG+gI1TO6u36BuIeBknKt/SL50PgbVXJ72MGiKrKNpRDxJx9nx6ZpeyioUSn7fgrCyDt4aQ9/BG+Y+bLpEtGlqmX7P1qQ147ZDwHdpwzgGiW7s8fkyyMjyLdEdDAym9JYGy6GAD97nZUnfw2sYZvc238Snl6MlAuCGqbExo/CpsSGHkAe94oZll2yNxsUwDXfUJCwb9fw9doctQ6PzpcqY/dP7cMHrX5W/ttr58H9c1d4xpH/vunsr4gTHz4hoiAUZvPyestglbHs7csJQ9sMeHSVVaGqgEHwB0AvX6GHHJ7K0eRRG9yGJ0+IdvZcS9CBylcKkr8u93Z4Sz0iXnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(186006)(1800799003)(7416002)(8676002)(8936002)(5660300002)(4326008)(41300700001)(316002)(83380400001)(31696002)(2906002)(6512007)(6666004)(966005)(36916002)(6486002)(2616005)(53546011)(26005)(6506007)(36756003)(66946007)(66476007)(66556008)(478600001)(54906003)(110136005)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJOd2RxVnlEYlMwUWNITTNGSGs3WldCOHFPODE0L2pmZHVPVkxRN3E4bUhO?=
 =?utf-8?B?WWFGOWdqYW83RzduMk50aVUzWEpQNjFmK1luUGlKLzl3Mnc5a1Zzb3pFckpp?=
 =?utf-8?B?TVNXUUZpZ3VjcFRuRUVYTkhPd0VHNVRLOE00bnJBcFZyWk9lby9YQjd1eE9S?=
 =?utf-8?B?NmlmNFpHZVBRQVU2K3U4TXJ2ajY3QmdJcEl4WnN5NVVBdXBnMjNvYUJvL1Q3?=
 =?utf-8?B?UllHdzZPcndBQ2dwR1ZyMHNhMllDTm43YjhrMkVMemVYMTBuNmM5MmJEbEpz?=
 =?utf-8?B?TnVGVmZ6N1N4SFBiRGx2cHBvSGdjVkJPazVTNlhBOVdQd0JtUlJNM1k4YlVt?=
 =?utf-8?B?OWt0dEVnK00vbm0zbFV2cC9FT3VXK3FkMGM3TlJldisyL2VRbTFrZ2RNc2JP?=
 =?utf-8?B?N2FTYjU5ZXRRRmtSRUV6UTJxNVNjazZCT0dPRzdCMUtaTHJLVllGNVVsbTF4?=
 =?utf-8?B?ZnRoQ1JiNWNuZjhnc3VoNlE5TDh1U1M1WktPV3p1NUhvNkEyMlB5cFZBNTRy?=
 =?utf-8?B?ZXlWdmtLUHZzSEorK3RveHpHbFMzUk9mckJ5bVRNalIxRFR5ancrYXc4dmZB?=
 =?utf-8?B?Y3pzdTlMVEdwVG5VbXdKbGxwZ09DL2VISmN0TGNOUk95T0RIb3h4T2Vpb3dk?=
 =?utf-8?B?azhOazE1b2phei8rT2dQa2s1UVArcnF4NGhyV0tsQlpoQjM5RER6Qzd4OTVQ?=
 =?utf-8?B?a2RiM1JUSnJKalRLYjlwaEFqWGFFZlRNVUgrUVFNOVpCUEFVR0pIMDNHYlhN?=
 =?utf-8?B?MU1ObjJqUmo0SmdYUk1tNm1FeDV2akdzdUhxWkcrbFRCR1pGZ2o0RUp3Z0o2?=
 =?utf-8?B?SXhLaXFSNE1TMHloaW5MeHcwaE9icGt5ajJKUzhKT2NITDU4WGV3TVdPR3kz?=
 =?utf-8?B?UWEvZHFiSVVDMmgrU3RTZFRWdDhvd0RpRmpHK3J4RjEwY1hCQm5kOG53QXpx?=
 =?utf-8?B?aHE3Mmx5UHZ5RkFjcFVhZHBOcVFTOUdIRVNGQnM5ZFlvQ0Robk1XK0p4QktW?=
 =?utf-8?B?TlJvUWZ5Q2tnR0pSNXIrdmU1b2Z6cVdhUmkzd3krcHNCY1lReXE3SjZRUlh0?=
 =?utf-8?B?WTJaMEwzUzk3YU1DZWNwaVFLSDJaRDlaMnpGVFNYVFY2T21FM2VGZkM3SjE2?=
 =?utf-8?B?clZNcDNhNDJJbHlSRUF4YnlvR2pwSzNFY21QdGZBZXJub1pROUcvUWk3VnlQ?=
 =?utf-8?B?dUlHN21QV0ZIZ1Q1UytUd0NqMElkS1FjS3dTS1oyS0R2Rys1dUM4eDV0VzJr?=
 =?utf-8?B?MWIybWlUOEUwZXprdHNNcXovaVVaRUJ4cXdsUUlueFJVRy9TTkJqbGdJaCt4?=
 =?utf-8?B?MmVoTVlPYzkzTytsTHpORkpsRUc3Q2RVK0prY0o3cGZGWFBOT0Nwb250YWNX?=
 =?utf-8?B?Sk8vWk9KcWZ1bjFITEw1VmUyNXZEZHRnck15RXd1UU5wWGduSkIxckg5TjZq?=
 =?utf-8?B?N1RNK3pCNlEyc1oxYk5FMHkvVlphWmQrMlR1Rk52QUZ3UEg4a1UvaXYxQk5C?=
 =?utf-8?B?Slg3NHVPdU5xdkJNQkFhRXluU1V0TFk2b3JIK0hpd2NlWXNqVE5sd2pKNC9V?=
 =?utf-8?B?ZTR6b25UaW15VHVKWjFDVVNCVks3QWZ6ZVcvM213L3lRTkM3ZTZLMXFEUkhw?=
 =?utf-8?B?NW5sc05HSmdXeHNUT1Q2QnZlb2JweUNNSXhlNW9URlVsMk1DRy9QcHZ1TmZ5?=
 =?utf-8?B?bGZ2M2VvRHdjck5pa3FQODJOQkhEUTZLTVZZaFd5RzN6MnZxOTZTdGU2cTNM?=
 =?utf-8?B?ZXJQUFNxa08vRzhZVEo4dGVvQWhnZGFOZC9zSVMwVHZhWnJiSk53NTUzM3ph?=
 =?utf-8?B?d201Y3cwdXFNUy81U0xkUUZqZXNtaE5ZZno1dWlHOTdUV0pQR0ZJUnMxQmJn?=
 =?utf-8?B?NHVGZHI5ckFrdzJ3YnZKMVc4ZE9oK0tVRlJuQjliWm9SdmdMdnM1N1ViN2w0?=
 =?utf-8?B?RkFmanRTRUhFRS9PeUJ5ZWRqbjNVZExDblBwQ2M1M2daSHNyYjlLa3hKM3NP?=
 =?utf-8?B?ckU5UlA3WVpxZ3V3YU1PSkhvRXZmRFo2b3VjekZVdTJZMDBzM0E2cHZpd01H?=
 =?utf-8?B?Mks1SXpnbnlabVZiVlFxNy96R2pNaWRpSzNPeWdYVG9kSTYvaVJpMDdHNjFQ?=
 =?utf-8?Q?8NJIf4H6qOUxNKMQameaxRwLC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3619547-2849-4331-2205-08db9820ba68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:04:13.8237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSKVrETxuiRGobUnpxC1yFiqi6TvdFBqKTg5ehot0BNQFHWSuxeXsF/25ImIVu33
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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
Cc: Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I would like if these kernel patches are accepted by everyone, If yes, 
when they can be upstream.

I have a MR for libdrm to support drm nodes type up to 2^MINORBITS  
nodes which can work with these patches,

https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/305

Thanks!

James

On 2023-08-08 09:55, Christian König wrote:
> Am 28.07.23 um 16:22 schrieb Simon Ser:
>> On Thursday, July 27th, 2023 at 14:01, Christian König 
>> <christian.koenig@amd.com> wrote:
>>
>>>> We do need patches to stop trying to infer the node type from the 
>>>> minor
>>>> in libdrm, though. Emil has suggested using sysfs, which we already do
>>>> in a few places in libdrm.
>>> That sounds like a really good idea to me as well.
>>>
>>> But what do we do with DRM_MAX_MINOR? Change it or keep it and say apps
>>> should use drmGetDevices2() like Emil suggested?
>> DRM_MAX_MINOR has been bumped to 64 now.
>>
>> With the new minor allocation scheme, DRM_MAX_MINOR is meaningless
>> because there is no "max minor per type" concept anymore: the minor no
>> longer contains the type.
>>
>> So I'd suggest leaving it as-is (so that old apps still continue to
>> work on systems with < 64 devices like they do today) and mark it as
>> deprecated.
>
> Sounds like a plan to me.
>
> Regards,
> Christian.
