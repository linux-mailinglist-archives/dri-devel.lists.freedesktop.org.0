Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEFE3D7D44
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C287E6E0F6;
	Tue, 27 Jul 2021 18:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5531F6E0F6;
 Tue, 27 Jul 2021 18:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjHjWwaA70rw0oLKSAajlLQq99kFphSBIOAKaMMFJUscUzwrHKcH8mqLtgsPG1PPVCbyDxLOQHKwVuRpCDuoLEaoWU47FWgU+3kmrrShzCYqaWCt6d+UAcEiqMQzNgJtUd+d4LXK6LPF2m7NHHR0Mg6+1Xsg3J6QZS9c5Ocm8q3DEPv+RirdJwihu0c6fFMwFJ77jB8aJC42f91fEgGY++LODQdSsgkm7KVUmIcnd/HsT3cdco2tlH5rqkgSlqTs43/+PuJ5ltsuYa8q9Y5e+al7Uus2a/JqRBABzoYgLVRGomkmlELBNmQlCDY9QpzPMywbU3dyP3R1Kg4UoPiMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hahvPfWSuFcLBXv+omPK6TMFftjbjBYgzXJdbYE8hQg=;
 b=EqZVnYqAHrRMLK6z3oAKZfYy6PQmyI7Ps4IhPHviLAQTg8wLi0BfhGWe5WwOiBI3LR8v+wv7pbSR4OZiTmlOItEtY87a4EAbD4JfIY6kzIHFmoNOEZMhFJN5cWEpPe4hQswg5gWOMMvsTy/2a51ka54GNoViAc7j/ZtrvqamUg/NZzzZo5BCW4hqCxTiZPPd5arcE4AYIBM3SeOcRAOuRBFYtqQe8wTmwPCM+bzzkoKKvTRoHtnlSoWgnWP3YFVL8FfMZRXlGn8YyugBFyyJL3XxlQjPHufGLVuSwBzQentfEr3qnqqcUrSTquffZUvSxgze7dOFf68r6lBmiMS+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hahvPfWSuFcLBXv+omPK6TMFftjbjBYgzXJdbYE8hQg=;
 b=CO7DSjIjMg10YPONHpRx83BjedpsxwNJTSEtMN5Cpo0GiA0qmsND6mktDOysE7i9zXAaOIExp0Ja53SnhY6iPqDkhzWNhwroL+qv386yDouyPCEgH0VALaG5v82S59egsM5ow+D2EAZ/I9+VDmFZw/2uz+rCQ2e7sEUqciIFsRk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 18:16:56 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 18:16:56 +0000
Subject: Re: [PATCH] drm/amdkfd: move PTR_ERR under IS_ERR() condition
To: Cai Huoqing <caihuoqing@baidu.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20210720063435.373-1-caihuoqing@baidu.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7b968d16-9306-8fce-e93a-f88c964f46e3@amd.com>
Date: Tue, 27 Jul 2021 14:16:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720063435.373-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::6) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.144.73) by
 YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 18:16:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84574ac-053b-40e0-5b4e-08d9512ab7d2
X-MS-TrafficTypeDiagnostic: BN9PR12MB5210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5210BBC3E192BEAEC8D214C992E99@BN9PR12MB5210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIEbqsXjxIBNhywdH5iECbdSU28ZXLB5PDiketxI1r9u370bhjuyD4UiG130TOqGg7TOkWXnpz52m6ixg1pEYp0oMHVlAEsS6LHZSCiBr+FhSVMIQXHeMOPn/JQOkfiV1VTOF95TzQ7dN724ndfL+FlH20ZZFAZ2vyMuYHNWRFxompml/JufxWCaS9xGRvkrY0kuSTnopTVQi3O7BN9M/RNkxX4XksZTjngknI+PuJDl5nz+aXfECSs3ru5RY0RsNXFIT2AexpZTynYQOzM1LRiindPIM2cNZcFEuWn2qoZsyXYBYYq7ZzG/cwh3XzpluebtQ/R5/IrYcsg8VTNDXJhMWNsAjSzTTiA6SOPdljnMXoDE7GOXUgbcOkNeAEEvZLG6wKIUtjww0kYixyVjJbImzeb/BAfz2K9K+bJyCHRptStS78YlNWm4exKqLwIrS+E6ZL0DQQ9CbsNhsJyGHsrMu30z39CnLdHJFZWKlx6PUDCvHHq46AKqb8SbpCKw617X49wudMV6MedVakY54w8te7zK3JZ6AEG9/gszNDR2J9Px+mlmqP6I1oRCfHav0FOrK+3GjQ+RjXEAS6L7ko5gKRk7IkZ6V4kP1zE8E+pE/8k5u5+85Yl1S1mGRo/zlahqjJEW92anTZqF6vM0Nq7jpK2vSxvqvDe21flEnom4dzIr68Vq77DkXwhyLbkUKXWEN9VBJkNj87lHqrG4Wr2lnPS+KEBmHEej8F8xGCMnOjwXAOJGEVRadilhP/7y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(2616005)(31686004)(31696002)(8936002)(186003)(478600001)(36756003)(4326008)(5660300002)(38100700002)(2906002)(16576012)(83380400001)(86362001)(44832011)(6486002)(66946007)(956004)(26005)(8676002)(66556008)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hzY2tSOFowN1cxaENtVDEvYzJqMkxEK3ZwcWF1WnZTeFV4V2Y4UmgwRjd2?=
 =?utf-8?B?VlBBaWVxVzB3YXNqczdwY2pMVktidGUzd1lpWUUwWUt6b3hRbnBkMnFOdm5U?=
 =?utf-8?B?eHZHTTRCRXZxUlRsYWMvbEh6REFMNmZiYThXN3psM2V1MFVDdE11TnljTWxz?=
 =?utf-8?B?Q2V2czlqVTBSelErNkVJQnRHdDlLVGN3d1dXenVZaXNSSms2d09ueC9xL3VM?=
 =?utf-8?B?TVVKdlpDSEZNclhJbG1KQll4VE16RVJhV1FEQnFKaXI2TzQwbDFZellYcFcx?=
 =?utf-8?B?VDBjV1VIRFlnYkZid24vV3lIZDhmRmlNaGgvUkJYdnhHNDNxY2pCK0FOMmFl?=
 =?utf-8?B?dXV0alpaWkhFL3ZnN0ZieEwxNEhEMjZNZHl0c0VzSkhkK084a3Z1Y3lzVG1Q?=
 =?utf-8?B?cm1xOU42TktKbFpVTUNQVFdmYjhMcGNJNDRKeU9kNEVZMllPSDR4UDFXeTAz?=
 =?utf-8?B?QXRJS0s0RXhBTW8vbDlpeVRGT1Y5bkVvaEJEeTQzdndJbFRRS1RwRXExL1Yv?=
 =?utf-8?B?VGFVZnpJQ0FQR3ZmSjZWYnpnMkpkNU4wUmNLNjZqQmNkNXI0bXBmYnl4VHht?=
 =?utf-8?B?ZmFKYmh6T3l2TVVKSGd4cGFma0lNcGYwY1dkNXpXcGR3akNpY3A2cFZUbnVD?=
 =?utf-8?B?Q1dEanlwOTlFT2M3SFJzZWFpQWNnY1Y4dmErZFN0akFhWnliaVJ2cUpsMDJz?=
 =?utf-8?B?QksrNjhuTVpnekExZEw3VXhOdlRQM2VCNzZQQll3SVFUaHltTWtlUUF4V1ov?=
 =?utf-8?B?dVM4ZWVoWWJSTHJ2eDRZam1KZ2RZSUU0eGdXSnFXa3FEQk52OTVYcHdJNTBG?=
 =?utf-8?B?WHZYNTVUbCt2UVVXTTFFb1c3dU54NkFVeDlydDlXVEl5ejRZWVlSUVlFSFpS?=
 =?utf-8?B?Y3JTTW5vMkYrWlRlVHNlaU9MMXQwanBGRC9LRXU4TTVQaTZzTi9PdHZyQmxF?=
 =?utf-8?B?c05IdE8zT2ppLzZLc25CL1hCWHJkTnJJelB5MDMrY0trdXgrTVpqQXdHQ3hP?=
 =?utf-8?B?K0lFbmhpeEIxWXlzVW9VTXV5dXdsQzQ0Q0tpa05VcVhWU2xrem5oeXlaSlB2?=
 =?utf-8?B?Sk0rU3JRVURqcXNvOUxlTlhRalF6KzAzTEEvWE5ETU1XR2lyTW5ybmlSQlFJ?=
 =?utf-8?B?N2NKN2pWWGlBbEp3dVYxMlFKZXpuZXZQcjl1T2w0QlpGOVhoclNETUlObElQ?=
 =?utf-8?B?TU5MTStsOUdUM1JockVIOHNCZWNRRG5lUUZVT203OTM0bjQ0YWdQa2Z0Z2c0?=
 =?utf-8?B?a3IxYUlqWmRnU1luZk5zZitocDN1bkY2SldaZW5IaGdaZTJzZzhlaUViTE94?=
 =?utf-8?B?SWkyOGZOWDlOMDRtR2FKSzdKd25FVnBFNWtqNnVKdkhJa1BnR1lHS0draGhM?=
 =?utf-8?B?TDFQOEhwN3Y5Wk9MWlQ3WXJsTS9KUmhIdVJ6bTM4NzhYdjdGa1pzU0MwY3cr?=
 =?utf-8?B?ZmpXaGFzdjYzRVRDYjV6S204emthWDNZYkhvMzNDQjUwUy9mdUZhOTdCa01C?=
 =?utf-8?B?cDdrckowd0ZuOTFDQ09vSWNRMzlNeDlaV1M0TGUycjM3SWZndng4RVd4ZXFx?=
 =?utf-8?B?YW9IOHVPR3ZxUWxvQ0MrYlFXNFpsZm55YXpINXA2cXJpMllOa1RMMkFQZm5j?=
 =?utf-8?B?Q2YvZHJEdnUzK3VkTlVCSlVlWWxpODY5UzVrdlZJSVpRT0JvNStmNFhlN2U1?=
 =?utf-8?B?SVNhYm10WG5oNDAvQ21kblQ0c2NsbWh6WXcrTHU1RHdYM0NJYXF0T3ZCaDhT?=
 =?utf-8?Q?5g66rwhySu8We/1qZp5i2/jjmYtY5s9Ob7WkRxt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84574ac-053b-40e0-5b4e-08d9512ab7d2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 18:16:56.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QjSwswYOGAIob7Sari2ide9azxVmldzvRb57ePVmrhSMs39MVVjT8G7VqsOyoVJfeKBcqYSzCqAzeLSqvgFYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
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

Hi Huoqing,

Your patch is technically correct. However, I don't think it fixes any
actual bug, and it changes a code path that has no performance
implications. Therefore I would just leave it as it is.

Regards,
  Felix


Am 2021-07-20 um 2:34 a.m. schrieb Cai Huoqing:
> no need to get error code when IS_ERR is false
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e48acdd03c1a..710659b3c1f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -72,16 +72,18 @@ int kfd_chardev_init(void)
>                 goto err_register_chrdev;
>
>         kfd_class = class_create(THIS_MODULE, kfd_dev_name);
> -       err = PTR_ERR(kfd_class);
> -       if (IS_ERR(kfd_class))
> +       if (IS_ERR(kfd_class)) {
> +               err = PTR_ERR(kfd_class);
>                 goto err_class_create;
> +       }
>
>         kfd_device = device_create(kfd_class, NULL,
>                                         MKDEV(kfd_char_dev_major, 0),
>                                         NULL, kfd_dev_name);
> -       err = PTR_ERR(kfd_device);
> -       if (IS_ERR(kfd_device))
> +       if (IS_ERR(kfd_device)) {
> +               err = PTR_ERR(kfd_device);
>                 goto err_device_create;
> +       }
>
>         return 0;
>
> --
> 2.25.1
>
