Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F8B00BA5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 20:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE2610E10B;
	Thu, 10 Jul 2025 18:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dPYJrwV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369810E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 18:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBzUsk0ml88/4ctmP8Y2500enePNjl9tut8d3EwiVVNIcbMqyYRbS8mhAdqBphv1wad/PVWRCgC9fhp2SO1FBk17A426f0Bd9wWBWl2XqXfavs5gDZcGyNE7BIC37iTQd6AtpVRz33RoW52sacbFe2M6FMR74TPreER0Kc2NrSfDBV94gGZR5bIzTfq4auKNaqBF7efwhGGoIE7ieV6ni21VFu3z2rktziitnp1LnnRiL41TkhMXbueI5KqoNhYK0Apd2rL2Bo8VorfzWB32BS3cb3Pc8gZsXzpT2afZpTkCJtv148VA1Etey6HpzpccPgt+4GHR6ta0IOC/Z0BwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e3Nyvht7RG0ZPlcTI/jitgsvz+X0qJKG4Zn1glCLnE=;
 b=Wih0GAMyJk9nkmRgTEw+7Eajoexu272N8svAu7NVw5M/uCx7Av2x5bRyVC4O7RRP4lK4V7uMLE2LPBrQViAHzgLbE4i1SFPu8kG0Yu2C/mh3t0G1PPCUgXIbMaU56ULI9wtqvRHv0JxOuAVIQpmqvymN48QOWG2es4PflP2PRSrKQ6qa8bDeHAlDh1GNQpejjIzWyX0l6muyhQokGYuTRjtmDIcNAr0KtaTyx/ROf0inRpUkrbAuuOi1XfYh+FVkWwNgjMBRv8+WVxjzeaa0Ue5+l2DUJT6SSFQPumKRwwVFIbTygpVUIChrqAVewvueHx6mU3rV2PMsXgvedz75Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e3Nyvht7RG0ZPlcTI/jitgsvz+X0qJKG4Zn1glCLnE=;
 b=dPYJrwV8EX7MQC7qHgaqe+lhj4Ly8M3V8KoDOiBdgylQpk5Jgc1jXB9bimtNQtRKE0NEC04zVpiXjvrD9S/Aoc9JrGypG17SfnTHcWTil3TkKsZawaG8/2CWoJpifnCKv//Tdjgz9S6RHPTJ/6voDJGFJpGjGIEdMOyMV2uxM8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by IA1PR12MB9497.namprd12.prod.outlook.com (2603:10b6:208:593::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 18:49:19 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:49:19 +0000
Message-ID: <2e1d9ea6-a9ae-4053-983b-9cc42da81ae2@amd.com>
Date: Thu, 10 Jul 2025 12:49:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/9] firmware: xilinx: Add IOCTL support for the AIE
 run time operations
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: Ronak Jain <ronak.jain@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-2-gregory.williams@amd.com>
 <603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org>
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:806:126::29) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|IA1PR12MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: a18ceaba-f36f-4965-651f-08ddbfe27a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmVLc3NQTkhsazl2bHBYRkhFbDAza2ttSHZHWi9wZWdJVVh1WmZzWEtEeTBZ?=
 =?utf-8?B?eXordlRGL0ZEblpNT01zZTZueUFRLzNjQXcxZmJnQUViTmNPS0pRdGY0ZC9i?=
 =?utf-8?B?a2JySm9lWU0zSUNPeE8yVkZVbmxBN3RhYm85YnNnOTJSdGduN3pKWnFCUFhV?=
 =?utf-8?B?eDRNc1cyTFo1MUpMM3drNXBpY3J4ZXNybFFWU0pNVUIvN3EyMklRL1FRa0Fp?=
 =?utf-8?B?QVZJblpuQyt1ZHFFdjB2TWZkdFVjemlwMWlUbm1QY0V0WlhJbmJTZjBrNkZQ?=
 =?utf-8?B?ajNHR2l5a0F6VFNZNUxNd1dyMFY5MzY2MW5mRk5NVEdhMUtQb1d3dkxESUp1?=
 =?utf-8?B?UXZGQURKM08zeUJ0WVc4dU50YlRVWDVpK0pJZVQ0aUxzK1A3bmUxSUcweVNM?=
 =?utf-8?B?a0MxZjB5VTIzZlJlUVd1ajhmT3JpcUpPdG9DcVZ5Z2Z5TTkveUFWNFpDU00v?=
 =?utf-8?B?ZXhaSFVLc0ZRMUlYOG1OWHRqdkVQbmxsUDdnZ2dTM0IvZ0F4MjNqbXEycHF2?=
 =?utf-8?B?R0lSMk83N1RnelJIQTBncWtkNG1BUFBDNmNaNGpXWHVuUkxUR2xPU2dUa3Zn?=
 =?utf-8?B?Z3dHWFNTVnkxcU9seldGMFhhRVBaWnAxblJ2bk5MT0M1dFQvUjR0SnIyaFpS?=
 =?utf-8?B?Y2NhTWdWN2Y3QWhPdzBsWU16RDI1TVF5aFpwdTlHb2tLUjNTeGJqZzZGV2J6?=
 =?utf-8?B?eFRrelRDamVGTTQvQmMzWUxRVmllMHh3MVVLcEYzNTB1MXhKRDl3aE5FMmJi?=
 =?utf-8?B?dFBubWF6NzJlNFVTeXZ3c2gyamI4aG5UR1FvYjh5bFBLZE41RmNoL3U4Uk9G?=
 =?utf-8?B?eUpIazNXS3E3MWF6a3dwMUhkdzhpUFgzdjlBNlAvRzN5b1NQVHZzb2Q5ZVJp?=
 =?utf-8?B?QzdJU2JRWDRTQjRzcjNkQkJDekFOZC9rTlBaRHBvWVNSTENaRUxRalFudThw?=
 =?utf-8?B?ZlhKb0w5bDVyVUZTaDFRMzZCT3hjbG03eUtzUkxkem5MVEVQWnZPTTNjeXcw?=
 =?utf-8?B?L2xZV0d0WXJKS1ZQRXJueFY0NFJaL0Y0ZzVBTDEzMjV3RUtCNlE0YmZBbm02?=
 =?utf-8?B?ZEVOSDBQT096SWw4UXRvQkRqM29QVnBuS1lYa3FYOGZaQVBVL2dGczZITzQ3?=
 =?utf-8?B?aVFLY0dvVXVKWlgxL0F6NUg4NVBmNkl3MUxYTTdKSjVEY0NKcm1hRkhvdmYw?=
 =?utf-8?B?RkVGTnBNQUQ1d2I4dTUwNHlucVZjMWppNFFjQUd1TFE4QmlZL3ZOVUh5cklC?=
 =?utf-8?B?QlF5R0g2RjROQnZ0ZkdFSXFFRUtyYUZ6UXFyQVVMeTlLbVN6ZHRIRk5uUUw0?=
 =?utf-8?B?ZnhrS1hKVmNBMDJwWUlTbE15VWJzY3JBUDNJamFMZ2lVaDlsYXlvU2ltSkZX?=
 =?utf-8?B?U3UzTFlIZEJZVEh2NitGMzNrTWZaOUFXR3grVFkvQ0VrTlJ1a291UWE0bHZZ?=
 =?utf-8?B?bHZjSUdnTk8yeHB5eDkrTzA4YmRudGVEWEdCZ0JleEJPcHFVRWxJK3NUQkZ4?=
 =?utf-8?B?NnVYWUY2L3grQkhmekFSMDNkTFd6NHBtcXJST0tacFBDeVdpamVpTnVzKzc4?=
 =?utf-8?B?RVNNcDRLNlpqdXZKajFMUWx4Lzd4MnQ2ekF5bDlrem1aN2YxWXdTc1RYcEto?=
 =?utf-8?B?YVNpOGIrdjhDSTM0UEtLR3NDaXFJdTVjMS92dFoxdE04V1hxZWxvRjlveG55?=
 =?utf-8?B?SzA4WGdMc3JjYnJSYjB3VStzQnJrT0ZIZzBMSGhONHZoSFllZDVCMXFQRkxp?=
 =?utf-8?B?azFUM0hMUmdUZzhwMHhKRDdYdUNDL2ZKTDdlRWd5eHVGNGZUS3hXdWhYZ1Fn?=
 =?utf-8?B?bHEvOUVYYkxpYmxHWEwreHc4V0owd2hUN2NibFdLTlUrbDBjUlltSzY1THFt?=
 =?utf-8?B?aEQrWVNFdWZTNXdkY3dyWTFvUmdVVnpwUHpPaVg2cUZydHM3UUMybmZVVTRv?=
 =?utf-8?Q?cQ/PkiUNaYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUljZ3ZSQ1NucmcrRGNlTnl5Z25jUmZIVks5SW9oTHQwK1E3UjFtWlZLNVBX?=
 =?utf-8?B?K3FhNFM0TVVySEsvdVpkMGs4b1NqKzBiSUdsZlRwUHdxYkxVQ1NvWmRvN1Jq?=
 =?utf-8?B?aEh0TjNHVUJCWnRMV0txdjRlRDhpbWFnRWZiZWVydUZ6NEpaY0JCRW1xblp6?=
 =?utf-8?B?eEFjbnFsS1lJVlZoNUZLS0xRSHZ6eUU0ZjF1SHdJbzV6VDVwVjB0bUgrWUdK?=
 =?utf-8?B?d05SN0c3ZW4rMVhBZXczVUhpQ1ZTc3M5aXVwRS9McndqdFUydEhLdDgxZEdh?=
 =?utf-8?B?dkdqNmlxVmVpM1htbS8wYzQxMEhFaUhNemZ4RmlhK1V2ZmxqZDRRTG1aNXh4?=
 =?utf-8?B?Sng2bGFqMlJYODN2eHJvSkVlMVpBSnVtQTRTc21Rd3VYWUF6RVViTVF0dnlZ?=
 =?utf-8?B?VnNKRWlYanB1eGZubURNbnFpMEdhcS83UVZFQ3ozUFBlQjZmTEVVZE5Yb2pt?=
 =?utf-8?B?Mlg2RDJYUEUyNzI5WVM5YllaSit5ZXhwODkrMEVLY2NhRFphUG10OHlHVUV6?=
 =?utf-8?B?M0JvRUdodXBnN0VBM1lnV290K1plMUZuUGJOWGNnL2c0RjUwK3VuUEpXdEgx?=
 =?utf-8?B?dk1PZXpQUnNxa1FSNEg5MXc0cGNSbUFQcEl5bXRvdVIwMHdNQUhkdlRGYUtJ?=
 =?utf-8?B?UERCbmpmOXByTStKQThhK1hoR2poVUMwaUdNVU5SWTBkRzBOZ2FJSU1aNWVk?=
 =?utf-8?B?OGtrZW9PdGRYWmg5WVdHc2pnTWgzL1RTTlk4aGxob1gzQ2VKWjVGOGxYTGF4?=
 =?utf-8?B?RENGcGVaM3AzamJhVWIzVGNyWUF4aDlXYnNvUXpaRjBOZjJ4QWhHb2xzcFQ4?=
 =?utf-8?B?cTJLN1lKcS80T0JQc2QzWHQ0ZGdwNHJJVHRUdVZpOU85OGkrRDY0QThBQWF6?=
 =?utf-8?B?UlRxdDVZYVpDTkVrbUxDZmJxbzQvSW03Mjd6ckJUWFN2SkhjUTlhT3lXNk51?=
 =?utf-8?B?YWpEa3JUUklFWittdG1oUjRJdngrM05JQ2l6OURvejJERTRraGptNmFhZkta?=
 =?utf-8?B?bUg4MzdTZVh3WG4yYXBSdzIvd1BFSDBmaGpsY3FpYTZyaUZCekdtU2lvbjlq?=
 =?utf-8?B?dnZVbHVwM3hjb3NzUzRQUWRNQldtRmtWSy9oekpMNlE2a0MxT3RSeUN0U3F2?=
 =?utf-8?B?VXlHdEtqZWMrQ0VybzdKWmNIMThpNUNKZ1hEazA0UnorQ3V5ZE5aZ2o5ek1C?=
 =?utf-8?B?OE1pVjdvTktnNUZpQUgzMjZwVVFSNlRiVTQwdG8wUkQ0aWhkUWQ2bThPaksv?=
 =?utf-8?B?T0Z1cjFIMzdCY2NCVXpmeVdlakFoY3pUWnFKQ0E2QzFNTENUbUJRb3R1MHNh?=
 =?utf-8?B?aElPZ3NtbmNMeWlNNDJOQ0hGQlExS1BNVklWV1lsOHFUZzRTOVIwSWVWaFN1?=
 =?utf-8?B?ckpSWGZkZThUZG40N2twREVyWkthVXNreWxTcmQzVnFuVk5lNzlLOExpT2w1?=
 =?utf-8?B?YXBIdDJaSmpIcVdDMUxDNUNkMUMva1JyNi9oRWpjV1VzNGxSSDg0KzZDYnNT?=
 =?utf-8?B?elB1dksxWE92SEpnbVlEYUQyWFdxdzQrY3pGL3RrZk1iYXNDSDRJaE9XUGNK?=
 =?utf-8?B?bGlrTDkyQmJ0OUUwd3hEcUNiWFJnRm54Qk15K29SNWlRbGdHcXVwVXh0Ym1u?=
 =?utf-8?B?NTg2ZnBRME9DbDE0aXN2OTQ5VTdnNXNOV2pFYWJWMDlWOFc5OFpJT2VPaDFh?=
 =?utf-8?B?WU1jcW9OL0s3ZGZHeFVpRXhocFNxaThLNzNuajdlNGVmeDNpVlpZMGZNazB6?=
 =?utf-8?B?bnVnWW1XMi9RZjlFOFZQOEhHb2xxMXk5QTBGMDR1bFhWWXlicmlwbVRUSWsr?=
 =?utf-8?B?bU9LMk1ucGlZVlRSQTh0c2d1YkFaUjlTQTVuOUw5UWJocWZ0emtNQ1Zvb0RB?=
 =?utf-8?B?TUFxblNBTEhkMlREYWkzU2s0SzYxT084YVBsdlRPaGk0ZEw0bXRGK3B5bmFH?=
 =?utf-8?B?RERjQS9sUVNzWURDSERXSlhqUEpQSEFNV21MSS9HYTVnNkZJMjRpYktHdlcx?=
 =?utf-8?B?ZU4vdkZaL3VSTnpJRDdnd096S254TlV6S0FtU0tZNEdhMC8vWkFoS2tMVFdu?=
 =?utf-8?B?YnFHZ2ZkdVZIa2EwZVdoMUs1QlBZUVJkZnZzVEhOaHNGQnZMVDJiOHJiRHlj?=
 =?utf-8?Q?p3b/8j1KRvW4PPLZ4fr2RgwBt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18ceaba-f36f-4965-651f-08ddbfe27a39
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:49:19.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eea8uhJbJY/aTV3RRDyCNA7ODh+7GRktQHAbvv4RPaK9AYPGBaat0jmNxpIVMl3WRj3Zi5x9m2yAxg2rbeddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9497
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



On 7/3/2025 12:50 AM, Krzysztof Kozlowski wrote:> 
> 
> On 02/07/2025 17:56, Gregory Williams wrote:
>> From: Ronak Jain <ronak.jain@amd.com>
>>
>> Add IOCTL support for the AIE run time operations listed below
>> - Column Reset
>> - Shim Reset
>> - Enabling of column clock buffer
>> - Zeroisation of Program and data memories
>> - Disabling of column clock buffer
>> - Enabling AXI-MM error event
>> - Set L2 controller NPI INTR
>>
>> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> 
> Incomplete chain. Read submitting patches.
Hi Krzysztof, thanks for the review I appreciate it! I will make sure to fix the chain when I send V2.

Thanks,
Greg
> 
> Best regards,
> Krzysztof


