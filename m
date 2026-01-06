Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA0CF9199
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 16:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D246E10E0AE;
	Tue,  6 Jan 2026 15:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NAPqAlvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3CD10E08C;
 Tue,  6 Jan 2026 15:34:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shhGZWTNXlwhI+MWW/ygK5Ty9OQoppK3WnbcLplCY4bJMugnVz99pBQpfT6niYme9L142jecy2ks8UhN/yl43qDv0ZAmQHred8cnFdjvQsg6XtbVksJBh3SHGJCHzKScynjvzkrJ6zXmeL6V8fuaqNZ4h1ZUWQHGkG5D8k+KURFPdBE2+MYu8qKfND/B47lggCAe6HHbbjtikVNrKELzAj4hnBTaFrDKZZR7FR50REz3gjl5avDFsFjvdBA+LHpiP2dQATJD94T5Akb8m18greEyodixiqlRQ1j4zdMd8aIZlLw3AjHR+PcnhMwfizEztsMfqgk6U4V2pPtVV7aBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CwJGzBM1E8ri+kRmRyW2xfXcT658Kad967AHkOoGTc=;
 b=EF5peQcfpjQwzuWyz6QBBZ+8bMr4ph5Sn+buVXRsuU4u3qVBOyxSkF/RggrwqyaQaIoACO0bd6m1nR8mBeBlIRLqOvRRCWCVCehbZ3NzY+MbDUYaXoNQdZDUWW/hQhCtJlyjcDUPL/S51V4fawQaAEUULzjwvwpnl45tDlH0LDuXtYr3VGVQivYwKVs9+VhUpwOnRseqAKJ2DsMHnrs18bXbYRbtTwNq2EwVjFRY9Y+pZEN9oHIIimfj6GBRyMYDAg/L/mKMss03VOLRQUzAzvvR6uVmFcmlZL1j2t5ofI5D1VRaAfQkIhzxQfGhrCN9SuaYP8mc9KVousflur6qNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CwJGzBM1E8ri+kRmRyW2xfXcT658Kad967AHkOoGTc=;
 b=NAPqAlvqvD1G+OIBjVaSEjIp2tJS71NkJG0fKHqyobwatVn35Uc1zFcVo+u9WPFllAfykmkfPJqCAta7J4YeeGVe4jiURMJwTrBAk9ePknq5Q22cHaWH+u1JdbnMQwJnjkcJBRiHJ1xSqr4+9JMxKWwqyhpBOp2wxWNFoQrICIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 15:34:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 15:34:17 +0000
Message-ID: <b4fc76aa-290b-4cdf-aff7-30ccc9cb1f44@amd.com>
Date: Tue, 6 Jan 2026 16:34:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
To: Vivian Wang <wangruikang@iscas.ac.cn>, Arnd Bergmann <arnd@arndb.de>,
 Han Gao <gaohan@iscas.ac.cn>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
 <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
 <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
 <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: fad671ce-fa6c-4428-3754-08de4d390e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjQxSm4zTjB4Yi82VEFvM3ZNcE5OTXZYdnpxa1RPWGcySFlpOXVsOHpFVnFo?=
 =?utf-8?B?QzBreEJMOHBMMDRBdld4aW13NDJPMVdnSFNuV0dsUVVTMkRyM01TaVBxcjRX?=
 =?utf-8?B?aE9XdWV0TkQ1NTN1bGVWQlBra2pBSWtYQXNmYklrbmhUV1ZyRFRyTUNzSjVX?=
 =?utf-8?B?M0F0VTdXczl4SXd5UFdxeVFOSlVpQnhGdTBnVkdLdmovSFBRTzU0L2hyUWJM?=
 =?utf-8?B?aEVpbkhPOXRtNFpsVndmT0N3bmoydW81NEJIb0xLNTA3UTNsWkVxRHg4N3B3?=
 =?utf-8?B?Rm1jblg2UWFXSWtXRlBCSHBUVVhyMzZ2cFJqVUsveGZ3a2tCL0tWdCtpVm1T?=
 =?utf-8?B?c1JrZld6Q1lPZGc0RG15cEczeVpPOCtXMGx5RUZGc0h4UkdleS8zK2xxVEJh?=
 =?utf-8?B?THdMT1VpUUlwK3pWZllaUy9sd3NDNSsraE1INVpXZTROUXdYMURlVmljTlpH?=
 =?utf-8?B?Y2ZVMmFhaUJXQ3NoQmdpblRVVFNwSVJNelY3TmRHVHJDT0J1U0J2TThaTFJu?=
 =?utf-8?B?RnpCOXF3aTJwdzEzY3lNRVcyR0hkeXJyOHNQayt3bmJaUEJhcVdvWUgxdGhH?=
 =?utf-8?B?N1c5MzFEZldBSVNZWFJMWk9qSDhPcjRNRTdFakhPOHhzc2xRTUlCQzc0WnlQ?=
 =?utf-8?B?Q1kvUHZraUJDM3pKTU9XaU0zVFZkVnBLcmhMbWhsVUNTQ2JaR0FrUExpRzUz?=
 =?utf-8?B?YVR2enY5d1FocTZqbGp0TzRyS2FGY2czdWczb0hxcW9vMElORm9yeTVPQjds?=
 =?utf-8?B?anlUNlZ6dFNWRU9xWXl6SThpUGNXdmlncGtMMDU0d2FJaUJFOTJ4Q3kzTUQx?=
 =?utf-8?B?R0wxNWw1YlpkbTBXQlR4NnJQZEx3QUdWaGQ4V3VGTE1qNU9kLzVFb0hMenM4?=
 =?utf-8?B?WWNpSmxDRnVPL3FjZGtsS05YSm12YVVGLzIzOGRrdFg3N2xOeHdVc2ZtNDBC?=
 =?utf-8?B?REszK0MzalNVY0ExM1hTQmFSRFVHOUVUQ0o4dmtTb1NLakZrZkVMN0RlU1Uy?=
 =?utf-8?B?Y2hZNGpwSit5QmJVaUJxNnQwbDlwd1BBVTRlUlQ3SWFpNkxyVHNjU2NYUEhY?=
 =?utf-8?B?allhaC9mMndlVnQrZFFRZk50TGRxNEhjTmpNUGh3OXpqTmpNOUQ3b25PMGJ4?=
 =?utf-8?B?Wk0yZWc4WjBSTGZHeGRLVVQ4Tk00TWIrbVZjcVlnOExDbDRXOEtGbjNpalg1?=
 =?utf-8?B?eHJxbVlKSG1rNjV5bWc3SkUvZXRqQXhHNzBaOXhZS1lmUlJPOUxsWTl2NVZI?=
 =?utf-8?B?SlZXd2hxUnpWc0tKeU1JRVR5TWVwVXRlU1hoeWhBcmVJdC9mbG14ZG8yc25N?=
 =?utf-8?B?R2hBY3FUTGptTmozMEpneVlpQWN1UW5xUWRsWmJIeTA3bVZYeEJ5clI4Tjls?=
 =?utf-8?B?ck5YdlpPaW5ZNGppMnNMb2pKTmlsRGt2RjJvZFRzMFhXMFgwOFhuTTZzdjRS?=
 =?utf-8?B?am1XUGVneTRQL3FHY2xmdmVUM2E5dE0xY1RhVEV2K2FGcHcrTTYvZTB3L1lF?=
 =?utf-8?B?ZXh6Z1hzYVFESWN6L3d0aGtJZEJhL2tIZ0MyQzV1YklOcWd2ajA4dnhud2hB?=
 =?utf-8?B?ck5ieDZJZ1p0TU5CRko3YXVzVEN5MXVoRE5PbGpsM3NWeDlUand2d1drUTNQ?=
 =?utf-8?B?NERtTVUyUEUvbWdsenlBZlFSeVFwNGZwTmpVdWoxdnVPM1ZxMzBiWE1ObTYr?=
 =?utf-8?B?aXk5Z2RpaElmK3RqM3RBWUtxWndtOUNNbjlRWUhDTGFJeTBveVAyVW83UUxr?=
 =?utf-8?B?bm1GYWlKV0NrZHBjaXV2c3BVSUlKVVlNSFR5UUlMMm8wS0loaU5yUC9tR0JF?=
 =?utf-8?B?OTZCZXJNcXB0ZlNGWHl3ZkFvNkEvU2c3TjNEN25xVjdEZXV4REgyRTN2Yi90?=
 =?utf-8?B?aXREaHZkd0xSSVBiNVJUSUlSUk0yME1TN1hyOWxiOStYc0ZReTZkT1lqSmFV?=
 =?utf-8?B?MFRSTnZoYUR5QVY2QnZtRjcxb2lEQ1BpUTJvOVlQYS80QUZ2Vkh5YzBWRnZ0?=
 =?utf-8?B?Mkw4bzQ2K1ZXcUpKVStFN2lLQnZELzJrYm9zR0RIWEN6MzJTZWx4eVRzMmdF?=
 =?utf-8?Q?YmYDAP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmsxcTdSN0hZbUJ5ZHVqVGV6V0FCMUx4eFNja2RrZzNFOHBxQ2RHRFBHY1Av?=
 =?utf-8?B?Skw3d1dEYWgzMEtCTVRlVW9sb3NHVkd1UGZYRStMU1FqY2VzaFZjbldZQUpC?=
 =?utf-8?B?Nk5nRGRMMSswdzZFbnVxM3ErZGFxTW1JaVBManlaSG9ac3F5SE9RL3l1VXF0?=
 =?utf-8?B?Q1M5aFA2bGU5cG53c3U5a1hFQ1lqUVFlSWl2RFB0RjVjNjlQaTBQaSszNVJa?=
 =?utf-8?B?TXhoLzdETjh4b0VFbW52TGVpSUFJUFFkQTM4T1QvcjQ2NjN4bnNLNGdzUU5p?=
 =?utf-8?B?QTMxa2t4YzZLVmNqUFY3cTA5emdPSlZvZE1tSm1XK0ZLZUlFN1k3bk4wb3JN?=
 =?utf-8?B?Sy9NcktBLzczS0Q3dTBoRmZxNzBqZ3E5ejZ2dmFmYnpjWEsvc0hmYVBlSkE4?=
 =?utf-8?B?RCsxQnVER1h3dnZncUN0dVpSYjhvaUdoV0RRdWVQU3oxN0dndVl3SHVlYlJO?=
 =?utf-8?B?SlQ5MG84aVdCRFJyUlgySHFyMzZ1VDhvblJTdnRmSEtiRmFJcDBYSkdoY25l?=
 =?utf-8?B?VzBPV0E3aXlrcG1SelkwQmFYQkFPZWkyZjNRWUFqdXIyNHF5bVQ4YkdwWk9Y?=
 =?utf-8?B?L3JKejR5cnpPalBUb2orc05Ncmd6Sno5Y05VL2cyOHBGREwrTUt4Z2pCa09z?=
 =?utf-8?B?NEpvRlhCMlY4WVg2WHV3MlJ2QytES015enBteWJROGZ1WStaVnJVN25VNmtn?=
 =?utf-8?B?Y2tKbXdsOXF0WmFYRTN5VURCRVc0Mm9RRzlaOUxmOXBHNzRJN0tRc1pXSS9z?=
 =?utf-8?B?S3lXVlhtTkkraVhNUDhHTlVFaWtHeHBFNjh5WXVYRVhvRDlVTDMxRkcrc2JX?=
 =?utf-8?B?Tlo2Z1gwRDdEd2JtREoyYWZ3aGh4REhlblE1c3d5M2JEcXpKNmFoL29HY1U4?=
 =?utf-8?B?NHp3bFMzQW50M1dxcWo0VnNBZ2dmaDdSYmlzRVlLaWlURE1WWnJsNmZ5czBk?=
 =?utf-8?B?T2VMN2MrSCswWDIxMmM2QmVrb25GdHVwcElTTFptdHJ4R0RJdXpZbzJLQy96?=
 =?utf-8?B?VkNYWWRiT1RNMndwSWV4dkRyUXpueEp0NXBOSjJJS09xOXdPcGg3NGxJYlI1?=
 =?utf-8?B?R2xGNElicGNZM3FRdFNvSUJFVExsOHZDZndHVUw0WVova1plcW9xVWYxOGFS?=
 =?utf-8?B?dXdRM1J2U0MyUVFyRndSNmlkeHRPcGVjVmRXMFhCRzY5WkREejFJbDliMXFr?=
 =?utf-8?B?VlhjWlN3Vk5hTUhXT2dHZXc3WnorWEprS1N6c1EyRDZRbnpOR3B1eWdXcGJS?=
 =?utf-8?B?ZEk1NG5nRXdGL2JUOXh6WllwdXc2SkM0MGhsWjIrUmV0Z09WYkI3K0lJQ2dU?=
 =?utf-8?B?WVgvazVlR2N5bHE3LzFpVDIwL0RQZ1VCSUtITEx0ckc3SHBhVHdKeTBKNlIz?=
 =?utf-8?B?RWRBK0E3WkwxcjlxdUdYV3U2RUNHUjFoOFZ4SDltMXJxb2hoZFRrMDk4N1oy?=
 =?utf-8?B?MGdFd1JLOE1iQTdXZS9VNk9XT0Nxd3NITmc0VG9xQnpWVy82YitiaUNySHAr?=
 =?utf-8?B?R2xJeG5PLzBqWGU0NE5IWWVCR3Z5M0VGUXFjZS9ld2FMUVlDUHBud1JIcDBv?=
 =?utf-8?B?Q1B0MzlLWUZiYXNLVStsdWpvYmpkeVo1M2Y4clJoSU1DajlYSDNxQzU5eDBW?=
 =?utf-8?B?MmthTXN4Z3Y3bUQrR1E1aDVxMmZ3eXFHTzJ5T2U2NjgvWlRwUnd1eE9Ga2w4?=
 =?utf-8?B?TmtOdEE5OWQ1QnNTd2lKRFYrQkN5SFROa1lORlRPVm9MalFWRUc4NTNRMTZ5?=
 =?utf-8?B?TFdjbTkxUnZkdEtxZHRPNTZqdkFxWGxFdVplbGJBUmtmOHdQUzJVdE9KSEZO?=
 =?utf-8?B?dlpBVzRBWnpUMWJvNmlKOEFST2NWMUJkclJEdHZKMHJ6OUZIQlVxRXFRNEtz?=
 =?utf-8?B?Zlkxb2IzUmlDVWE3c2FHWXJpbDREUkE5L1krWmkydE9RTkVJQVdWeUlHSm1x?=
 =?utf-8?B?VFFqOWlVMjRiQkw3SjdyWXVLSGdHUnZRVFRTdzBqajVIY0tIMjVtWkZaeWQx?=
 =?utf-8?B?VzJIS210VFZEMVRzVjV2bERLRzBDcUN4cnFtU2pqWFowM0ZpcnBTRkJ0SFp3?=
 =?utf-8?B?eklZYmJiZWtaYitaeHl3LzJDWWZHeG1peDBSektrYlEyaTI0TThNSXF4ZDVM?=
 =?utf-8?B?YWptUkhEeVlGUDZhWWg0T0Y3SzNLUCtwb0pseGI3d2VXY3l4NDZJb1ZweUpp?=
 =?utf-8?B?cXk2dExUMDJxVmQyNGNRU1N5Y09KTjFOQmVYckFHYjZGUDI0ek1pYUdKY1BL?=
 =?utf-8?B?RytDd0FycVVMZFJlSUtJVTVZWFphT3ZHZGpkRTluRGo4YU1vWW9xVlRLSWh3?=
 =?utf-8?Q?d42qpTT22qmHSK7QjV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad671ce-fa6c-4428-3754-08de4d390e0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:34:17.8577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phWRe0D5R8H0m1lA/bTqXk6TkvhxTrxVxI0aJqJMzrJBbaID08YgI+4P0xKOnz1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A
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

Hi Vivian,

adding Bjorn as well.

On 12/23/25 16:31, Vivian Wang wrote:
> Hi Christian,
> 
> I have a question about this 40-bit restriction.
> 
> On 12/23/25 22:55, Christian König wrote:
>> On 12/22/25 22:32, Arnd Bergmann wrote:
>>> On Sat, Dec 20, 2025, at 17:33, Han Gao wrote:
>>> [...]
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c 
>>>> b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>>> index 9961251b44ba..62eb5a6968ff 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>>> @@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device 
>>>> *rdev)
>>>>  	 * of address for "64-bit" MSIs which breaks on some platforms, 
>>>> notably
>>>>  	 * IBM POWER servers, so we limit them
>>>>  	 */
>>>> -	if (rdev->family < CHIP_BONAIRE) {
>>>> +	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
>>>>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>>>>  		rdev->pdev->no_64bit_msi = 1;
>>> According to the comment above it, the device can apparently
>>> do 40-bit addressing but not use the entire 64-bit space.
>>>
>>> I assume the SG2042 chip has the irqchip somewhere above the
>>> 32-bit line but below the 40-bit line, so it ends up working.
>>>
>>> I wonder if the msi_verify_entries() function should check
>>> against dev->coherent_dma_mask instead of checking the
>>> upper 32 bits for being nonzero, that probably gives you
>>> the desired behavior.
>> Again completely agree, that sounds like a plan to me.
>>
>> IIRC the modified code here is basically just a workaround because the MSI control dword on older radeon HW was not setup correctly.
> 
> Does this mean that on Bonaire and onwards, MSI can reach full 64-bit
> space, while DMA still only does 40-bit?
> (drivers/gpu/drm/radeon/radeon_device.c sets DMA mask to at most 40 bits.)

I need to double check with the HW guys and/or documentation, but I don't think so.

As far as I know the bus interface of the HW can only handle 40bits of address space. Later HW generations extend that to 44 or 48bits, but never the full 64bits.

I could be that the interrupt handler block for the MSI functionality has a special handling, but I strongly doubt that.

> 
> If so, checking coherent_dma_mask would be wrong for those devices.
> 
> Do you think maybe it would be safer to introduce a msi_addr_mask for
> occasions like these? We can have msi_addr_mask = DMA_BIT_MASK(40) for
> pre-Bonaire, and then the ppc PCI stuff can check the mask and see if
> it's usable. Probably something similar for hda.

That sounds like it would be rather clean, but it might be overkill.

As far as I know we have exactly one PCIe device (the pre-Bonaire HW generation) which messed up the bit in the MSI descriptor and so can only do 32bit MSI while the rest of the device can do 64bit accesses.

A good part of the confusion is comes because the PCIe spec is a bit unspecific what that 64bit support actually means. The original intent was probably to indicate 64bit address space support to operating systems.

But in reality devices only indicate that they can issue 64bit read and write requests but can only handle 40/44/48 or 57 bit addresses.

It's a bit messed up but that's what it is.

Regards,
Christian.

> 
> Vivian "dramforever" Wang
> 

