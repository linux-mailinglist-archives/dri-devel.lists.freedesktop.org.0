Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72331B613
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AB26E131;
	Mon, 15 Feb 2021 08:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EF26E131
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPE4C+J/9YNlENgEAirRYWmkJbkz5BU8OGdsCdJ68Y1x2TMeZINYIU0U/0cySxh8CXB3CEycFcjZbyVKRsLXDBwoyXHBO+BmP9Qt1AeqorjBWnQBl208aRZfk6JcJ3y3VrgmseijPi92yPLEv1M/4A5YG4plFf6AfDayIGDlt+RLgiosLUBrde4lfkiC1WSc/bFU+P2dP9Js4sJS0L5JQ7yURyfgWunXE7GBxpFlOAmMOd711qhI6wdtRYocoEA551YqmyTQsmYAbtoEC8y/n5GA8t6SoPTtpmzrB9Npc5SWFmx24tPXKjCkkisl5Zw6/Wi6S48QdihqhbIY94xfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/BQLYL4uVTeviBGAjcGjIyZIdXI3FutVY3H7syj9jI=;
 b=c6DTzZnoXz3Sn0DK65w6M0vdGR5jGTb0O8ODG7jkeiTAZGUKWAhCc/k9KciR8ZaFfO7XjDagB+MTytdj05CDh2236bVPI7/Fz2Evm8IIHbqI8JotMMKXeBOe++07ttsjYMHopGaKujeKgyHQqLPOYNX8fplKZbdNRtrxS7i7P+IKrHaF4w+htOAE4Hsd0WH7X2r6MklUSf71f+EjRtRT2QBAjSjPwihNyRDsaRXX2JqQ4QqBBZ/7s2cjTfTgEMVZIrDe1NfhwTDTRuP99AmHVLaxc2YBAFcCMAJyJ4CyUlYwyyxBITOFapSE051ihrngBpXUy7ahjKL10ntYb9keiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/BQLYL4uVTeviBGAjcGjIyZIdXI3FutVY3H7syj9jI=;
 b=FV3qtAO3V2xMkpUlG8wa4gTB5GGPD+nP16pt/bUPEkQBX8xBFqNHm/2vV8mZwzvU0oNsasjB4pj3JWKNT37lDLl2+GVMRGsY0rh+ZWPehyUncVr7EMmPuq6qI9/h0qKoOkSKbSBy0Z3AVCQ3NewLtljfEYbHMvV2jd9kKoTrcck=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 08:58:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 08:58:14 +0000
To: linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: DMA-buf and uncached system memory
Message-ID: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
Date: Mon, 15 Feb 2021 09:58:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e074:3b37:7224:b69f]
X-ClientProxiedBy: AM4PR0302CA0004.eurprd03.prod.outlook.com
 (2603:10a6:205:2::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e074:3b37:7224:b69f]
 (2a02:908:1252:fb60:e074:3b37:7224:b69f) by
 AM4PR0302CA0004.eurprd03.prod.outlook.com (2603:10a6:205:2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Mon, 15 Feb 2021 08:58:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c468d075-c780-4af9-2843-08d8d18fd393
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208FBFE133EB0E475D4BDB383889@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4P+aZ7r5rGSjLjn4mpGVUh7Lh3t2/Hu6NPU8RBBsjEFczduFVjYTW1M9NHEC7d9eXPbmxXPLP35+p222QBk6uydLvVCchFr5j9lNUnd2OEQAPjXkk+odGYrx5fZIyFx0WkBBKxYaq2lPBfCU0ELUvMQT6CF0uGmJSaqMSrJ0EZXo7gMuUYrKNuGFOFNE7BNBcIT/6l37ahFI5LWUsone/OJOe7LanaYdCjKaNiM5USBr1E6QIGx0dB4PLgzxBZCI6vSg9EpUM4DNjPnF9pG6uzZcL3mvmBVbCtr6E3HKiW8gTNixNHzthjSSiYzODxycHr3UtSaDcTWVmSRB0vQa75JLHI6RF8UvE1WXZ4Qd8baHd/kZpdACDe2xCCMb8JJk2L45h/mo1l7y/GL/Ow3khtjsBRRBy5MHipmYiEwSNVNldia0YF0GMDwpnp72Gp50Od0ieVHngOn8licDwAOHKu6eEg6c8wvaXiUml/JqtkYtA56CzAl4YveE0GtBx1d9d9rIByZvhhJFRNk5YdUE4wlvKt64Ykx/JTeVXsvrDSIezzhbcpIYRwvoDLx053zVNLFAYAw6K1y4KNP0YtlrFl7or4yOeO0QQEjGFj4RzzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(31686004)(52116002)(8936002)(4744005)(86362001)(110136005)(6486002)(5660300002)(316002)(31696002)(8676002)(478600001)(4326008)(36756003)(66556008)(2616005)(66946007)(66476007)(6666004)(83380400001)(54906003)(186003)(16526019)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cll0aFB5NHFDRUt4TytRVlNoWGFOb0FaeUFVVmhsVXNkWmw1bzhuRnhyNWRh?=
 =?utf-8?B?NTNBdTE3YnZQbkxsTlNWNTZBNWFyeXJ2UHpZSGtWTWg0OHVzVXlzZGpqUC85?=
 =?utf-8?B?Z1BYcXN4czVpRmcxUXplV3FMcm1DQ2thZGlac3g4cFd3SEVJQ005WU5OUkxW?=
 =?utf-8?B?NSt6cHEycUFNbHA1Qkw4OTV3d1Z3LzVDY1dtUnJ6NFVPNXhPK0FwTXBGOS9h?=
 =?utf-8?B?YXgxNk1tdjU1TTFCb2NVbFovSHROUUlaNlVydXJPZFFteVRKcGd3Tm5ncnQ0?=
 =?utf-8?B?R3ZzTFNXVkgxakhGM0w4TTN3UVRIQy9nMkRpSkNlQWhGUXhtTkszRnI2dTdU?=
 =?utf-8?B?bU9xbkthS0wyOXJZQmp5Smx4NXowNmpTalI5aUs3Zml0NjNPR09udGhIK2t6?=
 =?utf-8?B?cngxdFNnQk9jVVVaSmFFSTEwdGFLK0RPMUNZZjk1eTJtWlEvYk5yYWZjSEUx?=
 =?utf-8?B?Q2tsRyt1NXRSL2FsUGhjRUNEUUw1b2w2WUxJSlpHTzNEakNkbUx1ZDNtMG5Y?=
 =?utf-8?B?ekw2bmJtTzRpUFpmVXN1cEZDWmtkWDIyVGIySEYzWXBrZzRxbTc4VmQyRWh5?=
 =?utf-8?B?aVo4TEg0YmpSYmVkTDlTaGRpa2x3dzJ4Y0VjdDVHWGdJQUpNNHhUMmV6dGJw?=
 =?utf-8?B?R0dDM3ZHY0EvK1lkSHI5UHhlVk9oamUxNFNDWmwyQnFTZ2poUEtXTy9GZDV2?=
 =?utf-8?B?ZWZnM25xdWp0YzhaaFAzSDhRT2xORHJsMStkWkhxTjdobTh4azdGaUtJMXd5?=
 =?utf-8?B?a0poYU51eXllZkU0V1pGSzN6T3dCZklqOEZIc1RYMlNGTzk5Q25MK2hCamhh?=
 =?utf-8?B?eldIREZBNDVnZlNNWkpkckVBSjF6VERJQnJUTkp2RVZnUi9SQ1Npc2FtVVBi?=
 =?utf-8?B?dHY0cU5HVkp1clFWVFhyWXExZnBvcmdNcDNYZlhqZzBSTVBRVSt5U2xJdU9J?=
 =?utf-8?B?T0hEa3VyM0szSkIwVEk2ODE4eWRpUCtjOU9RWTNLckdDRXdFdTJYWkRiNURu?=
 =?utf-8?B?T3BoUDdVTnZReUVvSUgzRHVITWtHU1VFcFlyR2lGajBvZlBqRld4OUpvbVAr?=
 =?utf-8?B?Z2xVQkYwa2VDU2NUem5UUjN2RmVPTEs3b2YrWHh3d0FKblMxa2V6OW90aGYv?=
 =?utf-8?B?TTJyYTdacTRLWGR4QWJqM2NZY0pKMThMeWVEWTd4UTBIMVhBcTVoS2trSk9J?=
 =?utf-8?B?Y2M1cWJNbm8zVk1xWnNmMk04RG5FTmtMem1IVCtZSEpPT3Z3d1kvSVpEMFYw?=
 =?utf-8?B?SWdVcjZwWDNsTXphZHBKc2tyZGFRT1UvaXhjOEFRV3lRcnp3OFJUdmRtR3Mz?=
 =?utf-8?B?eWxuMVRia3BiVHVHR1RpQ1NOM0JsT3c1RnVvdGc2RFdjVFpuZ01NaTBwNENZ?=
 =?utf-8?B?a1RGV2IxSFVkTTdFWU54amZ0MCs1bXJheWIwdmhNZ3lDOE50THkwbVpDSWFT?=
 =?utf-8?B?WmlWQzBmOVpTZ3ZlVVhURnFFemVrL3hkUTd2V0g3TjM1R3dkV1J1RTlLWlJl?=
 =?utf-8?B?S1VTeU1jeHgyYXl2dEFzTDljUXNwYUg1ajM4OVcra0FCWmlIalRLU25nK3I0?=
 =?utf-8?B?NS9hL2FIUElkd2doKzNkU3hMUG5IMUQwRTE3cUU1NGlnMFBsOXpPdzlrUVdQ?=
 =?utf-8?B?Wk13NjhyTEw2RElvV2M1cklhVVFsbG43aHdZWDExU1dkdlZzWjU2amVTMTl5?=
 =?utf-8?B?Q1pvMmNFOCtnb01mYkZscXpoYmVZcnFEbjkrdTFaTWFwcURZVW9JaithWlFn?=
 =?utf-8?B?eVRsUXkyb3IwQWRLQWxyK3BWSW5EL3FWMlhFakhkRmYreDJUVkRXTm11c3Zw?=
 =?utf-8?B?WXZPeTJULytPR1ZEOTdqZVhHR2F0TlpkcXFWSjZya1R1ckpsUEdaMVNWNUFp?=
 =?utf-8?Q?CGPsyfA9JvPXe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c468d075-c780-4af9-2843-08d8d18fd393
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 08:58:14.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIJ4xds2SByyQPvx/AwBuUuqolcjTc2txibnwtFQ5HlfGIMpqxHAt6Cf79ITpRco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

we are currently working an Freesync and direct scan out from system 
memory on AMD APUs in A+A laptops.

On problem we stumbled over is that our display hardware needs to scan 
out from uncached system memory and we currently don't have a way to 
communicate that through DMA-buf.

For our specific use case at hand we are going to implement something 
driver specific, but the question is should we have something more 
generic for this?

After all the system memory access pattern is a PCIe extension and as 
such something generic.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
