Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FAA74B038
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 13:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16710E566;
	Fri,  7 Jul 2023 11:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979D110E565;
 Fri,  7 Jul 2023 11:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfpRTPKImpyQIFi1LW/t50VP1fA4kV0nQ2hcreCseLDzGa68YX9oSlRy+tBvA7ook3hhGgS1og6z+OuUu4pwrSAvP32ndhl3MyKcPA5VCEEgq514imbv4DFUl9fTNC9HnQoxrT9NvDhdxozAa44RTld7mz4XtFsz9jRQNpmgmm1vTTyT/U1JiQKYUKx0EHmMuXBhrtOn31a+A8UZxt0MlvgVQh+kUvl9nNllcctpT4vI+6JvtI5JY+pL1cuqjQzWhHE4hR6iP9R/AZ1mdq16OHB18FXwsJU/3nS/U+8Xj1wAVKExUF141jXmMQdaQJZVoT80tZDxPTwY/OZ3ttXgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZbSH6GeZu3srC+GdbtTg2oAHRVOJPBiweUAIaclw60=;
 b=ij5EHHWAvv9BofHcdHP3CPFZChQTJIaNdyMIjJ5xmP2QyAltxuiKedauOvMETJd5bkQdaID7dG88+Jc2mZON1w2o/LmrNFY2yjLfzpZGu9k3/U09iGshYcqx47vFnPLi/7+0ww4REtUU40TH3q6lDGlxZfn7IuSqPojhXEgxASdc4BBBTXsbZ8+j+keLC/5TIOJoMpdMLpA+yNng8LUUvNkPT+rhcoYe1iDrrZGmbVvKdPQNHtpGVMVz1KIcM+vVOy4fAJB42fF9pYwUq3wHbqcpY8AzuoYqiA4sKDVLcAa6IIxpnWNarawmFCVsmf+ImIiFYXuhyhCPXzV86z4BeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZbSH6GeZu3srC+GdbtTg2oAHRVOJPBiweUAIaclw60=;
 b=tnmni/nC5sYnXdDd1zgpiOe1JHArfhrM4rBDlXqL0ZTzRnI6cdUZk4YJcqyXrqI2euBKyT1KeO1A4Nfm0t7pveEqxuxwxqKNEfkz6nzkaCSfRQb/RkCtqEVkS4Hw14RJYQIMdrm6Th9i64Vy7Wfbsobcme77CvRff6IhjaCRQOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5339.namprd12.prod.outlook.com (2603:10b6:408:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 11:47:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e8c1:b961:25c0:1fb0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e8c1:b961:25c0:1fb0%6]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 11:47:16 +0000
Message-ID: <f32098e2-d680-d02e-8181-cad76daf2416@amd.com>
Date: Fri, 7 Jul 2023 13:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] [v2] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230707111157.209432-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230707111157.209432-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4db5d6-41c1-41bd-a048-08db7edfe8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncLggLZDVf7Fu6KSVLwfpm80V7bSHbHVW6BRTc4kG6oIxnXJzBGLDtxDzItBjAGvklR2/xkF9dCU9hXo2ujT+6va4E90esJRBSmCYCVrV7PMYr7FcreyR1LdRsPtiz2D6xeZSmXhwy7Ytu1UMkngslQww7f74Axnj1OelqwGcaVCE5u1ZIXKj2TYZ85YkktNxVDE8bp1vn4+5ISnRtoUD9gEkB8N9Xi3kclB6HycryUoEcI6pHfxXH4S4QjaGl/yDQhTLxdcvP+wz/ouBonrFNNQTpptCVfdMFuwigvpoe4HbY50vXx363uQvRi5oq9hcIQIFPNRcsCsZseUSHh+WHnAF9fTNIqI6o18N3A6/HzSF94WP9gpqSkxzn3CC9iqd7fdUWdffWD3Mcp+lVR9MF0FzA26ntO8TCIlXboVa6c5XWfty7kn/nZHlznlCBr5hhpp6HIefwQgSTAInur8eHP1tpeUsM/a0gBjnc+ULApklNKHWd/yLbLKDZJcHqEh0PfxbubUSkbbJDBNkm4CqZ8IbqhIavimfvCaMoK0r9XC6znSC/amYuZ+enVCA1Zw6qqBFNLz3cEN2yxcRTXDxkM9rxdk3Qilu9kEBRVCiBap2RfCsLL2BVnWT7KKUnPN/IVy5lFfKadB5cyNBDHvoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(316002)(8676002)(66574015)(83380400001)(2616005)(2906002)(66556008)(4326008)(66476007)(66946007)(6666004)(110136005)(6486002)(54906003)(478600001)(5660300002)(6512007)(186003)(6506007)(41300700001)(8936002)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJOVG41d0I5YW52UDNhMDh3SGx1ZThmWFZNRFZ4WXh5QndCWkVFUzlrZ0xp?=
 =?utf-8?B?UVdTd243WjdtWHU3dmp4bGhNcEZsaGFleW4zZFFiQVJFVUtaRk5YUHk0bUlq?=
 =?utf-8?B?SkRxM3NUM2RiM0JPVWNXL1lraHNVd200cmU2UTFrUmZTaTMrWE55ZDl0ejdR?=
 =?utf-8?B?bDYzYUJxandVZEttMTRPdzhUdUk0UllkV0Q5V0NsZDhrNWJhY1VSQk1nV293?=
 =?utf-8?B?WlFYaVJDZXNkTlZjU3pqV3p0OW9xK3QwVHd4czhtOVZYNlp3SHJnQ21wVUhK?=
 =?utf-8?B?K3hnWlJGTnl6TVU4cC9HVHlINVR1QmxzZkNnTnBBN3Y3R1RqWVpnWkM3UndF?=
 =?utf-8?B?UHB4TXBsUjJYQlM5RXhvMUh2RzMreFZZTWtTWTBwV2JueGZtYnovQjNiQjIy?=
 =?utf-8?B?NkVhd0hYZjR0QU9UMDV1bFppZW1FcmxnMmtwSzFXUktRL3dVRGcwUGtVeHFD?=
 =?utf-8?B?cVUzU2tSUE56YlVQTEdiQTg5TGdaUGlueVpxeGN2dkxabTBwZlVkNmpFTmVj?=
 =?utf-8?B?azdlS1ExRHZWRkd5cjdZMnV4NHVLcDB0R051OWhDczF1UkI2dVZ0cC9QMktR?=
 =?utf-8?B?ejczTGk3RUdYZDdkUElJcjRUK3lsS1V0WFNXSDFtNzJoTEovUW5VQk5od3Qz?=
 =?utf-8?B?T1VNUWF3VGNmL2RJVHdHT0tDU2tmUjJWYmdCeFljZkZyRWZIYm9UWWRuTzln?=
 =?utf-8?B?c0F1M21aanN3bHBKcUltVEVPV3NubTlqanNza0U1OU5rQnp0MDZCcXZRSVh5?=
 =?utf-8?B?SEczRnloWWtqVGVLclVTVHgraTFheFRmMDJqV2syMGR5OFpjTkxuRWtJTkV5?=
 =?utf-8?B?U2JmUEQzRUdIQzhIM3lGUVdYYVpwZ1BoMmcwOEo2QWNEd2YvcVlyU2wxRFhp?=
 =?utf-8?B?dTJvb0NLVFZ5MHpLT0lDR0VGTzJEbTdmZW5Cb1lBWkVwOWxRUEFiQlJtN2dh?=
 =?utf-8?B?YmtBY3FWcnNqK0YxMFlWQWE2UXNneXVGY0cvWm9pMC8ybjZ1NEY1QWtERjBa?=
 =?utf-8?B?dXV4L0VtSXRjd0lYaTRWbWF6YkxROG1OYWEyNk5WWVdmRGl5aEpscWhqNFpP?=
 =?utf-8?B?aktzTzJhWmk3YTNQdUtSR2w2QWFuOTA4S2c2eTZVNmI5RTY1UVF0aEhDUnd4?=
 =?utf-8?B?d1B3SUFySElocWsxOUhzUDdRakVRWXVmMk5Ra2RmY3REbWRPUk1CL2cvUHNi?=
 =?utf-8?B?bXZ2Y0pYSVVGN3RyU1BkOUk5bnIzcURobzhsRWNhSU01QU83MlpOQVhEcTNw?=
 =?utf-8?B?NEh0V1B3S1d2VGFlMStJMFdQUVQvQ1pubjJxL2RkZTVWZGlML0QxbjhhODNG?=
 =?utf-8?B?bVh3R0ZkWnc1b2plOGw2bFZYck42L09KSlVVMktXblNQYVdaUWw0YmdDcktF?=
 =?utf-8?B?SkNjQTFienhJczF6bEdBV3VkbFdPbHZJVGQyZXRXV3hUcGlncUJlZW83R3Y4?=
 =?utf-8?B?WkVvYVU1SXZZcUxDdkltQzhzRDB1Z3Q4bnFXMVJ2WjdrakZGWkxGNGF4T3U1?=
 =?utf-8?B?c0huTHdjRXIwZHk3dkpnQXlyRTg2NVpldkZBRzRPS1l6ZkVxcUpjOVh5QTcv?=
 =?utf-8?B?YlYrMUFGOE9hOTFLcCt3cVhXUkt3bzR3OXh2cFNNZWdKblBtd2hxeVhPNWlD?=
 =?utf-8?B?T2tGckRiS2w5Q3BKeE5LM0Z5bmJQS0xESk92WkkxdkJUYkt4dStaRERPRFJU?=
 =?utf-8?B?bXlQZGtuVjJaSXRqWVNodEZUbkFtN3FQQm5qQjdnd1l2TkZ5eDRxaWlvSTVi?=
 =?utf-8?B?bjI3YkRWbFdDY1UvQWdqUUdQMkNsY0M4RHViQnhNUlZRL0JXUkVVZkRUOUpu?=
 =?utf-8?B?ZFFRRE4vbnQrVmd5YWJ6REVrajBVaWdJdzFiMTVEV2hhZ3hrNGUvUytJRTFD?=
 =?utf-8?B?UU1NZU94QXZlVzZVbE40N2xqQUVlc1Y3REV1bDFMZk5ONng3Z0k5NzVmYXVa?=
 =?utf-8?B?TzkvOGFnVEI2SWdPMWllV0t5WGRlOVpweUZkYzgraGVkaXcxeVRhQU5jVVB4?=
 =?utf-8?B?NWc3MkZRd0ZNY2R2VC94Wm9VTk1XSnJNUmV3a0ZYWVl5Uyt5YXZJckkyZWJk?=
 =?utf-8?B?NEhvemc2OTRtTmgzVy9vTEViUy9mVGtBaDA0dDdFWE1PUlZGMTBKS003MGFU?=
 =?utf-8?B?ajhvb2F5TFlodG94S0ZXRENTMkQzbUFVblB2SUV0S094THJyVUVhelo2NHJH?=
 =?utf-8?Q?CziGD1856cF2ScvOH3/8I0C6D1G8sRglsyxDBij81OFx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4db5d6-41c1-41bd-a048-08db7edfe8c5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 11:47:15.4349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEvr45XkBTWLT4Kr3yCVJ+VZZCDF5jlAWBDwptgmRuyZGjIWjxYV4Prbwyc+/xUN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5339
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 linux-kernel@vger.kernel.org, Shiwu Zhang <shiwu.zhang@amd.com>,
 Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.23 um 13:11 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> On 32-bit architectures comparing a resource against a value larger than
> U32_MAX can cause a warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                      res->start > 0x100000000ull)
>                      ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>
> As gcc does not warn about this in dead code, add an IS_ENABLED() check at
> the start of the function. This will always return success but not actually resize
> the BAR on 32-bit architectures without high memory, which is exactly what
> we want here, as the driver can fall back to bank switching the VRAM
> access.
>
> Fixes: 31b8adab3247e ("drm/amdgpu: require a root bus window above 4GB for BAR resize")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v2: return early instead of shutting up the warning with a cast and
> running into a failure
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7f069e1731fee..fcf5f07c47751 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>   	u16 cmd;
>   	int r;
>   
> +	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> +		return 0;
> +
>   	/* Bypass for VF */
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;

