Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98A83C4AB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 15:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6EA10F86F;
	Thu, 25 Jan 2024 14:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E110E24A;
 Thu, 25 Jan 2024 14:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df+iyJC5KKNRTp6epvahJFg4gcGInMtYRqCmucGd8yjSFuOaxy2otmgNZYexUakS4sOwvZ+uKil5+z6dHLKiBhx5UpspFujtleiobTy8u/Y1WIgRnxt7G7B6WzyYo646ntU0Hygk2Ea0ENaZWepwBLeXYDlvoSApiH5ocoPpr/5lEFEjtDWDnoUTibjXAV96+uQ27lpJ1QaZTlvWLQi0wj12wjEk+tW3LAM4wcQ1U2wDhmH6kOi/Yej1Y3USPwdW7WtJ0Q22HRr78/GbO0QZ5o+ajaT7sMptPVB0wM5lx+ISvAub89hgBnETcsZQcNpqGZyPdzb/XWlwVb9TPj38nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lXL+KzTmeA1MtTQGxAnCT/sB+AzR77c13sqYi8qv6A=;
 b=J2wDrd+uk9q+JmeCGHrbxGQBtMdLK+pnYR5PNMujnz2co1yRd+GkoAyW4lQmXqbK1GN3DtIa24jisE7U6Fhp2ISHuhp7+SgOeqraxVqg+LciUrygGoup8blMjBv6zoo2PGK0zlF419N0riIHnwgorXtesOwoaMd6OiFiHqJYnzJQ4aV25EPquqRWjSWnsTUdzviy1tv5yHy3M0GkHfD1dcDknisPy2V6FAYB/5KfhiJ/I7Vte/6mAvk+KUm9hfh8aL1/ABmVa8rhbwE4KMqZrshJZPaxl5QOEn3v185YtJJ2zvCXLEyNM9fc/F0BDqOjSiRPxL55wjs2Norj50PxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lXL+KzTmeA1MtTQGxAnCT/sB+AzR77c13sqYi8qv6A=;
 b=eI263ikbK2ErO0z3CFPlhLqbltN+WR4IUagP8CSnQhtooC9zkV0dUHi6fW37QQg7JnwGVU4uV7Tb/nvhloyuWMo57gUbGLwmKPPQvDNJ+TNIgLyM+gcJm7T57wkfR2sGctEq/CzxrkfZdUkLgIiOXkmmwdsxEBU96gbrprQHH0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Thu, 25 Jan
 2024 14:26:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 14:26:33 +0000
Message-ID: <01ba4731-ac1a-43f0-b2e6-2d5d7f916a8c@amd.com>
Date: Thu, 25 Jan 2024 15:26:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove double faults once write a device pfn
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>,
 "Zhou, Xianrong" <Xianrong.Zhou@amd.com>
References: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
 <5ed7d46b-ae26-43f2-81e0-91e3cfc0218a@amd.com>
 <MN2PR12MB4302C529B9F231F85539628EF1742@MN2PR12MB4302.namprd12.prod.outlook.com>
 <76c3658d-2256-49c6-8e4c-49555c0a350a@amd.com>
 <MN2PR12MB4302BBF634B2E3872904872BF17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
 <a307539f-8894-4d5f-a32d-3936e6fba65f@gmail.com>
 <MN2PR12MB43026CF629232E7F018FBEC3F17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
 <87fryngfen.fsf@nvdebian.thelocal>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <87fryngfen.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c02d3c-6482-4bdb-2fa8-08dc1db1a128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0dlqHqonL9qGSeHXYPWjXZAdk66f8R7RKabZ09DAqm+q8VX+XNofebOAZB04kBdIZRqroM0ZvfHcynFY8Iw1HKdNIaPaYORcw4weaOl8e5xy7teszrqQZ7CKjH2wJQgU0klRx+r3vnVzXJVbFt80R5hEkr9r6lBVjzIQ1ds1ZefVCyrQcxknk++HPzTQfvqqfQ09KragjUWktQ298f4J9YfaWd53Fb3MqDC/1ojW0035Jxf4kqYl7eayAsjdyBaumaIaHRgWUm4sM0epWYsyp1sY3uvOoZ+MmoAYL1LI8UTvkVGVJFUWoce4JmMHxT8SDESKy+2v46e/eZ1rcpCG8iSmnHMr7/vU7047aOeDEBXlHRNMVeG1WwQE6z36ogq7V4XlR0hb5l/h0cofvyvxI/53w/aAz8CG05bei8g7onpdtMoePqhLsQBEmaqIfyD4cIg6He7xhePMeyu+VpbeKebIPurZTEtTjlOGfhO6RVDsNtBZU8oWzcTjBBc8X9p2Kw31HfcpwQzmDYP0xFxf809Unq/BKIuH8T3KPB4zZxCOM7aPoLMqQa0S2y7lyiL495nBcIYja1V+mJWUI8watmwxAlBD5sfmo2VxyYVA2ue1D3FsfGMDl5T9Xyv7tUsSSARWrwatkaJkzhdh1NXow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31696002)(2906002)(54906003)(8676002)(7416002)(8936002)(4326008)(7406005)(86362001)(30864003)(5660300002)(66476007)(110136005)(316002)(66556008)(6486002)(6636002)(66946007)(36756003)(38100700002)(6666004)(6512007)(83380400001)(2616005)(6506007)(478600001)(41300700001)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnQySXhiWFBYT1RaZWpaQk9BbnBpZ0tsRzRHMFlsRFRPazY1T3plcnhkdm9m?=
 =?utf-8?B?TXI1ODE1b2JrdlJaU2FKcjRrMm1uTXI1MnhLbUovQTY0SWVzZzRCWmhKTHdE?=
 =?utf-8?B?bktCL0JKMm82Qy9zSVVoaEl1Y2NxNW1tSE1STEhId21DM1A4OFNRNmRKYThw?=
 =?utf-8?B?ZTAxY3czdklBNkhSRlVsbXREZnd0QzhVK2lVeEpSLzBDaUcyZzROMjA4QVNB?=
 =?utf-8?B?VmtNRkd4SXQ4UDRFajRzRlNYOWk3MnoyYndvdGYrL0NHbElZM200Smd1NEJt?=
 =?utf-8?B?aUQ2YWVCcGVmNUw1ZDVRNHgwZFU1TWlOdWpScFZmZDhnWllSZ0l2clljZ2RS?=
 =?utf-8?B?UWFkUDIwT2FLOHpyRE1FNS9EQXVhOUlKZTFMdk1MOUljUG5qMzM3ZXcyNk9O?=
 =?utf-8?B?aG1ZVGMrVkR2RzloYWpVeEMzZCtpYXltQU55U0M2alVvdmxnNHlLakVwdkdx?=
 =?utf-8?B?eFNSaWhaS1hscmswUUZ0YmdibG1hSVgxQkVadjNxM2NYMDFDVTcwZDdnbGpO?=
 =?utf-8?B?RjJ2VittMVBmWGtNOWFpRFoyTnlENi83WlArWHU2UkI5Wk9wZjVmNEhub0Ju?=
 =?utf-8?B?eWZkU0hvNEJ1cDF0RGxPZFNYbklrY2V1aWZVUFdscHlqRm9tNnRXeXE0N3o3?=
 =?utf-8?B?YksxV2UxTjAyWXIxSlBLbmw0cTBRb2I4TzRTS1JKRm1CNEdEazVHZjB6MUly?=
 =?utf-8?B?engwam4zcXFMZmx1ZEVDVzNSd2t1TlErc3lsb2NqSkhVMjdEN0VQSThsS0hN?=
 =?utf-8?B?N3dBZmtkYVJrMndDUnRaek9zUjJ5OURpSDFvUTlJZjhCSjA3MzVVcGpHR242?=
 =?utf-8?B?Y05ocFN3a0NtZ2tZemdSMllMaFZlY3M2endPNWx3MlVsWDY3Yyt2QmswQjRY?=
 =?utf-8?B?YS9FTU5jL0l1SjJ3TjJUSzlmQk9ycUpXaEZmaG5BUTVaMmVSS3Y2dlFUODJx?=
 =?utf-8?B?TEpJT1VzQWJVeVBrcDlZdDd2STNmbzZqL1RsbXF6ajUxU0thNmVVQjdLVWtE?=
 =?utf-8?B?akIzYm9EN29aY3RNTnpuUENGOWQzSlJqbFEwZ2c5aDF6c0lNT2tzR1ZhQzZJ?=
 =?utf-8?B?dC9wMkMxTk4zbHFFNlEvSEtKWXdpdlJCK1RxTGIvb3d4V3hjb1BNdS9yM1JS?=
 =?utf-8?B?ZmREKzFrR2FQUmt0aG5ZV3J2N1VKYXdMK3cwS2kzZ2lCM3lqVTRJWVNoajVT?=
 =?utf-8?B?NlNtVWNES01BRmxPcUh1cDFzOWZBR3JWN2k0MHBBbnZ5dzBrd0RpcDE3dGdv?=
 =?utf-8?B?YUQ0VklNYytpQTEzbXB3cDlweXdhL085eVMweHhjWEM5UEtaUlZCU055dVFF?=
 =?utf-8?B?K01XSHZSd0h1OVBteFdLTWxaRlg5MFVTUnlnNkhadDdkWkpEUm9lTlp0elpk?=
 =?utf-8?B?QXhSeVpHU0hyQmdvYWhmWHB3bGNFSkxtUW9qb01JUEw2Lzl0NEVnUXppNkx3?=
 =?utf-8?B?ZUpqN1dRcW96L2x6WTYvOU1hYjlvSVRDV1hQUTh1WXpvWjFUekRSUm5zelJ6?=
 =?utf-8?B?MDRmUmFkT3c2cWxwV1dWNGJVVG5DOWx5ekpXWFFOemVKK3k1b1YyQVlxU2Vl?=
 =?utf-8?B?amlqWk9yUHd0bVBTM2F2RStuL285UVhsM1ZJei9zc3VuaEY3MldpdFBSdFFS?=
 =?utf-8?B?RUptejJhbTdxTk1lQnBqa2kvcTdKNVNSTW1JclVtcE1Ea3ppOEc5d3F0bkZh?=
 =?utf-8?B?b040WUhmVU8vaG43cnE1eWdOOVdTVXdrUG9pamVWUDhNM3YycnZoU3ZCUVV1?=
 =?utf-8?B?YzFQM3prczZGQytWa3FVcVhSdm5uMUdoUndLdDQ1NlBpOXRmdGlpd1dhc0Ji?=
 =?utf-8?B?RTgzcCtRMTBOS1pnaEVUcVY1Q2FTaHN1UDVZdWdqOVpMMGp4SWM0ZlZlNVlT?=
 =?utf-8?B?a295eFdOd0JzNVBhMEpYUzc3SnJHZkFxMmhrblNEb1pDYVNWMDR0VmZrT3Fn?=
 =?utf-8?B?ODdDNDE0R2x1NTBPZUZlWnZoR1ZIcXpNN0RxM3IyMDA5ZjNWWnRGOGcwVmdo?=
 =?utf-8?B?Z05lYW0wYk01eFBOSm91QWhCQTJ1RmlpOWl5T0FtNlJPTkVZZzFNTnYwTmNK?=
 =?utf-8?B?V0dvZzJNVCtyQ1owYzRXVTRPM3A1eUJ1OGNSRXFyWVZpcVFablNWdERzSFB1?=
 =?utf-8?Q?acc9s/HzJqXh0sK02Q4maDGOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c02d3c-6482-4bdb-2fa8-08dc1db1a128
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 14:26:33.1345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdYa8M9jNnHtT3uPwUhOB0oaLv5v8awraT0JMnxAX+tiixvaQIjz35hmOACvIoSt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "lee@kernel.org" <lee@kernel.org>, "kherbst@redhat.com" <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ray" <Ray.Huang@amd.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "airlied@gmail.com" <airlied@gmail.com>, "Xu,
 Colin" <Colin.Xu@amd.com>, "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "Yang, Philip" <Philip.Yang@amd.com>,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Li,
 Huazeng" <Huazeng.Li@amd.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "Zhang,
 GuoQing \(Sam\)" <GuoQing.Zhang@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "surenb@google.com" <surenb@google.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "nirmoy.das@intel.com" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.24 um 12:04 schrieb Alistair Popple:
> "Zhou, Xianrong" <Xianrong.Zhou@amd.com> writes:
>
>> [AMD Official Use Only - General]
>>
>>>>>>>> The vmf_insert_pfn_prot could cause unnecessary double faults on a
>>>>>>>> device pfn. Because currently the vmf_insert_pfn_prot does not
>>>>>>>> make the pfn writable so the pte entry is normally read-only or
>>>>>>>> dirty catching.
>>>>>>> What? How do you got to this conclusion?
>>>>>> Sorry. I did not mention that this problem only exists on arm64 platform.
>>>>> Ok, that makes at least a little bit more sense.
>>>>>
>>>>>> Because on arm64 platform the PTE_RDONLY is automatically attached
>>>>>> to the userspace pte entries even through VM_WRITE + VM_SHARE.
>>>>>> The  PTE_RDONLY needs to be cleared in vmf_insert_pfn_prot. However
>>>>>> vmf_insert_pfn_prot do not make the pte writable passing false
>>>>>> @mkwrite to insert_pfn.
>>>>> Question is why is arm64 doing this? As far as I can see they must
>>>>> have some hardware reason for that.
>>>>>
>>>>> The mkwrite parameter to insert_pfn() was added by commit
>>>>> b2770da642540 to make insert_pfn() look more like insert_pfn_pmd() so
>>>>> that the DAX code can insert PTEs which are writable and dirty at the same
>>> time.
>>>> This is one scenario to do so. In fact on arm64 there are many
>>>> scenarios could be to do so. So we can let vmf_insert_pfn_prot
>>>> supporting @mkwrite for drivers at core layer and let drivers to
>>>> decide whether or not to make writable and dirty at one time. The
>>>> patch did this. Otherwise double faults on arm64 when call
>>> vmf_insert_pfn_prot.
>>>
>>> Well, that doesn't answer my question why arm64 is double faulting in the
>>> first place,.
>>>
>>
>> Eh.
>>
>> On arm64 When userspace mmap() with PROT_WRITE and MAP_SHARED the
>> vma->vm_page_prot has the PTE_RDONLY and PTE_WRITE within
>> PAGE_SHARED_EXEC. (seeing arm64 protection_map)

Well that's your observation, but not the explanation why arm64 is doing 
this.

See this would have quite some negative impact on performance, not only 
for gfx drivers but in general.

So either the observation is incorrect or there is a *really* good 
reason why arm64 is taking this performance penalty.

>> When write the userspace virtual address the first fault happen and call
>> into driver's .fault->ttm_bo_vm_fault_reserved->vmf_insert_pfn_prot->insert_pfn.
>> The insert_pfn will establish the pte entry. However the vmf_insert_pfn_prot
>> pass false @mkwrite to insert_pfn by default and so insert_pfn could not make
>> the pfn writable and it do not call maybe_mkwrite(pte_mkdirty(entry), vma)
>> to clear the PTE_RDONLY bit. So the pte entry is actually write protection for mmu.
>> So when the first fault return and re-execute the store instruction the second
>> fault happen again. And in second fault it just only do pte_mkdirty(entry) which
>> clear the PTE_RDONLY.
> It depends if the ARM64 CPU in question supports hardware dirty bit
> management (DBM). If that is the case and PTE_DBM (ie. PTE_WRITE) is set
> HW will automatically clear PTE_RDONLY bit to mark the entry dirty
> instead of raising a write fault. So you shouldn't see a double fault if
> PTE_DBM/WRITE is set.
>
> On ARM64 you can kind of think of PTE_RDONLY as the HW dirty bit and
> PTE_DBM as the read/write permission bit with SW being responsible for
> updating PTE_RDONLY via the fault handler if DBM is not supported by HW.
>
> At least that's my understanding from having hacked on this in the
> past. You can see all this weirdness happening in the definitions of
> pte_dirty() and pte_write() for ARM64.

+1

Thanks a lot for that, this was exactly the information I was looking for.

In this light it makes this patch here look unnecessary and questionable 
at best.

Xianrong if you have an arm64 platform which really double faults 
(confirmed through a debugger for example) then you have to ask why this 
platform shows this behavior and not try to work around it.

Behaviors like those usually have a very very good reason and without a 
confirmed explanation I'm not allowing any patch in which would disable 
stuff like that.

Regards,
Christian.

>
>> I think so and hope no wrong.
>>
>>> So as long as this isn't sorted out I'm going to reject this patch.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>> This is a completely different use case to what you try to use it
>>>>> here for and that looks extremely fishy to me.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>>> The first fault only sets up the pte entry which actually is dirty
>>>>>>>> catching. And the second immediate fault to the pfn due to first
>>>>>>>> dirty catching when the cpu re-execute the store instruction.
>>>>>>> It could be that this is done to work around some hw behavior, but
>>>>>>> not because of dirty catching.
>>>>>>>
>>>>>>>> Normally if the drivers call vmf_insert_pfn_prot and also supply
>>>>>>>> 'pfn_mkwrite' callback within vm_operations_struct which requires
>>>>>>>> the pte to be dirty catching then the vmf_insert_pfn_prot and the
>>>>>>>> double fault are reasonable. It is not a problem.
>>>>>>> Well, as far as I can see that behavior absolutely doesn't make sense.
>>>>>>>
>>>>>>> When pfn_mkwrite is requested then the driver should use PAGE_COPY,
>>>>>>> which is exactly what VMWGFX (the only driver using dirty tracking)
>>>>>>> is
>>>>> doing.
>>>>>>> Everybody else uses PAGE_SHARED which should make the pte writeable
>>>>>>> immediately.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> However the most of drivers calling vmf_insert_pfn_prot do not
>>>>>>>> supply the 'pfn_mkwrite' callback so that the second fault is
>>> unnecessary.
>>>>>>>> So just like vmf_insert_mixed and vmf_insert_mixed_mkwrite pair,
>>>>>>>> we should also supply vmf_insert_pfn_mkwrite for drivers as well.
>>>>>>>>
>>>>>>>> Signed-off-by: Xianrong Zhou <Xianrong.Zhou@amd.com>
>>>>>>>> ---
>>>>>>>>      arch/x86/entry/vdso/vma.c                  |  3 ++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>>>>>>>>      drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>>>>>>>>      drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>>>>>>>>      drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 +++++---
>>>>>>>>      drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 +++++---
>>>>>>>>      include/drm/ttm/ttm_bo.h                   |  3 ++-
>>>>>>>>      include/linux/mm.h                         |  2 +-
>>>>>>>>      mm/memory.c                                | 14 +++++++++++---
>>>>>>>>      10 files changed, 30 insertions(+), 16 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
>>>>>>>> index 7645730dc228..dd2431c2975f 100644
>>>>>>>> --- a/arch/x86/entry/vdso/vma.c
>>>>>>>> +++ b/arch/x86/entry/vdso/vma.c
>>>>>>>> @@ -185,7 +185,8 @@ static vm_fault_t vvar_fault(const struct
>>>>>>> vm_special_mapping *sm,
>>>>>>>>                if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
>>>>>>> {
>>>>>>>>                        return vmf_insert_pfn_prot(vma, vmf->address,
>>>>>>>>                                        __pa(pvti) >> PAGE_SHIFT,
>>>>>>>> -                                   pgprot_decrypted(vma-
>>>>>>>> vm_page_prot));
>>>>>>>> +                                   pgprot_decrypted(vma-
>>>>>>>> vm_page_prot),
>>>>>>>> +                                   true);
>>>>>>>>                }
>>>>>>>>        } else if (sym_offset == image->sym_hvclock_page) {
>>>>>>>>                pfn = hv_get_tsc_pfn(); diff --git
>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> index 49a5f1c73b3e..adcb20d9e624 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> @@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct
>>>>> vm_fault
>>>>>>> *vmf)
>>>>>>>>                }
>>>>>>>>
>>>>>>>>                ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>>>>>>> vm_page_prot,
>>>>>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>>>>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>>>>>>> true);
>>>>>>>>                drm_dev_exit(idx);
>>>>>>>>        } else {
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>>> index 9227f8146a58..c6f13ae6c308 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>>> @@ -1114,7 +1114,7 @@ static vm_fault_t vm_fault_ttm(struct
>>>>>>>> vm_fault
>>>>>>>> *vmf)
>>>>>>>>
>>>>>>>>        if (drm_dev_enter(dev, &idx)) {
>>>>>>>>                ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>>>>>>> vm_page_prot,
>>>>>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>>>>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>>>>>>> true);
>>>>>>>>                drm_dev_exit(idx);
>>>>>>>>        } else {
>>>>>>>>                ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
>>>>>>>> vm_page_prot); diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>>> index 49c2bcbef129..7e1453762ec9 100644
>>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct
>>>>>>>> vm_fault
>>>>>>>> *vmf)
>>>>>>>>
>>>>>>>>        nouveau_bo_del_io_reserve_lru(bo);
>>>>>>>>        prot = vm_get_page_prot(vma->vm_flags);
>>>>>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>>>>> TTM_BO_VM_NUM_PREFAULT);
>>>>>>>> +   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>>>>> TTM_BO_VM_NUM_PREFAULT,
>>>>>>>> +true);
>>>>>>>>        nouveau_bo_add_io_reserve_lru(bo);
>>>>>>>>        if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>>>>                return ret;
>>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> index 3fec3acdaf28..b21cf00ae162 100644
>>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> @@ -62,7 +62,7 @@ static vm_fault_t radeon_gem_fault(struct
>>>>>>>> vm_fault
>>>>>>> *vmf)
>>>>>>>>                goto unlock_resv;
>>>>>>>>
>>>>>>>>        ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>>>>>>> -                                  TTM_BO_VM_NUM_PREFAULT);
>>>>>>>> +                                  TTM_BO_VM_NUM_PREFAULT, true);
>>>>>>>>        if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>>>>                goto unlock_mclk;
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c index
>>>>>>> 4212b8c91dd4..7d14a7d267aa
>>>>>>>> 100644
>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>> @@ -167,6 +167,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>>>>>>       * @num_prefault: Maximum number of prefault pages. The caller
>>>>>>>> may
>>>>>>> want to
>>>>>>>>       * specify this based on madvice settings and the size of the GPU
>>> object
>>>>>>>>       * backed by the memory.
>>>>>>>> + * @mkwrite: make the pfn or page writable
>>>>>>>>       *
>>>>>>>>       * This function inserts one or more page table entries pointing to the
>>>>>>>>       * memory backing the buffer object, and then returns a return
>>>>>>>> code @@ -180,7 +181,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>>>>>>       */
>>>>>>>>      vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>>>>                                    pgprot_t prot,
>>>>>>>> -                               pgoff_t num_prefault)
>>>>>>>> +                               pgoff_t num_prefault,
>>>>>>>> +                               bool mkwrite)
>>>>>>>>      {
>>>>>>>>        struct vm_area_struct *vma = vmf->vma;
>>>>>>>>        struct ttm_buffer_object *bo = vma->vm_private_data; @@
>>>>>>>> -263,7
>>>>>>>> +265,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault
>>>>>>>> +*vmf,
>>>>>>>>                 * at arbitrary times while the data is mmap'ed.
>>>>>>>>                 * See vmf_insert_pfn_prot() for a discussion.
>>>>>>>>                 */
>>>>>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>>>>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>>>>>>>> + mkwrite);
>>>>>>>>
>>>>>>>>                /* Never error on prefaulted PTEs */
>>>>>>>>                if (unlikely((ret & VM_FAULT_ERROR))) { @@ -312,7
>>>>>>>> +314,7
>>>>>>> @@
>>>>>>>> vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t
>>>>> prot)
>>>>>>>>        /* Prefault the entire VMA range right away to avoid further faults */
>>>>>>>>        for (address = vma->vm_start; address < vma->vm_end;
>>>>>>>>             address += PAGE_SIZE)
>>>>>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>>>>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>>>>>>>> + true);
>>>>>>>>
>>>>>>>>        return ret;
>>>>>>>>      }
>>>>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>>>>> index 74ff2812d66a..bb8e4b641681 100644
>>>>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>>>>> @@ -452,12 +452,14 @@ vm_fault_t vmw_bo_vm_fault(struct
>>> vm_fault
>>>>>>> *vmf)
>>>>>>>>         * sure the page protection is write-enabled so we don't get
>>>>>>>>         * a lot of unnecessary write faults.
>>>>>>>>         */
>>>>>>>> -   if (vbo->dirty && vbo->dirty->method ==
>>> VMW_BO_DIRTY_MKWRITE)
>>>>>>>> +   if (vbo->dirty && vbo->dirty->method ==
>>> VMW_BO_DIRTY_MKWRITE)
>>>>>>> {
>>>>>>>>                prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>>>>>>>> -   else
>>>>>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>>>>>> + num_prefault,
>>>>>>> false);
>>>>>>>> +   } else {
>>>>>>>>                prot = vm_get_page_prot(vma->vm_flags);
>>>>>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>>>>>> + num_prefault,
>>>>>>> true);
>>>>>>>> +   }
>>>>>>>>
>>>>>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>>>>>>>>        if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>>>>                return ret;
>>>>>>>>
>>>>>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>>>>>> index 0223a41a64b2..66e293db69ee 100644
>>>>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>>>>> @@ -386,7 +386,8 @@ vm_fault_t ttm_bo_vm_reserve(struct
>>>>>>> ttm_buffer_object *bo,
>>>>>>>>                             struct vm_fault *vmf);
>>>>>>>>      vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>>>>                                    pgprot_t prot,
>>>>>>>> -                               pgoff_t num_prefault);
>>>>>>>> +                               pgoff_t num_prefault,
>>>>>>>> +                               bool mkwrite);
>>>>>>>>      vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>>>>>>>>      void ttm_bo_vm_open(struct vm_area_struct *vma);
>>>>>>>>      void ttm_bo_vm_close(struct vm_area_struct *vma); diff --git
>>>>>>>> a/include/linux/mm.h b/include/linux/mm.h index
>>>>>>>> f5a97dec5169..f8868e28ea04 100644
>>>>>>>> --- a/include/linux/mm.h
>>>>>>>> +++ b/include/linux/mm.h
>>>>>>>> @@ -3553,7 +3553,7 @@ int vm_map_pages_zero(struct
>>>>> vm_area_struct
>>>>>>> *vma, struct page **pages,
>>>>>>>>      vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>>>>>>>> long
>>>>>>> addr,
>>>>>>>>                        unsigned long pfn);
>>>>>>>>      vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>>>>>>>> unsigned
>>>>>>> long addr,
>>>>>>>> -                   unsigned long pfn, pgprot_t pgprot);
>>>>>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>>>>>>>> + mkwrite);
>>>>>>>>      vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma,
>>>>>>>> unsigned long
>>>>>>> addr,
>>>>>>>>                        pfn_t pfn);
>>>>>>>>      vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct
>>>>>>>> *vma, diff --git a/mm/memory.c b/mm/memory.c index
>>>>>>>> 7e1f4849463a..2c28f1a349ff
>>>>>>>> 100644
>>>>>>>> --- a/mm/memory.c
>>>>>>>> +++ b/mm/memory.c
>>>>>>>> @@ -2195,6 +2195,7 @@ static vm_fault_t insert_pfn(struct
>>>>>>> vm_area_struct *vma, unsigned long addr,
>>>>>>>>       * @addr: target user address of this page
>>>>>>>>       * @pfn: source kernel pfn
>>>>>>>>       * @pgprot: pgprot flags for the inserted page
>>>>>>>> + * @mkwrite: make the pfn writable
>>>>>>>>       *
>>>>>>>>       * This is exactly like vmf_insert_pfn(), except that it allows drivers
>>>>>>>>       * to override pgprot on a per-page basis.
>>>>>>>> @@ -2223,7 +2224,7 @@ static vm_fault_t insert_pfn(struct
>>>>>>> vm_area_struct *vma, unsigned long addr,
>>>>>>>>       * Return: vm_fault_t value.
>>>>>>>>       */
>>>>>>>>      vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>>>>>>>> unsigned
>>>>>>> long addr,
>>>>>>>> -                   unsigned long pfn, pgprot_t pgprot)
>>>>>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>>>>>>>> + mkwrite)
>>>>>>>>      {
>>>>>>>>        /*
>>>>>>>>         * Technically, architectures with pte_special can avoid all
>>>>>>>> these @@ -2246,7 +2247,7 @@ vm_fault_t
>>> vmf_insert_pfn_prot(struct
>>>>>>> vm_area_struct *vma, unsigned long addr,
>>>>>>>>        track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn,
>>>>>>>> PFN_DEV));
>>>>>>>>
>>>>>>>>        return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV),
>>> pgprot,
>>>>>>>> -                   false);
>>>>>>>> +                   mkwrite);
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>>>>>>
>>>>>>>> @@ -2273,10 +2274,17 @@ EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>>>>>>      vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>>>>>>>> long
>>>>>>> addr,
>>>>>>>>                        unsigned long pfn)
>>>>>>>>      {
>>>>>>>> -   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot);
>>>>>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>>>>>>>> +false);
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL(vmf_insert_pfn);
>>>>>>>>
>>>>>>>> +vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma,
>>>>>>>> +unsigned
>>>>>>> long addr,
>>>>>>>> +                   unsigned long pfn) {
>>>>>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>>>>>>> true);
>>>>>>>> +} EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
>>>>>>>> +
>>>>>>>>      static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>>>>>>>>      {
>>>>>>>>        /* these checks mirror the abort conditions in
>>>>>>>> vm_normal_page */

