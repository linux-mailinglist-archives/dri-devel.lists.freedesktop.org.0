Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A564DCCC0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21A810E6F4;
	Thu, 17 Mar 2022 17:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3C310E6E8;
 Thu, 17 Mar 2022 17:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWabHx19GhJfcwodSE2jpIuRymEKqR0a4o7qFhusYYKJPguMN5DQMvmaWbRQkrNPx6JpKKDEIgD7wiPQy3iLWlGJgqH5Z5JHVg+hZb5Rs5jjmI+6pDP893HhxrQKsH1p0cRXKhCjtNouERG3kV7K9HGUj8kpMF0Wxxp4rSr9qUjNT9kEMifN0xxbhpM8l5jQvOGbLJKQUD6777vkxxSHfARhMYKEKMYz9kCnhNnP3qMOfc3g+F3tJO1ML8lPC3WG4KP5wiq5KpeQqA2OZ4xwL5aU5GsY1lFTNI2t48knnXPtr7d+9rR3GfjyGhUES6afQoOWIEAm9QaoFW7lGxp47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ+hi8PnWt7H4T3eAtvaFYImrn5DJYuEBt0371XR3+Q=;
 b=QKTnNZ2S5uIZCJcMKkdsr9sIZMbelYKbG0CdzzuwBYlL1Q1ytfc3mvsS7/rjUb66nMuvgTZCbPG/Eoql4mUFE9ckM9IOeZhieAz83ydDvJnL4p3Uk09rNs8rpRNr/BtutyhxXIo7brd79niyktKeCTtaOVd2QrKQVvqHdhZsbSRIuIXMFZkPR2sDuhRKBNSGb63TvHcuK1TWs9Th6ofl22BNB53TiJveQNisgIut37zQKj0qzZccXZe5czMDsrvkCX5JhbG0w2p2nXhMPJtROoI+9L72P4dCmg4gjqyBMN8yKxAz0FGVNhPwSSgynpa/9OC08CucvGO9aU2RXbsXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ+hi8PnWt7H4T3eAtvaFYImrn5DJYuEBt0371XR3+Q=;
 b=3Po8aGM36PIjDUHJlq0uQaJBnhhNnwLmVV28A3/qBqb2eOGf/2j2YdIZSqUjwrnUNgvu4h5rwXZiFhh1cOSwVhrG2WNiMpecOoJQcA5ANRKrvPpUMjfQPN+c48HVTMDDKcwRhTC5exs1HLkv/SGfSh5WK3xrK8+SKF4V2VnmlOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3434.namprd12.prod.outlook.com (2603:10b6:5:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 17 Mar
 2022 17:46:26 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 17:46:25 +0000
Message-ID: <db194b66-67fb-5ef3-4b3c-9bd140ca1c5b@amd.com>
Date: Thu, 17 Mar 2022 13:46:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f06da03-9011-4b04-2501-08da083e0ebf
X-MS-TrafficTypeDiagnostic: DM6PR12MB3434:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB34343D067CDBFE79C70F3A83EA129@DM6PR12MB3434.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MgmCExaY17DzlxwlxkZSAhrOR/rJnBNn3n5E+4K6gNzmBWOLAghdlWW8rbDR7+MBFu3REH7KvPM0t7aCG82BFvxdkyRcSJbGQB1AAtyj+gv4ssWVfZZkAu8zMx8SZfT8HEFQiwCIoPtf16Bu3YuDnur+UZrhgLvIrtwVivX1n4oLwyCKKP/kFOLnCPOT+xyxa5nAHrfpxibDsAVJOoMOi3pp0zHt28rBOr12+Jp/89+vwT+ypjr5r4JSPFGl2ovsKptGzow29v4Sdp+a4ZBEjJHUF6bQDMEham/xt4qWdJnvYgDD9q5X1s+GKUF/8ZUzq06tHQpt1nh7xnPx/NfGIZt+ND06Ep+UuvUrzbdM0Kbi1ejMLFLXEE3R3NpH9MqPgGWmR6FfJjCoBcFr6AwNRWKEplo1Bo5bL9aGlFjbZe1u+omVFagsx+P/2ApBndB1YjZYD/Z0zeBgWw4O5qnzFXuaNKhSL8MbcCc7CMqvRolvCq91E39EtpCzOsns2Y4RXIvoaFauPTn2DzHz3wmViTNqSUudTcmKpbbtpiNPx0eOUVuhIIDUJsF7cOAe6DeAi69vHrzJF7vk7gCSh2UVKOc6XPvs7LlXMaJ9BBaURcPtewFuAjEfE6Ffd4W1J0wjxjm7DqYntUq9iqTw/KaEnt+i00I7Ob2rgYmwl0KnaIeT5JKu+J3zZG4Q0EBnxzHFN1J848VKp7sV1s2xiTm7QDiRLqH7PhyPf8WQ53AcxYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(44832011)(36756003)(7416002)(66946007)(4326008)(66556008)(8676002)(5660300002)(110136005)(54906003)(83380400001)(66476007)(316002)(8936002)(66574015)(2616005)(6666004)(6512007)(86362001)(186003)(15650500001)(508600001)(6486002)(53546011)(2906002)(6506007)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm1IZzFXM0h4SFdlemN2akp6Zmp3T1M2QlRDZFNEaThSMWd3eGlNOGkydkFK?=
 =?utf-8?B?T28rdHN4dzdzRUFXdEJVcHM4N04yNm9lNmZMZ0ltVmo0K2JTb3pjYXlqUmpu?=
 =?utf-8?B?emZhVnRMcTJPd200RXczQzNFQTlBcnpmOHVHZG1zbWpUR1ZFc0EySVdmODdV?=
 =?utf-8?B?Y3E2eVJIT2Y0VVZHeTNudUpaWnpoQjF4eE1iVU8xSFQ1U3MyUmtnNmRkTmJk?=
 =?utf-8?B?Vk9Nc2xWYUhxczVaRFBxSC9VZkNrMVlxd3FnV1daM1FBcVEyeWpDUG0wVEpQ?=
 =?utf-8?B?L0hLcGE1R2Z2OTJtV00wVWZWNUpsdkh4a25PZDBqdUtaOVY2aGZ5SDZBdmFH?=
 =?utf-8?B?bXMxNGZtN2dUMkZGc1cvN0tVaFB0YnJyQXhzWTJtVk1XRE05S1A5UmRkdDha?=
 =?utf-8?B?L2VZQ0dWbVMvQUkvcTZCUFVhMmlWU2hpTkVhYUhtc2RBVmU4VVp4UjM4ZlJt?=
 =?utf-8?B?M004VlhRTFFtM2dUenc4Z3NJYUJiZ3FBVHc4a25kUlpxb0Zad2xMYlROSitV?=
 =?utf-8?B?SEc3TDRCelo0QkRVbUFhZVMzVmQ4cVlYRC9PbkdXc3NMMVVkSFA1RWVNc2FI?=
 =?utf-8?B?YkdhcDVCNEhLcVhrZ1VlenM0aVd1VVNaK2JjbWRaay9GeGdaVkJmbUJ3OEEz?=
 =?utf-8?B?aHV0Y1NaR1dveG4vVElWcnpJVkZVU1pickprSzZWYlpWdkowUWJOM1l3NW1E?=
 =?utf-8?B?dSs4UTdJUFZzK3hzN1orVEdsZzdQd0E0c3dFaXdDNTZ6UlpHaDZUZEJYb0hh?=
 =?utf-8?B?elphMmxrRlZiUDhhSWQ3RmkvMWVGaVBoQ0l0dHpad1RPY2dJOWszbEtpU0F6?=
 =?utf-8?B?QjNPWVlKTzJIY3Z5YVc4SEpkNVBQZDFHQXpJRFNPRDlRd2JxeGlxN1pwSGd4?=
 =?utf-8?B?WmE4UmRIQ1U1WkpGdDcrS01CbGlWZTdUMVRkK2Q0NzZPV3JONUljVlhFU2dS?=
 =?utf-8?B?eVFzRkFvU29GeHNhYkNHMWZuZlZld1o1VXNYaVJuWm8xRjQ2WjRLZ1YrUllM?=
 =?utf-8?B?MkUxRkVVcHhuSnJjN0sxVThKaWpWQVFkdkxjbTJSMEhYWUJBMXVaNEs4ZVZz?=
 =?utf-8?B?YlJlT0JjeFMzNWFzei9ReUNBZmMzYW9yUms0a1dncGJHcUZ3MGRoeC94Um5H?=
 =?utf-8?B?MEgyajRJMVJQcUIxRkxjNUM3Rnk2ZTdoYTVFbkpHL1ZScFQ5N0ZvOG8wUmJN?=
 =?utf-8?B?b0JqcURpTWEzcU9SQ01DY2tsTHJJRVBSdE84dHhSR0FYQTM3NVRpWmtWZGVI?=
 =?utf-8?B?Q2hYV2NQTjZCNDU4K29JVklkcFViV05rV0dDeVV5bGd5ajU5ZDFIbllHVHY2?=
 =?utf-8?B?clZKTlVoNURpbm12ZVlITGh2L0xmeFdkMVlWMnBISStFWDFmZU9nVVFvWjVM?=
 =?utf-8?B?S1lzbHNSLy9XcTlWbTlFeGs1K2FDb0JEU01BalUzM05pdDZEY0tLUHdjOE45?=
 =?utf-8?B?TzFpaTkrbVV3dkhhUUk4dWh4QmdnblZmb2NKWHR6ZHdFQmV3Z2w2OFhWTXhi?=
 =?utf-8?B?QWlHM0NMc2lEZGIyVm96dlpZSlpIdkdjbU9EYkYvUGFVSzZhWFZnbnBEeHQv?=
 =?utf-8?B?YmxEYzdGVGYxSFlGRUtUbmljSkM3bndaQlFUdEJDaW51N0czdVF0V0NZS095?=
 =?utf-8?B?SnJ4U2FOaU9nTXp1WHI2aVdPR1FFRzlEY0l6Zks5MGpORDc5dEdWRTlXNi8v?=
 =?utf-8?B?TDBVc256VmQ0NU1LOXdYSHN3clo1RkpoWEY5cWZEMVFqbjBqNE9LWGJRdVA5?=
 =?utf-8?B?WENmUlVaeVF2WWxXS2h6MHM4S094amJkNmtMbi95WjgrWUQweDQ3dXdRMkVC?=
 =?utf-8?B?anZtSWs2VDlpYkRyelVQTDZpZVVDamw2aTlWbVplaEJlK2h1UzRuZVozbXJY?=
 =?utf-8?B?aHZwbUx4d1JPN0dyYmRDYWJjM052OWZMT29JUlNxeGsvVmFrWnF4d3hwcitM?=
 =?utf-8?B?ZjYzTGFCeGorR21PMjc4eklMN1RSa04yN2xOWERDUHdYZUVVZ0dDRUZQeDNX?=
 =?utf-8?B?MitJbmZ5cmtTTVdMdldFUkw1Sk96eTFvWDI2cmoyS2M5Q1BRcG5TT0F4ZWN2?=
 =?utf-8?Q?/bHQY1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f06da03-9011-4b04-2501-08da083e0ebf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 17:46:25.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2Ery/8xSlYCGVVBUw1D+GaF0HRUe3D1boNe1aeaoTiPM10Uhva5gDPx1KjZUj/OFPbjbk3Tn0AOgoRHtu/i/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3434
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-17 12:04, Christian König wrote:
> Am 17.03.22 um 16:10 schrieb Rob Clark:
>> [SNIP]
>> userspace frozen != kthread frozen .. that is what this patch is
>> trying to address, so we aren't racing between shutting down the hw
>> and the scheduler shoveling more jobs at us.
>
> Well exactly that's the problem. The scheduler is supposed to 
> shoveling more jobs at us until it is empty.
>
> Thinking more about it we will then keep some dma_fence instance 
> unsignaled and that is and extremely bad idea since it can lead to 
> deadlocks during suspend.
>
> So this patch here is an absolute clear NAK from my side. If amdgpu is 
> doing something similar that is a severe bug and needs to be addressed 
> somehow.


 From looking at latest amd-stagin-drm-next we only use directly 
kthread_park during in debugfs IB hooks.
For S3  suspend (amdgpu_pmops_suspend) we will only  flush all the HW 
fences (amdgpu_fence_wait_empty) so we don't freeze the scheduler thread 
and don't flush scheduler entities.

Andrey


>
> Regards,
> Christian.
>
>>
>> BR,
>> -R
>>
>
