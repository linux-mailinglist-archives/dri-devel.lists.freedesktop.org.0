Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3BAB18435
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961F10E899;
	Fri,  1 Aug 2025 14:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EBDFg81U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9010E8AB;
 Fri,  1 Aug 2025 14:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjEPm2xvgWPhZuJqa0zRtc1t/tMfXecFf0Jm8X4glXCLzNPgETUYZjDeeI9joE9PZknkh4m97pvLiEqktjYz5hx/dxjOlqGSSpcntp682y6vA6tz+1D/XNNw7vTwS95CZals+IyDluwmn2MEc2OHD9pN1WYZqkby30fv6E+NlVQu56HytlRcPi0VE9zvnc1DRi7ERaCBQnR0Pgvhs1xETRo3AEHK0T6pVVCXgTZEikE8gAtLuUC/9t8tr8u6WKBrGdfFuVb3vF8NVPU8G5xBYdrlQXE79Jz4DHdc0vJTVx8XPbpOQYQMgA2qp5QUufQZW8XzhnHlP6PMhB04iLiqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1A9TaVPQ5MZ/pzANt+kUlOzsJl+PqLN6n/BRRSy4YY=;
 b=uMsYp3P+6sBeUiSrXNebkZ21nOSrpKCb+glycEuYCYfTUbH42sgctHj1hbvEIzTiz73HZ8mldNEO8DujylOJyoS/2JBWuDXboGNAW1eIc7rsh4wmMNoMIX0mrLBygjJQuTlyFwVdiYhdFWFT1HuIx5PWLGm7xw0U+QfCLhbC2D++9CCq+iVjb1X8Me7iRaJxCzf5JMjeME8QekfNIO6ZG9ia1VhBBhWbVL2fe/IRdwiSUOC+3Nj1guOV9vo/cgom3Y8Wl07NbbXxfe6vBqiVCl80o+1fkgkMn2YVlLeRkheim9ND4UCfcavbynjBxPgR6ZlaJS6MFNe0w6Bo87omnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1A9TaVPQ5MZ/pzANt+kUlOzsJl+PqLN6n/BRRSy4YY=;
 b=EBDFg81UFGmxJq1FOz0ZHSfn6jxUQ90tBBs7CZD79UKoq7nG9tIf93Be9yilct13FvHOXyzOumcLcAcmoxtQMm/62VUx2xcXvLJCl0QD5PvEZAnaRy9HGg1OFleqc8mJbojxfLaBVq/mO4/T4ssEEwReNWYSiDDUr1UO8jVhUAOATGUZ4UHqWPBn4TLNcKJYvGUwaPZLvBUzW6lRg4Rc9hBB5ZNumW0Z7ah15lbYe5mEWqeX4gW/elwXiUHWpRBwdhUAQ6+Qu6zL9VHt23aG8rAqpyF1N9fwItaV6LJy9Y6A57fSCpeo0B4IhUmJxs2R9iOlwAQjAsDve3HCO+PVUQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 1 Aug
 2025 14:50:17 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 14:50:17 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau: Remove surplus struct member
Thread-Topic: [PATCH] drm/nouveau: Remove surplus struct member
Thread-Index: AQHcArhaZgaV8Ssmsk+22JdzJ0CH7bRN4b4A
Date: Fri, 1 Aug 2025 14:50:17 +0000
Message-ID: <809d2ff29bb87f782f7a813d67d3d604882db320.camel@nvidia.com>
References: <20250801074531.79237-2-phasta@kernel.org>
In-Reply-To: <20250801074531.79237-2-phasta@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|LV8PR12MB9084:EE_
x-ms-office365-filtering-correlation-id: f3ad844b-b78e-44e4-c70a-08ddd10abb00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ckRRY1N2WkVVakZ0SHdFTkZpRytLcVloTldNcEcvS0J4OXRIZjdETW1XdEs2?=
 =?utf-8?B?TkV2SXBLM0xibDVuUHJwVWtmM0p0cFZhWi9ydEs1TU5qVHNoMHFsU21BQnRx?=
 =?utf-8?B?ZUlFaVE0cGlDSTA3S0NzQnlCN3JxdTlyRW9SaWR2WlI3dmxsM2k5WFlobkY5?=
 =?utf-8?B?Zk41aDQ2YWlSNnZwWkRTRForZkIwSWhJdXNDakJJemN6di9oallxb0J5NWRP?=
 =?utf-8?B?MHpjNi9RVFRtT3hidGh4RVlGYjhFaDVWK0NTQTJha2htSUt0SWNBMWVmZzZN?=
 =?utf-8?B?Z3YrZjVNQVkzSmQvazVpSmFUMjhESTdhUTEvMVhoVEtTMFV5SkVMRFpISUlk?=
 =?utf-8?B?eHZ6L1NQYnBNUmFBMkUyVmMzcmFSeHJMUFlBQXBWNHl3ZUNtZ1pJSVhzMDJD?=
 =?utf-8?B?S3FlNDFkN3l1K3QwN3ZaeDA3bExERk5GQzRPdFo3UGViS2YrRThMMkpvODdy?=
 =?utf-8?B?N2xyVVVqbG1pRTFRc1BEL1FhYjd2eTR5QjB5bk82V21CeS9GWVFTeFVTdStp?=
 =?utf-8?B?dzdqYy92ZThrK2l2Mnh5OEh6UGVQMXdtdzFNdUlLdFc0LytIdlRUakZpK1ls?=
 =?utf-8?B?MG1icGtjMTZTeUhSaFpXdXJ4ZU82bC9IMTNxeHdWWS9IN3NvTjFSckQzS3BQ?=
 =?utf-8?B?RkJFK1RtYkhBc1J2L0R2ME5hb2hrdjZiZTk3MFlEQkl6aURiZUFaVHdDNUZi?=
 =?utf-8?B?aUpDb0xHOGdjTkZtQktFRzg2SXhaak84RGVEUHpsOE9tTHNiRTR2d1c0YnNQ?=
 =?utf-8?B?eEVOaERSUjM1SzB3UDB1dC9Dak8wRGRNTkxvbHBHTG4rYXM3YUtubWNhZnpx?=
 =?utf-8?B?L3IzYmN3Y3o3bldPV1BrNFZrZzB3Sld3YXB6QytFSXZYK1E1bGVTQ25BNzBr?=
 =?utf-8?B?MTFYTVBQczZBMFJicGtYcEMxS1BJUjAyeG1Xak5IZHdRMmJDWnFieW1jRWZa?=
 =?utf-8?B?MmNsL0FWTDh2UnhPZDIrMENuNUNxdVp6aE1yZWx5SDlyK1VSVGl2MmpSNVNs?=
 =?utf-8?B?cXdEWDNaaEIyU2xmMEE0RkxZYmNFRHBrcnFzTWZWZUsxcnBXSUd6dHQzRStk?=
 =?utf-8?B?UFlYQ0Q0NXpLVGd6MS8xaU9QaW9xQWk1RUpzcVdTZFQrRWN2QlpJZ3U3T1dJ?=
 =?utf-8?B?UWw3RWlJK29ETEp2TnQ3RmxuZGNKRXo0R3o3TEE1aEJQUkJsRkZSN0xrOHhy?=
 =?utf-8?B?YkRYZ0lxbW5jV3haN2tpamtDc2dWYkttY1NvTFRqTytCNms4dUxsSSthek8z?=
 =?utf-8?B?TUovemtTOWFwQ21IWWlJZDJiOXc3OTZRVm91UDRqVXFwM3RnbnRQTmRTbWNt?=
 =?utf-8?B?OTFGR0FFVGFnK1hNVHZQRVduRFQzdVIzd1N0bkxWR3ZNbmwremVramN0bVFy?=
 =?utf-8?B?M3FkSllYR25aZFJqQlNxZC9pZlJ5blNtVzluZUk2OTNCTHhrQ0lDSUYyWGVV?=
 =?utf-8?B?d3pkWlZJajZjM3g2OEE5ZFM0ZVN0YzFOU0ZXTUNkTWhVcnVWNCtlV1lWL2Ew?=
 =?utf-8?B?RFVvaXF2di9Wb1puOHBSckkwRkplVTZwVUFnRFBnSWZ3YTlzY1MyWDNJeXEr?=
 =?utf-8?B?UlZoam8yQkJxWUsrMFFMV2pxdGVrVXVEcnRMUHlzWTdma2VaNXlHNmEyMmQv?=
 =?utf-8?B?T3BtMDBFd3NlVnNTNlhzWmpENFJMQ3ZvSmdUNHNYZjQwcDZ6c2ovSzdVbVFr?=
 =?utf-8?B?L2FqeThUWUlVbC84bHg0aHpZWGZxeUNtMHZEcVBmaWJSbUc0V3ZidGZqV24y?=
 =?utf-8?B?anl4Q0Y1Y0EySit5RE9haEE1bW9kR25LU1NaYkszdTZ6bHVUcnBGK3h6NUNT?=
 =?utf-8?B?VENnMGR5WVpOSXdHdDNFa3BMY1BOVE5TUCt3TjY3TUtyZHR5d2lZUVlRSzgr?=
 =?utf-8?B?eWNVUC9GZE9IRTkzZjNBZFBpZjRIVE1kMWpVYlhjM29xaU11Z3EreU96Ti8x?=
 =?utf-8?B?dktNUFI1bkpLZzBpQ0JlZEE2dnk2aVYwdWd1eU90a3E4ak9KdGJ4VThrOVpW?=
 =?utf-8?B?Yk1zV2NseHd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWltMjFDN0xkMlpWaGNrc0ZMRi9uc2YrQnRsaW9UTlo4NjVaanBPcFBKUGQy?=
 =?utf-8?B?M1NleThoYm9GcCtBYnZtSVRnVjFrNVhNZloreUh2M1Viai84SFhHTERudXcz?=
 =?utf-8?B?bVlNSDhtQ3JCL1RibmZ1V3NYL3hPWEwvMDJKSm0zVnp4Q3Z1Yi9BVGJTRlBF?=
 =?utf-8?B?aW15aU5PZjUzZ0M3UHVwcFZQcTVSZUZJVFc0QVVqd3lmOGsybzB3UVpKMXNl?=
 =?utf-8?B?K09hRW5GWXIzbGxhU1NGLzh2R3dBTW1paXBDN2dNVytaMU8vRGwyUmM2cXVS?=
 =?utf-8?B?WVN3ZU9jdGNGUmlzbE1pOU5sR2Vtdlo0bFJHQVlyS0Q2dlJvYlpiSHdYUFhB?=
 =?utf-8?B?MGJyUWk5QlowaGx3TTU0MzgwR1BrSHJFb1J3WTVITklSVk11YVo3QzljbG8r?=
 =?utf-8?B?cVE2UEFSVDlDMlZTRlZUbmdobkw2QzdmTEVHNVBNRTAweGVPb01lR3ZSUFRU?=
 =?utf-8?B?Tmw2dE9DTC9ZT2ZZK2JDbWRNOVFZR0Z1SEFGcVpVRlI3OWpmekVzN1FrWlZn?=
 =?utf-8?B?TFBrUWlhcXpXUlJaVFZ3UXJzd1dYT0lYQ1BZQThtZzYwdFdPOEM5K2FmYWtm?=
 =?utf-8?B?K1hneWZuMWtrMVIzMUpXYUttVlRwOWZEbk83Q2lZWDhXN1lxQnF1c1VUQlBz?=
 =?utf-8?B?Q2kvRnNFOFFSalRLYnY5WDJiVHZEK1B6QmdZSFZGTStEWFk4UTl6TkV2UFhE?=
 =?utf-8?B?alpEQUxkcGl1UkVxM2gwT1dUcENFUGtoWkxLaFBkbDI5ZUxVb3d2MVZuYkIy?=
 =?utf-8?B?dUdnUTZsRVgzcjgrNWVabEd1V0ZqVXpvSEdsNmZ6WGJGU2svNmZLblRBdXpt?=
 =?utf-8?B?eHNsL1hleXVxcGxLUWxpd09kK2V3SDZFSzd6OVBsanl1SXpTdE05U1luZHk1?=
 =?utf-8?B?TndEb1ovWkE4UXpKN3J6MDdEQTB2ZFhOZnJKY0x1cTJGL0lXYUdRTVIyb1dQ?=
 =?utf-8?B?Qml1RFpqN1JZMnVLYktNZk9xalVYNlZNVExEdE9UOHVpajlqbWFjSEw4aUhp?=
 =?utf-8?B?Q1I1SXNqdVJQNnQ4emNLV3RBMFAyeVJST3RNaWdWK1FmTGZpZ2krcEc4YnJy?=
 =?utf-8?B?R3FVVlhpTUExQkl5QnlPU1p5U3l1OWRUV1pxU3NmSkVMWTVqOWlpNnlNL1FO?=
 =?utf-8?B?NjczR1RKYW1PWFFCcWZNeTVrQlBMcXpLQzFEQTQwYTk1UjBhMktQd3d2OGk4?=
 =?utf-8?B?RXZacUc2NFFiVHU5RklDQzR6TkpMc1VwNXNPR3NvMDdqVmh1NnBhSS80VkxS?=
 =?utf-8?B?MUtTWDRxOXlqTlNvbHlQWUd0VWo4M1dnM252UUlrek1oTWxSMmhpUTdHQUxC?=
 =?utf-8?B?OWQxNDJtcmNGOWNsV3VGU1VsTys5M3RDUkdMa1orQkh1SXVkSXlOQW1IZGtV?=
 =?utf-8?B?UktXaUhhTGhQMEpLL09FWkdTVXpkS1E3R2x6YlVlTFF5cU1maE12YytUTXZZ?=
 =?utf-8?B?d2I3N1ZqOHJiYlNzNysxbjNlUlZXMi8wN09HVlRBeVZCb1RnczdQVHRqbkRS?=
 =?utf-8?B?UGd3RXo2ZTgxYmUzTXcvS1pnOFg2a0NmY01EaEJWQmdLYi8vT2NHSFg5MTNp?=
 =?utf-8?B?d1dIamNYS1ZkeEJ0N3pwUU1VSDF2dDFBRElISjl4dWRwQmFPMUg2SGkrYzBF?=
 =?utf-8?B?Z2dGL016ZGNmWG1Ba3J0TFVjakdVU1RWbWN2cmJyVWpEL3FTNnltTWJjYTd3?=
 =?utf-8?B?T0JxelFhb0ZXdVl6ZTNneDdzU1oranFpTGF6WmhpYnNFR0R5LzR0V1pQUkFI?=
 =?utf-8?B?Z2FMOVJQYXpwallGMVlMdnR6aXFoa0RTV3l2cnBqOFIwMUE0N0s1TjIyQ3NT?=
 =?utf-8?B?UTdNeGc2NjBzayt0cmhrR1BvNEYzTGtPd3RTQ1I1NmMxK0ZLL2k2eElsb3V1?=
 =?utf-8?B?TWM3MmdxVE1aVTI2c0ovaWN0RXJnbDRCa005a2sxd3h6RVlnR1NIWnUrR0Fl?=
 =?utf-8?B?a1N5eU01SC9vQXVoSlk1bnZ1L1Z3VHNmcUJiVHFTdk5DemVNWHdsQkt6U2cw?=
 =?utf-8?B?UHhkZGRuNmxTLzNuamJJcWw0dTBnOHY1eTJ6cy9na1JaUkp5KzJKYlN6QUFS?=
 =?utf-8?B?Nkc1MGE2K2FzM2lQVFRVQXIweVlOdXhOUVFkaG9LUzNqbFZmQ0VNWmpKRmZj?=
 =?utf-8?Q?m27MlshgeK82QgfBv2ahB3Wra?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72E89930A4B70E4483A6AF3D9FC8B2B5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad844b-b78e-44e4-c70a-08ddd10abb00
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 14:50:17.3173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FapRrNQQD8bP4DN6XWDkLNd/95Ctm9BG0TCm/lUrJPkHkGf9WO0y9nozbQ5QS0cQpeFSXjmQ/aJzTCZ21Bh8rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

RG9lcyBtZWFuIHRoYXQgdGhlIFRPRE8gaGFzIGJlZW4gZG9uZSwgb3IgdGhhdCBzb21lb25lIGNv
bXBsZXRlbHkgZm9yZ290IGFuZCBub3cgeW91ciBwYXRjaCBpcw0KcmVtb3ZlIGFsbCByZW1pbmRl
cnM/DQoNCklmIGl0J3MgdGhlIGZvcm1hdCwgbWF5YmUgYWRkIGEgZml4ZXM6IHRhZyBmb3IgdGhl
IGNvbW1pdCB0aGF0IHJlc29sdmVkIHRoZSBUT0RPPw0KDQpPbiBGcmksIDIwMjUtMDgtMDEgYXQg
MDk6NDUgKzAyMDAsIFBoaWxpcHAgU3Rhbm5lciB3cm90ZToNCj4gc3RydWN0IG5vdXZlYXVfY2hh
bm5lbCBjb250YWlucyB0aGUgbWVtYmVyICdhY2NlbF9kb25lJyBhbmQgYSBmb3Jnb3R0ZW4NCj4g
VE9ETyB3aGljaCBoaW50cyBhdCB0aGF0IG1lY2hhbmlzbSBiZWluZyByZW1vdmVkIGluIHRoZSAi
bmVhciBmdXR1cmUiLg0KPiBTaW5jZSB0aGF0IHZhcmlhYmxlIGlzIHJlYWQgbm93aGVyZSBhbnlt
b3JlLCB0aGlzICJuZWFyIGZ1dHVyZSIgaXMgbm93Lg0KPiANCj4gUmVtb3ZlIHRoZSB2YXJpYWJs
ZSBhbmQgdGhlIFRPRE8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBo
YXN0YUBrZXJuZWwub3JnPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2NoYW4uaCB8IDIgLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rt
YS5owqAgfCAxIC0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jaGFuLmggYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2NoYW4uaA0KPiBpbmRleCA1NjE4Nzc3MjVhYWMu
LmJiMzRiMGE2MDgyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9jaGFuLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jaGFu
LmgNCj4gQEAgLTMxLDggKzMxLDYgQEAgc3RydWN0IG5vdXZlYXVfY2hhbm5lbCB7DQo+IMKgCQl1
NjQgYWRkcjsNCj4gwqAJfSBwdXNoOw0KPiDCoA0KPiAtCS8qIFRPRE86IHRoaXMgd2lsbCBiZSBy
ZXdvcmtlZCBpbiB0aGUgbmVhciBmdXR1cmUgKi8NCj4gLQlib29sIGFjY2VsX2RvbmU7DQo+IMKg
CXZvaWQgKmZlbmNlOw0KPiDCoAlzdHJ1Y3Qgew0KPiDCoAkJaW50IG1heDsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmggYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtYS5oDQo+IGluZGV4IDBlMjdiNzZkMWUxYy4uYzI1ZWY5YTU0
YjlmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtYS5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmgNCj4gQEAgLTkw
LDcgKzkwLDYgQEAgRklSRV9SSU5HKHN0cnVjdCBub3V2ZWF1X2NoYW5uZWwgKmNoYW4pDQo+IMKg
ew0KPiDCoAlpZiAoY2hhbi0+ZG1hLmN1ciA9PSBjaGFuLT5kbWEucHV0KQ0KPiDCoAkJcmV0dXJu
Ow0KPiAtCWNoYW4tPmFjY2VsX2RvbmUgPSB0cnVlOw0KPiDCoA0KPiDCoAlXUklURV9QVVQoY2hh
bi0+ZG1hLmN1cik7DQo+IMKgDQo=
