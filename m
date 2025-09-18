Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09447B826CF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808410E5D4;
	Thu, 18 Sep 2025 00:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FyBPF6wJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011070.outbound.protection.outlook.com
 [40.93.194.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838FA10E5D3;
 Thu, 18 Sep 2025 00:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZCzI485P9dzHFRQaiz1MjIvGnFFk+DTl1askby/agmLjQqN7fAXacycGlH3T3wrbSjIJNaUr8Q7OmxcyXAGIhu+/+N9yx6E/fdzizB0WFLDoXnnzWFyEiDBEI56wBGkdirxqShZx3XLGGN7R0olGRDXsjMV6+zF1WJ05vMpBUP7LwgdjI3IQNzmtU4OiM92ZHuJyXRXJKzU+IwSEUGGd1YoGrovN2JCErr0valCi9JDLVNTnAsr/tiBDsBYGqRJ4vI0AoxUbIusZe48c85P8cVGoeuMiZUrvq+8SowisJmcm0F8al0zBqqAVTG1/EvIfEPJfrFDo+INEENwUNmohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1SYraY+khG4lNAc+eOsGaU8jctTLIoaw/+mTHTr22w=;
 b=E03pRiU0RuY4L/8beQ9kDRSLhkHfP1ZUCKs33dmdGZZKanvsY21Mo/KyDxlVZxKS1ViHX8K5agHYPjdPLsot7WTKP/7isXGyjklcJboMoMnWC+Kx5cpeVPhtGK0T/OC7yRL72BhSoi2G4dEgv8j1KsCvNyz3QQ+81VZuF7PkgLw93eVRwCOMt6w+CFc4458zFBwMIrBeHUKDOeBxQf4mIe9YULlNBltnFNpzo6tI7r5dVbULp8gvqKhmcqG7L7OgBmQQJnV6My3NhtFyoX2IeiFg4zRLFCulPKLbvd1UOlFc30CkMsrm5BHpmSnKOJ5TFygg0W2zMvoOkFDDRB29JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1SYraY+khG4lNAc+eOsGaU8jctTLIoaw/+mTHTr22w=;
 b=FyBPF6wJAXn9BzOLlO18HIuIRIcXrP9HQoCzIoY39HXJBURab/bK4kbc98R7UgQ/CkAbHHU4vr1w2DKuJJYDVOJp1jZaimOFF/FjKKmmqqDekwzNXx4dBkyFtF0YxxNPVt1/+ePrrExZ7Zf/z7dCYtmAhAKpd9pLs28HiGlPJ7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 00:45:44 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 00:45:44 +0000
Message-ID: <73f01810-df2d-4e39-a20b-fc1cec2c5e12@amd.com>
Date: Wed, 17 Sep 2025 18:45:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 14/47] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>, harry.wentland@amd.com,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-15-alex.hung@amd.com>
 <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
 <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
 <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 54322d80-2442-4d42-4587-08ddf64cb2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JDMERjam1TMkMxcytXNVJnWDdsOTJSN0lWUnVqdnRjTitZWkUzdmVJRUho?=
 =?utf-8?B?VG5pYW82TE0zY0ZXSUhsM0RYUlBid1FrMnB2bUc1V1dJa3cvQTFYVENOQXRZ?=
 =?utf-8?B?SFNUa3l1OG4zU1E0SkZ0Z1E1YjU3NnZWSXZEU1lkaUxiNDZ0dE80SXJ2Rm91?=
 =?utf-8?B?YURyaTYwa216N3U3aDZMeWhLTmdYbWZpQTVVVGRaaWpnejg2VXJUYlhpS3pC?=
 =?utf-8?B?eUxKYTVoUlZkTG9QTVdMUVZaYllmZjdMVzY4OUJaU1lRQVRnLzlBM1JGbS9i?=
 =?utf-8?B?TXpyT0VabFQyajJqdHBLNUFjRXFQTGp3cUVlM0tjaHhsM3NlNmpvYm1SSEwy?=
 =?utf-8?B?MlZmc2haY21icjRiai9laGtaKzlGMWJJY3h1NVNWOWdCeUxzVklqMU94WHc2?=
 =?utf-8?B?UVc5TStPakxaaXlzM242czZZeG1jeFdiRDFtY29wQmxpcG5WdEcvaTlHa1F0?=
 =?utf-8?B?RVdIZG03ckUvR3dTbTNEQ09lbHVicVBwR3pOU1FDWFNNWFk0NXA3ODhrNzNa?=
 =?utf-8?B?aXp4V1hMWlYzZm9xZDNTaGdselJleWZCeDhpL1RsNTRhNGZybXM1UFVBY3Aw?=
 =?utf-8?B?RzJWb0VTcjdQN0xXRk53OWhHSG0zSUZ2TWJIdTFRbDhKaHhtQkFvNHRjVnpt?=
 =?utf-8?B?Z2pJTjBxaFYraWtCUU9VZWJEZ05YUkUrS1M4T3FKamVWYkprK2s4b0hZQ05o?=
 =?utf-8?B?YjVsUGRuNllISWxSK0gyL2V5T05TVFlCVzVhdHdZZ2pyRC9tWnp5OGoxa2lJ?=
 =?utf-8?B?SWwwWXZVaHZES3NsOVNiK3JtQ3dQeG5NQXVIOWhRMGRQYW1JdStURVUwVWUr?=
 =?utf-8?B?cStkRmcrYmdDbS96ZzFETDJhYUpkUXE0MlZmRUNZV2NZSExLQ2NDNGN4SlJF?=
 =?utf-8?B?TmhYbFdvSi9pSzN3dFQzeXljMUZrK1ZoWmhLZHAycjdtcEFlaEh3MUtZZTBI?=
 =?utf-8?B?TDVpSjJCaGZvTDFMbWRkY2UwNjNiNGlFbEt2b0VocEU2cE1CTkVvcDBIK2ZX?=
 =?utf-8?B?cUkwa2J0ZHJCbGVzSWVZcnV2SGlHTG1adlRHeENFWUQyZU1oM1lHTnJ2YWxJ?=
 =?utf-8?B?WDFvWFdlMWplc2VNNE9vdlY4am84TS84Q2FpZ2Uvcmg0L1JRMXNseTgvOS9B?=
 =?utf-8?B?aWlKRjNSYmVCOG1mdVU4WFVwVHMyRlBGdTV5TDErTkRHSlRwUHN2UXZHUUph?=
 =?utf-8?B?MFJIRmw3dElBaW1Hb2ZxbkNoWEtOcXZvWnoxRWlXWjd5d1R3TFpMeStYLzMv?=
 =?utf-8?B?c1hHQmJaQnZLeHpWbDBKOTVxVkJtTTAwTXFqVFNwRWNzbW13UXNKU0xFYUNq?=
 =?utf-8?B?R0ZoQ1FQWEs2UGNYMFVxYVByVGxmejY2MWxQaEdWNXZoNGJUUE1BK0VRMVJP?=
 =?utf-8?B?aXh3Qy80SWE2L0VEQmFwSFRNaHJ3V3VyQmdOa1kzNTlERTU2c0hIem8xTGpy?=
 =?utf-8?B?bXh5Uzg5R2w5MG9MRlpzaVJ1S1g4YXRIbW0xQUoyZm1kWnd2ZU9wSWhYVlZY?=
 =?utf-8?B?NmtjWEptbGpqOFlLQk10WDAxQUxxa2Y2V0dXVGhUYVgxM2lBY3o1elEwRXNO?=
 =?utf-8?B?NE5sTXU4UGdUcXhhWnExZDRYdnFJSXNJaFR4SWZBVW5LVnluUWo3L09FbTRW?=
 =?utf-8?B?ZjZmR0JRY3l4OW5VMUZsb0NHV0dUT2hVVWFjVnFvKytJNlNtM1pMMkhrdmwx?=
 =?utf-8?B?bnZkTzhzelR6TU5zMkJFZXVGNnBQV3NZL1UzY1pXeFpQQUl5bGhJOGtXTmVj?=
 =?utf-8?B?UGoralp2eWNwMHJFcmFXbEY0d080NjVKZU85Y3JZdkRhNTFGcitibmhoenQx?=
 =?utf-8?B?VUV5aDRHV3l6eFhZUnR3TDdvb1FDVHFGdEVpUithdVhYcGcweDJuLzYvUHdQ?=
 =?utf-8?B?Ulo3dEZQK2R5UU1GVnNtbXFFS1k5WnRwVm1iRnc1ZW9WM2daSGFkUUQrMDl0?=
 =?utf-8?Q?2mJ3j/hEvME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJ1MFUya3pwSWdqaTVVUURpdE1JakU1azEwRUYwZkN5N21SNUZUYjNyODMv?=
 =?utf-8?B?ay9laTVKU3VlZjRJaiswQTdrZEpJdkYzNG1xc3FXZXc4bXNyTUVtWkMrSkRQ?=
 =?utf-8?B?ai9vMmpVVGRTUnNUSFUxVUtybHNyQUFHamhnWEpCYU9vbkNzZVhhdWN4aDNL?=
 =?utf-8?B?eFNsOGpYVU5iQlZIRlZIMXBxWEh0QkJkRXdmcHM4Z05NOC9CSmE3VzhSbWVI?=
 =?utf-8?B?Uk9IUy9iNHJvc3d6Rm54dnJETXpQZVZvRDVmdVBwR1lMRDBKWWdUL0VxbUxI?=
 =?utf-8?B?dDI0b0FHVCtvWFJ1REpoVk52ZmJGeWpCd0pCSFdZL3BHUjBja0M3SWFxTk5O?=
 =?utf-8?B?bHlCWnUvdzhIS281TjhWM2g3WmQyUWhvMXJHbnRFWkpTaVRJdmphMWtVN0JR?=
 =?utf-8?B?Sk5zSTNteWVWQzVabk9EdUtOaW9JSjkyNzEzajBzWTlqdlhweDdOc2YySHpW?=
 =?utf-8?B?M3ZLL2FnQVNRRWRBb0Nkd1R0KzlHZ0srR2M4VERLUTBhQ0EvZDNJQlUxclh1?=
 =?utf-8?B?cUJBT09VanBjMUMzQVovRzViWHJVUjFYTHEyVzZWRnYyU3ZnUlhSYjQwNno1?=
 =?utf-8?B?RkZBUVVCMyt5R0hqa0IwalYxOE5OS3VXbmhRYlNDK3R1L1RhRkFRZTVlSWRm?=
 =?utf-8?B?Q2paYUFCQXJBYUJNK0FTbE9XRkxKbmlZZHp6QUt4Q2RGWW8yVzRITkFLcWhW?=
 =?utf-8?B?ZG5mNk4yekxWbTBUTnhVcEl3akFHUk1KZkZLRWhxVjU3QTBiRUxjcHBJYnh0?=
 =?utf-8?B?Ty9nSFoxY0l5Z2cwS053L1RJMlVoWXVQdHN1VFdxOE13ZDl4SjBGQ1pzUVlQ?=
 =?utf-8?B?cVVjR2s2WXN4eUN6dG92ZTRtSllQcFZUS1RabXlkL2djU01xYTBXMFdwbWdi?=
 =?utf-8?B?WU94a0FvWGRqUDY5b2dGMFJ1WE1IRUNKVVllQWtMV3F4YnlvdXQ1WDduNTVF?=
 =?utf-8?B?QncvUTUrZXhZNXhxMVFvRFYrNUVpOG1qaktUbGhyZ2dvbkZ6UnVmR3EvZGNM?=
 =?utf-8?B?Nm5ZL0VnQ2N6dzhCYXU1TFNMUnJCbUtsR2lxeWREY3kyT2djbW1YVmpyVHdh?=
 =?utf-8?B?Q0xKRFU2N3p0am45bWFIa3dQRkVLMU04YVdkVE5GemUySi8xOVc1UVFLWGFR?=
 =?utf-8?B?TWpyTUxnNVRldWlMSGMwY2t3NkhJakRyMXliQTdHZUZFU0IzZGdZTE54dkIv?=
 =?utf-8?B?eUwxQndyVTU0ZkNvd2ZZcVNNeitJNStjb2VYUGZSVnFBaVRibEdXTkF0eTQz?=
 =?utf-8?B?REh4NlE3QURLVEZqL1JRam9OM1l3U2NRc1Nyd015a3pyYTBEVWtzU3I3ZzBR?=
 =?utf-8?B?LzlHSCs3MTlvYlZ3K0tDRDVUTUlrU2RzWEZlNERGcGhncDRIZGUzeXg0SkU5?=
 =?utf-8?B?R2NWQTZUemVDeUh2dWpIMFdiSEl1eGRtRlRlVG5SNXd4QWpnT1JTdldUaFFj?=
 =?utf-8?B?aExyMGxkWFJ5QU80QzRySWNMT2NTbmdXRnVKUG5IRkZHVFV5UVFLZko0bVFC?=
 =?utf-8?B?WGgyVmFrWFR0M1ZjbWpvQnE2bytsV3ZhZDlXQUNncHlEcGtkY3pSQk14ZUhr?=
 =?utf-8?B?a3RnR243a2tkWEp2OEhkUEtUVmdhOWZ4OHkwdDEyWUZWTSszbjlZeDcxYXd2?=
 =?utf-8?B?Zko4TXBpRVlxU1NiK2NHODRuSU1RZEJHSFYxRFBxYzFYY1hmbWYvQW42dzcx?=
 =?utf-8?B?TUYydWgzZDRSSnh5SXEvQkZRdHFRZTNWcWplLzBsS2N6dVlOd3ErT3NaZzNN?=
 =?utf-8?B?Q1BzRzVNVUFOdGU4c2hSNEhTZXVLU1lxZnExc3UrS05STkxRclJaMzBTYW9r?=
 =?utf-8?B?R2p0eVdrQ0hzK2QwOGVMc0dFSHg4UFpIdnp1OHA2ZXptZ3dkZjkxQUlrbWJO?=
 =?utf-8?B?Z2xuTzBQUlk0N00yRHRROFF1ay96QUpFMlZLTXdzT0E1ajR5aVMwdFZUZ1Vh?=
 =?utf-8?B?V0ZIRXVWWldMaTR5QXFPaGV0dHVOSTlCNCs0Ui84STBTRlE4RUtydXpDVjd0?=
 =?utf-8?B?eitYUmxqbnMyREFCZTc1d25pOVZ5ZzVkTVRzRkNUVDhXTHl3VFh6S2VmNERr?=
 =?utf-8?B?TFdaTGg2QkxSNkRPbFZua0t1ZTBOQWVGbzBnT2dEUVNRNEgxM2JBUDcrSTRC?=
 =?utf-8?Q?bj87qtFP54muH14RZl5GBfSIK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54322d80-2442-4d42-4587-08ddf64cb2f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 00:45:43.8747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdy9EyjvHhPFbIzVu1oKgYtkJRYlGMLgj0I53WUAGI9f/YWH+Ls+PVCErfogNxl6sk6lI+MvgKvcWJDC95u+6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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



On 9/17/25 08:47, Nícolas F. R. A. Prado wrote:
> On Tue, 2025-09-16 at 19:54 -0600, Alex Hung wrote:
>>
>>
>> On 9/5/25 11:12, Louis Chauvet wrote:
>>>
>>>
>>> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>>>> From: Harry Wentland <harry.wentland@amd.com>
>>>>
>>>> This patch introduces a VKMS color pipeline that includes two
>>>> drm_colorops for named transfer functions. For now the only ones
>>>> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
>>>> We will expand this in the future but I don't want to do so
>>>> without accompanying IGT tests.
>>>>
>>>> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
>>>> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
>>>> generated with 256 entries each as IGT is currently testing
>>>> only 8 bpc surfaces. We will likely need higher precision
>>>> but I'm reluctant to make that change without clear indication
>>>> that we need it. We'll revisit and, if necessary, regenerate
>>>> the LUTs when we have IGT tests for higher precision buffers.
>>>>
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>> ---
>>>> v11:
>>>>    - Update drm_colorop_pipeline_destroy from plane to dev
>>>> (Nícolas Prado)
>>>>    - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test
>>>> robot)
>>>>
>>>> v9:
>>>>    - Replace cleanup code by drm_colorop_pipeline_destroy (Simon
>>>> Ser)
>>>>    - Update function names by _plane_ (Chaitanya Kumar Borah)
>>>>
>>>> v8:
>>>>    - Replace DRM_ERROR by drm_err (Louis Chauvet)
>>>>    - Replace DRM_WARN_ONCE by drm_WARN_ONCE (Louis Chauvet)
>>>>    - Fix conflicts with upstream VKMS (Louis Chauvet)
>>>>    - Add comments for drm_color_lut linear_array (Louis Chauvet)
>>>>
>>>> v7:
>>>>    - Fix checkpatch warnings (Louis Chauvet)
>>>>     - Change kzalloc(sizeof(struct drm_colorop) ...) to
>>>> kzalloc(sizeof(*ops[i]) ...)
>>>>     - Remove if (ops[i]) before kfree(ops[i])
>>>>     - Fix styles by adding and removing spaces (new lines, tabs
>>>> and so on)
>>>>
>>>> v6:
>>>>    - drop 'len' var (Louis Chauvet)
>>>>    - cleanup if colorop alloc or init fails (Louis Chauvet)
>>>>    - switch loop in pre_blend_transform (Louis Chauvet)
>>>>    - drop extraneous if (colorop) inside while (colorop) (Louis
>>>> Chauvet)
>>>>
>>>> v5:
>>>>    - Squash with "Pull apply_colorop out of
>>>> pre_blend_color_transform"
>>>>      (Sebastian)
>>>>    - Fix warnings
>>>>    - Fix include
>>>>    - Drop TODOs
>>>>
>>>> v4:
>>>>    - Drop _tf_ from color_pipeline init function
>>>>    - Pass supported TFs into colorop init
>>>>    - Create bypass pipeline in DRM helper (Pekka)
>>>>
>>>> v2:
>>>>    - Add commit description
>>>>    - Fix sRGB EOTF LUT definition
>>>>    - Add linear and sRGB inverse EOTF LUTs
>>>>
>>>>    drivers/gpu/drm/vkms/Makefile        |   4 +-
>>>>    drivers/gpu/drm/vkms/vkms_colorop.c  |  81 +++
>>>>    drivers/gpu/drm/vkms/vkms_composer.c |  51 +-
>>>>    drivers/gpu/drm/vkms/vkms_drv.h      |   3 +
>>>>    drivers/gpu/drm/vkms/vkms_luts.c     | 811
>>>> +++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>>>>    drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>>>>    7 files changed, 962 insertions(+), 2 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/Makefile
>>>> b/drivers/gpu/drm/vkms/
>>>> Makefile
>>>> index d657865e573f..0b8936674f69 100644
>>>> --- a/drivers/gpu/drm/vkms/Makefile
>>>> +++ b/drivers/gpu/drm/vkms/Makefile
>>>> @@ -8,7 +8,9 @@ vkms-y := \
>>>>        vkms_composer.o \
>>>>        vkms_writeback.o \
>>>>        vkms_connector.o \
>>>> -    vkms_config.o
>>>> +    vkms_config.o \
>>>> +    vkms_colorop.o \
>>>> +    vkms_luts.o
>>>>    obj-$(CONFIG_DRM_VKMS) += vkms.o
>>>>    obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
>>>> b/drivers/gpu/drm/
>>>> vkms/vkms_colorop.c
>>>> new file mode 100644
>>>> index 000000000000..f955ffb0ac84
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>>>> @@ -0,0 +1,81 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +
>>>> +#include <linux/slab.h>
>>>> +#include <drm/drm_colorop.h>
>>>> +#include <drm/drm_print.h>
>>>> +#include <drm/drm_property.h>
>>>> +#include <drm/drm_plane.h>
>>>> +
>>>> +#include "vkms_drv.h"
>>>> +
>>>> +static const u64 supported_tfs =
>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>>>> +
>>>> +#define MAX_COLOR_PIPELINE_OPS 2
>>>> +
>>>> +static int vkms_initialize_color_pipeline(struct drm_plane
>>>> *plane,
>>>> struct drm_prop_enum_list *list)
>>>> +{
>>>> +    struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>>>> +    struct drm_device *dev = plane->dev;
>>>> +    int ret;
>>>> +    int i = 0;
>>>> +
>>>> +    memset(ops, 0, sizeof(ops));
>>>> +
>>>> +    /* 1st op: 1d curve */
>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>> +    if (!ops[i]) {
>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>> +        ret = -ENOMEM;
>>>> +        goto cleanup;
>>>> +    }
>>>> +
>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>> supported_tfs);
>>>> +    if (ret)
>>>> +        goto cleanup;
>>>> +
>>>> +    list->type = ops[i]->base.id;
>>>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d",
>>>> ops[i]-
>>>>> base.id);
>>>> +
>>>> +    i++;
>>>> +
>>>> +    /* 2nd op: 1d curve */
>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>> +    if (!ops[i]) {
>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>> +        ret = -ENOMEM;
>>>> +        goto cleanup;
>>>> +    }
>>>> +
>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>> supported_tfs);
>>>> +    if (ret)
>>>> +        goto cleanup;
>>>> +
>>>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +cleanup:
>>>> +    drm_colorop_pipeline_destroy(dev);
>>>
>>> If it take a device, it means that it deletes everything, which is
>>> not
>>> what I would expect here: you are curently allocating a specific
>>> plane
>>> pipeline, and deleting all colorop for other planes because of one
>>> failure is counterintuitive.
>>> In this situation I would expect either:
>>> - error propagation to vkms_create or vkms_output_init (it is
>>> already
>>> the case) and "device-wide" cleanup in
>>> vkms_create/vkms_output_init;
>>> - "local" cleanup (i.e only this specific pipeline)

the colorop are now in dev->mode_config->colorop_list, so we can use 
"drm_colorop_cleanup" (assuming it is changed to be available here) for 
cleanup if removing entire colorop_list by 
drm_colorop_pipeline_destroy(dev) is not desireable in vkms. Does the 
following code make sense?

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c 
b/drivers/gpu/drm/vkms/vkms_colorop.c
index 0191ac44dec0..d263e3593ad5 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -19,7 +19,7 @@ static int vkms_initialize_color_pipeline(struct 
drm_plane *plane, struct drm_pr
  	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
  	struct drm_device *dev = plane->dev;
  	int ret;
-	int i = 0;
+	int i = 0, j = 0;

  	memset(ops, 0, sizeof(ops));

@@ -91,7 +91,10 @@ static int vkms_initialize_color_pipeline(struct 
drm_plane *plane, struct drm_pr
  	return 0;

  cleanup:
-	drm_colorop_pipeline_destroy(dev);
+	for (j = 0; j < i; j++) {
+		if (ops[j])
+			drm_colorop_cleanup(ops[j]);
+	}

  	return ret;
  }

>>
>> Hi Louis,
>>
>> Does it make sense to make drm_colorop_pipeline_destroy(drm_plane),
>> i.e.
>> in PATCH 13 as in previously V10?
>>
>> and then drm_colorop_pipeline_destroy should limit to the pipeline in
>> a
>> drm_plane and should do something like
>>
>>     drm_colorop_cleanup(colorop);
>>     free(colorop)
>>     drm_plane->colorop = NULL;
>>

This doesn't seem right after digging into it.

>> We can have same behaviours accross device drivers like amdgpu too.
>>
>> Hi Simon and Nicolas,
>>
>> Do you have comments on above proposal?
> 
> Hi,
> 
> indeed that would make more sense to me.
> 

