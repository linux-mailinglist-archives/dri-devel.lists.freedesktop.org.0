Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495997054A8
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 19:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60310E27C;
	Tue, 16 May 2023 17:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E42710E27C;
 Tue, 16 May 2023 17:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVnjM+f7C2lqDXrixxKHXm+KGToFilkVKG7voHiZJkl9myymf+ObksTsqJnozF3a48KwijkbGmMulU5jst8aJshjfFhaRlmmq0GzwkVngEK/G/c3vidU3CR+RqREa6/+F32qSC06O5u8WuiqatTcnfJvMbxuqkqLC3+2f/4OHFBx+iFS03h4/KQ6PUbRvAw1GtyS2Lm7HaybrIay8mu3JLu6zxOX/fSJWL13kN9uNJreiAyKQYu/z0Is3rRNYqsA1YVVeZF9IB95NxFVu5xUCSn5+aNp3sv1khyH0/Hu0SRA/Ryqc5WRvzW6WjqNZ6Uzfd+ldn1GOG7HX7Rkepu2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69PrBF497gMQGtzXZi1dErDa8PqQHhoZZT/PmP8uQpw=;
 b=RXKIKSBpRM42cF7kSwgI99SW/ie0iFEGqID8y/tQ6mG+gVVQ3TM2a5MIhrS5x+mdVFD+Gr+4g13Qr6VjzybNkfGKVr8oNI9M5qcwqSg3Vg9IgOy+I6SVz82A9zbaor/ov1xh0FXyBWKYEM+UbReXs5TbdfSEbiHcZODGl2D53b3CuE64JyR2FxddHsYOa3jxskAJSfNguxIeaytwC4jekY95QTspS1f9FA0rCFhwnDP1EJVwnC2xnrcJDtvqHRTkeV2EfuyYCUsYAY0f80Qh3hliNe/ptH/K8FozfC6nzRiQE2vrpwfEfQwoLlHKPMrlPIEZh6uGzZMoERCqqAJvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69PrBF497gMQGtzXZi1dErDa8PqQHhoZZT/PmP8uQpw=;
 b=quRh28OSYSJ435SWGJhzISIQV0rXhjUo9V4cN7mBFBIhZJZaadrKa8VsKiSsaFFx2AiJfXXxoh2z0IDf9TgfIHqqK829Eqd7KxSyKCG39v5WtzoqIibhjezx+X4RSZhrbvvs8B+yM3xxXekWyWStoDI/52thOg/L9hnSfhIOb+Qmdub9smBDN4PTDJnLl4/rme0GnS15k1WyZZvNM6IBvlQUTr2Az8gzBewG6Olh61Db9VC6GdoxqIoX30UCCfuUDk5ghXS11gY8SlWUJJmQ33PBHxYWjTbc9kByoPHR5Kmq0uZn6pBV8SBgD98g5UI9zLALFhGVj1PlPje5PwS0BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31; Tue, 16 May
 2023 17:04:02 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::e01a:d41e:80b4:7cef]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::e01a:d41e:80b4:7cef%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 17:04:02 +0000
Message-ID: <dfb84ac7-cb5f-5631-3f71-7f882300e240@nvidia.com>
Date: Tue, 16 May 2023 10:03:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/6] mm/gup: remove unused vmas parameter from
 get_user_pages()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Sean Christopherson <seanjc@google.com>
References: <cover.1684097001.git.lstoakes@gmail.com>
 <b61d5999a4fc6d50b7e073cc3c3efa8fe79bbd94.1684097002.git.lstoakes@gmail.com>
 <ZGKC9fHoE+kDs0ar@google.com>
 <b97e8c2a-b629-f597-d011-395071011f1b@redhat.com>
 <ZGOTadDG/b0904YI@google.com>
 <7e9651d6-382a-287c-cd08-03762ccce1f7@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7e9651d6-382a-287c-cd08-03762ccce1f7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb85184-8d4f-4fed-b250-08db562f8c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQpI8jSlx6im8pDgxB+kchrY6HZIxIR4s8KR1MLTMJb8OXlbeZtzUHOsvwLjps75aLRVy5plPcWOmuG7weVCsunAcsOQYnD6cBw6YxMTltPlmHJLGcub2eVTcr8aLdW1nCLG/28ayAvx6e3ypZ7UCmguaIUhfW4f3LaMbZqfDaCxUvtc2v69+cmvLPAgB2lTtxuip3Ve53hZdtift2A+PGNKWBg0p8RMbyweRcox48rzyK2jXSGcSvBdGfaRWEur0Hrl/dZka7IpL5KDnGirtkkmHt74sB6dbxZoz0E5+qX8vBOVNRDuTUpC69nOGkKwbQfCDIBc2iSyo0/jW19r2QBPk0Rt+PvcKiX1RClJEuUAxtutNAF85nxXSrOL/BqS57U01OuIDBpSRv/a0jImik4KFqJBwPVfd5gXi2xn3Jz2yFJ8DRXMudLmEGbXKCnaauITyTQh6qiVvoVMznNKfDL6nz1q37wpdq49o7JFC4XFdhQGbxIz5XHTJmMeAOLLQF3W/9mdgre8A72mNCOuU5zCDK0wUHx1QYBAiPg/CZdBM7OJN6sBqOL1V31VCbl2XLJzTRIod/duz4Js76EJwXA3IizpLILu/Wsm++4GOL0IIP4FiUeDJuJbH+LFkoUHB+Hop5CVhuDAcmBpjVHKkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(83380400001)(2616005)(66946007)(66556008)(66476007)(6486002)(478600001)(6666004)(26005)(107886003)(8676002)(7416002)(54906003)(186003)(110136005)(4744005)(31696002)(6506007)(5660300002)(8936002)(2906002)(86362001)(6512007)(316002)(4326008)(38100700002)(41300700001)(36756003)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFRTEhianVpQzhyWnFxTjNRR3o1NFpPZ2dUYjNSQ20xUEs2LzlCNUJCQ2NM?=
 =?utf-8?B?em5tS1Y2bFFidWNvVVpqTjY5bjM1RGlJN1ZTVlYyNmc0bG1ycHRvRkZORjRt?=
 =?utf-8?B?L0x2aWtGNFRVTGJRcTQ3OXVDRnRodlRsRnBmZkJVNG9Nbnd1SmVVVnlMOTNw?=
 =?utf-8?B?Z0svQWl6aVl0eFpEVnBaQkZKUWZVYUZ3MHk4aDJXWFRMdjRZTEdUWXFXWWxM?=
 =?utf-8?B?MkhOdGM0MDR1R0hUTE1UbmcxaHV1WE4veWcvQ0s5UytwN2Z4QjM1UU5sMDVG?=
 =?utf-8?B?OFNUazdsSUorMnFObEdKZkRMbjV2cDZDOUphblV6VFhtOWhNL3hEYURLczNL?=
 =?utf-8?B?Y2MrVEVtUjhDdlJKZVd0M2Z5OFJONjRpVjVBS05vQXlCL3ZNU1J4Yk9Hckp1?=
 =?utf-8?B?UUJ6Q1hwbklDajRhU3djekNtc3VCMzJmd0tqeXYrUkpKYS9OcjFlS1NMRlpv?=
 =?utf-8?B?N05hZitNanR4QjZleFYyd25IZ0tkdVE1TkszcHpBSzJzN1ZicTVGVDRsdlZW?=
 =?utf-8?B?bkx2cms4YnJIdXBJTWo1d1h0eGRpWmxOYkM5RTdIbFBiZVdMcjV0eHljbVlG?=
 =?utf-8?B?TWtWUGlqWFRYMFFxVzBtY2I0SVYraWhHMElMMjlFK0ljNVE1MDZTc0h3Q096?=
 =?utf-8?B?cWlCdFpZNTZaWjJDOG1FdlhlcnRYcnRHK1NJTC9DUzNtS3RDZnM5QWFHTEJQ?=
 =?utf-8?B?eTRBLzdkWGNXRmt1U0dzUzhJN004S1FCUy8vcThuRVdFbVhFOGZUb2UyeE1U?=
 =?utf-8?B?SUJ0ZUlWTXVtU1Vjb0UvSDd4a0V6azZIUGF6SUlpMVJmUm9HTlNlNFIwdmdW?=
 =?utf-8?B?NGs4ZEZWR0l0SFRaVHRtMmZXd2w1Rmk2NGNmMEFsOVljc01XMXRpaVBMNGNq?=
 =?utf-8?B?K2JRNHh2Q2xZT2d2TFhZenp1UVhmcHBZTzNFWldKK1FHTWFjaDY0NVY2YXg0?=
 =?utf-8?B?YS9YaUJ5L01jN3A4YU1pMEhWT1VKNGljYklWN1lzRzE3UzI3Z1ZEakowc3Ex?=
 =?utf-8?B?enVnQ3NteDVXQW1lb1lmSUdrSVl3S0VOVkRNY0ZtYXFENkFVc2d2TlBUanB0?=
 =?utf-8?B?YnBsTjgrN0h1dEZ4MHhZSjUwdDRQUzFHcEJRMXVlTVo2dGNCQkY3VFd3ckQ5?=
 =?utf-8?B?d2hiS2JnUTZNS2YyODdDbmNhZkhZYjlhcE9MUjFLUTdhbHBKbHU3SGJIeHVX?=
 =?utf-8?B?eW1adVJaNndzSXhkUmxHWkVkNlJwSWRUcG9vRFBjTHFUWjZYOFJGZlg0WFR3?=
 =?utf-8?B?MVBHQmxLWE9SUW9NZW9yUVYrbzkrLzdFNXBUWE5KOUdremxxNnFBbkJwTjgz?=
 =?utf-8?B?NzUySVlIVDBBWjZ5ZTBGclZQcVh0T3JDU2FFejZ1RDZtZlFUNlFQZ2t0NUdh?=
 =?utf-8?B?ZitHODVNVFQ5WkZ4andhdXU5anlZT1FpemtXVVJOL1dwZENWdUFQQms0Uy9a?=
 =?utf-8?B?RUJ0dGEwRzkzTmxnUnJ4Wm9JVGd4OTdoTVZUa1l5RmlCQ1BlZ0QrTkEwVVA1?=
 =?utf-8?B?MFUwZVBlMnc2NVNWeitUYlU2a20xTnByV0FTZGVhdXArSVFPUkg2dTcyajRt?=
 =?utf-8?B?dnNyamNkTTlXZ3F2TWVmTjZjN0llQkEzM1BGeWxmb3Zpa2pNbHhuQVIrUUw3?=
 =?utf-8?B?T3Z4ZGQ4OXFPeGxmQ0tZbHFYN0tiRnJSQStNenB2TGc5Z3JhK252S1NuZC9W?=
 =?utf-8?B?QXAvWkMybWVCdi9id0M2TnNnbjlBZXkreDd0aW0yMTdhT1dGeUUwTmptZE9V?=
 =?utf-8?B?cDZycUp0dmRXcW5Ya21vMWFaVUNkbkpwYjNpYkI0ZTR0ZEgxRFJaelNUMnUv?=
 =?utf-8?B?TzBWblhYQ2sySlRXcFRUb2xhaG1XWEVsM2VkdTkxSmFheTlFWGx5dzRtK2c0?=
 =?utf-8?B?NmJ0cTB6OHlHZXRqL2Q3Ykl3dVBRYXBaUWNkSER5bTgrclBJTThLUDN1Tlp1?=
 =?utf-8?B?YzJHMlVsRTJvRGNvaklSQzd2Z0s3VC9lMlg1QzB4eUZXWDVYKzJ2RkdsSnVV?=
 =?utf-8?B?bW5sek1BMUM1Q3lNOWNXWUc5dXJXZTNTbFNNRnNLYWlOZlA4Mkd0WG5iTzU2?=
 =?utf-8?B?R0xEbWUrM0ZtU290YTNDV2NxYS9KZHdUQkJEanJxYUFvVTJvVVZqaEFxSmh4?=
 =?utf-8?Q?oEm6zP/EPsoorC+JtPC84NJEL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb85184-8d4f-4fed-b250-08db562f8c06
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 17:04:01.9836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xgab2dXUr4ntzf2cb6vGwVzPf+rWvuepZcnfhtWENIbjW33+FVBwykRsiaIad+DegwTK3+OREbC6YRITI22cKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Christian Konig <christian.koenig@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/23 07:35, David Hildenbrand wrote:
...
>>> When passing NULL as "pages" to get_user_pages(), __get_user_pages_locked()
>>> won't set FOLL_GET. As FOLL_PIN is also not set, we won't be messing with
>>> the mapcount of the page.
> 
> For completeness: s/mapcount/refcount/ :)

whew, you had me going there! Now it all adds up. :) 

thanks,
-- 
John Hubbard
NVIDIA

