Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A184748E8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7049310E5CA;
	Tue, 14 Dec 2021 17:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034C210E398;
 Tue, 14 Dec 2021 17:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/42LOAF/wBQ8ii6Uy2sfK9N/9VICHO9oQD6Df23uSfnHa76XMht/Z7OhYj2u0MZERwTNQVmZdEuAaekLFSW8j1NiKhHznUtrTB5n5O+RGeRnAwYi0vKT3NF1GD4pO9Lv1dOk1SjprjNIfmUii+9GTjt0AkaJhhiKuETVL3iFswz1rTOL9KIRKIDiMIgtALo/XTfOp5LTmotRXrTVgFg7FCeWeSy/FsgXCaC3fNG6XaLmwt/R2gHqPTUCUsGzniTydQqBLnZNNkn2rH8kj7KAQ/p+A5s+pRUZC+gq/vr72fx8SHmFBSvIQPgA8EeXmGQCh+otUQuoqDqq0QC4fKjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxPekeoqG54KPDoK58FR+S+menAsGlL/s2e7Urt31/E=;
 b=d/dbQVjcCprNQbg23/aORBQ4XXQcnhKroiU1e8aSXaEOxkcFq+ycVfFmpVs/DfdsiayCgQ6bRR/2p5EvmVk89J/el+CI5R23dgUg4fZL94CN6GCf7rpqCYF3jTiPTE/mW3vhLvMx1QIDri/CDj+PN7LTvgcU5PZCzXiF7/XFT0VMezk4yWGBk1K/qMUwCWaoLBugoQlp/Tcbl0FhblQwtELalSpavulCvArUfCoNoCPfJEAzbw8l4V5H3bJBVMAI9KTMAmrEdEy3bvSrNWhw8+ysn8WBr91GUAVMqH1srq6lvzlRQn5QaLsKxBtAuEPIcn5CbVk4ps4zSW2OFrRZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxPekeoqG54KPDoK58FR+S+menAsGlL/s2e7Urt31/E=;
 b=gJ3mrE7JGJvSEFm1gbgh7sPouqinzuVYfFFUst/fyT1AWCOs4ubtqjWkFFbSERJ6BL6ILec+RU9hpi7qntjuQNKOBw58i1B3eCF9TxmZtxpGGClvCMeVQB6NAhvZtKKYskQZtznPaEXHCW7vaZGHBxcu+phWiaX5vDixea+7bWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB2906.namprd12.prod.outlook.com (2603:10b6:5:15f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 17:08:35 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 17:08:35 +0000
Subject: Re: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211214111554.2672812-1-ray.huang@amd.com>
 <20f336a4-0bfd-9988-ee3b-a8206f045f7e@amd.com>
Message-ID: <50871a0c-bdf7-dc78-3a1b-2d9b6515273d@amd.com>
Date: Tue, 14 Dec 2021 12:08:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20f336a4-0bfd-9988-ee3b-a8206f045f7e@amd.com>
Content-Type: multipart/alternative;
 boundary="------------5CE9E559D0DA9420547384DD"
Content-Language: en-US
X-ClientProxiedBy: MN2PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:c0::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e143c068-5754-4224-38c3-08d9bf245d19
X-MS-TrafficTypeDiagnostic: DM6PR12MB2906:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB290608734406EC3E5021F4F5EA759@DM6PR12MB2906.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2N3m02U0BfHHgAN/SNwxjDxNTasA20zQdYa4ygXuf18be+YQ6z3IUobA6pP6+nDdh8u66U4R1bAOk7TCUiGJFgWZ35nd6Tf9r9u+3+Zr/kOVOo4Eco0s5jxO1ZGDwGcIYt7xGPSoMkrKmKV0fw/tcih29ccQOxKMoo4khGhkwM+Fhnem3XmsMUpKTrGbWBQtW5b4jYge8s5UUsGThtNuoE6MWRBuEDYag6Am1dFGyCA5hwZeZpJLdY+wTUFLFXLvVUbMoLwv1iAE5Oi1TQehCMt0JWjRkZ/I1m6uJoL5PZx766emoV2rFgjp9lx7P89s0ai+VZlQ+jBVLUcNeDYjjwfNIk5Os0XtoAU8Y77/QYOkbXjrOO/4b2LCz2RIsnjwuQtPKdU7vnU7F+/oF6nVPlB8twkoxP+THS2EcmdPhrrks/mcfQ8LC3ATOBsfmzVMdyfcoPe7jz6XDWo11Baws11tnmRfQFmRJuBZ/2+Uvb2H1kSDvqtctdZANdQLxnbrCaXwGMVYkyMLUL7puk+V3djTRMuTY4BRt+vsFR9cBEy8SnDGc7iQGpRYwFn0/PfZCQYlvldpmvNH+k743wUf2EcpPVzyv7GOb9BQpDbz95bMzok0sK3BR8G0WGXFltB/fcxiA+DboFHBhDcKONtDut2R+7hFjhpIGVHXZiEN+Wc97gxiq8LnD262b7aBzR5MCe39nIN0ZoZd2FD4hsGURQDgqKi9MOnthG1X8aeBpdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4001150100001)(31686004)(86362001)(6666004)(316002)(8676002)(38100700002)(4326008)(6506007)(5660300002)(110136005)(54906003)(6486002)(33964004)(36756003)(53546011)(8936002)(2906002)(83380400001)(186003)(2616005)(66476007)(66946007)(66556008)(44832011)(31696002)(508600001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVCd3NYdHdJakFXeHhYRHUxWGdpVGJtYmcvT0ovV3o2dXVvakNXcEJTd1Ay?=
 =?utf-8?B?cW9CT2tzYmJqY2pKcjhYTzRHQjEvNk1PQm11TWVtMTA5QlNMNGN6K0Zaa1Zu?=
 =?utf-8?B?MWpuQktoWEJLRnZYZ1JuTG1vRWtsMmQyZGozeWU2NzdxcUJoNjVOQ3VmVGJJ?=
 =?utf-8?B?ZUFCQzFOOTkzaVNhUjdRRFpOUWYycEZPVnNiZldTRkhIRU02SDBLb1FVUkI5?=
 =?utf-8?B?M3Y5TUlhYW85TkV6VUg2ck9OdEZFYmRGTklrU0RqazYwa3c5czdaaWZmUG50?=
 =?utf-8?B?T2RBeWl3TkFFZUxtRDJmdDRRVm1Camh2TWw5VUphcThMcFE3eFBRcC9kM0hI?=
 =?utf-8?B?UXpWRVp2QzdkN05QWjhkZjUvK1dQYUJLRGp3TEplR1pKTC9pQ2x3TmtkZ3lD?=
 =?utf-8?B?NU92WkN3c1RxVElRbHpwRi9qNXYxRWJTR0tsdkdnZXlXSnJ3K3Rjcm5HblM5?=
 =?utf-8?B?ZkFUQ2NrSGJGTTJLRE9Ed01ZcTJuaktpZitLUDVza0p6M1Z5dUtiYTdwcGxy?=
 =?utf-8?B?WkFtYlJhK2hNdWk1NTdyRy9OVXRZeFNkdWc5Y2orQUFRQzRSYk8zQlpiQ3Yw?=
 =?utf-8?B?bTVqK0psaFl0eWE4R0wzTnRpUTIwVEFRSVNwWllPc1BhTjBDbC9OdytjZy8x?=
 =?utf-8?B?Y2FpUURyV01Cck8zRksyQ3pUZmJ4MTlIWVplSmF5b0tJcjU1eWZTYnRoWDFq?=
 =?utf-8?B?eEJ0OE45eE5xV2tBTmRRdUVHUmxBNmVWWnhFUE1JK1hpL3JJSnZBcVBhSDhY?=
 =?utf-8?B?T3ZpUE5uT1V5VUNBdmFJamhOL1dDWFBkb2tmQ1hkcGhWTzdKRzVwcU1OWDZE?=
 =?utf-8?B?TjJBMGg2UTUzQThuVVF6dk9ZbnY0ZjNHMDdpdnhCSFg4VmRLdzZKb1ZGK3BV?=
 =?utf-8?B?MjhiRnJQTG85azJTdXQ4MWhzRGh2V2EweUxONEUwTVNCZGlCR1hDSGh5aG85?=
 =?utf-8?B?T0pwRHJUYVh0K082bzFFNlpxTlJDVTVHNUdVV3UxQmpEZFU4ajYxWm9wWFdU?=
 =?utf-8?B?N0xnSHNCaElGUW1sSFlXY1NJeEs1U3RXYzNBdGpxOGFJL1JTQS95U0hqdlFt?=
 =?utf-8?B?V3BaYzlHTXZmcCszQmhsK0RFU0JZcGVLSHkzdGFkRVJkWENWcncySUk5eFRW?=
 =?utf-8?B?R0hDakhIQ204cHRiYUhtc3lCdFNtVnhBTyszSlFGZ044bnZkQXRGYTB3aTYz?=
 =?utf-8?B?SmtWRy96NEYyY3hIcUVoS3Q2MUlNdjZ2QTBLelk4ZWJDMGltei9pVjB3Mks4?=
 =?utf-8?B?RmZwSG5hMDZ1aHJ6OStpVWk0MmlxalpRNzl2bUw0cThUbHBVV0hUZUFHNjdZ?=
 =?utf-8?B?ZHJ2OVFTVlA4Z011NDFId0FVcnlsQUsxVWtsa2tqSFZ2ckR2WnF2ZjZIWVZB?=
 =?utf-8?B?RFpacnd5UGIxem12V0VobEIxNUNDQzk1bmdGaHBucFAxZ1E4aUlXQlNPZmR2?=
 =?utf-8?B?Z3l1em5QeSsxQmF4RDR6N3BpUjhETUpJYjZDcDVOdXhjeW9LeEhoQzZwTGox?=
 =?utf-8?B?aW9zVGJLMW1kVVpRcDBmakYyTkorbXBqeUV2cksxdGk5SnlZSkU4aUU3OEtp?=
 =?utf-8?B?QVJXaTZ0TEZUL01JNmhhUStIcisxamljSTdieU95K3JpaTNrZ2o1alZ5cUgv?=
 =?utf-8?B?LzJtQnZzbFFSbmV5NFprRHRWNnlMbVhJTmJGNVlkYmZKQTdnVlM0TVpUajdC?=
 =?utf-8?B?bVZiTU4rM3RnWGFXWVo2aGdIZW5sa3k1R1l4R3RSNG1yZkQ3eDBlOFU4bWlj?=
 =?utf-8?B?SVVyQk5qYjVFUjBnVmJyZFBpY25odWlFdUVWRm55ZHZRMXIvYjNGTnhickV1?=
 =?utf-8?B?cEdmK1AvVzJlNWgrSDZESTdNNEVwNlV3djc3bXo4cVNxYlFBVlRWb09Ta0gv?=
 =?utf-8?B?eGxMaUFLZk9Ga0cxZFNZM0xPZW5oUHJuWVRLaXZYWHlWMHRYcVQrKy83TlpD?=
 =?utf-8?B?NWRFalEraEVJQlhLRWliVmRma280V0tJMkUva0RkYjFkeEVjb2hrZFVEOTdL?=
 =?utf-8?B?cGY2ZEJIeHkvTDhTcTNPd05KRGh3VEQ4NW9pNUpWQ093NFVQT1o3VERpSkRt?=
 =?utf-8?B?dVowQUhXS3lXSEoxV0FwY1NrckthOWxDeXJGbGlmL0R2ckorR29nYzR0ZFcz?=
 =?utf-8?B?Nk11eEhJZHBkSE9uU1FITDVFUUgwNHM1bWNtVmxIRFVlSW00QkxxRDdpWFhE?=
 =?utf-8?B?bFNvalhPd2ZnN3NGMjBMeEkwNXhPNlpCN2t6RXNQb2xkZ0pFSUVYU04zMEg2?=
 =?utf-8?Q?MlF7oSs1bYWVpExROCjvsnRylXbb4UJHCGg8GYwNqs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e143c068-5754-4224-38c3-08d9bf245d19
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 17:08:35.3016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBsXT8Qs0/umosASVoELo1WXc9e/WHylZiBUWypVu/snmdvcmji8dPIfQB5l+a2W3rZQewtOmumc8X31hMAqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2906
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------5CE9E559D0DA9420547384DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-12-14 12:03 p.m., Andrey Grodzovsky wrote:
>> -
>> -    if (job != NULL) {
>> -        /* mark this fence has a parent job */
>> -        set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
>> +        if (job)
>> +            dma_fence_init(fence, &amdgpu_job_fence_ops,
>> +                       &ring->fence_drv.lock,
>> +                       adev->fence_context + ring->idx, seq);
>> +        else
>> +            dma_fence_init(fence, &amdgpu_fence_ops,
>> +                       &ring->fence_drv.lock,
>> +                       adev->fence_context + ring->idx, seq);
>>       }
>
>
> It's probably me missing something but why can't we just move setting 
> of AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT
> to before dma_fence_init here or even into amdgpu_job_alloc instead of 
> all the refactoring ?
>
> Andrey 


My bad, I see now that dma_fence_init just overrides flags to 0 and 
immediately call the trace .
But why then can't we add dma_fence_init_with_flags wrapper to dma-fence ?

Andrey


--------------5CE9E559D0DA9420547384DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-14 12:03 p.m., Andrey
      Grodzovsky wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20f336a4-0bfd-9988-ee3b-a8206f045f7e@amd.com">
      <blockquote type="cite" style="color: #007cff;">-
        <br>
        -&nbsp;&nbsp;&nbsp; if (job != NULL) {
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mark this fence has a parent job */
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT,
        &amp;fence-&gt;flags);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_init(fence, &amp;amdgpu_job_fence_ops,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ring-&gt;fence_drv.lock,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;fence_context + ring-&gt;idx,
        seq);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_init(fence, &amp;amdgpu_fence_ops,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ring-&gt;fence_drv.lock,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;fence_context + ring-&gt;idx,
        seq);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
      </blockquote>
      <br>
      <br>
      It's probably me missing something but why can't we just move
      setting of AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT
      <br>
      to before dma_fence_init here or even into amdgpu_job_alloc
      instead of all the refactoring ?
      <br>
      <br>
      Andrey
    </blockquote>
    <p><br>
    </p>
    <p>My bad, I see now that dma_fence_init just overrides flags to 0
      and immediately call the trace .<br>
      But why then can't we add dma_fence_init_with_flags wrapper to
      dma-fence ?</p>
    <p>Andrey<br>
    </p>
  </body>
</html>

--------------5CE9E559D0DA9420547384DD--
