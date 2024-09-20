Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB3697D3F1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F3310E06C;
	Fri, 20 Sep 2024 09:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s0ZPmlhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAFA10E06C;
 Fri, 20 Sep 2024 09:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/lOk743h5Txm4fkKEv+vHBQQyBh+g40+7xKYzJN+haat6+UsCXxyKKJOqQuAw7cBCCUrpkj2fRnu8/fJtg9q0f4lGzaGC1Pnfz1QJxwnLuYudQ8PNHh0T7T52q+DVb/wjbiuOTLK0ld0cMe0cazl3ftP/uCWxEZzpG5OfJhOryOME7qmYPZYS5+LVE7hOOmtHn9rvwnYLO8gNKLSVCuqFYMET+rq9p0G0TYYRaX+k+p0CcGO78gW6Nuv1BkShHUoFF6p3S4okGfpf1Pj1jjQKUIFcZeJLGcOdMDMXdbbLWPbQtU91BeDwnGo+92/gHbCasVCscn5r5oSDXAjYXDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61qMzP9iVslx33iMVTuXK1dCaibDXpSbQ7jDxA1/7mY=;
 b=EGwjC2eUASXcabB8SGzan8w79Vg2YyA9KqIvmcZUDQ/gfECaCwNDMt/3JjxSgPIACgLD8Co7vUIxvbExYsgB26/qOOt+emcAcNYkGGgIzFY1CZDAW+CKvLc8UrT+DXChLTtKrXoqS5suH+wlzkT4Fxs3BMCh1wIYisUAjkoUNmholIAH3Fp7+hT87kHFb2D4eSF70CruydjFbexfql47p0gQXOuAyybzRKpJ15wm0DZ0S7foSMhtU+q/fEEpSXHZ8LLKhrC4TylnUZ/T37GhrEFmgoPGhAbDO+DRettAWH2Gf3FZ1N+5hnSUEgM/8NqPvTp+gtQNoF2yT2dISNb2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61qMzP9iVslx33iMVTuXK1dCaibDXpSbQ7jDxA1/7mY=;
 b=s0ZPmlhejf4vy6J0EAWSDk0c1T0vN0EFCcyA2JDn1+AZfqjmH1H6rgNcQ9MBdMhCcPAMkGMQtqzVCZTMcjsRHH9sihUsia9SIoVpmSpxABVAb6j2W680+huAdQ7RqyFMTqwiC3CiKHDmAHTj87E6xm1AiQDXiN6PLi9JFibUeds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7916.namprd12.prod.outlook.com (2603:10b6:510:26a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 09:57:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 09:57:42 +0000
Message-ID: <15a36075-2800-4274-a404-402ceafde5a0@amd.com>
Date: Fri, 20 Sep 2024 11:57:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] PCI: Add support for VF Resizable Bar extended cap
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-2-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240919223557.1897608-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: d2257a16-cbf8-4bc9-c2ae-08dcd95aaade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0ZmOVdhUGZiQXRRWm9obFhLSEtJVWZDQWhXVU1MRHlHa1hpNUl0a3FXWTNr?=
 =?utf-8?B?SU5LRUZwOGR5QjJZczlYZ2RxMXN0dS93U0lSZmxhVXV4elRQc3BRUnVxZE11?=
 =?utf-8?B?NkJPclpsNUs1NDRWTkJGdnBVOUZBcjFqdmZFYTJUejV4QWw0MmYrNWd5YUhl?=
 =?utf-8?B?TC9pWmpaSlpIUDZNQWpzbW43T1plS2VkaXZqWE5IeEJ2cnU3SGQ2N3UyTFhD?=
 =?utf-8?B?S2FhblFYd0tsWC9MU0NEQTh6MHN2NUl4b3lsZGhsNE5Qc0xFVy9HMEJJRnQw?=
 =?utf-8?B?NkNON3gveVN4aUt0VStncnE1ZXhianRBUkpFR1drbUlHZzhRQTlQNjVnQkNk?=
 =?utf-8?B?L1J6aTEzbDlkTjJuKzN0Z0N4bzVDQ3Y2T2NBUHprd0srNzdZaDhRazN3SlBo?=
 =?utf-8?B?Y0Zzbi9kaWRNNEwyMk1YM0JqR1dBSVlOdDMvTld3WGNnMGZ4TXZVTVRBVHIx?=
 =?utf-8?B?TzQ4NlpoUkdLckNkVE9hZ3BtY2Z3ZXNFWUNrWWJlU0ZON2JGVnpuWDdlR2Vj?=
 =?utf-8?B?SXQxTFBKWm5zOUdJblNWMW51NWZQOXJWTGlMRkJPOXUvemdFS1JvSjYzakxt?=
 =?utf-8?B?ajV3T3RMdVJnOU5ES09nY3Z2T2dETWJ5RlpyR1pPRkpHZlh0emh1bVQzc25J?=
 =?utf-8?B?Q3FwMTBvckhVTDV4aG9ldWE3Z3hsU0ZUdkJMNGJLdCtDdDNlakN3MDZMNnB3?=
 =?utf-8?B?TTJLY2hScnJUOHF4ekpsb3hNaDUwZ1RyRnpqelorNGptTVVZWm83a0FuL3Ro?=
 =?utf-8?B?dS83QjRGeVp1R3RBRVozNHNTczljaVdyeDhUR1I0NjJkV1NiZlBQbE5SSmF3?=
 =?utf-8?B?UEdvQkt1QzdtU3pVQ09CZlVuY2Q1NC8vcjY4R1c3NStsMVJTTU1TYjZ3NFJT?=
 =?utf-8?B?NE5jZ2NRSGs2NENneWh4S0JOTkx3a3p1bGdrK1JGZ3RnNHVKaWNhVEtEOTNC?=
 =?utf-8?B?V2VpN3c2TFFGSDI4dnJ0K2QwNWwzQm5ZZmJVcVRhajJSYTFmSDd0Sm81K0lx?=
 =?utf-8?B?QWhrZG1jZjBtVWRRR0JqUHFoMlIyNUZYTXQxSFFhVEd4Q21ibG9aZlEwZlVL?=
 =?utf-8?B?VnF2d3ZiK2k1SUFuTlpzZXJKZkFjRXN5dy9ob2lLc0VtZHczUGVSOHZETHdY?=
 =?utf-8?B?a3dPaDR1MGNiTlVwTjVxSVY0ekJTZE9rMW43TExqSXpzUThLZ0dwT25yMkxX?=
 =?utf-8?B?bDJqZmNQRUJkTlFnQm4rSmVSQlVjTTMxMXR3ckNtY3RpM3JQdUVVcUtiaUNX?=
 =?utf-8?B?aTFKK2JxL2toaUVXRzhqMGU1UmQyVTZqWDRCUTAzZFBzUG9mbzc4Q1NIYVMw?=
 =?utf-8?B?OEsrOFJuMGhWWkVkWjBvcHY2VkFrczl5eWJjdlN4dTJjQ1lBRU1RZ2xBKzFF?=
 =?utf-8?B?WHROR3o2ZXdQTFNGWXlvU2syMnpLZEZpZTlBeVFzRVJsNHZMTU1Eb0NFcEt0?=
 =?utf-8?B?MDdWZjJTWkJxcnNFTGhjVHRCVERaamRWZVNEbzZxdUVaSThBZkR6M1RGYWx3?=
 =?utf-8?B?RWFZZlM2SVJ0RE5nVlpuSFI4ZCsyeW9kaXFVMTM5TjBlZElyeEtYbWwwakNV?=
 =?utf-8?B?Q1JMMk1LZXh0dEpFekx4VlgrZDhZTVY5ejhZMmtBZmxaNHQ4TE15dXVNb21S?=
 =?utf-8?B?TG9sMi92dFVOc0plcnkvdHVFNlEvY1REYTlkdFNTTXRvZ1Fmc2FVVmxSMVhX?=
 =?utf-8?B?cm1JZnZLQUs5Rzh1VWs2SVNHUitrK3E5NnBVRnVES2FDNTBaaytlS3NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGp5MGR3cFdoTytmZFRVRHRBc2VWVlpjckl1amwvbHptQk5FVER1UUI3NGFt?=
 =?utf-8?B?WFpDWVFBcUFUZWM0WU9SR2VjbDBlRVgxSklJVEJ1MUNXajlMVCtiUFU5YnJT?=
 =?utf-8?B?dE84bzdSTjg0b0xxeUxrNTQyMmNZY3FSbXMvK09FR0oxK1RIUjFEN3JIZC9Y?=
 =?utf-8?B?SnpRdjBHckd1bVU0QzQyaEcyY0xRWW9PeG05RW1scEltcWJBUkJJSVhuSDU1?=
 =?utf-8?B?RFhpek8za3F3WGx5aWc5cmp1dWJJelJHUHNVSW9aSXFETnR0M1ZYRWM3cWY2?=
 =?utf-8?B?M0dFckFEM2l0RnpkTnpHSFZOMU9Nb0tpSHlxYi9QcFR1Z3YyTnNPbFJxdCtn?=
 =?utf-8?B?ZlhaV2NlL2U3UEJwNk9BS3pWMkJMNlVNVjhVVFRhN1JRZWM2aUJHdERSd3FG?=
 =?utf-8?B?MVUvOFFnaXMwZGE1cEk2VlFoMWVaOFhYRFoyME9zYVJ4NklDM0c0N1lZMU4w?=
 =?utf-8?B?M0xidEpYamZLM1BUMXRpZmhNWEpENDIxZThrRGRwSmxsa2JNY05rbnNOZ0RH?=
 =?utf-8?B?aTBLa2wvdkVYZi90WklqWXlyRXRFNkxGaEJnVUY0eWhmQjgvWTJYeE0xdHky?=
 =?utf-8?B?ZFRHZGR2V29NWHhzOEVMTEM4Z0ZBOUtzZFZ4cDJOUmgzYzBJdURJVzE5Ulp2?=
 =?utf-8?B?MG9vaERMR29aZklwL1ZENTVwTFpHdis0MnJTQUVKdnpLOTQxVTg3ZzhMb0FV?=
 =?utf-8?B?RTdTYkMzaGFSbjhXbTBOVFd5YkJoNUNqSGNTaFAxclBaTThZZ0JsSlNOODRz?=
 =?utf-8?B?TkRFY3QxN2VQQXQwR3hUaEZYSFUzYmFlcVVLOVY0dG5SQm5ZeWQ0RE54TVNW?=
 =?utf-8?B?ZStHMHkvdktIY25ZSmFZYUpzMkNKc3lFQTQ1Wi9sU3Y2cVM1bGNyRG01UlNC?=
 =?utf-8?B?WUZmaWsxNmIyNGVFQjRFQzErbW1yMGl4dXlCRFpkakJvdmZNMHhEU2t6cW84?=
 =?utf-8?B?NllWK1ZOTmFXVld6b1V4UUhWTTBESTJVTU1NQXBaVDdsVWFiS1ltb21Rd1Ba?=
 =?utf-8?B?MzkxQ0c0Sm5aZnQxS21SbTE0VmV0VUFaQzlkOUF3N20rRmp3WCs2OXpJYloz?=
 =?utf-8?B?U001TzVsaVV5cE9jRXQ4bE1RTVhlUjh6ajFWWE1xZnNSSDg5QUx1QnFIQ2Vl?=
 =?utf-8?B?Ky9hVWZNSXE2MkkvOFFkc3I1UHZVZjRxNm1hejVabHMrdGlaQWlxUG1FUHE3?=
 =?utf-8?B?RitINW81NnB1cUIzRDhOUDFLVUFvWlg3YXBVSW5LazVlSmhmZTNaZnBQRFBX?=
 =?utf-8?B?MW9pMStqRkt5TUdjbURNR2I4ZUtKRENUbHNJMEcwc0xKLy9QeHRDMlhUeVlK?=
 =?utf-8?B?cG9QcWhzK21sdGpLTU9MZ2xlUGFMWG1qTnVqQU05clQyeXpZSG9rVEV1MC9D?=
 =?utf-8?B?Y00wQk05ekdaaCtQbWthMitoY3M3QXBEU0xUdGVsNVNCOUc1VGJZelhiK3l6?=
 =?utf-8?B?STlhVnp0RkpPMDhoeHdYdEJkUm8raHZybyt0VjRVQVhESm5CRnZtSlR3WW1q?=
 =?utf-8?B?ZVdNcjdrbGwvMGtWWmttQkJ0aGltY2lldG43RU0rbldzVFI1WDBlbnVVL3da?=
 =?utf-8?B?ekNScHVudUphNWVYUk1hWlBmWDBmTXg4SjRYbjdlaisxZjVrRG9DVGFJMHpV?=
 =?utf-8?B?Vi9ReUc1dTVTakQ5RysvNnQrYVRPT01VcnN3dG03eUNHdldOaStDZ1IzSThn?=
 =?utf-8?B?b1hzeVA3WUpjaVYxTkZiRUh2VXYyakhWbi8zNm9tRFd3MmU5d2JQMnlDaDBH?=
 =?utf-8?B?TDFqWEowNENxZWIxWlZVeTkxbDVCZlBWZXBrNmtpVk1HOXMwamZHMExSSzh1?=
 =?utf-8?B?RXMwYU1qRDVETi9OYnBTbkVnR0pocEpidmVoSTVSalpRaWVqZFEvYVVTbmpz?=
 =?utf-8?B?NWdsdDY0YVBnZUtOclBqeWVIbGJ5dUJmMFFUeUxjaXRQcG4va0xweHhqZDNy?=
 =?utf-8?B?cjd4WUtWOHhBWDRCYkxQSHlRVkl0Yi9RN3NjU2lWdThOc05USWdPd0Mwelht?=
 =?utf-8?B?d05SeFVxUjc0ZVNOSnFaSU0rWERkbktReDBtT3Y1cjM0azMyQjN3ZlBURmFy?=
 =?utf-8?B?TTdJU3RRT3g5bW94bHhPTEVESkc4V3N2RDVSd0Y5dTNJa1dNUVZkNVFUaDYx?=
 =?utf-8?Q?UYg4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2257a16-cbf8-4bc9-c2ae-08dcd95aaade
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:57:41.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNLPfDc20R3drrfv0jE6Zvru/Mj+YDgJO4LWurgP5KNi5Fe3Y0hEcDh4sGhxP1O7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7916
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

Am 20.09.24 um 00:35 schrieb Michał Winiarski:
> Similar to regular resizable BAR, VF BAR can also be resized.
> The structures are very similar, which means we can reuse most of the
> implementation. See PCIe r4.0, sec 9.3.7.4.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/pci/iov.c             | 28 ++++++++++++++++++++++
>   drivers/pci/pci.c             | 40 ++++++++++++++++++++++++++++++-
>   drivers/pci/pci.h             | 14 ++++++++++-
>   drivers/pci/setup-res.c       | 44 ++++++++++++++++++++++++++++++-----
>   include/uapi/linux/pci_regs.h |  1 +
>   5 files changed, 119 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index aaa33e8dc4c97..e8ccd2ae0f024 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -153,6 +153,34 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
>   	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
>   }
>   
> +bool pci_resource_is_iov(struct pci_dev *dev, int resno)
> +{
> +	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> +		return true;
> +
> +	return false;
> +}

When you want to generalize that check you should probably but it in a 
header and change the existing checks in pci.h and setup-res.c as well. 
Otherwise I don't really see the value in having a separate function.

Additional to that please code that something like "return resno >=...." 
the extra if just increases the number of lines without adding any value.

> +
> +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size)
> +{
> +	if (!pci_resource_is_iov(dev, resno)) {
> +		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
> +			 pci_resource_name(dev, resno));
> +		return;
> +	}
> +
> +	dev->sriov->barsz[resno - PCI_IOV_RESOURCES] = size;
> +}
> +
> +bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> +{
> +	u16 cmd;
> +
> +	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> +
> +	return cmd & PCI_SRIOV_CTRL_MSE;
> +}
> +
>   static void pci_read_vf_config_common(struct pci_dev *virtfn)
>   {
>   	struct pci_dev *physfn = virtfn->physfn;
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ffaaca0978cbc..d4522e365e7ba 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1901,6 +1901,35 @@ static void pci_restore_rebar_state(struct pci_dev *pdev)
>   	}
>   }
>   
> +static void pci_restore_vf_rebar_state(struct pci_dev *pdev)
> +{
> +	unsigned int pos, nbars, i;
> +	u32 ctrl;
> +
> +	if (!pdev->is_physfn)
> +		return;
> +
> +	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_VF_REBAR);
> +	if (!pos)
> +		return;
> +
> +	pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
> +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> +
> +	for (i = 0; i < nbars; i++, pos += 8) {
> +		struct resource *res;
> +		int bar_idx, size;
> +
> +		pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
> +		bar_idx = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> +		res = pdev->resource + bar_idx;

The variable res seems to be unused.

In general I think you should split up the patch into restoring the VF 
rebar state on resume and implementing the new resize API.

> +		size = pci_rebar_bytes_to_size(pdev->sriov->barsz[bar_idx]);
> +		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> +		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> +		pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
> +	}
> +}
> +
>   /**
>    * pci_restore_state - Restore the saved state of a PCI device
>    * @dev: PCI device that we're dealing with
> @@ -1916,6 +1945,7 @@ void pci_restore_state(struct pci_dev *dev)
>   	pci_restore_ats_state(dev);
>   	pci_restore_vc_state(dev);
>   	pci_restore_rebar_state(dev);
> +	pci_restore_vf_rebar_state(dev);
>   	pci_restore_dpc_state(dev);
>   	pci_restore_ptm_state(dev);
>   
> @@ -3703,10 +3733,18 @@ void pci_acs_init(struct pci_dev *dev)
>    */
>   static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
>   {
> +	int cap = PCI_EXT_CAP_ID_REBAR;
>   	unsigned int pos, nbars, i;
>   	u32 ctrl;
>   
> -	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
> +#ifdef CONFIG_PCI_IOV
> +	if (pci_resource_is_iov(pdev, bar)) {
> +		cap = PCI_EXT_CAP_ID_VF_REBAR;
> +		bar -= PCI_IOV_RESOURCES;
> +	}
> +#endif
> +
> +	pos = pci_find_ext_capability(pdev, cap);
>   	if (!pos)
>   		return -ENOTSUPP;
>   
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 79c8398f39384..e763b3fd4c7a2 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -556,6 +556,9 @@ void pci_restore_iov_state(struct pci_dev *dev);
>   int pci_iov_bus_range(struct pci_bus *bus);
>   extern const struct attribute_group sriov_pf_dev_attr_group;
>   extern const struct attribute_group sriov_vf_dev_attr_group;
> +bool pci_resource_is_iov(struct pci_dev *dev, int resno);
> +bool pci_iov_memory_decoding_enabled(struct pci_dev *dev);
> +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);
>   #else
>   static inline int pci_iov_init(struct pci_dev *dev)
>   {
> @@ -568,7 +571,16 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
>   {
>   	return 0;
>   }
> -
> +static inline bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> +{
> +	return false;
> +}
> +static inline bool pci_resource_is_iov(struct pci_dev *dev, int resno)
> +{
> +	return false;
> +}
> +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> +					     resource_size_t size) { }
>   #endif /* CONFIG_PCI_IOV */
>   
>   #ifdef CONFIG_PCIE_PTM
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index c6d933ddfd464..87a952a114f38 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -427,13 +427,44 @@ void pci_release_resource(struct pci_dev *dev, int resno)
>   }
>   EXPORT_SYMBOL(pci_release_resource);
>   
> +static bool pci_memory_decoding_enabled(struct pci_dev *dev)
> +{

I don't really see the value in making it a separate function, just keep 
the check inside the only caller.

> +	u16 cmd;
> +
> +	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> +
> +	return cmd & PCI_COMMAND_MEMORY;
> +}
> +
> +static int pci_resize_check_memory_decoding(struct pci_dev *dev, int resno)

Also doesn't look like much value in having that a separate function.

> +{
> +	if (!pci_resource_is_iov(dev, resno) && pci_memory_decoding_enabled(dev))
> +		return -EBUSY;
> +	else if (pci_resource_is_iov(dev, resno) && pci_iov_memory_decoding_enabled(dev))
> +		return -EBUSY;

Well that is coded as ugly as it could be.

I strongly suggest to not call pci_resource_is_iov() twice and to move 
the -EBUSY return code outside of the function (if you really want a 
separate function for that).

E.g. something like "bool pci_resize_is_decoding_enabled(...)" and then 
"if (pci_resize_is_decoding_enabled(...)) return -EBUSY;" in the caller.

Regards,
Christian.

> +
> +	return 0;
> +}
> +
> +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
> +{
> +	resource_size_t res_size = pci_rebar_size_to_bytes(size);
> +	struct resource *res = dev->resource + resno;
> +
> +	if (!pci_resource_is_iov(dev, resno)) {
> +		res->end = res->start + res_size - 1;
> +	} else {
> +		res->end = res->start + res_size * pci_sriov_get_totalvfs(dev) - 1;
> +		pci_iov_resource_set_size(dev, resno, res_size);
> +	}
> +}
> +
>   int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>   {
>   	struct resource *res = dev->resource + resno;
>   	struct pci_host_bridge *host;
>   	int old, ret;
>   	u32 sizes;
> -	u16 cmd;
>   
>   	/* Check if we must preserve the firmware's resource assignment */
>   	host = pci_find_host_bridge(dev->bus);
> @@ -444,9 +475,9 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>   	if (!(res->flags & IORESOURCE_UNSET))
>   		return -EBUSY;
>   
> -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> -	if (cmd & PCI_COMMAND_MEMORY)
> -		return -EBUSY;
> +	ret = pci_resize_check_memory_decoding(dev, resno);
> +	if (ret)
> +		return ret;
>   
>   	sizes = pci_rebar_get_possible_sizes(dev, resno);
>   	if (!sizes)
> @@ -463,7 +494,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>   	if (ret)
>   		return ret;
>   
> -	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
> +	pci_resize_resource_set_size(dev, resno, size);
>   
>   	/* Check if the new config works by trying to assign everything. */
>   	if (dev->bus->self) {
> @@ -475,7 +506,8 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>   
>   error_resize:
>   	pci_rebar_set_size(dev, resno, old);
> -	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
> +	pci_resize_resource_set_size(dev, resno, old);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(pci_resize_resource);
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 94c00996e633e..cb010008c6bb3 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -738,6 +738,7 @@
>   #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
>   #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
>   #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> +#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
>   #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>   #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
>   #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */

