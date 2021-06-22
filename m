Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CE3B0920
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318706E5A4;
	Tue, 22 Jun 2021 15:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374B6E5A4;
 Tue, 22 Jun 2021 15:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krVqSq+4j/Ul8m9j1osRDjO+dezriWsplNBYoBQWAZirdVRLo6hpW6CEeTtmfsEgJ3xpDF1kdeptJflXdiMMOw3Cd4HiUtqCHpykbzq6YTjSv0JvFfN92rhlVgjq2dqaVfL6YPEwvqjjIndGh0WbAK9K2gETfyxwHKUZs59rcrr4Veavhmif+131ABBT01ICqESxUdt0MF007ICG0+A4bqsF0wQnotzmbIO38b1WbCTrlAStdVE8HyzTHLc2RxnGlZ2mBQhfpnFxdUyEr/eKuEXkToLvrcK+ifFa6zYaGI2dUZMKBYkPcTc99ixOD7xqyYL2p/TXWNXLcrjtS5Ql3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9n9qCNE+At4yMnMY+C8uUi5JIXdhVcyv9eB7lHbDQ4=;
 b=DlIjDix42eCY6xTwfRm8RVgb8PK5Z93oqp45c81VrmnheeoyvHshWrkKdZA1xtjd8yqb+UPEPS+fh4tdXmGHBcCQfKYZ6jYBTF3Cp92/sgbOJ2AFUD//K9Gfw4dO2X7+L3Y+Ux7C/VvGhfMLddV41OfCZylKxu/40w5TwuPRWgG3dak6svaSsUkHFMplD7TmMD481yx/mal24RHj73X2E94RnmIGqZCoIx8KYlM/5kjv3py1f6VAb1ehht4W3YJgRxVY8xgtxi7h6oQjt2nTisTlwmH7LR4SLy0xUv20i/E3wheXh/LLWQNc5xIvUQ4IAT4vHTYhYMe1D/2eqUlXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9n9qCNE+At4yMnMY+C8uUi5JIXdhVcyv9eB7lHbDQ4=;
 b=kbKWqj91oEcfWbSyjceMihUn3O2uz3T0biqgeDimddIflJa73oldPia0z6dUwLoa0iriDD9dKMnDG8Vcv7fP85+sAS9LLDjD6QQ+JNhI7ZxMi5zWhPmVIcc/prabEHkNG74VungZVgfFy4JAzLiNVTwYnAiyINsnu3DL2tEtV4Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 15:31:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 15:31:19 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
 <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
 <20210622152827.GQ1096940@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9ff1a7ef-a5a4-dd80-6f19-304b668d82a1@amd.com>
Date: Tue, 22 Jun 2021 17:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622152827.GQ1096940@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
 (2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4) by
 FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 15:31:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d43cd5cd-8df0-4064-32dd-08d93592c85e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44050127F9FD7D578A3B1FCC83099@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fZ/Jt5jfaf5m/TiguCCTUdF0cOtxSJljBtujmKIg6FU1NND2Gsr9zpUybSA9DDLcQgl2nx90ZptKZlKvORag1PB/5ARVHPo++ca5lofbjH0NGhzCFUVNeDr3QVRruzZ+ensr+UCxKKe4UlF+A5CtXY/An8mU7gZlTbyAmokiclMb+Ol9cMPeLYgTqB76g4EbB5ndWSFUe87kNcHPQ9I11a2R2qr5EOX+Z8AMVXKH3v2LtOx6OFuuUZP8fHotPLpVWiEo9DlFRPcnytMFfzSD4lzTKtArusAaWmETYaiD82qoKeZyZkEam+6b6+zQSCx4rqoJGFehpHVbQLA7KXyEu7R/ek9kMCK4Qx4nKylEckb7oR9QKdDNoCQxMch8FjCh2YD9YvVTaVzjSy+VK2KOB75IHiVTkmTeOXqAB8PSSD4XvGpm8BBaikMcEz5YPjVvMXnCJWNIF6IZtoBJ2IgucM1QPwdQXH0FvNKdyjmVucqwTfwTHFnvViw5NDQx6OWFWOvly0tDi5pMh79nuVfwr6HAxFhwidvghfsyKtfe1Q2g99300JtIV0WM8/odrgk44cnCDwY7DapmHZT4+f+u7EXeDzV2bdZmadB44f49fHMfCKqyHE6M4UVOc0qaJuupHzIevVwzA2JKy14xgwEjPRZHfnCrc2i15uQ3S4lcOtfnJBvTJVbek2U7Q8KIOfK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(498600001)(31686004)(66574015)(86362001)(6666004)(2616005)(38100700002)(31696002)(54906003)(6916009)(36756003)(4326008)(4744005)(66476007)(66556008)(186003)(16526019)(2906002)(66946007)(7416002)(8676002)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFCcE1CUk1GaE9WMWlZNklKeWJOQ1I1ZE02WXZDcjRYTzJ2OVR2YllmRjJs?=
 =?utf-8?B?S3p0VGYySXNURXRSNlhzdlNQSHBTVnF1WUxjcEtSVTBJNVBGb2JYd2FrUGJ5?=
 =?utf-8?B?VnN1UGxiTTFQSEo0NVNVMEpIOURGa2FzRFd3QUc5TFY1Mi9oWExoTzRqTzdr?=
 =?utf-8?B?WENmVldEWUpJWERqNnZpM2Q5bURoYVpJNk43UU5NZHFGKzhUQSsvaDlqMHMw?=
 =?utf-8?B?ejNnVVRhUlkwTkNONnRDMi9WYU1hbmh4L0xBN0haakZxVHNtR3Zpei9WbFJu?=
 =?utf-8?B?UFptdVdwV3Z5Uml3VUgybm9icFlydWp1UXdFOERBVDVWUXhzM0ZzMzZCcGZt?=
 =?utf-8?B?NnFEVnc5Um8zQ0xjTG9XeGFYYXJ0MzlxdkZFVytYUkJ2aVJiMDB5NFhwV25F?=
 =?utf-8?B?YUpka0l0bjFyMkFxeDJKQ2dVYjhHaFdINHhzWGpPTXlhem9ZckNmaXJXeWdE?=
 =?utf-8?B?RmVJSjRRajZrbTU0TUpINEFPajk4R0V4cWlKNjhxMlRYb1pHQkJJMmE2U2lk?=
 =?utf-8?B?dXdqNDM2S2REYkk0b1BXdXZkU3R0ZXRxak42cExvWlcyZUs0czFMSGhwRE52?=
 =?utf-8?B?bHRubEkrTER4dUVGRk1QOU1qK3JFTmI1bVRFWTY0dnpRRUxLZENXM3lvZkJW?=
 =?utf-8?B?cFZubUpIcElKeGFvZ203b1hUZWNqTjRBQmdndzFiWE50QjhaZEhOeWJrOWRQ?=
 =?utf-8?B?RWFXNmNFcTVaRjZjWjc3OWFVaGJpVlB1Tm16QjZER1pZLytXMm1vVCt5S3hC?=
 =?utf-8?B?ME1uTDU2dXErYUNTdi9EYktCT2t0V3B5K0FHM3RLaG00VkloR3c1Ly81VkFi?=
 =?utf-8?B?VUF6N2ttSWxPMGZPWGR6SVdKTFhZSUlzYXBxVnBCNnF1SzAxVFV1K0FHb05a?=
 =?utf-8?B?UUFub1BVWGhYdEcvYlhkUXRNZ3FOTE9OcDNmSkxpcENTNXMvbTQxZkIvODFE?=
 =?utf-8?B?Mnp6MmVxQkErOFJCZUM0UzJidHcxeTFJRTRsVDhTdG9VZXd3SmE5TW9lTHZi?=
 =?utf-8?B?aWQ0MDUwV2lSWmZEQ2xRSnN2MFY0cklPQTN2dFRORGsyeXBRVW45UDdHZkRr?=
 =?utf-8?B?UmFWWFQyYzgrejhRQmtxV1V3M1d4VXBoQk9KRC9zVStQVGxrLzMwZ3RxWWNP?=
 =?utf-8?B?Zm1RVEdGS2lwSVQ2ajJlVGZ4dWQxNmlJSHpVeDVOdWYxa2pQWXo1YlROTDho?=
 =?utf-8?B?MU94SnpDRnp1U2E3SnFWQmFwb2IzM0tnNFJYWlVsZlFGZWw3eDN4bE1WQkZl?=
 =?utf-8?B?YWJhNVRxQ1czYjNLVExPbEdSeS9jOXQ1K1UvUmRaMVAwK1QxNjFiemIvc1dP?=
 =?utf-8?B?cFd6ZnRUN2FNSVdQdkErNmN2L3JZMG9JNVloWWpYTnh6MnRxSUpqNTEraGtK?=
 =?utf-8?B?RGcwQjNFeWpHV3Z4dE9rUEo3Rm9pVHpxeG9tbHV4OUtadERMc21PNTloRG15?=
 =?utf-8?B?V01TZ1pERUZ0bXl6Nk82VVpNaGsxcjRtejg5VnRYcTdjVm5aVmoweFRFZ0FF?=
 =?utf-8?B?YTV6U2h6UG5GS1JJZUFvNUxBYlJCY3pIMnRUUmFSSHJNZ3ppNnlYVXdVVGxE?=
 =?utf-8?B?YkZhOGYyQmFJYmY3SEtOMFJPTkNaN3FuNzcwL2x2bXhLWE00L0U4cng5Y1hB?=
 =?utf-8?B?WGYxVWRYaHhqSXdVYzl4Rk5RTnJnekxJdGozWVE1Vng4WnRJVGF5RzVQRGtT?=
 =?utf-8?B?QWZnZUJmV04xV0VzZDNYbnRpM3l2MXRLMGlmL0h6M2FpbnRyY3hKbE9oZWQy?=
 =?utf-8?B?ZUtXaWs4ZVRBV2RDclNoZGY0ZGlpSlV2ZUhkelNLbGxEb0k4Sk8yd3ZkWVRs?=
 =?utf-8?B?THdLMENlRHZBekJjVk1salJTdkJlS2ljWVJUWGs2clBPMzRoRHJNODl4bFFN?=
 =?utf-8?Q?M3wK6IpvUYJzS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43cd5cd-8df0-4064-32dd-08d93592c85e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:31:19.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHaETBF3XO8SeZu21kVfsVX3dgokXzyTMZqRN23nBPlHp21wRjwNGA02LAQ90URa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.06.21 um 17:28 schrieb Jason Gunthorpe:
> On Tue, Jun 22, 2021 at 05:24:08PM +0200, Christian König wrote:
>
>>>> I will take two GAUDI devices and use one as an exporter and one as an
>>>> importer. I want to see that the solution works end-to-end, with real
>>>> device DMA from importer to exporter.
>>> I can tell you it doesn't. Stuffing physical addresses directly into
>>> the sg list doesn't involve any of the IOMMU code so any configuration
>>> that requires IOMMU page table setup will not work.
>> Sure it does. See amdgpu_vram_mgr_alloc_sgt:
>>
>>          amdgpu_res_first(res, offset, length, &cursor);
>           ^^^^^^^^^^
>
> I'm not talking about the AMD driver, I'm talking about this patch.
>
> +		bar_address = hdev->dram_pci_bar_start +
> +				(pages[cur_page] - prop->dram_base_address);
> +		sg_dma_address(sg) = bar_address;

Yeah, that is indeed not working.

Oded you need to use dma_map_resource() for this.

Christian.



>
> Jason

