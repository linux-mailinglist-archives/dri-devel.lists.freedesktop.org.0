Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C9AB4A35
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 05:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2510E4E6;
	Tue, 13 May 2025 03:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j+RA/nt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1429C10E4E2;
 Tue, 13 May 2025 03:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxv1ltEa6fNwGu72Xa0gsuFQa714hd148abanbCYC1KjkZPzUU7ijN9ppTOHHDW0P/OVCQ9ENe1eNaEdbJnKkla74EB6Un5C87afiaeC6fDKOYR5XJL/xWwo6cMEMdb9gGC9zPOUrrou/XPb1TDyW2CANDzIOc11qnAdDEoWGBJvpC+MH1VsTjNXPRO5nhsL4lvrj8GpQVVwLaZ5k23ebTnh8oZm1Korm/OcQuDIO4UCjym/lKWWBz3Kq5qj4Hx1jf8fD+KC+BTE50iS3ktvChB2LmRIOqiMTzUD3H0CpXZish870lqtzmYHzyMAh7ayOhxdJI43Opr9gVq+CBOhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qM5lJ7a6CXa4wfUuSJmgDfIVRi1CfW6rX47u7r83URc=;
 b=od953F2m5MaMQs6HiqsLGbA6KrqxPkpUpaTGm9Xmci9wueOozNzu8v3o6uzKmk0iso1Hq5aZbo+gGA0QuA3jSLpxXj+N35H2UwtoWdLD1DZBVJdQXMz/KABDhmarpH9reMkKnUVirgIS6GcAOKEtOhTNcFvWsFnXYDArsH+B/5/GBJ4Ylne07EFBasMW/qJ7byRKVzYd09GyYZc9e3qVw0LzZKCMhwZHl/YoHUzQw3j/GM+4tEvwFz8nvFnsruUBOYBHyypOjUfwD+O5uJbDpcK92qkg6JrjbllwhScOxtJ1IyRf3ykU1fhg+Ur4xXoW2RMn7bxLaCQdw+xbqrM0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qM5lJ7a6CXa4wfUuSJmgDfIVRi1CfW6rX47u7r83URc=;
 b=j+RA/nt1k5HqWbrw8J4RRQshcqkVqDCR7RGxxDsV6CIkve+g88wyv41X4wpDuzKJz6RgwUyyExFjUwm018P9760nRvecd5PzKpp1wqoDPYg/DXsP6dhln+TFOq+YrsC3nNoHeETNH/wmP5TWT8VgLZz7wjLT+3Gjqs0X4mPUJqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 03:39:55 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 03:39:55 +0000
Message-ID: <5211da5d-e48f-4dd7-98ee-cc7f7d93c679@amd.com>
Date: Mon, 12 May 2025 21:39:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Leandro Ribeiro <leandrohr@riseup.net>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <e03200db-3e24-49e6-87d4-a9253401c494@riseup.net>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <e03200db-3e24-49e6-87d4-a9253401c494@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dde5b71-9ffb-4ba5-b345-08dd91cfd370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODJuVG4yVlBZWTJtNldGdlg4eTNnWjV3SU9aSEFjWkNpVHBnZWI1cDFOQk5i?=
 =?utf-8?B?RVpuNDdLL1ZUWHcvZ0xlWXI3bWhodlVsQ1Fxc0QweUVVL0JzK1hCYjhVdy9p?=
 =?utf-8?B?YnVhVHVQRitLQUcyd0FjM0tZUlNWNnpvSElRWklDTlBoakJrNXVsRlZ1dk9T?=
 =?utf-8?B?MG44MkxxMDZFWUJpUjI2SThvU0ZLNmtXL0g0aEFkMUVYTDV2UXRzTkx2V3c4?=
 =?utf-8?B?MWFRNk1ZRDZYZUxaK2tXRHhyR2x2c3dBUTAvSHlDNmhidzJBRGsrSmxwa3k0?=
 =?utf-8?B?L2hSZ0NHVXpiK2hmYUdQZWVrU1pYbWo3M0NlSDhteXhKa3pxTFhnZURUdEVo?=
 =?utf-8?B?TFhxU05VT0hSVldranphTjFNMWNUcHdiWHJFa1Y3M1dzUi9lTnBHci9ramtk?=
 =?utf-8?B?RWZIK2orQXFuejlrK3NJTHQweitHWlA3ZWg2VGhiQ3V1R29WdkFPRlBsSFpw?=
 =?utf-8?B?VGhCWUdHcndRaUhsYTh5ZEtoN25mM1RIUW1PM1dHMll0NzlZSEFjZkdldlRY?=
 =?utf-8?B?U1U5Y1liMWhKb20raVU2ck5tbmdsZGpLcy9FNjhTbS8vS3NZSHgzN01MV29z?=
 =?utf-8?B?eG9yMU5oTnNsSVVEeE0rbnJtUHpLK0JDU3hxMDRUdWVnU2JhOGJDZjVuRXVP?=
 =?utf-8?B?KzlHbFAyalo2bUFkcEsxWXlqZGlpOXFMSGMrYmRRUHY2aEpSbjRpTE1RUEIw?=
 =?utf-8?B?Wm1DQlF3NEFoclJFZ1EyK29KMkJYYkpvWWFGenJ5bzJMWCtUNVZVaWhPMVBI?=
 =?utf-8?B?REIyeWVibm82Y3JTL2Exck10OHZKQXM4UEtFclpFVmt2WjliSjJ6QTVodmhV?=
 =?utf-8?B?cjgvSmR2NHNyakU5NzYzTExJQ3l6M0UrL1NPRiszR2ZlNEdlTzQ4Vk82a29m?=
 =?utf-8?B?VS80eU1nS0QybmllQ2YrdHNxWHZyMWpYUWluREIrNk5mUzZJQnBoeE1UTFl0?=
 =?utf-8?B?VEhnLzlQZ1BWa05KajM3bGtCeXJDSTN4bnhvMzVWbE5ERnp5Y25lTGZJTE9y?=
 =?utf-8?B?bGpzVC9wS3dYRXdpS00zbVVGdVJQWC95Zml4QWFiUjlDcWp4UlpSckFXSGxa?=
 =?utf-8?B?OWlxWGVXOWYxeU4weDBRWmdRZ2VlakhTbnhoc0llTHFuWFJkNlg5RlRMSU1q?=
 =?utf-8?B?SmdRMnJTUW84aTdEMDY0UXowcjVCVm9pMFFWbFloUnBxTlprN1dkUFJZQWxQ?=
 =?utf-8?B?KzJxU2xEcHQ4ZG1xUEJtQ0FQR0xOelVtNXpvaFRmcm10MEI2TXYvVU1BTjBR?=
 =?utf-8?B?ZmJkR2xPcEJyMW51bElBZEt2YWJ2WFRmdlYrWktEVjFMWGsxU1doTW5SWXZ0?=
 =?utf-8?B?alJLK2xFdDRGNDBRL3dVZ1BxT1lYS1EybENZSXJ0cmdXQWNOanVVWkE3OENM?=
 =?utf-8?B?cXllRXZnNy9LMDZrakNFZjVEUS94WmJSTjFaYnM1WmI4dzBWU2lncWZxSUdT?=
 =?utf-8?B?NGJnUW8yaE16aHlPeU9PVE9GdkYzMjNRMnFQTkZVOERlYnZjZFVSUGlaekM4?=
 =?utf-8?B?enhnY1BSN01za0lrd21EZnMyR2dKT2NrU1A1NUsxWHFpeGswd1hJd0tLNUo3?=
 =?utf-8?B?T0lBcnpidlhZTTQxb1d1WVJ3WUQ5c2JKN2FuMmZRWENlWFErcFVFbm1IQTgx?=
 =?utf-8?B?UVFWT053VE9DbXJDWmEybEc4eUIwcHhaM1dndCtYZkp2ajlQWUV4MTlrK05n?=
 =?utf-8?B?eS85Y2c0NS83Q3h1clpDZTVJYnpHTnZQZ29uVFlJZU5TTUxVQiszeUgveWtK?=
 =?utf-8?B?ZnE5YllMeXdxVWhKbkE3SzBFUk5FMTlIOFRHdHd5T1g2NWxTS3RVSVovMmQr?=
 =?utf-8?B?QmhMMWJmbTBKZ0UwS0NmNWFYd2loUTBXTWdtTkViai9RTVRzVUx4M0xYWlRq?=
 =?utf-8?B?aUJYbkZtL1FMV1czM1hhc1pOcnpQNFBjT01JNE1kR1o3clkwK2JGYVZJbHNL?=
 =?utf-8?Q?/OxUVeDYDF8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjEvN1laRmZvdFU5Y3lXaHFtbXdVZGVsM3o3MjN1TStURGJrb2ttc3ZjMnB6?=
 =?utf-8?B?QlkydVE2aWUyZWlzOWV4dmtCSDBFZjhvUjUxalpYd3EzMDNxNTBlMUhONTNl?=
 =?utf-8?B?cTBEd1h0V2ljTlE3bXhXazE5WVh0cUFyOVl6RCt3b2xLZmJvd3BxSnVKcXkv?=
 =?utf-8?B?VXhIVWxsMzdXWGltU2FFNmphc2V2dXYwYXBxYnN3Rmd1M0VvMzBQcmNldCsv?=
 =?utf-8?B?N0NXejF3eXd4OFVuS2NYenVwNGo0TjI0cGRKSm90ZU5MOUJTenFwRlhoYzBW?=
 =?utf-8?B?b0Nva2hyRHZLcXUrTmVrMUNaN2FodFVHUnFPZHlnZ2RBdXBteEdsT0x5aTdq?=
 =?utf-8?B?NUk3STdpWlQxTWxOdVpsZnVrQmxFRkV0MGYvSElZWGo1NEg5TXgxcDNMU1pv?=
 =?utf-8?B?QXFXK3E4OHhWRXhyd3dwczJiSmRqZWgremR5TWE0blVZeitTS0s4SU5XUzdo?=
 =?utf-8?B?SnVCR1BoZGxXbnV4dHlObHhRL3ZodnI2Rlg0YXhzMFdJYzZVMXJ6bzVkZ2xx?=
 =?utf-8?B?Tm9iR1NNTkZSZHJGS2x6SXJDUCtVWnBtb0puQ3BlcGlzL1VjY205NzVTOTE4?=
 =?utf-8?B?RlkxNUlSUVZ1Z3Ava09JQ3lYMVNiWWFYSHNDaWRMYk9qYzJBMnAxcWNSbkNK?=
 =?utf-8?B?a25RbHRFaWwrS0p0SVN5TE9UQnFVUDVTRG8yQjBTc1BqQ3k5YUwrV1Bmbjc3?=
 =?utf-8?B?ZFlLcWRhNWdpUittNExQUXhmbXZoeEozNDcvUVZBc0NIMmVWeExhVEd5cytS?=
 =?utf-8?B?aENjT0d5TU9xenllQmtyTlBCaUcwU1BxekxvcDAzZFZOWENobXJNWDFWZy9D?=
 =?utf-8?B?QVFFdnZRWmE4SWFReVlkdFBJcHNYWWE0U3RZRTU3RXQ4RUpaY3NCRy9rTHNz?=
 =?utf-8?B?T1l0STREaWorVE1MZ3dkVFU0YnhMeDFRQVhwMmlpbmVSazQyNFY5dTJ2aXJ6?=
 =?utf-8?B?WTNLdk1MbTRJQlRZdGdBbHJLZmlLdUdaY1pVQ0x2MytUeVp6YW9jYWRkaTIy?=
 =?utf-8?B?YkVKVWd3NzBCKzloSVFWSnBJSHBXeEErQUY0Qi9rL1NZcDZoYk5iUWxGNGdU?=
 =?utf-8?B?VkEvNXBXM3pvRVhBVERVaUlGMXVSbloyNFN4WVVkTVhoTmEySk1xUUVzVGRV?=
 =?utf-8?B?aWcwS3R1ZTFIbXNaTHJGdmFWMzJqRFJSd242Rm9JRFJOVER3QmdhQUduTWtS?=
 =?utf-8?B?Ty95N2NVM1RtbFNUNmIya2ZYOUFCeTIzNnpqb3dybXJMVHYydTRvQjhqbGdV?=
 =?utf-8?B?NEhmek5jaHdXUUVxeUhibmZFaXROS2hRNU5xQXdHU0tmaGhlL0kzMmhTMUEz?=
 =?utf-8?B?VjRCV2dtcW9PM0RCYkYxMHVzUlJQd09nZmhYMER3SWswU09SWWFjUFVoazh6?=
 =?utf-8?B?ZnlLYVNpZXVvcDBRc09wWmFLeVRWUFU3emkxR0dlcGpPRFR6UFo1cDBqNzZF?=
 =?utf-8?B?MGtqYVNqWTlEM0RESWFRRnZ0REhNaCtMdnNuL01UY3g4eVFuT0pQRmhFNG45?=
 =?utf-8?B?R1cxSW1XY09vZUk3VVBZakwwbFUrYjNBc25JUm1xOHFzb1U2TnEvSXVTWmRa?=
 =?utf-8?B?ejFtYnAweFlCWkQxdlRYaVR5eUFuK1REaHpzZ2duMk03Q1hRK0pjOE5RYmdp?=
 =?utf-8?B?cndsTTFwY05BWG1vVVNXbmx6QmVLOEVUUlczNjZZRFdzYWtJY3pOMmZnTUdr?=
 =?utf-8?B?NjV6U0ZXWGRKS2V3ZmFhallkSHI4ZDhISHBOZVdaNmFoUU9UcVBXWTZaSDNL?=
 =?utf-8?B?d0puYWtVb0REZXVYWU9Keko3ckdQanFGSU9zalFjaUFzQi9FcWpEM25LVi9h?=
 =?utf-8?B?Sm9BNGhmd20ybTBFNFI3Wml5aGkzZmJCbXFHVVdUb3BNcnRHQTN2WlI1VXNH?=
 =?utf-8?B?S2wxTExnSTg1cUtFeFVUNHB4Yiswb3ZKU0ZGRXhDYnNsRUZia2xLWldCcTJH?=
 =?utf-8?B?cVd4K3kxdU9tdDVQY0RZQ0RUUXA5eHFwWEZBbnRQVGhxTWJJd0FqWmZuSHRp?=
 =?utf-8?B?NFNPenAyaFBxZTBNeXN0bUhBcEY1dG91Z0tERmg2TGNKVFo5ZnNwOVJrY2pI?=
 =?utf-8?B?NTd1Q3NhUDd4S3l1Z2kxR3U5L1lidG5UWkVMSjBrOEZMT0pFVWdWWHM2UWYr?=
 =?utf-8?Q?r7KCzSQQyz0IWU6obkV8C5+qJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dde5b71-9ffb-4ba5-b345-08dd91cfd370
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 03:39:55.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaV+7WYhnXbBOEUeHPHh05ypTIB283jcgXoI+DbXvMYalg7Zag7wU02muWJ+TupHZqw91iX1E2for8TbnVaoUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785
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



On 4/25/25 07:50, Leandro Ribeiro wrote:
> 
> 
> On 3/26/25 20:47, Alex Hung wrote:
>> It is to be used to enable HDR by allowing userpace to create and pass
>> 3D LUTs to kernel and hardware.
>>
>> new drm_colorop_type: DRM_COLOROP_3D_LUT.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>> v8:
>>   - Fix typo in subject (Simon Ser)
>>   - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
>>   - Delete empty lines (Simon Ser)
>>
>> v7:
>>   - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)
>>
>>   drivers/gpu/drm/drm_atomic.c      |  6 +++
>>   drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
>>   drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
>>   include/drm/drm_colorop.h         | 21 +++++++++
>>   include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
>>   5 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 0efb0ead204a..ef47a06344f3 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>   	case DRM_COLOROP_MULTIPLIER:
>>   		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
>>   		break;
>> +	case DRM_COLOROP_3D_LUT:
>> +		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
>> +		drm_printf(p, "\tinterpolation=%s\n",
>> +			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
>> +		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>> +		break;
>>   	default:
>>   		break;
>>   	}
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 947c18e8bf9b..d5d464b4d0f6 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -719,6 +719,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>>   	case DRM_COLOROP_CTM_3X4:
>>   		size = sizeof(struct drm_color_ctm_3x4);
>>   		break;
>> +	case DRM_COLOROP_3D_LUT:
>> +		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
>> +		       sizeof(struct drm_color_lut);
>> +		break;
>>   	default:
>>   		/* should never get here */
>>   		return -EINVAL;
>> @@ -771,6 +775,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>>   		*val = state->multiplier;
>>   	} else if (property == colorop->lut_size_property) {
>>   		*val = colorop->lut_size;
>> +	} else if (property == colorop->lut3d_interpolation_property) {
>> +		*val = colorop->lut3d_interpolation;
>>   	} else if (property == colorop->data_property) {
>>   		*val = (state->data) ? state->data->base.id : 0;
>>   	} else {
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index e03706e7179b..224c6be237d2 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>>   	{ DRM_COLOROP_1D_LUT, "1D LUT" },
>>   	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>>   	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
>> +	{ DRM_COLOROP_3D_LUT, "3D LUT"},
>>   };
>>   
>>   static const char * const colorop_curve_1d_type_names[] = {
>> @@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
>>   	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
>>   };
>>   
>> +
>> +static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
>> +	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
>> +};
>> +
>>   /* Init Helpers */
>>   
>>   static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
>> @@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>>   }
>>   EXPORT_SYMBOL(drm_colorop_mult_init);
>>   
>> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +			   struct drm_plane *plane,
>> +			   uint32_t lut_size,
>> +			   enum drm_colorop_lut3d_interpolation_type interpolation,
>> +			   bool allow_bypass)
>> +{
>> +	struct drm_property *prop;
>> +	int ret;
>> +
>> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* LUT size */
>> +	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
>> +					 "SIZE", 0, UINT_MAX);
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	colorop->lut_size_property = prop;
>> +	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
>> +	colorop->lut_size = lut_size;
>> +
>> +	/* interpolation */
>> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
>> +					drm_colorop_lut3d_interpolation_list,
>> +					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	colorop->lut3d_interpolation_property = prop;
>> +	drm_object_attach_property(&colorop->base, prop, interpolation);
>> +	colorop->lut3d_interpolation = interpolation;
>> +
>> +	/* data */
>> +	ret = drm_colorop_create_data_prop(dev, colorop);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_colorop_reset(colorop);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_colorop_3dlut_init);
>> +
>>   static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>>   							struct drm_colorop_state *state)
>>   {
>> @@ -441,7 +492,13 @@ static const char * const colorop_type_name[] = {
>>   	[DRM_COLOROP_1D_LUT] = "1D LUT",
>>   	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
>>   	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
>> +	[DRM_COLOROP_3D_LUT] = "3D LUT",
>>   };
>> +
>> +static const char * const colorop_lu3d_interpolation_name[] = {
>> +	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
>> +};
>> +
>>   static const char * const colorop_lut1d_interpolation_name[] = {
>>   	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
>>   };
>> @@ -477,6 +534,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
>>   	return colorop_lut1d_interpolation_name[type];
>>   }
>>   
>> +/**
>> + * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
>> + * @type: interpolation type to compute name of
>> + *
>> + * In contrast to the other drm_get_*_name functions this one here returns a
>> + * const pointer and hence is threadsafe.
>> + */
>> +const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
>> +{
>> +	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
>> +		return "unknown";
>> +
>> +	return colorop_lu3d_interpolation_name[type];
>> +}
>> +
>>   /**
>>    * drm_colorop_set_next_property - sets the next pointer
>>    * @colorop: drm colorop
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index c89d5eb44856..e999d5ceb8a5 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -281,6 +281,14 @@ struct drm_colorop {
>>   	 */
>>   	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
>>   
>> +	/**
>> +	 * @lut3d_interpolation:
>> +	 *
>> +	 * Read-only
>> +	 * Interpolation for DRM_COLOROP_3D_LUT
>> +	 */
>> +	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
>> +
>>   	/**
>>   	 * @lut1d_interpolation_property:
>>   	 *
>> @@ -309,6 +317,13 @@ struct drm_colorop {
>>   	 */
>>   	struct drm_property *lut_size_property;
>>   
>> +	/**
>> +	 * @lut3d_interpolation_property:
>> +	 *
>> +	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
>> +	 */
>> +	struct drm_property *lut3d_interpolation_property;
>> +
>>   	/**
>>   	 * @data_property:
>>   	 *
>> @@ -362,6 +377,11 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
>>   			     struct drm_plane *plane, bool allow_bypass);
>>   int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>>   			      struct drm_plane *plane, bool allow_bypass);
>> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +			   struct drm_plane *plane,
>> +			   uint32_t lut_size,
>> +			   enum drm_colorop_lut3d_interpolation_type interpolation,
>> +			   bool allow_bypass);
>>   
>>   struct drm_colorop_state *
>>   drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
>> @@ -412,6 +432,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
>>    */
>>   const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
>>   const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
>> +const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
>>   
>>   void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
>>   
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index d76c8ffe5408..88fafbdeb2a2 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -930,6 +930,39 @@ enum drm_colorop_type {
>>   	 * property.
>>   	 */
>>   	DRM_COLOROP_MULTIPLIER,
>> +
>> +	/**
>> +	 * @DRM_COLOROP_3D_LUT:
>> +	 *
>> +	 * enum string "3D LUT"
>> +	 *
>> +	 * A 3D LUT of &drm_color_lut entries,
>> +	 * packed into a blob via the DATA property. The driver's expected
>> +	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
>> +	 * 17x17x17 entries will have SIZE set to 17.
>> +	 *
>> +	 * The DATA blob is a 3D array of struct drm_color_lut with dimension
>> +	 * length of "lut_size".
>> +	 * The LUT elements are traversed like so:
>> +	 *
>> +	 *   for R in range 0..n
>> +	 *     for G in range 0..n
>> +	 *       for B in range 0..n
>> +	 *         color = lut3d[R][G][B]
>> +	 */
>> +	DRM_COLOROP_3D_LUT,
>> +};
> 
> Hi,
> 
> I'm experimenting with V7 of the this API on Weston, using the AMD driver,
> and I'm seeing issues with the usage of 3D LUT's: channels R and B being
> swapped.
> On Weston, the 3D LUT is constructed as:
> 
> for B in range 0..n
>      for G in range 0..n
>         for R in range 0..n
>             index = R + n * (G + n * B)
>             lut[index].red   = foo
>             lut[index].green = foo
>             lut[index].blue  = foo
> 
> To map that to DRM_COLOROP_3D_LUT, we do:
> 
> for B in range 0..n
>      for G in range 0..n
>         for R in range 0..n
>             index_weston = R + n * (G + n * B)
>             index_kernel = B + n * (G + n * R)
>             lut_kernel[index_kernel].red   = lut[index_weston].red
>             lut_kernel[index_kernel].green = lut[index_weston].green
>             lut_kernel[index_kernel].blue  = lut[index_weston].blue
> 
> If I ignore the documentation and use the same indices, everything works
> fine regarding the color channels.
> 

I think you are right here. The comment above should state index_kernel 
= R + n * (G + n * B). This also seems to be how corresponding IGT test is.

> Maybe there's a bug in our Weston code, but writing this just to confirm
> that the documentation and the AMD driver are matching.
> 
> Thanks,
> Leandro
> 
>> +
>> +/**
>> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
>> + */
>> +enum drm_colorop_lut3d_interpolation_type {
>> +	/**
>> +	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
>> +	 *
>> +	 * Tetrahedral 3DLUT interpolation
>> +	 */
>> +	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>   };
>>   
>>   /**
> 

