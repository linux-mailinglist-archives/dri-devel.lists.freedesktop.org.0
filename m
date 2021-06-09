Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790513A0D0A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586E56E198;
	Wed,  9 Jun 2021 07:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FA36E175;
 Wed,  9 Jun 2021 07:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2GbB6x/Y4p3dmrZ3Gqw09sn+VKNLNi6ruoSmURMeeM4oSPbZNU9PCw82bFUAcgfRs2+yX8naoZ8q+B1Ed6J9x2spcE+JyDNzOIGNIkY5PzY3208YM4UBnaNvWRmNZobQDqL1BlGoe825EDbH8Qg2YspkhswrLIL1Mux4Y3BpM8Xr32/RXmyKR9ltkAbLzr64YAFMyPRHXqaFsAoqc51ACSIKhV4SXgjEGZnhznOEaqikKPCfJwFaK55QoCln2S6zUddU+W2e4Yy3UQ21o3KTkQgyDm0wGjm3q+1GAwFV4hmw8nzOAEQ1RUlg0Tn6f7xhVaBLG/AHX+vt/eO5o+hTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN5DOA/C3N/IGniMzb2WGHETAuU42mKCuTNGa35xgXw=;
 b=c1Bb5ysDRKfN4/UJA8aRI411VLurTY6piXdvw7ru2CuAvb0A+rzBWIRNvFFm1F75D7ceAds1nn+meF5qHUpHa0oPiNqvCEwTz4HIpk4uBY7lbOJz3pqCaAbepca3hyaT2CzKjpF5QShw0AXvqjgSznxHBCigiWpgd3+bgdSEscUep/1R434Jk/fpZUtaxOwlrKNbr/cijzWko4Jj5KHwTMQnsH9XnLPcDxSVyU7bhjA96l1gF3bohEXrCylMBucAOunMMumorruyUspmBZ0C0C+vLj/MefM7T0HpSjwIAWAanbmEdRqMo8g4sOuYhBobEe0kJFdzLZ2BzKWclTz79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN5DOA/C3N/IGniMzb2WGHETAuU42mKCuTNGa35xgXw=;
 b=u0zc+hXrJOPEkGnacCt1Y9t+GhTsNbMHHPL9eS2UbCmqQ2xPD6Bz2sR977aR/W/A1nYZcfgdQeP20xnH9PTgt/kdb0DCTYjKF37XnG4bffy7SNlIFSSLAyIlnsEhRdwd97lxiw3NRkWF330GbiIm2TuhhZJQdFH5An5lJmjtQ38=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2775.namprd12.prod.outlook.com (2603:10b6:a03:6b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 9 Jun
 2021 07:02:29 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 07:02:29 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <202106082359.12109.linux@zary.sk>
 <ab40bbc8-2c0f-0652-c9b8-bc7fda7ca2a9@amd.com>
 <202106090857.42133.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
Date: Wed, 9 Jun 2021 09:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106090857.42133.linux@zary.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: PR3P193CA0048.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::23) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 PR3P193CA0048.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 07:02:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfcc264d-3ee5-4381-aba6-08d92b148bd2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2775:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2775571BC7926CEBF1AEABB683369@BYAPR12MB2775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPBiZcFoZZ54Bg1bNmCdV9NzoOK1IeAXdYkTE9cMvVqU6ZlqUk17uz0i+AX8d+RPJ2zO6bPCVaZLOva9S/QiAWPatN2NjKEwYJNGwVCWKg8ncnhMzpH5xHji71xPXDxY3BcMCwaaITqBdi17IHkdg1Yg79aEv96iS0f8v1G1r1CJ/DsH7FG1QvoznxH9TRZm3gWeddt+d8rwztdH1AHpZc73iHO5/Vk+XaD+hluxF8+8+VoWAPEhxQwS/3SE7eQQHP68qHa3XjZja9VO3EErx6zptL+8iFLCfzkG63vMOSKqQb6GMgJrasMQAPULFNUjmFFliDoUiTxMj/kt8+OT55PPZmLjvlc7D9uQrHOf7qKR3namo+Z4XsT8v9XOopKF8+mediCVvU+PaPXuJYM5u+zYhiZK6kuau4cWpJ+WQWzVzTTrOKy9CGB3JkYtKR7x/sRdPsKqIXoJ+QyEjKH0Mb3iUb3WSIME+AgNkNFHrFJdHf2vXO33H82gRpT8LVnXzwLnSCaalftoYgURfo8jRjJxUj+6tkL5EUTWTz6TzjY5Gt8LA3GlomuEhGiYUrzFyozKyiQbRD7OtFV/mZpT4l0CFYfK8GH+lsPju7qCFTyTRDpNvCGYH5I8Yi9D7RtNte4RPq/HsZ8rge7clATsdVV9cKQIZtWvk9OlaPjCrQDZuweWs95AdJwN03A5bZgm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(478600001)(2616005)(36756003)(6666004)(4326008)(66476007)(6916009)(31686004)(4744005)(5660300002)(316002)(86362001)(6486002)(8936002)(66946007)(66556008)(83380400001)(16526019)(8676002)(31696002)(186003)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVYMjJ4VFI0Qko0aEFNS3pmK3hzOUFpS1czdFpBRWgrSDFwRmtkRmNkRkVF?=
 =?utf-8?B?RUswVXdTd0pEQmJ3d01tMTVhVVIwL1pTM3Z1dzZUME52bmhlcDFoMXlqOVJz?=
 =?utf-8?B?VVNSMmdCcFJaMGpkbFhQLzM0cDlXdnYwS3JEc0I0SjJFTDZlb2JBUTZLQnc5?=
 =?utf-8?B?YU1jQ051cDNVbWZMem41c0ZEOExCeDZ4YnpuSWliZG5lQ2F2UzY2YXRVUnF5?=
 =?utf-8?B?VW5IR3hFcWNodmd0bnNEUXJGOEdwZm5iOHZBYlJOT2lMNFV3NUx5b25YM3lR?=
 =?utf-8?B?T3JMSkJpYm1TRHNvZC90aDhJa0dFeEhvck9qbjZud2RyQXczNlZqdnNIUjZR?=
 =?utf-8?B?Y2xkZ3RIVnNVK3dBS05hdXpZNmMxQXFoWng4M2FxYlUrSUpRcjdoOVFEWmg2?=
 =?utf-8?B?ejdOQUY5WHRuWHBoS0NidTh5eWo5bWdwUTJ2OGF0TWdTOWcydkd3blVyeUdJ?=
 =?utf-8?B?OVhJRXNDMnY4ZUZqSHkzcnpiRUoyNGZyNkx2ZXB1Q3FFbS9QZllxSHd2dXZ3?=
 =?utf-8?B?S1ZVc0x3QmtCL05JMzhWN2VNa3B6UjlSQlVmQnVqeTFMNUVyem9iWXJUZ2tX?=
 =?utf-8?B?cmJuK1RQUU0wTU1lMlJiWUZKUk1RQ2ZxSmNOSFl1RkR4NFV1UlB5M1o5MVpD?=
 =?utf-8?B?dWI2NGk4czl2WEwzRkE5TjkwZUQrYUFYY1h3ZmE0eU8wb2hoVHY1NzhsY3Fm?=
 =?utf-8?B?WUJqc0h6Q08rRWdKK0RWekF6U210MnFyT090T0xzTmFaUHRRSjVSUTBmclVi?=
 =?utf-8?B?by9Sb3Budmk3NUNGM3hkVUlrUWVjS0crMGh0Zm8vcEhyalExaVRFYWpTem1E?=
 =?utf-8?B?THoxMG9KczNhZlkxZ3NydkRKdXlKU3JTWEd1WndscWtmT0VtcGhQNXc4ZExG?=
 =?utf-8?B?UUdlWDRESGppb3d6UGw0MmtwbzI1SGIwTVhQV0JOWEVRdThyeWd2VlhnZEJP?=
 =?utf-8?B?Z0NwRnpaaE1nblBzbG9uS2VHZUlSeTJ5SW43ZHBIYkEwN3NJR0p1UG1LbDl5?=
 =?utf-8?B?Um41Q3JWT3RhTU9JWXUrYU9BQTQzVHFXV0VxSVM4MFk1aDZWblE0eFA3Z2hi?=
 =?utf-8?B?dW0xVzBCOHpJWDRWd2xRWlQ0THdXSzJlc21heFFJZTUyQzZIT1FCdThsOGFn?=
 =?utf-8?B?ekZaSCtKbkNobWxDUHlSWGJBN29uNHpQWW9uMXRycHBZMFFKeHd6RVhPSHdM?=
 =?utf-8?B?ZUdhdTVWTmV1WUIwVy9PelRiUWFuOVhrc1Q3cEczMy9BbEg2TWl4SXU3SGt6?=
 =?utf-8?B?Z3ErOXBmMTN2cGkzYVVxWXJhVGtzamFYUnY1Vk4wRlV4Z3ZKMjJMbWdOU2ZF?=
 =?utf-8?B?aVU3dWh0am5rMWV5L2wzQk4rVDFqd1dSV0NPUnFBcTZuUXMyMUhkQ2ppdnU5?=
 =?utf-8?B?dzVlN3BGTngzRXNVUjJvWHd4NkJ1YjRmYWNUTC9VckdpcnNNVldhTzUzb2hU?=
 =?utf-8?B?MXN0KzlVRkVVOGttUUpadHIyK2ZTdFVDREk2emQwMkZUMXBQVXdEL3ZUOStK?=
 =?utf-8?B?Ti95clYvYmh3QVRCU1Bpc0x3Q0hRWHUzdklIZ2hlSVhkUWJ0RUl3NTh5THdw?=
 =?utf-8?B?M3pLVW90WlpqS25VYVJINjJkTS9yZlk3RlpIMVYwbjYvUXI1RS9mUWxrcllE?=
 =?utf-8?B?L1dtKzZDQTNzbnRPbWJ4TzIrbC9SVEhEbDVZdVBlb0ZsR1JPQ253WnIzc3BD?=
 =?utf-8?B?eC9NU0hsU2VtUytWOHFOcGJWeXZrbHVQRk41Q3NEYm1UOEtCRDNXWEs2UEN0?=
 =?utf-8?B?SDlvZ2FEY0w4UTBheFJuak1URUhoNDVub3pKMHNVV3ExSi9SNm45NWNFMm9a?=
 =?utf-8?B?Y2pNVHd3MllZV0dJWTBkWXpXWnVZTWE1ZTg4bTUvd250NGxCQ0dwR1h4NnFO?=
 =?utf-8?Q?b85oZqRMqqyUo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcc264d-3ee5-4381-aba6-08d92b148bd2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 07:02:29.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGawKplaEYOH69uhYlIwgBrOqu6f4fVFg9LTzMRMnf213w9qdjQvUOmSUgdz8noi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2775
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.21 um 08:57 schrieb Ondrej Zary:
> [SNIP]
>> Thanks for the heads up. So the problem with my patch is already fixed,
>> isn't it?
> The NULL pointer dereference in nouveau_bo_wr16 introduced in
> 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
> aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
>
> That's the bug I hit when bisecting the original problem:
> NULL pointer dereference in nouveau_bo_sync_for_device
> It's caused by:
> # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/ttm: merge ttm_dma_tt back into ttm_tt

Good that I've asked :)

Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was 
created mostly automated.

Do you have the original backtrace of that NULL pointer deref once more?

Thanks,
Christian.
