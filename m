Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEaqN53neWl60wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:40:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33A9F99E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E59710E63B;
	Wed, 28 Jan 2026 10:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YVhcw5JV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012035.outbound.protection.outlook.com
 [40.107.200.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C459310E63A;
 Wed, 28 Jan 2026 10:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT43h0ekjMM6XTKhRuOHwwDMU+tfmOvlGp1pAebzPoj5+iHCm5wd0BR8g+YzLDTk4ZfdctIRSY0CFddYK1BdiN0wEUxEK5ZSR7s6Z2osTbr5X7CVpIRfxFioohGlkuRrf4LlFbnRkFLieUt6B8hsK+Aw8FueTRHdijs/824rfnx5PARQca5BK91fwkh9iqc5ScExx5EZXqQZ2XVgB9rGWDgp37GDaWhgNUa9WtbKe/xqQC4mW4Zg4W1JNLTPfyZJo94zEygCzX4H8eX9ytuKEyi+Wc/Ur4EFRfEs8sCjM3obu9M7T/Dwa7pSmx64N0IgMBXtI/pIN7ua8QLjRIakTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1REgWdGc6ml4uPzI96GxMJvv0aYsgIUjfhJmsaF+KY=;
 b=WRKAabPio13bro1SvMijpxQBNcGKKrnAWKde0uHdtlkRJUZ/kSld/vqRYSADlXuwYTEPp5fXo5CTElM49XRvxUJve9prpCA1YlubcaL/32Hf9cEalbQgpdXUIgJXEgu1GeE8LFmhZBhXAKOY5gbK4azTccQb73WAafSP09CdN/LS+EXK7Ylfe8eo0IIIFJO/+Euw9uSdsyQWUWRcrGrtLTavutlFtrhLz/oARWSsAQtmbDWH80hzl7GhWAsHrYHwA4AO2fcrWwTz1MtadFu3LKqpMiu757l2ISdCcKP3IleTOvaEs3BB1WizBN5ao8x9ahe/qFrMY4CN04uZI93AbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1REgWdGc6ml4uPzI96GxMJvv0aYsgIUjfhJmsaF+KY=;
 b=YVhcw5JVYUbG5TNeDwJxvcpB+3kho6AxxKUPAHeA48OeJ/a+8XqZ1F391iF3ZRZuraGSWGWpuRJeXgZ/XtOLB+9QAcGgqwNwoek3whPgudOhoXO2MCfs/L5YreByo1UWQmLaBQcywrRVw04Q/oYcaf1K7b1N3pc8JK5xS9wlpEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 28 Jan
 2026 10:40:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Wed, 28 Jan 2026
 10:40:15 +0000
Message-ID: <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
Date: Wed, 28 Jan 2026 11:39:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
 <CADnq5_Ob8yiivco+szanSiXuRwdAu4xHMe=8OQSk+Ufqykgobg@mail.gmail.com>
 <aXlBx528d11lMJvl@hal-station>
 <CADnq5_NXd7HYipJTW_riwQDjrZ7S-PW7oFJ=C94_FGAAesV3kA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NXd7HYipJTW_riwQDjrZ7S-PW7oFJ=C94_FGAAesV3kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:408:fb::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: ec387d27-5016-41c7-9238-08de5e599f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVErbWYwM2tFOXhremJWMEUxMTNKajJ6dlc0b1V2VUtORER1amEyRk9aVG9o?=
 =?utf-8?B?eTNHZ0wrY0hDNlFPR0lCRTdvYWdwc21HZGkzZGRRdjZ3a2hJS0x3VUk1clhv?=
 =?utf-8?B?dUphVzBsbXNBbytxQ1JQcmlWeUVZMk5IZjdDUlhheFdGNU1CbFQ4Y0JJQzdm?=
 =?utf-8?B?M3FBU0NPdHNDdGdiZXhjS2hWNUFHTFJwRUl2MWRxUEVBVTJBZjlrZDJnL1Rh?=
 =?utf-8?B?UFRKRWNneXM4VHVLaklBN3pKR2UyY0thU1djUVh0RXE0ZHdTSWdaSzhqS0J6?=
 =?utf-8?B?Y0xaclZRUEpxSnpoNGZTQ1JuYUZSME02bUdGcjdlMFRlVTdBMTNUNGdkWTFZ?=
 =?utf-8?B?MlkyQUpPWnc2VHA0V1U5MUc5MWFlekhnQ0N1cGx6U09Db0Z3WjlqM3JFL1pU?=
 =?utf-8?B?T3poakpoT1doWDhpTWtnYzh4QUw2L3BMdGFYMUtURXpYWFEwbGdvbG14U25Z?=
 =?utf-8?B?QUZUT2o3Y3hiZ3JaNWs2U1E1Nk5qQW83dDYrdTFucDRkN1o5djBrVUh5U0l3?=
 =?utf-8?B?cXlibkE2akFTUlNWMnhjU3Q1NDNleEptc1VGbjJOSVFuSUwzN1dLNERLNlhO?=
 =?utf-8?B?QjU2cVFVeFhXM29BOUJFN2U4ZTJZQ05ZT1F1T3hVNTlCVWNWQng3SzFCNkJo?=
 =?utf-8?B?bm1Bd0FRKzh2bk5JSGdjWHNkKzF0T1cxTEtodGlGcVpGWjkwVFdmRXExbCtV?=
 =?utf-8?B?b1BybmJOLzhwek53TnFBVFQ4WjhrRmVqZHN2SnFkbnZ1cFFKQkswMldhQndt?=
 =?utf-8?B?Mk1MK2dFU3VjeWhUTWY5TE1vTk9Pb3N6V3RrdmsvK3B5TW80MDNTYThiZVph?=
 =?utf-8?B?V2JoNkJacGZoMVBwTUdaNEQyalNlNWloU25jYmh3OXMzWFRSOHRBT0NERnRI?=
 =?utf-8?B?UzlzRndzUytKTFVadEw4L0x1cHEzdnYzRzBFMm1heUxvd2lQa3VsMGhyMHFF?=
 =?utf-8?B?RlFCNmVoaWhNU3dxbHZGbXR2SjJPZDA5OGpDWFZabEdwUmVNeitZS3RHK1pr?=
 =?utf-8?B?SVVHZk1CV1lzSG84MlBYTzBvTGU1S3RsZ2VUN1Q1R1MyRjBXQzNORnhqYTVm?=
 =?utf-8?B?UXROZDZyZVVDMU1ySHdmWDVxcjNDL1crZWdReFVTY2I5bm93YW9vRGVUblFu?=
 =?utf-8?B?MjVNdjRBRk1rL1lsKzVMa2x0QnhqS25JMk92VU5PVUJLblgweVRWZ3N6VC9x?=
 =?utf-8?B?QzM5Mm9qY1RqcWRPOEhSekoybWR6VnZqTk5TNjNMT1FIYWFpTXQ2T2FNV29Z?=
 =?utf-8?B?Z3hVcytXV2hRT1k4Q0RDaEU1bXd4ZGZlemJvb0NaNFJCV0JhT2JMdjhmTS91?=
 =?utf-8?B?RXpvVUFINFRqRkZaSjN5YXpMZk5KOXRmdDdlN25qSnZCV3lNT20zb0NCNmky?=
 =?utf-8?B?YmRjSjZvNVV4MFVXcGFhV0lhZDIyY1Uza3BPam84TXNZNlVTc3ZGNDY2WTlJ?=
 =?utf-8?B?OCtrVXFCM1dhN2VadTY2YlhwK012VHhFVE85UWZ1eWgzZnpQZ1IxOFNxR3lw?=
 =?utf-8?B?ekpzc0RMRXFaMHRHQXRRZ1hUQ2dYMEhtei96NFdJdU90L0hnYXhqK2R5TU5U?=
 =?utf-8?B?UVBwS1F6SDVWcVR3Z0t1Syt2Q2V4dWF4ZlNWajYxNGxqTUlGQnFpL1BtcHJ1?=
 =?utf-8?B?R3dPK3V6K3JWaG92OHRyekNoVFlPN1M1dGJFbzRZU2xjOS9vZjdIMW1RcWJm?=
 =?utf-8?B?d2lJOTN6ejJNRStoUDhuSzRkdEVSWjNNL1lvbjhrUkNNZktDL1VGSXFGWTd4?=
 =?utf-8?B?WHoxSHB6SlRHc1pnVDdteFZyRmNKeHlnWms5YU16Z082UEY2bENyUFdBL0Vt?=
 =?utf-8?B?aGEvNWdBb3haODdqZFJ4dHI2VTdzSHhONG9tbnVYM0JnVG5YKzRMRFFFbW9V?=
 =?utf-8?B?WmlkMmxxVkZaSGMzRDVySllidjdJNkpuOUNwZzdlYUhUYWpqRlNKL3JtOHFN?=
 =?utf-8?B?OTRNR1dSbUp3dXd0TFd2eFBXZDlhOHdDc0ZtVE5FazRlMmRKWG1GWUZNbFJq?=
 =?utf-8?B?c2lFS0g0K3BuK1hENlZiVHU0RkEvdkdheXJKa3o2Q3pDcDk2UkV6QXdmNkln?=
 =?utf-8?B?K2xtMW4zVVRSaEhQaFlkc0d4WHk0UjVnQzNCNzluQnRJOGFyK1ViMG96SGFQ?=
 =?utf-8?Q?Ncq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWlEc1hpVWxaMllaWHRxN042RU5CTk9tTWM1NHlaQkVRaVBQVDJJRGVoSUk2?=
 =?utf-8?B?dzdnTUsxd0tZZ0NaL2tFQ0FjMVhyUVdROFZrVDlQSW5TK096MWJ4cGR5cGVo?=
 =?utf-8?B?TXI1NVVTUE1uS0lCcUxOeHJGZ1N1UTZTSFFkSVJlUk4vUW14bVl1Nml1SzM5?=
 =?utf-8?B?cG9FaHBJY0QxeXNiUDVZUHI3VlNuTitKVDJQS3dWWVRESnhIYUtvbmF5aktt?=
 =?utf-8?B?SEt3RVRkUTFoNTRPNUw4bGE0cWpEWTkyc1N5VTVpRkhHMTZBbzdTeEtVTklj?=
 =?utf-8?B?czJxMFE0aWpSZkJrN1d3ZFFFaFhkTU1salZGV29EbDhiRENDeWVvNkhxb3A4?=
 =?utf-8?B?MDFyd2JnOU9Sc2pGQzJLcEQxeWNSSi9DV3lkQTdiVkJ4cWVpR0k2YmVITHda?=
 =?utf-8?B?SnFUcU9DWUY3czd1azhSRHVRSi9JYmtkaXl6ZHBvOWwvMUVmdUYvMkQxSUZk?=
 =?utf-8?B?aHFHb0VDUGFJTitHamp0UEhHbzg0RSswR1FyWlZFQ1A0dDl1b1JwWWVlbDI2?=
 =?utf-8?B?MEYrVW5na0ZReG1aWkx1LzQ5ZEFCRDlmMU01NURWTW51NS95dmRVK3Jxck9O?=
 =?utf-8?B?MjRYazJKU2dxOUUvUEZuMkErd2QydCtNN1BCcGpHTDNTMWUrT3JibFhLWjlD?=
 =?utf-8?B?NVV3RFVvZHNDVHJQTjVaNjRSTWNidVZOemUyaGlPR2Q3R1lvSE9mSTg3bXpv?=
 =?utf-8?B?OWx4WERocElobDY5ZnkyelJkT0oxTFlqazRlNm40UlpVc3NmU3h4V2pPdjE5?=
 =?utf-8?B?Y0Y2UVZYeXJ5WU0zZHVpUm53WnREWndNdGx5NytUYjYvME16Q2ZLN3ZFck9H?=
 =?utf-8?B?RW1QZU1Hd1lDNTNMVlZiRFhHdlY3UHJUR21zMTdobGZlRW10VjZtbG02QlVQ?=
 =?utf-8?B?OUpDSmE3dEFnWmY4eXNlbXpjck80T2pxSHJoNFBxenJYK29sT1dRcHlxUDRl?=
 =?utf-8?B?SnZ3Myt6UHlOR2Zyd0VCaXVxV3IrL2ZYc3cwZ0w2SnhoQmVuT3RCNkJqWWxk?=
 =?utf-8?B?dWMzaFRyazJybUV2Kzdka0c1dGV5Z0NzaTN5VXNESitjdmsxVzhMY1RDaUox?=
 =?utf-8?B?NEZ0NDZhTmYyNnhHVURPR2xHc2FlcFlSd3g4L3RLSXNoQnZVcFNVUFBUQWxl?=
 =?utf-8?B?Y2NVZnVMUzlaWTF6UTBndG1iSyt5TUhqZ1JpbVh3U0Q5TWhRYUlyYmRmdCtx?=
 =?utf-8?B?UmNCZ1VORXVaNjRGVGJTUXNEWDJvaHdyM2hnZzVLOWFrU2l0NUE4Nno1ZjRy?=
 =?utf-8?B?eG1nVnBObXJNN296S1FRUDN2Y095RktRYnpKc3VhNGV3ODAwdHpzc2Zyd3I3?=
 =?utf-8?B?ZFNlbTYvUWlRMGN3ZWtldUEyMysrYk1UNlYzY09aNlBrWlhuNmFoWTBWOGFI?=
 =?utf-8?B?REVGUEdPN1JWZnA1eERKSEZiSkRGWXZmMGdiTnJhSVhrL3dVOGFqc21OY21S?=
 =?utf-8?B?aytvQ3RyNzVJWXcxQm1nejlOWElFeU9vSEZBUEVYeVlzYitIYUUwTVZGT1d1?=
 =?utf-8?B?TXBSQXVrNWJGK2t3azk1VE16S0M2U3E0akNzWWxhdlVqeWEzRjhSNUE1YUo1?=
 =?utf-8?B?Yk1JcDRLV0FmTDFUUVZSNXF5V0d6UXMzS1JIOWwxZ3BBVmV4QXRrZ0JUQzhu?=
 =?utf-8?B?VFBBek9FR2FORzVNdURla0p6L1c2MllaYXR6ZlJqd3J1TVFPK3dvNXFKK3M5?=
 =?utf-8?B?K0tVdUd2ck1tY0o1bmN6MEZWUm5FdkYrdUdaMURHNS8zMGdvTWR2MmJvaHFS?=
 =?utf-8?B?NURPUkFKbENucGZlVXJHRjBzTng4eXhaNE53aWNraHJZNUhrMUZ3Q0dJSGE5?=
 =?utf-8?B?akV5Nm5vQzg1MlQvM1UvZ25JZTZhOWxVTG1ZSVJCNFZjd3Ztb01NYi9yZDBW?=
 =?utf-8?B?VHZlbEwxMFBNTTA1ZTVBZ0orNnV3djhHRk9SSEtpSGh0S2lWVytmMXl4YUpm?=
 =?utf-8?B?SXZ4bWRKMzRuUWo2TDNrSGFpZ1d0RU9lWG5pZXhOODN6YUF2ODJLQldYMHRO?=
 =?utf-8?B?VU1tSmlQM0hCbEpBZ2NJRUFIYjRZQ09jQVlKTmxNTTc3ZUVyU096bWs4UGR5?=
 =?utf-8?B?cnUxQ1VYMnA0SXBkT2pDZEl2UEZRSmpyN0dpQ2dvUXhiMmhTWnc1TE04Q1l0?=
 =?utf-8?B?OTlxRDN3dUswWTBOTzVINWZCeDh4bGxTYTlFdzl4MjlGQ0RCczVZU3ZoUDNQ?=
 =?utf-8?B?dDNtYS9pUU5XMHN3eVpOVXEvNXYxTW1QWmgyVEwyQ1k4S1VXeTJRK3g4UFN0?=
 =?utf-8?B?cXFBcmRsU2lyQWhmSjVtLzRUY3lhazk5OSt2aFgxbDR6Zk1hL3RlZzNEaDFP?=
 =?utf-8?Q?0AcKUPhRQy1UBCCGfQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec387d27-5016-41c7-9238-08de5e599f82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:40:15.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzRWeJ3n8DhWq+HJeVMebCDw4WrgZGDkVebHPxuxmTQEpNzCrkQ/DU9h+WSa3HAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1A33A9F99E
X-Rspamd-Action: no action

On 1/27/26 23:57, Alex Deucher wrote:
> On Tue, Jan 27, 2026 at 5:53 PM Hamza Mahfooz
> <someguy@effective-light.com> wrote:
>>
>> On Mon, Jan 26, 2026 at 09:20:55AM -0500, Alex Deucher wrote:
>>> I suspect just calling drm_crtc_send_vblank_event() here on the
>>> relevant crtcs would be enough.
>>>
>>
>> Seems like an interesting idea, though I would imagine we would still
>> want to attempt a reset (of some kind) assuming that the subsequent page
>> flip also experiences a timeout.
> 
> Is it actually a timeout or just missed interrupts?  I'm wondering if
> some power feature races with the modeset and causes the interrupt to
> get missed from time to time.

That is my strong suspicion as well.

Even if we missed a vblank interrupt that thing is reoccurring, so the worst thing that can happen is that we delayed reporting back success by one frame.

So something must have turned the CRTC fully off.

BTW: suspending the DAL or event resetting the GPU in such a callback are just hacks, don't be surprised if you run into things like NULL pointer dereferences etc....

Christian.

> 
> Alex

