Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C1C1367E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFAB10E5A1;
	Tue, 28 Oct 2025 07:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z1xdmYx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BE210E05D;
 Tue, 28 Oct 2025 07:58:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJH7k4i2MgHjt5VUVz20kdKz87mX554NZHhZgTo2nliXqZBy3dmHn/KvfEDWr75rgkIz1eteEqmuqrkiwIsjzp/oF+JlKydo3dBx6ai3RzOg36v2erwRNSb0j4aD15OB3mj5OnR5VJ87gBOo6m6nueFAof8arY5E0fjVsg1M5wVg8/+KiEWk7nXRZoRP7vfIP5TRhKCDuSFZXt6UNwfpVPLXimMOHaUHYuGJJv4lIZTjCsaI9Y0e4WqKphhpEI6QFpj6tSxv+TI8G+8DKx2JAXiiCnMJS8On4PxowPy2EnKbPGJ3o7NJl0VXxB+arPxXVEOELGLYbCyjIX2+AVmvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=845OfQVFK9nsAsEmTYkUPSt324MG6Q5jyTBz5uMaFtw=;
 b=uVp12fGObmrUuYS/ZVimni3GgusidQ05LOtckkaZvNPbSQrtBCI20wbKNAhxUNSnFO2KscGQ7r/V5JSv98FNd5AMKxOZ+h4KjJfKhBPmSFNdbaT0Mt831ZMtW8X8z+kbP5/a9KRoAL8ws76JIXU5I8jpHwKjCVvJ5BVhEPyBv8mLnw5nTMGDCsSVuIUHkJu8LTKIenPdbDb3V5vbz7YSnqpBSCBiWDZs5RIowq3G4Kdgd5uzc78CdltIBGyhMoTi1BDcKQHPSbXMiEJ8XmLu6YqS/TSfWglQgWvEhB9OeJ2lTSSW54Q1bnhD9JIvmLlsXfRAHllqUxRPAgVaj+NUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=845OfQVFK9nsAsEmTYkUPSt324MG6Q5jyTBz5uMaFtw=;
 b=Z1xdmYx1S5ZWdJxz0FrVFFZVtdpE+NohseA9RqC+1M1V0AbBkI/+Y1CsXU9xVuM+iKI1cPvnVSBJ/gGgCFprtf5k1fa1P88gt/yw5vdoJpE/idFbeeSKTIyq34rELcHT17yXBPqAcG64nkCoSIzNv+SuTF47KvnQCBEN4Xh5A0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Tue, 28 Oct
 2025 07:58:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:58:20 +0000
Message-ID: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
Date: Tue, 28 Oct 2025 08:58:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251027081245.80262-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ae6714-011c-482a-a3fb-08de15f7c2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9NSUNJN0NKbEN3NFFiekZEcEovYVJzZzdjYVJpREdVTStqdzV5SkN4Qi82?=
 =?utf-8?B?cXhELy9QTUF5VFlFeHBEdDhORVBoaDE2OTVOTC9hay9paDh3eFFvTkJoTEF6?=
 =?utf-8?B?SFhQMGxFUFU1dzBXVVFjbjFhaFpBQ0diczAzVjRXaUd4aVRLQ0g5QVRMdlgr?=
 =?utf-8?B?NVhjTUdsZmhxcFVwdUpUeEwxYVpMME1vWWxGK21TaVg5TnlJdkFlWUcreXp5?=
 =?utf-8?B?NWhWclY0VFk3NFZuYlNGbU43Z25qOStTVDVNaEZvNFFaMkQxakMvaEhuSlpQ?=
 =?utf-8?B?emFuWDJyOFZJSkwwdVZZMFAxaFdwZ3htMnRGU3E0Ykc1QUgxWitnY2Q4ME02?=
 =?utf-8?B?QkdkT1k0VThxS2RvMEJZMDViNlhCM3NVTFhGbG94Tkxmb2lRRUtoeGdWRWlv?=
 =?utf-8?B?Ly8yMWhSa1VGZ1d2dTB2NzJEQVZQTFRTS2JWLzM4NHlTbDQ4c1ZGUFdPZ0NZ?=
 =?utf-8?B?UmNpUEdJQmdXYzQ1NlhXZVZhdUhvbEdRbFNpR1FFNjdUMmZvcTF0QzB5WTQx?=
 =?utf-8?B?NWgrY0J2QVFic1NveHJwcitDQ0VUb0dBeG5WSGQxZ1FmcUpoZTgzOUFYKzRT?=
 =?utf-8?B?M0tBaFZ6VUlkOHRNRmNraTIreGU5SmhWQWJ0SkY1Q0duMnJVZFJ5VUlGZW9X?=
 =?utf-8?B?alVSZTZMUVF0dGtsYVNwOFhQTzNEajFYNnFTazV3bFd2MDFuYVZTN0tFMTVP?=
 =?utf-8?B?ZlYwQ2V4eE9rMXpOTlZXNjBoNXpRNWpWcHh0N2Fna2tSa1VzMXdQNDNDSWdB?=
 =?utf-8?B?ZFhLQ1VWWGowYVdqWnFqdGYvdnRLNS9qclcwc3NPSytnSExUeksrTHFGbkFC?=
 =?utf-8?B?d0dkUnNlUDZCemFuWURLbGY0QnNPT3RRM2dNNW1LNU9PZ0JERzRoZGJPR3V3?=
 =?utf-8?B?UlBPd29hWVE1NUVVOUtFU1o4TnR1VmFrMVBTeTdWMHp1c1VrUmMrNWJuanR1?=
 =?utf-8?B?b3RTenFVMkJIZXNGTUJyL2xSb1d3TGlsY0FUdjhweEVwZjFVOTlwWXJJN2V4?=
 =?utf-8?B?TURkU2hvTUsyeGxQT0dWRUc5TWYvdVFiTG5sMU9SOGQyZGNFemR5SFpoUmVa?=
 =?utf-8?B?U3U3WjFjU3M1cjVsNW51OXJCTjRnWXYvNGJPNHdpODJUams1QjgzS2xackRM?=
 =?utf-8?B?Ly9sV0NjaC9ZSFR3dFZmeUs4V2JqT01UcUZtbG5PSUJ0UDFUL0tOQUdmemtw?=
 =?utf-8?B?R3F5YjhidkR1THNBeXp6RjB5eVowcWY1alNuci9iZklCRzFwVEpCZU4zVUtX?=
 =?utf-8?B?Y3Y0cFUyYlBpejg0amJIcmMwRm9hY24yelN3MjNkeDRlQklLR1cxS1lkS3lP?=
 =?utf-8?B?UWp2b0hQQTFiejdIZzMxU2NBVHBsNGlIbzZRNXJXbUk1dzB5R1VQUnFNQVBC?=
 =?utf-8?B?SGZTYVlsR1FlcGkxaGx5ZkQvMVVrcHYzS1J0YVJkckVTNm80WkF6anBKeXBP?=
 =?utf-8?B?cS9uKzdZTk5tNURPWnpGTTlzOVBkR0hIcG1ONU11cFJSMENGcEhmQW9aQ2JJ?=
 =?utf-8?B?d1lsaTdQVjF5UERaNXYwaEJyRkc4RlExVnhTWG9IRmdIYXhmRHRoMzQ4Zkt0?=
 =?utf-8?B?UXVyZ1lWRkVSZ1lrd0RYSkYwbGdIc0xzUWk1S0lOTGlGeXkwUmdUZTRBdnlT?=
 =?utf-8?B?WUVFMTJrV3IxWWNNOEdDUjh5WHNmejg4K2djbk83L21Ra1BaVTFzTFVqR2RU?=
 =?utf-8?B?aDUyUUFlSkdhT21lVldaTWhVRCs0QUlIQ3lFL2xxb3Y1SUx4aCtJUi9VSzk1?=
 =?utf-8?B?d3BzdHMwUmxJbS8rQTlhZjEzbHIyalNmaEhDRXFyaElwMXpLTXZWbmt0TXhr?=
 =?utf-8?B?c3kxZVRvYlZSSDFpejNiVlovaDBEdzVMSkZ3UmlqK1hmTjJEVlB2MkFLYlFL?=
 =?utf-8?B?VytOeG9kcWF0VW5iVktVU2UvQnozODEvNmp6OUg5NnpVam5XTWJvYzJwai93?=
 =?utf-8?B?aTZQdXJLbFl5RllWajgvR2RLOVNITXd0YnczSXdhdHZQUmREQUJSMnFUN1pa?=
 =?utf-8?Q?Xj5LBsth9g+WXDrNUcTscoptTp98As=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXE0NUJXQ1h6OU1YMWJibkt5cXpwYkE0bjhqRlhxNWxPRUcrSmp0WmVTV0RI?=
 =?utf-8?B?UngrbVhNdE81OGZ2RlZVeGp4aWdzYi9MbnJ4bzJvcmcxQ0d1THpQamV6aXE3?=
 =?utf-8?B?YzdwYzJGczVIOW4ySHArVzVGaDE3ZnlFQ3R5Zjk1RExHL1lWWEJGTmFGTlhj?=
 =?utf-8?B?YkZMRTB3NWxMNnVycTljT29PNHJhQjJWSTNQQnRZTGd1NUQ1VlFpeWhwaHM2?=
 =?utf-8?B?aithNC9oL00wTVBIdGtmTmxxMTlHOS94clJkTXhxZjYvb1hIL3UzR2M2Qk1o?=
 =?utf-8?B?RUtNdE9va2hKb05OUHllSHNHdTg5UlNBVUJOQkNVNDh5L1RmZTl6UlBoK1VE?=
 =?utf-8?B?R3NOeXY0VWE5QkF3cHVxWEVnMmptYnZ2cjZqVDZBbVFRb1RkVjBUeUl2aUVn?=
 =?utf-8?B?Qm1LYStGc2tXMmp2U2VBcFlaMXVwaDBUNFdkM1F3bUhJcm9ScDB1MXZhZjhQ?=
 =?utf-8?B?dUJ6Nk9XWFZwOHJhMlgvY1pGSThIbUYvVEhKK2J2V0pHd05MVy9PQUh6L0lN?=
 =?utf-8?B?dFpmbGdsSzdEd01ndHlSRzUzWDMxMUk0SG9Ib0xzOW5sL3RmbW00aUFham91?=
 =?utf-8?B?dTlqTm01WE80WnA2a3FlM0pHTG5FRGVUUGdjRUh4YlZzcjNaOVZZaFVMbEMx?=
 =?utf-8?B?TWVrTDE2c3NqaTVsbFl6bkUyZHJrYUlodjdUU2RINTZ0RjIvVjBIVEZITms3?=
 =?utf-8?B?WU9Wb2E2SWU0Y25SVnBlcE92aHJtejNUUWxXWGpVYjF3SjVxaDBUeVhDT3ZB?=
 =?utf-8?B?RURJRWR4K0hkcmZnblFFVU1BUlIzVVJwdFRPZHhJS0h5c0J2NnA4Y1hvRDcz?=
 =?utf-8?B?MGIyTFJZWkl2U0N6Smo1THpRNnpPNzFYUDU4OTBZQ1YraFNJYitaS1N0d0tj?=
 =?utf-8?B?NmlkQUZpcmVHbEllU2RXY0NlNmFGaGZFVi95bit5Tlo4a0VlOFVVV1BvTEtr?=
 =?utf-8?B?V1NJWXptWG5nVE9jUmR0NDZvblRid042TE5JMXJhcktwUERYMUJzN2R0WjBK?=
 =?utf-8?B?L0tSa2djb25lN1RaeFFoUVhyWjJnS1VsenRuL2tiTnBFcXFyd0dkNXZGVHY3?=
 =?utf-8?B?R0t6U3djY1F5bWsxZXJBTXR4dzdFUHg2TVpmZEtWeUJINVRyZ3hSK0NXa3J6?=
 =?utf-8?B?Znp3Wlp0eWJvM0c3Mkc1TmYxUEYydVFvTDJkZmtDZVRrQ0M5aTV0OGE5SE9H?=
 =?utf-8?B?V2VhY0t1VkE2OU5PWUtoV0x3YjBxd0tSMllpeXJNaDNIZmUyMXhJQWN4Q0N5?=
 =?utf-8?B?Y1pBSFV2ZktrSTRtK25HRVhhTGhzLzBCcC9TdElmak1lNVd2RkIyNDdZcTBQ?=
 =?utf-8?B?a3hXdUlhMGttazBqYU5KTUQzc1UybXcrMVcvdnNXaUw4UklFN1l1MnpETnJ0?=
 =?utf-8?B?V09Gc3ZRMVJqUU9SSGp5alVkT05IdTZjUi9WYTkvcHdqT2JWamJhV0Zjdysz?=
 =?utf-8?B?OWNKK293VktjYXl2R0hmM0dUeEdLUDVJdWIxN3NBVVVnTDdYaXR3R2lDelNH?=
 =?utf-8?B?TmFWSFJQZ0lGYkxmQ21TUWZhbnRvNlFOaUpnOWJZd2MwdUNyaWtqN24rMFBu?=
 =?utf-8?B?UkJmSXRWcXZBZUM4UFJYWFJ4cFR1bWlVUGZRRHhHcFhuSG84OHJWajE5TmZP?=
 =?utf-8?B?RHlhT3NwMUM5OHlZalV1UWsxNjVBamdua0hPYjZubWdlZFhhekVTWGhCZjVl?=
 =?utf-8?B?N1hjdG82czA1YzFaemVPQjhKYjVYUkpIY3hTNHVWVTR1U3NZMElCMjVaRWdK?=
 =?utf-8?B?ZWhkWUlxNGtjeUtORG4zTENyYUJBQzg5RkNSd2xaS2FhR3NUem1kSEs4SzB4?=
 =?utf-8?B?R0tYUFQwQk1HdDZkc2t0VG9oMzFtemo1bmZOeitKemd5NjZ6WVVvWm9QL2JJ?=
 =?utf-8?B?TW90aTA0djY0Vk9zS2ZlREF6emwxOXAzM1I1eHUwOHVNcEhaVDlaeU80b0wv?=
 =?utf-8?B?cVh5Q1pzam1vNGVZWlpxd0R4OXB3T2N1VjVCUnhDRHNGVzdWNWFySHJncE96?=
 =?utf-8?B?Z3ltdngrM3gxejg4MWxFYmplbUhuS08rQlNEK0ExcjNRRXhPSS90bk5wa0Zw?=
 =?utf-8?B?eGg0K1JTU3E5UEhVQWpQWXFVdnVJRkxWQW9MOFI2NGdMZFVpK054ZkcyZ3hp?=
 =?utf-8?Q?ZQSU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ae6714-011c-482a-a3fb-08de15f7c2cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:58:20.6033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNGIqu9yxZ+z10s7d8+x+m/riwNOfbzll9JYKREJaaVC7dbppzJ7sjK2UhU9sR4o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
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

On 10/27/25 09:12, Thomas Zimmermann wrote:
> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
> 
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
> 
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
> 
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.

> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      | 12 +------
>  drivers/gpu/drm/drm_fb_helper.c            | 39 +++++++---------------
>  drivers/gpu/drm/drm_fbdev_dma.c            | 12 ++-----
>  drivers/gpu/drm/drm_fbdev_shmem.c          | 12 ++-----
>  drivers/gpu/drm/drm_fbdev_ttm.c            | 12 ++-----
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  9 +----
>  drivers/gpu/drm/gma500/fbdev.c             | 12 +------
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  9 +----
>  drivers/gpu/drm/msm/msm_fbdev.c            |  9 +----
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  9 +----
>  drivers/gpu/drm/radeon/radeon_fbdev.c      | 13 +-------
>  drivers/gpu/drm/tegra/fbdev.c              |  9 +----
>  include/drm/drm_fb_helper.h                | 12 -------
>  13 files changed, 26 insertions(+), 143 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index 22e2081bfa04..601b2aad243b 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -43,10 +43,10 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
>  				    struct drm_fb_helper_surface_size *sizes)
>  {
>  	struct drm_device *dev = fbh->dev;
> +	struct fb_info *info = fbh->info;
>  	struct drm_mode_fb_cmd2 mode;
>  	struct armada_framebuffer *dfb;
>  	struct armada_gem_object *obj;
> -	struct fb_info *info;
>  	int size, ret;
>  	void *ptr;
>  
> @@ -90,12 +90,6 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
>  	if (IS_ERR(dfb))
>  		return PTR_ERR(dfb);
>  
> -	info = drm_fb_helper_alloc_info(fbh);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_fballoc;
> -	}
> -
>  	info->fbops = &armada_fb_ops;
>  	info->fix.smem_start = obj->phys_addr;
>  	info->fix.smem_len = obj->obj.size;
> @@ -111,8 +105,4 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
>  		(unsigned long long)obj->phys_addr);
>  
>  	return 0;
> -
> - err_fballoc:
> -	dfb->fb.funcs->destroy(&dfb->fb);
> -	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 53e9dc0543de..dd80f5c5feec 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -495,20 +495,7 @@ int drm_fb_helper_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_init);
>  
> -/**
> - * drm_fb_helper_alloc_info - allocate fb_info and some of its members
> - * @fb_helper: driver-allocated fbdev helper
> - *
> - * A helper to alloc fb_info and the member cmap. Called by the driver
> - * within the struct &drm_driver.fbdev_probe callback function. Drivers do
> - * not need to release the allocated fb_info structure themselves, this is
> - * automatically done when calling drm_fb_helper_fini().
> - *
> - * RETURNS:
> - * fb_info pointer if things went okay, pointer containing error code
> - * otherwise
> - */
> -struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
> +static struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>  {
>  	struct device *dev = fb_helper->dev->dev;
>  	struct fb_info *info;
> @@ -535,17 +522,8 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>  	framebuffer_release(info);
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL(drm_fb_helper_alloc_info);
>  
> -/**
> - * drm_fb_helper_release_info - release fb_info and its members
> - * @fb_helper: driver-allocated fbdev helper
> - *
> - * A helper to release fb_info and the member cmap.  Drivers do not
> - * need to release the allocated fb_info structure themselves, this is
> - * automatically done when calling drm_fb_helper_fini().
> - */
> -void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
> +static void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
>  {
>  	struct fb_info *info = fb_helper->info;
>  
> @@ -558,7 +536,6 @@ void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
>  		fb_dealloc_cmap(&info->cmap);
>  	framebuffer_release(info);
>  }
> -EXPORT_SYMBOL(drm_fb_helper_release_info);
>  
>  /**
>   * drm_fb_helper_unregister_info - unregister fb_info framebuffer device
> @@ -1809,6 +1786,11 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>  	height = dev->mode_config.max_height;
>  
>  	drm_client_modeset_probe(&fb_helper->client, width, height);
> +
> +	info = drm_fb_helper_alloc_info(fb_helper);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
>  	ret = drm_fb_helper_single_fb_probe(fb_helper);
>  	if (ret < 0) {
>  		if (ret == -EAGAIN) {
> @@ -1817,13 +1799,12 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>  		}
>  		mutex_unlock(&fb_helper->lock);
>  
> -		return ret;
> +		goto err_drm_fb_helper_release_info;
>  	}
>  	drm_setup_crtcs_fb(fb_helper);
>  
>  	fb_helper->deferred_setup = false;
>  
> -	info = fb_helper->info;
>  	info->var.pixclock = 0;
>  
>  	/* Need to drop locks to avoid recursive deadlock in
> @@ -1846,6 +1827,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>  	mutex_unlock(&kernel_fb_helper_lock);
>  
>  	return 0;
> +
> +err_drm_fb_helper_release_info:
> +	drm_fb_helper_release_info(fb_helper);
> +	return ret;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index c6196293e424..442d964039b7 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -268,9 +268,9 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_device *dev = fb_helper->dev;
> +	struct fb_info *info = fb_helper->info;
>  	struct drm_client_buffer *buffer;
>  	struct drm_framebuffer *fb;
> -	struct fb_info *info;
>  	u32 format;
>  	struct iosys_map map;
>  	int ret;
> @@ -300,12 +300,6 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->buffer = buffer;
>  	fb_helper->fb = fb;
>  
> -	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_drm_client_buffer_vunmap;
> -	}
> -
>  	drm_fb_helper_fill_info(info, fb_helper, sizes);
>  
>  	if (fb->funcs->dirty)
> @@ -313,12 +307,10 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	else
>  		ret = drm_fbdev_dma_driver_fbdev_probe_tail(fb_helper, sizes);
>  	if (ret)
> -		goto err_drm_fb_helper_release_info;
> +		goto err_drm_client_buffer_vunmap;
>  
>  	return 0;
>  
> -err_drm_fb_helper_release_info:
> -	drm_fb_helper_release_info(fb_helper);
>  err_drm_client_buffer_vunmap:
>  	fb_helper->fb = NULL;
>  	fb_helper->buffer = NULL;
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 51573058df6f..2190e2230b83 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -134,10 +134,10 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_device *dev = fb_helper->dev;
> +	struct fb_info *info = fb_helper->info;
>  	struct drm_client_buffer *buffer;
>  	struct drm_gem_shmem_object *shmem;
>  	struct drm_framebuffer *fb;
> -	struct fb_info *info;
>  	u32 format;
>  	struct iosys_map map;
>  	int ret;
> @@ -167,12 +167,6 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->buffer = buffer;
>  	fb_helper->fb = fb;
>  
> -	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_drm_client_buffer_vunmap;
> -	}
> -
>  	drm_fb_helper_fill_info(info, fb_helper, sizes);
>  
>  	info->fbops = &drm_fbdev_shmem_fb_ops;
> @@ -193,12 +187,10 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	info->fbdefio = &fb_helper->fbdefio;
>  	ret = fb_deferred_io_init(info);
>  	if (ret)
> -		goto err_drm_fb_helper_release_info;
> +		goto err_drm_client_buffer_vunmap;
>  
>  	return 0;
>  
> -err_drm_fb_helper_release_info:
> -	drm_fb_helper_release_info(fb_helper);
>  err_drm_client_buffer_vunmap:
>  	fb_helper->fb = NULL;
>  	fb_helper->buffer = NULL;
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
> index ccf460fbc1f0..3a06c2b59a8d 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -174,8 +174,8 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_device *dev = fb_helper->dev;
> +	struct fb_info *info = fb_helper->info;
>  	struct drm_client_buffer *buffer;
> -	struct fb_info *info;
>  	size_t screen_size;
>  	void *screen_buffer;
>  	u32 format;
> @@ -203,12 +203,6 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  		goto err_drm_client_framebuffer_delete;
>  	}
>  
> -	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_vfree;
> -	}
> -
>  	drm_fb_helper_fill_info(info, fb_helper, sizes);
>  
>  	info->fbops = &drm_fbdev_ttm_fb_ops;
> @@ -225,12 +219,10 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	info->fbdefio = &fb_helper->fbdefio;
>  	ret = fb_deferred_io_init(info);
>  	if (ret)
> -		goto err_drm_fb_helper_release_info;
> +		goto err_vfree;
>  
>  	return 0;
>  
> -err_drm_fb_helper_release_info:
> -	drm_fb_helper_release_info(fb_helper);
>  err_vfree:
>  	vfree(screen_buffer);
>  err_drm_client_framebuffer_delete:
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index a3bd21a827ad..539ce0a87886 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -57,18 +57,11 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  				   struct drm_fb_helper_surface_size *sizes,
>  				   struct exynos_drm_gem *exynos_gem)
>  {
> -	struct fb_info *fbi;
> +	struct fb_info *fbi = helper->info;
>  	struct drm_framebuffer *fb = helper->fb;
>  	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
>  	unsigned long offset;
>  
> -	fbi = drm_fb_helper_alloc_info(helper);
> -	if (IS_ERR(fbi)) {
> -		DRM_DEV_ERROR(to_dma_dev(helper->dev),
> -			      "failed to allocate fb info.\n");
> -		return PTR_ERR(fbi);
> -	}
> -
>  	fbi->fbops = &exynos_drm_fb_ops;
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> index bc92fa24a1e2..c26926babc2a 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -108,7 +108,7 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	struct drm_device *dev = fb_helper->dev;
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct fb_info *info;
> +	struct fb_info *info = fb_helper->info;
>  	struct drm_framebuffer *fb;
>  	struct drm_mode_fb_cmd2 mode_cmd = { };
>  	int size;
> @@ -167,12 +167,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->funcs = &psb_fbdev_fb_helper_funcs;
>  	fb_helper->fb = fb;
>  
> -	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_drm_framebuffer_unregister_private;
> -	}
> -
>  	info->fbops = &psb_fbdev_fb_ops;
>  
>  	/* Accessed stolen memory directly */
> @@ -196,10 +190,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  
>  	return 0;
>  
> -err_drm_framebuffer_unregister_private:
> -	drm_framebuffer_unregister_private(fb);
> -	drm_framebuffer_cleanup(fb);
> -	kfree(fb);
>  err_drm_gem_object_put:
>  	drm_gem_object_put(obj);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index e5449c41cfa1..9cd03e2adeb2 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -267,8 +267,8 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	struct intel_display *display = to_intel_display(helper->dev);
>  	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>  	struct intel_framebuffer *fb = ifbdev->fb;
> +	struct fb_info *info = helper->info;
>  	struct ref_tracker *wakeref;
> -	struct fb_info *info;
>  	struct i915_vma *vma;
>  	unsigned long flags = 0;
>  	bool prealloc = false;
> @@ -318,13 +318,6 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto out_unlock;
>  	}
>  
> -	info = drm_fb_helper_alloc_info(helper);
> -	if (IS_ERR(info)) {
> -		drm_err(display->drm, "Failed to allocate fb_info (%pe)\n", info);
> -		ret = PTR_ERR(info);
> -		goto out_unpin;
> -	}
> -
>  	helper->funcs = &intel_fb_helper_funcs;
>  	helper->fb = &fb->base;
>  
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index aad6fb77f0de..fd19995b12b5 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -91,9 +91,9 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  {
>  	struct drm_device *dev = helper->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
> +	struct fb_info *fbi = helper->info;
>  	struct drm_framebuffer *fb = NULL;
>  	struct drm_gem_object *bo;
> -	struct fb_info *fbi = NULL;
>  	uint64_t paddr;
>  	uint32_t format;
>  	int ret, pitch;
> @@ -126,13 +126,6 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto fail;
>  	}
>  
> -	fbi = drm_fb_helper_alloc_info(helper);
> -	if (IS_ERR(fbi)) {
> -		DRM_DEV_ERROR(dev->dev, "failed to allocate fb info\n");
> -		ret = PTR_ERR(fbi);
> -		goto fail;
> -	}
> -
>  	DBG("fbi=%p, dev=%p", fbi, dev);
>  
>  	helper->funcs = &msm_fbdev_helper_funcs;
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index b5df2923d2a6..c4671ab87f9c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -153,9 +153,9 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	struct drm_device *dev = helper->dev;
>  	struct omap_drm_private *priv = dev->dev_private;
>  	struct omap_fbdev *fbdev = priv->fbdev;
> +	struct fb_info *fbi = helper->info;
>  	struct drm_framebuffer *fb = NULL;
>  	union omap_gem_size gsize;
> -	struct fb_info *fbi = NULL;
>  	struct drm_mode_fb_cmd2 mode_cmd = {0};
>  	struct drm_gem_object *bo;
>  	dma_addr_t dma_addr;
> @@ -224,13 +224,6 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto fail;
>  	}
>  
> -	fbi = drm_fb_helper_alloc_info(helper);
> -	if (IS_ERR(fbi)) {
> -		dev_err(dev->dev, "failed to allocate fb info\n");
> -		ret = PTR_ERR(fbi);
> -		goto fail;
> -	}
> -
>  	DBG("fbi=%p, dev=%p", fbi, dev);
>  
>  	helper->funcs = &omap_fbdev_helper_funcs;
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index 4df6c9167bf0..1b469b2b4b04 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -204,7 +204,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	struct radeon_device *rdev = fb_helper->dev->dev_private;
>  	const struct drm_format_info *format_info;
>  	struct drm_mode_fb_cmd2 mode_cmd = { };
> -	struct fb_info *info;
> +	struct fb_info *info = fb_helper->info;
>  	struct drm_gem_object *gobj;
>  	struct radeon_bo *rbo;
>  	struct drm_framebuffer *fb;
> @@ -245,13 +245,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
>  	fb_helper->fb = fb;
>  
> -	/* okay we have an object now allocate the framebuffer */
> -	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info)) {
> -		ret = PTR_ERR(info);
> -		goto err_drm_framebuffer_unregister_private;
> -	}
> -
>  	info->fbops = &radeon_fbdev_fb_ops;
>  
>  	/* radeon resume is fragile and needs a vt switch to help it along */
> @@ -277,10 +270,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  
>  	return 0;
>  
> -err_drm_framebuffer_unregister_private:
> -	fb_helper->fb = NULL;
> -	drm_framebuffer_unregister_private(fb);
> -	drm_framebuffer_cleanup(fb);
>  err_kfree:
>  	kfree(fb);
>  err_radeon_fbdev_destroy_pinned_object:
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 91aece6f34e0..8f40882aa76e 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -73,10 +73,10 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	struct tegra_drm *tegra = helper->dev->dev_private;
>  	struct drm_device *drm = helper->dev;
>  	struct drm_mode_fb_cmd2 cmd = { 0 };
> +	struct fb_info *info = helper->info;
>  	unsigned int bytes_per_pixel;
>  	struct drm_framebuffer *fb;
>  	unsigned long offset;
> -	struct fb_info *info;
>  	struct tegra_bo *bo;
>  	size_t size;
>  	int err;
> @@ -97,13 +97,6 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	info = drm_fb_helper_alloc_info(helper);
> -	if (IS_ERR(info)) {
> -		dev_err(drm->dev, "failed to allocate framebuffer info\n");
> -		drm_gem_object_put(&bo->gem);
> -		return PTR_ERR(info);
> -	}
> -
>  	fb = tegra_fb_alloc(drm,
>  			    drm_get_format_info(drm, cmd.pixel_format, cmd.modifier[0]),
>  			    &cmd, &bo, 1);
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index c1d38d54a112..2faf8aaf98dc 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -256,8 +256,6 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  
>  int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
>  
> -struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
> -void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
>  void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper);
>  void drm_fb_helper_fill_info(struct fb_info *info,
>  			     struct drm_fb_helper *fb_helper,
> @@ -340,16 +338,6 @@ drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
>  	return 0;
>  }
>  
> -static inline struct fb_info *
> -drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
> -{
> -	return NULL;
> -}
> -
> -static inline void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
> -{
> -}
> -
>  static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>  {
>  }
> 
> base-commit: c03916cb446b6eefe91538599775bb54bf98238c

