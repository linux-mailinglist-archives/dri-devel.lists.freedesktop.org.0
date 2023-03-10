Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193AC6B53FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAC410EA15;
	Fri, 10 Mar 2023 22:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B6B10E00F;
 Fri, 10 Mar 2023 22:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7XJxBs6W6KOhG0tOoTI04XXSUgEx3jPSbEUiNpfeFu/chrpcyOt4mHONndWqOrnmaZOfr+kJkd9mCpAu3nWenWxedE8lW8ryvr+9VlJcE29hK09Bfu1hpVeOiJ4Sgv+ZkDdNx8XqBYA4uNGx56IukmZabLGlz5Wlj+psI3XIMjnuc6qBU00fsYUIRostuiFDTZ6JhJvDG7gUTw591W5fMRZesoPXmAH5dXV86p+SgMGcC3eZVB8lQms3wDQBQ/7qfGlVu3jx6hfyUeXf4Z0nBc3O+bjTA1riCh833J3dbWAntVCOzG8IUQfoKHCNW1PQHz/IlmGgATud9sD0s4/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r8NPUKQEFOtM1oT+JQFMfrMnJrG4DJzYjhE5uLQB9U=;
 b=F9YYV/MWo+r+4CzOqPo1W0mHr+Om6UOvrU1+2V6QgCtr9jtudR8Lzke+vxa0TLetqgJcs0GpcdzfoLWbfXoe44mFxqZt9DkO7JrLCMgMNUgh/L8cDSW78pwGKA4EbnPcp2cmvgytyeiX2GAbkd9vOhA5uymwEa+taLeu7w2f2TjlWX38WVssg2r35RKT37pzGaN4cX7y1Qi19rZ9qNHrDd9DLWiTrWRrPyH+mo+7/LK0oP7JsWBJlE7m0zveJMflPSfPsNbpx6u+VTtCmdL2QQnSAuD94/BlGK0GFLWg1aqTBAeUho/vPhPVtcbYnwCzOeYKdxg8RvmdG3KsVJfKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r8NPUKQEFOtM1oT+JQFMfrMnJrG4DJzYjhE5uLQB9U=;
 b=dcdtYk19pQ5W5ky7XYHMclA0Yb65HjUWBBA+J6pZ1JISlQJBwW2DnG0pKTHDFgmruEQBE290cxVDLfD4XEsTKoFN93D2ED2qSQAIuRZj7JgTBgSViGmjtb0zwyMqCPyGoeeVxoaik1InY3c+uN9T5yXP7JD2aeDjUlu1KUDV+W0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 22:12:51 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:12:51 +0000
Message-ID: <6fd35bd4-4edf-575c-8875-1cb256f414d5@amd.com>
Date: Fri, 10 Mar 2023 15:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC v2 0/6] drm/amd/display: Pass proper parent for DM backlight
 device v2
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230308215831.782266-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:160::36) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e2bca8-39b3-466d-d39d-08db21b49688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYi0IMOLJGeCXBA2JZgfnbNi7fpHaby6Vw1BmB18HCXtqgQ1nA75FClST0Gb5OiyVe8S6LXbBd6EeV049rgS+rhsGW9dd6a4hTG8+M2caPyJpW8cCqWwSUAHXQOz6kExQkZf3ROkmj0G4+Rc9PsRw9S2ygevKmlgiUPUg4FdnBA9QIj7X+9zBbHn1ACB5h3PnDRb6fFngvAGQBP+b6FrgnSzj8d//mSgVO4hzv59ExpBc0k7tpJPDb1jf0AzyN1bOAoagC+4187l/Y0SpLxF/yxepwSI1FA2QMXCGvhHgnaWC6p0wLqXH7ZRkiT5cm9CVgNxBb0yyx4DmG5PfEBL1E64g/o23v6YuKqjT45HSPjjRSLZs/jSQRYoJ6bI7fbbHHNBmtfoIFAG9EbEiJxGjBJ04xssmRa2D4tN6f6Pa/HrQE0CzcVPY8ZesBLR901CcX5r+NKsyhqxDNxGXw8NuB6p55jQvMD3mBzhxwHFSRImzkwM1n4wHl8R0TVraxqDG9B02E3JULwmH6lwtKfk0Purqtz/b8s56NFwEkvLxftDYDxng9oqUnMKo330KBwEw0HZ1E/v9zqFjBrFPSR7HIOZmqXP+DT3oGr9Qu1ruj6uPyzRBnioac08W0hjYc2DoE3c2sTGMlZkuCDxBZ6COPkMLfIu1PK6LKPBqQZYpBrLXAawDejvnvwt3uREfByunD0xC7nm/S2iErAo/jT5fSkjoZgXADdyP+/PA95tZ78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199018)(54906003)(53546011)(186003)(36756003)(83380400001)(6512007)(66556008)(6506007)(6486002)(2616005)(6666004)(8676002)(8936002)(66476007)(31696002)(41300700001)(2906002)(86362001)(4326008)(6916009)(5660300002)(66946007)(478600001)(316002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDQ2U1E0OUp4Z3FLM3BoVGdvOERSUUM4STFsNDA3NGRrNnBDZW5mVnB5Q24w?=
 =?utf-8?B?bnMwTk5pM1h2RzRuVFFFUllxK0tlSlVLd2UyR2Fyb2RYbzBvajQ2R3lvV2U2?=
 =?utf-8?B?NnZlQnV4OHU2eGZBYVRRbTJlNTNESUdQUVpLUmNvRXZUT3FudUdteFhvY0Z5?=
 =?utf-8?B?VFRhb3BOTnFFeFpQSzZkNmQxdEV4NUczTjc0OWtaMVlUT3F0Tmk2L0RkOXhG?=
 =?utf-8?B?aE9mVk1RaWhtK0VPcE50azhLcXhwaVBRRmJWOUl6S1JxWkpwa1M3aDFqeWhl?=
 =?utf-8?B?NWluSUIxTjVLbk9tenFwbkEzS2NxRkJSWHBVaVdXWVpsVVRoMmlaRjdtQ2Ji?=
 =?utf-8?B?aGhaQ2hmOFBHaUt3TjNjSzA3aHltWWxvVWlJcHoyeWVIVjVSWFB1dEF2N2FM?=
 =?utf-8?B?ajBLMW1RRWhrYnBzUTdsNCtuZXBQZ1VQNjJrSzAzaU4vd2RkaHV1Sy9jT1cr?=
 =?utf-8?B?VGVZMmR4b3VPbFlTSlhXY1FUd0pObzVUbnlEdXB3bFhUUm56bFJneHlaMXJG?=
 =?utf-8?B?bUN6T2M2YlBYMGVhbjRSUThEUU4rNU9CVTBIMXc2bEZaS1E4N1lVQ2NRRkxu?=
 =?utf-8?B?eGlWUHJEQ1NhWlY3YnBYeWw3SGRScC9EbEFyQ2xPRFZxTFFUbkprQ3JtVm1E?=
 =?utf-8?B?TmtUaHhiMTlWL1dISytnNzN4WUVpVUdKNnNZSVNnTEtML0k1SEIvd1l1MWN3?=
 =?utf-8?B?elFPbnVHamNndHY2NVE0eFp6VkxpWU5ES1NjTDE1QmliVG1aSkt3bDJtVkp4?=
 =?utf-8?B?WTM0RkN1bS9OUGxFVjJFd2RnSEdsZHF5UVBJMVh1K3A1V1pQMmptS3g0bjNN?=
 =?utf-8?B?OWQ1YkRaVGJkWXlNTjlZa1d2RUR0V2t5MTBpbWIyK2hCRkhlUjQwSGtTSS8x?=
 =?utf-8?B?cTVvSE1HUWwzMzhQUytYVFpEUmE2K3pjRjFDVW9zeFRxdjd3cXlQTEdjYk9S?=
 =?utf-8?B?Y25aakpINHF5ZTl0b1oyNEV1SFdZQlAveWt5WEVPTGdXdGpVUFZvSXpLS0pn?=
 =?utf-8?B?ZktHMVl1UGE1cExDZmhhSDVxV3UxVmpiNE16Y0xjUFRVcjFQUmNZTFVEK29o?=
 =?utf-8?B?K0R1dUFqT3drU1o2T1NzcVBabVJRd3hKd0NnSlJXS3gzeG9rM0RkL0s4SUlJ?=
 =?utf-8?B?RkR3ZlRtUktwRXhnTFBaaGR6by84VEcxS2tKMzBkRTZiUE80NzUwZ28vMjUy?=
 =?utf-8?B?TVpmdFFXcmR2NXJPZWhRUE9DUlliY3FhRHBQYXNPbW14UUhtU0JzSkcrVDV1?=
 =?utf-8?B?QUhBNGpMVUVTbWZYSlJKYkpzRnNZNVkya3R3N0VMdG5OTlNTREFGbHdQY2pu?=
 =?utf-8?B?YjZCL0FGY3JxMnMrWUs5VEdnN0dUNStaNlUyc0lMUldOcFpRQmUvdU5KUXcy?=
 =?utf-8?B?bzdSWWF6M2RHMEZoWjlrNml6ckZLZE1DcVRwSzZDOFlvQkpFUFR5dUxLbXNs?=
 =?utf-8?B?RDZlazlNZ3EyVk8zN1FSOUtxRllNYTlsWVJXUHBjT3dMdU0rdms2VUppT2VB?=
 =?utf-8?B?c3BBUks4YkZzenV5S1czaGlldGxSME1aZUROeVl5VndTOFpvQ3BKamtCR1JI?=
 =?utf-8?B?VXpFbjMyTXVWSVZQMUxPc2xlTXRVd3FUT2lhNy95L2N5Smt5U0xodTJpR2dn?=
 =?utf-8?B?Rnc5OTdzTnZyZDhIUUR1WUlhK2JVTS9tZ00zQmVUcDZuSmh2SU9xZEJ3ZXN4?=
 =?utf-8?B?QmtXdjN5TXRsQ0RtYnlNL1I0SGtJRzVMbTEzVGxKRHpOTmQ4ZUtZYlpISkJN?=
 =?utf-8?B?c0c3Ym9pUlJvdWhFMllmbDVOWUhvZW1pMVVRYkQwNXMvSUpnRGFRei9iYnN1?=
 =?utf-8?B?UGlpTDVSZWdoQnNCOU82MjMrNDYxclFQTmhLRWdaZDNNU21Ram55a3JSb0JW?=
 =?utf-8?B?Y1BveExra050YjJHenR6NnViY2dMZlJ0NXBiWVZrU2V6cVNjOTVwQm54dXl4?=
 =?utf-8?B?K2hHRFhsNnJYLzkwek84QmZYOVF5U3NRM3FBUFZRaE9SOHBSZVprMkx1clZC?=
 =?utf-8?B?NWp1OFduR25tRGRMMlYyMjN5c0RUSmZhQk5jWDc0RGNHSUk2Sm1BTkRPVWs0?=
 =?utf-8?B?VS9pRzRETGxLaHN5SnBZTC9mTWpxNzJQYXoxbi9USVhxY1UvZm1XNld2ZlpF?=
 =?utf-8?B?WGZLUEpGdHNmYTN3MDVuM25iUzltTzRZTWJ0dFVMb3orQ2h6U0I4UFN3ellG?=
 =?utf-8?Q?evOh9gr/f6xIdz0hdeAEETKA3hJb4pRGFHPdNQst+PfC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e2bca8-39b3-466d-d39d-08db21b49688
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 22:12:50.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RcsurlWdbK1hRkpF9YIWkPA0m0gjUtzqkFscf5I0RVQy7Q1pdFgYUSrjiuja6jlwHZdwTIIZgVYbEf/EAnG1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Which AMD device do you have available for testing this series?

P.s.: If you have a new version of this series, could you also Cc me?

Thanks for your patchset.
Siqueira

On 3/8/23 14:58, Hans de Goede wrote:
> Hi All,
> 
> Here is version 2 of my patch series to pass the proper parent device
> to backlight_device_register().
> 
> New in version 2 is delaying the registering of the backlight_dev till
> after the drm_connector is registered by doing it from
> drm_connector_funcs.late_register.
> 
> This involves first reworking the code a bit to allow delaying
> the registering, so this has turned from a single patch into
> a 6 patch set.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (6):
>    drm/amd/display/amdgpu_dm: Fix backlight_device_register() error
>      handling
>    drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>    drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>    drm/amd/display/amdgpu_dm: Move most backlight setup into
>      setup_backlight_device()
>    drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device()
>      take an amdgpu_dm_connector
>    drm/amd/display: Pass proper parent for DM backlight device
>      registration v2
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 99 ++++++++-----------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>   2 files changed, 44 insertions(+), 56 deletions(-)
> 

