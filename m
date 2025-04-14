Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344BA87844
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 08:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9910E49B;
	Mon, 14 Apr 2025 06:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mg69P9X6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D6210E305;
 Mon, 14 Apr 2025 06:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGdM2nNBFDMMTPSGStOgQrshIg7XUfXAJclOxsJP8C87PuxGaCFQDXEtZ9LdUxUjMVn8rJpJdo6B90AeR3ZcqHOpHMDmvrTF8odH1km7GiG4jZgssSUAw9LTmYnm6gCsPkpRKgSKclOGGuU/SZwI0Gaihs5szW9q47Wqg1558HSVfe/nxWhGfiUxJzTL3/9P9EL30VlKdo/ZpVNmyzytsMKbFEdjyePy45n6owdP2YC3EY82yWWQAIrt41j/rao6yRSQuQi4SYj5hO8TqLypV61wbMBN5nPHiJsr1VgKptwzc8GQuI3DD1MvEXC4nR02nmTFQG3vkcz71sBExZBFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3YFTxfegbmvim7ns3Fyftqu6xNI1a+H3R3GDap2fI8=;
 b=vCDvAluG29YEJ4Z1feXtV/8NjrWWVwTd9LfZbLwbujM3WY9gWvfwvNcSjkLZPprcFN8V3+Qt/1aEOtm2Fx1UrPUH21Z3ZaeLED9MlMOcboVNtgcLQDnHOlYeP0PPehidCTINgb0I0D8W1q7rmUpd+l1ctK2EyOiKb76TqTJXW7PL5jWeARGWqD+gMxcUZI2p/+8bzNoORO+WWxsr7hC8Tu6HALdPEME+hmm1lCcb20F0pT3GqHWa5bd3rWZeDTkIsOdazA30Gi8HoSaqEIyjDSyPQqc+YTzHpUShS6xAK8K1p4dHJsxHOQaqMNaYJS06yjZb9B1W/94B9FVJ1SGCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3YFTxfegbmvim7ns3Fyftqu6xNI1a+H3R3GDap2fI8=;
 b=Mg69P9X6zrp7jBJGCFfyTmiyzjeJ9iqdhMRJtDVIl3H20fgo+9gmefsP9TvbVKwOj70pweLB4lqhh8XpInvuBnp9QWtKLOKkTc0H9xKRldWKtuDe4RPQUnfHX58KSIxef9LZAjFMho1AiJjrVNKe5G28QnhnSfxLNVC7ltvAHDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 06:55:55 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 06:55:55 +0000
Message-ID: <f3fed391-223a-477a-9818-e932130c2c4e@amd.com>
Date: Mon, 14 Apr 2025 12:25:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm: function to get process name and pid
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <20250411130428.4104957-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::13) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 418ff69e-180e-4c18-4884-08dd7b21671d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDlhNnJ1Z2ozc2RIVW4zYkxGeWszOTdoQ1RFR2Q1dmN2NEJYOE9sWTc3QUEw?=
 =?utf-8?B?YlJGRXQxWkxTQkZ0M2U4WW5KTXlTbDdNc0RrOEkzVjNqTlkySHNJTzRjWGsz?=
 =?utf-8?B?bWRTQmRvTkx5WHdnaHFOZWlBazY1aEVVbEdNbEo3MkpOUHd2c1Y3ZXV3alk0?=
 =?utf-8?B?SGlUdVllZFJNdUJiMjJOeTRJTmVlWG1jeFpFN3BaTkJUOEFWNjhaSXZ3eFBK?=
 =?utf-8?B?TVR1OTAyVHJYOFRhYkJxTWU1QWQyQ0NZNithcGkyVGE2NmVpTjhnUW5SZ3NH?=
 =?utf-8?B?WXQ2aFJGaGZ6L3B5QWo3ejJmSU9QRTQ4RzRqa29Ub0dORThhck43NlhWZjRy?=
 =?utf-8?B?eWhSc2lUSEFWWjZPVVFzZkl1ZzJRQnBpVDJSdEhlK1cyNjVCQ3lUU3dScCtm?=
 =?utf-8?B?RDFjTnR5VG02TVUxMmkvUXpwakIwRmgzSk9MbjVtUUtkMWk2UnhDR21MNGpr?=
 =?utf-8?B?WUFGZXV4SEk1ZFZvZkUzNjhtSExLSjZtMG4zdC9kSDFza0RUV1FLUUJqRlRp?=
 =?utf-8?B?UnEwV0NSWFdYM2VWMUVNTk50Nll3QnJaNHpoTGRwM3RQaGZwa1pwdUxYb1lt?=
 =?utf-8?B?TWpKeGd3cnA3TkNEVEMwVGRCQlIxYVhoRXVqZG9sRXdHK21XUGRCRXZlYVdQ?=
 =?utf-8?B?anp4ejBEeTJYU2EyRnRMRzFpRkR4ZUh6SGdCVDZXRk1FSmxlSGFDMkNrdmhP?=
 =?utf-8?B?L3ZLdzFmTk5UekEvdk5GSzd0SGljOWFVNEtITHhnZkVSdEUzeExwcDBKUHNQ?=
 =?utf-8?B?L0ZUem9wZVZBSFpOS2tFQmoyODcvblhmTUg4Q21tdXk4MkJob2RPSk92L3pn?=
 =?utf-8?B?TTlrN2VvYjVteVA3TEdURFdLVnZvL213cFc2YzBsTms3WnpHa051a0s3Rkhp?=
 =?utf-8?B?M3FVa2hTNXZ2WUZLckRaTGlieDlkTlNmOGxjSHkzU2Flemk0M0hxcWY0TGV1?=
 =?utf-8?B?NW9BaHEremYyRWpORS9OSks1Ly83UzNyMDdLWjNyQXFFTldDYkN4TnI1T0RJ?=
 =?utf-8?B?WndURUluQmpCUFZBODZsbGhRSGtyWVJUWUNtaytxdEJiWkNxbzZXaWpBdmMw?=
 =?utf-8?B?Z1JXSkdiVmtsQk5uUTZ2QU5UYkZ5am03amVXWWlkaENsS1F2ZDkyUzUzOXFS?=
 =?utf-8?B?bEQzR2dGU2JyNlNsbndSWXh2TkwraGoxT3MrdjNQTHZMUWY4cUJORVhuME1a?=
 =?utf-8?B?M2JieGxTSlhhUlJISnArVzVjdlAyQkF0MGRsNTgrTS9kUGo0cm1YWjFjTG1N?=
 =?utf-8?B?V0hCbGpZcE5XRSt0QlJzOFZITlhSRS9uYkIvaXN5bTBlRGRaNWhYRWdxaWRa?=
 =?utf-8?B?S0tHLzkvQjRDc2owTEdwWkNmc1Y2eGcwVXY5ZU95SGs5emxoKzk4bmxyUE9x?=
 =?utf-8?B?RStsOHJUU1JISTdEVFRHVVI0YjAyWG5tZ3h6dTlvSnFFcUxENXpJcTBtRjZk?=
 =?utf-8?B?b1kvam9jVWJIV2lBNGxwd2tWQVFzdWJLWmh3VFRqR2dhcUV0cDNhSDlnNU5h?=
 =?utf-8?B?NmdOejVxRmFpb1FzYmNPalZYVFB4Q1pOcjhIQVNkdGZjVXFVUlhyTVZHMnpZ?=
 =?utf-8?B?NWNKYVVETitveWVNa08zL2dYVDU4TC93OXhUSVd5dVRmRkppM1dpL3lMZjZM?=
 =?utf-8?B?WGVFdXdaNUZRU0pycXg0Ulo5SzdydktVSC9QTGlzdU9CWHpnSFZML0RvQmhl?=
 =?utf-8?B?NTgvY2UyTkZyUUErdDNESEJ2dkhVSDZiWGM4ZXdzUFBka3BXaTBEQ2ZTNnNP?=
 =?utf-8?B?UU1na3BtN1hRakxOQmJLc2puQWN1L1R5U2JabW1lcXRuMllUL0M2WThjaE4r?=
 =?utf-8?B?TDMrWVppMlEyZjFFVjl0Wm9kaUF4MFM2VWVOcERtRkdoWFFORzRvZmhUQnh3?=
 =?utf-8?B?MS9BRktjVDBSM0xjVmUwQ1RET3dJb3VKU2c3ZFdwUTNrL1pKTUszM3IybitI?=
 =?utf-8?Q?gJzqjXWkgEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVHWXdlKzhHWEQ3Y3NuM0pnRVVYdnpYcCsyNU94TEthclNNWHFsbkZkLzlF?=
 =?utf-8?B?K0dUVk5lSU54cnVnMlMrRGVVSXFEbFFvcXRFaXErdGtLQk5CczJwcGNvTi9V?=
 =?utf-8?B?TVFNcFdrUU5kQzVCTndxVkxweWVmdktVU2ZYMFZRdUNrck5NRHJJUTdpUjhC?=
 =?utf-8?B?Qlh6bGQvRmYxT1BJYXo3UXNtcm9Rejk4N2toTHd5UmJVUWJOcTY1dlRCeTNr?=
 =?utf-8?B?NU16VHhMeEJNd2YxWVpYZUh3V0JVN0dkUkFYajY1RWhNcEdtenlxVm1RZExD?=
 =?utf-8?B?S2FOeUVZUmRjRVFWMi9vTDQ3cm0wY0FqR0tQZk5MaWU1MkFQeFhFMlZTaFhR?=
 =?utf-8?B?NWh6QWd5dllwR1h3K21ScGlndktiOU5sQjBLUTVzd2dFTHB6ZXcwbHhGTTBR?=
 =?utf-8?B?cy9naEhEU1h5VWc3V1p3N0htS1NoaEVUOGZ5OEFnbVlHclFoV2wxb04rK29L?=
 =?utf-8?B?aTFXbUV4UWZtV3ZQdEpaNEJOblNMcy9uOVJxSnNqbUdDalJJbjNVcGl5dlkx?=
 =?utf-8?B?MEhqWHROUWhJNktFMlFLWENqdy8yYzEybFQ5WEhHekR0dG5JaWowQnBtNllH?=
 =?utf-8?B?aXo2L1hmWWhnT29EMGtWNzVsazF1RXM5Y0RsdXFrTUF2TWNNdlBoZ0djK3VR?=
 =?utf-8?B?T0g1N3cxUTcwN0xoc3R2RCtpajRwYXFGTjYwdGh6ZDNUa3Y0L3V1Wkw1Tng5?=
 =?utf-8?B?MGh5TjhTK3hSZ1dLTnl5Y04yaFhrNGNjNHg4NEFDdy9SZmI1dmwzK011VXZZ?=
 =?utf-8?B?VFZlUzkrY0cvQ0hLMjR5OXdDQ1ZPQXc2Sk1ZR01zK2VyU2kzMmZTdlZyUzJz?=
 =?utf-8?B?ZEVFUE9iN3VzaFArdE8zVkxITU01ZDJiSVJtaHpuSFNmRXM1SVlpeTV0cXlE?=
 =?utf-8?B?ZGVGV1VQZFNQell2WXMxcHcrYW5kRGhyQ3lWSm1sVno2cEE3UDVhcnhDcTlO?=
 =?utf-8?B?RDB1cWV4VnRRRG9kRS80MEhoVkQ0VUVNSzl1RFFQdmhSRTY0THJQRlN5bXY0?=
 =?utf-8?B?Rmd5M0x0bm1WOVVId3VhYzJ3WnV0NUJzeHk0bm9hVG94U2g4K0VrM2kxcUkv?=
 =?utf-8?B?TWN2MVcrZVk2OHhaVjFHdEZrdmpHeGdjd1pjSHZGc25kZGlhOXdmc1YrbFhQ?=
 =?utf-8?B?MHNBNW1uMndUZ2VzdnZlZU8vYUpaSEhDaStkU2xKMHdiQ0tWQnUyTXlaV3Jx?=
 =?utf-8?B?d3ZTK2FBWDBCZGt5VFJTZ0Z4QmhnNkZwMjhzMS9uSWFvSUpiWXZXVlh2UXgv?=
 =?utf-8?B?SEc1ZEhncjZkWURJVFg2WU9zRldMaUlaRW83elJRbUlqUCt4OURyVTQrTVZ0?=
 =?utf-8?B?RG8xWkF2TmtwVzZsOXlOamNrUHcxMmhrK2pNa3F3T1pWblo3bmVuU2tsMFBz?=
 =?utf-8?B?TFNjWUxrZEtJeU15VWc2RVlabi9kNG1KYjA5MGNiTmRiV0JqYmZIdzY4OGRQ?=
 =?utf-8?B?Y1Fod0JGZU5idU5CS2R3a2J0dXJUUEt2d3NTcDk5RGdnQkFiVDd1QVlIbVhM?=
 =?utf-8?B?Smw3NjZxMjgveWowZVdtSWczK1pvR0VncHlpSFFkdUxNYThJU2ZoVEJOZ1RO?=
 =?utf-8?B?RWQzZkZZUkFkODZpVXIxUFFDQmR0K2h5dDBpaTdXRi85eGN0N3hwNnNKMk1B?=
 =?utf-8?B?c1cvcUQ0YVlVUzBZeUM3MlZ4RmljVFZGS21tU1phUzZYVjZxUk4zN2kydjJ1?=
 =?utf-8?B?ODlGdkd1WjNOTitQUk1Hb3pWcXJ2UC8rUlVENUlOalJPcW1hNFU5Z2YrdHlz?=
 =?utf-8?B?SnFOVzBPTWpHQy9rZWI2Nkp1RlIrSEV0VWpLMk1sNFRFM3F5UDRmbTF3dDc0?=
 =?utf-8?B?UkFxM2Z6djhGa2hUK1d1cjVyUGhiVTE1LzBaWXo3Nnp0U09KU3lWSlE5Q1Jz?=
 =?utf-8?B?RG93bW1ycDE3WVZueVNBZXh4UjdJQ2lUcm9ueHVOQkpqTXJ6cXlYOHlaMENQ?=
 =?utf-8?B?ZHhvR0taWWFDaW10Qk1VUkI0ejNxdXVQV3VhUGxudjF3c0ljcGNEcHovd3B1?=
 =?utf-8?B?d2FRdU5TM25ZNzZFdzBUMTJvcWt5MTkrU0NoTWM5MVFJdUg4R1ZsWllqVW5W?=
 =?utf-8?B?WFA2c1NtMW1nbXRtVi9lMWlBTUVoSXZQSUZ4aDgxN1pFNHd4dTlnVVY0Kzl6?=
 =?utf-8?Q?BnwN+DG7Bd4PcQRI7cWRAZlL4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418ff69e-180e-4c18-4884-08dd7b21671d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 06:55:55.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqoQatkRYYglWj6MjSizyMlwf44nZYqoCDCwJlUDnQX6zjgS6BoSOW1ZuPZ6CFqmXB+iu5IYKN5V2hy0wmXZ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
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

Ping?

On 4/11/2025 6:34 PM, Sunil Khatri wrote:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>   include/drm/drm_file.h     |  1 +
>   2 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..4434258d21b5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   }
>   EXPORT_SYMBOL(drm_show_fdinfo);
>   
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_err(dev, "Invalid user buffer\n");
> +		return;
> +	}
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "comm:%s pid:%d", task->comm, task->pid);
> +
> +	rcu_read_unlock();
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>   /**
>    * mock_drm_getfile - Create a new struct file for the drm device
>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..c01b34936968 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>   
>   void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>   
