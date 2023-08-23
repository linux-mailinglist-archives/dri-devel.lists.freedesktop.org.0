Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85B784F75
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 05:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8360F10E04B;
	Wed, 23 Aug 2023 03:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F410E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 03:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+AxfitlquNUyy5AM/zupKYxpnlICAVlKnjiF9L/fFjDJ7fwHfB3agd7K9xTmVHU23qd4ydOsBEdTh4zF3shDQhb1NiCxvJZHay+itZChNPNKvXNSbD+Im2rFrynazHi28jIQdUN0Yp63PEKAMalLzabuPWSInl73u8n/dpvVNrPyRcmO+i0LRxVPDgcgwpJ7gQFu2bGbSmF7jZuqftgX0E2RlA2WCeJIcpQtJML7yLP0dsLHgX5ZpNN2XeWLVUZuT/2Ird7odFt38WRAj/bf8EM8cVS8d1G4iphzH5xUu48zbwZ62Qp7uL974otSGh7JlvwXCB9iS9na2Vuh2nA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDjXu9NUV543kDaIPdSwEqtOH9hz0viTPDZRkgYd5K4=;
 b=JESMpbx91YERC10UVh30ITNGPdPXWtFqJaaeZobK2LyuoyLVSkzoHRPk4PQfT2qBzwmHuJEfkcVKp2dAnTMvzZr/8mbiFLBNVfDU5Oqq1qOf52/xhPms5Rz6oQubQbyJblw2yrtFUa5Fa8QTYDfv56sw4buy+Rza3cmDGaffrWWfxyWBhb9/K0lPJwUpgyVmE4wVTdwoDtEd2B2yA4Q5p7MLrbMoNjO0TNgHp/us2faqFIIaLcgTm+FCXfvUlP6WH1VeOB4BCQh8rW9qd2obyhEjBcZAMwQNlmO5K6A2Ws/FylVg/Lf3MYmLn2jDmFGMqjSc7rmFtceuLYc73QrpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDjXu9NUV543kDaIPdSwEqtOH9hz0viTPDZRkgYd5K4=;
 b=cSFGTObc9rZ9ywWNvHYppAXTEeXm9gMDKsIdyo6ubUhI6dej1lqi7Vf5jvyyZDr774ko1/4g49Q8/Cr+E4B9Ls4vjkSY1kYSwjwQ3pDTyU9JYdEsA9AwzmJi8iExzdH0PszvC2hnA3RD+JHpZnLEsYunDtgKOtHrYNFeLvZLssI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 03:49:20 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 03:49:20 +0000
Message-ID: <a319c436-a9e7-e817-e18a-72fceb7984e5@synaptics.com>
Date: Wed, 23 Aug 2023 11:49:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Content-Language: en-GB
To: Nicolas Dufresne <nicolas@ndufresne.ca>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <9e3c7a11ed1d50c4afdf4f181aae7d4a6a425329.camel@ndufresne.ca>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <9e3c7a11ed1d50c4afdf4f181aae7d4a6a425329.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::14) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 576bda35-c195-4ed7-97fd-08dba38bee9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENTegf/e+J28o7t0tjZ7CR7wowrc3TdxNI469iug39PicZddVzqS7ALVZiWuo801aaBCtEYKTl3BZaZVWsOWIw1DGknw4kHvpRa4VM60aKJk7EA4pnw1or2nnvbZRKd13qldFSUnlSgCYnconBxsmM1Wc1bfkXECffsvgLZzRPBwIuGnTRU+tvP8B3aU0aZ+lWBxwS1CcBvRnvGGhD9CF0xwf5oS3SnM5au+tyJeXnX0Xe9SiUJikhpTtkMEkCHbymwP40qz5tKAeyQRoVJbQosqiKAEVjVTEROL6Z6FPLzeTw/8i1Hw0kVEIkiskc0XBzyDk+vpfcBkTzMQoWSyaXoZq2cegbnsHctUCRshM0k161O4PB/94+ioB1sMbq2OhEVrrFpu/qHB83Uu0zmgc4eus3qyZymmITL/uAA1PvF2VbCcUHTmtwwarDARtYLrp9d5DlgUgSZjiqKxKNQVIlrYrws51Y8TeSPbu1xMFDmYuvdqw/gJrbzyQJEe6uhQhbAiotGYMQeOH1/zstGrOsP9IL4QHqezX7VNQIfEbYgcRjj5GkSmLonjqgcnSaI6Idn02Bh2CT1PcQQ6AIfRNRBN9VBUMRyEOvxA9gIf+Uqdo0HWOufuv/iEGd4TLWYoNcFfnFNeSSNQyUuoNXQgXPU1eD4bu3TJldW7aqFj3b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(66574015)(66899024)(83380400001)(2906002)(38350700002)(38100700002)(36756003)(86362001)(31696002)(6512007)(41300700001)(54906003)(66476007)(66556008)(66946007)(6506007)(6486002)(316002)(6916009)(53546011)(52116002)(2616005)(4326008)(8676002)(8936002)(966005)(478600001)(6666004)(31686004)(26005)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDM4a3J4MTN6MDBqUnJGVWR3aTNuS2VaNThueVhEUGVsU3JOa09FRHhzNW5n?=
 =?utf-8?B?ekdJaXVuZWtkTXdNenppRVQydkZuSitnRlZWaXFaZ3NEMGQxemE5L3JpM1Iz?=
 =?utf-8?B?YVhUYWNpbHB3bENSTGpFVjJiZnp4cWlYUXRjb0tzUHp6V1VVWWFTcldGZmx2?=
 =?utf-8?B?aWFKS3pIZG5tZ1JXRjlSZStqMk1kdWFLQVMyWEhxaHJOOEFvbWJ3NTBCZkN5?=
 =?utf-8?B?NXFQZy8zNG93S0dFQ2V2OHExTUVUT1VxOFhVaCtvNlpEOGM3dGk1VklHLzA4?=
 =?utf-8?B?UWNGcnpCQkdaNCtaOWJqMmw3YUdGbi95YlpZSDlxY2kxNnU2M2IxdDFsdEJv?=
 =?utf-8?B?S01tWU0wQUh6RGFUV2RWcnRVem05QzBVWlBkTUpwOUJtbDA2akczWUV2aGdT?=
 =?utf-8?B?cEFjZTdWb0tkRi9RajQxdG83UThrcGYvcnVqZkNyWURGbDBEMFJMSEZ2OFNz?=
 =?utf-8?B?UzFSWVVPNTRHVmFoYU83QzhEZnJxRmRxUzhDeC9PME1CWHlveTFGdXU3MU02?=
 =?utf-8?B?bmZ2MjEyaXJqTndNMThJMGxHc1JLTUswbmRKZTJGLzMxUm8vbW1hTTJmdHhN?=
 =?utf-8?B?ZnFXYkc5UFExTXl4UnplVVNkVVRwOWpjdnNmaXVmYzA0ZkNabGdDZzZ1N0xp?=
 =?utf-8?B?dUVKYW0xd2FyK1NhWWw4SWhad2t4WVpheEtaV2ZWTGZCMFpmSlg5SnZMR3FL?=
 =?utf-8?B?MndoTlBFZGg5dFBpaTZyaFMvemQyMmpuME9yUXVOaWNSY3lyazRkalBseDdL?=
 =?utf-8?B?Q09LMlE4TGpoOUkrTU9yRXBjZ1hzcHB1YUlkaVRGSnRtRGRzWEh1Q3FpK2py?=
 =?utf-8?B?cHBvTjlNcW5uWXZ1Q1QyTWovNm1mVHNPTG5oQkxtQk53Y0JDYzlYWWVlTWFm?=
 =?utf-8?B?Mlk2SW01SmxaTXJoRFBpRWhCVVllK3BSRzQweERZRjJZazUxUHA0ak9mR1ZV?=
 =?utf-8?B?RGQ4bDlUVEFLdjM5WmVkM3RVZ284OUZxNExqcUl2bkcrRndRejRGRkJKd0di?=
 =?utf-8?B?KzEvaFJoSU5XeHlwK2tFTzZTZ2xXSXhlT2hHMDEwaVI2ektaOWYvSURsWkR6?=
 =?utf-8?B?SUZXQ0IyYTVoTEl4YVpZVlhUb09UVW9XU3Z3NnlBK2NCUElRZjhGVVNRck0r?=
 =?utf-8?B?eUIyN2tERlJPVGFMdG5rbkdQczBmQ05SMHdUV0o4ZTdVenRQSWgxeExvRXlE?=
 =?utf-8?B?QU9QbnB5bnI1a0hVNXd0MDV5NUpXNm92T0puZDZYN2R4UGxGTXFYOFRPSFRJ?=
 =?utf-8?B?bWVqenk5bXBUT29EYkhkU0pOWG8wWlluQlRYTWFBZkVmcC8xWVpwOVhCMmgr?=
 =?utf-8?B?d2ZlcTQ4SEJCWmkyM2hZdmlpQVhBZS9BVTlCNXp2QmQrV2FoazIvWnBiUzNa?=
 =?utf-8?B?QktXMXdaUDJlZzUyM0ZzM2YrTytLaGltdXZpd0EyWFUzc21XNi9nOEhNL0dj?=
 =?utf-8?B?UTlUQXFUODBzaS9CbnlyVmZuVEZJQTcvaS9XbG5McXNFa09Xc0p2M1daNGdP?=
 =?utf-8?B?clh2U1pGVHJlT2xYRkh1ODF4L2UxRi9XME56OSt2dGNXdzB1NDBKUFNoR2NG?=
 =?utf-8?B?S2ViWVVlb1FsUlZjN1UxRjVIb1U5QnVoUzdXdzRTeElmN1FZYVBIdEpPVld4?=
 =?utf-8?B?QnBjVU10VG9acXBTZzdwYlViTk0zYm1yL2tlYkF5enpQeGVWZGFYejhCZitO?=
 =?utf-8?B?RjNxcUxkaVo3bk9XOC9TTE9scUhhYldJeXVjMWRoYW5ZZkNXZXBiekgwZXZP?=
 =?utf-8?B?Y2lkZm5KKzVhaGxKUjZMNjJVM2xVb3NnUWZmOHpOZGdRQi8yYS9zcG1Xandu?=
 =?utf-8?B?MnI4aWhUVVdUcm1VR1RDV1NkeHJRdmhkK2Jhd0txL0tTNWVQdkxkTEg3OTJa?=
 =?utf-8?B?clFxcjUybEJpYVNaMUxNamVmZmhTN1hpTkt6U2xHejVxSGFSVEFEWnZpUXZP?=
 =?utf-8?B?WDB3TzNneGd2M0lybVhHQ0xHQVhBNkNhT1NTR3FOdm5BQkRpQkFRWWFhZ3JE?=
 =?utf-8?B?b002YmRnYlNDeEQ3UmZHQkJLbHRacmw2eXZTb3RUbWMrNGtUK0ZkREVQSGo4?=
 =?utf-8?B?U2NJYmE2djZvcTM1KzhNVjhxZk9lbVkzRmRiOTMya0dwb1J2Zi8rTGtBYzht?=
 =?utf-8?Q?JiW+KO01Vum5XdrGLRrv6J2hL?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576bda35-c195-4ed7-97fd-08dba38bee9c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 03:49:20.3944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euxktT3ZzQlEcs3iNjToMxkxBhgWDS7HSVFih4/kADvZe5IHoiURXLE95g9DHwlOhp5y6E+E0HHwguAyTYlAnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/23 03:55, Nicolas Dufresne wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi,
> 
> Le mardi 22 août 2023 à 19:14 +0800, Hsia-Jun Li a écrit :
>> Hello
>>
>> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major
>> purpose of that is sharing metadata or just a pure container for cross
>> drivers.
>>
>> We need to exchange some sort of metadata between drivers, likes dynamic
>> HDR data between video4linux2 and DRM. Or the graphics frame buffer is
>> too complex to be described with plain plane's DMA-buf fd.
>> An issue between DRM and V4L2 is that DRM could only support 4 planes
>> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
>> interface to support that 4 more planes which would lead to revision of
>> many standard likes Vulkan, EGL.
>>
>> Also, there is no reason to consume a device's memory for the content
>> that device can't read it, or wasting an entry of IOMMU for such data.
>> Usually, such a metadata would be the value should be written to a
>> hardware's registers, a 4KiB page would be 1024 items of 32 bits registers.
>>
>> Still, I have some problems with SHMEM:
>> 1. I don't want thhe userspace modify the context of the SHMEM allocated
>> by the kernel, is there a way to do so?
>> 2. Should I create a helper function for installing the SHMEM file as a fd?
> 
> Please have a look at memfd and the seal feature, it does cover the reason why

That is the implement I need, it would affact the userspace not the 
kernel space. Should I expand a kAPI for memfd or just take the 
implement for the SHMEM?
This interfaces need to offer three things:
1. a fd for userspace to exchange between drivers
2. a kernel virtual address for accessing
3. userspace SEAL

Meanwhile, I am thinking whether we should offer a generic context 
header for such usage. Or we need another fields in a driver to describe it.
struct shmem_generic_container {
	u64 format; /* use DRM modifier vendor bits but */
	u32 size; /* size of the payload */
	u8 payload[];
};
/* format linear for nesting dolls context */
struct shmem_nesting_container {
	u32 num;
	u64 formats[num];
	u32 sizes[num];
	u32 offsets[num]; /* offset from the payload below */
	u8 payload[];
};
> unsealed shared memory require full trust. For controls, the SEAL_WRITE is even
> needed, as with appropriate timing, a malicous process can modify the data in-
> between validation and allocation, causing possible memory overflow.
> 
> https://man7.org/linux/man-pages/man2/memfd_create.2.html
> File sealing
>         In the absence of file sealing, processes that communicate via
>         shared memory must either trust each other, or take measures to
>         deal with the possibility that an untrusted peer may manipulate
>         the shared memory region in problematic ways.  For example, an
>         untrusted peer might modify the contents of the shared memory at
>         any time, or shrink the shared memory region.  The former
>         possibility leaves the local process vulnerable to time-of-check-
>         to-time-of-use race conditions (typically dealt with by copying
>         data from the shared memory region before checking and using it).
>         The latter possibility leaves the local process vulnerable to
>         SIGBUS signals when an attempt is made to access a now-
>         nonexistent location in the shared memory region.  (Dealing with
>         this possibility necessitates the use of a handler for the SIGBUS
>         signal.)
> 
>         Dealing with untrusted peers imposes extra complexity on code
>         that employs shared memory.  Memory sealing enables that extra
>         complexity to be eliminated, by allowing a process to operate
>         secure in the knowledge that its peer can't modify the shared
>         memory in an undesired fashion.
> 
>         [...]
> 
> regards,
> Nicolas

-- 
Hsia-Jun(Randy) Li
