Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9B6F3E8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60BE10E158;
	Tue,  2 May 2023 07:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEAC10E158;
 Tue,  2 May 2023 07:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIIsQG0x4Tr0g2CtbZ+/CPqmnXNW6YJgBIlfzujf8dix5dYhZMlg+Gl+faHfKT515LGx0pkUO/QUpFfLDqsvMvYswSGKFuh3RwxptTjtAdDPgnLEvKsp5DnYLpTz3N4ZBOAUT/yxMdmCFaIwp9ZsOTkYY5iAnrcR8zJr0KL8rD3AMkKHE83daI5fUtthqaE8uS/qAUMsU8+nPiyFLemVzoZHMnOJaUAzfNtvAhvsP8qDIw2P30C63gOuLhflLVX2DcwoKP8dUttE+mOj7+RHPcYM09DxzmhrJCcNaGNuRpT3CajO+82B8uu1rQDlw18rpBGlr3087byRKOhR50KDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ1dIpeC2xifxL4gCYqlYmGzaIFthiCj9ABc5qTELtM=;
 b=KSK7YhWMg0YNnS0iv2C9rd3XYfD9PjnZE22q40Nxw21CcXQtGGj5C+JEHbGnSj37mnmjxsZCb1jGeRuKjlNGYbn8NAKGb7KN+BtnLc4/bd7If0NuAkAFdHu1Rjx0B/MQ21oqo60VB45It/562HMyNJ4nZAxhsKVorWFO6DHqwzIwV/xKLDROvc1QQw2EHJX2l3/QUVIFkvmxXjLcWxmApQ6XiE1Lqy3CHnnBEYEyXmrw3iDo7bbjqtcfIo49sn8hNpvkPGiCK7zmBKUHXa7zxlazhTwtsizUQH4rwxY0dc4MT9kguq5oYo8M2PSMVWZnCR7cLYIVHl5y8KvWPcVNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ1dIpeC2xifxL4gCYqlYmGzaIFthiCj9ABc5qTELtM=;
 b=KIotCLMNs6cHBy30My7YKd/w2oTY1VCOY/F6DnpThGFylD7xZiKoAepfFn91vZUVv83+JRVq5UA34xSwoQmfKRvzpXClrxrUIGl+pRMV/9phiTmp3XvbGI5zZe+fETIO7ANyaDshvXG9T3Za4P1fwQc7v+b8ZuXfcHmzi65UJ4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:48:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 07:48:47 +0000
Message-ID: <31380dad-1206-5f3c-ab7d-1f448c6a7cb3@amd.com>
Date: Tue, 2 May 2023 09:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230501185747.33519-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230501185747.33519-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e8c9c0-86c9-4945-1943-08db4ae1a8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVKiBs66G0JeRVbGGF8C6JlaegfiMSS8OLmhRgqZTaJDNQvMskbxWU80HXvMR16QXgxas5gGNQU/Xx26aoJpo+OETZ7lhpPCrySb2kCIvmLiRImdD18/520V1HVeoVXWCp4SDCW6A8vBhUJbOhC2lgAa55ahU7Bf3KTmgWEPeVDOgFKIwyH9v/YM15mLNTElIpAAH6RFgFDiSlXSJkVRVcOxN/m6DRlrcxbAeLfXkfJgcInJSPdO3o53cdBz1N3Ct7xBwb1X760gVqc5ZoaM/HFPo8qLgXkEaS4gnZtih09L6TtLiPvlLu0wkm4IwgmFYwNp7MkymcjOqod3X+cNPp7HY0H19zzBl1MS3OZWynB/zh77UTG9GnT68wUVbOvmFcQSlCTmDV9oMXNu0dabRwyKKYde2mb+PXK0a8sHS2UKniTxY43UFypdSJ6u5w4u3S1TvcJDnaQ7lHe1hYdAZ94llT8Y5uDHQZLTJHhyO3o+J8OwJwqa46sAGxux52kjHrvzJtCZ45yfkef/wT3opC1cv7NtVsnfxB8qRs874YQHQrFWFr1G+7+4Sdx+on6H2l2oAPSfzFiF5wauGdruMsiE0DlOrJ7/fn6NkSBUI9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(2906002)(38100700002)(41300700001)(7416002)(8676002)(8936002)(5660300002)(36756003)(86362001)(31696002)(6486002)(6666004)(966005)(54906003)(6506007)(478600001)(6512007)(31686004)(2616005)(83380400001)(186003)(66946007)(66556008)(4326008)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RNSlFXd2pDb1dVYXBEZSsrMFFkY1ZGSWx4bnMzbExNNExKajBhYk1nR2lr?=
 =?utf-8?B?YUN0ZEllMjJVVm1qVUdzKzV0S1NQS09IVzZYWlJiZjU1Z25lT0RyenNYM3lN?=
 =?utf-8?B?Nk1iZkswVEs4Wk5iU3NNeFlwUnZQc1NqNGloSGJuaXdGOUZoZllwVFBWSll4?=
 =?utf-8?B?RzMzQ1pOb2k0dUwwL25JKzJCM1VTQnFnQWxCYWpYbGhRTWtTVGhCNHVVaTBJ?=
 =?utf-8?B?aEVBUUFVbVV6RitSSDBQSFZWS2s0V2l3RXNCTVBZOTFVY001L0RVc0luenIw?=
 =?utf-8?B?MFRja1ZwbXl1U0tGQm5KRlRtNFgwRFNpbW1xZkhpdjh3elJOV3RWbEpXanRU?=
 =?utf-8?B?OEZhMmkvRzFoK29MeFlTU2tmZjh1bEtPQlB2ZHd4SnVlNFZkbFNXWlU0TDR2?=
 =?utf-8?B?eTNOVzJ1MjM3Sys4TG9heXcrYVhZdFF1NFlETnhhdGFhVzI5RmM4VkhrbjJZ?=
 =?utf-8?B?Sjd5d2hTUlRUM1dxQllkUnRDdWZsQXh2b1crMytNVGFoaER5cUM3WFptSEha?=
 =?utf-8?B?Ynk2NS9lTUFJQVBZZXpoU09GR2NjVjFDZk9mTUhmbEYyemVjVGRLNFc4Vmdm?=
 =?utf-8?B?cHhxbkJQV0gvVGNLWC9ZYytXMlpxK294aGdxNUxaWVloam9CWkl3aG9NNE1p?=
 =?utf-8?B?WWYwV0xLbjJsU0d2aVdOZUNYbzlvbzU3azZpMFJvRHJRbmhHVWptNFlTTDUz?=
 =?utf-8?B?aXZ1bUszTmxYdTRHbUtadlFOd1dnM25RSjFHSGVJZ1BQMksvR0NFN29yT05Z?=
 =?utf-8?B?S0xOTXBJZUZMOEl4YTlUVGZCMDFVcHlKa2hmOURjMHRpclVwdkpHRGsrRVNM?=
 =?utf-8?B?SXcrU3BRZmpxeUVLU2VwUHVwWXM0aHBzZkpQR2hsaUt1VGdGak04ZlRseHRq?=
 =?utf-8?B?T05aM29iUVpXU24vUjZIcWVnbXBDbFY4UFZFUTNOQ0RQTndvOWt3NTdHNEpM?=
 =?utf-8?B?MXl0eEpJc0ZBTE1hMzJZZkg0THVWaGRCbGs5UFVpVEZxbmVZTVhGUmQxWnVS?=
 =?utf-8?B?WWVxQkgyUUVzeXZvZW1TendTNlJxK0xDcTFodWY2V2d2ZGp3SnFCQ3ZUT0RB?=
 =?utf-8?B?Q1lXUXBqOUlrbXBISEdnNk5GNFZBWm1nUEdtbmdGQkFhbTN3UDFWZFJaeEhh?=
 =?utf-8?B?eUJCTzZvZnpYWjhLbElVVkUzRVVBdDdKckRNaXgvZU16RUJkeEtpNlVoZHZY?=
 =?utf-8?B?bE95SXE4Y3VCZE51UGY3K3RQTCt5TDI5bkxHOFFTU2kvZFZJZWM3K0tIMGVE?=
 =?utf-8?B?QzlNWlk1NTRWQzMrQ05NNGZqeDdGd0tCYzdxU20vektjMEpSVGRyNXNocjh2?=
 =?utf-8?B?Y0RtL21GV1hDMnNPQ09QVmVJcElON3h0cWxyZHRFdWltdnZMcGlabG9ncXlM?=
 =?utf-8?B?eUtKUkE4dC9lWC9lS3VKTnh5UUR2b3RrZzRGb1I3TTRIUTFXTTFPeWpxVVZz?=
 =?utf-8?B?NjhzZkk1Y1YzYmZBYzQ5RzBKOGxlMGpOQVkwS2tlbDRtWTV3SDFUVkNRVy95?=
 =?utf-8?B?T3hObXp4d1phYk9PZ2NtYUxEamNXSG1JNHc4ZkkyVExVNkJkMGhFbnVJUDVG?=
 =?utf-8?B?Q010UU1ZbTBKWHg1K2REc05TNXFZWmtiYXh1M0FjL2JZRzRidHVHK0FteC94?=
 =?utf-8?B?NkhMNUVWYW91djYrOG90amw3S1hSRHBNM3puYzNBdU5KT08yRFZ3WGV3RFA1?=
 =?utf-8?B?RmtSbXVZRnMrODZLNU9pQ3RXZFNQbzk4dSt2Zkt4czYycXBYY1FpOU5vQ2RV?=
 =?utf-8?B?c1ZJcStESFV2eStIdFNncnJySWdBU2pEcy9pVUorZFluSjE1VnNBOHZJcmcw?=
 =?utf-8?B?MjA3U1NXdU04OUd5SG5mQWNOMUR3M0hKLzJwWmg4UUNuTTd4dnpmSVpSYmQw?=
 =?utf-8?B?Q0hma2grdlR6dStpeG9XTFFWYWVRYkV6eHFvMWdzZ3BxcWpjaURoOUNIbzFl?=
 =?utf-8?B?SEpCYmZtZUoxZEFWNWlDZ2o3b1Y0dFZPRDJ5bU1vV2d2QjJHWThEY0pRUEMv?=
 =?utf-8?B?RHdWOUFKK2JPWkdwOXVXTEExNUc1d1lTTU5Nc3hiTGk2RVlMNnRWT2dvL2Er?=
 =?utf-8?B?NTBrQTNnaVE4ejhDR0c4bGZOTTZva3VSdDcrQnpFb05kUnZROVpqZ3NQbXY4?=
 =?utf-8?B?MCtWVGV6Y09QNnA4S0s4YjZUVUxneWdvNXJoWmNFdThKbzVGUHJld1NsT1Zi?=
 =?utf-8?Q?SO/6xgeTVhrOGW7ZhsMq9uKAG5qWHzpz5aAGK6M7LRYW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e8c9c0-86c9-4945-1943-08db4ae1a8e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:48:46.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsIBSAaBAS5CcCHLtFMDDlGJUmt2s16plP2Cwjg0t3/jUcX+hGhz/jcZGEikpqMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well first of all don't expose the VMID to userspace.

The UMD doesn't know (and shouldn't know) which VMID is used for a 
submission since this is dynamically assigned and can change at any time.

For debugging there is an interface to use an reserved VMID for your 
debugged process which allows to associate logs, tracepoints and hw 
dumps with the stuff executed by this specific process.

Then we already have a feedback mechanism in the form of the error 
number in the fence. What we still need is an IOCTL to query that.

Regarding how far processing inside the IB was when the issue was 
detected, intermediate debug fences are much more reliable than asking 
the kernel for that.

Regards,
Christian.

Am 01.05.23 um 20:57 schrieb André Almeida:
> Currently UMD hasn't much information on what went wrong during a GPU reset. To
> help with that, this patch proposes a new IOCTL that can be used to query
> information about the resources that caused the hang.
>
> The goal of this RFC is to gather feedback about this interface. The mesa part
> can be found at https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22785
>
> The current implementation is racy, meaning that if two resets happens (even on
> different rings), the app will get the last reset information available, rather
> than the one that is looking for. Maybe this can be fixed with a ring_id
> parameter to query the information for a specific ring, but this also requires
> an interface to tell the UMD which ring caused it.
>
> I know that devcoredump is also used for this kind of information, but I believe
> that using an IOCTL is better for interfacing Mesa + Linux rather than parsing
> a file that its contents are subjected to be changed.
>
> André Almeida (1):
>    drm/amdgpu: Add interface to dump guilty IB on GPU hang
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  |  7 ++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c   | 29 ++++++++++++++++++++++++
>   include/uapi/drm/amdgpu_drm.h            |  7 ++++++
>   7 files changed, 52 insertions(+), 1 deletion(-)
>

