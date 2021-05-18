Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C331387993
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A696EB69;
	Tue, 18 May 2021 13:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEAB6EB67;
 Tue, 18 May 2021 13:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkOZ/dCpkG84ZZfurliUrsGLj0I2iPcy3Gw1ZMHf0P9aHl5sK5Hg0/Hjssm2Mk3rLq3MCq1H9uLH245SDPQWMcwZlU1JxwogZMZwv6Nh4bjrb8e0bEPtU7uDTWzvupT/K2LRrdqwVwzsqHI/WRbWbZJhJR2+mlsQ9x9qtHCx/SD9uJM/MMXKkqInHZHgCjI3PcMjQC1UPpl4GbVwmUZLxTImCPjPmxGwrpcEWdto1f86Pi0AsRtbfk8WFsf/UfXm+NQ6oeET5xOG1Bk7Qad4e5kj0BmK7wummyaOixYSqEn0kCo0hljLY0Fwj4aJGen0OePArLyYfxDJUU6K8GoAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSuZpGiBY5CmQaKPgymZz1YBy8mzCVjeTwmdpnApq74=;
 b=mssfx08VOOR/RlsW+OY3ywilJ719/253UYczCf2qzRzXY3HEh4wh6tF0LMuVqM5pBd8OMc4HQpPrLMkkKkqFIOf9M53b/ZhSi56EvkaSc0g74Cw+3bjK1dwaAkZwLN6QD7Ay+xrUrXLtGB8lJB87am0+kyp9nbplzeiTi1BqHgrECzGF8NqsV9sum6cR9/GDMzbqMMD2+K4n7b+H4vZRLRWHFGgdIptT8s6YAuCOSm0VMQd+EbkJ7wLHGVGgM+/35sryRkg9qRxj7dI37TuEmGzbCGy2CYy9Rkag0w1cfuCQLfpJTf+qSuvwxk8EsGhracOAmtgQeot07zigL1qQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSuZpGiBY5CmQaKPgymZz1YBy8mzCVjeTwmdpnApq74=;
 b=gQ+8mBUk55jBrtJEYUndBUzs//iVFfdZsvqn4YMaUTtLyJns5AajT0rhioqsZMDjgt0/BH8hByLAymSQkeuiuhUL3dkXdd/KD4uRNNuf9ikntuwEhMSrDgXZNoFnRG7zYbJWtfxbNhbVM5IkPSDjB2VJnyK6k66YWPhw4CEqSVU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 13:11:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 13:11:15 +0000
Subject: Re: [PATCH v2 04/15] drm/ttm: Export functions to initialize and
 finalize the ttm range manager standalone
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
 <3feacf02-0854-68d4-f26b-88ed0528e9ff@amd.com>
 <00ada105-d0f4-f556-3eba-8503ea73c408@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5a6ef51-0026-8d21-1c4c-8493e9d80f62@amd.com>
Date: Tue, 18 May 2021 15:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <00ada105-d0f4-f556-3eba-8503ea73c408@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 13:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7daa1de0-9eb5-45cb-2cf8-08d919fe6ac8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916319BEC0886D4681BBD84832C9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpfE158/hPgRP97UO9hLtdjgZVR1NbHl2H80D1t2xLR9vSS31nTJTiUOQTLLPNhMPBoNzfp5hn1IwAGnkrbvMEre3VtMC2OHMrv8D5b3QXG3rQ6+GCnqQMnWUg0X0JHI5SMwxoKeSLW/+/oZ5fsTSjmaEBQuIuxRCTxA11QhgkQvV6WuMMrp4aGevf7IVO1CGffSJBDj2GZ2jDtBeBJAlS90P4C3VTZ5EPtWQW1JoIC1/afPSXZbF8Kh/c8V6iMBjlOYHdU9dAJmyTa4enEkfeFy6iNhyzepLY4sMgOz8YTzJ69tuI82uFT63n5g09R3UP4sw9+DpSYzvQShG8spQUpMDqbeQEItwqSpmDMtyXOL+EFVB+OTNpjqh97s49jX0geELighPR7R1HdAbcM0e6RYOa1231WYaeQS7RhQGdSU4HcO+fpxenzxmtjPC2Nt3QArMP/cVOMX0bGmv9re4out49PVVdywQbFNKnqjGwFpqcMjOfLovj6EpGqX3K7PfhKoy5+RnhZ2m/7pLSZaHQm1TnRP4yANXPIu/2oDrQaliufCTZxhEYakSDvkt3qYZcaxl4iwEg974mkp5MJlsVxvVx1LdewBZ8dxB/Aie4UJwG9wXm+cfG6pf5n/SPYtZkRLrXbmzR+eDstcHMu+YERys56Hf/40jTe4AnyqSCaYX3MIaZl9jRWcRVQwz8Ot
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39850400004)(366004)(346002)(396003)(6486002)(66946007)(31686004)(66556008)(2906002)(66476007)(5660300002)(8676002)(83380400001)(478600001)(2616005)(8936002)(316002)(31696002)(36756003)(186003)(16526019)(6666004)(52116002)(38100700002)(53546011)(86362001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RU10NzJ3UUhPaHhZUWhJNjhlQS9MQ2dqVkZZZXlvNS9COWJRWmZzVjNjVjBR?=
 =?utf-8?B?dHErdVpLcGdlY1ZPV3dFSmhxNXFZVlRJQXdWT2tUVDB2TzBvck9KNEh5cDda?=
 =?utf-8?B?TEdqbDJIYmJhMDBDSVNtMm5DVVNQUW9UUVQzc0FvSHZhbGZmZDV2d1dpeWtk?=
 =?utf-8?B?ajk3R0pFK2dtWEd2MG5raklDNy9mT3JzL0RaRENRbHgvRW5ORzIrY2t0M2F3?=
 =?utf-8?B?K1NhSGg1dHV3eUQyMXJZWTdDaUJseEQ3Yjlkc093UzJEdlZ0ZjdUc2dNa1pT?=
 =?utf-8?B?bFJyRThKdWxjc1hGdHNrM29LS1lGY0lxS2JicW0xdFowT0JvWkozOUZVNzBT?=
 =?utf-8?B?UVpqaTBoVE50VnozamhMZnNoVTRadU1IS3luQnFQaEsrSmVldFgxNTBTbXVY?=
 =?utf-8?B?ODZQVVhtdlowa3p1U05TYVNtZWFtcnJYT0FuemUwb2JUc29kMFF3YU5Ca3Ur?=
 =?utf-8?B?ZEcreW1iT3dONUZxRFlXanlpcTJXaGw1NGgyQ2pZZHhldUsvcHBzSjQrL292?=
 =?utf-8?B?T3ZyUitMb0N5YnlIek0yaHJJQ1U0NXdUUkMvZHJFUlBQUE9DSWFLbm1aQy9k?=
 =?utf-8?B?QTZZQ1ZjUG12RVJMdkExVnpMSStnRVRBT3R5VzM1dHE5NG0reGhhem1jQnk2?=
 =?utf-8?B?M2hPOGYvZ0JlbENUVXNSSTNVcjNBUjhOSkdUeGNKZG0yRW1ZcGJYTWRNV1V2?=
 =?utf-8?B?a2xpOEpBdFUwdUEvZ2hWaVpkTjVpNU5vank3SHhsU2tGUHJYc0Y2Wjh4R0dr?=
 =?utf-8?B?ZFkwMGprZDNTdk5wejc3Wk1FaWd3UEhjRUx2UTU1YmtScnRmY0dmaE9PNEs2?=
 =?utf-8?B?VHYwYVQ3UkFxR3ZOYUNCRWhzS2JMTmZkcUN6ZHBDbXo2Sis3QmtsQVZRMGlu?=
 =?utf-8?B?NjBQaU9vMzJtYU05aWhlWkpsb0FsVU9GRTUzWEh3WWMrUC95SUk2YzgzVWRF?=
 =?utf-8?B?OHpEY0VUNERFYk1XREJUeEtvM2lDWCtBSVE3cUdaZ2ZybGZtTUE1dTV2Z2g2?=
 =?utf-8?B?VHJpNUtPeEl1T3RZUnRuTUhvZHNZL0VOV1pOMW5Ta1FvUVhteWVhL3ViMWtn?=
 =?utf-8?B?UnEvL3VvK1RIZDR0TEtxTmhiNUUxVDd4SytWd3R5djVKL2FEeDNOeGc0TTVn?=
 =?utf-8?B?VUd6ZzJITElDbGhPR2hHaGt3aENUL0xYbk8wUDVoWitSQVRKTkpJRHNaV3pM?=
 =?utf-8?B?SU9lczRKa3dOWDZYMEhLTmx3V09ZMGFXVFR0KzBINjNrRDdUNzc4NG5qUmg4?=
 =?utf-8?B?ekJUbCtsSEVURGlCdGNTV2szRFhhUmY1KzFVSkFhZ2RIY1A0L2FJNXl1SXpB?=
 =?utf-8?B?dThlSkxaMS81TXVEc1VQY3kxazRtREUxM2ZEc2RIaDZJVG9TcVhkQnYyQldl?=
 =?utf-8?B?Ykx5YVM3V3hFQ2p2VE9pbUt6Z202YTJwTHY4RjgrZ25PS0lQUVlLQzdPYXlG?=
 =?utf-8?B?NHg2aUFjaFA2MWxMMStGeGhFU3d5STg2eUd5cUd0TmhkSFVEVkpFZWhkMk5h?=
 =?utf-8?B?R0l3QThQaDR0Z1VyMHVrMkxGSVlzTkE3T05FU0cwN0dpUW5JT1lBUlZLQWVo?=
 =?utf-8?B?K2hQd1VSZnhScmFEbkhSM0Irai8wTmVvRzJyM0xSeHBYVm1seW5QZlBnZVNy?=
 =?utf-8?B?MlFTTXpURkZ4NU9qbUkraHBXOHhNMzlDWEVtOFRna1ZKa1daRk01d09RL3Jm?=
 =?utf-8?B?Tyt0NUJwSlJFMEwzYkxObjNXZmhESXZ1SnZrVjlDd0h5bGNYK21PalpVd2dH?=
 =?utf-8?B?Nk1Zd2lSQ05HZ2dPZ084RW9VQndJNThaYVJtdU4xbTliSUU1L2puN3Vxckwr?=
 =?utf-8?B?TEY2K1Z1dTNOREduREprNDh0M3pkOFVaQ09DT3hERnNpSXBsVlBPMEZ5R2hl?=
 =?utf-8?Q?YG6sJFAPEhBue?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7daa1de0-9eb5-45cb-2cf8-08d919fe6ac8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 13:11:15.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TERqkBG1MFNobqNhNGEWe01gkmORloovT8g8+0WEj26ITBVOkqKuvxRaF/Qz3BIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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



Am 18.05.21 um 15:06 schrieb Thomas Hellström:
>
> On 5/18/21 1:51 PM, Christian König wrote:
>> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>>> i915 mock selftests are run without the device set up. In order to 
>>> be able
>>> to run the region related mock selftests, export functions in order 
>>> for the
>>> TTM range manager to be set up without a device to attach it to.
>>
>> From the code it looks good, but to be honest I don't think that this 
>> makes much sense from the organizational point of view.
>>
>> If a self test exercises internals of TTM it should be moved into TTM 
>> as well.
>
> This particular selftest actually exercises i915 memory regions which 
> is a level above TTM, but the memory regions are backed by TTM. Since 
> they are mock selftests they don't have a TTM device. For the buddy 
> allocator the situation would be the same, but there we have selftests 
> that exercise the allocator standalone, and those would probably fit 
> best into a TTM selftest infrastructure.
>
> Although in this particular case, we could of course add a mock TTM 
> device and be done. Pls let me know what you think.

Well if you can do that with a dummy device then that would certainly be 
the preferred option.

Christian.

>
> /Thomas
>
>

