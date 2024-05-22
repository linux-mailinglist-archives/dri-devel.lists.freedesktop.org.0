Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEA8CC241
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD6110F58A;
	Wed, 22 May 2024 13:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i6KkroaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5010F588;
 Wed, 22 May 2024 13:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzqlIyC524Fjqd+Dc2HJn3SfqMQU5vDiU+qO0xJzMUneqxI1JecEfaieDvzf3LZ72CaeUWa3mqnJyOQQ2SXWJFLUc0DVfrWmx8nlU13fMbNGV0mBsimXmugktGaOBaNOBtFIrpLOX8AilihPerwY8r+RGWF199PsMZr2UVojT0jZBzRDyJZ+UKygiWApvYW8GYNRXFod54zaj5UZBgPcZTPDOI9n6taP8NQ8G7i9izzYDyjGIxjB34OxWzF0rLjiedTrK4kXbrlXlJbp6VVB59eGRRxBzXQAEoTNxHDrt9S+ILhiRUKsTYSXldrri8B9/WBOnhQCaz4//OTlkvPd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9jgfqsZZG4GfWQQI0H4Fny15YsC+L5JhyygSeHIGGs=;
 b=MANRHekBkrqt7JevJfVqj7z18fRcvTG2Fq3fVHxMJW2qBVSpcHM09Yjt7ZDk151tt7ggRHOwhv727VUnB9GiGA7A7UYvY1INYTVScMZJsHlSBPfbnDvVcK+zsaC5hDGrGLY06NZxyq0i03xX70EhN0BXxW3vkUkeo5Hw5NIts9eOrYAY2FVlt+V79AdB8+As5KlGNmWmFCQ3jZEelIUbO6fbhVDQuy98CAA+NT28s6izi8OcQIWz6pZjNcmIOcBa2d8wqBpE/7Y1HSCtTPHuWndPrs0t2U3Hi4xT7YbQNCi6hAzCosY3V3WX8Irwsq41iHIbvcv0TJEFQIBk5gPX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9jgfqsZZG4GfWQQI0H4Fny15YsC+L5JhyygSeHIGGs=;
 b=i6KkroaS+l26EM5yMXypTL2BXgADa3X8m0Ypgo+xv7ZrfYIZFx0rm00kzpdSjdcrIzcZk18uauMvwSkiAi7yvVl3xGcAYM0XCi073usdMjYmn9XIb41oWyaoyGkBcg3/N377ued44xbmOOYs8IVfxBtbUnrbP8rZrj5SIIF4VWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5617.namprd12.prod.outlook.com (2603:10b6:510:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 13:36:57 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 13:36:57 +0000
Message-ID: <666e36b7-5379-46ef-a16b-00ec499fb42c@amd.com>
Date: Wed, 22 May 2024 08:36:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: =?UTF-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>,
 Simon Ser <contact@emersion.fr>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
 <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
 <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
 <CAACkh=9hY7eg_uuH7Psm=XJfSzwQTvzs8bvOXQ=wwkMPrC44SA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAACkh=9hY7eg_uuH7Psm=XJfSzwQTvzs8bvOXQ=wwkMPrC44SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:806:120::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f179ef4-3b9d-476b-e08b-08dc7a643ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGhIN0NiVUtwek4yMkpDc05YbkdjZzBNMlZJdHd6SzdkUE1NcllNajN4azlj?=
 =?utf-8?B?T1FUUTVGUW10SURsN0dOT09hdHF5dlhVblZBTzZhQ1JaeVpLeXhGdkJkRjNr?=
 =?utf-8?B?eUpNbHpEMk1KQm1qYWRMUS9xczlCeVNuMDZvcEZ0aGk1T0w4U0NnTjFTMmtB?=
 =?utf-8?B?N2o3NHFnK1F0b2dGQWZxMk45eGNhaVpyQ1hCQWpoSUd6Y2pEOCtEbzl6QndO?=
 =?utf-8?B?ZnIxV3crUGRSRlJaaXN5dUhuYzU0QjkveHc2MERCOEE4WnB3UzVZNkFFcjFL?=
 =?utf-8?B?NU93SFgzZ3dNamhQZzZMRnZYS205TTV5Ymd5aXVFSjlhdlBFdmY3TjhHSTcx?=
 =?utf-8?B?WTZwdW5DV0hCRWlnSWpOZzhqVkxHK3YwRytJSDk5VmE0cFkzQU1GdXhiNHVB?=
 =?utf-8?B?TlRKV3RJWFA0bFo0L1VpS0s2TjM3aGxCK1RWZnRSVDBObnRVckdvc1JOaEhi?=
 =?utf-8?B?UkJMNnN5MWxtaExhblZGandiTk9Ld3RoRmFVSXdpdnFJYlBqbzRlOVVjRE1J?=
 =?utf-8?B?QWMxckxSdENqY2ZoZTErODlJYTRFc0QwSEtsV2RmQTg1L3RxVWxlV2tlZEha?=
 =?utf-8?B?Q3JSL0QyeGZrOUZyS2JOZXU4ejZmbDdDRjByeEprQ1BYamMzTUg5cys4VzRm?=
 =?utf-8?B?K1M0VlZPVk5pYk1kWTZaWlduS1pBcktjeG5hZHdNK3h5Y0hXMlN6NUYyVGpD?=
 =?utf-8?B?alZHSnpremtLak5xUlc0SExKSXIvckxzM2FyeFFKMUx5ODlDNkVuSktSN1lN?=
 =?utf-8?B?aFZwZEVQSS9JU0RDWTd4aVJpeU50ZWtYWEdSUG5IcnA4djBmZlNnMWl0Q3lK?=
 =?utf-8?B?bzhzMmwxOXdxUm1nUm1VN21SM3JPbU05NnBrWXBYZUpIZ0tIdzRuMW82andC?=
 =?utf-8?B?ZDFObzZjcnVTK3BBVU45V25XOUpXbjh4aFgwdEtWMGQyd2ZZeThHMDJIeVhC?=
 =?utf-8?B?eFRpajlTWitIczJ0OWFzZkJtRFFtYWI5dFhoYmgyWTNiMVNmYUNXOU82d1FN?=
 =?utf-8?B?WXdRVlMvOUROWHMvZHErZ1hneUpkbTUxYmdmcEppajk1dnJtSFdRdVpLRytF?=
 =?utf-8?B?VXdYVUJBc3l1WEQ1Mjk0U3FVWUlEMnpUUEVzRk02OGVHak53eTBOL3YxU3lv?=
 =?utf-8?B?RU1ONzc1OXNWV0xheEtZY2VIZ2Rhak5XNTlGY0VyVXhFYWJKTWsvei9QdEtU?=
 =?utf-8?B?eDJoSERLSHlaaFMvRUdSV241Q2wzWCtsa0xhV3pnQ2ducEppN21kejRKOE85?=
 =?utf-8?B?SExEclF2R0VBNnVGNEZCZ09xRWxyZGNRbWpvRVhtWW9YU21GYUh3Y2ora3FY?=
 =?utf-8?B?NUZFVHgwN0FQTXU3Y2lzUUFkb2E0SWhna1F1RWZlODQ4UFFWT0ZMUWRRaHhR?=
 =?utf-8?B?UGRFb1JOSWpacXEwTjZybXZvb0oxNkxGcjJMSzJ3SlBUclhLdnA3cjRUMlU4?=
 =?utf-8?B?U1c0eURiVU5naTRjUkhXQm9kVHlQSUxxcnpTYWM0RElsOG5NeEhmemtrZkwy?=
 =?utf-8?B?MzVteGNFUllULzhYZU5ic0hHbEVqZlpCbWwyeUVOaXdHbGl3aVhnYWZCbmZS?=
 =?utf-8?B?aXd3NCt5dXRqMWZ5UGpQdWFvWWlRNWpHdkNGK2lVbzRTZWtjdVBHTTMzRkRX?=
 =?utf-8?Q?9m71t0Mv+WpRieFO70QAH6AkDJ0sXGjLgUPhYrGiKTWA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhackFEenJLTmdvWE9kWEZzMHhERzd1VzhLdVVCazBCN21ZWlB1NldUTmZV?=
 =?utf-8?B?NUFVNm1LS0V6VEVNQlRsZjY2TlRtZVlpa3ZZZ0k5M0grTW9BZVp5b054RHN6?=
 =?utf-8?B?MEF1N1RNYlo0L1lQS0dXeFZTdlp2eGFsK2tKYXpIYlVzSmJVUHV6c0dkK3Zv?=
 =?utf-8?B?K2NEd05YRkJTZWhNUE5SRkFjLzZYVGpoK3UyVXFoOWY0eURyMGd6YTFkRFRr?=
 =?utf-8?B?SW53WWJsNG9sRXlCU28wSGx0dExRa0d5em9YcFBGWm1hQVJXd3c0MGlYM2k1?=
 =?utf-8?B?VUZzMDZ6WUgxd2RpMkFKT3BjSlRDZlkrbFVSMjBBekgvNFRMRkVuYng1Rjlu?=
 =?utf-8?B?Q2hna2NWUmJZVkJtM3I4RHl2RmpxVXlUNjNnYVJUbWgxMENWNG5Yd0NaZXVi?=
 =?utf-8?B?aFVaZ0FWbVRGampPejF5VTRxdkdCUWlhQ0JkNHVoZWl0dHJWbXRWYmJsd2h2?=
 =?utf-8?B?bDhaUWNxOTJlTVBNclFtSmNXTkUwM3kvWHJ2T3lmdzNrK2hxS1JEVDFjVWo1?=
 =?utf-8?B?U1grRTFRZjBaZGoyM3o2dEJrVnFGZ0VwWWllei9qUXoyeXJyUmxRZVFodFdl?=
 =?utf-8?B?RzdjbUhpNUNpdE5QTDVzdUUyOTcrWnhKZGVVZnBCU0ZCSE1NQ203Z2h0NUo1?=
 =?utf-8?B?OGtzQ2tWei9xYjVuTGhrY3o1azBaeHdHaHlKam8xVTBKQ3lXd3B2YndDWkRP?=
 =?utf-8?B?Nmd1Ri9weUNRNWc5L0hyTVNpVjluS2JBdlJUZGY2Q0dBOVRHUGtSZ1BvRStz?=
 =?utf-8?B?S29Ec25GY1RCd2IyYnVDUGMveHdxbWJRSlR4Mkl2V2s0dzNWTUJSNGVzbjFk?=
 =?utf-8?B?ZGZCVi9ualhNR3hzcnYwcUlRMWtndmlpZ0Zzc2dpQmR0OGZZZFp1K1VrWXFX?=
 =?utf-8?B?WURFcll6T29NWWxleGUvdTJIY2JnVTFnL2ZhSjlURGZsdWRzNDlGQWU2MzRN?=
 =?utf-8?B?eWhUSmJjSkxwUHd2akRjVGJHcjVVWG81T242bnFMeDZxakNvUU1VMk1rTHla?=
 =?utf-8?B?bStBM1JIeXgySzZKbGNna3lhTVF4Zmg1WEZsRXNLQWtHRGN0MENBMW8xaUUx?=
 =?utf-8?B?aUtHTGtCUHhmUWozYzRXTzNLMUFYK0szMUJXbnExSFVoVk1VVkl5NHZJMW5n?=
 =?utf-8?B?UVJzREdMYlVWUHE3S2U2cGhqT3dqOW91VzNPbEdZTGtTMHdHTWkwMHVzQjcy?=
 =?utf-8?B?clUvN0p6UjlaYTFZek9SVkJQT2NVUVdZaDNPWm5FRnBMK0xDMXdxMEVZWUpj?=
 =?utf-8?B?L0YrNHdyY0VjdHNrd2FxMnVkQkxlWWZ3cTVhVnpwVGJ6RTZmOFJGSG1lLzlV?=
 =?utf-8?B?YWloZUFkbHhPTk8vY3ZVOGErNVROWEV3eWNhaXV1aWNPM2tHVkxESWFhaU5v?=
 =?utf-8?B?UjhUN2NXMHBrdlpJSWxHZVdJcGVMVnJ1MyswR3V0ZkhtajhMbWtWM2xjT2FU?=
 =?utf-8?B?d2dYUXdNNmVJaWNlTWszczRieStKVGJNQ2hWT2xYYlkyd3JPNTNuR0p5OC92?=
 =?utf-8?B?THRFRVJqNXhYaTJWUVJ6dHcvbFAxUy9GUWlscGdUUHNUNlpzWERBdDJMSmMz?=
 =?utf-8?B?NWR1aGxoelhETVVRaWJNT0xFNk84b0c3aHpybzVaZGo2Q1JRK2p1SUM4Rlcv?=
 =?utf-8?B?Sk05RnMrcytNSG9OeGtrd1dQWExod2V0SzNFOWNwTVNCc1BOd3RHVlI4SVhL?=
 =?utf-8?B?cnVOaXNYZGtZTitSOUtMQ1IwV3ROaVpZbGdCZDZobWRUbnFFeENjVWQxODB4?=
 =?utf-8?B?c3RjWDJOQnpJQnh2UWp4R1NsQW13ajY4b2E1YnNkMzhuc2FwUFdCMk91MXdY?=
 =?utf-8?B?bCtxUzBST21ONkFWOTN6cGlQWWxxSGMwNHBmcU9rQXZxTU9FVktiNGltME41?=
 =?utf-8?B?K0dDV2xjSG1hVFVOWVk5bGdENWNURW51clpnbmsxN2hydWp0azlreHpRbEgr?=
 =?utf-8?B?NUMxSGhBZHdjV2t4RzhhR2FFM2s3R09nb1pPQlVPeVZRL2YraU9GQ3dEdnUw?=
 =?utf-8?B?QjBRb0wxVlFodFYybkZIN3dUWHRzSEs2U1EzSHBGQ3dJYnEybmpXS3AvQWxm?=
 =?utf-8?B?ZVR0WE5XK2hLY0ZTM28xWVB3Uzl5am1qOVo4ZkQwSWpIL3VDS0Q1MXhtdHlE?=
 =?utf-8?Q?U0CvN1oQHWK9Hbf4keP23NZwI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f179ef4-3b9d-476b-e08b-08dc7a643ff3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:36:57.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /m5wj/Bvk4nNw9EBT4elddWUaWBpNw2IzcBTc5GQE5sNjH7JzEIgXHnmX3wn2wrifuhLFFIftsV0CrgaEn+OfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5617
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Simon

On 5/22/2024 05:07, Rino André Johnsen wrote:
> To be perfectly honest with you, I haven't given that much though. I
> used the 'bpc' and 'colorspace' property in debugfs, since I could not
> find that information anywhere else. And since I also needed to verify
> the pixel encoding being used, I added it where those other values
> were. That made for a simple and easy addition for this property.
> 
> If you want me to do this differently, let me know. And please point
> me to the standardized DRM property where I should expose the values.

Here's a pointer to where the colorspace property is created:

https://github.com/torvalds/linux/blob/v6.9/drivers/gpu/drm/drm_connector.c#L2147

I would expect you can make another property for the information you're 
looking for and then can get it from userspace using standard property
APIs.

> 
> Rino
> 
> On Tue, May 21, 2024 at 10:55 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 5/21/2024 15:06, Rino André Johnsen wrote:
>>> What is already there in debugfs is 'bpc' and 'colorspace', but not
>>> the pixel encoding/format.
>>> I have searched high and low for that to be able to verify that my
>>> monitor and computer are using my preferred combination of all those
>>> three values.
>>>
>>> I do think it should be available as a standard DRM CRTC property, but
>>> for the time being, I figured that a simple debugfs property would be
>>> sufficient for time being.
>>>
>>
>> It's just about as much work either way to populate it though, why do it
>> twice instead of just doing it right the first time?
>>
>>> Rino
>>>
>>>
>>> On Tue, May 21, 2024 at 9:04 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> Am 21.05.24 um 07:11 schrieb Rino Andre Johnsen:
>>>>> [Why]
>>>>> For debugging and testing purposes.
>>>>>
>>>>> [How]
>>>>> Create amdgpu_current_pixelencoding debugfs entry.
>>>>> Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding
>>>>
>>>> Why isn't that available as standard DRM CRTC property in either sysfs
>>>> or debugfs?
>>>>
>>>> I think the format specifiers should already be available somewhere there.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> 1. Do not initialize dm_crtc_state to NULL.
>>>>> ---
>>>>>     .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
>>>>>     1 file changed, 47 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>>>> index 27d5c6077630..4254d4a4b56b 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>>>> @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
>>>>>     }
>>>>>     DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
>>>>>
>>>>> +/*
>>>>> + * Returns the current pixelencoding for the crtc.
>>>>> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pixelencoding
>>>>> + */
>>>>> +static int amdgpu_current_pixelencoding_show(struct seq_file *m, void *data)
>>>>> +{
>>>>> +     struct drm_crtc *crtc = m->private;
>>>>> +     struct drm_device *dev = crtc->dev;
>>>>> +     struct dm_crtc_state *dm_crtc_state;
>>>>> +     int res = -ENODEV;
>>>>> +
>>>>> +     mutex_lock(&dev->mode_config.mutex);
>>>>> +     drm_modeset_lock(&crtc->mutex, NULL);
>>>>> +     if (crtc->state == NULL)
>>>>> +             goto unlock;
>>>>> +
>>>>> +     dm_crtc_state = to_dm_crtc_state(crtc->state);
>>>>> +     if (dm_crtc_state->stream == NULL)
>>>>> +             goto unlock;
>>>>> +
>>>>> +     switch (dm_crtc_state->stream->timing.pixel_encoding) {
>>>>> +     case PIXEL_ENCODING_RGB:
>>>>> +             seq_puts(m, "RGB");
>>>>> +             break;
>>>>> +     case PIXEL_ENCODING_YCBCR422:
>>>>> +             seq_puts(m, "YCBCR422");
>>>>> +             break;
>>>>> +     case PIXEL_ENCODING_YCBCR444:
>>>>> +             seq_puts(m, "YCBCR444");
>>>>> +             break;
>>>>> +     case PIXEL_ENCODING_YCBCR420:
>>>>> +             seq_puts(m, "YCBCR420");
>>>>> +             break;
>>>>> +     default:
>>>>> +             goto unlock;
>>>>> +     }
>>>>> +     res = 0;
>>>>> +
>>>>> +unlock:
>>>>> +     drm_modeset_unlock(&crtc->mutex);
>>>>> +     mutex_unlock(&dev->mode_config.mutex);
>>>>> +
>>>>> +     return res;
>>>>> +}
>>>>> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
>>>>>
>>>>>     /*
>>>>>      * Example usage:
>>>>> @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>>>>>                             crtc, &amdgpu_current_bpc_fops);
>>>>>         debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
>>>>>                             crtc, &amdgpu_current_colorspace_fops);
>>>>> +     debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->debugfs_entry,
>>>>> +                         crtc, &amdgpu_current_pixelencoding_fops);
>>>>>     }
>>>>>
>>>>>     /*
>>>>
>>

