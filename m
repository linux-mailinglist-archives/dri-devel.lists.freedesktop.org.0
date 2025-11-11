Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A11C4C8C5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F1610E521;
	Tue, 11 Nov 2025 09:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E3y4Jczl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DA910E51C;
 Tue, 11 Nov 2025 09:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHP+jvaMsjXR4mxZfbNy5NhUXVKDu2iCyp6N7pqKQkwF8vVHcKLIpeRVHD1Ky3vNBe7DMPZfGkJDAADIUn0dHQ4WMm1dk8CR7lF9OTaVSD4E41N1HR/SZlVZiu9tzaPWYyLx2Rc5nOeRM6sb9M1ZZv4ATeAe42hIgZSgMKueIMgqnyIbfukuE/tN7Fsfo/Ep7dJi50J3uIwEZCUFEEUcAny0ubJTwVpfmhjgZECU0ex/mb4Je6MAK6WgPMrjEzyrnMCMWI5mHjX/dVw986K6zS0Li4FSOirNE2l76lJ3dUEIfPjLo86kSOLO8EXhITEpFjmBdggPVwXHSrRxX6iVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcyfIZMbfq609bzuKWn8McYL+lSFese8BW/xmKHPA4k=;
 b=tkQ8mZP8C30u84D5Ls916XPg4ZNfSms19kN14oyp80OcySs5NZH6zSHjqUZYJ6AmngDfdK96ngjc3WEetYK0+170WNCmV9IW0t4dm9AIrBb1A4RuoYTLiHkPNTq0dchaEPVIULf9hWSx671zjk6fx2iZgsJMkoNvCTJ47PhOoly6kSaWSWzCMe2WekYn4gzmYCZ6U6jkTH3aCVus7KhQbV+igj7TCm7yPFL7y4hpkBotxzjH5lvdR+Jn5GE5y04Qpjw575ih170x/u+020Q+m6Rc0dQNjeUouU1TDO67k4FlFhmhyQf/FYMjo+O9PjKpdygYyh6bgCL1j2BlIMhgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcyfIZMbfq609bzuKWn8McYL+lSFese8BW/xmKHPA4k=;
 b=E3y4Jczl5qx8Q5AiPbxXHAzNFkegH5JTbi8UXVgXqvjwQJM4alj337p3mcDISzyUiuIrGNt27zia2odjhJycHawVYnX4qiRw4K2QOWE0fkuxf1SRgh3I0VekK1Vo6xnNM/gue98XZSoN77NVpISOCvZW2gwU8J/jP7pY1z9dGsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:08:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:08:49 +0000
Message-ID: <c90f155f-44fe-4144-af68-309531392d22@amd.com>
Date: Tue, 11 Nov 2025 10:08:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:408:f4::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: d27c20f1-5579-43d9-04c8-08de2101ed3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmFvUC9lSW1YV05IZFBUK0JtNkxiWXhsZE1JRzFKTnVJa3hEVEJDbFAvZ3l5?=
 =?utf-8?B?NnZiSkcva3lLK2szUXZnRjhJcTc0TDBIL0FadTlCa3ZDKzRKVzRvY2kwd3Rh?=
 =?utf-8?B?aDRjL2s4UGQ5ZjRXK1V2Z3dQKzd1dlI0d2tOcVV0M2dzamVEWUJYVS92ZmxU?=
 =?utf-8?B?U2V0aU55VTB1b0Z0emRkckNHUlY4MW81RThlNVRsMDRSNzZlUlZmZXoyeUps?=
 =?utf-8?B?UUF2VmpKdDBGS2Q2NURCWndzRmxXUklVTUp6S21JY1FaYTBIeUR3bXF4M3dB?=
 =?utf-8?B?aDV0R05SUnBZb0c5MFQvRldwbHJJNWlyRlE2cnJpK092L3ZkLzRTakQzSUF2?=
 =?utf-8?B?NmZ2aW9uekhBYk5uMnZrT2tFeWxjUFpvUnpjWkZ3L0FWUXpLcy9Ed3FxOEFG?=
 =?utf-8?B?TFpjaWljakEzV1pZV0VvSFYrSFp4cVY5SXpIa25icHRXTVI1aEM3QlE0Nlp4?=
 =?utf-8?B?VU81Z0JqeStJbTcrVjIxZ3NMTzhyUldnT0JWYlJJdS9rc3VYUG0vRTBEeS9I?=
 =?utf-8?B?b25SV3NPSytEdG9BcGM5NzJUeEIvcXhPSGMydkZRU1VwWXBOUXNlZ3FWRUdw?=
 =?utf-8?B?cDE1cTBvMC9yT1RYTTA0Kzg0c1QvVVZCRGZRNkhrYng3VGNBcnoyZTFrakZO?=
 =?utf-8?B?bFFENmRUY3Fza09Td3lveFZhVUF2ZWk4Yk5taWQvMFo1RU1hejFZRHJLQ2V1?=
 =?utf-8?B?UkN1NmFpbjRhN1hDNlcrRkEwNlN4ZzNYaWErcVNqYlNvR3RxNWlXOGJ0UThT?=
 =?utf-8?B?QnVWcFk4YUdKMytuL2VtaHpiK085SzNuZVFoOTQrUVQ4cnFJekFiaXRJWmlt?=
 =?utf-8?B?NjBYbUJ2TzYxUXlSTmEwNG5nMFFia0h0d1YrUGhIRFVScW1UU1pjOC9xNWY4?=
 =?utf-8?B?dlIwTWVBanF6SldPclYrRG1kOUExeUx3blpxbEFkZGN5UEVQZGxtNU1uNUxu?=
 =?utf-8?B?bUpub05CN01HRzFvRFNjQlFvTmppNG13K0Rjek1hUTl0TVBONnErakVIU2Nx?=
 =?utf-8?B?Z1RjKzI2eiszaFRSUUx0RzJCODUvcFgxTmNCZWEzMDBFT0ViQjdHUCtqelZu?=
 =?utf-8?B?RTNMUnhUUGJyUERHNnduV3dVYVVmTW1GZXRxWWFRRTdqYVprUUJvU1Vyd2VR?=
 =?utf-8?B?QXIzMmxGZjY5K2p4STVzMVVXTjdQQ2pUTEtTTkIzZG5tbStIR3VlZ0FkeWMz?=
 =?utf-8?B?LzVaTUVISzIrZTkxZWt1aWZxWDN4VnJpQ00yZ1h3MUtUL0NzcUllNGUwUCt6?=
 =?utf-8?B?Z2lQbzlQK2k0WUlhb2ZBNWFqbWtDNnJwTWFMY0lwVzR4UzN4QzMwV2ZEOWN0?=
 =?utf-8?B?SlZwNE1JQmRRUXEwSGFpTm93RFhkY0hndzVnN3Urdk53UDlDajlLQS8xYThH?=
 =?utf-8?B?Y0RJb1hyU1hralI4ZzBkbUFwN0lrbFVtNnZuQml4ZzFGS2hhODlXNnM4b29H?=
 =?utf-8?B?bnJIcjRQNktXN1h2c1lKNmZ2RnNTY1lLWjhTRzE3bmw1YUN5OG91TUJ5T0RS?=
 =?utf-8?B?KzkrWENDUjh5Sk96U2N1MGZVK1hIektOQzJSRGxIemMvOHoxTUVLZmZZTm1I?=
 =?utf-8?B?TGlNd2pVQmFlTUZsREExY2FmQnRXbGZOTFhZODF5eXFpTFJZWkxwb2NlV1li?=
 =?utf-8?B?c1k4L3FWajdhUzFRS1pQVytWTUU4MW1MTng4K3BZNW00NVVMK0pwbmYrOTlk?=
 =?utf-8?B?SHQxWWg4TmJSYlBUbGFzc3NFTGVYTU9kVFk4cnc1dytEL0hUMVlKbFd6bFJo?=
 =?utf-8?B?UHdxRDZQeHJlbTdxMGc0dzR2QlloQzlEQ1FHR1BobjQ3c1dCem54TkNISmpK?=
 =?utf-8?B?Sm1udzNESkZhTTB5b0c1YVRRU014YWN6TEdZenhkc0NZYUkzMXQ5S3RabmhW?=
 =?utf-8?B?RjVhemQ2bU1GSXVBQjZsRmZVWk5zbUpwZXRPUE4rUVpVUFRGbVFYRnZFM0oz?=
 =?utf-8?B?MjdrMC9oN2xDYTVFeFpUNmVzbjdZNmFudXJ5VEtxM2RtQzRwZWx6cW9sRG9j?=
 =?utf-8?Q?3B7B4V+yI1nKgLY2njTPqjCKeORvJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWozMFVtdHAybC80UW9DcGt0Zk1GcW1RMXVsRm1HL1NpVGs4QUJ6aWU0NWNK?=
 =?utf-8?B?NkVqRlBodlJReTFTNjhIVS9PVTJSTFJuV1hnMklQWVlRdWZTT1BremJvcE9F?=
 =?utf-8?B?VGZHWlJJNnJHS3ZMeHNGOEgwVHl3NGpEd1c4Ym9aMDl3VnZwcTA5S3BxRDBR?=
 =?utf-8?B?UUJ0eW83WENyMHRNK1kraGxEbCtjUFFuOTVrbTY3TWJjMmducG4zd202K292?=
 =?utf-8?B?dEpKTFFsdWZ5eENEZlpYeWw5YmU1TGQveHlBbGJXa2VnS3VOV1RwVE8ydUdS?=
 =?utf-8?B?YUQ2QkxHOHAwcHBzZENDOGM4S0ZKN1ZqVGhQZVAvbmJ0R3ZQTktmWk15Wm5l?=
 =?utf-8?B?WC9GNHd1TFNwT0h6N1I2UzBNdDljOEtzd2VkTnNhVGpOL1ZKcWtRQVEvb1pD?=
 =?utf-8?B?NTVNOEw0WEpNbnQ3YXpMV1BXWVptOVZzdG9mQTZsTVhBaXhiWUxSWXc1OWxu?=
 =?utf-8?B?bGlHMit1ZXY3cHhobGc3NlJEcUxtOFdrQlZTQ09wMnhpaFUwVzNHeE1TUUJ2?=
 =?utf-8?B?S0NMeWIwbGlUWXczd2VaY084ZWl1bHFJSmZ3YVcycm1HWDMxeTRWRU1VUUN4?=
 =?utf-8?B?bVFDUWlVbFZIQklpUDEzbnZ1MVNzNk83MnJmQ2tCc204WEhkV0xxenNIMTFw?=
 =?utf-8?B?V3RGbWM5aDE4N1RraWwwdDE4aFMxVGwvQzRGbWp0MUFzSitTNFRkaytNZWxD?=
 =?utf-8?B?cGJrK2RrYnMyNDEyazVnUXYxbDBWQmtwMGlGaU1QMFJ5Uy9Obzk5b3VIUDA5?=
 =?utf-8?B?cWI1SUJhVVNHMnlWWkY1UFBCVFdTcEpJY015bjY5TGNUMkZLRVFFWHVXdFZj?=
 =?utf-8?B?c2xCN2lpaGFBdTR5WTBYMW9KcWVQK1RDaWU3M0xVRUtJOENpOHFEUGkxTDB1?=
 =?utf-8?B?aVJ5TFZmdmdJNlNLdzVkR05JNDVNaVlwaUlYUW1DUkZFdVJZZ1U3OGZOaTM5?=
 =?utf-8?B?M3dDVHdlNTgycEFjanpyQUZPMEdYQlZHd1I5aGRPTTlPUCtGeDZ0OVVXRDBO?=
 =?utf-8?B?dEc3OXBENkEzYnJvUkNiUisvdXk1QVpjeHZhUTFKS2R4RVIzcUkxckk1WkZM?=
 =?utf-8?B?dUdCdEJuNjMwOFRpcytXNW9Tcmd1dGNsVjVyMlFDYVlzazNhazhhR3FVSFQ4?=
 =?utf-8?B?QzErRkpWWWFCR1RSRnRpbHg2aXRmZDhodGJYeVI4eERuNXY4UmRzQTcrbkNX?=
 =?utf-8?B?ZXVTVm5XUGNmMkwzWnVUTW5JSnFuYVV2OEQ3dy9wZEVoSlFFZHZpS0VMQmF5?=
 =?utf-8?B?TlVJZ3VVemNpZWs2dTdDZlJ1VUhHeE9GRUM4bUdXYzg2bEtoTjVFaW1MRXNq?=
 =?utf-8?B?M3B5NGNxZFRXYXFmb3JXTUw4TjB1OUM2OGsvQkpaUVlZaUtDTXNYeUdyQXNm?=
 =?utf-8?B?RG1QMkRUNVJvOVJ0VFhTckV5c1EyUEVmMnY0cW5aaXRqRHhPRkNIbUpoUzlH?=
 =?utf-8?B?cFN5SWpNU3pTTmZkdW45cGE2VmEyUEZwMHlLUTI2bStrRElGTmlBdEF4aWFE?=
 =?utf-8?B?ekcyeFE3ZlpqRXBLd3l4ZGpYbFF3emFmclFLS3JieGE1dGgwc3g4eng0MGZY?=
 =?utf-8?B?RWNhcDNvRkZ3bjMzMTRKc1VkM1E2YVlvMmpPeGpwbEV1bEkrM3VxRWJkSk01?=
 =?utf-8?B?WE9qZnVuQjN3STZNNGpxaXprVndhZXhWeUdOZG9ab0ZqQWVlaFAybDkrRW0r?=
 =?utf-8?B?Q3lXTkMvWDhOQ2dNaG9vRzRhY3FzcEIrU0ZPSDZBM3F5RXBpcG4wbHdoMTdF?=
 =?utf-8?B?emR2aytyc2JYdmNta0pmRWEzNk5pSDZXM1Z1YzFRd2JLakg0bEE4dXB5MC9y?=
 =?utf-8?B?YUhuYmNKTnJVTzV6cHFLaU1EK2RNakgxZWg2SGU1ME5jczY0dlRSdnVJakxZ?=
 =?utf-8?B?WHlHLzZHZHd2bUQyUThlN0l1NjlzN2NRTnhOb083Y3VacGVaYlkyN08vd24y?=
 =?utf-8?B?bzcwSjllSllSbk0vS3Rtai9Kc280SEd1Nkh1OUs2c2xHZW41MG52WXhUTi9s?=
 =?utf-8?B?RnRoQVlKR0czd2Y1YTZkeU1PcGtaRjRNQ1NGN2dJWXEyZ0Vtam1qUjBGMWx4?=
 =?utf-8?B?WkdrdWh0TUVqUnB0RXhXZy81VGVRWHQwQzF2TWRia1lWZHY2ZmVuR0VLaUNN?=
 =?utf-8?Q?2vjEHyNY7CfU34OjeJZAvVqPy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27c20f1-5579-43d9-04c8-08de2101ed3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:08:49.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUf5nqsv0+oedqOP4sg8A890Y/0pGXTfo312bVglV1LI+cC5DBxSoz4rI4QJUXL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601
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

Sorry for the late reply I'm really busy at the moment.

On 10/28/25 18:35, Ilpo Järvinen wrote:
> PCI core handles releasing device's resources and their rollback in
> case of failure of a BAR resizing operation. Releasing resource prior
> to calling pci_resize_resource() prevents PCI core from restoring the
> BARs as they were.

I've intentionally didn't do it this way because at least on AMD HW we could only release the VRAM and doorbell BAR (both 64bit), but not the register BAR (32bit only).

This patch set looks like the right thing in general, but which BARs are now released by pci_resize_resource()?

If we avoid releasing the 32bit BAR as well then that should work, otherwise we will probably cause problems.

Regards,
Christian.

> 
> Remove driver-side release of BARs from the amdgpu driver.
> 
> Also remove the driver initiated assignment as pci_resize_resource()
> should try to assign as much as possible. If the driver side call
> manages to get more required resources assigned in some scenario, such
> a problem should be fixed inside pci_resize_resource() instead.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7a899fb4de29..65474d365229 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1729,12 +1729,8 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  	pci_write_config_word(adev->pdev, PCI_COMMAND,
>  			      cmd & ~PCI_COMMAND_MEMORY);
>  
> -	/* Free the VRAM and doorbell BAR, we most likely need to move both. */
> +	/* Tear down doorbell as resizing will release BARs */
>  	amdgpu_doorbell_fini(adev);
> -	if (adev->asic_type >= CHIP_BONAIRE)
> -		pci_release_resource(adev->pdev, 2);
> -
> -	pci_release_resource(adev->pdev, 0);
>  
>  	r = pci_resize_resource(adev->pdev, 0, rbar_size);
>  	if (r == -ENOSPC)
> @@ -1743,8 +1739,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  	else if (r && r != -ENOTSUPP)
>  		dev_err(adev->dev, "Problem resizing BAR0 (%d).", r);
>  
> -	pci_assign_unassigned_bus_resources(adev->pdev->bus);
> -
>  	/* When the doorbell or fb BAR isn't available we have no chance of
>  	 * using the device.
>  	 */

