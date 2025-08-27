Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95142B38AA4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616910E8A2;
	Wed, 27 Aug 2025 20:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eRQ0BhvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B210E8A2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln7cayfBc0H3iiHxtLfQ5LKcRbj8/tRZ5nEPa5KWV8W4U0+P1qvgvmQ6H9RRVc3cQkTi6w8oi02mFsKVBwINT6vcZkZcRjlx/fs7t4UwDawu4wTU7uhG6ie6lD8prCnCbOFxJJLmzTM1861/DjYLvFURNR14JGrJV1q+RQgm7cIVM9fqRUt4neDYIbyLpd0W5G3XUWacUkmgibo7mQ13rL9zNpWEG5ierdsirRm5hdgwg8cx//mHdvom1+U+2XMM1H6rYIlNL77PJjwFv+zOWSHOCUTQ2XhOEzIRYwpV/8QKodlgsBbSG2lUrHzRZas0PoRjpFBoXYc9WhrtMtOS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMVZwoKL9uyXiEU5ssOGCM+zNMqsUmbAMGSH7W1sb80=;
 b=F4bXXFBdKZ/AnHgqSV7GpjTPcaLp6e/cwGQb6CuNo/jKcheOKUMRQ4FDZ41pVX6qVkbMw12ySCB3DYv9ERlYeRc6FIybW4vmHqJ6SgaRMvtNFz+JyKRuwpEjpPxlGwKGcu2/o8S9HyIATNkUFh4bY2X8GUYspI4YkgXtrQUOadZXXN8/TfFaEsFJ/4a84gJwGAYZ1wv8ZwpWwfWixg+SrlRscX1DFtcdOK7HyybGxNvOtqzRndrjWGCf5Rk/MjdV4/ns64LEtKoTObXj4LgiDDw5rme4RIojyXrXm3NZ/arYeb2BFc3pMy4AQvLT9701XK6gyxgVsv4EpWaH04BdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMVZwoKL9uyXiEU5ssOGCM+zNMqsUmbAMGSH7W1sb80=;
 b=eRQ0BhvP4Vh0hISU6Ab+If4IOl3gqr8DzhYoCKk/ZoZL1cxRS9dJtGS++UEDKJXbMF7LOXE8kgdV5/sXuCEB+v2Als4+X5olWW/2gLUUf6BiU8UM+Bwhi+F8YjG8RPQdeLwITzVslN3G3sbuTIATNDVNHYrVRhfoqHxILojSs3Q=
Received: from DM5PR07CA0055.namprd07.prod.outlook.com (2603:10b6:4:ad::20) by
 CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.18; Wed, 27 Aug 2025 20:06:29 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::43) by DM5PR07CA0055.outlook.office365.com
 (2603:10b6:4:ad::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 20:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 20:06:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 15:06:27 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 15:06:27 -0500
Message-ID: <c0c465c3-6ab6-615a-781a-e819941d33ff@amd.com>
Date: Wed, 27 Aug 2025 13:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
 <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
 <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
 <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
 <b3874221-5b4f-9625-de8a-4e54dc6884a2@amd.com>
 <c048645d-480d-4b7f-8dde-efb095b2c2fa@amd.com>
 <492b465b-03d5-e80e-a31a-79ce4b1f83f7@amd.com>
 <a4fa5f39-17a9-4b47-a53f-ff49db536eb2@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a4fa5f39-17a9-4b47-a53f-ff49db536eb2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 29487d58-3390-4fe3-6e12-08dde5a5352d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yy83bWZrWlE5b1Z2UzdoenN3bmlvTFZIWDY3Ry8zUnB1SU5ZTjlSZm4rRlNq?=
 =?utf-8?B?TXA4dkdicytXTkJobEZaWjlybDZCeEtRdEdjMUZ5VDBncU8zNFQzVkMwYThM?=
 =?utf-8?B?b2RRNDNJSllCYVNRRjIzTkRGSXlNSW90eFZsOFAxQ2h5L0dQZW1JWjNrS0xx?=
 =?utf-8?B?amxDSEg1MXpReW5lUHM3WWlWZ2dQUDA4OVlkcGVtQ0hNUllDdnhGMXJ1cjRT?=
 =?utf-8?B?Z1ZDVStJVUkwQUlOSkNYSDhJampxMkE4MXp1T2ZzalVCcDBrdWYzSHQzZ1hW?=
 =?utf-8?B?ZVpXOGdNcDNkbUNVa2FjTkc0M21wUFRlb2xMeXc4bXdzOVNCMGdUY0wrKzJS?=
 =?utf-8?B?cnhYV0I2Zk1KL0RjdXAwVkhHRWFidHB5NVJEYy82QnJYWStTYkNwTzM0T1Vj?=
 =?utf-8?B?Qy8rMTl3RDl4ZTh2OGVmdWNYcjc4dXR4TVplTTlYalI5emIxa3JXYWhsZUNG?=
 =?utf-8?B?SHN5MGN4U0xkUHJWcUZMY3k3cGU1eVI2cTFzYUM0dncwNHlMeFZGeTlxQnNw?=
 =?utf-8?B?enpzYnduM1AwN2xZZmhhMjQxZ2FDM1BHL0NhSjdUNHlrRnFpeFFNL2hjTEZJ?=
 =?utf-8?B?TUVVVUl3ajVEU3NHcDRFaFdvQXViK25ZTm5uaEZ1QVQxcnlWNG5vNFlkVGNL?=
 =?utf-8?B?U1doNlFEZ2k2WTB5Ti9Tb0hoU04zUUs4alpucVh0eGx1bURKMzJsT3JNa25k?=
 =?utf-8?B?aDRGeHRFdTRtWURmSU1sRVV6ekxlY2VsMUJTbDB1Y2J1R3I0R09qYzBkb3VZ?=
 =?utf-8?B?QVlMZkZsVEV2RGlHejJycStBNU5jREM0SEhaS1ZPeEw1Wk5QVlB6anh1d0dw?=
 =?utf-8?B?SlBLbkhDQUlHOUJzVVhITlJWSGRrdUZkY1JiQmdRVEMyK2s3K2ExT2k5Njh0?=
 =?utf-8?B?QWdFa0VJOWkrK1pMV1UzeW1TSDFSWG5SMVBucUQyV3ZzUUg2bkhrVTZXRnhW?=
 =?utf-8?B?YTFZaGNFeUp3cGpjVGJWcFVwN01OWGx1UGxpK1FzZVVJVmhBalZraVdNNllU?=
 =?utf-8?B?YnF1RFp5cVlmMnJuTFdOQWpyVHdRZDFkd0g5ZmV4c1RkdUczVlBvQzMrNG5L?=
 =?utf-8?B?bUdkYU1zUm5NM0M5UGlKYURaOGI1MGdEOGNVZ084Y3BQT25mMmtJMWtyWStN?=
 =?utf-8?B?clpwWStmcUN4a2xDZ3FwcUhhOEYwWlBUVGxjSmh5K2V5SzE0WTByS0hEalN1?=
 =?utf-8?B?TW85WXR6TXE5b2w1enNuVE1adGVNRnEyYkJzZFpiM2FLRlFUWExhUUZSZGVh?=
 =?utf-8?B?aXU3RVFPWTdRWm52WlpjWTBqUDZJelA3eHpBM3IwSnYzWFdtT01kM1hlNFZh?=
 =?utf-8?B?RXlsaGJjOFBucjJMMUpRQjM3eitwWVltZDJIdWZPNUlJYWlYbDQzVm1qTTRy?=
 =?utf-8?B?NExJamYwKzU5Z3crRkt4RWhlVys2YkI3NzQzVzNwckFWVFZyTEEvbFV2Vmt1?=
 =?utf-8?B?NHpmdWZIUEZYWExZRmxKUllJU2t0M1NXVWpNQjYzeDNoQ2FQWkVENXZPcVJY?=
 =?utf-8?B?ZWJKcmQvMmdHbUl1SjQyUm15YjNsUE9RbzRkbkVnN0p5RXdqMVNEU3R3akE0?=
 =?utf-8?B?NXZSUmVsbVdTK1krK3dEbzM1Y044UmpacmJ1Tk9RTmN5MndtUmppdUhiRFZT?=
 =?utf-8?B?cmlOVmF3T29HVitHZytzMGdzLzJyYUcvbU9rVGRFWEd0OFZmdko5YUE0QWFv?=
 =?utf-8?B?YzdvL2JhM21Iek0zR0V6T2Nma2lPYmJqeGUvZ08xdDI4UDRNYWNOYklURlFG?=
 =?utf-8?B?akVWQTRCY1lSTXJmcHBDV25PYjdVT2tGSXVmUHh6bldZUzR1bjVET0E0WFVz?=
 =?utf-8?B?VVRsTEZIRW1qM3ZCQ0tzM2VHUzAzUGpXY0l1Sm9CeXZVc0syQzZMUXJ0M0dh?=
 =?utf-8?B?ZDhTSTdQSGxkcE5kbHBCSkVWRy9uL3MvTHhUTmUzWTgvd2JnTHVwb0djRGg4?=
 =?utf-8?B?Nk81NHpsYUhidE96TGl3RzVuWlpmM25TRlpmRUJUV0NSenBzRlNhTlFjRmxI?=
 =?utf-8?B?YjZWWnBuZE14bzJreXpQNXNGWFF3bzhIZmpKOGxkNFIrRHF6ZDJ2SklReE5T?=
 =?utf-8?Q?DkxslE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:06:28.0188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29487d58-3390-4fe3-6e12-08dde5a5352d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646
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


On 8/27/25 11:09, Mario Limonciello wrote:
> On 8/27/2025 11:41 AM, Lizhi Hou wrote:
>>
>> On 8/26/25 17:31, Mario Limonciello wrote:
>>> On 8/26/2025 1:10 PM, Lizhi Hou wrote:
>>>>
>>>> On 8/26/25 10:58, Mario Limonciello wrote:
>>>>> On 8/26/2025 12:55 PM, Lizhi Hou wrote:
>>>>>>
>>>>>> On 8/26/25 10:18, Mario Limonciello wrote:
>>>>>>> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>>>>>>>
>>>>>>>> On 8/25/25 14:28, Mario Limonciello wrote:
>>>>>>>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>>>>>>>> Add interface for applications to get information array. The 
>>>>>>>>>> application
>>>>>>>>>> provides a buffer pointer along with information type, 
>>>>>>>>>> maximum number of
>>>>>>>>>> entries and maximum size of each entry. The buffer may also 
>>>>>>>>>> contain match
>>>>>>>>>> conditions based on the information type. After the ioctl 
>>>>>>>>>> completes, the
>>>>>>>>>> actual number of entries and entry size are returned.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>>>>>
>>>>>>>>> How does userspace discover whether or not the new IOCTL call 
>>>>>>>>> is supported?  Just a test call?
>>>>>>>> The kernel header version will be used to determine whether the 
>>>>>>>> application which uses new IOCTL will be compiled or not.
>>>>>>>>
>>>>>>>
>>>>>>> But it's not actually an application compile time decision, it's 
>>>>>>> a runtime decision.  IE I can compile an application with the 
>>>>>>> headers on kernel 6.18 that has this, but if I try to run it on 
>>>>>>> 6.15 it's going to barf.
>>>>>>>
>>>>>>> To some extent that comes with the territory, but I'm wondering 
>>>>>>> if a better solution going forward would be for there to be a 
>>>>>>> dedicated version command that you bump.
>>>>>>
>>>>>> For in-tree driver, I did not aware a common way for this other 
>>>>>> than checking the kernel version.
>>>>>>
>>>>>> And here is qaic patch of adding a new IOCTL.
>>>>>>
>>>>>> https://github.com/torvalds/linux/ 
>>>>>> commit/217b812364d360e1933d8485f063400e5dda7d66
>>>>>>
>>>>>>
>>>>>> I know there is major, minor, patchlevel in struct drm_driver. 
>>>>>> And I think that is not required for in-tree driver.
>>>>>>
>>>>>> Please let me know if I missed anything.
>>>>>>
>>>>>> Thanks,
>>>>>
>>>>> Right; so bump up one of those so that userspace can check it. 
>>>>> Maybe "minor"?
>>>>
>>>> I meant for in-tree driver, is it good enough for userspace to just 
>>>> check kernel version?  E.g. The drm driver versions are not used by 
>>>> ivpu or qaic.
>>>>
>>>
>>> Just because they don't doesn't mean you shouldn't.
>> Ok. :) It does not sound amdxdna specific. Just wondering how the 
>> other driver/application under accel subsystem handle this.
>>>
>>> Take a look at what amdgpu does for user queues earlier this year 
>>> for example: 100b6010d7540e
>>>
>>> This means that a userspace application can look for that minor bump 
>>> or newer to know the ioctl supports user queues.
>>
>> As in-tree driver is part of kernel, the userspace application can 
>> check kernel version to determine whether a feature is supported or 
>> not. Could you share the idea why would user application to check drm 
>> driver version for this?
>>
>> And amdxdna driver is new added driver which never bumped drm major/ 
>> minor before. Thus there is not any application use drm versions. 
>> Maybe using kernel version directly is good enough in this case?
>>
>> I am fine to bump minor if it provides better support to user 
>> applications.
>>
>>
>> Thanks,
>>
>> Lizhi
>>
>
> If you're running mainline kernel I totally agree with you that you 
> can make a runtime call based upon major/minor kernel version.  To me 
> the problem ends up being cases that distros do a backport of a driver 
> or subsystem that this falls apart.
>
> For example RHEL and CentOS stream both do this, and then such 
> comparisons can no longer be made accurately.

Ok. I will bump minor by 1.

Lizhi

