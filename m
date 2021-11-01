Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0A441D61
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 16:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742658919B;
	Mon,  1 Nov 2021 15:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447508919B;
 Mon,  1 Nov 2021 15:24:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beBXQeD2ZPwu3ItkjggcaR4RycVdBF9tWt1ZNh0DAL4wY+itjGEFTiARb6Yt2UfbtFATo+kOlMmb4AN0ahZXcJm1yda05sCRBEF8rc2J97Kc3NRiR7VSwfoji03TEIdYInsuuECXtPdjuoqqT3323/84DuBWQeJQpdlbz6eaT3zO+3MyeCsNsEkHjLidZ2MVzklgEzPA7Fp32VzUYt66M31NEEcCcADVimNWgCNayecAPj9HO3rL+4QGhSLF9moM2UXd3ssooOMrkbe3O8z2owLhR7FkM2YUwGJLRB9+3wxtRZWeF80ZA8otxkQEKklpyemOdvZHGXwaz7mk5/sNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTUZBBhgqyVceTcEW+nOFJvqGkAhSPqMTjmBQ+wV6CQ=;
 b=DPJX2tBWfLLGUOrd7e/b3XgGg0yR2IB4km9Y6oqqHAUQm5+1UaYCs17tpAWzRRyAgFhMRwpNgxWsCSVNW4BG9dvXC8wBtAs/lIkwgUJypccSxpt9zp1swSh8NbciP2MVevOnU2CRoVlQHazWIKk3MINo+v6vOH7zxgLLhfUMYgq9LGHgqkeH6DevqwfeRQFKPJOUEqQdydPDXQNKjSXSQ0KafkuK5/KwHIMzkhNLpQZxZZPyX9QfEnehgkMzO/AvNnGhiYjzGnJQC8DiyOCLK2dNWZbMTrLwwBEipaNElIOv03oxI7ntjxJ+LicOkAstB33rTaf4SnSxlZuQR+6DFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTUZBBhgqyVceTcEW+nOFJvqGkAhSPqMTjmBQ+wV6CQ=;
 b=NO8gC0Y1or5Kid+big0eGel+jb2WhgzTTiF8U9uXQ7MkGaw2X8n+sbiEdZH2yHUenNtGU3RGBzCbgDegdP9MpZeZDKRohGMm8+CaU+YQKWakztdJCy8dKa2y2HlJTEmD1NRbBYTbCkR8vbIbCHM3P3F8CjekOefUiogDkstAv4U=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.19; Mon, 1 Nov 2021 15:24:17 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568%12]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 15:24:16 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
 <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
 <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
 <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
 <ca590ce0-ea1c-0d40-f157-2e3b5c657b01@amd.com>
 <f1a7093f-1872-3a8a-820e-ada11b1293bb@amd.com>
 <a0a54261-f83a-8402-31dd-009588adece6@amd.com>
 <6aa79474-e998-368b-bb53-b43f135f5a0c@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <3b7db8b1-a6a0-5eb4-e674-9b33f37b1812@amd.com>
Date: Mon, 1 Nov 2021 11:24:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6aa79474-e998-368b-bb53-b43f135f5a0c@amd.com>
Content-Type: multipart/alternative;
 boundary="------------5829BFF8700ADC86EF24BF78"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::30) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:98db:b2fd:a9aa:25a8]
 (2607:fea8:3edf:49b0:98db:b2fd:a9aa:25a8) by
 YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Mon, 1 Nov 2021 15:24:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 713e148e-b9a8-4a42-f11a-08d99d4baaca
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15303785203BF3B04F8FCB0FEA8A9@DM5PR12MB1530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42XqMgPw2G2dqNKokKU5jWsjmZQ6/Jqf4p3VUSs28qeiWeNwQObFOgwVL8hFGy51a4vrYpW25z5jyh+3mPinRk0ywjfrQ1w2vOCv3HEOdWHK9Qou577tLVwrjpev6ZIwMiMUfJNXr+hiOa/DRB2V2/Loe2EO88Lz69xhAAy1gEAK2FmFsF/5znlJqkQLCP3SPJ4VzM0zygoRz+IRPfpt10TyeHhSjOm5nHy3JOqYXP2RSzTVYiXxnZQoKGsTCNFaJluvrdl2VgRazeEJKbmsZw2pJ1xeHbT40zzMQccRL3AxQekOfbWYumFxa1cJHngSOHSmmJ2DASMoyY7V53V0wqI2NEIdX9v1SBEexE4FLtprn4rJqTWM++oc1FCnAO4UhiZUEX67T+/y6lGA1DQ7JfftTUtV0yW3JvbqcWBJybrOq/UqDifX7kW6+7NhNlzrI7jBmUV4OSUfOrKCY6UMCbcs3gNU53EtqHxbMYg+MFeiwsgkYyf7Npw+7DiKbCx91dfpO7EYhwYBoYvkj6kd+C2CzHCExkYRmCuK5lnijMw5nGQq+yejb5eKuNjHd6iN3kxhGZQwiod6MvEyfAbDNEOYMHw2loLOQHT+dJUjeAjjcx0vP8v1RzPs/JIRzdULbovw9q+stbmSVAM15ygHsaO8Xpyk9sPCQMN2fa7Fqn3tMO9LED1pO0Orh0rG8W3NVDSYltcZ/v8lfltAUvaZIDjkk6wMArxBoTO8+bh4U5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31696002)(38100700002)(4001150100001)(186003)(86362001)(316002)(36756003)(66556008)(8676002)(66476007)(33964004)(5660300002)(8936002)(110136005)(2616005)(53546011)(31686004)(44832011)(2906002)(6486002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlEOXhRbmQwNnpYdUNOR0Vobk9ERUIzeDlvaHhLaXN4QlIvd0U0V3pBTldh?=
 =?utf-8?B?aFFXY3huM0pzbzhtZmRuY3NQOWZxVU5XN2xOYTl0YjV6bWFXQnBLOWxyMVZi?=
 =?utf-8?B?bWpWKzVTS3F4WkNKT1VqYWlhbHpGbFpJbTVEcElHSzRCV2Jjb2MweldXbGFj?=
 =?utf-8?B?VmR3S3R1U1VtZk1IelFBeTVkeTFXZmhONVJ5SFZJQlFzamltQ0hYL1V1MFBx?=
 =?utf-8?B?OWc1d1ZiYnphYTR4eUVLSmlUYmlaUDBsbHMwMHpmVGpJeHFudEMvZHNlNy85?=
 =?utf-8?B?a0NJS1hTNDRlMDBsYXVRZnM3Wi9YdU1nQk01WWJDdXpkYVQwSXBQT3R2L1Ar?=
 =?utf-8?B?ZU1SQlZGT2lmQW1aZUxhdzBEaEhJWUpOY0dSOEdiUDBkVm1Kb2drZG04VUZQ?=
 =?utf-8?B?R3VocVVxVWRPTldnWWgvckx3S1JPUHNmM3BqbkhpWnVLeS81SUd3NzhmZEdh?=
 =?utf-8?B?SVZ6cFhDdTFMcFNTcGxjS05rOXB3UmZwUGZWMEhzZmRZUDJVTE5vaVhuNXdO?=
 =?utf-8?B?eXN1MExMbDlpOENDSWE5NlBEcG4rY0Mzck43dmdXMWdTWXByM0szSjl4dVMw?=
 =?utf-8?B?ajc1c2YvQS96UTU4cVhTNVJFRFRMbk9OcnF1Q1Z5VE1FSUw4NXlCRlI5dVRW?=
 =?utf-8?B?dEhHaUZzTTYvUjltV1A0MnNjRFBLVVBscVhwUHRJNDl4OEpiMms0RDlyZW53?=
 =?utf-8?B?bW1SOEZjRkV2dEtlQ2JXV3QxamJkNjNhWFpPOFNOc0pGNDc4ZzViTytYeGxF?=
 =?utf-8?B?WEpTSTZZdXQxbU10Mkx5UlVUa3paT3NyUWN0Y1kzTkdvbUNUSGxBUnpPMFI5?=
 =?utf-8?B?WEJhaVFxZGJhYk5WL1JVa3U2dE1INWRkd1lMZzd6TFdUdXpmL2xBUDZ5bHg3?=
 =?utf-8?B?dmRyOGNkTzN4VmFXQnpTc0NnVkl5RHRFRGNsSnhINHFRN3ZwcXE0bDRuRy9L?=
 =?utf-8?B?NGRLOGRRSU04VTM4OXlBSSt4MGZPck9YNzhoY1V2SWNicEMrY3JHb0lEbW9W?=
 =?utf-8?B?OFE0SFpRNnF1ZDZQa2NnQmxNM3lwTFB6Ykd2d0dlajIwVlJSaUdKM2FJVG9D?=
 =?utf-8?B?RjZlSmRBSWNuT2UvMXJzUk5PVm81d2xZZGNPNzFoMUxGaWxFcXdFMEJndUFk?=
 =?utf-8?B?K1d5eWhuN1RLZjdYSTl6bjY5NnUvbk1KblNqTTFEOVVRVzBCWjJZRHYyMDRm?=
 =?utf-8?B?ZHF1OXZyZmVyNzk1Zm1HTHBhY0J4VFdIdXhkLzVCajIyN25kNzFXWVUrMjdI?=
 =?utf-8?B?elBzRVVDVWZyWUVCM1lWOUFFVTF2bXV1Q2hzZ0ZLRW1TMGpTSGhNZUJ0T1hx?=
 =?utf-8?B?WVRoNzEybStrdWcrOG5BendEblJMU05wVHhoTGxvY3hXSDVoSnBUVzZhYlhD?=
 =?utf-8?B?cVEzSW1hQmc0RFRTQVdhZjJHN2poSi9YeGl3TlB5YWF6SURNZFdkR3VoT3BW?=
 =?utf-8?B?MW5ROEVpQUpucDdQckFKV250cDl3emNneUhlNGZzRVlIZ2Q3WkxobHFnZVY4?=
 =?utf-8?B?TlAwanV5N0tySStWeVBxN2FlMTkxOVdyUXdOTkgyUmpCbExhdWdKQVFTSms1?=
 =?utf-8?B?NEJyNzNFT1o3bkZuc0w3UTIwSUpTSGlxNE0xY3NtWXhUQ2pkSzdQRWFSVXFC?=
 =?utf-8?B?QjExaVV2MDI1MnVRR3hCNTlpNnVDaFU5d1lRbm1lSUJZS1lpUGtQMm5XdXM0?=
 =?utf-8?B?TVQ1Q0V0S1cxOHl2RVF6ODE4UnBBMXdYZ05PMjFpbHU2VzlGcnhqOG42RnB2?=
 =?utf-8?B?TUQxS3hHYS8rU3V4RCtnNnpBYVBtc2ppckxGTHU0cVN1SmZzaEtmclZSLzRy?=
 =?utf-8?B?dGtMalJjM0IrWHZtTmxJRlBHVGJnN2hlYnVBS2YrQVRWTk5zNXhFSHZ6akVS?=
 =?utf-8?B?VHowWkRwV1BVVkc5WlROSEEyQzhNS21zdTdPbTN5WWx4MTFQQjBSTVBQcEM0?=
 =?utf-8?B?ckJhMEw3aTVJV1ZwbW1qU0JoWGc4Qm9ZQTZTcHJVYS9mdlRZOHpSampSVXVj?=
 =?utf-8?B?M1JiSkhYMUZzczhGc3RHNHprVW5xT01kSkxwUTVrSFZKaWdMM25Nc1Y5bE42?=
 =?utf-8?B?ZXdWY25GZjduU2wxR00zNzcrZDdmWTZLWU5jS3pBZVdVM1JNRnZ6YWZEYURT?=
 =?utf-8?B?ZVNoNWhBYnNmTjRSM3ZyN2hIRGRrbXNpcXEvRU9MMHZ6Ym0rWjFFV0hoaEJx?=
 =?utf-8?B?cEpINFgxQ25veExNdU12aVBlMFpHcXh5VnB0b2x1YmZZUFFraUNqUTZOTmFu?=
 =?utf-8?Q?F+hBavZo9CRQOytM0qUSIrOFNktJj4w5MXwfftwbhI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713e148e-b9a8-4a42-f11a-08d99d4baaca
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 15:24:16.6469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJuE1MXILLXweZ949r9etJ5mE2UFsYYmtk6dQXS8XmhrtOniRfpdAt73KM6+2llKWZZUmLBSmgLuJdiWrZMS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
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

--------------5829BFF8700ADC86EF24BF78
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Pushed to drm-misc-next

Andrey

On 2021-10-29 3:07 a.m., Christian König wrote:
>>
>> Attached a patch. Give it a try please, I tested it on my side and 
>> tried to generate the right conditions to trigger this code path by 
>> repeatedly submitting commands while issuing GPU reset to stop the 
>> scheduler and then killing command submissions process in the middle. 
>> But for some reason looks like the job_queue was always empty already 
>> at the time of entity kill.
>
> It was trivial to trigger with the stress utility I've hacked together:
>
> amdgpu_stress -b v 1g -b g 1g -c 1 2 1g 1k
>
> Then while it is copying just cntrl+c to kill it.
>
> The patch itself is:
>
> Tested-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Thanks,
> Christian. 

--------------5829BFF8700ADC86EF24BF78
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Pushed to drm-misc-next</p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 2021-10-29 3:07 a.m., Christian
      König wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6aa79474-e998-368b-bb53-b43f135f5a0c@amd.com">
      <blockquote type="cite" style="color: #007cff;"><br>
        Attached a patch. Give it a try please, I tested it on my side
        and tried to generate the right conditions to trigger this code
        path by repeatedly submitting commands while issuing GPU reset
        to stop the scheduler and then killing command submissions
        process in the middle. But for some reason looks like the
        job_queue was always empty already at the time of entity kill.
        <br>
      </blockquote>
      <br>
      It was trivial to trigger with the stress utility I've hacked
      together:
      <br>
      <br>
      amdgpu_stress -b v 1g -b g 1g -c 1 2 1g 1k
      <br>
      <br>
      Then while it is copying just cntrl+c to kill it.
      <br>
      <br>
      The patch itself is:
      <br>
      <br>
      Tested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a>
      <br>
      Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a>
      <br>
      <br>
      Thanks,
      <br>
      Christian.
    </blockquote>
  </body>
</html>

--------------5829BFF8700ADC86EF24BF78--
