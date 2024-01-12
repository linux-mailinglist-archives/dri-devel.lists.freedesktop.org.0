Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796882BC4C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 09:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A91C10E11B;
	Fri, 12 Jan 2024 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD85210E107;
 Fri, 12 Jan 2024 08:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQwkPmYjLmEdNv+mghYad2FkFWtYSCxqoTE1jL6k4YP+0St9OXsYyN70I+0S605mA00xYQ5ct3vEoljwO3gyKxDlEu8cBlPgnZKKUPwP53sau7J+UCNrahPeN4BketeCkHsHL23/u8DQsJH1iEwsyQb1rw6SZwhk3gaLPVIK9EOIggzT4TEKvKki/2xqeRMTfWLCtEjIfkHvbpTbcjIZqEWdtaolyuMup5mhkCPq9dH1aX2IdE3E0q6Wk0qGMpExNM71Wb6bTURJJo5kz+0xE4l612He5LS3KwBTMO8EkhH0Qsq0frmxfhzmGgiDmFiBuEHv3ZQdArANlYXoQurZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8VZSfcuArfpURE4P9aHRuMHQGADDP9ishzcNcsuh1I=;
 b=FDnHMqlzDa4OEZDs7P7OYd86oj91sx4CK2ByrF277d2pDEpysTGaLtWAOedUjfE3WxSYOCN4iTd6faxR34hc3bqC6ZPLV7HNcfOsMX32gYDzy1XgvvbPA27McgoUWjPDbit8LMwXssMxEXIkB7I4F0pDkvGvHrb7Ns3Ttz2lO/2YmV3dfi0l6QDlGEn3PUt+2SfUAw/8a21tq3Df8/3HXTEID1fMz7KBSAQnGDThoKW2C2udoMzAqBq+TRfZZGR6kC9CJVXLicBCSt4Jy/x+kbbOJr6KnDL9GL6Ln6LWirNJ7rBnFn2MJDtxNn0h6gjn0AdXwccnwpgGjryITcHVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8VZSfcuArfpURE4P9aHRuMHQGADDP9ishzcNcsuh1I=;
 b=HCX3aoW4O6x9rKQdZc8g2bvoGNsokKGDhCPRRZr3hcMv2f97KZDtLKpLHTSLQRIhTMhq/8j9EDlbh/rmpNW4lW/5XGdQkau1wSO39If+kcm4VvQqAMDYadfD6wuCIvZ0epmke8mZOgddL9OaFL3u0EIC8XPfMIQKOA64ZLoZ/oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 08:17:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 08:17:43 +0000
Message-ID: <95e791b0-4672-4a1a-940b-684d8c96e995@amd.com>
Date: Fri, 12 Jan 2024 09:17:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Failed to create a rescuer kthread for the amdgpu-reset-dev
 workqueue
Content-Language: en-US
To: Thomas Perrot <thomas.perrot@bootlin.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, lijo.lazar@amd.com, kenneth.feng@amd.com,
 guchun.chen@amd.com, evan.quan@amd.com, srinivasan.shanmugam@amd.com
References: <cf1a3a2b7599b7b6900ff45aa8b204169411687f.camel@bootlin.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cf1a3a2b7599b7b6900ff45aa8b204169411687f.camel@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 068f7a6f-aaa2-418c-ebe6-08dc1346f398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKMrqMZdCW8/hX1K2CdAnqR1BOb92XZGBnWVGy41ZadztGSNlRzaaVxFvJqo55gdHXtkwMe64h248fyKPprZlnKmWR+1k/lDeBP3MbpxABTwOcWa/cbQjvdfKluuikJL2wlq98kqybfcGQp3XZf13X9YSU7X7vW6s/Yebdjj/XzFAhqvCKH12E3M/1URvhWhpOBBKOyqd3EU+Helig7L/xdlATFoZ2lBwbXeOIOUg6hS8U0LYExAN3JxJvaYceoSKcQzHtZMmGeQ85rZToWV6nTc1873Spu2XBlRGCQu2DrJ2aYnYBZ5Bolz4yHqodFQpbvwLvwobNFZpNKgT7VpZl85kEZFk0VUUne2BTK1g7nosHYJOdLn4kHan8/McZSSW4KhxZrtHRER8+XMng6Bgr+r3G+XZAJWXFFbjeaZQ8lw+hgD8OUQ+4QhxUeT49+UjTNegrTyHwi11ek/owCF5yziEeFO5BIakC/+qpQzSqHjOSrAibOdNrp0Zh1JekG8WmDClaIfZcHS7ewPiqyx4X1jeNHUI47UdHT5v1HejxYdFMD+rDezE3jbP7vvpiDvtBfEYb9OWReKXsHZtPYhODF6LTSgGWFzaObW6ZK4Yz5sckd3rptdOd9ZhuCwLUg+YfbopZlkWukYvOuRpKhang==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(26005)(6512007)(83380400001)(31696002)(36756003)(38100700002)(86362001)(4744005)(6636002)(4326008)(6506007)(6666004)(2616005)(5660300002)(8676002)(66476007)(8936002)(41300700001)(2906002)(66556008)(6486002)(478600001)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRkYmlkNTJMTG1yR2YxMDlkSSs0eStYZW1FK25NWW9iVjM1R1Y3cXpiTUdw?=
 =?utf-8?B?ZXZCZTBZNThBTGRBb3BVVWF5SmJnM3k4R3FZMHF0NmVlVzZSSDJuZGlzWVFj?=
 =?utf-8?B?aVVmcTFXMXRmbEJmZytGQ2dNSE9LTVNES0t5TGNuZzl1T1k5UzdmOTlHcWdi?=
 =?utf-8?B?dVVicEE3dVNrSDZML29TUmhGNlNFZHFiMStDV2tyT0taWU9MWm1VWkRJczdP?=
 =?utf-8?B?ekhaTnJqRCs5TkNrV3ZmOFpiazVzZjQ4cGhQenFuWXFUU01HWmpqRHRFOXpY?=
 =?utf-8?B?QWR3Q1g2WDhYQWFMaWFJbGI1TDVNeHFDdUpNNXUvUUFXdFpqWk9zOVJ5bzlN?=
 =?utf-8?B?dndLZFlTdmdvb3QzSVZhVGpKc2pYcTVhY3JRcm02U0RZcHBzMGlxWVhvYjE4?=
 =?utf-8?B?WlB3N1AzZjNMNmlMSkppR3F3cHJ2NURqaUpmZGZYa0VqaU9KU0FCVG5wOSs5?=
 =?utf-8?B?d2I4V1dYMnJ0ZGdGM2pRNEJaU0FDaVFqY2Zmcjd6aVZpS1czNTd4eXlxaFF1?=
 =?utf-8?B?aXd3cm0rTHNTbDROVGpEUlk3dzIxbGZQVm56anFJaUVLdHU3WDhhVUtCZi9a?=
 =?utf-8?B?Wm5heklzbTBDdEU1WjlDZmJLMGFSZTRHMFhBQkt6eWhnK0lGWjZEVmlvQ3RZ?=
 =?utf-8?B?bjc3dkt5eldhdVNYTndXeTgweWYxYXdFd2o3cm0vZ3JPVlU1TmFoMVBRVUpz?=
 =?utf-8?B?S1F0MVllMHBPT0t5WmFMdU1OZDR6N2pxK1V0aHpCb3VUS2F4aktMNDQycVd6?=
 =?utf-8?B?dlZTeTc5emhIODdiQkNUak5hNGJQbGZnMGFQT05uZnF1SGZVcTlsNFgzZkhl?=
 =?utf-8?B?SFBqZkNRWkpWMnZhcWl6d2FwV1lMcFh4OGFKdEtNMTV1YXFXTGZWSW9Odllp?=
 =?utf-8?B?MWtjZTFqQTVzbldENk1aclo1ako4SVE0aU1UMFFlalU4eVl0RHJsd1VIc0RQ?=
 =?utf-8?B?Q1J4SkNxMEVSLzdxUDhMUWRKVERBYXU4bGxrRWFueUo2cVRjU2tBTDhVanhx?=
 =?utf-8?B?aWhPRm9JaEdMSytFVFhYS2N2dW1zaWtpZDNGSTFxMXhpQ2hsbTZlSk5BdDZu?=
 =?utf-8?B?UzRoVThzRkhyaGRvN0RsS1cwbTcvSUwvWWd0OHZoWnVPaXJCUkVvS3g4NmR3?=
 =?utf-8?B?V0ZOcFF2eDFKVzBvUlJndldkNlB5ZGFpOUtWeG1IdWZPbnlja0dOaWpUYVlj?=
 =?utf-8?B?aU1vbFdPVW94R2NXUjg5L1duRHFkRHcvNDBuazQxTi9jWVRVNlgvb1NuZVV0?=
 =?utf-8?B?TzZDUFVqbkh6VzFOTFZHb1AxUmc5Lzg3UmJQMGJmNlFESEpRNTNJMkwyTnpt?=
 =?utf-8?B?b2VlWm1BVWx2VDMwa3hIVmlJNDhtUXdwVG1McFVmeFFTa3F5QkJzSVBJcHR0?=
 =?utf-8?B?QWp5SnhMZHNScGFzSGxlaWMzSWtHeEk1Q0ErV1FGUjIvbEpmYzJjdzltWS9J?=
 =?utf-8?B?VEVGTHVWS09UaERuaVFMOXE1SHZhc1lGNGJHbHpmakZlWHR4eHVPZ3c3SFV0?=
 =?utf-8?B?VEFzbDRWU0g0a013OVlDYmtWV0lsblRqdFN0Wi9vcmQ3Nmo5WFZMSjR6VS9L?=
 =?utf-8?B?VG1PaUNDTnBmOUlaTVpUZ1NkTTg5MXFIdkRRZ0FBRno0YWpGbWRSVXhia2tM?=
 =?utf-8?B?bzB0Vm8vazNZOVlXRUhCcWJha214clVTOWNUT08xV3E4MTU5OXBpbjlEeTF3?=
 =?utf-8?B?N3pQZGlWazFvVjNXSjJtNHRFQ25TeFpMSHlZVGp6ODd3QW90WTRaWmd1K0w5?=
 =?utf-8?B?aUNEQThsRzVScWRwSUw0ejdnVnFCSWhPNUJHQk5ueWIyK29lNVpYSUtSV2RI?=
 =?utf-8?B?dUtPNklBU0Y0L0o3OW41a3JacEpQRE1OeFlQcDZISWJIMlYvMGx3c0J2U0ZB?=
 =?utf-8?B?V2J6MGlYUW4wOTFyN0JybHNJZ25EcXVkM3BOcHlkRUVvVVhhMVZKSnRtUHN1?=
 =?utf-8?B?UXFZcjIwYmhRZktTbWd1MHN1bkpBZnhQRXFRWWM5ZTVrREpFUEdGRTN4cDVP?=
 =?utf-8?B?bk1nbmpVaGF4dnJma2dQeGplbC9RdTM5OUF1cEMzWFdybFZmVHlhZWJZUVlC?=
 =?utf-8?B?dVdJMW11eEZKTlVnN1hqR2xkNWhTYWlxdHdLT2NueHFEbEZOUXJ1N3ZWTzhx?=
 =?utf-8?Q?lAI/v6VKL231BJetwkK8oLrhp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068f7a6f-aaa2-418c-ebe6-08dc1346f398
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:17:43.7998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRokJ1E+Xe+7lqgcUM/5eulK57q382Jfxv0sO3UZzG2c06/1B1lqazgszeLtUuF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well the driver load is interrupted for some reason.

Have you set any timeout for modprobe?

Regards,
Christian.

Am 12.01.24 um 09:11 schrieb Thomas Perrot:
> Hello,
>
> We are updating the kernel from the 6.1 to the 6.6 and we observe an
> amdgpu’s regression with Radeon RX580 8GB and SiFive Unmatched:
> “workqueue: Failed to create a rescuer kthread for wq 'amdgpu-reset-
> dev': -EINTR
> [drm:amdgpu_reset_create_reset_domain [amdgpu]] *ERROR* Failed to
> allocate wq for amdgpu_reset_domain!
> amdgpu 0000:07:00.0: amdgpu: Fatal error during GPU init
> amdgpu 0000:07:00.0: amdgpu: amdgpu: finishing device.
> amdgpu: probe of 0000:07:00.0 failed with error -12”
>
> We tried to figure it out without success for the moment, do you have
> some advice to identify the root cause and to fix it?
>
> Kind regards,
> Thomas Perrot
>

