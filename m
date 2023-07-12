Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304D7501C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547AF10E37E;
	Wed, 12 Jul 2023 08:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850210E073;
 Wed, 12 Jul 2023 08:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaNrnckOPyjK4xsZQS7vxEjiGbM0szB5eQ4nRf6qLKq6oEbTpxLglI25UOWukgZKcerDxoXRYsVdZNn+dUBWZM4cKJCs6ld7sNM1M/7UBq42l0Ye7FA3GyyQg2GK6lwd+ZKtmWfo2CRJtpzsQTrhRjQtYtT65dcGjRcBArCqwVndKsrOIJeSGAGZ1Sv9jbtEFhzFYTpm0SsYVwJqfyqR++yDyaFeaicvugqNhV1oLdoPqbyJUTspVTEITMjD8PQ4mkUqWtd70bFaW8otk5jvRD/4MT2kq6Hnaaw8thELx37KRNECbQfogAahm08W/0+OapnnfNGsZE4OQJ4YCyljtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayzQGPpTA9IamMO8gH/kB8ICvypiXBm12AJV5aJYAA4=;
 b=BRv/iHZEAV3mEvUJn/BAGsCxN7vd978mLP/Dw8Q2EnHo577hjEvo6Oaeo6hr6ZOPqPUUE/na2OJ3njitb0SQTn8PZTRwA3VPEPSRaKv1Wj4/IOSj0y8o9P0sh+Wi8YtgBkobYXHrNi8Zou5ExJdRaSFsky2v2h7OqZkiA91l2aJqLhZ+GfWi3kh0vvTKr5rVyMwwF1e7thi/2dj3SWaMr2ivQl9lGZ+PrXM+AEkQyQn0X5mjhxnXxrrbxzH6hxzbGqdTF9E5UvbEF6/oNsBdwoQCocXWLyS1IpzD698lObwvhQ+M85VidXQKcszcbUO+5ksRXD8b1oAffWNTY2ip1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayzQGPpTA9IamMO8gH/kB8ICvypiXBm12AJV5aJYAA4=;
 b=ADeKCxKmIkCSNHef7aS130x+eX9vITFMAUNEC+of9X52hvtjV4g46BkKpsuu4ZqnSof7nIZZ8b1Y3vzwgHV4lsbjbu6/Xw1ewIx0mXUDtbV1uWkThX6nRVHk0gEbnJWxuMtaNyM3dnYItO7O1GQI+PDzHUYgiyO6CeHaeEpR3y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 08:37:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 08:37:57 +0000
Message-ID: <e488da74-af52-62eb-d601-0e8a13cf0e87@amd.com>
Date: Wed, 12 Jul 2023 10:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/6] drm/amdgpu: Rework coredump to use memory dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230711213501.526237-1-andrealmeid@igalia.com>
 <20230711213501.526237-4-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230711213501.526237-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe688ae-f211-46ba-3663-08db82b34af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4Men/gH5OeMwfKmN54VxGS2s+bJedHnsZXIl3VCMcp8aAlBRSFJKiKCZ+SFz1ZwVmkcHshBzJ9cWx7NoXIAICysM6CSxdb1/2TjjLGkkpMizvAoZBkck7BdGNXJkNjhNXjslRG/vxAk+at57RoHVz/aoD/0va8GfMA5SPwIIil8XawDy6XOGuQMHMsSB6KbzyUZOEG24keeJWDHaSSMX79XrXTnVZeBfGh06yzbq9d0i30RkttB6sWGFe5j3YLCpHHJa8nGeFb3okib4Zg8SoZaR+3csFsN0N39omXd3qhc4R19OC2vf//0BiqMlkR0iEqmbV8QIze3eQm4ogUptEuUUr/O5dBv/MOx2rrqEalXuoui4c3X4BWqJhrZvXGEu4R3x8s8B1UF6Z8OUf7o6betySF6ROgc1wN3ph04Wtv6rftfqL5fcz9MGY/o3CspOFP65Pw+1d+1iiPQDO7HhOQB4p/z94NSJWjdy3VEurzt8OZi4WOvQj8OktqWuIFutXbS5585v+r+mhctviu1886OxltaijviY2NCdzDy8oQSL2TpRjBN1MjYuKV1fX43abtXIq+gsaUb6Np2i07YaKjVkoIJz9YCtewZxsPILRZZy0YG4NxDbpH++9+6RzOqUkOS00fYz/sw4xZWumGAIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(8676002)(478600001)(8936002)(316002)(66476007)(31686004)(4326008)(5660300002)(7416002)(2906002)(38100700002)(54906003)(41300700001)(6666004)(66556008)(66946007)(6486002)(86362001)(31696002)(6512007)(6506007)(186003)(36756003)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERhUGExTUxuNW45Q0NGb1IrWElHc2VHREhkWVkrUyttcWJGUDdWNzUybm9v?=
 =?utf-8?B?ZFduS21BM2dHYW9EWE1ZYW1VQlZGOEJjQndHclAyUktsTXhCeG1nL0JZYWRY?=
 =?utf-8?B?d1ZyVnczVjdBdzAwQTk5dDNrTWU0N0I3cDZOTlg4d3hSZWV0YzhnRGtpQjll?=
 =?utf-8?B?OU5xWTlMWXNSdW9UTzhWeXkvRGZzTTBQQlVpUEN0OE9zRmJtOTgyWkUvMzc4?=
 =?utf-8?B?NEVqV3RtSmE4ZGFjQzBEMmVhUGpFL09PaXRiQjY2S2tjeVZ2Z0dWdHpiUmhr?=
 =?utf-8?B?TTY1MHo0Y21NRWNXblh4UVQxOXZnNU9iOWtkMTZmaDNKQjh2dlprdjJqbkJL?=
 =?utf-8?B?clo3ZjBWMm4rM0xnbmV5ckxUeXBSLzVCa3FzaGsrcG83WUtOSmsvcXB6bzBt?=
 =?utf-8?B?RXhHU0JnSjFXSzJpbHhuNUpLZXRoWTRyOTExbzBGYktSOFc2Q0VTRzlRcGQw?=
 =?utf-8?B?YUdzUFdKYW1lWEIvbEd5SWYya2IwUTF2dFJGSDcwSE9Vb2pYelhqZnd4ZHhY?=
 =?utf-8?B?QW5RVFQ4Y2lJZE9jVnJ1bTNyRTQvWFRkbVNld3JIbmJJcTRCd0cxUW1iVnFG?=
 =?utf-8?B?OUZldVVwNzBQN29VL3hoRE94YUU5QUFJcnlGTkhQOEtxNHYwNWl0R010cFor?=
 =?utf-8?B?K3lXUFZZdjFKRUZmdEVIQml5ZERlNjNIcVAwNFJreWsrTDlOYVgzdlYxNmpZ?=
 =?utf-8?B?eDZPdEFaRHpCdlNmampONWpPYVhUeHhFeWlKbWovRUpJdGdjYitVS3FvWm9u?=
 =?utf-8?B?VHZCakdsR0VVci9XVmJNOGx3MTNMZVlOZlU4WUdEeXR0WjNJcGhQZnA0akov?=
 =?utf-8?B?WlR3RWJmd3JPZ1VZZUpTMTFKNk5iV1Ftc2lSc2xuNjlaUGx5M3VSbExYWnJR?=
 =?utf-8?B?Tkw5TEd0TDZYVFJnQUpzWXlVSk5oZkoxT1JyN2JRa0Y4U3NMenpyVTVNN0xZ?=
 =?utf-8?B?R2V0ZFlEQ2w3TVVRdmEzWE9PM3RPNk8zZkFTVTdPUFpMR0I3UHRvOG9ocldU?=
 =?utf-8?B?dWQrUEhza3dBOFFSZUxJaXNUQ3FFSTk4OUh0elJUaDZHL3cxcE5xZXh2SWVa?=
 =?utf-8?B?NnlRVWxCSzhiRFFUdWg5VUllTWtvdUNJM0JYN0FVMktJZmtxSmlzM0VLQngv?=
 =?utf-8?B?RFBVelpFUS92dkxzaytBQXFmaXFpaTNBTFVsT2tsM0VCUGF2cDNSYlFBcDcr?=
 =?utf-8?B?VnBYUkJlUnBoeXNIZDVqNjJnOEl3dlV4Y2hTRGxPMUZHWUo3TjZYVDV5T084?=
 =?utf-8?B?TE02ZHdHWWt1RDRFcmJIbStTVFgycDdlUk4xZGpiZUZ4T09penFMTmdUTTNU?=
 =?utf-8?B?S21sZTRFOVlHYnpQVG5kZnkwNUxqTE9oWkovc1Zza3hPV0ZKemdpcFpFZUVY?=
 =?utf-8?B?cGo1TkhsUC9SZTNiVXkxeDR5eDd6V3k0YzBjRSs3cXVrazFYa1JBakhVQTRZ?=
 =?utf-8?B?NVI2VWhhYWExMm9HVmxPV0F0Unl5a0xmNElRQ2J1N0E1UmZHQnR4bVJjd0Jx?=
 =?utf-8?B?NWRKdk1DdUNLWEFlZWpaR1FqRG0zOFBFYjBJVXpKNHZ6TE8zbkd0bm1UQ0Iw?=
 =?utf-8?B?Z2Nta0QwTEtaazNud3luaFlrQTZPMldHMWVtd0txZHlLby9MQjVyZTJJbHAy?=
 =?utf-8?B?d2Z2ZVdHMUxiSDcyWWczUSsvYTBJMitkVDNOK0k4TUFyRXRLcGt3Q1hQVjBM?=
 =?utf-8?B?c2ZLR0hpVFo2TGJkSUdlalFYMjE5eGlKQVl4eExEZ1NrYVNaK3ltakFyN0Vy?=
 =?utf-8?B?NDd6YkoreS9tZVVnM3c1WXR2OEl3dXJ5V3lYMTZ5RHozU2l1WlNmMEZiRjNv?=
 =?utf-8?B?Y3Bzdk9xNUdmUW5BRXVDRmU2VU9UYVNrWGpnaG5QQ3YwM1prM2VqaUErNyt4?=
 =?utf-8?B?U3BSVFFVaHZGUlFCZnhxRS9jYjFISmMyY0FRWlNCa3RnVDN0bDRoNnlDMnF5?=
 =?utf-8?B?RURTS1hCRDk1d3NmWVdNMlBSOU9ZNWtORmJ5d1g4V0dvUUp2OVA3WFJya2xh?=
 =?utf-8?B?MnlNV1JZTDdzVjc2bUg2Wk1qdXBBaEJlYnVCTXhKc0t5bTZwdWVJWkUyMDlq?=
 =?utf-8?B?cEhEdWdUWXkvMDNhMWtwV011VjhPVE0rZmp1ZmUvdzhNRnU5aDhRdmRHVmY5?=
 =?utf-8?B?SnpBNngzRGpmMVRGSTVjTGdwZlp4eTZMSUhKK1U3M2p4OEpnY3E3ZnBGVk5H?=
 =?utf-8?Q?Aohs6/2/vbkeROg9gTBorb3S2PLpIg9BjUkyhXNULB44?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe688ae-f211-46ba-3663-08db82b34af3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:37:57.3752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqtUaVekzPdU/lmOzyWwpmG8sfBrDzSZ0A6GQUZXEZ0gFiRX6wUOb7j3aWuA2d3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.07.23 um 23:34 schrieb André Almeida:
> Instead of storing coredump information inside amdgpu_device struct,
> move if to a proper separated struct and allocate it dynamically. This
> will make it easier to further expand the logged information.

Verry big NAK to this. The problem is that memory allocation isn't 
allowed during a GPU reset.

What you could do is to allocate the memory with GFP_ATOMIC or similar, 
but for a large structure that might not be possible.

Regards,
Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--------
>   2 files changed, 51 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index dbe062a087c5..e1cc83a89d46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1068,11 +1068,6 @@ struct amdgpu_device {
>   	uint32_t                        *reset_dump_reg_list;
>   	uint32_t			*reset_dump_reg_value;
>   	int                             num_regs;
> -#ifdef CONFIG_DEV_COREDUMP
> -	struct amdgpu_task_info         reset_task_info;
> -	bool                            reset_vram_lost;
> -	struct timespec64               reset_time;
> -#endif
>   
>   	bool                            scpm_enabled;
>   	uint32_t                        scpm_status;
> @@ -1085,6 +1080,15 @@ struct amdgpu_device {
>   	uint32_t			aid_mask;
>   };
>   
> +#ifdef CONFIG_DEV_COREDUMP
> +struct amdgpu_coredump_info {
> +	struct amdgpu_device		*adev;
> +	struct amdgpu_task_info         reset_task_info;
> +	struct timespec64               reset_time;
> +	bool                            reset_vram_lost;
> +};
> +#endif
> +
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>   {
>   	return container_of(ddev, struct amdgpu_device, ddev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e25f085ee886..23b9784e9787 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_DEV_COREDUMP
> +#ifndef CONFIG_DEV_COREDUMP
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
> +{
> +}
> +#else
>   static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   		size_t count, void *data, size_t datalen)
>   {
>   	struct drm_printer p;
> -	struct amdgpu_device *adev = data;
> +	struct amdgpu_coredump_info *coredump = data;
>   	struct drm_print_iterator iter;
>   	int i;
>   
> @@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
> -	if (adev->reset_task_info.pid)
> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> +	if (coredump->reset_task_info.pid)
>   		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   adev->reset_task_info.process_name,
> -			   adev->reset_task_info.pid);
> +			   coredump->reset_task_info.process_name,
> +			   coredump->reset_task_info.pid);
>   
> -	if (adev->reset_vram_lost)
> +	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (adev->num_regs) {
> +	if (coredump->adev->num_regs) {
>   		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>   
> -		for (i = 0; i < adev->num_regs; i++)
> +		for (i = 0; i < coredump->adev->num_regs; i++)
>   			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   adev->reset_dump_reg_list[i],
> -				   adev->reset_dump_reg_value[i]);
> +				   coredump->adev->reset_dump_reg_list[i],
> +				   coredump->adev->reset_dump_reg_value[i]);
>   	}
>   
>   	return count - iter.remain;
> @@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   
>   static void amdgpu_devcoredump_free(void *data)
>   {
> +	kfree(data);
>   }
>   
> -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
>   {
> +	struct amdgpu_coredump_info *coredump;
>   	struct drm_device *dev = adev_to_drm(adev);
>   
> -	ktime_get_ts64(&adev->reset_time);
> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
> +	coredump = kmalloc(sizeof(*coredump), GFP_KERNEL);
> +
> +	if (!coredump) {
> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> +		return;
> +	}
> +
> +	memset(coredump, 0, sizeof(*coredump));
> +
> +	coredump->reset_vram_lost = vram_lost;
> +
> +	if (reset_context->job && reset_context->job->vm)
> +		coredump->reset_task_info = reset_context->job->vm->task_info;
> +
> +	coredump->adev = adev;
> +
> +	ktime_get_ts64(&coredump->reset_time);
> +
> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>   		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>   }
>   #endif
> @@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   					goto out;
>   
>   				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
> -#ifdef CONFIG_DEV_COREDUMP
> -				tmp_adev->reset_vram_lost = vram_lost;
> -				memset(&tmp_adev->reset_task_info, 0,
> -						sizeof(tmp_adev->reset_task_info));
> -				if (reset_context->job && reset_context->job->vm)
> -					tmp_adev->reset_task_info =
> -						reset_context->job->vm->task_info;
> -				amdgpu_reset_capture_coredumpm(tmp_adev);
> -#endif
> +
> +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
> +
>   				if (vram_lost) {
>   					DRM_INFO("VRAM is lost due to GPU reset!\n");
>   					amdgpu_inc_vram_lost(tmp_adev);

