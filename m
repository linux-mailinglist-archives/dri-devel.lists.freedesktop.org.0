Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D040872C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E184B6EC83;
	Mon, 13 Sep 2021 08:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0838C6EC83;
 Mon, 13 Sep 2021 08:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0Rft2LDLJMnfmTCT9E2lE6gE6izAkP6usxe7dWIbaOJJ4McAx9pCHztazoR0jOuX57eBrPAW9xPbx/I4HRDzt3Cgt29HvEn+1b2ME3JZyrkczce6/fsaEDHDZBs8D2dsZ8rXV4sZHGP7WZusQFYG26CXT9svp3hawb3jwCGeSPtXK0eYERiqU9zMtClRv1Nl+a6tRz4nMn1gnNm7uXxWFL0/wac5TSZK56srlL1hqnTeQBP0H6RZjWt+HUCLN+OVSKHIGZaysKD1qq6tkzDsIxG14YXqD/YBlsyqVn6h9gregbqKCwCIA91LtiV1gxXrS1RRRNH1hCdZgr6LGElUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CihCD67Ajr4HWh1jNQN1AMCSm5+tlr/T4q1X30ELoh0=;
 b=c3Thcf0NjN6z9wZAm8GlgtESMaxZLbNo5AKlGbpM6/TJJc/s1Bg9Q4hq7oV7Je/FQtRF8MdO4kmMMiayZfswTvovN6m0lX79Ech2ie/bTGqhO9soOPKY/+ujaKmWoHxQCIzEdeJ7Xk6vhbPOY5Iee8Hl2oICqAv9fOMxWoEPSAiSP0sAD/9iPzCTSNOdx53znj7P3seEArhfDCiklNBLW+UaWUGrFHKRv3EMl3zLyPgrvfsv+mXPq2KIp5OHmcmqKh+sEi/hhpHjPBOF/nj1TVF7VpjBlvnUqZeWK7LOTxWkgCDG3Pfz9q3pACrKHFJvo7nW9MX7cL1/t2Q2bWeMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CihCD67Ajr4HWh1jNQN1AMCSm5+tlr/T4q1X30ELoh0=;
 b=XTCqVn4eaDOCCgQL3uQjKWQHif6CwLAUAPsXSByNcckCoUru1++km3UvWDyiRZHsgMK1Q4hFhkwCdRD+lw2kl6+A8GZHxEIsqme0tK0h/khgYSwe4Cr/zpCW7NGbZJb07TIpBRqRHLqm9LMFc71MwhhdI7d+KQXxkIIruFpON2Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 08:39:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:39:39 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu: Clarify that TMZ unsupported message is
 due to hardware
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210913083411.11215-1-pmenzel@molgen.mpg.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e9e4e529-b3af-2862-eb38-8e5415108ba4@amd.com>
Date: Mon, 13 Sep 2021 10:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210913083411.11215-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 08:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e57981-0da9-4a53-4134-08d9769205e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39504F5CBB17C3B7D68D497083D99@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9p5bBWoOdbjYtB2Yw+gY+NnllyFh4ARDJi/dzCdM++fz23A/kFxvwQis5jLSRbzVXdEHoJkfhkxTj1Cw1HbtYwk/z7pan0t+QOAC1CoWTjXaikeCxTFW9OTZHsC620j80ytspY5PU1pxkWNwdGBVxw1LdD/19jxWMU/Rr0LGzE4SPClwR04qoSkbIXxr0OmZu+HvuprbjvxbdEjCplhCejsDtaBHUWOZQo2rSMWQpQLmE7BniSN61mzFD5DHwH+37PUTiusyF6kL6xrlWRrfN9RIOoUlKBRBkDcvkqFYrM1OUa10ivWyXLk7dKfaRNTrU9JT3TQunFjm7d6ZfrhZTF+xl7bnH/pMR3FnpRlBP25jtIWRykDnsNLAfiMLysr8nSm5xYTLi5lr67V3yxf6UDomqsIeK3iFP1RpIMO8p2xj0+e+QeRYw9yobdE0yH84WtWYqXHN/QXpttFY2YNI1KKcgbknxGwMWzPlhzzpVLGe1ZoEjoBqopai8g2srGWfLe/cbI1Hc6FVpQ6XynmHReQTl8TKCWDvA822igKtE39tXppIqnW5/UFYxgMS5BicP270fKJWTF+e1WeytCPztzCnAV67DeutYFVaW01Gichu7q615MQFaq/Zojg4mIrS1Ovj8NSQN4Khvdu8Z66x5pv17KoduQMaS3X8W1H/ReeC1XSFmmBvnMJosPkIOovKtaTa9xdLYHIqlCIYSijNBEBhqSd4zk9eVEDb5yd2Zun7VHWyRRoyd2UrEXtk+P9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(83380400001)(15650500001)(38100700002)(16576012)(66556008)(6666004)(31696002)(478600001)(26005)(66476007)(8676002)(110136005)(956004)(316002)(2906002)(4326008)(186003)(86362001)(6486002)(8936002)(31686004)(66946007)(5660300002)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW82bnl4dVoyZFdXVnV1b0pGZVBoRlZtbzFHMXJ6LzFOMXJwd2lsMDNkT2dS?=
 =?utf-8?B?SEdpQzFDT3NYVTVKcTc0L0owR1JIWHd3MEFoY0RsaHVRQ1F2SExmUjlvcm5I?=
 =?utf-8?B?VU9NbUR1dkhxbVMxK1F2NDhOSDllc3ozSTJMd3V5OU8xQ2VFd0plaTNSRHVP?=
 =?utf-8?B?QWdLV1pRN3BDempUZWhzWFZuUmZuK1htYXVMVVJTU3dtVkNGMDJ6ZEZ1bWJv?=
 =?utf-8?B?RDIrMDZrakpmYmZ6c1FLa3Zkam14Wm5hS2ZKcUVoYTNLeTh5UVJIZmpORnFU?=
 =?utf-8?B?cXR5TjFGbG5IU1RpQkVkZkJlK2VqL2dxKyt0bzhBMjdaVFRpV0dUcVVDWFFZ?=
 =?utf-8?B?eXlOaVQ2eGt5QkRDTkliMStqRHpiSVNCQ2t3M3RJeTF0R3F1QmJJQlhwTC9r?=
 =?utf-8?B?WXdwTUdnQVRiUXFtZW9iOStETDJXek1wdHNjaDIvc3lIRXlWUzRqYi9Kc0pY?=
 =?utf-8?B?T1BIMjBwb3JLWWdOUHZ0UUpDZDZJVGhsMlFxc1FTMUFVeVU2R0txMDNPVlo4?=
 =?utf-8?B?NU5KYTZ3MThQQ0dxTGxreGIwbzFaQVRKc0VwZ1lmbDVIa0ZQa0t5S0xlL2oz?=
 =?utf-8?B?Q0liK0thL09RbVdDL3NMS1ROWWQxaWtSSFpzZWF4NVRZNHlpbHVZd0pMTnpY?=
 =?utf-8?B?Z3JKaWtiMlhtcW9TVDhnNElVODc3TElzdzdaZGlaYWRtWnFUbUE2RllHL3g3?=
 =?utf-8?B?NTdDWUtzT2Y4bm44S0xQTWpqZHBjN3QwVXFLK3IzUHVjamdVcmZkcTFjMVNI?=
 =?utf-8?B?d0g4UWJRNGV1bkVpR3FkZkJxM3ptUEI0anZwejZtc2M1eXZlVEZZNFE2d2FK?=
 =?utf-8?B?Z0ZpWlpHQkg5Y1BmVllHNGhZMnR3YmtXdjRBMDBYYnExaWJ1akp5R2FpZFk0?=
 =?utf-8?B?Q2JDTEtkaURINEo1OXlxaklxNkpKR0dMK0xCTSsyWXZ3K3Fwb1E0Q0VhRjBE?=
 =?utf-8?B?NjJFYWZtNnRpRDZZZFczb2VJNy9YUmJZc0ZYMTdCM29WckFFTVVxYnpLYkZk?=
 =?utf-8?B?aERQdjU4a2FiY3QvK2xDbHZickMrZ3NZUXF5K3VQSk1pdWhLdjRVNnU0WnZU?=
 =?utf-8?B?UW10UHNtbzZEeE93SUswOGtnaVdkTHpjelVSdG9VcWIySG9nb2s5Nm1mN1FJ?=
 =?utf-8?B?RlUya2hqUTN6QURBazlBaklqd2V4bEwrYnVSK1FmeTZSNTZhTmJkY0ZrMUlk?=
 =?utf-8?B?RkZmamo5VGFvTXBPc3lCald1eVhpT1VMMWxJRVVEMnlpbHYzV2l1Z21NTTBN?=
 =?utf-8?B?TUZDZTV5ZE13SVZlV0VPSEo5TXE4MFZRRWRpOFlUc1ZaUXlpYk5xWjVjMHV2?=
 =?utf-8?B?UUZMSkwzbkJMd1VDWG10c3RNOG4rU2QrUkE3dWYvTDNKbENMdHBYVkJFS1RQ?=
 =?utf-8?B?SUtYem9FSUN1bVJFM2pmaUh3dHhSNW1Ld2VwZk1PTUNZZ2RraHV6dWY2eHYz?=
 =?utf-8?B?OVRjTkw5TEV5RXlNZGpNZVl6OE9qZitkZlVzeDI5TGk3TWdqNkRPeUFyMGVR?=
 =?utf-8?B?ZUszU2xHamNoTE9YWmE0N01lWHJlOHl6WmFnWHYzN2YxaksyaUVrcWh5cEUz?=
 =?utf-8?B?cWtVVVc2SFhEYnYrYkFwSGxRODdNeElkUjZ3U2NBdlVLRXlGL0E3cEVaUTVX?=
 =?utf-8?B?NUhQUHlnZVllcnZvcVpXWmRMK3RjSVdZYy92eXZreUVNU2pIajFFbjhYaHhJ?=
 =?utf-8?B?dEpXcDIvV29kR1pnSmYyaWtDU3NaaElKRUtrdWg2TnpXQXBuV0hMNXgzTjA0?=
 =?utf-8?Q?1xF7OewvsonINhGo1Kl3Exb+by/r32QV5o0301Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e57981-0da9-4a53-4134-08d9769205e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:39:38.8097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7kiBcJPDxXflfQVM+Wuni1vYY6zvTUFFi7dW9LreUYzQZkuoDGV6Zt7UfSG8Gq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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

Am 13.09.21 um 10:34 schrieb Paul Menzel:
> The warning
>
>      amdgpu 0000:05:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
>
> leaves the reader wondering, if anything can be done about it. As it’s
> unsupported in the hardware, and nothing can be done about, mention that
> in the log message.
>
>      amdgpu 0000:05:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported by hardware

I think we should just completely remove the message instead.

Christian.

>
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index c7797eac83c3..c4c56c57b0c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -599,7 +599,7 @@ void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
>   	default:
>   		adev->gmc.tmz_enabled = false;
>   		dev_warn(adev->dev,
> -			 "Trusted Memory Zone (TMZ) feature not supported\n");
> +			 "Trusted Memory Zone (TMZ) feature not supported by hardware\n");
>   		break;
>   	}
>   }

