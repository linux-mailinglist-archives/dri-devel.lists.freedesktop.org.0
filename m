Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F50782B95
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6510E0BB;
	Mon, 21 Aug 2023 14:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70A810E0B0;
 Mon, 21 Aug 2023 14:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/vHcU5IdM3V/CHpgYs8XDw29CkQTlRyRl1Ej2lCBXxjls4v7Y0eEtjwRi+Qk3c8rIbN2iaVLPD/7oX7JGjkdY9vnGfnEvLaWrYlBTq2jdz330WR4QmsXreQA+uxu6sdqHnxFRYjV2A8NKlFaz8fCt/8iOfVjSL8/GsF1BonyMdtwUp2zuVGGGTuNpaYjv5KVp9L01346JhmcBw0N/S3lUhqlk4nuA2urPvJYXyTYHaKwlMTjqYR2UC6jAPGWkC2ws6p6p1TIfB9dUBFIIrGx6rHPWLEBjUSwyBUB+fTZT59E/G0VAZVIPiJo8u49JkqBwvkDker42022FebbK1f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STz+KCRb2sSQ0CsI2NvoSsnxmLvjQKNFheEpEwUMmQU=;
 b=AwqUT9Uygm7+w8BZGLxLUSVf8Uu+Qn8EuWFy/Wir+FtTjd3ZzVxOJ2/To1bCfRbzFcrY8VG0ItQvJql9WVtlI7wg43rJXNA6M6TNzPAiWWQ47w9O7jNdpAuE1BwMY8uAD+efKIDTtdPxL/O1k+11lTvk0srAdgDYYTJ0Y4xyg+SaZnQBUqyOp21YMEq4SXKrb6UiZfhqWLZ1XohsWYRg7ewOMB8RVIKtvj5ukSRapYNmimPw+eWEF2zq2w70w3mUcKVHwwCkhAcdC9EncpYwo4ZkI5B+HNtuREdkWt0XiH4ft8lFfaK7SXTE/RFS5giNDqKz6kLbPcI6vtEmvFDj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STz+KCRb2sSQ0CsI2NvoSsnxmLvjQKNFheEpEwUMmQU=;
 b=t1lAgKAPdp0S3+hMdsmG/S7gRCd9GuK6yxc02ShhVgx88iSFZoQouCRtEn3kDUj4tXYUzPrMfvmFo7oae6Zn9hxaqkCzy5mWS0t0SjtYlXiOWdSErFQ40e1vsQh541KCIodXX0nIHb/+YV7OrXEyAIcRXjkqn5aNnLDEdkW8S7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:21:33 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:21:33 +0000
Message-ID: <bb754dc0-65dd-ec9a-8675-64ed12bfa237@amd.com>
Date: Mon, 21 Aug 2023 16:21:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 3/5] drm/amdgpu: Encapsulate all device reset info
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230817182050.205925-1-andrealmeid@igalia.com>
 <20230817182050.205925-4-andrealmeid@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230817182050.205925-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::19) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d211cd-33af-49cd-7ecb-08dba251eb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WG5/qtwdkAe3Ss25nQbtVz0dXXV93m+6l4Rf9aYS6SFABGmQGCsYAstVM+SEQ5oC47FXMc8zkei6Xyq9C7wF5jFgprvVY327Dz+s5E2iur/E6YnQ7KP2Oi0Fci2trpyiMGxtxg+Ia8i09v0ntH4E+bAeqjxLR4fX2UNUp8vXucMigKbX/heL56zR8o6P1CFrAt3pnHDmfemN5oi8XjsCLz4vh6nOddbjkELaBNlBydaL/2eATCUC/S1fg4gupexHLWLeQclEf6jAQs5z/ta5fVnpEcT1/yS/3Tc/4l9TrnYdLXQaWYNoNg2snsoVSvojb9CcFxKVg0rpEuSPOSWqWuFJt0RgtF+lovzsnuHdDyW/qnieTnaw76u8OD5W5CnNeQRxqnWQA6zBxtaEOhj1XRu2pZVNCE5x5JQeh+TPdPHoM9dM8EPZp6kJo7SKaVGjbRgJkU1oz9V4DwHCwdUYxH6dKaHQocHfhy7Ki+sz9jj+muahafiZQ869tAzqtVWl7JDKHz/7suvM/NZ/pxiywGasX+RXCLo8ivQ7s+elX8wIyH4TmRsXbzJPcrIBa1EILMSVz7bAvk+HJybsqBPkCZioAv1rmcHBP4W/kVBA1/o1wrqXEZNP/sicqxu+QmBRUrUL8qhhMYP5lSHgj8GjpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2h1d3RTZ1MxZmlQR1VnbnUxZE9HTzJoVHZLQUhwRG42UmJYY3lNc3BNQWxO?=
 =?utf-8?B?OHZUcld0VXU3OGFmcmVoQm1tcmpnejVXclZjaWI3UWtmR0E3WGdvOEVLMlho?=
 =?utf-8?B?OFlEYkYzS0ZJK2ROK3haR0Q5ZEowakk1ekRiR1NmaHRJUHlRREJXK2M0dk9D?=
 =?utf-8?B?YUtnS3ZPU0swUDRRaTVMU054ZDhQdjdiSTM1SXZiNjJSSFhNWDVQY2ZsNDQ4?=
 =?utf-8?B?VGhURzB1QnRvbjFLYTMvMFc3OWpQWkR6UkxVNGd1NVZsaXZFL2NvakJHUnNE?=
 =?utf-8?B?OEJ4OEFlekFWQkNVaUt1RWlhVjVFaVl0aGtkTEJ2b3NvbWZwQUlNSGtiT2dN?=
 =?utf-8?B?NkV1dXlOY0JZRDNtQlpvWkx1WDdUUkxTMGtwNDFoVWtMUGpmck1PNU84UTJo?=
 =?utf-8?B?Z0dGR2l3Qm1aWWt0ZlRMVmxIc09iM1NWYlo3eWUyK2pYM2hIelozN2ZMWFha?=
 =?utf-8?B?c0tqQ3MxalpJTHFQZmVHRUhZSkRIQVR2VnBDeG13S3VsVUNNdXFmMnRXamU2?=
 =?utf-8?B?ckVFYnN4bTBmVkRBbXNDc1NCajdrbldzbEdTbDZWaGxHZW5GcWlBUDBNNUZz?=
 =?utf-8?B?NGMvTTlKb1RSNE5BampJZ2phN3UrY2lac2Vnc2d0QTFkWTk0NVpweVM1UW1Z?=
 =?utf-8?B?MHZIQzlYVkdLWlJrMnlCUWR3eUlmZDBIQ0pOKzFTQkdBTzFQRG4yZ29HNitG?=
 =?utf-8?B?cE84SWNQYTRiRzJCdHdob0ZmT1Y4bWxnUjZwTU5rRXhGd0djNWVqM3ZhcWNB?=
 =?utf-8?B?WEhUbncycHM5Vy9sYko5bDBjNTJHL3dZRlRXS2dHc2dYVXIrUm42cUg3UDYr?=
 =?utf-8?B?QWMvNGhPcU01MzJJYmJJQlEvOHE4NC9EQVNlSE5qZHdQTjB4ZUkrVlp3MXdp?=
 =?utf-8?B?c1RJWVgzWWk0UkNRaWl3aUNYZXRrWU9FWnJScURwV3RoK1hRaTdBdFkweTlS?=
 =?utf-8?B?NEVLSHRBdzNoWSsxUVUxSENwU3JPVURCaVU1eEFKYlh1Q2RHcFBvbkg5eElX?=
 =?utf-8?B?S0Nwb2Jqc3EvSmdwaHY1Q3BSYnBMcGlzaTMwRER3UkROd2xZWGJCUEtOd2d5?=
 =?utf-8?B?VVE4MTJKUnBVRjdnMGVPbG1PRTZHQ2pxNTdsbGk2eFN3RkxWVVNpQVc4bGpV?=
 =?utf-8?B?ZUhGVFFLVHVqbkNoNERiVytsbVpkOXV4WFlsNHpoTW9zYjV0TWVGZDh6dEZj?=
 =?utf-8?B?TUk4YmpjWXA3cm9VRVN5Q1FVanpUcXNVVVdQTnZhLzY0bXNRNzVxc2tvQmVK?=
 =?utf-8?B?cTdzaUZ5TDhadWVGOGY5MkFxczE3MTZvSWx6U2lFK3QyVmN5SmlHelhHSGNG?=
 =?utf-8?B?L3hzemhIL0xIbksyaFVrVWtuRCtQODY0bVVsMWsralZvT0d3RlJFazIzWjMw?=
 =?utf-8?B?WXFza2F2VDc0TGxITG9SRmN4ZXVENXplS1RRZk9VVFpOcXFWVUJjbmtWcS9U?=
 =?utf-8?B?d0pydkRlRE43RUViS2gzZmQ2QURBWW5EcFJ3ZzhFTWdsdVJCUWhzOWt0bGVm?=
 =?utf-8?B?c1A0RWtjMVhRSE9lZUJ1RGdwWnczWGVQYXdDNHlSMWM4cWFPdlc4YWlDbkxj?=
 =?utf-8?B?NFUrcHZHazI2YWtGUFBxclZWSDJXRFRQbTV3OUZDU015eXdDNCthRlg2RmRk?=
 =?utf-8?B?M0dXeVp1bFB4cTJXZzRNZjBnMFBNQU4waXl3OUhpL1oxRk1WNjJZVUpsK3VU?=
 =?utf-8?B?dFgxb214L2J0MGdiWGQ2V3krMHpxeE1YTHc0L040bDNNRGw1NTFmNldjNW5a?=
 =?utf-8?B?bmdyQThSdjlZRXQ4Rnpnb3VsTUVLUWs0T3lxaWxFV3JKZndmLzRNY24wdWJk?=
 =?utf-8?B?UnlHRkg3Ynh5QnA5TGJnRmhVS3hncWpEdE1iMXVBNldsQ0l5WlpZdlZHVmhY?=
 =?utf-8?B?ckdVc3ZpSFhtdFE4ZXVlUGVZbHB5VWJnaGZpZERyK3FsdGZpa05oYTIyWXN3?=
 =?utf-8?B?UkFxUDNxV1lRYmhGWE1zdmgxZk5wSzREdy9KWFc3TUlqcFRqa0o2elpQeDZj?=
 =?utf-8?B?S0REcGJrdFc4TnFFRU90aXQ5RDBhMTFZQUx0dG9pSDNqZjZPRWpFckI1Mmlx?=
 =?utf-8?B?R0RmOXJNaFBQalRmZGtST3ZxbmIwMldQbjl4RW8waFl6OUthaE9rWmUwUDF5?=
 =?utf-8?Q?lb69XeJnJE++rqL2bQtANndxq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d211cd-33af-49cd-7ecb-08dba251eb6a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:21:33.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7h95syrFKnBFDs6i++2pBIT86Cygjsb628uKLgBuhMlu8XM27sBVFJpcfftme/+vMsPACGkfmQuunWmsULSog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/08/2023 20:20, André Almeida wrote:
> To better organize struct amdgpu_device, keep all reset information
> related fields together in a separated struct.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v5: new patch, as requested by Shashank Sharma
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         | 34 +++++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 16 +++++-----
>   3 files changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0d560b713948..56d78ca6e917 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -781,6 +781,26 @@ struct amdgpu_mqd {
>   #define AMDGPU_PRODUCT_NAME_LEN 64
>   struct amdgpu_reset_domain;
>   
> +#ifdef CONFIG_DEV_COREDUMP
> +struct amdgpu_coredump_info {
> +	struct amdgpu_device	*adev;
> +	struct amdgpu_task_info reset_task_info;
> +	struct timespec64	reset_time;
> +	bool			reset_vram_lost;
> +};
> +#endif
> +
> +struct amdgpu_reset_info {
> +	/* reset dump register */
> +	u32 *reset_dump_reg_list;
> +	u32 *reset_dump_reg_value;
> +	int num_regs;
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +	struct amdgpu_coredump_info *coredump_info;
> +#endif
> +};
> +
>   /*
>    * Non-zero (true) if the GPU has VRAM. Zero (false) otherwise.
>    */
> @@ -1084,10 +1104,7 @@ struct amdgpu_device {
>   
>   	struct mutex			benchmark_mutex;
>   
> -	/* reset dump register */
> -	uint32_t                        *reset_dump_reg_list;
> -	uint32_t			*reset_dump_reg_value;
> -	int                             num_regs;
> +	struct amdgpu_reset_info	reset_info;
>   
>   	bool                            scpm_enabled;
>   	uint32_t                        scpm_status;
> @@ -1100,15 +1117,6 @@ struct amdgpu_device {
>   	uint32_t			aid_mask;
>   };
>   
> -#ifdef CONFIG_DEV_COREDUMP
> -struct amdgpu_coredump_info {
> -	struct amdgpu_device		*adev;
> -	struct amdgpu_task_info         reset_task_info;
> -	struct timespec64               reset_time;
> -	bool                            reset_vram_lost;
> -};
> -#endif
> -
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>   {
>   	return container_of(ddev, struct amdgpu_device, ddev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a4faea4fa0b5..3136a0774dd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -2016,8 +2016,8 @@ static ssize_t amdgpu_reset_dump_register_list_read(struct file *f,
>   	if (ret)
>   		return ret;
>   
> -	for (i = 0; i < adev->num_regs; i++) {
> -		sprintf(reg_offset, "0x%x\n", adev->reset_dump_reg_list[i]);
> +	for (i = 0; i < adev->reset_info.num_regs; i++) {
> +		sprintf(reg_offset, "0x%x\n", adev->reset_info.reset_dump_reg_list[i]);
>   		up_read(&adev->reset_domain->sem);
>   		if (copy_to_user(buf + len, reg_offset, strlen(reg_offset)))
>   			return -EFAULT;
> @@ -2074,9 +2074,9 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>   	if (ret)
>   		goto error_free;
>   
> -	swap(adev->reset_dump_reg_list, tmp);
> -	swap(adev->reset_dump_reg_value, new);
> -	adev->num_regs = i;
> +	swap(adev->reset_info.reset_dump_reg_list, tmp);
> +	swap(adev->reset_info.reset_dump_reg_value, new);
> +	adev->reset_info.num_regs = i;
>   	up_write(&adev->reset_domain->sem);
>   	ret = size;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b5b879bcc5c9..96975591841d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4790,10 +4790,10 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>   
>   	lockdep_assert_held(&adev->reset_domain->sem);
>   
> -	for (i = 0; i < adev->num_regs; i++) {
> -		adev->reset_dump_reg_value[i] = RREG32(adev->reset_dump_reg_list[i]);
> -		trace_amdgpu_reset_reg_dumps(adev->reset_dump_reg_list[i],
> -					     adev->reset_dump_reg_value[i]);
> +	for (i = 0; i < adev->reset_info.num_regs; i++) {
> +		adev->reset_info.reset_dump_reg_value[i] = RREG32(adev->reset_info.reset_dump_reg_list[i]);
> +		trace_amdgpu_reset_reg_dumps(adev->reset_info.reset_dump_reg_list[i],
> +					     adev->reset_info.reset_dump_reg_value[i]);
>   	}
>   
>   	return 0;
> @@ -4831,13 +4831,13 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (coredump->adev->num_regs) {
> +	if (coredump->adev->reset_info.num_regs) {
>   		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>   
> -		for (i = 0; i < coredump->adev->num_regs; i++)
> +		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
>   			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   coredump->adev->reset_dump_reg_list[i],
> -				   coredump->adev->reset_dump_reg_value[i]);
> +				   coredump->adev->reset_info.reset_dump_reg_list[i],
> +				   coredump->adev->reset_info.reset_dump_reg_value[i]);
>   	}

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank
>   
>   	return count - iter.remain;
