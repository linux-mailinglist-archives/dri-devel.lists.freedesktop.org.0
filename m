Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C767E2FD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 12:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B5210E458;
	Fri, 27 Jan 2023 11:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E2510E458
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 11:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzQJ8fBUiTZKYi0A6OCMWjn6yhkZ9I3x8+eZ4/bs6T0SBugdvojUQbXZttOINoTENETd2JQjjKGAWVj+fbRHL6ENQMfT9ECTmcgvSiR8ektKQ227KJsUA1WebWYFKs89oyJmo3kTKq7DhomY3U3TAMGjXm1VqdZkqUVGOZX8KAsPBI0aMY9AlTm9H2hi0++neLxpO5QpPI2ovzORs2wpY+PuKMjQ/3+8Sdi1IhWZT1fsSPGKjsAWBSA1c2gniUUvqpa8XoO6g3mcBeJ3a8n2JKvfMiYfJ5NDGmeIm5xhrJKUHmb4VAwmgw1r6vGi3j0rKQWf16ZasI39Zhm8TcT28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydsw0zBCuqNwyQsT0xnS2PWx/byn61AQCSDOezGQ3aU=;
 b=Mdf+0JqU1EN4fyMNtm58VyRiae+cMM1ZNFFwkp0tZam0oECDfgRvl6JizdZ2Ni0YOaKr28QRD4JIptcWr9I7TR4yVA4xS7nqRvRO/kunBqtyOEa2fSUdczy0UnjrmUMCOxM5nXr9afR31S0KroC4xMwv4Eg7i8HCjbJ4ibn1AhKWwnGVrYAwYwk0RFDYbTB+useyTGY8WtOGcxnFVnbwFLVXli6izbptlMS451W3MYI8bOZCpAvJisuHYwzcT70N/jz58KVsgjnEV+CYKyExAiK+Ly+GzcPLGrApDwLZV2aH6Zqwxns+qoa/WV+RdfydRQxS9S9oA0EY4y/5Z/5q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ydsw0zBCuqNwyQsT0xnS2PWx/byn61AQCSDOezGQ3aU=;
 b=GP+VgJ6tKp8t41Vt4xCuyJz8NTVndwPRW550rfS5oOn9FmiQdxX0V+mda2cRxY1L845d0EJqbZPMnpbz5jlolMVBgmPwBRJiYptSYiVRhHuzlzlGT5K7OK65fvm6xdArKjt4KBLywzArYREu7spLjDaCo6zD1DtBKJzCY6LJOhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:19:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Fri, 27 Jan 2023
 11:19:08 +0000
Message-ID: <7f42ae75-c269-68a9-9037-91fd2ff6cbff@amd.com>
Date: Fri, 27 Jan 2023 12:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
Content-Language: en-US
To: Olivier Masse <olivier.masse@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "afd@ti.com" <afd@ti.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 97275d53-2491-4638-aaf6-08db00584ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szkOkxk3xLg8qF/E0Iga+klOmOUnBdHZUHsqKrMUaqhs447L5aj9VCfl/vMWAL+QC0T6VoRR7aE7f8QU495oDTzAwCus8Qp83EEDH41Ra3JA+1bKctaiHdHaFe9VGQNmNjg36sKpO5a4kDGKG66JmQ0bIuaeQ3o0vicoD2B1aX8snM5jIykQi1339te9TgFkerpwiKNXHgrgqfBmeq3BeMi7I8c6p+hpefQ3m7Ywf4PIXuDXhNDZZSmDzsiQk/1kZxZumw9obVwS0g4miBPfHJ3sxg6mFwn4qFvV6I6i1SLSPxEAnG1+kEazDe2g/zvCpiDON1rLV3m12ZiYDNDtLq29gmTg4bnP5kJvKi8M5zK/rAMj/zdkuCkKRLsf60SI5+wzHbQd8RuBC7+zgbqi3jbszFXlNM7ZD+g1UIzW1Vr3REuUDwUu6/HE46A9ebzmC8d1OukeaBhvpIOP4227uf4t5QMUDIxEvG2DV9DTdZC/umW9mciHPDIxURZZ0QZLzZTiC23HQ0SVFw2nZiCWD6u1YHutMM7QlWvhThHB4PYlbE1DcQQLVfemup/9QZ9sonFZMPFM9STI9bHzvkZTjEZEvjo+SrO//chkj7M/tx89+M9ygfE+J+7re3VPlbD/io3L0+vRjfkvHGOmYdLz3BFz3KqhOsLhs1pBic0VtUpSVN9dN7lbqHFUE/heFGboggEXLaw8ndRd4HCBxnFHTLwftUsIHuTXSqsBL5hbkMM3z11gPiBE0FGiqNwdX36Q6QAPra+e0AzJ8S8lPTRv0DfPUJ6k4tigfa+I9vn2Rqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(110136005)(316002)(66946007)(66574015)(66556008)(66476007)(8676002)(83380400001)(4326008)(54906003)(2616005)(31696002)(86362001)(2906002)(38100700002)(8936002)(41300700001)(36756003)(7416002)(5660300002)(30864003)(921005)(6666004)(6506007)(31686004)(6486002)(6512007)(966005)(186003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlZTDRkOTRSaG16UndzaEE2NmZXN2N6NVBqRFErS0lUdXlhbkRWVGd2NmJO?=
 =?utf-8?B?Z2cxVXc4cnUrWWRqTnZqR3pGaFdXSDk4WFVTR0RhM3poNG11SkJHVHNqU21M?=
 =?utf-8?B?ajlsY3lUekRHY0Eyb1BKYjBoQ3Z6cFRMNVY0ZUNWTzBKbENZczFKV2dHa1F0?=
 =?utf-8?B?UEpKOU5vbnRKRkdBTmVReUpmQWNJaWlVNE5IUERFVTRrZ1hUekFHSENscjY4?=
 =?utf-8?B?cDJXK0JIalZxcGNoYmczS3VWS29LSXhaMmU0Q0FJeGtRbFJ0UXBCRW80dmps?=
 =?utf-8?B?MEoyMzRScTBYb2FQZnhxQkp4UDYzZTk4b0dLNDFJcTArRjNyV0d3SnptVy9P?=
 =?utf-8?B?MDNtbGROQWRJVkFRMmowZkRpSFF5SWRGSWdBSmRVdml2TE5KNkZDK0hWU01p?=
 =?utf-8?B?MnRvN0lBYk1YT3J3eWZZN3lySmtmdjNzK2paMVRNUEZjOThuQnZ6dTRKQThV?=
 =?utf-8?B?dUJkZVlKRWVaeGZNSHBHMEZyaXNTREVwckZjTTVJcGNIS0U5KzJvY1ZNNU1M?=
 =?utf-8?B?czJGcGM3Rm14cm1iUHFQcGgwY3JVcEROenNBbGtMamVza291VGRadzc5REgw?=
 =?utf-8?B?eDRIUXZ1S29FVlg3NnRIYkU0M1p0aENsaVdid3BURHFETS84TlVpL0dnSUp4?=
 =?utf-8?B?b0phUG5GYUE0ck9QTUx3ZFJjbWw4cnhqTW93YVNYOVBiMDRtY1lMZi9sZ082?=
 =?utf-8?B?NlZ2Zm9JdHpHVVF5RU55OG1hclpKY0pSbVJkQnljcy9Yc0RzUzUyVTJ5N250?=
 =?utf-8?B?TmpiZWxiNWNlQTAzL2VLejE4ZFpEUnVSOWNmMUc1bGlaZ0NzNU5pTzJFNzdk?=
 =?utf-8?B?SFdjaC9DRjVlQjBlWGpWbmhWN0tiWWUzcy9ndEd6MWM5d21FYzZwQndXNksz?=
 =?utf-8?B?cmJXZzBhbEo3czFnczhBSW1nOVc0TkZidFNSL0hSUHNvNjk0RmtCb24zdE5k?=
 =?utf-8?B?c2h3WEZmemlyODVrYm9FdytBdi9ScWVXQ2UzaU9oTXQ4TDlqS3BEWHByT09U?=
 =?utf-8?B?SjhIL0k1VXZ4Vkh1TjZTbWpwY1dOaXA2ZUYxMzdKMnoxUXRvTk1aSC9HRGNV?=
 =?utf-8?B?WHIvWHBoOWhlVTVxcU1rMmFyWGpEQjFPeVFJUXNVUFptc2d5OGZadm5uV3Y1?=
 =?utf-8?B?NkRlWCtud0xYVFp4YVFPU3VRVjZ0YzhiRndob3gvQ202TnRqc25NTWpLRm5P?=
 =?utf-8?B?eCs0bG9CanU4MmRaMHllOGJ5QjN3T1Bud0lyYUw5ZmpNQ2Z2R0JDVkpDZHpY?=
 =?utf-8?B?UlJQaHJQc3NZbzhBdzVWNGkrbEIwNkthcVdXdUJHREdSZ2FLdFl5anBjSjhR?=
 =?utf-8?B?R2FXOTFDemdnWVBLOGFvbFc0SG1hZytlcFVtZU5iek5Xd2ErUDYrYVdmNG96?=
 =?utf-8?B?Q2Y5ZFFTTllIRTFZNjd1d2tCREw3amRFTGVmeVVYbitMekZ1MnRHNnN5NFRi?=
 =?utf-8?B?SXR4VG1WWUhobTJVTmkreVoxUDRMSmV4UHQyNi82SEx2bFJ1TEFlNmZ6dVJs?=
 =?utf-8?B?S3QzZlFXUldxRXpsdFZiNjIzUy9LZk1uK0NObis5V0tHQ2VCdGZVL0FOSlBk?=
 =?utf-8?B?OFRUYms1TVpwN1NZWE5xNGRpWjJ1MDV5OXhEam1yYjBTb3FicHRPbFhJc2t1?=
 =?utf-8?B?Y25OWFBQNHhRZGkwN2g4YUMwTFlKNm9oQnJWRWRvcTRydEFsMGE2UFJ0UEdN?=
 =?utf-8?B?ZUhucmUyS3JxQ0h3QTJ0T0FMQzk2Rmo1aEJEblA1MmtYMmdBVm1hMzlDYk84?=
 =?utf-8?B?V0hQa2NEK29sVUVmankzc1c2U1BnbWlIUGY3Q0xsZUd1cWxpN0FqWCtOT2Ft?=
 =?utf-8?B?ZUkvTG4xOXZRM1FlY3dpT2FTMHk4VGtMWlRaMHZOWks0Z0FwN3kyS2FoQUo4?=
 =?utf-8?B?c3pXODRPdG1pVXpFRHVZRjhjYVdIaUVFN0d0dldsRkZzb0JPOGlHUmxjNEdz?=
 =?utf-8?B?SzJqcFJudW1BYnZZYUpPSmFGWXpBU0o4VG5oVzBpU3o5cU1xVXZ5cFhpRDhM?=
 =?utf-8?B?SXBzaGtpU01sWjNJUWQ4dGsrQmRnUnBORWxQS0d4cFArYlVrWFdGNWxlRndQ?=
 =?utf-8?B?bVVQQ2cvQmYvMzVzRXpIQUVkdnRMSVQ5SlRvRk1uUzBYdWx2bTFCUUttMVN1?=
 =?utf-8?B?aU1vTzRkVDk3SW1YcUIrRXp0cHJ2VWN1S2dxSzJCUTQzQVFZKzJtT1JVOGdo?=
 =?utf-8?Q?aUabebNW8xudEKPPobu/hUFQL/CuoMs+LMC4KfDqAW3E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97275d53-2491-4638-aaf6-08db00584ea5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:19:08.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kR1Jq7cSXrR6HjfZg/NRRgdwWiF+UDi7tl0zOkprdKuDuY5obk42mm/yJL/Aneo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418
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
Cc: =?UTF-8?Q?Cl=c3=a9ment_Faure?= <clement.faure@nxp.com>,
 Cyrille Fleury <cyrille.fleury@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 27.01.23 um 11:54 schrieb Olivier Masse:
> Hi Joakim,
> Hi Etienne,
>
> Let me bring back this pull request for OPTEE Linux driver.
>
> Last feedback was from Christian König and Sumit Garg.
>  From Christian:
>> Just two comments:
>>
>> 1. Dmitry is working on a change which renames some functions and
>> makes
>> it mandatory to call them with the dma_resv lock held.
>>
>> Depending on how you want to upstream this change you will certainly
>> run
>> into conflicts with that.
> Is there any update on these changes ?

Just FYI: The upstream changes Dmitry worked on are now committed, so 
you just need to rebase your work on top and send it out once more.

>> 2. Would it be possible to do this dynamically? In other words does
>> the
>> tee driver has a concept of buffers moving around?
> We do not support dynamic secure memory heap.

That's not an issue. If you pin the memory anyway then you can expose it 
pinned through DMA-buf as well.

The only thing you should avoid is pinning it extra for DMA-buf, because 
then you often create a really nice possibility for an OOM deny of service.

Regards,
Christian.

>
>  From Sumit:
>> What limits you to extend this feature to non-contiguous memory
>> buffers? I believe that should be possible with OP-TEE dynamic shared
>> memory which gives you the granularity to register a list of pages.
> Our solution use a fixed protected reserved memory region and do not
> rely on a dynamic protection managed in secure.
>
> The scope of this implementation rely on a static memory region handled
> by a specific DMA Heap type.
>
> Best regards,
> Olivier MASSE
>
>
> On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
>> From: Etienne Carriere <etienne.carriere@linaro.org>
>>
>> This change allows userland to create a tee_shm object that refers
>> to a dmabuf reference.
>>
>> Userland provides a dmabuf file descriptor as buffer reference.
>> The created tee_shm object exported as a brand new dmabuf reference
>> used to provide a clean fd to userland. Userland shall closed this
>> new
>> fd to release the tee_shm object resources. The initial dmabuf
>> resources
>> are tracked independently through original dmabuf file descriptor.
>>
>> Once the buffer is registered and until it is released, TEE driver
>> keeps a refcount on the registered dmabuf structure.
>>
>> This change only support dmabuf references that relates to physically
>> contiguous memory buffers.
>>
>> New tee_shm flag to identify tee_shm objects built from a registered
>> dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
>> TEE_SHM_EXT_DMA_BUF.
>>
>> Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
>> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> From: https://github.com/linaro-swg/linux.git
>> (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
>> ---
>>   drivers/tee/tee_core.c   | 38 +++++++++++++++
>>   drivers/tee/tee_shm.c    | 99
>> +++++++++++++++++++++++++++++++++++++++-
>>   include/linux/tee_drv.h  | 11 +++++
>>   include/uapi/linux/tee.h | 29 ++++++++++++
>>   4 files changed, 175 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 8aa1a4836b92..7c45cbf85eb9 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>>   	return ret;
>>   }
>>   
>> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
>> +				     struct
>> tee_ioctl_shm_register_fd_data __user *udata)
>> +{
>> +	struct tee_ioctl_shm_register_fd_data data;
>> +	struct tee_shm *shm;
>> +	long ret;
>> +
>> +	if (copy_from_user(&data, udata, sizeof(data)))
>> +		return -EFAULT;
>> +
>> +	/* Currently no input flags are supported */
>> +	if (data.flags)
>> +		return -EINVAL;
>> +
>> +	shm = tee_shm_register_fd(ctx, data.fd);
>> +	if (IS_ERR(shm))
>> +		return -EINVAL;
>> +
>> +	data.id = shm->id;
>> +	data.flags = shm->flags;
>> +	data.size = shm->size;
>> +
>> +	if (copy_to_user(udata, &data, sizeof(data)))
>> +		ret = -EFAULT;
>> +	else
>> +		ret = tee_shm_get_fd(shm);
>> +
>> +	/*
>> +	 * When user space closes the file descriptor the shared memory
>> +	 * should be freed or if tee_shm_get_fd() failed then it will
>> +	 * be freed immediately.
>> +	 */
>> +	tee_shm_put(shm);
>> +	return ret;
>> +}
>> +
>>   static int params_from_user(struct tee_context *ctx, struct
>> tee_param *params,
>>   			    size_t num_params,
>>   			    struct tee_ioctl_param __user *uparams)
>> @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned
>> int cmd, unsigned long arg)
>>   		return tee_ioctl_shm_alloc(ctx, uarg);
>>   	case TEE_IOC_SHM_REGISTER:
>>   		return tee_ioctl_shm_register(ctx, uarg);
>> +	case TEE_IOC_SHM_REGISTER_FD:
>> +		return tee_ioctl_shm_register_fd(ctx, uarg);
>>   	case TEE_IOC_OPEN_SESSION:
>>   		return tee_ioctl_open_session(ctx, uarg);
>>   	case TEE_IOC_INVOKE:
>> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
>> index 836872467dc6..55a3fbbb022e 100644
>> --- a/drivers/tee/tee_shm.c
>> +++ b/drivers/tee/tee_shm.c
>> @@ -4,6 +4,7 @@
>>    */
>>   #include <linux/anon_inodes.h>
>>   #include <linux/device.h>
>> +#include <linux/dma-buf.h>
>>   #include <linux/idr.h>
>>   #include <linux/mm.h>
>>   #include <linux/sched.h>
>> @@ -12,6 +13,14 @@
>>   #include <linux/uio.h>
>>   #include "tee_private.h"
>>   
>> +/* extra references appended to shm object for registered shared
>> memory */
>> +struct tee_shm_dmabuf_ref {
>> +     struct tee_shm shm;
>> +     struct dma_buf *dmabuf;
>> +     struct dma_buf_attachment *attach;
>> +     struct sg_table *sgt;
>> +};
>> +
>>   static void shm_put_kernel_pages(struct page **pages, size_t
>> page_count)
>>   {
>>   	size_t n;
>> @@ -71,7 +80,16 @@ static void release_registered_pages(struct
>> tee_shm *shm)
>>   
>>   static void tee_shm_release(struct tee_device *teedev, struct
>> tee_shm *shm)
>>   {
>> -	if (shm->flags & TEE_SHM_POOL) {
>> +	if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
>> +		struct tee_shm_dmabuf_ref *ref;
>> +
>> +		ref = container_of(shm, struct tee_shm_dmabuf_ref,
>> shm);
>> +		dma_buf_unmap_attachment(ref->attach, ref->sgt,
>> +					 DMA_BIDIRECTIONAL);
>> +
>> +		dma_buf_detach(ref->dmabuf, ref->attach);
>> +		dma_buf_put(ref->dmabuf);
>> +	} else if (shm->flags & TEE_SHM_POOL) {
>>   		teedev->pool->ops->free(teedev->pool, shm);
>>   	} else if (shm->flags & TEE_SHM_DYNAMIC) {
>>   		int rc = teedev->desc->ops->shm_unregister(shm->ctx,
>> shm);
>> @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
>> tee_context *ctx, size_t size)
>>    * tee_client_invoke_func(). The memory allocated is later freed
>> with a
>>    * call to tee_shm_free().
>>    *
>> - * @returns a pointer to 'struct tee_shm'
>> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
>> failure
>>    */
>>   struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
>> size_t size)
>>   {
>> @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
>> tee_context *ctx, size_t size)
>>   }
>>   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>>   
>> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
>> +{
>> +	struct tee_shm_dmabuf_ref *ref;
>> +	int rc;
>> +
>> +	if (!tee_device_get(ctx->teedev))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	teedev_ctx_get(ctx);
>> +
>> +	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
>> +	if (!ref) {
>> +		rc = -ENOMEM;
>> +		goto err_put_tee;
>> +	}
>> +
>> +	refcount_set(&ref->shm.refcount, 1);
>> +	ref->shm.ctx = ctx;
>> +	ref->shm.id = -1;
>> +
>> +	ref->dmabuf = dma_buf_get(fd);
>> +	if (IS_ERR(ref->dmabuf)) {
>> +		rc = PTR_ERR(ref->dmabuf);
>> +		goto err_put_dmabuf;
>> +	}
>> +
>> +	ref->attach = dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
>>> teedev->dev);
>> +	if (IS_ERR(ref->attach)) {
>> +		rc = PTR_ERR(ref->attach);
>> +		goto err_detach;
>> +	}
>> +
>> +	ref->sgt = dma_buf_map_attachment(ref->attach,
>> DMA_BIDIRECTIONAL);
>> +	if (IS_ERR(ref->sgt)) {
>> +		rc = PTR_ERR(ref->sgt);
>> +		goto err_unmap_attachement;
>> +	}
>> +
>> +	if (sg_nents(ref->sgt->sgl) != 1) {
>> +		rc = PTR_ERR(ref->sgt->sgl);
>> +		goto err_unmap_attachement;
>> +	}
>> +
>> +	ref->shm.paddr = sg_dma_address(ref->sgt->sgl);
>> +	ref->shm.size = sg_dma_len(ref->sgt->sgl);
>> +	ref->shm.flags = TEE_SHM_EXT_DMA_BUF;
>> +
>> +	mutex_lock(&ref->shm.ctx->teedev->mutex);
>> +	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
>> +				1, 0, GFP_KERNEL);
>> +	mutex_unlock(&ref->shm.ctx->teedev->mutex);
>> +	if (ref->shm.id < 0) {
>> +		rc = ref->shm.id;
>> +		goto err_idr_remove;
>> +	}
>> +
>> +	return &ref->shm;
>> +
>> +err_idr_remove:
>> +	mutex_lock(&ctx->teedev->mutex);
>> +	idr_remove(&ctx->teedev->idr, ref->shm.id);
>> +	mutex_unlock(&ctx->teedev->mutex);
>> +err_unmap_attachement:
>> +	dma_buf_unmap_attachment(ref->attach, ref->sgt,
>> DMA_BIDIRECTIONAL);
>> +err_detach:
>> +	dma_buf_detach(ref->dmabuf, ref->attach);
>> +err_put_dmabuf:
>> +	dma_buf_put(ref->dmabuf);
>> +	kfree(ref);
>> +err_put_tee:
>> +	teedev_ctx_put(ctx);
>> +	tee_device_put(ctx->teedev);
>> +
>> +	return ERR_PTR(rc);
>> +}
>> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
>> +
>>   static struct tee_shm *
>>   register_shm_helper(struct tee_context *ctx, unsigned long addr,
>>   		    size_t length, u32 flags, int id)
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index 911cad324acc..40ddd5376c2d 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -25,6 +25,7 @@
>>   #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space
>> */
>>   #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool
>> */
>>   #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver
>> */
>> +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
>> handle */
>>   
>>   struct device;
>>   struct tee_device;
>> @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct
>> tee_context *ctx, size_t size);
>>   struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>>   					    void *addr, size_t length);
>>   
>> +/**
>> + * tee_shm_register_fd() - Register shared memory from file
>> descriptor
>> + *
>> + * @ctx:	Context that allocates the shared memory
>> + * @fd:		Shared memory file descriptor reference
>> + *
>> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
>> failure
>> + */
>> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
>> fd);
>> +
>>   /**
>>    * tee_shm_is_dynamic() - Check if shared memory object is of the
>> dynamic kind
>>    * @shm:	Shared memory handle
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index 25a6c534beb1..baf3cd7cfdac 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
>>   #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1,
>> \
>>   				     struct tee_ioctl_shm_alloc_data)
>>   
>> +/**
>> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering
>> argument
>> + * @fd:		[in] File descriptor identifying the shared
>> memory
>> + * @size:	[out] Size of shared memory to allocate
>> + * @flags:	[in] Flags to/from allocation.
>> + * @id:		[out] Identifier of the shared memory
>> + *
>> + * The flags field should currently be zero as input. Updated by the
>> call
>> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
>> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
>> below.
>> + */
>> +struct tee_ioctl_shm_register_fd_data {
>> +	__s64 fd;
>> +	__u64 size;
>> +	__u32 flags;
>> +	__s32 id;
>> +} __attribute__ ((aligned (8)));
>> +
>> +/**
>> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
>> descriptor
>> + *
>> + * Returns a file descriptor on success or < 0 on failure
>> + *
>> + * The returned file descriptor refers to the shared memory object
>> in kernel
>> + * land. The shared memory is freed when the descriptor is closed.
>> + */
>> +#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC,
>> TEE_IOC_BASE + 8, \
>> +				     struct
>> tee_ioctl_shm_register_fd_data)
>> +
>>   /**
>>    * struct tee_ioctl_buf_data - Variable sized buffer
>>    * @buf_ptr:	[in] A __user pointer to a buffer

