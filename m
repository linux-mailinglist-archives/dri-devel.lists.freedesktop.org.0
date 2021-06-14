Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A593A6A0E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 17:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004989EA3;
	Mon, 14 Jun 2021 15:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E3989E7C;
 Mon, 14 Jun 2021 15:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJRgT41iVrM6mCgV7tKYGcyv7pQN06GWr0qF0Dwhe2s9TV7KfXRGoQVHUJBw2DBtstJGM9YfKMAod70c3MtZqYpp51p2zS8/uCeqbZLInoVDRoXJBDYC2wn84qpa2/wXPDUu7sW48nLglIFUqNp7Yeo+7Z7AOSrAPYcyLbZD+AJtwPbgIQdppGgUObEhLxlTYXQFDBzaGzL3TBbiofIqCMBt+B2uOfVFjjOuvtbrReRgoOC5Mtwe4tgBvR8sQzrWlAxWIW6fdx5j2ZSVQti2tJg6If4PN7HTZyfmi2gA80J2cG2XNC/OL9VHfFMbs5Vg9DQi2TGmKjkyWUANJquSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDP1t8+lmMr7VhDBPLqgoYgGfcJGKhItKFVxSmGtqI=;
 b=Vj3FY+jMZy1HsMyuITiATRot/Lqtuse1jOIHDOhATObwgo7jV8pBM+LEErQ4yUwp9H50XkoQ5fjvw89cDjfLINTtOPfMg4c0BIZA79B/f2FEoYAbP872exc25pLPOmNl7gcHaAsspgB/e0wA/iXu04HvspwxuD/JIZ2Mv0bSRZRwtEw+XgtwwoEGrsOGLaryffHtD57c1YjjHULgR+iSXumyZs0MZr7MB5LUXbyGTUx/mKWmP3j9fUhf+viIYu+AxoX0RD+Bi//Kiol8gNZ28f56qtcO/cOcIMHCr1wtkimwVG7D3SOQOBwnV7/NG4RKH5ruun8znbCTWQQPLdDo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDP1t8+lmMr7VhDBPLqgoYgGfcJGKhItKFVxSmGtqI=;
 b=v5E8JyuFkBMGiYnLj4HxPfZ7scHZBLtTnH1//mYTee7/CZqnB+seCChq5M0sM8S1mgye5nbwkcpXFzthXolx0AjR8jDlZdJJCozCr2aq8JxRQYRXxxc9jzUNHATXM8kDvjkyPqiDbeqPROpyJd5bMfV6btBglmllccPt7Nom/Kc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 15:26:03 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 15:26:03 +0000
Subject: Re: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
To: Matthew Wilcox <willy@infradead.org>, Alex Sierra <alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
 <20210607204226.7743-2-alex.sierra@amd.com>
 <YMEVN8XZbCnyPu9/@casper.infradead.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <652c22b4-8ca6-acf9-653c-c93166c83770@amd.com>
Date: Mon, 14 Jun 2021 11:26:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YMEVN8XZbCnyPu9/@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::24) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 15:26:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4916b2d9-e894-4756-67f2-08d92f48b8ab
X-MS-TrafficTypeDiagnostic: BN9PR12MB5368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB536864241D148B855EB004E492319@BN9PR12MB5368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9/37U4gyD0pdCQV1d9oAlPSzQBOYXEV2CR0e0Pk7i51kVstGNe1bktqjUT9ZdHMVBlfKOYQtI4ui1zTrzXgz6UYq5P1fm2q8z13VAZSiilnbhDHadF5PBfQQBWgYcgzuTNYtSEtUXqtUNF490EJuy+r09fDcbSmQnBU6AKVW2kc0bDbr7US6hFSot0dd2fl9aRNwdQltlSJJ8kedl7IekElElfmqB5VXDbIiiEzgMnvpeLwJ4GuRkTpBLHgyG7x1Orw11zhVP81gBIFmVLO+FpAkYCDwHo+339NdyVQNc4Hy2cou0FMTzkopOmlFnaJ/pLmXmA0OLR1pOJ+OJOXZjyMsIGRujl3B+Z0nkPZmwqYSj4OJAGjl1J6RkU36dlLj3OWYdTdesyOILGw2zV6yEV72YudMyW3rBpJaKMlnXEATUcB0Hcn0lTQN6ncwp4XBpbgpSH0+PQK58fq1X+cAa7/HElDMuoT7cGCv0BhjjUP3GYb/TfMJXnk0Z6Si3RlGCPlALiK2lOaPZ8Vaa0FgTSqAv1Vg2eMxy6gnKnv9c8iVHZP71BZ4kbE/kw2SrpygGcNCbh0Ws1kLYJeNFYtV+4o8OE+WptJZfyASV96kw30LE7UvLH+6mCy1787Y6JP9inqAQMnaqjKs8ujXq42zHqtOu4FG6s1U5oy0b7mL2Mb89Pa/XlGvht6BAE+xaHr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(66476007)(66946007)(83380400001)(66556008)(31686004)(16526019)(6486002)(186003)(16576012)(26005)(110136005)(86362001)(5660300002)(478600001)(8936002)(6636002)(38100700002)(2616005)(4326008)(956004)(2906002)(36756003)(316002)(44832011)(31696002)(8676002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xUWldwUFlwQ0dBbW5zWXNCVzVqZGNmZGJlVTZVU2YzSDhEalJUMENseHNO?=
 =?utf-8?B?L29Pa2xzZzVSQXY3MDU0ZFgzR3R5MkMrMmJGSmRtb0twL0s2Ulpkem5oRHBr?=
 =?utf-8?B?SlpEWmpMZHFNbXlmcnZKVDlWbDh0bnBEaHlPWnk0WlZDeURFNE5nOSsvczdM?=
 =?utf-8?B?c1NMS2hWT2QwZ0VwcEw1cHhuNjI0eElzUXZzdEwxZ0JMaXhzdm1iVVRtVEZB?=
 =?utf-8?B?cE5XVllwQ0h1SHdncHhiVVorcnh0WEpTZnVBaXNBODNvZnZudGhOUzlMQ3FM?=
 =?utf-8?B?YjhyQXczdXBHa0o0bC9sNXdYWU5NK01yOWpEVXpMa3lMRC9ONTB4UGh6amVv?=
 =?utf-8?B?NWxxOG11QzN6ek9jOHJwL2RDYmNnSXlFbTRjcHE4SFNkUkp5ajZxbngvNUVO?=
 =?utf-8?B?aitWYTI5L2NGdDZXYUdSWjZuZTRZWmpvR1JNVHJtSDEzR05JU202UGh4Z0tF?=
 =?utf-8?B?aDlta3hDQmkvSkhlTTFmZzFkYzRhQ1R0NHZ0b2R1QktQUnZObnJwQlU3aFlJ?=
 =?utf-8?B?Sy8wMWlnc1VJSGtCdWphT25Gak9SVkx6dFAwc1hKa0ttREpYS3B2eE5DV1hn?=
 =?utf-8?B?ekMvR3lnY0kwK3hvQk1uV2ZCOUI0VUloY3VKcDhnMjBuS3NGTGpJQTF6NTF3?=
 =?utf-8?B?cGdIVjQ0dUVvd0QxS0haZTNZeHJaK1lVNGlJRWFSVS8rMCtCdEt1Q21FRllR?=
 =?utf-8?B?N0wyRFNFdnUxQ0lFVHRpcXYvZGJpdVFSMTcrNUdXaWQxVXlMNDMwSXZxTDRr?=
 =?utf-8?B?ZkZsUU5vZXRqV1lENEhXK0UzbGU3ZEo4TkNhcVNQZGVCS2JIeCtmUEdqRHFw?=
 =?utf-8?B?eUdpRExUYzlPVWFoVCtseUgxYW0xUmdEaWVJTy81TVh2ZXQ1c0VEbzFpWXF4?=
 =?utf-8?B?WUg3VzNBdTYrTXJJSXQveUhTSlRvb204K0E2a3JpQ1owVGxsRDJVQnhUb21E?=
 =?utf-8?B?YVZ6Q3p1c2llR0kvRGRFUE1NczFlOFJZenVScHF5LzhxeVVIRlpmTEs0N0tw?=
 =?utf-8?B?aCtDeklCQURRbVpLeXZFSmxPbnliMmJxV0xWT2l5clVlOHNGbWYvd2VqRG9C?=
 =?utf-8?B?NFRrbnVoMHROTHVtdXRYNVE5ekxYUmJycnRHVUU5UGdIajFxMG9CQVhNTU5z?=
 =?utf-8?B?dDJtUDdCYUh3VkJkZFNkSUFPU2M0KzdGaVYzVlBaL0lqTFBmci81MmJRbG9S?=
 =?utf-8?B?MW1keVJWeFhQSG1aaUZhakQyR3ZEYzRiMWl1QVdFWWkxR1pNeG80ZWhHNWN1?=
 =?utf-8?B?djBTazFNdjA2Qk1ZcE1EWldob0RMSEt6di9hOFNIMEpCTjdSeC9XL0h3WWhY?=
 =?utf-8?B?TVNQbVlYTnNkbmpjUG1JZlZPZURFU0dvTTRLQ3E1WG1iVFNFZlFUbFF0RVpy?=
 =?utf-8?B?RWZVYnJmU0poTGMvOXBIVjVMQnJtOUZ2eXhBanhLWUcyNS92TGZvdFZoemRi?=
 =?utf-8?B?UGV6N2lBblRnbm94V2VydTJNOXFyWU5vMzhHQ2huRi9YRjQvWjFkaHFVSEE2?=
 =?utf-8?B?Ly9uOUhWNUlhVFhXWFRSbkVrenFzM2crOWdwQ2w4UGtjR1dVdlBER1RaTGNN?=
 =?utf-8?B?UmJmbk5NL2RNNEFIY1g0Q1ZJejhHWjI0bm1kdXh5T0RWRFNxYkdTSk5IYlRi?=
 =?utf-8?B?cFdMNUloSm5kTmRuSU5Veng0VGRwQ3QxSzVZQjNBS1FHQlJsckx0aXRRbXAy?=
 =?utf-8?B?bGk4RVY3ZEJmZHB1clh4UVFjRm1vNXlOWkdRMy9leTg4cE54SnBUZDdLays3?=
 =?utf-8?Q?nGmbjQPaG22JBUyhaTA4/C6/2/W5sYEA9Di2r9q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4916b2d9-e894-4756-67f2-08d92f48b8ab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 15:26:03.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTcRzIzyeo8v1R2EP2dzlHgBo3bNi1rLRUggAZ2nNW47rVvWrE8N8uE6Ez0szzLNf+K7pZ88DNJlETBwmVSGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
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
Cc: rcampbell@nvidia.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-09 um 3:23 p.m. schrieb Matthew Wilcox:
> On Mon, Jun 07, 2021 at 03:42:19PM -0500, Alex Sierra wrote:
>> +++ b/include/linux/dax.h
>> @@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
>>  	return mapping->host && IS_DAX(mapping->host);
>>  }
>>  
>> +static inline bool dax_layout_is_idle_page(struct page *page)
>> +{
>> +	return page_ref_count(page) == 1;
>> +}
> We already have something called an idle page, and that's quite a
> different thing from this.  How about dax_page_unused() (it's a use
> count, so once it's got down to its minimum value, it's unused)?
>
Hi Matthew,

Thank you very much for your feedback. This patch looks straight-forward
enough, but do we need the filesystem maintainers to review this as
well? I guess we should CC the linux-ext4 and linux-xfs mailing lists in
the next revision.

Hi Ralph,

Are you OK if we update your patch with this suggestion?

Thanks,
  Felix


