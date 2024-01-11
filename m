Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C482AAFD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C4710E805;
	Thu, 11 Jan 2024 09:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2552E10E805;
 Thu, 11 Jan 2024 09:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6c9tKdUxEyVK8LeOUSVu2GVDlcve82HNLeGe9gjKQd0Pi6mRIk+Yh/ClCNamb8j4/TxtWRZGwZp3Ucbpd2MC0pQwd71po93fFfxyEt0PH1wDOIpfA1XbggXaixwhmlbQaw5a9WXd/VDtVYBSO+oyo+H9B2IIaVHfQwtJ5yNuB9FXtRYrE0OUXNi1vVd5DMWzMOsqr39NHk1hewfoCz1QxWxyEjl1GDVgb70O2is5KNLUAv3ADhNJASc75nwDExwUIfajG0ts3TUt5A4MktYaeJ5GekHP2qib2sITDBe5RTcpVQZJjXWDKn73txpaKiOPBkuRN/1IfSiErB6qB2Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RCvd0FEAiQHVq7padqMzqehhtyqIYMEAuQ+KIXA6c0=;
 b=BVffzaaGqqSewZHDQpFeJZ1QMy/WHiptUd0fe/ViWL6BL/NUU8fxFpAcd9KfFZnQq3KLW5k9bvFsPNFq6nhYfiyZKpFGbGiZOy8NIduuhH4T9i2g8hnK6XvqE3T2OMpbYxH6EKC8fFTsCSI+szqKRFrAdPLGrrLcgARkwPb7uR/bHDo633Z+Z0Aadc0kZiqnrzBtf+lCk9pXPHUSp2738Ia9QlV7fgfZ/PnXXrRcr7WWerniZMsRpoX5xb/2Ur/YuLQUGDF63/dvyL7nJFSVtM0N/qPzVawiJEHlBdNp+Vg4RcjYati/9xCj7bM8VYvUmx2fwFjTPYxq54m/b4iRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RCvd0FEAiQHVq7padqMzqehhtyqIYMEAuQ+KIXA6c0=;
 b=gPxgAxw7XrZxjuIdtHGSP3J+9SpduVJ3RG8yTn+onVX4EJs8smVRQrG2dFlFurIveAut7QhRGgdSWtpdTuSAWC7iM4jP/ViZdDEVBSR539eEYtC2u8GRLnerjk4Ucip9yZYNKv+WFruhTzl/DIjTZUITqjgsucSQPE5ShW5zrPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 09:31:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 09:31:45 +0000
Message-ID: <f20eb87b-2214-41a3-b0d4-75e60c949652@amd.com>
Date: Thu, 11 Jan 2024 10:31:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Content-Language: en-US
To: "Zhang, Julia" <Julia.Zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
 <ZZ5vpoHKhjrpskgY@phenom.ffwll.local>
 <IA1PR12MB6532BF0748B47057101A1CDDF2682@IA1PR12MB6532.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA1PR12MB6532BF0748B47057101A1CDDF2682@IA1PR12MB6532.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: c142b687-d80b-4e32-2c69-08dc12882073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aTHlDfHXn8gRFJK4uFLuu3X/JGu5ck9octfsqke+mV20i5+wvU4jAN19wG8nZ6w6LrC3fAO3kuSGU+HG2HO9+0gFXM5P6Ozii/ZsNFC8iVn6Di0iQ/vE7oyFRGs337a6Q/Ngh+MWiIKi7m+vbmsyt4t7oio1ChEmCWEjlJ9LDFUbJPEZDQbq7hogfXlETMEwGzZ2DukldkcZPFOPBwc40jTZ0AaG8ggx3w0nJa4OUCwVQijM3kfMftAQfIcRvbxIRnekpR6U094ANcTfJewv0HtZJK1mrdoJBPDzezPF+sOMfv2oG3W4C57yVUgzkdsuzMFF/LzRyfTQ4SgAbpFGAbhc8BI8LOxYPQhwcSNF0PZsB91J2z2R3ZHZ2VuIOdwwOXrtouKgK/AE0tVmyQne50/alZjaTBv2Me1fl9fMr+vVFIdyXWn6FaPbTAY7MOD55zvle2BqQOfVd2qi2F2/FQtGdN+TORrNqXuf2RIgANxFQPDFYOAWgh66+wypkP616A9lqe4xuSLaPnPB1GyvyyO6TuDZ1LhvhwTlzDt44ym4nmjYNyqbmgMoHkfhnj8eb/CSCK6dp1C+O39INDeWQY5POq7tMf/w67nfcS3ip3Yw9ksVXlq0uhsxu//YCGdnimFALWpFyLDdWa1xSg77g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(921011)(6666004)(53546011)(6512007)(26005)(6506007)(966005)(478600001)(6486002)(83380400001)(2616005)(5660300002)(2906002)(7416002)(41300700001)(66946007)(66476007)(66556008)(54906003)(316002)(110136005)(8936002)(8676002)(4326008)(38100700002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJ2d2U5aElGMk9hWXhoNXE2dlJPOCtZMG5pVzFBanhKZHFiQ1A3R2ptRmdq?=
 =?utf-8?B?SmRnOVQ0N3REL2c3a3V6cWxDemFoQnZaSUU1UWZpMHV5WmNuZlJxZEo1c2NT?=
 =?utf-8?B?ckxMc3ZpcjRoMkV4QmtwczUwc004b3htMTlWN2lobkUzOUR3SjI5YWp5Q2Np?=
 =?utf-8?B?SEdCUFRvb3JJYnJQM0E0L3ZkemR6ZlZPN1JlMTVNNGpZMlBuaDVKelY4VzdG?=
 =?utf-8?B?a01IRTNST0xGTXVWUTlsMjhjWGxHenZSRWlGU25BNVRmYnhQUHBObVRpQTlo?=
 =?utf-8?B?ZjM1UW83OU9jZjFYelRFWlYvZ05kVXg0cE5XejltNTJqTDFlZjRuY1JnQkVv?=
 =?utf-8?B?WVg2cnc5RjZrQmtneVVqbUhtTC9mSktlbUlTVDIwRUFLLzJGcm1qRnErdFNz?=
 =?utf-8?B?cUZvYXgzb3dRMjk0b2VOeEFhNElSUlpvZE9qSG1kTFVCankzR2Q5UWZKYVVy?=
 =?utf-8?B?ZnZsZFhUbWEzaUJPVVFnaVpBaWtOZG9CeUJwM0FCYjJKQkdFMTdCbTJYTFpm?=
 =?utf-8?B?MlJ0Z0o1UlE0eVRkTnBDQy8xckwrWUhFbnB6Nkc5a1Jpb3dadHB6bEFTUGdi?=
 =?utf-8?B?VXlJZityWTc2bEwvdUZnVGR1eXpoSFJGaldpMGFhcWRHbGNOSVNlbHJ4ZmJO?=
 =?utf-8?B?WDhIUm5uNS90TXpKTzFFTGRXa2NYa2JFQjljK1JWaTExZElSQmd5Zkg2QzFz?=
 =?utf-8?B?Z2FRdlRIcVZWZWZ0THJidW1qWjdUL2IydlJpVHphVkFNRjIwelcxSWpEUS9v?=
 =?utf-8?B?OVVNM2FNQWpiRGFMM01UNi8rTDVHNU0yZzl5MUZnSy9CekRCNXJITFpNY0do?=
 =?utf-8?B?aEZrZTQ5Nkd5SkRVMGNydFJRRXJxRFppQW9BVENWOFhjOGI5ME12WERvVHFk?=
 =?utf-8?B?engvVWJRYXBuT2txejJ1bEZmRVJqeUhoOXhkS3dzZkQrYTBITEpzdEh3bWJD?=
 =?utf-8?B?ajVSck1rejRWKy9pMDVvaW1oc2lyaWVldEZiSWFsaUc4T2pyZTIrQjlkZG4y?=
 =?utf-8?B?S2xoOE4zZDlvQXQ5cjJNNEI4TmFma3ZnRmlaZ1FYYWpVQzlpZmN0QVFPTlhL?=
 =?utf-8?B?NmhVTHo0bVRkRWtsbW8vUFBxeGQvWUdzUDZLSUlZZytseTRzbHh1STZhTU1D?=
 =?utf-8?B?eFZDY3dURWtBOHk2WlFNUkt1elRpTUg1WEZidHBwTGdTVGZWMEtCZTNlcjVO?=
 =?utf-8?B?OWRKYjR4MTM2OWNJN3pPaHZmVmh6c3ZDSDdDK2RJMkQwZExTa3lkZDErWFBF?=
 =?utf-8?B?ZHJkcytLNGYzSnU5TGJkTVo1Y3NrQzVmaFhJaE5pakYxb0FpQktoOFZQRW5q?=
 =?utf-8?B?QTF4bzRDQVZva0d4bU5oV292b3hBUDZZMCtVNlBNKzFUaVhvaXF5QTdWVjVT?=
 =?utf-8?B?cDJCQmJ0TUlLUmRlUzRpYSt1QUloWTBtSTBpZnF4YUY2QUt1aFNzSWtEZXhx?=
 =?utf-8?B?N09NaGtQL0R6bEhuakNqRGpXVU1CeDZyNS92U0RrZjR3eklGQ0MvVTZqYVdV?=
 =?utf-8?B?N2pNMlQxMXpGOXpmWlpiNkgwNGY2RTY5RVVwaHI1SHc4bkNIS1QxTExGTGJJ?=
 =?utf-8?B?NFJtWmVlQzlSeUZiZ2NwdEhWTlZHUEFyMVVYWW42Z3I0UCt1QkFvbGlsazdS?=
 =?utf-8?B?ZWE4T0tSdSs2UjBCU21NM2dWODZKN1pJeWR2TkVjY2FocUJOSjByWXRpWXp2?=
 =?utf-8?B?VDFEckdPL3VQdzdKVWRuVTJEb1JVclFROTlNVm95WXBhUUpHVm5rY1FqV1RE?=
 =?utf-8?B?QStSMDFUUVBtSW0vQkRWd0FLL0lhYVhSbm5MT0JEZEJjdytxNlVtdGRjOXR1?=
 =?utf-8?B?b21wZWJmLyswTXBROG5YUlZXTWJ4SjBlSityZ1BTN1RPSUR6L21OTlZHdU9H?=
 =?utf-8?B?WU13Vmp4ZkU3RzZ5LzEyNERnSGc3U0tGN1Z1aHBjdXo3Si9CTHZ3bm9rRi9u?=
 =?utf-8?B?TVR6OERXU2FpZUR2OVY4TVF6YUtVV1A0U1VCR1I2SjB2MWFCSklJeS91YXBu?=
 =?utf-8?B?cktrQmptZWY1ZW1ZcnRsWkpRRXZVMVN3MU9RZGlNcnkzWkMxOU80alh2Q1Az?=
 =?utf-8?B?eFdYVGpwUFY1Wmd4MXRrZmF2YXhZeTFueVd1WXhMR0Q3eEpBeDhaWGlXbmgx?=
 =?utf-8?Q?nYdQEI66gUzO2E6JYTxYqrtLW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c142b687-d80b-4e32-2c69-08dc12882073
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 09:31:45.0338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO+pbIpoZfE/Nr5asKslfSqxaC59sjlrGaZie+O8etmveJ2eJpawY98sMAarlfhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
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
Cc: "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Huang,
 Honglei1" <Honglei1.Huang@amd.com>, "Olsak, Marek" <Marek.Olsak@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.24 um 09:52 schrieb Zhang, Julia:
>
> On 2024/1/10 18:21, Daniel Vetter wrote:
>> On Wed, Jan 10, 2024 at 05:56:28PM +0800, Julia Zhang wrote:
>>> drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
>>> implemented, or else return ENOSYS. Virtio has no get_sg_table
>>> implemented for vram object. To fix this, add a new device_attach to
>>> call drm_gem_map_attach() for shmem object and return 0 for vram object
>>> instead of calling drm_gem_map_attach for both of these two kinds of
>>> object.
>>>
>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index 44425f20d91a..f0b0ff6f3813 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>>   	drm_gem_unmap_dma_buf(attach, sgt, dir);
>>>   }
>>>   
>>> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
>>> +				     struct dma_buf_attachment *attach)
>>> +{
>>> +	struct drm_gem_object *obj = attach->dmabuf->priv;
>>> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>> +
>>> +	if (virtio_gpu_is_vram(bo))
>>> +		return 0;
>> You need to reject attach here because these vram buffer objects cannot be
>> used by any other driver. In that case dma_buf_attach _must_ fail, not
>> silently succeed.
>>
> Do you mean these vram buffer objects should not be imported by other drivers?
>
>> Because if it silently succeeds then the subsequent dma_buf_map_attachment
>> will blow up because you don't have the ->get_sg_table hook implemented.
>>
> I saw only this call stack would call ->get_sg_table:
>
> #0 ->get_sg_table
> #1 drm_gem_map_dma_buf
> #2 virtgpu_gem_map_dma_buf
> #3 __map_dma_buf
> #4 dma_buf_dynamic_attach
> #5 amdgpu_gem_prime_import
>
> this stack is for shmem object and it requires ->get_sg_table get implemented.
>
>
> But for vram object, __map_dma_buf will call like this:
>
> #0 sg_alloc_table
> #1 virtio_gpu_vram_map_dma_buf
> #2 virtgpu_gem_map_dma_buf
> #3 __map_dma_buf
> #4 dma_buf_dynamic_attach
> #5 amdgpu_gem_prime_import
>
> which will not call ->get_sg_table but alloc a sg table instead and fill it from the vram object.

Yeah and exactly that won't work for this use case.

The VRAM of amdgpu is exposed through an MMIO BAR the guest can't access.

> Before __map_dma_buf, the call stack of virtgpu_gem_device_attach is:
>
> #0 virtgpu_gem_device_attach
> #1 virtio_dma_buf_attach
> #2 dma_buf_dynamic_attach
> #3 amdgpu_gem_prime_import
>
> So my problem is that to realize dGPU prime feature on VM, I actually want dma_buf_attach succeed
> for vram object so that passthrough dGPU can import these vram objects and blit data to it.

That is completely futile effort, the dGPU physically can't access that 
stuff or otherwise we have a major security hole in the VM.

> If here return -EBUSY, then amdgpu_gem_prime_import will fail and the whole feature will fail.

Yeah and that is completely intentional. Let's discuss that use case AMD 
internally first.

Regards,
Christian.

>
>> Per the documentation the error code for this case must be -EBUSY, see the
>> section for the attach hook here:
>>
>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#c.dma_buf_ops
>>
>> Since you're looking into this area, please make sure there's not other
>> similar mistake in virtio code.
>>
>> Also can you please make a kerneldoc patch for struct virtio_dma_buf_ops
>> to improve the documentation there? I think it would be good to move those
>> to the inline style and then at least put a kernel-doc hyperlink to struct
>> dma_buf_ops.attach and mention that attach must fail for non-shareable
>> buffers.
>>
>> In general the virtio_dma_buf kerneldoc seems to be on the "too minimal,
>> explains nothing" side of things :-/
> OK, let me take a look and try to do it.
>
> Regards,
> Julia
>
>> Cheers, Sima
>>
>>> +
>>> +	return drm_gem_map_attach(dma_buf, attach);
>>> +}
>>> +
>>>   static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>>   	.ops = {
>>>   		.cache_sgt_mapping = true,
>>> @@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>>   		.vmap = drm_gem_dmabuf_vmap,
>>>   		.vunmap = drm_gem_dmabuf_vunmap,
>>>   	},
>>> -	.device_attach = drm_gem_map_attach,
>>> +	.device_attach = virtgpu_gem_device_attach,
>>>   	.get_uuid = virtgpu_virtio_get_uuid,
>>>   };
>>>   
>>> -- 
>>> 2.34.1
>>>

