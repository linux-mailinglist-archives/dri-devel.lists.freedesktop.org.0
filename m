Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB0B52B9B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FCC10EA4B;
	Thu, 11 Sep 2025 08:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hWDDKdp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A59910EA48;
 Thu, 11 Sep 2025 08:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnixgPJsyDib+hPwP9SVBNG6OYoP9ZQOsLQk8Fonc+J0lJsnyj27xY+H3ji6nb9TI0NF2FEQK/TRqfPF71gVz6QnK7sfIMTbgyYxzu470mpz1jV2W8UwO4+PbA2Erliz1fw3HDhI6frJ+z0kR9plNGXILRvI3At+sVz5zZS/m8TTfmzRUNEStUuKO+bgBK8T6ZK4/AE9xyWlzygG3LvSs/aMylkgvtIEdoNb9nXkZIvDerdrn/5hnxBKZ5tXHUJuvlsAoyUtxYKfvMrWnHerBc/yQg33WWR9hXWorNdtSV5gYX4foNyXqh4LO+jlALvJ4QYBX2pjNlKo0yKi30Z6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bZrUgMo/1WrZCEszaEUON5AJ4xe5KwGsH4FLVRng7s=;
 b=Bnl0aVOgjvomWcpoPiAiFLdrWOZZR9fsLhAsXtGNm4LQc1N4onFuqyxNt3TNq4GYwMDyKzQXe2MqVbP3IRZ8EDnS5V7Mq/oBhJcwhaYuDt9r8+ovpTFNxDFdZV08ES/Gg75iCy+T8NQBQND+KHEPZ6Q/ZGDKrBHwUQOiEDLTkD/8lUmFfh+0nm6Ei08HhN2AXYV4reGB+1sBBHqqII6xsCrQXsxreuoKlJltfbVEYL05Ye+XW/uNNakAEjmO5OWQw70LEcNtvvp2rbi2pSxjXEx61hQtM9PW0b9ZJ/aKexP649VVn8W3wpgDFgLFvKQOeeQG0JafU3BzkDKmXP+V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bZrUgMo/1WrZCEszaEUON5AJ4xe5KwGsH4FLVRng7s=;
 b=hWDDKdp43T+9Jnz3wmuUT8yss0poaUfaTmCLNpoeOobwS3SerwezSKKX66JNu+Emp/6lP3bsX37hRnPp18Fs9OFp0ednCe8uPzMlYNbNXwDETdk/gR/eSxbD3Rzh/0iLPWMTwVbl7qYohtqGIFM+qkbgAwtHprrzIOB20RL1HQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:27:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:27:20 +0000
Message-ID: <75167aa2-d974-44ec-9aa5-1a18acdfc091@amd.com>
Date: Thu, 11 Sep 2025 10:27:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] PCI: Add pci_rebar_size_supported() helper
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
 <20250911075605.5277-6-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250911075605.5277-6-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: afa7eeca-cf48-4092-cdcc-08ddf10d0660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDhVV2xBSkgzRzE4L0hrcFIrTk5Oek5KVTMrTGpISE5ZelBTSGVsVTV3M1Rl?=
 =?utf-8?B?WkI0a3VBSjRndnoxTDBWcFltb0JPS3EvSWlBKzJQcDB6Ym1FWnVpVzNNdVdj?=
 =?utf-8?B?b01Pa0xocmVGTTBRUmhHTXhveGw1U012RHRhK2huelFNVTNJL0FRYjhrVEtp?=
 =?utf-8?B?aCtWcUFaVmVzWDg3RmgwY2xWTWUyV1U3dFluQkRXaEo0bkJjekswdGtpb2F6?=
 =?utf-8?B?aGlPeFd2Y1VnLzVUZHYwdXJJaytneE5LY3dVcEJRY1ZFblhjdVIzcnZKOTBG?=
 =?utf-8?B?TkpKaXhHVUZSc3I1dHdyeGxIbmNrQnFPSlp4WDBCaFk1OXJKRDUwYWplYmlr?=
 =?utf-8?B?TnJ5MWlqRDZ5Z2hKeW04Mmdkc1djVXZxZGhoeFBkdDZrMElWTlQwSnlFc3dl?=
 =?utf-8?B?ZnM0MDVMc2oweVlIY0F1NERjNGd2cHFvMjMzcW9QMHAvZjRKSTdEclhnZEFk?=
 =?utf-8?B?TVdMTVlUUWIzTzNBV0dWWXk2MzVyOTR1ajYxUkVtSmFrd3pXdzlmeDFjYkJk?=
 =?utf-8?B?dHNiMXg2Z3BZVTFONDhjN0M5QUR1M2RJa09uZ3hiN2RMdGxMK2x3c0puNGkw?=
 =?utf-8?B?UnJSMHo4T0doam1rbnp3NTA5aWVPYXJrU3g0NzM2RTdGWFRUQlhCY1VXSFkr?=
 =?utf-8?B?K1lLc3JEV0l6bDJEUG5YL2tYMURHWTVPcWczYWxSa05FZU1KeitGSjBsNnlP?=
 =?utf-8?B?MEdValdjME1XOWtIc0VwU0VpQ2traWZJempZNVF1VFJmYWo0UmdLSzN0VTNj?=
 =?utf-8?B?bThoK1lobVRoYUxhNzRQRVNQUyttTFZwbEwvaFluTFg2WFJZYStyZnBnOXh4?=
 =?utf-8?B?UU1UNnpTdVpoOG1MMEwrRHJ2OUwzNTk2bDdlZE93amlWTnRSWitFbnRwenhG?=
 =?utf-8?B?b1BTK3hzdmE5Y09vVnU3MjN1VXYxSjlQUWY3UDZEaGtRSGR2czFwUTR1NHJM?=
 =?utf-8?B?OStSQUliNnFkRjJUeXZDNW1wZUZTeWt3cmROTERXbmR1YkZTMCtlTDFIWjkr?=
 =?utf-8?B?bk02MkprbFFlUnJqTjhudlM1bjRKTmRHc092R2NOZ1ZpUlNRcmpSN2N0VzE2?=
 =?utf-8?B?UXdXbis0Y0wyWTNpMllMRGdkWWRQMFJFWGExd1hjUXN1L1U0OW5LMTlFSjlY?=
 =?utf-8?B?TC9iVXBleXI3SUlIdjhYOXBsNEFhQU1KazUvZHk0eTVlMThjTU5wSnl2VCsx?=
 =?utf-8?B?bXJmaDRtZFc2SnViRnhhWTJVbTFTOTg3d3RHei9MSlVUNm9hcDFyVXNvSkNq?=
 =?utf-8?B?clR0T3FjZHBaZWZjWlJaSXQxNng3UUg2UFE3UWdab09BMTZTbk1PQjR3Nkh6?=
 =?utf-8?B?eENua0QydjQwaXBuQmxKTDJid084d0JJVjRrR1RGd0dudEtZR2FmUDRmMitx?=
 =?utf-8?B?a0hvWHl1dThUZUdQbUtuQUNUSkFPM1k2SDBOZUtnaXViTEIwTUZYaVI5WEUw?=
 =?utf-8?B?aUxncjlTTXZBbmd2dnd4dmJsWWQ4eE4wZDB5d3d0enl2ak1ZSHY3ZmJRUEJs?=
 =?utf-8?B?dUltUVhIZklHa2Z0c0RxNFU2L3RZTU0ybEhYcXhtWnlNODRVbG80UHJuaGxm?=
 =?utf-8?B?NSs4cHRjRlpDazFERDJrKzBKNFJHcnQzcThGUE05Q3IrYWhtSk5RSHpoMEpY?=
 =?utf-8?B?RVF6U0lPWUFqcFFrTTkxL2xGakpESDQ5RU1Wcjk1eDBVSUVDLzREUzZIWllE?=
 =?utf-8?B?Wjd1aDVLWGlKc0wzSTFMNkEwc3BlcE5GaEd4Ukd3dEhpZEp6angwMDZKTWh1?=
 =?utf-8?B?VE5xc0RYZzVvYVBKVWxaVlVtbjYwZGU0V1h2MWJtREUxdy9Db2VBZDZvQkVY?=
 =?utf-8?B?c1Y3dnF2MWE3ekhjR1VVQU9YaGhLclhhZjVMaUwrTldyckszQUhwZnpsRFRG?=
 =?utf-8?B?NlhPZzNYa21tU3FGemdaODIwTzlvTURiczg2Q1k2ajdoUG14aG9HVE5DTzRY?=
 =?utf-8?B?ai9YRHpxTmpYK0lyNWc4L25ramtrblduWUFqNXh3RGZaZE1MSVNjWTFaNGYx?=
 =?utf-8?B?Uyt3UDhCQWp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDVEV0s5UmVxa0IrN094UERyS2hFeGQ1MVFjWG1BUmhFVS9nWTBhb0NSUnBO?=
 =?utf-8?B?RlJkWFFoOXlVSWI5bk5lbEswTGQvVjlEbVZzaStsdUZjVjFESmxRR1lyUTRW?=
 =?utf-8?B?MkRQVit6R28xRXc2bDYwbjVxNElOU0R2a1ZkR1NRSDhLL0s5SnYxazZ4MFJx?=
 =?utf-8?B?OE5NVXlpcTVkU2NVZTNlT2J5UkNlcVg5Tkpsc2VHbnhIc1QxMDJ6VUFRQjh2?=
 =?utf-8?B?K3hzSlB3bE0vVzlFb3U1TFh1UmVZQVZYUlI0c2FqblZrajM1bU53Q0NVdjBC?=
 =?utf-8?B?OXY2M2h5L294YmEvZGthZklSd3ZLZXhRbCtaZEM2YldacDY0MkdURGlDcGVB?=
 =?utf-8?B?NlduK0k1dldOaE0rK0VJRDJVNnQwdlgxN0FuSlhCb2g5dnNPaEdid2pIQkhD?=
 =?utf-8?B?TUd4UGk0djFpZkxTUVA3ZmZyTFJRcW04Q2E1bkF4U2h0WE5jSFh1QlJMUVk3?=
 =?utf-8?B?TXd5eWJMU0FqM1VDUC9EWWkxNUZNUUJvaUVtK3RVWmFSZjk5M1RKWmNkQWZk?=
 =?utf-8?B?ZlNReHdVZG1JT0xIMXUwMlQzeFZwQkczUjV5L01XR0xzNCsyZnlYc21wclA0?=
 =?utf-8?B?RWlRank0NU1JM2hNcWtmZ3ZQNzFrNm5qSkNUSnFCbUM2OUlkbGdiV3cxN3Uw?=
 =?utf-8?B?ZzJRNmNUc2pWbXgrV2FEeXFOeWNrUUNqaUNqa2c2RjVzWEgzK3lxVzN0eXZC?=
 =?utf-8?B?U2pYbUxlTTlPME11TGc2RG5OZFdkNkdsR0dFV3hqejVlYWVzZ1dOZ3JHaFFN?=
 =?utf-8?B?RDJrTnk2STB5T04yYUVSeUU5ZUFhMWJwenhaYUlTZlB0NlhTU2dPZlBjN1l5?=
 =?utf-8?B?WDk1QjBZUEgxS1FXd01idllDdDZZTjh4eWRYUzFmRmtyK2dxM3AwMmt0NmZw?=
 =?utf-8?B?VWR2SHhwamxjNFRVRlhLNXY5eEtIVncxOWsvWUlBRWlKM01yTHlzeWlBWTZN?=
 =?utf-8?B?a1NDVXJ0UThUTXNwNk1YSzNJYkdDaUNwYVlZSHRUZUQwTWFwSGtudmFvY3Zl?=
 =?utf-8?B?dlF6dUZhRDV0RHJBczdSRFhkMklnRmJyYjRlUmFLWldINXZSQmRXSGxUUldI?=
 =?utf-8?B?N3Rwa2wvNWoydVY1Q1ptUk1EU2JlaDlDUzZydFNBQlEwd2VuKzNBNWpEZlUx?=
 =?utf-8?B?bDk4Z0FrVXF0dWpPRVI0K0pUTnYyUTR4azUrRG92RjhVZkdDK3VqU00wbkx0?=
 =?utf-8?B?NTFZQ0pLaXB6SzE1VkNFNUpRb2lweGN3UERZSFphQVFuZnBud2kwbDMvQ3I1?=
 =?utf-8?B?WDNxRUJBMWJjZEgwSlZiSk1hTHdFeENzSjlkQTVVemVvTnRtTkVTL2N2VXht?=
 =?utf-8?B?OXQxMGN2WklCSWxab1oxQkN6bTNUU0ljQ2hjVUdjNUdDYVNhWmkrL2tJdjBl?=
 =?utf-8?B?eHdPQmI4UENpNlBCVHF4eSt2TzNWN0tNZ2M4Y0JCQ0g2dlRibGlRbzQ5VFVX?=
 =?utf-8?B?VVRoSWdDdW8wUkhDSkZZc3MwKys5dHoxcEh4UmhJa0llS2pPSFMvOE1VYXJM?=
 =?utf-8?B?S3VGMUQ4eU5GZlFNakF6eU51UVFhZHRUREk2V2hEYnVxQjFzWnlzNHBERU5a?=
 =?utf-8?B?UEd5WDBIditqclZhazFOb0hZWjBoTGNNakxKNUV6Rk95V2FNMlVjS0U3Tnhj?=
 =?utf-8?B?V09mNUNmSGR3eWpXUXFsM2QxY3hYMTdCMnQ5ZzE2V25RZ0lPdm9iTjgrQ0l5?=
 =?utf-8?B?RmxpeVZad1ZvbjhvSjhXUHVyTkg4SHNQWlF3UU80Zk13ME9lV1gzOU83UmNM?=
 =?utf-8?B?K0ZVUUUwUXgzNDVnVm1FR1ArVGJNSW9KZEJJY1JKNk1Wd3lHb0FLeS9uc1h3?=
 =?utf-8?B?V1pXT1dpUExadmRJekVHdUVYUTErMERCVXJaVzR1ZStwL3lpOEYrbWh1Niti?=
 =?utf-8?B?QkJlaHZvUHcyVEZ6OU04WHdiYTduQmpqSHV6bGJobEdtL3M2TzNETGZzbktw?=
 =?utf-8?B?UUc3VUs5T3k4VzJyL0kvZHNGQzVyVWlyKzNhUmV3NDNZSFlXUTR1Qm5COUNs?=
 =?utf-8?B?WmtLYXpad04wVm9zWHZyNDlsVm56bTA4M1JVNU9ldGc0aGtlRGFnVzBtMTBS?=
 =?utf-8?B?Mm5IUnpDVWIzTXJ6clpiNGVORHgxbnhKTkM0MEMyeENPd3h5N1M1STg0bDRE?=
 =?utf-8?Q?3OC6KX+cSZ/txQbWGNETxqI3k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa7eeca-cf48-4092-cdcc-08ddf10d0660
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:27:20.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zavgvwyEtNkbFPUFbBX/pgMnIui22wqT/XAHzjcl6D7V5hwmSiX+mZYMiixWxVPE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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



On 11.09.25 09:55, Ilpo Järvinen wrote:
> Many callers of pci_rebar_get_possible_sizes() are interested in
> finding out if a particular BAR Size (PCIe r6.2 sec. 7.8.6.3) is
> supported by the particular BAR.
> 
> Add pci_rebar_size_supported() into PCI core to make it easy for the
> drivers to determine if the BAR Size is supported or not.
> 
> Use the new function in pci_resize_resource() and in
> pci_iov_vf_bar_set_size().
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/iov.c   |  7 +------
>  drivers/pci/rebar.c | 29 +++++++++++++++++++++++------
>  include/linux/pci.h |  1 +
>  3 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index ac4375954c94..51844a9176a0 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -1334,7 +1334,6 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
>   */
>  int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
>  {
> -	u32 sizes;
>  	int ret;
>  
>  	if (!pci_resource_is_iov(resno))
> @@ -1343,11 +1342,7 @@ int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
>  	if (pci_iov_is_memory_decoding_enabled(dev))
>  		return -EBUSY;
>  
> -	sizes = pci_rebar_get_possible_sizes(dev, resno);
> -	if (!sizes)
> -		return -ENOTSUPP;
> -
> -	if (!(sizes & BIT(size)))
> +	if (!pci_rebar_size_supported(dev, resno, size))
>  		return -EINVAL;
>  
>  	ret = pci_rebar_set_size(dev, resno, size);
> diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
> index 64315dd8b6bb..735d9afd6ab1 100644
> --- a/drivers/pci/rebar.c
> +++ b/drivers/pci/rebar.c
> @@ -3,6 +3,7 @@
>   * PCI Resizable BAR Extended Capability handling.
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/bitfield.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
> @@ -124,6 +125,27 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>  }
>  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
>  
> +/**
> + * pci_rebar_size_supported - check if size is supported for BAR
> + * @pdev: PCI device
> + * @bar: BAR to check
> + * @size: size as defined in the PCIe spec (0=1MB, 31=128TB)
> + *
> + * Return: %true if @bar is resizable and @size is a supported, otherwise
> + *	   %false.
> + */
> +bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
> +{
> +	u64 sizes;
> +
> +	sizes = pci_rebar_get_possible_sizes(pdev, bar);

> +	if (!sizes)
> +		return false;
> +
> +	return BIT(size) & sizes;

Checking size for zero first looks superfluous.

Regards,
Christian.

> +}
> +EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
> +
>  /**
>   * pci_rebar_get_current_size - get the current size of a Resizable BAR
>   * @pdev: PCI device
> @@ -231,7 +253,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>  	struct resource *res = pci_resource_n(dev, resno);
>  	struct pci_host_bridge *host;
>  	int old, ret;
> -	u32 sizes;
>  
>  	/* Check if we must preserve the firmware's resource assignment */
>  	host = pci_find_host_bridge(dev->bus);
> @@ -245,11 +266,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>  	if (pci_resize_is_memory_decoding_enabled(dev, resno))
>  		return -EBUSY;
>  
> -	sizes = pci_rebar_get_possible_sizes(dev, resno);
> -	if (!sizes)
> -		return -ENOTSUPP;
> -
> -	if (!(sizes & BIT(size)))
> +	if (!pci_rebar_size_supported(dev, resno, size))
>  		return -EINVAL;
>  
>  	old = pci_rebar_get_current_size(dev, resno);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 6f0c31290675..917c3b897739 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1423,6 +1423,7 @@ void pci_release_resource(struct pci_dev *dev, int resno);
>  int pci_rebar_bytes_to_size(u64 bytes);
>  resource_size_t pci_rebar_size_to_bytes(int size);
>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
> +bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
>  int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
>  
>  int pci_select_bars(struct pci_dev *dev, unsigned long flags);

