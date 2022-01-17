Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD749109E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 20:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5210FA44;
	Mon, 17 Jan 2022 19:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A597C10FA43;
 Mon, 17 Jan 2022 19:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJd7wYHmv8SNwKk2JEALYj7EeTzHo+LX6t4BzKp/6qDaL2j91UvXKj8h1PdHZMYE+oIhoUC8OVLI/4eWwcXlo9iN5GRYyIxkkeFJuMPa7/zguBIgpv2EJYYYrXxGV4i0SaoatDTMvy218+UQOmNvzT4dnTyZI9aFK53R1uHMSuazZmWMf4Z92FPEzw5l34DG1WOXhN2p7LZylI5rRR+LOKRy8pZVzlaF+F68SxwXQ4pFqVk+DRQBJZCzQ32t+JANFvkdSPtf+EpXlj6TeIRSiYdOYcJoZcFYT2oQEsuBp16GGRkuxQAD3Bs4Mb/M6ijg8sYL2eOukIJRL4Y2nPr54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igGXQKG63V9VhH5LHA2QDTeUlfoUAQz6OqXH4qAGtVk=;
 b=bQCYUYHXot4d3BoFcNAofyUrr1c57Rqr6/FhUahBONpzTCoR/cD8d9N7J6yZ6KQN2THSJjNvnQX4MJK/iLW2aa1eEo9TdVgUAUg6S7DuGkPfekjon//HA9ppvyhjZ4jmpxJ4TAxmy3zQGiuAq0jWZyIj/871zQYP4kcA3kW9gc06sonGdt9Kb7L/NTof1LU5HY2WCSFGyislq5cZ+hD+5OZ+ZpHjEpuzcdhj04Zz1c72pPDKqt3cTNVIaYMGFUfxWS280Qa+3iP/JI/mYYMFogWrPNVEbGHnVk15XcOKu7Sv6Ea8XjmjsdHNFSBc/zW52aVhbMSITfkWtR+lkO2ONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igGXQKG63V9VhH5LHA2QDTeUlfoUAQz6OqXH4qAGtVk=;
 b=Osn9KZPYYD297vzcLGNNhgQwweswGPs6Ww3n3B2fqDbSaa65fKgnVrhpE1u5H5g5KP/Z7MNJVRMtcCkUQ4LH6E122UUETtYVxU1wfnrIgtkx7z21dZFmeolcUqTL8k6PCP3LcHlM1m1By4xlo3JIphRFQaJ4orvIQnRWrXfrVI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH0PR12MB5436.namprd12.prod.outlook.com (2603:10b6:510:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 19:21:11 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 19:21:11 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
 <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
Date: Mon, 17 Jan 2022 14:21:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------684E18E44660F7AA613559AC"
Content-Language: en-US
X-ClientProxiedBy: BL0PR0102CA0055.prod.exchangelabs.com
 (2603:10b6:208:25::32) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be3c66f-d985-4420-9ac0-08d9d9ee8584
X-MS-TrafficTypeDiagnostic: PH0PR12MB5436:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB54364275B879280C2DF61832EA579@PH0PR12MB5436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6N13v9Ad6GLxFzurtbtNv3qGaJvuxRx2qW54dPcCqnkHI6Ha1HXNVHdE0BVTdtVYDN/rsYty4gQidNNSRW7KtMjNYGecRYHZ2LI0tJt2kHDzxckMRWTvAFbZS4KKrk2WwPe9UHVOCsYeCCkyEA9Tffnvb9AtxhEwZf/CO2E3J2Hlmch0MHXm+IigWbxYnYztbSNv0x/9K2SvZXInYxMZt/oeHqokjfqR7LvQHSxBKA14UxR+BnfNvAjR+x/NQii8JXzrSjGsO0l68b6ZgEZIHNK8w466vEg5vQr/VRUfC1obXbA3gI9XkhW2zMwz6TviEnLOmOBatEz2zgdd2PCtIyIJxGmUPUrkoigIN0aaoFTF/sgOIJbqwxi9MZf1Dg1VWQyuEVdyDyMgGJHjJCVzFWrgd7r+NQzFjlWqmwWtUNMfCZyl6z/CCQSllOEKUrOkQnibIbugfU39PKdFT7Gva4lfl9Q2JTumJdk+q7AKnb2KJdfediUG6PHR500uM9G5fzla/wGffdwwPX5GEsgFUKSxgD96tkZd7hpx+qqcwGgOfGe6DkMNCOZrFlDOLCgKtas1tNARGNvyJOw+LePbI05ACONqRlItTBFvEQEL717N2KZC3XL6hCG3+hhOe9TmpOe0n/o3xt2+e4ZNiU1Ymlp4agnXyZ1h0Rkv+CfjsmLkqLa/l1+GYuBPjxEMmflZko1Cms1mTtRXOPRN3+paksJ+iIeLhBlc4q0V8GYbzpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(31696002)(44832011)(6486002)(66556008)(66574015)(6512007)(66476007)(5660300002)(66946007)(83380400001)(508600001)(6666004)(38100700002)(31686004)(186003)(33964004)(8936002)(8676002)(53546011)(6506007)(316002)(2906002)(36756003)(110136005)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXpyTTNkRVZXZ2Q0YmNxcHAxeURSLzdBUGp4Z0lzV2dydWN6L3M1bzB6dmt2?=
 =?utf-8?B?ZTNmNm5xdE4yaS9RZ3BEeVFUbFFwOVJHRGdqdVNKSzNiazhsMFRkWW0yMXcy?=
 =?utf-8?B?NFZWODg2UlFvdzc2Q2lRUFJSR1V4WUpWTmhtWFk4endCNHRQWFY1Z1N1OVQ1?=
 =?utf-8?B?L2xsREZ0Rmk3TnB0MkNoeEpxZWNwVjNWUE5nSFFoWFhzRy9BQ2dPZUIzRy9D?=
 =?utf-8?B?d1ZIdlV4U01Eb2FncVN0Z29nRVBzZk1xY28zNDhxRHlGVmkyY0Y3THhna0xJ?=
 =?utf-8?B?RFR3WFFMSXlTT21mUXplQmFlSlR3WlZ6QTRVV0s1V09Yay8xWWJaaEd5bFJD?=
 =?utf-8?B?MEZFUWRBTGlQOUtWUW1KRlpsbG1kRUVXQy96UXdzeFpkNndJMTV4UlQwcTZB?=
 =?utf-8?B?NVM0dFRGdkFNTmpiRkczWUQyUi9idWExWHFHNVlHVno5NWhoTTVUeDE3ZW14?=
 =?utf-8?B?Nmdobmc1TkxLOEdnNDhFbGhobUZzVHJ3Q2FwN2MzaHQyUEUzamFneWVyUXNY?=
 =?utf-8?B?NWlQZHhZWDc4bVNWSmlxM0JOajMrMHdxRktRa21pbzRNeXAxbHpuYzB4Lyth?=
 =?utf-8?B?MEl5WHl2Tm14WHAxdDNXakxrcG1obGJXUHRTejJzZHI0WW14aTR6b3ZkOWdT?=
 =?utf-8?B?a3JNTmg3YUJLOVR1c3ljWW9JR1FHY0RuOHhSOGlETWlvMnRTWE1UdUc1VjVu?=
 =?utf-8?B?bWJxdVcwaEd1dzNqVHBCUkcvL0JrK0RqUVRReWtTY0lSYjRUR2RvaGhQcjN5?=
 =?utf-8?B?c29XN0F4aytSL2RpQ1pFSVI2Zm55ZUtSTWtlUVZTdHpLMENLOEJhdWhLL1VI?=
 =?utf-8?B?Q3hITDc2N3BQaUxJWlNVMi9sWkhnNE9OSU9wcG1RMnFBZVZnSzJNTCtaNFFI?=
 =?utf-8?B?djZCSGNuS3dzNGVSYUJCdHFabzE3QTlmZnl0N3JCZEhjZzhyaUQzZHBKSHV2?=
 =?utf-8?B?VFFYSUdvVUQ1YlJYRkQ0RGRDd3RlTkxscjJXbWN2OG1QbFUvMXRyWnFHL2sz?=
 =?utf-8?B?cnV4QkFGUjJrWDJsWm5wcTQyZEkzWk93ZzV5RVc0SVVKdjVXSGlyYkRkb3ov?=
 =?utf-8?B?MzFHSmpwbjZWY2s3amprM2xOamZuZTFzVTBUeXliOUFZRTdlczRSYzRmeTE5?=
 =?utf-8?B?MFZGSGFvVUx0TEZHMlhlZGFkZjRqM3Y1Zk0xeUdIZ2czNWoxYzFzQkhUMHl6?=
 =?utf-8?B?NXhJbVlUc0l3dFlrdWNnUnA0TGgrem5SL2hCT0NlRitGTnZWN0lmcVAyRi9a?=
 =?utf-8?B?dUdUQk52YUJZWHNNTGVGNWhadk5QQjJNaVlFakgxTWJSaEpqOE9Obml4b05Q?=
 =?utf-8?B?U3ZYNFcvRWg1cVFVWTJHOGVBRXdjZkxPdXZVWTZTS0xXWFhrM2JRVHZ6ZUo1?=
 =?utf-8?B?R2xLUmRpam1SSDhROFF3M2dvcGlPMFRsRjcrT3FXUkk3dVhUbGFEY2tIZER3?=
 =?utf-8?B?Q0tOb1ZFckQxaG84UGUzUWtkdXBVQWRDdXJEdjFnUmxJTkt5SnYyQ0hDcXVi?=
 =?utf-8?B?c1I0Y014NVBuUU5rQ2krbmFjdFVOcE9xZE5zajRxWTBaOHhXN0pvOU1zWnBQ?=
 =?utf-8?B?VThIdjhXTVpJR0UyYnA5K0phQ1RxNncxcG9wbUxULzNiaytCbWdrV2lUdFEr?=
 =?utf-8?B?RUpJVUE0b2Z0bEVkZUVLZ2NVdDF4aGU2R3h2dlhkYVFxalVHdmw4cGR5VGp1?=
 =?utf-8?B?Zzd1cXBVVDJXc1Z3eXZCaFlVTkR1OXl4M1F0YXpOQkd5M1RDZmZXKzdJeTcw?=
 =?utf-8?B?MHd1MEZxd3JwZTlTYUdSd3A4d2FXMmZIcXgvYWxQMmhGaHJrV2F0dmpBWERp?=
 =?utf-8?B?RGExOEt2T3B6S0RpTFhXb1NESHVUeTMvMVozUk9NVExnVlNnbWlqbG5ORjNF?=
 =?utf-8?B?ZHBsQ3Y5K0R3Y2Rvc05KaGJqSWhZWm9GbkFZdkl5ejhnQTRSY1VTNmZteXd6?=
 =?utf-8?B?Z2pTVithMDd3UlluSGcxR0w5OU1OT2hEclNmbDRDK0pmRTVpVHgvL1pOdUdi?=
 =?utf-8?B?ZEg1RC8xK1h6MzM2NHMyK3AvTFNuTGNNakxZODFZZ3g4dFZtNzVSdnRjOFhP?=
 =?utf-8?B?NWY0cmkxY0ErT2pnWFdrTGsrSFAyZWNLODhxRVlSMlArRG5IaUVJcG5aQUxC?=
 =?utf-8?B?RGVFNVprMExqblpxNlRxL1BOQ2JUbUFKdDZSaEhYbXR4NU96SGFXUmNSeUhh?=
 =?utf-8?B?dWhIc3B5K0ZISy9zbk9abS9YcW5vMEVYc1pDTVFSNzQ2b043VFFOaGIvTm0r?=
 =?utf-8?Q?XWBU9WlGrMPG3LV8CkwSFgYHFocBK3xLOdjDAnZeCs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be3c66f-d985-4420-9ac0-08d9d9ee8584
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 19:21:11.6389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q71ZcR0UHoR4d2FE93xP+j2Pw2l/0mlR9sRLGQo2zCla7rkTpBS5MDJx/Qu1MMk+aeapxgOg7DUE/zcQkpxvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5436
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------684E18E44660F7AA613559AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022-01-17 2:17 p.m., Christian König wrote:
> Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:
>>
>> Ping on the question
>>
>
> Oh, my! That was already more than a week ago and is completely 
> swapped out of my head again.
>
>> Andrey
>>
>> On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
>>>>> Also, what about having the reset_active or in_reset flag in the 
>>>>> reset_domain itself?
>>>>
>>>> Of hand that sounds like a good idea.
>>>
>>>
>>> What then about the adev->reset_sem semaphore ? Should we also move 
>>> this to reset_domain ?  Both of the moves have functional
>>> implications only for XGMI case because there will be contention 
>>> over accessing those single instance variables from multiple devices
>>> while now each device has it's own copy.
>
> Since this is a rw semaphore that should be unproblematic I think. It 
> could just be that the cache line of the lock then plays ping/pong 
> between the CPU cores.
>
>>>
>>> What benefit the centralization into reset_domain gives - is it for 
>>> example to prevent one device in a hive trying to access through 
>>> MMIO another one's
>>> VRAM (shared FB memory) while the other one goes through reset ?
>
> I think that this is the killer argument for a centralized lock, yes.


np, i will add a patch with centralizing both flag into reset domain and 
resend.

Andrey


>
> Christian.
>
>>>
>>> Andrey 
>

--------------684E18E44660F7AA613559AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-17 2:17 p.m., Christian
      König wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com">
      
      Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:<br>
      <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
        <p>Ping on the question</p>
      </blockquote>
      <br>
      Oh, my! That was already more than a week ago and is completely
      swapped out of my head again.<br>
      <br>
      <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
        <p>Andrey<br>
        </p>
        <div class="moz-cite-prefix">On 2022-01-05 1:11 p.m., Andrey
          Grodzovsky wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com">
          <blockquote type="cite" style="color: #007cff;">
            <blockquote type="cite" style="color: #007cff;">Also, what
              about having the reset_active or in_reset flag in the
              reset_domain itself? <br>
            </blockquote>
            <br>
            Of hand that sounds like a good idea. <br>
          </blockquote>
          <br>
          <br>
          What then about the adev-&gt;reset_sem semaphore ? Should we
          also move this to reset_domain ?&nbsp; Both of the moves have
          functional <br>
          implications only for XGMI case because there will be
          contention over accessing those single instance variables from
          multiple devices <br>
          while now each device has it's own copy. <br>
        </blockquote>
      </blockquote>
      <br>
      Since this is a rw semaphore that should be unproblematic I think.
      It could just be that the cache line of the lock then plays
      ping/pong between the CPU cores.<br>
      <br>
      <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
        <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
          What benefit the centralization into reset_domain gives - is
          it for example to prevent one device in a hive trying to
          access through MMIO another one's <br>
          VRAM (shared FB memory) while the other one goes through reset
          ? <br>
        </blockquote>
      </blockquote>
      <br>
      I think that this is the killer argument for a centralized lock,
      yes.<br>
    </blockquote>
    <p><br>
    </p>
    <p>np, i will add a patch with centralizing both flag into reset
      domain and resend.</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com"> <br>
      Christian.<br>
      <br>
      <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
        <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
          Andrey </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------684E18E44660F7AA613559AC--
