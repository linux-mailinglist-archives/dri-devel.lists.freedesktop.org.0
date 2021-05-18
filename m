Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ADD387874
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBDB6EB44;
	Tue, 18 May 2021 12:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFC86EB44;
 Tue, 18 May 2021 12:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnf86JahpfPGZx6utDmuDmpS8wkBN8o2QDJ0dGuQ24vYxYihRtx6bsALQeAOj2OVF7x5QC7k/YqplP46hkkyD14J0hzYpF1QrEUraoNQaIqkQkbfykRZZ2v+xOJQqhbsn0MOZfh092Dfe8IRjRRPETQQWSKxPnBMWfrWV+fQxvmHjnFBnX9VCL9cc/nIB1VaBI1sALfADUPQeN82ZVtIuJWcBDzIlSTDPeF+a7aNo9wXRYkDj018fPt7aODs362uKgiisnf58yECAk6aRrndNZmSvLJP/biEzQBEzxcBY4vrH30RFap68qleW0fHguXWVVkAocp/yIDC33bvfSg3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSOzd/lI8Y5fVCthwNfoxrvFLuKZPjHG/updJD4/7h8=;
 b=CsAGIZhu/2EaHZOPWwT11NUlIdldfP3vGOrYPx5C6VUtneYUj3QAS/8vr95ap72k/Aqp0zX3J+zYVYlc5QH3YPgziK52waDkMq3lxH8DvlKXHBtijZIF4GtjCTBVYK5QPhqw3u1+6u6oa+aGp32h20M09vXy0OztJtu6+ZN4F00Tl1vZxh7xDIYihjes3cgV839bUEiEeM08pGcqkJQ7psRdcSujX/ecEMSnmb/9kDT4DsbadALWhJ3K8wZjEZ1LhljTWX6+1zxKIlkuwuhuyXzn22QymHVqvA3r5MaMyqG3Mx76f5cRCg4KYbEAH2H4IA/o/ds+are7tHPaLFiCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSOzd/lI8Y5fVCthwNfoxrvFLuKZPjHG/updJD4/7h8=;
 b=nYEBASHJcychAJf2OoEzLoL7aL5zd6C2BpjibO/MG9r7Vn7plcmPXH1h7jL8RFKz2VqB9Yj+6A96syfRef8quXxYXSjWykrei1RbGTGxZPetymVqrad6pJzw4I0VmOS8lwOLfrWJn8viZlPQYU2dj9Uc3f8zxAF4/PDBsqk7+o0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 12:06:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 12:06:58 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Daniel Vetter <daniel@ffwll.ch>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c306eac1-d53f-a749-6aac-3f4f066031cb@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <883336ef-749f-6c6e-287a-e14b652722a1@amd.com>
Date: Tue, 18 May 2021 14:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <c306eac1-d53f-a749-6aac-3f4f066031cb@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: AM0PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:208:69::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 AM0PR03CA0074.eurprd03.prod.outlook.com (2603:10a6:208:69::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 12:06:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b298bf-3df1-4bca-de0e-08d919f56fa5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696FABFCD4DA26620FF68E1832C9@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12PFDglEx75A16UqhZLIDTQ651cu7G5H8YMi7i5pNUrTDPaEFC5+PSfU9ZphjusM/vFvWTaKKbTek9UvAb/wUjIl2x05JDGzOJvZLzzO3bmL12pGfn716qAX7HlpBRVvPEw3KgOoQifZi6J5E01+gbUf2Qpz2TLwGx5olLDyrhZz8pL2jbyptPTfR9Us1r7u3V34KuwoU6+eb12oKr8fXpMHNBKsSVK0lCmyBJugpeL4giN/iaEY2/fZ4m7Tss6GOV3Nbofcwji5E5cz7GY2t1viuddhSVDoyLcVZW+3tce/BJ8LZlwG2zfz3D5lTQoYCYeEFDqNh4gY9UtM08LQaDvnO15ApVjfcNoacfI8iLNcI23ADZ6JicJ6FK9qx54Dvm9kQGSbO7zPQrp8IntTQqscvdLKldMmOlWRTY4KkoPQS9U6zM7Ei7Bhtvz2/oTbCJ20SsnYh0ucP5bL86R2ZMxenS0vLStAQmhVuG8oLUEegWyw59uIi7ePhRw9Y4BRSBXgG4oddWUW81UiwSXAbwaZSk6YGoO+fSSvHmx+RZmAg7sVcGJuDJdKTqMfbqjxuAA7q6u6SQK/eg/8S/rKGCu5dplfVUHs+sd5fUWh5U1huGcghCrlBZ/RdmwhCHER6JNojAbYTgz/O8ObkIhVwaeAYe713x6Wo/DEyvcOkFrt8vqcPZ4ZCwGCQaA6y5Kw+g3gXisLsfUXmjHp3hJB43nibAaRWRkhwMqFfdNhishTsjE5a0KIxDGjXW8lgYf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(110136005)(36756003)(478600001)(8676002)(38100700002)(2906002)(83380400001)(316002)(54906003)(2616005)(4326008)(66556008)(966005)(31696002)(52116002)(16526019)(66946007)(31686004)(6666004)(8936002)(186003)(6486002)(45080400002)(66476007)(86362001)(5660300002)(53546011)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?7qCaNXNiqoa5sOg97HzYhw/EX5avEfyqVTtrQANe4p6HfdT5KYiGWMqx?=
 =?Windows-1252?Q?wsjsBTrrrBgcbxdIHMcQmklIblFCvC2S4qx2sKqtobpN8OE4NoVUuLPX?=
 =?Windows-1252?Q?Nns5QszpZ/8CBbX3BOG4kbbLoMLtHp0npqHzL+yz+5GYL/kSmuZQ4FDY?=
 =?Windows-1252?Q?NZKpbUKSSsIJDvxxhtSR9ZdYdoKbtWIl4oZkqLA5FFv1h7bj4/w7lB0Y?=
 =?Windows-1252?Q?6D0FPgDb4FabLFsmtLmiag9evep0+bThqus/qEpnuWIKSvyvlHiKo0fh?=
 =?Windows-1252?Q?YQhH2pT+jBmQCXqKZMGEwKb2RvcDMpzf6zHTZzZSgj5R+fNI/y3K5xRm?=
 =?Windows-1252?Q?xuzzZgGbDVrYr9dCXYE0XLSVYtcRCUtQ4V/EwpIRiZITSMOLacQ8MNuc?=
 =?Windows-1252?Q?feLri1uZ8g786MekpakPogVDIYetD/QyDa/y2IcQyv3MNfxm54CK9T+o?=
 =?Windows-1252?Q?Bev12WpI7XhZahV2JPY9gsTdE5HYkIJe38kZCx+B9GXB2mFWGJ1oV7SI?=
 =?Windows-1252?Q?CaAxFp0Oj4uLAIjArh11Bws24LswgTt4x//tZhd425Jeyt7X92pI1doH?=
 =?Windows-1252?Q?TSIvUvS0Kb4Vxs4/O8HjcDGNtNexEo48QelT8d70Og+UIXF0wbH4Kybo?=
 =?Windows-1252?Q?DqmgQqVnqU0kQaltvC6mwO6T24G6JZPOH+H0gbipYT4Dyba64edfpZpA?=
 =?Windows-1252?Q?XPfFUFFnLIV0fK/Hwljk+1BRhRwYFnh7Fguvf0BiDbAPrJAk+C78sbKm?=
 =?Windows-1252?Q?yXZDt30p2ndPtCNj0BfmRb1Cxzm4Gz/byQciWZ7I2a4kGUhkFTzVpwlE?=
 =?Windows-1252?Q?qgC+WwcSamIFEgEyRYtPzjeBO9fGczRyTBS6USzVTK7XjnJbXxTMJAb0?=
 =?Windows-1252?Q?Mnf+0Nf8raJF3++H54iGvidiqg4vFU8H7NOM+7/BiaE6yLeqoFUWcoN6?=
 =?Windows-1252?Q?MtzxVti7tL45EuciWG8CXzU5hhHs68tUbPTBJoTzDG2RJjnn8/e1wBAi?=
 =?Windows-1252?Q?b+So6Qu2JiG93SzM0UdGYEuO9fUkoKHAHLHGQuDlwvAC5M950Mtqorm5?=
 =?Windows-1252?Q?Xx7bgFybAfn8F9b6vc3k8UKqpaAdTC3CZF3DISfEeXwagmVK6GDlI+NY?=
 =?Windows-1252?Q?fpCWDxNjcWiPN1pksay/sX6m2uDayVuJpAKaUnKt3JOFwtEx8UKdCtG1?=
 =?Windows-1252?Q?GHMgW0jJaI/qq0vvMpmw/IN2UfjCxylo3JyyRgyI5qoTKcr84y3nKh8E?=
 =?Windows-1252?Q?5jR/dqmuYZs29hdn3GyEV1+rqs8zT0Vqu52voKJBVrAT5TGAB6nNUM5y?=
 =?Windows-1252?Q?bCAVtLLl92rt4yfwHrmeYymXIYfNoc/o9STvulCvOe39FOURtXlzawBK?=
 =?Windows-1252?Q?XxDs2a9uFZrwLQzFAclWCGvBwg9Q59AiuOzorbV9PxkANbslHdXib/yz?=
 =?Windows-1252?Q?nKDXZoNdW1PVnrnNXen/DNzXEs+QG+owpuYFbOi+B65v7vcSAw393Qkz?=
 =?Windows-1252?Q?f4fCTPMG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b298bf-3df1-4bca-de0e-08d919f56fa5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 12:06:58.1648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaIKB8OR/yP9X1t2Ddxqa0VEH32xnBTxFPA+wD0XNV9dulvsA4Nv2pOjxeh8dJ9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 11:35 schrieb Tvrtko Ursulin:
>
> On 17/05/2021 19:02, Nieto, David M wrote:
>> [AMD Official Use Only]
>>
>>
>> The format is simple:
>>
>> <ringname><index>: <XXX.XX> %
>
> Hm what time period does the percent relate to?
>
> The i915 implementation uses accumulated nanoseconds active. That way 
> who reads the file can calculate the percentage relative to the time 
> period between two reads of the file.

That sounds much saner to me as well. The percentage calculation inside 
the kernel looks suspiciously misplaced.

>
>> we also have entries for the memory mapped:
>> mem <ttm pool> : <size> KiB
>
> Okay so in general key values per line in text format. Colon as 
> delimiter.
>
> What common fields could be useful between different drivers and what 
> common naming scheme, in order to enable as easy as possible creation 
> of a generic top-like tool?
>
> driver: <ko name>
> pdev: <pci slot>
> ring-<name>: N <unit>
> ...
> mem-<name>: N <unit>
> ...
>
> What else?
> Is ring a good common name? We actually more use engine in i915 but I 
> am not really bothered about it.

I would prefer engine as well. We are currently in the process of moving 
away from kernel rings, so that notion doesn't make much sense to keep 
forward.

Christian.

>
> Aggregated GPU usage could be easily and generically done by userspace 
> by adding all rings and normalizing.
>
>> On my submission 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Famd-gfx%2F2021-May%2F063149.html&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7Cbad72cde9a7248b20c7f08d919e03deb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637569273164210285%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TW3HaPkqyr6jwhTUVRue3fGTyRfV4KnhEuRtTTI5fMY%3D&amp;reserved=0 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Famd-gfx%2F2021-May%2F063149.html&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7Cbad72cde9a7248b20c7f08d919e03deb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637569273164210285%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TW3HaPkqyr6jwhTUVRue3fGTyRfV4KnhEuRtTTI5fMY%3D&amp;reserved=0> I 
>> added a python script to print out the info. It has a CPU usage lower 
>> that top, for example.
>>
>> To be absolutely honest, I agree that there is an overhead, but It 
>> might not be as much as you fear.
>
> For me more the issue is that the extra number of operations grows 
> with the number of open files on the system, which has no relation to 
> the number of drm clients.
>
> Extra so if the monitoring tool wants to show _only_ DRM processes. 
> Then the cost scales with total number of processes time total number 
> of files on the server.
>
> This design inefficiency bothers me yes. This is somewhat alleviated 
> by the proposal from Chris 
> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F419042%2F%3Fseries%3D86692%26rev%3D1&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7Cbad72cde9a7248b20c7f08d919e03deb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637569273164210285%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=jNfe8h2BalOOc1Y0Idcs3wxnNOi74XhulkRlebmpgJM%3D&amp;reserved=0) 
> although there are downsides there as well. Like needing to keep a map 
> of pids to drm files in drivers.
>
> Btw what do you do in that tool for same fd in a multi-threaded process
> or so? Do you show duplicate entries or detect and ignore? I guess I 
> did not figure out if you show by pid/tgid or by fd.
>
> Regards,
>
> Tvrtko
>
>> ------------------------------------------------------------------------
>> *From:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> *Sent:* Monday, May 17, 2021 9:00 AM
>> *To:* Nieto, David M <David.Nieto@amd.com>; Daniel Vetter 
>> <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
>> *Cc:* Alex Deucher <alexdeucher@gmail.com>; Intel Graphics 
>> Development <Intel-gfx@lists.freedesktop.org>; Maling list - DRI 
>> developers <dri-devel@lists.freedesktop.org>
>> *Subject:* Re: [PATCH 0/7] Per client engine busyness
>>
>> On 17/05/2021 15:39, Nieto, David M wrote:
>>> [AMD Official Use Only]
>>>
>>>
>>> Maybe we could try to standardize how the different submission ring 
>>>    usage gets exposed in the fdinfo? We went the simple way of just 
>>> adding name and index, but if someone has a suggestion on how else 
>>> we could format them so there is commonality across vendors we could 
>>> just amend those.
>>
>> Could you paste an example of your format?
>>
>> Standardized fdinfo sounds good to me in principle. But I would also
>> like people to look at the procfs proposal from Chris,
>>    - link to which I have pasted elsewhere in the thread.
>>
>> Only potential issue with fdinfo I see at the moment is a bit of an
>> extra cost in DRM client discovery (compared to my sysfs series and also
>> procfs RFC from Chris). It would require reading all processes (well
>> threads, then maybe aggregating threads into parent processes), all fd
>> symlinks, and doing a stat on them to figure out which ones are DRM 
>> devices.
>>
>> Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.
>>
>>> I’d really like to have the process managers tools display GPU usage 
>>> regardless of what vendor is installed.
>>
>> Definitely.
>>
>> Regards,
>>
>> Tvrtko

