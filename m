Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB946C2294
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBAD10E656;
	Mon, 20 Mar 2023 20:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4E10E64E;
 Mon, 20 Mar 2023 20:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms9o2Jw7IViO2088QB3s7wFhESxg7tkEwrhxmjQC1r+S0IaSDvJW5vJHEyQMePYigJvpeF2WGHz+Oi7zzHuQoEZYs4YIGwG14uEe8Xk4R1MDw/MSl1bTgaZ2ivpEJwvUMlJL141LJOV7ZnFXqh2JoeuY7ounZolQoXBBUGpK28rNhDb8big8fJmb7MSNzfy9NEe0sHu+vuDaReFwke5d6lxTKT5KeOBAD5MqeP5P2vqZvVSHryIdgMsZUkFX881okZRupjtTPbk/YRz+8NDsgyMclSNVlzMVnaQTGyOo/k6s1uyzpt6wEKZ4qg3lgfOwPSV7IBNg41aoYUl0GUuOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D6h4S5SiY9+pK5HomrmtuHvevUVkBupSAYLwxcDSe4=;
 b=Na1EbC9fUpBTAjlkfllynZG66/9h/Bpna2pohXPx9UaPIK3I/LHXPDK1LCCJryDHYd0rJsgX3DPzyZruMJ3omotbvpZTJTbTxFNpTY+nzCEt/kBVTnGw4P7PDW9tW7zJxINouhzZwPIlyL/EfBZxO+0L02C2Q8mHa/okVOLZlEtGBwHeQPYBlBzIvKHmwP8n0IeVWW4kM5CmdRCfmF2qvx2jEq09Xanbh3L//6VRlvVCjWkNdtQ6K2nPnGbRWGPkAuFw1Qn+/X2owO7pX6SkfBdXM5iOCyDttcge/viAtSS4KAv9padwcPP0FWa8QnWN4k9fCpznsQnllYQQN86Mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D6h4S5SiY9+pK5HomrmtuHvevUVkBupSAYLwxcDSe4=;
 b=sVhUJMfT1nHJHQDSy4C1y83d7XZd4q90T3Pk8LnmaJeCsaL1tRBvWu41ydPESIGoO3+K3R0UOeJIbq3xzqyTgf+ZwNt4Ip1GpEsJQcxsi2JsDtQS95nGNPg/iIXS9Xi19/iGN7z0lsafvwuU/2pt2FHUGXAqUu38p15F1VDfqEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN9PR12MB5065.namprd12.prod.outlook.com (2603:10b6:408:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 20:25:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:25:26 +0000
Message-ID: <f4371199-63ad-0487-3066-8149d007b416@amd.com>
Date: Mon, 20 Mar 2023 16:25:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20230309213027.256243-1-hamza.mahfooz@amd.com>
 <ZAttVGN/VdrfkH3y@intel.com> <ZAtuET8c8kSgyX4Y@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <ZAtuET8c8kSgyX4Y@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0199.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BN9PR12MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: d13829d6-e090-4291-537b-08db29813d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9Wr7qmwEnxkQmBG3k1zTLTr7uPg81W9ZNOZjNgWJLqynWL0HFpqYdeVtS4laZOK/RyImcxVsz5tx22wrIbw6zQQK5VuQYUbRKqBT00WVbSZa2bq73wetxqL5NMlFmsAAnxjKEhZgEVlYEyPT+bVKh2QH65s9yk4bf+QeXGTg/71MdEZ9rgFtETbyEcGDTd3OqkKccGQDtOSqTF58bxqsKZpped4XLSGM9/r1fI8vAiXfA3Ve/SDDnf52yLqhaJrw/hR2UJbKxW7hxqdM3DgFtOftRdoB5nRUDro7gbRn6rgUXapPAHSgn9tfoc7BIgLDq1ANs1bKoAlO3VJMotT4iFENuapkgL2lsthCaQbn1SeqQarN5CIuV04YQ2eRR7AVS7GXlT6TT77nEWpKQV01U7+wfB0vaqSHuGgJc98x5V9gzqbWWCURI0+9W0AozicLSx75MtUmTxeAuAXtoOTmPGWfaceqUVqglclPhEIBqESg776H/JEuYNGluuF9JuaYu7YDnN1pQZiR/abW+YYGASCwNpGOL8fT7pZLSJ9Z54cbFYebZWul3KQbGum8ygWCvA27Va4Ext510XVDcANlyYzZVDhfTs3vhTuAh3aFTudla96em1qu9jz9EI4vcEO47cBsh9xqZmPF55G2hPcQOGEWBkg9hoJnPuG6uAiLarkuovLvAE+YkDTYBIUuByzqHfs9XZ/R7Cnig4NSLcxl1xnzeuBDGed9Mq40oJUyLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199018)(31686004)(2616005)(6666004)(6486002)(6506007)(186003)(26005)(6512007)(53546011)(54906003)(86362001)(31696002)(66574015)(38100700002)(478600001)(2906002)(83380400001)(110136005)(44832011)(6636002)(8936002)(316002)(66476007)(5660300002)(8676002)(41300700001)(4326008)(66556008)(66946007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blo5TUs0M3UvL2kxUEQyRG5WaFFVdHlGUld0ekkrM1hGeTc2WkErKzBndnc4?=
 =?utf-8?B?WS9DNWpPVDFBcFNYNVFnOWJQTDNOamFidGNjOFVSSDJvZXU0L1RiTFhDaXcv?=
 =?utf-8?B?YXcrZ1dSdXVIalhNcndjOHEzNEdSeTlWWmtCUHBnR3ZHQ1h3Wmo0VFh6N3VH?=
 =?utf-8?B?MlNpV0NWL1dDZWgwd2h5UUtqUmpCZThKYi9iTEd1eWFSRThLcEtoYzhvRUdR?=
 =?utf-8?B?SHNPaUZHOE9NeXlYSkYyNkRmb25RcnBrZTF1VDhaVXRTdUx3R1d0eFJYallU?=
 =?utf-8?B?Y0M2TWkweDVNbDh3SXVtSGVyOTQ5VkN6LzJnaFRmbHcwMHlUcUljMEZmSk8w?=
 =?utf-8?B?bHRWYnVzaG03NEpjRFlrbnIwd3dkcW5RdFpQTEFIeG5lTWZoVFgyZlJ4Ykw2?=
 =?utf-8?B?V3RTWDMxamgvUDNXUGtDSGdtUEVJd0NxcmkxWG9ZQVBlWG8yOTNQMGFZdFRD?=
 =?utf-8?B?OXdFNG1lNE4yb0phT2MzRmRiODFyMnhTc0FlRCtaWnZ6bGl1QXhhL045di93?=
 =?utf-8?B?b2xPMlZLN0g2TUl4disxdDZZU3p3ZHZmKzlFSWY5UGhXZE5uWjRlSFF2YnJR?=
 =?utf-8?B?dmVBbmJXVEYrNGVicEhOdkppa1IzQ05BVU40aGtSSzBKQzQycDVaTTF6Nmlu?=
 =?utf-8?B?MzE4ZTJLR2p0OVBwNUZnMkJZMG5xOTVVdW9PTGh0ODFWN3B1QndVRFFZK3po?=
 =?utf-8?B?UEdTRTZTR1Y0b20wUzdEbnUvUmtzbzFyL1JxRy9yTy9iUVJ0YUhXZFNZS1N0?=
 =?utf-8?B?cVRvZDR0bGVyaVdZMnVGK1lob1JFMlp6MThjZEdZY0RObjl0bkVxK3JvZmJU?=
 =?utf-8?B?THVJa091cSs2K2ZpaHM5a2JmSXNJNnRPZDZzTlJWdkZoa2FQdDZ4WmlJK015?=
 =?utf-8?B?UUt0RWZuOFR1Tks0OTA0Y3Bma1ZkZFBBczhKYkFKSEM5UXFEalNra1hmT1k3?=
 =?utf-8?B?S0RNVEQ3V2IrRUhDR0RuRDh3bURORk5SeDFhNGg4a2g3bllmU0JISHcrUnZB?=
 =?utf-8?B?RVpydnZoN0MvY2sxcythdGNISS81Z1FlT20wTFU3VWc4anl2SWMzbHBNeVBU?=
 =?utf-8?B?VGgxM0N0cG5IOGhQZmFKSzNvTHpweXh4T0xsR0Z1UmRSZHZrVlp4K1BJZFMr?=
 =?utf-8?B?Nktia0laKzRYMUIrVG11YU9YUGVYb1dRWVEzYmRJK0JBcjR4TEphNjUxb0VD?=
 =?utf-8?B?S0pZeENYT2F1Q1IxS0tIdlhpdzZKODVXUTdSU25SaXRvekRRbTVzckR5TDFB?=
 =?utf-8?B?T0FYNUpIMUV6R2J5ZFMvd3RGOXdYejFXV3Q4ajlWQlJ3K1JDaFNqblB2MzhP?=
 =?utf-8?B?NXZRN0dHMlRBZnVxQVFlSS9SR25rcnRpVjZBa2ltM0RhNlROWVRENkhWRFZr?=
 =?utf-8?B?V1VzS0pjV2hnVVhKNzJwa0M0VTg4bklHZzdiRUN0VTl6U0J6ZFZUdWhvdFRS?=
 =?utf-8?B?N25lQTF1bko3S3JLOUttOUJuVjVqYklLOE1EYzlEeHI2b1ZrVEY5VGVHSEJo?=
 =?utf-8?B?d05DaE5YY2p6R1ZhY210WEIvdkxtM0lYNEpMZGM1dGp3elBOaGtaZVRRVDRL?=
 =?utf-8?B?TDF0dEpMN0s4MzU4M0RrcGQyWml5MGc3TVNpSDRVZW9iWk03OWd3U0JnZXNs?=
 =?utf-8?B?UEZtQ21IbFdmZGtneG5ETlNLQ0dQbW5WQUsvSFYxaWJHNWZWNElWSEpOemh6?=
 =?utf-8?B?eExHbE1TYnJvZktrZUtEVEM2Vm5ITUR2Z0pKcElMT3RBRnR1MGFBKzRDQjVR?=
 =?utf-8?B?blF1RG5uYmRuekdpSU1DemxQRzJ0eDVzTHpkVWdhZm0yVDhpVTR3R2ZZVG9s?=
 =?utf-8?B?N1JRRkpFZlNUM012UjB4QXhDbkwzUjFaVkhmbjhMRE1Wd3dDVVZLSkNrcEN0?=
 =?utf-8?B?dUd3NGJ5NjVSZWdMTm5Yb09mNzRhYVJjeldoKzFpemdRdDEvN2NFQkpTS0RS?=
 =?utf-8?B?OHFDaFJvOTBnckFlVVZyeGhNdXRzK1g3aW1HZFV5b2tseHM5VFhvNFBYYWpn?=
 =?utf-8?B?TjVRQTBqNW02WGpsK21rcSt2SlFud1BmQ1EzOHpWTzB3djRHSXYwbGR5eTNR?=
 =?utf-8?B?cVVLcTRGajZNQ0lqOVVyTzBnbXE0blY1YUx1Zm55blRWNGJzT2lGaEV2QnFD?=
 =?utf-8?Q?GyAul+c3IcNDPH/GanBp5UWNi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13829d6-e090-4291-537b-08db29813d36
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:25:26.0047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzdkMajI59HVyeRzUClyw+hHO/wgs8Yg3P4ppkPy4gbtXrX6cNYwraJ3V0RUgEUT31fi5bOqle2gHdM7xiunwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5065
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/23 12:51, Ville Syrjälä wrote:
> On Fri, Mar 10, 2023 at 07:48:04PM +0200, Ville Syrjälä wrote:
>> On Thu, Mar 09, 2023 at 04:30:27PM -0500, Hamza Mahfooz wrote:
>>> We should be checking if drm_dp_dpcd_read() returns the size that we are
>>> asking it to read instead of just checking if it is greater than zero.
>>> Also, we should WARN_ON() here since this condition is only ever met, if
>>> there is an issue worth investigating. So, compare the return value of
>>> drm_dp_dpcd_read() to size and WARN_ON() if they aren't equal.
>>>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index 8d598b322e5b..ed2ed7b1d869 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
>>>  		return false;
>>>  	}
>>>  
>>> -	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
>>> -			data, size) > 0;
>>> +	return !WARN_ON(drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
>>> +					 data, size) != size);
>>
>> Just FYI there are devices out there that violate the DP spec and reads
>> from specific DPCD registers simply fail instead of returning the
>> expected 0.
> 
> And of course anyone can yank the cable anytime, so in
> fact pretty much any DPCD read can fail.
> 

Thanks for making this very important point. It seems like drm_dp_dpcd_access
checks for that, though, and returns -EPROTO if !(ret == size). So I don't
expect this patch to change any behavior.

Harry



