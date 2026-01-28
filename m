Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOIzLbMeemlS2QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:35:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687DDA2D87
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848BC10E708;
	Wed, 28 Jan 2026 14:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rgPFzm82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010010.outbound.protection.outlook.com
 [52.101.193.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2F10E706;
 Wed, 28 Jan 2026 14:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE1yDs8vTxF7PUMWsgNntiIuzLmRCcXhcck/C/pfbmep+5pfbbFXxV3nkMZ6ROZ8uq3k3cceMCOue/+VrovmFMczXRztX4naK9F4edQejgxnc7/Oo+RKvD6HmDxAJSyQ88/KBej+xho96nKy73wlCwzUnZ0qjpohoNWtlcVuRZ4T8vATUyfvE1DnOgqcmTtLZwX8CL1iRYi2bXZPHkHRZS7ccGbhtn2tLBVzeFgTFc/6Agezyn06n7digBOqq1ZLQ7qChVOURNqH/tR9nnRbFClKJhN5GlNviballDM4GrX1nbHd/TRyUf5RzrcryQ9WXriocjiSwQNsfEG/7E310A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx8ltz59B+zz0BK8zJAKVLHk3MDO1ro/tZaOadFOWA8=;
 b=PpDGu+ipQqQqDe40q8DRh0x271kjAN0ltpRxYVtOuT9JIlNLrjpB5vxVA7u90d95J12PJSH50OzGnvmgLhS6zsdXRMKoNb3fBIqixo4YFtW6wxAForSp3qegIfpTO+FPyQxjImJzfzrEzxRzKndaP3SzLIYNxt2k8gzP+arLDiuS+oxeBgttea6BHYsobSriI3yP6+kGIGCtt8a3Xgq8aYhGen5WS1jS6J/J1Wj/KB7QDPu0LBD+X12SIQm0GNy35ckxvZ+atyaKT0uhFWT8IEFr478FfgDrnAOzwv2ajTy9iSkD4iGiKB+XIoKAaGLIBKJDuq140JOv4pmL7YQrOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx8ltz59B+zz0BK8zJAKVLHk3MDO1ro/tZaOadFOWA8=;
 b=rgPFzm82MVssTCqOVf/afo9GHLChHzsIjGaEwB8kBDOKGCtf9U+3rOYx7ib3q4E/TlGzHPdYJAxgJwBbcWzmcoEo2jMWvjdDCIuAfySNTfv+HMmYtc9fhEGygKdAIVaJHVTCyi8ImYVNblDlzRMW1hapeTSA2U3E3QHXdXl5Uyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 14:35:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Wed, 28 Jan 2026
 14:35:20 +0000
Message-ID: <7623f1be-28ce-4111-941c-15e3fcaf0cb9@amd.com>
Date: Wed, 28 Jan 2026 15:35:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
 <601b38b5-1890-48f9-adf9-54fb85650852@amd.com> <5173841.OV4Wx5bFTl@timur-max>
 <a2fe8187-9271-4cbf-8b7e-37ffda0799de@amd.com>
 <15d1d986-e9cf-48fb-be4e-b2c33974dffc@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <15d1d986-e9cf-48fb-be4e-b2c33974dffc@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 464da759-b299-4d8d-0ccd-08de5e7a7650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlluNEwxNjlLRjk0cllYdjBVclgyUTlzU0U3czFxQXhwV1RadEdqWWUyN1FB?=
 =?utf-8?B?aHN0K3FhSElHZE90TVczOFVhRnZYL0w2VkltV3AybzBFcTg0WSsvNUVwVnJY?=
 =?utf-8?B?emY0V3BEdmtnZ1dZMXREa1l2bk11amw1eWZVZ1FSM1lCOExCQnFTWDFpQ1JV?=
 =?utf-8?B?cTlvMklzbG1rU3U2blI3Q1Q3UmdOZERGdmp3MnJwU0IvbG81aktmVzRoMFRR?=
 =?utf-8?B?QWF5SkJ6dThQdk1kQU8wc2JIRHEwRHRHT0p2WWhIdmRBeE4ySmdxcm1MVGJ2?=
 =?utf-8?B?dldGUjg4YS9yT2RKMkRCVk1oa2J4YjZtbzlERi9zVFBtZ1ZLYk1nVFg5blVL?=
 =?utf-8?B?Z2tubkl5cVlYYjI5UE1zRW1qaTRVMHBjeEcwdHQ0QTdnYnBiSTFTb0hlN0Fs?=
 =?utf-8?B?Vm96Zmt6RGMxK3FPaDU1RU8zT3ZJa3pncXRWbDNTemxIRHY0Y3VqUWlJcTdK?=
 =?utf-8?B?WUE1dzY5Y21CUGFLQWozLzVqelFMRXExaUo2NFZVZjIzaWZ2ZFhoc21PRUpD?=
 =?utf-8?B?RDBPMnUyeENSTnl4STVDOEp3Tmo1QlZaU2RCYjlJV24vUHdwRFJaWlZKNkRX?=
 =?utf-8?B?OTR2Z0dyaXNFL2pxSWxoTXQzSzF4ZXZhVENoY2lpdjhXQ0tCbHBFR3JUdW1h?=
 =?utf-8?B?anFqdlJSUkNsKzNoSitLcVFtUHRpSWpLZkJYTEFhSmFyZDZnNk9Bak5DN3ox?=
 =?utf-8?B?U0lGYnlqWTBiRTFlMk9SaWd2ckU0NXlpVlQ2LzJPY0VNWFdKTVRmQ1RPd2NB?=
 =?utf-8?B?cC8xWXhhNFlYU1o2QlRhRmhWUlphOFNzM1gzeEVxL0VGMEd3WCtGTitkZ0Vl?=
 =?utf-8?B?SjR2bC9qUUFpOHJ2WVd4RXJ6YWVFb25UVTJkVWdxOStsUzh3NW51aGQ1Qjlm?=
 =?utf-8?B?aDhVSExSaEpWV1p5dGMrVTRBOFlwZUE3KzZYY1RRZmJJWDNrWjJ5ZE9VbDVJ?=
 =?utf-8?B?UWsxMnhvZm1HZVhnVUxmbHlvTlJmbEk5MHNLaEVWcHhFaWZDMWMyTEU3bmVC?=
 =?utf-8?B?bWtlUmkweTMycVlQWnRBNmFTZkdkZHlZcllRSVZPdk55cWo0eStNM1VpUmFr?=
 =?utf-8?B?dk1BcXR3N0dHazczajlCS0VjNnJNU0tBcmZSV2hzajgrU2xveXZoai8zdS94?=
 =?utf-8?B?V3ZadzhWSG1XUXI4dm9uYkpHUC9oTEFLZE1JZTY4YjlsbFRVZFZpRnFvbG9U?=
 =?utf-8?B?S3U5Ynl6V2d6VHM3cDFNL0REUFlWUzJCNEE2L3JRUWt4MVFlQ29ZUFlZdk1j?=
 =?utf-8?B?TUEvUkdpM0szWVpEeEliRUZ2UGRqdGNiZG1Qa1h2Y2tMNVYzMzJsamEyQ2h6?=
 =?utf-8?B?QlVCT2Z5Y0xqVzZqcSt3YmVZWFFOcTBPeHJSRHJNcWs3L2NweXhMWTV6bG9P?=
 =?utf-8?B?R210MXNoTVhNdzFsOVRDMTVtS2Y5c0prM0ZzWmIzS0lucnpMLytzVWlMRlI1?=
 =?utf-8?B?dU5CZWg2SUc3S1Z4T2lxTTA4ajRiQ3Zid3UwTXlpN01MaVNTLzIyZlJzZDlU?=
 =?utf-8?B?OVdCbDhybTc0VVFwUGorMXhEUHJ4Zmg5KzVPK0grWml1K0tCeFp1Wno0SURq?=
 =?utf-8?B?Ny96OFVncm85YStYcWFjekVTaHE4U0YzYXFhVGllemNkK1JpUnhvUURzbGg1?=
 =?utf-8?B?cWZsMUV3RnZJajdtZ2JnbHpNYzJ3QnRmNXdyUjMvWjA2MUhMMGNkVDdzT3RQ?=
 =?utf-8?B?MnYrSkhNc3BzQ3hZeDlja2VQelR5MjV1eHR5NFBJTnUwYlQ2T2k5OEp3c2FC?=
 =?utf-8?B?U3M5N3V2NVdQNEh0KzVjUERhQWNLZjVRUjRKekVac201TzhIWnBVc0tYRE0z?=
 =?utf-8?B?b3Fia2FiMFNIdTkxN0JkZnlZOU9nS0lvWTZBd0VORk1PMFFhWkZUcTFKSDhN?=
 =?utf-8?B?SzBUVklTQUpDVmZBR1U3OWJWSWVwRGNsTnR6NU5HV0ZDOVFMc25kMWpTOU4z?=
 =?utf-8?B?dDlyMXkxRjdScU96NVpBTHdVdDBEMzdCUWk4NTBYblh3UVlhQjRwWUR5cEZa?=
 =?utf-8?B?K3BjU3ZMQ3g2ZmxGOFVpV2J4QmJqTnQrZzVidGVaWkRlZjFyREt6RTFSQTBj?=
 =?utf-8?B?amV6VUkyYTVIbkQ5M1cyc0RNN1JwTGIxUjVxTUtyOC9FOEN6dEQ1L0tuVjQ3?=
 =?utf-8?Q?czmI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpucXFtWk92ZGQyelFmZUViVFpzVFBXTExZb0NMUXdHZW1QdGVZa3d1d3hF?=
 =?utf-8?B?N1JuMDE0TTZuSTZ1aURtUDc5elhEeWJybUhIV2pEQWc5Y3ZnQ29JNlQ3TzQ3?=
 =?utf-8?B?WlZJNGMvVGJVbll2Ly9Fb1pPd2UxOGI2Y0J3OG9ubU41U2lMdVY5OEdZZXhp?=
 =?utf-8?B?MGZCNHhRM2dleDVoMDE3Q3R2aW1GMkUxR0tFZGdMSE93T2FNMXR4UStiSDJ1?=
 =?utf-8?B?ZGROVUpMSzBwaWtYWDY2MHBzMmc2eE5aT3Z2djQ2SURVV2JzbzRNbE1wTk05?=
 =?utf-8?B?aXo4SGUrQkZVZ0Yvemc0TjRVUDNtMnY4bSt1YVpUYjM0WE84QzJyRmUwUDVS?=
 =?utf-8?B?TEl3b0hBdVpwUzF2U3dlNVN1a0kxSEJaaGdWbVdkYlFxUStEM2FvWEV5TU80?=
 =?utf-8?B?VXhaVXNYT0RRcHcrYVNydFRDRmwxVzNUanVsdStQbWtJL1lMOXJwVjdEN0RM?=
 =?utf-8?B?UnBobm9Gak42akJWWVhUT3Y2Qzg4YkJJQUJhNFdNcEJON3h0UmV2Q01xd0Rk?=
 =?utf-8?B?UWhBalY4SElDSWFjTm5nOXR3SngyaWM5N21ZcDVFOGJja1BZMC9HV1ZFcnl4?=
 =?utf-8?B?UzhPcXg5MXBmb29BQ2xzbTFxYndnRUlpTXpOcERlRm81eDRoM0t0SlhnZGpI?=
 =?utf-8?B?WVRsVHBEK3o4TGllcVN1Sy93Ni9CcnhuQTlONExkYVUxems5NUdyR0l5VWZL?=
 =?utf-8?B?SzRvcENRZSt0THo0M2Rhb0xxaThKN1U0bUU0V0ZveEFEVjJTUEcrdmZXZ2Ji?=
 =?utf-8?B?TFZjY1FDUE9TTWh0dS9jdUthY1JvSnhyWmI0akp5Njh4QVlpdTcybi8ycHEx?=
 =?utf-8?B?QmdueEd4dzNoNGRsU2lBOHN4ckRSQUhvaGZYd0F0bFEwdnJaeG5URk9ZTVYz?=
 =?utf-8?B?eDIzMmFTakFtd2MyUjZRV1ZmczVhQzgzeDhXMFk4UkFCbXliQ3ZpeExxeVJJ?=
 =?utf-8?B?dlo0dGFBUHhvN01vajFYcXJoSG9nSER0SGRHQ1pjanFNUkg4UmczQ3lQYzlB?=
 =?utf-8?B?ZEh6L3lRcE16ajBOcEJQdENmM2xEVGRUalpXNWFqd2M4dUgvcHgrVFVlY3pp?=
 =?utf-8?B?ODVIUXZWUzRrekwwZFlQVFB5WGVyd0JEWGJPWVV1SHZLUEJFNmFlTWJKcUEr?=
 =?utf-8?B?czNEZ0VMT3V4a3c2cXNsZWJzTzdHempVSTQ5WkNhb3RNQ043VUxvS3BkQ2tF?=
 =?utf-8?B?VndnM0hYWXlEMWlLRW5RVDFEK2Z0TTl1c21iVEcvQVFXZEorU1N1bk9CdXdN?=
 =?utf-8?B?dHNzdG80K3pGSmgwQSt5Y3ZLN0lTTHBRcE96b1NsTXVIOW85d0JiWFJVT0FC?=
 =?utf-8?B?bHAyY2tobDFtNklBL2w4R1hxVlMwaWtqekU4VVVWRmFMRng4RmpVMjBqSjZV?=
 =?utf-8?B?S1RpTGo3a2lyRlRJNk0yMkx0TDVYRmtDUWRMeWhnZWpDamU1MEN5cERuSkhC?=
 =?utf-8?B?RG1oSWYxaUxWaFNmK0ZkMk9HYkk4eWtidFYzVXJ2K0RpTFdIL0FneDhZem5K?=
 =?utf-8?B?aEFmYXFPbTlhZ0swWmhDL3EyZVFCUW00WFhoRXVQL3FZYndGR2pvQnhTeGV6?=
 =?utf-8?B?L3JqQXEzVkdqY2RwNmhPaEpLQlBqKzNTU2VnT1BWQXBiZUQvY1lsZG9CQjN4?=
 =?utf-8?B?VjZZV2ZPRTdtcXdxUVlPcitTLzdiUXJhK3RJeUVxRTU0dWM5U2dROTFISFhr?=
 =?utf-8?B?a2VyTG1rSHpLaEM3dEhKdE5uc3hheHUvbUpxMk5ycVdZV2xnMEdUSUE2ZU9p?=
 =?utf-8?B?cEJlb1NlcWVXL2RlTUpQZXZ5YUxoNElReGJkYk0vbEhzU1k2djEzd3EzYnNo?=
 =?utf-8?B?WVdSWHVoVmwxMFAwSGNqMW00T1VPc0JtT0xFbWxISUFrcGdJOEIyTkJkSFhY?=
 =?utf-8?B?bjdvaEhmMnkyeXQ2NjhYS2kvLzNRdXdRZkQ2OGJ4bmJPMy9hdmdkN2pYOGt4?=
 =?utf-8?B?SFhRUmZNNTBvcjJoVTFsMU4vVG5lM2QvVWRXV1JIY0svRHRyNDA1dXVGYis0?=
 =?utf-8?B?blJrYmVjbS96bHhRTlpZL2tmcmdyNjh5YXNBVGFBMXlHczlVbitFYmQwLzg0?=
 =?utf-8?B?Z0Jmb096NjRsRXdxa3hicWhmTmRNL0pMSnhIaWc3VExpbG94NlI4SXNEUElv?=
 =?utf-8?B?UHRuTkpkdDlZWXBhak1LZlNtdWpTMGs5ZTBQLzBXTVZXQUg5QmJwRHNMQ0p5?=
 =?utf-8?B?OTc0VUpwbHBCTmhuVDhXWjJ5REkyQi81VDhpUzhXS2YyS3U1SkFqS3VBUkFq?=
 =?utf-8?B?YU1MSmFLYTFwT01JM0pUU0tEd25TM1JrRjRRYWhwSjd6RmwvMnhHdVRDWFRo?=
 =?utf-8?Q?rl2N4Lxzrf1YB7vbKw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464da759-b299-4d8d-0ccd-08de5e7a7650
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:35:20.0540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLnoW8QBO/R4R8oHyL5a2XlClVi6qAO5nIlZJFH8dyiQzIGcayPBSWebXLAb+Ks6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com,effective-light.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 687DDA2D87
X-Rspamd-Action: no action

On 1/28/26 15:25, Michel Dänzer wrote:
> On 1/28/26 12:25, Christian König wrote:
>> On 1/28/26 10:19, Timur Kristóf wrote:
>>> On 2026. január 26., hétfő 14:00:59 közép-európai téli idő Christian König 
>>> wrote:
>>>> On 1/26/26 11:27, Michel Dänzer wrote:
>>>>> On 1/26/26 11:14, Christian König wrote:
>>>>>>
>>>>>> But looking at the slide Harry actually pointed out what immediately came
>>>>>> to my mind as well, e.g. that the Compositor needs to issue a full
>>>>>> modeset to re-program the CRTC.> 
>>>>> In principle, the kernel driver has all the information it needs to
>>>>> reprogram the HW by itself. Not sure why the compositor would need to be
>>>>> actively involved.
>>>>
>>>> [...]
>>>>
>>>> Then second even if the kernel can do it I'm not sure if it should do it.
>>>>
>>>> [...]
>>>
>>> I agree with Michel here. It's a kernel bug, it should be solved by the 
>>> kernel. I don't like the tendency of pushing userspace to handle kernel bugs, 
>>> especially if this is just needed for one vendor's buggy driver. (No offence.)
>>
>> Well I strongly disagree. The kernel is not here to serve userspace, [...]
> 
> Can't say I agree with that statement.
> 
> Anyway, user space certainly isn't here to kick the kernel back into gear after it hit a bug, or to tell it things it already knows.

That is a really good argument. But the kernel should also not hide that something went wrong from userspace. E.g. flaky HDP pins for example.

Regards,
Christian.

> 
> 

