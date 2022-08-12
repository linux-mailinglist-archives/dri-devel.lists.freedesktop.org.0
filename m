Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDBD591678
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 22:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D1810FCEE;
	Fri, 12 Aug 2022 20:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DC10F44F;
 Fri, 12 Aug 2022 20:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr21ngzZFynwXCUpBYUN3SfMduiiZjP7xN4xYP4A1H6rlPl0feJCbW6oa6d15c/EA6fxilR9WbHvGBZZG6ug4TH75ACCN1o2ltP8104rTAp02hb1PtWuLCQROcUs8ujQZaFu5RfeEX7cGghw+kdSX4PJDwuyHn8b9d1vJh/hVjDStkqTRUocTVtADpLbcwtumGM9eS9YB9qtpylrCrKVRYaQe4wQx8ZEok3yxVsiFkh4x1nv3QqStSy/7bx+2hliHaYisZD45NysYfI/kqthi1cBD3X0PSi6W1pdFjPEZNiziN+98xN3L3KkiBuHkO9nvznYd931OBb4XUYgUzvYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2XjYAmJ6gxQnpRA5WG9d/BaXg53cbHcv/8jWK6d71w=;
 b=GioDkvid6FXNPC5fYTI8aqBIWS0WEfY2TjFiO1arVUFoUfSEdUpSCxubKkXpCQwS7lpfq5a0YximZ3lC1ZsqY3TS8IP61JqJFuIzntAatgsn2iVKAy4z4X6rERLgooRW1YdOU8j8ckkdQPLYzYwUgxqXylLimjcFmkY9eLEPqs/Z8WI3c3DdwE067qpnTIFF9fi0YRInB0Jx2vbZaladGOh2V8F2YU2yTlKiOdlxdowLCUMShjdFoC+mKDAHc79YjuZubfqg7kgFM6Zw3x5+fuzuVjpMY32WbNQlH0scBGj+mf1FDsXa1nUdcsqBnWXUeM+Jq3UwdspvqsksBNoRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2XjYAmJ6gxQnpRA5WG9d/BaXg53cbHcv/8jWK6d71w=;
 b=tWm6FUSBq5cuQuOFC/IOzZKZ0wdfmi3M68iBeVT0ZFYoZQ3Ht+rQJTSPgNB+CNSQk6JjgM/Cfuoirf+oCrGQAvuQlEN7BE6y5hFtRbwNLLoStcm4r2W91GK3KWmbSkRnhj7DM9bs4iIbLOk17UgmOhm1V+ThjT1cwVgucbBDkG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN6PR1201MB0004.namprd12.prod.outlook.com (2603:10b6:404:ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 20:54:05 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 20:54:05 +0000
Message-ID: <5256fc4b-437b-f7fb-55b6-abab091e0182@amd.com>
Date: Fri, 12 Aug 2022 16:54:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Selecting CPUs for queuing work on
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
References: <82233e68-106f-39e9-b20d-7794eb7a8933@amd.com>
 <Yva4g3V2jAP0NKcY@slm.duckdns.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <Yva4g3V2jAP0NKcY@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:610:cc::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8447ac8d-d800-4b71-0db8-08da7ca4cb85
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iigkQR9d9Le/HZnI2iw/0Hl4m0mlFMI0CJvVOkJp55Qwj5WhbVJXO3w2fdZWEfKREyR8lpgzmvmuwerk6eiPY11P1zDvZmfJDDQGfRrwa2wNo4/mgI3k0rM9aSLM1AKqj0EsykSilbrclcpBFMxQuzGixnaCHHFMD/DpbGIrrYi6Y77qMmfJM5l//nRBm+IX1TLs71d4RuM4qZL0A679VYSSRlUPFb7q9WgUAITrpTRmEoqYQ67Tn7VIiizxBU2nCXP8jZSLa3j+GoTVkSGvrn2lvfKzI27hjhEH+BoX0VPAq+e1yrW7obsUOvXgTNUZ1HZivc6eijCMRIo2DTnuWmfDt1GiL+X5vFgEkHDm/MGS18KfZC8m9LjTctGpBxZfKmcXvc2N/rXLk0vfE1Atq/c3Vf9HsPk2IDZxVoNJqXWGHT4Ib6WKyGv4yXAW/AHLWKt0dCjMRwFTPfo/id39ABTY/dmocdIp7VEtUmReqHAinR0Q/V/tlKlOqtK7gLqCEu5GKw4QT1HbRCS8iGS6FT9VT0yg9nOamqSiC8g2w0oPIceklEDooj8wonoBJndbdY0EtJY50DDo0yj5NsbWQlL+vmTD0G7ISkHJ91u1DGvYXk/cOasiKzYaDextgwkxS5Wjk3vvljJWht1rpOYhe2THXY5LicowClj+mnVOKSWuk0IFptwHaJYGUbcz4BW/XU8VTlhHl3gRIf05yH7q0rW2wFE8g8Xh6olQp+7KoCIO7Ef2BpfilcMzd25USajIkfYaQTh2Cl+4xyEh9s/hT/lXi40kmKpdv4EoVk9o/lQsZpVOzbQzJ+W9RIIhmY+xEH/DdN8Ik7UPoikFnHrTg5XMZ05vNe94iDbCnFA0mIgwzoyx5A2eMsnlzyh9hmg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(66476007)(6916009)(316002)(54906003)(66556008)(4326008)(66946007)(8676002)(8936002)(44832011)(2906002)(38100700002)(5660300002)(186003)(86362001)(31696002)(41300700001)(6486002)(36756003)(478600001)(966005)(6506007)(36916002)(26005)(83380400001)(6512007)(53546011)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExkSmpCV2NBOFdYRFhQaVJGQnpRRWQvcjB3NkpqMDgzLytsMGZOZWx6MjJM?=
 =?utf-8?B?THpuK3phZC9ZMkRZN0QrdzhJZ2xqYVlmZkUrMkdpZExMa2hPVUNLT3lHeGQ4?=
 =?utf-8?B?SDl4VkdSS0lqenIvYkhrRGtVTTlxSis1cVVSb2N5QnhpYk9HRFZpaGdaM0k4?=
 =?utf-8?B?SVlzOW9aWjlUWmVMYVhGSkxXUkRpdEFjaVdUQkp2ZW5lZXVGMHNHUW9xK2VS?=
 =?utf-8?B?WnZUSk8rbWlFOGhhZUdpeXY0dFg1VnJjaGdoWkVZekt3VFdmazUyWUVqYWZm?=
 =?utf-8?B?UlUxdjdYOXFaRmdjVXVsdWx5ZXN0V0IrcUlJV3ZYMEpNdkhVY1BReUxOaHhp?=
 =?utf-8?B?OW5ic05wNk05ZWtJVUlhQjQvRkVOcm5STjhrZGRDeEY3aTAxeVM1djBVOEVm?=
 =?utf-8?B?N0JlQXVUVFRVOHNvV2xENWt4aVJwR21FYTl0Uml1TW15R1BpRXV0YmFvalVR?=
 =?utf-8?B?Q3pFUEIwN0FqL1p6Q1VkTUpBV09ZSWJ3MEY4eE41YlNSai9qRi8rSjVqOXJk?=
 =?utf-8?B?TGxIcjNSbUwreHRhb0pScFo3bVhjOWVlUVVSb3dPaWRRM0pMNTk3ak9PZFFt?=
 =?utf-8?B?N0RHWnJGcGRCRlZPaWpNcUxqM3ozTm9ERUhZcTFlaEJnbEpXRmxoRGR5bmpS?=
 =?utf-8?B?N3g1TFo4QnZYeUkvYlZQVGRDaWZwVzlWTDV1SUtMN3ovSmhjYWN3eVl1ZXJC?=
 =?utf-8?B?dm1aV2xjVnJBSXN0a290c2ZzM1ZvbXFlOEd3LzBIUXE3QjljaFBkQ1dOZ2Q2?=
 =?utf-8?B?ejZNeVlRK2RCam9JTG5JY3g5dDN1c3lHMFhZdWNwTFdKQ3RONGFvYzAzT2pw?=
 =?utf-8?B?T2E1Z2RNNm0wQmVEZVVPV1pvcmxmZ1RTUjVQU2RQUm4rQkgvVXM4RFBhOFNC?=
 =?utf-8?B?cUVXOS9peUU4ZzE5Vks2QVBHaFZBM091TmQ0eFVLbTZ5aS9KUFU4WnVsUDBq?=
 =?utf-8?B?OVVQSXNsUHY2d1Z3RzBnU21BV1hjZm5jMzNPK1llYUJMYUR1Ny9ySFhLK09P?=
 =?utf-8?B?SVlTUGhpZmRqK0NZc2kvM3JGdEVucUF5S3FocWhiQWVZWlFNUnV0RlNnYlha?=
 =?utf-8?B?V1owMzBuMnNoUWVINUp6NzZYd0Q1aEgzOTl3UWhiV1RCN3gzcGw3dUQ2VEFS?=
 =?utf-8?B?NGRqaUxiWEhGU2FzTFh4czFvenE2SE9EeTFJWldXdDJMRjVYb2JwdkNQanFo?=
 =?utf-8?B?L3VOcStlWjNGRE5Qbjc3ajl1UUQzeC9TUVFZd2Vwa3ZtTGtMdFNQeVlwcCs3?=
 =?utf-8?B?R0l4NTVrRlJ4blhsM0J2UmEzR2NGV3hadXNsMnRKVlZTSElMV2x2emdrbFFG?=
 =?utf-8?B?R3kzSVlZMU9GZGhVc0plKzJ6anhFTWpVNTd4MG05Y25mOU5JZWQ0aEx3UDFr?=
 =?utf-8?B?MkRtdlozTlFPYjNqVnRrZ0FodWpOcktDTkJHNmsvL0NWdy9wSHBnKzlhK1NR?=
 =?utf-8?B?bEZtbVZldmkwWGNCaFNMR1ppb2k2a2tzUXc0R0xMeW1oVGlDZUJ2WmJVT0hi?=
 =?utf-8?B?aGNiYWVZdlBIWTBNQmhjd245RHhWczVpekVkTlNqc2M1OFQ1aWRhc012N3RL?=
 =?utf-8?B?dGUweVJSQXg1VEJpeHVqVVVNWnRENkRUQzI2THRYRWxsNE1TR2hyUWdSb3k1?=
 =?utf-8?B?c1Bqd2w2dE52bG1QNjNSbDdNV0NSY1lQVFhhMktuZzd6ODJZeHNQcFZrRGF4?=
 =?utf-8?B?WGVvK3BIQVNsNkM4bWtJNk1KazQxY0ljNXAvdXM1MzRnMTdXRHFCb2U0ZW8x?=
 =?utf-8?B?MkRmcXYzQnJkOHQ2Nk15ZmRMZzFqSHhNQU9RK1ZKcVhvcmJ2c2E2V0s3VUlS?=
 =?utf-8?B?QkF4Wm96L2RJTnUvd0VpWVBpUTFCdzhpdExBbzM2TUxsamE2NE5GQktjdnhS?=
 =?utf-8?B?YXZvVzYyd3VLNWN4NmM1UUZJV0VGUEJ0QzNKZkdsdUxqeWFQY0FqUTUwZlJp?=
 =?utf-8?B?OWJZbld0RlFSM1p1Yjh5WWVEQWZPbWRkYmx3NzNKRkhoeEt6aTk4dHoyVlZr?=
 =?utf-8?B?NmlxOGJIbjFGQ1BFMVRlbWdVQ3UvanlNOUxaLzFZcEFuRXN6M09pYTc0MDVK?=
 =?utf-8?B?UHo1NkE4WTJxWFV2LzFXUmxCK0kyVnNuZEJrR3ZURzBhdkc3S2tYb08zUGg4?=
 =?utf-8?Q?j3A/aTxpqog9d6sythhZT2KXC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8447ac8d-d800-4b71-0db8-08da7ca4cb85
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 20:54:05.8259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiF9Td4Opd/fDWdP9xi5rPL55gGPgLoF57Jb4rS63Wdculai93PaSvrMFLfcJQkHcO5DXobqYCFFrE1rYVNedw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0004
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
Cc: Philip Yang <Philip.Yang@amd.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-12 16:30, Tejun Heo wrote:
> On Fri, Aug 12, 2022 at 04:26:47PM -0400, Felix Kuehling wrote:
>> Hi workqueue maintainers,
>>
>> In the KFD (amdgpu) driver we found a need to schedule bottom half interrupt
>> handlers on CPU cores different from the one where the top-half interrupt
>> handler runs to avoid the interrupt handler stalling the bottom half in
>> extreme scenarios. See my latest patch that tries to use a different
>> hyperthread on the same CPU core, or falls back to a different core in the
>> same NUMA node if that fails:
>> https://lore.kernel.org/all/20220811190433.1213179-1-Felix.Kuehling@amd.com/
>>
>> Dave pointed out that the driver may not be the best place to implement such
>> logic and suggested that we should have an abstraction, maybe in the
>> workqueue code. Do you feel this is something that could or should be
>> provided by the core workqueue code? Or maybe some other place?
> I'm not necessarily against it. I guess it can be a flag on an unbound wq.
> Do the interrupts move across different CPUs tho? ie. why does this need to
> be a dynamic decision?
In principle, I think IRQ routing to CPUs can change dynamically with 
irqbalance.

If this were a flag, would there be a way to ensure all work queued to 
the same workqueue from the same CPU, or maybe all work associated with 
a work_struct always goes to the same CPU? One of the reasons for my 
latest patch was to get more predictable scheduling of the work to cores 
that are specifically reserved for interrupt handling by the system 
admin. This minimizes CPU scheduling noise that can compound to cause 
real performance issues in large scale distributed applications.

What we need is kind of the opposite of WQ_UNBOUND. As I understand it, 
WQ_UNBOUND can schedule anywhere to maximize concurrency. What we need 
is to schedule to very specific, predictable CPUs. We only have one work 
item per GPU that processes all the interrupts in order, so we don't 
need the concurrency of WQ_UNBOUND.

Regards,
   Felix


>
> Thanks.
>
