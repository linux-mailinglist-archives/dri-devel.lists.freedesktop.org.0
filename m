Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FCD6F7EA6
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 10:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736ED10E06B;
	Fri,  5 May 2023 08:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3510E06B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScDgUOdTgRqUVWRncge3Rfbw4gZN7T6mAEtvv9aeZYJaNV6tQfbGgEs8ZwNKygP5ee5bRWyQSvXlYxuKEwQBSO7SFEZBiH0/bAipzTH5Za3cCeT7Ump/R/9lsY8Sh5C+ktYT+8o2hUxtypw6T+JaMoE1MmhGT6As6Tk6QSgbrGCieVdPUnQtfIUdpB2jKOtmae9xfzKNucxxgwSmYs7sUgjM4GU2dMzNmujvZfL9jdpkeW6o1k9MDf0SFdIL2Ap4N4zXmluu1hIDYwM3VdS1dkfgmnlerBTNDDWGk0n5/+J8qQgWRvK1xjFqpCMqr5Q3YdjrfgH1XdhBr15D98G9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMTLRUBE22PZvio7ohPng+iJmf/3NLXCv9ILoDSK01w=;
 b=Yxjpdq+4In/BwntMZKdV2zgPCMi+LWaGkQt9uyjJbAM9THtAdXRnI8UgFIBbxKmAHjtABrbZBLsXjbcMzAjx7op/mhgjW0NiCAS2Gf24jQ/Jef/w7VXF6a0WNGD9ml2MNTEExQbdI1vYqIn09ws+rIeglefKU77MhBzf9PgGGuJhjzEz/YqPYJShwqlq8TO149XNVLPBgwbPQNigc9trJfVoZoQ1Z63fhweeEW8TNCH7OSeMvZCXZ5YUALz6UOJd4QzOaDfYoWr+dP/PIkDMsfBILXzx37ZouKZ3ho4U/4gporkw9RK/qkNrH+XIxviHMHienhhEsI2wnpvREK2OxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMTLRUBE22PZvio7ohPng+iJmf/3NLXCv9ILoDSK01w=;
 b=2SHX6eGQheLqQ3DoE6FLJDdHGYh4NhuJ0zdgpPpTMtF9ObIfeMs0JasgwZMQMpxR7NuaGXq9edyjVOsAkJvwKp+YUccgR3oHx1cj4g+MyZv76XeYAuetR0uqZFpkspYxohO82HF6vli8g5H+VHYkIJVhoxDXq/VRZQdkN0tTQSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 08:22:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 08:22:14 +0000
Message-ID: <b9ceed26-bf64-6314-3ec5-562542b2b1c6@amd.com>
Date: Fri, 5 May 2023 10:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] dma-buf/sync_file: Use fdget()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, sumit.semwal@linaro.org
References: <202305051103396748797@zte.com.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <202305051103396748797@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 923dfff2-fdc9-46d4-015f-08db4d41d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CeZuozJvbHLGq2eI2j5xTc3YByrX2JMhCPdLrvgeI68npQabhZNL7whxvMoSU99pkqytk+yb83qvsmTOyXv3j01xU9uwLIlGjfgLn/7Epl2EmZsNFPUxze8vw88UHK4XTnDjJ/gdEyJXTFmJu3kDhTUmTc7ojh4Lg3XHyRF07mhb2IBzeCGp7Y1i1iSLY9Ch6UmXwpuVPBZtr9wdBDIatnQuxCQBRtpocLLJS8R52VvSr/+qC6HXrOS5NYsx5jNRibhqq5AZnFaT2ZurTD1s7mk+HLNg0W2+rVprxa1PqYwr62tMEywON05JF+IUG4cPWcBJzQnw49uB8ydWRJ8LNYXwowrtsqlkzNtqxReLEqPwOh0ag8bI4UQp8nyNiyOIbKPz5lIa0HCBrksGv+8YVEncw5KouILMey6MW8NPWXQ2adrbgHCyrXNrtRviGC/iR60loI612EMxKYWvLWm27ITjAYE3DrrVnUNYbJQOBEu44ThffWyb0jODf56Wo3aUhL2WtCXkVG30vYWpNZiHNDFB0+Yhatyah1eGMBKT1VTFGEaO9wiOpi4BrScqIDa+XFFxjt52QbPk+MTPmcrBQaGVgZFPcgOVEZGDT3APkICNV3ZmTmGTW505AGLthYPQ1nF3tVySDorMQ5kr6mObpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(31686004)(2906002)(4744005)(5660300002)(8676002)(8936002)(66556008)(66476007)(66946007)(478600001)(86362001)(6666004)(31696002)(316002)(41300700001)(4326008)(6486002)(36756003)(38100700002)(6506007)(186003)(2616005)(83380400001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZVMkJmYlhIUXgya3NxN3UwN1NlRGhGNGtoYnRWSFNLRU9rUU95aVVzeEUw?=
 =?utf-8?B?VDFOZm9ERXhqT21jZ3YyV0pvaXk4T0NOMnY1RERiWGNtcWxjeG9xNVBMeW1j?=
 =?utf-8?B?cVRwdWxuSHpqT0M2cExQbTNKQTlpZXJPa0k1MEh2UTRXbVI5cFRWME50ZXVn?=
 =?utf-8?B?REZYZkNQOXp1aHZ4NFloRUt4Wmt5dDg2SmozREhOaGUvT0xYUzNvNWR5VTFG?=
 =?utf-8?B?NUM1QnJ2V0lqZk5BSzJPNmhuUmQ2cjVBWTZvOE1hbi8zTUViUGMxRENBSkMw?=
 =?utf-8?B?NDVFbnNOTFhBRWtDSzNjWkhLVDV6ZUx1eE1kV0E5VG81VDVRMHl6UnhmWTJX?=
 =?utf-8?B?em9LdVdOUjYzTnJDY3J2RE5lWkwrTUdCaXlQbnh5RVpOdzIvMFhFdzVyNy9G?=
 =?utf-8?B?Uml2VEIrMXowWDBDRHl3emtsQ2RVSHkrckhPWW9YQklqZFI1dXR4aVRpU1hW?=
 =?utf-8?B?L2FXandlc04xZDJJKzBiWE8yWkJVVlZIQ0d2eGZNWGc3K3U3V0FKWmNzWlJD?=
 =?utf-8?B?V0RTYk5mVjdOMHhoNjZndk53dDhmZmh0MDdxQXlTbmpxZjFjOGwvd0hsM1Rn?=
 =?utf-8?B?OW42QWpmS2JMeDNzc1ovbDlhd0hKd2tMQUc5ZElRM0dueEFaNzJFMklLRTZi?=
 =?utf-8?B?SHNCNmM0bStTaXNIRzNrNHNWZVRSV1JUUDJ1RlBZTVlkbUhkYzB6TGxWdzBD?=
 =?utf-8?B?VHBqNURldkJ5aUdjb3F5UWQ0SVRIbnY3QnRWQmZhMzZGVnhiNTdpUVZEYUVH?=
 =?utf-8?B?bDVoaTQySGdraGUwck9WM0tTTUFabVVWbkZHSm1FTUFwY2NOVE9xQ3pSYitI?=
 =?utf-8?B?aHFhQk0yMWhSV08xYk1jUTFKQUFSSUtxSGZnQzB4UEpZREU5SEQyVlR4bXU3?=
 =?utf-8?B?cVlaSVRBMUcwSWtGY3o5ZU9ZMjQwcGFzcEJscXgzOXZrU2tUOFB1MXlVVFRT?=
 =?utf-8?B?NlhFTU1rWVdQT1ZCYWZNWEoyQUJKY2ZvYitEM2NITEhURmxvSHA4MDJCUDRt?=
 =?utf-8?B?elNDZ2hsRVlIZjJCeVA5UHVFNFM4TXQxVWRLWWJLOWdRVVVmVmtOc1FDVTlM?=
 =?utf-8?B?SlVZZE9qTmszV3VEZkdOUVFGcFdhb1VVVVRyaGYvWHV5RFJjUHFIa3BycjEv?=
 =?utf-8?B?VlpuTHBqSHpSSUdzT3pJMUhocU9JT1NRcXhrWmpqTVVKOHRQRlNHMmc0ZVBX?=
 =?utf-8?B?cTNJOGZHWUZwbnFFOU5rQlluc292Um83K3dncTUrNWNETFNScktFenBLWXdk?=
 =?utf-8?B?V2piRDV2YVdkVFBsYWVySWhWVThRQkNvNG0vZEhMS0ZBengxLzk1bHZkMktP?=
 =?utf-8?B?RXBBcUQvZjVKVFJhR2ZhZlp1M1ZMRHVUdEgwSENqNXZWN3J1V3RPejRKUkhr?=
 =?utf-8?B?Y0FBcHc5U3BjRkNZQ2MydTIvaGxtemtGWHNBdDR3Mzk0ajRJZWhJNDB4ajRw?=
 =?utf-8?B?a01hUm1vbFRudWdNNjZ2cU1DTnh2anVlR01oSW12Y2tTU2hPM3ZnTGRVWkFS?=
 =?utf-8?B?aFcxNkkwZkJ5NTgwcmVTV0NVZTBOZjdYNkJMVE5mdERmV3R1OEsyMXg1SUY5?=
 =?utf-8?B?ei9MRzBlaTdxNzArcUwvMVY4a2tTUzJZSDhIc3FMYW5FQTVrM2NwVWhsV2pa?=
 =?utf-8?B?OE92c0FNVzViQWFrOGhKRkJ2RVl0MXNTQU5aREdlVktpcW5aL3RLOE9RTUtC?=
 =?utf-8?B?Z2VlUEVQbjVWTmh5OXZodWFpbGFHUHNKd0hwSVEvNnA1UW8xN1NFTGliVngv?=
 =?utf-8?B?T2NneTMyL2c3TXRDdkVEWG01Q1pNKzFmK3JLNVhsaFZVdmcrZWFhS204YXJC?=
 =?utf-8?B?NUd0QkRGWWxnOWZsMlFyT0FhRC8ySmcrdE4yYVJsdDFKNisrWHNxZjllTHVG?=
 =?utf-8?B?QTRhVno2RW40MCtmeURXMEM0eU50aGZ1R1pSdzRSUnZueWgreW1sVGxKNjk1?=
 =?utf-8?B?WnovSDFBQm5tUEd5T1FFbGxpUTdKaUYrekZsOTllWTlZZjN0MVFuMXlaOGZY?=
 =?utf-8?B?RGhFTnV4TURnU0ZGUFZVbDhqVlV4QmJ3UnMrWUt5QjN5ZE40T0l1M3pwRkdT?=
 =?utf-8?B?OFg5N04xUzZMTHlGbXF0TWdab0c4UWlNL0hqR3Z5citRVkVKbUJsbjFOVEEw?=
 =?utf-8?B?WHlNY1V6RzZ1QjNaYklmbDBHbVI3ZWhjWTlKYittdzdBZEtsN0Ftd1kvQ2Fu?=
 =?utf-8?Q?whLVLAvovFDMXawGaGBrQvhHGroyh1uuAlpzKmtAro/q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923dfff2-fdc9-46d4-015f-08db4d41d504
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 08:22:14.6999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vImxtc28Vz0Alcwdog5Pe6zz5xBXM8fvJLAesKSNI4sA9ueGv4+8co25bbTfvvNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: linaro-mm-sig@lists.linaro.org, gustavo@padovan.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.05.23 um 05:03 schrieb ye.xingchen@zte.com.cn:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>
> convert the fget() use to fdget().

Well the rational is missing. Why should we do that?

Christian.

>
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/dma-buf/sync_file.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index af57799c86ce..222b13b1bdb8 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -78,18 +78,18 @@ EXPORT_SYMBOL(sync_file_create);
>
>   static struct sync_file *sync_file_fdget(int fd)
>   {
> -	struct file *file = fget(fd);
> +	struct struct fd f = fdget(fd);
>
> -	if (!file)
> +	if (!f.file)
>   		return NULL;
>
> -	if (file->f_op != &sync_file_fops)
> +	if (f.file->f_op != &sync_file_fops)
>   		goto err;
>
> -	return file->private_data;
> +	return f.file->private_data;
>
>   err:
> -	fput(file);
> +	fdput(f);
>   	return NULL;
>   }
>

