Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB9B3462F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37CA10E4E6;
	Mon, 25 Aug 2025 15:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uaSlHOL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2834210E4EF;
 Mon, 25 Aug 2025 15:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmFgOfgbVgvqc7aZTIelBQ0Itm2WOh79YK1PswSCOkbbOWRcvEsWPxfPWEVM2wCveQhxRgO6xVnzFqwhPw66R5j3+S9IiyiJHVmbV2Umh7/zUmlq5rOxl46kUFjo7nFo85W0/q8QbrkoAJ3LcmtA23rPEAkeEBxKKIthpFrQKahEmRz54MiT4ii96RlPtpgZy7Y21884RzLZd/idIspN3YE9iwvoOZtkKG+qgwlzQ2MLzkFggnYiE6ZlkPmLCZ7ssUIZg539m9zT16XsmDBwS74Zui2uJdpFKdtghUE5ymc2SRpRpD0i81kH4ERpg9+GBSWw0VwyOIinuQ4sBzwV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhMWPhsPzCRNvhiJ+xrUF1kZmLnFGH1OG0aoieJZ/fE=;
 b=ivrLOPSKClmWR4S1iAUfiQKgpHzfEpBVatyeTTBBf4fTfpvO1ZTuD/Ify2l1wp8KPfbjD73lXq09t7H6aBVYG4iVQ2z6jvrfVIZFFQbJ3GkuwWZyCu6DlxYXeTHq+2C4hU83armrZIa8G4X5fI4zATfHQBkmFNp5mXjTSL+NcX8ucjJF6DQFu4KhxhSb6DB1shp53P2sSizPpYf6aGssADIKjEJ5c17zfLorpRl3znH77QAxC/KUEUTztWYG/Mmp5pVU7dRktTuUpASRUA2wQfWGppJGvzMJnPGkcDNA3t+OduO1gMuxwA06dHibd4AFwIy5I3twLeW8nALcq3yF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhMWPhsPzCRNvhiJ+xrUF1kZmLnFGH1OG0aoieJZ/fE=;
 b=uaSlHOL3scYoA9Zydu7MB9ddkDlie6gC8rw1gOR7qPnO2nz5PvgRJGEK9I43UPOT6sm0heHjZRKmFLJMMMMr3K0+FbwjhzFijvh5U5fI02PGYYlYQ4k+miDkA7QrTQCrLj550mi0YjuEg6853BI44HEAeELpjtbENvdU64nePw+j+gjCT4Qse6qRRAgrtRq4X61dYveD7nzkICPiAVmabcDWibtNLnKWH3P4coPDcOuhc3YxwR04bTdGMw+lWZG8vTmOnfpZfFywLvK2ETwIZoGC7q0/aKb47y++nAnJ1rvVAf3HZ5JKqZbHp7tu4C4XKQ2tA2ydPDx6BC8YryXW3Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 15:45:13 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.021; Mon, 25 Aug 2025
 15:45:13 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/5] gpu: nova-core: firmware: process the GSP bootloader
Thread-Topic: [PATCH 4/5] gpu: nova-core: firmware: process the GSP bootloader
Thread-Index: AQHcE2MBPfCDFt57G0GMlQTP8sKZUbRzh7YA
Date: Mon, 25 Aug 2025 15:45:13 +0000
Message-ID: <0263077d24090821ab3b035a9940cd7f9a7001f7.camel@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
 <20250822-nova_firmware-v1-4-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-4-ff5633679460@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ1PR12MB6075:EE_
x-ms-office365-filtering-correlation-id: b1caab51-b494-4f75-450d-08dde3ee617a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WjFRT0d5MVQ3ZVBDSTRFeTN3ZWh6Q3ZvdjlrVkpKKzR2Z09qcFFLdCsyNjdm?=
 =?utf-8?B?YnRTZVp0N0lRVDRHYmZ2dHdRaFhxQ3hLSGd3YlRwUW1veUEzbmlWTVZ0VFNO?=
 =?utf-8?B?V2ZRdTZ0NmltWXJtOTk5cS96ZmE4T0ZYbW93MVhvOG5QK2N6cG4vRjJKbUht?=
 =?utf-8?B?YWpiT3ltVXhpMkJTcFBrM2xQK2JvYmlNclJpV0NwZXpyN0orcjNkTVJJcUZH?=
 =?utf-8?B?QUNYZzA4dFd6bTF3Q3hUQzFpdVkwR2R6SGZkSDFqWk0yMithOHZDbE5oZlF1?=
 =?utf-8?B?MVFTemM2M1NVbWgvWUEwbFZhckhydlBRYkk5eXErRnpDNVhMa3drbUYyVVBI?=
 =?utf-8?B?R1p3Y0pQTDVwK2VzWTFJZEdyb05BVHZCblRIYXdFc083K3hvUXNseFpMeTdX?=
 =?utf-8?B?MDdHNFJGSys2TE10YmFYVzVORHdhSXFzaXBzTXdEMDB5Q1JVMEx3Nk1VUi9X?=
 =?utf-8?B?eGhJSUN4NDNxTGg0NDR4SzZCZnVJYm5kTnJyZUhaNmhWaWdEb3BIUVMvT0RP?=
 =?utf-8?B?cVc0MDNCQnBxL3ZQb2xWb3BZRjJzMnFVYlN0aXVYZVJaOWZ6YzR2cUlmOURS?=
 =?utf-8?B?Njd5MWxNclZjb3dtYnlLRjJ1REN1Y2VXNTZFUWd2UUp2S3hpK0VCNFZnamNV?=
 =?utf-8?B?Ty9XblpNWUJrV3ZnQzlhM0tUVG5iZGc2OWtPVVpIRXYzcmZLai9LS0d3Tm1y?=
 =?utf-8?B?QW01ejQxZmM5VG1oRE5DcHRXeEl1UFEzc1Y1Zy83emNmS2xXZGg4LzdpVldT?=
 =?utf-8?B?dU1kcmVsaUFFcEw3N1ZmREplK05RUDBuMjRwRDhER1UvQ0NSSW5XdVRiQTlt?=
 =?utf-8?B?MjNTYWlOYU1XNGc2elZleHVIQXh4ZTJuRGVwaXNJVlVEVERRbUkrMWZ5ODIx?=
 =?utf-8?B?VEdDbytscFNNdHlhZ0g1MXJLS3NpZzkxSUtKa2FCdFg1VldkV3g0RHNCSjJu?=
 =?utf-8?B?UHVobjFScHQ2K0RJaXNJR3RnMlJlcjB2QUpNVzU2OXNQY0xqc3NTMWQ0WVpj?=
 =?utf-8?B?UUh2R0FaZTkvcVhuMlZHZEt5ZXplNFU2ZjNKR2NJa0o3dHVVeGhuaDB1WVVX?=
 =?utf-8?B?cDFwWm5NSlQ5UjB2elhsNHBSeWh0K3h3enkxSW5xQjY5aDVQQVJ1TkFNa0Qy?=
 =?utf-8?B?T3NaOVZFb0ZvZStWRTQ1Tk50YTRpRFhpTVhtRmNyR1d5OFYwakFKY0hPTGpu?=
 =?utf-8?B?MUFCZmJRZmRBejk2QWg4MTU4bWpTbzAzblNDZFVNSTljcjd3MjRVUjUyZ3ZU?=
 =?utf-8?B?OFRBMk9kcUUvVnBaaGZWNVFqYVdrR1BGTGhHV01SNnVQeUdjWWdIUmFWZFdY?=
 =?utf-8?B?eGhqVFFMV1AwN29PZmdrUWpmaU92ekl1bjVZajlEMFJWbm51YUltcDZoM3NF?=
 =?utf-8?B?WFdnR1NzanY4VGcwSnE1bVVXYWpZQ3ZpQXVyU3BxUGgyNlBnVjlkcFFvTldZ?=
 =?utf-8?B?V2t2TTVPSXVTTUtTcnluVktObEZrdHp4YTBKZlQvQ2hvTlo2Y1ppVGorVzBk?=
 =?utf-8?B?YmVwUEFxSDIyeVZsWVMySVN6RmJBQnNkbllMSUdCSW83K2ZIL3JmWFFKaGo5?=
 =?utf-8?B?aHJpVldhZ1EzNE5tb2wxVzVVSzYxUnh4ZUkzUmpLL0U2Y21LeUdCdTBQcVdU?=
 =?utf-8?B?L2ZVSGQwTmZsUWt3QXRUdkFvbXFJNUcyK3k0YTBRaGpCaDZRY01kTzYwamdL?=
 =?utf-8?B?Yng3Q0FteDVoWjkvSTNMZnFIMkZZdGRkNHBKVENOOXZBZjh0UHlqWFQ0akFs?=
 =?utf-8?B?YWNqVTFQZndVT1hBRkdGZzkycXl5UENjallScHlRWjFGVjNWSHd1RkNTTEY2?=
 =?utf-8?Q?/7gZ2Ia4UVj+XApIobSmcC5N+KngwrvUa8TeQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmNGdnRHOG1za01YeEFDQmVQdHBvd2dMTmN1TDlhdE1hVk80K3B0dW02OGwz?=
 =?utf-8?B?R2tFUEFjQ29BWC9QbGNvK2R5QlJ2QXJMRjFtUEhYZTZNUFJxbm0rVm9vNXF4?=
 =?utf-8?B?aTRxcjZ6aHFEOHVTSmdPd1JoNDZBRXVKU3I5dFdhYTI5MHBSMndKRkNiWlMw?=
 =?utf-8?B?cmV2Y256NGdwSlJBWTZkdldjbDdRMjFxN0dORlF1S3plZ0pBa2F2SXNjaGdT?=
 =?utf-8?B?M0wvaEpBMnAyOWM3WXdDajlpU2lRRzc2WTNITFVMYTZvVDIyMzNVbnBSbllO?=
 =?utf-8?B?MWExaFYwVncyK3lIaXRsZDl6K0ZLMGlQT3hGWmtoVTl1QzRWalRJZlhXMGhI?=
 =?utf-8?B?WkVOZ01WT0NmVTdYelczb1prUVZ4UGxyb2Q3MU1jOHN6RmVNcTZSd1lRT0N6?=
 =?utf-8?B?UE5zeE4vc0NUM3ZhUHhjc3JSOTNZY3NQWERHMFRqN0xvMUg3TERuOFh3eS9v?=
 =?utf-8?B?bDRPY2Rndk9XZzVlcFBIMlQ1ejV0SG9ZbGZQT1R6T3lsSm1zUm1EVkR4akNu?=
 =?utf-8?B?anp6UncwTjRCV0ViRldRN1FwRGk1SFBZVkNLTGh1ZnFhdlA4T0NocWhiRCtp?=
 =?utf-8?B?Zi80bWNaK3F1d3ozcHZKdmtYVGdmRDEwVGhIejF5ZjhmTlpCY1lQZlBDMzBm?=
 =?utf-8?B?cjQrVU1FMXVBZE9pRmlDTkp2Uk5lN3NNQjZqeVNDWTVKOW5Hb2l0Ly91czB5?=
 =?utf-8?B?K09KVFJiY00vVTcrQ3lNaVZRMGhGRmt2MFJkc0FwWlNlVzRnK3d3dldmQlBy?=
 =?utf-8?B?OTRwOUpQRndyUEhPZm9UM0RxYTRnN0RRUDNVWVJ4c1p4SUtLN3NkbEQyMTZz?=
 =?utf-8?B?eHN6citINUtYNFE1VmViQ09YaUhjWERXL0FNY1FQdkZRK1lMcW4rNkZWbmZy?=
 =?utf-8?B?eUpNbjYyRUxad2lrUDdhR0RnLzRWTDI2L0J2U0prNjcwMzdPbVY3Qzh2SHZa?=
 =?utf-8?B?blY4ZnY3eXVFaGpWeFJBaFJEVWxEUVo5dXk5MUs4T29FbVo1bkFRRWdhRnEr?=
 =?utf-8?B?eEo5UlFQelFnUlZSanRTemwzOFlIcDZHS2c5UXNiRVhYZ242L2pOc1hCbUFE?=
 =?utf-8?B?aHRtcEcrRzZoU0YzL0JHMTdlTkpTOVpiRzJ1cm0xemRMd25sWHhGYWViSG5H?=
 =?utf-8?B?MzVPM1J1M3Y0dlMzaVBKRXFpdjZld1hKbHVrL0dOeEczelhKTjR5QXlCRE5j?=
 =?utf-8?B?ckd6ZU5jUTk3RnUrMVVUdmFFNWZHamhOQjdnZWFmR0U3NWE5enZyeEhNRXNN?=
 =?utf-8?B?bkc5dDJXazE5MTZ0ZVU2RjRzSHhqRDR6VG5ab1BOTlp5anNQSkFTeHhnVFhV?=
 =?utf-8?B?RDZ0U08rY2hLUWM3amUvLzNYRlVCTjNXcGhLVmY0RFZoTlVrYmc4VDZhN0hG?=
 =?utf-8?B?UFhNd1I4c1pteW1KRy9PMGl3dGM2VDIrdXltd1RpWEZXc3hrL2lESEd3eHMx?=
 =?utf-8?B?TWpkMk1DMUVsaGcvTHZYOWxUUlhUSHFibnhpSkFSY1ZZQVpMSFNZMW5KS2NO?=
 =?utf-8?B?amFmM2Y4TnMzNDZad0FEbjdLMWk5cC92ZVEvN2ozOEpjL1ZINW96ZXBGNXVJ?=
 =?utf-8?B?UUJUQXQ1YStaTFdTYnpJL1pFa2xoOHBLYjJZaWl2Q1k2OG9HbXl1eHFCN3RW?=
 =?utf-8?B?cHFUd1RCWEptdFJMSzg5S2pLd2wrZVJmSnp6ODk5ZXFuTFBScjBPdDJBVzhS?=
 =?utf-8?B?SmNMbGR5Rit4R3RRY2NwZi8xdmFZUUUxMmZiZndZNzQ4QnFzOHhEbENDcWNv?=
 =?utf-8?B?SC9QOHJzMWV5VDRISGpXU0FnVmlOMWNGSjZnWHNHaHY5d3JaQlNSbEZEWHlP?=
 =?utf-8?B?MGZsN2FvZjFjcUxDSDk4WWUwTmhrdzZNeGEwU3IwSk5ZM2ZGRUtOQi9ESlZL?=
 =?utf-8?B?TFN0RnFjMW5VYjBlaFVYc2hrSEZqOHlxWk1QUlFQMktFVTE4OUlwYVZXYVVM?=
 =?utf-8?B?YTh1MzAzeG05V2hZbDFOUkxUdHNmOXFGRGpuaWxDbHM3RWlpOHViSFlqYnVo?=
 =?utf-8?B?WGE0V09sT1dobXRuRlQ3Y1ZQbTlkaFBPKzFqaWVoRk9HTXhrRnNBSUZXYytI?=
 =?utf-8?B?WkNIOVRLY241WWRpMHlkQm5nOFlBZEFJMWlwWC9HL2dNSGkrOFNuTkltZldN?=
 =?utf-8?Q?wnRBJSr18oYsgenOABhmotdJi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEC145C2EDE66C4CACFF5DB0A73F6EEB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1caab51-b494-4f75-450d-08dde3ee617a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 15:45:13.3463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tgnYdTUSboe81cq9Q/1+TuurtMeKe9qpobLPbY0Ez4euZ1OzvuLm/7puxFVsRzySweC8Vb9P0y9iTk2naKhHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075
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

T24gRnJpLCAyMDI1LTA4LTIyIGF0IDIxOjQ3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVGhlIEdTUCBib290bG9hZGVyIGlzIGEgc21hbGwgUklTQy1WIGZpcm13YXJlIHRoYXQg
aXMgbG9hZGVkIGJ5IEJvb3Rlcg0KPiBvbnRvIHRoZSBHU1AgY29yZSBhbmQgaXMgaW4gY2hhcmdl
IG9mIGxvYWRpbmcsIHZhbGlkYXRpbmcsIGFuZCBzdGFydGluZw0KPiB0aGUgYWN0dWFsIEdTUCBm
aXJtd2FyZS4NCj4gDQo+IEl0IGlzIGEgcmVndWxhciBiaW5hcnkgZmlybXdhcmUgZmlsZSBjb250
YWluaW5nIGEgc3BlY2lmaWMgaGVhZGVyLg0KPiBDcmVhdGUgYSB0eXBlIGhvbGRpbmcgdGhlIERN
QS1tYXBwZWQgZmlybXdhcmUgYXMgd2VsbCBhcyB1c2VmdWwNCj4gaW5mb3JtYXRpb24gZXh0cmFj
dGVkIGZyb20gdGhlIGhlYWRlciwgYW5kIGhvb2sgaXQgaW50byBvdXIgZmlybXdhcmUNCj4gc3Ry
dWN0dXJlIGZvciBsYXRlciB1c2UuDQoNCi4uLg0KDQo+ICsgICAgLy8vIEdTUCBib290bG9hZGVy
LCB2ZXJpZmllcyB0aGUgR1NQIGZpcm13YXJlIGJlZm9yZSBsb2FkaW5nIGFuZCBydW5uaW5nIGl0
Lg0KPiArICAgIGJvb3Rsb2FkZXI6IFJpc2N2RmlybXdhcmUsDQoNCkNhbiB5b3UgcGxlYXNlIHJl
bmFtZSB0aGlzIHRvICJnc3BfYm9vdGxvYWRlciIsIHNvIHRoYXQgaW4gdGhlIGZ1dHVyZSwgaXQg
Y2FuIGJlIGRpZmZlcmVudGlhdGVkIGZyb20NCnRoZSAiZ2VuZXJpYyBib290bG9hZGVyIiB0aGF0
IGlzIG5lZWRlZCB0byBsb2FkIEZXU0VDIG9uIFR1cmluZz8NCg==
