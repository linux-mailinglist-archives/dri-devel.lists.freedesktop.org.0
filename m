Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F343609ADD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9B10E27D;
	Mon, 24 Oct 2022 07:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA0310E27C;
 Mon, 24 Oct 2022 07:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvRrt8CVVb4BhBlgiO/ILqxliUFBicyLQdi2eJNmwXqNMwH98O3ZPLNy+BqZdWFOjc9FQ05Qy5zK1hCt2C0etaERNFtEw6QGZofKDymgMq/Ol+T91X/vNjshJCFlDuhmfUVT9v0ZpcdVjJSkTNLmxeyKAMk9+L2rzyF9EYvpfJmh4AK7c/QEOAJKSoLe1VdNmyggyv+H1COU5JPd59BdKMCbBPakZVKm13wHNKuJJAlI8YgrJzoG1uGrLATFHqsIZvvbrGiDk5Y0tdgfPlD0NijNLw0i2dnEMmox/KSJHze+CO+GBToTaHwXvwyEELuexkx8vAaajs9sNQZX6mRfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17CYCNPgoA/WqJcjavZ/scjN0X7960J2/KNaygHK5wg=;
 b=IYx/0tcS0jpY/vfDTW6++cHAkb88IAmG1+z8bF8ZPOyMj5gZUQptbN6Ouo1eOd0FL+uiNDfR7R8i1WT3JWO4rpxqN04Y0EfSuUJxvSmnlPk2luUfWduaOSY/m2AmIFNuQ26zHk9be3E+FY0CCRSN+KUGkxP85zX71IuEOAmgeKBD5vx2wxhAQ9QonrUmK/vbDeyB08RsqpLydWfmEL7i2j8XuhctQW/NEbdFFruIDrdazpyTSeOWatI1Lgh0/elqM3TmYdb4pQQ7kyqD9Nl6Qqj9XGN7Kxft44ukxo23MmdwgK4hF+w7LGpeyHP70jSwmIlMf9+clukkLL9siYoAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17CYCNPgoA/WqJcjavZ/scjN0X7960J2/KNaygHK5wg=;
 b=JY5E/XTDw/JMmW1GB+D3ENRLS5+CCDou1r36voyzLoaM4tcVK00cN2wYPpOquGSfOWwwHq5KExfRLsvLnEzn+Y+SN3FOaxHLNedkHovVwyfEiCdGt9rS+6abqkCo5k3SMaa1940XukaetnXlkIwAPSaSWJD2om38g3E9ijKM1LU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 07:00:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 07:00:26 +0000
Message-ID: <9514120e-5780-fd49-02ef-9d3f49f7453e@amd.com>
Date: Mon, 24 Oct 2022 03:00:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Fixes for scheduler hang when killing a process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: 619bce3c-64b5-45ac-e5ef-08dab58d6d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Wsr3Oa+yPI3v6exBv/5H4LC9P9tISMEzNjn5LGZwMoi8rzUCs1u/TPpfDSUGwDY7NJcjQMKMZjbLYhzgwPRNkErrPIE0t3af+TobfgcK5hjfve0tC58tgdB/OPcPcpWQCh6eGJf0elDrRS6u9c21RTFIgfsgI/XllvrmydXuq/51QRWrOmAc6d5rgF/twzF+d4TkPfjVScbyApx7ZbyD4pm9ODUM0DUhfu1Mz+qDpfcaalhoibZk6AtNxLDAbvwt15E+V5TYvdWmR19XeeYKT5mtY2cfDRf1DOAkIl18FnN45SYOQDUYCI+Qo3Ia2t4QH1P3eiPl0z8hL1fMk+D1aeo+dmqVZXni9V+g4e6bJLLdAVeARUYfnmBBJhT3v1lXXoSCpyAtNoQS31ubnouNO/dm4B9Nf3vzgInA+QCowd966RRH3RUdI0btSlk1Dk95hRDOKLGcAsRKvVNuT2BDzfjo/0a2OdJO6ILtDFDiUDoS8DlZo8ocipM46UBuCa+Rg1R7hskhRU35DBHP48NRx2jRQ1J/noS2aHKLOIlU2oRBGsY2ipPZ0wBo3xSVQjQtr9JlDUzPnJgOnBdCzOX7JJuy1596jkI4HstzrqjXa8EqbV9HFASrAMqsbT9HhWzNwtLOSdKswQXTZiSDQx3HwK01mjRrlpnaXUIt4O/J5RZxbWKqnpfrhp2EvyYvgP2sgBUhzC32w4azOiKWSFT5o2D+5s+JASGTDgsFmFAqI0IJU36+QU+V/+4hFAk6wvLz/HAMA0ryil61rLleTy/muUmCi3U0cD8Xw/atQnr3f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(451199015)(186003)(2616005)(5660300002)(86362001)(38100700002)(2906002)(31696002)(4001150100001)(44832011)(8936002)(41300700001)(4744005)(478600001)(26005)(6666004)(53546011)(6512007)(6506007)(6486002)(316002)(66476007)(66556008)(66946007)(8676002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmtuOXUwWmVQU2V4OHVwRkdoWlZvcEI5TDZEVENnUW1pVHp6UWw3TXU4dksr?=
 =?utf-8?B?TlY3K1FYZUlqSkNpZnBZbDFvK1J2US9aR1B0dlJ1UmFaclErNXhxU0E1Zjdh?=
 =?utf-8?B?cWRkMngzTnFIM3JaQnpvU0k4Q0RRMk94YU5za3Y2dTV5Sy9BRVJmdzhqSFBz?=
 =?utf-8?B?Q3FIVC9nOG1JWlZWekFLdU1YYjFVc2RFd2Zxc2oyTmNGakxaQ25zSngvSEk1?=
 =?utf-8?B?WXd3VzZ5RXJFdXBWaXUwTTJGdWs4Q2tWbDdTdUg0blMrZGxlaVppTURLY3Rm?=
 =?utf-8?B?aWFFWSs0QnVaTnR6cTVVMlVpOWN0d2I1UTFpUFdrcDNvTWtST1NCcENzbkp2?=
 =?utf-8?B?ZG1HRFZkaHBCbENrR1ZsTXhwVk9CMkFPeGtjUS9ZdnhyR0pHbWYxVmxNdzZq?=
 =?utf-8?B?N2MySWI4cUs4ZXBKckZqem5iUGdMYVZwMGRRbmdocFRyVENuUDF0cm55RW9t?=
 =?utf-8?B?RzhCQktBQStXQkxUK0FqV3gyZ0hmcWUwZHJVb3F1R3NZTHcvMzdkc1BIaHJR?=
 =?utf-8?B?bFE5U2lDRTRQblcydzVYdGRJVHVqbnBYUVJ1Rmc5RFNLQ2ZQb2RFM2RaMElF?=
 =?utf-8?B?blBhTHA0TlpmT2N3d2xBb2lsb0VRYmxwWFFWR3lTSXJrWmtTQTl1MnNSdGNz?=
 =?utf-8?B?YzFPWXFpZ2J1cFRxd2NEM3FPZkZDOHU3UTY3YmJtZ2prdTRWR3IvU0UySkRM?=
 =?utf-8?B?dDJ6S0hNOVdBZk1tTWFZS2JYZWMwUzlnVm52QkNxZkI1UWNtOWxXMVo5ZElU?=
 =?utf-8?B?eGJ6VFFZSGFiaWw4ai80bktzb2xCVjRDa0x6bkgyZk1EV2lTdFNUV01pY0Za?=
 =?utf-8?B?N0JpRzlXbU0rSitWbWhkRmhHeTdmT3RDTlpod1JqNHhZL2Q4dC9ldWtIT2ts?=
 =?utf-8?B?bjBzZHFNZ0JoaWlTeHRLc2w1aFpQV3NzZ29MeGoxTGgvZzZOR1psWDNpczNB?=
 =?utf-8?B?QUlCbmQ2bVZHeHp3QURMTE0vYitDNXlmaWEzeDU3Q0d5bGYrakNaQjdkL3dQ?=
 =?utf-8?B?RmdwL21ENEdKVnhrMEFNM0xCWUxJc3hNeWcwb1lYSzRUcXZuSUlqcUR3dGt6?=
 =?utf-8?B?WVRJS3EzS082WlJhS0x1Z09ERW80SXczb0szR3FCemU3NSt3UGYzczRYbzJG?=
 =?utf-8?B?blFnVFgvOXIvWGc0TjVGRktiN2luclE1NURYSVlhUy8zN3dqdEpqMkJ4WmRk?=
 =?utf-8?B?R0xZQW9wckx0SXB6U21RaEkvM1diVzZ3NGJxRzQ3RitKM2JTc25WVStUQ25Z?=
 =?utf-8?B?VjJnS0JuVkFwNW82UWhYNi9KMUVFYnEzeTZMaGdlZC9EdGplb0lSRlJiSjBR?=
 =?utf-8?B?WmxBZnczMnNrbXdQSmJzOXpxYWhFU0oyRXNxbGw2Smw2VmJoeHh6WWd2SUQ4?=
 =?utf-8?B?K29BdlNIK3EzUXAvenp6V3R5UHpEVjBZYU00cGJKUis5NGtOcURjdkhtcnNO?=
 =?utf-8?B?R1E0UmZxRllhOERzdnNaL2JnU2toOEdraUZqVE5EaVV3WU9NcHZSWVh3SU1x?=
 =?utf-8?B?YXdKblNFQXlGSjFMRmQveERKbXdnODNmN3VKZXQyUm5EREtvamFzbXFqdGdl?=
 =?utf-8?B?TWpMTnZWMlE2WlUyM2hqWkQwUkIzb0FMMzU3dW9yZ1ZTdGFwWEFSYjd4MjNQ?=
 =?utf-8?B?WVlmbnY2WWtmWjRQanpJTGp2SDlJVWJ0eFlZRjFRaUlKTWVIa2IvRVJ1WWdU?=
 =?utf-8?B?aVZCalkxdW52NmJnbGllbHE3RTU1c0ZpZzlUZW53dVBEeVpVVG5rQ3BEeDJ5?=
 =?utf-8?B?b25JbVc5S1ZoMjdTbU9wQm4ydnJDWjdqRFVYdjMya1RWMk5TUThoYTFJR3Nk?=
 =?utf-8?B?OTdpN0JkbHhmVEF3SHNGbGxxdFQ5eFFVQkllVVgzc1piL3V5QXNNSWxodlFh?=
 =?utf-8?B?QkhWNnBYTG5HblErdHRlNFFIbFBLbzhjZFU4dFdqNzRhVnlhK0U1MEFiTFFn?=
 =?utf-8?B?ckxiZStLdWE2bStrd1Zla2FXRTF3dkNsOFVjL0Zwb1pjWHkyUDNRNGdOM2tq?=
 =?utf-8?B?L2owRVJiWFgrak5EcHUwY054VHRrcWV1TlNyd0lwM0hwWDVpSW5IWEV5TWhi?=
 =?utf-8?B?ZnpVU2JtUWUzN2pXZGNwT2RaVHFNWDYwczVwcWxRQkdGdThPT2h5L2t1Yno3?=
 =?utf-8?Q?bmVCfsZWn3GoBomA8COIWuEuD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619bce3c-64b5-45ac-e5ef-08dab58d6d65
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:00:25.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1tJpjd/y684VyDmqUGpBh7e6aqPAuBXhZ14XKl/zK7/4z7gxdmMaRghU0Ic/4/X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
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

On 2022-10-14 04:46, Christian König wrote:
> Hi guys,
> 
> rebased those patches on top of amd-staging-drm-next since the
> amdgpu changes are quite substencial.
> 
> Please review and comment,
> Christian.

Hi Christian,

The changes are good and I think asynchronous is the way to go. I'm also running with those changes live.

The series is:

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

