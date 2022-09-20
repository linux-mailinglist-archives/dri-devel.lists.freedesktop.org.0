Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181D5BE5AC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DCC10E5BE;
	Tue, 20 Sep 2022 12:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B934C10E1AC;
 Tue, 20 Sep 2022 12:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpxwPcHsudAaWBK6JClfDH6QP8DxEQieBac8+jolfHVCWRQnfbd9uYKyoigO7xnbkUJ2/40nSRCaugsXwIyIPFzg+UoiClcqlLJaHgzUxtQeJSF/C3jx2hLRfif8L0kXhZ9NUTkriEM/1ESOsNh+HdG+jJQ4AFnrp5YVeGD22+M4MWJZMEJLkvFjazKONaeZQYAGNiZ4+X9yTs374tETCl9Kp+/GKyRQOpH49TeWXCTfgVB9XtfVCEjqhOYmSakUWsndrqGUCowDszwl/eGQd8trUczQDAGd15r/Pfbhc6RBIOeARU9MNujkcocBbexhTnTyutnxyvG3ai3Ms3upYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0VaBZnryXLhlz6qbb0dNj0wpmpf8cTaC0FwtIralbg=;
 b=KEPlgq7uriUYR6iS+wjeO+Gsr59zmhSlvnhBOCGs4ZJNYKB3Vb7Vpva3Vhn9dl8ev6F8BCwNB+mHhYSEmADyjC328ec9JCGF+H7rm4fyM+7hLA26AuVadg5LXAIqjiP/HUR5Z25iEh7FqM5mMYozJKyrInQxKHpbs64CGcXcT6sB5NZw2W0feHEwV9WzwBf68WyhQFwEmLZdL6E3F3VEJdPbs2D/GeaKOZIMG84JgzoIlqvyxt9TAGX7KtDCARHXu0KsxB4uGxOtwtnmY6SpQUZ5f5x76AuVm6rVH2ojpBPgUbN5ViWv+I42xfNqb1F61hyI/yLE5JwZ5/GXhg8vIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0VaBZnryXLhlz6qbb0dNj0wpmpf8cTaC0FwtIralbg=;
 b=MNuY/nylgzOBJ+fds+aFaoFYq6ZrCGBJJBKhQ+rCF4oHbixama3zRYd/m5m+3/b4Q0luuFwSETWt3XcHkqXTfyxZQR3baaaIDSw61whLCpaNIxqwzIpYmJrfcQRCZ8bNAsThhofrnX97Lgr8OsfYcxtXf6sH5aF4jl8mIdz9Yj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Tue, 20 Sep
 2022 12:24:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 12:24:06 +0000
Message-ID: <3430255f-3675-eef2-92bd-4eb8be582c83@amd.com>
Date: Tue, 20 Sep 2022 14:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: initialize r variable into amdgpu_cs_submit
 function
Content-Language: en-US
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6a4f33-2a92-4ba2-e51e-08da9b030293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksCdRUd5eRq6Ix19m42QFXlP/dnyuztm5bMinoLT1OYQHQ/hF+phxHJ/qxJpYvLlzhQahiNECO47I7d6GrO7T9DDDtU8bU5meEUW9Fa7wXgXWNCbRQWJQxSEYDVv3VgP6NMERp+xj3DDlmg6l5gh0fc+kwBwc9D8T0pdZxiW4Jz+fmdxGbe3WZXJR/y062UHFvKh4OVCecmkJlUNRBQE/tSI7nDkg+GmycK6TdVelyPxgs0qV6SA6VmVLpV6ZiMnIwV+KnmvQUjI0WRh6r6T4s77u6ZAEmnimmaRusZMPi8But5fKkuaTCs07iMSMVkldN62bZvk0CvFid9gjJcs14WLr1rUigEKt75M9LdANcgMdjeIalJBV+iHrLUWURcLzhCvR+0Us5t6us6VWghHlwOHJsN16JyfqT8FrEcszFPu6oJNTTPWVCUIB7xaqx3grtBadt+kLpWatOk8U9hyFJxVmQcPEyXq9fSvAhxqC2jXf26utll/L0lfhmtX45OQLP4ZaVYMc51A9higxJBq/nxDCRdesw7W1Cj3oQsTIXyj0yMxKX24KlhISLCwhSoylWxpvSfChbfCCi3fdhIGrsug6Sz1HU52uwoOGj6WxR9d3NZu4lvCS/OTs25WkxlFCUiwr8Mb5h3TDYEQsqpnF89p0Yin5/Gkvl9DshzW8EYgIfjjj7wWPIyChANQR/s+c/wrvp+Rqu9Yz03/91CsimIOMkHc7CiHGa8Fps8NW5tmArIAQ9v+KZRnJID74GJh+dh2RJxhGzXRr6hIAEWORNqIhdr9RUAGoAU0bd1wDRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(2906002)(8676002)(83380400001)(36756003)(4326008)(41300700001)(6666004)(6506007)(478600001)(316002)(7416002)(31696002)(5660300002)(38100700002)(86362001)(54906003)(6916009)(6486002)(8936002)(31686004)(186003)(2616005)(66946007)(26005)(66556008)(6512007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFhVMWptL2hreXBEZW9pSGszL1VSODJDT1lKR0Y5bTdicEJxbDY5dTZsN0tq?=
 =?utf-8?B?YkFrVVBtZjgwc1h4eVhyYlo2cEt1RWVpQnhNMHc2cDdzaGlWY2FQczh4NFVW?=
 =?utf-8?B?WWhIaEhwTjZMZ3UrMDNtS2NGcXlHMzBZQW9ZVTZIbzdpU1JmSEdqZTBYNEZS?=
 =?utf-8?B?c3JmViswL2dOaFcrMndsQzdTV1BUTk1iQ3EyeWRsVTJBV1BjbEJScStobEI4?=
 =?utf-8?B?MVUyNG80V25ZYjRvZm40OTNra1lvbDVSQ3dXTXRnbHZHS0tJbk5XTWtHMXBL?=
 =?utf-8?B?N1VCM3JHekJrVHV1ZE1hN1hwaXB0dEVPaitIT3F4TjhiR1E1Wkc5UmxYTjY2?=
 =?utf-8?B?Y3BleUJuQ3N1ZE0zclpBdGlBRUlsSWUyZnNRMHZLSzNQRW5DdWxOQnVzdDBm?=
 =?utf-8?B?clFWV2FhMTBDajBvL3cvU2owWW0rd1JtL3NxNEhDdEI5Unh5a2UrSjRzN1pl?=
 =?utf-8?B?VGVPQnN5QmpVVktibDZ4NzhtdSt2QUlpMWN1WFJObDdldmFKU1gzYXoyaVVG?=
 =?utf-8?B?N25KT01zZjcwQzhKVXAzcXZ4a0lQK1d0MmNzbEUrSEQ5dk56dW5OUXdUQWF1?=
 =?utf-8?B?ZEdOalV0RnY5Nk5Pa1lNWlE2YjN5dnBhTUpxY1R1dXR5MDNqT3FJbGIzNlZW?=
 =?utf-8?B?NHN3ZlkrTktTSG9XMkNqZnBtQWo3YVVJRFc4RTlHQXhIRzhvMlZMd2c3cmM3?=
 =?utf-8?B?OWFraFVQMGFVUnhOUDc3QWdjY3NvYWZNaTIrd3NTRzBCbUxpM21zUHUzUmlt?=
 =?utf-8?B?UGtVb0wvN1VOejgzK0I0OGt1U29GakpzSGJTM0xDQkxJZEplMTlCa0prTmc3?=
 =?utf-8?B?VWxueXdVTXZMTnF0dEVTR04xOG10U0xPSFh5VEJ3cURyc3U2ODdNVEJJdElD?=
 =?utf-8?B?MjlvSGJIcFRxbHJrZzZhUUo5UnNnZlRPamRQMUY2dmszbS84ZUl2MDhmWkc2?=
 =?utf-8?B?VzFZcFZTV3dBV0ptZG1BZFRrS1l3bzJ5bWpidktKa3FIaWI5R3dZV2ZERUNN?=
 =?utf-8?B?czZJRXgxRDNCUW5mOUFlS3lDRUZ5SVptbFp4WjZBTnN0eEFJMklsNlgwU2hG?=
 =?utf-8?B?U1R2VlpWdnBPeUlCU3Byc1IrWFdLcFhoQWRLaWpITGFOMXFERzNOdy9mZDVW?=
 =?utf-8?B?RndtQWZIN0FJT1VnK3pqaERhSmdxYnlhdkQweVdEbG9PV1pidUxzM3FhdEEw?=
 =?utf-8?B?NnB0YVNZT3phdSs5QmE2eG5HWHBGd0toYng4RmY1eXphVHZuZGtPanoyU0Rv?=
 =?utf-8?B?dTYxSnZmWE9iRDB1cjhOSTVzSVUyckw3alVlUWJZTmJIdjE5RjBseVRmUlJv?=
 =?utf-8?B?eTZBNzNGdjhieEdKQzc3RjBkQVdhMmM2dTNYbG5jVHNxdDUrd3JaWWZENlZq?=
 =?utf-8?B?aUFlTk1zRFpSQ25KN2ZNZW5ndGJZRzFSNEk2ZU50SUt1TTc1d21HMGFLWm5o?=
 =?utf-8?B?bERXVXdjN2o3VzVGV1dUYkkzYnVUZ2oxUGpHcGZjVmt5bktjdlQzNnZyd0Vu?=
 =?utf-8?B?ZXVoWm1pSU53ekJwbUIwRWFCNGRjUjM3YS9QZXNmYnd2MDhYSUpHVmlTemJ3?=
 =?utf-8?B?K0xzNytXWU9vUDFLRFg4UlB6VUZyalBwdXczbnZsMUo0QTUvcEtOSXlPaGJP?=
 =?utf-8?B?bFRCQTV3dzdHbkZPMTlrS21oaVpabnlPalRxVTE3ZEpMWWFNV2x6WHgzYS8r?=
 =?utf-8?B?ZmVXWmcxbWZjOXpxN1lkQTE1SWo5dGNpUmVKa1JQVDNBYTAzUkZSeW0zV0Fk?=
 =?utf-8?B?cENBZ1grZWtqQ3lqRFo5MmhnUlZWZ0J4ZGJUckFERjczYnVkOHFLVTBKNnZv?=
 =?utf-8?B?M2hJMmtGRmZDL3hlbkRETUcwb2o5c3BDM0xVZXBXeTR4VG8veHBFaDQ0a2pK?=
 =?utf-8?B?N3JnNjUzby9iSXhBUGZZQkNrS0MvTHpTUWtvQklJeE91S05DU1ZTek9iKzF1?=
 =?utf-8?B?ak1KVmVibWlsSklubWgyL1lMNDhNYk1FcEFVNGwwQlpCMFoxNnRWcDlZQ2Uy?=
 =?utf-8?B?eTdqMERVMUE0RThBeCsrK25BUDlaQVNvbGlPQWIvRDFWbmFzNTNiK20vaGhV?=
 =?utf-8?B?N1doUEd0UU9CZmdZUUFzMmtnOTN0aG1PNGdmNzF6c3dSU2hwS2RDbXMwUUZk?=
 =?utf-8?Q?rVeCWlWwTOsFzqTaX1QuVvSRS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6a4f33-2a92-4ba2-e51e-08da9b030293
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 12:24:05.9300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfcAtn4uxtFsiL2eg0i1CWBsqt8jdU8Nb0lyvQNLqYfb42RcYj8MwlA8jIgvgn0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
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
Cc: llvm@lists.linux.dev, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, linuxfancy@googlegroups.com, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-amarula@amarulasolutions.com,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.09.22 um 14:22 schrieb Tommaso Merciai:
> The builds of arm64 allmodconfig with clang failed to build
> next-20220920 with the following result:
>
> 1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
> note: initialize the variable 'r' to silence this warning
>
> This fix compilation error

I've already send a patch to fix this to the mailing list 7 Minutes ago :)

Please review or ack that one.

Thanks,
Christian.

>
> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 58088c663125..efa3dc9b69fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1168,7 +1168,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	struct amdgpu_bo_list_entry *e;
>   	struct amdgpu_job *job;
>   	uint64_t seq;
> -	int r;
> +	int r = 0;
>   
>   	job = p->job;
>   	p->job = NULL;

