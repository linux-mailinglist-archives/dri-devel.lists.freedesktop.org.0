Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23EF3D2C9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ABC6E84F;
	Thu, 22 Jul 2021 19:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E33D6E84F;
 Thu, 22 Jul 2021 19:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MozLo7GnRgocN9e0wteTXcXq44WTJVffl/Kbbr4mz0bVNH8KVstvwzunQm32lAtouqKMnx99xpveP8MzB6axB2dH0YGLMxqKXhMX2y7EAaKKYiuO/0YyFV/yWoKgWBA8HnwL644oVgan5aUX8ZDHDcNrJw9aWYFB/ZrFoJSZEKVwk7iiGPbRDVM5lExJF+FAtw8AnDzxj7I1kQuIuJfzuRKAQxe5IH2YS21DzS+9uoJ6HBwJ7FyO8Ym29ChJhb6yKqcRd7D9cE1ZtvCwNOwyznvAk+SVh36zaO0+3UKc/L8Id9Rl3/hHE2KqSn+gyPwXuDcXysZTB7FHD3aPnaWKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2REzenTYSg9PCaQurwCehaLOlMSheR4pQ15YhJat5C4=;
 b=VQqVuXBNm7atkfxcWYAqiCh9E8xyYWzCFQ1VXo6xqBGhwKwsjsFQEtmGtvRW7Fe4AcudZ3YQZ0eztadLrUBc4y3z33VFKWBs8/tv3e5Jd8XZCCDI+udi7pg/Q0yR74faZPtjFoOSLbj/RG05iNBgZHFckrDztq4whZf4QR/025BsZs5FqJ984Mi/ATpD14RamHhRBpK1VtrcXCVoDw/0xf0zW0LQB3tDszs6a01mXnLTEgPxXWPxhhZVW+tSVa2ukr0v3rgCfVmhWRgHqIwA586mN2s8/Bg4ioBIqwh1MvqXewc6shDVHU05hMZPZm5K24PsmbuPi1q7cUoMQLCLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2REzenTYSg9PCaQurwCehaLOlMSheR4pQ15YhJat5C4=;
 b=aFDG4rWledNOb5dHz165abB6Q3QkeTvdOBTjy7fQp7KpG19PxDVoCk1+234niBK8IeR23qEfUK8Go+UvQt9lvJXGf8Lab9VWegLP+euKc/ZhVEvQPfRSVzf424XYaIWQgZw9Mzi66IfqgQn5f8/+DVSA6yKK+14obPSlfYJ3ktw=
Authentication-Results: lists.linuxfoundation.org; dkim=none (message not
 signed) header.d=none;lists.linuxfoundation.org; dmarc=none action=none
 header.from=vmware.com;
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN7PR05MB3955.namprd05.prod.outlook.com (2603:10b6:406:8a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.14; Thu, 22 Jul
 2021 19:17:20 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::b5c1:f355:fee4:c23c]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::b5c1:f355:fee4:c23c%5]) with mapi id 15.20.4373.009; Thu, 22 Jul 2021
 19:17:20 +0000
Subject: Re: [PATCH 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-4-desmondcheongzx@gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <b27a2e80-c912-15eb-e78b-c8b6f3993930@vmware.com>
Date: Thu, 22 Jul 2021 15:17:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210722092929.244629-4-desmondcheongzx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:303:8e::22) To BN8PR05MB6611.namprd05.prod.outlook.com
 (2603:10b6:408:57::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MW4PR03CA0047.namprd03.prod.outlook.com (2603:10b6:303:8e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 19:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a66bffb-6ea9-4950-f098-08d94d455351
X-MS-TrafficTypeDiagnostic: BN7PR05MB3955:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR05MB3955B655F165A20F83AC2686CEE49@BN7PR05MB3955.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HohuSOKLJGlViNfEP2jqBSX8y7PtEjQBVQzIff/rjHt2pBXNrKo0K8PFtZfaxHnaO/qze3colbwoZlVYOlw5uarfoFCgRdpc6oidWqbWN3q9Evofe8i4khcIAtpZ+QVw0kxAnXZ/Yh6/cD5vNv/Gv2Lu1dn20geTlsNiLd/2AAVmlrslzS0/hoL6oqumRzTT+lQr3tIs/KVAZ2ZvnDAqO3ZsOefqCMpuRhm3UWM4x4b4W6Up0vQAgay0Kh2lMnWVfZ0aSZ5tDOzSRAgUnIzxgJm1Bft/sCmu8g9yR1Ni5YmgDXpJFsKDEvq1gqT2p1GNG5azQoG0cWZh+7DwGJbZmwkHW8+K3H/srgQWINJg0Ofv4yDFnviE2JOq2OZfqq4UpF9W2Es9RKdrJBmrb0rYvKmkrhw0rm0dbyxIskJWweZ51eO119Yc78FAlTVGalre4XH0yAjNMi6rOv81zuVtN5nix6rvk1fgmyr1BwE9BwizWcSJ28QahyOC/dc38YtT5M1dp6X2MI2lqQH/MwD7OhS3PU24K6/w5Vkr7bX9wBeIspvdEaBKefIx9+AmeziKpkR8aRefj1E+OTGhb0qtAX7PuUX04Y0KBUEC/KeRed8XbKjmuzuzOHSwiBzp7KgdV8LpcuiArlbMu8hu9/c/bry7rkgZcj9oCETzuGyXnBd+/1uYtHEQ50voVKVmrKok9+mFQIlfV6UI+M9dkesI1m5S/1q2h/4FGeuB7Y0ujwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(316002)(508600001)(66556008)(186003)(86362001)(4744005)(66946007)(53546011)(6666004)(7416002)(83380400001)(2906002)(8676002)(31696002)(16576012)(2616005)(5660300002)(956004)(4326008)(26005)(8936002)(31686004)(66476007)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1Z1dWtYa1RwTWZtNEwyL3NWYWxnckgxMk5pY3dlVjQ4WHVuTVZGeDMxUGJp?=
 =?utf-8?B?YnQ2Yy80U04ramxsVmFzaFp0elNrOUdLdTV1RE40K2MyM2swZGxLSnEwQ3lm?=
 =?utf-8?B?MnhYbTFxY09QN3Faemt6NFdjSnBsdTQrZVF6Q0lndDZNeElaSWVMVmFZTW4z?=
 =?utf-8?B?QXVJOG5LaVlBTWttVW9zdzVXaElmQmk5WENrYXBmZnQrRk9XK29oeVJqcmdv?=
 =?utf-8?B?ZHgvV3EyckhaaE43dnQyRnpON0l1azZVL3FCUW9DT2dHRENDbU4rUzdxaWRu?=
 =?utf-8?B?UkVxSEJHaEFmUkhhb25FVVdGeVpPUGZmWXptcXMxam0xYXdkbkU0elMyU3Rj?=
 =?utf-8?B?TlVXM1hvRVI4T25Eb09KTkx5K212cmx1aStVL3A5elFqRmlBSHErVDloUVFo?=
 =?utf-8?B?U2tURGVITGo2b3BlU3VRQkNzZEh6V0oreFpObnVMNklGcFZvTHJTVkZwL0xP?=
 =?utf-8?B?TkUrNTgwZlJjMi8vWTNHU2JDZjd2empNTG9rNkdYZ3ZiaUVVWkx3TUx3UWFt?=
 =?utf-8?B?dzEra3dFTFd3aHFpN0ZYUlpZdkxUNGdXTFFqcWgyZGVuTTdoVEFQQmJQbkV4?=
 =?utf-8?B?MWhPTWQzQ0lFVVRQbk81MmI4ZSsvZUhaRnFNQjBSUVdxZm56ZkEvalhlOTQ0?=
 =?utf-8?B?TDI1ZDR4anVlNU5jR3RGZjZCaDA1VFc4a0s0aG5jVkxhU2NDTldUbmJOQ3Uw?=
 =?utf-8?B?SkJtSno2OWVua1NXOGgrc3lGSWZKZkQvdmF3SDZGaXM1eW1Qa3FTcW5xSldN?=
 =?utf-8?B?OXRONDF4SDRjbkpWc1V3cFE4R1RCLzhXL1RqbFR1c2pnaDZRQVJ5dVh2VVk4?=
 =?utf-8?B?YURpVFZsRmxsZU9EOHlmVmVMYlRtWmpobnlrcTAzTHhGbFloaElvRy9ESEtN?=
 =?utf-8?B?V3BBTm5zVEdLMmFXanpDeHVJMjhhRjQ4d3hFbHRzMG5GdDR3c1lLS0E5T1ZL?=
 =?utf-8?B?S0NhTnFwOUQxSmp3NnVOWGVJTFlvVkhFUG1lNUFuQXBDU2tlSEpKTUI2UE1Z?=
 =?utf-8?B?UkhPSFhPbG1xRWtkc1RicnN4Vk95NDZDY0hBemo2RUpvWXRUbVVFL2Z2NS84?=
 =?utf-8?B?NUdEeVNqa1BXS0hLTFo0WU1ZSjFnUTd4dHRlU0kvZnlnNVkxRHBka1cwdzFz?=
 =?utf-8?B?cUJIK2x3RjNhZm5ySnErTHpqd2hlZFEzQTBOSXB6NUlpQWN3MU9OM0wwQjdv?=
 =?utf-8?B?T3ZYZFpBcmY1Y2Q4YTRLZThndzR4QmFPbk9sT21KejczSUV2bjc0ZWZjZFhk?=
 =?utf-8?B?U1ptWldOcGMxajhDUFBxNElhOXR5dDB3SHNST2t1VEdvU2tTOTZrSXR1eG11?=
 =?utf-8?B?ZVhyY1d5d2RJYWZLVnZMKzBpVlZrMzM0Umdhc1FIUldlVkJNYllQWFpoaW11?=
 =?utf-8?B?RTVCZlZDTnhFTGQvYUhTVS9lLzBha0tXRWEvRVcvRGtselVRL2VydHJYME1J?=
 =?utf-8?B?T0F3RmRUT2ZKSFVsdk8zaEJWQWZpZWQ4eDN1UE9FWWN4WWp0YlBLWWk3SVlo?=
 =?utf-8?B?ZEI0dFVIZ1RuSzhSa1dRQk1OQ05GRlNKMGFhaEtwYThENDQ4MzI3N3R2Y3Zu?=
 =?utf-8?B?bE5pZ1doK2dJU1VNbEJjTEYxY1orM3lUTTFDQWpUUzV2eXQ3TmVxYlpNY29L?=
 =?utf-8?B?Y0kzZHM3R25peXRxb1lBM2MvLzhub2lFQ3Fkdkt2cUNDbkhTUnFHMjQyZk9t?=
 =?utf-8?B?REZKZVlCSTVVWlJXVE5peCtlVG9uSW1KUS9tS1ltM1VPWGZVVzJ6UUtlRVZn?=
 =?utf-8?Q?odNoNwM3OBPdr/0Y3CHxBLOUhC/x7UPf0MsAbEX?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a66bffb-6ea9-4950-f098-08d94d455351
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 19:17:20.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKbqVp7hO95kIRk1SjInER4GQVD9aSFjVA0Rp0aaDmh8REcxhMXGnSmkpZBtweFLfnIJ6aiMplzmH5pUoRJGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB3955
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/22/21 5:29 AM, Desmond Cheong Zhi Xi wrote:
> drm_file.master should be protected by either drm_device.master_mutex
> or drm_file.master_lookup_lock when being dereferenced. However,
> drm_master_get is called on unprotected file_priv->master pointers in
> vmw_surface_define_ioctl and vmw_gb_surface_define_internal.
> 
> This is fixed by replacing drm_master_get with drm_file_get_master.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Zack Rusin <zackr@vmware.com>

Thanks for taking the time to fix this. Apart from the clear logic error, do you happen to know under what circumstances would this be hit? We have someone looking at writing some vmwgfx specific igt tests and I was wondering if I could add this to the list.

z
