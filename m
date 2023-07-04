Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DF746A2E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D1D10E293;
	Tue,  4 Jul 2023 06:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71E10E293
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQHIjqlkcmM5wwoqWI9OrLI8bWrgwh60kUI9jA5SnGLAYqgkmNb+CiZz1B66MPUoBFHpwDqLoyUeTMPRIU/0INQCjF6s/XAw8zYzZtv/ki0P0VrFdySp5u3jkogAHBC4TDtFN53Qf0eDb/uSXR6uPCt8vVKsHQyFg9m9UmYEsdt6CsP3s41Rqk+tKX93QMqh6WPcwj1iaprGi3cCwUFzOca/bBh+wDybMacu7JMm3g+aKQLBqFrImRXvTj/SL0zdTqkvZgxU7dMjglEDBe22l+i4NEEK44fIcKKFhi4qoiXSlcBrYAWrkwvfD+KUTFiA2OH5dwEmwExrgQmaKZ0Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFmdDG9OiLgIrcbKotDipREy9oWc+vWtIq1mfHcRR2w=;
 b=ehVR9pwKGg3b1am7B/MH/zAcCc2eTe5narItanvUwnmXkVp6nF6RBtfQxI2HKDpToMNBCCm3XZp55x3Cu5lO4hjuMQ0m4sTavjr59Auh9IyiwRuvNs4yqXpc+XIw3ZDrxXBvGpTnWjge89PjSuHsJy35dIH3RMac7xdk21JOspdhx1X8RPwGiMOm3F+esLZaP8HKQQET1LeLy+Py/c8rfjqbEobxGfoz+2RnwnXZHMH7O8A/3wbYTb4mlh/D93efbiA5di79dLFnk/SzvVPbEcZhkIMSrvgYtjhadUgMPir2jVQBHCNzFcy3BRm1doPM/ysRVHdWhjTO8gy+ArW3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFmdDG9OiLgIrcbKotDipREy9oWc+vWtIq1mfHcRR2w=;
 b=mGCmLL2mI9jdub7siv4qL9Nq7uAKCd5TK6nuarSVzKCFocvUlnmHjcafQgNaxK3J275PG7WapXbHbS8T+eTTh6sazH1ffusBLC6mZbRytYnYSQ0LbHlBkGhSovXk996/zH1/3soUZYLhjHZMyk89uhVTb6s67Nux80RqdQQAOOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:58:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:58:53 +0000
Message-ID: <af0107cb-64c1-337f-7427-631e735acfa5@amd.com>
Date: Tue, 4 Jul 2023 08:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
 <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
 <20230704085035.7a4ec164@maurocar-mobl2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230704085035.7a4ec164@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ccf94a-9edf-49bd-0c20-08db7c5c20ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pD7debQRQHfLsp+k+0t8rkFa0r2VAIwoOkA8A09a58QnqeWxTF13MU2Ruq86WGBk2Ei5GsRVXxFantmX+e5sAS3ZOmC56ZR2hLQujkRnT2SZnIR9dZHBRtADZILGJeMHGkxLB01rOJqWUePeoJe4hRz+yO2M1QcrHjG4v3UsDQBItnzyzm7Rlyp9TNy+0q7Yc+DLuMWPYcETh2+vnTlR7g+hihtns3sW81l9K/t5Ik++rD2kzlWOW1Sc/oMOY+5THYRoI9mkcH6yDW6wOQAQRc9qiOrXDZruy4l1D19Piy+5PMy+gdlv03yoXTEH3FDY7Y5+0Zr7oQPFSAx1D2fiHJqBidEatx+XczIsvJB1CjX7CGZ+42F2n+Fb3LVgwd6P6DuBj6CQwXVJ469O2Ime5hUkMIJdEYAb2uAdPwlIJ4xzNVBE6GoYZ+cqtnQmrAGkRfCK8lQWuYsxEdZcl0W9HyfhM+HxTGiUwm4SF1IGLL+CV4wAROkgcH4+OoTQ8icRXozPRQP9q7WzlpyvgKWKIEUy6vd9fpGvboZmmDT8HcZlCplru0E4jq6lJAfITLqiomE/JnJbbBhDESxo8zvC6sijV4ECvxJmSt4wFB80WUCvYJRo3XOmkv1RKngMdWnJDHgnVe6pwITBjwBlMXstA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(4744005)(2906002)(41300700001)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(186003)(2616005)(478600001)(31686004)(6512007)(6506007)(6486002)(316002)(6916009)(66476007)(4326008)(66946007)(66556008)(54906003)(38100700002)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WksrMmRuejJneFpJWGg1ZXhwbE5LMWsyRmRmODBYODd2cUh6TVdETjZZSFJZ?=
 =?utf-8?B?TWtUR2FXVWo4ZnR1MGlUWnVoM2Y0eEd6SzNKZ1FsZCs1R1ZlZ1RtWkRxVU9Z?=
 =?utf-8?B?Z1VYdGl3Y3I0bjJHZG9hTGlFWnBMQTdzbkdLYU9oR1pVV2FrRTNtQkt4NzVj?=
 =?utf-8?B?eGdUR1k3SWE5d2QwaUF4WUFVZVlQeWMrMjNjNU1raFQ1YUZUemgvTnhBc0Ju?=
 =?utf-8?B?TVZsY2trS0pPRDhkaWVWOVdFSTl4dTZiVStMNEN2L29CSEVHUE13Z1pvaExM?=
 =?utf-8?B?YU02czJkNVd6S3hpaDZYQ0EvazFaL1gvL05tSDdhVFRPazBNeTE4MXhsOUF3?=
 =?utf-8?B?R3JTRks2eWpOWGtMV29XOUdBK3k2NlpuWmxqL25Kc0FZbnRaaS93bEZ5UzdP?=
 =?utf-8?B?NmR0WG45MFlaZEZaczF2OVRneWNjYW5IWGI4WGJ4YU56cFFabVRtakFoRVA2?=
 =?utf-8?B?cnJkQzFSTmxFL3QxbkhrbCsxMzY2Y3BVOHMzbEJLTXc2cTFoMk80YndWVVVZ?=
 =?utf-8?B?QlgvZjVvV3lyNmMrM3pmL3FrQkJkVWxuNHkzQjk2S1VXVXRxZW5JcWxQL2tL?=
 =?utf-8?B?LzN6VVh4YlJvd3BycWlyb2k4QWtxTExrR09qM1Ixd2lHR1NSK0xuWjFlRlpY?=
 =?utf-8?B?bnorQzhlYzhVN0RFT0Q0RzBaTEI3NXB0eEZwM1pDNEVkclBrRzJzL0FZenNE?=
 =?utf-8?B?Rm91QndSc3RhSXpzTFBIcG1Xb3RScnppVXpXWVpsM3dsTEQzNHd2eS9FVUla?=
 =?utf-8?B?cVd5ZDJrbzJiMTg1UFZuczZ0VjdqenBIVml0VlB1SmNWdzJOSXprZC9aK1dj?=
 =?utf-8?B?ZXBQWFZlSFlwK2FQN1p5VXByY2xiYUpBZHhjOVg4azkrWks2b0d1eVZQTEFt?=
 =?utf-8?B?UnQxTTM3b2xxOGlFZXRhTFdYRUtXbDRVUit1NzMwRDEySXZLOG92ZjJqcTg5?=
 =?utf-8?B?NE1STnlqUUhTS1kzTzRYVzlEMU9GMGxzTWZkRUV3elFWV1Z0TFN3RjJ5ZzY1?=
 =?utf-8?B?THlta08yeXJDL2pyTWVwTW9HRGlxVXRKOERQdzFIMjBCSmw2ZG04L0hGWiti?=
 =?utf-8?B?ZlZMOVFqT0VSaHNwTVVnV0Q0MGN5ZGdvOC9VT0E0SWxnMG4wb1JwN05USFFm?=
 =?utf-8?B?Rm8yOTg3NjBabmNvVVNHdGNMN281eEV4QXl5aEZKcE1oTU0xajdOZmNRd0Jo?=
 =?utf-8?B?VURBeWZBU29uQ1NqK01PR2ZuY3duVG91RGZsK3hCRDdJZ3htSytLV3lJeEtj?=
 =?utf-8?B?Wm1JRTBnS0pocjBjQ0xMSDlyR3VqL0NXRkRvajR6K2o1V1JQVHM0b255bTZQ?=
 =?utf-8?B?ell6M0t3TzcxcG5mSC9yVTViL2JNQWFMN0hLMzJRUXJJV24rQmJUVFlOcVly?=
 =?utf-8?B?cWl2OHBUNnZOb3RmWTdkb0tXWUpFVFdjRmtIakFvbjBEN1ZFMWlCWitEOG5o?=
 =?utf-8?B?YmtvL2hrcGhIcThKT3loc25pZnlaaUwyeERIc24xSUVKbWZrTkI4Mjd2eHc1?=
 =?utf-8?B?QzZzWWJibnZPci9QUnp3ZGduT0ZEQ3pMblBTa2I0WEV2SVVVaEJTQ3ZqRnh0?=
 =?utf-8?B?c1lkWWloa0VuM2tYRDBzQlhCQ2JrY2hJMTBQQUZ3WHhNbTc2cGx5V0J5bWFi?=
 =?utf-8?B?VW4rWExPQk95bE9hNUIzUm1pVUZieUZaWTZqV2JXWVJVcVgyUUU4bHBpNjdl?=
 =?utf-8?B?STAySFRNUkNudGZ4RTlZKzN2VUs3MzdKSk1NbnVDQ3lkbVlUTWE3MzU3SFFu?=
 =?utf-8?B?SlBFdW1yL2VncW1NTmNBUmo2NXh3UXlpSWNOTVE5ei9ZMk16Skx3b2cwVXZw?=
 =?utf-8?B?bXNPRmlOZ0VPTFFsT08vUlZvUHFpdmFmVHpBV25TRTNvSUp2TUQzYyt1dlQx?=
 =?utf-8?B?dmZXOG04ZUNsMm9ZeFlRZE1kR1N3K1hHczlRckhrUllWcno2V2ZNS1NjRU5k?=
 =?utf-8?B?N0h6UHRFOElCaEdudTdKTnJzOWFnYTF0cG1KN1NJOER6Wk41cmFkT3Y3eU1I?=
 =?utf-8?B?a0lXMzJNWk1BV05sbjF5S2MrQlNIK2RFZWhJMUlZMVJodDN1SmJ1ajA4cUlF?=
 =?utf-8?B?QlJDVnA1cmYweE9YZEpCT1ZZUjlkaGxwaHNKMFBKS0ZZVnhDczZIZ0E1TEdp?=
 =?utf-8?B?bkIwakF3bjVzWkM4SktTeXFJQlp0YTJJQkZPQzFjVTIwZlAzT01aOTloYmdK?=
 =?utf-8?Q?VTzwb/m/SFpG5BPVNf/4dRuuL/WgdTB+DY54Okvv67Ob?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ccf94a-9edf-49bd-0c20-08db7c5c20ae
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 06:58:53.2207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H0frW8FNWrk+cQfW7B1Lq5YpgjAnYG5giYnwB0v+iHm72DdZWgpB7T0wX7w36Iv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.23 um 08:50 schrieb Mauro Carvalho Chehab:
> On Mon, 3 Jul 2023 13:21:43 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>>> +	/* We don't need this BO later, release it */
>>> +	ttm_bo_put(bo);
>> That won't work. A BO must always outlive the TT object allocated for it.
>>
>> Otherwise you can get crashes during TT release.
> Just my two cents: shouldn't the TT object be increasing Kobj refcount then,
> in order to properly manage the BO object lifetime?

No, because you then get a circle reference.

The TT object is usually destroyed when the BO which is referencing it 
is destroyed.

Regards,
Christian.

>
> Regards,
> Mauro

