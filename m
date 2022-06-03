Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D353C869
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 12:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D8E10F7BF;
	Fri,  3 Jun 2022 10:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E19D10F7BF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 10:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkU+9W58emvRP1YJjoFm4X4h8vF+pXxI/GhYJGQbKUS8Fz9PRuXQSKTisPRAOSFzpmIMWUL6eSU6vDlpf5h8iUBLaIZBxvVPCiBvrhnW19y/oo8s+Bnoo7VKjK+paSYN2ex+fewgVkDEE6MLn9T2I26BCa1fUULXJaejz6e0GEB2qFf8sQs7h2b3FOwnzyCIOIMrrMxMLlOH6HLl8S1yCoeCci/+2avw8j93pBA8pQ8jfuPxs3Y24qAh2AudE7bMvf5xBOKuNMK1EQcz+/DMLyOcYfqXg0rmjNIEwsc7xOQMNb0guyB+VaJ1qOqTMwZoHQvGn7i0PrWmcrPESDxvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkKkUUTlWclG0z9a8b241EdhDmVAtNaEmtef/eznFA8=;
 b=WOZO2oKM3QbzET2vDI3OIS3xI1HB1FH6ZJLA/AnY6LASyjVoVW4aElS4RrrPozXrv/FZSHLW/RnaOPZYWZg+QCe3HN/LpnxUi8bgH4wY71oS1OKwuxrhd72hsBDE+x/47mkchMVR9rOeW0Ak7OgjwKVhaf5xxE3UmVsTX5V5i7MieoV7uCKbJyRmBzUFRpxdQWI1pEMiicwoCsqii5QGjNswqTF4NUGXhUyTeB38lSkRZOiGR2wzRNL0oQsFWIhHz5uftmw2LlvRt/wDwNocaiG1iKpLCHOze7L4MlgZ7r2hlvL/nGDMXYVlKTVUbzbDbstfefUtQj4C90TPOAhoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkKkUUTlWclG0z9a8b241EdhDmVAtNaEmtef/eznFA8=;
 b=B23cKa/ZEP32cfqJur7KH1eB3NtPK3mxY9+uDNJB1ogdlLP1Hz+ourYlKAd8DU1/EbP0ZzBGp5fEzp5KmGslZ+p5NtMkrh/zXtHv9Z0GLlKEVMxGSEYWxQ8NYTDv7g5sYOafCNgrDB3bsFGNr2YTwNg5EgHI6Z5yVsPHLlmDGhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Fri, 3 Jun
 2022 10:16:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 10:16:15 +0000
Message-ID: <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
Date: Fri, 3 Jun 2022 12:16:10 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 531b4b81-0abc-4614-cfeb-08da454a1787
X-MS-TrafficTypeDiagnostic: BYAPR12MB3383:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3383DA0418FC2D2B91684CDB83A19@BYAPR12MB3383.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yELX+Di+izJ0odUqjatyexY1bTzFxM9kbj5/SlhfHLHAw3x/f3LUxy3FCpPKPPfO83iRIflE3eTGIXwDKEh5LvTyYIia9fohIrEf5gofcX+rXEBTXXum25JH94IBwGD3pJ1+OjiK0oux+t3g9QFWrVwydKek3D6ZgQ40jPOke3aUP0mXykA5R/8KmaFEU2c5h2kuUGg+kzKb7ZXBK4U76jrn0V9btv3WYFWcHCr3YUKJ42oPIL5M6A8895xJWY6ggcc2HTJ9+JINTWte56ovSCKM35F/BKLwz0T8TOiHpqIiRIZ5vcfOF7g8ELVoLd9fYDgT8ecDDaxhB7uLdIRg4ou+8jDi7U2MZn8T+ry7qxXOpXi86cE4hopyRIPeL6qbS8gReMN8jXnSsjfUOi4x3SHCLqoN0BINO6ePUAelZw4hU0XQ9qcrkNPR7TKmMLgEa4+hrolqQZPIzn55MCYvkShQaFyKdZWNScD496OYBwnnRFQq1mHKg1zsiA20RaCMdzGYiWvS86VRSHBfBFEn9obiJ5zTRMRfS66D7cvD1eczCjrMbgL6SuFLTkIsauHWa9l5l008WYUEqJVI9+HcJeWKMjF9XJ24oiLRXd8F65fjoFYI0I+BLKAHGykyg8LCUd33yXjHwiZzFyHe2pcFOWcl5UXRQUkWH8TpvfAgES3acXm5BwtybdVw5Of/ZPGBcsSLefkPSwOMvaUAMVeMGGc8IaceFvJ7+PrL8kv/GWB021UIq2jlS5eFZq6UwAdS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(316002)(8676002)(6506007)(5660300002)(36756003)(2616005)(38100700002)(66946007)(31696002)(4326008)(66476007)(2906002)(86362001)(6486002)(8936002)(508600001)(6512007)(6666004)(54906003)(186003)(83380400001)(31686004)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVyZG9ReE8ySzQ5RUI2b2YzckRPYmQxT2VmdmlieVk5NEQ4WGgzUmRkcVh5?=
 =?utf-8?B?eFFjWWYvendPeC9hRXkzRjhBMVdEelhDT2FXRG51cDRrSEpVWDJpM29FY2tJ?=
 =?utf-8?B?RkZhVk9pSEpXQ2pLNWlMM0ZXN1hrMGhWQmlyTmZFVWlUUWxBS0Y0aU9Gc3Ex?=
 =?utf-8?B?QWlSOExXc1laWDFGR1FtZ1YreGQ1Nml5TXExaVI1MGx6MFpsMWhTN1dPTXpG?=
 =?utf-8?B?SU52ZXdpaTNYZEN5aW1hNGhSdmM4NHRIeHZ0N0M1OXFuVXhNTVBUZUpJb2c4?=
 =?utf-8?B?RTZKak9jMXlBenBmMVQ4SERlWlVUTVdKQ29zZDM0SHdEYi8rTEoyQVpzb21z?=
 =?utf-8?B?TVBBczBLSTlQU05BSnV3bmhqL2VabEpKc0VLZVgwLzR0UkJaR2lRcXYwZUdF?=
 =?utf-8?B?dWNkWjYrQm92cG95SzNpQ2NYbm9LRjROMUVCU01HRDlET0RBRFUrdEhpSm9k?=
 =?utf-8?B?THdwOGcvbHliNzYzMkQvMFZ4K2Z3dWxCZSthVVFpbjlOdGRxWU8zSmxhSjBp?=
 =?utf-8?B?N2FyNHNoVGRrekgxSkhtaW8weFA2ajFVbTBheUI0dUNOQjViMHhpbGtuQVh6?=
 =?utf-8?B?cWw3eGxXemlNRVNTY1VSclh3S2tOSGMrZnU3Ty9weUNocXVsdWJDUHRlMlZj?=
 =?utf-8?B?ZzBRREVXY2FSUXpIOVArcFRmSUkwU0ZaTmFLekQ3Sk5QZC9FdUtoelZlRkNM?=
 =?utf-8?B?cFVBMG9xbUR5c2NXUUQvN2lZbmVPVUlHYm9BN2VJNXAzRGhtQkU4Z0tVSHZY?=
 =?utf-8?B?M3UyZ3UxeFp0b0l3NVZxSGk1TlZObldBczZSdlRId0R0aHI1cmdHaUpPS3Vh?=
 =?utf-8?B?L2hEM2RoU3RYSVc2ZVhudUlyREFCM0NuRmU1cW1pTC9hTEtGWnFUM2pXbWYz?=
 =?utf-8?B?aTNPVnRiaTZxY1JzK3lQZkYweVZid2daOVQvZWd2Y0I2bWpCWFRqUlI1TFFr?=
 =?utf-8?B?eHphMXBBeVZYcDc1QzVvNVQ5bG9QTnN1UHRvL3lFMjdGVURWSFFvY05rRkhG?=
 =?utf-8?B?NjhkbEVTZ1k0L1FPb0ROdzVNV3NYSjV1a2dUbmtHbzVvWmZxaUQ0RzFqeXFX?=
 =?utf-8?B?bmZzZmVFbDlSNURHK3FKZGtRYjlpWXYyTThyZ0lNT0dYZktnM3I2QlMrN1V1?=
 =?utf-8?B?WG83b0NjbjFLSkN1WlFWTXBVRFhzelQzdlBveWVKMEZkOGRiSFV4TVljUENP?=
 =?utf-8?B?bUhKNXk3VHlicXRvcG1RVzB3VEszUlFhZVlaZkZCaHJXU1lDRTZDRVlPaDhj?=
 =?utf-8?B?Q1ErUjlNQzZuaG8zNEhqVkdDaE5xVmljSlN5c3kva1ZZWksreldqWmFablhn?=
 =?utf-8?B?ZGRFMVB4SHVrQWNGR2trRUpxblMweUN3Y3R5dUt3VkhFTDZKbEpRcUdmMks4?=
 =?utf-8?B?NzRkTGYwdmR4dk5aRWs2UnpNNEtPNU96M1JxUGdkTG1GZTFXNGc4dDAyUHUr?=
 =?utf-8?B?RWpxNnJBUC9KLy83S282L1FHWDQwNXZoTG1lTWkzc1B0V3NTYXdUL1ZIWk9V?=
 =?utf-8?B?amtlKzZzNEQxWWRIbElFbVFKenN1NFVKdWNuMnh4Ui85NnlnUXpLeE9obklS?=
 =?utf-8?B?VGpsZk1NTGNtc1UrVmNyVVIvcnhvWlVpczFTTVZXM3JSS0JwUG5UZFVSL1lj?=
 =?utf-8?B?L2kxWit4WkR0NHVwZkg5V0pJUmZtd2p5L0lxeFBTTkY2MnEyOUFQdzN0MDdQ?=
 =?utf-8?B?cXlEdncwdmZibzNkcUFSR0JpRllxUHNaN2lna3VqRkxPb0xRdDY2bGVPd28w?=
 =?utf-8?B?Y0pXenBhZ3RrYzd0a3U0TVFYTXJpVFJ3TElTYUduSXdhS01vUmlMUHZ0b3hp?=
 =?utf-8?B?R2ZFNXRvQUg1Ty93STRzaGFCNW9EYUU5Ung5WFhUZmdCUTRBVlBZdm95VUgy?=
 =?utf-8?B?TGpQUWk3Q2Q2ZUhON01IS3NDdlRmZld2Y0p1UFZvOHZMUUNRbUhHT3dOclNS?=
 =?utf-8?B?ZUxsalBVeWdocGNGUXBYSi9xVDVlcXNGS213L3MrZkpLMFlBWXNZRGR4Z245?=
 =?utf-8?B?UUhobkM1eHpkQ3NGT0tDQWJXZzZFZHRmYUJqNm4yVWt6UTY2aHFja2lxQmda?=
 =?utf-8?B?eHJ3TE01R3RWRDlnZlA0OWxCY0tZVUJGUGtObVYwVUZQNWQ3WXhFa3A4a3N2?=
 =?utf-8?B?MDkyaXhhZ0w0ZkQ1VVRTRFZVZnZzaHIxSW9iZStqbVFIanhVNWtPTmRvTEVX?=
 =?utf-8?B?Y1luWU1jMTRFOWZpTFFnOUFKMVdGSVdmSGhtc0hZaHNSaEVsSlVlWUVoK2Vu?=
 =?utf-8?B?eU1rT0VKUDBCTnVjY2NFSTJ4WG55aW1sU3VGcVVtc2llbklHd0RBZ2VIQjRZ?=
 =?utf-8?B?Z0dGT2ZiNkk1aXpoZjRtaEZwanpkT2JlT21Xd3hQQkM5M1JjWk5mSmh1aW9m?=
 =?utf-8?Q?F/jPuflO8SL+OJRg/I2UEGfDScbmV8peZAYhtK4W+FKi8?=
X-MS-Exchange-AntiSpam-MessageData-1: DILx/W/Fx1SWkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b4b81-0abc-4614-cfeb-08da454a1787
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 10:16:15.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUXCQbVijfaAyptjBidfIEMDxKYX19ATNGUaYE4QaKuNsgle8ne5qr809qgHAcv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
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

Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
> [SNIP]
>>> I do have to fix some stuff indeed, especially for the GEM close but
>>> with that we should be able to keep the same basic approach?
>> Nope, not even remotely.
>>
>> What we need is the following:
>> 1. Rolling out my drm_exec patch set, so that we can lock buffers as needed.
>> 2. When we get a VM operation we not only lock the VM page tables, but
>> also all buffers we potentially need to unmap.
>> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
>> areas directly when they are unmapped.
>> 4. Tracking those updates inside the bo_va structure for the BO+VM
>> combination.
>> 5. When the bo_va structure is destroy because of closing the handle
>> move the last clear operation over to the VM as implicit sync.
>>
> Hi Christian, isn't that a different problem though (that we're also
> trying to solve, but in your series)?
>
> What this patch tries to achieve:
>
> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> (t+1) a VM operation on a BO/VM accessed by the CS.
>
> to run concurrently. What it *doesn't* try is
>
> (t+0) a VM operation on a BO/VM accessed by the CS.
> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>
> to run concurrently. When you write
>
>> Only when all this is done we then can resolve the dependency that the
>> CS currently must wait for any clear operation on the VM.
> isn't that all about the second problem?

No, it's the same.

See what we do in the VM code is to artificially insert a bubble so that 
all VM clear operations wait for all CS operations and then use the 
clear fence to indicate when the backing store of the BO can be freed.

When you want to remove this bubble (which is certainly a good idea) you 
need to first come up with a different approach to handle the clear 
operations.

Regards,
Christian.

>
>
>> Regards,
>> Christian.
>>
>>

