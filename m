Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B75ADE48F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061D110E2D6;
	Wed, 18 Jun 2025 07:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5VbrXsgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952D110E0C4;
 Wed, 18 Jun 2025 07:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0IGDFg8MOhcenfjcTOXX9VOoVed7SDmXyg3jstb/gHq+d4WahyMA+B8zTDFYJtor1e/dR9gCe0R4VqqRFYvZqVF0Af4FCuarRviJzKXTl7nuk5qvjL+9AGqMknFBa/Fi+49rfioeaFMkFEeZXSqHMOhRT1QlZhpX6YccYDviBL/fE7Jtj0Gc34+eJpnrWJlsOkyOyDhhXKXii4D1FxfpNug/AJHObo3UVXSTLxEXQz1Olsj77trkRW5TfeQZeJmkiuaEUQ685nZjTDozHRQBe9m8e+3fZKo/+MMxsBi0eFXzbbJUq4l3qYXZM8+vQNi+YRnU2bdPord9cW6lK/Iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTlODWDU7PG0AH1sTNRCX2TH9F+61eB/LcmV/fb8USc=;
 b=U1mls943wEgKNi+6MaYu9utVPIepsMorvRa8u7KWCDXtgg5l+KhuQbPSCF/GlAoV/j1MG0BBTu1Z0fwWzBf5PHesqUfmw3Zt72Z9MDm/u95F/km1QA4LLwcz3AjrvT7pbnWvRXtH3vanQU57F53OQ2Wm865HCp+mvUT8gEPeCySGV7NuQ1Btmu9zy3h9XZd3yhCKfJ13O7w5vYdWTKI5k6cNSaNVxNl/bxvvyLFA/ISVzmsIlKhhqbAsXvtABcBZ0EImkPB5HPmEhBcyjUt4z/QtB0JvMuKSj4AkVmj351QbnmE8rvBlYcWeqiD8Uezl+oZAA7LAM/VZEgb3LyYWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTlODWDU7PG0AH1sTNRCX2TH9F+61eB/LcmV/fb8USc=;
 b=5VbrXsgg3R3s/uOr+tXTTUER/Fl82MDt7czfS9gYQEg2noUMkW2AsE5rqxocwohyceAOsne6Ji8ucuw84kxFl9pcnsUjcpG2jUY9YYGx4nxle+iHSFeW5r3Utl+ydGUIbWWGboTsAZSmxoO2M8UQnAwQdEXe7nW9iF/ebtfAVSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 07:29:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 18 Jun 2025
 07:29:12 +0000
Message-ID: <a0f508fd-3277-4839-a4b6-e6bc56546f6c@amd.com>
Date: Wed, 18 Jun 2025 09:29:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
 <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
 <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a61e61e-5d2e-4bbe-3336-08ddae39d252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BUanBlTWRmdi9VeXE2N1VkK3QyK1JpN09YVTl6TGVUVG9tNm5KYzMxT2lQ?=
 =?utf-8?B?Q3BRb1ZWTCtpV2FoUHZvS3BjWkplQVpUTjVjQlBhaVRuREF0Z2dZdWFwNm5z?=
 =?utf-8?B?S1BYNHl2QkpTTXhuZ3VBVFNva2FiYjhCcExTM3pydk5FdUcvTjBsWVFCQjlQ?=
 =?utf-8?B?QUtsR0hHVzNFcm9QTnlUSTB3d0VhemExQjJTSVZKcjBXcnVwd1RtVnoxc2Ey?=
 =?utf-8?B?TXRETlNCd3BRNUNDcDBRMEdQbU5DMkFoUmNHR2lvQ3M3ek0zdlIvak52T1Zx?=
 =?utf-8?B?N0lBN20yaHIyVW11aC9RTWJCcWJvVUFNOUt3cGlFeWZtVkt0dkVabFp2N1Bu?=
 =?utf-8?B?UWxvRlNoRzhaeFFyRkxMZ1VaTVFlZTZBWFRlNnAyVFVGTEtDTDZZdXJlclRQ?=
 =?utf-8?B?VlNSNDJnU0FPWkduLzd0UlZJMlY5anRiekZMSUtzNXhhR0xGRTRFVDYvZVJl?=
 =?utf-8?B?cDZjY2RqTHVwQmdxVjhWUm50ZlpKRzVINXl3Mm9xY04rMW45Ry9xN2M5K0Rv?=
 =?utf-8?B?MnpxZnUzU1ZkTnhiZmg0SUNOQ0xOWWducWhYdDJxN0FybzM0YW9pZjBGUnVu?=
 =?utf-8?B?TWJDV0wwMG91SGpRbFRIOVBSZUdaZVM4MnZBc2l3THVsNjgrZGNmOFE1cklQ?=
 =?utf-8?B?ekphRDVRMU9KbEdHKzRzU1FuMHh4WklzYS9CQmFtbXNKUnRnRm91WU5VUkZa?=
 =?utf-8?B?YVZEekFDOXdTNHJoQmMvWk5uNWQxd3g4Nm9nOUp3Tjg1WnQ0eUxQNzlESVBR?=
 =?utf-8?B?RGtsbWlyVnkwNC80Y2ZmQ0s4UEUwMGJGV2U2VEphdnBrNklmRm5BVFE0WG1i?=
 =?utf-8?B?SVZBbjhiVHN3OG1rdko1V1FDeG1RYUFwTVZrQWNTUUJEN05MV2FXMEthckhX?=
 =?utf-8?B?V1lNYXp2dlgySVprTm8wbDZoOWljSFVjV285R0pGN2ZiNEtUVk5TdzBnOWQx?=
 =?utf-8?B?Rmh4b3ZYMWM5QksxNWNrOEpENjUramhOU1QyRjJuTkV5S2k4R1dZcENQRXFn?=
 =?utf-8?B?SzFOWmMxemg3WFdYRmtjRnVyWE5lSUxWZkRQME5pbkRRUjVtbFhqLzQ4amk5?=
 =?utf-8?B?RXRmTjFNR2RVTkpobGFSdllZdk5VM3N5eFd6eUlaQWVJclFzMmNxRGVrcWlw?=
 =?utf-8?B?ZnNrN0tQZHBLaDhncm9ILzdaRXRRYk9sSy9RVmVBUWFSTDNMOXNKRS96bTJx?=
 =?utf-8?B?Qk1wWDNkV1ljR3E5YU9lVGc5b0JrYzFrU1Y1Yllma3MwWDFUV2RqZndLdVA2?=
 =?utf-8?B?VTBWS0xuMWtQSkNtTzdEQVVJcVFKVlQ0TEJtMlBlbHlFWUk3aUVWcnkvR2lz?=
 =?utf-8?B?cG9rd2k3eXZYK3ZWQkZSNVhNOTBoQnRwNHNSdnN0dUZkalRhMytFUWQvMmwx?=
 =?utf-8?B?RW1HLy93U0hlS3NwVXViZU5qWmIxOTdqYW1PbjdkelNhaFpOWHEzcXZ1RG5o?=
 =?utf-8?B?SHQ3WnRjL2ZQQTMxUXhRNCtBeEFyUjF6VUVLMW9LejBESGJpOGVDeWtZZmFG?=
 =?utf-8?B?YWRIM3JJM3BHZ1pHeFV6U2tuK0FUWkdSN2lJVWxrZ2IwOTVuaFVUcEJGOFV3?=
 =?utf-8?B?TTcvZXVBOExXUUVER2VIUjdxeHQ4MVM1VWkrbS9adDNBaFVpUHg5dDg2dkZ3?=
 =?utf-8?B?K3UxV092NFZRRlZhdExtSXFEVkxNaEJEdkpIVmRmbE9GQ0JBUy9YTU9iYUcv?=
 =?utf-8?B?ZHRVYm8xOW8wczUwYWs0eW5mSGRPN1BMMkJZK1dzcDdGQm9hcVZJaUZSQ05R?=
 =?utf-8?B?ZnRsaHlrQXJHako2REhRc0hTTHNjeVp5dHg2VDJPZzdkK2JKak1Qc1hlSEVh?=
 =?utf-8?B?WW9nTVdjM2VGYVVERVFQY3RqSzk1MHU2MnlKenZZT21sMzVQalJjaWE0QWtv?=
 =?utf-8?B?WlJBMTF6UnpGRndDL1loRW9KZnBLeXM1ZjZaMGRnN0dIc29rTXNuWUdFakhP?=
 =?utf-8?B?TEZOYTJTM0NOVWIvODRPV1FPSVpxb2Z2VmZlSEZxYnlBVFRVcS9LWmlqc1VM?=
 =?utf-8?B?dmFSZFk2MXJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJ6SUN1K01uT1pCU3hoSE55SjB3RUpKVnRjeDNKZUszU2x5NkMrMlhoN3I2?=
 =?utf-8?B?cUt5YW9Kb3FzODM1cHFPOXdwRFk0K1lPalQ0WG1FNnJtbWttSGRwbnh2VWRz?=
 =?utf-8?B?SW10Z1FFRHNsellUSEZKa0pPSGh1aDgwdDlqSWZ5OWkxeFlBQzZxZHJwS05S?=
 =?utf-8?B?RithRlJ3N2pWNURVRGFOckRTTnNMYUozeWRscDhNdzBDNzM2anNjWXZpMU55?=
 =?utf-8?B?dlNVNDRsUzRrK09yMW9wZ2dxUENIMzJhM0RxUFd3US9CaGV0MlRoNmZCTGJQ?=
 =?utf-8?B?djY2L05KQkVqRkVYWDhUSVZqK0JrTHFlWXQ5YXhrWEFBbDVHUmE3VGdNa3pR?=
 =?utf-8?B?eUVtODQvWkhEUjg3Tnk5endlZ1d4clZRRU5ZaUVtQTZidWVJV1N6anJmdzE1?=
 =?utf-8?B?elRKTHVKSUtHOFVwTDJwellxWURGbmQ1TXkwdXVGeUpJZlZObWQxa2pkbThB?=
 =?utf-8?B?UjJoOVJES3lkTFhCcU5Fei9jUjk0eGNDbDMycFIwSFh1bk1VcGlOM0x5aGJx?=
 =?utf-8?B?dHozSWtCbUkzRytLTjcxd0d1MlB2YWlqUWsrR2prQWJiTDdPWUxTRm4yeklK?=
 =?utf-8?B?TU56VEpOajNlMDZaOEYrbWxpaFhqMzQ4TTVRd0g0WVU0ZEwxcFcrWTEvSVk5?=
 =?utf-8?B?bmU4RVA4WG9ZZ3A3SnpQYWFYSmtIN0tQMzlQVUIrZnJ1cU9xempOU2RQL3h1?=
 =?utf-8?B?S2VETHc4eDFZai9wbTNBRzByaGJhQitWc2N4U3Q1b1FQYUtjWHJRZHgxaXls?=
 =?utf-8?B?VzFzbU56ODlsT2NONlJYWmVlZklHU1BQejRnZUIxb1Byb0lCVVh4WTArc1pU?=
 =?utf-8?B?RzlIWmE0WnlHK2NvMlZrN08zeWJCbWJDU0J0N01udnpEamFYdnZGRUQyWlk3?=
 =?utf-8?B?ay8xclB5Nlh5RWI2Nkt6ZExqVXY2LytQVjc5RC9TaWd3ak9LamU1cjBPWnF0?=
 =?utf-8?B?cFVFdHp0RHBSRys3UjJUMUp5MEJSb1BnM0l3Y21CVHJIK0s5Y0JBZVNVZUU3?=
 =?utf-8?B?SzJqRnl0RTZ1ZkQvVTA2ZXNiTWhOanlkNVNONHM0aEJmeVJkUGltVWczZHYx?=
 =?utf-8?B?dXRFalZ1UzNwY0lFdWxDRWYySnUwS0drMUdZcVg5bkNTSXF5R0tGS1psamJn?=
 =?utf-8?B?SkV3cnp0c1R2QW9IMkNtMnpWaXJSbVJLbG1NcGpUeFZaQXBLZGg3R0M5d3RK?=
 =?utf-8?B?cDhNa1JCTFZwZ3czcnI3MVJFUWw5VEI5RktOeUd2UUt2WnpRK1Y4WVE3bWRN?=
 =?utf-8?B?Q2pva2krRis2SUZEdEZJWXVIcngwNDRpQ1hHNTB6UENOQU1CUzRtNHpoMm1i?=
 =?utf-8?B?NzNzSHBLZWtJRHBrSFdSQ3VjMG56ekZrcVErVTR6TVE2Qkh2VUhldHZYT0Ji?=
 =?utf-8?B?V3lnSEMrNzdraDRlOHNJMjFLVi96SWUvLzF5QTFrRUROek96NnhpaFA1cG5n?=
 =?utf-8?B?b1pLZW1yQ0Q0QWV3c09CMVRydEIyR2tIb3hWNkRSS1BEYmRMSGFGTEpIOTBB?=
 =?utf-8?B?V1EyRmV3dGNzZnJkeTlFaGdoS1VHQ3FHaFI3Z1FmZmkveml6ai9UL054QU9S?=
 =?utf-8?B?SGgvaUE5WTNWbTRwK0xxcHdJVU1kdXJOSVhUNlpoWWxZL2RVRHNibG1Yall1?=
 =?utf-8?B?Q2FPOWNCZ3QzRkFlVVVzUlM0RUd4SnZ3aEdHSFFKdWRCQndHNmVsVzgwbGRE?=
 =?utf-8?B?NzhYcXp3bUovVTE4ZGVEbGRBUTdST09ndjFhVFVyZjBLR015MFNWaXlyT2No?=
 =?utf-8?B?ZkZOMnQ1eEZ5UHpoUGhXWE9HSU9BSVZmRCtjZWRENmdaR28xdXg1VjIwWlFo?=
 =?utf-8?B?a3pkSldoL1hkbUJWRjlzbWd2WGgvSjRLQ3FGQ29XZmY2QUlPanU2R3NYVk5P?=
 =?utf-8?B?UjN1Z3NWZ0ptOGh3alBJMzhoNkF1VHMxU2tzdVZ4S0ZidGduY2g0bGVBWkdl?=
 =?utf-8?B?YisvVjlwbUZLSE5hY2Jxb2RXanNDSXNEbG5sd01taG9OeHZRdWRZMy94b3pS?=
 =?utf-8?B?Wm0wY1hkL3hScWFTbmQ1MHUvKzlIemNGbE9LU3BZWXhQUURmdnZoWXpxa2xw?=
 =?utf-8?B?TWZQdmt6RWl3Z0Z4OW9GS3EvSlNiTWNjVE1qOFcxUzRHaURsdU9NSEthN3p1?=
 =?utf-8?Q?Dmjui+9P2bIKVk1zE89IpCFrY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a61e61e-5d2e-4bbe-3336-08ddae39d252
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:29:12.4052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llz9h4gSo6McW7WlpvX87v6A4YnaiImFfxCLtB34roqk8ytZ61MKM06dwI763b3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
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

On 6/17/25 15:22, André Almeida wrote:
> Em 17/06/2025 10:07, Christian König escreveu:
>> On 6/17/25 14:49, André Almeida wrote:
>>> To notify userspace about which task (if any) made the device get in a
>>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>>> the task PID and name.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Do you have commit right for drm-misc-next?
>>
> 
> Thanks for the reviews!
> 
> I do have access, but if you don't mind, can you push this one?

Sure, but give me till the end of today.

(And maybe ping me next week should I forget about it).

Regards,
Christian.

> 
>> Regards,
>> Christian.
>>
>>> ---
>>> v8:
>>>   - Drop check before calling amdgpu_vm_put_task_info()
>>>   - Drop local variable `info`
>>> v7:
>>>   - Remove struct cast, now we can use `info = &ti->task`
>>>   - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>>>     drm_dev_wedged_event() call
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  7 +++++--
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 8a0f36f33f13..a59f194e3360 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -6363,8 +6363,17 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>         atomic_set(&adev->reset_domain->reset_res, r);
>>>   -    if (!r)
>>> -        drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>>> +    if (!r) {
>>> +        struct amdgpu_task_info *ti = NULL;
>>> +
>>> +        if (job)
>>> +            ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>>> +
>>> +        drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE,
>>> +                     ti ? &ti->task : NULL);
>>> +
>>> +        amdgpu_vm_put_task_info(ti);
>>> +    }
>>>         return r;
>>>   }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 0c1381b527fe..1e24590ae144 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>   {
>>>       struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>>>       struct amdgpu_job *job = to_amdgpu_job(s_job);
>>> +    struct drm_wedge_task_info *info = NULL;
>>>       struct amdgpu_task_info *ti;
>>>       struct amdgpu_device *adev = ring->adev;
>>>       int idx;
>>> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>       ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>>>       if (ti) {
>>>           amdgpu_vm_print_task_info(adev, ti);
>>> -        amdgpu_vm_put_task_info(ti);
>>> +        info = &ti->task;
>>>       }
>>>         /* attempt a per ring reset */
>>> @@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>               if (amdgpu_ring_sched_ready(ring))
>>>                   drm_sched_start(&ring->sched, 0);
>>>               dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
>>> -            drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>>> +            drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
>>>               goto exit;
>>>           }
>>>           dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
>>>       }
>>>       dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>>>   +    amdgpu_vm_put_task_info(ti);
>>> +
>>>       if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>>           struct amdgpu_reset_context reset_context;
>>>           memset(&reset_context, 0, sizeof(reset_context));
>>
> 

