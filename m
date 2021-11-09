Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA331449F6B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C59589A88;
	Tue,  9 Nov 2021 00:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3B899D5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEkPs0W4kyum8+x1PXVZxEOANZxMYShaQ1xmZwFpBioJAWeBBnNb17jTMywi5XzUNRCOprwlJnpgVD2KmaUphGNWXqnVmbubAPXseT08cJ+XxbP+XxxijwxwQ1Z8WNjjFuBq9fevhswl67Zr1VqrXMuqfeJ9o+kB++2w23JaWRKPuPhqsoMnNjUIGqsZhrZd7cBMpTiDy8+AB1VRJbGclCyylKJMQ4kKcvO94ijFLVW2E19siMVCA1aqQ7PoSbXQntnh6F+ziT0ZG4f8sRlmjkDEPpmFNIk32ByYjQIoVhNY/kjSiHW0x2K6HSMeugvg3ASbTeQvfc0+z75q5fUeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrMLKBRf0NNMg7i7S1xAAmirADci3T4uohP+SwXY8gE=;
 b=aTyX0gSnR20KOPGbOkbkzHT+T3frPkuEzjpahWEIZg1GUdMkVadfkAxR6ZzXlJrRP1L1VKZ97SCi2LLKYQdUyPNLxJb/f9k6y21Jc7DIAU/jGW8Pz7t6Z53/Rph9ueKhSlIZTuv7mKCSu6TvdQRslmBwi/9TQdR4w9bSketlyS/+1yV4W1gV/TvZCPr2EGhLtoKv+FprPcrE3+3wdT+cInVHGSHH4QZB9nJy7dXtC4uqzCdphwM6yptRJXpztlstyNsMVeO0pD1V2Y22U7YlCW/em7x9Zh17rQ3nU9QO/OxpSvrAMtaBf1cyAOb56TubSmAgIXeqjzqv3qtSDpHvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrMLKBRf0NNMg7i7S1xAAmirADci3T4uohP+SwXY8gE=;
 b=e2oSeiSaSE8hoClcvdRxCBwhCGHwzSWi3gbYQARATDq/ml8Te6xAFLDUCCCE7urr1be8FjHEyaHY610wzyHl7CeVkjV34EEg7pIZ5JS9PI4/zaY7LIOBhm/gf3tGYdg3PcaOpyO+kPHlR6LrFPA5D6jRxQTTCCDracLxwPcTyjN/uUYuv56FhAKEE+W2gt+6IMN5K9RUuz+ojPhhK332+HqrVVm7B0/Lpdq/Ay92Z8I5lxFTDGHhdBzHWm9JA4bSwQzjA8P8g8ioyMSZTQREHkPRscqxpzjeiPiSNSULUT0KL6uC1YOTFWI9NNS0sfQ/wGLrYsbH0eCs0hWTIO0ecA==
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 by BYAPR12MB2869.namprd12.prod.outlook.com (2603:10b6:a03:132::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 00:21:06 +0000
Received: from BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::6cff:d2f5:6cd:c892]) by BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::6cff:d2f5:6cd:c892%4]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:21:05 +0000
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
To: Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210905122742.86029-1-daniels@collabora.com>
 <20210908123406.33ced2d6@eldfell>
 <a_9frwKbA7AcZbDet-XMAADdlHbhTczh-d1o5rP2HQkkLXvor5XWt51MDaHvpgo_Sox1e3tt7xmfHlMyAI7Na6wcqcgQIPrbtqAblnM8mQ0=@emersion.fr>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <84e4620c-7a37-b5ff-2c1d-45e73a01fea9@nvidia.com>
Date: Mon, 8 Nov 2021 16:21:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a_9frwKbA7AcZbDet-XMAADdlHbhTczh-d1o5rP2HQkkLXvor5XWt51MDaHvpgo_Sox1e3tt7xmfHlMyAI7Na6wcqcgQIPrbtqAblnM8mQ0=@emersion.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To BYAPR12MB2935.namprd12.prod.outlook.com
 (2603:10b6:a03:131::12)
MIME-Version: 1.0
Received: from [10.112.245.179] (216.228.112.22) by
 SJ0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:a03:331::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend
 Transport; Tue, 9 Nov 2021 00:21:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833a3a9a-9d20-4bf9-7f3d-08d9a316d1f8
X-MS-TrafficTypeDiagnostic: BYAPR12MB2869:
X-Microsoft-Antispam-PRVS: <BYAPR12MB28691EAACAF521D1B4A017C6DE929@BYAPR12MB2869.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hGpiiz/d8nrAGpMePFBg06qM7m3CMyAf3p97QIMfjOWHN9KsFutQuP9PHaiZPXJTqSetp2FPCQDuEYbHd8K4hUW4rSfviygCPOdFSXtCBc7GYiQD7/UJ7tNIk2+4bHiuui9lRdu/ftmrITjto7+Bxfz0GYsBak5FDtMQEWvORc6+KHLsteyh8WTYgykOwZR1huwMRWlIaINviL1R55oTw8cMMLi7uJvZVlj4sPqJLfY7oZU/hyA1QFdjrMdv/LGrhYtFQTdbivSFvWPfNTpVECZ/MdJvopE4CWz6CZSHzOmomjjrDCQ1JQDRfaqyGCMg7MPAWSR2ryU4xZBZ/OMulHQ6+9KmXQE34svkpUnf20XsWDN+GOKEgTEnZhYcuh0OIV/thxnL506wXKXnN3mHIiQwUqEaPL730TqP5rUboOesZtUwad+DRtqwJrT0WfOhRy9H8pvrlzy0VcYsrEKE2lveOps9cz5kAMG181irtHDoTmyJSLQVleafbTnYH+xYrxuVAv7AsolBbog8g0EJ9bsJzFjwcXDpOW8gEfvEc+LYjjLJh+l1m7sG8Ku7twWD1JiDaRsIB9d+Yg83TXoGWkbJkqx5s5uI/+Cjzze5nsp1POQOTikL+3r+Z4ovZhH2K4O9lX5WZycJ0l0Mqjbja+sbFhm8DyXmee/3rLBVLFKXaIhYhUnEg1UUlDK3ljms3E/9TZr5R0o9/D4Qk+9a/ly0N58wLgD95uy8N9e05s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2935.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(31696002)(110136005)(54906003)(83380400001)(38100700002)(508600001)(4326008)(53546011)(956004)(316002)(186003)(16576012)(8936002)(8676002)(36756003)(6486002)(2616005)(2906002)(66476007)(66556008)(26005)(66946007)(5660300002)(966005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3ZacUtqVjBOWlAzMHJsS0Qvb0MxN1VsSG55OXg1d1N6ZmlnZjlCZ0dwUU1B?=
 =?utf-8?B?N2s5NDBicWgraXVUdEpqT3NkYU5rMkF6Q3dYYTB5Vmc4Vm1QZEJhZUJ4dktB?=
 =?utf-8?B?YzVtREpBeHdZWEkxZUI3KzRpMDZmWXVwM0VSa0F3Z1U3QVQ2VVVLTi9jTnVm?=
 =?utf-8?B?YVZla0lKZUJDaXQ2RFIxdUtPSWgzNHlOQllQR2tyb0JvMXcrVDh5cVVmRWxn?=
 =?utf-8?B?WVVhRWdQVi8wM1kycE1RQ1lXU21ybmJhZGIxVjUzalVQUEQzQXhlay9LcVl5?=
 =?utf-8?B?YWNYSEpoYUNyZGNlTGtwL2UxMHRvcWsveW1qQytQZ2RPb2QzMXdCeU92RFZ6?=
 =?utf-8?B?di9oVVlJMHc0ckNIcEphUk5Yc2dpRmwvT3lJUllrdm8veFBVREdJZTU1cnZu?=
 =?utf-8?B?ZFNOTWVaOW8wZUxLQ25CSTErNFJPbi9XalNpMUo0R0J0RmluM2g1WWw5TXI2?=
 =?utf-8?B?Uk5rdVFZbCtuTThEQU9aVURXZ0l4NkhLdWNSaW40Z1BncG9McEFiQzNkaHZP?=
 =?utf-8?B?THJUZ1JnYm1VNlpqWlV0VW1PcTNZdnJWZFJScHd5L0xqMGpuSUQ3cHhUMFZY?=
 =?utf-8?B?YkdHUDMwNFhrcTJTQTdQazV5dFMzUlRwSTdmZnZJK0kyQWlwcitjMGI4b0o3?=
 =?utf-8?B?ZEo0SjNhUzM0ZS9ZM3AwK3pKWEZzYmtMNlA0WGFCOW54ZFpuYmp3cWZRWE9k?=
 =?utf-8?B?NnkzUVNlVU0wL0Y4dnpRanFhVDhnanYzVlViRTVEb1dzVlFZR0pkWmxhUEVE?=
 =?utf-8?B?UjdIL2dOcXpZMWFwN3RjNUlEZG93c04yR2lRWmFycXpYcFNmbVk3b0luVVlI?=
 =?utf-8?B?elRTaEtzRld4MUNJc3VieVFSZWJkNEtBcXNSd2Q3VkU3MWNaSEZtWWNkYzFh?=
 =?utf-8?B?WXVNYlErWHJxUHNERk1WdXgxOWs3bW80aG40MkJXQ3NvVC9vZ3BnaUxxSm85?=
 =?utf-8?B?SUpNSlhYQjJUT2ZnRWRnU0VCNTd6dW5QaFBVeXZzY282U294YitHSWRqUW1t?=
 =?utf-8?B?enhUYjNWRlZkb1UzMTlGcHlNaHFTK210NzZITU1sSC9yWTl2d0g2djZ4blpn?=
 =?utf-8?B?NzZOWU43bkxUQkxyZDNBZ3hWNkJJSC9JTzBqejRpNDV6MFNJZ0JsWG1yWHE2?=
 =?utf-8?B?SVlzcCtoMFRJMStocHBWa2k0d3VGcVhXZjZzazdYdWZpSWNWNzN3ZUlhV1Y3?=
 =?utf-8?B?KzRpYTlpYVVZMHE5a3dNNlFJOWlRSmtjbit3Nk5HMUk3UTk2aUgrWjNRSnVJ?=
 =?utf-8?B?VmR4WTl1QUpHejRYMi8vM2wvY1hraGJtM3Jnc2xjMjZYdkVGUnl2MldBZzBX?=
 =?utf-8?B?R2srSXcwOE9KQ210U213dUlFWlkxcWRieGkyV0ZmRG5QSGRVK24xSS9nNk4z?=
 =?utf-8?B?Z0R3UkNtNDI4M0dhWGZZU2c0SjlHRE5vQTVjcG42d2FwM2Q3U1pnUUg2K2V3?=
 =?utf-8?B?N1E0NEw4eHRsZmxKbzdieDBQZmhrN09ncFVCdStCdUlKR0tva2M3R29VVUN4?=
 =?utf-8?B?WSt1ay8wZ3ZLUVdmUWlXQUhuMVdiQk5QMXdFa1JCYUFncXBocCt6K3RaclEw?=
 =?utf-8?B?TGdxb1RGQ01oU3NsS0V0MzFlTXJBbDlKeHljRmEvUWhlMHZTVlM3ODloYnhz?=
 =?utf-8?B?enZzUXMrVkxuU1N5Ty9Yb2JxVHFVSFY0VmZyekp2OWl2aCsvdjd0RVI0NEpi?=
 =?utf-8?B?QVlTcFpqeVlqUGxaZGpNNzVieWQ3d1YxV2UyaWYra2gxbEpwWjJBYk5CeThk?=
 =?utf-8?B?WEVGcEdScjRyUE54UVJUVDhIbHYyVkJvemFIRmdyVE5udDJNWTR4LzM3Smtp?=
 =?utf-8?B?Q2dPMjROWXhaR3lxOEUwdFR2WjhRKzgxRTh1SXlYLzlEc20wOXA3anp1SFor?=
 =?utf-8?B?UmdGNUpDT1lva3NpT0NBOGhibzErZ2I2SEZVd3dmejk0RUNTLzY2bmVlcGxE?=
 =?utf-8?B?a05iMWhnN0NTSlJiYURWMW9wdzNkK3NxdUZyYUJWeUgvb29jb1MySkJNRzlD?=
 =?utf-8?B?YkFueUN0T2tUWktTOTZiZ3Z4ZHlrck43OWptaFAxek1tekxlUHU1T2dqeUxM?=
 =?utf-8?B?TFNmS3lWcnVYaTZEWDdkQjdQZXZsL3RFam0zTWEzVWN5SHdaMVVESy84RnpS?=
 =?utf-8?B?Q041RmVOOG1XazNRWmFXQkRML0l4bHlnRHdBbURZVnozWGYrajVXUnR2b2dy?=
 =?utf-8?Q?Ww/EbxyeL2X8hPdvSjLHKGg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833a3a9a-9d20-4bf9-7f3d-08d9a316d1f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2935.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:21:05.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCNtxBx65ee32jB5Qm6cCfp7zNTIk5ZzVtOhdgWprO7JL0EYfgly2gWjEGsZZgh5+8jWLKL6IgQPNxLGNll2Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2869
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/8/21 2:44 AM, Simon Ser wrote:
>> stride
>> 	????
> 
> I think what's clear is:
> 
> - Per-plane property
> - In bytes
> - Offset between two consecutive rows
> 
> How that applies to weird YUV formats is the tricky question…
> 
>> Btw. there was a fun argument whether the same modifier value could
>> mean different things on different devices. There were also arguments
>> that a certain modifier could reference additional implicit memory on
>> the device - memory that can only be accessed by very specific devices.
>>
>> I think AMLOGIC_FBC_LAYOUT_SCATTER was one of those.
> 
> A recent exmaple of this is [1].
> 
> [1]: https://patchwork.freedesktop.org/patch/452461/

What was the resolution to that argument?  It took some fiddling to get 
the NV format modifiers to be robust enough that they actually do 
differentiate "identical" layouts that actually mismatch between devices 
(E.g., some of our SoC GPUs interpret layouts differently than our 
discrete GPUs, so that's reflected in the format modifier-building macro 
and hence applications can properly deduce that they can *not* share 
images directly between these devices, but can share between two similar 
discrete GPUs), so I hope the modifier definition allows that. 
Cross-device sharing using tiled formats in machines with multiple 
similar NV GPUs was an important use case for modifiers on our side.

Thanks,
-James
