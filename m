Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925541604B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824726ED26;
	Thu, 23 Sep 2021 13:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273A6ED26
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 13:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX0xHXDAV6NvQkhY7aJMtAlqMPuNXbJ9/mDxr9d+JCrzXepf0OwKmAEnC7vQLsGxn0sauEv8vGs1CYLZYu8O5+dQeT6AZS9ovdLEQ4v/3DwnXCWp25ID2yckwXWQ/55GYUWirt3ultKG2XdtAxPWMPxOdvLcPidpnwJf4UfgHE/ShAnDeXjEPWQzDIGhYiVI2o/4qvgtE84LYsq0ncs7Q7U9+UrbXd3i5V5h4kh2o3+WYitl5DyWNtnuVHGcba27ShvfjBh0w3QH+zgZubVMvbcvdjJzDQ90z1FhBujhW3EQUO55wIhzhAIbqcXvSHDoj7SknpvuZCoHz6T/mcSg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MakcCIrkjrB4zt7Hhtp3/EGgVDRFSmxP+LnN6Sja/xI=;
 b=N0K8TddUrGkOUs7P0Cu6xztDmzgvq2Xwbr00jmTd6fb30mFvxPPen9J4Rn3Yw9l4s/5LmxVLQYw+X5uy0Z8OWoTBeWLvnapHB8oJfBVaItDF/r3AXbWjGL2TDIdiiP51WGXlowrkDDgLm5sDIecWRXNxghe5sqZMvYI9hJIO1FVD430zR6rfXwlsNcccdWFVjs6czGlMW4jeBJiLmZCk3HrSPZrPLhcvjrDQBihcmwLsaG+pluR/99FL/2RpylIOXpXRymPDgxiePXiSBIfVMrhA16lbBrBwih0jFU8tF5EPbYJtAQnZx/x296d7LkeHbNt3LYpwrt49jY0fqk3pHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MakcCIrkjrB4zt7Hhtp3/EGgVDRFSmxP+LnN6Sja/xI=;
 b=yihGXFJnhz/6kGeACT5m0H+yPfYXB1MFLQ3QcsyGQRwyTWIWRj22K2OFIXaWCAb5Gy3d/0y+AR+lM3Y0otX8ErZFPOEJpsa9aOMJD0v33nIH6JKVrz07UI3crJ3VvyauIn0d92T5Jrx8e+LXZCcXJnQ8lhcwuxe9ZJsd2vR4Ro4=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6560.namprd05.prod.outlook.com (2603:10b6:208:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7; Thu, 23 Sep
 2021 13:54:00 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::90e1:1a8:297e:a0be]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::90e1:1a8:297e:a0be%7]) with mapi id 15.20.4566.007; Thu, 23 Sep 2021
 13:54:00 +0000
Subject: Re: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
From: Zack Rusin <zackr@vmware.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210917175328.694429-1-zackr@vmware.com>
 <e9848031-39c9-235e-b811-3735bdf89689@amd.com>
 <6F174F23-797F-4106-BE54-E208FA7571B5@vmware.com>
Message-ID: <d78057b6-d577-d908-8b87-baf980bd86fd@vmware.com>
Date: Thu, 23 Sep 2021 09:53:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6F174F23-797F-4106-BE54-E208FA7571B5@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::20) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0225.namprd13.prod.outlook.com (2603:10b6:208:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Thu, 23 Sep 2021 13:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f7469a3-83e8-4933-260a-08d97e99984e
X-MS-TrafficTypeDiagnostic: MN2PR05MB6560:
X-Microsoft-Antispam-PRVS: <MN2PR05MB65605F452BB710AA079CB239CEA39@MN2PR05MB6560.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4OSZZ4LbIxGYsn6MvThKs5u50um+IZAZB/HciqYoVfp3o5l5B0Ee5vpj1c7KZAmia19G1fBptOPsdJWu+HO3RI2FhYKv+uBLFI0v3VXKAqWCv5JfOIXsmt0NaYFLH1+pGGLd1kJ51V/ffOTUCCRjfJJHEXDr9+9JAWWm7VYGWhP2d1y5qBytKdlFDlKTep01HkBehZ9NTCjTdiEs6V7WJxfbDJEAvW4ZOkftXxMg3WN+s/Fc5mXwy+3ma9kJ7BuGCeuWdodxyB8175si7NYZYl8cVzUy9wAx/2uk26uti00d21T16mv2AgCh1Zjmmy6L2hNcyHF/nmqssV72cWVxSj4C8Fip32Pnsrym2XI9Sao4s95KAHRQdhSYtLkELwUZyL2ZSEX1boTQkKBRFUr1xuU4hQh8o+x/JUtCmztLpXQt8WEnbJvabgVwrh/oDNfsU8nM/4H4lgfZRTqChiaoQMXqbGDmh7n+6/+Djpusx3Pt6pJqwKc39si5NKWU0JKNeXiyFYbgvnVcdYql6w/Eyu13urZ9k20CYOplbHa90b2NcQXMKpliwqjBhj6NXCGLfDL2IMTshRhpvZHpDXaPp6a+zdjweE0xWh28amGTqA6Ux/dWNQf5Evu2Fnx2bKX4gAMfT2GBF4raROxCGis8xrQ3cTBBF5tnVba110o72Z7BtRXAw9+C8U2PqXr9F4Qnko/GEp7OI1QfUP/G8C6Gn0qLfmbLYrzhb6B7Z6KFvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(54906003)(316002)(5660300002)(86362001)(956004)(53546011)(4326008)(8936002)(16576012)(36756003)(6916009)(66574015)(186003)(2906002)(26005)(8676002)(83380400001)(6486002)(38100700002)(66946007)(66556008)(66476007)(31686004)(31696002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFjQVhZRE1tZGw4MzBUQUt5MGRwM25zRk9FcUZvWVZmYWpHbVU1dllmdWts?=
 =?utf-8?B?dTdQOExJam5ZdHljVlZ1b2gycWU4S2o1bHB0My9ZVkdDVUZPUHFqTDF1TFdE?=
 =?utf-8?B?am5CTlM1bytQenB2Y2dnVVlKWi9kc085UTZBYktUTFNZTFg5RWdKUDJvZzd5?=
 =?utf-8?B?ZlFXcm54MkE1RTVvL0pGY2xsRGJhYlhzMGlsT0dERVhxT1JTam53UW9iQXhW?=
 =?utf-8?B?YjYwZWtKSVR6SUxlVU1XTEUrd0c0MDhVNkpNSExmdDJ2K2lOSW9oVHpvVU1a?=
 =?utf-8?B?bXJtVW0yR1h1ZDcreU90VUlUcVhIUGZHeExCR1JuODE3am9Td3h6VHJsVjRN?=
 =?utf-8?B?dCtzMG1KRmY4alVNSnAzWWhKRG1GY2JZd1BxR0dEVmJnYi9SR1gzbXgwRlpm?=
 =?utf-8?B?U1F2Wm9jd3FZZHV2Y05yaG1nYlBXYmo0Y1hmRTBuL3BHK0lVMnNQd3U0QUx3?=
 =?utf-8?B?YmpKajBSRFlyZ3dWd2V6S0NjM0Jndzc1MW9ocFhLNGhub0g3RlNDZ0dWZnUw?=
 =?utf-8?B?U1dwOTVLbzJIVjJydFB1ZVVoR0dGVFFRelJxczFoMDdXVm03Q2NueUV2S0ww?=
 =?utf-8?B?cDY2aXlwOEVodEhxaEQwU0hWS0V4Qi91VWxsRWY1YnltQTFJRHFIVmxVM3RS?=
 =?utf-8?B?b01kTjBhdjFBd2lEWkJQQi9mdXUyK0VaK1NJcUEzc04rNWdGUEFNVVhRSm9E?=
 =?utf-8?B?bmVTaGgvYjY0UHc2OTR4Y24xSWZORkNOVlBhNVhoOU1IMGRvV0dwSy9FcjJn?=
 =?utf-8?B?SUg3ZGhvTFZmMGNoMURzaUdmdUNmZ0xsemQ0bXB2S2pYUFJ1dVVlNmxqRDV5?=
 =?utf-8?B?K2RobHBHTEQ2bTJTb083dS9iejJNa0U4OWQ0bmJYS3A3YTFrMzBlYXc4QXhF?=
 =?utf-8?B?dDNHMGJwRnExM0tSeURIV3lGZ01KdlZ5Z05VVWp0bDdtZXVIUW5UdSsrV29I?=
 =?utf-8?B?WFlrL2tWWjA2ZWg1bHRLWHM0RDI4cXdjZ3hHQzNZK0M0bmJqcGR2OWZOS3lK?=
 =?utf-8?B?ckdBblZIRHB1TWNVQWxwRm03bXhsSXY0UnE3bWsrUXpCWjRERzJ2MlQ1RlZV?=
 =?utf-8?B?WS9sZDZYYml6cUZSdGJZOCtVSzh5emtOdHhWcVZLa0Rib0V4clo0dzE3T2Ns?=
 =?utf-8?B?TzlKZE1oaHdBYXJOeHJ5ck1Mb3Y2S0FRS2pydzlyYmtqblMzS1l2cjhTaGJY?=
 =?utf-8?B?WUtxQURqYUxxRzFHV0doQ2JELzRRWkpYcC9Zc0dLd0NkQnlCQWo4aWFGdEVI?=
 =?utf-8?B?b2tqWDdTUWY5VXNZMTVkbVRrbjFhOEh4M0JLWC9vK1VWMU94cU91VWlnY2xQ?=
 =?utf-8?B?SUp6SURjNmZIVytQcld6SUVrMUVRc2ZkVlhGZ2F3Yk5pSXJCVXR5RytjVWov?=
 =?utf-8?B?d1VrQTVCRWs1SEp1bnJOMjhmOTFVZXZ2SmdhVHJEanJFNHorZFV6ZEQwb1Ev?=
 =?utf-8?B?YjRtNVZuMTQweGlvcUZuQTAzSC9sMFJIUktNTVlML1hlSjNNY2REWTdkNmhV?=
 =?utf-8?B?OTJ4UDh4MnVqN1o0eGVxaXNMcXNhc2JoTkRmQ2cxVnVoM0RyNVJWUm1Kdy91?=
 =?utf-8?B?R2p6K251akxIUEZjMk0rV1NlL2FxaEh1L2YzL1BTVFBHc0xOcnJYNDQ1MXVq?=
 =?utf-8?B?YnhtamZOdzY1aG1TNE11cDg3eGc4UFJnNFV0SThmSll1NWtUWlBmQVZ5UUNz?=
 =?utf-8?B?V0xLSkFYc1NRSU9uNFd1cWhWSmFoQTZLdElQV0kxS2p0elhrZ3I5bmxFTDdu?=
 =?utf-8?Q?pgDwLEeYbt0QqqpXEZ88x0tMrakrGc6J9j0JJKi?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7469a3-83e8-4933-260a-08d97e99984e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 13:54:00.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAGjpnGiRZ0NS+YDJckKRqER9MID7UsENfzOQ8xz6UL+9C73zQ7knqVWB2JV+hJOfv3PSgzEv7ig/KTYrY8xjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6560
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

On 9/20/21 10:59 AM, Zack Rusin wrote:
>> On Sep 20, 2021, at 02:30, Christian König <christian.koenig@amd.com> wrote:
>>
>> Am 17.09.21 um 19:53 schrieb Zack Rusin:
>>> On some hardware, in particular in virtualized environments, the
>>> system memory can be shared with the "hardware". In those cases
>>> the BO's allocated through the ttm system manager might be
>>> busy during ttm_bo_put which results in them being scheduled
>>> for a delayed deletion.
>>
>> While the patch itself is probably fine the reasoning here is a clear NAK.
>>
>> Buffers in the system domain are not GPU accessible by definition, even in a shared environment and so *must* be idle.
> 
> I’m assuming that means they are not allowed to be ever fenced then, yes?

Any thoughts on this? I'd love a confirmation because it would mean I need to go and rewrite the vmwgfx_mob.c bits where we use TTM_PL_SYSTEM memory (through vmw_bo_create_and_populate) for a page table which is read by the host, and those bo's need to be fenced to prevent destruction of the page tables while the memory they point to is still used. So if those were never allowed to be fenced in the first place we probably need to add a new memory type to hold those page tables.

z
