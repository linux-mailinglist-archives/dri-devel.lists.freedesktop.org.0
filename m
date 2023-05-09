Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7C6FCC90
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2310E3B8;
	Tue,  9 May 2023 17:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5410E3B4;
 Tue,  9 May 2023 17:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/AuFF9Wy72NkyoWfT255luH3NDgvApq6NtM8oMrvuoTSAqUttWHKvzBM2dJ3pvZ9uw12himZoDNk+JTkoFdHGS8SEVymJLet997xrVn5Chgel8TngH15urEDPnHtPUYow2QZJ6Y28AZL2lzs2gZNKw258pybC8iIqGd68BNnSQrD2Yr3XToxW3vkHTRNOG+jlggvRShBGK/LXe+ZJuQ5e9N04YrQIIiIdsVnhqdEXW+zQ7+ztSCSamdFdy54z2NlNccwS3hW66Mm+lPINUd60CoERT7NsxuveF6EJAR41IOglWQZ0sQcKYHCucS0xWAWWsHJdQ+KWwCV1zlzzLMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmoHPXywD3WPCT5I69SdDxnVbL3QNrmj8QHoLHSIV48=;
 b=kQH0jGF+9Yoi5GBi9Uy/UbgNJ6v1xFvK7r6cjrncApzW/c5i4dyM43uzj3Bw3PXSRXjSMpOGPzSqO7lksLYapmHUjWDgDy/0MhY9eY3K+qBjCuqyEdRZvKN0V1/vabJlQ+ZqigNRcKEKwHr3qNGwxB7a+ATYcnqZ1aXIlGgL2tL7IawFEPXx6NhbGudadcqYnnPOmiE/lz6hveSRb+FX3CPBfAqsM450flor48eDhgCUzZaDCnBp5DBLjebWal3K+lbhXGkadTS7l/k8sSpkrjesjrxVgYWyMtm+M+U8+llRG18jhF/uKogqCQueS+SYl8D01ftS5VhYUPtC9jxaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmoHPXywD3WPCT5I69SdDxnVbL3QNrmj8QHoLHSIV48=;
 b=KKt23fGexi80yDvKOMcSQuiVRdRRLSepCkMw+vyLM4dPurZ4Me1Lw4gwnM24bYZWWPTe92MmY9V0WHJ63xMCcGMqZwAZzq1WcT89R9oz2H4kjOv75k12m3LlR34rDc0wtzbYCEbOx2tBpjlk5ZFKMZluS8v2jP86fxx+Hybrgcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 17:20:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 17:20:55 +0000
Message-ID: <0764089b-c256-8b96-6604-b9a472f2430a@amd.com>
Date: Tue, 9 May 2023 13:20:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 03/40] drm/amd/display: introduce Steam Deck color
 features to AMD display driver
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-4-mwen@igalia.com>
 <613b2431-7d05-fb44-25d7-dba59e5eca3c@amd.com>
 <20230509162353.7hak3fda43fim3ho@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230509162353.7hak3fda43fim3ho@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a62dcf-5a95-4f4e-5a60-08db50b1bf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LULZ/Yum5JPBInkhGY9JmtLoqNEh/B5YJCrdVVqF1zu0b3chjBDQcJJDOSecKqTd3d6okaLaNgZh4NCGbik++We783nzsbNUFWR7h3gQ2TShj9xCWABld5nk3sLDfAGkNnYA47QmuEmQfKPEWWYSJAtz/zi7uqs5EaWfUgXdCeJZ9GuqjPQiwQxGxOqAtNVVzl8YP8yE8y3N3b+IQqa9+Gjy5nQ01I9DFa2dukBmD1UDnFHOIZSoxDN1YhUouNC696J3xVN6qXiv37DbyDMr0G2QYyHx01VgXMy8iQCHf+fv5vPRUZNqosJnzp/5iAGl7J6AOfDlZxCaKr1e8kGsAmVZhWMyp0FWvwq6a543Q9/Ub/cOjoh7tAdnxLJ6pDnKZbtjD4tz8RVt3X09vr83Q5lKJTnGZGG6X1SxtInEHpa0Rxn8lNN1xmt3F738ml0j08zBEHE3dvEoncyNqPOAayaJ2WJ4wWunGmErhjp3v9sBIYOnh+IOhDaIVK6WLIUYuifCNP1eROSycHPmysAzz7F/BmXk9eQLiAyfHJzhO8+Tyz2qgSK1N0GOjXi80hIpl3J9tFG77nLqNuS9Y7rpddnh1ue/y2ZT8RIKLHEFWFUJbUCmNtTAPG6PoMiuq4OEU+hq5+kdPRuxmmtyHN1fcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(478600001)(53546011)(6666004)(54906003)(2616005)(6486002)(186003)(6512007)(6506007)(26005)(44832011)(2906002)(36756003)(8936002)(38100700002)(8676002)(41300700001)(6916009)(66476007)(66946007)(66556008)(4326008)(86362001)(5660300002)(31696002)(316002)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE5QQVhPeGxmekRESTMvOWdWVXpKb001OThwWFZXZnNaN2ZVOHh3RVB0QXhL?=
 =?utf-8?B?WThCREZIMUlXUXRYeXQwNVRyOE01Yi9PbE1haXNKdW1NRXBja3pEUVA0cGN1?=
 =?utf-8?B?QlphcUJhSVBmWnpVYzdBTDNMVkM5UXBYdzNTWDl2R2JRVHN3Q2J2RWo0alZD?=
 =?utf-8?B?VTNuYUE2b1BhU3Rsa0piRTFVVTdubmxZOXQ1VlNDNzlRTCs0dEZMU09OcjBJ?=
 =?utf-8?B?Z1NXQmNoRjhxUmhsSXluWmdvR2R1YmJZN1RVSUpwdW1VQnRsN1Boa0hNZGxB?=
 =?utf-8?B?ZDV1M0laUEFLeGErdU5oek1jUTJ2aHNPL1RTY2NybmVOMnpMOUZkM3NYSFRB?=
 =?utf-8?B?dC9lcjR5WHZ2WmpNK0padFNUaVFLQWpVVEFwN3dvVTc2OXJIeUcrZEIzYS81?=
 =?utf-8?B?NGRtbEZyZmVFN25ZYWdvaEZFbTZnWVVrSUU4VGYrbThBUmxZM3BJU0M4UGVP?=
 =?utf-8?B?d0t6bFlaMzNya1hwekxISHY2OWZjeFZCaEpSWjhmM0Uxd05HeFhZdW1ld0R2?=
 =?utf-8?B?UlBZaEExMnpwVGRNVGtlNXhsZm84by8wdmR5TGpIRUxhQUR2ZzUrZWZEb3Mv?=
 =?utf-8?B?cy84RUVmSG1wRytwMEZTSUJneE5xTWEwcjBXdHovVGNVSHhDL1pMbm5kSHpi?=
 =?utf-8?B?b3RNSDQwaTl5V0lnUWZtQnM0TFNMOU5hL2haTmJyNEh6aXVyVlNCbUVqRTBh?=
 =?utf-8?B?bm44bVVaVEZ4Qk03UnRBK3hKRi9ZTzdVRDNFUi9SelNXSHZQRkx1NFdDR0xw?=
 =?utf-8?B?NUowQXl4aGVRTEd4NDJpcVVDbno1a09mQmhGS01iUE5vWTNWS2lzN0xkMzho?=
 =?utf-8?B?Nk5jZTNPSlhPZWVnMEgvaytOK3c4N0dqZHVLU2ZKTzc2bHN2RW5MYUk4dXBN?=
 =?utf-8?B?bTlId0d6aWswNTdYbnRFajVCc1JqdjR1eVc5ZEdPSGRhMTNjdktqRFhnb2ZB?=
 =?utf-8?B?YUFHa1JrQzBzTDRwWDdPVWRETFVicnBaYkplUUwxb09jSWJ5QlE2NWVPZGx2?=
 =?utf-8?B?QzROd3c4QkU5emVvKy9zK0cwdmh6M3NQMG52VEs2UjA0cDhkNlUzSUk1dG16?=
 =?utf-8?B?ZzlCc0lHcStiNEtZWEY5NnNhUHNhUjdmQmNsemdYL0czdUlrOVBtd0VWM3Vt?=
 =?utf-8?B?TlU5eHZOK0MveU9YWFZhQlMyVmhZSm02RFlXekt6MHhxaW9jcjZEZnRQSHhv?=
 =?utf-8?B?Z0wzaDM1eTQ1N2p0ek50SWhUZC9BekJFUDZ3OUhsSE5rdnV1VDNFcGU5NVlF?=
 =?utf-8?B?ZFJlclI0dUxhZnBhMWcxeHhtVEt1aVZGUTdkSU9BckhEeG1vY0pZNFAwV2ZH?=
 =?utf-8?B?aVRTUVVCUGY5cTUrWWtzaHJzdmRzQVNLdHVMMnMvc2x6UjgvbG9YbExxZXpQ?=
 =?utf-8?B?ZXZJL0NaU3NaQkY1TERldFdOdzBLdWE0M2RxUm40NWd1TWZLRXRZdit1ZTRh?=
 =?utf-8?B?WVVlMXJ4WmZZaFFFM1E3a3VhbUQ1dm9ZU0FZQlhKZmhJcEF0RUZreVNoVjVV?=
 =?utf-8?B?b3R6cC9USHNZaHhNVFIxVWs5WWRianhaMmF2TnNLQVU5Si91ZWJpR0laTlN2?=
 =?utf-8?B?Z0JHUWo1NTlzYWNsc3ZCclFId1BPbzZRd3BEMVloeHhMTWhwWGV0S3grMDJu?=
 =?utf-8?B?VXQzOWtpMHJ1TzQreVdkTk1CTTFGTjFmQ29VNWErSHFvcnJjTHVjalhBaTZZ?=
 =?utf-8?B?byticXV5V3FPM1prMXMvY0pjNmxVbHhkMDZLVU14TnltR2FISGNXcUlPMzU1?=
 =?utf-8?B?TVZZYTVNbTRPU2hHWTg0cm5xWkh3VTNJSTh6R1ZmaHZOeUFkdU1NVG5JdGZU?=
 =?utf-8?B?UjJsYXN3dldBei9PYlZqcEFVVkswa1FudE56L3UwYjl0d0J1UVNVT3IxK2Rm?=
 =?utf-8?B?QnFYa1JMQjUwNGJoUlBUTkc5Z2xuV3lCdSs1ZUhJTTM1Sk5tRENPUTcwdWlV?=
 =?utf-8?B?alo5aXNuWS9hdmk3ai9tMVk2THFBQVBMUGwrZFhvZTA4anJwVHB4T3c5VTRp?=
 =?utf-8?B?REcwK0ZXYlhHSE0wSU9RNUdGUSswYVVlM3NIZ0cvUnR2eHkrWXdEUlhldnFK?=
 =?utf-8?B?UC9zTXI0SDVjY29XdEZZcTQ0aXU0K1FLcnNqaXBuaEtRR2FGeHhIbEp0TTZz?=
 =?utf-8?Q?ERA7w89gUB0qthNDXUBbrGeAB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a62dcf-5a95-4f4e-5a60-08db50b1bf4f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:20:55.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mqnVjr6YXf5PYUka1hSDcXAtsnjn0GEXTHqvZT8biPiN92NPlwnVifhSBsSqG98jeQ8pa+7h+S8K8X16tLB6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/23 12:23, Melissa Wen wrote:
> On 05/08, Harry Wentland wrote:
>> On 4/23/23 10:10, Melissa Wen wrote:
>>> We are enabling a large set of color calibration features to enhance KMS
>>> color mgmt but these properties are specific of AMD display HW, and
>>> cannot be provided by other vendors. Therefore, set a config option to
>>> enable AMD driver-private properties used on Steam Deck color mgmt
>>> pipeline.
>>>
>>> Co-developed-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>  drivers/gpu/drm/amd/display/Kconfig | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
>>> index 06b438217c61..c45a8deb1098 100644
>>> --- a/drivers/gpu/drm/amd/display/Kconfig
>>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>>> @@ -53,5 +53,11 @@ config DRM_AMD_SECURE_DISPLAY
>>>              of crc of specific region via debugfs.
>>>              Cooperate with specific DMCU FW.
>>>  
>>> +config STEAM_DECK
>>> +	bool "Enable color calibration features for Steam Deck"
>>> +	depends on DRM_AMD_DC
>>> +	help
>>> +	  Choose this option if you want to use AMDGPU features for broader
>>> +	  color management support on Steam Deck.
>>>  
>>
>> If we can drop this (i.e. don't offer a CONFIG_ option to allow enablement of
>> the uAPI, but build with -DCONFIG_STEAM_DECK) it would go a long way to keep
>> us from requiring to support this forever.
> 
> I see, I'll follow this path. Still on that, I've changed
> CONFIG_STEAM_DECK (too generic) to CONFIG_DRM_AMD_COLOR_STEAMDECK.

I'm not sure I like the steamdeck name in there. There's nothing
inherently in this API that's only for the steamdeck.

Harry

> Does it sound better?
> 
> Thanks,
> 
> Melissa
> 
>>
>> Harry
>>
>>>  endmenu
>>
>>

