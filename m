Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ALdDemQeGmirAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:18:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82492A04
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E5010E529;
	Tue, 27 Jan 2026 10:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="03ntHC/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012014.outbound.protection.outlook.com
 [40.107.200.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC510E080;
 Tue, 27 Jan 2026 10:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTCcb0w0BiyPjwBAP/drw6BVYhh2Y9BRV73vq4/z43ulPf6ycsS84EE4roJ2dqTIFvitPulLmyFpASIvl5xrBpATVKilsjHOXYFmFlVrTb+COg9cLcQ5dzue8m1cc8RkMKzCwo8vOnU4c0UgXlJcHdXD6RtZVnBzKnlSfeCaEMvZnfU0uBHGIHkBH2+WAPDmRiNkj975nqdHIOrURD9wgrdLIMpByiyZ/ADJZPoXWmCeBcAOO35YpIR2HgQiGIPFojk8hmgZx+AxgS5KPDZkZNZ56vf8Hutg+89h/hcuUEivoQ2QSfjZwWlS1W9j0ah6M1GcLE4DIvrkW5xwLv48nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0caF7ya4vTe7qlYWWyDZcgVKKyeXA06gk7eXkAWazY=;
 b=cjR/gHBwslRY2Wls4HGzjlCZVrRUk00uLSIYQJqRHOSP4oqSLAZrzSBn0duqMxYF4RuW8YRAC1bikB4oN82kaRJBnKjQluUHHXSDqkz3e0DXI2C+U6ahClGdt60/POVi639ZhTtzIVr0lhULtJFtnHE7fFB8jjNreGcFwOQphkWET9vNqRp2LhBMoFcwxQbe6+OAguz0yujPCcX6xa/oC+uin6i4o9J/dII4TRmvzL98VTipG44dUQYYRw+UAh0eLvh8IM4Orw/5suT1Dpn+cg+laAX5hy1MD020kfGJY8W6jSxkXVpa6HvDH1qr1EwQGqnCSRVzvjoYR+eqRLMt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0caF7ya4vTe7qlYWWyDZcgVKKyeXA06gk7eXkAWazY=;
 b=03ntHC/Y6b9hrXvjOsty1wPFcSZYaTqVG9lJe7a4JWrQYegvzUrSe2PiylZOKQf1vP8VrrBkNwHMdVPO44PlbMxoLb5qu/fq2jio/s9zUppqTYMWn5Hhc8ses83ogSSkh1ZtOSxQAgxFMX2u+9lSewFxW4FwanuymNj9yuctc44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:18:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 10:18:11 +0000
Message-ID: <d6ed05ae-71ae-4872-8612-69f503717304@amd.com>
Date: Tue, 27 Jan 2026 11:18:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] amdgpu/gtt: remove
 AMDGPU_GTT_NUM_TRANSFER_WINDOWS
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
 <20260126133518.2486-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126133518.2486-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0934.namprd03.prod.outlook.com
 (2603:10b6:408:108::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca2bd89-5c2e-4ab9-98ef-08de5d8d600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDlwZ1dTOGR2VUFzYTJHbG9YRHlZS0hXY3M4ZllhaWlZbXJhT0xOMGQxZkMx?=
 =?utf-8?B?RFh6WWkyV0tBaDNFdGlBYVFET1d1bFpTTW96aFEwdGx3M0lRSUExTUM3bFEw?=
 =?utf-8?B?UHJnYktiaGp4enMxU2xBNnZRZXNGTGJSYXlSMkhFSmtYOGpBbnk4akpYNEpH?=
 =?utf-8?B?RFN0djRUQUNlMFRVWjljUXdhajREbFl1TFI2VysyZG5ndk5KbHVzM2cxMVNX?=
 =?utf-8?B?Mk51YzFOaGdRbkZmaTN6U0R4Unh3d1JNQW9xS0VhN3ZpMGo0cGVvVXFXQU5v?=
 =?utf-8?B?OFN5ZlpqZmRaLzh3bGFGaEZiNzRTTUJpaHNMeDB5VjVZMkgxalpzL25naTVw?=
 =?utf-8?B?VEZjbmdxNEl3QWd1SzkwWGs1YkZHZFpUaWkrNldHRjhTNkFCMHdDWHErU0RR?=
 =?utf-8?B?TC9aVC92ZlZQcXFHS0N2bEtOaGxHQUhlUXZ0NVpPaG9pdjZORFVvNDl5WjIr?=
 =?utf-8?B?SkRLVEhDNnd5SldheXR0NzNkU25RUVp5eEdma21zRWg5ZEpNRk5sOTV2d2Vs?=
 =?utf-8?B?aTY2cVJvejBsRFVhTDE1aEFnTnFtUkw2ZjgyZHAySjFreVkwK0JkNHdhUUYy?=
 =?utf-8?B?dDR6SXlqQTBlZjhUSmRNTkRvVUNMbnkyZWo1cDJMVE5PcDNqUWxJU3orVjBh?=
 =?utf-8?B?M1c4YW1MWC9hTTFpaWpjMDZWSTFyYlNWQ1huMXoxMnlrdkh1U2dsT0dhaU1w?=
 =?utf-8?B?QThkSjVaL0Q4UUdhZlpwd0tTVlNMbFhXcllWVldiaWJHZndJb295aEpUTnE1?=
 =?utf-8?B?U1V0Nk00aDMzVGt6a0hFdU5CbEFreVBKVXJwSldSYTRtR2VoZW1oUlRhVFBr?=
 =?utf-8?B?Mm5heG0wQ2Q3b3U4Wkl0T29FUUNKamwzMWtmaE1TcXhvZ3NBdTNCWmtCRXV4?=
 =?utf-8?B?M0RQWVhKYXhIYjc3VkdGeXRmTzFSL1JJOVBBY1k4bVFNQ1M0aWhpdHN6STZr?=
 =?utf-8?B?d0pNZXVPUk5ldFlnV3Z4YXNVV2JCbnZJS1pnemVMdjNGMmVlaGhzY1kwbHB6?=
 =?utf-8?B?amk2WjVacmV5NStqQW1uQlFKbXprQTV1Y3BGUTVjZkc4TGhZVE5FMEpxSkNk?=
 =?utf-8?B?V3RzbDMzVllsTExyd0I2eVZYeFpXajNSV0N6bjRVZkVVNHJ4bWRUUCt4Y3VJ?=
 =?utf-8?B?TnZOWTBWK3UvVk5ZYmxvcUM1emNTMHo5aENtQXI1S3pUKzFFWEt3QXRWelVC?=
 =?utf-8?B?UnVDM1JkWDEzR0RkbWFLWVlvelJBUk9TSDhiUFFITldBQWFYWVBaWHN6azNP?=
 =?utf-8?B?UVhXWVJ2NGpYWFd1S0dQSkF4Q1JtdmpwRG5VdEdPLzE2QTJOYm9LSUxhSHZ3?=
 =?utf-8?B?R3dUbGt1UFpxZ3lGQjRBcXYrbExLZ1I4UWJZa1pGbkZWSmM0TUFaZ1hFY0tm?=
 =?utf-8?B?QURhcHM2SWQxcmlQOVRHUnVlNVZ4Rm1HM0E1RkowekZLWmxKems5Qkp1aE44?=
 =?utf-8?B?dUZIcVBlbWcxSVErQnQ5WDhjVVUrUzhQM1JkdE5EQXFIYld1STRJVE44ZlNT?=
 =?utf-8?B?WDltYmVkTU8yc3F0eXgzaTJEcFJRR2w0bFNtcGIyM01LMXIrRGZFcGpibkpa?=
 =?utf-8?B?czNMRVJLbi9wSTRwT2FHaVJLZTBDaWVXTStOZklZMm1wODMrZUE1bFdxNVA1?=
 =?utf-8?B?TWI2dUovUEZ6Y3ArTDRMb2grSnJGMVVvdEJHNHVsMTZqUjNqVzVOZ2ZUdjd0?=
 =?utf-8?B?a25FbUNoeXZyUXlyVGlHOWl4TExQOEVXb2pZUndSajRRekpYT0M1elREQThn?=
 =?utf-8?B?bnU2MVRZeGRtdlJqOXZuVUZDRDdoSXRKM2piOEtvRGl1L2dSWVN0b2dFNDVM?=
 =?utf-8?B?ayt1ZE5BeTRWYklIa0cxd0lmb2NkUkZhZDJmVzhzakdYdXRQYkl4VW11dEJ5?=
 =?utf-8?B?TnNkdktpUHFtKytGUE9qZEZKaE9mRkRlYjVBY3NSNFRISE02cWRLelRBV21B?=
 =?utf-8?B?Nm1NT0FuYVdKMUFmT2Y5WmxvbXN3MkNoK1ozMmtzaXIrN2hoYWpjcUtVdWQ1?=
 =?utf-8?B?R0FrZmZlSWFkbkFGWXJ5RXpOcmM2c1YxbjdMMDNISVMwQk9IMzBsanlkZU1Z?=
 =?utf-8?B?RmlNS2ZMTnVveDMxWlQ3Qk1aS3dNd2VHUGlNenpBQTdIam1SSzhjc3g2VlpY?=
 =?utf-8?Q?Yruo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxjRnl2ekliTGF5WjJuSmoxOFRZV2t0c3ZsZEgraHA1T1MvR0dKUUZ1NkRz?=
 =?utf-8?B?ZkdTQlZFamFUdEt0bFRtT01JWGUxSkJzWWJId1h1WVZUaEdyWmN4dGo5dEtV?=
 =?utf-8?B?Zm1yaVJOam9TYmdWRE8rQmY2YUo3b1ZaQ1ZvZUNYVkFKeFpEU0l3SkVWcUE0?=
 =?utf-8?B?b3BUSTJERmlzV1FsR3NEeEk4V1k4dDV0cFhjb05oNmZENnRpTWRBT1ExY1Ar?=
 =?utf-8?B?dGlnbmRVUnFDM0lFa3pxcU92dTA0b3hibzk4RHU3TVd2a0k3MGZ3ZzJSVnoz?=
 =?utf-8?B?b0M4UXdpZVFFMUUwRUcreWlMSHJ5TnBubGw1QWhUSWlOSmJKRjQrNkxQR2pu?=
 =?utf-8?B?alBaUnlSK2RVby9Dd0QrRTJVYmlvRm1Yb1Bka010czRwSi9vZWp5T0x1dVl1?=
 =?utf-8?B?SEdyTXpaVGdlM2QrQStydHd1aUJLR0tOT1p4SmZyYkoxWVZPTWlCQlFja05P?=
 =?utf-8?B?d3lMSlR2Qll3MFdZNW9BT0w4ZWl0YnFSM1VyeldlRkFWTllwVFNZUmI0QkxG?=
 =?utf-8?B?Wm5MUVljSWpyRzE4VkVFZURiZXgvMTA1dTlHY0p0c0ZlOURma0h0ZGpCUllT?=
 =?utf-8?B?TTkwRi9qQ1MwYjF5UlY4OTMwbFpURms1SUJOZjNPNUNvQ1JXQ3RBanczNXcx?=
 =?utf-8?B?UXlzVmpScVIzaDhlR2YrNUJKdFNJWkpoRHByYk5LTDlsK3dQdlprT3pITk9W?=
 =?utf-8?B?c1doSW5mdDFURm82Rk4zSkI1MTNkeXA1cFd2S3drdk9kNGVNeERUQ3k1VEdU?=
 =?utf-8?B?UXc0SlpUT280bmlhL2cvUWx4ZE1BekZIUjgrU1FyKzFjUm1jNlRrZlFrYXdS?=
 =?utf-8?B?b056ZXVmU2t2Sm03V2VDb3p4NjNFMTFDZVhXVWJFYU1PUVA2TmdBVXF6UGFI?=
 =?utf-8?B?a1RFSThqSEpPM2IvWU9DV1hFekdkY0tQL25GdzI3cWRDTWFoNHN0WVNEbXJx?=
 =?utf-8?B?YWZEaGVyQ3VwN2JVYk5HSElWcHI2ZGZPRlo3dlRoOVF4K2VEaEtHSHhTSGxF?=
 =?utf-8?B?dlNLc3JTdUxrd25pRmxKUTcxYWNEemlnRTB6ZzJZbmIwdGs2aXNKWVR5NXB6?=
 =?utf-8?B?U1ppYnVjRDdjS3BsRzRDTEppclJBMmxzbTJRM1h6TEJxQ2VGMVZQd0doMWNE?=
 =?utf-8?B?VU95M0xOYzBYZWVZQ2hnWGloemVTd0lsUTBSK0w2RkJoWTlJUkhsbmFtRHZz?=
 =?utf-8?B?S3l4UlBXTUk1NTVTTHRsbDZrK0dwV3pPTVpidERHSW91OEpHdVNsYXRvQyt4?=
 =?utf-8?B?N0lERVkrTEZIRVI2MU9BcWpZajhLUWxIdWM4OGdwV2RiN0Z1eGc4V2tYRUk2?=
 =?utf-8?B?Y0gybFZTWXhjZW5aY2FLa2pwZm5qVUR3Wld6ejcvNi83dC8wWXowTlZmcW9h?=
 =?utf-8?B?OGtya2ZjcEZ3UkRKMHJZQlQwNmh3bWVIblNZeGE2TkNRTnRsYlZYZjh2Y2tm?=
 =?utf-8?B?QXdtRGlBdFZ4c0JPUG1HQzNKeGtWNmNUd05MWVQ0N21BWlZsdFpuMFRLQkhk?=
 =?utf-8?B?MS9YNFp1L1ROTDFidmJNMnE5Z2ZSVzJPMEY4UFBZNC9lYVlvNTk2MXlvTFR2?=
 =?utf-8?B?eFNVMERjNUNySW81bHh1TlZ5N3BQTkFVUlJFeE9ZbUdKVkZCa3ZWYXh6Ymk1?=
 =?utf-8?B?ajh4d21NS0VDVkZQUFdHY2R4Q2hraVpWY250NUxzc1B0V2tWL1YxdXBlMndK?=
 =?utf-8?B?TjFtRFZUVWUvLy9ucEEyOVpHa1NuM1hMdHUySHpNTzNwcjIrMHlwUGZhck1k?=
 =?utf-8?B?TGlrRlhINDZhYWYzdk1iN3lYR3JNakg5TW1TSExKT1RLcmx0RlFGSm9MM3lL?=
 =?utf-8?B?Tm15UFYydGZ5MTN4ci82ZFpGMEtadDZ6cFJjTW1ISFNkL1BUYzhSc2gxUmo5?=
 =?utf-8?B?c2VPZ2JWeEg0anlKdTZLeHNaVEhuakFDT0w5aWtXdjRoUkJLV21LM2JsY1Rw?=
 =?utf-8?B?aldXTG1wSWMrRDIwWGVnblFZNk00bHphb01pRzUxcmlZemwvL0Q2OUhla0Na?=
 =?utf-8?B?UTJXbTc0clFpa08rTjFyVDh5MVg4ZzVWWno2OEtrWFNtY1VRRTRKZUNvNWV0?=
 =?utf-8?B?OHhYbTU1Yk53SEowenFOdU5MUjV4L2kveEFkMm9JeVllL0tGMGhTUXN3c0NI?=
 =?utf-8?B?NTdTcy9iUnd5WGF1NTFoMnZISFc5K3VqRGVndVNqY3ZSWVkzaUhoTW1pdHla?=
 =?utf-8?B?VnEvOE90WWc5QlNhM2prVUJTQkRMU0R1TDNQYTNUOUNvb3JYOTVjUzFsOExv?=
 =?utf-8?B?Q1JFdjNJeURGN2lpdm03NkJXZm9iK2RyYWRvU1liRytuZndDYVptYk05WFFv?=
 =?utf-8?Q?RXeCVImpD6hK9X6/8S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca2bd89-5c2e-4ab9-98ef-08de5d8d600d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:18:11.8481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t74jynXsy4o/uyzb48daSrWFgkMI3sjkSYljHkXnsPF0Vq0+YjNVzXAiSY1xcib4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: DE82492A04
X-Rspamd-Action: no action

On 1/26/26 14:35, Pierre-Eric Pelloux-Prayer wrote:
> It's not needed anymore.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 5 +----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 1 -
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index f2e89fb4b666..9b0bcf6aca44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -324,16 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> -	uint64_t start, size;
>  
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> -	drm_mm_init(&mgr->mm, start, size);
> +	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
>  	spin_lock_init(&mgr->lock);
>  
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 5419344d60fb..c8284cb2d22c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -40,7 +40,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;

