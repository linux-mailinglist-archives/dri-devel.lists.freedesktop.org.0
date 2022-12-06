Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF402644D49
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 21:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F910E156;
	Tue,  6 Dec 2022 20:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0083210E156;
 Tue,  6 Dec 2022 20:30:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6EI9YP016264; Tue, 6 Dec 2022 20:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=68KO9kvSay+/EojHDbG9DZmffwl2dEHYySOtUKGPazo=;
 b=VF31BH0pCi/uRWBX7VoJkmIPWpYjWt7WeKhiWAxB1W39x/vb5mXtSq24hlWrmFuOrDTC
 V66PGPxtjowLNkLvihTYy1FfIV3zWw5vsnRZujFp8ZZ/KWbaO72ECupN65wMTB4ygXgv
 G2DJCxZfuApd7vlwu86mPowXzAzEBTuzSRhTBEAs29yWHeyM6bcoxgHrjNdqNgo+ll7Q
 zVejy5BGYfpnlLFSgmn197dXuQYY45Ffz/xnZtde5i5ixjM/xQ07BIK+K3JQ4xzQZiyk
 XV0woVjUfhR4125TaIKeyhwK5ELZB7h8DXhveWJSw/klP26llT9D5hTj2DFZZL7XwUJG vQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ma21usyc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:30:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B6KUgSF009504
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Dec 2022 20:30:43 GMT
Received: from [10.216.31.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 6 Dec 2022
 12:30:37 -0800
Message-ID: <f99a8e9f-2c70-9e45-1ec4-23cc85047937@quicinc.com>
Date: Wed, 7 Dec 2022 02:00:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] drm/msm/adreno: Fix null ptr access in
 adreno_gpu_cleanup()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Jonathan Marek <jonathan@marek.ca>
References: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
 <Y42ucX8GwYEFVUcr@kadam>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <Y42ucX8GwYEFVUcr@kadam>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: G6gDbpf1v9Y8sP8H74z2rHIxG3qi61nu
X-Proofpoint-GUID: G6gDbpf1v9Y8sP8H74z2rHIxG3qi61nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060171
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/2022 2:10 PM, Dan Carpenter wrote:
> On Sun, Dec 04, 2022 at 04:11:41AM +0530, Akhil P Oommen wrote:
>> Fix the below kernel panic due to null pointer access:
>> [   18.504431] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000048
>> [   18.513464] Mem abort info:
>> [   18.516346]   ESR = 0x0000000096000005
>> [   18.520204]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   18.525706]   SET = 0, FnV = 0
>> [   18.528878]   EA = 0, S1PTW = 0
>> [   18.532117]   FSC = 0x05: level 1 translation fault
>> [   18.537138] Data abort info:
>> [   18.540110]   ISV = 0, ISS = 0x00000005
>> [   18.544060]   CM = 0, WnR = 0
>> [   18.547109] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000112826000
>> [   18.553738] [0000000000000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
>> [   18.562690] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
>> **Snip**
>> [   18.696758] Call trace:
>> [   18.699278]  adreno_gpu_cleanup+0x30/0x88
>> [   18.703396]  a6xx_destroy+0xc0/0x130
>> [   18.707066]  a6xx_gpu_init+0x308/0x424
> Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")
>
> Let's add Jonathan to the CC list so he can Ack your patch.
Thanks, will post a v2.

-Akhil.
>
> Although the real issue is that a6xx_gpu_init has bad error handling.
>
> The a6xx_destroy() function supposed to free *everything* so then the
> question becomes how do we avoid freeing something which was not
> allocated?  With normal kernel style we just free things one by one
> in the reverse order from how they were allocated.  See my blog for more
> details:
> https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/
Nice post. Thanks for sharing.
>
> However this code is written in One Function Frees Everything Style
> which is difficult to review and prone to bugs.  The common mistakes are
> the kind of NULL dereference that you've seen, double frees, and missing
> frees.
>
> The only way to read this code is to open a new text editor window and
> line up the allocations with the frees.
>
>   1725  static void a6xx_destroy(struct msm_gpu *gpu)
>   1726  {
>   1727          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   1728          struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   1729  
>   1730          if (a6xx_gpu->sqe_bo) {
>   1731                  msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
>   1732                  drm_gem_object_put(a6xx_gpu->sqe_bo);
>
> These unpin/put must be done together and should be in their own
> function.  The ->sqe_bo pointer is allocated in a6xx_ucode_init().  It's
> assigned to an error pointer, but then set to NULL on error or after a
> free.  So this is okay.
Agree. This warrants a helper function. I count 11 instances where it will be useful.

>
>   1733          }
>   1734  
>   1735          if (a6xx_gpu->shadow_bo) {
>
> ->shadow_bo is allocated in hw_init().  Should there be a call to
> msm_gem_put_vaddr(a6xx_gpu->shadow)?  It's unclear.  [QUESTION #1]
Yes. This should be freed with msm_gem_kernel_put() which takes care of freeing vaddr.
>
>   1736                  msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->aspace);
>   1737                  drm_gem_object_put(a6xx_gpu->shadow_bo);
>   1738          }
>   1739  
>   1740          a6xx_llc_slices_destroy(a6xx_gpu);
>
> This has IS_ERR_OR_NULL() checks so it's okay.
>
>   1741  
>   1742          a6xx_gmu_remove(a6xx_gpu);
>
> This uses a gmu->initialized flag which allows it to safely clean up
> everything.  Fine.
>
>   1743  
>   1744          adreno_gpu_cleanup(adreno_gpu);
>
> This function has the bug that you identified.  Let's dig into it.
> (With normal kernel error handling you can read the error handling by
> looking at the label name but with this style we need to jump around and
> compare code from different files).
>
>   1745  
>   1746          kfree(a6xx_gpu);
>   1747  }
>
> drivers/gpu/drm/msm/adreno/adreno_gpu.c
>   1079  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>   1080  {
>   1081          struct msm_gpu *gpu = &adreno_gpu->base;
>   1082          struct msm_drm_private *priv = gpu->dev->dev_private;
>   1083          unsigned int i;
>   1084  
>   1085          for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
>   1086                  release_firmware(adreno_gpu->fw[i]);
>
> This is okay.  ->fw[i] is either valid or NULL and releasing a NULL is
> fine.
>
>   1087  
>   1088          if (pm_runtime_enabled(&priv->gpu_pdev->dev))
>
> This is the bug you found.
>
>   1089                  pm_runtime_disable(&priv->gpu_pdev->dev);
>   1090  
>   1091          msm_gpu_cleanup(&adreno_gpu->base);
>
> Let's dig into msm_gpu_cleanup().
>
>   1092  }
>
> drivers/gpu/drm/msm/msm_gpu.c
>   1006  void msm_gpu_cleanup(struct msm_gpu *gpu)
>   1007  {
>   1008          int i;
>   1009  
>   1010          DBG("%s", gpu->name);
>   1011  
>   1012          for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
>   1013                  msm_ringbuffer_destroy(gpu->rb[i]);
>
> Destroying an error pointer is fine so this is okay.
>
>   1014                  gpu->rb[i] = NULL;
>   1015          }
>   1016  
>   1017          msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
>                                                     ^^^^^^^^^^^
> [QUESTION #2] Passing an error pointer here will trigger a stack trace
> so this is bug.  The drivers->aspace pointer is allocted in
> msm_gpu_create_private_address_space()
No. aspace is allocated using gpu->funcs->create_address_space() from msm_gpu_init(). If memptrs_bo is not NULL, then 'aspace' should be valid. So we don't have any issue here.
>
> drivers/gpu/drm/msm/msm_gpu.c
>    824  struct msm_gem_address_space *
>    825  msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
>    826  {
>    827          struct msm_gem_address_space *aspace = NULL;
>    828          if (!gpu)
>    829                  return NULL;
>    830  
>    831          /*
>    832           * If the target doesn't support private address spaces then return
>    833           * the global one
>    834           */
>    835          if (gpu->funcs->create_private_address_space) {
>    836                  aspace = gpu->funcs->create_private_address_space(gpu);
>    837                  if (!IS_ERR(aspace))
>    838                          aspace->pid = get_pid(task_pid(task));
>    839          }
>    840  
>    841          if (IS_ERR_OR_NULL(aspace))
>                     ^^^^^^^^^^^^^^^^^^^^^^
> [QUESTION #3] This check seems reversed.  It should be if *NOT* is error
> or null.
You are confused about global aspace (which is attached to ttbr1 in gpu smmu) and private aspace (which is separate for each process and it is attached to ttbr0). Here the logic is that when private aspace creation fails, we fall back to global aspace. So this logic is correct.

-Akhil.
>
>    842                  aspace = msm_gem_address_space_get(gpu->aspace);
>    843  
>    844          return aspace;
>    845  }
>
> regards,
> dan carpenter
>
>

