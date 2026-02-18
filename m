Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MhVAFtSlml/dwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:59:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ACA15B0D7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54A110E308;
	Wed, 18 Feb 2026 23:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="le0EUSXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C3B10E308;
 Wed, 18 Feb 2026 23:59:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjAAguqasIiYf9QIXlEZZHE+fkgpKfRnMDZsq8W+nMmJDF562YWiijbxbT8MO8z6PCKkA6N4eArWhq03GHbNgUFPHkxWzFazaz+MZIjd/loLb4THKq9mIP3WtHqrb2YFPzAzUEHPZxBw5YtainxsgzftpSwmX+EM39pfx4uQrRAfddyptFAYi3LvtWVUfSrbpVtqhKx0LbSOOe+lGrZtQoyk8ULNX4f7DlANw/sDjvROw8L2EtBFzoHpHaW0JQq8WMrp6mpw2Wz82vVoQvBpAVj5ALU9XSaJozizXUI2E7+EAY9uA6RATZJljmTEoESDK2kl0PysHH/MVbSCE+Ieiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvNDh8grcBOPxoBGnDLOwvhul4Oo8qJsBHxrl3X4fZc=;
 b=cyhflIo1aqJFyGcnKXlN9O82kOhvf1MezwSX62qnLubAiInKHl+m8ErR3jOiNlyHM3ip9KiPagr8gc2iIDGH5vBkOF/bIAvBMHIvQ1mqGv1muIJDDzd752dvtaaTYC9AWr3dY6n5/2jyhPEXnkWogHkLZCHLBXxbHV/oOmVOe0pULZ2YQ8auWrrmT25NmtRGP13jR1v583Yn7dtOuG1JGYE27xho4Vh2aLlF7OjqqxoysaaSyCl3pRae5V88JsNjvtyJpXda5SDVXxa+W4QHU8K4dp7o8PKfXlLhv58SPWAumYZnWuvbMs+YCgwpCtdtpVaMvQL1UTY8a/ONKdNIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvNDh8grcBOPxoBGnDLOwvhul4Oo8qJsBHxrl3X4fZc=;
 b=le0EUSXMK/H5j7rpYp1lSiXc+bCe6dDC79zZXFEUJhmlEzUBDps+TAC3uqjSReLlAxKqYRRlQRscdacX35saMWKemWb+v0RQex1GdosCpTRs196U7q7PTl4zoJ3rKyY+JiUjbUZYjxWeXj/XLVXLA8tVssHSHbMlz+r2HFilIAE6B8qvZBI6Z3jc8YEmkp72u8VmB1RJNakQ2SLKtsNFF5LHAxXhEv0aCmp8y4hi5o7pl8c3559bwrCrqFPXoPwZU1KrjSyXBib/HL39RH5otbxSekcR2cI8o1zxarsijHKccENAy/DRkqjnQIg83q3iDnIdoPhAMlLNHh82R5E+SA==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW6PR12MB7087.namprd12.prod.outlook.com (2603:10b6:303:238::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 23:59:15 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 23:59:15 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Nikola
 Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
Thread-Topic: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
Thread-Index: AQHcoRjn/MIJmBkC0EOeA5ZR8ffdZ7WJCF6AgAAU6ICAAAW0KQ==
Date: Wed, 18 Feb 2026 23:59:15 +0000
Message-ID: <99B1F80B-50E5-41D2-BACF-D48C931CF83E@nvidia.com>
References: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
 <3CB77723-96B9-45DC-844E-8674361560E6@nvidia.com>
In-Reply-To: <3CB77723-96B9-45DC-844E-8674361560E6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|MW6PR12MB7087:EE_
x-ms-office365-filtering-correlation-id: 299649d8-6031-49ab-5823-08de6f49b8bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WTU3emNISGR3ZUl2enowdDNJeVJycmlBSnVNRGg4cVRaVTI2RXRHU21KcW5a?=
 =?utf-8?B?eDI5dHlPSHF5WFhISFF2VFp3TkRNUHM1K2hVdGNpVW44SGVMd2V5NWxpVmJq?=
 =?utf-8?B?bTlDV1pxVW9uZ0x6NXM3d24xUjRFQjBSS2xuRkdrbjVXYW9EMjhqMEV3STdZ?=
 =?utf-8?B?aDBYdzdzVENSWnM3bTVGSmlNVHdxdjVPc2l1OWhJV1Y4T1g4YWlzaDNwM1Nq?=
 =?utf-8?B?YXM0b2RtZlh3VXo1eVZuckt6NXY4T3Zjd0VCSEN3WTVaZjgxVWtTZzFwYmdM?=
 =?utf-8?B?ZWxTYU5SUXA1RUJSRmdmT1QwWHUwazRZSkNOajQwYWY3bVVEalh0Qk8zaVZ6?=
 =?utf-8?B?bmhudFZNSVVRaDc1eUxTazMyOU9BTkY2aEtlOHltNGtiNUhGdDRYS2EwYStL?=
 =?utf-8?B?OHZXSlc4dTdmcy82OU9xMnQwTUc3aFFjeE9peWdUbmh5dk5RS0RCOGNCbDha?=
 =?utf-8?B?ckNMd21GOEh2U0U5OG5pb0hOVVV4NFhBYzZnaHBPdER0TFc0VXMydkd6QTVM?=
 =?utf-8?B?N1ExV0RYOTVXZSt4bXI5eGNia3JhakVuOGpRTXBJVmZMSEkwTHRjTlZKcFRx?=
 =?utf-8?B?bzU3TVFkSjZyS2JnOUllSWxDRldyV1lSc2dyRkFNMVp2ZENLVmNER2VaWHY5?=
 =?utf-8?B?Y0kxQS9wK3JiL3FJT1pQQ2J5RmF4ekRKVElKUVVxWTFMd3Uxb2VMYzQ5azdr?=
 =?utf-8?B?YnF1YXZ2d2NSb2tLY1JvTWIwT1BHU2d6d1o1R0hTenhnTWQxb1lIdE1vVnN0?=
 =?utf-8?B?ejZnTjZtQUF4alhUNVZ4bDlSM0pSZnFIOGcwU3VMSytCYnE4NUd0SDRKRDFa?=
 =?utf-8?B?NDMvU0Rhc1gwcldjdGRwR3hQTUN5N2d2dzcxazhHbWNKdnIxR0tGMENjQllD?=
 =?utf-8?B?bENERnQwVDh2bmt6TnhzM1NWYXlJZkFOK3htWG9oNUZjbjdwYVkzbFNMM1Bv?=
 =?utf-8?B?NW4xS3dDSGlvSnQ2aVJEYjdIL05OQTNiWnlNWmlXM1ArTEFLYXpMMnNsM3J6?=
 =?utf-8?B?KzRqOE1MQ0g1U3JaOVVuYlNYRFNIbnN6NC9PSWRveHNTcXVIdHFmZ0daV0F1?=
 =?utf-8?B?VllCYi9EWmhXRDgrcFAxbUFNYitjMGtDWkJpeERudXc0dE1EWDlqZnFtQUlo?=
 =?utf-8?B?ZC9WUXJqaVZERmhzRW9qMlI1eC9wUzVGcCtqamYvN3hkQmdLeDV1bUxudHQv?=
 =?utf-8?B?WjF2UnEyc3d4MW8wdzJDMk96NVhOUVhrdldUVzhXZkVUVGdUWUs3M2VLUVJ0?=
 =?utf-8?B?bFJna3BBdGtxQ01SdmtmdDQ5NlI0ZmFiRFVLSDJuWlRkWFFTU2ZGOUg4cGEr?=
 =?utf-8?B?UlBQc3ZxK01kVjk2V1MydHViMlkyNVFDcnVaSFN1L0JlTVFBTExseUE2Zm5F?=
 =?utf-8?B?UDNuYjkza2s2cmVRT0R3VXNRSmJiNkd2Z1UrVDc3NVhEbmVvZ3hVV0MxMmUw?=
 =?utf-8?B?V3M2NStuenBkMERtRlA4V29OMjV3Z3RKMWVTUG5wRTNnZ0VyVkswTWkvcjJP?=
 =?utf-8?B?U3RzQjZtandBVXJkRUdESGprVi9vbm93WTh4aTRCN0RGZGJrZFUybFlVTUNY?=
 =?utf-8?B?S1owS1BpRWgyZmVmMTYvVTArQW5IdVlWQ2czZ1BtNTV0M3dLc1Q0UzJHTFVT?=
 =?utf-8?B?Yyt1VnJGdUM4ZnROcHp2b1hIZzl0bDZMK1hZUm43TFJUbDE5OTZkV0hXWE9Y?=
 =?utf-8?B?VlptZk9tclZyQVdESXlEMHNJRitRbm1xMkxFRERaekQ3Z29FSEprak40eUpR?=
 =?utf-8?B?dURwWDdraUJ1TDkrTkxxRW5JNFJKV3RoYi9LR2R2RTFwN1psNEFBc2s4cWhM?=
 =?utf-8?B?RWtEc0VJYjBGS2d0UDNGYjgxdTk5ZmtNSnpZWTNEbmVlTUJjbElTTXVYOFg5?=
 =?utf-8?B?b3NEdEJxMGd4cmY4Skllc3AwRjY2VmlMOVl5UEhqT2RnZnBzc09DOFNsWTNQ?=
 =?utf-8?B?d2ZsZnpZRkhjdmxnUDVNRkh2UnQxa1RrWWlpTDBYVG13TjJEY1JRRG5EMmF6?=
 =?utf-8?B?Uml3ZGs5OHVNa0kwTDdqSUhLR05GVTNkRzhUNmV3YzVwTm02K013YlpzMHZO?=
 =?utf-8?B?QnVOWnMwM3R2YnZyOVoxcGpaLzhIMTZhdTlVeW9zUGhkd2c1RUU4ZEJYc0Zk?=
 =?utf-8?B?SS82aXV3WHQxWER2TmFQK210ZUhsdC9zNTRWWUlFUmFDbzVkVTNFQlJhU0tu?=
 =?utf-8?B?U2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFpLU1ArcTZRMHdYN2hCVllpVHU1bjNIUEhhTm5xM2dnRTh6SWJGd2FUbnZB?=
 =?utf-8?B?OVAvdXlmandBeTJVenIvRVc4cE9kZ1Buc1lDTFFRUDcvbGdKdzNUTHBYQklP?=
 =?utf-8?B?d0ZVM0xEWDN3ZDFIYlFOeG4yaFBUbVhjNWVaWnZubVBWOVdWL3lpdXdJYWhF?=
 =?utf-8?B?clE3YU94UmlZZDJkaVhRaU8zM3hiS1A5akJvKytoUHJXd1h4RWxuNmdjNVBr?=
 =?utf-8?B?L2FqbiszWklzcEs1SWc1VTJheG9wU1lBRWFPL1ZSdlB5eEdxVnNRTDk1cDh2?=
 =?utf-8?B?Qk5CNDFHZEtBQkNZcU01cE8zc0dvWkRJWXZRakJUM0FtaHdrWlRqTWFnMGJX?=
 =?utf-8?B?YU96UW4xMjFDU1J1bm5POEVmV1dRWERhSGh1NzZzV1J2OXBXZS9NM2NkK2Z4?=
 =?utf-8?B?TSt4cktvV2tBcVpDZHdsY3dJTTdiSUJvd3VURVIydjZRa0FQemV4cXN6WWdi?=
 =?utf-8?B?M2J3V3dZZnpVdlpRSjA5SEl4VStiTlZmZEp4N3p1dGppUi9uTnhLS21ENHRB?=
 =?utf-8?B?bkFJd1dCQ3l4ejdlNzhFL2RSK2ZKQ1NyVkNIR29rR0xsdkJQWngwMGxabXhU?=
 =?utf-8?B?WVF1WHV2c0EzSmpTNjRZektJSHkrUG9FdUppbHNjckdYdnVrbXFJWXZSa24r?=
 =?utf-8?B?SUo3VXowL3NQTWRhalJjVTJ0VHBBWktGTC9CakpWUmxZUTcyUHB4UXFwTTNT?=
 =?utf-8?B?OU5oeVA3UlFnZGJyamd1RWNBbitTUjdiM2JUcjZXZHBEcks5SEpIZCt4dTF2?=
 =?utf-8?B?M2E4ZFdFNEhqZWJpUS9YREtOZ0hBUFEraUZlWnlFbldwdHNBdnI1aTI5Q1VS?=
 =?utf-8?B?SllhTU5MWjJkSHJhL0xMNzgvY0tLUHZVMFRmQVRVWTlDL3ROc2dWeUswNVcw?=
 =?utf-8?B?U2hLdGNCQVV2Z3VTQ3BWQWx6djl2SmpnM0ppZDNVQmI2dmMvYzJLSjVnVXRh?=
 =?utf-8?B?M0lnZFppeXE2aS93d3YxZ0h2VC92alljUnZxT3UxVmNvV210MHcwTTVhQ09u?=
 =?utf-8?B?SzNZcURLTjc2L1dMbWZPZ3U3bFFxZXJQTEhDRTdTeEQ1V2JRVVRubDlPUFRJ?=
 =?utf-8?B?bEJmU0VJZkduRFl1bkdrZkJ0REp5SGJKQTNhcTZJSUl0anh1VjMrUVZEZTJJ?=
 =?utf-8?B?bmhTTW1JQ2duOUtFMnlvN3l4L2x3ekdOZGRnOUxVeit2MldFcUErZ25jdytv?=
 =?utf-8?B?VWZkcmQ3T1JpSGxSN3lTSXRXUVpydW9EdktaQWRhaGJtbVhrUURkL21vSFU4?=
 =?utf-8?B?clFkdVlkNmFJN3RFWFhnMEtXRVNZWi92SkFOUkZ0U0JseWJjTGRWeG8rMjZL?=
 =?utf-8?B?SDV0UXBISVp5aFV5UHViK0IxZFV3Uk9JZFZCcXNNZE1teFNKSUMzeDc0Rk5Z?=
 =?utf-8?B?dHhqb2Uza0x1UW5vdm1YS1JNS0VzeExiTDF5Yk1lamtGNkhBTENLeElFdHB2?=
 =?utf-8?B?MXlOLzh2VkNhdEhoK2ZnSkFpNXJNRVZGWlEycjhhaFpFMUg4UzFzU0dzQUlI?=
 =?utf-8?B?VHB5eURsaEd0WG1kaUdkb1VsdVg1SGdESXhNcXE0WENUb1lYTDBzcEYreFlZ?=
 =?utf-8?B?dmN4ZnBVSVVDMUtHdVF0b1JmdnJabEE4NlVhUjErYnNhSnByajlUWTR4UDJw?=
 =?utf-8?B?WitiNG44Q0VQWWlBdGZIN3UvSEtUR0M4cFhkVEh5aTlZQTQ5cUdTYlNUR2pE?=
 =?utf-8?B?Nlo5cHBadjBLQlMyaXZqWEhEdjJmWmM4L3BsdjI3OTR2RjJLT211a25mM2Vt?=
 =?utf-8?B?Z1hZaXE4dWIxWHNROTVKUU9mU1dMa2tpTkhnMlZNZUFMQ2dLNTM3VEpTQ0VO?=
 =?utf-8?B?ZVo3M0VtSXNVWmxsb3AyNXRHTFVkYmVxcFBpckUzT2hPdGhMSS94K1FBQ2Nz?=
 =?utf-8?B?ZE41OWJzVk5TQll2WFFpT2dSeUJ0dENXWVI2OUlUY0VyeSt4SVRvRVVmYisv?=
 =?utf-8?B?NDRsRmtzUE9HTE11OFoyQkNNb21OLzNXWmdaeWxPUHJQTG5TNXJ4KzVGNmNV?=
 =?utf-8?B?NEJMa2UzNzNSeEVxREppWWJJbUFIK0hBM1RaVmZqSGZGWkdONWVMNHkwTzdC?=
 =?utf-8?B?RlowUFR3MjhhZGNGMld6ZjN1SVJQTEN6OHRhcHJXa2IzV3FyTmxOM3pVWTNx?=
 =?utf-8?B?RUpMYnBZZ2RqSmhwdkFYUXJ6MWlSVzVnVk9XR3R2aTBMNUlDNzd0WmJ3T2dD?=
 =?utf-8?B?Q0tNTWNjMFFSRkM5NVFCMncwOFVHNEZOVStRSmErdkxITzF3THoxM1puNENo?=
 =?utf-8?B?dzh0TE5HbWxsN21sbjNkemhDREUxRElJMzN4NEpZOTUwc0pxSWlVMVh4em1h?=
 =?utf-8?B?K21VTEx6NHQ1Zm5PNnM2dXdVanM0MmtFZVlNRXYwZnNwYm1aMDBIQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299649d8-6031-49ab-5823-08de6f49b8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 23:59:15.5641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohbjW7l6f21hYnxufbya5AT+0RCyYkMU90vNso6ykVIbUf4buRM3qW0bI4zi6fcWDYISn16FUdPSLm6IqisKAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7087
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A4ACA15B0D7
X-Rspamd-Action: no action

DQoNCj4gT24gRmViIDE4LCAyMDI2LCBhdCA2OjQ24oCvUE0sIEpvZWwgRmVybmFuZGVzIDxqb2Vs
YWduZWxmQG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/SGksIERhbmlsbywNCj4gDQo+PiBP
biBGZWIgMTgsIDIwMjYsIGF0IDU6MjTigK9QTSwgRGFuaWxvIEtydW1tcmljaCA8ZGFrckBrZXJu
ZWwub3JnPiB3cm90ZToNCj4+IA0KPj4+IE9uIFdlZCBGZWIgMTgsIDIwMjYgYXQgOTo1NCBQTSBD
RVQsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4+IFRoZSBjbGlzdC9mZmkgcGF0Y2hlcyBhcmUg
cmVhZHksIHJldmlld2VkIGJ5IEdhcnkgYW5kIERhbmlsby4gTWlndWVsLCBjYW4geW91DQo+Pj4g
cHVsbCB0aG9zZSB2aWEgdGhlIHJ1c3QgdHJlZT8NCj4+IA0KPj4gSSByZXF1ZXN0ZWQgY2hhbmdl
cyBpbiB0aGUgbGFzdCB2ZXJzaW9uIGFuZCBoYXZlIHlldCB0byBnbyB0aHJvdWdoIHRoaXMgb25l
LiBJDQo+PiBhbHNvIHRoaW5rIHRoYXQgQWxleCBzdGlsbCBoYXMgc29tZSBjb21tZW50cyAoQ2Mn
ZCBoaW0pLg0KPiANCj4gU3VyZS4NCj4gDQo+PiANCj4+IFBsZWFzZSBub3RlIHRoYXQgaWYgdGhp
cyBnb2VzIHRocm91Z2ggdGhlIFJ1c3QgdHJlZSwgd2UgaGF2ZSB0byB3YWl0IGZvciB0aGUNCj4+
IGZ1bGwgdXBjb21pbmcgY3ljbGUgYmVmb3JlIHdlIGNhbiBsYW5kIHRoZSBHUFUgYnVkZHkgYWJz
dHJhY3Rpb25zLg0KPj4gDQo+PiBBbHRlcm5hdGl2ZWx5LCBpZiBpdCBnb2VzIHRocm91Z2ggdGhl
IFJ1c3QgdHJlZSwgTWlndWVsIGNhbiBwcm92aWRlIGEgc2lnbmVkIHRhZw0KPj4gZm9yIG1lIHRv
IG1lcmdlIG9yIHdlIGNhbiBzaW1wbHkgdGFrZSBpdCB0aHJvdWdoIHRoZSBkcm0tcnVzdCB0cmVl
IGluIHRoZSBmaXJzdA0KPj4gcGxhY2UsIGlmIE1pZ3VlbCBhZ3JlZXMgd2l0aCB0aGF0Lg0KPiAN
Cj4gT2suDQo+IA0KPj4gDQo+Pj4gVGhlIG5vbi1SdXN0IERSTSBidWRkeSByZWxhdGVkIHBhdGNo
ZXMgYXJlIGFscmVhZHkgYmVpbmcgcHVsbGVkIGludG8gdXBzdHJlYW0NCj4+IA0KPj4gVGhleSBh
cmUgaW4gZHJtLW1pc2MtbmV4dCwgSSB3aWxsIG1lcmdlIGludG8gZHJtLXJ1c3QtbmV4dCBvbmNl
IHRoZXkgaGl0DQo+PiBkcm0tbmV4dCBhbmQgLXJjMSBpcyBvdXQuDQo+IA0KPiBPay4NCj4gDQo+
PiANCj4+PiBJIHdpbGwgcG9zdCB0aGUgbm92YS1jb3JlIG1lbW9yeSBtYW5hZ2VtZW50IHBhdGNo
ZXMgYXMgYSBzZXBhcmF0ZSBmb2xsb3ctdXANCj4+PiBzZXJpZXMganVzdCBhZnRlciB0aGlzIG9u
ZS4NCj4+PiANCj4+PiBUaGUgZ2l0IHRyZWUgd2l0aCBhbGwgdGhlc2UgcGF0Y2hlcyBjYW4gYmUg
Zm91bmQgYXQ6DQo+Pj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2pmZXJuL2xpbnV4LmdpdCAodGFnOiBub3ZhL21tKQ0KPj4gDQo+PiBUaGlzIGlzIG5vdyAo
YXQgbGVhc3QpIHRoZSB0aGlyZCB0aW1lIEkgaGF2ZSB0byBhc2sgZm9yIGEgcGF0Y2ggY2hhbmdl
bG9nLg0KPj4gDQo+PiAgICJXaGVuIHNlbmRpbmcgYSBuZXh0IHZlcnNpb24sIGFkZCBhIHBhdGNo
IGNoYW5nZWxvZyB0byB0aGUgY292ZXIgbGV0dGVyDQo+PiAgIG9yIHRvIGluZGl2aWR1YWwgcGF0
Y2hlcyBleHBsYWluaW5nIGRpZmZlcmVuY2UgYWdhaW5zdCBwcmV2aW91cw0KPj4gICBzdWJtaXNz
aW9uIChzZWUgVGhlIGNhbm9uaWNhbCBwYXRjaCBmb3JtYXQpLiIgWzEsIDJdDQo+PiANCj4+IFBs
ZWFzZSwgYWRkIGEgcGF0Y2ggY2hhbmdlbG9nLg0KPiANCj4gQWgsIEkgdGhpbmsgSSBkaWQgbm90
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQgYmVjYXVzZSBvZiBteSBkaWZmZXJlbnQNCj4gaW50
ZXJwcmV0YXRpb24gb2YgdGhlIHdvcmRzIGNoYW5nZWxvZy4gSSBoYXZlIHVzZWQgdGhpcyB0ZXJt
IGludGVyY2hhbmdlYWJsZSBpbg0KPiB0aGUgcGFzdCB0byBzdW1tYXJpemUgd2hhdCBhIHNldCBv
ZiBwYXRjaGVzIGRvIGluIHRoZSBjb3ZlciBsZXR0ZXIsIG5vdCB3aGF0DQo+IGNoYW5nZWQgc2lu
Y2UgdGhlIGxhc3QgcmV2aXNpb24uDQo+IA0KPiBBbnl3YXkgaGVyZSBpcyBhIGNoYW5nZWxvZzoN
Cj4gDQo+IDEuIE1vdmluZyBvZiB0aGUgY2xpc3QgY29kZSB0byBydXN0IGZmaQ0KPiAyLiBTb21l
IGNvbW1lbnQgY2hhbmdlcyBpbiBjbGlzdCBhbmQgZ3B1IGJ1ZGR5IGJpbmRpbmdzDQo+IDMuIElu
Y2x1c2lvbiBvZiB0aGUgbW92ZW1lbnQgb2YgY29kZSBvbiBDIGRybSBidWRkeS4NCg0KQW5kIHRv
IGNsYXJpZnksIEnigJlsbCBnbyB0cnkgdG8gaW5jbHVkZSB0aGlzIG9uIGEgcGF0Y2ggYnkgcGF0
Y2ggYmFzaXMgaGVuY2UgZm9ydGggaW4gdGhlIGNvdmVyIGxldHRlciBhcyBzdWdnZXN0ZWQgYnkg
dGhlIGRvY3VtZW50YXRpb24uIE5vdCBqdXN0IHdoYXQgY2hhbmdlZCBzaW5jZSBsYXN0IHRpbWUg
c3VtbWFyeS4NCg0KLSBKb2VsDQoNCg==
