Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B114B9F47F9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09410E87B;
	Tue, 17 Dec 2024 09:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EFldSi2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5910E5C6;
 Tue, 17 Dec 2024 09:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOmTVEY5mf5A4M5ajmuS3DbDDR1qxH/DuR04wFSB4+0eytMIoSm6wPxEUN5Dgsu0maSCiKGp6vRkuveSfVEzee81oCE2EyNRypAlPLJL08I4XNI4zqJnRUDC6hrx2KRtTS+KMrWgTfJLxXsdSYUuWYs1zG7AuAA6QPNSGcLLjvX+o/x+Ld3dflFCO2Dt+BH6NGEZdYD0cDAhosKOZlS2fP4Ue2G221uXNuiXM4K0VuI078zfP0ARasdMYDR2BRsfjAq7/NAJ8KLy417li11VEToGhfT/akPpi+lX2R38zawwt0VsOviElaf7dznLOEHYJC9kaTyBc9Dw0nz6kMOUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhqL3Ch/RXDGbm2kpTuw8150Pny8R/V59paRcvfgiT4=;
 b=WMehk8ITf1c14PzGwKhqgk0nylzho1prJW43EDwETUzxhk5wRoZ61F5/JEwfpfFFMt4p0UiMTamorWSIfBt46ErhbSMHSXEps3tcwPzdRcMGp3b02KieEjiQvnxJJNCtCeeBmprReiJf9zG5aRwKo8pwl8kmby1EGMGPCtDkU6gdpCQdWPTbGKYqz3u6CgZNVsPLtQoYIBmDMROqitN0uptg852raFf3J6TOhIc4jtHGAGEtI78CXobtrnngo16LTOEqZ95jrmxVt/qdy75jgPp5dAg8vnGgGM+YXcMx9BDqzZ2SXmjWYuPDTbMp4YF2Gb4XSkW5614pRPMj/wWNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhqL3Ch/RXDGbm2kpTuw8150Pny8R/V59paRcvfgiT4=;
 b=EFldSi2w2Q0IkeytqQmfaDKWmIwev/Y2PKcRHIoyIt/8OJH+AWEoulBhudTG0bfpv4tEQXzulptcpie0eVe1Q+DxbNODUT84yYY7zb0sF/H1w1nBR+f0NY74OvBXbkJwiVN2L7s2GUu9RJ7WgDaYgkZCTUj0OHAWPCr3F1JDrb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 09:49:07 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:49:07 +0000
Message-ID: <51bd4ee0-55f8-46d2-9b9a-d1852d056f6f@amd.com>
Date: Tue, 17 Dec 2024 10:48:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>
References: <20241216162104.58241-1-andrealmeid@igalia.com>
 <20241216162104.58241-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241216162104.58241-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: e43a5132-ad05-4550-b8a6-08dd1e800c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFpMRE40emMvYTdrTUZwbk5rZ2VZTXBpRWRlNzB1b2ZLdFpnSWZwNTZKSkxV?=
 =?utf-8?B?MFNncktRSkh1LzJ2cWcyZnQxei9ERmZ2NjFlQktwcmFLaHJ0d3NPUFVuV1lP?=
 =?utf-8?B?cy9heVpWdGhTcTAxRWNEL2U3dVJ3bHFEZHhPZDFsUVMreDZKellLazJLbUJy?=
 =?utf-8?B?WmUzaVZMclB2VlR0ajYydkRLejBIYmpnT1oyajRDLzFITXdHeWxQanFZOGw1?=
 =?utf-8?B?Ni9YZXR0ZTZDS01URk5oSDBnbWJ1L0kzZTBxT1Vyak5TM2RzNkt5blpZSytS?=
 =?utf-8?B?ZUlVa0RSWExSSVUwQmRYb3JSb3dKa2dZM3RXUW9OK21qaDI3L2RicFdDcklk?=
 =?utf-8?B?dU9SMStoYWl6aUV3Q05nVjF6dVRnUTBPVzMxSTRzekQyeHg4a05iV0lXcTYz?=
 =?utf-8?B?OEZwMVEzZkpYYWdPSHdrc2NPOWcwRXBTSWExaGI0bUo5cjlVWGVUOSthc0Mv?=
 =?utf-8?B?YXMvenpLME9NVXRhYVBmQ3JLRnU3bTFDSTA0VWRlbHpQeUhJOXlBWExQNk5R?=
 =?utf-8?B?OWNRQ2cwak5uZE1KOVZzNEpqd2p6b1Vna082bE4xM09HNCsrbWV6RDJDRmZo?=
 =?utf-8?B?Y1NJdDNsZHpudWhsRlRrNWZsQTY1LzRaQVJsWUZXenFmQ2NBbjF5Q1RXcFpC?=
 =?utf-8?B?QU4zdGNvQjF5QW5xWnYvWkhYWlpFK3htQ0lmaXpYOXRDVE4xU2phWHJYY2NI?=
 =?utf-8?B?dlZZQnZ6VnlvRDJxWTkycE5ydTF3Y0dvc29rT1BYR3R6K3hGbUMzdzQrOTJl?=
 =?utf-8?B?S0JCQWV1azJWU2pzRlBIalFOdWpndC9hajZNUnBjR0xQZHpMTTdqRERLUnZt?=
 =?utf-8?B?VklPVW01eE9TMUdGN3pNM3V1VlBucS9nc0crMkNpdzcyRC9MbzJMQUNpTnNo?=
 =?utf-8?B?WEtDMUFoWkJhMTFscWV0MXdkNFlVSXVTcHA3cEtQTnlOWExOK1hkTXl0Nkpa?=
 =?utf-8?B?akJOalgvdFhQZjRvZHloNWNGNFFlUVAzRnRXNVpySEJ0OUR6aHVVK0FVbVdC?=
 =?utf-8?B?ZkNzREtteVdVd041aWxOS1RveDhiM2Q1NmtsWnJuOFJDWjIwM0d3dk9wNlBB?=
 =?utf-8?B?Vjd5RG90SXFYZWZxQmtYd2FNNDJDWUFSc1dORFNvWW8xY2xmMjZDN04reWFr?=
 =?utf-8?B?cmJVNkRkdnlTVHJ0N1BLYVJWeFVSci90UWhBTDl2T3Q2OTFUSnNzTDlvTk1P?=
 =?utf-8?B?QW8yZ0JqSWorSkhIMGF5c1J3ODJRMURJVnJ0SHdMNDlzVDZNZzhEZ0FRcEU0?=
 =?utf-8?B?T3dDOVpISFpDSDVSaktkdFpUcGZwa2FIekVCTENxQS8rM3V4RS9qVkFJaDJw?=
 =?utf-8?B?WDhUMU1NOXZlZ092WXpuVWFsWkNlczZnT2N4cUQwdzVEdm5meDBuZktac2Vo?=
 =?utf-8?B?VHg4NEp4VmdJM3o1Zm9uUWZZcDI2MlM0MWNCa0dKUzM1K0FPeTllaEVHM0Uz?=
 =?utf-8?B?ZUQ4dGMrKzZaakpiOHZzYitlVGtyMXQ3bkdVeU5od0tCV2JOUloycHk4MWtu?=
 =?utf-8?B?MVp6b0lybGFibS8xOUVvVk9IUDV6V1o1eDZLYjdXNSt2aVRmdThvaUFab2Y5?=
 =?utf-8?B?TktvY2RvYmJIVWJPTlU3d2wvSDFIV1JRY1JKdnplYzZiZUFtKzdHMkU3UTVG?=
 =?utf-8?B?OEk0VlY4V0IwMXRZR1VYSjhUdFpSRWxJVHh0aGUzWldKUUErVnUyUE5VU0pE?=
 =?utf-8?B?dnlhY0tOMUNKa0Y5d0h1UVJOVjRtNStqdHRCNlNXb0JRQTBEZDVMdHpFTVE0?=
 =?utf-8?B?TW51SlJaTGZjUjlWVmg5ZU1HZFJ5Ull0QlBFbE5DaUNqOVRSL1pxVXNtSEph?=
 =?utf-8?B?MzFJZHN5RHRCRTF1NEJQUjhHaEl0T09lN1ZmaUtuUG1VZTRJRlRhK2NGN3lD?=
 =?utf-8?B?VTVZMHY5dDU4b09yYnVxOWZSRHNBejcrZ1lpRDZNQndsdDFPbkMwRUx2QWUv?=
 =?utf-8?Q?W05fwmt1Xnc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlBCZjBEcitXOHg2VEZJV0tWS0hVakFBa09MYm1tYStKRTBQODhPNHFkblY3?=
 =?utf-8?B?OEpWQ3grTDlENFFSRHlBM3JncVZIZGZGZFB2RHRSeE5jemNJRGZURHJ2dUdJ?=
 =?utf-8?B?SlppeTgwNVNqK2NaRFVnVmxQeVZXMVRiTmFNTndJL012UHhGZFBIQXRzNlNG?=
 =?utf-8?B?VS96WDBqNTEyMWNhZUNXR05PSmJla2g3RksyNXY5YnJwUEx4WkczNUVvcTY2?=
 =?utf-8?B?RU5WZExZbzFEWkpuUjhVYUlueHEvdXo4ejNkVkxnTDlmeTU4dWg5cVJuUVlm?=
 =?utf-8?B?OGN1K1k1VUl1RU1iTld5NEhLbWVLNzU1eEp4eityamFVYlgwblQwSW1obmRH?=
 =?utf-8?B?R3dlVzVIT3RPekhJZHBKOE45bzFsVzlyb1FNVmxqK25kNGhuWUV5VkpYZE1X?=
 =?utf-8?B?QnlVSC8vRUo2Q0tuU2g0VEJJUkU1K21McU95dUFuc29DRC9hWGdCWmNuTWJZ?=
 =?utf-8?B?dWpNYU1ud0xvT2l5NStkY2dZdkhkVUk3dEFuVG5kcFo2RXFRaS9UeEIzOU50?=
 =?utf-8?B?ejA5NE9Fa2R4WWVIdnJPUW9aRXB2SUJ4L0xUQ1ZRMEFJNzVwZ24vZnhOWXk5?=
 =?utf-8?B?UXVSR2pKbW05WWh3Z0xRT3RsM2xtaFFRYnRPSGxpZlJpd1dWQ0VuRENab0tM?=
 =?utf-8?B?a2wrWFlsVk1GQklpR1BDczRsTlA1ZHBNM202RUZjZmRqcU5McFROWDN1UlB1?=
 =?utf-8?B?R0pBQk1GdVJhb0ZrTVlyRWlGZWtVNHNCNS94SkJXRGdBUG55V3FBOWRFZkNS?=
 =?utf-8?B?U1lyNFAzaEMxK0t4RFlqdTgwZGtjZnNxUlRpa1ROQk1WUkt6elJIQkdsM0hs?=
 =?utf-8?B?OUZsaFN4REZiSWV1Y05iaFh3MVJpek0zNkhtSUhsRjU2Uk92OHBOcGtzelJj?=
 =?utf-8?B?ZFlwQlJEaWRNeXY4cVZUOGxJdDNwZXc5NmN3SzJqb29pSTczZ29yTzduelpY?=
 =?utf-8?B?ay9UTVNMTDBiM0VYR01NQnhMbG44QUllZm52OXc5MjErQTVCcWJVL0NqbFJ5?=
 =?utf-8?B?TjYvVGZYMGpXWGdwVzY5WmRPci92MHpxeXJUQmZWTmE3aUoyQ1JBU0h0R0xZ?=
 =?utf-8?B?UXhrZm1QVElZbTRQcXRiVGFaS25kRkF5TGh5dzVSNkt2SnNsRkpjc005N0VC?=
 =?utf-8?B?U3gwbktJeVoyQkZZWUsyVWpCakpHRGh1dUxPU1VWemsrVDRyc0FlUk9JWnZL?=
 =?utf-8?B?d0w5ZXlza1VtaWRCODc1UlFPaFBlRWpmZFNJaEQvM1lVcW1DeVNRM0tFV2FT?=
 =?utf-8?B?RFhNY1NSWCs2OGZKbzFKalQ0Z0xLQkNpdWQzd1ZwQVRhZ1JkcnkvQWQ2c01U?=
 =?utf-8?B?WEd4NnhEbFVRNUI1c1NEbWxZNUs0RFN2cm5NeE5RSG9WNTA2aC9PN3FYMGw1?=
 =?utf-8?B?MllNbDV1NGpWQjBMM2dpTGRpRWlIZEhrTk5Sa3lVODF3TDFrYmxyZzRTL0U1?=
 =?utf-8?B?bVlvL2QvRHNTeCtIV240OStxaUVhM0RkKzZiK3YydGhvc01DdStJZm4yOS84?=
 =?utf-8?B?R0k2WE8za2g0aWJnUWkrcGM3Q1Y0QWxTN0tRWWw5ZkNlNTU1VWNGalNLdGY5?=
 =?utf-8?B?elBSa0NIWG12M3F1M2Q5RXJhU0padWZ1cjhVKzc4UEhKYWRwOFR6OURlVE5M?=
 =?utf-8?B?QW9NQTF0NmM0STBNTmNCSWFaVVhwOUttYkIvNUErVTVhRXdLTmFyakcvd3hi?=
 =?utf-8?B?UGpEZU0vcFJsOFh4em5NKzhvVDlIQ3dPemdoWFNlTHFTOHJXNnNGNUREWkZP?=
 =?utf-8?B?THBleFZqWGRnTHZWcHp4KzJacjkwNTBveXhrVmtMZWQwcnA5VUtseFVvZDcz?=
 =?utf-8?B?eDBiNjNza0VCcEFvbXJuZEJWcmVsdFBXM2pUKzgybndQK05zZFBQNVZCa2Vh?=
 =?utf-8?B?dHR1T0pHQ3R4TElSMHJQcmZtN1JpanB6TGtZbTFZeUg4bGxTcWg0bWJ5TVIz?=
 =?utf-8?B?VlRvRGtsNHNWKzNtVmg2NndrNnBpUFZhemdldjltZFFyUHlGRVh1eHkxQTU1?=
 =?utf-8?B?Z1U2eWFYb2tjSDBabkUvRWMzTFo2N0NxSEx2bDFKaXdiMEtWWUY5S0Z3QSt4?=
 =?utf-8?B?azdkU2FMZzF6ekxpRklaZFZqenJ0emg4RjB1V1N4YU00RURLYWM1NjdsbUk2?=
 =?utf-8?Q?sRf/qlzwhkxDtSxmsmCgzZQb9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43a5132-ad05-4550-b8a6-08dd1e800c0d
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:49:06.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0Ah6umbmr/Rl3+tSQ5qnLI6M3WslanCp8udV9FkyH+YbfM/+cHz7fRFk7E0JXuV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
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

Am 16.12.24 um 17:21 schrieb André Almeida:
> Use DRM's device wedged event to notify userspace that a reset had
> happened. For now, only use `none` method meant for telemetry
> capture.
>
> In the future we might want to report a recovery method if the reset didn't
> succeed.
>
> Acked-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Yeah that makes more sense, Reviewed-by: Christian König 
<christian.koenig@amd.com>

> ---
> v3: fix if condition
> v2: Only report reset if reset succedded
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 96316111300a..c8012253ebed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6057,6 +6057,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>   
>   	atomic_set(&adev->reset_domain->reset_res, r);
> +
> +	if (!r)
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +
>   	return r;
>   }
>   

