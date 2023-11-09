Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0195B7E6E29
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 17:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC62C10E8DE;
	Thu,  9 Nov 2023 16:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CFA10E8E0;
 Thu,  9 Nov 2023 16:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnTcbZZv48zAOHpMdP1sJ7qTtbg15TSmIyOmx4w1DLS1U1SXReW8XCjcJTkz0fcQdIQLCp+v1K09FhlYNC/bNYCSQKP3dSWjd7isqOO/wEoQDLxmE0RiZgu7iN9JhE+tVisrCm0dHbnA4Q/zlVp3bIsgbNvBShaJheeNk13Sq+UK4dLi2dQ+DfJRLsSI9pUsJQHOtSZqZGAZtar11lfbgNwEjm3/9xknaotG01mjCknt+BRCXvw7Pqwpu+qpl5sy5UMh019Jb42+H8vrqKRCOke0Sd1ppTIZsnla7N0eMi87PK+kUWJd+GMQaRhKMfhXNvzLWrykV0G6n0CUhmvuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai3NSAU94V9acQ8U00gIcZQ/PZGAfB0yzeVoW7QZbxM=;
 b=XtTPXSKmhtLSiAlPebFSVncrSZb9LiVDysTBCa2q+1EOP59/ePlKqZgjpw3KZIfEVv5gqvVBtbW1zyOg1Vxn+iocShaOcnYWSGdJ4f6+WkKw/armP3r9Uo7Cnkk0frP6lYOefTaB2Hu8rpVcJFajP9A2XSRp1xIF+b5o/vUmO08CiSaQYpE+0vBdd1VyfaVfS2fxts0ezSrYMYWNWCRrlnkJVx8ccDw1KmJTT096NOPzhppT+qwmIFpmRlp0bQoFcEZqempsJU6C2nj5XzHewnP4emCxLDa7TYTCESMUgpT0pXSIEvU7+GCBg4Ot1j4iwjx/kcI226AHXGhZZPgNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai3NSAU94V9acQ8U00gIcZQ/PZGAfB0yzeVoW7QZbxM=;
 b=SAUDoyw/sxozlGxYBXxMffXUUPUlHNsDFbFCtsECbxaHHkJm3NDS9+p0MKznRFSjS3kN8i/sFMO8h8D6GT9HxdkgVPntUmdpkD92BG83Lvyp3HbztvlNrTx78EGBQMzu/JqxeUilSIAfvNwPqQyj3N6bc8rdJa0Tl2+jgXJrDXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 16:03:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 16:03:43 +0000
Message-ID: <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
Date: Thu, 9 Nov 2023 17:03:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: c75e4cdc-f897-405c-6521-08dbe13d7244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HiBjyUejvx7yeoS42jkx8+Fdi0AF37XoB2UqB+Q/iZYP84TgLrCu2yrCfpUwa0doAKgmEOv21rff5yp7++URWaN4X4vtX9kI/j1j7YYjlzvfwSJ7hxRQqXYBsLBbewOIDeQ/YLXY62cnNlHzPHQgZkhnF0VGGFMLHhRpX9jsB6dp41FQd3qfENd3pFd6Gpdy+R6t658tqeBnNiQC+aE3OxY5VL7VDvQiOR4lUWgd/Rh97bknWkzIpd859Qb78WOM5XTjRgOcUGaivNa4YYSMpLjQMW3AIpu1Rd1vre1y3X+DceBTGYJctoJEfLKuVr7ApR17Itf1UM1MfNy9tWkEDQrB5BZkTG4x1bv9t9cq5j/+yc5EHwGW9jfhxVJSSEEhAidkq5hFYMewJ+9FnpQWbukPP25D/UJmNZKt+dbhMbyiLWEMox7Ee9i1XAHZCQkDEgCGLpsLYVMSu/lN9R1mtaPu4bEEox2pl/11dVU4G2JAYI4iSBN5L/JIMo5boSlbJEwMwU7fBwiK1BXnk4RKU8/jjPJ06xL7lj/ZcLSWNbIarp+n7RsqqNUapBnWiDMFKJWG1cDxtpFcUw0ooe0BSzAQy9Oxo3+C9+Wd9cF8V6eil1aZolcYPBisJ0ilm0QJu7cCH4od3HMDGmMM84W3qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(5660300002)(31686004)(6666004)(6486002)(2616005)(6512007)(6506007)(478600001)(38100700002)(36756003)(31696002)(86362001)(110136005)(66946007)(66556008)(316002)(66476007)(7416002)(26005)(66574015)(2906002)(41300700001)(83380400001)(8676002)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVVpakI2bEZBNDdUbElvK2lTSHBYS0d0Ymh1Ylp0RFVXQW5HT0xyeVVTZTl3?=
 =?utf-8?B?OXEwbHM5MnhLUDc1SEw5NWM2ZW12NHhkcWxweVZEN3crYjl3a0pyRWl1OU9I?=
 =?utf-8?B?L1hxb1hXUjBXTElHcjhHeHU1RmRQZmRyLzN1S0g0UCtwT1FvU0Zma2Y2K2xE?=
 =?utf-8?B?UFRKYlVPT0FvU1l0WHcrdG1PM1RQaTlyOE4vdGdaNGtkd3ZMN3Nnb1R6SVBm?=
 =?utf-8?B?V1BBbFo3U09BbzNCU0FpWFlSd2RpSnpLVnBYWVJ3Q0cwR09JSXN3dkpPcmRq?=
 =?utf-8?B?TytKYURSR09BRFF1Zk1oZTJaeWpzNFU1cGdreDdXL0cxYXpqU09xclB6a2Vj?=
 =?utf-8?B?OGEzU1VpQ2R0WXhkck13OFVJcVNxYUNNNS8vTlZMRktmWXZYKzRJYldOVHZ3?=
 =?utf-8?B?Vnk0cmh6ZUdqOTRwQ1NZMG1aeTgxdHMzS1lVSTB3dDFvSkhxNkZRUDgvWWNn?=
 =?utf-8?B?RjZWUG85aXorZlRRenBnQnhyTGF0TmUxUE8vRWh2VE45cmtQTWxlbFZHaGli?=
 =?utf-8?B?TDFSMUlDUVNpdk1ZOVp3UGNGUjAwelAyUGhDcFM4Q1Z2cHgzUTFKUy9keHNB?=
 =?utf-8?B?ZS9xZk1ibUxGbTQ0RmRmcCt3aDhpcy9aTXlJMEltUnRpZENqVGVnUDNDSGJ0?=
 =?utf-8?B?RE1hc2pMTmxBS2VwUDcyRTF1M1BPRWJXOFVBOFVPUVFhOEZrUzVSR1h2aVhP?=
 =?utf-8?B?UGVCNzZpSk53TUtqaEs2NUF5VjhrcWNzbi9JSCt6cjdYWk1hOVp4TDdyay8w?=
 =?utf-8?B?bE1sM2lJR0N4Ry9TcXhSY1hpcnVzeG8rZ3YzM0FWODJ3Nlp5eTdkTlhSMlRK?=
 =?utf-8?B?OWxXZDJiaWEvSHFZU1FicGFIaFJKeVdnUk1laGREbEZ6akJMNURGTlVscnRS?=
 =?utf-8?B?aTdTVGxYQ3JsNnBVdURvVDlJRk1XN0pua1JXRGl5OFh5TjloTlFKUEpid2J4?=
 =?utf-8?B?UlFRS0RmV01qUDNvbTJ0S013OEpjRXpMVUJZWnhILzZNb05xSSswNlBTZGJ4?=
 =?utf-8?B?ZXZwWk1ZRTRkREFxNnM3YldkMjJuak1DZGptaHpEaDgzc2t0STM3clFweGds?=
 =?utf-8?B?VVhLQm1MbzNabkFXU2JGTHVScEtCZ2dkMkZSUjBvUiswSENvNGRpdVdBN1Qv?=
 =?utf-8?B?VVF1SmMvZEpJaE9qR3QyeEZUWGxycGJiUHExWUxsN0p4MkJvKzQ5ZjVxUit3?=
 =?utf-8?B?OXFxYk1tSmxiTStvU3o3VTJWQTg3My9EL0pvc3FZMGJtenkxUFk3QXlQMnY0?=
 =?utf-8?B?RmI4bGFldlVyeGxtQi9GRGJvODZZL2dNeS9yNFRXVnJjSG9pV3J4WVRXb2s0?=
 =?utf-8?B?WXJGTWlaRWMrMVlMOEhzMy9kd1RLTVRUVGZGS1FZVnZwMjl0L3FUTTJWL1ly?=
 =?utf-8?B?NlkvNVY4QXZZT3VPZWdSYjNQK0RUWnEyQ1g3QjFhWk43WHVXU2JSQy9IRnlW?=
 =?utf-8?B?NytqSmZSWkxOd3pCWkdIWGxCazRxWXYwbWFCWXl3TFlSK0llUUYyczh4OU1p?=
 =?utf-8?B?U2hHRzhjTHVpc0p6STF2THpJMG16Q0RYOUZuSUMySTU3MkZQcUNqUFV6RzZZ?=
 =?utf-8?B?N09hZFd3ejRacFkyUFBNdHNRUnFHeDZpRzkyQTlyV2FCcG9SSU56NWxkRHdn?=
 =?utf-8?B?NkxrV0xaMHdHcjhyTy9Ha0NXQ2QwMjhHc25helpZcTltL3pQQ1BmblpqM1dG?=
 =?utf-8?B?bWtFbXkwN3JtSjJEM2o3eG5NN2Y4OUNOTlhJWlhQaXNMZlVHWi9ITE1GeGdl?=
 =?utf-8?B?N1U4bFY2K3RPSkN2MWNua28vblJUellNR0ZiTkI5ZmUxVHAyZDlzVFJVOUNM?=
 =?utf-8?B?VHVHUjdZeUUzTHZPU3FqQ0ZXbzgxRDVidXNsT3pQVWlQamEyVEJSWDJCNDJa?=
 =?utf-8?B?WFVQV0xDRXlKTERoOFZDU1Uwc3VqSjlMM01DaXg1cjd0dnVNRFZ1ekdCUjZL?=
 =?utf-8?B?YXFOQ0hwN2EyV1lkRUhJNy9yWFBzK1REYUtJZkhONVZNclV3R3dzMmJPdHRs?=
 =?utf-8?B?cmx4TVplS01ycVVnOU01c3hQRkZseDZlZTd2bUVPZWp4RmlsQWNwTG11SmdT?=
 =?utf-8?B?ckdIazBzemhXelA4RklFWGFVV2NaeStyV2ZuVzIwaW9pRTRsOS85akRRUHpH?=
 =?utf-8?Q?h8zWcS6hLUnoqmiDYHv08nx5m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75e4cdc-f897-405c-6521-08dbe13d7244
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 16:03:43.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqSro/YXLZL1iEf5BzKN6PkE+JEdOcbJJxz6tZg9MdRAtDkVUr26VV6hTXf28enx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.11.23 um 16:50 schrieb Thomas Hellström:
> [SNIP]
>>>
> Did we get any resolution on this?
>
> FWIW, my take on this is that it would be possible to get GPUVM to 
> work both with and without internal refcounting; If with, the driver 
> needs a vm close to resolve cyclic references, if without that's not 
> necessary. If GPUVM is allowed to refcount in mappings and vm_bos, 
> that comes with a slight performance drop but as Danilo pointed out, 
> the VM lifetime problem iterating over a vm_bo's mapping becomes much 
> easier and the code thus becomes easier to maintain moving forward. 
> That convinced me it's a good thing.

I strongly believe you guys stumbled over one of the core problems with 
the VM here and I think that reference counting is the right answer to 
solving this.

The big question is that what is reference counted and in which 
direction does the dependency points, e.g. we have here VM, BO, BO_VM 
and Mapping objects.

Those patches here suggest a counted Mapping -> VM reference and I'm 
pretty sure that this isn't a good idea. What we should rather really 
have is a BO -> VM or BO_VM ->VM reference. In other words that each BO 
which is part of the VM keeps a reference to the VM.

BTW: At least in amdgpu we can have BOs which (temporary) doesn't have 
any mappings, but are still considered part of the VM.

>
> Another issue Christian brought up is that something intended to be 
> embeddable (a base class) shouldn't really have its own refcount. I 
> think that's a valid point. If you at some point need to derive from 
> multiple such structs each having its own refcount, things will start 
> to get weird. One way to resolve that would be to have the driver's 
> subclass provide get() and put() ops, and export a destructor for the 
> base-class, rather than to have the base-class provide the refcount 
> and a destructor  ops.

Well, I have never seen stuff like that in the kernel. Might be that 
this works, but I would rather not try if avoidable.

>
> That would also make it possible for the driver to decide the context 
> for the put() call: If the driver needs to be able to call put() from 
> irq / atomic context but the base-class'es destructor doesn't allow 
> atomic context, the driver can push freeing out to a work item if needed.
>
> Finally, the refcount overflow Christian pointed out. Limiting the 
> number of mapping sounds like a reasonable remedy to me.

Well that depends, I would rather avoid having a dependency for mappings.

Taking the CPU VM handling as example as far as I know vm_area_structs 
doesn't grab a reference to their mm_struct either. Instead they get 
automatically destroyed when the mm_struct is destroyed.

Which makes sense in that case because when the mm_struct is gone the 
vm_area_struct doesn't make sense any more either.

What we clearly need is a reference to prevent the VM or at least the 
shared resv to go away to early.

Regards,
Christian.

>
> But I think all of this is fixable as follow-ups if needed, unless I'm 
> missing something crucial.
>
> Just my 2 cents.
>
> /Thomas
>
>

