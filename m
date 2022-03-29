Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7AE4EA7CA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 08:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD15010F08C;
	Tue, 29 Mar 2022 06:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05E910F08B;
 Tue, 29 Mar 2022 06:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rej9mHCqZ+KIVy0KUm0f6kh52CHOnfxWpXpInFxO0/A9bBU2CVG6r1mglyCG5RK8g33CqTp+qjdpDEdb2y35BKIGFKiB0JAZP9rgf3/PyXKZ1Lp3rayUDHkvwhhClb0k7w1vkc0P+nLaMJ2FQaGyQhW7Txj830PozDgSv3FZS84YYQBz+KKoRhRYYoBkkuYKtq6kDImFV3m9BmMZTEOYBab5OSwVr0Q9lVXjmFy0+8KtKgljamS/SlRONvDgnd1DIN3JPjjzEAvskTMVP1ksERx0TmwZCRzIaEPn7S42ByFZN3zg6/NSZTRZ69O0HuZt1oYf0Qa/trUDdbiPVwtELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vxp2vzAly0ips2c2F5W5tzKWLkT38vOWXCij12+KQ7Y=;
 b=K7qUj+R4jLgp8nkHkj+cTaaIqPdFjXfMtrH3s5GuPL6A1lRrqSFx0YD11iSfEHSBhS1JJGq+GzKwlMDaVXfUPIZkkO1ifqIzzoINnYFNYh41lH3VxdaDizjybU/wsRQNbNJNLfyzcymOB+ps3HrQ255d3trKs6T/haMIhkwEPD9ABZhQWEL15es2rXbyTvoOcFU82pS5e2JCmjSCHAqQIQEiJW3fFxwJrlTgkpCenFP2o+9gqbWrLNF/DCib8A5o+tyGtvsxwrVUzZIxNyIBvkn1VqnW7QfjBXQc8I22K6fXlStY74s3iXaSlGqrGUzE1AfCh57XMf9XxeytDdRIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vxp2vzAly0ips2c2F5W5tzKWLkT38vOWXCij12+KQ7Y=;
 b=WK48mJ8frIDUZxDVygnH4TnB5zyWkYpQtTNjlREfohBhtKSODfsuXN7IknOV7wnX24MH5vyxn9vgbyneKDXgfo9V5OHQ5+dEsJ2FnSoc7o7+Byiyrs5aJgRBtDBwpCuzylOEihl+FkBnHiqMMhkA8AiI4Z2l9gEWmuO52EnjwqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4702.namprd12.prod.outlook.com (2603:10b6:805:e4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 06:20:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 06:20:31 +0000
Message-ID: <ca4bd694-4685-a76c-25ae-65627c36d142@amd.com>
Date: Tue, 29 Mar 2022 08:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH next, v2] kernel: Add 1 ms delay to init handler to fix s3
 resume hang
Content-Language: en-US
To: Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220329030547.286265-1-lizhenneng@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220329030547.286265-1-lizhenneng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc103f2d-cc3e-44ec-559e-08da114c39cc
X-MS-TrafficTypeDiagnostic: SN6PR12MB4702:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47029AC4A1A6AEE09EB8F760831E9@SN6PR12MB4702.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iXZ11hC4kmYNKArAq02XZ5l1098SITW6tzCVTcfoxj3+arpwaGWl+21S6Xy0EuO8sgVBCmxKO8QUUepkpbvvPmF42eYL0DybbeVz7gbVe4vykEFX9iDpvnn0wBCALC9vLduFFN/fEH9tl7iH8BQXKTouvDrIAGsPCWX0ZB8vk6TNmgYAyXvMi+NRDzP1O2I4Xgzh08WpwqfMxMZhd6inILbHx9F0mbuSKS9/g+1x3qt97gWWuVh+T+2ZCk1fY+QrhGAdOTXKze1QEXsLJNI7IcZypXb9e/XXL5laiPT+e0e6An4VrrI/K8z89dhWxItIcj3e2rN7b0hEEhfiL367D6v9Io2lDY/qQ5dvKbqVICDSvzYuUH01suS8nDpQ9qV2iQaVsYER5O5NHwUHGIHHyBv/i1NV+26vFzOfLD8KhGfLM+7A3vG/jU3DrWjTH8WFQnTl/jBcNbdzRd4wtXJ0zULAOwGqDSF1TIr92GSjyysEomShZbCIS4e98zutbhXz1AJmckDk9aQV3xsSF6OT0kfBr2uM8Qfs0hnQxaH/yw0NMnaVUjSaMvd315u7Sfdgzw6phHSq3ZEquHhZa3ivp4okKyblicD9F+Xd39XErorpTnQHvX+p+WBNMjTZSatdOP3PDmEVym9dN4ocyW7YTB2W6pDnQqvpQKY2Im0tdrrNueCKNrItxisU+q6LhzSZAr8itbcQ48Au4zP/vnHttH4Rp4OMOnzllOAKcw9JVui4rE8r4kGZeHe9vyM7jPlpwoRFkD6pGI9aPRYj1r3Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(66476007)(86362001)(2906002)(66946007)(8676002)(8936002)(66556008)(6506007)(4326008)(5660300002)(36756003)(54906003)(31686004)(31696002)(6666004)(316002)(26005)(6636002)(38100700002)(186003)(6512007)(6486002)(110136005)(2616005)(83380400001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkd2YkZRMVViZ08xREd5VDduMktRdG5mbFZYUjYvd1dWcFlJRmYwcjFGeUVR?=
 =?utf-8?B?WVhyemMrd3NNNnBQdXJpTFN4cnUwanNqWUp2OFNPZjl6dm5jdk16SzVtN1Q2?=
 =?utf-8?B?N3N3SXZuQmVJQjJXV0o1MGYzelo0cUZLdG9vaG16aCtuNTNraEh3UW5KZzht?=
 =?utf-8?B?d3hHN05yOHdPa3QzeHZnUVNXRC9BYWsxODJaWGtrUXh3K1M5Z0dkYVNudWc1?=
 =?utf-8?B?dkNheDBDVy96REMrMFlENGM4STVRUEVGSitMTmF6V2FWM2E4RktOVTVwakxY?=
 =?utf-8?B?eVR1Wnc2bHROTDRQbWwvVnZaSHJ5S3Q4emVZUkt1SlF4bWVLbzdaQWRvVHdB?=
 =?utf-8?B?U1hONjF5c3B1U0RPTW9hYlQ1U3ZGc0hGeE8rcXBJamlKSGhDanBaWVBsdEJj?=
 =?utf-8?B?WkZnZldoUi82RVV6Nkllak0vMHZRZEZCZ25zV3ZRRnNvUmZjZmw0WXkvMFZT?=
 =?utf-8?B?bDIxVjllVEVHcVh6NXk1aE00Zy9rRmRMa2VjMXJIY05ub20yUTF6cElySGJs?=
 =?utf-8?B?elZ1YjQ5NzBQTTl0aUhVcVFGL2tDMldwSDA0WEU4aklWanE4N2JxNGcvOGhs?=
 =?utf-8?B?QTBYTFVTQXZ6NjhpckhJVmRVbUFFUTFGSXpBWnJXZFd4bUFldTZ5WWYyNW9u?=
 =?utf-8?B?c1dRcGZEM3JIL29HVVBuY3lSTFRJODB5UHhLRVJ6TGE1QkRvM0RndkVoek4v?=
 =?utf-8?B?b0FFdnBVbzhySitSYUlDQ2kxbU92WWRueUQxMnBOYWRaRjdSMGZzQ0tzSWln?=
 =?utf-8?B?K2pxd3pmcWVJcXNtdFEwK1c1dEJJQ3RVOGR3d3RqTDM0cmxTSmdDNTZkS1JX?=
 =?utf-8?B?ZkQrV01TSmV5cStoMGhYNVovK3RVTm83VWczdTNjb3FiREdFNEhPTjdmYlVC?=
 =?utf-8?B?S2h6dVZQSndiUWhJVi93OTM4QjlDVnBMREp0OWp6SGpDL0lPVXJ5Um5VaS9H?=
 =?utf-8?B?TzVMc0xNSDlRUlBoRmZvMStlbmo4SWQ2Y1dOc3YzK2ZhMklzcHZRZlg3YW14?=
 =?utf-8?B?UjN1STU5WndmeTVJU1NBbFZhazJmMnR0R3NNa1hhdVJ1d2RPaEJBMFdsUW4v?=
 =?utf-8?B?MzNEMnJ5djNDcEdvYkdjUTgyUEliUE91M3QxeUhsRElCczJ2dy9IaGk0OVBq?=
 =?utf-8?B?bFZ4czNseGc4ak5JNFZIQVhMRjFOdkxseE1PRFZpMGhFWEtUWEFmR284RUIv?=
 =?utf-8?B?VjRmbVhLeUNSVGU1OUxVQzI0eTlnSzl6MkhhQlh3MGc5V2FNNjBJMU5acjd4?=
 =?utf-8?B?b2hWZWVDbXBndWFQUnJqdG1lVmkweW1QMG1OelZzcE1paDlXb3ZNa0xjeUhh?=
 =?utf-8?B?VjhYRXJOZDdkK1JJNGhxNkFEb1p1dGx4UEx6Sk01TWN2MzlVU0drR0poMm1p?=
 =?utf-8?B?akNXcGtnSy9NMHltcm80bnNNVkxrVFQySVpUR1dWc1FFSlQ2ZnY5cGFKWUxu?=
 =?utf-8?B?YjVZUzljdHdPYy9OT0s0bkJaZmJaL29POGwwZGt5TXVHN2U5WUg4aXhiUW1Q?=
 =?utf-8?B?b0RUU1NPamZCcVNxT3diRGp0YzdieGdhTVdEZjFuV1hvWHppV1AvUTNIVjMx?=
 =?utf-8?B?Z2JmQ01JbDEwdWQ4aGJnTk5UcUJvZUxVL2tYSDZHZDQ2NlFoM2NQNWt2dFJz?=
 =?utf-8?B?MDFJMjBveE0xcnNMQlFQOFNQemRZeGdqMUpwcjhyODl1L0JnbG9HOFA0OTQ3?=
 =?utf-8?B?WEVPbnpldEI5UTVEdmp6Ly9wdXh4K2VwQk0vYUtTcm9pOXoyNkpKaGYyK3Ux?=
 =?utf-8?B?UEpqZ0QzTnFZZzFQTXFZSmF6cGxIZXJkdzR6aXYwZTNHNjU2ZmhYYVJMTjJK?=
 =?utf-8?B?WDNDUHZMeWx6N2s2NmNGaFo5enRLKzExZncxUTZxcWx1ZTVIc0JFbFFhc25q?=
 =?utf-8?B?YzB3TU4wcGFpTUNWQmlOekx2RmRObGdDVFAyeVFpT0dBTlMvVk5LOHNiU0E5?=
 =?utf-8?B?UlBycUwyZm9wbDhTS1czQ1ZBUWQ4NkhXQURoNmQ1RWM3NjJkMDZ2T0FYSTZx?=
 =?utf-8?B?NStxZENnZllBazZ6WWw2ZzhVNjRDQTUvV3lYOWt2L084WGRqU3FMNGJ4bURJ?=
 =?utf-8?B?ams2dnZzVzB2MjlzeTV6cHFtWVUydU1taE9Kcyt5UHIzckxlVmNtdzNoTk93?=
 =?utf-8?B?M2xUcWZTOEdUc0ZtSHdGNWliMVNrdXRiaVFhTTdRY2pVRUN6bElyMlgxUHNO?=
 =?utf-8?B?NWZwWTIwbTNobDFUWVI2N0hrd1hXZUZXRWJ4dEdQUm8rOEo1YjdEeGxVQnZH?=
 =?utf-8?B?alptR0p6enN4dDluT2hJYlNsRDVaSHgveDg2RUlnaVJaaFBKV203UjN5YTRq?=
 =?utf-8?B?UHZ0WVIvK0pxclkxY3BuL1FPZlNYekE3QmZYL3R6bXFqT2U5T3ExUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc103f2d-cc3e-44ec-559e-08da114c39cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 06:20:31.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rAdaRi7mSiz8MdZVsvWVGeMBxFOpDo92/QU2vxU5fi50cK883X26J2YGZFhR1B5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4702
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 05:05 schrieb Zhenneng Li:
> This is a workaround for s3 resume hang for r7 340(amdgpu).
> When we test s3 with r7 340 on arm64 platform, graphics card will hang up,
> the error message are as follows:
> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.599374][ 7] [  T291] amdgpu 0000:02:00.0: fb0: amdgpudrmfb frame buffer device
> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.612869][ 7] [  T291] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR* late_init of IP block <si_dpm> failed -22
> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.623392][ 7] [  T291] amdgpu 0000:02:00.0: amdgpu_device_ip_late_init failed
> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.630696][ 7] [  T291] amdgpu 0000:02:00.0: Fatal error during GPU init
> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.637477][ 7] [  T291] [drm] amdgpu: finishing device.
>
> On the following hardware:
> lspci -nn -s 05:00.0
> 05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 / Radeon 520 OEM] [1002:6611] (rev 87)

Well that's rather funny and certainly a NAK. To recap you are adding a 
delay to a delayed work handler. In other words you could delay the work 
handler in the first place :)

But this is not the reason why that here is a NAK. The more obvious 
problem is that we seem to have a race between the DPM code kicking in 
to save power after driver load and the asynchronous testing if 
userspace command submission works.

Adding the delay here works around that for the IB submission, but there 
can be other things going on in parallel which can fail as well.

Please rather open up a bug report instead.

Regards,
Christian.

>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3987ecb24ef4..1eced991b5b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2903,6 +2903,8 @@ static void amdgpu_device_delayed_init_work_handler(struct work_struct *work)
>   		container_of(work, struct amdgpu_device, delayed_init_work.work);
>   	int r;
>   
> +	mdelay(1);
> +
>   	r = amdgpu_ib_ring_tests(adev);
>   	if (r)
>   		DRM_ERROR("ib ring test failed (%d).\n", r);

