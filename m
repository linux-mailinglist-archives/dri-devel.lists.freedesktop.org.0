Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76FAB9413E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489AC10E538;
	Tue, 23 Sep 2025 03:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ma9ZBRH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CE10E092;
 Tue, 23 Sep 2025 03:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c79WUqkC8b5ozX9YBDeVbQ8eUqpy7DrLtCLrNi9d3Nadw6EUEWRQa14t/AnTXnqQ1+5wWTitXZAd8rQ3tdglEKLrjSsJGm8E6TpG1Dr7HsbQa8snO5YAvOPzvrNWW/54XF/nmtH27f0B56ZuZqXkPQFqenX+6dvY2p5eraZLfqFL7ckSohdhoJJ7WDqro0lculhPtp0ZwIb8IrAllQduC4MVzbSeIRTC8s/KZa5A7YES0HXPTg1YWXISRvAnlvqioGPElhcYo5+MvAjlhcUSwx6aTLqZYFxVFtsNly4cvrxbup+ml80G6KSSrU/Lam8iB6yTYN3cjrApRA2ZJ8lmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mvm75nW8F7YysBXbtSREXD53/BvLwBjoj5VU7PE9E7M=;
 b=QiLrlHIb42JawBejWngK0J78hzEodRyDh4pKQbN5VDKWk+oXe2O3mPNAmWaE4hHUt+hcHn4vBt98Ex6/ik/KI/+TZNCuzMorpiJuvcWy/563LH3cRk5aq+kiMvoa5PIYAi02ONOz9VfJoQiAbEvJbmtZlxGXlVrHHhX4J0vWFiajw5Sn07HYrVsQfJNORgWPbRGKakrpdja9sP+Qbrx4KEdRsjU3JVN1ebVu8Cof/1mMvnBeuyuuQrwjoK5ekeOHESAsPpvHu9bD8ecF9h+OYbjzoi6A+2DP5gs/AqEbol4ihD3rHDHjGVHgm/uuQ26nzqK873jH5odBmYKGiGxnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mvm75nW8F7YysBXbtSREXD53/BvLwBjoj5VU7PE9E7M=;
 b=ma9ZBRH4HF3T7G5FzqHd9F3SrentIJ8gMGv5ZBpIoZXhHv0QhWg805kj7z4eyWPVBhM1wuN+uBe7ti9VntSIFleCo8pX1GFA72CKeZBhiCXEuFFsLCxbpc5mUN4kPw56dw2cBqooLrIxlmLrAf31GNkUCsOV6cWRpFfGJQsl5UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 03:16:49 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:16:49 +0000
Message-ID: <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
Date: Mon, 22 Sep 2025 21:16:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250918114036.454735e9@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH0PR12MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f7038d-6aad-4e70-fac0-08ddfa4fa228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0x0S0dwejlBTEtxUEtqcnFQd2VRaU82Si8rVGRwNndKVE9iZTFvZlZ1UTJY?=
 =?utf-8?B?UzJIUUZNeVM3L3NkVnUxVG02OVh6bUNvQ3RhYWFzVXdEWUdCT2RvTUZjZ295?=
 =?utf-8?B?b08rRzNVZHp0Ky9zdEg2ZGVTU0dyNlk5bmRVRXlIMEVGcUNzVzRnL1ByMDJW?=
 =?utf-8?B?ZzZFM3JHWklXQ0JNZjBXRUFlQWZvenRRaFpXOW9mZ0VRNk9FT0JneGtYSmpi?=
 =?utf-8?B?UGtrQU0yaUgzMHZWMFlreEN4anVsS3M1UVR2bVZXRlduSElHM3RPajlFZzJC?=
 =?utf-8?B?djA0NHFDUDFsV2ZEMzR1V2w2SnhpdEVBRXFCemtQNGRnQUtNdVArbW9aUWg2?=
 =?utf-8?B?T2pSRzZXVk4yQ2RDQTZHRkVCMmdDaG81S2gwS2ZyS0UvOUVOV245SEx1TUd0?=
 =?utf-8?B?aytZNTR0QVJyNnM2LzRHRFJOd1hrU1c0cnJBUUNFWkRMNWRXSFQxb1FSSXEv?=
 =?utf-8?B?RlZxNWluY0t1Rmc1Y2xKMnRnRDNoWld4L1l4ZzZnVGdjQWF5YmJqUU41bnI1?=
 =?utf-8?B?RnhMOTV4L2FpWG5FU3ExNnVGRXoyTTk5YThqYzJ6ZnRNUVA2VG10UTI2Q2FL?=
 =?utf-8?B?VWF4VDBtbjVOVFIzZmM3MXZYM1RHR1ZRZU5HOGppTDRzcXlJMmc2Tkt0ZzZ1?=
 =?utf-8?B?SmZ6bzBLRkZSQTFLWFMvemhKVi9aMnZXV2JjbWpoaVUyN3ZNNDFtYTFET0hr?=
 =?utf-8?B?QmtZbElTYTMvaHlRNUhweUxaTlVURmp3THZzdWR4Tlg1SkFYa3plUW44YTFi?=
 =?utf-8?B?M1A0RGF0NkRKbGp0MTNtVWhueHVpRjl2dURyRGdaa3JqT1cxbzB4YllHeGh3?=
 =?utf-8?B?VXNZU0dmaUUvNG1aZmd3dWN2Vmw1NnlBQUFQTEdzZkc4RktPV0NuK0tJaCs4?=
 =?utf-8?B?b01jNkFXY0pZN05HR3pQQXZjejk3RG1vdVc3Z3hmZHRxYkFLTGMrNHZGZUNS?=
 =?utf-8?B?ZEszZ3VFZzhHb250NlNkU045Q2M4OHJEakRuWjBtUnVxUVpHc3U1SllBb1pn?=
 =?utf-8?B?UlhjOGdyRzY2UWp5WnFkNFNad1Q5RHhzMmE2ZU41YnFDMnFVWUY4NkVSODQx?=
 =?utf-8?B?YXA0c3pBVlcvSVdQUGxlOTdmcjJORytMOGU1WFJJdmRsSzZRaDZRaWllbWdr?=
 =?utf-8?B?UnZKRHhTQjdEQjludHB0c0lZTlZzWExjN2F0eEpjaS9zTEFsekV0QjVTQWo2?=
 =?utf-8?B?emc1QklXRUtvbERlbGhDKzIxNzZuRElwUWxWMkZFUDBsa21MdGlKSTF2WXAv?=
 =?utf-8?B?dDUxRFp5M204VXNoWU9JU2o2WHhZZi9najJVc3ZlSk5tSC9taS9zMzJ4OVZz?=
 =?utf-8?B?eHlDSDlQRmpxYmttczE4Vng0V1N4aE0zN2tjbmh4UHZ3ZkhRdnRmVnhiWTJN?=
 =?utf-8?B?TklaQjVrSGVYaDRtbVBMUkdiTGZPRitkOW02QnBhS1UzTHZLZUZ6Wk9aMWVY?=
 =?utf-8?B?SFJpa3lyeTRwQmZHVy9PekZOb215aTNRRnk1ZFFZZjVRVEwwWEIyRlNBMzRs?=
 =?utf-8?B?YVBsblMyZEpPeW9OZzdoMWg2cFlMV2FuVDAyLzhhODlnU2RDaWEwQ21jTzdI?=
 =?utf-8?B?NkIzZEVFNzZGTFBLd0JORmJuZkNDTWM0U3F5T2VhK0VVZFZwSXVRTlJxQzZG?=
 =?utf-8?B?cHFKQTV0SDQzWVUwaGRoK2ZVdlFPN3o3OVoyVS85SmtKVE9rUGlsejdqWFVJ?=
 =?utf-8?B?cFhJd0I1Z0RTYUZXdVNGbkZldnRTOTdlVGQvTzRHdUtvZC90UzNBaFpTS2FS?=
 =?utf-8?B?eVZPa3NDbk9tTGdRQ21VY09WUkI5VEg5bE1KMWV4QnMyZEFYbzhEcExpdVIx?=
 =?utf-8?Q?3O4Mf/mvdrMA81God+KgRC1vljv/29NZhy5S8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFE0WnV4UFZEcXEwdlNNMU1TZ3FoTmZwMUNUb29JWG04WU1EL0Q1ZGpVczNp?=
 =?utf-8?B?WExJelFnV2hFaEpiMEhjYmVZRVhHK3V6SVhzd3VMajdVQ0s2cE5VQTQ5Rkor?=
 =?utf-8?B?TStuZ2pEUXZVNW9NbElrc3JKLy9vNUdab2xra3dKN29XK0ZGb1Y0Y1ZKUERt?=
 =?utf-8?B?dTNzTldrNEl6RkFMbHZxY3pYd0ZMVmtqS3pIOUpnOEhwU0Y0T1VmQmsrb1px?=
 =?utf-8?B?QnJxRGI1WWxuVFNHZ1JIUWdHeFM5RlFPLy9DS0J3QVhCSzMzSDFzRFl1Mys3?=
 =?utf-8?B?ZHA0azQ4SHBoOTBXZEpsampaZGE3Q2c3VTM0ZW1aQkxtZTdJaS9LbENZYTVr?=
 =?utf-8?B?ZGhXV1o0ZEdqUE1majNCS21yTnhjYjdCQkE2TjdnMmpQNHExSis4MWZURXhh?=
 =?utf-8?B?ZHd5dmJtVFBZZlNhYmtXZDJ0SHlrRVZheWlOWDVhUXFNRUlFOWpOUEF6U3Ra?=
 =?utf-8?B?TXRBN3dnb01MUHZva1g0WUVMSXRoZXNCYTBIbGVGV2FUVzR2T1drVUtjdW5G?=
 =?utf-8?B?VkFUYUkwTEFFTTdzcCtRMUw3SEN4a09EdVNyT1JzN2FwRGZJM2Qwd2hUdGMy?=
 =?utf-8?B?SkJwUkJJdEZzMEo5Ly93MHpockppSld6b2ZjRWY0RThvY1JXZzlOcy9nejFH?=
 =?utf-8?B?c1A5QXpqeURWeTRacTFYWFpUMmpvNkUrN3hHNkxZVEh2eC9TbUw2SzJ2enN3?=
 =?utf-8?B?UnZBd2k1TU9Fc0JTdVA5WGhPRE01RHdJellWUkJobm0zcGJ6Q0phU2VxZ29v?=
 =?utf-8?B?VkJPOEtnVzluSXN5WFZtdnY5dDY4ZGdzN3BxMmFCc2QrVWwyZGdEMkgvQURy?=
 =?utf-8?B?RFB0c0JNb0U3NmY0MmlWcnJIN0JEK21QbUFlTHB4T2lMcEN2ZE5Pc0RqNVdq?=
 =?utf-8?B?dDFFbEJaVVZVa3crSHQyeUswelcyb0pBZ3lENU9PNHVlajFVcDBpekVrM3A2?=
 =?utf-8?B?dXpkYnZWYTlKK2hZdHVSVnFVTk1jbGJiV2VxYWQ4Z2FaNDBSN3M5cDE2RVU0?=
 =?utf-8?B?Ylo2T2RCMXpoZTF3am14elVlNGd1WWtSeTNua2U3R3M4WUt2YjVLYnBYaFZt?=
 =?utf-8?B?RnNnakFZZS9oSUIwUUM3VUFNYm1pREg2RGlDc2FGOFEzM29hS1dKVG5RTGdn?=
 =?utf-8?B?UGRKZHBybUFaRkk2SDBNVWxvUWJTOUl1aTFraFNyRUtBQmlpTVRkMkdDRFdV?=
 =?utf-8?B?eG9KbElyUEdQOGROUmltbUViVDFzWDl2MWF5bGZHSWNwT1l2enhpWTArVitU?=
 =?utf-8?B?ejJsZHplWTU3cTlVVHNnNklaSEJkUGl4d1lXcWtZb1h4dkNURVJoOEFFV2Rh?=
 =?utf-8?B?NEhSZFRiU2lWTGRwQTlSOUtyN3pRdk1rdUk2Yk4rYUVTRllMRmxSenQrSzEw?=
 =?utf-8?B?REtlb0xLdWtWUzhFTmVSWFVjNXgwSzNjc2RML2hxbS9UNmhBYVVNM0FqOGQx?=
 =?utf-8?B?ckhIMGZUWDg0UmkzOHMrVmZqYWxVMlRDc08yR0Eycys3Z1VXQ0NqRkNpMXlx?=
 =?utf-8?B?WjB5TWpHZ3ltcm4reUNNVGk0MHhMOG1vY2tQWmVCeGFHSUppenlIWGVGdE4x?=
 =?utf-8?B?V2xSRlB1QVVhdHhvMUtiT083aXMzVG90dkdPNmlLQVRGOXpBblVsbGFnT0VB?=
 =?utf-8?B?dG9hdVVXMjdRMFVWR2c4bXlacGZTc0ZNL3dBUW1PamRoNFV5eUVnU0p5QlBL?=
 =?utf-8?B?eGg2dWpaVlB5WjlwTTFVa3BsNWE0aEJvNTh0d0cvYjJvRmFLWFpOcURJcjE3?=
 =?utf-8?B?bkd3TzBEbHF2Nm5lbE1VSnhhTmkwbnNIUlI0cS9LSHRmR1pwOTlwTHV2eGNR?=
 =?utf-8?B?d3YyWG8wdHRpN3FTOElpQnprZ1ZyMUVPa3ZHM1RON3lveFFTNEdScUhTNDFR?=
 =?utf-8?B?Rm5MNXJFa3pVTVQzWkxrSzgvbXEvMm9peFV2eFBIMTJQaWZEdFVFNHBsVXRr?=
 =?utf-8?B?bDloSUNLM0Q4TkhwOWdFR04vQ0U2NS9TOTVNZzFCYjAzcGprTTBDTzVYbFhY?=
 =?utf-8?B?V3c3VXNLaXFlUjc1Q3RjZllKNStwMFc4RFk0NFhJYStLRlM1aUpxeHN3RzYv?=
 =?utf-8?B?a2dnWGpOK3RwMEJicXE2bGlMR2x6U0dLd3ZTeFp0MnZRV21xZEkxR240RVlE?=
 =?utf-8?Q?B7dtnHuV4Z+Ia51Y8NP0nuZua?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f7038d-6aad-4e70-fac0-08ddfa4fa228
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:16:48.9045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUHg0/5li2O/lC8rtnSWa+D48d75P0zBn/pV4w2RFePUN/64Mj0vq6YvvM1+Ho3QgPGkRGZ8Y+qxJ5qOeDSBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7982
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



On 9/18/25 02:40, Pekka Paalanen wrote:
> On Tue, 16 Sep 2025 17:01:07 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> On 8/26/25 03:03, Pekka Paalanen wrote:
>>> On Thu, 21 Aug 2025 11:54:32 -0600
>>> Alex Hung <alex.hung@amd.com> wrote:
>>>    
>>>> On 8/21/25 06:23, Xaver Hugl wrote:
>>>>>> We user space folks have been convinced at this point that the sRGB EOTF
>>>>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
>>>>>> hardware is actually the piece-wise, then that's what should be exposed,
>>>>>> but I'm a bit unsure if we should do that under the name sRGB EOTF.
>>>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
>>>>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
>>>>> of confusion, it's better to be explicit about it where possible.
>>>>
>>>> I will leave this to Harry to comment. He is taking a few days off so I
>>>> will check with him later.
>>>>   
>>>
>>> "sRGB inverse OETF"?
>>>
>>> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
>>>
>>>
>>> Thanks,
>>> pq
>>
>> If an extension in future after this proposal is merged, can it be GAMMA
>> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] = "GAMMA 2.2" so it won't
>> conflict with current name?
>>
>> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as
>> the following? or do we still want to add "piece-wise"?
> 
> Hi Alex,
> 
> since my previous comment, things have muddied further again. FWIW, we
> intend to remove the use of the name "srgb" transfer function
> completely from the Wayland protocol as confusing:
> 
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/442
> 
> I would recommend the KMS UAPI to similarly avoid the term. I would
> recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
> such. These names would hopefully not trigger intuition and make people
> look at the definition harder. Or any other name you can come up with.
> 
> I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
> may provoke people debating what does IEC 61966-2-1 actually define.
> We've had these kind of discussions for Wayland already, and it was
> suggested that it is better to define the actual mathematical function
> in our specification that to leave it for interpretation from standards.
> 
> For KMS, this should be even easier than for Wayland, because the
> hardware implements a specific mathematical function regardless of
> where it might have originated or what it is being used for.
> 

Do you mean the following changes? Userspace use Gamma 2.2, and display 
driver can decide to use either sRGB piece-wise EOTF or Gamma 2.2 itself.

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e1b2b446faf2..3a6c64285d9c 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -71,7 +71,7 @@ static const struct drm_prop_enum_list 
drm_colorop_type_enum_list[] = {
  };

  static const char * const colorop_curve_1d_type_names[] = {
-       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Gamma 2.2",
         [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
         [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
         [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 3e70f66940e0..e39379f1a61c 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -48,7 +48,8 @@ enum drm_colorop_curve_1d_type {
          * sRGB piece-wise electro-optical transfer function. Transfer
          * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
          * to H.273 TransferCharacteristics code point 13 with
-        * MatrixCoefficients set to 0.
+        * MatrixCoefficients set to 0. This can also be approximated as
+        * Gamma 2.2.
          */
         DRM_COLOROP_1D_CURVE_SRGB_EOTF,


It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise 
EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may 
not be used at all, right?

--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -77,6 +77,7 @@ static const char * const 
colorop_curve_1d_type_names[] = {
         [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
         [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
         [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
         [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
+       [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
  };

Does anyone have comments or concerns if we use the first option?

Alex H.

> 
> Thanks,
> pq
> 
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index 1551b86471ce..90a216c0b6ac 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>> drm_colorop_type_enum_list[] = {
>>    };
>>
>>    static const char * const colorop_curve_1d_type_names[] = {
>> -	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB Inverse OETF",
>>    	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>    	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>    	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index e4250b7d8de8..ce85c52c60c8 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
>>    	/**
>>    	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>    	 *
>> -	 * enum string "sRGB EOTF"
>> +	 * enum string "sRGB Inverse OETF"
>>    	 *
>>    	 * sRGB piece-wise electro-optical transfer function. Transfer
>>    	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>
> 

