Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF1CC3B12
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791D810E2EC;
	Tue, 16 Dec 2025 14:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wS/31a0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA38710E96F;
 Tue, 16 Dec 2025 14:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bskWTsMUhmwhetF7A3Fjp+wpS/OglP9DKxWu6u9yxpKfuvPjh2HKDYbXQIlb6tjfXHakeOTTu5m8ek4eAHQZ3uHURddLBgwPAhe7O3H7uWzZiHqxlsSzlBIPYV8+dEDZYja74BHJcufse+UKg75q41IlKmycJGnjFbZ8D6IFnnKwS4t9TxF4KDQcSBIUi/p0e5HJw8nwUH02BDFXMII4uJgkKCcxM2CfPHrZfXotSszQsDO4R0YhViv1k1A2eeHP7OyiVxREYjQafWGDFIXfLqvB+TFwa5yWNPiSJWcwnxEqzseWJ6vFjkkMnhWdyC37E5xKb3+ckQ+yXTCo+i3JmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaY0vblB7bEqq5kCZbmVgHRxDFX2+UEQMP6CNkErEgk=;
 b=Ym3eN+M1vrd89HmJ5oyawg1wWaEnI/40GwXgEviR5psA/d51fCeCPpXsygpj7IVupnQTHUDGXs0nS9AmMprIhDzC8eeNoHD3iBfnjO2dsUWeBg3eK17zIRSEvcHN46L/U+iBeM18kYx9bD4YCA4FmLDhtxS58dGxa9+/zIM/f7r8vr7lOizAZjNJyGy2X7GfQvWoidJUFDE141jSaZTQgBxIZcLiqJKHbNCYltbCTlp24XlEJXDeNOFAGdM4w76TKDx9sSyB1ByhCon8LPDFxHfPs1hYun1bd9QdOa5uVgrfslsUPWe/2Xbnps38GYH7/R82BTTu8uf5MQhouA6okg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaY0vblB7bEqq5kCZbmVgHRxDFX2+UEQMP6CNkErEgk=;
 b=wS/31a0lnihtHEgfesGK4MX4gJFeizclS3eHE7nJg5N2jNRZ2SAE2Zo/fCEiQ6LhhyQz77btEdk82HIWcJBgjy+Ktb7b/BYzAP7fev/tGWWTxqV7Lgk/nyF1UBGC5MotpCK8DA5SOYujbUPDbP12D++qVbug16M0+Wr3ujVVdBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 14:45:01 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:45:00 +0000
Message-ID: <6c83cbdf-e5a6-4443-a642-d1e7b6786945@amd.com>
Date: Tue, 16 Dec 2025 20:14:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: Mario Limonciello <superm1@kernel.org>,
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
 <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
 <1d54ce3b-fbdb-4d1a-bd07-576a6ed85ea5@amd.com>
 <ea30058d-f3e1-4a1f-bdcf-fafc92b221a0@kernel.org>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <ea30058d-f3e1-4a1f-bdcf-fafc92b221a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa6bbc2-f606-4a48-8aab-08de3cb1b0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RYT3FteEVlcTlqdDdKY1FIcEFhS0l2cXhOTXJkRk5QdWl5VU5OK1gycHhH?=
 =?utf-8?B?bEt2VkdKUlBIUDZETTYveFhOeUFQMmRsVXhXZU1FS2RvOVFMRkFEU1BWTjRy?=
 =?utf-8?B?RUJZT3lWY0NDaCt1dlZSTTlBTU92b0Q4dmpXV2xUSDM5bDV4S215V1RYbklR?=
 =?utf-8?B?MHZYeDlVSHdGYUVQajJZS3czK0t4alpMMzAxMUJlM0tRSTFzTENMbzhEU3lF?=
 =?utf-8?B?RzNWeEwwMHg3MGpVbHN5eXBWVHM2T3VHdjRXa1VOekdoNk1HRURxNmdqekZX?=
 =?utf-8?B?dmFGczJybTZYS0E2VEh5NnY2UkI0dlJnVzludjBDd2tnU096ZDNXYVN0ZDlV?=
 =?utf-8?B?bXIyQkxwbXlEUlBwVHdFVFZYcElXRVNkU2VCdG1HOTZKaGRLWEdpamc1WVhG?=
 =?utf-8?B?L2NtaU1HOWVhMDlhLzJ4WE1mV2gwRFJrdE1pc0VYYlgrRW9qL2JvUktJK0tk?=
 =?utf-8?B?Zm1jQ3BmZ2ROSjY3RXdsOHhVTEJwOXV1d0JjM084WlpMRGxWQUxEdEZZNWxa?=
 =?utf-8?B?UVRkTEJEQStlWHY5L2lwV25VeS9wL3AvSXJUQyttbC9LbllQMWVsM3VtbmRY?=
 =?utf-8?B?MFJPYjY0SURJbFhxZVRHYlNnNGlGK2ZVN2IwRWIwbjhhNVNhVWhKR1FzR3B3?=
 =?utf-8?B?Vi8xRHE5M0ZabHg0U3kybVkzdjhhRGhmQmRtVjRoODJ1WjFqUmZOVUtqeThj?=
 =?utf-8?B?WlBvTnlsMnpRSnpmc1dKN0pmT3NpZytvZTNhWGlIam9lbXl1VzAwR2JoS0M3?=
 =?utf-8?B?RzZMcnVuRk5ZQTlLOTA2Y2JObkFPMm13SFJNMWhTbEN1OHZkbjhrQVZieG9l?=
 =?utf-8?B?eU9UZVgrNW91TzBFeHpyU0E0dHNYQm9rMVlHS0ZvU2pDMkl5YVlIK24zL3Z2?=
 =?utf-8?B?dXZnU2cxQVRMcDhrQjJoQS9xWmpyRkFZZXVjRC82bGdlb2k0YWxFbzBHVnAx?=
 =?utf-8?B?T1NWT3ZCeHpZMWRHWlhOU0UyNnNTSmx1dCtHZ1pHVzFDSVBTTDJOZ05yUWgz?=
 =?utf-8?B?M0JVLzliRk0yL05jbUY2OFRNckR3cEZPeHdSelpRSUd0TGhweTdRZUlvNFpT?=
 =?utf-8?B?RzdueTJER1puVFNadXI4OExsd2lWbnU4R3RadTFaLzZhaEU3OXRnUjZBaFlo?=
 =?utf-8?B?WFRhUkw3TUdpRnBMdmY5NjhQWDhkbjVBaTR1aFJQRU9WN1FlN2JaVVNESnA1?=
 =?utf-8?B?M0tWVHdJWDlLVlRuSUcrWXVER1hERkF3OFhaSkZHNU8yTE5yV1NRMDcrTFky?=
 =?utf-8?B?ckRpakJKd1pDSzFLMG16Q1VsL295VndqNTlaN2loOFVUL2NGZ3IzT2FYd0lG?=
 =?utf-8?B?UGtRaEVFSHBYVjM3SFMxdWJ1QUVmbWZZcGtrNTZpUzVmWFNYZWVxN2NQRXdU?=
 =?utf-8?B?bVJRc0VDSkpMVzJkK25oS0NEN0RTN21KaHlkTHNnSUQ0M0dhaDkrNVFldEs3?=
 =?utf-8?B?Mm9FSGd4V0VYeTRvRnRxakI1REVrVzdpK0ZNY211RG8zNS9JL1BSRTNtUWZo?=
 =?utf-8?B?eEkxV01SbFBYdFhRRDRLU3ZLVkl2eGdneEFLeHRhMi9BTUVHeGMycWxKd1g4?=
 =?utf-8?B?cCs5OXoyZnVHbEZ2QVlncFhVOTN5UlJHRndvWm1DYjNsblJsa0tFZmhiZ011?=
 =?utf-8?B?V2FJQjY3aDdzdms4ay9LYWZ5TTB1aWF6RE96dkdEQlFKeEJPWTV2WnRueXBy?=
 =?utf-8?B?NmZtazI0VUdEdGZVanV6ME5BZjc1K01uL1BHdmF6NThSdWRLRGE5VmF2M2dE?=
 =?utf-8?B?dzFWUGJOTFdVY1VlaExyQy9IdWI2azFlYmZDOGZNKzJnZ1VYOGQzMDNMaFhP?=
 =?utf-8?B?eUQ5YWpyZjJRaWZFamJDVlZBSU9WcFRyNnN5N0c3Q0RUR2pZUVNWVUY4UFJ0?=
 =?utf-8?B?dVMveHNuN0p2eldzN0FkMUNPTmtoSjdzbndRUnVRRDAwaFZzQTIrTU0xNTYw?=
 =?utf-8?B?MlVKTmhNdGkraDV2cWE1VElMZ21NYlRPR0dTZnMvd0FQRUVVQ0hObjBCVDBH?=
 =?utf-8?Q?kjiXK2Fstb5QAEYyNLUilGAG8mdBs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVR5bXQ1cTUzdStySWcyZ2g1dk5COWkxcGYwS0pZTHppM3UxNkVRcldiTjQ2?=
 =?utf-8?B?V0h0UVlFZnA4ZmZka05xQkNoeGlIOWd6OW5yZHBtNWFrUHFnSjBld1ZFNllu?=
 =?utf-8?B?YzRabVhPa29sWXRHbXBLdWlFNzlPdFZrS2ZpMHZsL0M0MTdCRjZvNHFNUVly?=
 =?utf-8?B?Z3ZDYUtDWWhqamppVWhLaTRCSnFUZmRjWXZjT1plVUNhU29sNVhuVzRqSWF1?=
 =?utf-8?B?Z0t4SmRJeEg3c1p3TWZ3SGNOYzNud0wxM01RdDMwb0Rta1Zic1VPdC83TmZS?=
 =?utf-8?B?UVg0MGZZdEdwSWszU04zd3gvVldQdGYvTEJJamwvQUJXUjMySTBvNGJlUElK?=
 =?utf-8?B?NnpWM0labE5NbUttQXlVUUYrY09hYWhHeDZQTmlvN2VEdGpCZk1xSUlaZTVG?=
 =?utf-8?B?MkNNYnJqaVRITTNEb1FIRkE5dDVXb1k5T3BITkFGRStaWURtVFhTdzgzdWZ2?=
 =?utf-8?B?b1lNQjlFNVdoc3ZxZVlDUDdncThzcXdvbmIwSDMwSUpyaDhJQjVUL2NlNlpR?=
 =?utf-8?B?eEhEaDBNd2VmZHlaSGhYZlhNb2E3YjVibXJHMUtOMmpzaG1MV0gwanpMM1Ru?=
 =?utf-8?B?K1lrVTNodkE2M1lraTRCZGdOL3F2UlV6cG5VODd5bFVjZUkvRGhLOUhRS3Q0?=
 =?utf-8?B?S2hxNFE4b0dSMUhvVjZ3aU95QUxMVHNXWVJXU3A1Y3dIQmNwS21EZkpZbUdH?=
 =?utf-8?B?d3hHWFoxTXAxMUVHYXZVOVJvQzd3eDRpK3JYSVlGU3lmZjNEMndXS2FrT3hw?=
 =?utf-8?B?Q3pqelE2SCtndkFmY2FocUZ0TlFDeFNMRHFZN3ZzMEdOcjgvZHpmTzJWZmNQ?=
 =?utf-8?B?ZzhjZDZyOUcrNGxzc200SkJqUXlQVHEwdDdHTGMwZlBUUHpSWi9Ra0llUDZk?=
 =?utf-8?B?cldHQ3NxTTRvbUNIdW1TVzFLTzJ0aFo0ZFp0UWJVdHY2cGIwL28xenhGamJr?=
 =?utf-8?B?SVZZV0JPc0FBZmdHOWV5Z0VoZlpFY2N5MTdKTEpFNERzS1FmeW9PSTMrNmMx?=
 =?utf-8?B?cWh3UW1TT0Jjd3BER2ZJWlFmM3liUE5sZzZMZDl1TlpzY05iZXA3emNHYkRO?=
 =?utf-8?B?TG9qSVphVktzb3RSeUdKc1lrYkxnRXVNcHM5MytVNURRbG5rVWx2K096N0xz?=
 =?utf-8?B?ekMzSzBXR1VWUnhYR2d4NFdrVVg5djY3c0h2NFdXbk14bFduYk5UWE5pYjZZ?=
 =?utf-8?B?Y1dOekJNaGsrZXN5a2htYVBqK3JwSzQ3ZkxoNHd0MWVSREwrdXMrTmNuRFJZ?=
 =?utf-8?B?WXhpa3FoS0srUnZQbEpIV2theW4rdmNZUVdveXZsbXpwc0NVazBBTFM2T2Zy?=
 =?utf-8?B?cG1hS0RyUzdQeU5CZFp3Qk5wczBGaW5vcG9hcUxKMUNlcldKeldGbkwvelhz?=
 =?utf-8?B?MUs3citYYmM4U3Q4MmVCOEpacG0vU29CZ3JucHdUc0U4OFdDWlN6eFZDNEJv?=
 =?utf-8?B?dnBDVnM2eFcxaGxmMzM1VWxqZk9BYlJrQzlrWjEwOEgvTFJHWHRlaWRSWUw3?=
 =?utf-8?B?QzkrTWE0ank3bDk5OG1lb01PNWRxbnYzbXMzRHc4Z1Q1NTVnSUdURmhhY3NJ?=
 =?utf-8?B?RUh5UGpjdmk0dU9oWkNGTXRoTTBScEhMZzRjckZDdFFPbHpJbnNNUnV4MU50?=
 =?utf-8?B?cXg4R0liOGJpOWFCdHNhalh4blFXV2RWQTFtV0lFTjJhY2c5L3dRN1E4LzN1?=
 =?utf-8?B?NUlXMW0zVGN6TlpJOFZxTnFidk9tYXZDblJRZlpBUjBvOWl6UVQxbmZQOWFt?=
 =?utf-8?B?MU80aXZJL2J2eTFOTWVUbkNCUXY5UjEyb21uNStlVTdGRW4vT2hXUVpDZ2lI?=
 =?utf-8?B?Tm8xM2J0Z3NSQjVLWGtlSG5DSVBBYlg0VXRSSHFvSVl4SjRVekNEWEpQcHYx?=
 =?utf-8?B?U0ZocllWT2RNY1dZVHlEakhPczZPQTdLMDh1UjFrMHNxdUZHVHZSUDVCVjBJ?=
 =?utf-8?B?TlE3U1ZLOHFBOGtiN2FvdTRuRFBZTnZxM2JRM0xJVElJTkszTVpweHd2UlZU?=
 =?utf-8?B?S3RUd1pQYm9RaGR0UHYweit6NXFOQktrRFJodGF6VnVyeTl2K2tYb1hkR3hk?=
 =?utf-8?B?Z3huaDFCL1NtckxaTGkyNGc5Rk1lSlgwemJoRUdaalNDcE90b2FJbEMxUG56?=
 =?utf-8?Q?gls/9C+2lizq5KtAbDToiZ+4x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa6bbc2-f606-4a48-8aab-08de3cb1b0b5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:45:00.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHcTjsInk+Ss5jSWDe/fudm4MEhpU4B13KIy9oDAQ8e383W2vFSA/6BgLwxqG9J6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928
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



On 16-Dec-25 7:38 PM, Mario Limonciello wrote:
> On 12/16/25 3:43 AM, Lazar, Lijo wrote:
>>
>>
>> On 12-Dec-25 1:29 PM, Yo-Jung Leo Lin (AMD) wrote:
>>> Add a uma/ directory containing two sysfs files as interfaces to
>>> inspect or change UMA carveout size. These files are:
>>>
>>> - uma/carveout_options: a read-only file listing all the available
>>>    UMA allocation options and their index.
>>>
>>> - uma/carveout: a file that is both readable and writable. On read,
>>>    it shows the index of the current setting. Writing a valid index
>>>    into this file allows users to change the UMA carveout size to that
>>>    option on the next boot.
>>>
>>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143 ++++++++++++++++++ 
>>> + ++++++++++
>>>   1 file changed, 143 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/ 
>>> gpu/ drm/amd/amdgpu/amdgpu_device.c
>>> index 903c4706040d..e78e6982312c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -36,6 +36,7 @@
>>>   #include <linux/pci.h>
>>>   #include <linux/pci-p2pdma.h>
>>>   #include <linux/apple-gmux.h>
>>> +#include <linux/nospec.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_client_event.h>
>>> @@ -417,6 +418,146 @@ static const struct attribute_group 
>>> amdgpu_board_attrs_group = {
>>>       .is_visible = amdgpu_board_attrs_is_visible
>>>   };
>>> +static ssize_t carveout_options_show(struct device *dev,
>>> +                     struct device_attribute *attr,
>>> +                     char *buf)
>>> +{
>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>> +    uint32_t memory_carved;
>>> +    ssize_t size = 0;
>>> +
>>> +    if (!uma_info || !uma_info->num_entries)
>>> +        return -ENODEV;
>>> +
>>> +    for (int i = 0; i < uma_info->num_entries; i++) {
>>> +        memory_carved = uma_info->entries[i].memory_carved_mb;
>>> +        if (memory_carved >= SZ_1G/SZ_1M) {
>>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
>>> +                          i,
>>> +                          uma_info->entries[i].name,
>>> +                          memory_carved >> 10);
>>> +        } else {
>>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
>>> +                          i,
>>> +                          uma_info->entries[i].name,
>>> +                          memory_carved);
>>> +        }
>>> +    }
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RO(carveout_options);
>>> +
>>> +static ssize_t carveout_show(struct device *dev,
>>> +                 struct device_attribute *attr,
>>> +                 char *buf)
>>> +{
>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>> +
>>> +    return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
>>
>> It would be better to show the size along with the index.
> 
> This idea complicates userspace parsing because rather than a atoi() 
> parser you now need to do sscanf().
> 
> IE - I like it the way it is in the series at the moment.
> 

Userspace already has to go through this for carveout_options parsing. 
It does not make any difference :)

I was thinking of an easier way without cross reference. It would be 
better even if you put the actual carve out size instead of an index 
(assuming carve out size is deterministic).

Thanks,
Lijo


>>
>> Regardless, series is -
>>
>>      Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>>
>> Thanks,
>> Lijo
>>
>>> +}
>>> +
>>> +static ssize_t carveout_store(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  const char *buf, size_t count)
>>> +{
>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>> +    struct amdgpu_uma_carveout_option *opt;
>>> +    unsigned long val;
>>> +    uint8_t flags;
>>> +    int r;
>>> +
>>> +    r = kstrtoul(buf, 10, &val);
>>> +    if (r)
>>> +        return r;
>>> +
>>> +    if (val >= uma_info->num_entries)
>>> +        return -EINVAL;
>>> +
>>> +    val = array_index_nospec(val, uma_info->num_entries);
>>> +    opt = &uma_info->entries[val];
>>> +
>>> +    if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
>>> +        !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
>>> +        drm_err_once(ddev, "Option %lu not supported due to lack of 
>>> Custom/Auto flag", val);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    flags = opt->flags;
>>> +    flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
>>> +
>>> +    guard(mutex)(&uma_info->update_lock);
>>> +
>>> +    r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
>>> +    if (r)
>>> +        return r;
>>> +
>>> +    uma_info->uma_option_index = val;
>>> +
>>> +    return count;
>>> +}
>>> +static DEVICE_ATTR_RW(carveout);
>>> +
>>> +static struct attribute *amdgpu_uma_attrs[] = {
>>> +    &dev_attr_carveout.attr,
>>> +    &dev_attr_carveout_options.attr,
>>> +    NULL
>>> +};
>>> +
>>> +const struct attribute_group amdgpu_uma_attr_group = {
>>> +    .name = "uma",
>>> +    .attrs = amdgpu_uma_attrs
>>> +};
>>> +
>>> +static void amdgpu_uma_sysfs_init(struct amdgpu_device *adev)
>>> +{
>>> +    int rc;
>>> +
>>> +    if (!(adev->flags & AMD_IS_APU))
>>> +        return;
>>> +
>>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>>> +        return;
>>> +
>>> +    rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev- 
>>> >uma_info);
>>> +    if (rc) {
>>> +        drm_dbg(adev_to_drm(adev),
>>> +            "Failed to parse UMA carveout info from VBIOS: %d\n", rc);
>>> +        goto out_info;
>>> +    }
>>> +
>>> +    mutex_init(&adev->uma_info.update_lock);
>>> +
>>> +    rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
>>> +    if (rc) {
>>> +        drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs 
>>> interfaces %d\n", rc);
>>> +        goto out_attr;
>>> +    }
>>> +
>>> +    return;
>>> +
>>> +out_attr:
>>> +    mutex_destroy(&adev->uma_info.update_lock);
>>> +out_info:
>>> +    return;
>>> +}
>>> +
>>> +static void amdgpu_uma_sysfs_fini(struct amdgpu_device *adev)
>>> +{
>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>> +
>>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>>> +        return;
>>> +
>>> +    mutex_destroy(&uma_info->update_lock);
>>> +    uma_info->num_entries = 0;
>>> +}
>>> +
>>>   static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
>>>   /**
>>> @@ -4492,6 +4633,7 @@ static int 
>>> amdgpu_device_sys_interface_init(struct amdgpu_device *adev)
>>>       amdgpu_fru_sysfs_init(adev);
>>>       amdgpu_reg_state_sysfs_init(adev);
>>>       amdgpu_xcp_sysfs_init(adev);
>>> +    amdgpu_uma_sysfs_init(adev);
>>>       return r;
>>>   }
>>> @@ -4507,6 +4649,7 @@ static void 
>>> amdgpu_device_sys_interface_fini(struct amdgpu_device *adev)
>>>       amdgpu_reg_state_sysfs_fini(adev);
>>>       amdgpu_xcp_sysfs_fini(adev);
>>> +    amdgpu_uma_sysfs_fini(adev);
>>>   }
>>>   /**
>>>
>>
> 

