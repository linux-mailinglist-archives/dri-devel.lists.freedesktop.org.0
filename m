Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6353CE65
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 19:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6304911216B;
	Fri,  3 Jun 2022 17:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9320811216B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 17:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itQHMMeL5mLLgedIwts8ltmqIl6hrVgieFPoh6gdYKC51SJgvzNAhbA4+j+lQskUudC51UjBOFT6bcBG6DLpB25vGV28jxj5GBDPWjJHz15kj4tZtAEzZGmUmBZi2dvV3uWFKYwR0SE67KTHd6K2T1/7BOfANCehfoh5n2rueO27tb9UAVvoz9RdinRYw7zi7T3EsGaclHX/mfOltA/zzOVTB1vTjeENZFcfs97Sm3Ea89vbWGobxcGkEbKh7lxrg4IDwq8pVm7ItaKNLfSzxdxdaYjVAuOsH+On9SOYayA/M4JcdhnVYeFnKE5y/4y1Axen5HPA7iVBy+RwiscuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+mRXZbyJ/rjUTWazgHECQo08PhWiHtoMvtpGXrulx4=;
 b=GTHHIyYtJRfaWk2bZWAXHy9gY11qRlUjGO8Uf0+xfp9y3d6mW0b8Ty8WQHVlS8nfzCwx/IZKb5Y9Oi3Jj+BGZfL6bJbLWEsIEXhRWMGtPSIx1Ms7pwFVUjG/KC7IT2gIry0zIzGY8OH4hxMpc4QDp1ciGF7FDBAVOpgEcMdombnZcvC1JJdQTy+10A0qgYN5ltYWo7yNGptZSNeeXlGgnkFX6G2EY7uhL/8jak32pgQZ+8f26QQOYknRIHnCTyHk03zn8ZxcUKw/qNZtQ3brI+pxtKqQiyWGS8OnuDocNZHIBNAAn1Zqr6Lj3kP2YAqC7ioRzcYxT1/Wi5QckqTFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+mRXZbyJ/rjUTWazgHECQo08PhWiHtoMvtpGXrulx4=;
 b=Sb0eKqDPpI7kD1ByLyHnS9fReXJQaP9Etj2tIQdS5qdNiLG9rQsKzp9bN//cCRdcBjzpKevM0/lRqNDs/vYhDo+UrXemQ5OPNuXWUK8oKdDLBFy5nxWV5d4Zq6J3bWUA4QP+NqnWMj5cctx7JHvwtcnb+gTaPeiRMjAdSMum0WI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4825.namprd12.prod.outlook.com (2603:10b6:5:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 17:42:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 17:42:01 +0000
Message-ID: <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
Date: Fri, 3 Jun 2022 19:41:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbd5461c-48d1-4fa3-92af-08da45885d51
X-MS-TrafficTypeDiagnostic: DM6PR12MB4825:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48255EBBD8EAB0401C0939D283A19@DM6PR12MB4825.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQX9RoVZt3xBbC8OTcEaK7FtuDQSrikrrwaKO4Q2+Zz7Ue4SiHOqkspeu1ftHxgIXnh0I66SVdM8aBwCrBUvQIJP3CkrEieU9cd12fHb/CDKOSvgEK2atqO9JpG4m176HCNTx65LN+eZElcfnUF2xtWntAJfZ/mR27gwOsEmBab047GRgMcvAyqrqhPDMnCoIvJZTGMx7GMF7OlW5Sp74GjgjkRz92mXrDQfrhSjBjaghEQbHLroNKFMd1/2D9ViuWQD+D6VQni9yntl4IHuYgSq4TsLzUdoDy0o0t8xO676OgOFAtWBgPto5eI9cMEt9SE8A+y/Gib+iPodet08zJxkiGOt4M5fy6kpIt5in86zcMFbApTAMtPonZ+4JxUDc5eO4LlkLHaEfp+L0lCncGHJqKUQi5Ru/MZaMZ4P8mNRQdQyDZsiuCcAslNb5MkpbJgYZLxan11vTXQmkSRyFl0lEI4XZ8UaK4WWa9RmAiyqEsGAPPtC4NBSkwv+tuRx+Y0yjQHoFC3lpzd0FqotebpNLnEteeE1JI9PTYN1bDaKJ1GEsSVA4nqR6InybXzSd55h0wY3uvHwznnshsGq5fV+hrhVtydMZoQr4jCsJ7GfAAL0qfBbfhQg+pQtyfnX08nQu6ZgjdOl2QNmhVsCMGCChr2iEGuutF4Ij9PXni66OtyIszMXKaSGhJNggUPCqPA1Zqved2N7hCY1ELFqV5M0EdiieBHMWOHNNmyr6LQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66574015)(6486002)(86362001)(2616005)(31696002)(38100700002)(83380400001)(31686004)(66556008)(8676002)(4326008)(66946007)(54906003)(6916009)(316002)(2906002)(8936002)(5660300002)(36756003)(66476007)(6666004)(6512007)(53546011)(6506007)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1JoWUNhM2pJcjQ2cnpvUjhwRzY4eEpOSnp1T1RqOWZoNmorbit5QkRmenMx?=
 =?utf-8?B?N2FLc0FvWEJWckxDVjBBWjNOMnZZaU9RT2Z6TUZ1aGduL0o3elkxbDl5OFJD?=
 =?utf-8?B?VWVUR2ZKVHpOREQ5NkxrSW4yU3dzWmlVeWZuWndBWGhUZ2NJa3hXNlQ0VVhi?=
 =?utf-8?B?NjE1SGJPMi9sWjBEVjhONzVkdEhyWVZEY1RsU01MMXdVVkM5QktuOHpGZzVw?=
 =?utf-8?B?MUlXUGRKWEdwQllXMmRkYTIxdWdrQWN4QjBnWlhOb0lSSjljZGZGa1Q3eGxF?=
 =?utf-8?B?OVVEQlErVVdoSmhuZWlBQitidzBFbUd2M2ZpZDZUaGdrMmhtelBIYnJnOEJv?=
 =?utf-8?B?M3RBWVRTVnUwaWx0VEZMQ21qT0puam9BTXQ5eVJjd0ZSME1SOWhZK2RwQVdY?=
 =?utf-8?B?emdPU3pWaTJEWVJpR0JtbngzL1VmZnlTdzlLT2J6WmlGYXMyNzViNmZsVjJR?=
 =?utf-8?B?Y0FlUVFKYS9JRzVvUEpXMXM3blJ5aW5leVkyL3lZd0Ixc0ZaNU1HTDZpRDlx?=
 =?utf-8?B?OG00RlNNZkVBa3lFRHozZ2wyak82dkhNK2pjL1B4QXdya0pDS3pDRXRRN21Y?=
 =?utf-8?B?bURUMUpLQ3oreTg2Z2diSFk1bW45YmZuNnFDeThjT2l1dzJyQlJVTUlkczRq?=
 =?utf-8?B?N1hUWkF4WUNLemlmV3RkaEIycHhvVEk5a0dYUU1uODV6S3lVN252Q0laWjc2?=
 =?utf-8?B?dDRXZUtZbUJHSTZmUThJQ01PZXZCaTlhVVBSQk9aMTFXWmJkMEZXdGRReGho?=
 =?utf-8?B?YTJ3cDNtM2hZd0g5UW8vZFVhRHQzL3J0blM5WDVEN3VFUTVlNXNZZEZSQytJ?=
 =?utf-8?B?NUNtZmxXREN1SVQzcFRIRXVhalgwYVJ3bit3WlUrUmZCYzFxNWd6blVEWEFF?=
 =?utf-8?B?U3pJY1lhd1BtY2tkWHA4a2phMnpTekFkYmJWMXBTOXBPSmtKbWw4VWpIc1dz?=
 =?utf-8?B?b3RzdUlOTXJPUVJSWitEU1V1bGR4aFhLbWxZUGQ5ODJNdDhMNjMxY3pyL1ZG?=
 =?utf-8?B?MktSYmQ1L1hkQlJiL0lCemxwVEEyZWs4NUtObXRmVVI4dnRJL0JFS09EeFVN?=
 =?utf-8?B?OG1WTzJ2Qk9NSWJ1ZjY4U0hwc0tkSGo2R3JCd1QvT3RDU3lNODBIdUxCbmlr?=
 =?utf-8?B?U3E1eGVTcTdJRWNBRSswbjdwWEJtQkJCVUpVN3RWTk1STHp5cjNEUGIzUUlm?=
 =?utf-8?B?a3FJTE5FK3cwTE5jaUhPU01XUml4VkxaY2dpdkdtWEJOcld1cGg3MmJFb2ty?=
 =?utf-8?B?U1JDU0ZPREtZZXVYbys4QUJWOUZUaFpPUWJnc1VWT3RnaFhldENUN091elRy?=
 =?utf-8?B?bmNrbkpnNjExNTIxRi9zZXp0TUV5ekNqd0hwU1F1UlFGUzAyaXJ1VHFEdjM4?=
 =?utf-8?B?SUVrYmRuWHlUTVdDdHN1REQyVDRIQ3dVamFFazZ6RXR0c2VtZjVGa0ZrK1NY?=
 =?utf-8?B?enl0Q3BoSk9Xd2tFMUdlZlo3M09SSmFWai9NSkljOVNFMGd6a1pSRzJMMThK?=
 =?utf-8?B?RFpTMzdzNGJKWE9kU3FtL0lWdkZwUGdhdVh4dExycStZdmFBM1Ztdml4RXlP?=
 =?utf-8?B?UDEvOFpLeHJRSTJvTUxvRlNiK0FSaDZ3S3Rzd281ODA4SldjVUcwNUtQazVu?=
 =?utf-8?B?RGVWcnd0RGlPcDg3YU5qb2tnd1BlRW5jVHF5NUpUeVlmeDA2OGQxUnBJVzV3?=
 =?utf-8?B?bjNSdEhyQWl1VmtyUENjVkRmRU5KUVpoTERCOVpNdStYaGVLUkphM3hnRC9C?=
 =?utf-8?B?dEppc1RDWnYybGhvdVc1U0YrTyt1eitxTjh2OHNZQndBb1lITDdJWjM3YW1Z?=
 =?utf-8?B?SFc4K3l2SVR5TlpJQUxtSHVnVHVuN3J6OWVLUWJoRSsxQW0yQU5odzAycGJv?=
 =?utf-8?B?YXUyZU1tMytHSmdYVE5wTnkrK0dnOXNrdEp3T3hTb3FYdlJmQUpSZzJodXlO?=
 =?utf-8?B?elY3YUJ6NExOVmRHRmtKOWhsRmJENU1naVRwNVdkVkpYcjlJdHJEekRhYVZu?=
 =?utf-8?B?Wk1ZdjIwaFJVUkxqODBFRTZnV3BUN2MzYVBFOHBTU3cxN3Bha1FPcGdkRVRJ?=
 =?utf-8?B?L0wxbXdwY29WVHdXS05EZjFNT0FyNkFHdy83SDZSL1EyV0tVOS9tbHh2ZFBu?=
 =?utf-8?B?Rkppb2Z6clc5S0U2VzZobVo0TVhMNk5TK2RjakROb1ZBUGhFMFdIUnczRVc3?=
 =?utf-8?B?Q05EZzh1b3cyUmswazA4NHcxd2NTWDdHcHkrTlU0eU5nUDlVQTBGVEZ5cVlH?=
 =?utf-8?B?bnR6UGlzUFBIZldOYkZHVU45NmJwTGU3bXJuTUlaQXBCMitWTWIraGpCTlVH?=
 =?utf-8?B?WmRZQy9UQXFKeGh0a0Nhbm1XUzhET01YTXlRN2hVTDUzUWlPWUtmMVA5cWdO?=
 =?utf-8?Q?AiCMo/9o8tad9EBI1l5fY5PzPBi+JSGNcHCgh3UEjymTK?=
X-MS-Exchange-AntiSpam-MessageData-1: g6pVMOK0xRAUKw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd5461c-48d1-4fa3-92af-08da45885d51
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:42:01.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TE8GW8xdaHU48RH/vQ+sXOtaN9nY65ZWIsmzHPH7rE2ZLOBM9ayqvikW4ibqt4YS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4825
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.22 um 15:23 schrieb Bas Nieuwenhuizen:
> On Fri, Jun 3, 2022 at 2:49 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 03.06.22 um 14:39 schrieb Bas Nieuwenhuizen:
>>> On Fri, Jun 3, 2022 at 2:08 PM Christian König <christian.koenig@amd.com> wrote:
>>>> Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
>>>>> On Fri, Jun 3, 2022 at 12:16 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
>>>>>>> [SNIP]
>>>>>>>>> I do have to fix some stuff indeed, especially for the GEM close but
>>>>>>>>> with that we should be able to keep the same basic approach?
>>>>>>>> Nope, not even remotely.
>>>>>>>>
>>>>>>>> What we need is the following:
>>>>>>>> 1. Rolling out my drm_exec patch set, so that we can lock buffers as needed.
>>>>>>>> 2. When we get a VM operation we not only lock the VM page tables, but
>>>>>>>> also all buffers we potentially need to unmap.
>>>>>>>> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
>>>>>>>> areas directly when they are unmapped.
>>>>>>>> 4. Tracking those updates inside the bo_va structure for the BO+VM
>>>>>>>> combination.
>>>>>>>> 5. When the bo_va structure is destroy because of closing the handle
>>>>>>>> move the last clear operation over to the VM as implicit sync.
>>>>>>>>
>>>>>>> Hi Christian, isn't that a different problem though (that we're also
>>>>>>> trying to solve, but in your series)?
>>>>>>>
>>>>>>> What this patch tries to achieve:
>>>>>>>
>>>>>>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>>>>>> (t+1) a VM operation on a BO/VM accessed by the CS.
>>>>>>>
>>>>>>> to run concurrently. What it *doesn't* try is
>>>>>>>
>>>>>>> (t+0) a VM operation on a BO/VM accessed by the CS.
>>>>>>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>>>>>>
>>>>>>> to run concurrently. When you write
>>>>>>>
>>>>>>>> Only when all this is done we then can resolve the dependency that the
>>>>>>>> CS currently must wait for any clear operation on the VM.
>>>>>>> isn't that all about the second problem?
>>>>>> No, it's the same.
>>>>>>
>>>>>> See what we do in the VM code is to artificially insert a bubble so that
>>>>>> all VM clear operations wait for all CS operations and then use the
>>>>>> clear fence to indicate when the backing store of the BO can be freed.
>>>>> Isn't that remediated with something like the code below? At least the
>>>>> gem_close case should be handled with this, and the move case was
>>>>> already handled by the copy operation.
>>>> That is one necessary puzzle piece, yes. But you need more than that.
>>>>
>>>> Especially the explicit unmap operation needs to be converted into an
>>>> implicit unmap to get the TLB flush right.
>>> This doesn't change anything about the TLB flush though? Since all
>>> unmap -> later jobs dependencies are still implicit.
>>>
>>> So the worst what could happen (i.f. e.g. userspace gets the
>>> waits/dependencies wrong) is
>>>
>>> 1) non-implicit CS gets submitted that touches a BO
>>> 2)  VM unmap on that BO happens
>>> 2.5) the CS from 1 is still active due to missing dependencies
>>> 2.6) but any CS submission after 2 will trigger a TLB flush
>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
> For this series, not really.  To clarify there are two sides for
> getting GPU bubbles and no overlap:
>
> (1) VM operations implicitly wait for earlier CS submissions
> (2) CS submissions implicitly wait for earlier VM operations
>
> Together, these combine to ensure that you get a (potentially small)
> bubble any time VM work happens.
>
> Your series (and further ideas) tackles (2), and is a worthwhile thing
> to do. However, while writing the userspace for this I noticed this
> isn't enough to get rid of all our GPU bubbles. In particular when
> doing a non-sparse map of a new BO, that tends to need to be waited on
> for the next CS anyway for API semantics. Due to VM operations
> happening on a single timeline that means this high priority map can
> end up being blocked by earlier sparse maps and hence the bubble in
> that case still exists.
>
> So in this series I try to tackle (1) instead. Since GPU work
> typically lags behind CPU submissions and VM operations aren't that
> slow, we can typically execute VM operations early enough that any
> implicit syncs from (2) are less/no issue.

Ok, once more since you don't seem to understand what I want to say: It 
isn't possible to fix #1 before you have fixed #2.

The VM unmap operation here is a barrier which divides the CS operations 
in a before and after. This is intentional design.

To get rid of this barrier you must first fix the part where CS 
submissions wait for the VM operation to complete, e.g. the necessity of 
the barrier.

I'm working on this for a couple of years now and I'm really running out 
of idea how to explain this restriction.

Regards,
Christian.

