Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B51B3500
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 04:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C325E6E213;
	Wed, 22 Apr 2020 02:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C276E20C;
 Wed, 22 Apr 2020 02:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBj4j5uCU76dpov2P34G4j8YfaI1N0tlPMmL4Zy9n5SyeJzqjXKKOi9nPX/L5sIlPPraCQqP/QE/Ufuf57NR1SGppLk81UySk29NXt4vqFi9XYwyvwWmSzyNM/3IbLzY2hxaTOg2WyezoLNkU/MQ112IxdZ8XKCSsuO15vV2rKr/YAw8TfwkerlYPQdIWXfzQod567V7Xuqaxw0fNCHmwqoF2hmV0hHqW/fPwuSRi4TLA11qEp4G6YiDFeY77YyympVj9BBJytgkQBCztZevQ5zR+k36EAbamVkx5ntjKLmnp2t9T2dj5/QCiN4AyE5lMoveQkiAWikWK8s1txseVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO/phBMHHSu3+oOHuyEoUn/wuycuY+ZfJAqZ530FA2o=;
 b=ivluLNiPdrioNM2cBWSwW2H9dUv4gDY7UaZMXYMRDHI+atvXDokClMzwE+A2Zm5JCCdqR6viaDhLPUXZ7TjGOrUC13b7sJFfLQWikrSHaIDy0FJdhVZ079I3X2RQ2OKQV1dlsO4E/DF3BXeKPJtT3iOvooCfRX0XaZ/yyiJkQc4WcBqoXla9iUPNtK+0/k0VG0OgnFmZVKoaobllZgIPYarfxnKgbxVVPHUu+JxAN1C8gtbT/rsU8Stt4khYbito9flUZmIF9DtyFLVWIVe3jSxCA8+zxznyzb34E2GqseEnXjk9nbB00PMGxX3HrTOxB5YLTlMTBxdlj3wBBwaJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO/phBMHHSu3+oOHuyEoUn/wuycuY+ZfJAqZ530FA2o=;
 b=yeudx17pUz/8i4MnTD6iJo48y0hCwfHkMXIz89/0k2RZDshVEFg01pBYplLPOkTnvyJID2gs/4OXcndD1GkvXCE7vjRLdaAPm/WWD1sEMmsjjIdQB5ZcDWoe4ShomjyNXWXA8bNnAqJxnUGtg26Zdk1AwTspzhZBFZn+bvjat6s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2429.namprd12.prod.outlook.com (2603:10b6:802:26::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 02:27:23 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806%7]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 02:27:23 +0000
Subject: Re: [PATCH V3] amdgpu:optimization-- reduce no need mutex_lock area
To: 1587181464-114215-1-git-send-email-bernard@vivo.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421064818.129158-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <08ef8975-43d2-049b-1c80-de33af7ebd4a@amd.com>
Date: Tue, 21 Apr 2020 22:27:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200421064818.129158-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.150.44] (165.204.55.211) by
 YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 22 Apr 2020 02:27:19 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1183f5a-f2ac-416f-0976-08d7e664b06b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2429:|SN1PR12MB2429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2429307F6AFEF6E0E0A3946292D20@SN1PR12MB2429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(478600001)(52116002)(44832011)(45080400002)(53546011)(6486002)(2906002)(31686004)(33964004)(66946007)(66476007)(6666004)(66556008)(316002)(81156014)(8936002)(36756003)(26005)(16576012)(956004)(110136005)(31696002)(4326008)(86362001)(16526019)(5660300002)(8676002)(186003)(2616005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1eZDni/IxizKenlJ8MGHpkGXeZ8o55XzxaX/3f/FFsvwMmWYpITWigcgHzFl2xaMYBPIN0X5nA7Re/3XlwpG8OJpWRWXGBNL/A4h9fKHPa25ZhVDTAdn4yNXCqkfbUK5Z/MHoA5IUeNvWCOF8J98xER74+OqepJlGr3KshwLRQuMJFuBErHx5qpfbfRiRAZRtVtMEMM9KoD4R6SpWeMS87ot3M3MXP7NGrQ3wqRfikL7K6a63sY9cNlNfF43kzBGdkGVkWzGhUCCBr+MYS/njohPVaQW6iuPqVoVYGWUHmvbDMQyFYpiN7oOy95IGEj4ShDDEm/1O97HmNAQZIs6nDZC57RxnBt1MDy596E6E/ui1dUZNOkkbuaoArgKsOboBQyA5f9dm4yJO0BsdpO3aDnWnUtyMQ1hA3xtNjQNLMEPF16gjPB7UGaAhlYMze+GMNddsivQbI/wiTEosytMA5qcvFLHbiHIsISyoSUMnt3USy4S9MlWcKOgrsuaBd1mgRBT7hz2HYlGUcDyEj9DQ==
X-MS-Exchange-AntiSpam-MessageData: l041GDnEbfvmNQuyi3wV6mMMEIUJO7psDQV2ml3m49R33/E9+b6Kev8C58EuHLlyOD+97MuujiNYN10apR6myZE9M3JpP07GoYD9C5VReWQI70qzfbqTKCBqcol4DA4uHvRFUHOuvIRKBIEdTSV02w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1183f5a-f2ac-416f-0976-08d7e664b06b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 02:27:22.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3cdAbzE2DTBBf/JMqrjUXTPj6s3Eb0EtnDnQNAdxaH9Vy1E2cVcxhpYrsyl7DYNG0VCp9YymiWJCxRW2j8oNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2429
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: multipart/mixed; boundary="===============0699826679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0699826679==
Content-Type: multipart/alternative;
 boundary="------------BA1570E6C13ED4DE6017E839"
Content-Language: en-US

--------------BA1570E6C13ED4DE6017E839
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks again for the patch. I'm going to apply this with some minor 
fixes. The headline should start with "drm/amdgpu:".  I'll also change 
the wording of the headline and commit message:

    drm/amdgpu: shrink critical section in
    amdgpu_amdkfd_gpuvm_free_memory_of_gpu

    Reduce the mem->lock`s protected code area, no need to protect pr_debug.
    This also simplifies error handling.


There is one more cosmetic change I'm going to make, see inline. I'll 
apply your patch with those updates if you're OK with that.


On 2020-04-21 2:48, Bernard Zhao wrote:
> Maybe we could reduce the mutex_lock(&mem->lock)`s protected code area,
> and no need to protect pr_debug.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Changes since V1:
> *commit message improve
>
> Changes since V2:
> *move comment along with the mutex_unlock
>
> Link for V1:
> *https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226588%2F&amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152789682&amp;sdata=4UdZiWMAbW8eR1BS2%2F6qMvs5K6cHWy5c8I32ReQ4uz0%3D&amp;reserved=0
> Link for V2:
> *https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1227907%2F&amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152799673&amp;sdata=Wt%2Bk7k4MtSX4zIDgmLEOB6ZKzfuqAd6GJZ3Creqf1aY%3D&amp;reserved=0
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 327317c54f7c..f03d9843d723 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1285,21 +1285,21 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	struct bo_vm_reservation_context ctx;
>   	struct ttm_validate_buffer *bo_list_entry;
>   	int ret;
> +	unsigned int mapped_to_gpu_memory;

I'll move this before the "int ret;" line. It makes the code more 
readable if long declarations come before short ones.

Regards,
   Felix


>   
>   	mutex_lock(&mem->lock);
> +	mapped_to_gpu_memory = mem->mapped_to_gpu_memory;
> +	mutex_unlock(&mem->lock);
> +	/* lock is not needed after this, since mem is unused and will
> +	 * be freed anyway
> +	 */
>   
> -	if (mem->mapped_to_gpu_memory > 0) {
> +	if (mapped_to_gpu_memory > 0) {
>   		pr_debug("BO VA 0x%llx size 0x%lx is still mapped.\n",
>   				mem->va, bo_size);
> -		mutex_unlock(&mem->lock);
>   		return -EBUSY;
>   	}
>   
> -	mutex_unlock(&mem->lock);
> -	/* lock is not needed after this, since mem is unused and will
> -	 * be freed anyway
> -	 */
> -
>   	/* No more MMU notifiers */
>   	amdgpu_mn_unregister(mem->bo);
>   

--------------BA1570E6C13ED4DE6017E839
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks again for the patch. I'm going
      to apply this with some minor fixes. The headline should start
      with &quot;drm/amdgpu:&quot;.&nbsp; I'll also change the wording of the headline
      and commit message:</div>
    <blockquote>
      <div class="moz-cite-prefix">drm/amdgpu: shrink critical section
        in amdgpu_amdkfd_gpuvm_free_memory_of_gpu</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">Reduce the mem-&gt;lock`s protected
        code area, no need to protect pr_debug.</div>
      <div class="moz-cite-prefix">This also simplifies error handling.</div>
    </blockquote>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">There is one more cosmetic change I'm
      going to make, see inline. I'll apply your patch with those
      updates if you're OK with that.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2020-04-21 2:48, Bernard Zhao wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200421064818.129158-1-bernard@vivo.com">
      <pre class="moz-quote-pre" wrap="">Maybe we could reduce the mutex_lock(&amp;mem-&gt;lock)`s protected code area,
and no need to protect pr_debug.

Signed-off-by: Bernard Zhao <a class="moz-txt-link-rfc2396E" href="mailto:bernard@vivo.com">&lt;bernard@vivo.com&gt;</a>

Changes since V1:
*commit message improve

Changes since V2:
*move comment along with the mutex_unlock

Link for V1:
*<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226588%2F&amp;amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152789682&amp;amp;sdata=4UdZiWMAbW8eR1BS2%2F6qMvs5K6cHWy5c8I32ReQ4uz0%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226588%2F&amp;amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152789682&amp;amp;sdata=4UdZiWMAbW8eR1BS2%2F6qMvs5K6cHWy5c8I32ReQ4uz0%3D&amp;amp;reserved=0</a>
Link for V2:
*<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1227907%2F&amp;amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152799673&amp;amp;sdata=Wt%2Bk7k4MtSX4zIDgmLEOB6ZKzfuqAd6GJZ3Creqf1aY%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1227907%2F&amp;amp;data=02%7C01%7CFelix.Kuehling%40amd.com%7Cc715f5d02aae40846b8f08d7e5c001fd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230485152799673&amp;amp;sdata=Wt%2Bk7k4MtSX4zIDgmLEOB6ZKzfuqAd6GJZ3Creqf1aY%3D&amp;amp;reserved=0</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-------
 1 file changed, 7 insertions(&#43;), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 327317c54f7c..f03d9843d723 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1285,21 &#43;1285,21 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	struct bo_vm_reservation_context ctx;
 	struct ttm_validate_buffer *bo_list_entry;
 	int ret;
&#43;	unsigned int mapped_to_gpu_memory;</pre>
    </blockquote>
    <p>I'll move this before the &quot;int ret;&quot; line. It makes the code more
      readable if long declarations come before short ones.</p>
    <p>Regards,<br>
      &nbsp; Felix<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20200421064818.129158-1-bernard@vivo.com">
      <pre class="moz-quote-pre" wrap="">
 
 	mutex_lock(&amp;mem-&gt;lock);
&#43;	mapped_to_gpu_memory = mem-&gt;mapped_to_gpu_memory;
&#43;	mutex_unlock(&amp;mem-&gt;lock);
&#43;	/* lock is not needed after this, since mem is unused and will
&#43;	 * be freed anyway
&#43;	 */
 
-	if (mem-&gt;mapped_to_gpu_memory &gt; 0) {
&#43;	if (mapped_to_gpu_memory &gt; 0) {
 		pr_debug(&quot;BO VA 0x%llx size 0x%lx is still mapped.\n&quot;,
 				mem-&gt;va, bo_size);
-		mutex_unlock(&amp;mem-&gt;lock);
 		return -EBUSY;
 	}
 
-	mutex_unlock(&amp;mem-&gt;lock);
-	/* lock is not needed after this, since mem is unused and will
-	 * be freed anyway
-	 */
-
 	/* No more MMU notifiers */
 	amdgpu_mn_unregister(mem-&gt;bo);
 
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20200421064818.129158-1-bernard@vivo.com">
    </blockquote>
  </body>
</html>

--------------BA1570E6C13ED4DE6017E839--

--===============0699826679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0699826679==--
