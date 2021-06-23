Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FC3B15CA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C226E859;
	Wed, 23 Jun 2021 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385686E857;
 Wed, 23 Jun 2021 08:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5iQlS7Imdl/Yp/YAm9zqgJxNIF1lD97n5w7StmLla+Nvrp5xsT+W/gZCo/6MM2bgYBuLTcJhg3+COu39BDexQTMtk1eKX+f0xUFSclkKR66nKOjIeuuW/NzynVMnGkDYJcYQENjctc7l8R6W9hXwf+6rkbOMcv1MY9aO0Glz1PHDYcgDNNeCGibj7b1ybrA6Ly+chdt14rAVzYdFs87QEBVzS+hjwzUV2OBlmuzQCC9BVQrHA2gWF58Tdm9IXxf968GEYK3aVxTN9Q76xJJ4ZaEph6cwBwhYWWus56f463FuMl5fpfn9Tf9tLU2K0fLGfghbJOdMLUDbxvL29T5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB+SvEs2rWwxmFagdotDEFsI0EUGQ8H7wacIu7Voqvo=;
 b=a1qoR5+dvBgcpjs+Nus15d8HlxDyfR3JcVNQVaAH81iF4Ha/oCmdq5W9yHasY1NaU/VwtfUsmqzXzGJ0O3rs8ELoubIeMxsFGIn+4uASlFom6R3kBZCeNCi4whD5HPa4ls+MJ9EdgeFAa18G+KTrUmDQMP744x1+ldXrYIEEdbTAmsIUEJ0e024LesqFS2l1qNlVJxok5LyCfFAMVLC+eYikHgchPLzNh7upOW/+gBJiC26Ta1kZg56eHHSOKRuoUaIu8y6082H7miUr5Hguva1rcxNrgATT9wkV50ZHByxKapvaVrfb4cLoEFNCHyUxLzhdR+jDjj/QhXP9ObeBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB+SvEs2rWwxmFagdotDEFsI0EUGQ8H7wacIu7Voqvo=;
 b=tL5gvyqQsZ4oxJgK+9Hm2Dw3XL5t/S9W2EzPAFPqylGfaOe2jNfbvAA0NO+dignBeJAcyVOm8S+qcrmPydHtFZd1hgeh1MNtpWrsgJ12EHwywaZftALGahOdMUlAXneu62kf3UcX9VkuDOXqI+MjxW2tQXd9l0HjReIas8+wr0o=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 08:25:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 08:25:36 +0000
Subject: Re: [PATCH v3] drm/radeon: Call radeon_suspend_kms() in
 radeon_pci_shutdown() for Loongson64
To: Tiezhu Yang <yangtiezhu@loongson.cn>, alexander.deucher@amd.com
References: <1623210910-20057-1-git-send-email-yangtiezhu@loongson.cn>
 <3aa01e61-5c49-ccf9-6ad8-434eaf8a73cc@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <df263d35-8af1-d34f-06f4-adbc83a804fb@amd.com>
Date: Wed, 23 Jun 2021 10:25:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3aa01e61-5c49-ccf9-6ad8-434eaf8a73cc@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
 (2a02:908:1252:fb60:69e4:a619:aa86:4e9c) by
 FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Wed, 23 Jun 2021 08:25:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a48d485d-c340-48db-7f75-08d936207a06
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43360D2B4641DF15FF622D3B83089@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3vj2b5yNJ1BE8zm36/zBv+fN0RTNx94zw2+gh4Jxe2wkqhzcAtukd1eOwV3mhBANZdiqiR3CGO6CxyK3n3URhRtGKndgmz74+ISA2CpdEjDEPQ/3KppC1nZ7GaDNLRPqeXb6Fm3Udsn358zRRZ1E8dBwzfhWBRw8cwDwOdn/BoNiRXfd/txOF52Wxyg+T/F0UP08/Zo2xJVhHv7KVv4IiYj70jq6fCAp+qTaG7FCNNJ8n6fVx7NsunsJqZG0eVWAqlHqv8x0LJpzxk1ITuKmpoSLcJ9AgHYWhBSQ8kzH2PgVdXBn7QJ/cUWG/zAOK9s5Orr84QlrSGqy0zWfzPxL9Qa6izMoz6svtuhUze3HJlMjpL7gwLZwua1bhtUS4yW3olAZbMh7anvOaYQW/E+cCfoKKD5CgIlIk6uJIKlygCdJBwcSShW6BZut7RKyNmbBtR0WPKwuAuyRckvY2kVo/h2IF80kKUbEyMaXtTg5UOzbGKc+bwyObSUwH+8TPxn726DM/ls7yl1zwNAsI4sAMrIOhm4PHlhQEhZxfU2JYJfi2Q6mM8BfLEW3oh5gvlXv4HC2DPMHiWtTfGZQt/wWd5nyZpsUr+map54j1FndsbEsxiMdytUNn+Ofd4mmtJBvThkC+/MDqsNcDQIkkEcpCyHAan57GtxGG6nLNkF/+IMYaVAqgGUfvG6licnRXOcKyh23zfQ3Zw1KHeP+uW0q/vtC3jeMNqItnXkU1LO+NajbUWSTAT1JsD4o3AwtUET6MX1cgMY8mTnfS1CiZu8U8KbTD68qFgTCPDd1e0+0O/BXPmy/3pJEt5T+NSH85Ljv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(6666004)(66476007)(16526019)(186003)(966005)(66556008)(8936002)(2906002)(66946007)(31686004)(4744005)(2616005)(38100700002)(6486002)(31696002)(86362001)(478600001)(45080400002)(4326008)(8676002)(36756003)(5660300002)(6636002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXBKWklzVHlKdHBZeDNWN01tcE41VldTeU5zMTBpczBQVjJwRHRzSkgrQXl5?=
 =?utf-8?B?WFhlaFBicFpqQkd0ZUZoMU1MZWIvSFJ2UUgrL3lTaXN2TEpKbVhVd0ZSM0hL?=
 =?utf-8?B?djhlZ1dFdlYvQXF4QUhlbGdMQnZiMTZLT0o5d2Q2THBERGp0OG11NXVXRFJP?=
 =?utf-8?B?dUlaYk9IbjBJZ0U0aTBMSWhmaFY2ZTRWUjhVeDlLSVJxalROa0ZVQlZTMUtP?=
 =?utf-8?B?S2ROa0hZazMxMENTL2tuc1U5TlZNM2pJbUc4YUNFVmpNUEt0RGZBcS8wY3hh?=
 =?utf-8?B?QnowZnphR2RBMlNGeGFIMytIT0EvS1R5eG1KamZTRk9pQmlEN0xTK1VveW5E?=
 =?utf-8?B?eXdqSTFOSmJ2Qkx5NFk1bnZ2ak5tdnlTRkdaRGpzQ3RYSHJ0ek9SYVRkSE9t?=
 =?utf-8?B?NlVHNlR3REI5ZW41aVVGaEh1RFoxOFp5bDRERW9IS0ZLcUlRVFhoVG5TNzVi?=
 =?utf-8?B?eU1ZZ1pmQnEwb3VaS2ZJeVJ0b3hJRlpTSkdzbmFJWk5MNVpYb2RqLzVlNE9n?=
 =?utf-8?B?WVBwbEc3M2s2VlBSUzhFS2VBeXNETUd5MkF2SHd6cG9NZVZ6cCthZ1dtZDBx?=
 =?utf-8?B?bHcxYXZobVZkejR2ejZzOHZZRG5LNTZDSlpteVRpWUIzSmVCY3ZtVFRqY2lB?=
 =?utf-8?B?Ty85aENqcmRIUE5WaXRla1NzTDVYalVtRHJvZVdteFFybHNkSndUQXp6VWs2?=
 =?utf-8?B?cm1pR1BBMHZUREQ1NkJJdVltbk9DN0FPakpZOHRZSVpLTSt5QSt3WVJTWmdI?=
 =?utf-8?B?TDdkTHZBbmIzbUx1TmI4clFpeStwdE9vTFhjZUtQcjUrNTlpdDNzUFpGUUJh?=
 =?utf-8?B?bmFnaEsyOExjV21PbmpWdE9wM2RVOHBhUXJDcjNScEVENGU3bDYyMzc5N2ZP?=
 =?utf-8?B?UENaRWNjcHNqMXhJRjEvaWZLUytpLzBnNXhXRmZaZTdwaW45OVJrc0kzL0ZO?=
 =?utf-8?B?bmtzaE9VeElPd2IzUmR0azlJdDZBMUQzNVI5OWlLOGFaYmhFN0F1N1V4Y0FQ?=
 =?utf-8?B?REl3N1loWWRXUnY4UTh2MmxxMlFGdzNZWitKQmRVeXg1eGNSRk1nNTBKVk5N?=
 =?utf-8?B?b2JBcUtYYzMxVFlHa3VlT1hlQnVFQXpiQ2FpbEU3cXNJVUl0UmZ3TGErQzM1?=
 =?utf-8?B?QWZ6L3hEdVFON3RwRWZqdE1INWVacytoTmVQblpBSDRHUzRSUEFBNExrK0tq?=
 =?utf-8?B?RUZrOTVtbERVRVBsOXowV04xMS8xNUdWbW8rVDYyVmt0VkFuL0o0ZHZMR1Ro?=
 =?utf-8?B?RVV1VXA4V3RrQWs5WHltYU1mOVVXWW9OOUROMmtOcCtHd3F1Yzdrak1BT25O?=
 =?utf-8?B?K0d0OFJDQ3pNK01MbGV4b2p1VmloSlV1ZmtDeVpjTUN5OWtRYkpTMmErbUVJ?=
 =?utf-8?B?TTR3YVRESllYUGZxZ0N1WnYyUzgzZ0ZDbGwreG5lWUJnL0JNY3dRTW1BZjhk?=
 =?utf-8?B?N2lUaytrRXRTa3lWc051RWEzODhFNkNHbmp0UXM0bTlGSHQwVXZLSVZJYjlk?=
 =?utf-8?B?M0U5QWxWbVNKMUpraWV5OGI2bUJxR2dyME5sKy9LZDUyYmFrY0xnbHBBNEsw?=
 =?utf-8?B?Q3p6NjdoNlNHS2NBZnJBQThvZG8yRUdXUG4vVThVeEQ5ZVdzTGFTNktyV2Jo?=
 =?utf-8?B?RFk4dHQ4ZDNRVWhkMWYyYUx2MVpzRm8zQ3JId3lRVnEvZVRUZVI3VTBxb1Ru?=
 =?utf-8?B?cGhmTzV3SWViNjFVQUVKWjVINjVJYUtpQVlaZ2t3RGxuYXpEa1FmSVlJeU1i?=
 =?utf-8?B?Z01Nai9qaHQ4R0dmMHRldE8yU0dQQllEV255ZnVNdC9HRnhwaUJkYUM5VGlK?=
 =?utf-8?B?aSs0eTU3YWdGL3FZdC9nZzlFVnJYQUlQUyszLy9FUy95TVNhSGsxOXdqbTYz?=
 =?utf-8?Q?y1qYgi4p8JEX9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48d485d-c340-48db-7f75-08d936207a06
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:25:36.5284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2BnK48RHP6JP8GKhn9jPvrHBK41NZ7rV7UyvCXrNHN+uRt2bsSSqmW7JV35Alns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lvjianmin@loongson.cn,
 amd-gfx@lists.freedesktop.org, lixuefeng@loongson.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good to me.

Somebody could try to investigate further why that is necessary on the 
platform, but radeon is only in maintenance mode without new feature 
developed.

Regards,
Christian.

Am 23.06.21 um 10:14 schrieb Tiezhu Yang:
> Hi Alex and Christian,
>
> Any comments?
> Can this patch be accepted or anything else I need to improve?
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1443649%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2162309822114d2e41b108d9361ef26c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600328822651335%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2uxyAGk6sHO3lqw0FX6HITY%2Fbj%2BzEMfSIcqbzmiguMs%3D&amp;reserved=0 
>
>
> Thanks,
> Tiezhu
>

