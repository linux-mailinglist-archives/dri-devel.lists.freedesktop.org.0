Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B814DCABA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5283C10E0AD;
	Thu, 17 Mar 2022 16:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278910EB5A;
 Thu, 17 Mar 2022 16:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNSDErJRWad2nuQsq6si/z124pyc+mJYsPNrkV/n1c9BSAbl1GLv2WnzMhWglAC7vnCoKHnLBQEeUemeosPkak9km9cwhFxkx6Nyz5Bmti5DGTS0qpDuT0WrllPw2dBkYEIvXMsD4Qf4408hWEwRsZpl6musgtVIUB1dHISMkkOitU4mFhZzmVlSJujYnwsyQtNag8bGrOUUOZOcqDGNC0QvdFi84gWfDjP201xFskfPkroDdokdyGbMwtPFWOXF7iLpEbodNVi6MEovvFQsx1GsAtpH7+4Mpaw+fMTMqGFTLKo7sWIjTzsAnGBqmSlPdmDNR0odSFIz5kvSpLCr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAFTb9cme24bwwfQCFsVF1YRoMVGhJn95kXcjGsJ6QQ=;
 b=jaK0r/DDhrEvW9Q8SpAolb8r2w8srdV8f1cfwhofWjt5/B3aYwnTDOlZ9LO0mLQ40osyJRUccgeLnIZuYyRbiEUteceJ9VuIQP86OJ7ZIECSR2pJFK6qpwzgqvUBQmSj96pB/KFPVRdAU5LhIha1IhMGJXsevLI+sjEeqsf7Shk2/zmDa/t1VueK6grn6xCd3xhlmVS3UeE7Lb8TrAHA5wyd5HZkI0PJ842OVRzqM7WST1B7mclpv4IhnE1GzAiw4mjpD2w9uTX+S4fF1gxt83andW6QYw47PnG7pCx7wNZZJdCM6AL8wlLdWz5EZmZhJWLRrlq6YF+BaDn9lInxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAFTb9cme24bwwfQCFsVF1YRoMVGhJn95kXcjGsJ6QQ=;
 b=vW+jmkVbzxwwmfZYzS1lwDfnawBWA9AeJrxve5LhIPnY6qBly6xSg0SBV/n1DVwrjPSp91G4B86ixNrUL17m8pveGMogEhwx/td7LWx5YW8UbYBYrl5AW/xounvVddSIwACeHLkPSusTIKLf0wu2lGyJXY4qGB//FG3rjPeZn/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4748.namprd12.prod.outlook.com (2603:10b6:5:33::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 16:04:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 16:04:56 +0000
Message-ID: <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
Date: Thu, 17 Mar 2022 17:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32b1bf08-6c38-4f00-dccf-08da082fe12f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4748:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47488BEEA63B65F3E478A42583129@DM6PR12MB4748.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/56yW0rycg3dEN+RvqdRD3eZlQQKUMoppqm3J58+lDHBO/oWsMinaIWoHyD7v8nhrBuFHl0DbBpEtNvMRt0uUiRQmUvcYgN/USIziLw5a8bRTwUlCskQRlQedGP+K7g4Keny/Vdh47JDmAS1I7h8eFfpCVJkUu9p52EUVXNEjLWWB2n6FQzluu4sGtTZLmVNN4kNO77upeTwoLTmJGVKutAQjqsbc+5nc+tRNbNlXOFnazLokiaX5lMMPTJwRmKVjZnJvOCSN8AVtj5TPMpTBDD0yrg7Y7WT5F4SQXaAKSwerTiMUvhfBQd5gqF/z24DQSpHwye+o2XJs/J/UrGI2EYN9a2z9yncp9aI5lmotAmqK22w1L6uxzByKZITN4A9iiP5roRDaSdtLAFeivnj0YTpvQBxwUkmT3L+SgSwbnZj4UqM6hZXv0q/QXTL3RIx/v9D9l4wWJNTxbHHK6FuxTqoX8ea4SNap/IRqbj0PlZpPgAsFKqlDFRKEsnNh++7AUUPKDxwci/+/WxhpmkctEsHLzrX5qGsa74MZdDLo/ECc/fZRlRtWy+KhVygqsXiKdOE7u/4dCTz2QiS9xvA56GknQoejKja8Fb46o2F514CY7GgmxtS4B3zrzRDS4xQPSi/llt/BQbUrRbJfv0sFH6pB1bH+udjT8QR78s54fXabB4r4uzLioizcT7vRcIhknSQaQbYsmuD4a3DGIo2Ql54IwoskknEUYilP3e9iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(15650500001)(6916009)(6506007)(2906002)(6512007)(66946007)(54906003)(66476007)(66556008)(8676002)(4326008)(83380400001)(316002)(8936002)(38100700002)(7416002)(508600001)(5660300002)(4744005)(186003)(36756003)(6666004)(6486002)(31686004)(86362001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS9CajNDNVVaTThxZTRtOVliOENCeEp3TXltdFRsWEQzMmZVRHZ0TG5CR3c0?=
 =?utf-8?B?elZYUExKZ0RLeHFERzhPTnI3QlJRMEQ4TnpvU25pcmNHV05ZdzR4cE5XeTNV?=
 =?utf-8?B?Y1N6RlBxQnNjUTlzcWVKWS9QbC9UeWhNM0pucVlteCt6OFJCdWV1M0h0QnJV?=
 =?utf-8?B?eUREaDZEeWxTU3dMejhzQ0ZCSGxqNmV6TDFqUHpEaGhDSHFlall5ZUVSOW5v?=
 =?utf-8?B?QXdXdENUVzNnMEJZMnJPUFZGSmJMSklnWUJEQW9HTFd2R09wZTBGWnZWUjVO?=
 =?utf-8?B?WlJpYjdvaUJCYnRNUGlnSXVkTXhSMUh4bGtlZDRVNkt4REVBWDF0anZyRTJ6?=
 =?utf-8?B?ZGJYQTJFWDVJTWtHSVB3MVdCNHpDdVZFQ2hBUTFKRWpmTXordjdyNUNaTlo5?=
 =?utf-8?B?SENTd056R3RlY3dnSEd5NG05QTZFelJCek1BbDUyODE5UUw1TjQwU1VXc25m?=
 =?utf-8?B?YkpDUWdQL1EwUlhBTGJ1WVQySmlrRmxFZ1FtZERpTW1BNUFVSTBEVDArMlMy?=
 =?utf-8?B?eHdPNnhvYkQyRXFEM0gwd2pzMWtaU3RBUHB5U2lUWS9pbU96MGY5czdxRC9s?=
 =?utf-8?B?MDBCZXREaU9RSVgwRWpHZVR1N1pHZ3NkcTl2Y0h5QWxRczRqc1hvUzN5R2RW?=
 =?utf-8?B?QWM1c2ZxelZsR2Y5Tko5SS9seDZaNE9zNlc4NU82OWpCVWtqc1F0WDMwVFRN?=
 =?utf-8?B?SUpsaDh5dHBRaXVuYmgrV1ZGbFRIdFJaVkcwdUpNQjQ0SnF5UTA5NG5oVzRL?=
 =?utf-8?B?QVN1dHJ3a0lZRFp5K2p6bmpzdVZPUzg2blpFZ3VKSm5XNlIydHkyTkptU0h3?=
 =?utf-8?B?cHFxNkY4ci9Femp5OFc2TnpoaG1Pdm8zODdoV3ovRjFPUG4yWG42U3dBN3lZ?=
 =?utf-8?B?V0MzeitqN1FNQWF0Ykw2VUN5a0VvQmY0SVVPL21adWJZNDYySGlRNS9WaTlT?=
 =?utf-8?B?azJxcE1vWUNJczFRUjBVWHhzL3orcXlFV2dObTNtZWFDL2s1WlJlb3NNbHBG?=
 =?utf-8?B?eWlvN3lEREpLWjhHd28waE5sTWtWcmhCTVIvNWUxWkhOdlZLNHBFcXJBMWxy?=
 =?utf-8?B?aU1wMDNZVnFvd21DZFJPQkxnd1RUMnlrNEU1VDYxdWlOVWxLUFlVUFdReEJn?=
 =?utf-8?B?RVZkQ2MzOFN5QmFlK29iOGtBZjZaMFBUMmdvdnN0M2hweGpYb2pGaytuc1Zt?=
 =?utf-8?B?VmpYb3ZadVd4b0xQL1haYWNUTUdyb1JrbHp6VnFkUjFzR3ZuRUNJSkt3RzMy?=
 =?utf-8?B?U2FaOVZsd1J2NDNHdTNWOWhnVzdsT2JFektyUzIzaDdtbTYvU1paTVZhejk3?=
 =?utf-8?B?Um0zZEJra2tHbWd5VmpMaTFLZmgzQ1RPVWMwN0hDTGtIRWFva0lESTkzWTNY?=
 =?utf-8?B?cFF0NzRlSmgrT1p0dU5JWExSTThiYkczRVVrTzF4Z2RqQ0hNMG5XNEdpTmtX?=
 =?utf-8?B?a2kxSGtNTnVSMUwzejJicmFIc3hrTStUd1JHUE1veW1Nbm5RR0cwb0dIQW9P?=
 =?utf-8?B?V1RRVWRRZllFNkFrdGFJdTFjNDdhSnZST2ZCTmxaZ1ZBY2MrRHhwWUtvSTFR?=
 =?utf-8?B?YnMwQUZBM3VJaTBOSlMyQXNITWk3bDNUZ3Q2dFEyY0dQMmo3QjNsbnBxeDBK?=
 =?utf-8?B?ckQzalpvZUpQM3hJUmlNUVNMT010QXZISTZuKy9UdmdFWm9uY0h3T2h2OHAz?=
 =?utf-8?B?RElOb2NwRCt6em9EVGhsYVdybFh2bGJ1S1NXMjNxQUdBWFlCRHdJYlNsR2dZ?=
 =?utf-8?B?dHgyRzl5eFdvNTVRYS9DQ3lxVVVoNURJWGs2ci9vK0dmaGZnL1dYOEdibmVI?=
 =?utf-8?B?RTdNd2wwSGVDNTl3YnRDaXFuY2JEMm9iU080aDFnWTl0aUtPWi9HbkFIeVZN?=
 =?utf-8?B?MExiWlBLZzVnTUJ0UFQvajdPdCtleXIyZ1lmcG5DTlBKY2s5ZU9MVW9nMlNY?=
 =?utf-8?B?b0l6WmRnbFNxaVNOR2RXbW9lRU5VQnQ2QUY5RHVxZ2pnZU1lMVFkVGN6RmUw?=
 =?utf-8?B?d1RiRFhaR2o0ZUEzazV3ekhuV21HR0tGV1VobU5yNTVZQkd4ZVZocXE1U3lX?=
 =?utf-8?Q?EwftNK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b1bf08-6c38-4f00-dccf-08da082fe12f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:04:56.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q70awWQXDJ7wLkyQTy3VP53ZW1k7cmopUZDuxsJom1Gv11VP9Vb2r4N7jgg9MwZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4748
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 16:10 schrieb Rob Clark:
> [SNIP]
> userspace frozen != kthread frozen .. that is what this patch is
> trying to address, so we aren't racing between shutting down the hw
> and the scheduler shoveling more jobs at us.

Well exactly that's the problem. The scheduler is supposed to shoveling 
more jobs at us until it is empty.

Thinking more about it we will then keep some dma_fence instance 
unsignaled and that is and extremely bad idea since it can lead to 
deadlocks during suspend.

So this patch here is an absolute clear NAK from my side. If amdgpu is 
doing something similar that is a severe bug and needs to be addressed 
somehow.

Regards,
Christian.

>
> BR,
> -R
>

