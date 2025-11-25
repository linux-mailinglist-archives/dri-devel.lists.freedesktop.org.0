Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699DC8523D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185F410E3E4;
	Tue, 25 Nov 2025 13:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V11aK2nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012004.outbound.protection.outlook.com
 [40.93.195.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CA10E3D8;
 Tue, 25 Nov 2025 13:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIS0nvEhZtYwNs6B5WxSrxteokhm1w1sQ6ggpg667FPKlgG6zcriuEi9WBuKXFFOTREcboVVKfBstG/aFd2lnEO47mD234UnnSHtty17s5d3AHReI0Ev5xGg/6Lll9XQJK6ERnqGTbSGG5+Z54BqEjd5MEDYLAVfHfSlMtklb2y3omBJK8dvgqlpkt6fFsjwCaobCkDL54glXK/W5Tb68Hq4BqG1Pc3jPw1EejKQYHGV2fveM1Ent7NgDwn+7EnwL9FvRAUt/dEATYWwoIWD/j8yRiA/kp4d7APOD3pmYYXb72S3lbSu1dvxbf7tSGvHSZG6HowoMkg/Xy9nJe4KwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F13F4ODYDndu6yM8D/z4G63fIeoXZPSXz4U9ict+cj8=;
 b=J4LgAMV8Ih0E/HrHWvfreBOxzaQG7SK5BSbOp9mbWuOybNzxXmPokB+qO9EPu0T7s2RzO0RQy5WWjHZGM73Njpd/1Wye2G9LCkMb919NzAw8XwGtuUQZkCGk5ZJQTd5HeeebBl+Wu+HZis3sDOQaCrLZbc0LAxMEtmk/ELAQfr5yHQFziJR5ba0xnXjQ8uuTkBaZum48DwrtgN0L5hZFWixNp6h9bVNL/KIwegs6puOaysFSCdKcnkFmeIsNfULIwDXXDjBWaj/fMQEtqqU2VemBCVjap1kd5sgALHyGI7xIlaYkUusjcaP3pGELNzsGszX5nUuPVZVlc3IMt3iA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F13F4ODYDndu6yM8D/z4G63fIeoXZPSXz4U9ict+cj8=;
 b=V11aK2nZgEbERXYKtMeCQ6uSj29LkeqJaNMqOR4hZYbYKlA/Dpj5mEP4cSyYy9XC7c0+ipufStAOO7z79e/E+Jivq/gKOd8IIAfUbTkyq4E2WC3GPIvpATrXKLXu1fWzoHDXEwu7wsFnSQKsnUZpNkpMx9O3SaVdQ9Sql62SRL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:16:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 13:16:43 +0000
Message-ID: <11ac809d-0432-4c9f-8279-7df318c9a448@amd.com>
Date: Tue, 25 Nov 2025 14:16:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, alexander.deucher@amd.com, lyude@redhat.com,
 dakr@kernel.org, deller@gmx.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jason.wessel@windriver.com,
 danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:408:141::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: f2efc1ef-0ae8-4cd5-0e8b-08de2c24e0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkpQdVIxeGoxcUZKMXdBZ1p2ZU1YN0Q3Q0J3MUovZk9hTkRUZHBiQmpvcnZW?=
 =?utf-8?B?bHhBWE1peWFEL2JVeTZsbXhham1JVG1NU3ltSHN2K0NVZDVNYS9wK3NpbnpZ?=
 =?utf-8?B?TExtaGlwdXRaQmcwYW5yMHFNNHh3N2huek85alpLb1pHVEdzMjQ3b0xwdG8r?=
 =?utf-8?B?Q2JQVERqVVdYSXdhWStjZ3BIblcyb25sRTU2QlNMb25EN3hSbmFqZTJFZE1D?=
 =?utf-8?B?UXdqNUErWFVmb1ZFVU1Vc1FSYjJSdXBXZkZqVEFGNXhOSHF0bGh1VnBkYm53?=
 =?utf-8?B?aHo1VDg5NjZzOUxkc0xYSVh3ZlpWL3V5akF5RnR2ZnViUVhqUFRiNWQ3R3l2?=
 =?utf-8?B?Nm12UWEyUXJIbmQxMld2T3RFVGcwZHp1RVlKc0xzME9ESUNnV0dKL3h4aGF3?=
 =?utf-8?B?ZWZad2w0aEJ1NmFmbDMxYUxFdFdCSlU4SlVFU3ZrcUpDS1NxY1dEZm1QOUNa?=
 =?utf-8?B?QjV4R0dhbmtJV0hCbnI0MXhBMXcwZWRPK3ZPUTgwUHgzdHFUcFBRTTMwcXJJ?=
 =?utf-8?B?RG54TXNQWXhWb1ErcERmMXN5eGtsVDV4SVRBUkkwU2FPV3lFYzFGK0Y1Tmk1?=
 =?utf-8?B?L085VmlYUTZYVGtwakVkRGZ4TjB4UG5oSWxvSGtyVDNGTS9kblByUDNzWnor?=
 =?utf-8?B?RWRLV3gxT05pMTBGVFU0eGQrZ3BqVGJwUGR5bEh5aGNIY0dnOWNDWlAxdmdQ?=
 =?utf-8?B?Vkg2b05tNWx1N2RqY2M2Y1Bja1I0QVJhRlZ6a2J5bWR6VnVkRUcyd0IvOWMw?=
 =?utf-8?B?K3FoN3hremlqSk0rdHYva2FRQ0xWd05TYkY5MXN5RUt2a2txUElRYWVPZ21r?=
 =?utf-8?B?eEg0Z2xjVWh2TFVMWlZtNlh3dkNGQTAxVUdPQUUwSmpWZ3QxVDZBL0dNampr?=
 =?utf-8?B?d3NMdS9qUGtRU1lRZFJTVk9CUTZIeG9XVHBZVnJNQ1g0YzRldzVmMTJQcVhv?=
 =?utf-8?B?ckdPS1ora3NZME9YTkZsZXNDSDQzcW8xdnVCeGNDZDlsRzAyY2taYWtMQ2xt?=
 =?utf-8?B?bFp4YUJabXFoUzdMVU9ldnpnWEZFcXVjRzFpNjhrK0Q5TEZPdTJrclJUZHBh?=
 =?utf-8?B?ZHJOa2FGRHFwT1VpUjFJb0NBTlNDSDFRMVRGUW5DT1d2L1Z2Z0c0SkxqNFli?=
 =?utf-8?B?RnFGSFltZXpYY3p6Y3ZUTnhydUFzU0ZZM25QZTFaanUySm9jdzAyMXNMUHVS?=
 =?utf-8?B?RGlWUnozN2NVV0s0MkJORzZmT1BrSHJaWEZiM3JjQ0V2aVdRTzBqTVZmemox?=
 =?utf-8?B?NHdIaU5yKzRRdWhKdDVuNTRsNzRZMFYyY1dVemNyYjU4Q3dUcUtudHl2aGJZ?=
 =?utf-8?B?UTJYSHRwZXd3Uk81ZGIvaXJYWVJtYkx4VDREaHQ3dGhUT1liWXhmMWxnUTB4?=
 =?utf-8?B?TzYvSTk2STIwV2F6UVVCbW9FcXV3MWl2V1JrcVlkeEdwWG56TzA4cUhJczdq?=
 =?utf-8?B?cUpocyt5d2xmdXhud1hVblZ6MGhiQm5ORlBqWW8zd094YStPWW9uUG9QQ3c1?=
 =?utf-8?B?SWxFWUJzTmx2dDF2b1BjSWh1bE41bHhIc0d1UnRBODBpMnk2OVNKektlU05h?=
 =?utf-8?B?Vjc5eVlOc1A5NS9ZTkZ0MlR3WWJFV1lvRHJISkhiSTB1WGpCRUpBd2UzSVUx?=
 =?utf-8?B?VTd5SGNsdEJTVDVDdFRTUkF6VytmWkN6dG50dlhRTXN0VVZFTnZwSWY0YXMv?=
 =?utf-8?B?Q2dtejZ5Z3k0QkVseTZWK2lDR0MxY2FSempSRW40RmNkL0RwdXBldUMvdE0y?=
 =?utf-8?B?MUFnY1Fucjh5dWRmaEhrVUFpM0tqank5SVJFNGJIeFVYblVydVhXOENoSitG?=
 =?utf-8?B?cXJxQVpyNDRKWlpBOXBWQmlNYVVXNFN0c2pxUUxjeTFXYmJXTlA1WVNJbzRl?=
 =?utf-8?B?VWVORCtIcDh6eWdjWmVFYU1BTmlZWVJzYWhhekYrQUNTVFNFSXppTDNFMlFk?=
 =?utf-8?B?dUlkbWd1R3FNZmJ5dGFvZ0NIWHc0VDVpYUhZa3UwaDJmUXpQMm5lMzJJTm81?=
 =?utf-8?Q?Q+rlBhs+QK0Sx5ScU21xSrmC22nKVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pJR1ZYQTFPWnRiei93OTJxVzRlYS9XaFZqdzgwMk1vZHlxSWlCSzVDYTBr?=
 =?utf-8?B?LzEwZVdVTnBVa3lmbzR0c1ZacFpJWmtSb1ZqelBjbk5OQVlJdWVoUnoyMnFi?=
 =?utf-8?B?WnBBTHY3VmF1c242blgwclJ3Uk1Ha0Y4YkRhZ0M3cCs4cUFTbWZUTjY1K1Fs?=
 =?utf-8?B?VStPRExubStoOW5JdGpyUWVyYmoxUm5QdkgvTU5WdXVwUDFDa0NXbnhOa1hh?=
 =?utf-8?B?YXZxUmdmeVM4a25NcUZCVWlKbGV1OXUvYmtVbkZQR0doeFBCZ1VDc3loRE9q?=
 =?utf-8?B?ZkxvdE5XT05QdXVxay9VS0lMcmpMRmpPYjdpU0hzSHdkMkdzRGVBcmhYaTBw?=
 =?utf-8?B?VlBJZmN0aWVTVnIxQ2NUZ0pwR3lHTUxPc0lMaWVWenBUQUhSRFB6OGM2WGpW?=
 =?utf-8?B?UWcxVG9hUi9ZRjgxdXdXRFBzK3R4RVMwaVFhT2dOQnYyeWNlK2dMU1VLQ3d4?=
 =?utf-8?B?T2Flc1ZtMERPYU9HRlBoemU5dWNEZlFNeFhYd0ExZHFaYWErc3Z2OEd1eFpq?=
 =?utf-8?B?RVpjVy9QL3lNQmVkUER4bWhPMHJTOCt1enZEazF1RzBaYStRU2ZzQkJ1Ukwz?=
 =?utf-8?B?NHBxU2l3SkttbW9CRUNLdUF5RWZRSGFiMyszMDRHVGVZNkgrbG5MNy9DRUJE?=
 =?utf-8?B?WWp6TUwraHNEUU00U2s2MDlsOFU2OUNiTHIxVHU2UGg5VzNzSnNjYnRlY2dM?=
 =?utf-8?B?QnJsVFZVMFoyUDVCZ3N4aW9WTEwraGh4L0UxWmxYRDZWSjFPcWF6VlpNQ2ti?=
 =?utf-8?B?VDhjejVheVZqeER4UWZ1NjVSbXI5bzI3Nkg2TXNLM3lxbkhXSXNXUnZTaWZW?=
 =?utf-8?B?eXBYejh4R256WWo4ZVJYQWpXNVdXWFFzSWN1aEhhdjVZV2YybU5pWUJEd1dH?=
 =?utf-8?B?SU02b3p6cE9JNGMrTXgrY0ZQNm5rQ3dteGVVaHhZSjVEQUFCZG9UbWpvTG55?=
 =?utf-8?B?U2RqMFlWaUg5M044UVNLUnp4eXhoVmM4VjlMbGtWb3pxajVyUnFVOXJqcUFw?=
 =?utf-8?B?TEUrblVOVUtXR0dmMmpYN2NsOUJLSFNBdkJRb3BuSXFHMjlBZ1FXQUZVY2ZS?=
 =?utf-8?B?NFN0eEZ5amN5VG1IUWFOUUtXQ3BLRXZRU2hOUkk2T0Q1am5HRUM5UzBRRmFt?=
 =?utf-8?B?L1FQcExoekx5UmRFVTRuR21GYXNFRTJsRlg2MjFUT0orVExrOHJ3YVVXUUgr?=
 =?utf-8?B?dmxqVUpTckVDdjdIYStHUENNb1pSa3kzMGU4Q0t4cUk5RU1JNEtnOXlmRksx?=
 =?utf-8?B?TXNFUUZBSUhGVE1QZWw5WE1OOGlWZ2NlS0Y3eGpQTHdxZ3ZvcXFNMDUvRDNr?=
 =?utf-8?B?TXBJV2VyRHVTZGtPQndKeU9tbWhYK3FLQUJzRmlYdmRQWEtDNThBNldocDAw?=
 =?utf-8?B?cktkSW81KzBadHJOK1Fua01sN0JuZFA2bTQ0WnVPSGtKQ3h5bGgrVy9BdEJj?=
 =?utf-8?B?Yk1rVjNUWGExZ0YwNW1JSDZpYUZUcjl2S29KWU5sdXYwSVZWRzF1YmV5K3RC?=
 =?utf-8?B?aTRRYTlReUJja3Z3ZnlDdnZRRTdZK2l1a1RyeVVFVkd5MmtYTjFmd2NiQ1Vh?=
 =?utf-8?B?UzlSVk5VWGVpLzdvM2x2d2VtWEJGWEl1YWlFSFpwTmxGcnR5R1J4ZUQ2Zkhz?=
 =?utf-8?B?TmZrMitwQjJvU3RuNklSWjZIY2VKVGhaVlZJYW5XWHJJOHpVT1JJbUQrcjdE?=
 =?utf-8?B?ODVGdmRESTl0WEU2cnVKdFg0TU5hcWk2aDgzemcxSnFKN21QaTFaeVo2UFRr?=
 =?utf-8?B?WEI5WnprRVZIdXNnSUlhNS9JclI5Y3FVWklpUldiQ2F2c0FMMDJJUzA3NEdv?=
 =?utf-8?B?VHVMWlhVMHU2V2hpL2tNbFJuRndIeVVYT1lnNjN2UFIzYjlPU2xtd2RpRkpi?=
 =?utf-8?B?OVg5QW5ISktnMDRjWDhPaERic0JKRXYyNEpLbXJxbkp6R25sVDIwUkNtRk96?=
 =?utf-8?B?dHhLemxldjJJMjJ4NVk4STBETDk3Ym1GWWJmOVJVRlJYbG93aU85T0VnNEsv?=
 =?utf-8?B?MWh5MHQ4V1UyV3h2U25qV0FWdWlna0d5bktVaEF0NE9ESHJFYVJ3ZXR3TFRZ?=
 =?utf-8?B?dE5hWUZPTDhKMWNZMi9VRGZneG8yK1F0RkpxbFdIaHhrRzVoVVBoS2RXQVFs?=
 =?utf-8?Q?bf6PDIQkTS+HNaLyGjQ7Z3q2t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2efc1ef-0ae8-4cd5-0e8b-08de2c24e0e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:16:43.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Js3yq3beezYnIEcI9Z68cPI2ZPpU3UIMSh4I4/X6xnRKTG1x8IbQB8Z+n9PhXPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351
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

On 11/25/25 13:52, Thomas Zimmermann wrote:
> Remove the rest of the kbd support from DRM. Driver support has been
> broken for years without anyone complaining.
> 
> Kdb cannot use regular DRM mode setting, so DRM drivers have to
> implement an additional hook to make it work (in theory). As outlined
> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
> setting. Non-atomic mode setting meanwhile has become rare.
> 
> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
> nouveau use non-atomic mode setting on older devices. But both drivers
> have switched to generic fbdev emulation, which isn't compatible with
> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
> commits in this series for details

Amdgpu is heavily pushing on switching to atomic for older GPUs as well. Timur and our DC guys have made quite some progress on that recently.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the amdgpu and radeon changes.

Regards,
Christian.

> 
> Therefore remove the remaining support for kdb from the DRM drivers
> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> there are no fbdev drivers with kdb support.
> 
> If we ever want to address kdb support within DRM drivers, a place to
> start would be the scanout buffers used by DRM's panic screen. These
> use the current display mode. They can be written and flushed without
> mode setting involved.
> 
> Note: kdb over serial lines is not affected by this series and continues
> to work as before.
> 
> Thomas Zimmermann (5):
>   drm/amdgpu: Do not implement mode_set_base_atomic callback
>   drm/nouveau: Do not implement mode_set_base_atomic callback
>   drm/radeon: Do not implement mode_set_base_atomic callback
>   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>   fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> 
>  Documentation/process/debugging/kgdb.rst    |  28 -----
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      |  35 ++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       |  35 ++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       |  35 ++-----
>  drivers/gpu/drm/drm_fb_helper.c             | 108 --------------------
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  24 +----
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  74 ++++----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  23 ++---
>  drivers/gpu/drm/radeon/radeon_mode.h        |  10 +-
>  drivers/video/fbdev/core/fbcon.c            |  24 -----
>  drivers/video/fbdev/core/fbcon.h            |   1 -
>  include/drm/drm_fb_helper.h                 |  21 ----
>  include/drm/drm_modeset_helper_vtables.h    |  23 -----
>  include/linux/fb.h                          |   4 -
>  14 files changed, 63 insertions(+), 382 deletions(-)
> 
> 
> base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362

