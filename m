Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C98AFF7E4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 06:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D504710E14E;
	Thu, 10 Jul 2025 04:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BbtnxbjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAF110E085;
 Thu, 10 Jul 2025 04:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGwtxDq4Pomsve37bssNYBmsd+XideaekWDwl9cJmUfOcoJrKiKcS0B+rWr6uBIpne4Nvb6151W5AD4HNZaFxqdHYMCklODLZi2kHdSXGOdc1cOpJvgQyAuy6GBGxcRPjerjd/vlfUm7yJb/RCKegCDGCXdC3i8M+O9kA59UARzfjqyzgRj1qYokUnfSmmq6zYP1LhiVK7nDw7JE5m9VWCJn5WG4nLFoWzM7DLsRhHarwHQDsG5yWRWFvURKkDXu/B1pqn73imYN/pYCMtHJNHQ91Gnsk1W5yb7lNBPH4I7sMfXpQSHhrsc7MlBSm7/oO57IbkiItjQhzdDGLxuPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p41P7Vz1hFBf8M2eb9LxvvdSgmkWULzzGW86J9ZAvEw=;
 b=qG5sZKO+4huFQ4Zg+Am9MjVSQZlxaeSaX/hhsjnEYWZID+RK0d5OyzndZFVoWjdlTIIc+6flBpAdI+z+S0deOh+4d8IhR9Yu07xXeGlbwQnR4/jrg1vuTvHWhdukxf2kGK1BjBK6rt4EHdmo9fyypxAFkZJmt0mz9qNidjT5UEx1kdasmi7y0Yo87Q8wnUhXv49DGSy4LGJCnagOP1FDGS4jBnrBJgmk5I4d+JUMitHKMrJDdlesWOmWkqwF7xvhKnLIFHbo94AaCUC0aTdwUtSOFTnrz8EHjPW60J1sJiMm06ADpnHAC/iS9FcT52syZZZ3zlRtVUg48Lfzae3h1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p41P7Vz1hFBf8M2eb9LxvvdSgmkWULzzGW86J9ZAvEw=;
 b=BbtnxbjPd5a1zaAW1jj5ryMh1zXn0nyvbWK7LIM+UWgAnZ/mISSfVlFtSFSV3rc1RYgyhKWw4SYvjsgju7b68dc/8rvW0xbzyArqctOvD2eIevT5emuShnj9GfFeKS6zv+6Yb7a65c4Gxgk6K5p5nCwt7Dojf+F2E6dwd1ZU88U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 04:19:01 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Thu, 10 Jul 2025
 04:19:00 +0000
Message-ID: <202dae4c-6280-4f35-9c16-fdf6398ba856@amd.com>
Date: Thu, 10 Jul 2025 09:48:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Mario Limonciello <mario.limonciello@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com,
 Owen.Zhang2@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-6-guoqing.zhang@amd.com>
 <6963322b-d4e2-4d4d-b4b6-e2c44d49a94b@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <6963322b-d4e2-4d4d-b4b6-e2c44d49a94b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::33) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: 099ddebf-54d2-4eab-99af-08ddbf68e579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0hudHNSODFkQUhHb2QrMXQwOVhENHNMZFhmTkNtOHZwaG00N0RlZWIyMGZZ?=
 =?utf-8?B?RzRkQlNHRHR0ZWJ3NXhyWXlYSmsrY0VEZFRBOENISU5DK1Nkc1NuU0d0MWdX?=
 =?utf-8?B?aEd4TmsrWmVKOWVQYlN6RS9EMnpnWERoazF4dnByejlRdVk3QVBPRm42cWRE?=
 =?utf-8?B?MW9waWptTkc4TU5pNU9CckFuM0ZLOUZmam9nMDIwWnZKYzVZQzVWRHNzUnpu?=
 =?utf-8?B?aFNaOWsrT1FjcEd0eHdnZWdaV0NFVjYxeUxaVVpxVU1zQ3d4VFhrQkp0TWp3?=
 =?utf-8?B?U3VBWmRVbWlGZEtVcEI3MERkQjdKOHMzTVFBU21tQUVyQ3NFRWZ0ellUKzJH?=
 =?utf-8?B?UEY4eERWdTBObXo3NURZM05iNFFuYkh5aExiNGNKRnAvRC9JckxwZEkwNU5B?=
 =?utf-8?B?YytEbTRXeW8rZ3NTUHlVLzVZeFhNdlF3UkR2K0NUZjh2bElHVDQzU0lkRW9X?=
 =?utf-8?B?UnRDNUt1Q3JxL3ZPT3l6aVJBenZBQm1lQXVLNGlVNTZESHE1QUVrd3FUdDBm?=
 =?utf-8?B?STA1emk2RmVSbTB5VmFOMldOZjBpajdUNnFTcUEvbEpyRjBpcTdtaHJBYk9T?=
 =?utf-8?B?clNTU3lRSVA3eTRtYmROdUZCcGZIU0Qwb01FZVphVXdJZHQvdzUwM2s0Ty81?=
 =?utf-8?B?U3M4UEZUNkZGdjhUTjE0L0RIdHRLbXVBOUpUVjhiSmFhbFpEdVZqNnJuWkQ3?=
 =?utf-8?B?UWg3bGc4Q3pXQWtTWlNWMmIxL0NQRmpiQmdXNTFuallkYVllUm1heXVmZFg2?=
 =?utf-8?B?WUtRVGRGSDh0YmplLzdLZGNuWTRoU2xKUEdRSk9PQmx2b2ZrR1ZLTVVtb3RO?=
 =?utf-8?B?QWxCdjdRbE03KzNtbHVIV3lnZGVsRWpXY3lhZlNpc0pKbTQxRGNRdGVWMUFw?=
 =?utf-8?B?VkFVRWluS01UUXBqeUtzRUxDOVpzR2xXZm1SUC96dkh5OXpSWmRHWk5mRkRw?=
 =?utf-8?B?Z25wQ0pDSWFkdnptSDViWEVacEhVYWl0TmNDRHNxbWVMZG1NOG1UaWZBWWpl?=
 =?utf-8?B?MUkzbytON0YxNm1kaXVGSVY3aVJTZDB0dnQ1RDdLRnExUWVCT3JvMWplN2dG?=
 =?utf-8?B?eUs2QjMwVjZnSm9hRmlyRldYcFRXbTRMY3FUQkNpT01DUkJXeDI4aFJSWGdD?=
 =?utf-8?B?NW8xKzRHd0UvSzNTYWQ0QnBQSmtVaUlPaGJINTZDV2hBcUIrOWRLMENzbS9E?=
 =?utf-8?B?TDIvSU5SdTRzT0pWMUJMaTViY2hjRGo4aWc5TTdhcUJ4c2hBZ1pqRkNxbUI2?=
 =?utf-8?B?YzV4S01lSU50OXlJMzZTV2FUa1ZrU0ozVXF5TWt1MEk1ZG5MUlJNWjB6SHAw?=
 =?utf-8?B?TTVWQW1FekU0a1RzYTZyVmxOcHN3MzhPUGE3bkN1cEhCc2dVbytYQnJlNkJj?=
 =?utf-8?B?a3JITXJCcmpOcld6SXo3M2N4SzMrUDdzd252endxaU1PdEowK3hHKytEdXlB?=
 =?utf-8?B?djlkM3ZGdlNVeDVjUC8veHVNOGlJWUhXVE5WM2pjYnM4ZlFMMGxJYklwR05Z?=
 =?utf-8?B?VkVMbG51QnRSQ0Q3dG05NTBWYUJIN1RZUEUxMjJ4akRweU5Ya2VYUEZ1THRi?=
 =?utf-8?B?eThyODhnVWhkRGVyZFY1Qm1UTUFVNUlnMzl2Yk5TSlJid211SG9YdGtaWVJ1?=
 =?utf-8?B?QnErL3JUbU10bXplVnZ2SEg2Y2I1YVVaTE9xVU55eHZjN3N4ZXN1YUlGeDl6?=
 =?utf-8?B?TEVpa0orTkIvL1BJMFBLYkNnTFE0aFR5dkRpSlU0VHdvbi9xWlM3S3FFTjht?=
 =?utf-8?B?VkJ2WUtVc2RSa055VlpaaCtoY3ByOUtmNGk1T1ZsZkdQMklPNWsxVVV0ZDR0?=
 =?utf-8?B?UG9IbXNoUlFFdDh2QlJxYzdoNWw4V21CUURVRHUyOHlJUTVac3V2M3FuQnZr?=
 =?utf-8?B?WHVZUk9qRFB3cjZ0dVltRytqYWM1b092TE5oMXJYbUxHOTZKN0EwblpLN1ZM?=
 =?utf-8?B?LzdEQ3N1ajlNWVRpY3J5dkxTZ3lYVXhBb0xzb28zaUtaZjRZWW1OQVdwbm4x?=
 =?utf-8?B?WURXb1d1WjVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akg2alp2VzNjcjdWTExETW9pOHlEY0dPUlVuSGxTTGhqclUxU09HRUlmd3Qw?=
 =?utf-8?B?eS9HcnNQb2I0Wm5HNHhoQ0VHR1RRTHpKSzFpU2JMU1JRSWRyNndtcFJ4M20v?=
 =?utf-8?B?UnpZRmIwaGlQR1dGM21PbjlNMm1kN1pZVmpaaUhueTUwNnQwczZXdDNYNDRl?=
 =?utf-8?B?VmErMmt2V0liTndaMURsNnhRcU9XUURaa1RnUE03TmwvN08rUUFPMiszc0Zy?=
 =?utf-8?B?eTN5OEplZHFkK2RWMEVITThRUXI1eUZKWE1YdlhQMUFyZmdZMlpXdnlSbGFO?=
 =?utf-8?B?Z2tGMmU1ZGo1ODBuNnkzYmFYYTZsSk0zZUZxd01zOEljTmdaOWdVOWZZN0VZ?=
 =?utf-8?B?a040QjF1UXVxaG1sU0R2ZGNpMjRXOEhIZmlDSWtNQ3duSXV0OTExOWtBUW1u?=
 =?utf-8?B?aHFaUXg0OGJjMndtb1lnWE1oYWtsTlVpQlBscVZ3NHN3L0lCRkFhOUt3MnBO?=
 =?utf-8?B?K01JaVc4Z3UzZHQweFJoc2Y1dzUyNFhndGRPWFJKZEhza2RKSWZCM0R0YnVR?=
 =?utf-8?B?RXRJUzVrNFpvbmNlR0xGOFN5VHc0YnF0Z0FodmloVkdKcXkzSURPK1Z3U2cy?=
 =?utf-8?B?ZTg0UjlkSFhkd1drYlJPMWhrWXVuaFVkdGxqUDZlWEl1L3dwUG1jNFhaNnNY?=
 =?utf-8?B?K2R1YlRJYm5BUVBKaEFPSmtublhDSVNBRkNyelZVUG1UTFhHZzk4QksvVTNK?=
 =?utf-8?B?eEpLeTkrV1hmK0I5c3pWUlRrK1lmTVpzRk9ZNmExSG1oRXFPdWh5K2ZOSExH?=
 =?utf-8?B?RTh6ZHJNM285YzVxY3hkeE4veWRqL0EySGlBdmxqNXNXUE0xV1JUM2RlakVt?=
 =?utf-8?B?L2F4bkJMNC83U3o5ZEs4elpRVXpjbG9yZVBEaGtSU0dVUUhiNHArQk5rV0Zx?=
 =?utf-8?B?K3U3TEFHT1cyQ1pLaHRranhmeTR5amVEcHo5clZFMWNQTHFKblVIaTJXMXRC?=
 =?utf-8?B?ODVBck1mZG5DSFlqL3J1c1lXbGxvOGgxSThqTys5N1RDS2VZa1pUUlQzYXNi?=
 =?utf-8?B?RW1tY3NoWVlqZE1URWZWS1VlWjVCV1ZiQ3g3UjFNaDY5UVFmUmhzeUtSMk5u?=
 =?utf-8?B?WWZyOEp0SEN6VFkwUFNNNnFkM0d3MTdlSHhwYmhITnpUc0dQaER1eEc5b0lT?=
 =?utf-8?B?TXFyd3lsM3FVT2o5U1BoRW5mUXAwdk82ZHVwT1JpQytrRmkzR0Y0eWJSZEJ3?=
 =?utf-8?B?dnNKRThjKyt4YWNJZk1DWGx2SmRxb0hiQ2JjSk5HM1FlSzBES0xBRmNzazNI?=
 =?utf-8?B?ZWlWeUdSTjJTamNZOWhRZkFBd0ZXNmFEZnM3WjBlVk1sSFpScldQVjk2aExC?=
 =?utf-8?B?cmNNTXBtU0VHcVhIMlZueFI3UHFjSkNvVXpPMVd0ZVlNTTMvd3hjeFNOdDZP?=
 =?utf-8?B?SExpVzk1WGw0QUw4M1NUNHpPYldSbzBUbURDZ2VCaTEycm4xWkY5eUc5NW95?=
 =?utf-8?B?M3ZvUTRmMmxDUFRPY1JzcFZQOVVRMHppTW1IQ3FSSG1rcEVMRjdHM1A2OG1t?=
 =?utf-8?B?VTU4cmhBcEZpamhMamZURnlkR0RLQXFHNmFWSVlHSmJIYWJRdDhCMEUrd0cz?=
 =?utf-8?B?TGFERW5oaTdYLzdzb0d1YnYzajI1WXQ1Nmllb0NiamJaOW10bjZnbHBJNjZG?=
 =?utf-8?B?T2RQdkJyK0YyeHRVV2gya0xRKzIrOWxyOUR4YmtIelZzeGZqTnIrb2NJWXpG?=
 =?utf-8?B?V3Q2MkNwQzBiczkwRGdiNXpielFVOGpXa3E4Y202cSt6WGUyQUZNR2dQWkJG?=
 =?utf-8?B?NmNhQjYzakQ1QXMxZE02cnpwV0RGUkhteWxKWVpKK2dneWt2V1djQ0JHdVlF?=
 =?utf-8?B?d2g2V3dibnBNMzBGbXNUYWRleTI0UVFOazM1NnVXdlZPUXZiRWo0eXh5eWVV?=
 =?utf-8?B?OExEVzlsNXc1cC9DT1YwVUFFSnc5UWJoRHptSEU1bGYvUTRpU1VSZmVsOUVw?=
 =?utf-8?B?RTBibjIxU1hNQy94eHdCb3RnWGgySVRudjNUVEpRTW5EdlNONUJ0eEdGNzNP?=
 =?utf-8?B?MENlMWxyN3JoK091ODJIU3NJbVM3YTl2eW1ELzdWemVuU2xRUDlzMjBpNlo4?=
 =?utf-8?B?MlRBdlZ0aEYzZHZoWkdwTnI0ODlsQTR3bGRFWEgwT3VRc1FWTXdWeU4rQmIx?=
 =?utf-8?Q?KUENhqBujA5qcJvawJNSVGq57?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099ddebf-54d2-4eab-99af-08ddbf68e579
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 04:19:00.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbaqbCOyH4dslmI14UmIeNdyTnitUr2oMDb00T7RH3LqfEoBDh6FQT/P83Xz1lmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036
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



On 7/10/2025 1:20 AM, Mario Limonciello wrote:
> On 7/9/2025 6:05 AM, Samuel Zhang wrote:
>> For normal hibernation, GPU do not need to be resumed in thaw since it is
>> not involved in writing the hibernation image. Skip resume in this case
>> can reduce the hibernation time.
>>
>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>> this can save 50 minutes.
>>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> 
> I hand modified the patches for other changes missing from linux-next in
> your base.
> 
> I checked on an APU with an eDP display connected and from a VT
> hibernate does keep the display off now so this is definitely an
> improvement there too.
> 
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/
>> drm/amd/amdgpu/amdgpu_drv.c
>> index 4f8632737574..b24c420983ef 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>       if (amdgpu_ras_intr_triggered())
>>           return;
>>   +    /* device maybe not resumed here, return immediately in this
>> case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return;
>> +
>>       /* if we are running in a VM, make sure the device
>>        * torn down properly on reboot/shutdown.
>>        * unfortunately we can't detect certain
>> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device
>> *dev)
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>       struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>   +    /* device maybe not resumed here, return immediately in this
>> case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return 0;
>> +
> 
> Is this one right?  Don't we still want to call prepare() for all the HW
> IP blocks?  The eviction call that happens in prepare() is a no-op but
> there are other IP blocks with an prepare_suspend() callback like DCN.
> 
> That is I think you're destroying the optimization from commit
> 50e0bae34fa6b ("drm/amd/display: Add and use new dm_prepare_suspend()
> callback") by adding this code here.
> 

I guess this takes care of the prepare() before a power_off(). For the
hibernate prepare() call, in_suspend flag will remain false and it
should get executed. If the device is runtime-suspended already, then
the path won't be taken. Assuming that's fine.

Thanks,
Lijo

> 
>>       /* Return a positive number here so
>>        * DPM_FLAG_SMART_SUSPEND works properly
>>        */
>> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   +    /* do not resume device if it's normal hibernation */
>> +    if (!pm_hibernate_is_recovering())
>> +        return 0;
>> +
>>       return amdgpu_device_resume(drm_dev, true);
>>   }
>>     static int amdgpu_pmops_poweroff(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +
>> +    /* device maybe not resumed here, return immediately in this case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return 0;
>>         return amdgpu_device_suspend(drm_dev, true);
>>   }
> 

