Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68B839AB8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 22:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6552910E080;
	Tue, 23 Jan 2024 20:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9810E080
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 20:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc9bmx8j2lz0gNmsunGtwrnekB98YevmL5fYzNFXqY5saBfow2jQ1DLWKe2qwJehFRA4UURXCUp0NkKWmhi5vRCGKccqorbs0AZpXmljWIanYYpeHlcz/edNZOhc2rSTtJqFfBvbwy/+pMT1/El1V5tmcZgmCuAsfZ8sT617bejLhHNG/+d23auXFhYr+MSpzg59SJrTZ8N+rYIZ8PluIhn/oQiQkIb3cFghlV4itfNEsu7BrIcyp06m12NS+XCy9WdkAcsVl6jWJYXa2nXWGXKxyce4HiOCQvotqPmkzxGrDdqiiEQBwhYX1j+WCzv1xguHeUaPj9HDfvUjlh9kaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jq52U2ZRMBAPurWFBAQ4GY4OzpPp8hQ1xGb7YJwsvw=;
 b=TqKT3V9rG2N3/Ym1DGWf+EUP67u8x5ErbBPZN8Gt97olNiFIQHFNIk/FwbPWL1YIGMmkju/7CMQ8NnFImPLk6CEI3BVW98X7yEPFtJSVjWXpgTxgnrOvWqq2HBUn7mjYIhIPsCIS8tJ8RsPv6NnjdEzoy6ttps+Jh1FtG3LjpRI7cwkd65YdIBPr92srbhDwOd71Ed5mdfUSsWSl/Fz6aUsYI71ETO4T1jzuy0vU7evHGuAws2zzNSRZCxaYZxxXF8+htFtnNPC5IkB9oDRzPo9nqF6ylGpv1FILKKYev6mhoXgdFLlCPJWbsW2hCqDIwytpWkm3AkKL6DgFXRfxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Jq52U2ZRMBAPurWFBAQ4GY4OzpPp8hQ1xGb7YJwsvw=;
 b=Nkn73qzeaxDwNbAezI7exPZ4ItOD7rVhrXtXP4Ed5zXuJ4IHHfyRE1lUJ5xQ3mtgLZs7H78KTR/2omMoU4xwEQf1OWNZBCe4LJX2IwM/y+7II5+qbKysPCxGjF3mlKMA4yVk83ioEJocnqkN05htEGIeb0SRigY/Exd93rg/4N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 20:59:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 20:59:49 +0000
Message-ID: <27bbb263-bb0e-42b8-8411-703f476131ac@amd.com>
Date: Tue, 23 Jan 2024 15:59:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/amdkfd: Export DMABufs from KFD using GEM handles
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <5e939c58-dddd-4af7-a650-66cce38c4beb@moroto.mountain>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <5e939c58-dddd-4af7-a650-66cce38c4beb@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0958dc-9c2e-4f6d-80df-08dc1c563cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sj8vi0iAboWWD2l3vY2jKxRYNNdK5wdZRQwjTqfMwaiUOgGawiZjSfnUU1S0Sta9G/3HyrUSZ83OLM9ILhCzJpcu/IwecfueSVPUGfeS4qljYZ+8sSMbv6a+kF6VVQsF9mLFreAXSiIs+EZzwOWSB/jbTagrltQDXGHD3pzuXKZzDNiVVB+2hsvInsntfH/H80MZvsPNTbQNVHhCbP3/MO0hVfNu8H/lXjtxwO1FnW+MHK1GvKvihFaYwmS7Y27FVApwkTlhCcuEn3OR+ega2I57m8CfaNziGhq9/8OpnZOTWUCRDCaPucJ3cPI+mX9sYJXTac8ULhI47nGnM71yvJIjyPAgqAY8Xs0RCrg7YHxz1gh1Fz4FbrT2Tf3mavO7acX5FQ+7vnN+Aly4uRT4RHknph7JdlV8jBvM+LtMdJQSuPpPvwofJZ2fMvVgC2Ep3+tSS602VUhlYIOmzPanTmar+Zq5/J0z81r8VYCCVvEPi58bp4iIL39194R1e+GTfwLFbuIpP8bXfXt2/EJTLGKvm74Dx92nsnkMLjereQliM+jYm44wpfdN0mAE9+IzdjZbHCGhpOEiGNoVNPdiLHSTsn25brBESKVcP1CpZzNrAjPBsrkCY7e3p1eNmDclIt35Wf0TCTDLW/Er1VyBvMZV1Nd9sIMdBC5EEOg0H79CEMO6yLowvooDPLHL7GnQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(66946007)(6916009)(316002)(66556008)(66476007)(6486002)(4326008)(36756003)(8936002)(44832011)(31696002)(86362001)(38100700002)(8676002)(53546011)(26005)(478600001)(6666004)(6512007)(6506007)(83380400001)(2616005)(41300700001)(5660300002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snd0akM0MnZqaW1acUFFcDJXRkR3bGp5aEkweTZCZHFna1lMa1ROa1owTW14?=
 =?utf-8?B?ejdSSXU0QVdVRkx3b0ZtRFM3ZDNYVHQ4bFZQQVdKNEh3aU51d2ZBOXVWekRO?=
 =?utf-8?B?NFkyK0h5aTZLaUdHZHQwYzVmak1iMWJOTWtHNHdDT1lnNjY2RlMvZXFTWUV5?=
 =?utf-8?B?QmR4NXpNZ0FyYlZzdFlKYjg5MmFNbTdCR28vRjF5RHUwSjZLMHV0VTFIeWRp?=
 =?utf-8?B?MWVzdXVzaWpPa3M4SUlNQXMxdjhKZ2QyeTdqazE1amtmYjh1S0hlcEtHVVZt?=
 =?utf-8?B?WUhiS085QXdEVWJXRFdtUHNRdTlIYVFzUGZUMVFVYllBOXBFOFNHMGlTVXF6?=
 =?utf-8?B?UnVTUjhwaWlvSlQ0QjNUa3JYWWlsOTIwWk1uaEpUMVM1MXBmcnAxN0dRczIx?=
 =?utf-8?B?VVlOV200RURpUVFJWkFDZzhEeHlPUDZSaUx2RVI2akFpRjU5clgvRFFjVzhP?=
 =?utf-8?B?QTBBTlN2Ly9NZ3pTSmlaNDhPdWh2SW40UlJ0Yjh3bEJlVGNTYlpDbVBlLzZm?=
 =?utf-8?B?Y3d1cVBXc2xnNW1saWlYM1dOQXFMTytFT0RjWFBKQnVyUmYxU0pIL2RzRFZR?=
 =?utf-8?B?U2Nmc0hLOHRlOHl6bVNSL3dGV3dlTTBkdWZtNXVGQnB5cE9KdUR0SXk3Y3lR?=
 =?utf-8?B?NXlqaGFDQzNENFhLcVROWGJhR2VzV0ZtMUFJWDVwVnFFUnFjM3pWMnhjblhT?=
 =?utf-8?B?MVYyZjk1c1pCZFFsUE5VbmlCaEZoTGpRSDh3ZHRsendKVk1wUytFejQ5cysx?=
 =?utf-8?B?dU5nTGJkQStFanpyUDlnZkxaMDFNSzRrakFJUEptV1JOMS9UVll0MnlwZXVt?=
 =?utf-8?B?NEFxSHlwS01GbVBzQkVrRVdZYng1RCtISVFGTjZmblFrMCtiaVQxdm81MDU2?=
 =?utf-8?B?RW83ZFRIcXpDRmFDMFBPVTNpSnEwTFFpcVRyM0thbThyUVNaNHV6STlFNm9Y?=
 =?utf-8?B?aWRNOHg4b1hLNW9BS2hoMGJRTS83Z1R1a1R2Q2hOU1BuKzdUNWlqNTFFNVF1?=
 =?utf-8?B?bmZjRFkxblNUTDFnQnd3cVhxU0p3V054ODM0Q1EyMHc4WHRpTUVQMUlKbjVV?=
 =?utf-8?B?Y3JUOXF1bHcveG9BVUpuWDBCODRDWmxkT1l5bjFJSjBhZzd6K2lqeVQ3VXZ3?=
 =?utf-8?B?a1VnaEt1VmI1cmZETC9WOHpGdCsxd05WUUhHRXdsN1V0Y0lLZXo2QWk4Vldw?=
 =?utf-8?B?WXZxaXJ4UWRkb2hNSzMzSGhUdVJ6Y0I3K2hpQ3ZyOGhjWmUxSDZQalA2bHZ2?=
 =?utf-8?B?cG9yT3FQTk4wRGRyK2p4MHFYSnpMcUxqdDlVZlk0NHhxV0JjYzhsaUd4azRH?=
 =?utf-8?B?NUtXY0YyUjJMbzlsTkRQdFNvbzlvd3ljNHFHbDFVQkRzUXlyemtKa0dMZ1A0?=
 =?utf-8?B?L3RiQUZTK1JkbE9INkJNVi9GZVc4NVpSeStwRGVGSVp0VEloTHpwOHVqcjlm?=
 =?utf-8?B?RXF1M2lSclhVbDVIaVJXM09uVTJaMDh4UTFML1ZwenRsMnFjVXVJS2kyUFBF?=
 =?utf-8?B?QjV5TkU4RVloZHQ0YWxRVXkvTHp0VitpL2VnMGFYZ1pBQWJrOWlHaDhiUHZs?=
 =?utf-8?B?SGRWL3JvNlZ5NmR4VUNjVHRyMmlncmpqSzVSN21yck9xakI3Q3ZxMlJWVHFm?=
 =?utf-8?B?eWVxNEpqRUxZaEE4N2ZEMkRUWkJ5c2w0czIwcUtkVjNPUll6RnFZNkZ2VEhT?=
 =?utf-8?B?WjdoNFA2TGEvWFR6Q1VhZUxkQXloekdUWnhLNUQ1aG5VK2JsdzcxREx2UVRH?=
 =?utf-8?B?d2duSnQ1UW96eGF2dDZQN3pKbnR3SC9lcmRiNlNGdjQ5RnFDZW1ydktvUUUw?=
 =?utf-8?B?NVNLcmg4V0JITTVFa2dSRlpJRjJyZlNyV0ozLzJzK3FRTXZ1TE9CdTQvSCsz?=
 =?utf-8?B?bWtqaE80MjNBZGlsckk1UW4zNloxeG5reWYxMS80V0xmYlR6bFd3NlpaVWtq?=
 =?utf-8?B?ZDNTRmxGOXhrUVdYcnBDL3E2NlNNWWFoT3ZNdUhSSHk2Rm1TTnd4enpoSHov?=
 =?utf-8?B?L1MrR3NERXM4bUl0SGplUGkrTFJhditDNGl3TksycHd0enI3WTkzdGpaNEY4?=
 =?utf-8?B?NUNwK3k5MmJlL0ZVd3NYSnFaOTR4cUJNZE55MHA2MklwUEVXNEhzbHh2UDh5?=
 =?utf-8?Q?cpB9D5VjtLhFwu44kXHK+WHzz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0958dc-9c2e-4f6d-80df-08dc1c563cac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 20:59:49.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFHyM3+UyC1HcDd3Re/qDiQCbVHTM7/WFbwCx7XhtoWeheI5boxUfbtsYaH0YOK0rwuBFBkgmvgdpxbo8iFktA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432
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
Cc: linaro-mm-sig@lists.linaro.org, Mathias Krause <minipli@grsecurity.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-23 5:21, Dan Carpenter wrote:
> Hello Felix Kuehling,
>
> The patch 1819200166ce: "drm/amdkfd: Export DMABufs from KFD using
> GEM handles" from Aug 24, 2023 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	drivers/dma-buf/dma-buf.c:729 dma_buf_get()
> 	warn: fd used after fd_install() 'fd'
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>     809  static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
>     810  {
>     811          if (!mem->dmabuf) {
>     812                  struct amdgpu_device *bo_adev;
>     813                  struct dma_buf *dmabuf;
>     814                  int r, fd;
>     815
>     816                  bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
>     817                  r = drm_gem_prime_handle_to_fd(&bo_adev->ddev, bo_adev->kfd.client.file,
>     818                                                 mem->gem_handle,
>     819                          mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
>     820                                                 DRM_RDWR : 0, &fd);
>                                                                       ^^^
> The drm_gem_prime_handle_to_fd() function does an fd_install() and
> returns the result as "fd".
>
>     821                  if (r)
>     822                          return r;
>     823                  dmabuf = dma_buf_get(fd);
>                                               ^^
> Then we do another fget() inside dma_buf_get().  I'm not an expert,
> but this looks wrong.  We can't assume that the dmabuf here is the
> same one from drm_gem_prime_handle_to_fd() because the user could
> change it after the fd_install().  I suspect drm_gem_prime_handle_to_fd()
> should pass the dmabuf back instead.
>
> We had several CVEs similar to this such as CVE-2022-1998.

That CVE is a system crash. I don't think that can happen here. It's 
true that user mode can close the fd. But then dma_buf_get would return 
an error that we'd catch with "WARN_ON_ONCE(IS_ERR(dmabuf))" below.

It's possible that a different DMABuf gets bound to the fd by a 
malicious user mode. That said, we're treating this fd as if it had come 
from user mode. dma_buf_get and the subsequent check on the dmabuf 
should be robust against any user mode messing with the file descriptor 
in the meantime.

Regards,
   Felix


>
>     824                  close_fd(fd);
>     825                  if (WARN_ON_ONCE(IS_ERR(dmabuf)))
>     826                          return PTR_ERR(dmabuf);
>     827                  mem->dmabuf = dmabuf;
>     828          }
>     829
>     830          return 0;
>     831  }
>
> regards,
> dan carpenter
