Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE6BC0165
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 05:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F2910E0CE;
	Tue,  7 Oct 2025 03:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QB7G6PFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8610E0CE;
 Tue,  7 Oct 2025 03:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXZE0EWVINlglwjrHM+E94h+i6jB4vEG+DfN8HK6/EAcfE9hcPbst1b0nSkAoSDwMdFOG8XHC8qrQmw2rQeKU/o53cFyq14yhFURhqtqG7v0SuQra0RC6OtG+vLvoKrbFWhSmCCF5GnX0D1CvZbxWX75FDuAzKrydVQJd/DylgHG9DhjDh5s8HR5/oqrg2eVl4UGwfyK3J79PZlifwJeVytSLmFzvdG4kvJUY+A5di0K5u54U4xyghRDfNXrGDj81GPa/9YrAA+JCjzMJLw+qtMYYm6YcTFqKqEx19W+0YMK9+XOTkPBam3/4tWyIaqRtv4lo4nlmcpFiJP+p6G2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km2AC6IP4qf1SPaIE7LmUlSVCg8OerMRYigNjFM9SNg=;
 b=GGyvtjoNjofZBQCshooH4CnI0WYjx96N7abN7rOgRqRNtwP61XuVVfAo1yiZN0vO9a4shjTsUsU60oa7pbmLE4IU7c68hnAgEnDUvz863wAA3HS7657Szs1sM7/gMvHw9KySY0B1TpProPVxYG44sUxAb5FxDCn4tNj0acTxjStJVH1Dig9Ez2uQb/3GLqeCkcC743eeg4BZqGF9/f0mNbKPYGiX7wSOFHcRwWx1U5KnK1sGuvrDKDCgCCY8MvTKatpdBA2wLgTSNeW/90PpDMv6cbBICceXfyLmlEpF8Q6MLDeTmCcNBE/7RIV8QywJFzYrIA4wuOSs/Tm4m4rz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=km2AC6IP4qf1SPaIE7LmUlSVCg8OerMRYigNjFM9SNg=;
 b=QB7G6PFFe6aAu77mS75KMcpitDdD3+MAtwthEhr7vd0MEP+3wWIsaWKVYZsE1HBeLFQrBY2mK56a0PxjPM70jUtK0kmhnksbKYovJfgw+QXlQ+CD5IO6Cs4iJ8/BTjy/zkjqon7PKf9FvjXdvJTxb/Wb06jMfpeyCY3Z9EnBKNKZEg23ZSwVor7LM13DZj2P1eDceQvyCxHFlkC7QwS676ueoLUHAQ2g55bYsCp03HKIeqLnGLrN/TC3t7KzK24cllwscgQrHrLHNqMJYNv7WizEeMnNFroHY80EH5J3DOrm5CEU32WbHVb82CJEpe6qufLFZeUXLhripHBh3RSXIQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 03:29:25 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 03:29:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Topic: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Index: AQHcNysd9qNU+e6b00yF0jiV6WT0IrS2BtKA
Date: Tue, 7 Oct 2025 03:29:25 +0000
Message-ID: <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
References: <20251007013207.1469618-1-airlied@gmail.com>
In-Reply-To: <20251007013207.1469618-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH3PR12MB7570:EE_
x-ms-office365-filtering-correlation-id: 67366343-591c-4805-59c7-08de0551b719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QmlXdzVRWG1PWGM3YWdkRnJwUFRqVjlDSVV3cE9vYjlGQjV2L3BxZS8rMGNs?=
 =?utf-8?B?RVNQN09PYVVIa3VYV1BaM2VHaDVIME1rQzVOYWgwMnNaQ05jOC9IclBYNkl6?=
 =?utf-8?B?STdTcDllWUNKZkUremk3YzN5cU9BOVhnTDRWSTQ0MG0yN2JMclU2U2tmVEhJ?=
 =?utf-8?B?THRDdlN5aCs2RmVEeEJubStNdDQzaWR6aFovWTdpcGFhOTlZUTB3YXlsaHNl?=
 =?utf-8?B?ejcwV3MrSDI3NXdEM0htTkVRWkVuQy9zaGF3OTBtR3JWSDI1R01aQ3huMU9i?=
 =?utf-8?B?eGNRaHVEcXd1dkVlNDNzRmdPT3FwTG52dzNBSUpxeW92d0lBRzdlazJBK2NW?=
 =?utf-8?B?VDdOcmNZUWFSQk44VmJJb0J0RjYrRGtjSTM0blNqdFlmakxnTkk2NjZncW5U?=
 =?utf-8?B?Y1pnZ1Y1aHViOWFqeU1tc20rb1E0eXBYMFZyQzYrN2RFVzFrc1lYRDczNGJt?=
 =?utf-8?B?VW9OcUQvS0p0VSs4VTBEKzBYUlprN0JNR21uZzRqN1ZiQi95QWJ4aWRmcVB6?=
 =?utf-8?B?S212UEFxcS9jVG5NaFpIRXNxN09jVTJxR0VDSndVUUU2emJER3FrNU9iMTlk?=
 =?utf-8?B?cGhLbDdoWDM4am94aFpoczJ5SXJhbkJJaTF4L2hRMVhUQzYxdUxJNk5zQVhm?=
 =?utf-8?B?cGwrc2YzWGx3N0lSRUVjdkJWdklHYlhOY1F2eFVwZFFXZ1VRZGdLdzNWUUNE?=
 =?utf-8?B?MElEY3htNUsrMDk2M0JsMzFYMlM0M080NXExQkk0QnRJeXd1bmhoRmZDWTBw?=
 =?utf-8?B?VjdOSm1NOC9Hd05ScW54KzdxYUk4QXJCZ2tZWFBVQ1dySnlURk5lNUpqRElh?=
 =?utf-8?B?c0VoOEk3M3NuUWZoTDJobUd6L2tmcnF1Y05YczBXM2hieTA4akhTYU5xRm5q?=
 =?utf-8?B?MEE5U0FUNHFWYmx2QlhyL1lxZEN6NFdXMUVoS2E2YWh1RjdhT2lPTFN2R1Z0?=
 =?utf-8?B?anZMQVRqT3VtL1ZOaVgrL3E3NWh6VVU4THgrWDJxNWMvK0VXMzQyQThCajdX?=
 =?utf-8?B?ck9FQmxJeXZVTFErT01seTFoNkhVWlRkQXB4bWk5Y1FRa29VYTBYWVBKTlBt?=
 =?utf-8?B?M3RrYVJIaVYycWE2ZXBUdkJIQnpjWloxTUtSejl1NFUvbUlTNmhrNENTYnBG?=
 =?utf-8?B?ZUdaVmg3ZTIzVG9DOStQdVF0YWVkOEZlRFp0R3dwL2FjNHZiZW5zQk9QTm91?=
 =?utf-8?B?dFQvblg5M01oRWV0aW5wNDZFOGxlVloycWlSQkVYaUM4S2RvdXBtM3Nkbzl4?=
 =?utf-8?B?RTU1L004QWd2ZkY2T1lmME04d2JpQkxVQjFLQTQxSVQySWxpZlVsZmRhbTBi?=
 =?utf-8?B?ejA5QmMwQjhZdEtJeG1JelE1Y3oyNVJQMmI0NGNYTXYyVEU4VjlFZ2JTQ1dS?=
 =?utf-8?B?LzRzSU1vTGJnNFJmVWFBSTg2blBMQ1M5U0FxUUtWL1BQaE1TRnZVczg5MFRz?=
 =?utf-8?B?aUhpS3dQTXQraE1XTXQ0d25UWHI1aXRHbE1aTS9EaTd6aGFhT1ZxUTJuWXZr?=
 =?utf-8?B?MlA0Z3JKSUMySVJxcmlxUDZlTXdidmt6L3E1aVlSeHVyQkNSYm5xdWNoaUhX?=
 =?utf-8?B?ZGNPSWJpRDRLeS9JMWFBVlpUSzVkTkdwNlJqSE8yRjJrRzVEelJ4RFB2Ym56?=
 =?utf-8?B?VDJmUElJZGgvbkMydGlNVjBSNEk2ZFBVMXdiVm9HemQ2TTU1bkZWMVNEOE1q?=
 =?utf-8?B?ZEx0Q1p0Z2NtNkkrM1Q4ejh5ZVh5dUhySDdoQ3l0Tm5SQmR3bmxqWldrWnVi?=
 =?utf-8?B?RWUycFVYdXg4YVhXdFBkdjdtZlN1WU5zUCt5NkhrcTN2MU1QQ1g0Sk80QjZV?=
 =?utf-8?B?anZKVGFtSjdkYUZvMmxCOGNFblVhWkRiYWM4NTRyUjlaTk4vQWUwRHZIRWdy?=
 =?utf-8?B?YTN6d0ZzZ0RvWlVkUWs5YUhjcGF6bGEwNnlvT2V2dWpzR294T2JsTWNkdlJm?=
 =?utf-8?B?MHN0VjZSWG55MFBnclh3TEwzVnhRY0poUTZZTnJ6azN5VDNQVWxtZFcySE9L?=
 =?utf-8?B?NTFKNUYxc3NKcmJ5VXMzSmlJZ1d4TmUyMzlCOUNOeFFmNEtwelhEai81UXY5?=
 =?utf-8?Q?jpFmjY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUJQSENDZWtJaW9ualVkamtyUXkyUHJvTnpzZ21UWm5abjV1L3FFcGtEM1Q4?=
 =?utf-8?B?TFhmaXFlT3didFptSmVuZmVmRHZ6Vmp1RFRucERNdnhialRWZHloNjBJVkM5?=
 =?utf-8?B?SlRJQmJ0MGVybWdFOENMN29xYnMwKzZ1dUxOa1l2RThERHRzWUpuT0IyTzBY?=
 =?utf-8?B?VkoxSyt6eFIyQjE5Lzd6UGdTNHJsblplYkNHTnM3T01reUc2dE4xaXhUa1BD?=
 =?utf-8?B?SHJYeVIxQkt2WTVoK0NTY1poY2lCMlRxUnFkR0I2RnJEa0NOMk9nK3RJWFZm?=
 =?utf-8?B?bHpGMStqUU5pSGx5RWxiWUZGL3dHd0hnR0pnSEdPZ2JFcEk0QjhpbWF2OVVi?=
 =?utf-8?B?Y20zVkEzdXpsYXFEbTJqeVpoQWkzaUltbzhUc2QzbzA3TDFxeHRVem1vR0Z6?=
 =?utf-8?B?WFJidUsvcTVvbGNwaFIzbEoxRE4xTFpSK2w3eFp4TW01Z3BZditQVkpaMmpL?=
 =?utf-8?B?dm1vTk1uaHFJVnlZblFuTEd0QUFoaWttZ0xraGVUdzRldXhTdlpPb1FWT0VB?=
 =?utf-8?B?TVN4OE55Zk1KYWZySjVsendGbWJ2YkkyOVU4UHJmL3Y3TFlOUFpqWGdoa0NB?=
 =?utf-8?B?bWVMZFlkRURaTmlvMTdId1I3QlJYeGJaMXp3N3FVc0VlaUpoanRFNjdBZDlY?=
 =?utf-8?B?bVpockVSVlEvOFFnU1Y0aTdpUXFtSzMrVFBIbEJMREpscTc0TjRMS081MmNx?=
 =?utf-8?B?bk1ZZjAwdVFnTVFkcEpsVXhucmZ3OHRIdnNrYlVUQm1NeXZOcmIwTHhqNExK?=
 =?utf-8?B?NGVvR25mUmgwUnUwaG1QS1RSd01BQWxBTUJJV3Y4YVRwRVFxcUFGM0Z1N0JT?=
 =?utf-8?B?L01GOGpVaHZxc1F6QVFOUTViWktjbmlLdlNqM1RHUUJEV2dZNWJwWkNzZFNp?=
 =?utf-8?B?bkVjNlo5amVFeThLM1RxR0lZa2doNyt3UzF0RmRPUjBQQjBHSGw2eWpoWlJT?=
 =?utf-8?B?VDd0akxYd3BCd3h4VUdrZlVIVzFHZmVKUUN6UzdWOHp6R3FWTGV2cTJhME54?=
 =?utf-8?B?Q2ljTlAreHlLREl6MlJLMHFOUFB3S2RCUUtITTkxczhMRE8rRWw2WVloSFBr?=
 =?utf-8?B?THhYMFlpL3gyR2h5aFc1RkZVYkNBL2FSRDVZZkVqbkRlUWlMUU1PUmttZjY5?=
 =?utf-8?B?UmZ6N000NzdNREJGWmVtT2VMUXFlNmlweGpoVDFoUitMRTNWWlpoeDAreEox?=
 =?utf-8?B?a3piMEpEb0d5d3JCZ1g0Y1hoV2RrZHF4RzdKTWNCR09manFpZlRhY1dTMmt1?=
 =?utf-8?B?TkdRa3BVaDVDUW5hWWo3WFpzWEZuRTFJQnV0MkhVSlMvWjNlTDVNM1BCOC9y?=
 =?utf-8?B?R3FmTVloS3NYb21JOEhKY0pvaG0xL3VIRHlkeGpNbVR1R092TVUyYXg5alBm?=
 =?utf-8?B?UlVteWZwa0s1Um5SOUlwc0c5K3NUMEo3MU91cWVFWlN4UE5KUGJIUll0aVNJ?=
 =?utf-8?B?L3dBT1dZQk5Yd1RqMWZYaXRVRXh0TEFScE1qbEEzRXVoNzM3NDJQM2RWcXR6?=
 =?utf-8?B?T2lLQVFnUi9QS294Zy9INnNIaWNqcnl4ZnhZZi9UaS9KODFuNm81WUY2S0wr?=
 =?utf-8?B?azYwT2xZR1o2RmVpT3NEOER1d2NwZDlDVlE0c0dkbVdhaXYxaFkrbmdXZERC?=
 =?utf-8?B?dGs1dlVTdkxpRkE3bS9ZeWE0UU0xZmpId2xkU1hMaUJwdStPc0xxS2ZyeWI2?=
 =?utf-8?B?bFBiTUQzak9pdmU5aFBXRUJWR0hQQUlpaDl5TUhUZEVMbUYyN0F0M2VZaWd5?=
 =?utf-8?B?RzZEUmlNd3E1OXl2ZXphSGs4VlJwQUJscmdld2RETzRjYmhhd1pOYmRoQjVT?=
 =?utf-8?B?b2FYYzhHajRWZlg3WXJKOUJKeU9BczhrQk9ncUo4alF3TEpmL3J0TFNVRFdL?=
 =?utf-8?B?QmJjbDVZRFpQbmx6cHF2SHdQenBIZENXSWtiWlhoMit3N0o3WjJ0MlN5eXI1?=
 =?utf-8?B?TmJyNjVwNUhUcTBjQ29qc291UkNYRFZDcVVQTkpxV2pBVkMyMFVITHgvNVJF?=
 =?utf-8?B?ZGdqNzQwRmpoTHh3SHQ4L2VsaDNQYnAxbS9pd0dRQ0JvT3FRandhU0lQUXhp?=
 =?utf-8?B?K0RESlJMU25EUmRNdDdwQWplSW1kMWxLcTZTUlg2RCt2dzVDL09FZGZucmpS?=
 =?utf-8?Q?Fnbxaa6NGoDNBx/vqPwvs8fPD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0754396C0B856F45AECFC44A94AC94FB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67366343-591c-4805-59c7-08de0551b719
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 03:29:25.5377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsKQlY9UMP2EvkO8bPd2M97ccbGEZQW/KINO3N6BK0HvF6ncMI8u1snJsnXriDgTz4TMqHUUHalrHHoK5z9uvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
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

T24gVHVlLCAyMDI1LTEwLTA3IGF0IDExOjMyICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
K2NvbmZpZyBEUk1fTk9VVkVBVV81NzBfT05MWQ0KPiArCWJvb2wgIk9ubHkgc3VwcG9ydCA1NzAg
ZmlybXdhcmUsIGRvbid0IGFkZCA1MzUgdG8gdGhlIGluaXRyZC4iDQo+ICsJZGVwZW5kcyBvbiBE
Uk1fTk9VVkVBVQ0KPiArCWRlZmF1bHQgbg0KPiArCWhlbHANCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCBOb3V2ZWF1IGNhbiBzdXBwb3J0IDUzNSBhbmQgNTcwIGZpcm13YXJlcywgYnV0IHRoYXQgbWVh
bnMgYm90aA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgIHdpbGwgZW5kIHVwIGluIGluaXRyYW1mcywg
YmxvYXRpbmcgaXQuIElmIHlvdSBjYW4gZ3VhcmFudGVlIHlvdQ0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgIGhhdmUgdGhlIDU3MCBpbiB5b3VyIGRpc3RybyBvciBpbnN0YWxsLCBlbmFibGUgdGhpcyBv
cHRpb24uDQo+ICsNCg0KSSBkb24ndCBsaWtlIHRoZSBpZGVhIG9mIHVzaW5nIHRoZSBzcGVjaWZp
YyB2ZXJzaW9uIG51bWJlciBpbiB0aGUgS2NvbmZpZy4NCg0KQ2FuIHdlIHJlbmFtZSB0aGlzIHRv
ICJEUk1fTk9VVkVBVV9MQVRFU1RfRldfT05MWSIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCwgYW5k
IE5vdXZlYXUNCmF1dG9tYXRpY2FsbHkgb25seSBzdXBwb3J0cyB3aGF0ZXZlciB0aGUgbGF0ZXN0
IHZlcnNpb24gaXM/ICBJIGtub3cgd2UgcHJvYmFibHkgd29uJ3QgYWRkDQpzdXBwb3J0IGZvciBh
bnl0aGluZyBhZnRlciA1NzAsIGJ1dCB3ZSBtaWdodC4NCg==
