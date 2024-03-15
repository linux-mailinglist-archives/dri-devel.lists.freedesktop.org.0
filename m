Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE887CFBC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC6510E55D;
	Fri, 15 Mar 2024 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MpKp+4ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D69310E260;
 Fri, 15 Mar 2024 15:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElMXVT7SsjssDYAq15nS7h17L8BRcQcdNkpAxTsdciRCoNkbCjNIOtEuA/RxbpTU58M8ddQCVAomow1nfgRC1o+c/sa5MuiqNTS+vRSyFYyKlmqZjJtcBdfANzla8A3IElffoHV0PPpUevCXFJd+32WaWKMDNq3B01OKJy1EmkID2g/YzwVbyuJrjmntinGXgrLCuSz26SGTebJitzDWacE5z2lEPB5Atzqsldest7KpAPpOJDdMc1r6C9FmPRZUg1zup7FXXRLI7HzIHD7qpI8/6tFe/GHKAWPhf/t/89+gY01YoOYEXDMqrJY+FzTOiwjJ/F3E4QJW2BL1p+Yy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SuwOCjBbLYkST//PsfWcv36UMFESUO0IP8x5avek5w=;
 b=mr1XFXsGrfHG3zne2UzEFWgnBs/00ZE9J05l5QPAvJz20KSjEdSAV1OH6P8QOUHAGid5HGHmLpKYLByd1UB3cjcM7T+42EsOWmTyiWa+XjlViDIi8THN4XjVIE4O4nCWXwQecfNCF4zHy8ASaARvaGm9JhIZGaDDYWI8dh1HxmRfotXgBYBO/nx52qpzwaSRbfuevMxdj99E6r2BEr30mbafpGaZnYhdWhAaNVek4X/OoGe3CHsN7ygkCreWinjFngKYPTigYd5qCR6BqmqV82ZoDZffNRe0hECWKiKnwyxifIKQL0qm+L3blrfqawX9QXjCG2stkLx1YMe4hGiRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SuwOCjBbLYkST//PsfWcv36UMFESUO0IP8x5avek5w=;
 b=MpKp+4ZBMSb+KrqaCN2C6/LDVx6N+jd6wsI97ZTg68FTtqlRCNEMscFx5/VSx9LDWINlDD6fAQPOi7XsrD4lijJJEXakM+loKm+FV0nsIe14Tu7omtt61vZPcmvmcUu1w+IIOWeisTbEAioIYFK9QgqCGUWxHSM2vBaOAtUnomY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB9210.namprd12.prod.outlook.com (2603:10b6:a03:561::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 15:03:39 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed%7]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 15:03:39 +0000
Message-ID: <f6c3a153-ff64-4e9c-98f3-04c38fd75485@amd.com>
Date: Fri, 15 Mar 2024 11:03:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drivers: use new capable_any functionality
Content-Language: en-US
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 linux-security-module@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org, bpf@vger.kernel.org
References: <20240315113828.258005-1-cgzones@googlemail.com>
 <20240315113828.258005-5-cgzones@googlemail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20240315113828.258005-5-cgzones@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a63ed5-7878-47ae-1fdf-08dc45011899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h47ZDeEuqRFmLYAKIfMZMVG6m8R3E+9Cm4vBQviHGOcbH4amWBl+7I0Cvm6ofzESW1F1J2vJMjIRbzlSF+7Nqa6iVZFYLs9wxnYFokEhgHCEm39umyIap38E8gwmbw/zYmA/dTDx17fHcGPAaFqoweutbBsi4nzxjeNoK3CS+L62hD7mvMQbshbuB+EK8AM0tPeBkSONyttP+8nh0MkJuJ3j8cQHzT8RO4u3K9cFJxqrGjiUwkhL5UImh7nDi586pfqVBzObDcAeL2exvyHfyBhZQAV7IT8RJHeVn/e04G17TMWnvMx/oeM4/prRPGs6KTrNE+dohKpHyV9X7n4Ag5xznVwFE2R8CvIHVklFvMpHfztyAoBJCUxL1lwpLt8kizI+WZaIMKFapDsbed5BkckPDJM7SRkGFLbj+x4r70ba37HjqcVszW+Sb/SAYy5fB7ZD/8WdxAGau3jpkk0ey5rboQ4sE5amU/LZaC2NPHGqTM/mXGQ2EueDNFdO+56Eo+Rf2ikwDsn93uJ4GM3bj/jNo/6ItBSDJQw4OXCMOkWwBOGHELfVrSzgI/qkoVtYfqI7ByDaqaFxP7+o5XTIS2zeIWICTRu+tWzUX1xSiQoZZHT5IHRlcKlpC+TYrCSkoMnI5ga8qlbL8qy/8IaniDJaHMYL8BFmFLWgPP6Ex7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDh1SnFsRTQwQUlqaW5PTjhJZ0ZMTWcreTEvd0VkMDc3c0tKa0dpSnFQb0xO?=
 =?utf-8?B?bjNZRGl1QXJNTk5uVXd2STRNY0xPdzRqNG45RG9oTWY5OTQyOFdYTS9VTmRV?=
 =?utf-8?B?MTU0R3VNRFVnbnpIbFhScjFmdnVBK0lIVDRnVnFZbGxWMmpidXFMZmhwM0Zh?=
 =?utf-8?B?WXI0TkdnQTdTbDMxemFKamZadnBFVGtxMnFBRFhYU0VuZ2hNc0tTTy8wZVZm?=
 =?utf-8?B?MnlvUDFtMm1xV0RUdE1iUkZCa3RrUWJRWGs3WCtQWTk2L0pyTi9MUW9kRUk4?=
 =?utf-8?B?OTFVUG9jcmVEaVF5N0ZQdmNLay9aVm5GOU5tekFJcW9xZFRtck1hOGpVR2Ir?=
 =?utf-8?B?SUQ1cFVMTXc4S0RFMDBxSXJ3T2lGRTdLdmh3V090NW5yOXFudU5tM1dEK1F3?=
 =?utf-8?B?aktrQit0VzhsMzczakZMVmdPSENhaG5jaGdtTTR1WldMZWFWcUh0d25sdGFX?=
 =?utf-8?B?R1k3WkFsSzhZRUdxb1JJNlYyaG5CT0FHcXlhWEZMNjNmLzBlR3dFd2JURFZ3?=
 =?utf-8?B?L2hzTm81MjFxRDZvN2NYTWFhL3NhY2pWS3ZpekVlcUVCY2lOOVVZVWgxTjFp?=
 =?utf-8?B?TzA3SXdiaGRnZnpXMW5DQXVaN094UzZNdmtSUi9MWFE5MTd3M3djUFZ5azVh?=
 =?utf-8?B?TmNVQlhiakhxSzY2TDVsbjZNWWJrMTRGa1QvaG4rdmFkREJSdjhuY2hMVVox?=
 =?utf-8?B?b0FvdGxRenhnYUZDWjc2NWk3c21FaDRYTlZ4MUd6SjJFYTRDRDRwd04rUHpG?=
 =?utf-8?B?NjBZdVhwY2FwWkJ2TmFvYVBFSTAxNVh3M3ZHVHFNbDRWbzlLM2tnSnpiWnVH?=
 =?utf-8?B?cldpbzBPT2FVY0p4NUNuUmlVTEJVWi9FY3RXeWIxNTh3ZFQ4cENBb0UxM1Vz?=
 =?utf-8?B?R2R3Y0RMYTVwQVpobGpnYWl3QXNUWE1xMGh3ZlRZUHlMTEh3MzZ0cUZTYzdC?=
 =?utf-8?B?dlRmOUVXVW5YNXgwM3FzKy9xVllRL2Z3dmQ4NVFra0FhcmQ3MWdnUTdUY1Rq?=
 =?utf-8?B?YWgvcFFjdWJvQ2haSHlSNXE3N1FhTll6Tnl0N0dKWG9FRXR3QkFFZDJUZ3po?=
 =?utf-8?B?d0VYYk9YVlN2dllWQmw5RmFBYjE0MDZ1RUJ2eXpzcHFENXBUZGZXaEZXL3h4?=
 =?utf-8?B?Zlp6eVdFYzVITkJRcS9lck5sbllmNmE4L2JrN3BWcjlYS1JlVjN1WUg2OGlX?=
 =?utf-8?B?clZPMDNsU3pEVUd1WndhUW94TDNkR2NDVlA3WENLVGRLSG91c0dXMkV4S0Nr?=
 =?utf-8?B?TDNOaHhaVlFUSGJXWklXNmcvMEdNZndEODM0OHBGR1c3dUlrZUFPMVd4RFhq?=
 =?utf-8?B?dGhzODUvcENlbGhGY1ZoTnRTZ1hIditCb2doSnZVRkh6RHREZnE2b2thVmFN?=
 =?utf-8?B?RTFHS3l3c0kvcGpobE93anNCeUY2VlBzMDZXOU1vdGRXNGt2cjgzdEF5RUd1?=
 =?utf-8?B?ZmFRbEpyTzFGdmprLzhVbnJFN3VPallMcllUUXBEWlNRZXdQZUxqVmVGOS9J?=
 =?utf-8?B?ZEp0THA5bXRZU0VlaytSSXZVSXI4djZGTndlTzR6d2pqdW16TUlkSE94eFVD?=
 =?utf-8?B?WlBQYVJPbzdaNmgvU1NyRy9HUXRua2FtWlZDUnJGTDd1ZDJURmpmU0ROajZu?=
 =?utf-8?B?dk9Od2gxNEcrazBhenhhMHJIdVJUeG5yWHlWTmRCMG1qNDVmdnlnVStCcjVl?=
 =?utf-8?B?NzdCOWRsSVZDQ1B2Q216clNVTGtCSjFEcmJ5V09YR0RMZ3ptVWdFWXNTVnU5?=
 =?utf-8?B?dW45YU9ZcmhOS25iY01YU2hCZDd1bXRlaU5hZ3dSMEVGYUlBMGIwVW14MElj?=
 =?utf-8?B?clpMUjFYS3dWYjA4Qy9SSFRZMzVzVGVZUVZDdURydHVOZUEyNEROSG9DWjZ3?=
 =?utf-8?B?dmhLbHEveHZSV0R1b3hwUnlJaUwzQ0RMZ2VTNE5kaDdGQlN4N3VvaC9QM0Na?=
 =?utf-8?B?VXBxdlE1bkhmNlZZNWNtemNESmp6d2ZMbWZXQ25kdlJSaFZUVjRYSFA3RHZj?=
 =?utf-8?B?ZjBXRFhwNE53QWNKdmExZWR6dU50TTJTeVE1cmFWdU1yaXdwc2hwZ1hIbS9C?=
 =?utf-8?B?cXU3ZUkxYk91N2lqVStvZ0puN3lLVkJZS2lHK01GUWRGVVRWLzR6L2dmU3Nh?=
 =?utf-8?Q?BKUVEYWU+eIoAs1PUYc4iAZhw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a63ed5-7878-47ae-1fdf-08dc45011899
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 15:03:39.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n397wT+Wna3gIQhLwWRPZJj8CbGU1ZjnD/OZ9EdnFBtnE3XkAQpCdZ8x0YBYniGXlV1A299WBah0GQ4UfBhYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210
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

On 2024-03-15 7:37, Christian Göttsche wrote:
> Use the new added capable_any function in appropriate cases, where a
> task is required to have any of two capabilities.
>
> Reorder CAP_SYS_ADMIN last.
>
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> (s390 portion)

Acked-by: Felix Kuehling <felix.kuehling@amd.com> (amdkfd portion)


> ---
> v4:
>     Additional usage in kfd_ioctl()
> v3:
>     rename to capable_any()
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 3 +--
>   drivers/net/caif/caif_serial.c           | 2 +-
>   drivers/s390/block/dasd_eckd.c           | 2 +-
>   3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index dfa8c69532d4..8c7ebca01c17 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3290,8 +3290,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>   	 * more priviledged access.
>   	 */
>   	if (unlikely(ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE)) {
> -		if (!capable(CAP_CHECKPOINT_RESTORE) &&
> -						!capable(CAP_SYS_ADMIN)) {
> +		if (!capable_any(CAP_CHECKPOINT_RESTORE, CAP_SYS_ADMIN)) {
>   			retcode = -EACCES;
>   			goto err_i1;
>   		}
> diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
> index ed3a589def6b..e908b9ce57dc 100644
> --- a/drivers/net/caif/caif_serial.c
> +++ b/drivers/net/caif/caif_serial.c
> @@ -326,7 +326,7 @@ static int ldisc_open(struct tty_struct *tty)
>   	/* No write no play */
>   	if (tty->ops->write == NULL)
>   		return -EOPNOTSUPP;
> -	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_TTY_CONFIG))
> +	if (!capable_any(CAP_SYS_TTY_CONFIG, CAP_SYS_ADMIN))
>   		return -EPERM;
>   
>   	/* release devices to avoid name collision */
> diff --git a/drivers/s390/block/dasd_eckd.c b/drivers/s390/block/dasd_eckd.c
> index 373c1a86c33e..8f9a5136306a 100644
> --- a/drivers/s390/block/dasd_eckd.c
> +++ b/drivers/s390/block/dasd_eckd.c
> @@ -5384,7 +5384,7 @@ static int dasd_symm_io(struct dasd_device *device, void __user *argp)
>   	char psf0, psf1;
>   	int rc;
>   
> -	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
> +	if (!capable_any(CAP_SYS_RAWIO, CAP_SYS_ADMIN))
>   		return -EACCES;
>   	psf0 = psf1 = 0;
>   
