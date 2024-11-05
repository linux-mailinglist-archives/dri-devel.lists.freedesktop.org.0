Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E49BD8F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 23:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25710E0F9;
	Tue,  5 Nov 2024 22:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="duXTRupP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EABA10E0F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 22:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4PyCbjtxkWq8zT0VyOO/x84eXl6H3LqLMJ83MgZky94NR7wRE/xzDxOuGMXPSFZxQ6b5MJO8X2rQp14XcZAfl5mW2Ywv8c/5NyBKGjmfI5QmfLnYLSh/5DnFNtyyKh4w/wxflml7R3BxiuBgc5UeWJNv0+6NNLtpIVg6FdjyuFo2i8hblUPfoKH14olEnov5dIEaCtjTAijFzL0BOQTjtHVIqWkPTmcgMgPYEicYhiYrSKTXnUltG6Gt+mlZvtbj8sLI25rRWZjPeEFrK5d01kTU5mJadBou5hP07woYiyZy9XelEN/+ii1Wyf/WoJJkoQa+N/v8bkaqpWz1wBIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoyAMQ9pjbvwm1+cktdP0OnvAVDP5DY5mGRxCCXqmk0=;
 b=Y4/6oK+V7UpbIW8Cj4z2MTrUc12kitN23Dq4zAtP3c03NlpHFTDFgmUm6u0duzLpIKpZ6hjaSIQB7jO+os46QKOYfrMluxkbBFFUQZJLLKet8/ZLJrGV7nuR2y0FCeqysCNW2Jq4qKH9OnP4JIrM/yg92G+9czPNm4e4tXhml0oPGiWckgGmwNmRrbQNB3ldWXkdoESmxlFX6H6b7pGfAErhQZcIXCNUxMwAxyuFtTf4+R4o0tAhst/IDnWDXhoYmQH6gJQry0g4wQ0S6J515auaFBIZJsAZ8pVNkaTaF1PoGyzOX9P4Lz/f6gS/d38jZ5ZVgCw16HT2aa59gnKmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoyAMQ9pjbvwm1+cktdP0OnvAVDP5DY5mGRxCCXqmk0=;
 b=duXTRupPLXnBxoQqKOLhpFmM690p4rczr3liIaZxT5wWYaiDAfBhT3/aYHF/nLo5PpiuAvaKorUHfza3YkgYZ8SckAj1FpSf21FMTRUfK9OJRDYN2aggN+RQWeOwnQ6XpqLnva+CtiJSzMFKJFFkRG63qBVD19qAFtIqypxxBig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Tue, 5 Nov
 2024 22:42:15 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 22:42:15 +0000
Message-ID: <63193324-b0ca-49e4-a3cf-bc50108ea504@amd.com>
Date: Tue, 5 Nov 2024 17:42:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/edid: add CTA Video Format Data Block support
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
References: <20240909171228.148383-1-hamza.mahfooz@amd.com>
 <CAO6MGtg-+btwUk9ZkJj7Zreyk_VfyDtsc_4k05rCv+vFJRSJVQ@mail.gmail.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CAO6MGtg-+btwUk9ZkJj7Zreyk_VfyDtsc_4k05rCv+vFJRSJVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0017.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::30) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efb188f-c13b-4886-5768-08dcfdeb18e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2EzdEhoZzZvQXJ5d25WUlg4Zmk1U0hCNkk3RGUwNmtnWkJsbjhGV3pTSnRl?=
 =?utf-8?B?MTJSQ2l5NHFUTW45WUo1bVVRUEZDWGtuZVlpMGRVV1d0alZuaFc0anNZRWxv?=
 =?utf-8?B?Qm40WDUvcDZqemFSbUJoMDJ0bG1Ram9wOVBXVitvN0F6cFc1N0phb3dnZkpm?=
 =?utf-8?B?aCt4RUV5WU92Sm1xbHBOSUF0UzJsM29yN3VWS0NCaTJJaXVlRkF0VkIvUU9n?=
 =?utf-8?B?MC9PRnVpbDRVTUlKVUg3R2Vxc2ZRVlZnSnhNenRqemljOTJnaU0xL1M2aXZl?=
 =?utf-8?B?Q2FTSHBURGVqUzBDdjRSb2F3UVpDM05TbUI4SWFVYXBBR2ZRVmpoQkJ4eXRY?=
 =?utf-8?B?OHMvYmNhV0xPQUNSejN2THRWa3A4L3lVZXROQnBUc0lTRXh0UWdPQVhycXhr?=
 =?utf-8?B?czFGQ2t5TnZ3b21PZFNtbmJxTVh6WTdPakZNNFNGUnVMOWZvRjV5RUxKb1FP?=
 =?utf-8?B?QkxyS2JpY2kvVERHaTdoZFFDaWhBckdOSTZkejhhR0FseWNhWG1aL1JSRmpt?=
 =?utf-8?B?VXlNa3lDanlFMEw5eUFzaTZCWEVDTDJNVWM4YjJwRVBlOURaZ2N2eHdNZ2Rw?=
 =?utf-8?B?M2hJMVFjSnM1OTZZWlFVeTdPNlNVOTlOZmFIZVVqOFAzc3RLbnU0TzAxZVRT?=
 =?utf-8?B?WVFKWERmVW9tTFdiUUwycTZ1QmRocXhFQkY1TUUxbDlnTGVyVzg5OHdPTTJR?=
 =?utf-8?B?ZGF1Nmx0b3pNQ0FGaUUvRWo0Rks0Y3VERGljT0dHbzNqNmIwZEhZTXdvZzZI?=
 =?utf-8?B?TThZRWpEb1luVVlDbE1EN2FUczZMci9DL2hjS2QxU3dIOTlSeEluSGlHUFVa?=
 =?utf-8?B?RElXeWw1c1NrOGpsZEFpZURkdHNGVE44NHFRbUpOUDRXNjk4eXEyOE93dWZ3?=
 =?utf-8?B?YWRIM0wrSWRCZzZodUNoSmhEdTJQemRvdTM4ZkRkTHhiUy9YalhkRmVhT2tR?=
 =?utf-8?B?RDNHTllCZXlXTmo3ajdaa1g3akhXQjlIZStkb01UTDVVa05pdzNoRnVRTDI4?=
 =?utf-8?B?a3lwYXdSa1pSMXkzbzRyWWIzS0UrUUtBazl4YktUcmxhU3lyRXBQVlJZcFBM?=
 =?utf-8?B?ck1NYVJDcml0UjlkM1FrTVc4NG1Vd3JqbUdhY0YxUlNXbnhKWHlMc1Y1RGJj?=
 =?utf-8?B?dWJhdDhBK0NucXJYWXp2VFdFYlBSWWxkYWl6dXNYano5bXlDZ2hteG9nalBs?=
 =?utf-8?B?NzZkM0pwYWdXdFUzZWNvODNwY3QzamcrVUlXajUzK0lWbVNZa1BJMnF5VENM?=
 =?utf-8?B?czBzQWVnSW9pOWVHM0RMc1MvYm9NVlJ6OFA1N0ZmRHpIaW5tU3FlUGxTVjIz?=
 =?utf-8?B?VnhXUTNsY0ZXWUMvWVNuWVZPQ2ZmbnROWmFVTm5XMW5hSE5seXRUMzEvRHFo?=
 =?utf-8?B?QlZ6bXR4VnVCOGorcFlXbjRpMUZud2JuQkxZQnVuRy9vUU8rMWRKdkoyU2lO?=
 =?utf-8?B?RS9sdnFhT1NYQ1U4KytGeUNMVTBHTm5lYWxSS2pOdHVkR2JhelAwcS82T0Fv?=
 =?utf-8?B?cEQ5SFRETmlMRHd4aUZoWVI3SFkvM0Q1V0prOERLdXFnWTE5bWhNUGlQYnJj?=
 =?utf-8?B?cDNBRmFBZUszbU5RNTN3Rk5veGM0aUlUeWhGRWJ5ZGEvbUhiOHpJNG1MTGNP?=
 =?utf-8?B?TUoydS95SHNzSWhhUG11VGhDd05ESk1ncWJCODYvYWZua0NXVVJQU2xqd0pM?=
 =?utf-8?B?V0xlUTVIS3FKaWJwNVNaR09qUmlWbDZYTmRnRXdWcDhqVkxvY255bXZuamdZ?=
 =?utf-8?Q?ODXLCeboCT5xof6ojTLpxSD9pZh/geXddwiISdn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0d2WWxSUmMwYkNQMlc0K2FTSkk1L2doU3B4L2FZUEp0d1ZNVnc3YWlIV2h4?=
 =?utf-8?B?WEc4dEpZell4aU1tRkxKeHRpOWxCL3lUMVV3YjkzWTNzNjAyM2d1SjhCbWU4?=
 =?utf-8?B?Q2dyVU9RL0ZZcU5zdlVuZDEvSk5oaGxsTHg2dVRkVDlZWis1c2VRRXJCVjhN?=
 =?utf-8?B?OVl5QjVnaHBkN3hJa1F6MWxMRnY5TGtnOUl0YlZvVlhwbFlxUm5XT3JBbHl2?=
 =?utf-8?B?U3QzKzN1ZXRhb2ViYzU2ZWNQdHJySFpxOVlMOXZUQ0kyc3VPL2xkTlMvdXM5?=
 =?utf-8?B?UXNxRkJYT2RVclhaMVd5eUlrWXRsZElWL1l0NFNsRy9Fa0k1ZkxTdnNJUmxm?=
 =?utf-8?B?OEh6MVpwVEpGczFiQmxRejR1REhmTzFMZUtFV1liSUVmODlHb2Rzd09Pc2JM?=
 =?utf-8?B?NTlDRVpwYWdyM3MyenFMVUtNdENyTjJYL3hYaGdvOTlqUXdZZFg2SnArR2kv?=
 =?utf-8?B?M0RucXdmbnZhaUVLUWtqS2Q0UExweUpzUm5aa2NnUmdJMlBYUjd5cm5DaHZ5?=
 =?utf-8?B?cnBGRTZ1SmcvWkFCb3ZLVFRNeHZHVlM3bU9NeVdJVmU0WHZhT3ZwaDhQZTJZ?=
 =?utf-8?B?ZCs1L3ZYbU9oQjZsZDJFUXl4MFVzZkpQOTdVd0NKdkNZaEZjV2ZwQ0tVaGNk?=
 =?utf-8?B?Yy9hN3ZsSW5UdnFzVm9EL2RnR1VweTAzVzNNVktCWExTVXFKditLQ0REbG9m?=
 =?utf-8?B?Y1NVZ3l0S00wUHN6UnRtRDJRcFExQVZaVzUwMkJzdk5pVk44MVNrNlk5Ry9J?=
 =?utf-8?B?ZU4vdkViSHJpRFN6MEpDL1E4Nk9kd2djbW14UUpEckhPOVpHcWVKU0VWMWRE?=
 =?utf-8?B?alhLQ3QzN2Q2QUUyNGtva1hzRloxeFBYNy9KSWtxWmNIWHN3ZEoxTHBOSDBy?=
 =?utf-8?B?RGpFODd2MiswM1J2enZENHpGOUFCQzVkaXVweENleVRJaEU1Q21LOU1sM25S?=
 =?utf-8?B?WGxNaHBKWlp4SHpEVjdCdWptdHlSdUVIUW9pUFRKeGtCVjZVUlAyci9vU3NH?=
 =?utf-8?B?Qlo1YWZydU9VWld3dVdJYXlaMmpOaUgvelZNQ0RIQldtUlZKNTFvREdla21B?=
 =?utf-8?B?ZTkwclBuVlhzdVFoRCtZays1Mk9Qc05GS2lKN1FXN3YwaUUxZ3lJRzVjdmtF?=
 =?utf-8?B?ZlgycXpUVVhZT0JsV2xFaW0vdHVvQm0yMEpRNHo1d04vV1pmZ3dxSzFQNVhL?=
 =?utf-8?B?OTBkTElIcEExSDRCVXU0NTZlTy8vbDJhMTYvaHFGd05QbzJLY0FZUjNxWS9s?=
 =?utf-8?B?OEhTZHZUNFBMTnRGYWVmcGxjRldPUFRUR3p3TUNLaGpmMEZHTlpCeitjeTdQ?=
 =?utf-8?B?Vnk3M1VSaVlWK0tZdlh5U3NMaWV5UXU0a2Zndm1IR1Q2ME9ZQkNOekdlcW9k?=
 =?utf-8?B?NlpJRE9GQ0ZKTXJrVm0rRjdMVlJUUUxZdXJjTG95TjMwUUdWc2p6aml5ZXVI?=
 =?utf-8?B?WkR4R0luRGlCQUNycU4zaFNZY1o0TVRYcUVDRTBSTUxOMHMyUTJrWEh2OFdU?=
 =?utf-8?B?cllPZEphcHJUZ2k3WXhVQWhVK2VwOW9pVjlBMURHSkdTZkJtNFhMa2ZwK0xi?=
 =?utf-8?B?T0I3VEwvaW0xQ2dnLzdWcHVUSTJmZmdoMFgwREVTRTljaHdRQ0o3RWlaSk1J?=
 =?utf-8?B?Zm9sRUpBTVBaZFVTeGR0dlJiTmM4RGoxeVkySG85NGZPcDU0QzJEME1ydFNS?=
 =?utf-8?B?TnNYT0NydzFqYlN1NHNUMHkrV0lsYXNKSGU2d3NiRG1QNmtTbjNCNnE5cVJB?=
 =?utf-8?B?UkhNWFYxeWhuY3REVm9VaGFhbFFhUkxNelVRV09DRmhCVnViWDhabnpJYVNl?=
 =?utf-8?B?T2V6bm5jZkhCb3dpTFh4Z1NQbGxCSTRlWHVaSmNKOG90azhtVkhHNFNnRUhi?=
 =?utf-8?B?bWV1M0xTWEZpZ3I3NDBmakZpdFU4bTBId3NzOThGdS9Zd0FHcUoxcUFTV1Yy?=
 =?utf-8?B?ZEYvUFh3T1FVeWloL3BhMlRuL2RKZXd6SndmcVdFQ3ZBanV0dExmQkVoTXNC?=
 =?utf-8?B?NHIyL0VzOHA4dy9DenVUQWJObzNmbjV6bSt5TjdUczlqbnlBVUhZRnlUTlc5?=
 =?utf-8?B?RlVLRUF5Rkg4QWMxZ3ZxcitiSjE2ZFRzcm1pUC9rMmw3TWtPZldJVjN4QUNC?=
 =?utf-8?Q?VoAzCijT12t8RonV8SaP92jSj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efb188f-c13b-4886-5768-08dcfdeb18e3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 22:42:15.8349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeI/ufoMgTR7zn1WWvdWdpzfMv0N/W7e+x2OneXcZcbrmN7yI27p+OGjgA57YPh/g2L9Sri/tEQNTpB7dN9+7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782
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

On 11/1/24 10:13, Ian Forbes wrote:
> We'd like to use the OVT modes for vmwgfx. Can you export the main OVT
> function so it matches the CVT one? Something like this:
> 
> struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int rid,
> int vrefresh);

Sure.

> 
> On Mon, Sep 9, 2024 at 12:17 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>> +
>> +/* OVT Algorthim as specified in CTA-861-I */
>> +static struct drm_display_mode *
>> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
>> +                  u16 vrate)
> 
> Also all instances of CEA should probably be replaced with CTA, not
> necessarily in this series, but they changed their name ~10 years ago.
> 
> Ian,

-- 
Hamza
