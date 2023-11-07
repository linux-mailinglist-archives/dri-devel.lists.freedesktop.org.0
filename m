Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B37E34DC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 06:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A1910E4B3;
	Tue,  7 Nov 2023 05:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EC10E4B2;
 Tue,  7 Nov 2023 05:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcUcJsAHbIT0G0fJo41C89uDjyarhVw1JL8KMd5CLmRg7SpvI7gdwRH7YY8fibA4y3CBsPWUjUcJsY7ApXs9c3fdMMsuxDX4CMAGGuQYSjBgA/gZhNFNn4PaODJ6zw1LInGEh1LMXAPI6uATL9R4+GOiSe3mEqsYH2hcsPjowCbMGCPqZu1YUPAo0w0RWpFp5FAm0HXSBbKBYpmIlNsfo5GxGFgVoXg1/IxkK/CORT0f5NcOrj4mp2x1Ol340u5fuzdjbzOduuKvOXoGL4zPLq8FjJ50h554paPE/AhzdbcLXbMsPHy87Z1hUE09a2UOqIRFaU8FyLxzm2R2Mqa7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=co0GKZ350lERr+qAZscG6dRSyTzkVDrS8xEjUL1EeZE=;
 b=oA2hASzC2Da43wMaid/tW3xoFLZch2hzm9pDv8N4+ourh40vc0OMX4aABllOhb0V29M1RYyZ7qdzrVmXTlJ0JXt5FZ2R1zn1Uu5KeUdi/lX+FtucLPknS9ux33yOp5ZVURSVbYV6RtRWHTiBuqGentNmolRuUv3WAEnU/beJIcghTp9q9aauRVABtKaqzWdhZ3YE9+u/Q6OdsGCfwHkr5KKVFJLN9aePkx1nx+lX/weD6VCM2w9c2fO+zlePg+LF5EqCUE08nUtFLgg7to1GbDq/RH3xi1j3cDipj6lmw0tk6sgvO7JB6ouq+FiNI5HFeUoJw5XfwAHCkcfTHRbKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co0GKZ350lERr+qAZscG6dRSyTzkVDrS8xEjUL1EeZE=;
 b=pKlwuUPVVvHCQ2OuyQ3HKTMVfRRGmvgCemCYB4fZh+n1dS78tU4kvOyMyL5pxPddJvUTo5P4tkgRAd53NzQTU3N3RGLThBt29/fweca0DMFonwL9Sh10qWXXeFJEvXUBohkQeOKJK33Pfv39biqBGqGBthnqEnLOCoWF/Q0KyVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 05:30:44 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 05:30:34 +0000
Message-ID: <aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com>
Date: Tue, 7 Nov 2023 11:00:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
 <7b3d3e43-57f7-9a56-14e3-75d6df6dc004@amd.com>
 <2caad369-360e-44f3-a375-d69027e3e6b9@linux.intel.com>
 <04d5878f-c129-8979-87ff-0046560e2dcd@amd.com>
 <124d13ae-c5e7-41c5-43fa-9bde9802fbb8@linux.intel.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <124d13ae-c5e7-41c5-43fa-9bde9802fbb8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::14) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|SA1PR12MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 809655f7-3b89-4025-74ef-08dbdf52a9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olFmLtMtu9U+Kl7TXHXWr46AWq+0yZ/pCfn10SE1Y9g4kJUtjYMsOjWQtCj+I69+Dx+oaaBefCtApZRwBOhEWRpyUSIdJOTomng+0bfdXKR5Qi5OXENmQp8liwJ8sMUNIfa3Xh1AnpmbvwVlcSpAW23E+tCf98tA9ozMwxcUkGaZgVN62bK1IFoA7Cvi+fq1oXNt7Ly8IxN3EUsFq8qZHmL/2A46sN298zmyXG5D8GwTzVOMs6aohKBDDOiNI/UUwN9VLzwEd7piT73fBmvei0S6S/5trcdAS9yiR6K3DvUpnb7NSbAMG5xpzQxMwqfjufiMoT/zPLdB+81I1SdtdmLbXntsvC3OVjDvA+M2n1v22NIwJ3sM/dGU4dcPXd4gVuuJv/0NgmhGyzbCUniZO1SvFqJ5xBbM8TOt3WjCYFBAO9aNZhD5XIBf5+6OlVNJhKLSVGV4PavXWFnKOnJH0jltwAGpcWCmNolCAzORma8CfO+szwaHNdSxN1qeODs5tATl3BXAWJAs1/UI09hGx8CWCKlHdwrSPo5GRn+/rymvV0a1bovCBI7KE3xWQK+fL/5WuEPmnZ4iOhCC/RP/bbSh5SDc8w5R/LmEuVDmnGZHoQabp6Ke2bQ4qloy7iwnbFq0uAehWsmAHYyNPb8qshG84w3MGEoqUpuL7Stl8YexWZyGhcHKYj3uiWhpsbpD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(31686004)(41300700001)(966005)(6486002)(66476007)(66946007)(6666004)(66556008)(478600001)(53546011)(5660300002)(6506007)(4326008)(8676002)(8936002)(316002)(110136005)(2616005)(7416002)(26005)(30864003)(2906002)(83380400001)(3613699003)(31696002)(36756003)(86362001)(38100700002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2cvMk9HQkdhalNtSHZNeUM0SXZBZ3B2MTNlTDM2NVYzUWRpd1I3ak90eXhI?=
 =?utf-8?B?dGN3OHp5S0ZCUFZjVGJGRXZ4cy83OTgxa2JhdzRpVG1vc1dPYjlrdzVqeE5l?=
 =?utf-8?B?Ylg2WXljNHFPWExIOVdicklIalgyWGJKZ3lpVVBBQVlleUdBMEV3L1o1OXdm?=
 =?utf-8?B?dlBuMU9sVXMzaXFnUVVVWWNCaStBWisrVXdubGN5R1FoaXhTTDZJVjgzem1C?=
 =?utf-8?B?dkp6RG1ubjFLV0hMbkFRcjFINVpHS1g4QjRmZHdXWTMwTFpweElZdWRjSXR5?=
 =?utf-8?B?ZFJacXZ0dm1NRE1tUXdmY2VIdTNuTk9iT3lFaHY3TWF5ei9haVAzUE9SVm53?=
 =?utf-8?B?RytwTzVRYmFNcXJjMDNmT0R6NEZvR2Mxa0thZjJGNlVrY0Y1NEY2L1QveW1k?=
 =?utf-8?B?UUhpbWJzRGY1SXEvaVFQTkkvaGVVYWF4dFRpZWZLZ3dEWkovbGJDZm9RM1BO?=
 =?utf-8?B?UzZJVEl0ZTd3TDg2dnAyYjMzSG5hWW5mSFNpTVRIMnIrZzlrVnVVRlVwOFhx?=
 =?utf-8?B?by9yM0UwZk9kenN2L3N6RHJEQWpJZ2lhb2lrd1NMQzlzeVdVN3E4K0FDT2Iw?=
 =?utf-8?B?NU40alFTbXdHUWxYWlk5RlV1eld5bGRhZjcrK1UwdklFV1MyZmFrMW5qYUYr?=
 =?utf-8?B?TjNzbTNoZm1TUmxVcS92dnZVclBPOW13ZXhCbWsyMEQyejFJdFY4eFNLaFcr?=
 =?utf-8?B?SVpJanpiaUdNQVphTS9Ib0J1WFdCd0dtc3JtYmZjeWpHUFhYVnpLSGF3TjFx?=
 =?utf-8?B?SWxxbDYxN3lJOFVjL1FWdVNSVzg2YktDWFNnTXhjSWZxVFhaVXZjcTgrNU1V?=
 =?utf-8?B?djJUaVRJc3crbGtIREdTYXEveEowOUhFdVZ6TE5sdmYwZW1vanpoU2IxM0p1?=
 =?utf-8?B?TC80UE5xYnJJRGN4N2JwNURQZGJGM1dHaDNYaFJLWVNROUJDTFhmUmJCd2lS?=
 =?utf-8?B?bUJSZERsYXRDZXY4OWlqS1h5R2I4R24yaDZ3ODczVHkwMkJCNWdiMWVFc3BK?=
 =?utf-8?B?cXoxZWcvUmRZcXhyblMzc3ZzTWt4emJ1RThOT3ZVMnZOa1JsTm9sOHBjc3c3?=
 =?utf-8?B?cjZ0S2NWZWYzWFZ5TGNid0IzcE9PRW5DcDB3S2c5TjVId2lJTFJ4ejgwa0RT?=
 =?utf-8?B?OWpiUC8wbUlaNXJlMFJHOFdzWWJZWkduT29RRCszdlFpYXBjTTRjeTg0dHV2?=
 =?utf-8?B?UXY2b2UvT0U5S3h4TDJVaFdEQTFVYXNEK3FLT1hLV3lTcnMyTWdPS1llNGJo?=
 =?utf-8?B?VzZrMmJUYzNxTEVnVnJFOEJ6Y3d2MlB1cVJtdlFzSnZNWjNRTERBNWFFUHRj?=
 =?utf-8?B?MmJFUThYZUxPTlVEci90bFgvMk1idUloWTN2NC83cVFndUoyUm5aRVpKNlRP?=
 =?utf-8?B?U0hvWjl5OEp5UENCSWxIRXdldlgyck9YRWxEQWlwazlRbmo3MEFQaUN4QUZ3?=
 =?utf-8?B?bC9CcGFZVmY0Q0Y4dm5WUW9LWjBQSGp2OUFCRmpoYzJFdjhUbnpHZVVJL3JC?=
 =?utf-8?B?a25ONk5adysvN284STY2SnNjeHJxcGdvbDZtcDk2RVBTOTFSS284Y1B1bno2?=
 =?utf-8?B?ZTBubmpCbmxMR0NFT0VONUNaVGRqKzNRWEQwd1hWUGZCSE5scDd2TGkyVmVZ?=
 =?utf-8?B?dkhGVll6RFRSRm52akF6RnUycnlreU5BK2YzSW1LTmsvTmRKWTVpTVloWVNK?=
 =?utf-8?B?aDhiT0NqcmZCVVQ4YjlHUFpTVGlRQ2QycDBSd0hjbmMrQXhQVmQzVnRIVE9H?=
 =?utf-8?B?eXZmcFdCVDhydENQNTliUm0yZU1aUG5nMjh1TE5UbEhSd3lqSmlXQ0tDYWhL?=
 =?utf-8?B?S1czM1JKWC82WjNURW52Y3dUSUY4VXBYMEM4dExIdmNHVms2Z1pXeEVnQUxz?=
 =?utf-8?B?TFFaQWZMVTF4WWlZNCtCVGRDRVBJdi9qbDBpVGQrOWpVa21la0dsRG9XOUVl?=
 =?utf-8?B?V1BYb3MwZmF3WkpkT1BoaGcveGRzUHVGamVpdTNYSzV3aEZ0MWdhVHNQcGNr?=
 =?utf-8?B?NTJaQmM5OVZNZXJXSEFMU0hSQ2QreURvem1pZ2JkSVpIb1ZkSUFqRC9oRDlT?=
 =?utf-8?B?RktuREVEandVMmNRTm9wMnBNOFB6Y1VZais3emY3ZWtmK1FPYVZ2TWtZS3Vm?=
 =?utf-8?Q?aDO18zKE8B99+WMjWNtgKnqvn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809655f7-3b89-4025-74ef-08dbdf52a9bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 05:30:33.9021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Y1AvTZD/sO8/4dvhXH8xgq81T7oIjPxNk3RWmRrfbMP4HYIvEzpu0JqFdDwGTwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
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
Cc: ogabbay@kernel.org, Harish.Kasiviswanathan@amd.com,
 dri-devel@lists.freedesktop.org, michael.j.ruhl@intel.com,
 Luben.Tuikov@amd.com, ttayar@habana.ai, alexander.deucher@amd.com,
 Felix.Kuehling@amd.com, intel-xe@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/1/2023 1:36 PM, Aravind Iddamsetty wrote:
> 
> On 30/10/23 20:41, Lazar, Lijo wrote:
>>
>>
>> On 10/30/2023 11:49 AM, Aravind Iddamsetty wrote:
>>>
>>> On 26/10/23 15:34, Lazar, Lijo wrote:
>>>
>>> Hi Lijo,
>>>
>>> Thank you for your comments.
>>>
>>>>
>>>>
>>>> On 10/23/2023 8:59 PM, Alex Deucher wrote:
>>>>> On Fri, Oct 20, 2023 at 7:42 PM Aravind Iddamsetty
>>>>> <aravind.iddamsetty@linux.intel.com> wrote:
>>>>>>
>>>>>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>>>>>> reporting the errors to the host, which the KMD processes and exposes a
>>>>>> set of error counters which can be used by observability tools to take
>>>>>> corrective actions or repairs. Traditionally there were being exposed
>>>>>> via PMU (for relative counters) and sysfs interface (for absolute
>>>>>> value) in our internal branch. But, due to the limitations in this
>>>>>> approach to use two interfaces and also not able to have an event based
>>>>>> reporting or configurability, an alternative approach to try netlink
>>>>>> was suggested by community for drm subsystem wide UAPI for RAS and
>>>>>> telemetry as discussed in [1].
>>>>>>
>>>>>> This [1] is the inspiration to this series. It uses the generic
>>>>>> netlink(genl) family subsystem and exposes a set of commands that can
>>>>>> be used by every drm driver, the framework provides a means to have
>>>>>> custom commands too. Each drm driver instance in this example xe driver
>>>>>> instance registers a family and operations to the genl subsystem through
>>>>>> which it enumerates and reports the error counters. An event based
>>>>>> notification is also supported to which userpace can subscribe to and
>>>>>> be notified when any error occurs and read the error counter this avoids
>>>>>> continuous polling on error counter. This can also be extended to
>>>>>> threshold based notification.
>>>>
>>>> The commands used seems very limited. In AMD SOCs, IP blocks, instances of IP blocks, block types which support RAS will change across generations.
>>>>
>>>> This series has a single command to query the counters supported. Within that it seems to assign unique ids for every combination of error type, IP block type and then another for each instance. Not sure how good this kind of approach is for an end user. The Ids won't necessarily the stay the same across multiple generations. Users will generally be interested in specific IP blocks.
>>>
>>> Exactly the IDs are UAPI and won't change once defined for a platform and any new SKU or platform will add on top of existing ones. Userspace can include the header and use the defines. The query is used to know what all errors exists on a platform and userspace can process the IDs of IP block of interest. I believe even if we list block wise a query will be needed without which userspace wouldn't know which blocks exist on a platform.
>>>
>>
>> What I meant is - assigning an id for every combination of IP block/ instance number/error type is not maintainable across different SOCs.
>>
>> Instead, can we have  something like -
>>      Query -> returns IP block ids, number of instances, error types supported by each IP block.
>>      Read Error -> IP block id | Instance number /Instance ALL | Error type id/Error type ALL.
> 
> Hi Lijo,
> 
> Would you please elaborate more on what is the issue you fore see with the maintainability. But I have a query on the model suggested
> 
> This might work well with user input based tools, but don't think it suits if we want to periodically read a particular counter.
> 
> The inspiration to have ID for each is taken from PMU subsystem where every event has an ID and a flat list so no multiple queries and we can read them individually or group together
> which can be achieved via READ_MULTI command I proposed earlier.
> 

The problem is mainly with maintaining a static list including all ip_id 
| instance | err_type combinations.  Instead, preference is for client 
to query the capabilities -> instance/error types supported and then use 
that info later to fetch error info.

Capability query could return something like ip block, total instance 
available and error types supported. This doesn't require to maintain an 
ID list for each combination.

The instances per SOC could be variable. For ex: it's not required that 
all SKUs of your SOC type to have have ss0-ss3 HBMs. For the same SOC 
type or for new SOC type, it could be more or less.

Roughly something like ..

enum ip_block_id
{
	block1,
	block2,
	block3,
	....
	block_all
}

enum ip_sub_block_id (if required)
{
	sub_block1,
	sub_block2,
	....
	sub_block_all
}

#define INSTANCE_ALL  -1

enum ras_error_type
{
	correctable,
	uncorrectable,
	deferred,
	fatal,
	...
	err_all
}

Then define something like below while querying error details.

	<31:24> = Block Id
	<23:16> subblock id
	<15:8> - interested instance
	<7:0> - error_type

Instance number could be 'inst_all' or specific IP instance.

Thanks,
Lijo

> Thanks,
> Aravind.
>>
>> Thanks,
>> Lijo
>>
>>>>
>>>> For ex: to get HBM errors, it looks like the current patch series supports READALL which dumps the whole set of errors. Or, users have to figure out the ids of HBM stack instance (whose capacity can change depending on the SOC and within a single family multiple configurations can exist) errors and do multiple READ_ONE calls. Both don't look good.
>>>>
>>>> It would be better if the command argument format can be well defined so that it can be queried based on IP block type, instance, and error types supported (CE/UE/fatal/parity/deferred etc.).
>>>
>>> so to mitigate multiple read limitation, we can introduce a new GENL command like READ_MULTI which accepts a list of errors ids which userspace can pass and get all interested error counter as response at once. Also, listing individual errors helps if userspace wants to read a particular error at regular intervals. The intention is also to keep KMD logic simple, userspace can build required model on top of flat enumeration.
>>>
>>> Please let me know if this sounds reasonable to you.
>>>
>>> Thanks,
>>> Aravind.
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>>
>>>>> @Hawking Zhang, @Lazar, Lijo
>>>>>
>>>>> Can you take a look at this series and API and see if it would align
>>>>> with our RAS requirements going forward?
>>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>>>
>>>>>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>>>>>
>>>>>> this series is on top of https://patchwork.freedesktop.org/series/125373/,
>>>>>>
>>>>>> v4:
>>>>>> 1. Rebase
>>>>>> 2. rename drm_genl_send to drm_genl_reply
>>>>>> 3. catch error from xa_store and handle appropriately
>>>>>> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
>>>>>> having an early check of IS_DGFX (Michael J. Ruhl)
>>>>>>
>>>>>> v3:
>>>>>> 1. Rebase on latest RAS series for XE
>>>>>> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>>>>>> register to netlink subsystem
>>>>>>
>>>>>> v2: define common interfaces to genl netlink subsystem that all drm drivers
>>>>>> can leverage.
>>>>>>
>>>>>> Below is an example tool drm_ras which demonstrates the use of the
>>>>>> supported commands. The tool will be sent to ML with the subject
>>>>>> "[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>>>>> https://patchwork.freedesktop.org/series/118437/#rev2
>>>>>>
>>>>>> read single error counter:
>>>>>>
>>>>>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>>>>>> counter value 0
>>>>>>
>>>>>> read all error counters:
>>>>>>
>>>>>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>>>>>> name                                                    config-id               counter
>>>>>>
>>>>>> error-gt0-correctable-guc                               0x0000000000000001      0
>>>>>> error-gt0-correctable-slm                               0x0000000000000003      0
>>>>>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>>>>>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>>>>>> error-gt0-fatal-guc                                     0x0000000000000009      0
>>>>>> error-gt0-fatal-slm                                     0x000000000000000d      0
>>>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>>>>>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>>>>>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>>>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>>>>>> error-gt0-correctable-subslice                          0x0000000000000013      0
>>>>>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>>>>>> error-gt0-fatal-subslice                                0x0000000000000015      0
>>>>>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>>>>>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>>>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>>>>>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>>>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>>>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>>>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>>>>>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>>>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>>>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>>>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>>>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>>>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>>>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>>>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>>>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>>>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>>>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>>>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>>>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>>>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>>>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>>>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>>>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>>>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>>>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>>>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>>>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>>>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>>>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>>>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>>>>>> error-gt1-correctable-guc                               0x1000000000000001      0
>>>>>> error-gt1-correctable-slm                               0x1000000000000003      0
>>>>>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>>>>>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>>>>>> error-gt1-fatal-guc                                     0x1000000000000009      0
>>>>>> error-gt1-fatal-slm                                     0x100000000000000d      0
>>>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>>>>>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>>>>>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>>>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>>>>>> error-gt1-correctable-subslice                          0x1000000000000013      0
>>>>>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>>>>>> error-gt1-fatal-subslice                                0x1000000000000015      0
>>>>>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>>>>>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>>>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>>>>>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>>>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>>>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>>>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>>>>>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>>>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>>>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>>>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>>>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>>>>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>>>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>>>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>>>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>>>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>>>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>>>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>>>>>
>>>>>> wait on a error event:
>>>>>>
>>>>>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>>>>>> waiting for error event
>>>>>> error event received
>>>>>> counter value 0
>>>>>>
>>>>>> list all errors:
>>>>>>
>>>>>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>>>>>> name                                                    config-id
>>>>>>
>>>>>> error-gt0-correctable-guc                               0x0000000000000001
>>>>>> error-gt0-correctable-slm                               0x0000000000000003
>>>>>> error-gt0-correctable-eu-ic                             0x0000000000000004
>>>>>> error-gt0-correctable-eu-grf                            0x0000000000000005
>>>>>> error-gt0-fatal-guc                                     0x0000000000000009
>>>>>> error-gt0-fatal-slm                                     0x000000000000000d
>>>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>>>>>> error-gt0-fatal-fpu                                     0x0000000000000010
>>>>>> error-gt0-fatal-tlb                                     0x0000000000000011
>>>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>>>>>> error-gt0-correctable-subslice                          0x0000000000000013
>>>>>> error-gt0-correctable-l3bank                            0x0000000000000014
>>>>>> error-gt0-fatal-subslice                                0x0000000000000015
>>>>>> error-gt0-fatal-l3bank                                  0x0000000000000016
>>>>>> error-gt0-sgunit-correctable                            0x0000000000000017
>>>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>>>>>> error-gt0-sgunit-fatal                                  0x0000000000000019
>>>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>>>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>>>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>>>>>> error-gt0-soc-fatal-punit                               0x000000000000001d
>>>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>>>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>>>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>>>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>>>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>>>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>>>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>>>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>>>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>>>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>>>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>>>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>>>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>>>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>>>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>>>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>>>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>>>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>>>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>>>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>>>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>>>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>>>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>>>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>>>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>>>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>>>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>>>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>>>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>>>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>>>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>>>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>>>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>>>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>>>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>>>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>>>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>>>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>>>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>>>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>>>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>>>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>>>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>>>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>>>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>>>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>>>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>>>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>>>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>>>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>>>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>>>>>> error-gt1-correctable-guc                               0x1000000000000001
>>>>>> error-gt1-correctable-slm                               0x1000000000000003
>>>>>> error-gt1-correctable-eu-ic                             0x1000000000000004
>>>>>> error-gt1-correctable-eu-grf                            0x1000000000000005
>>>>>> error-gt1-fatal-guc                                     0x1000000000000009
>>>>>> error-gt1-fatal-slm                                     0x100000000000000d
>>>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>>>>>> error-gt1-fatal-fpu                                     0x1000000000000010
>>>>>> error-gt1-fatal-tlb                                     0x1000000000000011
>>>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>>>>>> error-gt1-correctable-subslice                          0x1000000000000013
>>>>>> error-gt1-correctable-l3bank                            0x1000000000000014
>>>>>> error-gt1-fatal-subslice                                0x1000000000000015
>>>>>> error-gt1-fatal-l3bank                                  0x1000000000000016
>>>>>> error-gt1-sgunit-correctable                            0x1000000000000017
>>>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>>>>>> error-gt1-sgunit-fatal                                  0x1000000000000019
>>>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>>>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>>>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>>>>>> error-gt1-soc-fatal-punit                               0x100000000000001d
>>>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>>>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>>>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>>>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>>>>>> error-gt1-soc-fatal-cd0-mdfi                      ��     0x1000000000000022
>>>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>>>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>>>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>>>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>>>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>>>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>>>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>>>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>>>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>>>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>>>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>>>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>>>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>>>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>>>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>>>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>>>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>>>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>>>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>>>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>>>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>>>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>>>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>>>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>>>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>>>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>>>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>>>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>>>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>>>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>>>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>>>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>>>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>>>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>>>>>
>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>>>> Cc: Tomer Tayar <ttayar@habana.ai>
>>>>>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>>>>>> Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
>>>>>> Cc: Kuehling Felix <Felix.Kuehling@amd.com>
>>>>>> Cc: Tuikov Luben <Luben.Tuikov@amd.com>
>>>>>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>>>>>
>>>>>>
>>>>>> Aravind Iddamsetty (5):
>>>>>>      drm/netlink: Add netlink infrastructure
>>>>>>      drm/xe/RAS: Register netlink capability
>>>>>>      drm/xe/RAS: Expose the error counters
>>>>>>      drm/netlink: Define multicast groups
>>>>>>      drm/xe/RAS: send multicast event on occurrence of an error
>>>>>>
>>>>>>     drivers/gpu/drm/Makefile             |   1 +
>>>>>>     drivers/gpu/drm/drm_drv.c            |   7 +
>>>>>>     drivers/gpu/drm/drm_netlink.c        | 195 ++++++++++
>>>>>>     drivers/gpu/drm/xe/Makefile          |   1 +
>>>>>>     drivers/gpu/drm/xe/xe_device.c       |   4 +
>>>>>>     drivers/gpu/drm/xe/xe_device_types.h |   1 +
>>>>>>     drivers/gpu/drm/xe/xe_hw_error.c     |  33 ++
>>>>>>     drivers/gpu/drm/xe/xe_netlink.c      | 517 +++++++++++++++++++++++++++
>>>>>>     include/drm/drm_device.h             |   8 +
>>>>>>     include/drm/drm_drv.h                |   7 +
>>>>>>     include/drm/drm_netlink.h            |  35 ++
>>>>>>     include/uapi/drm/drm_netlink.h       |  87 +++++
>>>>>>     include/uapi/drm/xe_drm.h            |  81 +++++
>>>>>>     13 files changed, 977 insertions(+)
>>>>>>     create mode 100644 drivers/gpu/drm/drm_netlink.c
>>>>>>     create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>>>>>     create mode 100644 include/drm/drm_netlink.h
>>>>>>     create mode 100644 include/uapi/drm/drm_netlink.h
>>>>>>
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
